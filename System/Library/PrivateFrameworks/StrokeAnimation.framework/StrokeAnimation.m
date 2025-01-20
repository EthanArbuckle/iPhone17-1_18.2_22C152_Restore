uint64_t sub_237D5D2E8(CGPathRef path)
{
  uint64_t v1;
  void *v2;
  uint64_t MutableCopy;
  id v4;
  id v6;
  uint64_t vars8;

  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    v6 = v2;
    MutableCopy = sub_237D754E0();
    v4 = v6;
  }
  else
  {
    MutableCopy = (uint64_t)CGPathCreateMutableCopy(path);
    v4 = *(id *)(v1 + 32);
    *(void *)(v1 + 32) = MutableCopy;
  }
  return MEMORY[0x270F9A758](MutableCopy, v4);
}

void sub_237D5D36C(uint64_t *a1, uint64_t a2)
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689489E0);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2();
  uint64_t v41 = v17 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689489E8);
  MEMORY[0x270FA5388](v18 - 8);
  OUTLINED_FUNCTION_2();
  uint64_t v21 = v20 - v19;
  CGMutablePathRef Mutable = CGPathCreateMutable();
  uint64_t v23 = *a1;
  uint64_t v24 = *(void *)(v23 + 16);
  if (v24)
  {
    uint64_t v42 = v3;
    CGMutablePathRef v43 = Mutable;
    sub_237D5D860(v23, v21);
    if (__swift_getEnumTagSinglePayload(v21, 1, v2) == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v39 = v14;
      uint64_t v40 = a2;
      sub_237D5E2A4(v21, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      sub_237D754F0();
      sub_237D5D908(1, v23);
      uint64_t v28 = (v27 >> 1) - v26;
      if (v27 >> 1 == v26)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        if ((uint64_t)(v27 >> 1) <= v26)
        {
          __break(1u);
LABEL_26:
          sub_237D75490();
LABEL_23:
          sub_237D754A0();
          sub_237D75480();

          sub_237D5E2A4(v28, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
          *(void *)(v42 + 80) = v44;
          swift_bridgeObjectRelease();
          return;
        }
        uint64_t v29 = v25;
        uint64_t v30 = v26;
        uint64_t v31 = *(void *)(v8 + 72);
        swift_bridgeObjectRetain();
        uint64_t v32 = v29 + v30 * v31;
        do
        {
          sub_237D5E114(v32, (uint64_t)v4);
          sub_237D75500();
          sub_237D5E2A4((uint64_t)v4, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          v32 += v31;
          --v28;
        }
        while (v28);
      }
      swift_unknownObjectRelease();
      v33 = *(void **)(v42 + 40);
      *(void *)(v42 + 40) = v43;
      CGMutablePathRef v4 = v43;

      *(void *)(v42 + 48) = v24;
      *(unsigned char *)(v42 + 56) = 0;
      sub_237D5E178(v40, v13);
      if (__swift_getEnumTagSinglePayload(v13, 1, v39) == 1)
      {

        sub_237D5E1E0(v13);
        return;
      }
      uint64_t v28 = v41;
      sub_237D5E240(v13, v41);
      uint64_t v34 = *(void *)v41;
      if (*(void *)(*(void *)v41 + 16))
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
        uint64_t v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = xmmword_237D760B0;
        sub_237D5E2FC(0, (unint64_t *)&unk_268948E00);
        *(void *)(v35 + 32) = sub_237D75600();
        uint64_t v44 = v35;
        sub_237D75480();
        uint64_t v36 = *(void *)(v34 + 16);
        if (v36)
        {
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v36; ++i)
          {
            double v38 = *(double *)(v34 + 8 * i + 32);
            if (v38 > -1.0)
            {
              objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v38);
              MEMORY[0x237E2EF70]();
              if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_237D75490();
              }
              sub_237D754A0();
              sub_237D75480();
            }
          }
          swift_bridgeObjectRelease();
        }
        sub_237D75600();
        MEMORY[0x237E2EF70]();
        if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          goto LABEL_23;
        }
        goto LABEL_26;
      }
      sub_237D5E2A4(v41, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    }
  }
  else
  {
  }
}

uint64_t sub_237D5D860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  uint64_t v6 = v5;
  if (v4)
  {
    sub_237D5E114(a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), a2);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_237D5D908(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  result = sub_237D5E3E8(0, result, v3);
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result;
  }
  if (v3 < v5) {
    goto LABEL_9;
  }
  if ((v5 & 0x8000000000000000) == 0)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

double sub_237D5D9B8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  if (*(unsigned char *)(v0 + 56)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = *(void *)(v0 + 48);
  }
  swift_bridgeObjectRetain();
  double v4 = sub_237D73EC0(v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4 / *(double *)(v0 + 96);
}

uint64_t sub_237D5DA24()
{
  if (*(void *)(v0 + 120) == 1) {
    return 200;
  }
  double v1 = *(double *)(v0 + 112);
  if (v1 <= -1.0) {
    return 200;
  }
  double v2 = v1 * 1000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) != 0)
  {
    if (v2 > -9.22337204e18)
    {
      if (v2 < 9.22337204e18) {
        return (uint64_t)v2;
      }
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_237D5DA98()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237D5E45C(*(void *)(v0 + 104), *(void *)(v0 + 112), *(void *)(v0 + 120));
  return v0;
}

uint64_t sub_237D5DAE4()
{
  sub_237D5DA98();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t sub_237D5DB18()
{
  id v1 = objc_msgSend(self, sel_labelColor);
  id v2 = objc_msgSend(v1, sel_CGColor);

  *(void *)(v0 + 16) = v2;
  sub_237D6B7B4();
  *(void *)(v0 + 24) = v3;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 32) = 0;
  *(unsigned char *)(v0 + 56) = 1;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = 0;
  *(void *)(v0 + 88) = 200;
  *(void *)(v0 + 96) = 0x3FF0000000000000;
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = 1;
  return v0;
}

double variable initialization expression of _ProtoStrokeAnimationRepresentation.Point.x()
{
  return 0.0;
}

double variable initialization expression of _ProtoStrokeAnimationRepresentation.Point.y()
{
  return 0.0;
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.AnimationPoints.points()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.Color.rgb()
{
  return 0;
}

double variable initialization expression of _ProtoStrokeAnimationRepresentation.Color.alpha()
{
  return 0.0;
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation.Color.name()
{
  return 0;
}

uint64_t variable initialization expression of _ProtoStrokeAnimationRepresentation._storage()
{
  if (qword_268948928 != -1) {
    swift_once();
  }
  return swift_retain();
}

id variable initialization expression of StrokeView.backgroundView()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F82E00]);
  return objc_msgSend(v0, sel_init);
}

id variable initialization expression of StrokeView.backgroundImageView()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F82828]);
  return objc_msgSend(v0, sel_init);
}

id variable initialization expression of StrokeView.strokeData()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for StrokeData());
  return StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

uint64_t variable initialization expression of StrokeView.isAnimating()
{
  return 0;
}

uint64_t variable initialization expression of StrokeView.backgroundImageUrl()
{
  return 0;
}

uint64_t variable initialization expression of StrokeView.queue()
{
  sub_237D75540();
  OUTLINED_FUNCTION_1();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v4 - v3;
  sub_237D75520();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  sub_237D75340();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  sub_237D5E2FC(0, (unint64_t *)&unk_2689489B0);
  sub_237D75330();
  sub_237D5DF1C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689489C0);
  sub_237D5DFB0();
  sub_237D75670();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F8F130], v0);
  return sub_237D75570();
}

unint64_t sub_237D5DF1C()
{
  unint64_t result = qword_268948DC0;
  if (!qword_268948DC0)
  {
    sub_237D75520();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948DC0);
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

unint64_t sub_237D5DFB0()
{
  unint64_t result = qword_268948DD0;
  if (!qword_268948DD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689489C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948DD0);
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

uint64_t variable initialization expression of StrokeView.timers()
{
  return MEMORY[0x263F8EE78];
}

uint64_t type metadata accessor for StrokePathInfo()
{
  return self;
}

void type metadata accessor for CGPath(uint64_t a1)
{
}

void type metadata accessor for CGMutablePath(uint64_t a1)
{
}

uint64_t sub_237D5E0A4(uint64_t a1)
{
  type metadata accessor for CGPath(255);
  *(void *)(a1 + 16) = v2;
  return 0;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_237D5E114(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D5E178(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689489E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D5E1E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689489E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237D5E240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D5E2A4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_237D5E2FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_237D5E338@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_237D5E364@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = nullsub_2(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_237D5E390@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = nullsub_3(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_237D5E3BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_23(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_237D5E3E8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_237D5E45C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_237D5E470(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_237D5E4BC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_237D5E4DC(uint64_t result, int a2, int a3)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_237D5E534(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_237D5E554(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_237D5E590(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  return 0;
}

double _ProtoStrokeAnimationRepresentation.Point.toCGPoint(by:)(double a1)
{
  return *v1 * a1;
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeAnimationRepresentation(from:)@<X0>(uint64_t a1@<X8>)
{
  sub_237D750D0();
  MEMORY[0x270FA5388]();
  sub_237D75060();
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v3);
  }
  else
  {
    uint64_t v5 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
    sub_237D750C0();
    sub_237D5E7B8();
    sub_237D751C0();
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v5);
  }
}

unint64_t sub_237D5E7B8()
{
  unint64_t result = qword_268948F90;
  if (!qword_268948F90)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948F90);
  }
  return result;
}

UIColor_optional __swiftcall _ProtoStrokeAnimationRepresentation.Color.toUIColor()()
{
  v18[1] = *MEMORY[0x263EF8340];
  if (*(double *)(v0 + 16) == 0.0) {
    double v1 = 1.0;
  }
  else {
    double v1 = *(double *)(v0 + 16);
  }
  uint64_t v3 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  if (sub_237D753E0() < 1 || (sub_237D75420() & 1) == 0)
  {
    if (*(unsigned char *)(v0 + 32) == 1)
    {
      uint64_t v15 = *(objc_class **)(v0 + 24);
      switch((unint64_t)v15)
      {
        case 1uLL:
          uint64_t v15 = (objc_class *)objc_msgSend(self, sel_clearColor);
          goto LABEL_23;
        case 2uLL:
          id v13 = objc_msgSend(self, sel_blackColor);
          id v16 = objc_msgSend(v13, sel_colorWithAlphaComponent_, v1);
          goto LABEL_21;
        case 3uLL:
          id v13 = objc_msgSend(self, sel_whiteColor);
          id v16 = objc_msgSend(v13, sel_colorWithAlphaComponent_, v1);
          goto LABEL_21;
        case 4uLL:
          id v13 = objc_msgSend(self, sel_systemGrayColor);
          id v16 = objc_msgSend(v13, sel_colorWithAlphaComponent_, v1);
          goto LABEL_21;
        case 5uLL:
          id v13 = objc_msgSend(self, sel_systemRedColor);
          id v16 = objc_msgSend(v13, sel_colorWithAlphaComponent_, v1);
          goto LABEL_21;
        case 6uLL:
          id v13 = objc_msgSend(self, sel_systemGreenColor);
          id v16 = objc_msgSend(v13, sel_colorWithAlphaComponent_, v1);
          goto LABEL_21;
        case 7uLL:
          id v13 = objc_msgSend(self, sel_systemBlueColor);
          id v16 = objc_msgSend(v13, sel_colorWithAlphaComponent_, v1);
LABEL_21:
          uint64_t v14 = (objc_class *)v16;
          goto LABEL_22;
        default:
          goto LABEL_23;
      }
    }
    goto LABEL_14;
  }
  unint64_t v5 = sub_237D753F0();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_237D5EBD8(v5, v3, v2);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  MEMORY[0x237E2EF00](v6, v8, v10, v12);
  swift_bridgeObjectRelease();
  if (sub_237D753E0() != 6)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v15 = 0;
    goto LABEL_23;
  }
  sub_237D5EC24();
  id v13 = sub_237D5EC64();
  v18[0] = 0;
  if (!objc_msgSend(v13, sel_scanHexLongLong_, v18))
  {

    goto LABEL_14;
  }
  uint64_t v14 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, (double)BYTE2(v18[0]) / 255.0, (double)BYTE1(v18[0]) / 255.0, (double)LOBYTE(v18[0]) / 255.0, v1);
LABEL_22:
  uint64_t v15 = v14;

LABEL_23:
  uint64_t v17 = v15;
  result.value.super.isa = v17;
  result.is_nil = v4;
  return result;
}

uint64_t sub_237D5EBD8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 < a1 >> 14) {
    __break(1u);
  }
  return MEMORY[0x270F9D8F0]();
}

unint64_t sub_237D5EC24()
{
  unint64_t result = qword_268948AD0;
  if (!qword_268948AD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268948AD0);
  }
  return result;
}

id sub_237D5EC64()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v1 = (void *)sub_237D753A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

CFDataRef sub_237D5ECD8(void *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v2 = a1;
  CFDataRef result = CFDataCreate(v1, (const UInt8 *)objc_msgSend(v2, sel_bytes), (CFIndex)objc_msgSend(v2, sel_length));
  if (result)
  {
    CFDataRef v4 = result;
    uint64_t v5 = CGSVGDocumentCreateFromData();

    return (CFDataRef)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_237D5ED60()
{
  uint64_t v0 = sub_237D752D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  sub_237D755E0();
  if (qword_268948998 != -1) {
    swift_once();
  }
  sub_237D752C0();
  sub_237D752B0();
  id v2 = *(void (**)(uint64_t))(v1 + 8);
  uint64_t v3 = OUTLINED_FUNCTION_1_0();
  v2(v3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
  id v5 = (id)CGSVGDocumentGetRootNode();
  if (v5)
  {
    id v6 = v5;
    CGSVGViewBoxNodeGetViewbox();
    double v7 = sub_237D6B828();
    v26.origin.x = OUTLINED_FUNCTION_0_0();
    double v8 = v7 / CGRectGetWidth(v26);
    sub_237D6B828();
    double v10 = v9;
    v27.origin.x = OUTLINED_FUNCTION_0_0();
    CGFloat Height = CGRectGetHeight(v27);
    CGAffineTransformMakeScale(&aBlock, v8, v10 / Height);
    long long v23 = *(_OWORD *)&aBlock.c;
    long long v24 = *(_OWORD *)&aBlock.a;
    CGFloat tx = aBlock.tx;
    CGFloat ty = aBlock.ty;
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0x3FF0000000000000;
    v14[3] = 0;
    v14[4] = 0;
    v14[5] = 0x3FF0000000000000;
    v14[6] = 0;
    v14[7] = 0;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    *(_OWORD *)(v15 + 24) = v24;
    *(_OWORD *)(v15 + 40) = v23;
    *(CGFloat *)(v15 + 56) = tx;
    *(CGFloat *)(v15 + 64) = ty;
    *(void *)(v15 + 72) = v4;
    *(void *)&aBlock.CGFloat tx = sub_237D5F5AC;
    *(void *)&aBlock.CGFloat ty = v15;
    *(void *)&aBlock.a = MEMORY[0x263EF8330];
    *(void *)&aBlock.b = 1107296256;
    *(void *)&aBlock.c = sub_237D5F45C;
    *(void *)&aBlock.d = &block_descriptor;
    id v16 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    CGSVGNodeEnumerate();

    _Block_release(v16);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_268948980 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_237D752F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_2689490B0);
    uint64_t v18 = sub_237D752E0();
    os_log_type_t v19 = sub_237D754D0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_237D5B000, v18, v19, "invalid svg doc", v20, 2u);
      MEMORY[0x237E2F950](v20, -1, -1);
    }
    swift_release();

    double v8 = 1.0;
  }
  sub_237D755D0();
  sub_237D752C0();
  sub_237D752B0();
  uint64_t v21 = OUTLINED_FUNCTION_1_0();
  v2(v21);
  return v8;
}

void sub_237D5F190(uint64_t a1, int a2, uint64_t a3, _OWORD *a4, CGFloat *a5, uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    CGFloat v8 = *a5;
    CGFloat v9 = a5[1];
    CGFloat v10 = a5[2];
    CGFloat v11 = a5[3];
    CGFloat v13 = a5[4];
    CGFloat v12 = a5[5];
    if (CGSVGNodeGetType() == 1)
    {
      id v14 = (id)CGSVGNodeGetAttributeMap();
      if (v14)
      {
        id v27 = v14;
        id v15 = (id)CGSVGAttributeMapGetAttribute();
        if (v15)
        {
          id v16 = v15;
          swift_beginAccess();
          id v17 = v16;
          CGSVGAttributeGetTransform();
          swift_endAccess();
        }
        else
        {
        }
      }
    }
    else if (CGSVGNodeGetType() == 2)
    {
      int Primitive = CGSVGShapeNodeGetPrimitive();
      swift_beginAccess();
      long long v19 = a4[2];
      *(_OWORD *)&t1.a = a4[1];
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.CGFloat tx = a4[3];
      t2.a = v8;
      t2.b = v9;
      t2.c = v10;
      t2.d = v11;
      t2.CGFloat tx = v13;
      t2.CGFloat ty = v12;
      CGAffineTransformConcat(&v28, &t1, &t2);
      CGAffineTransform v31 = v28;
      if (Primitive == 42)
      {
        id v20 = (id)CGSVGShapeNodeGetPath();
        if (v20)
        {
          uint64_t v21 = v20;
          CGPath = (void *)CGSVGPathCreateCGPath();
          long long v23 = (void *)MEMORY[0x237E2F2E0](CGPath, &v31);
          type metadata accessor for StrokePathInfo();
          swift_allocObject();
          sub_237D5DB18();
          if (v23)
          {
            long long v24 = (void *)(a6 + 16);
            uint64_t v25 = v23;
            sub_237D5D2E8(v25);

            swift_beginAccess();
            uint64_t v26 = swift_retain();
            MEMORY[0x237E2EF70](v26);
            sub_237D72D58(*(void *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x10));
            sub_237D754A0();
            sub_237D75480();
            swift_endAccess();
            swift_release();
          }
          else
          {
            __break(1u);
          }
        }
      }
    }
  }
}

void sub_237D5F45C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_237D5F4E0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_237D5F55C()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_237D5F56C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_237D5F5AC(uint64_t a1, int a2, uint64_t a3)
{
  sub_237D5F190(a1, a2, a3, *(_OWORD **)(v3 + 16), (CGFloat *)(v3 + 24), *(void *)(v3 + 72));
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

double OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

BOOL sub_237D5F5FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeContours.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation(uint64_t a1)
{
  return sub_237D63068(a1, (uint64_t *)&unk_268948C28);
}

void _ProtoStrokeAnimationRepresentation.strokeContours.setter()
{
  OUTLINED_FUNCTION_48();
  if ((OUTLINED_FUNCTION_8() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_37();
    id v4 = sub_237D627F0(v3);
    OUTLINED_FUNCTION_27((uint64_t)v4);
  }
  uint64_t v5 = *(void *)(v1 + v2);
  OUTLINED_FUNCTION_6();
  *(void *)(v5 + 16) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t sub_237D5F6CC()
{
  uint64_t v1 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(0);
    swift_allocObject();
    uint64_t v2 = (void *)swift_retain();
    *(void *)(v0 + v1) = sub_237D627F0(v2);
    swift_release();
  }
  return swift_retain();
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(uint64_t a1)
{
  return sub_237D63068(a1, (uint64_t *)&unk_268948C78);
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeContours.modify()
{
  uint64_t v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3_0((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
  *(void *)(v1 + 72) = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D5F7DC()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9();
  if (v2)
  {
    OUTLINED_FUNCTION_36();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v3 = (void *)OUTLINED_FUNCTION_12();
      id v4 = sub_237D627F0(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    uint64_t v5 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v5 + 16) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_35() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      id v6 = (void *)OUTLINED_FUNCTION_12();
      double v7 = sub_237D627F0(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    uint64_t v8 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v8 + 16) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v9);
}

uint64_t _ProtoStrokeAnimationRepresentation.animationPoints.getter()
{
  return swift_bridgeObjectRetain();
}

void _ProtoStrokeAnimationRepresentation.animationPoints.setter()
{
  OUTLINED_FUNCTION_48();
  if ((OUTLINED_FUNCTION_8() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_37();
    id v4 = sub_237D627F0(v3);
    OUTLINED_FUNCTION_27((uint64_t)v4);
  }
  uint64_t v5 = *(void *)(v1 + v2);
  OUTLINED_FUNCTION_6();
  *(void *)(v5 + 24) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t _ProtoStrokeAnimationRepresentation.animationPoints.modify()
{
  uint64_t v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3_0((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
  *(void *)(v1 + 72) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D5F9D0()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9();
  if (v2)
  {
    OUTLINED_FUNCTION_36();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v3 = (void *)OUTLINED_FUNCTION_12();
      id v4 = sub_237D627F0(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    uint64_t v5 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v5 + 24) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_35() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      id v6 = (void *)OUTLINED_FUNCTION_12();
      double v7 = sub_237D627F0(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    uint64_t v8 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v8 + 24) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v9);
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeFeatures.getter()
{
  return swift_bridgeObjectRetain();
}

void _ProtoStrokeAnimationRepresentation.strokeFeatures.setter()
{
  OUTLINED_FUNCTION_48();
  if ((OUTLINED_FUNCTION_8() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_37();
    id v4 = sub_237D627F0(v3);
    OUTLINED_FUNCTION_27((uint64_t)v4);
  }
  uint64_t v5 = *(void *)(v1 + v2);
  OUTLINED_FUNCTION_6();
  *(void *)(v5 + 32) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeFeatures.modify()
{
  uint64_t v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3_0((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
  *(void *)(v1 + 72) = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D5FBC4()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9();
  if (v2)
  {
    OUTLINED_FUNCTION_36();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v3 = (void *)OUTLINED_FUNCTION_12();
      id v4 = sub_237D627F0(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    uint64_t v5 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v5 + 32) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_35() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      id v6 = (void *)OUTLINED_FUNCTION_12();
      double v7 = sub_237D627F0(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    uint64_t v8 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v8 + 32) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v9);
}

double _ProtoStrokeAnimationRepresentation.speedRate.getter()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4_0();
  return *(double *)(v0 + 40);
}

uint64_t _ProtoStrokeAnimationRepresentation.speedRate.setter(double a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    id v4 = (void *)swift_retain();
    *(void *)(v1 + v3) = sub_237D627F0(v4);
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v3);
  uint64_t result = OUTLINED_FUNCTION_6();
  *(double *)(v5 + 40) = a1;
  return result;
}

void (*_ProtoStrokeAnimationRepresentation.speedRate.modify())(uint64_t *a1, char a2)
{
  char v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3_0((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
  *(void *)(v1 + 72) = *(void *)(v0 + 40);
  return sub_237D5FDDC;
}

void sub_237D5FDDC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 72);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 88);
    uint64_t v7 = *(void *)(v3 + 80);
    OUTLINED_FUNCTION_0_1();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_37();
    *(void *)(v7 + v6) = sub_237D627F0(v8);
    swift_release();
  }
LABEL_4:
  CGFloat v9 = (void *)(*(void *)(*(void *)(v3 + 80) + *(int *)(v3 + 88)) + 40);
  OUTLINED_FUNCTION_6();
  *CGFloat v9 = v4;
  free((void *)v3);
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeWidth.getter()
{
  return swift_bridgeObjectRetain();
}

void _ProtoStrokeAnimationRepresentation.strokeWidth.setter()
{
  OUTLINED_FUNCTION_48();
  if ((OUTLINED_FUNCTION_8() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_37();
    uint64_t v4 = sub_237D627F0(v3);
    OUTLINED_FUNCTION_27((uint64_t)v4);
  }
  uint64_t v5 = *(void *)(v1 + v2);
  OUTLINED_FUNCTION_6();
  *(void *)(v5 + 48) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeWidth.modify()
{
  uint64_t v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3_0((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
  *(void *)(v1 + 72) = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D5FFAC()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9();
  if (v2)
  {
    OUTLINED_FUNCTION_36();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v3 = (void *)OUTLINED_FUNCTION_12();
      uint64_t v4 = sub_237D627F0(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    uint64_t v5 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v5 + 48) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_35() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v6 = (void *)OUTLINED_FUNCTION_12();
      uint64_t v7 = sub_237D627F0(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    uint64_t v8 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v8 + 48) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v9);
}

uint64_t _ProtoStrokeAnimationRepresentation.animationControlValues.getter()
{
  return swift_bridgeObjectRetain();
}

void _ProtoStrokeAnimationRepresentation.animationControlValues.setter()
{
  OUTLINED_FUNCTION_48();
  if ((OUTLINED_FUNCTION_8() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v3 = (void *)OUTLINED_FUNCTION_37();
    uint64_t v4 = sub_237D627F0(v3);
    OUTLINED_FUNCTION_27((uint64_t)v4);
  }
  uint64_t v5 = *(void *)(v1 + v2);
  OUTLINED_FUNCTION_6();
  *(void *)(v5 + 56) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t _ProtoStrokeAnimationRepresentation.animationControlValues.modify()
{
  uint64_t v2 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3_0((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
  *(void *)(v1 + 72) = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D601A0()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9();
  if (v2)
  {
    OUTLINED_FUNCTION_36();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v3 = (void *)OUTLINED_FUNCTION_12();
      uint64_t v4 = sub_237D627F0(v3);
      OUTLINED_FUNCTION_7((uint64_t)v4);
    }
    uint64_t v5 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v5 + 56) = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_35() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v6 = (void *)OUTLINED_FUNCTION_12();
      uint64_t v7 = sub_237D627F0(v6);
      OUTLINED_FUNCTION_7((uint64_t)v7);
    }
    uint64_t v8 = *(void *)(*(void *)(v0 + 80) + *(int *)(v0 + 88));
    OUTLINED_FUNCTION_6();
    *(void *)(v8 + 56) = v1;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v9);
}

uint64_t _ProtoStrokeAnimationRepresentation.contourColor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D60438(&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  return _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

void _ProtoStrokeAnimationRepresentation.contourColor.setter()
{
}

void (*_ProtoStrokeAnimationRepresentation.contourColor.modify())()
{
  uint64_t v1 = malloc(0x38uLL);
  OUTLINED_FUNCTION_43((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  OUTLINED_FUNCTION_31(v2);
  uint64_t v4 = malloc(*(void *)(v3 + 64));
  v0[4] = v4;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_1_1();
  size_t v6 = *(void *)(v5 + 64);
  v0[5] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v0[6] = v7;
  OUTLINED_FUNCTION_24();
  uint64_t v9 = v8
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  OUTLINED_FUNCTION_4_0();
  sub_237D62E4C(v9, (uint64_t)v4);
  OUTLINED_FUNCTION_29();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    sub_237D6A784((uint64_t)v4, &qword_268948AE0);
  }
  else
  {
    sub_237D62ED4((uint64_t)v4, (uint64_t)v7);
  }
  return sub_237D603FC;
}

void sub_237D603FC()
{
}

BOOL _ProtoStrokeAnimationRepresentation.hasContourColor.getter()
{
  return sub_237D607D4((uint64_t)&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor);
}

Swift::Void __swiftcall _ProtoStrokeAnimationRepresentation.clearContourColor()()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.backgroundColor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D60438(&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, a1);
}

uint64_t sub_237D60438@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v5 = OUTLINED_FUNCTION_31(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_24();
  uint64_t v9 = v8 + *a1;
  OUTLINED_FUNCTION_4_0();
  sub_237D62E4C(v9, (uint64_t)v7);
  uint64_t v10 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) != 1) {
    return sub_237D62ED4((uint64_t)v7, a2);
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0xE000000000000000;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  return sub_237D6A784((uint64_t)v7, &qword_268948AE0);
}

void _ProtoStrokeAnimationRepresentation.backgroundColor.setter()
{
}

void sub_237D60544()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v6 = OUTLINED_FUNCTION_31(v5);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  CGFloat v11 = &v17[-v10];
  uint64_t v12 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    CGFloat v13 = (void *)swift_retain();
    *(void *)(v0 + v12) = sub_237D627F0(v13);
    swift_release();
  }
  uint64_t v14 = *(void *)(v0 + v12);
  sub_237D62ED4(v4, (uint64_t)v11);
  uint64_t v15 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v15);
  sub_237D62F38((uint64_t)v11, (uint64_t)v9);
  uint64_t v16 = v14 + *v2;
  swift_beginAccess();
  swift_retain();
  sub_237D62FA0((uint64_t)v9, v16);
  swift_endAccess();
  swift_release();
  OUTLINED_FUNCTION_14();
}

void (*_ProtoStrokeAnimationRepresentation.backgroundColor.modify())()
{
  uint64_t v1 = malloc(0x38uLL);
  OUTLINED_FUNCTION_43((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  OUTLINED_FUNCTION_31(v2);
  uint64_t v4 = malloc(*(void *)(v3 + 64));
  v0[4] = v4;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_1_1();
  size_t v6 = *(void *)(v5 + 64);
  v0[5] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v0[6] = v7;
  OUTLINED_FUNCTION_24();
  uint64_t v9 = v8
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  OUTLINED_FUNCTION_4_0();
  sub_237D62E4C(v9, (uint64_t)v4);
  OUTLINED_FUNCTION_29();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    sub_237D6A784((uint64_t)v4, &qword_268948AE0);
  }
  else
  {
    sub_237D62ED4((uint64_t)v4, (uint64_t)v7);
  }
  return sub_237D607B0;
}

void sub_237D607B0()
{
}

BOOL _ProtoStrokeAnimationRepresentation.hasBackgroundColor.getter()
{
  return sub_237D607D4((uint64_t)&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor);
}

BOOL sub_237D607D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v3 = OUTLINED_FUNCTION_31(v2);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_4_0();
  sub_237D62E4C(a1, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  BOOL v7 = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) != 1;
  sub_237D6A784((uint64_t)v5, &qword_268948AE0);
  return v7;
}

Swift::Void __swiftcall _ProtoStrokeAnimationRepresentation.clearBackgroundColor()()
{
}

uint64_t sub_237D608AC(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v5 = OUTLINED_FUNCTION_31(v4);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((OUTLINED_FUNCTION_49() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v8 = (void *)OUTLINED_FUNCTION_12();
    uint64_t v9 = sub_237D627F0(v8);
    OUTLINED_FUNCTION_47((uint64_t)v9);
  }
  uint64_t v10 = *(void *)(v1 + v2);
  uint64_t v11 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v11);
  uint64_t v12 = v10 + *a1;
  swift_beginAccess();
  swift_retain();
  sub_237D62FA0((uint64_t)v7, v12);
  swift_endAccess();
  return swift_release();
}

uint64_t _ProtoStrokeAnimationRepresentation.compoundAnimationEffects.getter()
{
  return sub_237D60A44();
}

void _ProtoStrokeAnimationRepresentation.compoundAnimationEffects.setter()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.compoundAnimationEffects.modify()
{
  uint64_t v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5((uint64_t)v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D60A2C()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.animationDelays.getter()
{
  return sub_237D60A44();
}

uint64_t sub_237D60A44()
{
  return swift_bridgeObjectRetain();
}

void _ProtoStrokeAnimationRepresentation.animationDelays.setter()
{
}

void sub_237D60A98()
{
  OUTLINED_FUNCTION_48();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  if ((OUTLINED_FUNCTION_49() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_12();
    BOOL v7 = sub_237D627F0(v6);
    OUTLINED_FUNCTION_47((uint64_t)v7);
  }
  uint64_t v8 = (void *)(*(void *)(v0 + v1) + *v3);
  OUTLINED_FUNCTION_6();
  *uint64_t v8 = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t _ProtoStrokeAnimationRepresentation.animationDelays.modify()
{
  uint64_t v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5((uint64_t)v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D60B7C()
{
}

void sub_237D60B88()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = v0;
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 72);
  if (v5)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v6 = (void *)swift_retain();
      BOOL v7 = sub_237D627F0(v6);
      OUTLINED_FUNCTION_32((uint64_t)v7);
    }
    uint64_t v8 = (void *)(*(void *)(*(void *)(v3 + 80) + *(int *)(v3 + 88)) + *v1);
    OUTLINED_FUNCTION_6();
    *uint64_t v8 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v9 = (void *)swift_retain();
      uint64_t v10 = sub_237D627F0(v9);
      OUTLINED_FUNCTION_32((uint64_t)v10);
    }
    uint64_t v11 = (void *)(*(void *)(*(void *)(v3 + 80) + *(int *)(v3 + 88)) + *v1);
    OUTLINED_FUNCTION_6();
    *uint64_t v11 = v4;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v12);
}

uint64_t _ProtoStrokeAnimationRepresentation.strokeColor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D60438(&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, a1);
}

void _ProtoStrokeAnimationRepresentation.strokeColor.setter()
{
}

void (*_ProtoStrokeAnimationRepresentation.strokeColor.modify())()
{
  uint64_t v1 = malloc(0x38uLL);
  OUTLINED_FUNCTION_43((uint64_t)v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  OUTLINED_FUNCTION_31(v2);
  uint64_t v4 = malloc(*(void *)(v3 + 64));
  v0[4] = v4;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_1_1();
  size_t v6 = *(void *)(v5 + 64);
  v0[5] = malloc(v6);
  BOOL v7 = malloc(v6);
  v0[6] = v7;
  OUTLINED_FUNCTION_24();
  uint64_t v9 = v8
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
  OUTLINED_FUNCTION_4_0();
  sub_237D62E4C(v9, (uint64_t)v4);
  OUTLINED_FUNCTION_29();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    sub_237D6A784((uint64_t)v4, &qword_268948AE0);
  }
  else
  {
    sub_237D62ED4((uint64_t)v4, (uint64_t)v7);
  }
  return sub_237D60DE0;
}

void sub_237D60DE0()
{
}

void sub_237D60DF8()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = v1;
  uint64_t v3 = *(void **)(*(void *)v0 + 40);
  uint64_t v4 = *(void **)(*(void *)v0 + 48);
  uint64_t v5 = *(void **)(*(void *)v0 + 32);
  if (v6)
  {
    sub_237D69F08(*(void *)(*(void *)v0 + 48), (uint64_t)v3, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    v2(v3);
    sub_237D69F60();
  }
  else
  {
    v1(*(void **)(*(void *)v0 + 48));
  }
  free(v4);
  free(v3);
  free(v5);
  OUTLINED_FUNCTION_14();
  free(v7);
}

BOOL _ProtoStrokeAnimationRepresentation.hasStrokeColor.getter()
{
  return sub_237D607D4((uint64_t)&OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor);
}

Swift::Void __swiftcall _ProtoStrokeAnimationRepresentation.clearStrokeColor()()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.backgroundURL.getter()
{
  OUTLINED_FUNCTION_24();
  uint64_t v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  OUTLINED_FUNCTION_4_0();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

void _ProtoStrokeAnimationRepresentation.backgroundURL.setter()
{
  OUTLINED_FUNCTION_48();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  if ((OUTLINED_FUNCTION_49() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_1();
    char v6 = (void *)OUTLINED_FUNCTION_12();
    BOOL v7 = sub_237D627F0(v6);
    OUTLINED_FUNCTION_47((uint64_t)v7);
  }
  uint64_t v8 = (void *)(*(void *)(v0 + v1)
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  OUTLINED_FUNCTION_6();
  *uint64_t v8 = v5;
  v8[1] = v3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46();
}

uint64_t _ProtoStrokeAnimationRepresentation.backgroundURL.modify(void *a1)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = (void *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = v5[1];
  v3[9] = *v5;
  v3[10] = v6;
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D6102C()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  uint64_t v3 = *(void *)(*v0 + 80);
  if (v4)
  {
    OUTLINED_FUNCTION_36();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v5 = (void *)OUTLINED_FUNCTION_12();
      uint64_t v6 = sub_237D627F0(v5);
      OUTLINED_FUNCTION_32((uint64_t)v6);
    }
    BOOL v7 = (void *)(*(void *)(*(void *)(v1 + 88) + *(int *)(v1 + 96))
                  + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
    OUTLINED_FUNCTION_6();
    *BOOL v7 = v2;
    v7[1] = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((OUTLINED_FUNCTION_35() & 1) == 0)
    {
      OUTLINED_FUNCTION_0_1();
      uint64_t v8 = (void *)OUTLINED_FUNCTION_12();
      uint64_t v9 = sub_237D627F0(v8);
      OUTLINED_FUNCTION_32((uint64_t)v9);
    }
    char v10 = (void *)(*(void *)(*(void *)(v1 + 88) + *(int *)(v1 + 96))
                   + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
    OUTLINED_FUNCTION_6();
    *char v10 = v2;
    v10[1] = v3;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14();
  free(v11);
}

uint64_t _ProtoStrokeAnimationRepresentation.customEaseInValues.getter()
{
  return sub_237D60A44();
}

void _ProtoStrokeAnimationRepresentation.customEaseInValues.setter()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.customEaseInValues.modify()
{
  uint64_t v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5((uint64_t)v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D611C4()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.customEaseOutValues.getter()
{
  return sub_237D60A44();
}

void _ProtoStrokeAnimationRepresentation.customEaseOutValues.setter()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.customEaseOutValues.modify()
{
  uint64_t v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5((uint64_t)v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D61250()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.customEaseInOutValues.getter()
{
  return sub_237D60A44();
}

void _ProtoStrokeAnimationRepresentation.customEaseInOutValues.setter()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.customEaseInOutValues.modify()
{
  uint64_t v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5((uint64_t)v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_16();
}

void sub_237D612DC()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.unknownFields.getter()
{
  OUTLINED_FUNCTION_54();
  sub_237D750B0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_18();
  return v1(v0);
}

uint64_t _ProtoStrokeAnimationRepresentation.unknownFields.setter()
{
  sub_237D750B0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_28();
  return v1(v0);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.unknownFields.modify())()
{
  return nullsub_4;
}

void _ProtoStrokeAnimationRepresentation.AnimationEffect.init(rawValue:)()
{
}

void sub_237D613CC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_237D613DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237D61C54(a1, a2, a3, (uint64_t (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect.init(rawValue:));
}

uint64_t sub_237D613F4()
{
  return _ProtoStrokeAnimationRepresentation.AnimationEffect.rawValue.getter(*(void *)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_237D61400(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_237D61C98(a1, a2, a3, (uint64_t (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect.init(rawValue:));
}

uint64_t sub_237D61418@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _ProtoStrokeAnimationRepresentation.AnimationEffect.rawValue.getter(*(void *)v1, *(unsigned __int8 *)(v1 + 8));
  *a1 = result;
  return result;
}

uint64_t sub_237D61448()
{
  return sub_237D61484(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_237D68004);
}

uint64_t sub_237D61484(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_237D75760();
  a3(v4);
  OUTLINED_FUNCTION_56();
  return sub_237D75770();
}

uint64_t sub_237D614DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_237D69E58();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_237D61528(uint64_t a1)
{
  return sub_237D61564(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_237D68004);
}

uint64_t sub_237D61564(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_237D75760();
  a4(v5);
  OUTLINED_FUNCTION_56();
  return sub_237D75770();
}

BOOL sub_237D615B8(uint64_t a1, uint64_t *a2)
{
  return sub_237D5F5FC(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

float _ProtoStrokeAnimationRepresentation.Point.x.getter()
{
  return *(float *)v0;
}

void _ProtoStrokeAnimationRepresentation.Point.x.setter(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Point.x.modify())()
{
  return nullsub_5;
}

float _ProtoStrokeAnimationRepresentation.Point.y.getter()
{
  return *(float *)(v0 + 4);
}

void _ProtoStrokeAnimationRepresentation.Point.y.setter(float a1)
{
  *(float *)(v1 + 4) = a1;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Point.y.modify())()
{
  return nullsub_6;
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.unknownFields.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_54();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = OUTLINED_FUNCTION_18();
  return v2(v1);
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.unknownFields.setter()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_28();
  return v1(v0);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Point.unknownFields.modify())()
{
  return nullsub_7;
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  return _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t (*_ProtoStrokeAnimationRepresentation.AnimationPoints.points.modify())()
{
  return nullsub_8;
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.unknownFields.getter()
{
  return sub_237D618A0();
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.unknownFields.setter()
{
  return sub_237D6191C();
}

uint64_t (*_ProtoStrokeAnimationRepresentation.AnimationPoints.unknownFields.modify())()
{
  uint64_t v0 = OUTLINED_FUNCTION_57();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(v0);
  return nullsub_9;
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.init()@<X0>(void *a1@<X8>)
{
  return sub_237D619DC((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.value.modify())()
{
  return nullsub_10;
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.unknownFields.getter()
{
  return sub_237D618A0();
}

uint64_t sub_237D618A0()
{
  uint64_t v0 = OUTLINED_FUNCTION_54();
  v1(v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = OUTLINED_FUNCTION_18();
  return v3(v2);
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.unknownFields.setter()
{
  return sub_237D6191C();
}

uint64_t sub_237D6191C()
{
  uint64_t v0 = OUTLINED_FUNCTION_57();
  v1(v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = OUTLINED_FUNCTION_28();
  return v3(v2);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.unknownFields.modify())()
{
  uint64_t v0 = OUTLINED_FUNCTION_57();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(v0);
  return nullsub_11;
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.init()@<X0>(void *a1@<X8>)
{
  return sub_237D619DC((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, a1);
}

uint64_t sub_237D619DC@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  a1(0);
  return _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.rgb.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.rgb.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.rgb.modify())()
{
  return nullsub_12;
}

double _ProtoStrokeAnimationRepresentation.Color.alpha.getter()
{
  return *(double *)(v0 + 16);
}

void _ProtoStrokeAnimationRepresentation.Color.alpha.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.alpha.modify())()
{
  return nullsub_13;
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.name.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.name.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 24) = result;
  *(unsigned char *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.name.modify())()
{
  return nullsub_14;
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.unknownFields.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_54();
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(v0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = OUTLINED_FUNCTION_18();
  return v2(v1);
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.unknownFields.setter()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_28();
  return v1(v0);
}

uint64_t (*_ProtoStrokeAnimationRepresentation.Color.unknownFields.modify())()
{
  return nullsub_15;
}

void _ProtoStrokeAnimationRepresentation.Color.Name.init(rawValue:)()
{
}

uint64_t sub_237D61C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_237D61C54(a1, a2, a3, (uint64_t (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name.init(rawValue:));
}

uint64_t sub_237D61C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  return OUTLINED_FUNCTION_52(v4, v5);
}

uint64_t sub_237D61C80(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_237D61C98(a1, a2, a3, (uint64_t (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name.init(rawValue:));
}

uint64_t sub_237D61C98(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4(*a1);
  return OUTLINED_FUNCTION_52(v4, v5);
}

uint64_t sub_237D61CC8()
{
  return sub_237D61484(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_237D680F4);
}

uint64_t sub_237D61D04(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_237D67FB4();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_237D61D50(uint64_t a1)
{
  return sub_237D61564(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_237D680F4);
}

uint64_t _ProtoStrokeAnimationRepresentation.init()@<X0>(uint64_t a1@<X8>)
{
  _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v2 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  if (qword_268948928 != -1) {
    swift_once();
  }
  *(void *)(a1 + v2) = qword_268948AD8;
  return swift_retain();
}

void sub_237D61E08()
{
  static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases = (uint64_t)&unk_26EAED3D8;
}

uint64_t *_ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.unsafeMutableAddressor()
{
  if (qword_268948910 != -1) {
    swift_once();
  }
  return &static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases;
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.getter()
{
  return sub_237D61FD0();
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.setter(uint64_t a1)
{
  return sub_237D62044(a1, &qword_268948910, &static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases);
}

uint64_t (*static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.modify())()
{
  if (qword_268948910 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_55();
  return j__swift_endAccess;
}

uint64_t sub_237D61F2C@<X0>(void *a1@<X8>)
{
  return sub_237D6213C((void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect.allCases.unsafeMutableAddressor, &static _ProtoStrokeAnimationRepresentation.AnimationEffect.allCases, a1);
}

void sub_237D61F4C()
{
  static _ProtoStrokeAnimationRepresentation.Color.Name.allCases = (uint64_t)&unk_26EAED448;
}

uint64_t *_ProtoStrokeAnimationRepresentation.Color.Name.allCases.unsafeMutableAddressor()
{
  if (qword_268948918 != -1) {
    swift_once();
  }
  return &static _ProtoStrokeAnimationRepresentation.Color.Name.allCases;
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color.Name.allCases.getter()
{
  return sub_237D61FD0();
}

uint64_t sub_237D61FD0()
{
  OUTLINED_FUNCTION_53();
  if (!v0) {
    swift_once();
  }
  OUTLINED_FUNCTION_4_0();
  return swift_bridgeObjectRetain();
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color.Name.allCases.setter(uint64_t a1)
{
  return sub_237D62044(a1, &qword_268948918, &static _ProtoStrokeAnimationRepresentation.Color.Name.allCases);
}

uint64_t sub_237D62044(uint64_t a1, void *a2, void *a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_6();
  *a3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static _ProtoStrokeAnimationRepresentation.Color.Name.allCases.modify())()
{
  if (qword_268948918 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_55();
  return j_j__swift_endAccess;
}

uint64_t sub_237D6211C@<X0>(void *a1@<X8>)
{
  return sub_237D6213C((void (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name.allCases.unsafeMutableAddressor, &static _ProtoStrokeAnimationRepresentation.Color.Name.allCases, a1);
}

uint64_t sub_237D6213C@<X0>(void (*a1)(void)@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

void *_ProtoStrokeAnimationRepresentation.protoMessageName.unsafeMutableAddressor()
{
  return &static _ProtoStrokeAnimationRepresentation.protoMessageName;
}

unint64_t static _ProtoStrokeAnimationRepresentation.protoMessageName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_237D621B0()
{
  uint64_t v0 = sub_237D752A0();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CC0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268948CC8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_237D761F0;
  unint64_t v4 = v36 + v3 + v1[14];
  *(void *)(v36 + v3) = 1;
  *(void *)unint64_t v4 = "strokeContours";
  *(void *)(v4 + 8) = 14;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_237D75280();
  BOOL v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v36 + v3 + v2 + v1[14];
  *(void *)(v36 + v3 + v2) = 2;
  *(void *)unint64_t v8 = "animationPoints";
  *(void *)(v8 + 8) = 15;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  uint64_t v9 = (void *)(v36 + v3 + 2 * v2);
  char v10 = (char *)v9 + v1[14];
  *uint64_t v9 = 3;
  *(void *)char v10 = "strokeFeatures";
  *((void *)v10 + 1) = 14;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v36 + v3 + 3 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 4;
  *(void *)uint64_t v12 = "speedRate";
  *((void *)v12 + 1) = 9;
  v12[16] = 2;
  v7();
  uint64_t v13 = (void *)(v36 + v3 + 4 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 5;
  *(void *)uint64_t v14 = "strokeWidth";
  *((void *)v14 + 1) = 11;
  v14[16] = 2;
  v7();
  uint64_t v15 = (void *)(v36 + v3 + 5 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 6;
  *(void *)uint64_t v16 = "animationControlValues";
  *((void *)v16 + 1) = 22;
  v16[16] = 2;
  v7();
  id v17 = (void *)(v36 + v3 + 6 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *id v17 = 7;
  *(void *)uint64_t v18 = "contourColor";
  *((void *)v18 + 1) = 12;
  v18[16] = 2;
  v7();
  long long v19 = (void *)(v36 + v3 + 7 * v2);
  id v20 = (char *)v19 + v1[14];
  *long long v19 = 8;
  *(void *)id v20 = "backgroundColor";
  *((void *)v20 + 1) = 15;
  v20[16] = 2;
  v7();
  uint64_t v21 = (void *)(v36 + v3 + 8 * v2);
  v22 = (char *)v21 + v1[14];
  *uint64_t v21 = 10;
  *(void *)v22 = "compoundAnimationEffects";
  *((void *)v22 + 1) = 24;
  v22[16] = 2;
  v7();
  long long v23 = (void *)(v36 + v3 + 9 * v2);
  long long v24 = (char *)v23 + v1[14];
  *long long v23 = 11;
  *(void *)long long v24 = "animationDelays";
  *((void *)v24 + 1) = 15;
  v24[16] = 2;
  v7();
  uint64_t v25 = (void *)(v36 + v3 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  *uint64_t v25 = 12;
  *(void *)uint64_t v26 = "strokeColor";
  *((void *)v26 + 1) = 11;
  v26[16] = 2;
  v7();
  id v27 = (void *)(v36 + v3 + 11 * v2);
  CGAffineTransform v28 = (char *)v27 + v1[14];
  *id v27 = 13;
  *(void *)CGAffineTransform v28 = "backgroundUrl";
  *((void *)v28 + 1) = 13;
  v28[16] = 2;
  v7();
  uint64_t v29 = (void *)(v36 + v3 + 12 * v2);
  uint64_t v30 = (char *)v29 + v1[14];
  *uint64_t v29 = 14;
  *(void *)uint64_t v30 = "customEaseInValues";
  *((void *)v30 + 1) = 18;
  v30[16] = 2;
  v7();
  CGAffineTransform v31 = (void *)(v36 + v3 + 13 * v2);
  uint64_t v32 = (char *)v31 + v1[14];
  *CGAffineTransform v31 = 15;
  *(void *)uint64_t v32 = "customEaseOutValues";
  *((void *)v32 + 1) = 19;
  v32[16] = 2;
  v7();
  v33 = (void *)(v36 + v3 + 14 * v2);
  uint64_t v34 = (char *)v33 + v1[14];
  void *v33 = 16;
  *(void *)uint64_t v34 = "customEaseInOutValues";
  *((void *)v34 + 1) = 21;
  v34[16] = 2;
  v7();
  return sub_237D75290();
}

uint64_t _ProtoStrokeAnimationRepresentation._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948920, (uint64_t)static _ProtoStrokeAnimationRepresentation._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation._protobuf_nameMap, a1);
}

void *sub_237D626D0()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t result = sub_237D62700();
  qword_268948AD8 = (uint64_t)result;
  return result;
}

void *sub_237D62700()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[2] = MEMORY[0x263F8EE78];
  v0[3] = v1;
  v0[4] = v1;
  v0[5] = 0;
  v0[6] = v1;
  v0[7] = v1;
  uint64_t v2 = (uint64_t)v0
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  uint64_t v3 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v3);
  __swift_storeEnumTagSinglePayload((uint64_t)v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, 1, 1, v3);
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects) = v1;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays) = v1;
  __swift_storeEnumTagSinglePayload((uint64_t)v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, 1, 1, v3);
  unint64_t v4 = (void *)((char *)v0
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  *unint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues) = v1;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues) = v1;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues) = v1;
  return v0;
}

void *sub_237D627F0(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  MEMORY[0x270FA5388]();
  uint64_t v47 = (uint64_t)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x263F8EE78];
  v1[2] = MEMORY[0x263F8EE78];
  v1[3] = v5;
  v1[4] = v5;
  v1[5] = 0;
  uint64_t v44 = v1 + 5;
  v1[6] = v5;
  v1[7] = v5;
  v45 = v1 + 7;
  uint64_t v6 = (uint64_t)v1
     + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  v46 = (char *)v1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  uint64_t v7 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  v48 = (char *)v1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  __swift_storeEnumTagSinglePayload((uint64_t)v1+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, 1, 1, v7);
  v49 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
  void *v49 = v5;
  v50 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
  void *v50 = v5;
  v51 = (char *)v1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
  __swift_storeEnumTagSinglePayload((uint64_t)v1+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, 1, 1, v7);
  unint64_t v8 = (void *)((char *)v1
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  *unint64_t v8 = 0;
  v8[1] = 0xE000000000000000;
  v52 = v8;
  v53 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
  void *v53 = v5;
  v54 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
  void *v54 = v5;
  v55 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
  void *v55 = v5;
  swift_beginAccess();
  uint64_t v9 = a1[2];
  swift_beginAccess();
  v1[2] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v10 = a1[3];
  swift_beginAccess();
  v1[3] = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v11 = a1[4];
  swift_beginAccess();
  v1[4] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v12 = a1[5];
  uint64_t v13 = v44;
  swift_beginAccess();
  *uint64_t v13 = v12;
  swift_beginAccess();
  uint64_t v14 = a1[6];
  swift_beginAccess();
  v2[6] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v15 = a1[7];
  uint64_t v16 = v45;
  swift_beginAccess();
  *uint64_t v16 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (uint64_t)a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  swift_beginAccess();
  uint64_t v18 = v47;
  sub_237D62E4C(v17, v47);
  uint64_t v19 = (uint64_t)v46;
  swift_beginAccess();
  sub_237D62FA0(v18, v19);
  swift_endAccess();
  uint64_t v20 = (uint64_t)a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  swift_beginAccess();
  sub_237D62E4C(v20, v18);
  uint64_t v21 = (uint64_t)v48;
  swift_beginAccess();
  sub_237D62FA0(v18, v21);
  swift_endAccess();
  v22 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
  swift_beginAccess();
  uint64_t v23 = *v22;
  long long v24 = v49;
  swift_beginAccess();
  *long long v24 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
  swift_beginAccess();
  uint64_t v26 = *v25;
  id v27 = v50;
  swift_beginAccess();
  *id v27 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = (uint64_t)a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
  swift_beginAccess();
  sub_237D62E4C(v28, v18);
  uint64_t v29 = (uint64_t)v51;
  swift_beginAccess();
  sub_237D62FA0(v18, v29);
  swift_endAccess();
  uint64_t v30 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
  swift_beginAccess();
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  v33 = v52;
  swift_beginAccess();
  void *v33 = v32;
  v33[1] = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
  swift_beginAccess();
  uint64_t v35 = *v34;
  uint64_t v36 = v53;
  swift_beginAccess();
  *uint64_t v36 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
  swift_beginAccess();
  uint64_t v38 = *v37;
  uint64_t v39 = v54;
  swift_beginAccess();
  *uint64_t v39 = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
  swift_beginAccess();
  uint64_t v41 = *v40;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v42 = v55;
  swift_beginAccess();
  *uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_237D62E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1)
{
  return sub_237D63068(a1, (uint64_t *)&unk_268948C68);
}

uint64_t sub_237D62ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D62F38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D62FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(uint64_t a1)
{
  return sub_237D63068(a1, (uint64_t *)&unk_268948C38);
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(uint64_t a1)
{
  return sub_237D63068(a1, (uint64_t *)&unk_268948C48);
}

uint64_t type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(uint64_t a1)
{
  return sub_237D63068(a1, (uint64_t *)&unk_268948C58);
}

uint64_t sub_237D63068(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237D6309C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237D6A784(v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor, &qword_268948AE0);
  sub_237D6A784(v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor, &qword_268948AE0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237D6A784(v0+ OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor, &qword_268948AE0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_237D6318C()
{
  uint64_t v0 = sub_237D6309C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t _ProtoStrokeAnimationRepresentation.decodeMessage<A>(decoder:)()
{
  return swift_release();
}

uint64_t sub_237D6325C()
{
  uint64_t result = sub_237D75110();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_237D63500();
          break;
        case 2:
          sub_237D63580();
          break;
        case 3:
          sub_237D63648();
          break;
        case 4:
          sub_237D636C8();
          break;
        case 5:
          sub_237D63748();
          break;
        case 6:
          sub_237D637C8();
          break;
        case 7:
        case 8:
        case 12:
          sub_237D63928();
          break;
        case 10:
          sub_237D63890();
          break;
        case 11:
        case 14:
        case 15:
        case 16:
          sub_237D63A54();
          break;
        case 13:
          sub_237D639CC();
          break;
        default:
          break;
      }
      uint64_t result = sub_237D75110();
    }
  }
  return result;
}

uint64_t sub_237D63500()
{
  return swift_endAccess();
}

uint64_t sub_237D63580()
{
  return swift_endAccess();
}

uint64_t sub_237D63648()
{
  return swift_endAccess();
}

uint64_t sub_237D636C8()
{
  return swift_endAccess();
}

uint64_t sub_237D63748()
{
  return swift_endAccess();
}

uint64_t sub_237D637C8()
{
  return swift_endAccess();
}

uint64_t sub_237D63890()
{
  return swift_endAccess();
}

uint64_t sub_237D63928()
{
  return swift_endAccess();
}

uint64_t sub_237D639CC()
{
  return swift_endAccess();
}

uint64_t sub_237D63A54()
{
  return swift_endAccess();
}

uint64_t _ProtoStrokeAnimationRepresentation.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  swift_retain();
  OUTLINED_FUNCTION_42();
  sub_237D63B40(v5, v6, v7, a3);
  uint64_t result = swift_release();
  if (!v3) {
    return sub_237D75090();
  }
  return result;
}

uint64_t sub_237D63B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v51 = (uint64_t)v47 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v53 = (uint64_t)v47 - v15;
  uint64_t v52 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  uint64_t v16 = MEMORY[0x270FA5388](v52);
  uint64_t v18 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v49 = (uint64_t)v47 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v50 = (uint64_t)v47 - v21;
  swift_beginAccess();
  if (*(void *)(*(void *)(a1 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_237D75230();
    if (v4) {
      return swift_bridgeObjectRelease();
    }
    v48 = v18;
    uint64_t v22 = a3;
    uint64_t v23 = a4;
    swift_bridgeObjectRelease();
  }
  else
  {
    v48 = v18;
    uint64_t v22 = a3;
    uint64_t v23 = a4;
  }
  swift_beginAccess();
  if (*(void *)(*(void *)(a1 + 24) + 16))
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
    sub_237D653EC(&qword_268948BE8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    swift_bridgeObjectRetain();
    uint64_t v24 = v23;
    sub_237D75260();
    if (v4) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = v23;
  }
  swift_beginAccess();
  uint64_t v25 = v22;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    swift_bridgeObjectRetain();
    sub_237D75230();
    if (v4) {
      return swift_bridgeObjectRelease();
    }
    uint64_t v26 = (uint64_t)v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = (uint64_t)v12;
  }
  swift_beginAccess();
  if (*(double *)(a1 + 40) != 0.0)
  {
    uint64_t result = sub_237D75240();
    if (v4) {
      return result;
    }
  }
  swift_beginAccess();
  if (*(void *)(*(void *)(a1 + 48) + 16))
  {
    swift_bridgeObjectRetain();
    sub_237D75200();
    if (!v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    return swift_bridgeObjectRelease();
  }
LABEL_17:
  swift_beginAccess();
  uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 16);
  v47[2] = v24;
  if (v27)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
    sub_237D653EC(&qword_268948C00, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    swift_bridgeObjectRetain();
    sub_237D75260();
    if (v4) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v29 = v52;
  uint64_t v30 = a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
  swift_beginAccess();
  uint64_t v31 = v30;
  uint64_t v32 = v53;
  sub_237D62E4C(v31, v53);
  if (__swift_getEnumTagSinglePayload(v32, 1, v29) == 1)
  {
    sub_237D6A784(v32, &qword_268948AE0);
  }
  else
  {
    sub_237D62ED4(v32, v50);
    sub_237D653EC(&qword_268948C18, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    sub_237D75270();
    if (v4) {
      return sub_237D69F60();
    }
    sub_237D69F60();
  }
  uint64_t v33 = a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
  swift_beginAccess();
  uint64_t v34 = v33;
  uint64_t v35 = v51;
  sub_237D62E4C(v34, v51);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v35, 1, v29);
  v47[1] = v25;
  if (EnumTagSinglePayload == 1)
  {
    sub_237D6A784(v35, &qword_268948AE0);
  }
  else
  {
    sub_237D62ED4(v35, v49);
    sub_237D653EC(&qword_268948C18, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    sub_237D75270();
    uint64_t result = sub_237D69F60();
    if (v4) {
      return result;
    }
  }
  uint64_t v37 = a1
      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects;
  swift_beginAccess();
  if (!*(void *)(*(void *)v37 + 16)
    || (sub_237D69E58(), swift_bridgeObjectRetain(), sub_237D751F0(), uint64_t result = swift_bridgeObjectRelease(), !v4))
  {
    uint64_t v38 = a1
        + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays;
    swift_beginAccess();
    if (!*(void *)(*(void *)v38 + 16)
      || (swift_bridgeObjectRetain(), sub_237D75200(), uint64_t result = swift_bridgeObjectRelease(), !v4))
    {
      uint64_t v39 = a1
          + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
      swift_beginAccess();
      sub_237D62E4C(v39, v26);
      if (__swift_getEnumTagSinglePayload(v26, 1, v29) == 1)
      {
        sub_237D6A784(v26, &qword_268948AE0);
      }
      else
      {
        sub_237D62ED4(v26, (uint64_t)v48);
        sub_237D653EC(&qword_268948C18, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
        sub_237D75270();
        uint64_t result = sub_237D69F60();
        if (v4) {
          return result;
        }
      }
      uint64_t v40 = (uint64_t *)(a1
                      + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
      swift_beginAccess();
      uint64_t v41 = *v40;
      unint64_t v42 = v40[1];
      uint64_t v43 = HIBYTE(v42) & 0xF;
      if ((v42 & 0x2000000000000000) == 0) {
        uint64_t v43 = v41 & 0xFFFFFFFFFFFFLL;
      }
      if (!v43 || (swift_bridgeObjectRetain(), sub_237D75250(), uint64_t result = swift_bridgeObjectRelease(), !v5))
      {
        uint64_t v44 = a1
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues;
        swift_beginAccess();
        if (!*(void *)(*(void *)v44 + 16)
          || (swift_bridgeObjectRetain(), sub_237D75200(), uint64_t result = swift_bridgeObjectRelease(), !v5))
        {
          uint64_t v45 = a1
              + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues;
          swift_beginAccess();
          if (!*(void *)(*(void *)v45 + 16)
            || (swift_bridgeObjectRetain(), sub_237D75200(), uint64_t result = swift_bridgeObjectRelease(), !v5))
          {
            uint64_t v46 = a1
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues;
            uint64_t result = swift_beginAccess();
            if (*(void *)(*(void *)v46 + 16))
            {
              swift_bridgeObjectRetain();
              sub_237D75200();
              return swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t static _ProtoStrokeAnimationRepresentation.== infix(_:_:)()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_33();
  uint64_t v9 = *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20);
  uint64_t v10 = *(void *)(v4 + v9);
  uint64_t v11 = *(void *)(v3 + v9);
  if (v10 == v11
    || (swift_retain(), swift_retain(), BOOL v12 = sub_237D645F0(v10, v11), swift_release(), swift_release(), v12))
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v13(v2, v4, v1);
    v13(v0, v3, v1);
    sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
    char v14 = OUTLINED_FUNCTION_23();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v15(v0, v1);
    v15(v2, v1);
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

BOOL sub_237D645F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v86 = (uint64_t)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948CD0);
  uint64_t v6 = MEMORY[0x270FA5388](v88);
  uint64_t v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v87 = (uint64_t)&v80 - v10;
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v80 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v83 = (uint64_t)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v84 = (uint64_t)&v80 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v85 = (uint64_t)&v80 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v80 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v80 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v80 - v26;
  swift_beginAccess();
  uint64_t v28 = *(void **)(a1 + 16);
  swift_beginAccess();
  if (sub_237D69FB4(v28, *(void **)(a2 + 16)))
  {
    v81 = v8;
    uint64_t v82 = v4;
    swift_beginAccess();
    uint64_t v29 = *(void *)(a1 + 24);
    swift_beginAccess();
    uint64_t v30 = *(void *)(a2 + 24);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v31 = sub_237D6A084(v29, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0) {
      goto LABEL_22;
    }
    swift_beginAccess();
    uint64_t v32 = *(void **)(a1 + 32);
    swift_beginAccess();
    if ((sub_237D69FB4(v32, *(void **)(a2 + 32)) & 1) == 0) {
      goto LABEL_22;
    }
    swift_beginAccess();
    double v33 = *(double *)(a1 + 40);
    swift_beginAccess();
    if (v33 != *(double *)(a2 + 40)) {
      goto LABEL_22;
    }
    swift_beginAccess();
    uint64_t v34 = *(void *)(a1 + 48);
    swift_beginAccess();
    if (!sub_237D67F40(v34, *(void *)(a2 + 48))) {
      goto LABEL_22;
    }
    swift_beginAccess();
    uint64_t v35 = *(void *)(a1 + 56);
    swift_beginAccess();
    uint64_t v36 = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v37 = sub_237D6A4E0(v35, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v38 = a1
        + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
    swift_beginAccess();
    sub_237D62E4C(v38, (uint64_t)v27);
    uint64_t v39 = a2
        + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
    swift_beginAccess();
    uint64_t v40 = (uint64_t)&v12[*(int *)(v88 + 48)];
    sub_237D62E4C((uint64_t)v27, (uint64_t)v12);
    sub_237D62E4C(v39, v40);
    uint64_t v41 = v82;
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v82) == 1)
    {
      sub_237D6A784((uint64_t)v27, &qword_268948AE0);
      if (__swift_getEnumTagSinglePayload(v40, 1, v41) == 1)
      {
        sub_237D6A784((uint64_t)v12, &qword_268948AE0);
        goto LABEL_15;
      }
    }
    else
    {
      sub_237D62E4C((uint64_t)v12, (uint64_t)v25);
      if (__swift_getEnumTagSinglePayload(v40, 1, v41) != 1)
      {
        sub_237D62ED4(v40, v86);
        static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)();
        char v45 = v44;
        sub_237D69F60();
        sub_237D6A784((uint64_t)v27, &qword_268948AE0);
        sub_237D69F60();
        uint64_t v41 = v82;
        sub_237D6A784((uint64_t)v12, &qword_268948AE0);
        if ((v45 & 1) == 0) {
          goto LABEL_22;
        }
LABEL_15:
        uint64_t v46 = a1
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
        swift_beginAccess();
        sub_237D62E4C(v46, (uint64_t)v22);
        uint64_t v47 = a2
            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
        swift_beginAccess();
        uint64_t v48 = v87;
        uint64_t v49 = v87 + *(int *)(v88 + 48);
        sub_237D62E4C((uint64_t)v22, v87);
        sub_237D62E4C(v47, v49);
        if (__swift_getEnumTagSinglePayload(v48, 1, v41) == 1)
        {
          sub_237D6A784((uint64_t)v22, &qword_268948AE0);
          if (__swift_getEnumTagSinglePayload(v49, 1, v41) == 1)
          {
            sub_237D6A784(v48, &qword_268948AE0);
LABEL_26:
            uint64_t v53 = (uint64_t *)(a1
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
            swift_beginAccess();
            uint64_t v54 = *v53;
            v55 = (uint64_t *)(a2
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
            swift_beginAccess();
            if ((sub_237D6A7D8(v54, *v55) & 1) == 0) {
              goto LABEL_22;
            }
            v56 = (uint64_t *)(a1
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
            swift_beginAccess();
            uint64_t v57 = *v56;
            v58 = (uint64_t *)(a2
                            + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays);
            swift_beginAccess();
            if (!sub_237D67F40(v57, *v58)) {
              goto LABEL_22;
            }
            uint64_t v59 = a1
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
            swift_beginAccess();
            uint64_t v60 = v84;
            sub_237D62E4C(v59, v84);
            uint64_t v61 = a2
                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
            swift_beginAccess();
            uint64_t v62 = (uint64_t)v81;
            uint64_t v63 = (uint64_t)&v81[*(int *)(v88 + 48)];
            sub_237D62E4C(v60, (uint64_t)v81);
            sub_237D62E4C(v61, v63);
            if (__swift_getEnumTagSinglePayload(v62, 1, v41) == 1)
            {
              sub_237D6A784(v60, &qword_268948AE0);
              if (__swift_getEnumTagSinglePayload(v63, 1, v41) == 1)
              {
                sub_237D6A784((uint64_t)v81, &qword_268948AE0);
LABEL_35:
                v66 = (uint64_t *)(a1
                                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
                swift_beginAccess();
                uint64_t v67 = *v66;
                uint64_t v68 = v66[1];
                v69 = (void *)(a2
                               + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
                swift_beginAccess();
                if (v67 != *v69 || v68 != v69[1])
                {
                  BOOL v42 = 0;
                  if ((sub_237D75750() & 1) == 0) {
                    goto LABEL_23;
                  }
                }
                v71 = (uint64_t *)(a1
                                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
                swift_beginAccess();
                uint64_t v72 = *v71;
                v73 = (uint64_t *)(a2
                                + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInValues);
                swift_beginAccess();
                if (sub_237D67F40(v72, *v73))
                {
                  v74 = (uint64_t *)(a1
                                  + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
                  swift_beginAccess();
                  uint64_t v75 = *v74;
                  v76 = (uint64_t *)(a2
                                  + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseOutValues);
                  swift_beginAccess();
                  if (sub_237D67F40(v75, *v76))
                  {
                    v77 = (uint64_t *)(a1
                                    + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
                    swift_beginAccess();
                    uint64_t v78 = *v77;
                    v79 = (uint64_t *)(a2
                                    + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__customEaseInOutValues);
                    swift_beginAccess();
                    BOOL v42 = sub_237D67F40(v78, *v79);
                    goto LABEL_23;
                  }
                }
LABEL_22:
                BOOL v42 = 0;
LABEL_23:
                swift_release();
                swift_release();
                return v42;
              }
            }
            else
            {
              sub_237D62E4C(v62, v83);
              if (__swift_getEnumTagSinglePayload(v63, 1, v41) != 1)
              {
                sub_237D62ED4(v63, v86);
                static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)();
                char v65 = v64;
                sub_237D69F60();
                sub_237D6A784(v60, &qword_268948AE0);
                sub_237D69F60();
                sub_237D6A784(v62, &qword_268948AE0);
                if ((v65 & 1) == 0) {
                  goto LABEL_22;
                }
                goto LABEL_35;
              }
              sub_237D6A784(v60, &qword_268948AE0);
              sub_237D69F60();
            }
            uint64_t v43 = (uint64_t)v81;
LABEL_21:
            sub_237D6A784(v43, &qword_268948CD0);
            goto LABEL_22;
          }
        }
        else
        {
          sub_237D62E4C(v48, v85);
          if (__swift_getEnumTagSinglePayload(v49, 1, v41) != 1)
          {
            sub_237D62ED4(v49, v86);
            static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)();
            char v52 = v51;
            sub_237D69F60();
            sub_237D6A784((uint64_t)v22, &qword_268948AE0);
            sub_237D69F60();
            sub_237D6A784(v48, &qword_268948AE0);
            if ((v52 & 1) == 0) {
              goto LABEL_22;
            }
            goto LABEL_26;
          }
          sub_237D6A784((uint64_t)v22, &qword_268948AE0);
          sub_237D69F60();
        }
        uint64_t v43 = v48;
        goto LABEL_21;
      }
      sub_237D6A784((uint64_t)v27, &qword_268948AE0);
      sub_237D69F60();
    }
    uint64_t v43 = (uint64_t)v12;
    goto LABEL_21;
  }
  return 0;
}

uint64_t _ProtoStrokeAnimationRepresentation.hashValue.getter()
{
  return sub_237D67478((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation, &qword_268948B38, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
}

unint64_t sub_237D6511C()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_237D6513C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_237D750B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_237D651A4(uint64_t a1)
{
  uint64_t v3 = sub_237D750B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*sub_237D6520C())()
{
  return nullsub_16;
}

uint64_t sub_237D65230()
{
  return _ProtoStrokeAnimationRepresentation.decodeMessage<A>(decoder:)();
}

uint64_t sub_237D65248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _ProtoStrokeAnimationRepresentation.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_237D65264(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237D653EC(&qword_268948CB0, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_237D652E4(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D652FC()
{
  sub_237D653EC((unint64_t *)&qword_268948F90, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
  return sub_237D751D0();
}

uint64_t sub_237D6536C()
{
  sub_237D653EC((unint64_t *)&qword_268948F90, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
  return sub_237D751E0();
}

uint64_t sub_237D653EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237D65438()
{
  uint64_t v0 = sub_237D752A0();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CC0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268948CC8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_237D76200;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "DEFAULT";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_237D75280();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "PLAIN";
  *(void *)(v10 + 8) = 5;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  BOOL v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 2;
  *(void *)BOOL v12 = "EASEIN";
  *((void *)v12 + 1) = 6;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 3;
  *(void *)uint64_t v14 = "EASEOUT";
  *((void *)v14 + 1) = 7;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 4;
  *(void *)uint64_t v16 = "EASEINOUT";
  *((void *)v16 + 1) = 9;
  v16[16] = 2;
  v9();
  return sub_237D75290();
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948930, (uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap, a1);
}

uint64_t sub_237D656F0(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationEffect._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D65708(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_237D752A0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_18();
  return v4(v3);
}

uint64_t sub_237D6576C(uint64_t a1)
{
  return sub_237D66CB4(a1, 0x746E696F502ELL, 0xE600000000000000, static _ProtoStrokeAnimationRepresentation.Point.protoMessageName, &static _ProtoStrokeAnimationRepresentation.Point.protoMessageName[1]);
}

void *_ProtoStrokeAnimationRepresentation.Point.protoMessageName.unsafeMutableAddressor()
{
  if (qword_268948938 != -1) {
    swift_once();
  }
  return static _ProtoStrokeAnimationRepresentation.Point.protoMessageName;
}

uint64_t static _ProtoStrokeAnimationRepresentation.Point.protoMessageName.getter()
{
  return sub_237D66D94((uint64_t)&qword_268948938, static _ProtoStrokeAnimationRepresentation.Point.protoMessageName);
}

uint64_t sub_237D65800()
{
  uint64_t v0 = sub_237D752A0();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CC0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268948CC8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_237D76210;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "x";
  *(void *)(v6 + 8) = 1;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_237D75280();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "y";
  *((void *)v10 + 1) = 1;
  v10[16] = 2;
  v9();
  return sub_237D75290();
}

uint64_t _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948940, (uint64_t)static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.decodeMessage<A>(decoder:)()
{
  uint64_t result = OUTLINED_FUNCTION_39();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1)
      {
        OUTLINED_FUNCTION_42();
        sub_237D75140();
      }
      uint64_t result = sub_237D75110();
    }
  }
  return result;
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_25();
  if (*v0 == 0.0 || (uint64_t result = OUTLINED_FUNCTION_59(1), !v1))
  {
    if (*(float *)(v2 + 4) == 0.0 || (uint64_t result = OUTLINED_FUNCTION_59(2), !v1))
    {
      type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
      return OUTLINED_FUNCTION_26();
    }
  }
  return result;
}

void static _ProtoStrokeAnimationRepresentation.Point.== infix(_:_:)()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_33();
  if (*v1 == *v0 && v1[1] == v0[1])
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
    unint64_t v6 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_20();
    v6();
    OUTLINED_FUNCTION_20();
    v6();
    sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_23();
    uint64_t v7 = *(void (**)(void))(v3 + 8);
    OUTLINED_FUNCTION_40();
    v7();
    OUTLINED_FUNCTION_40();
    v7();
  }
  OUTLINED_FUNCTION_14();
}

uint64_t _ProtoStrokeAnimationRepresentation.Point.hashValue.getter()
{
  return sub_237D67478((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point, &qword_268948B40, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
}

uint64_t sub_237D65C80(uint64_t a1, uint64_t a2)
{
  return sub_237D67528(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Point.protoMessageName.unsafeMutableAddressor, static _ProtoStrokeAnimationRepresentation.Point.protoMessageName);
}

uint64_t sub_237D65CA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_237D750B0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_237D65D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_237D750B0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_237D65D88())()
{
  return nullsub_17;
}

uint64_t sub_237D65DB0()
{
  return _ProtoStrokeAnimationRepresentation.Point.decodeMessage<A>(decoder:)();
}

uint64_t sub_237D65DC8()
{
  return _ProtoStrokeAnimationRepresentation.Point.traverse<A>(visitor:)();
}

uint64_t sub_237D65DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237D653EC(&qword_268948CA8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_237D65E64(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Point._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D65E7C()
{
  sub_237D653EC(&qword_268948B48, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
  return sub_237D751D0();
}

uint64_t sub_237D65EEC()
{
  sub_237D653EC(&qword_268948B48, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
  return sub_237D751E0();
}

uint64_t sub_237D65F70(uint64_t a1)
{
  return sub_237D66CB4(a1, 0xD000000000000010, 0x8000000237D77280, static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName, &static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName[1]);
}

void *_ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName.unsafeMutableAddressor()
{
  if (qword_268948948 != -1) {
    swift_once();
  }
  return static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName;
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName.getter()
{
  return sub_237D66D94((uint64_t)&qword_268948948, static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName);
}

uint64_t sub_237D6600C(uint64_t a1)
{
  return sub_237D665A0(a1, static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap, (uint64_t)"points", 6);
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948950, (uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_38(a1, a2);
  while (1)
  {
    uint64_t result = sub_237D75110();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 1)
    {
      OUTLINED_FUNCTION_51();
      sub_237D660C8();
    }
  }
  return result;
}

uint64_t sub_237D660C8()
{
  return sub_237D75190();
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0),
        sub_237D653EC(&qword_268948B48, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point), uint64_t result = sub_237D75260(), !v1))
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
    return sub_237D75090();
  }
  return result;
}

void static _ProtoStrokeAnimationRepresentation.AnimationPoints.== infix(_:_:)()
{
}

uint64_t _ProtoStrokeAnimationRepresentation.AnimationPoints.hashValue.getter()
{
  return sub_237D67478((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints, &qword_268948B50, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t sub_237D662CC(uint64_t a1, uint64_t a2)
{
  return sub_237D67528(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName.unsafeMutableAddressor, static _ProtoStrokeAnimationRepresentation.AnimationPoints.protoMessageName);
}

uint64_t (*sub_237D662FC())()
{
  return nullsub_18;
}

uint64_t sub_237D66324(uint64_t a1, uint64_t a2)
{
  return _ProtoStrokeAnimationRepresentation.AnimationPoints.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_237D6633C()
{
  return _ProtoStrokeAnimationRepresentation.AnimationPoints.traverse<A>(visitor:)();
}

uint64_t sub_237D66358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237D653EC(&qword_268948CA0, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_237D663D8(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.AnimationPoints._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D663F0()
{
  sub_237D653EC(&qword_268948BE8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  return sub_237D751D0();
}

uint64_t sub_237D66460()
{
  sub_237D653EC(&qword_268948BE8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
  return sub_237D751E0();
}

uint64_t sub_237D664E4(uint64_t a1)
{
  return sub_237D66CB4(a1, 0x4B656B6F7274532ELL, 0xEF73656D69547965, static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName, &static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName[1]);
}

void *_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName.unsafeMutableAddressor()
{
  if (qword_268948958 != -1) {
    swift_once();
  }
  return static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName;
}

uint64_t static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName.getter()
{
  return sub_237D66D94((uint64_t)&qword_268948958, static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName);
}

uint64_t sub_237D66588(uint64_t a1)
{
  return sub_237D665A0(a1, static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap, (uint64_t)"value", 5);
}

uint64_t sub_237D665A0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_237D752A0();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CC0);
  uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268948CC8) - 8);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_237D76220;
  unint64_t v11 = v10 + v9 + v8[14];
  *(void *)(v10 + v9) = 1;
  *(void *)unint64_t v11 = a3;
  *(void *)(v11 + 8) = a4;
  *(unsigned char *)(v11 + 16) = 2;
  uint64_t v12 = *MEMORY[0x263F50718];
  sub_237D75280();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(unint64_t, uint64_t))(v13 + 104))(v11, v12);
  return sub_237D75290();
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948960, (uint64_t)static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_38(a1, a2);
  while (1)
  {
    uint64_t result = sub_237D75110();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_237D75150();
    }
  }
  return result;
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_25();
  if (!*(void *)(*(void *)v1 + 16) || (OUTLINED_FUNCTION_51(), uint64_t result = sub_237D75200(), !v0))
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
    return OUTLINED_FUNCTION_26();
  }
  return result;
}

void static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.== infix(_:_:)()
{
}

void sub_237D66834()
{
  OUTLINED_FUNCTION_15();
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_2_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_33();
  if (v8(*v4, *v3))
  {
    v6(0);
    uint64_t v13 = *(void (**)(void))(v10 + 16);
    OUTLINED_FUNCTION_20();
    v13();
    OUTLINED_FUNCTION_20();
    v13();
    sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
    OUTLINED_FUNCTION_23();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v14(v0, v1);
    v14(v2, v1);
  }
  OUTLINED_FUNCTION_14();
}

uint64_t _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.hashValue.getter()
{
  return sub_237D67478((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes, &qword_268948B58, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_237D669CC(uint64_t a1, uint64_t a2)
{
  return sub_237D67528(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName.unsafeMutableAddressor, static _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.protoMessageName);
}

uint64_t sub_237D669F8()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_18();
  return v1(v0);
}

uint64_t sub_237D66A54()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_28();
  return v1(v0);
}

uint64_t (*sub_237D66AAC())()
{
  return nullsub_19;
}

uint64_t sub_237D66AD4(uint64_t a1, uint64_t a2)
{
  return _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_237D66AEC()
{
  return _ProtoStrokeAnimationRepresentation.StrokeKeyTimes.traverse<A>(visitor:)();
}

uint64_t sub_237D66B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237D653EC(&qword_268948C98, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_237D66B88(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.StrokeKeyTimes._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D66BA0()
{
  sub_237D653EC(&qword_268948C00, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  return sub_237D751D0();
}

uint64_t sub_237D66C10()
{
  sub_237D653EC(&qword_268948C00, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
  return sub_237D751E0();
}

uint64_t sub_237D66C94(uint64_t a1)
{
  return sub_237D66CB4(a1, 0x726F6C6F432ELL, 0xE600000000000000, static _ProtoStrokeAnimationRepresentation.Color.protoMessageName, &static _ProtoStrokeAnimationRepresentation.Color.protoMessageName[1]);
}

uint64_t sub_237D66CB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = sub_237D75400();
  *a4 = 0xD00000000000002DLL;
  *a5 = 0x8000000237D77040;
  return result;
}

void *_ProtoStrokeAnimationRepresentation.Color.protoMessageName.unsafeMutableAddressor()
{
  if (qword_268948968 != -1) {
    swift_once();
  }
  return static _ProtoStrokeAnimationRepresentation.Color.protoMessageName;
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color.protoMessageName.getter()
{
  return sub_237D66D94((uint64_t)&qword_268948968, static _ProtoStrokeAnimationRepresentation.Color.protoMessageName);
}

uint64_t sub_237D66D94(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_53();
  if (!v3) {
    swift_once();
  }
  uint64_t v4 = *a2;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_237D66DE4()
{
  uint64_t v0 = sub_237D752A0();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CC0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268948CC8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_237D76230;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "rgb";
  *(void *)(v6 + 8) = 3;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_237D75280();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "alpha";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "name";
  *((void *)v12 + 1) = 4;
  v12[16] = 2;
  v9();
  return sub_237D75290();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948970, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap);
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap, a1);
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.decodeMessage<A>(decoder:)()
{
  uint64_t result = OUTLINED_FUNCTION_39();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          OUTLINED_FUNCTION_51();
          sub_237D670C8();
          break;
        case 2:
          OUTLINED_FUNCTION_42();
          sub_237D75170();
          break;
        case 1:
          OUTLINED_FUNCTION_42();
          sub_237D75180();
          break;
      }
      uint64_t result = sub_237D75110();
    }
  }
  return result;
}

uint64_t sub_237D670C8()
{
  return sub_237D75130();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_25();
  unint64_t v3 = v1[1];
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = *v1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4 || (uint64_t result = sub_237D75250(), !v0))
  {
    if (*(double *)(v2 + 16) == 0.0 || (OUTLINED_FUNCTION_42(), uint64_t result = sub_237D75240(), !v0))
    {
      if (!*(void *)(v2 + 24) || (sub_237D67FB4(), uint64_t result = sub_237D75210(), !v0))
      {
        type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
        return OUTLINED_FUNCTION_26();
      }
    }
  }
  return result;
}

void static _ProtoStrokeAnimationRepresentation.Color.== infix(_:_:)()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_11();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_33();
  BOOL v8 = *(void *)v3 == *(void *)v2 && *(void *)(v3 + 8) == *(void *)(v2 + 8);
  if (v8 || (sub_237D75750()) && *(double *)(v3 + 16) == *(double *)(v2 + 16))
  {
    uint64_t v9 = *(void *)(v3 + 24);
    uint64_t v10 = *(void *)(v2 + 24);
    if (*(unsigned char *)(v2 + 32) == 1)
    {
      switch(v10)
      {
        case 1:
          if (v9 == 1) {
            goto LABEL_12;
          }
          break;
        case 2:
          if (v9 == 2) {
            goto LABEL_12;
          }
          break;
        case 3:
          if (v9 == 3) {
            goto LABEL_12;
          }
          break;
        case 4:
          if (v9 == 4) {
            goto LABEL_12;
          }
          break;
        case 5:
          if (v9 == 5) {
            goto LABEL_12;
          }
          break;
        case 6:
          if (v9 == 6) {
            goto LABEL_12;
          }
          break;
        case 7:
          if (v9 == 7) {
            goto LABEL_12;
          }
          break;
        default:
          if (!v9) {
            goto LABEL_12;
          }
          break;
      }
    }
    else if (v9 == v10)
    {
LABEL_12:
      type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
      uint64_t v11 = *(void (**)(void))(v5 + 16);
      OUTLINED_FUNCTION_20();
      v11();
      OUTLINED_FUNCTION_20();
      v11();
      sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
      OUTLINED_FUNCTION_23();
      uint64_t v12 = *(void (**)(void))(v5 + 8);
      OUTLINED_FUNCTION_40();
      v12();
      ((void (*)(uint64_t, uint64_t))v12)(v1, v0);
    }
  }
  OUTLINED_FUNCTION_14();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.hashValue.getter()
{
  return sub_237D67478((void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color, &qword_268948B68, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t sub_237D67478(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_237D75770();
}

uint64_t sub_237D67504(uint64_t a1, uint64_t a2)
{
  return sub_237D67528(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Color.protoMessageName.unsafeMutableAddressor, static _ProtoStrokeAnimationRepresentation.Color.protoMessageName);
}

uint64_t sub_237D67528(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t *a4)
{
  a3();
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_237D67570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_237D750B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_237D675E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = sub_237D750B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_237D67650())()
{
  return nullsub_20;
}

uint64_t sub_237D67678()
{
  return _ProtoStrokeAnimationRepresentation.Color.decodeMessage<A>(decoder:)();
}

uint64_t sub_237D67690()
{
  return _ProtoStrokeAnimationRepresentation.Color.traverse<A>(visitor:)();
}

uint64_t sub_237D676AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237D653EC(&qword_268948C90, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_237D6772C(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Color._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D67744()
{
  sub_237D653EC(&qword_268948C18, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
  return sub_237D751D0();
}

uint64_t sub_237D677B4()
{
  sub_237D653EC(&qword_268948C18, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
  return sub_237D751E0();
}

uint64_t sub_237D67834()
{
  return sub_237D75770();
}

uint64_t sub_237D6788C()
{
  uint64_t v0 = sub_237D752A0();
  __swift_allocate_value_buffer(v0, static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CC0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268948CC8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_237D76240;
  unint64_t v4 = v23 + v3;
  unint64_t v5 = v23 + v3 + v1[14];
  *(void *)(v23 + v3) = 0;
  *(void *)unint64_t v5 = "DEFAULT";
  *(void *)(v5 + 8) = 7;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_237D75280();
  BOOL v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "CLEAR";
  *(void *)(v9 + 8) = 5;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 2;
  *(void *)uint64_t v11 = "BLACK";
  *((void *)v11 + 1) = 5;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 3;
  *(void *)uint64_t v13 = "WHITE";
  *((void *)v13 + 1) = 5;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 4;
  *(void *)uint64_t v15 = "GRAY";
  *((void *)v15 + 1) = 4;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)uint64_t v17 = "RED";
  *((void *)v17 + 1) = 3;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 6;
  *(void *)uint64_t v19 = "GREEN";
  *((void *)v19 + 1) = 5;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  *uint64_t v20 = 7;
  *(void *)uint64_t v21 = "BLUE";
  *((void *)v21 + 1) = 4;
  v21[16] = 2;
  v8();
  return sub_237D75290();
}

uint64_t _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_237D67BC8((uint64_t)&unk_268948978, (uint64_t)static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap);
}

uint64_t sub_237D67BC8(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_53();
  if (!v3) {
    swift_once();
  }
  uint64_t v4 = sub_237D752A0();
  return __swift_project_value_buffer(v4, a2);
}

uint64_t static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_237D67C3C((uint64_t)static _ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap, a1);
}

uint64_t sub_237D67C3C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_53();
  if (!v4) {
    swift_once();
  }
  uint64_t v5 = sub_237D752A0();
  uint64_t v6 = __swift_project_value_buffer(v5, a1);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a2, v6, v5);
}

uint64_t sub_237D67CD0(uint64_t a1, uint64_t a2)
{
  return sub_237D65708(a1, a2, (void (*)(void))_ProtoStrokeAnimationRepresentation.Color.Name._protobuf_nameMap.unsafeMutableAddressor);
}

uint64_t sub_237D67CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (float *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (float *)((char *)&v18 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_15:
    char v14 = 0;
    return v14 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v19 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_237D69F08(a1 + v12, (uint64_t)v10, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      sub_237D69F08(a2 + v12, (uint64_t)v7, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
      if (*v10 != *v7 || v10[1] != v7[1]) {
        break;
      }
      sub_237D750B0();
      sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
      char v14 = sub_237D75390();
      sub_237D69F60();
      sub_237D69F60();
      BOOL v16 = v13-- != 0;
      if (v14)
      {
        v12 += v19;
        if (v16) {
          continue;
        }
      }
      return v14 & 1;
    }
    sub_237D69F60();
    sub_237D69F60();
    goto LABEL_15;
  }
  char v14 = 1;
  return v14 & 1;
}

BOOL sub_237D67F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (double *)(a1 + 40);
  uint64_t v6 = (double *)(a2 + 40);
  do
  {
    double v7 = *v5++;
    double v8 = v7;
    double v9 = *v6++;
    double v10 = v9;
    BOOL v12 = v4-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

unint64_t sub_237D67FB4()
{
  unint64_t result = qword_268948B60;
  if (!qword_268948B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B60);
  }
  return result;
}

unint64_t sub_237D68004()
{
  unint64_t result = qword_268948B70;
  if (!qword_268948B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B70);
  }
  return result;
}

unint64_t sub_237D68054()
{
  unint64_t result = qword_268948B78;
  if (!qword_268948B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B78);
  }
  return result;
}

unint64_t sub_237D680A4()
{
  unint64_t result = qword_268948B80;
  if (!qword_268948B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B80);
  }
  return result;
}

unint64_t sub_237D680F4()
{
  unint64_t result = qword_268948B88;
  if (!qword_268948B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B88);
  }
  return result;
}

unint64_t sub_237D68144()
{
  unint64_t result = qword_268948B90;
  if (!qword_268948B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B90);
  }
  return result;
}

unint64_t sub_237D68194()
{
  unint64_t result = qword_268948B98;
  if (!qword_268948B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948B98);
  }
  return result;
}

uint64_t sub_237D681E0()
{
  return sub_237D68230(&qword_268948BA0, &qword_268948BA8);
}

uint64_t sub_237D68208()
{
  return sub_237D68230(&qword_268948BB0, &qword_268948BB8);
}

uint64_t sub_237D68230(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_237D68280()
{
  return sub_237D653EC(&qword_268948BC0, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
}

uint64_t sub_237D682C8()
{
  return sub_237D653EC((unint64_t *)&qword_268948F90, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
}

uint64_t sub_237D68310()
{
  return sub_237D653EC(&qword_268948B38, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
}

uint64_t sub_237D68358()
{
  return sub_237D653EC(&qword_268948BC8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
}

uint64_t sub_237D683A0()
{
  return sub_237D653EC(&qword_268948BD0, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
}

uint64_t sub_237D683E8()
{
  return sub_237D653EC(&qword_268948B48, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
}

uint64_t sub_237D68430()
{
  return sub_237D653EC(&qword_268948B40, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
}

uint64_t sub_237D68478()
{
  return sub_237D653EC(&qword_268948BD8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
}

uint64_t sub_237D684C0()
{
  return sub_237D653EC(&qword_268948BE0, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t sub_237D68508()
{
  return sub_237D653EC(&qword_268948BE8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t sub_237D68550()
{
  return sub_237D653EC(&qword_268948B50, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t sub_237D68598()
{
  return sub_237D653EC(&qword_268948BF0, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
}

uint64_t sub_237D685E0()
{
  return sub_237D653EC(&qword_268948BF8, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_237D68628()
{
  return sub_237D653EC(&qword_268948C00, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_237D68670()
{
  return sub_237D653EC(&qword_268948B58, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_237D686B8()
{
  return sub_237D653EC(&qword_268948C08, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
}

uint64_t sub_237D68700()
{
  return sub_237D653EC(&qword_268948C10, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t sub_237D68748()
{
  return sub_237D653EC(&qword_268948C18, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t sub_237D68790()
{
  return sub_237D653EC(&qword_268948B68, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t sub_237D687D8()
{
  return sub_237D653EC(&qword_268948C20, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
}

uint64_t *initializeBufferWithCopyOfBuffer for _ProtoStrokeAnimationRepresentation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_237D750B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for _ProtoStrokeAnimationRepresentation(uint64_t a1)
{
  uint64_t v2 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237D68B80);
}

uint64_t sub_237D68B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_237D750B0();
  OUTLINED_FUNCTION_10();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return OUTLINED_FUNCTION_30(*(void *)(a1 + *(int *)(a3 + 20)));
  }
  return __swift_getEnumTagSinglePayload(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237D68C18);
}

void sub_237D68C18(uint64_t a1, int a2, int a3, uint64_t a4)
{
  sub_237D750B0();
  OUTLINED_FUNCTION_10();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_58();
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t sub_237D68C98()
{
  uint64_t result = sub_237D750B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationEffect(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationEffect(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_237D68D94(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_237D68DB4(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationEffect()
{
  return &type metadata for _ProtoStrokeAnimationRepresentation.AnimationEffect;
}

uint64_t *initializeBufferWithCopyOfBuffer for _ProtoStrokeAnimationRepresentation.Point(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_237D750B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for _ProtoStrokeAnimationRepresentation.Point(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = sub_237D750B0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *initializeWithCopy for _ProtoStrokeAnimationRepresentation.Point(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_237D750B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for _ProtoStrokeAnimationRepresentation.Point(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_237D750B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *initializeWithTake for _ProtoStrokeAnimationRepresentation.Point(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_237D750B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for _ProtoStrokeAnimationRepresentation.Point(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_237D750B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Point(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237D69124);
}

uint64_t sub_237D69124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 24);
  uint64_t v5 = sub_237D750B0();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Point(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237D69184);
}

uint64_t sub_237D69184()
{
  sub_237D750B0();
  uint64_t v0 = OUTLINED_FUNCTION_58();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_237D691C8()
{
  uint64_t result = sub_237D750B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationPoints(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_17Tm);
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.AnimationPoints(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_18Tm);
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwCP_0()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10();
  int v1 = *(_DWORD *)(v0 + 80);
  *uint64_t v3 = *v2;
  if ((v1 & 0x20000) != 0)
  {
    swift_retain();
  }
  else
  {
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_1_1();
    uint64_t v5 = *(void (**)(uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    uint64_t v6 = OUTLINED_FUNCTION_41();
    v5(v6);
  }
  OUTLINED_FUNCTION_14();
}

uint64_t _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwxx_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_237D750B0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(v4, v5);
}

void _s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwcp_0()
{
  OUTLINED_FUNCTION_15();
  *int v1 = *v0;
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v4 = OUTLINED_FUNCTION_41();
  v3(v4);
  OUTLINED_FUNCTION_14();
}

void *_s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_44();
  v4(v3);
  return a1;
}

void *_s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwtk_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  sub_237D750B0();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(char *, char *))(v7 + 32))(v5, v6);
  return a1;
}

void *_s15StrokeAnimation35_ProtoStrokeAnimationRepresentationV15AnimationPointsVwta_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_44();
  v4(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237D695AC);
}

uint64_t __swift_get_extra_inhabitant_index_17Tm(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_30(*a1);
  }
  uint64_t v7 = sub_237D750B0();
  uint64_t v8 = (uint64_t)a1 + *(int *)(a3 + 20);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237D69640);
}

void __swift_store_extra_inhabitant_index_18Tm()
{
  OUTLINED_FUNCTION_63();
  if (v3)
  {
    *int v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_237D750B0();
    uint64_t v6 = (uint64_t)v1 + *(int *)(v4 + 20);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

uint64_t sub_237D696BC()
{
  uint64_t result = sub_237D750B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *char v3 = *a2;
    char v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v10 = sub_237D750B0();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_237D750B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237D750B0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_237D750B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237D69B68);
}

uint64_t sub_237D69B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_30(*(void *)(a1 + 8));
  }
  uint64_t v7 = sub_237D750B0();
  uint64_t v8 = a1 + *(int *)(a3 + 28);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for _ProtoStrokeAnimationRepresentation.Color(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237D69BF8);
}

void sub_237D69BF8()
{
  OUTLINED_FUNCTION_63();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_237D750B0();
    uint64_t v6 = v1 + *(int *)(v4 + 28);
    __swift_storeEnumTagSinglePayload(v6, v0, v0, v5);
  }
}

uint64_t sub_237D69C6C()
{
  uint64_t result = sub_237D750B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for _ProtoStrokeAnimationRepresentation.Color.Name()
{
  return &type metadata for _ProtoStrokeAnimationRepresentation.Color.Name;
}

uint64_t sub_237D69D30()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(0);
}

void sub_237D69D38()
{
  sub_237D69E00();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_237D69E00()
{
  if (!qword_268948C88)
  {
    type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(255);
    unint64_t v0 = sub_237D75630();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268948C88);
    }
  }
}

unint64_t sub_237D69E58()
{
  unint64_t result = qword_268948CB8;
  if (!qword_268948CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948CB8);
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

uint64_t sub_237D69F08(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = OUTLINED_FUNCTION_44();
  v5(v4);
  return a2;
}

uint64_t sub_237D69F60()
{
  uint64_t v1 = OUTLINED_FUNCTION_57();
  v2(v1);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t))(v3 + 8))(v0);
  return v0;
}

uint64_t sub_237D69FB4(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = sub_237D75750();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v8 = a1 + 7;
  uint64_t v9 = a2 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      uint64_t result = sub_237D75750();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_237D6A084(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Point(0);
  uint64_t v4 = *(void *)(v39 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v39);
  char v7 = (float *)((char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (float *)((char *)&v30 - v8);
  uint64_t v10 = type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  BOOL v16 = (char *)&v30 - v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (v17 != *(void *)(a2 + 16))
  {
LABEL_19:
    char v28 = 0;
    return v28 & 1;
  }
  if (v17 && a1 != a2)
  {
    uint64_t v30 = v4;
    uint64_t v31 = v17;
    uint64_t v18 = 0;
    unint64_t v19 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v34 = a2 + v19;
    uint64_t v35 = a1 + v19;
    uint64_t v20 = *(void *)(v14 + 72);
    uint64_t v32 = v10;
    uint64_t v33 = v20;
    uint64_t v36 = (char *)&v30 - v15;
    char v37 = v13;
    while (1)
    {
      uint64_t v38 = v18;
      uint64_t v21 = v33 * v18;
      sub_237D69F08(v35 + v33 * v18, (uint64_t)v16, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
      sub_237D69F08(v34 + v21, (uint64_t)v13, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
      uint64_t v22 = *(void *)v16;
      uint64_t v23 = *(void *)v13;
      uint64_t v24 = *(void *)(*(void *)v16 + 16);
      if (v24 != *(void *)(*(void *)v13 + 16)) {
        break;
      }
      if (v24 && v22 != v23)
      {
        unint64_t v25 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
        uint64_t v26 = *(void *)(v30 + 72);
        while (1)
        {
          sub_237D69F08(v22 + v25, (uint64_t)v9, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          sub_237D69F08(v23 + v25, (uint64_t)v7, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Point);
          if (*v9 != *v7 || v9[1] != v7[1]) {
            break;
          }
          sub_237D750B0();
          sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
          char v27 = sub_237D75390();
          sub_237D69F60();
          sub_237D69F60();
          if ((v27 & 1) == 0) {
            goto LABEL_18;
          }
          v25 += v26;
          if (!--v24) {
            goto LABEL_13;
          }
        }
        sub_237D69F60();
        sub_237D69F60();
        break;
      }
LABEL_13:
      BOOL v16 = v36;
      uint64_t v13 = v37;
      sub_237D750B0();
      sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
      char v28 = sub_237D75390();
      sub_237D69F60();
      sub_237D69F60();
      if (v28)
      {
        uint64_t v18 = v38 + 1;
        if (v38 + 1 != v31) {
          continue;
        }
      }
      return v28 & 1;
    }
LABEL_18:
    sub_237D69F60();
    sub_237D69F60();
    goto LABEL_19;
  }
  char v28 = 1;
  return v28 & 1;
}

uint64_t sub_237D6A4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_20:
    char v23 = 0;
    return v23 & 1;
  }
  if (v11 && a1 != a2)
  {
    uint64_t v12 = 0;
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v26 = a1 + v13;
    uint64_t v14 = a2 + v13;
    uint64_t v15 = *(void *)(v8 + 72);
    while (1)
    {
      sub_237D69F08(v26 + v15 * v12, (uint64_t)v10, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
      sub_237D69F08(v14 + v15 * v12, (uint64_t)v7, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
      uint64_t v16 = *(void *)v10;
      uint64_t v17 = *(void *)v7;
      uint64_t v18 = *(void *)(*(void *)v10 + 16);
      if (v18 != *(void *)(*(void *)v7 + 16)) {
        break;
      }
      if (v18) {
        BOOL v19 = v16 == v17;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19)
      {
        if (*(double *)(v16 + 32) != *(double *)(v17 + 32)) {
          break;
        }
        uint64_t v20 = v18 - 1;
        if (v20)
        {
          uint64_t v21 = (double *)(v16 + 40);
          uint64_t v22 = (double *)(v17 + 40);
          while (*v21 == *v22)
          {
            ++v21;
            ++v22;
            if (!--v20) {
              goto LABEL_15;
            }
          }
          break;
        }
      }
LABEL_15:
      sub_237D750B0();
      sub_237D653EC(&qword_268948B30, MEMORY[0x263F50560]);
      char v23 = sub_237D75390();
      sub_237D69F60();
      sub_237D69F60();
      if ((v23 & 1) != 0 && ++v12 != v11) {
        continue;
      }
      return v23 & 1;
    }
    sub_237D69F60();
    sub_237D69F60();
    goto LABEL_20;
  }
  char v23 = 1;
  return v23 & 1;
}

uint64_t sub_237D6A784(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_237D6A7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 32);
    for (uint64_t i = (unsigned char *)(a2 + 40); ; i += 16)
    {
      uint64_t v6 = *v3;
      v3 += 2;
      uint64_t v5 = v6;
      uint64_t v7 = *((void *)i - 1);
      if (*i == 1)
      {
        switch(v7)
        {
          case 1:
            if (v5 != 1) {
              return 0;
            }
            goto LABEL_10;
          case 2:
            if (v5 != 2) {
              return 0;
            }
            goto LABEL_10;
          case 3:
            if (v5 != 3) {
              return 0;
            }
            goto LABEL_10;
          case 4:
            if (v5 != 4) {
              return 0;
            }
            goto LABEL_10;
          default:
            if (v5) {
              return 0;
            }
            goto LABEL_10;
        }
      }
      if (v5 != v7) {
        break;
      }
LABEL_10:
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation._StorageClass(0);
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  *uint64_t v1 = a1;
  *(void *)(a1 + 80) = v2;
  uint64_t result = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(result + 20);
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  *uint64_t v1 = a1;
  *(void *)(a1 + 80) = v2;
  uint64_t result = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(result + 20);
  return result;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0xE000000000000000;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = v0;
  return _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

void *OUTLINED_FUNCTION_19()
{
  return malloc(0x60uLL);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_237D750B0();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_237D75390();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_237D75090();
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1)
{
  *(void *)(v1 + v2) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_30@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_32(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_237D750B0();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_237D75110();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_43(uint64_t result)
{
  *uint64_t v1 = result;
  *(void *)(result + 24) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45()
{
  uint64_t result = *v0;
  *(void *)(v1 + 72) = *v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_47(uint64_t a1)
{
  *(void *)(v1 + v2) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_49()
{
  type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_52(uint64_t result, __int16 a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2;
  *(unsigned char *)(v2 + 9) = HIBYTE(a2) & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_237D75380();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1)
{
  return MEMORY[0x270F44D90](a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_237D750B0();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return 0;
}

id sub_237D6AF28(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  sub_237D735C4(a1, a2, v4);
  objc_msgSend(v4, sel_setTextAlignment_, 1);
  id v5 = objc_msgSend(self, sel_systemFontOfSize_, 22.0);
  objc_msgSend(v4, sel_setFont_, v5);

  return v4;
}

id StrokeData.__allocating_init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)()
{
  OUTLINED_FUNCTION_0_2();
  id v1 = objc_allocWithZone(v0);
  return StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

id StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)()
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = OBJC_IVAR___SAStrokeDataInternal_characters;
  *(void *)&v1[OBJC_IVAR___SAStrokeDataInternal_characters] = 0;
  uint64_t v6 = OBJC_IVAR___SAStrokeDataInternal_strokeNames;
  *(void *)&v1[OBJC_IVAR___SAStrokeDataInternal_strokeNames] = 0;
  uint64_t v7 = OBJC_IVAR___SAStrokeDataInternal_pronunciations;
  *(void *)&v1[OBJC_IVAR___SAStrokeDataInternal_pronunciations] = 0;
  *(void *)&v1[v5] = v8;
  uint64_t v9 = v1;
  swift_bridgeObjectRelease();
  uint64_t v10 = &v9[OBJC_IVAR___SAStrokeDataInternal_strokeAnimationRepresention];
  *(void *)uint64_t v10 = v4;
  *((void *)v10 + 1) = v3;
  *(void *)&v1[v6] = v2;
  swift_bridgeObjectRelease();
  *(void *)&v1[v7] = v0;

  swift_bridgeObjectRelease();
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for StrokeData();
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t type metadata accessor for StrokeData()
{
  return self;
}

uint64_t sub_237D6B1D8()
{
  strcpy((char *)v3, "character is:");
  HIWORD(v3[1]) = -4864;
  if (*(void *)(v0 + OBJC_IVAR___SAStrokeDataInternal_characters))
  {
    uint64_t v1 = swift_bridgeObjectRetain();
    MEMORY[0x237E2EFA0](v1, MEMORY[0x263F8D310]);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948CF8);
  sub_237D753C0();
  sub_237D75400();
  swift_bridgeObjectRelease();
  return v3[0];
}

id StrokeData.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void StrokeData.init()()
{
}

id StrokeData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StrokeData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t initializeBufferWithCopyOfBuffer for StrokeAnimatingExtraInfo(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StrokeAnimatingExtraInfo()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for StrokeAnimatingExtraInfo(void *a1, void *a2)
{
  *a1 = *a2;
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

void *assignWithTake for StrokeAnimatingExtraInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StrokeAnimatingExtraInfo(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for StrokeAnimatingExtraInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StrokeAnimatingExtraInfo()
{
  return &type metadata for StrokeAnimatingExtraInfo;
}

double sub_237D6B564(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + *(int *)(type metadata accessor for _ProtoStrokeAnimationRepresentation(0) + 20));
  uint64_t v6 = (uint64_t *)(v5
                 + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__compoundAnimationEffects);
  OUTLINED_FUNCTION_0_3();
  uint64_t v7 = *v6;
  if (*(void *)(*v6 + 16) <= a2
    || (uint64_t v8 = v5
           + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__animationDelays,
        OUTLINED_FUNCTION_0_3(),
        *(void *)(*(void *)v8 + 16) <= a2))
  {
    double v2 = -100.0;
  }
  else
  {
    if (a2 < 0)
    {
      __break(1u);
      JUMPOUT(0x237D6B718);
    }
    uint64_t v9 = v7 + 16 * a2;
    uint64_t v10 = *(void *)(v9 + 32);
    if (*(unsigned char *)(v9 + 40) == 1)
    {
      switch(v10)
      {
        case 2:
          OUTLINED_FUNCTION_1_2();
          goto LABEL_18;
        case 3:
          OUTLINED_FUNCTION_1_2();
          goto LABEL_18;
        case 4:
          OUTLINED_FUNCTION_1_2();
          goto LABEL_18;
        default:
          OUTLINED_FUNCTION_1_2();
          break;
      }
    }
    else
    {
      OUTLINED_FUNCTION_1_2();
      if (v10 == 4 || v10 == 3 || v10 == 2)
      {
LABEL_18:
        OUTLINED_FUNCTION_0_3();
        swift_bridgeObjectRetain();
      }
    }
  }
  sub_237D6B72C(a1);
  return v2;
}

uint64_t sub_237D6B72C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_beginAccess();
}

void sub_237D6B7B4()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v0, sel_userInterfaceIdiom);
}

double sub_237D6B828()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  double result = 200.0;
  if (!v1) {
    return 140.0;
  }
  return result;
}

id sub_237D6B89C()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v1;
  *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation20StrokeAnimatingLayer_strokePathData] = v1;
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for StrokeAnimatingLayer();
  swift_retain();
  id v3 = objc_msgSendSuper2(&v9, sel_init);
  sub_237D6C148(0x6E41656B6F727453, 0xEF6E6F6974616D69, v3);
  OUTLINED_FUNCTION_2_1(v3, sel_setFrame_);
  objc_msgSend(v3, sel_setPath_, *(void *)(v2 + 40), v9.receiver, v9.super_class);
  objc_msgSend(v3, sel_setStrokeColor_, *(void *)(v2 + 16));
  objc_msgSend(v3, sel_setLineWidth_, *(double *)(v2 + 24));
  objc_msgSend(v3, sel_setLineCap_, *MEMORY[0x263F15E70]);
  objc_msgSend(v3, sel_setLineJoin_, *MEMORY[0x263F15E98]);
  objc_msgSend(v3, sel_setFillColor_, 0);
  id result = objc_msgSend(v3, sel_setBackgroundColor_, 0);
  uint64_t v5 = *(void **)(v2 + 32);
  if (v5)
  {
    id v6 = v5;
    id v7 = sub_237D6BC04((uint64_t)v6);

    objc_msgSend(v3, sel_setMask_, v7);
    id v8 = v3;
    objc_msgSend(v8, sel_setStrokeEnd_, 0.0);

    swift_release();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_237D6BA50()
{
}

void sub_237D6BAA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation20StrokeAnimatingLayer_strokePathData];
  unint64_t v3 = *(void *)(v2 + 80);
  if (v3)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v4 = sub_237D75720();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    if (v4 >= 3)
    {
      uint64_t v5 = v4 - 2;
      char v6 = 1;
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    unint64_t v3 = 0;
  }
  uint64_t v5 = 0;
  char v6 = 0;
LABEL_8:
  double v7 = sub_237D5D9B8();
  id v8 = *(void **)(v2 + 40);
  if (v8)
  {
    if (v6)
    {
      id v9 = sub_237D740D8(v7, (uint64_t)v8, v3, v3, v5, 0);
      sub_237D6C134(v3, v5, 0);
    }
    else
    {
      id v9 = sub_237D73F38(v7, (uint64_t)v8, v3, v5, 2);
    }

    sub_237D73698((uint64_t)v9, 0x656B6F7274535253, 0xE800000000000000, v1);
  }
  else
  {
    __break(1u);
  }
}

id sub_237D6BC04(uint64_t a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15880]), sel_init);
  objc_msgSend(v1, sel_frame);
  objc_msgSend(v3, sel_setFrame_);

  objc_msgSend(v3, sel_setPath_, a1);
  return v3;
}

void sub_237D6BC88()
{
}

void sub_237D6BCC8()
{
}

id sub_237D6BD10()
{
  return sub_237D6C0D8(type metadata accessor for StrokeAnimatingLayer);
}

uint64_t type metadata accessor for StrokeAnimatingLayer()
{
  return self;
}

uint64_t sub_237D6BD5C()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for StrokeContourLayer();
  id v5 = objc_msgSendSuper2(&v23, sel_init);
  OUTLINED_FUNCTION_2_1(v5, sel_setFrame_);
  CGMutablePathRef Mutable = CGPathCreateMutable();
  CGMutablePathRef v7 = Mutable;
  uint64_t v21 = v2;
  if (!(v4 >> 62))
  {
    uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v9 = Mutable;
    swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_3;
    }
LABEL_11:

    swift_bridgeObjectRelease_n();
    objc_msgSend(v5, sel_setPath_, v7);
    id v17 = v21;
    if (!v21)
    {
      id v18 = objc_msgSend(self, sel_systemRedColor);
      id v19 = objc_msgSend(v18, sel_colorWithAlphaComponent_, 0.4);

      id v17 = objc_msgSend(v19, sel_CGColor);
    }
    objc_msgSend(v5, sel_setFillColor_, v17);

    return (uint64_t)v5;
  }
LABEL_15:
  uint64_t v20 = v7;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_237D75720();
  if (!v8) {
    goto LABEL_11;
  }
LABEL_3:
  unint64_t v22 = v4 & 0xC000000000000001;
  uint64_t v10 = 4;
  unint64_t v11 = v4;
  while (1)
  {
    if (v22)
    {
      uint64_t result = MEMORY[0x237E2F1C0](v10 - 4, v4);
      uint64_t v13 = result;
    }
    else
    {
      uint64_t v13 = *(void *)(v4 + 8 * v10);
      uint64_t result = swift_retain();
    }
    unint64_t v4 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
      goto LABEL_15;
    }
    uint64_t v14 = *(void **)(v13 + 32);
    if (!v14) {
      break;
    }
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v24 = 0x3FF0000000000000;
    uint64_t v27 = 0x3FF0000000000000;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    id v15 = v14;
    sub_237D754E0();
    swift_release();

    ++v10;
    BOOL v16 = v4 == v8;
    unint64_t v4 = v11;
    if (v16) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

void sub_237D6BFA0()
{
}

void sub_237D6BFF4()
{
}

void sub_237D6C034()
{
}

void sub_237D6C07C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  sub_237D75660();
  uint64_t v5 = swift_unknownObjectRelease();
  a4(v5);
  __break(1u);
}

id sub_237D6C0C0()
{
  return sub_237D6C0D8(type metadata accessor for StrokeContourLayer);
}

id sub_237D6C0D8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for StrokeContourLayer()
{
  return self;
}

uint64_t sub_237D6C134(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_237D6C148(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_237D753A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setName_, v4);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_237D75710();
}

id OUTLINED_FUNCTION_2_1(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v6, v5, v4, v3);
}

uint64_t sub_237D6C208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4 = v3;
  sub_237D75030();
  OUTLINED_FUNCTION_0_5();
  uint64_t v29 = v7;
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948D08);
  MEMORY[0x270FA5388](v10 - 8);
  objc_super v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_237D75050();
  OUTLINED_FUNCTION_0_5();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v29 - v20;
  objc_msgSend(v4, sel_setImage_, a3);
  sub_237D75040();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1) {
    return sub_237D6C538((uint64_t)v12);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v21, v13);
  sub_237D75020();
  sub_237D75010();
  id v23 = objc_msgSend(self, sel_sharedSession);
  uint64_t v24 = (void *)sub_237D75000();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v4;
  aBlock[4] = sub_237D6CB98;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237D6CC18;
  aBlock[3] = &block_descriptor_0;
  uint64_t v26 = _Block_copy(aBlock);
  id v27 = v4;
  swift_release();
  id v28 = objc_msgSend(v23, sel_dataTaskWithRequest_completionHandler_, v24, v26);
  _Block_release(v26);

  objc_msgSend(v28, sel_resume);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v21, v13);
}

uint64_t sub_237D6C538(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948D08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_237D6C598(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = sub_237D75320();
  uint64_t v11 = *(NSObject **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_237D75340();
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    if (qword_268948980 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_237D752F0();
    __swift_project_value_buffer(v18, (uint64_t)qword_2689490B0);
    id v19 = a4;
    id v20 = a4;
    char v44 = sub_237D752E0();
    os_log_type_t v21 = sub_237D754D0();
    if (os_log_type_enabled(v44, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      id v23 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v22 = 138412290;
      id v24 = a4;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v25;
      sub_237D75640();
      *id v23 = v25;

      _os_log_impl(&dword_237D5B000, v44, v21, "download Image failed:%@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268948D20);
      swift_arrayDestroy();
      MEMORY[0x237E2F950](v23, -1, -1);
      MEMORY[0x237E2F950](v22, -1, -1);

      return;
    }
  }
  else
  {
    uint64_t v43 = v15;
    char v44 = v11;
    if (a3)
    {
      self;
      uint64_t v26 = swift_dynamicCastObjCClass();
      if (v26)
      {
        id v27 = (void *)v26;
        id v28 = a3;
        if ((char *)objc_msgSend(v27, sel_statusCode) - 300 >= (char *)0xFFFFFFFFFFFFFF9CLL && a2 >> 60 != 15)
        {
          sub_237D6CDBC(0, &qword_268948D10);
          sub_237D6CD64(a1, a2);
          sub_237D6CD64(a1, a2);
          id v30 = sub_237D6CBA0(a1, a2);
          if (v30)
          {
            uint64_t v31 = v30;
            sub_237D6CDBC(0, (unint64_t *)&unk_2689489B0);
            uint64_t v42 = sub_237D75550();
            uint64_t v32 = swift_allocObject();
            *(void *)(v32 + 16) = a5;
            *(void *)(v32 + 24) = v31;
            aBlock[4] = sub_237D6CE38;
            aBlock[5] = v32;
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_237D6D158;
            aBlock[3] = &block_descriptor_6;
            uint64_t v41 = _Block_copy(aBlock);
            id v33 = a5;
            id v34 = v31;
            swift_release();
            sub_237D75330();
            aBlock[0] = MEMORY[0x263F8EE78];
            sub_237D6CE48();
            __swift_instantiateConcreteTypeFromMangledName(&qword_268948D18);
            sub_237D6CE98();
            sub_237D75670();
            uint64_t v36 = v41;
            uint64_t v35 = (void *)v42;
            MEMORY[0x237E2F090](0, v17, v13, v41);

            _Block_release(v36);
            sub_237D6CCF8(a1, a2);
            ((void (*)(char *, uint64_t))v44[1].isa)(v13, v10);
            (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v14);
            return;
          }
          sub_237D6CCF8(a1, a2);
        }
      }
    }
    if (qword_268948980 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_237D752F0();
    __swift_project_value_buffer(v37, (uint64_t)qword_2689490B0);
    char v44 = sub_237D752E0();
    os_log_type_t v38 = sub_237D754D0();
    if (os_log_type_enabled(v44, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_237D5B000, v44, v38, "image is nil or invalid image data.", v39, 2u);
      MEMORY[0x237E2F950](v39, -1, -1);
    }
  }
  uint64_t v40 = v44;
}

uint64_t sub_237D6CB60()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_237D6CB98(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  sub_237D6C598(a1, a2, a3, a4, *(void **)(v4 + 16));
}

id sub_237D6CBA0(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v5 = (void *)sub_237D75070();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_237D6CD0C(a1, a2);

  return v6;
}

uint64_t sub_237D6CC18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    id v6 = (void *)sub_237D75080();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_237D6CCF8((uint64_t)v6, v10);
  return swift_release();
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

uint64_t sub_237D6CCF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_237D6CD0C(a1, a2);
  }
  return a1;
}

uint64_t sub_237D6CD0C(uint64_t a1, unint64_t a2)
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

uint64_t sub_237D6CD64(uint64_t a1, unint64_t a2)
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

uint64_t sub_237D6CDBC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_237D6CDF8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_237D6CE38()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setImage_, *(void *)(v0 + 24));
}

unint64_t sub_237D6CE48()
{
  unint64_t result = qword_268948DE0;
  if (!qword_268948DE0)
  {
    sub_237D75320();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948DE0);
  }
  return result;
}

unint64_t sub_237D6CE98()
{
  unint64_t result = qword_268948DF0;
  if (!qword_268948DF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268948D18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268948DF0);
  }
  return result;
}

uint64_t sub_237D6CF10()
{
  uint64_t v0 = sub_237D752F0();
  __swift_allocate_value_buffer(v0, qword_2689490B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2689490B0);
  if (qword_268948990 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2689490C8);
  double v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_237D6CFD8()
{
  sub_237D6D118();
  uint64_t result = sub_237D75620();
  qword_268948D28 = result;
  return result;
}

uint64_t sub_237D6D038()
{
  uint64_t v0 = sub_237D752F0();
  __swift_allocate_value_buffer(v0, qword_2689490C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2689490C8);
  if (qword_268948988 != -1) {
    swift_once();
  }
  id v1 = (id)qword_268948D28;
  return sub_237D75300();
}

uint64_t sub_237D6D0C4()
{
  sub_237D6D118();
  uint64_t result = sub_237D75620();
  qword_2689490E0 = result;
  return result;
}

unint64_t sub_237D6D118()
{
  unint64_t result = qword_268948D30;
  if (!qword_268948D30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268948D30);
  }
  return result;
}

uint64_t sub_237D6D158(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

char *StrokeView.__allocating_init(with:frame:)()
{
  OUTLINED_FUNCTION_3_1();
  id v1 = objc_allocWithZone(v0);
  OUTLINED_FUNCTION_13_0();
  return StrokeView.init(with:frame:)();
}

char *StrokeView.init(with:frame:)()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v32 = v1;
  swift_getObjectType();
  sub_237D75540();
  OUTLINED_FUNCTION_0_6();
  uint64_t v30 = v3;
  uint64_t v31 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_11_0();
  uint64_t v29 = v4;
  sub_237D75520();
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_0();
  uint64_t v6 = sub_237D75340();
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_10_0();
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers] = 0;
  uint64_t v7 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  id v8 = objc_allocWithZone(MEMORY[0x263F82E00]);
  unint64_t v9 = v0;
  *(void *)&v0[v7] = objc_msgSend(v8, sel_init);
  uint64_t v10 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  *(void *)&v9[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v11 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  *(void *)&v9[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  uint64_t v12 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  id v13 = objc_allocWithZone((Class)type metadata accessor for StrokeData());
  *(void *)&v9[v12] = OUTLINED_FUNCTION_5_0();
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos] = 0;
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = 0;
  v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer] = 0;
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = 0;
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView] = 0;
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor] = 0;
  uint64_t v14 = &v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue;
  sub_237D73CEC(0, (unint64_t *)&unk_2689489B0);
  sub_237D75330();
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_237D73B40((unint64_t *)&qword_268948DC0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689489C0);
  sub_237D73A94((unint64_t *)&qword_268948DD0, &qword_2689489C0);
  sub_237D75670();
  (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x263F8F130], v31);
  OUTLINED_FUNCTION_14_0();
  *(void *)&v9[v15] = sub_237D75570();
  *(void *)&v9[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers] = MEMORY[0x263F8EE78];
  uint64_t v16 = *(void **)&v9[v12];
  *(void *)&v9[v12] = v32;
  id v17 = v32;

  if (qword_268948980 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_237D752F0();
  __swift_project_value_buffer(v18, (uint64_t)qword_2689490B0);
  id v19 = v17;
  id v20 = sub_237D752E0();
  os_log_type_t v21 = sub_237D754C0();
  if (os_log_type_enabled(v20, v21))
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)unint64_t v22 = 136315138;
    uint64_t v23 = sub_237D6B1D8();
    sub_237D72D98(v23, v24, &v33);
    sub_237D75640();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237D5B000, v20, v21, "strokeData is:%s", v22, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
  }
  uint64_t v26 = (char *)OUTLINED_FUNCTION_8_0(v25, sel_initWithFrame_);
  sub_237D6D704();
  sub_237D6D838();
  sub_237D6EC24();
  if (*(void *)&v26[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos])
  {
    unint64_t v27 = swift_bridgeObjectRetain();
    sub_237D6EDA4(v27);
    swift_bridgeObjectRelease();
  }
  sub_237D6F208();

  return v26;
}

void sub_237D6D704()
{
  id v1 = v0;
  sub_237D6FE18(1);
  sub_237D73CEC(0, (unint64_t *)&unk_268948FA0);
  id v2 = sub_237D6AF28(0, 0xE000000000000000);
  objc_msgSend(v2, sel_setFrame_, 0.0, 20.0, sub_237D6B828(), 40.0);
  objc_msgSend(v1, sel_addSubview_, v2);
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel];
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = v2;
  id v8 = v2;

  uint64_t v4 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  id v5 = *(id *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView];
  double v6 = sub_237D6B828();
  sub_237D6B828();
  objc_msgSend(v5, sel_setFrame_, 0.0, 65.0, v6, v7);

  objc_msgSend(v1, sel_addSubview_, *(void *)&v1[v4]);
}

void sub_237D6D838()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948AE0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  v169 = (char *)&v142 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v167 = (uint64_t)&v142 - v4;
  MEMORY[0x270FA5388](v3);
  double v6 = (char *)&v142 - v5;
  uint64_t v7 = type metadata accessor for _ProtoStrokeAnimationRepresentation.Color(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v142 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  id v13 = (char *)&v142 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v142 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689489E0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v142 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints(0);
  uint64_t v175 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19 - 8);
  os_log_type_t v21 = (uint64_t *)((char *)&v142 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = sub_237D750D0();
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268948F88);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v142 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for _ProtoStrokeAnimationRepresentation(0);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  if (*(void *)(v176 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos)) {
    return;
  }
  uint64_t v166 = v32;
  uint64_t v168 = v29;
  uint64_t v170 = v31;
  v171 = v6;
  uint64_t v149 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos;
  v150 = v13;
  v177 = v21;
  v172 = v18;
  uint64_t v173 = v7;
  v174 = v15;
  v151 = v10;
  uint64_t v157 = (uint64_t)&v142 - v30;
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_237D75060();
  unint64_t v35 = v34;
  swift_bridgeObjectRelease();
  if (v35 >> 60 == 15)
  {
    if (qword_268948980 != -1) {
      goto LABEL_97;
    }
    goto LABEL_4;
  }
  uint64_t v180 = 0;
  memset(v179, 0, sizeof(v179));
  sub_237D6CD64(v33, v35);
  sub_237D750C0();
  sub_237D73B40((unint64_t *)&qword_268948F90, (void (*)(uint64_t))type metadata accessor for _ProtoStrokeAnimationRepresentation);
  uint64_t v147 = v33;
  unint64_t v148 = v35;
  uint64_t v40 = v168;
  sub_237D751C0();
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v40);
  uint64_t v41 = v157;
  sub_237D73C8C((uint64_t)v25, v157, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);
  if (qword_268948980 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_237D752F0();
  uint64_t v43 = __swift_project_value_buffer(v42, (uint64_t)qword_2689490B0);
  uint64_t v44 = v166;
  sub_237D73B88(v41, v166, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);
  char v45 = sub_237D752E0();
  os_log_type_t v46 = sub_237D754C0();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v48 = v177;
  if (v47)
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    unint64_t v164 = swift_slowAlloc();
    *(void *)&v179[0] = v164;
    *(_DWORD *)uint64_t v49 = 136315138;
    v163 = v49 + 4;
    uint64_t v165 = v43;
    uint64_t v50 = v49;
    uint64_t v51 = v168;
    uint64_t v52 = sub_237D751D0();
    uint64_t v178 = sub_237D72D98(v52, v53, (uint64_t *)v179);
    sub_237D75640();
    swift_bridgeObjectRelease();
    sub_237D73C38(v44, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);
    _os_log_impl(&dword_237D5B000, v45, v46, "strokeAnimation is:%s", v50, 0xCu);
    unint64_t v54 = v164;
    swift_arrayDestroy();
    MEMORY[0x237E2F950](v54, -1, -1);
    MEMORY[0x237E2F950](v50, -1, -1);
  }
  else
  {
    sub_237D73C38(v44, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);

    uint64_t v51 = v168;
  }
  uint64_t v55 = v157;
  uint64_t v168 = *(int *)(v51 + 20);
  v56 = *(void **)(v157 + v168);
  swift_beginAccess();
  if (!*(void *)(v56[2] + 16))
  {
    __break(1u);
    goto LABEL_99;
  }
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_237D75060();
  unint64_t v59 = v58;
  swift_bridgeObjectRelease();
  if (v59 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_104;
  }
  sub_237D73CEC(0, &qword_268948F98);
  sub_237D6CD64(v57, v59);
  uint64_t v145 = v57;
  id v60 = sub_237D70970(v57, v59);
  CFDataRef v61 = sub_237D5ECD8(v60);

  if (!v61)
  {
LABEL_104:
    __break(1u);
    return;
  }
  CFDataRef v62 = v61;
  sub_237D5ED60();
  uint64_t v64 = v63;
  CFDataRef v144 = v62;

  swift_beginAccess();
  uint64_t v65 = v56[3];
  if (!*(void *)(v65 + 16))
  {
    swift_bridgeObjectRelease();
    v76 = sub_237D752E0();
    os_log_type_t v77 = sub_237D754B0();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v78 = 0;
      _os_log_impl(&dword_237D5B000, v76, v77, "no animation points, so just render contour path", v78, 2u);
      MEMORY[0x237E2F950](v78, -1, -1);
    }

    sub_237D6CCF8(v145, v59);
    sub_237D6CCF8(v147, v148);
LABEL_92:
    sub_237D73C38(v55, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);
    return;
  }
  unint64_t v143 = v59;
  swift_beginAccess();
  uint64_t v66 = v56[4];
  swift_beginAccess();
  uint64_t v67 = v56[6];
  swift_beginAccess();
  uint64_t v68 = v56[7];
  v69 = self;
  swift_bridgeObjectRetain();
  uint64_t v142 = v65;
  swift_bridgeObjectRetain();
  uint64_t v158 = v66;
  swift_bridgeObjectRetain();
  uint64_t v155 = v67;
  swift_bridgeObjectRetain();
  uint64_t v156 = v68;
  swift_bridgeObjectRetain();
  id v146 = v69;
  id v70 = objc_msgSend(v69, sel_sharedPreferences);
  uint64_t v71 = v64;
  id v72 = objc_msgSend(v70, sel_outputVoice);

  uint64_t v166 = v71;
  if (v72)
  {
    id v73 = objc_msgSend(v72, sel_VSSpeechGender);

    v56 = v174;
    if (v73 == (id)1)
    {
      uint64_t v165 = 100;
      uint64_t v74 = v175;
      uint64_t v51 = v176;
      uint64_t v71 = v166;
      if (v166 < 0) {
        goto LABEL_101;
      }
      uint64_t v79 = (uint64_t)v169;
    }
    else
    {
      uint64_t v74 = v175;
      uint64_t v51 = v176;
      if (v73 == (id)2) {
        uint64_t v75 = 200;
      }
      else {
        uint64_t v75 = 150;
      }
      uint64_t v165 = v75;
      uint64_t v79 = (uint64_t)v169;
      uint64_t v71 = v166;
      if (v166 < 0) {
        goto LABEL_102;
      }
    }
  }
  else
  {
    uint64_t v165 = 150;
    v56 = v174;
    uint64_t v51 = v176;
    if (v71 < 0) {
      goto LABEL_101;
    }
    uint64_t v79 = (uint64_t)v169;
    uint64_t v74 = v175;
  }
  if ((v71 & 0x4000000000000000) != 0) {
    goto LABEL_102;
  }
  uint64_t v80 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v81 = v143;
    if (!v80)
    {
      swift_bridgeObjectRelease();
      uint64_t v122 = v166;
      swift_bridgeObjectRelease();
      uint64_t v123 = (uint64_t)v151;
LABEL_82:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v51 + v149) = v122;
      swift_bridgeObjectRelease();
      uint64_t v124 = *(void *)(v55 + v168)
           + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__contourColor;
      swift_beginAccess();
      uint64_t v125 = v167;
      sub_237D62E4C(v124, v167);
      uint64_t v126 = v173;
      if (__swift_getEnumTagSinglePayload(v125, 1, v173) == 1)
      {
        v127 = v150;
        void *v150 = 0;
        v127[1] = 0xE000000000000000;
        v127[2] = 0;
        v127[3] = 0;
        *((unsigned char *)v127 + 32) = 1;
        _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
        sub_237D73BE8(v125, &qword_268948AE0);
      }
      else
      {
        v127 = v150;
        sub_237D73C8C(v125, (uint64_t)v150, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      }
      unint64_t v128 = (unint64_t)_ProtoStrokeAnimationRepresentation.Color.toUIColor()();
      sub_237D73C38((uint64_t)v127, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      v129 = *(void **)(v51 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor);
      *(void *)(v51 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor) = v128;

      uint64_t v130 = *(void *)(v55 + v168)
           + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundColor;
      swift_beginAccess();
      sub_237D62E4C(v130, v79);
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v79, 1, v126);
      CFDataRef v132 = v144;
      if (EnumTagSinglePayload == 1)
      {
        *(void *)uint64_t v123 = 0;
        *(void *)(v123 + 8) = 0xE000000000000000;
        *(void *)(v123 + 16) = 0;
        *(void *)(v123 + 24) = 0;
        *(unsigned char *)(v123 + 32) = 1;
        _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
        sub_237D73BE8(v79, &qword_268948AE0);
      }
      else
      {
        sub_237D73C8C(v79, v123, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      }
      unint64_t v133 = (unint64_t)_ProtoStrokeAnimationRepresentation.Color.toUIColor()();
      sub_237D73C38(v123, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
      v134 = *(void **)(v51 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView);
      *(void *)(v51 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView) = v133;

      v135 = (uint64_t *)(*(void *)(v55 + v168)
                       + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__backgroundURL);
      swift_beginAccess();
      uint64_t v137 = *v135;
      unint64_t v136 = v135[1];
      swift_bridgeObjectRetain();

      sub_237D6CCF8(v145, v81);
      sub_237D6CCF8(v147, v148);
      swift_bridgeObjectRelease();
      uint64_t v138 = HIBYTE(v136) & 0xF;
      if ((v136 & 0x2000000000000000) == 0) {
        uint64_t v138 = v137 & 0xFFFFFFFFFFFFLL;
      }
      if (v138)
      {
        uint64_t v140 = *v135;
        uint64_t v139 = v135[1];
        swift_bridgeObjectRetain();
        sub_237D73C38(v55, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);
        v141 = (void *)(v51 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl);
        void *v141 = v140;
        v141[1] = v139;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_92;
    }
    if (v80 < 1)
    {
LABEL_99:
      __break(1u);
      goto LABEL_100;
    }
    uint64_t v51 = (uint64_t)v172;
    if ((unint64_t)(v80 - 1) < *(void *)(v142 + 16)) {
      break;
    }
LABEL_100:
    __break(1u);
LABEL_101:
    uint64_t v79 = (uint64_t)v169;
LABEL_102:
    swift_bridgeObjectRetain();
    uint64_t v74 = v175;
    uint64_t v80 = sub_237D75720();
  }
  unint64_t v82 = 0;
  unint64_t v83 = (*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
  v163 = *(_DWORD **)(v156 + 16);
  unint64_t v164 = v166 & 0xC000000000000001;
  uint64_t v162 = v142 + v83;
  unint64_t v84 = *(void *)(v158 + 16);
  unint64_t v160 = *(void *)(v155 + 16);
  unint64_t v161 = v84;
  uint64_t v152 = v155 + 32;
  v153 = v56 + 2;
  int64_t v154 = v84 - 1;
  uint64_t v85 = (void *)(v158 + 56);
  uint64_t v159 = v80;
  while (1)
  {
    if (v164)
    {
      uint64_t v86 = MEMORY[0x237E2F1C0](v82, v166);
    }
    else
    {
      uint64_t v86 = *(void *)(v166 + 8 * v82 + 32);
      swift_retain();
    }
    sub_237D73B88(v162 + *(void *)(v74 + 72) * v82, (uint64_t)v48, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    if (!v163)
    {
      uint64_t v91 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
      uint64_t v89 = v51;
      uint64_t v90 = 1;
      goto LABEL_44;
    }
    uint64_t v87 = v156;
    if (v82 >= *(void *)(v156 + 16)) {
      break;
    }
    uint64_t v88 = type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes(0);
    sub_237D73B88(v87+ ((*(unsigned __int8 *)(*(void *)(v88 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v88 - 8) + 80))+ *(void *)(*(void *)(v88 - 8) + 72) * v82, v51, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.StrokeKeyTimes);
    uint64_t v89 = v51;
    uint64_t v90 = 0;
    uint64_t v91 = v88;
LABEL_44:
    __swift_storeEnumTagSinglePayload(v89, v90, 1, v91);
    unint64_t v92 = v82 + 1;
    v93 = v177;
    sub_237D5D36C(v177, v51);
    sub_237D73BE8(v51, &qword_2689489E0);
    sub_237D73C38((uint64_t)v93, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.AnimationPoints);
    *(void *)(v86 + 88) = v165;
    uint64_t v94 = v55;
    uint64_t v95 = (uint64_t)v171;
    if (v82 < v161)
    {
      if (v82 >= *(void *)(v158 + 16)) {
        goto LABEL_94;
      }
      uint64_t v96 = *(v85 - 2);
      *(void *)(v86 + 64) = *(v85 - 3);
      *(void *)(v86 + 72) = v96;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((uint64_t)v82 < v154)
      {
        if (v92 >= *(void *)(v158 + 16)) {
          goto LABEL_96;
        }
        BOOL v97 = *(v85 - 1) == 68 && *v85 == 0xE100000000000000;
        if (v97 || (sub_237D75750() & 1) != 0) {
          uint64_t v98 = 50;
        }
        else {
          uint64_t v98 = 0;
        }
        swift_bridgeObjectRetain();
        id v99 = objc_msgSend(v146, sel_sharedPreferences);
        id v100 = objc_msgSend(v99, sel_outputVoice);

        if (v100)
        {
          id v101 = objc_msgSend(v100, sel_VSSpeechGender);
          swift_bridgeObjectRelease();

          if (v101 != (id)1)
          {
            v56 = v174;
            if (v101 == (id)2) {
              uint64_t v102 = 200;
            }
            else {
              uint64_t v102 = 150;
            }
            uint64_t v103 = v102 - v98;
            uint64_t v94 = v157;
            goto LABEL_64;
          }
          uint64_t v103 = 100 - v98;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v103 = 150;
        }
        uint64_t v94 = v157;
        v56 = v174;
LABEL_64:
        *(void *)(v86 + 88) = v103;
      }
    }
    if (v82 < v160)
    {
      if (v82 >= *(void *)(v155 + 16)) {
        goto LABEL_95;
      }
      double v104 = *(double *)(v152 + 8 * v82);
      if (v104 > 0.0)
      {
        id v105 = objc_msgSend(self, sel_currentDevice);
        id v106 = objc_msgSend(v105, sel_userInterfaceIdiom);

        double v107 = v104 * 1.42857143;
        BOOL v97 = v106 == 0;
        v56 = v174;
        if (v97) {
          double v107 = v104;
        }
        *(double *)(v86 + 24) = v107;
      }
    }
    uint64_t v108 = *(void *)(v94 + v168);
    swift_beginAccess();
    double v109 = *(double *)(v108 + 40);
    if (v109 > 0.0) {
      *(double *)(v86 + 96) = v109;
    }
    uint64_t v110 = v108
         + OBJC_IVAR____TtCV15StrokeAnimation35_ProtoStrokeAnimationRepresentationP33_82C5B650B8A7FC58B8A66A8F009C914D13_StorageClass__strokeColor;
    swift_beginAccess();
    sub_237D62E4C(v110, v95);
    if (__swift_getEnumTagSinglePayload(v95, 1, v173) == 1)
    {
      void *v56 = 0;
      v56[1] = 0xE000000000000000;
      v111 = v153;
      void *v153 = 0;
      v111[1] = 0;
      *((unsigned char *)v56 + 32) = 1;
      _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
      sub_237D73BE8(v95, &qword_268948AE0);
    }
    else
    {
      sub_237D73C8C(v95, (uint64_t)v56, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    }
    v112 = (void *)_ProtoStrokeAnimationRepresentation.Color.toUIColor()();
    sub_237D73C38((uint64_t)v56, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation.Color);
    if (v112)
    {
      id v113 = objc_msgSend(v112, sel_CGColor);

      v114 = *(void **)(v86 + 16);
      *(void *)(v86 + 16) = v113;
      v56 = v174;
    }
    uint64_t v55 = v94;
    uint64_t v115 = v170;
    sub_237D73B88(v94, v170, (void (*)(void))type metadata accessor for _ProtoStrokeAnimationRepresentation);
    double v116 = sub_237D6B564(v115, v82);
    uint64_t v117 = *(void *)(v86 + 104);
    uint64_t v118 = *(void *)(v86 + 112);
    uint64_t v119 = *(void *)(v86 + 120);
    *(void *)(v86 + 104) = v120;
    *(double *)(v86 + 112) = v116;
    *(void *)(v86 + 120) = v121;
    sub_237D5E45C(v117, v118, v119);
    swift_release();
    v85 += 2;
    ++v82;
    BOOL v97 = v159 == v92;
    uint64_t v51 = (uint64_t)v172;
    uint64_t v74 = v175;
    uint64_t v48 = v177;
    if (v97)
    {
      swift_bridgeObjectRelease();
      uint64_t v122 = v166;
      swift_bridgeObjectRelease();
      uint64_t v51 = v176;
      uint64_t v79 = (uint64_t)v169;
      uint64_t v123 = (uint64_t)v151;
      unint64_t v81 = v143;
      goto LABEL_82;
    }
  }
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  swift_once();
LABEL_4:
  uint64_t v36 = sub_237D752F0();
  __swift_project_value_buffer(v36, (uint64_t)qword_2689490B0);
  v177 = (uint64_t *)sub_237D752E0();
  os_log_type_t v37 = sub_237D754D0();
  if (os_log_type_enabled((os_log_t)v177, v37))
  {
    os_log_type_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v38 = 0;
    _os_log_impl(&dword_237D5B000, (os_log_t)v177, v37, "invalid strokeData", v38, 2u);
    MEMORY[0x237E2F950](v38, -1, -1);
  }
  uint64_t v39 = v177;
}

void sub_237D6EC24()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData)
                  + OBJC_IVAR___SAStrokeDataInternal_pronunciations);
  if (v1 && v1[2])
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel);
    if (v2)
    {
      uint64_t v4 = v1[4];
      uint64_t v3 = v1[5];
      swift_bridgeObjectRetain();
      id v5 = v2;
      sub_237D735C4(v4, v3, v5);

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_237D701B0();
    id v6 = *(id *)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView);
    double v7 = sub_237D6B828();
    sub_237D6B828();
    objc_msgSend(v6, sel_setFrame_, 0.0, 40.0, v7, v8);
  }
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView);
  if (v9)
  {
    uint64_t v10 = *(void **)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer);
    if (v10)
    {
      id v13 = v9;
      id v11 = v10;
      id v12 = objc_msgSend(v13, sel_CGColor);
      objc_msgSend(v11, sel_setFillColor_, v12);
    }
  }
}

uint64_t sub_237D6EDA4(unint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  unint64_t v6 = sub_237D737A0(objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                           + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView), sel_layer)));
  if (v6)
  {
    unint64_t v7 = v6;
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_237D75720();
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_4:
        if (v8 < 1) {
          goto LABEL_37;
        }
        for (uint64_t i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0) {
            id v10 = (id)MEMORY[0x237E2F1C0](i, v7);
          }
          else {
            id v10 = *(id *)(v7 + 8 * i + 32);
          }
          id v11 = v10;
          objc_msgSend(v10, sel_removeFromSuperlayer);
        }
      }
    }
    swift_bridgeObjectRelease_n();
  }
  sub_237D6B828();
  sub_237D6B828();
  uint64_t v12 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor;
  id v13 = *(void **)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor);
  unint64_t v2 = 0x264D00000uLL;
  if (!v13)
  {
LABEL_19:
    id v22 = objc_allocWithZone((Class)type metadata accessor for StrokeContourLayer());
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_237D6BD5C();
    id v24 = objc_msgSend(*(id *)(v3 + v5), sel_layer);
    objc_msgSend(v24, sel_addSublayer_, v23);

    uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer);
    *(void *)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer) = v23;
    goto LABEL_20;
  }
  sub_237D73CEC(0, &qword_268948F50);
  uint64_t v14 = self;
  uint64_t v8 = v13;
  id v15 = objc_msgSend((id)v14, sel_clearColor);
  LOBYTE(v14) = sub_237D75610();

  if ((v14 & 1) == 0)
  {

    uint64_t v20 = *(void **)(v3 + v12);
    if (v20) {
      id v21 = objc_msgSend(v20, sel_CGColor);
    }
    goto LABEL_19;
  }
  if (qword_268948980 != -1) {
    goto LABEL_38;
  }
  while (1)
  {
    uint64_t v16 = sub_237D752F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_2689490B0);
    uint64_t v17 = sub_237D752E0();
    os_log_type_t v18 = sub_237D754B0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_237D5B000, v17, v18, "no contour color for stroke animation!", v19, 2u);
      MEMORY[0x237E2F950](v19, -1, -1);
    }

LABEL_20:
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_237D75720();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v25 = MEMORY[0x263F8EE78];
    if (!v8) {
      break;
    }
    uint64_t v31 = MEMORY[0x263F8EE78];
    sub_237D756D0();
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v26 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          MEMORY[0x237E2F1C0](v26, a1);
        }
        else {
          swift_retain();
        }
        ++v26;
        id v27 = objc_allocWithZone((Class)type metadata accessor for StrokeAnimatingLayer());
        swift_retain();
        id v28 = sub_237D6B89C();
        id v29 = objc_msgSend(*(id *)(v3 + v5), sel_layer);
        objc_msgSend(v29, *(SEL *)(v2 + 3560), v28);
        swift_release();

        sub_237D756B0();
        sub_237D756E0();
        sub_237D756F0();
        sub_237D756C0();
      }
      while (v8 != v26);
      uint64_t v25 = v31;
      break;
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    swift_once();
  }
  *(void *)(v3 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers) = v25;
  return swift_bridgeObjectRelease();
}

void sub_237D6F208()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers);
  if (v1)
  {
    uint64_t v19 = 150;
    uint64_t v20 = 0;
    if (v1 >> 62) {
      goto LABEL_26;
    }
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v2)
    {
      while (1)
      {
        uint64_t v16 = v2 - 1;
        if (v2 < 1) {
          break;
        }
        uint64_t v3 = 0;
        uint64_t v4 = 0;
        uint64_t v5 = *(NSObject **)(v17 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue);
        while (1)
        {
          id v6 = (v1 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x237E2F1C0](v4, v1)
             : *(id *)(v1 + 8 * v4 + 32);
          unint64_t v7 = v6;
          uint64_t v8 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v9 = (void *)swift_allocObject();
          v9[2] = v8;
          v9[3] = &v20;
          v9[4] = &v19;
          v9[5] = v7;
          v9[6] = v1;
          swift_bridgeObjectRetain();
          swift_retain();
          id v10 = v7;
          sub_237D73A4C((uint64_t)v3);
          uint64_t v11 = swift_allocObject();
          *(void *)(v11 + 16) = sub_237D73A3C;
          *(void *)(v11 + 24) = v9;
          aBlock[4] = sub_237D73A6C;
          aBlock[5] = v11;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_237D714C4;
          aBlock[3] = &block_descriptor_14;
          uint64_t v12 = _Block_copy(aBlock);
          swift_retain();
          swift_release();
          swift_release();
          dispatch_sync(v5, v12);
          _Block_release(v12);
          LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if (v12) {
            break;
          }
          swift_retain();
          double v13 = sub_237D5D9B8();
          swift_release();
          double v14 = v13 * 1000.0;
          if ((~COERCE__INT64(v13 * 1000.0) & 0x7FF0000000000000) == 0) {
            goto LABEL_21;
          }
          if (v14 <= -9.22337204e18) {
            goto LABEL_22;
          }
          if (v14 >= 9.22337204e18) {
            goto LABEL_23;
          }
          if (__OFADD__(v20, (uint64_t)v14)) {
            goto LABEL_24;
          }
          v20 += (uint64_t)v14;
          swift_retain();

          uint64_t v15 = sub_237D5DA24();
          swift_release();
          if (__OFADD__(v19, v15)) {
            goto LABEL_25;
          }
          v19 += v15;
          if (v16 == v4)
          {
            swift_release();
            goto LABEL_18;
          }
          ++v4;
          uint64_t v3 = sub_237D73A3C;
        }
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        swift_bridgeObjectRetain_n();
        uint64_t v2 = sub_237D75720();
        if (!v2) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_18:
      swift_bridgeObjectRelease_n();
    }
  }
}

id StrokeView.__allocating_init(frame:)()
{
  OUTLINED_FUNCTION_3_1();
  id v1 = objc_allocWithZone(v0);
  double v4 = OUTLINED_FUNCTION_13_0();
  return objc_msgSend(v2, v3, v4);
}

id StrokeView.init(frame:)()
{
  OUTLINED_FUNCTION_3_1();
  swift_getObjectType();
  sub_237D75540();
  OUTLINED_FUNCTION_0_6();
  uint64_t v20 = v2;
  uint64_t v21 = v1;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_11_0();
  uint64_t v19 = v3;
  sub_237D75520();
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_6_0();
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers] = 0;
  uint64_t v6 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  id v7 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v8 = v0;
  *(void *)&v0[v6] = objc_msgSend(v7, sel_init);
  uint64_t v9 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  *(void *)&v8[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  *(void *)&v8[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  uint64_t v11 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  id v12 = objc_allocWithZone((Class)type metadata accessor for StrokeData());
  *(void *)&v8[v11] = OUTLINED_FUNCTION_5_0();
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos] = 0;
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = 0;
  v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer] = 0;
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = 0;
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView] = 0;
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor] = 0;
  double v13 = &v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  *(void *)double v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue;
  sub_237D73CEC(0, (unint64_t *)&unk_2689489B0);
  sub_237D75330();
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_237D73B40((unint64_t *)&qword_268948DC0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689489C0);
  sub_237D73A94((unint64_t *)&qword_268948DD0, &qword_2689489C0);
  sub_237D75670();
  (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v19, *MEMORY[0x263F8F130], v21);
  OUTLINED_FUNCTION_14_0();
  *(void *)&v8[v14] = sub_237D75570();
  *(void *)&v8[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers] = v15;

  id v17 = OUTLINED_FUNCTION_8_0(v16, sel_initWithFrame_);
  sub_237D6D704();
  sub_237D6F98C();

  return v17;
}

void sub_237D6F98C()
{
  v3[3] = swift_getObjectType();
  v3[0] = v0;
  objc_allocWithZone(MEMORY[0x263F82CB0]);
  id v1 = v0;
  id v2 = sub_237D72BA4(v3, (uint64_t)sel__didTapView_);
  objc_msgSend(v1, sel_addGestureRecognizer_, v2);
}

id StrokeView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void StrokeView.init(coder:)()
{
  id v1 = v0;
  sub_237D75540();
  OUTLINED_FUNCTION_0_6();
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_11_0();
  uint64_t v15 = v4;
  sub_237D75520();
  OUTLINED_FUNCTION_1_4();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_2_2();
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_6_0();
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers] = 0;
  uint64_t v7 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView;
  *(void *)&v1[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v8 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  *(void *)&v1[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
  *(void *)&v1[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  id v11 = objc_allocWithZone((Class)type metadata accessor for StrokeData());
  *(void *)&v1[v10] = OUTLINED_FUNCTION_5_0();
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel] = 0;
  v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor] = 0;
  id v12 = &v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
  *id v12 = 0;
  v12[1] = 0;
  uint64_t v13 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue;
  sub_237D73CEC(0, (unint64_t *)&unk_2689489B0);
  sub_237D75330();
  uint64_t v14 = MEMORY[0x263F8EE78];
  sub_237D73B40((unint64_t *)&qword_268948DC0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689489C0);
  sub_237D73A94((unint64_t *)&qword_268948DD0, &qword_2689489C0);
  sub_237D75670();
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, *MEMORY[0x263F8F130], v17);
  *(void *)&v1[v13] = sub_237D75570();
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers] = v14;

  sub_237D75710();
  __break(1u);
}

void sub_237D6FE18(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15880]), sel_init);
  uint64_t v5 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  id v6 = *(id *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
  double v7 = sub_237D6B828();
  sub_237D6B828();
  double v9 = v8 + 40.0;
  if ((a1 & 1) == 0) {
    double v9 = v8;
  }
  objc_msgSend(v6, sel_setFrame_, 0.0, 20.0, v7 + 10.0, v9 + 10.0);

  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  id v14 = objc_msgSend(self, sel_bezierPathWithRoundedRect_cornerRadius_, v10, v11, v12, v13, 5.0);
  uint64_t v15 = (const CGPath *)objc_msgSend(v14, sel_CGPath);

  CGMutablePathRef MutableCopy = CGPathCreateMutableCopy(v15);
  if ((a1 & 1) == 0) {
    goto LABEL_6;
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824C0]), sel_init);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  double MinX = CGRectGetMinX(v32);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  objc_msgSend(v16, sel_moveToPoint_, MinX, CGRectGetMinY(v33) + 40.0);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  double MaxX = CGRectGetMaxX(v34);
  objc_msgSend(*(id *)&v2[v5], sel_bounds);
  objc_msgSend(v16, sel_addLineToPoint_, MaxX, CGRectGetMinY(v35) + 40.0);
  if (MutableCopy)
  {
    uint64_t v19 = MutableCopy;
    id v20 = objc_msgSend(v16, sel_CGPath);
    sub_237D754E0();

LABEL_6:
    CGMutablePathRef v21 = MutableCopy;
    goto LABEL_8;
  }

  CGMutablePathRef v21 = 0;
LABEL_8:
  objc_msgSend(v4, sel_setPath_, v21);
  id v22 = objc_msgSend(self, sel_tertiaryLabelColor);
  id v23 = objc_msgSend(v22, sel_CGColor);

  objc_msgSend(v4, sel_setStrokeColor_, v23);
  id v24 = objc_msgSend(v2, sel_layer);
  id v25 = objc_msgSend(v24, sel_backgroundColor);

  objc_msgSend(v4, sel_setFillColor_, v25);
  id v26 = objc_msgSend(*(id *)&v2[v5], sel_layer);
  objc_msgSend(v26, sel_addSublayer_, v4);

  id v27 = *(void **)&v2[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer];
  *(void *)&v2[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer] = v4;
  id v28 = v4;

  double v29 = 40.0;
  if ((a1 & 1) == 0) {
    double v29 = 0.0;
  }
  sub_237D705DC(v29);
  objc_msgSend(v2, sel_addSubview_, *(void *)&v2[v5]);
}

void sub_237D701B0()
{
  id v1 = v0;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl + 8];
  if (v2)
  {
    uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageUrl];
    swift_getObjectType();
    id v4 = *(void **)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
    swift_bridgeObjectRetain();
    objc_msgSend(v4, sel_removeFromSuperview);
    uint64_t v5 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView;
    id v6 = *(void **)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView];
    sub_237D73CEC(0, &qword_268948D10);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v8 = v6;
    id v9 = objc_msgSend(self, sel_bundleForClass_, objc_msgSend(ObjCClassFromMetadata, sel_classForCoder));
    id v10 = sub_237D708EC(26466, 0xE200000000000000, v9, 0);
    if (!v10)
    {
      __break(1u);
      return;
    }
    double v11 = v10;
    sub_237D6C208(v3, v2, (uint64_t)v10);

    swift_bridgeObjectRelease();
    objc_msgSend(*(id *)&v1[v5], sel_setContentMode_, 2);
    objc_msgSend(v1, sel_insertSubview_belowSubview_, *(void *)&v1[v5], *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView]);
    CGMutablePathRef MutableCopy = (CGMutablePathRef)*(id *)&v1[v5];
    double v12 = sub_237D6B828() + 60.0;
    sub_237D6B828();
    -[CGPath setFrame:](MutableCopy, sel_setFrame_, 0.0, 10.0, v12, v13 + 60.0);
  }
  else
  {
    uint64_t v14 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
    id v15 = *(id *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
    double v16 = sub_237D6B828();
    sub_237D6B828();
    objc_msgSend(v15, sel_setFrame_, 0.0, 40.0, v16, v17);

    objc_msgSend(*(id *)&v1[v14], sel_bounds);
    id v22 = objc_msgSend(self, sel_bezierPathWithRoundedRect_cornerRadius_, v18, v19, v20, v21, 5.0);
    id v23 = (const CGPath *)objc_msgSend(v22, sel_CGPath);

    CGMutablePathRef MutableCopy = CGPathCreateMutableCopy(v23);
    uint64_t v24 = sub_237D737A0(objc_msgSend(*(id *)&v1[v14], sel_layer));
    if (v24)
    {
      unint64_t v25 = v24;
      id v26 = *(void **)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer];
      if (v26) {
        objc_msgSend(v26, sel_setPath_, MutableCopy);
      }
      if (v25 >> 62) {
        goto LABEL_29;
      }
      uint64_t v27 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (v27)
      {
        uint64_t v28 = 4;
        while (1)
        {
          id v29 = (v25 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x237E2F1C0](v28 - 4, v25)
              : *(id *)(v25 + 8 * v28);
          uint64_t v30 = v29;
          uint64_t v31 = v28 - 3;
          if (__OFADD__(v28 - 4, 1)) {
            break;
          }
          uint64_t v32 = sub_237D73818(v29);
          if (v33)
          {
            if (v32 == 0x645F656B6F727473 && v33 == 0xEA0000000000746FLL)
            {
              swift_bridgeObjectRelease();
LABEL_23:
              swift_bridgeObjectRelease();
              objc_msgSend(v30, sel_removeFromSuperlayer);

              goto LABEL_24;
            }
            char v35 = sub_237D75750();
            swift_bridgeObjectRelease();
            if (v35) {
              goto LABEL_23;
            }
          }

          ++v28;
          if (v31 == v27) {
            goto LABEL_21;
          }
        }
        __break(1u);
LABEL_29:
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_237D75720();
        swift_bridgeObjectRelease();
      }
LABEL_21:
      swift_bridgeObjectRelease();
LABEL_24:
      sub_237D705DC(0.0);
    }
  }
}

void sub_237D705DC(double a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15880]), sel_init);
  CGMutablePathRef Mutable = CGPathCreateMutable();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948F80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_237D76210;
  uint64_t v7 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView), sel_bounds);
  CGFloat MinX = CGRectGetMinX(v22);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat MidY = CGRectGetMidY(v23);
  *(CGFloat *)(v6 + 32) = MinX;
  *(double *)(v6 + 40) = a1 * 0.5 + MidY;
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat MaxX = CGRectGetMaxX(v24);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat v11 = CGRectGetMidY(v25);
  *(CGFloat *)(v6 + 48) = MaxX;
  *(double *)(v6 + 56) = a1 * 0.5 + v11;
  sub_237D75510();
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_237D76210;
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat MidX = CGRectGetMidX(v26);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat MinY = CGRectGetMinY(v27);
  *(CGFloat *)(v12 + 32) = MidX;
  *(CGFloat *)(v12 + 40) = MinY + a1;
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat v15 = CGRectGetMidX(v28);
  objc_msgSend(*(id *)(v1 + v7), sel_bounds);
  CGFloat MaxY = CGRectGetMaxY(v29);
  *(CGFloat *)(v12 + 48) = v15;
  *(CGFloat *)(v12 + 56) = MaxY;
  sub_237D75510();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setPath_, Mutable);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_237D76DB0;
  sub_237D73CEC(0, (unint64_t *)&unk_268948E00);
  *(void *)(v17 + 32) = sub_237D75600();
  *(void *)(v17 + 40) = sub_237D75600();
  sub_237D75480();
  sub_237D73714(v17, v4, (SEL *)&selRef_setLineDashPattern_);
  id v18 = objc_msgSend(self, sel_tertiaryLabelColor);
  id v19 = objc_msgSend(v18, sel_CGColor);

  objc_msgSend(v4, sel_setStrokeColor_, v19);
  sub_237D6C148(0x645F656B6F727473, 0xEA0000000000746FLL, v4);
  id v20 = objc_msgSend(*(id *)(v2 + v7), sel_layer);
  objc_msgSend(v20, sel_addSublayer_, v4);
}

id sub_237D708EC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = (void *)sub_237D753A0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v6, a3, a4);

  return v7;
}

id sub_237D70970(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_237D75070();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_237D6CD0C(a1, a2);

  return v6;
}

uint64_t sub_237D709E8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v55 = a5;
  unint64_t v53 = a4;
  uint64_t v63 = a2;
  uint64_t v64 = a3;
  uint64_t v6 = sub_237D75320();
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v58 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_237D75340();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  unint64_t v54 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_237D75310();
  uint64_t v9 = *(void *)(v51 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v51);
  uint64_t v50 = (void *)((char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  double v13 = (void *)((char *)v47 - v12);
  uint64_t v65 = sub_237D75360();
  uint64_t v49 = *(void *)(v65 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v65);
  CFDataRef v62 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v48 = (char *)v47 - v16;
  uint64_t v17 = sub_237D75580();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v20 = (char *)v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = a1;
  swift_beginAccess();
  uint64_t v52 = a1 + 16;
  uint64_t v21 = MEMORY[0x237E2F9C0](a1 + 16);
  uint64_t v22 = MEMORY[0x263F8EE78];
  if (v21)
  {
    CGRect v23 = (void *)v21;
    CGRect v24 = (void *)(v21 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers);
    swift_beginAccess();
    *CGRect v24 = v22;

    swift_bridgeObjectRelease();
  }
  sub_237D73CEC(0, &qword_268948F58);
  sub_237D73CEC(0, (unint64_t *)&unk_2689489B0);
  CGRect v25 = (void *)sub_237D75550();
  aBlock[0] = v22;
  sub_237D73B40(&qword_268948F60, MEMORY[0x263F8F148]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948F68);
  sub_237D73A94((unint64_t *)&unk_268948F70, &qword_268948F68);
  sub_237D75670();
  uint64_t v26 = sub_237D75590();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t ObjectType = swift_getObjectType();
  CGRect v28 = v62;
  uint64_t result = sub_237D75350();
  if (__OFADD__(*v63, *v64))
  {
    __break(1u);
  }
  else
  {
    *double v13 = *v63 + *v64;
    uint64_t v30 = v51;
    (*(void (**)(void *, void, uint64_t))(v9 + 104))(v13, *MEMORY[0x263F8F000], v51);
    uint64_t v31 = v48;
    MEMORY[0x237E2EEA0](v28, v13);
    uint64_t v32 = *(void (**)(void *, uint64_t))(v9 + 8);
    v32(v13, v30);
    v47[1] = ObjectType;
    uint64_t v33 = *(void (**)(char *, uint64_t))(v49 + 8);
    v33(v28, v65);
    sub_237D71188((uint64_t)v13);
    CGRect v34 = v50;
    sub_237D711FC(v50);
    MEMORY[0x237E2F120](v31, v13, v34, ObjectType);
    v32(v34, v30);
    v32(v13, v30);
    v33(v31, v65);
    char v35 = (void *)swift_allocObject();
    uint64_t v36 = v53;
    v35[2] = v53;
    v35[3] = v26;
    uint64_t v37 = v56;
    v35[4] = v55;
    v35[5] = v37;
    aBlock[4] = sub_237D73B34;
    aBlock[5] = v35;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237D6D158;
    aBlock[3] = &block_descriptor_20;
    os_log_type_t v38 = _Block_copy(aBlock);
    id v39 = v36;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v40 = v54;
    sub_237D75330();
    uint64_t v41 = v58;
    sub_237D713FC();
    sub_237D755A0();
    _Block_release(v38);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v41, v61);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v40, v59);
    swift_release();
    sub_237D755C0();
    uint64_t v42 = v52;
    swift_beginAccess();
    uint64_t v43 = MEMORY[0x237E2F9C0](v42);
    if (v43)
    {
      uint64_t v44 = (void *)v43;
      char v45 = (void *)(v43 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_timers);
      swift_beginAccess();
      uint64_t v46 = swift_unknownObjectRetain();
      MEMORY[0x237E2EF70](v46);
      sub_237D72D5C(*(void *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x10));
      sub_237D754A0();
      sub_237D75480();
      swift_endAccess();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_237D71188@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F010];
  uint64_t v3 = sub_237D75310();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_237D711FC@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = *MEMORY[0x263F8EFE0];
  uint64_t v3 = sub_237D75310();
  id v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

void sub_237D71274(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  sub_237D6BAA4();
  swift_getObjectType();
  sub_237D755B0();
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_237D75720();
    if (v7)
    {
LABEL_3:
      BOOL v8 = __OFSUB__(v7, 1);
      unint64_t v9 = v7 - 1;
      if (v8)
      {
        __break(1u);
      }
      else
      {
        sub_237D72D34(v9, (a3 & 0xC000000000000001) == 0, a3);
        if ((a3 & 0xC000000000000001) == 0)
        {
          id v10 = *(id *)(a3 + 8 * v9 + 32);
          goto LABEL_6;
        }
      }
      id v10 = (id)MEMORY[0x237E2F1C0](v9, a3);
LABEL_6:
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      type metadata accessor for StrokeAnimatingLayer();
      id v12 = a1;
      id v13 = v11;
      LOBYTE(v11) = sub_237D75610();

      if (v11)
      {
        swift_beginAccess();
        uint64_t v14 = (unsigned char *)MEMORY[0x237E2F9C0](a4 + 16);
        if (v14)
        {
          v14[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 0;
        }
      }
      return;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_237D713FC()
{
  return sub_237D75670();
}

uint64_t sub_237D714C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_237D714EC(void *a1)
{
  objc_msgSend(a1, sel_locationInView_, v1);
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView), sel_frame);
  v20.x = v3;
  v20.y = v5;
  if (CGRectContainsPoint(v21, v20)
    && (*(unsigned char *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating) & 1) == 0)
  {
    unint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers);
    if (v6)
    {
      if (v6 >> 62)
      {
LABEL_27:
        swift_bridgeObjectRetain_n();
        uint64_t v7 = sub_237D75720();
        if (v7) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (v7)
        {
LABEL_6:
          unint64_t v8 = v6 & 0xC000000000000001;
          uint64_t v9 = 4;
          while (1)
          {
            if (v8) {
              id v10 = (id)MEMORY[0x237E2F1C0](v9 - 4, v6);
            }
            else {
              id v10 = *(id *)(v6 + 8 * v9);
            }
            uint64_t v11 = v10;
            uint64_t v12 = v9 - 3;
            if (__OFADD__(v9 - 4, 1))
            {
              __break(1u);
              goto LABEL_27;
            }
            id v13 = (void *)sub_237D753A0();
            id v14 = objc_msgSend(v11, sel_animationForKey_, v13);

            if (v14) {
              break;
            }
            ++v9;
            if (v12 == v7)
            {
              swift_bridgeObjectRelease();
              if (v7 >= 1)
              {
                swift_bridgeObjectRetain();
                for (uint64_t i = 0; i != v7; ++i)
                {
                  if (v8) {
                    id v16 = (id)MEMORY[0x237E2F1C0](i, v6);
                  }
                  else {
                    id v16 = *(id *)(v6 + 8 * i + 32);
                  }
                  uint64_t v17 = v16;
                  objc_msgSend(v16, sel_removeAllAnimations);
                }
                goto LABEL_19;
              }
              __break(1u);
LABEL_30:
              __break(1u);
              return;
            }
          }
          swift_bridgeObjectRelease_n();
          if (*(void *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos))
          {
            unint64_t v18 = swift_bridgeObjectRetain();
            sub_237D6EDA4(v18);
            goto LABEL_23;
          }
          goto LABEL_30;
        }
      }
LABEL_19:
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      StrokeView.startAnimationRepeating(_:)(0);
    }
  }
}

Swift::Void __swiftcall StrokeView.startAnimationRepeating(_:)(Swift::Bool a1)
{
  CGFloat v3 = v1;
  uint64_t v4 = sub_237D75320();
  OUTLINED_FUNCTION_0_6();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_10_0();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_237D75310();
  OUTLINED_FUNCTION_0_6();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_10_0();
  CGRect v21 = (uint64_t *)(v20 - v19);
  sub_237D75360();
  OUTLINED_FUNCTION_0_6();
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  if ((v3[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] & 1) == 0)
  {
    uint64_t v58 = v17;
    uint64_t v59 = v14;
    uint64_t v60 = v2;
    uint64_t v61 = v8;
    v3[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating] = 1;
    uint64_t v28 = *(void *)(*(void *)&v3[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData]
                    + OBJC_IVAR___SAStrokeDataInternal_strokeNames);
    if (v28)
    {
      uint64_t v29 = v27;
      uint64_t v51 = (char *)&v50 - v25;
      uint64_t v52 = v3;
      uint64_t v54 = v26;
      uint64_t v55 = v24;
      uint64_t v56 = v6;
      uint64_t v57 = v4;
      uint64_t v30 = (void *)MEMORY[0x237E2F9C0](&v3[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate]);
      uint64_t v53 = v10;
      if (v30)
      {
        uint64_t v31 = v30;
        unsigned __int8 v32 = objc_msgSend(v30, sel_respondsToSelector_, sel_animationDidStart);
        swift_bridgeObjectRetain();
        uint64_t v33 = v58;
        if (v32) {
          objc_msgSend(v31, sel_animationDidStart);
        }
        swift_unknownObjectRelease();
        uint64_t v34 = v59;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v33 = v58;
        uint64_t v34 = v59;
      }
      unint64_t v35 = *(void *)(v28 + 16);
      swift_bridgeObjectRelease();
      uint64_t v36 = 3090;
      if (v35 > 0x14) {
        uint64_t v36 = 3400;
      }
      if (v35 >= 0xA) {
        uint64_t v37 = v36;
      }
      else {
        uint64_t v37 = 2450;
      }
      sub_237D73CEC(0, (unint64_t *)&unk_2689489B0);
      uint64_t v59 = sub_237D75550();
      uint64_t v38 = v29;
      sub_237D75350();
      *CGRect v21 = v37;
      (*(void (**)(uint64_t *, void, uint64_t))(v33 + 104))(v21, *MEMORY[0x263F8F000], v15);
      id v39 = v51;
      MEMORY[0x237E2EEA0](v38, v21);
      (*(void (**)(uint64_t *, uint64_t))(v33 + 8))(v21, v15);
      uint64_t v40 = v55;
      uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v41(v38, v55);
      uint64_t v42 = swift_allocObject();
      uint64_t v43 = v52;
      *(void *)(v42 + 16) = v52;
      aBlock[4] = sub_237D72EA4;
      aBlock[5] = v42;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_237D6D158;
      aBlock[3] = &block_descriptor_1;
      uint64_t v44 = _Block_copy(aBlock);
      id v45 = v43;
      swift_release();
      sub_237D75330();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_237D73B40((unint64_t *)&qword_268948DE0, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268948D18);
      sub_237D73A94((unint64_t *)&qword_268948DF0, &qword_268948D18);
      uint64_t v46 = v60;
      sub_237D75670();
      BOOL v47 = (void *)v59;
      MEMORY[0x237E2F060](v39, v34, v46, v44);
      _Block_release(v44);

      OUTLINED_FUNCTION_15_0();
      v48();
      OUTLINED_FUNCTION_15_0();
      v49();
      v41((uint64_t)v39, v40);
    }
    else
    {
      sub_237D6F208();
    }
  }
}

Swift::Void __swiftcall StrokeView.layoutSubviews()()
{
  v6.receiver = v0;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  id v1 = *(id *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView];
  objc_msgSend(v0, sel_center);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1();

  id v2 = *(id *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1();

  CGFloat v3 = *(void **)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel];
  if (v3)
  {
    id v4 = v3;
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_4_1();
  }
  id v5 = *(id *)&v0[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1();

  sub_237D6F98C();
}

CGSize __swiftcall StrokeView.sizeThatFits(_:)(CGSize a1)
{
  CGFloat width = a1.width;
  sub_237D6B828();
  double v4 = v3 + 40.0 + 10.0;
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v6, sel_bounds);
    v12.origin.x = 0.0;
    v12.origin.y = 0.0;
    v12.size.CGFloat width = 0.0;
    v12.size.height = 0.0;
    BOOL v7 = CGRectEqualToRect(v11, v12);

    if (!v7) {
      double v4 = v4 + 40.0;
    }
  }
  double v8 = width;
  double v9 = v4;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

Swift::Void __swiftcall StrokeView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  id v2 = v1;
  Class isa = a1.value.super.isa;
  v40.receiver = v1;
  v40.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v40, sel_traitCollectionDidChange_, isa);
  id v4 = objc_msgSend(v1, sel_traitCollection);
  unint64_t v5 = (unint64_t)objc_msgSend(v4, sel_hasDifferentColorAppearanceComparedToTraitCollection_, isa);

  if (v5)
  {
    uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationLayers];
    if (v6)
    {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
      id v39 = v2;
      if ((unint64_t)v6 >> 62) {
        goto LABEL_36;
      }
      uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8) {
        goto LABEL_5;
      }
LABEL_11:
      swift_bridgeObjectRelease();
      uint64_t v20 = *(void **)&v39[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer];
      if (v20)
      {
        CGRect v21 = self;
        id v22 = v20;
        id v23 = objc_msgSend(v21, sel_tertiaryLabelColor);
        id v24 = objc_msgSend(v23, sel_CGColor);

        objc_msgSend(v22, sel_setStrokeColor_, v24);
      }
      unint64_t v25 = sub_237D737A0(objc_msgSend(*(id *)&v39[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView], sel_layer));
      if (v25)
      {
        unint64_t v5 = v25;
        if (v25 >> 62) {
          goto LABEL_42;
        }
        for (uint64_t i = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_237D75720())
        {
          uint64_t v27 = 4;
          while (1)
          {
            id v28 = (v5 & 0xC000000000000001) != 0
                ? (id)MEMORY[0x237E2F1C0](v27 - 4, v5)
                : *(id *)(v5 + 8 * v27);
            uint64_t v6 = (uint64_t)v28;
            uint64_t v29 = v27 - 3;
            if (__OFADD__(v27 - 4, 1)) {
              break;
            }
            uint64_t v30 = sub_237D73818(v28);
            if (v31)
            {
              if (v30 == 0x645F656B6F727473 && v31 == 0xEA0000000000746FLL)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                char v33 = sub_237D75750();
                swift_bridgeObjectRelease();
                if ((v33 & 1) == 0) {
                  goto LABEL_31;
                }
              }
              self;
              uint64_t v34 = swift_dynamicCastObjCClass();
              if (!v34)
              {
                swift_bridgeObjectRelease();

                return;
              }
              unint64_t v35 = (void *)v34;
              uint64_t v36 = self;
              id v37 = (id)v6;
              id v38 = objc_msgSend(v36, sel_tertiaryLabelColor);
              uint64_t v6 = (uint64_t)objc_msgSend(v38, sel_CGColor);

              objc_msgSend(v35, sel_setStrokeColor_, v6);
            }
LABEL_31:

            ++v27;
            if (v29 == i) {
              goto LABEL_32;
            }
          }
          __break(1u);
LABEL_36:
          if (v6 >= 0) {
            unint64_t v5 = v7;
          }
          else {
            unint64_t v5 = v6;
          }
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_237D75720();
          if (!v8) {
            goto LABEL_11;
          }
LABEL_5:
          if (v8 >= 1)
          {
            sub_237D73CEC(0, &qword_268948DF8);
            sub_237D73CEC(0, (unint64_t *)&unk_268948E00);
            double v9 = self;
            uint64_t v10 = 0;
            uint64_t v11 = *MEMORY[0x263F15AB0];
            do
            {
              if ((v6 & 0xC000000000000001) != 0) {
                id v12 = (id)MEMORY[0x237E2F1C0](v10, v6);
              }
              else {
                id v12 = *(id *)(v6 + 8 * v10 + 32);
              }
              uint64_t v13 = v12;
              ++v10;
              id v14 = sub_237D72B34(0x6F43656B6F727473, 0xEB00000000726F6CLL);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
              uint64_t v15 = swift_allocObject();
              *(_OWORD *)(v15 + 16) = xmmword_237D760B0;
              *(void *)(v15 + 32) = sub_237D75600();
              sub_237D75480();
              sub_237D73714(v15, v14, (SEL *)&selRef_setKeyTimes_);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268948E10);
              uint64_t v16 = swift_allocObject();
              *(_OWORD *)(v16 + 16) = xmmword_237D76220;
              id v17 = objc_msgSend(v9, sel_labelColor);
              id v18 = objc_msgSend(v17, sel_CGColor);

              type metadata accessor for CGColor(0);
              *(void *)(v16 + 56) = v19;
              *(void *)(v16 + 32) = v18;
              sub_237D7361C(v16, v14);
              objc_msgSend(v14, sel_setFillMode_, v11);
              objc_msgSend(v14, sel_setRemovedOnCompletion_, 0);
              sub_237D73698((uint64_t)v14, 0x656B6F7274535253, 0xED0000726F6C6F43, v13);
            }
            while (v8 != v10);
            goto LABEL_11;
          }
          __break(1u);
LABEL_42:
          ;
        }
LABEL_32:
        swift_bridgeObjectRelease();
      }
    }
  }
}

Swift::Void __swiftcall StrokeView.updateStrokeAnimation(with:)(Swift::String with)
{
  sub_237D6D838();
  if (*(void *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos))
  {
    unint64_t v2 = swift_bridgeObjectRetain();
    sub_237D6EDA4(v2);
    swift_bridgeObjectRelease();
    sub_237D6F208();
  }
}

id StrokeView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall StrokeView.update(with:)(SAStrokeData with)
{
  id v2 = [(objc_class *)with.super.isa underlyingObject];
  uint64_t v3 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData;
  id v4 = *(void **)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData];
  *(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData] = v2;

  unint64_t v5 = (uint64_t *)(*(void *)&v1[v3] + OBJC_IVAR___SAStrokeDataInternal_strokeAnimationRepresention);
  uint64_t v7 = *v5;
  unint64_t v6 = v5[1];
  uint64_t v8 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v6 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(v6) & 0xF;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v9)
  {
    sub_237D6D838();
    sub_237D6EC24();
    if (*(void *)&v1[OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokePathInfos])
    {
      unint64_t v10 = swift_bridgeObjectRetain();
      sub_237D6EDA4(v10);
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v1, sel_setNeedsLayout);
    StrokeView.startAnimationRepeating(_:)(0);
  }
  else
  {
    if (qword_268948980 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_237D752F0();
    __swift_project_value_buffer(v11, (uint64_t)qword_2689490B0);
    oslog = sub_237D752E0();
    os_log_type_t v12 = sub_237D754D0();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_237D5B000, oslog, v12, "strokeAnimationRepresention is empty,so can't render animation!", v13, 2u);
      OUTLINED_FUNCTION_12_0();
    }
  }
}

id sub_237D7280C(id a1)
{
  return a1;
}

void StrokeView.interactionDelegate.getter()
{
}

uint64_t StrokeView.interactionDelegate.setter()
{
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*StrokeView.interactionDelegate.modify(void *a1))()
{
  uint64_t v2 = OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = MEMORY[0x237E2F9C0](v1 + v2);
  return sub_237D72934;
}

uint64_t sub_237D72934()
{
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall StrokeView.endAnimation()()
{
  uint64_t v1 = v0;
  if (qword_268948980 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_237D752F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2689490B0);
  uint64_t v3 = sub_237D752E0();
  os_log_type_t v4 = sub_237D754B0();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_237D5B000, v3, v4, "stop stroke animation and tell the delegate to cancel tts readout.", v5, 2u);
    OUTLINED_FUNCTION_12_0();
  }

  unint64_t v6 = (void *)MEMORY[0x237E2F9C0](v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate);
  if (v6)
  {
    uint64_t v7 = v6;
    if (objc_msgSend(v6, sel_respondsToSelector_, sel_animationDidEnd)) {
      objc_msgSend(v7, sel_animationDidEnd);
    }
    swift_unknownObjectRelease();
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_isAnimating) = 0;
}

id sub_237D72B34(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)sub_237D753A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_animationWithKeyPath_, v2);

  return v3;
}

id sub_237D72BA4(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[3];
  if (v4)
  {
    unint64_t v6 = __swift_project_boxed_opaque_existential_0(a1, a1[3]);
    uint64_t v7 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v6);
    uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_237D75740();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(v2, sel_initWithTarget_action_, v10, a2);
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_237D72CE8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_237D72CF8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unint64_t sub_237D72D34(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_237D72D5C(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_237D75490();
  }
  return result;
}

unsigned char **sub_237D72D88(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *CGSize result = v4 + 1;
  return result;
}

uint64_t sub_237D72D98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_237D72EE0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_237D7395C((uint64_t)v12, *a3);
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
      sub_237D7395C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_237D72E6C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_237D72EA4()
{
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

uint64_t sub_237D72EE0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_237D73038((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_237D75650();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_237D73110(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_237D756A0();
    if (!v8)
    {
      uint64_t result = sub_237D75700();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_237D73038(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_237D75730();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_237D73110(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_237D731A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_237D73384(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_237D73384((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_237D731A8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_237D75410();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_237D7331C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_237D75680();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_237D75730();
  __break(1u);
LABEL_14:
  uint64_t result = sub_237D75700();
  __break(1u);
  return result;
}

void *sub_237D7331C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268948F48);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_237D73384(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268948F48);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_237D73534(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_237D7345C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_237D7345C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_237D75730();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_237D73534(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_237D75730();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_237D735C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_237D753A0();
  objc_msgSend(a3, sel_setText_, v4);
}

void sub_237D7361C(uint64_t a1, void *a2)
{
  id v3 = (id)sub_237D75450();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setValues_, v3);
}

void sub_237D7368C(uint64_t a1, void *a2)
{
}

void sub_237D73698(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (id)sub_237D753A0();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_addAnimation_forKey_, a1, v6);
}

void sub_237D73714(uint64_t a1, void *a2, SEL *a3)
{
  sub_237D73CEC(0, (unint64_t *)&unk_268948E00);
  id v5 = (id)sub_237D75450();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a3, v5);
}

uint64_t sub_237D737A0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_sublayers);

  if (!v2) {
    return 0;
  }
  sub_237D73CEC(0, &qword_268948F40);
  uint64_t v3 = sub_237D75460();

  return v3;
}

uint64_t sub_237D73818(void *a1)
{
  id v1 = objc_msgSend(a1, sel_name);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_237D753B0();

  return v3;
}

uint64_t type metadata accessor for StrokeView()
{
  return self;
}

uint64_t sub_237D738A0(uint64_t a1)
{
  return a1;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_237D7395C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237D739BC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_237D739F4()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_237D73A3C()
{
  return sub_237D709E8(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_237D73A4C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_237D73A5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237D73A6C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_237D73A94(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_237D73AE4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_237D73B34()
{
  sub_237D71274(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_237D73B40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237D73B88(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_237D73BE8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_15_0();
  v3();
  return a1;
}

uint64_t sub_237D73C38(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_15_0();
  v3();
  return a1;
}

uint64_t sub_237D73C8C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_237D73CEC(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_237D75340();
}

id OUTLINED_FUNCTION_4_1()
{
  return objc_msgSend(v0, (SEL)(v1 + 3352), v3);
}

id OUTLINED_FUNCTION_5_0()
{
  return StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

id OUTLINED_FUNCTION_7_0()
{
  return [v0 (SEL)(v1 + 3213)];
}

id OUTLINED_FUNCTION_8_0(uint64_t a1, const char *a2)
{
  return objc_msgSendSuper2((objc_super *)(v2 - 136), a2, v7, v6, v5, v4);
}

id OUTLINED_FUNCTION_9_0()
{
  return [v0 (SEL)(v1 + 3213)];
}

void OUTLINED_FUNCTION_12_0()
{
  JUMPOUT(0x237E2F950);
}

double OUTLINED_FUNCTION_13_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_14_0()
{
  return 0xD00000000000001FLL;
}

double sub_237D73EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = sub_237D753E0();
    if ((unint64_t)(v3 - 1) >= 5) {
      return 0.9;
    }
    else {
      return dbl_237D76E58[v3 - 1];
    }
  }
  else
  {
    double result = (double)a3 * 0.06;
    if (result <= 0.55) {
      double result = 0.55;
    }
    if (result > 1.1) {
      return 1.1;
    }
  }
  return result;
}

id sub_237D73F38(double a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  sub_237D74F50(0, &qword_268948DF8);
  id v9 = OUTLINED_FUNCTION_0_7();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268948E10);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v10 + 16) = xmmword_237D76210;
  *(void *)(v10 + 32) = 0;
  *(void *)(v10 + 88) = v11;
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = 1;
  sub_237D7361C(v10, v9);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_237D76DB0;
  sub_237D74F50(0, (unint64_t *)&unk_268948E00);
  *(void *)(v12 + 32) = sub_237D75600();
  *(void *)(v12 + 40) = sub_237D75600();
  sub_237D75480();
  sub_237D7368C(v12, v9);
  objc_msgSend(v9, sel_setDuration_, a1);
  objc_msgSend(v9, sel_setFillMode_, *MEMORY[0x263F15AB0]);
  objc_msgSend(v9, sel_setRemovedOnCompletion_, 0);
  uint64_t v13 = sub_237D741D8(a3, a4, a5);
  sub_237D74E50(v13, v9);
  objc_msgSend(v9, sel_setCalculationMode_, *MEMORY[0x263F15958]);
  return v9;
}

id sub_237D740D8(double a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  sub_237D74F50(0, &qword_268948DF8);
  id v11 = OUTLINED_FUNCTION_0_7();
  uint64_t v12 = sub_237D74700(a3);
  sub_237D7361C((uint64_t)v12, v11);
  sub_237D74ED4(a3, v11);
  objc_msgSend(v11, sel_setDuration_, a1);
  objc_msgSend(v11, sel_setFillMode_, *MEMORY[0x263F15AB0]);
  objc_msgSend(v11, sel_setRemovedOnCompletion_, 0);
  uint64_t v13 = sub_237D741D8(a4, a5, a6);
  sub_237D74E50(v13, v11);
  objc_msgSend(v11, sel_setCalculationMode_, *MEMORY[0x263F15958]);
  return v11;
}

uint64_t sub_237D741D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v4 = *(void *)(a1 + 16);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_237D760B0;
      if (v4 == 4)
      {
        float v6 = *(double *)(a1 + 32);
        float v7 = *(double *)(a1 + 40);
        float v8 = *(double *)(a1 + 48);
        float v9 = *(double *)(a1 + 56);
        id v10 = objc_allocWithZone(MEMORY[0x263F15808]);
        *(float *)&double v11 = v6;
        *(float *)&double v12 = v7;
        *(float *)&double v13 = v8;
        *(float *)&double v14 = v9;
        id v15 = objc_msgSend(v10, sel_initWithControlPoints__::, v11, v12, v13, v14);
LABEL_15:
        *(void *)(v5 + 32) = v15;
        sub_237D75480();
        return v5;
      }
      id v20 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EC8]);
    }
    else
    {
LABEL_13:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_237D760B0;
      id v20 = objc_msgSend(self, sel_functionWithName_, *MEMORY[0x263F15EB0]);
    }
    id v15 = v20;
    goto LABEL_15;
  }
  switch(a2)
  {
    case 2:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_237D76DB0;
      if (qword_2689489A8 != -1) {
        swift_once();
      }
      uint64_t v16 = (void *)qword_2689490F0;
      *(void *)(v5 + 32) = qword_2689490F0;
      uint64_t v17 = qword_2689489A0;
      id v18 = v16;
      if (v17 != -1) {
        swift_once();
      }
      uint64_t v19 = (void *)qword_2689490E8;
      *(void *)(v5 + 40) = qword_2689490E8;
      break;
    case 3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_237D76E30;
      if (qword_2689489A8 == -1) {
        goto LABEL_19;
      }
      goto LABEL_29;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_237D76E30;
      if (qword_2689489A8 == -1) {
        goto LABEL_19;
      }
LABEL_29:
      swift_once();
LABEL_19:
      CGRect v21 = (void *)qword_2689490F0;
      *(void *)(v5 + 32) = qword_2689490F0;
      uint64_t v22 = *MEMORY[0x263F15EC8];
      id v23 = self;
      id v24 = v21;
      *(void *)(v5 + 40) = objc_msgSend(v23, sel_functionWithName_, v22);
      if (qword_2689489A0 != -1) {
        swift_once();
      }
      uint64_t v19 = (void *)qword_2689490E8;
      *(void *)(v5 + 48) = qword_2689490E8;
      break;
    case 5:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689489F0);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_237D76E20;
      if (qword_2689489A8 != -1) {
        swift_once();
      }
      unint64_t v25 = (void *)qword_2689490F0;
      *(void *)(v5 + 32) = qword_2689490F0;
      uint64_t v26 = *MEMORY[0x263F15EC8];
      uint64_t v27 = self;
      id v28 = v25;
      *(void *)(v5 + 40) = objc_msgSend(v27, sel_functionWithName_, v26);
      *(void *)(v5 + 48) = v28;
      uint64_t v29 = qword_2689489A0;
      id v30 = v28;
      if (v29 != -1) {
        swift_once();
      }
      uint64_t v19 = (void *)qword_2689490E8;
      *(void *)(v5 + 56) = qword_2689490E8;
      break;
    default:
      goto LABEL_13;
  }
  sub_237D75480();
  id v31 = v19;
  return v5;
}

char *sub_237D74700(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_237D75720();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  double result = sub_237D74D4C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x237E2F1C0](i, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      sub_237D74F50(0, (unint64_t *)&unk_268948E00);
      swift_dynamicCast();
      uint64_t v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237D74D4C(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v7 = *(void *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_237D74D4C((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v10;
      }
      *(void *)(v3 + 16) = v8 + 1;
      sub_237D74F8C(&v9, (_OWORD *)(v3 + 32 * v8 + 32));
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

double sub_237D748A4(char a1)
{
  return dbl_237D76E80[a1];
}

uint64_t sub_237D748B8(char a1)
{
  return qword_237D76EB0[a1];
}

uint64_t sub_237D748CC(char a1)
{
  uint64_t result = 68;
  switch(a1)
  {
    case 1:
      uint64_t result = 72;
      break;
    case 2:
      uint64_t result = 83;
      break;
    case 3:
      uint64_t result = 84;
      break;
    case 4:
      uint64_t result = 80;
      break;
    case 5:
      uint64_t result = 78;
      break;
    case 6:
      uint64_t result = 23112;
      break;
    case 7:
      uint64_t result = 18248;
      break;
    case 8:
      uint64_t result = 20552;
      break;
    case 9:
      uint64_t result = 4676168;
      break;
    case 10:
      uint64_t result = 5921352;
      break;
    case 11:
      uint64_t result = 5724744;
      break;
    case 12:
      uint64_t result = 5528136;
      break;
    case 13:
      uint64_t result = 4675656;
      break;
    case 14:
      uint64_t result = 1196907080;
      break;
    case 15:
      uint64_t result = 1197103688;
      break;
    case 16:
      uint64_t result = 1348098632;
      break;
    case 17:
      uint64_t result = 1515870792;
      break;
    case 18:
      uint64_t result = 1196904520;
      break;
    case 19:
      uint64_t result = 17488;
      break;
    case 20:
      uint64_t result = 23120;
      break;
    case 21:
      uint64_t result = 18256;
      break;
    case 22:
      uint64_t result = 18259;
      break;
    case 23:
      uint64_t result = 20563;
      break;
    case 24:
      uint64_t result = 21587;
      break;
    case 25:
      uint64_t result = 22355;
      break;
    case 26:
      uint64_t result = 5921363;
      break;
    case 27:
      uint64_t result = 4675411;
      break;
    case 28:
      uint64_t result = 5266003;
      break;
    case 29:
      uint64_t result = 1197103699;
      break;
    case 30:
      uint64_t result = 18263;
      break;
    case 31:
      uint64_t result = 18264;
      break;
    case 32:
      uint64_t result = 4681559;
      break;
    default:
      return result;
  }
  return result;
}

id sub_237D74B34()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F15808]);
  LODWORD(v1) = 1055957975;
  LODWORD(v2) = 1061075026;
  LODWORD(v3) = 1060571709;
  id result = objc_msgSend(v0, sel_initWithControlPoints__::, v1, 0.0, v2, v3);
  qword_2689490E8 = (uint64_t)result;
  return result;
}

id sub_237D74B84()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F15808]);
  LODWORD(v1) = 1053273620;
  LODWORD(v2) = 1058222899;
  LODWORD(v3) = 1058055127;
  LODWORD(v4) = 1.0;
  id result = objc_msgSend(v0, sel_initWithControlPoints__::, v1, v2, v3, v4);
  qword_2689490F0 = (uint64_t)result;
  return result;
}

char *sub_237D74BD4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_237D75730();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_237D74C68(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 32 * a2 > a1) ? (v6 = a1 + 32 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = sub_237D75730();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return MEMORY[0x270FA01C8](v7, v5);
}

char *sub_237D74D4C(char *a1, int64_t a2, char a3)
{
  id result = sub_237D74D6C(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_237D74D6C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268948E10);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v12 = v10 + 32;
  double v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_237D74BD4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_237D74C68((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_237D74E50(uint64_t a1, void *a2)
{
  sub_237D74F50(0, &qword_268948FB0);
  id v3 = (id)sub_237D75450();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTimingFunctions_, v3);
}

void sub_237D74ED4(uint64_t a1, void *a2)
{
  sub_237D74F50(0, (unint64_t *)&unk_268948E00);
  id v3 = (id)sub_237D75450();
  objc_msgSend(a2, sel_setKeyTimes_, v3);
}

uint64_t sub_237D74F50(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_237D74F8C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id OUTLINED_FUNCTION_0_7()
{
  return sub_237D72B34(0x6E45656B6F727473, 0xE900000000000064);
}

uint64_t sub_237D74FCC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_237D75000()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_237D75010()
{
  return MEMORY[0x270EEDC30]();
}

uint64_t sub_237D75020()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_237D75030()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_237D75040()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_237D75050()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_237D75060()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_237D75070()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_237D75080()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_237D75090()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s15StrokeAnimation06_ProtoaB14RepresentationV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_237D750B0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_237D750C0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_237D750D0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_237D750E0()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_237D75110()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_237D75120()
{
  return MEMORY[0x270F44B30]();
}

uint64_t sub_237D75130()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_237D75140()
{
  return MEMORY[0x270F44B90]();
}

uint64_t sub_237D75150()
{
  return MEMORY[0x270F44BB8]();
}

uint64_t sub_237D75160()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_237D75170()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_237D75180()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_237D75190()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_237D751A0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_237D751B0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_237D751C0()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_237D751D0()
{
  return MEMORY[0x270F44CC0]();
}

uint64_t sub_237D751E0()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_237D751F0()
{
  return MEMORY[0x270F44D20]();
}

uint64_t sub_237D75200()
{
  return MEMORY[0x270F44D40]();
}

uint64_t sub_237D75210()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_237D75230()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_237D75240()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_237D75250()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_237D75260()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_237D75270()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_237D75280()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_237D75290()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_237D752A0()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_237D752B0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_237D752C0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_237D752D0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_237D752E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_237D752F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_237D75300()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_237D75310()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_237D75320()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_237D75330()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_237D75340()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_237D75350()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_237D75360()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_237D75370()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_237D75380()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_237D75390()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_237D753A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_237D753B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_237D753C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_237D753D0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_237D753E0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_237D753F0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_237D75400()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_237D75410()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_237D75420()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_237D75440()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_237D75450()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_237D75460()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_237D75470()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_237D75480()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_237D75490()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_237D754A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_237D754B0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_237D754C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_237D754D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_237D754E0()
{
  return MEMORY[0x270EE5898]();
}

uint64_t sub_237D754F0()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_237D75500()
{
  return MEMORY[0x270EE58D8]();
}

uint64_t sub_237D75510()
{
  return MEMORY[0x270EE58F0]();
}

uint64_t sub_237D75520()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_237D75530()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_237D75540()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_237D75550()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_237D75560()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_237D75570()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_237D75580()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_237D75590()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_237D755A0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_237D755B0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_237D755C0()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_237D755D0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_237D755E0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_237D755F0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_237D75600()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_237D75610()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_237D75620()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_237D75630()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_237D75640()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_237D75650()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_237D75660()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_237D75670()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_237D75680()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_237D75690()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_237D756A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_237D756B0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_237D756C0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_237D756D0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_237D756E0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_237D756F0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_237D75700()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_237D75710()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_237D75720()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_237D75730()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_237D75740()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_237D75750()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_237D75760()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_237D75770()
{
  return MEMORY[0x270F9FC90]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x270EE7038](path);
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

uint64_t CGSVGAttributeGetTransform()
{
  return MEMORY[0x270F233B8]();
}

uint64_t CGSVGAttributeMapGetAttribute()
{
  return MEMORY[0x270F233D0]();
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x270F23418]();
}

uint64_t CGSVGDocumentGetRootNode()
{
  return MEMORY[0x270F23440]();
}

uint64_t CGSVGNodeEnumerate()
{
  return MEMORY[0x270F23480]();
}

uint64_t CGSVGNodeGetAttributeMap()
{
  return MEMORY[0x270F234B0]();
}

uint64_t CGSVGNodeGetType()
{
  return MEMORY[0x270F234E0]();
}

uint64_t CGSVGPathCreateCGPath()
{
  return MEMORY[0x270F23528]();
}

uint64_t CGSVGShapeNodeGetPath()
{
  return MEMORY[0x270F23568]();
}

uint64_t CGSVGShapeNodeGetPrimitive()
{
  return MEMORY[0x270F23578]();
}

uint64_t CGSVGViewBoxNodeGetViewbox()
{
  return MEMORY[0x270F235B8]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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