uint64_t sub_2605BABF4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  BOOL v7;

  result = sub_2605BACD4(a1, a2);
  if (!result)
  {
    type metadata accessor for AccessibilityActionPerformer();
    sub_2605CA05C(2068);
    v5 = self;
    objc_msgSend(v5, sel_sleepForTimeInterval_, 0.3);
    result = sub_2605BACD4(a1, a2);
    if (!result)
    {
      if (sub_2605CA05C(2006))
      {
        v6 = 5;
        do
        {
          objc_msgSend(v5, sel_sleepForTimeInterval_, 0.3);
          result = sub_2605BACD4(a1, a2);
          if (result) {
            break;
          }
          if (!--v6) {
            return 0;
          }
          v7 = sub_2605CA05C(2006);
          result = 0;
        }
        while (v7);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2605BACD4(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v45 = a1;
  *((void *)&v45 + 1) = a2;
  id v2 = objc_msgSend(self, sel_systemWideElement);
  if (!v2)
  {
    __break(1u);
    goto LABEL_41;
  }
  v3 = v2;
  id v4 = objc_msgSend(v2, sel_systemApplication);
  if (!v4)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    uint64_t result = sub_2605E2F60();
    __break(1u);
    return result;
  }
  isUniquelyReferenced_nonNull_native = v4;
  unint64_t v49 = MEMORY[0x263F8EE78];
  uint64_t v6 = sub_2605BC9A8(v4);
  if (!v6) {
    goto LABEL_42;
  }
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v8 = MEMORY[0x263F8D310];
  if (v7)
  {
    v43 = isUniquelyReferenced_nonNull_native;
    v44 = v3;
    uint64_t v9 = v6 + 32;
    while (1)
    {
      sub_2605BBBC8(v9, (uint64_t)&v47);
      sub_2605BBCFC(0, (unint64_t *)&qword_26A88BD50);
      if (swift_dynamicCast())
      {
        v3 = *(void **)&v46[0];
        uint64_t v48 = v8;
        long long v47 = v45;
        sub_2605BBD38(&v47, v46);
        swift_bridgeObjectRetain();
        uint64_t v10 = MEMORY[0x263F8EE80];
        isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
        unint64_t v11 = sub_2605BC06C();
        uint64_t v13 = *(void *)(v10 + 16);
        BOOL v14 = (v12 & 1) == 0;
        unint64_t v15 = v13 + v14;
        if (__OFADD__(v13, v14))
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          sub_2605BC094();
          uint64_t v39 = sub_2605E2E40();
          swift_bridgeObjectRelease();
          goto LABEL_31;
        }
        unint64_t v16 = v11;
        char v17 = v12;
        uint64_t v8 = sub_2605BBCB8(&qword_26A88BD58);
        if (sub_2605E2E20())
        {
          unint64_t v18 = sub_2605BC06C();
          if ((v17 & 1) != (v19 & 1)) {
            goto LABEL_43;
          }
          unint64_t v16 = v18;
        }
        if (v17)
        {
          v20 = (_OWORD *)(*(void *)(v10 + 56) + 32 * v16);
          sub_2605BBC68((uint64_t)v20);
          sub_2605BBD38(v46, v20);
        }
        else
        {
          sub_2605BBFEC();
          void *v21 = 0x6554686372616573;
          v21[1] = 0xEA00000000007478;
          sub_2605BBD38(v46, (_OWORD *)(*(void *)(v10 + 56) + 32 * v16));
          uint64_t v22 = *(void *)(v10 + 16);
          BOOL v23 = __OFADD__(v22, 1);
          uint64_t v24 = v22 + 1;
          if (v23) {
            goto LABEL_37;
          }
          *(void *)(v10 + 16) = v24;
        }
        swift_bridgeObjectRelease();
        unint64_t v15 = (unint64_t)objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 5);
        uint64_t v48 = sub_2605BBCFC(0, &qword_26A88BD40);
        *(void *)&long long v47 = v15;
        sub_2605BBD38(&v47, v46);
        isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
        unint64_t v25 = sub_2605BC014();
        char v27 = v26;
        if (__OFADD__(*(void *)(v10 + 16), (v26 & 1) == 0)) {
          goto LABEL_36;
        }
        unint64_t v28 = v25;
        char v29 = sub_2605E2E20();
        uint64_t v8 = MEMORY[0x263F8D310];
        if (v29)
        {
          unint64_t v30 = sub_2605BC014();
          if ((v27 & 1) != (v31 & 1)) {
            goto LABEL_43;
          }
          unint64_t v28 = v30;
        }
        if (v27)
        {
          v32 = (_OWORD *)(*(void *)(v10 + 56) + 32 * v28);
          sub_2605BBC68((uint64_t)v32);
          sub_2605BBD38(v46, v32);
        }
        else
        {
          sub_2605BBFEC();
          void *v33 = 0x694C746C75736572;
          v33[1] = 0xEB0000000074696DLL;
          sub_2605BBD38(v46, (_OWORD *)(*(void *)(v10 + 56) + 32 * v28));
          uint64_t v34 = *(void *)(v10 + 16);
          BOOL v23 = __OFADD__(v34, 1);
          uint64_t v35 = v34 + 1;
          if (v23) {
            goto LABEL_38;
          }
          *(void *)(v10 + 16) = v35;
        }
        swift_bridgeObjectRelease();
        v36 = (void *)sub_2605E2870();
        swift_bridgeObjectRelease();
        id v37 = objc_msgSend(v3, sel_elementsForAttribute_parameter_, 92516, v36);

        if (v37)
        {
          unint64_t v38 = sub_2605E2B40();

          sub_2605BB1DC(v38);
        }
      }
      v9 += 32;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        unint64_t v15 = v49;
        isUniquelyReferenced_nonNull_native = v43;
        v3 = v44;
        goto LABEL_29;
      }
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v15 = MEMORY[0x263F8EE78];
LABEL_29:
  if (v15 >> 62) {
    goto LABEL_39;
  }
  uint64_t v39 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_31:
  if (v39 < 1)
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_2605E3700;
    *(void *)(v41 + 56) = v8;
    sub_2605BC040(v41, 0xD000000000000025);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return 0;
  }
  else
  {
    sub_2605C39C0(0, 1, v15);
    id v40 = *(id *)(v15 + 32);
    swift_bridgeObjectRelease();
  }
  return (uint64_t)v40;
}

uint64_t sub_2605BB1DC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2605E2E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2605E2E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x261215E70](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_2605BBA38(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2605E2E40();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_2605E2B60();
}

uint64_t sub_2605BB3A4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2605E2A10();
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(*v3 + 16);
  uint64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = v6;
  if (!swift_isUniquelyReferenced_nonNull_native() || (uint64_t v11 = *(void *)(v7 + 24) >> 1, v11 < v9))
  {
    sub_2605C2E4C();
    uint64_t v7 = v12;
    uint64_t v11 = *(void *)(v12 + 24) >> 1;
  }
  uint64_t v13 = *(void *)(v7 + 16);
  uint64_t v14 = v11 - v13;
  uint64_t v15 = (uint64_t)sub_2605BBDE4(&v27, (uint64_t *)(v7 + 16 * v13 + 32), v11 - v13, a1, a2);
  if (v15 < v10) {
    goto LABEL_12;
  }
  if (v15 >= 1)
  {
    uint64_t v16 = *(void *)(v7 + 16);
    BOOL v17 = __OFADD__(v16, v15);
    uint64_t v18 = v16 + v15;
    if (v17)
    {
      __break(1u);
      goto LABEL_22;
    }
    *(void *)(v7 + 16) = v18;
  }
  if (v15 == v14)
  {
LABEL_13:
    a1 = *(void *)(v7 + 16);
    uint64_t v20 = sub_2605E2A60();
    if (!v21) {
      goto LABEL_10;
    }
    while (1)
    {
      uint64_t v22 = *(void *)(v7 + 24) >> 1;
      if (v22 < a1 + 1)
      {
        uint64_t v24 = v20;
        uint64_t v25 = v21;
        sub_2605C2E4C();
        uint64_t v21 = v25;
        uint64_t v7 = v26;
        uint64_t v20 = v24;
        uint64_t v22 = *(void *)(v7 + 24) >> 1;
      }
      if (a1 < v22) {
        break;
      }
LABEL_20:
      *(void *)(v7 + 16) = a1;
    }
    BOOL v23 = (void *)(v7 + 16 * a1 + 40);
    while (1)
    {
      *(v23 - 1) = v20;
      *BOOL v23 = v21;
      ++a1;
      uint64_t v20 = sub_2605E2A60();
      if (!v21) {
        break;
      }
      v23 += 2;
      if (a1 >= v22) {
        goto LABEL_20;
      }
    }
LABEL_22:
    *(void *)(v7 + 16) = a1;
  }
LABEL_10:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t *v3 = v7;
  return result;
}

void *sub_2605BB544(unsigned int a1)
{
  uint64_t result = objc_msgSend(self, sel_systemWideElement);
  if (!result)
  {
    __break(1u);
    goto LABEL_40;
  }
  unint64_t v4 = (unint64_t)result;
  uint64_t result = objc_msgSend(result, sel_systemApplication);
  if (!result)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v5 = result;
  unint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t result = (void *)sub_2605BC9A8(result);
  if (!result)
  {
LABEL_41:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t v7 = result[2];
  if (v7)
  {
    uint64_t v21 = v5;
    unint64_t v22 = v4;
    unint64_t v8 = 0;
    uint64_t v5 = result + 4;
    uint64_t v24 = result[2];
    uint64_t v25 = result;
    BOOL v23 = result + 4;
    while (1)
    {
      if (v8 >= v6[2])
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        sub_2605BC094();
        uint64_t v17 = sub_2605E2E40();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      sub_2605BBBC8((uint64_t)v5 + 32 * v8, (uint64_t)v26);
      sub_2605BBC24(v26, v26[3]);
      uint64_t v9 = (void *)sub_2605E2F30();
      sub_2605BBC68((uint64_t)v26);
      sub_2605BBCB8(&qword_26A88BD38);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_2605E3710;
      unint64_t v1 = 0x263F08A18uLL;
      *(void *)(v10 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, 0);
      *(void *)(v10 + 40) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, 1);
      sub_2605E2B60();
      sub_2605BBCFC(0, &qword_26A88BD40);
      unint64_t v4 = sub_2605E2B30();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v9, sel_elementsForAttribute_parameter_, 94500, v4);

      if (v11)
      {
        sub_2605BBCFC(0, (unint64_t *)&qword_26A88BD50);
        unint64_t v4 = sub_2605E2B40();

        if (v4 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_2605E2E40();
          swift_bridgeObjectRelease();
          if (!v12)
          {
LABEL_23:
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v12 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v12) {
            goto LABEL_23;
          }
        }
        if (v12 < 1) {
          goto LABEL_36;
        }
        uint64_t v13 = 0;
        unint64_t v1 = v4 & 0xC000000000000001;
        do
        {
          if (v1) {
            id v14 = (id)MEMORY[0x261215E60](v13, v4);
          }
          else {
            id v14 = *(id *)(v4 + 8 * v13 + 32);
          }
          uint64_t v15 = v14;
          if (sub_2605BB994(v14, a1))
          {
            id v16 = v15;
            MEMORY[0x261215BF0]();
            if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_2605E2B70();
            }
            sub_2605E2B90();
            sub_2605E2B60();
          }
          ++v13;
        }
        while (v12 != v13);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v7 = v24;
        uint64_t v6 = v25;
        uint64_t v5 = v23;
      }
      else
      {
        swift_unknownObjectRelease();
      }
LABEL_24:
      if (++v8 == v7)
      {
        swift_bridgeObjectRelease();
        unint64_t v1 = v27;
        uint64_t v5 = v21;
        unint64_t v4 = v22;
        goto LABEL_27;
      }
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v1 = MEMORY[0x263F8EE78];
LABEL_27:
  if (v1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v17 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_29:
  if (v17 < 1)
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2605E3700;
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    sub_2605BC040(v20, 0xD000000000000011);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return 0;
  }
  else
  {
    sub_2605C39C0(0, (v1 & 0xC000000000000001) == 0, v1);
    if ((v1 & 0xC000000000000001) != 0) {
      id v18 = (id)MEMORY[0x261215E60](0, v1);
    }
    else {
      id v18 = *(id *)(v1 + 32);
    }
    id v19 = v18;

    swift_bridgeObjectRelease();
  }
  return v19;
}

id sub_2605BB994(void *a1, unsigned int a2)
{
  if (a2 == 2069) {
    unsigned int v2 = 2006;
  }
  else {
    unsigned int v2 = a2;
  }
  if (a2 == 2068) {
    uint64_t v3 = 2007;
  }
  else {
    uint64_t v3 = v2;
  }
  return objc_msgSend(a1, sel_supportsAction_, v3);
}

uint64_t sub_2605BB9CC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for AccessibilityElementSearcher()
{
  return self;
}

void type metadata accessor for IOHIDEventSystemClient(uint64_t a1)
{
}

__n128 initializeWithTake for ElementHierarchy(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_2605BBA38(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2605E2E40();
    __n128 result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_2605E2E40();
      __n128 result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2605BBD48();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_2605BBCB8(&qword_26A88BD60);
            uint64_t v10 = sub_2605BCA68(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_2605DA03C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2605BBBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_2605BBC24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2605BBC68(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2605BBCB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2605BBCFC(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_2605BBD38(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2605BBD48()
{
  unint64_t result = qword_26A88BD68;
  if (!qword_26A88BD68)
  {
    sub_2605BBD9C(&qword_26A88BD60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BD68);
  }
  return result;
}

uint64_t sub_2605BBD9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_2605BBDE4(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *unint64_t v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_2605E2A60();
      if (!v11) {
        break;
      }
      ++v9;
      *uint64_t v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for UIUnderstandingUIElement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for hidEventFields(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for hidEventFields(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for hidEventFields(uint64_t result, int a2, int a3)
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

uint64_t sub_2605BBF40(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2605BBF60(uint64_t result, int a2, int a3)
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

void sub_2605BBF9C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_2605BBFEC()
{
  *(void *)(v0 + 8 * (v1 >> 6) + 64) |= 1 << v1;
}

unint64_t sub_2605BC014()
{
  return sub_2605C3A08(0x694C746C75736572, 0xEB0000000074696DLL);
}

uint64_t sub_2605BC040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = (v2 - 32) | 0x8000000000000000;
  return sub_2605E2F80();
}

unint64_t sub_2605BC06C()
{
  return sub_2605C3A08(0x6554686372616573, 0xEA00000000007478);
}

uint64_t sub_2605BC094()
{
  return swift_bridgeObjectRetain();
}

void sub_2605BC0B4()
{
  sub_2605BC448();
  unint64_t v2 = v1;
  if (v1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2605E2E40();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_32:
    sub_2605BCBA0();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_32;
  }
LABEL_3:
  uint64_t v4 = v0 + 2;
  uint64_t v35 = v0 + 3;
  unint64_t v39 = v2 & 0xC000000000000001;
  uint64_t v36 = *MEMORY[0x263F219B8];
  uint64_t v37 = v3;
  uint64_t v5 = 4;
  unint64_t v38 = v2;
  while (1)
  {
    if (v39) {
      id v6 = (id)MEMORY[0x261215E60](v5 - 4, v2);
    }
    else {
      id v6 = *(id *)(v2 + 8 * v5);
    }
    uint64_t v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    uint64_t v9 = sub_2605BCA04(v6);
    if (v10) {
      break;
    }
LABEL_26:

    ++v5;
    if (v8 == v3)
    {
      swift_bridgeObjectRelease();
      sub_2605BCBA0();
      return;
    }
  }
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  id v40 = v7;
  objc_msgSend(v7, sel_traits);
  uint64_t v13 = _AXTraitsAsStringInternal();
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = sub_2605E2970();
    uint64_t v17 = v16;

    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v0 = (void *)*v4;
    uint64_t v41 = v11;
    v42 = (void *)*v4;
    *uint64_t v4 = 0x8000000000000000;
    unint64_t v18 = sub_2605C3A08(v11, v12);
    if (__OFADD__(v0[2], (v19 & 1) == 0)) {
      goto LABEL_29;
    }
    unint64_t v2 = v18;
    char v20 = v19;
    sub_2605BBCB8(&qword_26A88BD80);
    if (sub_2605E2E20())
    {
      unint64_t v21 = sub_2605C3A08(v41, v12);
      if ((v20 & 1) != (v22 & 1)) {
        goto LABEL_36;
      }
      unint64_t v2 = v21;
    }
    uint64_t v0 = v42;
    if (v20)
    {
      BOOL v23 = (uint64_t *)(v42[7] + 16 * v2);
      swift_bridgeObjectRelease();
      *BOOL v23 = v15;
      v23[1] = v17;
    }
    else
    {
      v42[(v2 >> 6) + 8] |= 1 << v2;
      uint64_t v24 = (uint64_t *)(v42[6] + 16 * v2);
      *uint64_t v24 = v41;
      v24[1] = v12;
      uint64_t v25 = (uint64_t *)(v42[7] + 16 * v2);
      *uint64_t v25 = v15;
      v25[1] = v17;
      uint64_t v26 = v42[2];
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_30;
      }
      v42[2] = v28;
      swift_bridgeObjectRetain();
    }
    *uint64_t v4 = v42;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v7 = v40;
    uint64_t v3 = v37;
    unint64_t v2 = v38;
    if (objc_msgSend(v40, sel_hasAllTraits_, v36))
    {
      swift_beginAccess();
      uint64_t v0 = (void *)*v35;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v35 = v0;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_2605C2BAC();
        uint64_t v0 = v32;
        *uint64_t v35 = v32;
      }
      unint64_t v30 = v0[2];
      if (v30 >= v0[3] >> 1)
      {
        sub_2605C2BAC();
        uint64_t v0 = v33;
        *uint64_t v35 = v33;
      }
      v0[2] = v30 + 1;
      char v31 = &v0[2 * v30];
      v31[4] = v41;
      v31[5] = v12;
      swift_endAccess();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v8 = v5 - 3;
    goto LABEL_26;
  }
  __break(1u);
LABEL_36:
  sub_2605E2F60();
  __break(1u);
}

void sub_2605BC448()
{
  id v0 = objc_msgSend(self, sel_systemWideElement);
  if (!v0) {
    goto LABEL_28;
  }
  unint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_systemApplication);
  if (!v2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v3 = v2;
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t v4 = sub_2605BC9A8(v2);
  if (!v4)
  {
LABEL_30:
    __break(1u);
    return;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 + 16);
  if (v6)
  {
    unint64_t v18 = v3;
    char v19 = v1;
    unint64_t v7 = 0;
    uint64_t v8 = v4 + 32;
    uint64_t v20 = v4 + 32;
    while (1)
    {
      if (v7 >= *(void *)(v5 + 16))
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      sub_2605BBBC8(v8 + 32 * v7, (uint64_t)v21);
      sub_2605BBC24(v21, v21[3]);
      uint64_t v9 = (void *)sub_2605E2F30();
      sub_2605BBCB8(&qword_26A88BD38);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_2605E3710;
      *(void *)(v10 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, 0);
      *(void *)(v10 + 40) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, 1);
      sub_2605E2B60();
      sub_2605BBCFC(0, &qword_26A88BD40);
      uint64_t v11 = (void *)sub_2605E2B30();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(v9, sel_elementsForAttribute_parameter_, 94500, v11);

      swift_unknownObjectRelease();
      if (v12)
      {
        sub_2605BBCFC(0, (unint64_t *)&qword_26A88BD50);
        unint64_t v13 = sub_2605E2B40();

        sub_2605BBC68((uint64_t)v21);
        if (v13 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v14 = sub_2605E2E40();
          swift_bridgeObjectRelease();
          if (!v14)
          {
LABEL_21:
            swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v14) {
            goto LABEL_21;
          }
        }
        if (v14 < 1) {
          goto LABEL_27;
        }
        uint64_t v15 = 0;
        do
        {
          if ((v13 & 0xC000000000000001) != 0) {
            id v16 = (id)MEMORY[0x261215E60](v15, v13);
          }
          else {
            id v16 = *(id *)(v13 + 8 * v15 + 32);
          }
          id v17 = v16;
          MEMORY[0x261215BF0]();
          if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2605E2B70();
          }
          ++v15;
          sub_2605E2B90();
          sub_2605E2B60();
        }
        while (v14 != v15);
        swift_bridgeObjectRelease();
        uint64_t v8 = v20;
      }
      else
      {
        sub_2605BBC68((uint64_t)v21);
      }
LABEL_22:
      if (++v7 == v6)
      {

        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
    }
  }

  swift_bridgeObjectRelease();
LABEL_25:
  sub_2605BCBA0();
}

uint64_t sub_2605BC7A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_2605BC7D4()
{
  sub_2605BC7A4();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for AccessibilityContextRetriever()
{
  return self;
}

void *sub_2605BC82C()
{
  unint64_t v1 = v0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  v1[2] = sub_2605E2890();
  v1[3] = v2;
  type metadata accessor for AccessibilityActivationController();
  swift_allocObject();
  v1[4] = sub_2605C8DF8();
  return v1;
}

uint64_t sub_2605BC898()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2605BC8DC(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  *(void *)(v3 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2605BC928())()
{
  return j__swift_endAccess;
}

void sub_2605BC984()
{
}

uint64_t sub_2605BC9A8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_currentApplications);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2605E2B40();

  return v3;
}

uint64_t sub_2605BCA04(void *a1)
{
  id v1 = objc_msgSend(a1, sel_label);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2605E2970();

  return v3;
}

void (*sub_2605BCA68(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_2605BCB18(v6, a2, a3);
  return sub_2605BCAD0;
}

void sub_2605BCAD0(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_2605BCB18(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_2605C39C0(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x261215E60](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_2605BCB98;
}

void sub_2605BCB98(id *a1)
{
}

uint64_t sub_2605BCBBC(char a1, char a2)
{
  if (qword_2605E3810[a1] == qword_2605E3810[a2] && qword_2605E3840[a1] == qword_2605E3840[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_2605E2F40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_2605BCC44()
{
  qword_26A88C750 = 0x75206C6C6F726353;
  *(void *)algn_26A88C758 = 0xE900000000000070;
}

void sub_2605BCC6C()
{
  qword_26A88C760 = 0x64206C6C6F726353;
  *(void *)algn_26A88C768 = 0xEB000000006E776FLL;
}

void sub_2605BCC98()
{
  qword_26A88C770 = 0x656C206570697753;
  *(void *)algn_26A88C778 = 0xEA00000000007466;
}

void sub_2605BCCC0()
{
  qword_26A88C780 = 0x6972206570697753;
  *(void *)algn_26A88C788 = 0xEB00000000746867;
}

Swift::Int_optional __swiftcall extractNumberFromString(_:)(Swift::String a1)
{
  unint64_t object = (unint64_t)a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  id v3 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id v4 = sub_2605C2840(2843740, 0xE300000000000000, 0);
  uint64_t v5 = (void *)sub_2605E2960();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2605E2AC0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_matchesInString_options_range_, v5, 0, 0, v6);

  sub_2605C3D78();
  unint64_t v8 = sub_2605E2B40();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)sub_2605E2E40();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_3;
    }
LABEL_62:

    goto LABEL_63;
  }
  uint64_t v9 = *(void **)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_62;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x261215E60](0, v8);
  }
  else
  {
    if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_68;
    }
    id v10 = *(id *)(v8 + 32);
  }
  uint64_t v9 = v10;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_rangeAtIndex_, 0);
  uint64_t v13 = v12;
  uint64_t v14 = (void *)sub_2605E2960();
  id v15 = objc_msgSend(v14, sel_substringWithRange_, v11, v13);

  uint64_t countAndFlagsBits = sub_2605E2970();
  unint64_t object = v16;

  uint64_t v17 = HIBYTE(object) & 0xF;
  uint64_t v18 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if ((object & 0x2000000000000000) != 0) {
    uint64_t v19 = HIBYTE(object) & 0xF;
  }
  else {
    uint64_t v19 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (v19)
  {
    if ((object & 0x1000000000000000) == 0)
    {
      if ((object & 0x2000000000000000) == 0)
      {
        if ((countAndFlagsBits & 0x1000000000000000) != 0) {
          uint64_t v20 = (unsigned __int8 *)((object & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          uint64_t v20 = (unsigned __int8 *)sub_2605E2DB0();
        }
        uint64_t v21 = (uint64_t)sub_2605C3F28(v20, v18);
        char v23 = v22 & 1;
        goto LABEL_40;
      }
      if (countAndFlagsBits == 43)
      {
        if (!v17) {
          goto LABEL_71;
        }
        if (v17 == 1) {
          goto LABEL_37;
        }
        sub_2605C4C50();
        if (!v27 & v26) {
          goto LABEL_37;
        }
        uint64_t v21 = v29;
        if (v28 != 2)
        {
          sub_2605C4C50();
          if (!v27 & v26) {
            goto LABEL_37;
          }
          uint64_t v21 = 10 * v21 + v31;
          if (v30 != 3)
          {
            while (1)
            {
              sub_2605C4C40();
              if (!v27 & v26) {
                goto LABEL_37;
              }
              sub_2605C4E70();
              if (!v27) {
                goto LABEL_37;
              }
              uint64_t v21 = v33 + v32;
              if (__OFADD__(v33, v32)) {
                goto LABEL_37;
              }
              char v23 = 0;
              sub_2605C4F58();
              if (v27) {
                goto LABEL_40;
              }
            }
          }
        }
      }
      else
      {
        if (countAndFlagsBits == 45)
        {
          if (v17)
          {
            if (v17 == 1) {
              goto LABEL_37;
            }
            sub_2605C4C50();
            if (!v27 & v26) {
              goto LABEL_37;
            }
            if (v24 == 2)
            {
              char v23 = 0;
              uint64_t v21 = -(uint64_t)v25;
              goto LABEL_40;
            }
            if ((BYTE2(countAndFlagsBits) - 48) > 9u) {
              goto LABEL_37;
            }
            uint64_t v21 = -10 * v25 - (BYTE2(countAndFlagsBits) - 48);
            if (v24 != 3)
            {
              while (1)
              {
                sub_2605C4C40();
                if (!v27 & v26) {
                  goto LABEL_37;
                }
                sub_2605C4E70();
                if (!v27) {
                  goto LABEL_37;
                }
                uint64_t v21 = v41 - v40;
                if (__OFSUB__(v41, v40)) {
                  goto LABEL_37;
                }
                char v23 = 0;
                sub_2605C4F58();
                if (v27) {
                  goto LABEL_40;
                }
              }
            }
            goto LABEL_39;
          }
          __break(1u);
LABEL_71:
          __break(1u);
          Swift::Int v35 = swift_unexpectedError();
          __break(1u);
          goto LABEL_72;
        }
        if (!v17 || (countAndFlagsBits - 48) > 9u)
        {
LABEL_37:
          uint64_t v21 = 0;
          char v23 = 1;
          goto LABEL_40;
        }
        uint64_t v21 = (countAndFlagsBits - 48);
        if (v17 != 1)
        {
          sub_2605C4C50();
          if (!v27 & v26) {
            goto LABEL_37;
          }
          uint64_t v21 = 10 * (countAndFlagsBits - 48) + v37;
          if (v36 != 2)
          {
            while (1)
            {
              sub_2605C4C40();
              if (!v27 & v26) {
                goto LABEL_37;
              }
              sub_2605C4E70();
              if (!v27) {
                goto LABEL_37;
              }
              uint64_t v21 = v39 + v38;
              if (__OFADD__(v39, v38)) {
                goto LABEL_37;
              }
              char v23 = 0;
              sub_2605C4F58();
              if (v27) {
                goto LABEL_40;
              }
            }
          }
        }
      }
LABEL_39:
      char v23 = 0;
      goto LABEL_40;
    }
LABEL_68:
    uint64_t v21 = sub_2605C3E38(countAndFlagsBits, object, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2605C3F28);
    char v23 = v43;
LABEL_40:

    swift_bridgeObjectRelease();
    char v34 = v23 & 1;
    if (v23) {
      Swift::Int v35 = 0;
    }
    else {
      Swift::Int v35 = v21;
    }
    goto LABEL_64;
  }

LABEL_63:
  swift_bridgeObjectRelease();
  Swift::Int v35 = 0;
  char v34 = 1;
LABEL_64:
  Swift::Bool v42 = v34;
LABEL_72:
  result.value = v35;
  result.is_nil = v42;
  return result;
}

uint64_t sub_2605BD14C(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_2605E2DB0();
      }
      uint64_t v7 = (uint64_t)sub_2605C3F28(v6, v4);
      char v9 = v8 & 1;
      goto LABEL_39;
    }
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_53;
      }
      if (v3 == 1) {
        goto LABEL_36;
      }
      sub_2605C4C50();
      if (!v13 & v12) {
        goto LABEL_36;
      }
      uint64_t v7 = v17;
      if (v16 != 2)
      {
        while (1)
        {
          sub_2605C4C40();
          if (!v13 & v12) {
            goto LABEL_36;
          }
          sub_2605C4E10();
          if (!v13) {
            goto LABEL_36;
          }
          uint64_t v7 = v19 + v18;
          if (__OFADD__(v19, v18)) {
            goto LABEL_36;
          }
          char v9 = 0;
          sub_2605C4F58();
          if (v13) {
            goto LABEL_39;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1)
          {
            sub_2605C4C50();
            if (!(!v13 & v12))
            {
              uint64_t v7 = -(uint64_t)v11;
              if (v10 != 2)
              {
                while (1)
                {
                  sub_2605C4C40();
                  if (!v13 & v12) {
                    goto LABEL_36;
                  }
                  sub_2605C4E10();
                  if (!v13) {
                    goto LABEL_36;
                  }
                  uint64_t v7 = v15 - v14;
                  if (__OFSUB__(v15, v14)) {
                    goto LABEL_36;
                  }
                  char v9 = 0;
                  sub_2605C4F58();
                  if (v13) {
                    goto LABEL_39;
                  }
                }
              }
              goto LABEL_38;
            }
          }
LABEL_36:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_39;
        }
        __break(1u);
LABEL_53:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_36;
      }
      uint64_t v7 = (result - 48);
      if (v3 != 1)
      {
        while (1)
        {
          sub_2605C4C40();
          if (!v13 & v12) {
            goto LABEL_36;
          }
          sub_2605C4E10();
          if (!v13) {
            goto LABEL_36;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_36;
          }
          char v9 = 0;
          sub_2605C4F58();
          if (v13) {
            goto LABEL_39;
          }
        }
      }
    }
LABEL_38:
    char v9 = 0;
    goto LABEL_39;
  }
  uint64_t v7 = sub_2605C3E38(result, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2605C3F28);
  char v9 = v22;
LABEL_39:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t scrapFileNamesStartingWith(prefix:inDirectory:)()
{
  v71[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_2605C5138();
  uint64_t v6 = sub_2605BBCB8(&qword_26A88BD90);
  MEMORY[0x270FA5388](v6 - 8);
  sub_2605C5150();
  id v7 = objc_msgSend(self, sel_defaultManager);
  char v8 = (void *)sub_2605E22F0();
  v71[0] = 0;
  id v9 = objc_msgSend(v7, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v8, 0, 0, v71);

  id v10 = v71[0];
  if (!v9)
  {
    id v31 = v71[0];
    unsigned __int8 v32 = (void *)sub_2605E2290();

    swift_willThrow();
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v33 = sub_2605C4BCC();
    *(_OWORD *)(v33 + 16) = xmmword_2605E3700;
    *(void *)(v33 + 56) = MEMORY[0x263F8D310];
    *(void *)(v33 + 32) = 0xD000000000000022;
    *(void *)(v33 + 40) = 0x80000002605E4BF0;
    sub_2605C4B94();

    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  v67 = v7;
  uint64_t v11 = sub_2605E2B40();
  id v12 = v10;

  uint64_t v13 = *(void *)(v11 + 16);
  if (v13)
  {
    uint64_t v14 = v4 + 16;
    unint64_t v15 = v11 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v69 = *(void *)(v14 + 56);
    v68 = (void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
    uint64_t v70 = MEMORY[0x263F8EE78];
    while (1)
    {
      sub_2605C523C();
      v17(v16);
      sub_2605C3DD0(v1, 0, 1, v2);
      if (sub_2605C3DF8(v1, 1, v2) == 1) {
        break;
      }
      (*v68)(v0, v1, v2);
      uint64_t v18 = sub_2605E22E0();
      uint64_t v20 = v19;
      if (sub_2605E2AE0())
      {
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v21 = v70;
        }
        else
        {
          sub_2605C2E80();
          uint64_t v21 = v29;
        }
        unint64_t v23 = *(void *)(v21 + 16);
        unint64_t v22 = *(void *)(v21 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_2605C4C08(v22);
          sub_2605C2E80();
          uint64_t v21 = v30;
        }
        *(void *)(v21 + 16) = v23 + 1;
        uint64_t v70 = v21;
        uint64_t v24 = v21 + 16 * v23;
        *(void *)(v24 + 32) = v18;
        *(void *)(v24 + 40) = v20;
        uint64_t v25 = sub_2605C5224();
        v26(v25);
      }
      else
      {
        uint64_t v27 = sub_2605C5224();
        v28(v27);
        swift_bridgeObjectRelease();
      }
      v15 += v69;
      if (!--v13) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    uint64_t v70 = MEMORY[0x263F8EE78];
LABEL_17:
    sub_2605C3DD0(v1, 1, 1, v2);
  }
  swift_bridgeObjectRelease();
  Swift::Int v35 = (void *)sub_2605E2890();
  uint64_t v36 = *(void *)(v70 + 16);
  if (!v36)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    uint64_t v53 = v35[2];
    if (!v53) {
      goto LABEL_46;
    }
    uint64_t v54 = 0;
    uint64_t v55 = v53 - 1;
    uint64_t v34 = MEMORY[0x263F8EE78];
LABEL_33:
    unint64_t v56 = sub_2605C3A80(v54);
    if (v57)
    {
      v58 = (uint64_t *)(v35[7] + 16 * v56);
      uint64_t v60 = *v58;
      uint64_t v59 = v58[1];
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605C2E80();
        uint64_t v34 = v64;
      }
      unint64_t v62 = *(void *)(v34 + 16);
      unint64_t v61 = *(void *)(v34 + 24);
      if (v62 >= v61 >> 1)
      {
        sub_2605C4C08(v61);
        sub_2605C2E80();
        uint64_t v34 = v65;
      }
      *(void *)(v34 + 16) = v62 + 1;
      uint64_t v63 = v34 + 16 * v62;
      *(void *)(v63 + 32) = v60;
      *(void *)(v63 + 40) = v59;
    }
    while (v55 != v54)
    {
      ++v54;
      if (v35[2]) {
        goto LABEL_33;
      }
    }
    swift_bridgeObjectRelease();

    return v34;
  }
  unsigned __int8 v37 = (void **)(v70 + 40);
  while (1)
  {
    uint64_t v39 = (uint64_t)*(v37 - 1);
    unsigned __int8 v38 = *v37;
    swift_bridgeObjectRetain();
    v40._uint64_t countAndFlagsBits = v39;
    v40._unint64_t object = v38;
    Swift::Int_optional v72 = extractNumberFromString(_:)(v40);
    if (!v72.is_nil) {
      break;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    v37 += 2;
    if (!--v36) {
      goto LABEL_31;
    }
  }
  Swift::Int value = v72.value;
  swift_isUniquelyReferenced_nonNull_native();
  v71[0] = v35;
  unint64_t v42 = sub_2605C3A80(value);
  if (__OFADD__(v35[2], (v43 & 1) == 0))
  {
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
  }
  unint64_t v44 = v42;
  char v45 = v43;
  sub_2605BBCB8(&qword_26A88BD98);
  if ((sub_2605E2E20() & 1) == 0) {
    goto LABEL_25;
  }
  unint64_t v46 = sub_2605C3A80(value);
  if ((v45 & 1) == (v47 & 1))
  {
    unint64_t v44 = v46;
LABEL_25:
    Swift::Int v35 = v71[0];
    if (v45)
    {
      uint64_t v48 = (uint64_t *)(*((void *)v71[0] + 7) + 16 * v44);
      swift_bridgeObjectRelease();
      *uint64_t v48 = v39;
      v48[1] = (uint64_t)v38;
    }
    else
    {
      *((void *)v71[0] + (v44 >> 6) + 8) |= 1 << v44;
      *(void *)(v35[6] + 8 * v44) = value;
      unint64_t v49 = (uint64_t *)(v35[7] + 16 * v44);
      *unint64_t v49 = v39;
      v49[1] = (uint64_t)v38;
      uint64_t v50 = v35[2];
      BOOL v51 = __OFADD__(v50, 1);
      uint64_t v52 = v50 + 1;
      if (v51) {
        goto LABEL_45;
      }
      v35[2] = v52;
    }
    goto LABEL_30;
  }
  uint64_t result = sub_2605E2F60();
  __break(1u);
  return result;
}

uint64_t sub_2605BD9FC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_2605C3A80(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_2605BDA40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_2605C3A08(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 16 * v4);
  }
  else {
    return 0;
  }
}

Swift::tuple_OpaquePointer_OpaquePointer_optional __swiftcall correlateActionWithScreenContextGridAware(trajectory:nlg:)(Swift::OpaquePointer trajectory, Swift::String nlg)
{
  sub_2605C5070();
  uint64_t v227 = v3;
  uint64_t v228 = v7;
  id v9 = v8;
  uint64_t v11 = v10;
  v215 = v12;
  uint64_t v13 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_2605C4E84();
  uint64_t v19 = v17 - v18;
  MEMORY[0x270FA5388](v20);
  sub_2605C5318();
  MEMORY[0x270FA5388](v21);
  unint64_t v23 = (char *)&v192 - v22;
  id v24 = objc_msgSend(self, sel_defaultManager);
  id v25 = sub_2605C52A0(v24, sel_URLsForDirectory_inDomains_);

  uint64_t v26 = sub_2605E2B40();
  if (!*(void *)(v26 + 16))
  {
LABEL_147:
    __break(1u);
    goto LABEL_148;
  }
  uint64_t v201 = v19;
  sub_2605C5028();
  sub_2605C523C();
  v27();
  swift_bridgeObjectRelease();
  v197 = v23;
  sub_2605E2300();
  uint64_t v28 = scrapFileNamesStartingWith(prefix:inDirectory:)();
  v198 = v9;
  uint64_t v29 = v28;
  sub_2605BBCB8(&qword_26A88BDA0);
  uint64_t v212 = sub_2605C4CDC();
  uint64_t v30 = sub_2605C4CDC();
  uint64_t v214 = sub_2605C4CDC();
  sub_2605BBCB8(&qword_26A88BDA8);
  uint64_t v217 = sub_2605E2890();
  uint64_t v211 = sub_2605BBCB8(&qword_26A88BD48);
  id v31 = (__n128 *)sub_2605C4BCC();
  sub_2605C4FBC(v31, (uint64_t)&v226, (__n128)xmmword_2605E3700);
  swift_bridgeObjectRelease();
  sub_2605C53BC();
  uint64_t v224 = v32;
  unint64_t v225 = 0x80000002605E4C40;
  uint64_t v220 = *(void *)(v29 + 16);
  sub_2605E2F20();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  unint64_t v33 = v224;
  unint64_t v34 = v225;
  v31[3].n128_u64[1] = MEMORY[0x263F8D310];
  v31[2].n128_u64[0] = v33;
  v31[2].n128_u64[1] = v34;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void *)(v29 + 16);
  uint64_t v206 = v13;
  uint64_t v199 = v15;
  uint64_t v205 = v2;
  uint64_t v204 = v35;
  uint64_t v196 = v11;
  if (v35)
  {
    uint64_t v209 = 0;
    v203 = (const char *)(v29 + 32);
    uint64_t v202 = v15 + 8;
    unint64_t v36 = 0;
    v200 = (const char *)v29;
    while (v36 < *(void *)(v29 + 16))
    {
      swift_bridgeObjectRetain();
      sub_2605E2300();
      swift_bridgeObjectRelease();
      v37._uint64_t countAndFlagsBits = sub_2605E22C0();
      unint64_t v38 = (unint64_t)readMatrixFromUIUnderstandingFile(filePath:)(v37);
      swift_bridgeObjectRelease();
      if (v38)
      {
        uint64_t v213 = v30;
        uint64_t v223 = MEMORY[0x263F8EE78];
        uint64_t v224 = MEMORY[0x263F8EE78];
        uint64_t v220 = MEMORY[0x263F8EE78];
        uint64_t v222 = MEMORY[0x263F8EE78];
        uint64_t v39 = *(void *)(v38 + 16);
        uint64_t v207 = v36;
        unint64_t v208 = v38;
        if (v39)
        {
          Swift::String v40 = (uint64_t *)(v38 + 136);
          uint64_t v216 = MEMORY[0x263F8EE78];
          do
          {
            uint64_t v42 = *(v40 - 5);
            uint64_t v41 = *(v40 - 4);
            uint64_t v43 = *(v40 - 3);
            uint64_t v44 = *(v40 - 2);
            unint64_t v45 = *(v40 - 1);
            uint64_t v46 = *v40;
            BOOL v47 = v43 == 1954047348 && v44 == 0xE400000000000000;
            if (v47 || (sub_2605C4EC4() & 1) != 0)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v218 = v45;
              sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
              uint64_t v48 = sub_2605C51D4(v223);
              sub_2605C2AE4(v48, v49, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
              sub_2605C5384();
              *(void *)(v50 + 32) = v42;
              *(void *)(v50 + 40) = v41;
              swift_bridgeObjectRetain();
              sub_2605C2A20((uint64_t)&qword_26A88BE20, (uint64_t)sub_2605C306C, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
              uint64_t v51 = sub_2605C51D4(v222);
              sub_2605C2AE4(v51, v52, (uint64_t)sub_2605C306C, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
              sub_2605C5360(v29 + 1);
              uint64_t v54 = v53 + 16 * v29;
              *(void *)(v54 + 32) = v218;
              *(void *)(v54 + 40) = v46;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              BOOL v55 = v43 == 0x65727574636970 && v44 == 0xE700000000000000;
              if (v55 || (sub_2605E2F40() & 1) != 0)
              {
                sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
                uint64_t v56 = *(void *)(v220 + 16);
                sub_2605C2AE4(v56, (uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
                uint64_t v57 = v220;
                *(void *)(v220 + 16) = v56 + 1;
                uint64_t v58 = v57 + 16 * v56;
              }
              else
              {
                sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
                uint64_t v59 = *(void *)(v224 + 16);
                uint64_t v60 = sub_2605C5398();
                sub_2605C2AE4(v60, v61, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
                uint64_t v62 = v224;
                *(void *)(v224 + 16) = v59 + 1;
                uint64_t v216 = v62;
                uint64_t v58 = v62 + 16 * v59;
              }
              *(void *)(v58 + 32) = v42;
              *(void *)(v58 + 40) = v41;
            }
            v40 += 14;
            --v39;
          }
          while (v39);
        }
        else
        {
          uint64_t v216 = MEMORY[0x263F8EE78];
        }
        swift_bridgeObjectRelease();
        uint64_t v64 = v212;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v219 = v64;
        uint64_t v66 = v209;
        sub_2605C3AC4(v216, v209, isUniquelyReferenced_nonNull_native, &qword_26A88BE08);
        uint64_t v212 = v219;
        swift_bridgeObjectRelease();
        uint64_t v67 = swift_isUniquelyReferenced_nonNull_native();
        sub_2605C4F64(v67);
        uint64_t v214 = v219;
        swift_bridgeObjectRelease();
        uint64_t v68 = v222;
        uint64_t v69 = v217;
        uint64_t v70 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v219 = v69;
        sub_2605C3AC4(v68, v66, v70, &qword_26A88BE00);
        uint64_t v217 = v219;
        swift_bridgeObjectRelease();
        uint64_t v71 = swift_isUniquelyReferenced_nonNull_native();
        sub_2605C4F64(v71);
        uint64_t v30 = v219;
        swift_bridgeObjectRelease();
        sub_2605C4F8C();
        v72();
        uint64_t v209 = v66 + 1;
        uint64_t v29 = (uint64_t)v200;
        if (__OFADD__(v66, 1)) {
          goto LABEL_146;
        }
        unint64_t v36 = v207;
      }
      else
      {
        sub_2605C4F8C();
        v63();
      }
      if (++v36 == v204) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_146:
    __break(1u);
    goto LABEL_147;
  }
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v223 = MEMORY[0x263F8EE78];
  v73 = v215;
  if (!v215[2])
  {
LABEL_148:
    __break(1u);
    goto LABEL_149;
  }
  unint64_t v74 = sub_2605C3A80(0);
  if ((v75 & 1) == 0)
  {
LABEL_149:
    __break(1u);
    goto LABEL_150;
  }
  uint64_t v76 = v73[7] + 40 * v74;
  double v77 = *(double *)(v76 + 8);
  double v78 = *(double *)(v76 + 16);
  uint64_t v79 = sub_2605BD9FC(0, v30);
  if (!v79)
  {
LABEL_153:
    __break(1u);
LABEL_154:
    __break(1u);
    goto LABEL_155;
  }
  uint64_t v80 = *(void *)(v79 + 16);
  unint64_t v81 = (unint64_t)sub_2605E3000;
  if (v80)
  {
    v82 = (double *)(v79 + 40);
    double v83 = 0.0;
    double v84 = 100000.0;
    double v85 = 0.0;
    do
    {
      double v86 = sqrt((v77 - *(v82 - 1)) * (v77 - *(v82 - 1)) + (v78 - *v82) * (v78 - *v82));
      if (v86 < v84)
      {
        double v83 = *v82;
        double v85 = *(v82 - 1);
        double v84 = v86;
      }
      v82 += 2;
      --v80;
    }
    while (v80);
  }
  else
  {
    double v83 = 0.0;
    double v85 = 0.0;
  }
  swift_bridgeObjectRelease();
  uint64_t v213 = v30;
  uint64_t v87 = sub_2605BD9FC(0, v30);
  if (!v87) {
    goto LABEL_154;
  }
  uint64_t v88 = *(void *)(v87 + 16);
  if (v88)
  {
    v89 = (double *)(v87 + 40);
    do
    {
      if (*(v89 - 1) == v85 && *v89 == v83)
      {
        sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
        sub_2605C4E24();
        sub_2605C5058();
      }
      v89 += 2;
      --v88;
    }
    while (v88);
  }
  swift_bridgeObjectRelease();
  uint64_t v91 = sub_2605BD9FC(0, v213);
  if (!v91)
  {
LABEL_155:
    __break(1u);
LABEL_156:
    __break(1u);
LABEL_157:
    __break(1u);
    JUMPOUT(0x2605BF184);
  }
  uint64_t v92 = *(void *)(v91 + 16);
  if (v92)
  {
    v93 = (double *)(v91 + 40);
    do
    {
      if (*(v93 - 1) != v85 || *v93 != v83)
      {
        sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
        sub_2605C4E24();
        sub_2605C5058();
      }
      v93 += 2;
      --v92;
    }
    while (v92);
  }
  swift_bridgeObjectRelease();
  uint64_t v222 = MEMORY[0x263F8EE78];
  uint64_t v201 = v223;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2605C5040();
  uint64_t v95 = sub_2605E29E0();
  v97 = v96;
  sub_2605C2A20((uint64_t)&unk_26A88BE10, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2F90);
  uint64_t v98 = *(void *)(v222 + 16);
  sub_2605C2AE4(v98, (uint64_t)&unk_26A88BE10, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(BOOL))sub_2605C2F90);
  sub_2605C5360(v98 + 1);
  uint64_t v100 = v99 + 32 * v98;
  *(void *)(v100 + 32) = v95;
  *(void *)(v100 + 40) = v97;
  *(double *)(v100 + 48) = v85;
  *(double *)(v100 + 56) = v83;
  uint64_t v224 = 0;
  unint64_t v225 = 0xE000000000000000;
  v101 = v215;
  unint64_t v102 = v215[2];
  if (v102 < 2)
  {
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  unint64_t v218 = v102 - 1;
  uint64_t v216 = 0x80000002605E4C80;
  v203 = "trajectory[index] for ";
  uint64_t v209 = 0x80000002605E4CA0;
  sub_2605C51A4();
  uint64_t v202 = v103;
  double v104 = 100000.0;
  sub_2605C51A4();
  uint64_t v195 = v105;
  v200 = "textCentersDict[index] for ";
  unint64_t v194 = 0x80000002605E4D60;
  sub_2605C51A4();
  uint64_t v204 = v106;
  uint64_t v107 = 1;
  uint64_t v108 = v206;
  uint64_t v109 = v199;
  uint64_t v110 = v205;
  v111 = v198;
  if (!v112) {
    goto LABEL_72;
  }
LABEL_60:
  unint64_t v113 = sub_2605C3A80(v107);
  if (v114)
  {
    switch(*(unsigned char *)(v101[7] + 40 * v113))
    {
      case 1:
        if (qword_26A88BCC0 != -1) {
          swift_once();
        }
        v131 = &qword_26A88C770;
        goto LABEL_87;
      case 2:
        if (qword_26A88BCC8 != -1) {
          swift_once();
        }
        v131 = &qword_26A88C780;
        goto LABEL_87;
      case 3:
        if (qword_26A88BCB8 != -1) {
          swift_once();
        }
        v131 = &qword_26A88C760;
        goto LABEL_87;
      case 4:
        if (qword_26A88BCB0 != -1) {
          swift_once();
        }
        v131 = &qword_26A88C750;
LABEL_87:
        uint64_t v132 = *v131;
        v97 = (void *)v131[1];
        swift_bridgeObjectRetain();
        sub_2605C2A20((uint64_t)&unk_26A88BE10, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2F90);
        uint64_t v133 = sub_2605C51D4(v222);
        sub_2605C2AE4(v133, v134, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(BOOL))sub_2605C2F90);
        sub_2605C5360(v81 + 1);
        v136 = (void *)(v135 + 32 * v81);
        v136[4] = v132;
        v136[5] = v97;
        v136[6] = 0;
        v136[7] = 0;
        goto LABEL_88;
      case 5:
        v137 = (__n128 *)sub_2605C4BCC();
        sub_2605C4EB0(v137);
        *(void *)(v138 + 56) = MEMORY[0x263F8D310];
        sub_2605C5040();
        uint64_t v140 = v139 + 29;
        uint64_t v141 = v204;
        *(void *)(v142 + 32) = v140;
        *(void *)(v142 + 40) = v141;
        sub_2605C4B94();
        goto LABEL_74;
      default:
        if (!*(void *)(v214 + 16) || (unint64_t v115 = sub_2605C3A80(v107), (v116 & 1) == 0))
        {
          v143 = (__n128 *)sub_2605C4BCC();
          sub_2605C4EB0(v143);
          uint64_t v220 = sub_2605C3978(60);
          uint64_t v221 = v144;
          unint64_t v81 = 0xD000000000000010;
          sub_2605E2A50();
          uint64_t v219 = v107;
          sub_2605E2F20();
          sub_2605E2A50();
          swift_bridgeObjectRelease();
          goto LABEL_73;
        }
        uint64_t v117 = *(void *)(*(void *)(v214 + 56) + 8 * v115);
        uint64_t v118 = *(void *)(v117 + 16);
        double v193 = v104;
        if (v118)
        {
          swift_bridgeObjectRetain();
          uint64_t v119 = 0;
          unint64_t v120 = 0;
          sub_2605C4E50();
          do
          {
            double v121 = *(double *)(v117 + v119 + 32);
            double v122 = *(double *)(v117 + v119 + 40);
            uint64_t v220 = sub_2605C3978(18);
            uint64_t v221 = v123;
            sub_2605E2BD0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4BB4();
            sub_2605E2BD0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4BB4();
            if (!sub_2605BD9FC(v107, v217)) {
              goto LABEL_151;
            }
            sub_2605C4F1C();
            sub_2605C39E8(v120, 1, (uint64_t)&v220);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4BB4();
            sub_2605E2BE0();
            sub_2605C4BB4();
            sub_2605E2BE0();
            sub_2605C4BB4();
            sub_2605E2BE0();
            sub_2605C4DA4();
            sub_2605E29E0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            if (v4 < v104)
            {
              swift_bridgeObjectRelease();
              uint64_t v124 = sub_2605BD9FC(v107, v217);
              if (!v124) {
                goto LABEL_152;
              }
              uint64_t v125 = v124;
              sub_2605C39E8(v120, 1, v124);
              unint64_t v126 = *(void *)(v125 + v119 + 40);
              uint64_t v207 = *(void *)(v125 + v119 + 32);
              unint64_t v208 = v126;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              double v5 = v122;
              double v6 = v121;
              double v104 = v4;
            }
            ++v120;
            v119 += 16;
          }
          while (v118 != v120);
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_2605C4E50();
        }
        uint64_t v145 = sub_2605BD9FC(v107, v212);
        uint64_t v146 = v213;
        if (!v145) {
          goto LABEL_156;
        }
        uint64_t v147 = *(void *)(v145 + 16);
        if (v147)
        {
          v148 = (double *)(v145 + 40);
          do
          {
            double v149 = *(v148 - 1);
            double v150 = *v148;
            uint64_t v220 = sub_2605C4C14();
            uint64_t v221 = v151;
            sub_2605E2BD0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4BB4();
            sub_2605E2BD0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4D68();
            sub_2605E2A50();
            sub_2605C4FA4();
            sub_2605C4BB4();
            sub_2605C4FA4();
            sub_2605C4BB4();
            sub_2605C4FA4();
            sub_2605C4DA4();
            sub_2605E29E0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            if (v4 < v104)
            {
              double v5 = v150;
              double v6 = v149;
              double v104 = v4;
            }
            v148 += 2;
            --v147;
          }
          while (v147);
        }
        swift_bridgeObjectRelease();
        uint64_t v152 = sub_2605BD9FC(v107, v146);
        if (!v152) {
          goto LABEL_157;
        }
        uint64_t v153 = *(void *)(v152 + 16);
        if (v153)
        {
          v154 = (double *)(v152 + 40);
          do
          {
            double v155 = *(v154 - 1);
            double v156 = *v154;
            uint64_t v220 = sub_2605C4C14();
            uint64_t v221 = v157;
            sub_2605E2BD0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4BB4();
            sub_2605E2BD0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            sub_2605C4D68();
            sub_2605E2A50();
            sub_2605C4FA4();
            sub_2605C4BB4();
            sub_2605C4FA4();
            sub_2605C4BB4();
            sub_2605C4FA4();
            sub_2605C4DA4();
            sub_2605E29E0();
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            if (v4 < v104)
            {
              double v5 = v156;
              double v6 = v155;
              double v104 = v4;
            }
            v154 += 2;
            --v153;
          }
          while (v153);
        }
        swift_bridgeObjectRelease();
        uint64_t v158 = v222;
        unint64_t v159 = *(void *)(v222 + 16) - 1;
        sub_2605C53A4(v159);
        double v104 = v193;
        unint64_t v160 = v208;
        uint64_t v161 = v207;
        if (!*(void *)(v158 + 16)) {
          goto LABEL_139;
        }
        uint64_t v162 = *(void *)(v158 + 32 * v159 + 40);
        uint64_t v163 = qword_26A88BCB0;
        swift_bridgeObjectRetain();
        if (v163 != -1) {
          swift_once();
        }
        sub_2605C5378();
        BOOL v165 = v47 && v162 == v164;
        if (v165 || (sub_2605C4EE4() & 1) != 0) {
          goto LABEL_137;
        }
        if (qword_26A88BCB8 != -1) {
          swift_once();
        }
        sub_2605C5378();
        BOOL v167 = v47 && v162 == v166;
        if (v167 || (sub_2605C4EE4() & 1) != 0) {
          goto LABEL_137;
        }
        if (qword_26A88BCC0 != -1) {
          swift_once();
        }
        sub_2605C5378();
        BOOL v169 = v47 && v162 == v168;
        if (v169 || (sub_2605C4EE4() & 1) != 0) {
          goto LABEL_137;
        }
        if (qword_26A88BCC8 != -1) {
          swift_once();
        }
        sub_2605C5378();
        if (v47 && v162 == v170)
        {
LABEL_137:
          swift_bridgeObjectRelease();
        }
        else
        {
          char v172 = sub_2605C4EE4();
          swift_bridgeObjectRelease();
          if ((v172 & 1) == 0)
          {
LABEL_139:
            swift_bridgeObjectRelease();
            sub_2605C5040();
            uint64_t v220 = v174;
            uint64_t v221 = v195;
            sub_2605E2A50();
            swift_bridgeObjectRelease();
            v97 = (void *)sub_2605E29E0();
            uint64_t v176 = v175;
            unint64_t v81 = (unint64_t)sub_2605C2F90;
            sub_2605C2A20((uint64_t)&unk_26A88BE10, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2F90);
            uint64_t v177 = *(void *)(v222 + 16);
            sub_2605C2AE4(v177, (uint64_t)&unk_26A88BE10, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(BOOL))sub_2605C2F90);
            sub_2605C5360(v177 + 1);
            uint64_t v179 = v178 + 32 * v177;
            *(void *)(v179 + 32) = v97;
            *(void *)(v179 + 40) = v176;
            *(double *)(v179 + 48) = v6;
            *(double *)(v179 + 56) = v5;
LABEL_88:
            uint64_t v108 = v206;
            uint64_t v109 = v199;
            uint64_t v110 = v205;
            v111 = v198;
            v101 = v215;
            goto LABEL_89;
          }
        }
        unint64_t v173 = *(void *)(v158 + 16) - 1;
        MEMORY[0x261215AC0](32, 0xE100000000000000, v161, v160);
        sub_2605C48EC();
        sub_2605C492C(v173, v222);
        sub_2605E2A50();
        swift_bridgeObjectRelease();
        goto LABEL_139;
    }
  }
LABEL_72:
  while (1)
  {
    v127 = (__n128 *)sub_2605C4BCC();
    sub_2605C4EB0(v127);
    uint64_t v220 = sub_2605C3978(55);
    uint64_t v221 = v128;
    unint64_t v81 = 0xD000000000000010;
    sub_2605E2A50();
    uint64_t v219 = v107;
    sub_2605E2F20();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
LABEL_73:
    sub_2605E2A50();
    uint64_t v129 = sub_2605E29E0();
    v97[7] = MEMORY[0x263F8D310];
    v97[4] = v129;
    v97[5] = v130;
    sub_2605C4B94();
    v101 = v215;
LABEL_74:
    swift_bridgeObjectRelease();
LABEL_89:
    if (v107 == v218) {
      break;
    }
    ++v107;
    if (v101[2]) {
      goto LABEL_60;
    }
  }
  swift_bridgeObjectRelease();
  sub_2605C5340();
  v180._unint64_t object = (void *)0x80000002605E4CC0;
  v181._uint64_t countAndFlagsBits = v196;
  v181._unint64_t object = v111;
  v182._unint64_t object = v101;
  writeStringToFile(folderName:fileName:data:)(v181, v180, v182);
  sub_2605C4E94();
  if (!v97 && v110 == 0xE000000000000000 || (sub_2605C4BE4() & 1) != 0)
  {
    uint64_t v183 = sub_2605C4BCC();
    *(_OWORD *)(v183 + 16) = v210;
    sub_2605C3978(19);
    swift_bridgeObjectRelease();
    sub_2605C51A4();
    uint64_t v220 = v184;
    uint64_t v221 = v185;
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    uint64_t v186 = sub_2605E29E0();
    *(void *)(v183 + 56) = MEMORY[0x263F8D310];
    *(void *)(v183 + 32) = v186;
    *(void *)(v183 + 40) = v187;
    sub_2605C4B94();
  }
  swift_bridgeObjectRelease();
  v188 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
  v188(v110, v108);
  v188((uint64_t)v197, v108);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605C5110();
  result.value._1._rawValue = v190;
  result.value._0._rawValue = v189;
  result.is_nil = v191;
  return result;
}

unint64_t semanticActionMapping(trajectory:deviceState:)(unsigned __int8 *a1, unint64_t *a2, double a3, double a4)
{
  uint64_t v6 = *a1;
  unint64_t v7 = *a2;
  if (*a2 >> 62)
  {
LABEL_63:
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_2605E2E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v69 = v6;
  if (v8)
  {
    if (v8 < 1)
    {
      __break(1u);
      JUMPOUT(0x2605BF8E8);
    }
    uint64_t v9 = 0;
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
    sub_2605C526C();
    uint64_t v70 = v11;
    uint64_t v71 = v10;
    id v12 = v10;
    while (1)
    {
      id v13 = (v7 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261215E60](v9, v7) : *(id *)(v7 + 8 * v9 + 32);
      uint64_t v14 = v13;
      uint64_t v15 = (void *)sub_2605E24E0();
      uint64_t v16 = sub_2605E2390();

      double v17 = (double)v16;
      uint64_t v18 = (void *)sub_2605E24E0();
      uint64_t v19 = sub_2605E23B0();

      double v20 = (double)v19 * 0.5 + v17;
      uint64_t v21 = (void *)sub_2605E24E0();
      uint64_t v22 = sub_2605E2380();

      double v23 = (double)v22;
      id v24 = (void *)sub_2605E24E0();
      uint64_t v25 = sub_2605E23E0();

      double v26 = (double)v25 * 0.5 + v23;
      sub_2605E2510();
      uint64_t v27 = sub_2605E24D0();
      uint64_t v29 = v28;
      if (v27 == 1954047348 && v28 == 0xE400000000000000) {
        break;
      }
      char v31 = sub_2605C4EC4();
      swift_bridgeObjectRelease();
      if (v31) {
        goto LABEL_20;
      }
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v32 = v71;
      }
      else
      {
        sub_2605C2E80();
        uint64_t v32 = v57;
      }
      uint64_t v33 = v32[2];
      sub_2605C52B8();
      if (v36)
      {
        sub_2605C4C08(v35);
        sub_2605C5354();
        sub_2605C2E80();
        unint64_t v34 = v58;
      }
      v34[2] = v29;
      uint64_t v71 = v34;
      Swift::String v37 = (double *)&v34[2 * v33];
      v37[4] = v20;
      v37[5] = v26;
LABEL_35:
      ++v9;

      if (v8 == v9) {
        goto LABEL_39;
      }
    }
    swift_bridgeObjectRelease();
LABEL_20:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2605C5204();
      sub_2605C2E80();
      id v12 = v51;
    }
    uint64_t v38 = v12[2];
    sub_2605C52B8();
    if (v36)
    {
      sub_2605C4C08(v39);
      sub_2605C5354();
      sub_2605C2E80();
      id v12 = v52;
    }
    v12[2] = v29;
    Swift::String v40 = (double *)&v12[2 * v38];
    v40[4] = v20;
    v40[5] = v26;
    uint64_t v41 = sub_2605E2500();
    if (v42)
    {
      uint64_t v43 = v41;
      uint64_t v44 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605C2E80();
        uint64_t v10 = v53;
      }
      unint64_t v46 = v10[2];
      unint64_t v45 = v10[3];
      if (v46 >= v45 >> 1)
      {
        sub_2605C4C08(v45);
        sub_2605C2E80();
        uint64_t v10 = v54;
      }
      v10[2] = v46 + 1;
      BOOL v47 = &v10[2 * v46];
      v47[4] = v43;
      v47[5] = v44;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605C2E80();
        uint64_t v10 = v55;
      }
      uint64_t v48 = v10[2];
      sub_2605C52B8();
      if (v36)
      {
        sub_2605C4C08(v49);
        sub_2605C5354();
        sub_2605C2E80();
        uint64_t v10 = v56;
      }
      v10[2] = v14;
      uint64_t v50 = &v10[2 * v48];
      v50[4] = 0xD000000000000018;
      v50[5] = v70;
    }
    goto LABEL_35;
  }
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  id v12 = (void *)MEMORY[0x263F8EE78];
  uint64_t v71 = (void *)MEMORY[0x263F8EE78];
LABEL_39:
  swift_bridgeObjectRelease();
  switch(v69)
  {
    case 1:
      goto LABEL_45;
    case 2:
      sub_2605C5278();
      goto LABEL_45;
    case 3:
      sub_2605C5418();
      goto LABEL_45;
    case 4:
      sub_2605C542C();
      goto LABEL_45;
    case 5:
      sub_2605C53F0();
LABEL_45:
      char v59 = sub_2605C53D0();
      swift_bridgeObjectRelease();
      if (v59) {
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    default:
      swift_bridgeObjectRelease();
LABEL_46:
      uint64_t v6 = v12[2];
      if (v6)
      {
        unint64_t v60 = 0;
        uint64_t v61 = (double *)(v12 + 5);
        uint64_t v62 = v10 + 5;
        double v63 = 100000.0;
        unint64_t v7 = 0xE000000000000000;
        while (1)
        {
          double v64 = sqrt((a3 - *(v61 - 1)) * (a3 - *(v61 - 1)) + (a4 - *v61) * (a4 - *v61));
          if (v64 >= v63)
          {
            double v64 = v63;
          }
          else
          {
            swift_bridgeObjectRelease();
            if (v60 >= v10[2])
            {
              __break(1u);
              goto LABEL_63;
            }
            unint64_t v7 = *v62;
            swift_bridgeObjectRetain();
            double v63 = v64;
          }
          ++v60;
          v61 += 2;
          v62 += 2;
          if (v6 == v60) {
            goto LABEL_56;
          }
        }
      }
      double v64 = 100000.0;
LABEL_56:
      swift_bridgeObjectRelease();
      uint64_t v66 = v71[2];
      if (v66)
      {
        uint64_t v67 = (double *)(v71 + 5);
        do
        {
          double v68 = sqrt((a3 - *(v67 - 1)) * (a3 - *(v67 - 1)) + (a4 - *v67) * (a4 - *v67));
          if (v68 < v64) {
            double v64 = v68;
          }
          v67 += 2;
          --v66;
        }
        while (v66);
      }
      swift_bridgeObjectRelease();
      sub_2605C526C();
      sub_2605C5398();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0xD000000000000010;
  }
}

Swift::OpaquePointer_optional __swiftcall correlateActionWithScreenContext(trajectory:nlg:)(Swift::OpaquePointer trajectory, Swift::String nlg)
{
  sub_2605C5070();
  uint64_t v170 = v3;
  uint64_t v171 = v7;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v149 = v12;
  uint64_t v13 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_2605C4E84();
  uint64_t v158 = v17 - v18;
  MEMORY[0x270FA5388](v19);
  sub_2605C5318();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v141 - v21;
  id v23 = objc_msgSend(self, sel_defaultManager);
  id v24 = sub_2605C52A0(v23, sel_URLsForDirectory_inDomains_);

  uint64_t v25 = sub_2605E2B40();
  if (!*(void *)(v25 + 16)) {
    goto LABEL_104;
  }
  sub_2605C5028();
  sub_2605C523C();
  v26();
  swift_bridgeObjectRelease();
  v143._uint64_t countAndFlagsBits = v11;
  v143._unint64_t object = v9;
  sub_2605E2300();
  uint64_t v27 = scrapFileNamesStartingWith(prefix:inDirectory:)();
  sub_2605BBCB8(&qword_26A88BDA0);
  uint64_t v28 = MEMORY[0x263F8EE78];
  uint64_t v156 = sub_2605C4CDC();
  uint64_t v29 = sub_2605C4CDC();
  sub_2605BBCB8(&qword_26A88BDA8);
  uint64_t v159 = sub_2605E2890();
  uint64_t v148 = sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v30 = (__n128 *)sub_2605C4BCC();
  sub_2605C4FBC(v30, (uint64_t)&v169, (__n128)xmmword_2605E3700);
  swift_bridgeObjectRelease();
  sub_2605C53BC();
  uint64_t v167 = v31;
  unint64_t v168 = 0x80000002605E4C40;
  uint64_t v164 = *(void *)(v27 + 16);
  sub_2605E2F20();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  unint64_t v32 = v167;
  unint64_t v33 = v168;
  v30[3].n128_u64[1] = MEMORY[0x263F8D310];
  v30[2].n128_u64[0] = v32;
  v30[2].n128_u64[1] = v33;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  uint64_t v34 = *(void *)(v27 + 16);
  uint64_t v147 = v22;
  uint64_t v153 = v34;
  uint64_t v145 = v15;
  uint64_t v146 = v2;
  if (!v34)
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = v29;
    goto LABEL_24;
  }
  uint64_t v155 = 0;
  unint64_t v35 = 0;
  uint64_t v152 = v27 + 32;
  uint64_t v151 = v15 + 8;
  uint64_t v36 = v29;
  uint64_t v144 = v13;
  uint64_t v150 = v27;
  do
  {
    if (v35 >= *(void *)(v27 + 16))
    {
      __break(1u);
LABEL_103:
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
      JUMPOUT(0x2605C0A4CLL);
    }
    unint64_t v160 = v35;
    swift_bridgeObjectRetain();
    sub_2605E2300();
    swift_bridgeObjectRelease();
    v37._uint64_t countAndFlagsBits = sub_2605E22C0();
    unint64_t v38 = (unint64_t)readMatrixFromUIUnderstandingFile(filePath:)(v37);
    swift_bridgeObjectRelease();
    if (v38)
    {
      uint64_t v157 = v36;
      uint64_t v166 = MEMORY[0x263F8EE78];
      uint64_t v167 = MEMORY[0x263F8EE78];
      uint64_t v164 = MEMORY[0x263F8EE78];
      uint64_t v39 = *(void *)(v38 + 16);
      v154 = (const char *)v38;
      if (v39)
      {
        Swift::String v40 = (uint64_t *)(v38 + 136);
        uint64_t v161 = MEMORY[0x263F8EE78];
        do
        {
          uint64_t v42 = *(v40 - 5);
          uint64_t v41 = *(v40 - 4);
          unint64_t v43 = *(v40 - 1);
          uint64_t v44 = *v40;
          BOOL v45 = *(v40 - 3) == 1954047348 && *(v40 - 2) == 0xE400000000000000;
          if (v45 || (sub_2605C4EC4() & 1) != 0)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v162 = v43;
            sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
            uint64_t v46 = sub_2605C51E4(v164);
            sub_2605C2AE4(v46, v47, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
            uint64_t v48 = v164;
            *(void *)(v164 + 16) = v28 + 1;
            uint64_t v49 = v48 + 16 * v28;
            *(void *)(v49 + 32) = v42;
            *(void *)(v49 + 40) = v41;
            swift_bridgeObjectRetain();
            sub_2605C2A20((uint64_t)&qword_26A88BE20, (uint64_t)sub_2605C306C, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
            uint64_t v50 = sub_2605C51E4(v166);
            sub_2605C2AE4(v50, v51, (uint64_t)sub_2605C306C, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
            sub_2605C5384();
            *(void *)(v52 + 32) = v162;
            *(void *)(v52 + 40) = v44;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_2605C2A20((uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
            uint64_t v53 = *(void *)(v167 + 16);
            sub_2605C2AE4(v53, (uint64_t)&unk_26A88BDF0, (uint64_t)sub_2605C3380, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
            uint64_t v54 = v167;
            *(void *)(v167 + 16) = v53 + 1;
            uint64_t v161 = v54;
            uint64_t v55 = v54 + 16 * v53;
            *(void *)(v55 + 32) = v42;
            *(void *)(v55 + 40) = v41;
          }
          v40 += 14;
          --v39;
        }
        while (v39);
      }
      else
      {
        uint64_t v161 = MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRelease();
      uint64_t v57 = v156;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v163 = v57;
      uint64_t v59 = v155;
      sub_2605C3AC4(v161, v155, isUniquelyReferenced_nonNull_native, &qword_26A88BE08);
      uint64_t v156 = v163;
      swift_bridgeObjectRelease();
      uint64_t v60 = v157;
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v163 = v60;
      uint64_t v61 = sub_2605C52D8();
      sub_2605C3AC4(v61, v62, v63, &qword_26A88BE08);
      uint64_t v36 = v163;
      swift_bridgeObjectRelease();
      uint64_t v64 = v159;
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v163 = v64;
      uint64_t v65 = sub_2605C52D8();
      sub_2605C3AC4(v65, v66, v67, &qword_26A88BE00);
      uint64_t v159 = v163;
      swift_bridgeObjectRelease();
      uint64_t v13 = v144;
      sub_2605C4F8C();
      v68();
      BOOL v69 = __OFADD__(v59, 1);
      uint64_t v70 = v59 + 1;
      if (v69) {
        goto LABEL_103;
      }
      uint64_t v155 = v70;
      uint64_t v15 = v145;
    }
    else
    {
      sub_2605C4F8C();
      v56();
    }
    unint64_t v35 = v160 + 1;
    uint64_t v27 = v150;
  }
  while (v160 + 1 != v153);
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v157 = v36;
  uint64_t v71 = *(void *)(v149 + 16);
  if (v71 && v71 == *(void *)(v156 + 16) - 1)
  {
    uint64_t v72 = 0;
    uint64_t v166 = MEMORY[0x263F8EE78];
    v73 = (void *)(v71 - 1);
    uint64_t v74 = MEMORY[0x263F8D6C8];
    unint64_t v75 = MEMORY[0x263F8D738];
    unint64_t v162 = 0x80000002605E4C80;
    uint64_t v167 = 0;
    unint64_t v168 = 0xE000000000000000;
    v154 = "trajectory[index] for ";
    uint64_t v161 = 0x80000002605E4CA0;
    sub_2605C526C();
    uint64_t v153 = v76;
    double v77 = 100000.0;
    sub_2605C526C();
    uint64_t v152 = v78;
    sub_2605C526C();
    uint64_t v151 = v79;
    uint64_t v80 = v149;
    do
    {
      if (*(void *)(v80 + 16) && (unint64_t v81 = sub_2605C3A80(v72), (v82 & 1) != 0))
      {
        double v83 = (__n128 *)0xEA00000000007466;
        switch(*(unsigned char *)(*(void *)(v80 + 56) + 40 * v81))
        {
          case 1:
            goto LABEL_40;
          case 2:
            double v83 = (__n128 *)0xEB00000000746867;
            sub_2605C5278();
            goto LABEL_40;
          case 3:
            double v83 = (__n128 *)0xEB000000006E776FLL;
            sub_2605C5418();
            goto LABEL_40;
          case 4:
            double v83 = (__n128 *)0xE900000000000070;
            sub_2605C542C();
            goto LABEL_40;
          case 5:
            double v83 = (__n128 *)0xE700000000000000;
            sub_2605C53F0();
LABEL_40:
            uint64_t v85 = sub_2605C53D0();
            swift_bridgeObjectRelease();
            if (v85) {
              goto LABEL_41;
            }
            break;
          default:
            swift_bridgeObjectRelease();
LABEL_41:
            uint64_t v85 = v157;
            if (!*(void *)(v157 + 16) || (unint64_t v88 = sub_2605C3A80(v72), (v89 & 1) == 0))
            {
              double v83 = (__n128 *)sub_2605C4BCC();
              sub_2605C5100(v83);
              uint64_t v164 = sub_2605C3978(60);
              uint64_t v165 = v99;
              sub_2605E2A50();
              sub_2605C52E4();
              uint64_t v85 = (uint64_t)&v164;
              sub_2605E2A50();
              uint64_t v80 = v149;
              swift_bridgeObjectRelease();
              goto LABEL_32;
            }
            if (*(void *)(v159 + 16))
            {
              double v83 = *(__n128 **)(*(void *)(v157 + 56) + 8 * v88);
              uint64_t v85 = v159;
              unint64_t v90 = sub_2605C3A80(v72);
              if (v91)
              {
                uint64_t v150 = (uint64_t)v73;
                uint64_t v155 = v83[1].n128_i64[0];
                double v142 = v77;
                if (v155)
                {
                  uint64_t v144 = v13;
                  uint64_t v92 = *(void *)(*(void *)(v159 + 56) + 8 * v90);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  uint64_t v93 = 0;
                  unint64_t v94 = 0;
                  sub_2605C5098();
                  do
                  {
                    v73 = (void *)v75;
                    uint64_t v80 = v74;
                    double v95 = v83[v93 + 2].n128_f64[0];
                    double v96 = v83[v93 + 2].n128_f64[1];
                    uint64_t v164 = sub_2605C3978(18);
                    uint64_t v165 = v97;
                    sub_2605E2BD0();
                    sub_2605E2A50();
                    swift_bridgeObjectRelease();
                    sub_2605C4BB4();
                    sub_2605E2BD0();
                    sub_2605E2A50();
                    swift_bridgeObjectRelease();
                    sub_2605C4BB4();
                    if (!sub_2605BD9FC(v72, v159)) {
                      goto LABEL_105;
                    }
                    sub_2605C4F1C();
                    sub_2605C53A4(v94);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRelease();
                    sub_2605E2A50();
                    swift_bridgeObjectRelease();
                    sub_2605C4BB4();
                    sub_2605E2BE0();
                    sub_2605C4BB4();
                    sub_2605E2BE0();
                    sub_2605C4BB4();
                    sub_2605E2BE0();
                    sub_2605C4DA4();
                    sub_2605E29E0();
                    uint64_t v85 = (uint64_t)&v167;
                    sub_2605E2A50();
                    swift_bridgeObjectRelease();
                    if (v4 < v77)
                    {
                      swift_bridgeObjectRelease();
                      sub_2605C39E8(v94, 1, v92);
                      uint64_t v98 = *(void *)(v92 + v93 * 16 + 40);
                      unint64_t v160 = *(void *)(v92 + v93 * 16 + 32);
                      uint64_t v158 = v98;
                      swift_bridgeObjectRetain();
                      double v5 = v96;
                      double v6 = v95;
                      double v77 = v4;
                    }
                    ++v94;
                    ++v93;
                  }
                  while (v155 != v94);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v13 = v144;
                  uint64_t v15 = v145;
                }
                else
                {
                  sub_2605C5098();
                }
                uint64_t v100 = sub_2605BD9FC(v72, v156);
                if (v100)
                {
                  uint64_t v101 = *(void *)(v100 + 16);
                  if (v101)
                  {
                    unint64_t v102 = (double *)(v100 + 40);
                    unint64_t v75 = MEMORY[0x263F8E238];
                    do
                    {
                      double v103 = *(v102 - 1);
                      double v104 = *v102;
                      uint64_t v164 = sub_2605C4C14();
                      uint64_t v165 = v105;
                      sub_2605E2BD0();
                      sub_2605E2A50();
                      swift_bridgeObjectRelease();
                      sub_2605C4BB4();
                      sub_2605E2BD0();
                      sub_2605E2A50();
                      swift_bridgeObjectRelease();
                      sub_2605C4D68();
                      sub_2605E2A50();
                      sub_2605E2BE0();
                      sub_2605C4BB4();
                      sub_2605E2BE0();
                      sub_2605C4BB4();
                      sub_2605E2BE0();
                      sub_2605C4DA4();
                      sub_2605E29E0();
                      sub_2605E2A50();
                      swift_bridgeObjectRelease();
                      if (v4 < v77)
                      {
                        double v5 = v104;
                        double v6 = v103;
                        double v77 = v4;
                      }
                      v102 += 2;
                      --v101;
                    }
                    while (v101);
                  }
                  swift_bridgeObjectRelease();
                  uint64_t v106 = v166;
                  uint64_t v107 = *(void *)(v166 + 16);
                  double v77 = v142;
                  uint64_t v108 = v158;
                  if (v107)
                  {
                    uint64_t v109 = v107 - 1;
                    sub_2605C53A4(v107 - 1);
                    uint64_t v110 = *(void *)(v106 + 32 * v109 + 40);
                    swift_bridgeObjectRetain();
                    uint64_t v111 = -1;
                    unint64_t v75 = 1;
                    while (1)
                    {
                      if (qword_26A88BCB0 != -1) {
                        swift_once();
                      }
                      sub_2605C536C();
                      BOOL v113 = v45 && v110 == v112;
                      if (!v113 && (sub_2605C4F00() & 1) == 0)
                      {
                        if (qword_26A88BCB8 != -1) {
                          swift_once();
                        }
                        sub_2605C536C();
                        BOOL v115 = v45 && v110 == v114;
                        if (!v115 && (sub_2605C4F00() & 1) == 0)
                        {
                          if (qword_26A88BCC0 != -1) {
                            swift_once();
                          }
                          sub_2605C536C();
                          BOOL v117 = v45 && v110 == v116;
                          if (!v117 && (sub_2605C4F00() & 1) == 0)
                          {
                            if (qword_26A88BCC8 != -1) {
                              swift_once();
                            }
                            sub_2605C536C();
                            BOOL v119 = v45 && v110 == v118;
                            if (!v119 && (sub_2605C4F00() & 1) == 0) {
                              break;
                            }
                          }
                        }
                      }
                      unint64_t v120 = v111 + *(void *)(v106 + 16);
                      MEMORY[0x261215AC0](32, 0xE100000000000000, v160, v108);
                      sub_2605C48EC();
                      sub_2605C492C(v120, v166);
                      sub_2605E2A50();
                      swift_bridgeObjectRelease();
                      uint64_t v106 = v166;
                      unint64_t v121 = *(void *)(v166 + 16);
                      if (v75 >= v121) {
                        break;
                      }
                      ++v75;
                      unint64_t v122 = --v111 + v121;
                      sub_2605C53A4(v111 + v121);
                      uint64_t v123 = *(void *)(v106 + 32 * v122 + 40);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRelease();
                      uint64_t v110 = v123;
                    }
                    swift_bridgeObjectRelease();
                  }
                  swift_bridgeObjectRelease();
                  sub_2605C5040();
                  uint64_t v164 = v124;
                  uint64_t v165 = v152;
                  sub_2605E2A50();
                  swift_bridgeObjectRelease();
                  double v83 = (__n128 *)sub_2605E29E0();
                  uint64_t v80 = v125;
                  uint64_t v85 = (uint64_t)&v166;
                  v73 = &unk_26A88BE10;
                  sub_2605C2A20((uint64_t)&unk_26A88BE10, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2F90);
                  uint64_t v126 = sub_2605C51E4(v166);
                  sub_2605C2AE4(v126, v127, (uint64_t)sub_2605C3268, (uint64_t)sub_2605D9D7C, (uint64_t (*)(BOOL))sub_2605C2F90);
                  uint64_t v128 = v166;
                  *(void *)(v166 + 16) = v75 + 1;
                  unint64_t v129 = v128 + 32 * v75;
                  *(void *)(v129 + 32) = v83;
                  *(void *)(v129 + 40) = v80;
                  *(double *)(v129 + 48) = v6;
                  *(double *)(v129 + 56) = v5;
                  uint64_t v15 = v145;
                  sub_2605C5304();
                  uint64_t v74 = MEMORY[0x263F8D6C8];
                  unint64_t v75 = MEMORY[0x263F8D738];
                }
                else
                {
                  swift_bridgeObjectRelease();
                  sub_2605C5304();
                  double v77 = v142;
                }
              }
            }
            break;
        }
      }
      else
      {
        double v83 = (__n128 *)sub_2605C4BCC();
        sub_2605C5100(v83);
        uint64_t v164 = sub_2605C3978(55);
        uint64_t v165 = v84;
        sub_2605E2A50();
        sub_2605C52E4();
        uint64_t v85 = (uint64_t)&v164;
        sub_2605E2A50();
        uint64_t v80 = v149;
        swift_bridgeObjectRelease();
LABEL_32:
        sub_2605E2A50();
        uint64_t v86 = sub_2605E29E0();
        v83[3].n128_u64[1] = MEMORY[0x263F8D310];
        v83[2].n128_u64[0] = v86;
        v83[2].n128_u64[1] = v87;
        sub_2605C4B94();
        swift_bridgeObjectRelease();
      }
      BOOL v45 = v72++ == (void)v73;
    }
    while (!v45);
    sub_2605C5340();
    v131._unint64_t object = (void *)0x80000002605E4CC0;
    v132._unint64_t object = (void *)v85;
    writeStringToFile(folderName:fileName:data:)(v143, v131, v132);
    sub_2605C4E94();
    if (!v80 && v83 == (__n128 *)0xE000000000000000 || (sub_2605C4BE4() & 1) != 0)
    {
      uint64_t v133 = (__n128 *)sub_2605C4BCC();
      sub_2605C5100(v133);
      sub_2605C3978(19);
      swift_bridgeObjectRelease();
      sub_2605C51A4();
      uint64_t v164 = v134;
      uint64_t v165 = v135;
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      uint64_t v136 = sub_2605E29E0();
      v133[3].n128_u64[1] = MEMORY[0x263F8D310];
      v133[2].n128_u64[0] = v136;
      v133[2].n128_u64[1] = v137;
      sub_2605C4B94();
    }
    swift_bridgeObjectRelease();
    uint64_t v138 = *(void (**)(void))(v15 + 8);
    sub_2605C4E04();
    v138();
    sub_2605C4E04();
    v138();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v130 = *(void (**)(void))(v15 + 8);
    sub_2605C4E04();
    v130();
    sub_2605C4E04();
    v130();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605C5110();
  result.value._rawValue = v139;
  result.is_nil = v140;
  return result;
}

Swift::Void __swiftcall printPlanInSemanticActionSpace(semanticActionPlan:)(Swift::OpaquePointer semanticActionPlan)
{
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v2 = sub_2605C4BCC();
  *(_OWORD *)(v2 + 16) = xmmword_2605E3700;
  uint64_t v3 = MEMORY[0x263F8D310];
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 32) = 0xD00000000000002DLL;
  *(void *)(v2 + 40) = 0x80000002605E4DC0;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  uint64_t v4 = *((void *)semanticActionPlan._rawValue + 2);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    double v6 = (char *)semanticActionPlan._rawValue + 40;
    do
    {
      ++v5;
      uint64_t v7 = sub_2605C4BCC();
      *(_OWORD *)(v7 + 16) = xmmword_2605E3700;
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2605E2F20();
      uint64_t v10 = v8;
      sub_2605E2A50();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      *(void *)(v7 + 56) = v3;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      sub_2605C4B94();
      swift_bridgeObjectRelease();
      v6 += 32;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall retainPlanInSemanticActionSpace(semanticActionPlan:nlg:)(Swift::OpaquePointer semanticActionPlan, Swift::String nlg)
{
  unint64_t object = nlg._object;
  uint64_t countAndFlagsBits = nlg._countAndFlagsBits;
  uint64_t v4 = *((void *)semanticActionPlan._rawValue + 2);
  if (v4)
  {
    uint64_t v5 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      unint64_t v8 = *(v5 - 1);
      unint64_t v9 = *v5;
      swift_bridgeObjectRetain();
      sub_2605C4DA4();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      v5 += 4;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  sub_2605C5248(0xD000000000000017, 0, (uint64_t)"semanticActionPlan.text");
  sub_2605C4E94();
  if (countAndFlagsBits) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = object == (void *)0xE000000000000000;
  }
  if (v6 || (sub_2605C4BE4() & 1) != 0)
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v7 = (__n128 *)sub_2605C4BCC();
    sub_2605C51B0(v7, (__n128)xmmword_2605E3700);
    swift_bridgeObjectRelease();
    sub_2605C5000();
    swift_bridgeObjectRelease();
    v7[3].n128_u64[1] = MEMORY[0x263F8D310];
    v7[2].n128_u64[0] = v8;
    v7[2].n128_u64[1] = v9;
    sub_2605C4B94();
  }

  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall retainPlanInSemanticActionSpaceGridAware(semanticActionBundle:nlg:)(Swift::tuple_OpaquePointer_OpaquePointer semanticActionBundle, Swift::String nlg)
{
  unint64_t object = nlg._object;
  uint64_t countAndFlagsBits = nlg._countAndFlagsBits;
  rawValue = semanticActionBundle._0._rawValue;
  uint64_t v5 = *((void *)semanticActionBundle._1._rawValue + 2);
  if (v5)
  {
    BOOL v6 = (char *)semanticActionBundle._1._rawValue;
    swift_bridgeObjectRetain();
    uint64_t v7 = (unint64_t *)(v6 + 40);
    do
    {
      unint64_t v11 = *(v7 - 1);
      unint64_t v12 = *v7;
      swift_bridgeObjectRetain();
      sub_2605C4DA4();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      v7 += 4;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  sub_2605E2A50();
  uint64_t v8 = rawValue[2];
  if (v8)
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = (char *)(rawValue + 5);
    do
    {
      unint64_t v11 = 0;
      unint64_t v12 = 0xE000000000000000;
      sub_2605E2BE0();
      sub_2605C4BB4();
      sub_2605E2BE0();
      sub_2605C4DA4();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      v9 += 16;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  sub_2605C5248(0xD000000000000020, 0, (uint64_t)"semanticActionPlanGridAware.text");
  sub_2605C4E94();
  if (!countAndFlagsBits && object == (void *)0xE000000000000000 || (sub_2605C4BE4() & 1) != 0)
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v10 = (__n128 *)sub_2605C4BCC();
    sub_2605C51B0(v10, (__n128)xmmword_2605E3700);
    swift_bridgeObjectRelease();
    sub_2605C5000();
    swift_bridgeObjectRelease();
    v10[3].n128_u64[1] = MEMORY[0x263F8D310];
    v10[2].n128_u64[0] = v11;
    v10[2].n128_u64[1] = v12;
    sub_2605C4B94();
  }
  swift_bridgeObjectRelease();
}

unint64_t sub_2605C0F1C(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v4 = 11;
    }
    unint64_t v5 = v4 | (v3 << 16);
    Swift::OpaquePointer_optional result = sub_2605E2A20();
    if (v6) {
      Swift::OpaquePointer_optional result = v5;
    }
    if (4 * v3 >= result >> 14)
    {
      uint64_t v7 = sub_2605E2B10();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

Swift::OpaquePointer_optional __swiftcall readPlanInSemanticActionSpace(nlg:)(Swift::String nlg)
{
  sub_2605E2280();
  sub_2605C4B78();
  uint64_t v85 = v2;
  *(void *)&long long v86 = v1;
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_2605C532C();
  uint64_t v84 = v3;
  sub_2605E29B0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_2605C5138();
  uint64_t v4 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v6 = v5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_2605C4E84();
  uint64_t v9 = v7 - v8;
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v12 = (char *)v80 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v80 - v13;
  id v15 = objc_msgSend(self, sel_defaultManager);
  id v16 = sub_2605C52A0(v15, sel_URLsForDirectory_inDomains_);

  uint64_t v17 = sub_2605E2B40();
  if (*(void *)(v17 + 16))
  {
    sub_2605C528C();
    sub_2605C523C();
    v20();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    sub_2605E2300();
    sub_2605E29A0();
    uint64_t v21 = sub_2605E2950();
    uint64_t v22 = v12;
    uint64_t v82 = v6;
    uint64_t v83 = v4;
    v80[1] = v9;
    uint64_t v87 = v21;
    uint64_t v88 = v23;
    sub_2605E2270();
    sub_2605C4948();
    uint64_t v24 = sub_2605E2CC0();
    sub_2605C4F8C();
    v25();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void *)(v24 + 16);
    v80[2] = v22;
    unint64_t v81 = v14;
    v80[0] = v24;
    uint64_t v27 = (const char *)MEMORY[0x263F8EE78];
    if (v26)
    {
      uint64_t v28 = (unint64_t *)(v24 + 40);
      uint64_t v85 = "\tIcon/Container\t";
      *(void *)&long long v86 = 0x80000002605E4D80;
      do
      {
        uint64_t v29 = *(v28 - 1);
        unint64_t v30 = *v28;
        if (v29) {
          BOOL v31 = 0;
        }
        else {
          BOOL v31 = v30 == 0xE000000000000000;
        }
        if (v31 || (sub_2605E2F40() & 1) != 0) {
          goto LABEL_41;
        }
        uint64_t v32 = qword_26A88BCB0;
        swift_bridgeObjectRetain();
        if (v32 != -1) {
          swift_once();
        }
        uint64_t v33 = qword_26A88C750;
        uint64_t v34 = *(void *)algn_26A88C758;
        if (sub_2605C4CAC())
        {
          swift_bridgeObjectRetain();
          sub_2605C4DE0();
          if (sub_2605C4CAC())
          {
            swift_bridgeObjectRetain();
            sub_2605C4DE0();
LABEL_34:
            unint64_t v45 = sub_2605E2A10();
            unint64_t v46 = sub_2605C0F1C(v45, v29, v30);
            uint64_t v29 = MEMORY[0x261215A90](v46);
            unint64_t v48 = v47;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v30 = v48;
          }
        }
        else
        {
          if (qword_26A88BCB8 != -1) {
            swift_once();
          }
          uint64_t v33 = qword_26A88C760;
          uint64_t v34 = *(void *)algn_26A88C768;
          if (sub_2605C4CAC())
          {
            swift_bridgeObjectRetain();
            sub_2605C4FE4();
            if (sub_2605C4CAC())
            {
              swift_bridgeObjectRetain();
              sub_2605C4FE4();
              goto LABEL_34;
            }
          }
          else
          {
            if (qword_26A88BCC0 != -1) {
              swift_once();
            }
            uint64_t v36 = qword_26A88C770;
            uint64_t v35 = *(void *)algn_26A88C778;
            if (sub_2605C4CAC())
            {
              swift_bridgeObjectRetain();
              sub_2605C4D1C();
              if (sub_2605C4CAC())
              {
                swift_bridgeObjectRetain();
                sub_2605C4D1C();
                unint64_t v37 = sub_2605E2A10();
                unint64_t v38 = sub_2605C0F1C(v37, v29, v30);
                uint64_t v29 = MEMORY[0x261215A90](v38);
                unint64_t v40 = v39;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                unint64_t v30 = v40;
              }
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_2605C4F98();
                sub_2605C2F90();
                uint64_t v27 = v61;
              }
              unint64_t v42 = *((void *)v27 + 2);
              unint64_t v41 = *((void *)v27 + 3);
              if (v42 >= v41 >> 1)
              {
                sub_2605C4C08(v41);
                sub_2605C4F98();
                sub_2605C2F90();
                uint64_t v27 = v62;
              }
              *((void *)v27 + 2) = v42 + 1;
              unint64_t v43 = &v27[32 * v42];
              *((void *)v43 + 6) = v29;
              uint64_t v44 = v43 + 48;
              *((void *)v44 - 2) = v36;
              *((void *)v44 - 1) = v35;
              goto LABEL_40;
            }
            if (qword_26A88BCC8 != -1) {
              swift_once();
            }
            uint64_t v33 = qword_26A88C780;
            uint64_t v34 = *(void *)algn_26A88C788;
            if ((sub_2605C4CAC() & 1) == 0)
            {
              sub_2605C4D68();
              if (sub_2605C4CAC())
              {
                swift_bridgeObjectRetain();
                unint64_t v52 = sub_2605E2A10();
                unint64_t v53 = sub_2605C0F1C(v52, v29, v30);
                uint64_t v29 = MEMORY[0x261215A90](v53);
                unint64_t v55 = v54;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                unint64_t v30 = v55;
              }
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_2605C4F98();
                sub_2605C2F90();
                uint64_t v27 = v63;
              }
              unint64_t v57 = *((void *)v27 + 2);
              unint64_t v56 = *((void *)v27 + 3);
              if (v57 >= v56 >> 1)
              {
                sub_2605C4C08(v56);
                sub_2605C4F98();
                sub_2605C2F90();
                uint64_t v27 = v64;
              }
              *((void *)v27 + 2) = v57 + 1;
              uint64_t v58 = &v27[32 * v57];
              *((void *)v58 + 6) = v29;
              uint64_t v44 = v58 + 48;
              *((void *)v44 - 2) = 7364948;
              *((void *)v44 - 1) = 0xE300000000000000;
              goto LABEL_40;
            }
            swift_bridgeObjectRetain();
            sub_2605C4F3C();
            if (sub_2605C4CAC())
            {
              swift_bridgeObjectRetain();
              sub_2605C4F3C();
              goto LABEL_34;
            }
          }
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2605C4F98();
          sub_2605C2F90();
          uint64_t v27 = v59;
        }
        unint64_t v50 = *((void *)v27 + 2);
        unint64_t v49 = *((void *)v27 + 3);
        if (v50 >= v49 >> 1)
        {
          sub_2605C4C08(v49);
          sub_2605C4F98();
          sub_2605C2F90();
          uint64_t v27 = v60;
        }
        *((void *)v27 + 2) = v50 + 1;
        uint64_t v51 = &v27[32 * v50];
        *((void *)v51 + 6) = v29;
        uint64_t v44 = v51 + 48;
        *((void *)v44 - 2) = v33;
        *((void *)v44 - 1) = v34;
LABEL_40:
        *((void *)v44 + 1) = v30;
LABEL_41:
        v28 += 2;
        --v26;
      }
      while (v26);
    }
    swift_bridgeObjectRelease();
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v65 = sub_2605C4BCC();
    long long v86 = xmmword_2605E3700;
    *(_OWORD *)(v65 + 16) = xmmword_2605E3700;
    *(void *)(v65 + 56) = MEMORY[0x263F8D310];
    sub_2605C5040();
    *(void *)(v67 + 32) = v66 + 10;
    *(void *)(v67 + 40) = 0x80000002605E4E40;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    uint64_t v68 = *((void *)v27 + 2);
    uint64_t v69 = v83;
    if (v68)
    {
      swift_bridgeObjectRetain();
      uint64_t v85 = v27;
      uint64_t v70 = (uint64_t *)(v27 + 56);
      do
      {
        uint64_t v72 = *(v70 - 3);
        uint64_t v71 = *(v70 - 2);
        uint64_t v73 = *(v70 - 1);
        uint64_t v74 = *v70;
        uint64_t v75 = sub_2605C4BCC();
        *(_OWORD *)(v75 + 16) = v86;
        *(void *)(v75 + 56) = sub_2605BBCB8(&qword_26A88BDB8);
        uint64_t v76 = (void *)swift_allocObject();
        *(void *)(v75 + 32) = v76;
        v76[2] = v72;
        v76[3] = v71;
        v76[4] = v73;
        v76[5] = v74;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_2605C4B94();
        swift_bridgeObjectRelease();
        v70 += 4;
        --v68;
      }
      while (v68);
      uint64_t v27 = v85;
      swift_bridgeObjectRelease();
      uint64_t v69 = v83;
    }
    double v77 = *(void (**)(uint64_t))(v82 + 8);
    sub_2605C504C();
    v77(v78);
    sub_2605C504C();
    v77(v79);
    ((void (*)(char *, uint64_t))v77)(v81, v69);
    uint64_t v18 = (char *)v27;
  }
  else
  {
    __break(1u);
  }
  result.value._rawValue = v18;
  result.is_nil = v19;
  return result;
}

Swift::tuple_OpaquePointer_OpaquePointer_optional __swiftcall readPlanInSemanticActionSpaceGridAware(nlg:)(Swift::String nlg)
{
  sub_2605E2280();
  sub_2605C4B78();
  uint64_t v109 = v2;
  uint64_t v110 = v1;
  MEMORY[0x270FA5388](v1);
  sub_2605C532C();
  uint64_t v108 = v3;
  uint64_t v4 = sub_2605E29B0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_2605C5150();
  uint64_t v5 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_2605C4E84();
  uint64_t v11 = v9 - v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  id v15 = (char *)v103 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v103 - v16;
  id v18 = objc_msgSend(self, sel_defaultManager);
  id v19 = sub_2605C52A0(v18, sel_URLsForDirectory_inDomains_);

  uint64_t v20 = sub_2605E2B40();
  if (!*(void *)(v20 + 16))
  {
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  uint64_t v111 = v15;
  sub_2605C528C();
  sub_2605C523C();
  v24();
  swift_bridgeObjectRelease();
  sub_2605E2300();
  unint64_t v25 = (unint64_t)v111;
  sub_2605E2300();
  sub_2605E29A0();
  uint64_t v26 = sub_2605E2950();
  uint64_t v27 = v17;
  uint64_t v106 = v11;
  uint64_t v107 = v7;
  uint64_t v114 = v26;
  uint64_t v115 = v28;
  uint64_t v29 = v108;
  sub_2605E2270();
  unint64_t v30 = sub_2605C4948();
  uint64_t v31 = sub_2605E2CC0();
  sub_2605C4F8C();
  v32();
  swift_bridgeObjectRelease();
  if (!*(void *)(v31 + 16))
  {
    swift_bridgeObjectRelease();
    unint64_t v102 = (void *)MEMORY[0x263F8EE78];
    uint64_t v110 = (void *)MEMORY[0x263F8EE78];
LABEL_95:
    uint64_t v100 = v107;
    goto LABEL_96;
  }
  v103[8] = v30;
  uint64_t v104 = 0;
  uint64_t v105 = v5;
  unint64_t v33 = 0;
  int v34 = 0;
  sub_2605C4C60();
  uint64_t v35 = (unint64_t *)(v31 + 40);
  uint64_t v37 = v36 - 1;
  v103[6] = "Swipe right to  ";
  v103[7] = 0x80000002605E4E80;
  v103[3] = "Semantic action plan read:";
  v103[5] = 0x80000002605E4E60;
  v103[2] = "\tIcon/Container\t";
  v103[4] = 0x80000002605E4D80;
  uint64_t v108 = MEMORY[0x263F8EE78];
  uint64_t v109 = v27;
  uint64_t v110 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v39 = *(v35 - 1);
    unint64_t v38 = *v35;
    if (v39) {
      BOOL v40 = 0;
    }
    else {
      BOOL v40 = v38 == 0xE000000000000000;
    }
    if (v40 || (sub_2605E2F40() & 1) != 0)
    {
      if (v37 == v33) {
        goto LABEL_97;
      }
      goto LABEL_10;
    }
    if (v39 == v29 && v38 == 0xE700000000000000)
    {
LABEL_18:
      if (v37 == v33) {
        goto LABEL_97;
      }
      goto LABEL_19;
    }
    if ((sub_2605C4D74() | v34))
    {
      if (sub_2605C4D74()) {
        goto LABEL_18;
      }
      if (v34)
      {
        uint64_t v114 = v39;
        uint64_t v115 = v38;
        v113[0] = 9;
        v113[1] = 0xE100000000000000;
        uint64_t v21 = (void *)sub_2605E2CD0();
        if (!v21[2]) {
          goto LABEL_100;
        }
        unint64_t v52 = v21;
        uint64_t v53 = v21[4];
        uint64_t v54 = v21[5];
        v113[0] = 0;
        uint64_t v55 = MEMORY[0x270FA5388](v21);
        v103[-2] = v113;
        if ((v54 & 0x1000000000000000) != 0 || !(v54 & 0x2000000000000000 | v53 & 0x1000000000000000))
        {
          swift_bridgeObjectRetain();
          uint64_t v59 = v104;
          sub_2605E2D40();
          uint64_t v21 = (void *)swift_bridgeObjectRelease();
        }
        else
        {
          v103[1] = v103;
          MEMORY[0x270FA5388](v55);
          v103[-2] = sub_2605C4AE4;
          v103[-1] = &v103[-4];
          if ((v54 & 0x2000000000000000) != 0)
          {
            uint64_t v114 = v53;
            uint64_t v115 = v54 & 0xFFFFFFFFFFFFFFLL;
            swift_bridgeObjectRetain();
            uint64_t v59 = v104;
            sub_2605C49D4(&v114, &v112);
            uint64_t v21 = (void *)swift_bridgeObjectRelease();
          }
          else
          {
            if ((v53 & 0x1000000000000000) != 0)
            {
              uint64_t v56 = (v54 & 0xFFFFFFFFFFFFFFFLL) + 32;
              uint64_t v57 = v53 & 0xFFFFFFFFFFFFLL;
            }
            else
            {
              uint64_t v56 = sub_2605E2DB0();
              uint64_t v57 = v97;
            }
            swift_bridgeObjectRetain();
            uint64_t v58 = v57;
            uint64_t v59 = v104;
            BOOL v112 = sub_2605C4A40(v56, v58, (void (*)(uint64_t *__return_ptr))sub_2605C4B00) & 1;
            uint64_t v21 = (void *)swift_bridgeObjectRelease();
          }
        }
        if (!v112) {
          goto LABEL_102;
        }
        if (v52[2] <= 1uLL) {
          goto LABEL_101;
        }
        uint64_t v67 = v113[0];
        uint64_t v68 = v52[6];
        uint64_t v29 = v52[7];
        swift_bridgeObjectRetain();
        uint64_t v69 = swift_bridgeObjectRelease();
        v113[0] = 0;
        uint64_t v70 = MEMORY[0x270FA5388](v69);
        v103[-2] = v113;
        if ((v29 & 0x1000000000000000) != 0 || !(v29 & 0x2000000000000000 | v68 & 0x1000000000000000))
        {
          sub_2605E2D40();
          goto LABEL_72;
        }
        MEMORY[0x270FA5388](v70);
        v103[-2] = sub_2605C4B60;
        v103[-1] = v71;
        if ((v29 & 0x2000000000000000) != 0)
        {
          uint64_t v114 = v68;
          uint64_t v115 = v29 & 0xFFFFFFFFFFFFFFLL;
          sub_2605C49D4(&v114, &v112);
          swift_bridgeObjectRelease();
        }
        else
        {
          if ((v68 & 0x1000000000000000) != 0)
          {
            uint64_t v72 = (v29 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v73 = v68 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v72 = sub_2605E2DB0();
          }
          BOOL v112 = sub_2605C4A40(v72, v73, (void (*)(uint64_t *__return_ptr))sub_2605C4B00) & 1;
LABEL_72:
          swift_bridgeObjectRelease();
        }
        unint64_t v25 = (unint64_t)v111;
        uint64_t v74 = v108;
        sub_2605C4C60();
        if ((v75 & 1) == 0) {
          goto LABEL_103;
        }
        uint64_t v76 = v113[0];
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v104 = v59;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2605C2E80();
          uint64_t v74 = v95;
        }
        uint64_t v78 = *(void *)(v74 + 16);
        uint64_t v108 = v74;
        sub_2605C52B8();
        if (v49)
        {
          sub_2605C4C08(v79);
          sub_2605C5354();
          sub_2605C2E80();
          uint64_t v108 = v96;
        }
        uint64_t v80 = (void *)v108;
        *(void *)(v108 + 16) = v74;
        uint64_t v81 = (uint64_t)v80 + 16 * v78;
        *(void *)(v81 + 32) = v67;
        *(void *)(v81 + 40) = v76;
        if (v37 == v33)
        {
          unint64_t v102 = v80;
          swift_bridgeObjectRelease();
          goto LABEL_95;
        }
LABEL_19:
        int v34 = 1;
        goto LABEL_10;
      }
      if (v37 == v33) {
        goto LABEL_97;
      }
      int v34 = 0;
    }
    else
    {
      uint64_t v42 = qword_26A88BCB0;
      swift_bridgeObjectRetain();
      if (v42 != -1) {
        swift_once();
      }
      uint64_t v29 = qword_26A88C750;
      uint64_t v43 = *(void *)algn_26A88C758;
      if (sub_2605C4C94())
      {
        swift_bridgeObjectRetain();
        sub_2605C4DBC();
        if (sub_2605C4C94())
        {
          swift_bridgeObjectRetain();
          sub_2605C4DBC();
          unint64_t v44 = sub_2605E2A10();
          unint64_t v45 = sub_2605C0F1C(v44, v39, v38);
          uint64_t v39 = MEMORY[0x261215A90](v45);
          unint64_t v25 = v46;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v38 = v25;
        }
        unint64_t v47 = v110;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2605C5204();
          sub_2605C2F90();
          unint64_t v47 = v91;
        }
        sub_2605C5404();
        if (v49)
        {
          sub_2605C4C08(v48);
          sub_2605C2F90();
          uint64_t v110 = v92;
        }
        unint64_t v50 = v110;
        v110[2] = v47;
        uint64_t v51 = &v50[4 * v25];
        v51[4] = v29;
        v51[5] = v43;
LABEL_56:
        v51[6] = v39;
        v51[7] = v38;
        if (v37 == v33) {
          goto LABEL_97;
        }
        int v34 = 0;
        unint64_t v25 = (unint64_t)v111;
        sub_2605C4C60();
        goto LABEL_10;
      }
      if (qword_26A88BCB8 != -1) {
        swift_once();
      }
      uint64_t v60 = qword_26A88C760;
      uint64_t v29 = *(void *)algn_26A88C768;
      if (sub_2605C4C94())
      {
        swift_bridgeObjectRetain();
        sub_2605C4D68();
        if (sub_2605C4C94()) {
          goto LABEL_42;
        }
LABEL_51:
        uint64_t v64 = v110;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2605C5204();
          sub_2605C2F90();
          uint64_t v64 = v93;
        }
        sub_2605C5404();
        if (v49)
        {
          sub_2605C4C08(v65);
          sub_2605C2F90();
          uint64_t v110 = v94;
        }
        uint64_t v66 = v110;
        v110[2] = v64;
        uint64_t v51 = &v66[4 * v25];
        v51[4] = v60;
        v51[5] = v29;
        goto LABEL_56;
      }
      if (qword_26A88BCC0 != -1) {
        swift_once();
      }
      uint64_t v60 = qword_26A88C770;
      uint64_t v29 = *(void *)algn_26A88C778;
      if (sub_2605C4C94())
      {
        swift_bridgeObjectRetain();
        sub_2605C4CF8();
        if ((sub_2605C4C94() & 1) == 0) {
          goto LABEL_51;
        }
        swift_bridgeObjectRetain();
        sub_2605C4CF8();
LABEL_50:
        unint64_t v61 = sub_2605E2A10();
        unint64_t v62 = sub_2605C0F1C(v61, v39, v38);
        uint64_t v39 = MEMORY[0x261215A90](v62);
        unint64_t v25 = v63;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v38 = v25;
        goto LABEL_51;
      }
      if (qword_26A88BCC8 != -1) {
        swift_once();
      }
      uint64_t v60 = qword_26A88C780;
      uint64_t v29 = *(void *)algn_26A88C788;
      if (sub_2605C4C94())
      {
        swift_bridgeObjectRetain();
        sub_2605C4D68();
        if ((sub_2605C4C94() & 1) == 0) {
          goto LABEL_51;
        }
LABEL_42:
        swift_bridgeObjectRetain();
        sub_2605C4D68();
        goto LABEL_50;
      }
      sub_2605C4D68();
      if (sub_2605C4C94())
      {
        swift_bridgeObjectRetain();
        unint64_t v82 = sub_2605E2A10();
        unint64_t v83 = sub_2605C0F1C(v82, v39, v38);
        uint64_t v39 = MEMORY[0x261215A90](v83);
        unint64_t v85 = v84;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v38 = v85;
      }
      sub_2605C4C60();
      long long v86 = v110;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605C2F90();
        long long v86 = v98;
      }
      unint64_t v88 = v86[2];
      unint64_t v87 = v86[3];
      uint64_t v110 = v86;
      if (v88 >= v87 >> 1)
      {
        sub_2605C4C08(v87);
        sub_2605C2F90();
        uint64_t v110 = v99;
      }
      char v89 = v110;
      v110[2] = v88 + 1;
      unint64_t v90 = &v89[4 * v88];
      v90[4] = 7364948;
      v90[5] = 0xE300000000000000;
      v90[6] = v39;
      v90[7] = v38;
      if (v37 == v33) {
        goto LABEL_97;
      }
      int v34 = 0;
    }
LABEL_10:
    ++v33;
    v35 += 2;
  }
  while (v33 < *(void *)(v31 + 16));
  __break(1u);
LABEL_97:
  swift_bridgeObjectRelease();
  uint64_t v100 = v107;
  unint64_t v102 = (void *)v108;
LABEL_96:
  uint64_t v101 = *(void (**)(void))(v100 + 8);
  sub_2605C504C();
  v101();
  sub_2605C5398();
  sub_2605C504C();
  v101();
  sub_2605C504C();
  v101();
  uint64_t v21 = v110;
  uint64_t v22 = v102;
LABEL_104:
  result.value._1._rawValue = v22;
  result.value._0._rawValue = v21;
  result.is_nil = v23;
  return result;
}

id sub_2605C2840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_2605E2960();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_2605E2290();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2605C291C(uint64_t a1)
{
  return sub_2605C2928(a1);
}

uint64_t sub_2605C2928(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_2605C518C();
    uint64_t result = sub_2605C5168();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_2605E2B80();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2605C2998(uint64_t a1)
{
  return sub_2605C29A4(a1, &qword_26A88BDC0);
}

uint64_t sub_2605C29A4(uint64_t a1, uint64_t *a2)
{
  if (a1 < 0)
  {
    sub_2605C518C();
    uint64_t result = sub_2605C5168();
    __break(1u);
  }
  else if (a1)
  {
    sub_2605BBCB8(a2);
    uint64_t result = sub_2605E2B80();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2605C2A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *v4;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v4 = v9;
  if (!result)
  {
    uint64_t result = a4(result, *(void *)(v9 + 16) + 1, 1, v9, a1, a2, a3);
    *uint64_t v4 = result;
  }
  return result;
}

uint64_t sub_2605C2A9C()
{
  return sub_2605C2A20((uint64_t)&unk_26A88BDD0, (uint64_t)sub_2605C378C, (uint64_t)sub_2605D9CBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2605C2E80);
}

uint64_t sub_2605C2AE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(BOOL))
{
  unint64_t v6 = *(void *)(*(void *)v5 + 24);
  if (result + 1 > (uint64_t)(v6 >> 1))
  {
    uint64_t result = a5(v6 > 1);
    *(void *)uint64_t v5 = result;
  }
  return result;
}

uint64_t sub_2605C2B38(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_2605E2B70();
  }
  return result;
}

uint64_t sub_2605C2B64(uint64_t a1)
{
  return sub_2605C2AE4(a1, (uint64_t)&unk_26A88BDD0, (uint64_t)sub_2605C378C, (uint64_t)sub_2605D9CBC, (uint64_t (*)(BOOL))sub_2605C2E80);
}

void sub_2605C2BAC()
{
}

void sub_2605C2BE0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2605C4C84();
    if (v8 != v9)
    {
      sub_2605C50F4();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  sub_2605C50E4();
  if (v5)
  {
    sub_2605BBCB8(&qword_26A88BDF8);
    uint64_t v10 = (void *)sub_2605C50C8();
    sub_2605C4D40(v10);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_2605D9D18((char *)(a4 + 32), v4, (char *)(v5 + 32));
    sub_2605C50B0();
  }
  else
  {
    uint64_t v11 = sub_2605C5214();
    sub_2605C3164(v11, v12, v13, v14);
  }
}

void sub_2605C2C8C()
{
}

void sub_2605C2CC0()
{
}

void sub_2605C2CF4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2605C4C84();
    if (v8 != v9)
    {
      sub_2605C50F4();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  sub_2605C50E4();
  if (v5)
  {
    sub_2605BBCB8(&qword_26A88BDE0);
    uint64_t v10 = (void *)sub_2605C50C8();
    sub_2605C4D40(v10);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_2605D9E74((char *)(a4 + 32), v4, (char *)(v5 + 32));
    sub_2605C50B0();
  }
  else
  {
    uint64_t v11 = sub_2605C5214();
    sub_2605C358C(v11, v12, v13, v14);
  }
}

void sub_2605C2DA0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2605C4C84();
    if (v8 != v9)
    {
      sub_2605C50F4();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  sub_2605C50E4();
  if (v5)
  {
    sub_2605BBCB8(&qword_26A88BDD8);
    uint64_t v10 = (void *)sub_2605C50C8();
    sub_2605C4D40(v10);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  if (a1)
  {
    sub_2605D9ED8((char *)(a4 + 32), v4, (char *)(v5 + 32));
    sub_2605C50B0();
  }
  else
  {
    uint64_t v11 = sub_2605C5214();
    sub_2605C368C(v11, v12, v13, v14);
  }
}

void sub_2605C2E4C()
{
}

void sub_2605C2E80()
{
  sub_2605C52C4();
  if (v6)
  {
    sub_2605C4C84();
    if (v8 != v9)
    {
      sub_2605C50F4();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  else
  {
    uint64_t v7 = v4;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_2605BBCB8(v5);
    uint64_t v12 = (void *)swift_allocObject();
    size_t v13 = j__malloc_size(v12);
    v12[2] = v10;
    v12[3] = 2 * ((uint64_t)(v13 - 32) / 16);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v12 + 4;
  if (v3)
  {
    v2(v0 + 32, v10, v14);
    sub_2605C50B0();
  }
  else
  {
    v1(0, v10, v14, v0);
  }
}

void sub_2605C2F5C()
{
}

void sub_2605C2F90()
{
  sub_2605C52C4();
  if (v6)
  {
    sub_2605C4C84();
    if (v8 != v9)
    {
      sub_2605C50F4();
      if (v8)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  else
  {
    uint64_t v7 = v4;
  }
  uint64_t v10 = *(void *)(v0 + 16);
  if (v7 <= v10) {
    uint64_t v11 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v11 = v7;
  }
  if (v11)
  {
    sub_2605BBCB8(v5);
    uint64_t v12 = (void *)swift_allocObject();
    size_t v13 = j__malloc_size(v12);
    v12[2] = v10;
    v12[3] = 2 * ((uint64_t)(v13 - 32) / 32);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v12 + 4;
  if (v3)
  {
    v2(v0 + 32, v10, v14);
    sub_2605C50B0();
  }
  else
  {
    v1(0, v10, v14, v0);
  }
}

uint64_t sub_2605C306C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C3164(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 112 * a1 + 32;
    unint64_t v6 = a3 + 112 * v4;
    if (v5 >= v6 || v5 + 112 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C3268(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_2605BBCB8(&qword_26A88BE18);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

char *sub_2605C3380(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    unint64_t v6 = &__dst[16 * v4];
    if (v5 >= v6 || &v5[16 * v4] <= __dst)
    {
      memcpy(__dst, v5, 16 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C3474(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_2605BBCB8(&qword_26A88BDB8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C358C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C368C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 88 * a1 + 32;
    unint64_t v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C378C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_2605E2E50();
  __break(1u);
  return result;
}

char *sub_2605C3884(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 32 * a1 + 32);
    unint64_t v6 = &__dst[32 * v4];
    if (v5 >= v6 || &v5[32 * v4] <= __dst)
    {
      memcpy(__dst, v5, 32 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_2605E2E50();
  __break(1u);
  return result;
}

uint64_t sub_2605C3978(uint64_t a1)
{
  if (a1 < 16) {
    return 0;
  }
  sub_2605E2D70();
  return 0;
}

unint64_t sub_2605C39C0(unint64_t result, char a2, uint64_t a3)
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

unint64_t sub_2605C39E8(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_2605C3A08(uint64_t a1, uint64_t a2)
{
  sub_2605E2FA0();
  sub_2605E2A00();
  uint64_t v4 = sub_2605E2FC0();

  return sub_2605C3BF8(a1, a2, v4);
}

unint64_t sub_2605C3A80(uint64_t a1)
{
  uint64_t v2 = sub_2605E2F90();

  return sub_2605C3CDC(a1, v2);
}

unint64_t sub_2605C3AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v6 = (void **)v4;
  char v9 = (void *)*v4;
  unint64_t v10 = sub_2605C3A80(a2);
  if (__OFADD__(v9[2], (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  sub_2605BBCB8(a4);
  if ((sub_2605E2E20() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_2605C3A80(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_9:
    unint64_t result = sub_2605E2F60();
    __break(1u);
    return result;
  }
  unint64_t v12 = v14;
LABEL_5:
  uint64_t v16 = *v6;
  if ((v13 & 1) == 0) {
    return sub_2605C3BB4(v12, a2, a1, v16);
  }
  uint64_t v17 = v16[7];
  unint64_t result = swift_bridgeObjectRelease();
  *(void *)(v17 + 8 * v12) = a1;
  return result;
}

unint64_t sub_2605C3BB4(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

unint64_t sub_2605C3BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2605E2F40() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2605E2F40() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2605C3CDC(uint64_t a1, uint64_t a2)
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

unint64_t sub_2605C3D78()
{
  unint64_t result = qword_26A88BD88;
  if (!qword_26A88BD88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A88BD88);
  }
  return result;
}

unsigned __int8 *sub_2605C3DB8(unsigned __int8 *a1, uint64_t a2)
{
  return sub_2605C418C(a1, a2);
}

uint64_t sub_2605C3DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2605C3DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_2605C3E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2605C3E38(a1, a2, a3, (uint64_t (*)(void *, uint64_t, uint64_t))sub_2605C418C);
}

uint64_t sub_2605C3E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2605E2B00();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = &v15;
    goto LABEL_7;
  }
  sub_2605C52D8();
  uint64_t v7 = sub_2605C43F0();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (void *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    sub_2605C52D8();
    uint64_t v9 = (void *)sub_2605E2DB0();
  }
LABEL_7:
  uint64_t v13 = a4(v9, v10, a3);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_2605C3F28(unsigned __int8 *result, uint64_t a2)
{
  int v2 = *result;
  if (v2 == 43)
  {
    if (a2 >= 1)
    {
      if (a2 != 1)
      {
        sub_2605C4CC4();
        if (v20 ^ v21 | v19) {
          unsigned __int8 v25 = v28;
        }
        if (v20 ^ v21 | v19) {
          unsigned __int8 v26 = 65;
        }
        if (!(v20 ^ v21 | v19)) {
          unsigned __int8 v27 = 58;
        }
        if (v22)
        {
          uint64_t v13 = 0;
          uint64_t v29 = (unsigned __int8 *)(v22 + 1);
          do
          {
            unsigned int v30 = *v29;
            if (v30 < 0x30 || v30 >= v27)
            {
              if (v30 < 0x41 || v30 >= v26)
              {
                uint64_t v17 = 0;
                if (v30 < 0x61 || v30 >= v25) {
                  return (unsigned __int8 *)v17;
                }
                char v31 = -87;
              }
              else
              {
                char v31 = -55;
              }
            }
            else
            {
              char v31 = -48;
            }
            uint64_t v32 = v13 * v23;
            if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63) {
              return 0;
            }
            uint64_t v13 = v32 + (v30 + v31);
            if (__OFADD__(v32, (v30 + v31))) {
              return 0;
            }
            ++v29;
            --v24;
          }
          while (v24);
          return (unsigned __int8 *)v13;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v2 != 45)
    {
      if (a2)
      {
        sub_2605C4CC4();
        if (v34 ^ v35 | v33) {
          unsigned __int8 v39 = v42;
        }
        if (v34 ^ v35 | v33) {
          unsigned __int8 v40 = 65;
        }
        if (!(v34 ^ v35 | v33)) {
          unsigned __int8 v41 = 58;
        }
        if (v36)
        {
          uint64_t v43 = 0;
          do
          {
            unsigned int v44 = *v36;
            if (v44 < 0x30 || v44 >= v41)
            {
              if (v44 < 0x41 || v44 >= v40)
              {
                uint64_t v17 = 0;
                if (v44 < 0x61 || v44 >= v39) {
                  return (unsigned __int8 *)v17;
                }
                char v45 = -87;
              }
              else
              {
                char v45 = -55;
              }
            }
            else
            {
              char v45 = -48;
            }
            uint64_t v46 = v43 * v37;
            if ((unsigned __int128)(v43 * (__int128)v37) >> 64 != (v43 * v37) >> 63) {
              return 0;
            }
            uint64_t v43 = v46 + (v44 + v45);
            if (__OFADD__(v46, (v44 + v45))) {
              return 0;
            }
            ++v36;
            --v38;
          }
          while (v38);
          return (unsigned __int8 *)(v46 + (v44 + v45));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      if (a2 != 1)
      {
        sub_2605C4CC4();
        if (v4 ^ v5 | v3) {
          unsigned __int8 v9 = v12;
        }
        if (v4 ^ v5 | v3) {
          unsigned __int8 v10 = 65;
        }
        if (!(v4 ^ v5 | v3)) {
          unsigned __int8 v11 = 58;
        }
        if (v6)
        {
          uint64_t v13 = 0;
          for (unint64_t i = (unsigned __int8 *)(v6 + 1); ; ++i)
          {
            unsigned int v15 = *i;
            if (v15 < 0x30 || v15 >= v11)
            {
              if (v15 < 0x41 || v15 >= v10)
              {
                uint64_t v17 = 0;
                if (v15 < 0x61 || v15 >= v9) {
                  return (unsigned __int8 *)v17;
                }
                char v16 = -87;
              }
              else
              {
                char v16 = -55;
              }
            }
            else
            {
              char v16 = -48;
            }
            uint64_t v18 = v13 * v7;
            if ((unsigned __int128)(v13 * (__int128)v7) >> 64 != (v13 * v7) >> 63) {
              return 0;
            }
            uint64_t v13 = v18 - (v15 + v16);
            if (__OFSUB__(v18, (v15 + v16))) {
              return 0;
            }
            if (!--v8) {
              return (unsigned __int8 *)v13;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unsigned __int8 *sub_2605C418C(unsigned __int8 *result, uint64_t a2)
{
  int v2 = *result;
  if (v2 == 43)
  {
    if (a2 >= 1)
    {
      if (a2 != 1)
      {
        sub_2605C4CC4();
        if (v22 ^ v23 | v21) {
          unsigned __int8 v27 = v30;
        }
        if (v22 ^ v23 | v21) {
          unsigned __int8 v28 = 65;
        }
        if (!(v22 ^ v23 | v21)) {
          unsigned __int8 v29 = 58;
        }
        if (v24)
        {
          unint64_t v13 = 0;
          char v31 = (unsigned __int8 *)(v24 + 1);
          do
          {
            unsigned int v32 = *v31;
            if (v32 < 0x30 || v32 >= v29)
            {
              if (v32 < 0x41 || v32 >= v28)
              {
                uint64_t v17 = 0;
                if (v32 < 0x61 || v32 >= v27) {
                  return (unsigned __int8 *)v17;
                }
                char v33 = -87;
              }
              else
              {
                char v33 = -55;
              }
            }
            else
            {
              char v33 = -48;
            }
            if (!is_mul_ok(v13, v25)) {
              return 0;
            }
            unint64_t v34 = v13 * v25;
            unsigned __int8 v35 = v32 + v33;
            BOOL v20 = __CFADD__(v34, v35);
            unint64_t v13 = v34 + v35;
            if (v20) {
              return 0;
            }
            ++v31;
            --v26;
          }
          while (v26);
          return (unsigned __int8 *)v13;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v2 != 45)
    {
      if (a2)
      {
        sub_2605C4CC4();
        if (v37 ^ v38 | v36) {
          unsigned __int8 v42 = v45;
        }
        if (v37 ^ v38 | v36) {
          unsigned __int8 v43 = 65;
        }
        if (!(v37 ^ v38 | v36)) {
          unsigned __int8 v44 = 58;
        }
        if (v39)
        {
          unint64_t v46 = 0;
          do
          {
            unsigned int v47 = *v39;
            if (v47 < 0x30 || v47 >= v44)
            {
              if (v47 < 0x41 || v47 >= v43)
              {
                uint64_t v17 = 0;
                if (v47 < 0x61 || v47 >= v42) {
                  return (unsigned __int8 *)v17;
                }
                char v48 = -87;
              }
              else
              {
                char v48 = -55;
              }
            }
            else
            {
              char v48 = -48;
            }
            if (!is_mul_ok(v46, v40)) {
              return 0;
            }
            unint64_t v49 = v46 * v40;
            unsigned __int8 v50 = v47 + v48;
            BOOL v20 = __CFADD__(v49, v50);
            unint64_t v46 = v49 + v50;
            if (v20) {
              return 0;
            }
            ++v39;
            --v41;
          }
          while (v41);
          return (unsigned __int8 *)v46;
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      if (a2 != 1)
      {
        sub_2605C4CC4();
        if (v4 ^ v5 | v3) {
          unsigned __int8 v9 = v12;
        }
        if (v4 ^ v5 | v3) {
          unsigned __int8 v10 = 65;
        }
        if (!(v4 ^ v5 | v3)) {
          unsigned __int8 v11 = 58;
        }
        if (v6)
        {
          unint64_t v13 = 0;
          for (unint64_t i = (unsigned __int8 *)(v6 + 1); ; ++i)
          {
            unsigned int v15 = *i;
            if (v15 < 0x30 || v15 >= v11)
            {
              if (v15 < 0x41 || v15 >= v10)
              {
                uint64_t v17 = 0;
                if (v15 < 0x61 || v15 >= v9) {
                  return (unsigned __int8 *)v17;
                }
                char v16 = -87;
              }
              else
              {
                char v16 = -55;
              }
            }
            else
            {
              char v16 = -48;
            }
            if (!is_mul_ok(v13, v7)) {
              return 0;
            }
            unint64_t v18 = v13 * v7;
            unsigned __int8 v19 = v15 + v16;
            BOOL v20 = v18 >= v19;
            unint64_t v13 = v18 - v19;
            if (!v20) {
              return 0;
            }
            if (!--v8) {
              return (unsigned __int8 *)v13;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2605C43F0()
{
  unint64_t v0 = sub_2605C445C();
  uint64_t v4 = sub_2605C4490(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2605C445C()
{
  return sub_2605E2B10();
}

uint64_t sub_2605C4490(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_2605C45E8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned __int8 v11 = sub_2605DA99C(v9, 0);
      unint64_t v12 = sub_2605C46E8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_2605E2DB0();
LABEL_4:
        JUMPOUT(0x261215AA0);
      }
    }
    else
    {
      unsigned __int8 v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x261215AA0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x261215AA0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_2605C45E8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_2605DAA04(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_2605DAA04(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_2605C46E8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_2605DAA04(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_2605E2AB0();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_2605E2DB0();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_2605DAA04(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_2605E2A80();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_2605C48EC()
{
  uint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2605D3D48();
    *unint64_t v0 = v3;
  }
}

unint64_t sub_2605C492C(unint64_t result, uint64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (*(void *)(a2 + 16) <= result) {
LABEL_5:
  }
    __break(1u);
  return result;
}

unint64_t sub_2605C4948()
{
  unint64_t result = qword_26A88BDB0;
  if (!qword_26A88BDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BDB0);
  }
  return result;
}

uint64_t sub_2605C4994()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unsigned char *sub_2605C49D4@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_2605C4A40(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

void *sub_2605C4AA0@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X2>, unsigned char *a2@<X8>)
{
  unint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

unsigned char *sub_2605C4AE4@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_2605C49D4(a1, a2);
}

void *sub_2605C4B00@<X0>(unsigned char *a1@<X8>)
{
  return sub_2605C4B18(a1);
}

void *sub_2605C4B18@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

unsigned char *sub_2605C4B60@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_2605C4AE4(a1, a2);
}

uint64_t sub_2605C4B94()
{
  return sub_2605E2F80();
}

uint64_t sub_2605C4BB4()
{
  return sub_2605E2A50();
}

uint64_t sub_2605C4BCC()
{
  return swift_allocObject();
}

uint64_t sub_2605C4BE4()
{
  return sub_2605E2F40();
}

BOOL sub_2605C4C08@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_2605C4C14()
{
  return sub_2605C3978(30);
}

uint64_t sub_2605C4C94()
{
  return sub_2605E2AE0();
}

uint64_t sub_2605C4CAC()
{
  return sub_2605E2AE0();
}

uint64_t sub_2605C4CDC()
{
  return sub_2605E2890();
}

uint64_t sub_2605C4CF8()
{
  return 0x656C206570697753;
}

uint64_t sub_2605C4D1C()
{
  return 0x656C206570697753;
}

size_t sub_2605C4D40(void *a1)
{
  size_t result = j__malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / v2);
  return result;
}

unint64_t sub_2605C4D68()
{
  return 0xD000000000000010;
}

uint64_t sub_2605C4D74()
{
  return sub_2605E2F40();
}

uint64_t sub_2605C4DA4()
{
  return sub_2605E2A50();
}

uint64_t sub_2605C4DBC()
{
  return 0x75206C6C6F726353;
}

uint64_t sub_2605C4DE0()
{
  return 0x75206C6C6F726353;
}

uint64_t sub_2605C4E24()
{
  uint64_t v6 = *(void *)(*(void *)(v4 - 176) + 16);
  return sub_2605C2AE4(v6, v0, v1, v2, v3);
}

void sub_2605C4E50()
{
  *(void *)(v0 - 312) = 0;
  *(void *)(v0 - 304) = 0xE000000000000000;
}

uint64_t sub_2605C4E94()
{
  return swift_bridgeObjectRelease();
}

__n128 sub_2605C4EB0(__n128 *a1)
{
  __n128 result = *(__n128 *)(v1 - 288);
  a1[1] = result;
  return result;
}

uint64_t sub_2605C4EC4()
{
  return sub_2605E2F40();
}

uint64_t sub_2605C4EE4()
{
  return sub_2605E2F40();
}

uint64_t sub_2605C4F00()
{
  return sub_2605E2F40();
}

double sub_2605C4F1C()
{
  return (v0 - v2) * (v0 - v2) + (v1 - v3) * (v1 - v3);
}

uint64_t sub_2605C4F3C()
{
  return 0x6972206570697753;
}

unint64_t sub_2605C4F64(uint64_t a1)
{
  *(void *)(v5 - 208) = v2;
  return sub_2605C3AC4(v1, v4, a1, v3);
}

uint64_t sub_2605C4FA4()
{
  return sub_2605E2BE0();
}

uint64_t sub_2605C4FBC@<X0>(__n128 *a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  *(__n128 *)(a2 - 256) = a3;
  a1[1] = a3;
  *(void *)(v3 - 168) = 0;
  *(void *)(v3 - 160) = 0xE000000000000000;
  return sub_2605E2D70();
}

uint64_t sub_2605C4FE4()
{
  return 0x64206C6C6F726353;
}

uint64_t sub_2605C5000()
{
  return sub_2605E2A50();
}

void sub_2605C5058()
{
  uint64_t v4 = *(void *)(v1 - 176);
  *(void *)(v4 + 16) = v0 + 1;
  uint64_t v5 = v4 + 16 * v0;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
}

void sub_2605C5098()
{
  *(void *)(v0 - 224) = 0;
  *(void *)(v0 - 240) = 0xE000000000000000;
}

uint64_t sub_2605C50B0()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2605C50C8()
{
  return swift_allocObject();
}

__n128 sub_2605C5100(__n128 *a1)
{
  __n128 result = *(__n128 *)(v1 - 336);
  a1[1] = result;
  return result;
}

uint64_t sub_2605C5168()
{
  return sub_2605E2E30();
}

uint64_t sub_2605C51B0(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2605E2D70();
}

uint64_t sub_2605C51D4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_2605C51E4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_2605C5204()
{
  return 0;
}

uint64_t sub_2605C5214()
{
  return 0;
}

uint64_t sub_2605C5224()
{
  return v0;
}

uint64_t sub_2605C5248@<X0>(uint64_t a1@<X2>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v8 = v5;
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  unint64_t v7 = (a3 - 32) | 0x8000000000000000;
  return writeStringToFile(folderName:fileName:data:)(*(Swift::String *)&v8, *(Swift::String *)&a1, *(Swift::String *)&a2)._countAndFlagsBits;
}

uint64_t sub_2605C5278()
{
  return 0x6972206570697753;
}

id sub_2605C52A0(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 9, 1);
}

uint64_t sub_2605C52D8()
{
  return v0;
}

uint64_t sub_2605C52E4()
{
  *(void *)(v1 - 200) = v0;
  return sub_2605E2F20();
}

void sub_2605C5360(uint64_t a1@<X8>)
{
  *(void *)(*(void *)(v1 - 184) + 16) = a1;
}

void sub_2605C5384()
{
  *(void *)(*(void *)(v1 - 176) + 16) = v0 + 1;
}

uint64_t sub_2605C5398()
{
  return v0;
}

unint64_t sub_2605C53A4(unint64_t a1)
{
  return sub_2605C39E8(a1, 1, v1);
}

uint64_t sub_2605C53D0()
{
  return sub_2605E2F40();
}

uint64_t sub_2605C53F0()
{
  return 0x6E776F6E6B6E55;
}

void sub_2605C5404()
{
  *(void *)(v1 - 200) = v0;
}

uint64_t sub_2605C5418()
{
  return 0x64206C6C6F726353;
}

uint64_t sub_2605C542C()
{
  return 0x75206C6C6F726353;
}

uint64_t UIUnderstandingAssetDownloader.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t UIUnderstandingAssetDownloader.init()()
{
  return v0;
}

uint64_t sub_2605C5458()
{
  sub_2605E2490();
  uint64_t v0 = (void *)sub_2605E2460();
  sub_2605E2480();
  sub_2605E2470();

  return 1;
}

uint64_t UIUnderstandingAssetDownloader.deinit()
{
  return v0;
}

uint64_t UIUnderstandingAssetDownloader.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2605C5664(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for UIUnderstandingAssetDownloader()
{
  return self;
}

uint64_t method lookup function for UIUnderstandingAssetDownloader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIUnderstandingAssetDownloader);
}

uint64_t dispatch thunk of UIUnderstandingAssetDownloader.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of UIUnderstandingAssetDownloader.downloadAssets()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t HighlightAction.init(with:)@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C6548();
  uint64_t v8 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v9 = sub_2605C6508(v8);
  MEMORY[0x270FA5388](v9);
  sub_2605C6530();
  uint64_t v10 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v11 = sub_2605C6508(v10);
  MEMORY[0x270FA5388](v11);
  sub_2605C5138();
  uint64_t v12 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v13 = sub_2605C6508(v12);
  MEMORY[0x270FA5388](v13);
  sub_2605C64F8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_2605E22B0();
  MEMORY[0x270FA5388](v17);
  sub_2605C64F8();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605C6560();
  sub_2605E22A0();
  sub_2605C3DD0(v16, 0, 1, v17);
  uint64_t v18 = sub_2605E2940();
  sub_2605C3DD0(v4, 1, 1, v18);
  uint64_t v19 = sub_2605E2140();
  sub_2605C3DD0(v3, 1, 1, v19);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v2, *MEMORY[0x263EFBDC8], v1);
  uint64_t v20 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v20;
  return result;
}

uint64_t sub_2605C5974()
{
  uint64_t v0 = sub_2605E22B0();
  sub_2605C6474(v0, qword_26A88BE30);
  sub_2605C5664(v0, (uint64_t)qword_26A88BE30);
  return sub_2605E22A0();
}

uint64_t static HighlightAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A88BCD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2605E22B0();
  uint64_t v3 = sub_2605C5664(v2, (uint64_t)qword_26A88BE30);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t HighlightAction.init()@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C64F8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v12 = sub_2605C6508(v11);
  MEMORY[0x270FA5388](v12);
  sub_2605C64F8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v17 = sub_2605C6508(v16);
  MEMORY[0x270FA5388](v17);
  sub_2605C6548();
  uint64_t v18 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v19 = sub_2605C6508(v18);
  MEMORY[0x270FA5388](v19);
  sub_2605C6530();
  uint64_t v20 = sub_2605E22B0();
  MEMORY[0x270FA5388](v20);
  sub_2605C5138();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605C6560();
  sub_2605E22A0();
  sub_2605C3DD0(v3, 0, 1, v20);
  uint64_t v21 = sub_2605E2940();
  sub_2605C3DD0(v2, 1, 1, v21);
  uint64_t v22 = sub_2605E2140();
  sub_2605C3DD0(v15, 1, 1, v22);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, *MEMORY[0x263EFBDC8], v1);
  uint64_t v23 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v23;
  return result;
}

uint64_t HighlightAction.perform()(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[4] = a1;
  v2[5] = v3;
  sub_2605E2BC0();
  v2[6] = sub_2605E2BB0();
  uint64_t v5 = sub_2605E2BA0();
  return MEMORY[0x270FA2498](sub_2605C5D78, v5, v4);
}

uint64_t sub_2605C5D78()
{
  swift_release();
  type metadata accessor for AccessibilityActionPerformer();
  swift_retain();
  sub_2605E2170();
  swift_release();
  sub_2605C9FA4(v0[2], v0[3], 5500, 0xD000000000000014, 0x80000002605E4FF0);
  swift_bridgeObjectRelease();
  sub_2605E2160();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

Swift::Bool __swiftcall HighlightAction.execute(with:)(UINavigationKit::ContextSource with)
{
  switch(*(unsigned char *)with)
  {
    case 1:
      type metadata accessor for AccessibilityActionPerformer();
      swift_retain();
      sub_2605E2170();
      swift_release();
      BOOL v7 = sub_2605C9FA4(v13, v14, 5500, 0xD000000000000014, 0x80000002605E4FF0);
      swift_bridgeObjectRelease();
      return v7;
    case 2:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_2605E2810();
      os_log_type_t v2 = sub_2605C5664(v8, (uint64_t)qword_26A88C7A8);
      uint64_t v3 = sub_2605E2800();
      os_log_type_t v9 = sub_2605E2C10();
      if (!sub_2605C6514(v9)) {
        goto LABEL_16;
      }
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "ContextKit is unsupported for Highlight";
      break;
    case 3:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_2605E2810();
      os_log_type_t v2 = sub_2605C5664(v10, (uint64_t)qword_26A88C7A8);
      uint64_t v3 = sub_2605E2800();
      os_log_type_t v11 = sub_2605E2C10();
      if (!sub_2605C6514(v11)) {
        goto LABEL_16;
      }
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "UIUnderstanding is unsupported for Highlight";
      break;
    default:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_2605E2810();
      os_log_type_t v2 = sub_2605C5664(v1, (uint64_t)qword_26A88C7A8);
      uint64_t v3 = sub_2605E2800();
      os_log_type_t v4 = sub_2605E2C10();
      if (!sub_2605C6514(v4)) {
        goto LABEL_16;
      }
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "Unknown source sent";
      break;
  }
  _os_log_impl(&dword_2605B8000, v3, v2, v6, v5, 2u);
  MEMORY[0x261216700](v5, -1, -1);
LABEL_16:

  return 0;
}

uint64_t sub_2605C60E8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2605C6180;
  return HighlightAction.perform()(a1);
}

uint64_t sub_2605C6180()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2605C6278(uint64_t a1)
{
  unint64_t v2 = sub_2605C63C0();

  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_2605C62B8()
{
  unint64_t result = qword_26A88BE70;
  if (!qword_26A88BE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BE70);
  }
  return result;
}

unint64_t sub_2605C6308()
{
  unint64_t result = qword_26A88BE78;
  if (!qword_26A88BE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BE78);
  }
  return result;
}

uint64_t sub_2605C6354()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2605C6370()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2605C63C0()
{
  unint64_t result = qword_26A88BE80;
  if (!qword_26A88BE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BE80);
  }
  return result;
}

ValueMetadata *type metadata accessor for HighlightAction()
{
  return &type metadata for HighlightAction;
}

unint64_t sub_2605C6420()
{
  unint64_t result = qword_26A88BE90;
  if (!qword_26A88BE90)
  {
    sub_2605BBD9C(&qword_26A88BE98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BE90);
  }
  return result;
}

uint64_t *sub_2605C6474(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2605C6508(uint64_t a1)
{
  return a1 - 8;
}

BOOL sub_2605C6514(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_2605C6560()
{
  return sub_2605E22A0();
}

uint64_t sub_2605C6580()
{
  uint64_t v0 = sub_2605E22B0();
  sub_2605C6474(v0, qword_26A88BEA0);
  sub_2605C5664(v0, (uint64_t)qword_26A88BEA0);
  return sub_2605E22A0();
}

uint64_t static OnScreenElements.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A88BCD8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2605E22B0();
  uint64_t v3 = sub_2605C5664(v2, (uint64_t)qword_26A88BEA0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t OnScreenElements.perform()(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  sub_2605E2BC0();
  *(void *)(v1 + 96) = sub_2605E2BB0();
  uint64_t v3 = sub_2605E2BA0();
  return MEMORY[0x270FA2498](sub_2605C6728, v3, v2);
}

void sub_2605C6728()
{
  swift_release();
  type metadata accessor for AccessibilityContextRetriever();
  swift_initStackObject();
  uint64_t v0 = sub_2605BC82C();
  sub_2605BC0B4();
  swift_beginAccess();
  uint64_t v1 = v0[2];
  swift_bridgeObjectRetain();
  swift_release();
  int64_t v2 = 0;
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v31 = v1 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  int64_t v32 = (unint64_t)(63 - v5) >> 6;
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v8 = MEMORY[0x263F8D310];
  if ((v4 & v3) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v2 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v1 + 56) + 16 * i);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    uint64_t v17 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_2605BBCB8(&qword_26A88BEC0);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2605E39B0;
    *(void *)(v20 + 56) = v8;
    unint64_t v21 = sub_2605C6F58();
    *(void *)(v20 + 32) = v19;
    *(void *)(v20 + 40) = v18;
    *(void *)(v20 + 96) = v8;
    *(void *)(v20 + 104) = v21;
    *(void *)(v20 + 64) = v21;
    *(void *)(v20 + 72) = v16;
    *(void *)(v20 + 80) = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2605E2990();
    uint64_t v24 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2605C2BAC();
      uint64_t v7 = v27;
    }
    unint64_t v25 = *(void *)(v7 + 16);
    if (v25 >= *(void *)(v7 + 24) >> 1)
    {
      sub_2605C2BAC();
      uint64_t v7 = v28;
    }
    *(void *)(v7 + 16) = v25 + 1;
    uint64_t v26 = v7 + 16 * v25;
    *(void *)(v26 + 32) = v22;
    *(void *)(v26 + 40) = v24;
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return;
    }
    if (v11 >= v32) {
      goto LABEL_25;
    }
    unint64_t v12 = *(void *)(v31 + 8 * v11);
    ++v2;
    if (!v12)
    {
      int64_t v2 = v11 + 1;
      if (v11 + 1 >= v32) {
        goto LABEL_25;
      }
      unint64_t v12 = *(void *)(v31 + 8 * v2);
      if (!v12)
      {
        int64_t v2 = v11 + 2;
        if (v11 + 2 >= v32) {
          goto LABEL_25;
        }
        unint64_t v12 = *(void *)(v31 + 8 * v2);
        if (!v12) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 3;
  if (v13 < v32)
  {
    unint64_t v12 = *(void *)(v31 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v2 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v2 >= v32) {
          goto LABEL_25;
        }
        unint64_t v12 = *(void *)(v31 + 8 * v2);
        ++v13;
        if (v12) {
          goto LABEL_18;
        }
      }
    }
    int64_t v2 = v13;
    goto LABEL_18;
  }
LABEL_25:
  swift_release();
  *(void *)(v30 + 80) = v7;
  sub_2605BBCB8(&qword_26A88BDA8);
  sub_2605C6FA4();
  sub_2605E2150();
  swift_bridgeObjectRelease();
  unsigned __int8 v29 = *(void (**)(void))(v30 + 8);
  v29();
}

uint64_t OnScreenElements.getLabelsAndAttributes(with:)(unsigned char *a1)
{
  switch(*a1)
  {
    case 1:
      uint64_t v6 = type metadata accessor for AccessibilityContextRetriever();
      swift_allocObject();
      uint64_t v7 = (uint64_t)sub_2605BC82C();
      uint64_t v8 = &off_270C7F410;
      goto LABEL_11;
    case 2:
      uint64_t v6 = type metadata accessor for ContextKitRetriever();
      swift_allocObject();
      uint64_t v7 = sub_2605DF214();
      uint64_t v8 = &off_270C7FC18;
LABEL_11:
      uint64_t v19 = v6;
      uint64_t v20 = v8;
      v18[0] = v7;
      goto LABEL_12;
    case 3:
      uint64_t v14 = type metadata accessor for UIUnderstandingContextRetriever();
      swift_allocObject();
      uint64_t v16 = v14;
      uint64_t v17 = &off_270C7FAE8;
      *(void *)&long long v15 = sub_2605D8B88();
      sub_2605C7064(&v15, (uint64_t)v18);
      uint64_t v6 = v19;
LABEL_12:
      sub_2605BBC24(v18, v6);
      uint64_t v9 = sub_2605C7254();
      v10(v9);
      sub_2605BBC24(v18, v19);
      uint64_t v11 = sub_2605C7254();
      uint64_t v13 = v12(v11);
      sub_2605BBC68((uint64_t)v18);
      uint64_t result = v13;
      break;
    default:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_2605E2810();
      sub_2605C5664(v1, (uint64_t)qword_26A88C7A8);
      int64_t v2 = sub_2605E2800();
      os_log_type_t v3 = sub_2605E2C10();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_2605B8000, v2, v3, "Unknown source sent", v4, 2u);
        MEMORY[0x261216700](v4, -1, -1);
      }

      uint64_t result = sub_2605E2890();
      break;
  }
  return result;
}

uint64_t sub_2605C6E80(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2605C6180;
  return OnScreenElements.perform()(a1);
}

uint64_t sub_2605C6F1C(uint64_t a1)
{
  unint64_t v2 = sub_2605C71A0();

  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_2605C6F58()
{
  unint64_t result = qword_26A88BEC8;
  if (!qword_26A88BEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BEC8);
  }
  return result;
}

unint64_t sub_2605C6FA4()
{
  unint64_t result = qword_26A88BED0;
  if (!qword_26A88BED0)
  {
    sub_2605BBD9C(&qword_26A88BDA8);
    sub_2605C7018();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BED0);
  }
  return result;
}

unint64_t sub_2605C7018()
{
  unint64_t result = qword_26A88BED8;
  if (!qword_26A88BED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BED8);
  }
  return result;
}

uint64_t sub_2605C7064(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_2605C7080()
{
  unint64_t result = qword_26A88BEE0;
  if (!qword_26A88BEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BEE0);
  }
  return result;
}

unint64_t sub_2605C70D0()
{
  unint64_t result = qword_26A88BEE8;
  if (!qword_26A88BEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BEE8);
  }
  return result;
}

uint64_t sub_2605C711C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2605C7150()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2605C71A0()
{
  unint64_t result = qword_26A88BEF0;
  if (!qword_26A88BEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BEF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for OnScreenElements()
{
  return &type metadata for OnScreenElements;
}

unint64_t sub_2605C7200()
{
  unint64_t result = qword_26A88BF00;
  if (!qword_26A88BF00)
  {
    sub_2605BBD9C(&qword_26A88BF08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88BF00);
  }
  return result;
}

uint64_t sub_2605C7254()
{
  return v0;
}

Swift::OpaquePointer_optional __swiftcall readMatrixFromUIUnderstandingFile(filePath:)(Swift::String filePath)
{
  sub_2605C8DC0();
  uint64_t v1 = sub_2605E2280();
  sub_2605C4B78();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_2605C64F8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_2605E29B0();
  MEMORY[0x270FA5388](v8 - 8);
  sub_2605C64F8();
  uint64_t v9 = sub_2605BBCB8(&qword_26A88BD90);
  MEMORY[0x270FA5388](v9 - 8);
  sub_2605C64F8();
  uint64_t v12 = v11 - v10;
  sub_2605E2330();
  sub_2605C4B78();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  sub_2605C64F8();
  uint64_t v18 = v17 - v16;
  uint64_t v20 = v19;
  sub_2605E2320();
  if (sub_2605C3DF8(v12, 1, v20) == 1)
  {
    sub_2605C89E8(v12);
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2605E3700;
    *(void *)(v21 + 56) = MEMORY[0x263F8D310];
    *(void *)(v21 + 32) = 0xD000000000000011;
    *(void *)(v21 + 40) = 0x80000002605E5050;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
LABEL_4:
    sub_2605C8D40();
    goto LABEL_58;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v18, v12, v20);
  sub_2605E29A0();
  uint64_t v51 = v20;
  sub_2605E2950();
  sub_2605E2270();
  sub_2605C4948();
  uint64_t v24 = sub_2605E2CC0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v51);
    goto LABEL_4;
  }
  uint64_t v26 = v24 + 40;
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t v53 = v18;
  uint64_t v52 = v14;
  while (1)
  {
    uint64_t v28 = (void *)sub_2605E2CD0();
    if (v28[2] != 12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    uint64_t v72 = v27;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 2uLL) {
      break;
    }
    unsigned __int8 v29 = v22;
    BOOL v71 = v23;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 3uLL) {
      goto LABEL_38;
    }
    uint64_t v30 = v22;
    BOOL v70 = v23;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 4uLL) {
      goto LABEL_39;
    }
    BOOL v69 = v23;
    uint64_t v68 = v22;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 5uLL) {
      goto LABEL_40;
    }
    BOOL v67 = v23;
    uint64_t v66 = v22;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 6uLL) {
      goto LABEL_41;
    }
    BOOL v65 = v23;
    uint64_t v64 = v22;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 7uLL) {
      goto LABEL_42;
    }
    BOOL v63 = v23;
    unint64_t v62 = v22;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C8CF4();
    if (v28[2] < 8uLL) {
      goto LABEL_43;
    }
    uint64_t v31 = v22;
    BOOL v61 = v23;
    uint64_t v59 = v30;
    uint64_t v60 = v29;
    uint64_t v32 = v28[18];
    uint64_t v33 = v28[19];
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C7A20(v32, v33);
    if (v28[2] < 9uLL) {
      goto LABEL_44;
    }
    BOOL v34 = v23;
    uint64_t v58 = v22;
    uint64_t v35 = v28[20];
    uint64_t v36 = v28[21];
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C7A20(v35, v36);
    if (v28[2] < 0xAuLL) {
      goto LABEL_45;
    }
    BOOL v37 = v23;
    uint64_t v57 = v22;
    uint64_t v38 = v28[22];
    uint64_t v39 = v28[23];
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605C7A20(v38, v39);
    if (v28[2] < 0xBuLL) {
      goto LABEL_46;
    }
    BOOL v40 = v23;
    uint64_t v56 = v22;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2605E2B00();
    if (v28[2] < 0xCuLL) {
      goto LABEL_47;
    }
    BOOL v54 = v23;
    uint64_t v55 = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)sub_2605E2B00();
    if (v71) {
      goto LABEL_48;
    }
    uint64_t v27 = v72;
    if (v70) {
      goto LABEL_49;
    }
    if (v69) {
      goto LABEL_50;
    }
    if (v67) {
      goto LABEL_51;
    }
    if (v65) {
      goto LABEL_52;
    }
    if (v63) {
      goto LABEL_53;
    }
    if (v61) {
      goto LABEL_54;
    }
    if (v34) {
      goto LABEL_55;
    }
    if (v37) {
      goto LABEL_56;
    }
    if (v40) {
      goto LABEL_57;
    }
    uint64_t v41 = v22;
    BOOL v42 = v23;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v46 = sub_2605C8D58();
      sub_2605C2BE0(v46, v47, v48, v72);
      uint64_t v27 = v49;
    }
    uint64_t v14 = v52;
    unint64_t v44 = *(void *)(v27 + 16);
    unint64_t v43 = *(void *)(v27 + 24);
    uint64_t v18 = v53;
    if (v44 >= v43 >> 1)
    {
      sub_2605C2BE0(v43 > 1, v44 + 1, 1, v27);
      uint64_t v27 = v50;
    }
    *(void *)(v27 + 16) = v44 + 1;
    unsigned __int8 v45 = (void *)(v27 + 112 * v44);
    v45[4] = v60;
    v45[5] = v59;
    v45[6] = v68;
    v45[7] = v66;
    v45[8] = v64;
    v45[9] = v62;
    v45[10] = v31;
    v45[11] = v58;
    v45[12] = v57;
    v45[13] = v56;
    v45[14] = v55;
    v45[15] = v54;
    v45[16] = v41;
    v45[17] = v42;
LABEL_35:
    v26 += 16;
    if (!--v25) {
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
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
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  result.is_nil = v23;
  result.value._rawValue = v22;
  return result;
}

uint64_t sub_2605C7A20(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_2605E2D40();
    swift_bridgeObjectRelease();
    char v6 = v9;
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      char v6 = (v3 > 0x20u || ((0x100003E01uLL >> v3) & 1) == 0)
        && (uint64_t v7 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
        && *v7 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v3 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_2605E2DB0();
      }
      char v6 = sub_2605C4A40(v4, v5, (void (*)(uint64_t *__return_ptr))sub_2605C8CB0);
      swift_bridgeObjectRelease();
    }
  }
  if (v6) {
    return 0;
  }
  else {
    return 0;
  }
}

double UIUnderstandingUIElement.left.getter()
{
  return *(double *)v0;
}

double UIUnderstandingUIElement.right.getter()
{
  return *(double *)(v0 + 8);
}

double UIUnderstandingUIElement.top.getter()
{
  return *(double *)(v0 + 16);
}

double UIUnderstandingUIElement.bottom.getter()
{
  return *(double *)(v0 + 24);
}

double UIUnderstandingUIElement.width.getter()
{
  return *(double *)(v0 + 32);
}

double UIUnderstandingUIElement.height.getter()
{
  return *(double *)(v0 + 40);
}

double UIUnderstandingUIElement.centerX.getter()
{
  return *(double *)(v0 + 48);
}

double UIUnderstandingUIElement.centerY.getter()
{
  return *(double *)(v0 + 56);
}

double UIUnderstandingUIElement.ourCenterX.getter()
{
  return *(double *)(v0 + 64);
}

double UIUnderstandingUIElement.ourCenterY.getter()
{
  return *(double *)(v0 + 72);
}

uint64_t UIUnderstandingUIElement.label.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UIUnderstandingUIElement.textField.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

void parseUIUnderstandingDumpForMarkers(dumpDirectoryName:index:)()
{
  sub_2605C8DC0();
  sub_2605E2330();
  sub_2605C4B78();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  sub_2605C4E84();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v4);
  id v5 = objc_msgSend(self, sel_defaultManager);
  id v6 = objc_msgSend(v5, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v7 = sub_2605E2B40();
  if (*(void *)(v7 + 16))
  {
    sub_2605C8D80();
    v8();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    sub_2605C8DD8();
    swift_bridgeObjectRelease();
    sub_2605E2F20();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    sub_2605C8D0C();
    sub_2605E2300();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_2605E22C0();
    parseUIUnderstandingDumpForMarkers(filePath:)(v9, v10);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void (**)(void))(v1 + 8);
    sub_2605C8D90();
    v11();
    sub_2605C8D90();
    v11();
    sub_2605C8D90();
    v11();
    sub_2605C8D40();
  }
  else
  {
    __break(1u);
  }
}

uint64_t parseUIUnderstandingDumpForMarkers(filePath:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (unint64_t)readMatrixFromUIUnderstandingFile(filePath:)(*(Swift::String *)&a1);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(v2 + 136);
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      BOOL v8 = *(v4 - 3) == 1954047348 && *(v4 - 2) == 0xE400000000000000;
      if (v8 || (sub_2605C4EC4() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2605C8D68();
          sub_2605C2BAC();
          uint64_t v5 = v11;
        }
        unint64_t v9 = *(void *)(v5 + 16);
        if (v9 >= *(void *)(v5 + 24) >> 1)
        {
          sub_2605C2BAC();
          uint64_t v5 = v12;
        }
        *(void *)(v5 + 16) = v9 + 1;
        uint64_t v10 = v5 + 16 * v9;
        *(void *)(v10 + 32) = v7;
        *(void *)(v10 + 40) = v6;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v4 += 14;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v5;
}

Swift::Double __swiftcall markerMatchPercentage(markers1:markers2:)(Swift::OpaquePointer markers1, Swift::OpaquePointer markers2)
{
  uint64_t v3 = *((void *)markers1._rawValue + 2);
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *((void *)markers2._rawValue + 2);
    BOOL v8 = (char *)markers1._rawValue + 32;
    uint64_t v18 = (char *)markers2._rawValue + 56;
    while (1)
    {
      if (v7)
      {
        unint64_t v9 = &v8[16 * v5];
        uint64_t v10 = *(void *)v9;
        uint64_t v11 = *((void *)v9 + 1);
        BOOL v12 = *(void *)v9 == *((void *)markers2._rawValue + 4) && v11 == *((void *)markers2._rawValue + 5);
        if (v12 || (sub_2605E2F40() & 1) != 0)
        {
LABEL_16:
          if (__OFADD__(v6++, 1))
          {
            __break(1u);
            return result;
          }
        }
        else
        {
          uint64_t v13 = v7;
          uint64_t v14 = v18;
          while (--v13)
          {
            if (v10 != *(v14 - 1) || v11 != *v14)
            {
              v14 += 2;
              if ((sub_2605E2F40() & 1) == 0) {
                continue;
              }
            }
            goto LABEL_16;
          }
        }
      }
      if (++v5 == v3)
      {
        double v17 = (double)v3;
        return (double)v6 / v17;
      }
    }
  }
  uint64_t v6 = 0;
  double v17 = 0.0;
  return (double)v6 / v17;
}

Swift::Bool __swiftcall parseUIUnderstandingDumpForText(dumpDirectoryName:index:textToBeSearched:)(Swift::String dumpDirectoryName, Swift::Int_optional index, Swift::String textToBeSearched)
{
  sub_2605C8DC0();
  v19._uint64_t countAndFlagsBits = v3;
  v19._unint64_t object = v4;
  char v6 = v5;
  sub_2605E2330();
  sub_2605C4B78();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_2605C4E84();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  if ((v6 & 1) == 0) {
    sub_2605E2F20();
  }
  id v12 = objc_msgSend(self, sel_defaultManager);
  id v13 = objc_msgSend(v12, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v14 = sub_2605E2B40();
  if (*(void *)(v14 + 16))
  {
    sub_2605C8D80();
    v16();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    sub_2605C8DD8();
    swift_bridgeObjectRelease();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    sub_2605C8D0C();
    sub_2605E2300();
    swift_bridgeObjectRelease();
    v17._uint64_t countAndFlagsBits = sub_2605E22C0();
    parseUIUnderstandingDumpForText(filePath:textToBeSearched:)(v17, v19);
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(void))(v8 + 8);
    sub_2605C8DB0();
    v18();
    sub_2605C8DB0();
    v18();
    sub_2605C8DB0();
    v18();
    sub_2605C8D40();
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall parseUIUnderstandingDumpForText(filePath:textToBeSearched:)(Swift::String filePath, Swift::String textToBeSearched)
{
  sub_2605C8DC0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = (unint64_t)readMatrixFromUIUnderstandingFile(filePath:)(v6);
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 16);
    if (v8)
    {
      uint64_t v9 = (uint64_t *)(v7 + 136);
      do
      {
        uint64_t v10 = *(v9 - 1);
        uint64_t v11 = *v9;
        BOOL v12 = *(v9 - 3) == 1954047348 && *(v9 - 2) == 0xE400000000000000;
        if (v12 || (sub_2605C4EC4() & 1) != 0)
        {
          BOOL v13 = v10 == v5 && v11 == v3;
          if (v13 || (sub_2605E2F40() & 1) != 0) {
            break;
          }
        }
        v9 += 14;
        --v8;
      }
      while (v8);
    }
    swift_bridgeObjectRelease();
  }
  sub_2605C8D40();
  return result;
}

CGPoint __swiftcall parseUIUnderstandingDumpForDownLeveling(dumpDirectoryName:index:textToBeSearched:textOK:)(Swift::String dumpDirectoryName, Swift::Int_optional index, Swift::String textToBeSearched, Swift::Bool textOK)
{
  Swift::Bool is_nil = index.is_nil;
  unint64_t object = dumpDirectoryName._object;
  sub_2605E2330();
  sub_2605C4B78();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C4E84();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  MEMORY[0x270FA5388](v9);
  if (!is_nil) {
    sub_2605E2F20();
  }
  id v10 = objc_msgSend(self, sel_defaultManager, object);
  id v11 = objc_msgSend(v10, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v12 = sub_2605E2B40();
  if (*(void *)(v12 + 16))
  {
    sub_2605C8D80();
    v15();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    sub_2605E2D70();
    swift_bridgeObjectRelease();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    sub_2605C8D0C();
    sub_2605E2300();
    swift_bridgeObjectRelease();
    v16._uint64_t countAndFlagsBits = sub_2605E22C0();
    CGPoint v17 = parseUIUnderstandingDumpForDownLeveling(filePath:textToBeSearched:textOK:)(v16, textToBeSearched, textOK);
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(void))(v6 + 8);
    sub_2605C8DA0();
    v18();
    sub_2605C8DA0();
    v18();
    sub_2605C8DA0();
    v18();
    double x = v17.x;
    double y = v17.y;
  }
  else
  {
    __break(1u);
  }
  result.double y = y;
  result.double x = x;
  return result;
}

CGPoint __swiftcall parseUIUnderstandingDumpForDownLeveling(filePath:textToBeSearched:textOK:)(Swift::String filePath, Swift::String textToBeSearched, Swift::Bool textOK)
{
  unint64_t object = textToBeSearched._object;
  uint64_t countAndFlagsBits = textToBeSearched._countAndFlagsBits;
  unint64_t v5 = (unint64_t)readMatrixFromUIUnderstandingFile(filePath:)(filePath);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 16);
    if (v6)
    {
      Swift::Bool v44 = textOK;
      uint64_t v7 = MEMORY[0x263F8EE78];
      uint64_t v8 = (void **)(v5 + 136);
      double v9 = 0.0;
      double v10 = 0.0;
      uint64_t v11 = MEMORY[0x263F8EE78];
      uint64_t v45 = MEMORY[0x263F8EE78];
      do
      {
        long long v47 = *(_OWORD *)(v8 - 5);
        uint64_t v13 = (uint64_t)*(v8 - 1);
        uint64_t v12 = *v8;
        BOOL v14 = *(v8 - 3) == (void *)1954047348 && *(v8 - 2) == (void *)0xE400000000000000;
        if (v14 || (sub_2605C4EC4() & 1) != 0)
        {
          BOOL v15 = v13 == countAndFlagsBits && v12 == object;
          if (v15 || (sub_2605E2F40() & 1) != 0)
          {
            double v9 = *((double *)&v47 + 1);
            double v10 = *(double *)&v47;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2605C8D68();
            sub_2605C2CC0();
            uint64_t v11 = v24;
          }
          unint64_t v17 = *(void *)(v11 + 16);
          unint64_t v16 = *(void *)(v11 + 24);
          if (v17 >= v16 >> 1)
          {
            sub_2605C8D2C(v16);
            sub_2605C2CC0();
            uint64_t v11 = v25;
          }
          *(void *)(v11 + 16) = v17 + 1;
          *(_OWORD *)(v11 + 16 * v17 + 32) = v47;
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2605C8D58();
            sub_2605C2BAC();
            uint64_t v7 = v26;
          }
          unint64_t v19 = *(void *)(v7 + 16);
          unint64_t v18 = *(void *)(v7 + 24);
          if (v19 >= v18 >> 1)
          {
            sub_2605C8D2C(v18);
            sub_2605C2BAC();
            uint64_t v7 = v27;
          }
          *(void *)(v7 + 16) = v19 + 1;
          uint64_t v20 = v7 + 16 * v19;
          *(void *)(v20 + 32) = v13;
          *(void *)(v20 + 40) = v12;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            uint64_t v21 = v45;
          }
          else
          {
            sub_2605C8D58();
            sub_2605C2CC0();
            uint64_t v21 = v28;
          }
          unint64_t v23 = *(void *)(v21 + 16);
          unint64_t v22 = *(void *)(v21 + 24);
          if (v23 >= v22 >> 1)
          {
            sub_2605C8D2C(v22);
            sub_2605C2CC0();
            uint64_t v21 = v29;
          }
          *(void *)(v21 + 16) = v23 + 1;
          uint64_t v45 = v21;
          *(_OWORD *)(v21 + 16 * v23 + 32) = v47;
        }
        v8 += 14;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease();
      textOK = v44;
    }
    else
    {
      uint64_t v11 = MEMORY[0x263F8EE78];
      double v9 = 0.0;
      double v10 = 0.0;
      uint64_t v45 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    if (textOK)
    {
      if (*(void *)(v11 + 16))
      {
        double v31 = 0.0;
        double v30 = 0.0;
        do
        {
          sub_2605C8CCC();
          if (v34) {
            double v30 = v33;
          }
        }
        while (v32 != 1);
      }
      else
      {
        double v31 = 0.0;
        double v30 = 0.0;
      }
      swift_bridgeObjectRelease();
      if (*(void *)(v45 + 16))
      {
        do
        {
          sub_2605C8CCC();
          if (v34) {
            double v30 = v40;
          }
        }
        while (v39 != 1);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = *(void *)(v45 + 16);
      if (v35)
      {
        uint64_t v36 = (double *)(v45 + 40);
        double v31 = 0.0;
        double v37 = 100000.0;
        double v30 = 0.0;
        do
        {
          double v38 = sqrt((v10 - *(v36 - 1)) * (v10 - *(v36 - 1)) + (v9 - *v36) * (v9 - *v36));
          if (v38 < v37)
          {
            double v31 = *v36;
            double v30 = *(v36 - 1);
            double v37 = v38;
          }
          v36 += 2;
          --v35;
        }
        while (v35);
      }
      else
      {
        double v30 = 0.0;
        double v31 = 0.0;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v30 = 0.0;
    double v31 = 0.0;
  }
  double v41 = v30;
  double v42 = v31;
  result.double y = v42;
  result.double x = v41;
  return result;
}

uint64_t sub_2605C89E8(uint64_t a1)
{
  uint64_t v2 = sub_2605BBCB8(&qword_26A88BD90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for UIUnderstandingUIElement()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UIUnderstandingUIElement(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UIUnderstandingUIElement(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for UIUnderstandingUIElement(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for UIUnderstandingUIElement(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UIUnderstandingUIElement(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 88);
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

uint64_t storeEnumTagSinglePayload for UIUnderstandingUIElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)CGPoint result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIUnderstandingUIElement()
{
  return &type metadata for UIUnderstandingUIElement;
}

void *sub_2605C8CB0@<X0>(unsigned char *a1@<X8>)
{
  return sub_2605C4AA0(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t sub_2605C8CF4()
{
  return sub_2605C7A20(v0, v1);
}

uint64_t sub_2605C8D0C()
{
  return sub_2605E2A50();
}

BOOL sub_2605C8D2C@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_2605C8D58()
{
  return 0;
}

uint64_t sub_2605C8D68()
{
  return 0;
}

uint64_t sub_2605C8DD8()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
  return sub_2605E2D70();
}

uint64_t sub_2605C8DF8()
{
  if (!_AXSApplicationAccessibilityEnabled())
  {
    _AXSApplicationAccessibilitySetEnabled();
    objc_msgSend(self, sel_sleepForTimeInterval_, 0.3);
  }
  return v0;
}

uint64_t sub_2605C8E40()
{
  if (_AXSApplicationAccessibilityEnabled()) {
    _AXSApplicationAccessibilitySetEnabled();
  }

  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for AccessibilityActivationController()
{
  return self;
}

id sub_2605C8EA4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotificationCenterManager()), sel_init);
  qword_26A88BF20 = (uint64_t)result;
  return result;
}

id static NotificationCenterManager.shared.getter()
{
  if (qword_26A88BCE0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A88BF20;

  return v0;
}

id sub_2605C8F30()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_2605E2960();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  return v2;
}

char *sub_2605C8FA4()
{
  uint64_t v1 = OBJC_IVAR____TtC15UINavigationKit25NotificationCenterManager_notificationCenter;
  sub_2605BBCFC(0, &qword_26A88BFA8);
  id v2 = v0;
  *(void *)&v0[v1] = sub_2605C8F30();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for NotificationCenterManager();
  long long v3 = (char *)objc_msgSendSuper2(&v5, sel_init);
  objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC15UINavigationKit25NotificationCenterManager_notificationCenter], sel_setDelegate_, v3);
  return v3;
}

void sub_2605C9088()
{
  uint64_t v1 = v0;
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2605E3700;
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 32) = 0xD000000000000015;
  *(void *)(v2 + 40) = 0x80000002605E50D0;
  sub_2605E2F80();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1DEF0]), sel_init);
  long long v4 = (void *)sub_2605E2960();
  objc_msgSend(v3, sel_setTitle_, v4);

  objc_super v5 = (void *)sub_2605E2960();
  objc_msgSend(v3, sel_setBody_, v5);

  sub_2605BBCFC(0, &qword_26A88BF30);
  id v6 = v3;
  id v7 = sub_2605C923C(0x696669746E656469, 0xEA00000000007265, v6, 0);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15UINavigationKit25NotificationCenterManager_notificationCenter), sel_addNotificationRequest_withCompletionHandler_, v7, 0);
}

id sub_2605C923C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (void *)sub_2605E2960();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_requestWithIdentifier_content_trigger_, v6, a3, a4);

  return v7;
}

id NotificationCenterManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationCenterManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NotificationCenterManager()
{
  return self;
}

uint64_t method lookup function for NotificationCenterManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NotificationCenterManager);
}

uint64_t dispatch thunk of NotificationCenterManager.sendNotification(body:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t UnhighlightAction.init(with:)@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C6548();
  uint64_t v8 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v9 = sub_2605C6508(v8);
  MEMORY[0x270FA5388](v9);
  sub_2605C6530();
  uint64_t v10 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v11 = sub_2605C6508(v10);
  MEMORY[0x270FA5388](v11);
  sub_2605C5138();
  uint64_t v12 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v13 = sub_2605C6508(v12);
  MEMORY[0x270FA5388](v13);
  sub_2605C64F8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_2605E22B0();
  MEMORY[0x270FA5388](v17);
  sub_2605C64F8();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605C6560();
  sub_2605E22A0();
  sub_2605C3DD0(v16, 0, 1, v17);
  uint64_t v18 = sub_2605E2940();
  sub_2605C3DD0(v4, 1, 1, v18);
  uint64_t v19 = sub_2605E2140();
  sub_2605C3DD0(v3, 1, 1, v19);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v2, *MEMORY[0x263EFBDC8], v1);
  uint64_t v20 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v20;
  return result;
}

uint64_t sub_2605C95D8()
{
  uint64_t v0 = sub_2605E22B0();
  sub_2605C6474(v0, qword_26A88C010);
  sub_2605C5664(v0, (uint64_t)qword_26A88C010);
  return sub_2605E22A0();
}

uint64_t static UnhighlightAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A88BCE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2605E22B0();
  uint64_t v3 = sub_2605C5664(v2, (uint64_t)qword_26A88C010);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t UnhighlightAction.init()@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C64F8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v12 = sub_2605C6508(v11);
  MEMORY[0x270FA5388](v12);
  sub_2605C64F8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v17 = sub_2605C6508(v16);
  MEMORY[0x270FA5388](v17);
  sub_2605C6548();
  uint64_t v18 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v19 = sub_2605C6508(v18);
  MEMORY[0x270FA5388](v19);
  sub_2605C6530();
  uint64_t v20 = sub_2605E22B0();
  MEMORY[0x270FA5388](v20);
  sub_2605C5138();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605C6560();
  sub_2605E22A0();
  sub_2605C3DD0(v3, 0, 1, v20);
  uint64_t v21 = sub_2605E2940();
  sub_2605C3DD0(v2, 1, 1, v21);
  uint64_t v22 = sub_2605E2140();
  sub_2605C3DD0(v15, 1, 1, v22);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, *MEMORY[0x263EFBDC8], v1);
  uint64_t v23 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v23;
  return result;
}

uint64_t UnhighlightAction.perform()(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[4] = a1;
  v2[5] = v3;
  sub_2605E2BC0();
  v2[6] = sub_2605E2BB0();
  uint64_t v5 = sub_2605E2BA0();
  return MEMORY[0x270FA2498](sub_2605C99DC, v5, v4);
}

uint64_t sub_2605C99DC()
{
  swift_release();
  type metadata accessor for AccessibilityActionPerformer();
  swift_retain();
  sub_2605E2170();
  swift_release();
  sub_2605C9FA4(v0[2], v0[3], 5501, 0xD000000000000014, 0x80000002605E4FF0);
  swift_bridgeObjectRelease();
  sub_2605E2160();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

Swift::Bool __swiftcall UnhighlightAction.execute(with:)(UINavigationKit::ContextSource with)
{
  switch(*(unsigned char *)with)
  {
    case 1:
      type metadata accessor for AccessibilityActionPerformer();
      swift_retain();
      sub_2605E2170();
      swift_release();
      BOOL v7 = sub_2605C9FA4(v13, v14, 5501, 0xD000000000000014, 0x80000002605E4FF0);
      swift_bridgeObjectRelease();
      return v7;
    case 2:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_2605E2810();
      os_log_type_t v2 = sub_2605C5664(v8, (uint64_t)qword_26A88C7A8);
      uint64_t v3 = sub_2605E2800();
      os_log_type_t v9 = sub_2605E2C10();
      if (!sub_2605C6514(v9)) {
        goto LABEL_16;
      }
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "ContextKit is unsupported for Unhighlight";
      break;
    case 3:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_2605E2810();
      os_log_type_t v2 = sub_2605C5664(v10, (uint64_t)qword_26A88C7A8);
      uint64_t v3 = sub_2605E2800();
      os_log_type_t v11 = sub_2605E2C10();
      if (!sub_2605C6514(v11)) {
        goto LABEL_16;
      }
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "UIUnderstanding is unsupported for Unighlight";
      break;
    default:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_2605E2810();
      os_log_type_t v2 = sub_2605C5664(v1, (uint64_t)qword_26A88C7A8);
      uint64_t v3 = sub_2605E2800();
      os_log_type_t v4 = sub_2605E2C10();
      if (!sub_2605C6514(v4)) {
        goto LABEL_16;
      }
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v6 = "Unknown source sent";
      break;
  }
  _os_log_impl(&dword_2605B8000, v3, v2, v6, v5, 2u);
  MEMORY[0x261216700](v5, -1, -1);
LABEL_16:

  return 0;
}

uint64_t sub_2605C9D38(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2605C6180;
  return UnhighlightAction.perform()(a1);
}

uint64_t sub_2605C9DD4(uint64_t a1)
{
  unint64_t v2 = sub_2605C9F1C();

  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_2605C9E14()
{
  unint64_t result = qword_26A88C030;
  if (!qword_26A88C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C030);
  }
  return result;
}

unint64_t sub_2605C9E64()
{
  unint64_t result = qword_26A88C038;
  if (!qword_26A88C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C038);
  }
  return result;
}

uint64_t sub_2605C9EB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2605C9ECC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2605C9F1C()
{
  unint64_t result = qword_26A88C040;
  if (!qword_26A88C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C040);
  }
  return result;
}

ValueMetadata *type metadata accessor for UnhighlightAction()
{
  return &type metadata for UnhighlightAction;
}

BOOL sub_2605C9F78(char a1)
{
  return sub_2605CA05C(dword_2605E3CB0[a1]);
}

BOOL sub_2605C9FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for AccessibilityElementSearcher();
  os_log_type_t v9 = (void *)sub_2605BABF4(a1, a2);
  uint64_t v10 = v9;
  if (v9)
  {
    if (a5)
    {
      os_log_type_t v11 = (void *)sub_2605E2960();
      objc_msgSend(v10, sel_performAction_withValue_, a3, v11);
    }
    else
    {
      objc_msgSend(v9, sel_performAction_, a3);
    }
  }
  return v10 != 0;
}

BOOL sub_2605CA05C(uint64_t a1)
{
  type metadata accessor for AccessibilityElementSearcher();
  unint64_t v2 = sub_2605BB544(a1);
  uint64_t v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, sel_performAction_, a1);
  }
  return v3 != 0;
}

uint64_t sub_2605CA0B8()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for AccessibilityActionPerformer()
{
  return self;
}

void sub_2605CA114()
{
  *(_WORD *)&algn_26A88C798[6] = -4864;
}

uint64_t sub_2605CA144()
{
  sub_2605CA270();
  if (qword_26A88BCF0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2605E2C50();
  qword_26A88C7A0 = result;
  return result;
}

uint64_t sub_2605CA1E4()
{
  uint64_t v0 = sub_2605E2810();
  sub_2605C6474(v0, qword_26A88C7A8);
  sub_2605C5664(v0, (uint64_t)qword_26A88C7A8);
  if (qword_26A88BCF8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A88C7A0;
  return sub_2605E2820();
}

unint64_t sub_2605CA270()
{
  unint64_t result = qword_26A88C050;
  if (!qword_26A88C050)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A88C050);
  }
  return result;
}

uint64_t TapAction.init(with:)@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C6548();
  uint64_t v8 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v9 = sub_2605C6508(v8);
  MEMORY[0x270FA5388](v9);
  sub_2605C6530();
  uint64_t v10 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v11 = sub_2605C6508(v10);
  MEMORY[0x270FA5388](v11);
  sub_2605C5138();
  uint64_t v12 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v13 = sub_2605C6508(v12);
  MEMORY[0x270FA5388](v13);
  sub_2605C64F8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_2605E22B0();
  MEMORY[0x270FA5388](v17);
  sub_2605C64F8();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605C6560();
  sub_2605E22A0();
  sub_2605C3DD0(v16, 0, 1, v17);
  uint64_t v18 = sub_2605E2940();
  sub_2605C3DD0(v4, 1, 1, v18);
  uint64_t v19 = sub_2605E2140();
  sub_2605C3DD0(v3, 1, 1, v19);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v2, *MEMORY[0x263EFBDC8], v1);
  uint64_t v20 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v20;
  return result;
}

uint64_t sub_2605CA514()
{
  uint64_t v0 = sub_2605E22B0();
  sub_2605C6474(v0, qword_26A88C058);
  sub_2605C5664(v0, (uint64_t)qword_26A88C058);
  return sub_2605E22A0();
}

uint64_t static TapAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A88BD08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2605E22B0();
  uint64_t v3 = sub_2605C5664(v2, (uint64_t)qword_26A88C058);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t TapAction.init()@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C64F8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v12 = sub_2605C6508(v11);
  MEMORY[0x270FA5388](v12);
  sub_2605C64F8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v17 = sub_2605C6508(v16);
  MEMORY[0x270FA5388](v17);
  sub_2605C6548();
  uint64_t v18 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v19 = sub_2605C6508(v18);
  MEMORY[0x270FA5388](v19);
  sub_2605C6530();
  uint64_t v20 = sub_2605E22B0();
  MEMORY[0x270FA5388](v20);
  sub_2605C5138();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605C6560();
  sub_2605E22A0();
  sub_2605C3DD0(v3, 0, 1, v20);
  uint64_t v21 = sub_2605E2940();
  sub_2605C3DD0(v2, 1, 1, v21);
  uint64_t v22 = sub_2605E2140();
  sub_2605C3DD0(v15, 1, 1, v22);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, *MEMORY[0x263EFBDC8], v1);
  uint64_t result = sub_2605E2190();
  *a1 = result;
  return result;
}

uint64_t TapAction.perform()(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[4] = a1;
  v2[5] = v3;
  sub_2605E2BC0();
  v2[6] = sub_2605E2BB0();
  uint64_t v5 = sub_2605E2BA0();
  return MEMORY[0x270FA2498](sub_2605CA8F8, v5, v4);
}

uint64_t sub_2605CA8F8()
{
  swift_release();
  type metadata accessor for AccessibilityActionPerformer();
  swift_retain();
  sub_2605E2170();
  swift_release();
  sub_2605C9FA4(v0[2], v0[3], 2010, 0, 0);
  swift_bridgeObjectRelease();
  sub_2605E2160();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

Swift::Bool __swiftcall TapAction.execute(with:)(UINavigationKit::ContextSource with)
{
  switch(*(unsigned char *)with)
  {
    case 1:
      type metadata accessor for AccessibilityActionPerformer();
      swift_retain();
      sub_2605E2170();
      swift_release();
      char v6 = sub_2605C9FA4(v8, v9, 2010, 0, 0);
      goto LABEL_10;
    case 2:
      type metadata accessor for ContextKitActionPerformer();
      swift_initStackObject();
      swift_retain();
      sub_2605E2170();
      swift_release();
      char v6 = sub_2605CADF8(v8, v9);
      goto LABEL_10;
    case 3:
      type metadata accessor for UIUnderstandingActionPerformer();
      swift_initStackObject();
      swift_retain();
      sub_2605E2170();
      swift_release();
      char v6 = sub_2605E1EE4(v8, v9);
LABEL_10:
      char v5 = v6;
      swift_bridgeObjectRelease();
      break;
    default:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v1 = sub_2605E2810();
      sub_2605C5664(v1, (uint64_t)qword_26A88C7A8);
      uint64_t v2 = sub_2605E2800();
      os_log_type_t v3 = sub_2605E2C10();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_2605B8000, v2, v3, "Unknown source sent", v4, 2u);
        MEMORY[0x261216700](v4, -1, -1);
      }

      char v5 = 0;
      break;
  }
  return v5 & 1;
}

uint64_t sub_2605CABB8(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2605C6180;
  return TapAction.perform()(a1);
}

uint64_t sub_2605CAC54(uint64_t a1)
{
  unint64_t v2 = sub_2605CAD9C();

  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_2605CAC94()
{
  unint64_t result = qword_26A88C078;
  if (!qword_26A88C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C078);
  }
  return result;
}

unint64_t sub_2605CACE4()
{
  unint64_t result = qword_26A88C080;
  if (!qword_26A88C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C080);
  }
  return result;
}

uint64_t sub_2605CAD30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2605CAD4C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2605CAD9C()
{
  unint64_t result = qword_26A88C088;
  if (!qword_26A88C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C088);
  }
  return result;
}

ValueMetadata *type metadata accessor for TapAction()
{
  return &type metadata for TapAction;
}

uint64_t sub_2605CADF8(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ContextKitRetriever();
  swift_initStackObject();
  uint64_t v4 = sub_2605DF214();
  sub_2605DEC9C();
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2605BDA40(a1, a2, v5);
  char v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    type metadata accessor for RecapActionPerformer();
    swift_initStackObject();
    sub_2605DF4F4();
  }
  swift_release();
  return 1;
}

uint64_t type metadata accessor for ContextKitActionPerformer()
{
  return self;
}

uint64_t dispatch thunk of ContextRetrieverProtocol.allElements.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ContextRetrieverProtocol.allElements.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContextRetrieverProtocol.allElements.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ContextRetrieverProtocol.updateState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

BOOL static ContextSource.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ContextSource.hash(into:)()
{
  return sub_2605E2FB0();
}

uint64_t ContextSource.hashValue.getter()
{
  return sub_2605E2FC0();
}

uint64_t sub_2605CAFF4()
{
  return sub_2605E2FC0();
}

UINavigationKit::ContextSource __swiftcall source(for:)(Swift::String a1)
{
  unint64_t v2 = v1;
  BOOL v3 = a1._countAndFlagsBits == 0x737265646E756975 && a1._object == (void *)0xEF676E69646E6174;
  if (v3
    || (unint64_t object = a1._object,
        uint64_t countAndFlagsBits = a1._countAndFlagsBits,
        LOBYTE(a1._countAndFlagsBits) = sub_2605E2F40(),
        (a1._countAndFlagsBits & 1) != 0))
  {
    char v6 = 3;
  }
  else
  {
    BOOL v7 = countAndFlagsBits == 0x6269737365636361 && object == (void *)0xED00007974696C69;
    if (v7 || (LOBYTE(a1._countAndFlagsBits) = sub_2605E2F40(), (a1._countAndFlagsBits & 1) != 0))
    {
      char v6 = 1;
    }
    else
    {
      char v6 = 2;
      if (countAndFlagsBits != 0x6B747865746E6F63 || object != (void *)0xEA00000000007469)
      {
        LOBYTE(a1._countAndFlagsBits) = sub_2605E2F40();
        if (a1._countAndFlagsBits) {
          char v6 = 2;
        }
        else {
          char v6 = 0;
        }
      }
    }
  }
  *unint64_t v2 = v6;
  return a1._countAndFlagsBits;
}

unint64_t sub_2605CB190()
{
  unint64_t result = qword_26A88C098;
  if (!qword_26A88C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C098);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for ContextSource(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContextSource(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContextSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2605CB33CLL);
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

uint64_t sub_2605CB364(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2605CB36C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContextSource()
{
  return &type metadata for ContextSource;
}

Swift::Double __swiftcall distanceFunc(point1:point2:)(CGPoint point1, CGPoint point2)
{
  return sqrt((point1.x - point2.x) * (point1.x - point2.x) + (point1.y - point2.y) * (point1.y - point2.y));
}

Swift::String __swiftcall writeStringToFile(folderName:fileName:data:)(Swift::String folderName, Swift::String fileName, Swift::String data)
{
  Swift::String v31 = data;
  Swift::String v30 = fileName;
  sub_2605E29B0();
  sub_2605C4B78();
  uint64_t v32 = v4;
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_2605CC248();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v29 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  id v15 = objc_msgSend(self, sel_defaultManager);
  id v16 = objc_msgSend(v15, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v17 = sub_2605E2B40();
  if (*(void *)(v17 + 16))
  {
    sub_2605C528C();
    sub_2605C8D80();
    v20();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    sub_2605E2300();
    Swift::String v34 = v31;
    sub_2605E29A0();
    sub_2605C4948();
    sub_2605E2D10();
    uint64_t v21 = sub_2605CC264();
    v22(v21);
    uint64_t v23 = sub_2605E22C0();
    uint64_t v25 = v24;
    uint64_t v26 = *(void (**)(uint64_t))(v7 + 8);
    uint64_t v27 = sub_2605CC27C();
    v26(v27);
    ((void (*)(char *, uint64_t))v26)(v12, v5);
    ((void (*)(char *, uint64_t))v26)(v14, v5);
    uint64_t v18 = v23;
    uint64_t v19 = v25;
  }
  else
  {
    __break(1u);
  }
  result._unint64_t object = v19;
  result._uint64_t countAndFlagsBits = v18;
  return result;
}

CGPoint __swiftcall transformPointCoordApplyScale(_:)(CGPoint a1)
{
  double y = a1.y;
  double x = a1.x;
  id v3 = objc_msgSend(self, sel_mainDisplay);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_pointScale);

    double x = x / (double)(uint64_t)v5;
    double y = y / (double)(uint64_t)v5;
  }
  double v6 = x;
  double v7 = y;
  result.double y = v7;
  result.double x = v6;
  return result;
}

Swift::Bool __swiftcall createDumpDirectory(directoryName:)(Swift::String directoryName)
{
  v30[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v3 = v2;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  double v7 = (char *)v30 - v6 + 32;
  uint64_t v8 = self;
  id v9 = objc_msgSend(v8, sel_defaultManager);
  id v10 = objc_msgSend(v9, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v11 = sub_2605E2B40();
  if (!*(void *)(v11 + 16)) {
    __break(1u);
  }
  sub_2605C528C();
  sub_2605C8D80();
  v12();
  swift_bridgeObjectRelease();
  sub_2605E2300();
  id v13 = objc_msgSend(v8, sel_defaultManager);
  sub_2605E2310();
  uint64_t v14 = (void *)sub_2605E2960();
  swift_bridgeObjectRelease();
  unsigned __int8 v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if (v15)
  {
    id v16 = *(void (**)(void))(v3 + 8);
    sub_2605C8DA0();
    v16();
    sub_2605C8DA0();
    v16();
    return 1;
  }
  id v17 = objc_msgSend(v8, sel_defaultManager);
  sub_2605E2310();
  uint64_t v18 = (void *)sub_2605E2960();
  swift_bridgeObjectRelease();
  v30[0] = 0;
  unsigned int v19 = objc_msgSend(v17, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v18, 1, 0, v30);

  if (v19)
  {
    uint64_t v20 = *(void (**)(void))(v3 + 8);
    id v21 = v30[0];
    sub_2605C8DA0();
    v20();
    ((void (*)(char *, uint64_t))v20)(v7, v1);
    return 1;
  }
  id v23 = v30[0];
  uint64_t v24 = (void *)sub_2605E2290();

  swift_willThrow();
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v25 = sub_2605C4BCC();
  *(_OWORD *)(v25 + 16) = xmmword_2605E3700;
  swift_getErrorValue();
  uint64_t v26 = sub_2605E2F70();
  *(void *)(v25 + 56) = MEMORY[0x263F8D310];
  *(void *)(v25 + 32) = v26;
  *(void *)(v25 + 40) = v27;
  sub_2605C4B94();
  swift_bridgeObjectRelease();

  uint64_t v28 = *(void (**)(void))(v3 + 8);
  sub_2605C8DA0();
  v28();
  sub_2605C8DA0();
  v28();
  return 0;
}

Swift::String __swiftcall absoluteFolderPathGivenDumpDirName(_:)(Swift::String a1)
{
  uint64_t v1 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_2605CC248();
  MEMORY[0x270FA5388](v5);
  double v7 = (char *)&v20 - v6;
  id v8 = objc_msgSend(self, sel_defaultManager);
  id v9 = objc_msgSend(v8, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v10 = sub_2605E2B40();
  if (*(void *)(v10 + 16))
  {
    sub_2605C8D80();
    v13();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    uint64_t v14 = sub_2605E22C0();
    id v16 = v15;
    id v17 = *(void (**)(uint64_t))(v3 + 8);
    uint64_t v18 = sub_2605CC27C();
    v17(v18);
    ((void (*)(char *, uint64_t))v17)(v7, v1);
    uint64_t v11 = v14;
    uint64_t v12 = v16;
  }
  else
  {
    __break(1u);
  }
  result._unint64_t object = v12;
  result._uint64_t countAndFlagsBits = v11;
  return result;
}

Swift::Void __swiftcall deleteDirectoryContentsRecursively(atPath:)(Swift::String atPath)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_defaultManager);
  sub_2605CC27C();
  sub_2605E22D0();
  sub_2605CC27C();
  id v8 = (void *)sub_2605E2960();
  unsigned int v9 = objc_msgSend(v7, sel_fileExistsAtPath_, v8);

  if (!v9)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
    goto LABEL_5;
  }
  uint64_t v10 = (void *)sub_2605E22F0();
  id v22 = 0;
  unsigned int v11 = objc_msgSend(v7, sel_removeItemAtURL_error_, v10, &v22);

  if (v11)
  {
    uint64_t v12 = *(void (**)(uint64_t))(v3 + 8);
    id v13 = v22;
    uint64_t v14 = sub_2605CC288();
    v12(v14);
LABEL_5:

    return;
  }
  id v15 = v22;
  id v16 = (void *)sub_2605E2290();

  swift_willThrow();
  uint64_t v17 = sub_2605CC288();
  v18(v17);
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v19 = sub_2605C4BCC();
  *(_OWORD *)(v19 + 16) = xmmword_2605E3700;
  id v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  sub_2605E2D70();
  sub_2605E2A50();
  sub_2605CC27C();
  sub_2605E2A50();
  sub_2605E2A50();
  id v20 = v22;
  unint64_t v21 = v23;
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  *(void *)(v19 + 32) = v20;
  *(void *)(v19 + 40) = v21;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
}

uint64_t downLevelAndTapOnly(filePath:textToBeSearched:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  return MEMORY[0x270FA2498](sub_2605CBEA0, 0, 0);
}

uint64_t sub_2605CBEA0()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v3 = *(void **)(v0 + 56);
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v5 = sub_2605C4BCC();
  *(_OWORD *)(v5 + 16) = xmmword_2605E3700;
  sub_2605E2D70();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  uint64_t v6 = MEMORY[0x263F8D310];
  *(void *)(v5 + 56) = MEMORY[0x263F8D310];
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v1;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = v4;
  v7._unint64_t object = v3;
  v8._uint64_t countAndFlagsBits = v2;
  v8._unint64_t object = v1;
  CGPoint v9 = parseUIUnderstandingDumpForDownLeveling(filePath:textToBeSearched:textOK:)(v7, v8, 0);
  uint64_t v10 = sub_2605C4BCC();
  *(_OWORD *)(v10 + 16) = xmmword_2605E3700;
  sub_2605E2D70();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  sub_2605E2A50();
  *(CGPoint *)(v0 + 32) = v9;
  type metadata accessor for CGPoint(0);
  sub_2605E2E10();
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v12 = *(void *)(v0 + 24);
  *(void *)(v10 + 56) = v6;
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v12;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 88) = 0;
  CGPoint v13 = transformPointCoordApplyScale(_:)(v9);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_2605CC0F0;
  return dispatchActionOnly(_:point:advanceTime:)((unsigned char *)(v0 + 88), v13.x, v13.y);
}

uint64_t sub_2605CC0F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *sub_2605CC1E4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2605CC264()
{
  return v0;
}

uint64_t sub_2605CC27C()
{
  return v0;
}

uint64_t sub_2605CC288()
{
  return v0;
}

unint64_t sub_2605CC29C(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_2605D5550(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_2605E2D60();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_2605E2DB0();
      }
      unsigned int v5 = sub_2605E2DC0();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t captureSnapshot(atDumpDir:deleteExistingDir:)(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 96) = a3;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = a2;
  return sub_2605D66CC((uint64_t)sub_2605CC398);
}

uint64_t sub_2605CC398()
{
  sub_2605D6B0C();
  if (createDumpDirectory(directoryName:)(*(Swift::String *)(v0 + 64)))
  {
    int v1 = *(unsigned __int8 *)(v0 + 96);
    uint64_t v3 = *(void *)(v0 + 64);
    uint64_t v2 = *(void *)(v0 + 72);
    type metadata accessor for CaptureDeviceContextState();
    *(void *)(v0 + 80) = swift_initStackObject();
    swift_bridgeObjectRetain();
    CaptureDeviceContextState.init(dumpDirectoryName:isRecordUX:)(v3, v2, 0);
    if (v1 == 1)
    {
      Swift::String v4 = absoluteFolderPathGivenDumpDirName(_:)(*(Swift::String *)(v0 + 64));
      deleteDirectoryContentsRecursively(atPath:)(v4);
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v5;
    *unsigned int v5 = v0;
    v5[1] = sub_2605CC524;
    return sub_2605CF45C(v0 + 56, 0, 1);
  }
  else
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v7 = sub_2605C4BCC();
    *(_OWORD *)(v7 + 16) = xmmword_2605E3700;
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    *(void *)(v7 + 32) = 0xD000000000000033;
    *(void *)(v7 + 40) = 0x80000002605E5350;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    sub_2605D682C();
    return v8();
  }
}

uint64_t sub_2605CC524()
{
  sub_2605D67DC();
  uint64_t v1 = *v0;
  sub_2605D6760();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_2605D68A8();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2605CC62C()
{
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v0 = sub_2605C4BCC();
  *(_OWORD *)(v0 + 16) = xmmword_2605E3700;
  sub_2605E2D70();
  sub_2605D6928();
  sub_2605E2A50();
  sub_2605E2A50();
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  swift_release();
  sub_2605D682C();
  return v1();
}

uint64_t CaptureDeviceContextState.__allocating_init(dumpDirectoryName:isRecordUX:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  CaptureDeviceContextState.init(dumpDirectoryName:isRecordUX:)(a1, a2, a3);
  return v6;
}

uint64_t captureViewHierarchy(args:verbose:jsonOutput:)()
{
  sub_2605D67DC();
  *(unsigned char *)(v0 + 89) = v1;
  *(unsigned char *)(v0 + 88) = v2;
  *(void *)(v0 + 48) = v3;
  uint64_t v4 = sub_2605E27C0();
  *(void *)(v0 + 56) = v4;
  sub_2605D66F0(v4);
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 72) = swift_task_alloc();
  *(void *)(v0 + 80) = swift_task_alloc();
  sub_2605D68A8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

void sub_2605CC830()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 88);
  sub_2605E2670();
  sub_2605D6A80();
  sub_2605E2660();
  uint64_t v2 = sub_2605D6974();
  if (v1)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_2605D6958();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v4 = v2;
  unint64_t v5 = v3;
  sub_2605E21D0();
  sub_2605D6A80();
  sub_2605E21C0();
  sub_2605D6AB8();
  sub_2605D3C08(v4, v5);
  unint64_t v6 = sub_2605D61F8((uint64_t)&unk_26A88C0C0);
  sub_2605D68E8(v6);
  int v9 = *(unsigned __int8 *)(v0 + 89);
  swift_release();
  sub_2605D6A14();
  if (v9 == 1)
  {
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = sub_2605D69F4();
    v12(v11);
    uint64_t v14 = sub_2605CCB60(v10);
    uint64_t v15 = v13;
    sub_2605CCFDC(v14, v13);
    if (!v18)
    {
      sub_2605E2D70();
      *(void *)(v0 + 16) = 0;
      *(void *)(v0 + 24) = 0xE000000000000000;
      sub_2605D6928();
      sub_2605E2A50();
      *(void *)(v0 + 32) = v14;
      *(void *)(v0 + 40) = v15;
      sub_2605E2E10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2605E2A50();
      swift_release();
      sub_2605D3C74(v4, v5);
LABEL_11:
      (*(void (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 56));
      swift_task_dealloc();
      swift_task_dealloc();
      sub_2605D6958();
      __asm { BRAA            X3, X16 }
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2605E27A0();
    swift_release();
  }
  sub_2605D3C74(v4, v5);
  goto LABEL_11;
}

uint64_t sub_2605CCB60(uint64_t a1)
{
  uint64_t v2 = sub_2605E25B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  long long v47 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v46 = (char *)&v36 - v6;
  uint64_t v7 = sub_2605E27F0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2605E27B0();
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    double v37 = v10;
    uint64_t v38 = v8;
    uint64_t v39 = v7;
    uint64_t v40 = a1;
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v13 = v3 + 16;
    uint64_t v45 = v14;
    unint64_t v15 = (*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64);
    uint64_t v36 = v11;
    unint64_t v16 = v11 + v15;
    uint64_t v44 = *(void *)(v13 + 56);
    unint64_t v43 = (void (**)(char *, uint64_t))(v13 - 8);
    uint64_t v54 = MEMORY[0x263F8EE78];
    uint64_t v42 = v2;
    uint64_t v41 = v13;
    uint64_t v17 = v46;
    do
    {
      uint64_t v18 = v45;
      v45(v17, (char *)v16, v2);
      uint64_t v19 = (uint64_t)v47;
      v18(v47, v17, v2);
      sub_2605CFE60(v19, v55);
      uint64_t v48 = v55[0];
      uint64_t v20 = v55[1];
      uint64_t v21 = v55[2];
      uint64_t v22 = v55[3];
      uint64_t v23 = v55[4];
      uint64_t v24 = v55[5];
      uint64_t v49 = v55[6];
      uint64_t v53 = v55[7];
      uint64_t v52 = v55[8];
      uint64_t v51 = v55[9];
      uint64_t v50 = v55[10];
      (*v43)(v17, v2);
      sub_2605D6138((uint64_t)v55, (uint64_t)v56, &qword_26A88C1B0);
      if (v57 != 1)
      {
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v25 = v54;
        }
        else
        {
          sub_2605C2DA0(0, *(void *)(v54 + 16) + 1, 1, v54);
          uint64_t v25 = v31;
        }
        unint64_t v27 = *(void *)(v25 + 16);
        unint64_t v26 = *(void *)(v25 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_2605C2DA0(v26 > 1, v27 + 1, 1, v25);
          uint64_t v25 = v32;
        }
        *(void *)(v25 + 16) = v27 + 1;
        uint64_t v54 = v25;
        uint64_t v28 = v25 + 88 * v27;
        *(void *)(v28 + 32) = v48;
        *(void *)(v28 + 40) = v20;
        *(void *)(v28 + 48) = v21;
        *(void *)(v28 + 56) = v22;
        *(void *)(v28 + 64) = v23;
        *(void *)(v28 + 72) = v24;
        *(unsigned char *)(v28 + 80) = v49 & 1;
        uint64_t v29 = v52;
        *(void *)(v28 + 88) = v53;
        *(void *)(v28 + 96) = v29;
        uint64_t v30 = v50;
        *(void *)(v28 + 104) = v51;
        *(void *)(v28 + 112) = v30;
        uint64_t v2 = v42;
      }
      v16 += v44;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    a1 = v40;
    uint64_t v7 = v39;
    uint64_t v8 = v38;
    uint64_t v10 = v37;
    uint64_t v33 = v54;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  sub_2605E2790();
  sub_2605D038C((uint64_t)v10);
  uint64_t v34 = sub_2605E27C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(a1, v34);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v33;
}

char *sub_2605CCFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2605E29B0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2605E21F0();
  MEMORY[0x270FA5388](v8 - 8);
  v14[0] = a1;
  v14[1] = a2;
  sub_2605E2230();
  swift_allocObject();
  sub_2605E2220();
  sub_2605E21E0();
  sub_2605E2200();
  sub_2605D5864();
  uint64_t v9 = sub_2605E2210();
  if (!v2)
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    sub_2605E29A0();
    uint64_t v7 = (char *)sub_2605E2980();
    sub_2605D3C88(v11, v12);
  }
  swift_release();
  return v7;
}

uint64_t captureScreenshotAndProcess(atDumpDir:indexStr:deleteExistingDir:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 88) = a5;
  *(void *)(v5 + 72) = a3;
  *(void *)(v5 + 80) = a4;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a2;
  return sub_2605D66CC((uint64_t)sub_2605CD170);
}

uint64_t sub_2605CD170()
{
  uint64_t v18 = v0;
  if (createDumpDirectory(directoryName:)(*(Swift::String *)(v0 + 56)))
  {
    int v1 = *(unsigned __int8 *)(v0 + 88);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v2 = *(void *)(v0 + 64);
    type metadata accessor for CaptureDeviceContextState();
    swift_initStackObject();
    swift_bridgeObjectRetain();
    CaptureDeviceContextState.init(dumpDirectoryName:isRecordUX:)(v3, v2, 0);
    if (v1 == 1)
    {
      Swift::String v4 = absoluteFolderPathGivenDumpDirName(_:)(*(Swift::String *)(v0 + 56));
      deleteDirectoryContentsRecursively(atPath:)(v4);
      swift_bridgeObjectRelease();
    }
    uint64_t v15 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2605E24C0();
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = result;
    unint64_t v7 = sub_2605CDA38(result, *(void *)(v0 + 72), *(void *)(v0 + 80), &v15);
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    if (!v7 && v9 == 0xE000000000000000 || (sub_2605D688C() & 1) != 0)
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v10 = sub_2605C4BCC();
      *(_OWORD *)(v10 + 16) = xmmword_2605E3700;
      unint64_t v11 = 0x80000002605E5490;
      unint64_t v12 = 0xD000000000000027;
    }
    else
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v10 = sub_2605C4BCC();
      *(_OWORD *)(v10 + 16) = xmmword_2605E3700;
      unint64_t v16 = 0;
      unint64_t v17 = 0xE000000000000000;
      sub_2605E2D70();
      sub_2605D6928();
      sub_2605E2A50();
      swift_bridgeObjectRetain();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      unint64_t v12 = v16;
      unint64_t v11 = v17;
    }
    *(void *)(v10 + 56) = MEMORY[0x263F8D310];
    *(void *)(v10 + 32) = v12;
    *(void *)(v10 + 40) = v11;
    sub_2605C4B94();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v13 = sub_2605C4BCC();
    *(_OWORD *)(v13 + 16) = xmmword_2605E3700;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    *(void *)(v13 + 32) = 0xD000000000000033;
    *(void *)(v13 + 40) = 0x80000002605E5350;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    unint64_t v7 = 0;
    uint64_t v6 = 0;
    unint64_t v9 = 0xE000000000000000;
  }
  uint64_t v14 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t))(v0 + 8);
  return v14(v7, v9, v6);
}

uint64_t captureSnapshotUntilScreenStabilizes(dumpDirectoryName:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return sub_2605D66CC((uint64_t)sub_2605CD410);
}

uint64_t sub_2605CD410()
{
  sub_2605D67DC();
  v0[13] = 0;
  v0[14] = 0;
  v0[15] = 0;
  v0[10] = 0;
  sub_2605E2F20();
  v0[16] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2605CD4C8;
  uint64_t v3 = sub_2605D68CC();
  return captureScreenshotAndProcess(atDumpDir:indexStr:deleteExistingDir:)(v3, v4, v5, v6, v7);
}

uint64_t sub_2605CD4C8()
{
  sub_2605D67DC();
  sub_2605D66D8();
  v2[2] = v0;
  v2[3] = v1;
  v2[4] = v3;
  v2[5] = v4;
  uint64_t v5 = *v0;
  sub_2605D6760();
  *uint64_t v6 = v5;
  *(void *)(v9 + 144) = v7;
  *(void *)(v9 + 152) = v8;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_2605D68A8();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_2605CD5B8()
{
  uint64_t v1 = *(void *)(v0 + 112);

  parseUIUnderstandingDumpForMarkers(dumpDirectoryName:index:)();
  uint64_t v3 = v2;
  if (v1)
  {
    uint64_t v4 = sub_2605D6AAC();
    double v6 = markerMatchPercentage(markers1:markers2:)((Swift::OpaquePointer)v4, v5);
    swift_bridgeObjectRelease();
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v7 = sub_2605C4BCC();
    *(_OWORD *)(v7 + 16) = xmmword_2605E3700;
    *(void *)(v0 + 64) = 0;
    *(void *)(v0 + 72) = 0xE000000000000000;
    sub_2605E2D70();
    uint64_t v8 = *(void *)(v0 + 72);
    *(void *)(v0 + 48) = *(void *)(v0 + 64);
    *(void *)(v0 + 56) = v8;
    sub_2605D6928();
    sub_2605E2A50();
    sub_2605E2BE0();
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v10 = *(void *)(v0 + 56);
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    *(void *)(v7 + 32) = v9;
    *(void *)(v7 + 40) = v10;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    if (v6 == 1.0) {
      goto LABEL_4;
    }
  }
  uint64_t v11 = *(void *)(v0 + 120);
  if (v11 == 9)
  {
LABEL_4:
    uint64_t v12 = *(void *)(v0 + 24);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v15 = *(void *)(v0 + 152);
    return v13(v12, v14, v15);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(v0 + 152);
    *(void *)(v0 + 112) = v3;
    *(void *)(v0 + 120) = v11 + 1;
    *(void *)(v0 + 104) = v17;
    *(void *)(v0 + 80) = v11 + 1;
    sub_2605E2F20();
    *(void *)(v0 + 128) = v18;
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_2605CD4C8;
    uint64_t v20 = sub_2605D68CC();
    return captureScreenshotAndProcess(atDumpDir:indexStr:deleteExistingDir:)(v20, v21, v22, v23, v24);
  }
}

uint64_t deviceContextState.uiObjectList.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t deviceContextState.uiObjectList.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*deviceContextState.uiObjectList.modify())()
{
  return nullsub_1;
}

void *CaptureDeviceContextState.init(dumpDirectoryName:isRecordUX:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  v3[2] = 0;
  v3[3] = a1;
  v3[4] = a2;
  if (a3)
  {
    sub_2605BBCB8(&qword_26A88BD48);
    Swift::OpaquePointer v5 = (__n128 *)sub_2605C4BCC();
    double v6 = sub_2605D6A6C(v5, (__n128)xmmword_2605E3700);
    v6[2].n128_u64[0] = v7 + 42;
    v6[2].n128_u64[1] = 0x80000002605E5520;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
  }
  sub_2605E2490();
  uint64_t v8 = (void *)sub_2605E2460();
  sub_2605E2480();
  char v9 = sub_2605E2470();

  if (v9)
  {
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
    id v11 = objc_allocWithZone((Class)sub_2605E2450());
    sub_2605D68A8();
    uint64_t v12 = sub_2605E2440();
    uint64_t v13 = (void *)v4[2];
    v4[2] = v12;

    uint64_t v14 = (void *)v4[2];
    if (v14)
    {
      id v15 = v14;
      sub_2605E23F0();
      sub_2605E2420();
      uint64_t v19 = (void *)v4[2];
      v4[2] = v14;
    }
  }
  else
  {
    sub_2605BBCB8(&qword_26A88BD48);
    unint64_t v16 = (__n128 *)sub_2605C4BCC();
    uint64_t v17 = sub_2605D6A6C(v16, (__n128)xmmword_2605E3700);
    v17[2].n128_u64[0] = v18;
    v17[2].n128_u64[1] = 0x80000002605E54E0;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_2605CDA38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_2605E24B0();
  sub_2605C4B78();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_2605C6530();
  id v11 = *(void **)(v4 + 16);
  if (!v11) {
    return sub_2605D6AAC();
  }
  sub_2605E2450();
  id v12 = v11;
  sub_2605E2400();
  sub_2605E2410();
  unint64_t result = sub_2605E24A0();
  unint64_t v14 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2605E2E40();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v46 = v5;
  if (!v15)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    sub_2605E2D70();
    swift_bridgeObjectRelease();
    sub_2605C526C();
    uint64_t v50 = v42;
    sub_2605E2A50();
    sub_2605C8D0C();
    swift_bridgeObjectRetain();
    v43._uint64_t countAndFlagsBits = sub_2605D6A08();
    v44._uint64_t countAndFlagsBits = 0xD000000000000013;
    v44._unint64_t object = v50;
    v45._uint64_t countAndFlagsBits = 0;
    v45._unint64_t object = (void *)0xE000000000000000;
    writeStringToFile(folderName:fileName:data:)(v43, v44, v45);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v46, v7);
    return sub_2605D6AAC();
  }
  if (v15 >= 1)
  {
    uint64_t v16 = 0;
    sub_2605C526C();
    uint64_t v47 = v17;
    uint64_t v48 = v15;
    unint64_t v49 = v14;
    do
    {
      if (v47) {
        id v18 = (id)MEMORY[0x261215E60](v16, v14);
      }
      else {
        id v18 = *(id *)(v14 + 8 * v16 + 32);
      }
      uint64_t v19 = v18;
      uint64_t v20 = (void *)sub_2605E24E0();
      sub_2605E2390();

      sub_2605D6744();
      swift_bridgeObjectRetain();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      uint64_t v21 = (void *)sub_2605E24E0();
      sub_2605E23A0();

      sub_2605D6744();
      swift_bridgeObjectRetain();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2605D679C();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605D6728();
      swift_bridgeObjectRelease();
      uint64_t v22 = (void *)sub_2605E24E0();
      sub_2605E2380();

      uint64_t v23 = sub_2605D6744();
      sub_2605D6838(v23, v24);
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      uint64_t v25 = (void *)sub_2605E24E0();
      sub_2605E23C0();

      sub_2605D6744();
      sub_2605D686C();
      sub_2605D69BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2605D679C();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605D6728();
      swift_bridgeObjectRelease();
      unint64_t v26 = (void *)sub_2605E24E0();
      sub_2605E23B0();

      uint64_t v27 = sub_2605D6744();
      sub_2605D6838(v27, v28);
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      uint64_t v29 = (void *)sub_2605E24E0();
      sub_2605E23E0();

      sub_2605D6744();
      sub_2605D686C();
      sub_2605D69BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2605D679C();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605D6728();
      swift_bridgeObjectRelease();
      uint64_t v30 = (void *)sub_2605E24E0();
      sub_2605E23D0();

      uint64_t v31 = sub_2605E2BD0();
      sub_2605D6838(v31, v32);
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      uint64_t v33 = (void *)sub_2605E24E0();
      sub_2605E23D0();

      sub_2605E2BD0();
      sub_2605D686C();
      sub_2605D69BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2605D679C();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605D6728();
      swift_bridgeObjectRelease();
      uint64_t v34 = (void *)sub_2605E24E0();
      sub_2605E2390();

      uint64_t v35 = (void *)sub_2605E24E0();
      sub_2605E23B0();

      uint64_t v36 = (void *)sub_2605E24E0();
      sub_2605E2380();

      double v37 = (void *)sub_2605E24E0();
      sub_2605E23E0();

      sub_2605E2BD0();
      swift_bridgeObjectRetain();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605E2BD0();
      swift_bridgeObjectRetain();
      sub_2605D69BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2605D679C();
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605D6728();
      swift_bridgeObjectRelease();
      sub_2605E2510();
      uint64_t v38 = sub_2605E24D0();
      sub_2605D6838(v38, v39);
      sub_2605C4BB4();
      swift_bridgeObjectRelease();
      sub_2605D6728();
      swift_bridgeObjectRelease();
      sub_2605E2500();
      if (v40)
      {
        sub_2605E2A50();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2605E2A50();
      }
      ++v16;
      sub_2605E2A50();
      id v41 = v19;
      MEMORY[0x261215BF0]();
      sub_2605C2B38(*(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10));
      sub_2605E2B90();
      sub_2605E2B60();

      unint64_t v14 = v49;
    }
    while (v48 != v16);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_2605CE134()
{
  sub_2605D67DC();
  *(void *)(v0 + 80) = v1;
  *(void *)(v0 + 88) = v2;
  *(void *)(v0 + 64) = v3;
  *(void *)(v0 + 72) = v4;
  *(unsigned char *)(v0 + 129) = v5;
  *(unsigned char *)(v0 + 128) = v6;
  *(void *)(v0 + 56) = v7;
  uint64_t v8 = sub_2605E27C0();
  *(void *)(v0 + 96) = v8;
  sub_2605D66F0(v8);
  *(void *)(v0 + 104) = v9;
  *(void *)(v0 + 112) = swift_task_alloc();
  *(void *)(v0 + 120) = swift_task_alloc();
  sub_2605D68A8();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_2605CE1E8()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 128);
  sub_2605E2670();
  sub_2605D6A80();
  sub_2605E2660();
  uint64_t v2 = sub_2605D6974();
  if (v1)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    sub_2605E21D0();
    sub_2605D6A80();
    sub_2605E21C0();
    sub_2605D6AB8();
    sub_2605D3C08(v4, v5);
    unint64_t v6 = sub_2605D61F8((uint64_t)&unk_26A88C0C0);
    sub_2605D68E8(v6);
    int v9 = *(unsigned __int8 *)(v0 + 129);
    swift_release();
    sub_2605D6A14();
    if (v9 == 1)
    {
      uint64_t v10 = *(void *)(v0 + 112);
      uint64_t v11 = sub_2605D69F4();
      v12(v11);
      uint64_t v13 = sub_2605CCB60(v10);
      uint64_t v15 = v14;
      sub_2605CCFDC(v13, v14);
      if (v16)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2605E2D70();
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0xE000000000000000;
        sub_2605D6928();
        sub_2605E2A50();
        *(void *)(v0 + 32) = v13;
        *(void *)(v0 + 40) = v15;
        sub_2605E2E10();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2605E2A50();
      }
    }
    else
    {
      sub_2605E27A0();
    }
    uint64_t v17 = *(void *)(v0 + 120);
    uint64_t v18 = *(void *)(v0 + 104);
    uint64_t v24 = *(void *)(v0 + 96);
    Swift::String v23 = *(Swift::String *)(v0 + 64);
    *(void *)(v0 + 48) = mach_absolute_time();
    sub_2605E2F20();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    sub_2605E2A50();
    swift_bridgeObjectRetain();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2605E2D70();
    swift_bridgeObjectRelease();
    sub_2605E2A50();
    sub_2605C8D0C();
    v19._uint64_t countAndFlagsBits = 0xD000000000000014;
    v19._unint64_t object = (void *)0x80000002605E5850;
    v20._uint64_t countAndFlagsBits = 0x6D617473656D6954;
    v20._unint64_t object = (void *)0xEB00000000203A70;
    Swift::String v21 = writeStringToFile(folderName:fileName:data:)(v23, v19, v20);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    sub_2605D3C74(v4, v5);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v24);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(uint64_t, void *))(v0 + 8);
    return v22(v21._countAndFlagsBits, v21._object);
  }
}

uint64_t sub_2605CE64C(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_2605CE828();
  if (!v2)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    unint64_t v9 = 0xD000000000000016;
    if (v5 || v6 != (void *)0xE000000000000000)
    {
      if (sub_2605E2F40())
      {
        swift_bridgeObjectRelease();
        unint64_t v11 = 0x80000002605E5830;
LABEL_9:
        sub_2605BBCB8(&qword_26A88BD48);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_2605E3700;
        *(void *)(v14 + 56) = MEMORY[0x263F8D310];
        *(void *)(v14 + 32) = v9;
        *(void *)(v14 + 40) = v11;
        sub_2605C4B94();
        swift_bridgeObjectRelease();
        return sub_2605D6A08();
      }
      sub_2605E2D70();
      swift_bridgeObjectRelease();
      strcpy((char *)&v16, "uiContextDump");
      HIWORD(v16._object) = -4864;
      sub_2605E2A50();
      sub_2605E2A50();
      v12._uint64_t countAndFlagsBits = a1;
      v12._unint64_t object = a2;
      v13._uint64_t countAndFlagsBits = v7;
      v13._unint64_t object = v8;
      writeStringToFile(folderName:fileName:data:)(v12, v16, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v9 = 0xD000000000000012;
      uint64_t v10 = "uiContext captured";
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = "uiContext not captured";
    }
    unint64_t v11 = (unint64_t)(v10 - 32) | 0x8000000000000000;
    goto LABEL_9;
  }
  return sub_2605D6A08();
}

uint64_t sub_2605CE828()
{
  uint64_t v1 = sub_2605E26E0();
  sub_2605E2670();
  swift_allocObject();
  sub_2605E2660();
  sub_2605CE9A4(v1);
  sub_2605E26D0();
  swift_allocObject();
  sub_2605E26C0();
  uint64_t v2 = sub_2605E2650();
  swift_release();
  uint64_t result = swift_release();
  if (!v0)
  {
    uint64_t v4 = *(void *)(v2 + 16);
    if (v4)
    {
      uint64_t v5 = sub_2605E26B0();
      sub_2605D66F0(v5);
      unint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      uint64_t v9 = *(void *)(v8 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_2605CEB64();
        sub_2605E2A50();
        sub_2605E2A50();
        swift_bridgeObjectRelease();
        v7 += v9;
        --v4;
      }
      while (v4);
      swift_bridgeObjectRelease_n();
      return 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2605CE9A4(uint64_t a1)
{
  uint64_t v2 = sub_2605E26F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - v7;
  sub_2605D61F8((uint64_t)&unk_26A88C180);
  uint64_t v9 = sub_2605E2BF0();
  uint64_t v20 = v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    Swift::String v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    Swift::String v12 = v13;
    unint64_t v14 = (*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64);
    uint64_t v19 = a1;
    uint64_t v15 = a1 + v14;
    uint64_t v16 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v15, v2);
      sub_2605D3D70((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v15 += v16;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    return v20;
  }
  else
  {
    uint64_t v17 = v9;
    swift_bridgeObjectRelease();
  }
  return v17;
}

unint64_t sub_2605CEB64()
{
  sub_2605E2780();
  sub_2605C4B78();
  uint64_t v34 = v1;
  uint64_t v35 = v0;
  MEMORY[0x270FA5388](v0);
  sub_2605C532C();
  uint64_t v33 = v2;
  uint64_t v41 = sub_2605E2610();
  sub_2605C4B78();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_2605C532C();
  uint64_t v40 = v6;
  uint64_t v39 = sub_2605E2710();
  sub_2605C4B78();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_2605C64F8();
  uint64_t v12 = v11 - v10;
  sub_2605E2D70();
  swift_bridgeObjectRelease();
  sub_2605C526C();
  unint64_t v47 = 0xD000000000000013;
  unint64_t v48 = v13;
  sub_2605E2A50();
  uint64_t v14 = sub_2605E26A0();
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v46 = MEMORY[0x263F8EE78];
    sub_2605D4D88(0, v15, 0);
    uint64_t v17 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
    uint64_t v16 = v8 + 16;
    unint64_t v18 = v14 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
    uint64_t v37 = *(void *)(v16 + 56);
    uint64_t v38 = v17;
    uint64_t v36 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    do
    {
      v38(v12, v18, v39);
      uint64_t v44 = 0;
      unint64_t v45 = 0xE000000000000000;
      sub_2605E2700();
      sub_2605E2600();
      (*v36)(v40, v41);
      uint64_t v42 = 0x6D32333B305B1BLL;
      unint64_t v43 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      sub_2605D6708();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v16 - 8))(v12, v39);
      uint64_t v19 = v46;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605D4D88(0, *(void *)(v46 + 16) + 1, 1);
        uint64_t v19 = v46;
      }
      unint64_t v21 = *(void *)(v19 + 16);
      unint64_t v20 = *(void *)(v19 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_2605D4D88(v20 > 1, v21 + 1, 1);
        uint64_t v19 = v46;
      }
      *(void *)(v19 + 16) = v21 + 1;
      unint64_t v22 = v19 + 16 * v21;
      *(void *)(v22 + 32) = 0;
      *(void *)(v22 + 40) = 0xE000000000000000;
      v18 += v37;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
  uint64_t v44 = v19;
  sub_2605BBCB8(&qword_26A88BDA8);
  sub_2605D5510((uint64_t)&unk_26A88C0F8);
  sub_2605E2920();
  swift_bridgeObjectRelease();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  sub_2605D68B4();
  sub_2605D67E8();
  sub_2605E2680();
  sub_2605D2694();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605D6910();
  sub_2605D68B4();
  uint64_t v23 = sub_2605D67E8();
  uint64_t v24 = MEMORY[0x261215760](v23);
  uint64_t v25 = sub_2605E26B0();
  MEMORY[0x261215C20](v24, v25);
  swift_bridgeObjectRelease();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  unint64_t v47 = 538976288;
  unint64_t v48 = 0xE400000000000000;
  sub_2605E2A50();
  uint64_t v44 = 10;
  unint64_t v45 = 0xE100000000000000;
  sub_2605D6A98();
  uint64_t v42 = v26;
  unint64_t v43 = v27;
  sub_2605C4948();
  sub_2605D67B8((uint64_t)&v44, (uint64_t)&v42, v28, v29, v30, v31, MEMORY[0x263F8D310]);
  sub_2605D6AEC();
  swift_bridgeObjectRelease();
  unint64_t v47 = 2683;
  unint64_t v48 = 0xE200000000000000;
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  return v47;
}

void sub_2605CF084(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char *a5)
{
  unint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v6 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v43 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v40 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v40 - v15;
  id v17 = objc_msgSend(self, sel_defaultManager);
  id v18 = objc_msgSend(v17, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v19 = sub_2605E2B40();
  if (*(void *)(v19 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v16, v19 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v6);
    swift_bridgeObjectRelease();
    sub_2605E2300();
    unint64_t v20 = (UIImage *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, a1, 0, 1.0);
    unint64_t v21 = UIImageJPEGRepresentation(v20, 1.0);
    if (v21)
    {
      unint64_t v22 = v21;
      uint64_t v23 = sub_2605E2350();
      unint64_t v25 = v24;

      uint64_t v26 = sub_2605E2340();
      v40[1] = v27;
      v40[2] = v26;
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_2605E2D70();
      swift_bridgeObjectRelease();
      sub_2605C526C();
      unint64_t v47 = 0xD000000000000012;
      unint64_t v48 = v28;
      sub_2605E2A50();
      sub_2605E2A50();
      uint64_t v42 = v14;
      sub_2605E2300();
      swift_bridgeObjectRelease();
      unint64_t v41 = v25;
      id v29 = v44;
      sub_2605E2360();
      id v44 = v29;
      if (v29)
      {
        sub_2605BBCB8(&qword_26A88BD48);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_2605E39B0;
        *(void *)(v30 + 56) = MEMORY[0x263F8D310];
        sub_2605C526C();
        v31[4] = v33;
        v31[5] = v32;
        uint64_t v34 = v31 + 8;
        swift_getErrorValue();
        uint64_t v35 = v45;
        uint64_t v36 = v46;
        *(void *)(v30 + 88) = v46;
        uint64_t v37 = sub_2605CC1E4(v34);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16))(v37, v35, v36);
        sub_2605C4B94();

        sub_2605D3C88(v23, v41);
        swift_bridgeObjectRelease();

        id v44 = 0;
      }
      else
      {

        sub_2605D3C88(v23, v41);
      }
      uint64_t v39 = *(void (**)(void))(v8 + 8);
      sub_2605D6770();
      v39();
      sub_2605D6770();
      v39();
      sub_2605D6770();
      v39();
    }
    else
    {

      uint64_t v38 = *(void (**)(void))(v8 + 8);
      sub_2605D6770();
      v38();
      sub_2605D6770();
      v38();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2605CF45C(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = v3;
  *(unsigned char *)(v4 + 56) = a3;
  *(void *)(v4 + 16) = a1;
  return sub_2605D66CC((uint64_t)sub_2605CF47C);
}

uint64_t sub_2605CF47C()
{
  sub_2605D6B0C();
  uint64_t result = sub_2605E24C0();
  *(void *)(v0 + 40) = result;
  if (result)
  {
    uint64_t v2 = result;
    char v3 = *(unsigned char *)(v0 + 56) & 1;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_2605CF53C;
    uint64_t v5 = *(void *)(v0 + 24);
    uint64_t v6 = *(void *)(v0 + 16);
    return sub_2605CF65C(v6, v5, v3, v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2605CF53C()
{
  sub_2605D67DC();
  sub_2605D66D8();
  uint64_t v1 = *v0;
  sub_2605D6760();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_2605D68A8();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2605CF604()
{
  sub_2605D67DC();

  sub_2605D682C();
  return v1();
}

uint64_t sub_2605CF65C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 80) = a4;
  *(void *)(v5 + 88) = v4;
  *(unsigned char *)(v5 + 152) = a3;
  *(void *)(v5 + 64) = a1;
  *(void *)(v5 + 72) = a2;
  return sub_2605D66CC((uint64_t)sub_2605CF67C);
}

uint64_t sub_2605CF67C()
{
  *(void *)(v0 + 40) = MEMORY[0x263F8EE78];
  if (*(unsigned char *)(v0 + 152))
  {
    uint64_t v1 = 0;
    uint64_t v3 = (char *)0xE000000000000000;
  }
  else
  {
    *(void *)(v0 + 56) = *(void *)(v0 + 72);
    uint64_t v1 = sub_2605E2F20();
    uint64_t v3 = v2;
  }
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v3;
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = *(void *)(v5 + 32);
  swift_bridgeObjectRetain();
  sub_2605CF084(v4, v6, v7, v1, v3);
  uint64_t v8 = *(void *)(v0 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (sub_2605CDA38(v8, v1, (uint64_t)v3, (void *)(v0 + 40))) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0xE000000000000000;
  }
  if (v10)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  char v11 = sub_2605D688C();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_11:
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v12 = sub_2605C4BCC();
    *(_OWORD *)(v12 + 16) = xmmword_2605E3700;
    *(void *)(v12 + 56) = MEMORY[0x263F8D310];
    *(void *)(v12 + 32) = 0xD000000000000036;
    *(void *)(v12 + 40) = 0x80000002605E5650;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 112) = *(void *)(v5 + 32);
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_2605CF948;
  return sub_2605CE134();
}

uint64_t sub_2605CF948()
{
  sub_2605D6B0C();
  uint64_t v2 = (void *)*v1;
  sub_2605D6760();
  void *v3 = v2;
  v2[16] = v4;
  v2[17] = v5;
  v2[18] = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_2605D68A8();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

void sub_2605CFA8C()
{
  if (v0[16]) {
    BOOL v1 = 0;
  }
  else {
    BOOL v1 = v0[17] == 0xE000000000000000;
  }
  uint64_t v2 = MEMORY[0x263F8D310];
  if (v1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = sub_2605D688C();
    swift_bridgeObjectRelease();
    if ((v3 & 1) == 0)
    {
LABEL_9:
      uint64_t v5 = (void *)v0[18];
      uint64_t v6 = v0[11];
      uint64_t v8 = *(void *)(v6 + 24);
      uint64_t v7 = *(void **)(v6 + 32);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2605CE64C(v8, v7);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2605BBCB8(&qword_26A88BD48);
        uint64_t v11 = sub_2605C4BCC();
        *(_OWORD *)(v11 + 16) = xmmword_2605E3700;
        swift_getErrorValue();
        uint64_t v12 = sub_2605E2F70();
        *(void *)(v11 + 56) = v2;
        *(void *)(v11 + 32) = v12;
        *(void *)(v11 + 40) = v13;
        sub_2605C4B94();

        goto LABEL_20;
      }
      uint64_t v14 = v9;
      uint64_t v15 = v10;
      swift_bridgeObjectRelease();
      if (v14) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = v15 == 0xE000000000000000;
      }
      if (v16)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v17 = sub_2605D688C();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0) {
          goto LABEL_19;
        }
      }
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v18 = sub_2605C4BCC();
      *(_OWORD *)(v18 + 16) = xmmword_2605E3700;
      *(void *)(v18 + 56) = v2;
      *(void *)(v18 + 32) = 0xD000000000000031;
      *(void *)(v18 + 40) = 0x80000002605E55D0;
      sub_2605C4B94();
      swift_bridgeObjectRelease();
LABEL_19:
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v19 = sub_2605C4BCC();
      *(_OWORD *)(v19 + 16) = xmmword_2605E3700;
      sub_2605E2D70();
      sub_2605D6934();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      sub_2605D6934();
      *(void *)(v19 + 56) = v2;
      *(void *)(v19 + 32) = 0;
      *(void *)(v19 + 40) = 0xE000000000000000;
      sub_2605C4B94();
LABEL_20:
      unint64_t v20 = (void *)v0[8];
      swift_bridgeObjectRelease();
      void *v20 = v0[5];
      sub_2605D682C();
      sub_2605D6958();
      __asm { BRAA            X1, X16 }
    }
  }
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v4 = sub_2605C4BCC();
  *(_OWORD *)(v4 + 16) = xmmword_2605E3700;
  *(void *)(v4 + 56) = v2;
  *(void *)(v4 + 32) = 0xD000000000000035;
  *(void *)(v4 + 40) = 0x80000002605E5610;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  goto LABEL_9;
}

uint64_t sub_2605CFD40()
{
  sub_2605D6B0C();
  BOOL v1 = (void *)v0[18];
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v2 = (__n128 *)sub_2605C4BCC();
  sub_2605D6A4C(v2, (__n128)xmmword_2605E3700);
  uint64_t v3 = sub_2605E2F70();
  v2[3].n128_u64[1] = MEMORY[0x263F8D310];
  v2[2].n128_u64[0] = v3;
  v2[2].n128_u64[1] = v4;
  sub_2605C4B94();

  uint64_t v5 = (void *)v0[8];
  swift_bridgeObjectRelease();
  *uint64_t v5 = v0[5];
  sub_2605D682C();
  return v6();
}

uint64_t CaptureDeviceContextState.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CaptureDeviceContextState.__deallocating_deinit()
{
  CaptureDeviceContextState.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2605CFE60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v64 = sub_2605E25B0();
  uint64_t v4 = *(void *)(v64 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v64);
  BOOL v63 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v62 = (char *)&v52 - v7;
  uint64_t v8 = sub_2605E2590();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2605E25A0();
  uint64_t v12 = sub_2605E2580();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2605E2530();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v23 = sub_2605E2540();
  uint64_t v24 = *(void *)(v23 + 16);
  if (v24)
  {
    uint64_t v53 = v14;
    uint64_t v54 = v12;
    uint64_t v56 = a1;
    uint64_t v57 = a2;
    uint64_t v55 = v4;
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    uint64_t v25 = v4 + 16;
    uint64_t v60 = v26;
    unint64_t v27 = (*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64);
    uint64_t v52 = v23;
    unint64_t v28 = v23 + v27;
    uint64_t v59 = *(void *)(v25 + 56);
    uint64_t v61 = v25;
    uint64_t v58 = (void (**)(char *, uint64_t))(v25 - 8);
    uint64_t v70 = MEMORY[0x263F8EE78];
    do
    {
      id v29 = v62;
      uint64_t v30 = v64;
      uint64_t v31 = v60;
      v60(v62, (char *)v28, v64);
      uint64_t v32 = v63;
      v31(v63, v29, v30);
      sub_2605CFE60(v71, v32);
      uint64_t v33 = v71[0];
      uint64_t v34 = v71[1];
      uint64_t v35 = v71[2];
      uint64_t v36 = v71[3];
      uint64_t v37 = v71[4];
      uint64_t v38 = v71[5];
      uint64_t v65 = v71[6];
      uint64_t v69 = v71[7];
      uint64_t v68 = v71[8];
      uint64_t v67 = v71[9];
      uint64_t v66 = v71[10];
      (*v58)(v29, v30);
      sub_2605D6138((uint64_t)v71, (uint64_t)v72, &qword_26A88C1B0);
      if (v73 != 1)
      {
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v39 = v70;
        }
        else
        {
          sub_2605C2DA0(0, *(void *)(v70 + 16) + 1, 1, v70);
          uint64_t v39 = v45;
        }
        unint64_t v41 = *(void *)(v39 + 16);
        unint64_t v40 = *(void *)(v39 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_2605C2DA0(v40 > 1, v41 + 1, 1, v39);
          uint64_t v39 = v46;
        }
        *(void *)(v39 + 16) = v41 + 1;
        uint64_t v70 = v39;
        uint64_t v42 = v39 + 88 * v41;
        *(void *)(v42 + 32) = v33;
        *(void *)(v42 + 40) = v34;
        *(void *)(v42 + 48) = v35;
        *(void *)(v42 + 56) = v36;
        *(void *)(v42 + 64) = v37;
        *(void *)(v42 + 72) = v38;
        *(unsigned char *)(v42 + 80) = v65 & 1;
        uint64_t v43 = v68;
        *(void *)(v42 + 88) = v69;
        *(void *)(v42 + 96) = v43;
        uint64_t v44 = v66;
        *(void *)(v42 + 104) = v67;
        *(void *)(v42 + 112) = v44;
      }
      v28 += v59;
      --v24;
    }
    while (v24);
    swift_bridgeObjectRelease();
    a2 = v57;
    a1 = v56;
    uint64_t v4 = v55;
    uint64_t v12 = v54;
    uint64_t v14 = v53;
    uint64_t v47 = v70;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v47 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v48 = sub_2605E2570();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v49 = sub_2605E2550();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_2605E2560();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v12;
  a2[1] = v14;
  a2[2] = v16;
  a2[3] = v18;
  a2[4] = v20;
  a2[5] = v22;
  a2[6] = 0;
  a2[7] = v47;
  a2[8] = v48;
  a2[9] = v49;
  a2[10] = v50;
  return result;
}

uint64_t sub_2605D038C(uint64_t a1)
{
  uint64_t v2 = sub_2605E25F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v43 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v42 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v42 - v9;
  uint64_t v44 = a1;
  uint64_t result = sub_2605E27D0();
  int64_t v12 = 0;
  uint64_t v13 = *(void *)(result + 56);
  uint64_t v51 = result + 56;
  uint64_t v14 = 1 << *(unsigned char *)(result + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  uint64_t v54 = result;
  uint64_t v55 = v3 + 16;
  int64_t v52 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v53 = v3 + 32;
  uint64_t v17 = (uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t v50 = MEMORY[0x263F8EE78];
  while (v16)
  {
    unint64_t v18 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v19 = v18 | (v12 << 6);
LABEL_20:
    uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v23(v10, *(void *)(v54 + 48) + *(void *)(v3 + 72) * v19, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v10, v2);
    sub_2605E25D0();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    if (v25)
    {
      uint64_t v49 = sub_2605E27E0();
      uint64_t v26 = v43;
      v23(v43, (unint64_t)v8, v2);
      uint64_t v27 = sub_2605E25D0();
      if (v28) {
        uint64_t v29 = v27;
      }
      else {
        uint64_t v29 = 0;
      }
      unint64_t v30 = 0xE000000000000000;
      if (v28) {
        unint64_t v30 = v28;
      }
      unint64_t v47 = v30;
      uint64_t v48 = v29;
      uint64_t v46 = sub_2605E25E0();
      uint64_t v45 = sub_2605E25C0();
      uint64_t v31 = v26;
      uint64_t v32 = *v17;
      (*v17)(v31, v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605C2CF4(0, *(void *)(v50 + 16) + 1, 1, v50);
        uint64_t v50 = v40;
      }
      unint64_t v34 = *(void *)(v50 + 16);
      unint64_t v33 = *(void *)(v50 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2605C2CF4(v33 > 1, v34 + 1, 1, v50);
        uint64_t v50 = v41;
      }
      uint64_t v35 = (int)v46;
      uint64_t v36 = (int)v45;
      uint64_t v37 = v50;
      *(void *)(v50 + 16) = v34 + 1;
      uint64_t v38 = (void *)(v37 + 40 * v34);
      v38[4] = v35;
      v38[5] = v36;
      unint64_t v39 = v47;
      v38[6] = v48;
      v38[7] = v39;
      v38[8] = v49;
      uint64_t result = v32(v8, v2);
    }
    else
    {
      uint64_t result = (*v17)(v8, v2);
    }
  }
  int64_t v20 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v20 >= v52) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v51 + 8 * v20);
  ++v12;
  if (v21) {
    goto LABEL_19;
  }
  int64_t v12 = v20 + 1;
  if (v20 + 1 >= v52) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v51 + 8 * v12);
  if (v21) {
    goto LABEL_19;
  }
  int64_t v12 = v20 + 2;
  if (v20 + 2 >= v52) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v51 + 8 * v12);
  if (v21)
  {
LABEL_19:
    unint64_t v16 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v12 << 6);
    goto LABEL_20;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v52)
  {
LABEL_32:
    swift_release();
    return v50;
  }
  unint64_t v21 = *(void *)(v51 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v52) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v51 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_19;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

BOOL sub_2605D0778(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2605D0788()
{
  return sub_2605E2FB0();
}

uint64_t sub_2605D07B0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73746F6F72 && a2 == 0xE500000000000000;
  if (v3 || (sub_2605E2F40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73646E616D6D6F63 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_2605E2F40();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2605D0890()
{
  return 2;
}

uint64_t sub_2605D0898()
{
  return sub_2605E2FC0();
}

uint64_t sub_2605D08E0()
{
  return 0;
}

uint64_t sub_2605D08EC(char a1)
{
  if (a1) {
    return 0x73646E616D6D6F63;
  }
  else {
    return 0x73746F6F72;
  }
}

BOOL sub_2605D0920(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2605D0778(*a1, *a2);
}

uint64_t sub_2605D092C()
{
  return sub_2605D0898();
}

uint64_t sub_2605D0934()
{
  return sub_2605D0788();
}

uint64_t sub_2605D093C()
{
  return sub_2605D08EC(*v0);
}

uint64_t sub_2605D0944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2605D07B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2605D096C()
{
  return sub_2605D08E0();
}

uint64_t sub_2605D098C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2605D0890();
  *a1 = result;
  return result;
}

uint64_t sub_2605D09B4(uint64_t a1)
{
  unint64_t v2 = sub_2605D5290();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605D09F0(uint64_t a1)
{
  unint64_t v2 = sub_2605D5290();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2605D0A2C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_2605BBCB8(&qword_26A88C150);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2605BBC24(a1, a1[3]);
  sub_2605D5290();
  sub_2605E2FE0();
  uint64_t v14 = a2;
  char v13 = 0;
  sub_2605BBCB8(&qword_26A88C120);
  sub_2605D5328((uint64_t)&unk_26A88C158);
  sub_2605E2F00();
  if (!v3)
  {
    uint64_t v14 = a3;
    char v13 = 1;
    sub_2605BBCB8(&qword_26A88C138);
    sub_2605D5328((uint64_t)&unk_26A88C168);
    sub_2605E2F00();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2605D0C48(void *a1)
{
  uint64_t v3 = sub_2605BBCB8(&qword_26A88C110);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_2605BBC24(a1, v7);
  sub_2605D5290();
  sub_2605E2FD0();
  if (v1)
  {
    sub_2605BBC68((uint64_t)a1);
  }
  else
  {
    sub_2605BBCB8(&qword_26A88C120);
    HIBYTE(v9) = 0;
    sub_2605D5328((uint64_t)&unk_26A88C128);
    sub_2605E2EB0();
    uint64_t v7 = v10;
    sub_2605BBCB8(&qword_26A88C138);
    HIBYTE(v9) = 1;
    sub_2605D5328((uint64_t)&unk_26A88C140);
    swift_bridgeObjectRetain();
    sub_2605E2EB0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    sub_2605BBC68((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_2605D0EE0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2605D0C48(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_2605D0F0C(void *a1)
{
  return sub_2605D0A2C(a1, *v1, v1[1]);
}

BOOL sub_2605D0F28(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2605D0F38()
{
  return sub_2605E2FB0();
}

uint64_t sub_2605D0F60(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000;
  if (v3 || (sub_2605E2F40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x676E69646E756F62 && a2 == 0xEB00000000786F42;
    if (v6 || (sub_2605E2F40() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x656D656C45627573 && a2 == 0xEB0000000073746ELL;
      if (v7 || (sub_2605E2F40() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x80000002605E58B0 || (sub_2605E2F40() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x79546D6F74737563 && a2 == 0xEF73656D614E6570;
        if (v8 || (sub_2605E2F40() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000019 && a2 == 0x80000002605E58D0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v9 = sub_2605E2F40();
          swift_bridgeObjectRelease();
          if (v9) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_2605D11E4()
{
  return 6;
}

unint64_t sub_2605D11EC(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x676E69646E756F62;
      break;
    case 2:
      unint64_t result = 0x656D656C45627573;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x79546D6F74737563;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      unint64_t result = 0x746E65746E6F63;
      break;
  }
  return result;
}

uint64_t sub_2605D12D8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_2605BBCB8(&qword_26A88C218);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2605BBC24(a1, a1[3]);
  sub_2605D6010();
  sub_2605E2FE0();
  v12[0] = 0;
  sub_2605E2EC0();
  if (!v2)
  {
    sub_2605D6138(v3 + 16, (uint64_t)v17, &qword_26A88C220);
    sub_2605D6138((uint64_t)v17, (uint64_t)v12, &qword_26A88C220);
    char v11 = 1;
    type metadata accessor for CGRect(0);
    sub_2605D61F8((uint64_t)&unk_26A88C228);
    sub_2605E2ED0();
    sub_2605D6138(v3 + 56, (uint64_t)v16, &qword_26A88C230);
    sub_2605D6138((uint64_t)v16, (uint64_t)v12, &qword_26A88C230);
    char v11 = 2;
    sub_2605BBCB8(&qword_26A88C120);
    sub_2605D5328((uint64_t)&unk_26A88C158);
    sub_2605E2ED0();
    sub_2605D6138(v3 + 64, (uint64_t)v15, &qword_26A88C238);
    sub_2605D6138((uint64_t)v15, (uint64_t)v12, &qword_26A88C238);
    char v11 = 3;
    sub_2605BBCB8(&qword_26A88BDA8);
    sub_2605D6198((uint64_t)&unk_26A88C240);
    sub_2605E2ED0();
    sub_2605D6138(v3 + 72, (uint64_t)v14, &qword_26A88C238);
    sub_2605D6138((uint64_t)v14, (uint64_t)v12, &qword_26A88C238);
    char v11 = 4;
    sub_2605E2ED0();
    sub_2605D6138(v3 + 80, (uint64_t)v13, &qword_26A88C238);
    sub_2605D6138((uint64_t)v13, (uint64_t)v12, &qword_26A88C238);
    char v11 = 5;
    sub_2605E2ED0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2605D1690@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_2605BBCB8(&qword_26A88C1D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2605BBC24(a1, a1[3]);
  sub_2605D6010();
  sub_2605E2FD0();
  if (v2)
  {
    sub_2605BBC68((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v30) = 0;
    uint64_t v9 = sub_2605E2E70();
    uint64_t v11 = v10;
    type metadata accessor for CGRect(0);
    char v36 = 1;
    sub_2605D61F8((uint64_t)&unk_26A88C1E0);
    swift_bridgeObjectRetain();
    sub_2605E2E80();
    uint64_t v28 = v30;
    uint64_t v29 = v9;
    uint64_t v26 = v32;
    uint64_t v27 = v31;
    uint64_t v25 = v33;
    int v35 = v34;
    sub_2605BBCB8(&qword_26A88C120);
    char v36 = 2;
    sub_2605D5328((uint64_t)&unk_26A88C128);
    sub_2605E2E80();
    uint64_t v24 = v6;
    uint64_t v12 = v30;
    sub_2605BBCB8(&qword_26A88BDA8);
    char v36 = 3;
    unint64_t v13 = sub_2605D6198((uint64_t)&unk_26A88C1E8);
    swift_bridgeObjectRetain();
    unint64_t v23 = v13;
    sub_2605E2E80();
    int64_t v22 = a2;
    uint64_t v14 = v30;
    char v36 = 4;
    swift_bridgeObjectRetain();
    sub_2605E2E80();
    uint64_t v15 = v30;
    char v36 = 5;
    swift_bridgeObjectRetain();
    sub_2605E2E80();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v5);
    uint64_t v16 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2605BBC68((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v18 = v22;
    *int64_t v22 = v29;
    v18[1] = v11;
    uint64_t v19 = v27;
    v18[2] = v28;
    void v18[3] = v19;
    uint64_t v20 = v25;
    v18[4] = v26;
    v18[5] = v20;
    *((unsigned char *)v18 + 48) = v35;
    v18[7] = v12;
    v18[8] = v14;
    v18[9] = v15;
    v18[10] = v16;
  }
  return result;
}

BOOL sub_2605D1BB4(char *a1, char *a2)
{
  return sub_2605D0F28(*a1, *a2);
}

uint64_t sub_2605D1BC0()
{
  return sub_2605D1EF4();
}

uint64_t sub_2605D1BDC()
{
  return sub_2605D0F38();
}

unint64_t sub_2605D1BE8()
{
  return sub_2605D11EC(*v0);
}

uint64_t sub_2605D1BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2605D0F60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2605D1C18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2605D11E4();
  *a1 = result;
  return result;
}

uint64_t sub_2605D1C40(uint64_t a1)
{
  unint64_t v2 = sub_2605D6010();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605D1C7C(uint64_t a1)
{
  unint64_t v2 = sub_2605D6010();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_2605D1CB8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (void *)sub_2605D1690(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x58uLL);
  }
  return result;
}

uint64_t sub_2605D1D04(void *a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_2605D12D8(a1);
}

uint64_t sub_2605D1D58(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 6580592 && a2 == 0xE300000000000000;
  if (v3 || (sub_2605E2F40() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6973726556646970 && a2 == 0xEA00000000006E6FLL;
    if (v6 || (sub_2605E2F40() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000002605E58F0 || (sub_2605E2F40() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000014 && a2 == 0x80000002605E5910)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v7 = sub_2605E2F40();
      swift_bridgeObjectRelease();
      if (v7) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_2605D1EEC()
{
  return 4;
}

uint64_t sub_2605D1EF4()
{
  return sub_2605E2FC0();
}

unint64_t sub_2605D1F3C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6973726556646970;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 6580592;
      break;
  }
  return result;
}

uint64_t sub_2605D1FD0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_2605BBCB8(&qword_26A88C248);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2605BBC24(a1, a1[3]);
  sub_2605D605C();
  sub_2605E2FE0();
  char v14 = 0;
  sub_2605E2EF0();
  if (!v2)
  {
    char v13 = 1;
    sub_2605E2EF0();
    char v12 = 2;
    sub_2605E2EE0();
    uint64_t v11 = *(void *)(v3 + 32);
    v10[15] = 3;
    sub_2605BBCB8(&qword_26A88C200);
    sub_2605D60A8((uint64_t)&unk_26A88C250);
    sub_2605E2F00();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2605D21DC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_2605BBCB8(&qword_26A88C1F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2605BBC24(a1, a1[3]);
  sub_2605D605C();
  sub_2605E2FD0();
  if (v2) {
    return sub_2605BBC68((uint64_t)a1);
  }
  char v23 = 0;
  uint64_t v9 = sub_2605E2EA0();
  char v22 = 1;
  uint64_t v18 = sub_2605E2EA0();
  char v21 = 2;
  uint64_t v10 = sub_2605E2E90();
  uint64_t v12 = v11;
  uint64_t v17 = v10;
  sub_2605BBCB8(&qword_26A88C200);
  char v20 = 3;
  sub_2605D60A8((uint64_t)&unk_26A88C208);
  swift_bridgeObjectRetain();
  sub_2605E2EB0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v19;
  swift_bridgeObjectRetain();
  sub_2605BBC68((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = v18;
  *a2 = v9;
  a2[1] = v15;
  a2[2] = v17;
  a2[3] = v12;
  a2[4] = v13;
  return result;
}

unint64_t sub_2605D24A0()
{
  return sub_2605D1F3C(*v0);
}

uint64_t sub_2605D24A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2605D1D58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2605D24D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2605D1EEC();
  *a1 = result;
  return result;
}

uint64_t sub_2605D24F8(uint64_t a1)
{
  unint64_t v2 = sub_2605D605C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2605D2534(uint64_t a1)
{
  unint64_t v2 = sub_2605D605C();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_2605D2570@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2605D21DC(a1, (uint64_t *)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_2605D25B8(void *a1)
{
  return sub_2605D1FD0(a1);
}

uint64_t sub_2605D25F4(uint64_t a1, uint64_t a2, char a3)
{
  sub_2605D2BB0(a3);
  swift_bridgeObjectRetain();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  sub_2605E2A50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605D2694()
{
  uint64_t v0 = sub_2605BBCB8(&qword_26A88C178);
  MEMORY[0x270FA5388](v0 - 8);
  sub_2605C64F8();
  uint64_t v3 = v2 - v1;
  uint64_t v13 = 0;
  unint64_t v14 = 0xE000000000000000;
  sub_2605E2D70();
  sub_2605D68B4();
  sub_2605D67E8();
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_2605E2760();
  uint64_t v4 = sub_2605E2630();
  if (sub_2605C3DF8(v3, 1, v4) == 1)
  {
    sub_2605D54B0(v3);
  }
  else
  {
    sub_2605E2620();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605D69A4();
  swift_bridgeObjectRetain();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  sub_2605D6708();
  sub_2605D6780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605D6910();
  sub_2605D68B4();
  sub_2605D67E8();
  sub_2605E2750();
  sub_2605E2C30();
  sub_2605D6ACC();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  sub_2605D6708();
  sub_2605D6780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605D6910();
  sub_2605D69D4();
  sub_2605D67E8();
  sub_2605E2730();
  sub_2605E2C30();
  sub_2605D6ACC();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  sub_2605D6708();
  sub_2605D6780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605D6910();
  sub_2605D68B4();
  sub_2605D67E8();
  sub_2605E2740();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  sub_2605D6708();
  sub_2605D6780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605D6910();
  sub_2605D69D4();
  sub_2605D67E8();
  sub_2605E2720();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605D69A4();
  swift_bridgeObjectRetain();
  sub_2605D6854();
  swift_bridgeObjectRelease();
  sub_2605D6708();
  sub_2605D6780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2605D6910();
  sub_2605D68B4();
  sub_2605D67E8();
  sub_2605E2770();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605D25F4(0, 0xE000000000000000, 4);
  swift_bridgeObjectRelease();
  uint64_t v13 = 538976288;
  unint64_t v14 = 0xE400000000000000;
  sub_2605E2A50();
  v10[1] = 0xE500000000000000;
  uint64_t v11 = 10;
  unint64_t v12 = 0xE100000000000000;
  v10[0] = 0x202020200ALL;
  sub_2605C4948();
  sub_2605D67B8((uint64_t)&v11, (uint64_t)v10, v5, v6, v7, v8, MEMORY[0x263F8D310]);
  sub_2605D6AEC();
  swift_bridgeObjectRelease();
  uint64_t v13 = 2683;
  unint64_t v14 = 0xE200000000000000;
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  return v13;
}

uint64_t String.blockIndented.getter()
{
  v9[2] = 538976288;
  v9[3] = 0xE400000000000000;
  sub_2605E2A50();
  v9[0] = 10;
  v9[1] = 0xE100000000000000;
  sub_2605D6A98();
  v8[0] = v0;
  v8[1] = v1;
  sub_2605C4948();
  uint64_t v6 = sub_2605D67B8((uint64_t)v9, (uint64_t)v8, v2, v3, v4, v5, MEMORY[0x263F8D310]);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2605D2BB0(char a1)
{
  return *(void *)&a030m[8 * a1];
}

void sub_2605D2BD4()
{
  qword_26A88C7C0 = 95;
  *(void *)algn_26A88C7C8 = 0xE100000000000000;
}

unint64_t sub_2605D2BEC(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_2605E3010();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2605E2280();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v62 - v15;
  sub_2605E2A10();
  sub_2605C2E4C();
  uint64_t v71 = v17;
  uint64_t v67 = a2;
  unint64_t v68 = a3;
  sub_2605E2250();
  sub_2605C4948();
  uint64_t v18 = sub_2605E2CF0();
  unint64_t v20 = v19;
  char v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v65 = v11 + 8;
  uint64_t v66 = v10;
  uint64_t v64 = v21;
  v21(v16, v10);
  uint64_t v22 = HIBYTE(v20) & 0xF;
  uint64_t v67 = v18;
  unint64_t v68 = v20;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v22 = v18 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v69 = 0;
  uint64_t v70 = v22;
  swift_beginAccess();
  uint64_t v23 = sub_2605E2A60();
  if (!v24)
  {
LABEL_54:
    swift_bridgeObjectRelease();
    uint64_t v58 = sub_2605D3468(v71);
    uint64_t v59 = v57;
    if (qword_26A88BD10 == -1)
    {
      if (!v57) {
        goto LABEL_64;
      }
    }
    else
    {
      swift_once();
      if (!v59) {
        goto LABEL_64;
      }
    }
    if (v58 == qword_26A88C7C0 && v59 == *(void *)algn_26A88C7C8)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v61 = sub_2605E2F40();
      swift_bridgeObjectRelease();
      if ((v61 & 1) == 0) {
        goto LABEL_64;
      }
    }
    swift_beginAccess();
    sub_2605D34B0();
    swift_endAccess();
    swift_bridgeObjectRelease();
LABEL_64:
    uint64_t v67 = v71;
    sub_2605BBCB8(&qword_26A88C198);
    sub_2605D5510((uint64_t)&unk_26A88C1A0);
    return sub_2605E2AF0();
  }
  unint64_t v25 = v23;
  unint64_t v26 = v24;
  int v27 = 0;
  uint64_t v28 = (void (**)(char *, uint64_t))(v7 + 8);
  while (1)
  {
    if (a1)
    {
      sub_2605E2240();
      swift_bridgeObjectRetain();
      unint64_t v29 = sub_2605CC29C(v25, v26);
      swift_bridgeObjectRelease();
      if ((v29 & 0x100000000) != 0) {
        int v30 = 0;
      }
      else {
        int v30 = sub_2605E2260();
      }
      v64(v14, v66);
    }
    else
    {
      int v30 = 0;
    }
    if (sub_2605E28F0() & 1) != 0 || ((sub_2605E2900() | v30))
    {
      if ((sub_2605E28E0() & 1) == 0) {
        goto LABEL_16;
      }
      unint64_t result = sub_2605CC29C(v25, v26);
      if ((result & 0x100000000) != 0) {
        goto LABEL_68;
      }
      sub_2605E3020();
      char v32 = sub_2605E2FF0();
      (*v28)(v9, v6);
      if ((v32 & 1) == 0)
      {
LABEL_16:
        if ((sub_2605E28D0() & 1) == 0) {
          goto LABEL_25;
        }
        if ((sub_2605E28E0() & 1) == 0) {
          goto LABEL_20;
        }
        unint64_t result = sub_2605CC29C(v25, v26);
        if ((result & 0x100000000) != 0) {
          goto LABEL_70;
        }
        sub_2605E3020();
        char v33 = sub_2605E3000();
        (*v28)(v9, v6);
        if ((v33 & 1) == 0)
        {
LABEL_20:
          if (sub_2605E28D0())
          {
            if ((sub_2605E28C0() | v27)) {
              goto LABEL_25;
            }
            goto LABEL_24;
          }
        }
      }
      if ((v27 & 1) == 0) {
LABEL_24:
      }
        sub_2605D3338(&v71);
LABEL_25:
      uint64_t v34 = sub_2605E28B0();
      unint64_t v36 = v35;
      swift_beginAccess();
      sub_2605BB3A4(v34, v36);
LABEL_26:
      swift_endAccess();
      goto LABEL_27;
    }
    uint64_t v41 = *(void *)(v71 + 16);
    if (v41)
    {
      uint64_t v42 = v71 + 16 * v41;
      uint64_t v44 = *(void *)(v42 + 16);
      uint64_t v43 = *(void *)(v42 + 24);
      uint64_t v45 = qword_26A88BD10;
      swift_bridgeObjectRetain();
      if (v45 != -1) {
        swift_once();
      }
      if (v44 == qword_26A88C7C0 && v43 == *(void *)algn_26A88C7C8)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v47 = sub_2605E2F40();
        swift_bridgeObjectRelease();
        if ((v47 & 1) == 0)
        {
          uint64_t v49 = qword_26A88C7C0;
          uint64_t v48 = *(void *)algn_26A88C7C8;
          swift_beginAccess();
          uint64_t v50 = v71;
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v62 = v49;
          uint64_t v63 = v48;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2605C2E4C();
            uint64_t v50 = v55;
          }
          unint64_t v52 = *(void *)(v50 + 16);
          if (v52 >= *(void *)(v50 + 24) >> 1)
          {
            sub_2605C2E4C();
            uint64_t v50 = v56;
          }
          *(void *)(v50 + 16) = v52 + 1;
          uint64_t v53 = v50 + 16 * v52;
          uint64_t v54 = v63;
          *(void *)(v53 + 32) = v62;
          *(void *)(v53 + 40) = v54;
          uint64_t v71 = v50;
          goto LABEL_26;
        }
      }
    }
LABEL_27:
    if ((sub_2605E28E0() & 1) == 0) {
      goto LABEL_30;
    }
    unint64_t result = sub_2605CC29C(v25, v26);
    if ((result & 0x100000000) != 0) {
      break;
    }
    sub_2605E3020();
    char v37 = sub_2605E2FF0();
    (*v28)(v9, v6);
    if (v37) {
      goto LABEL_36;
    }
LABEL_30:
    if ((sub_2605E28D0() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      int v27 = 0;
      goto LABEL_38;
    }
    if (sub_2605E28E0())
    {
      unint64_t result = sub_2605CC29C(v25, v26);
      if ((result & 0x100000000) != 0) {
        goto LABEL_69;
      }
      sub_2605E3020();
      char v38 = sub_2605E3000();
      (*v28)(v9, v6);
      if (v38) {
        goto LABEL_36;
      }
    }
    if ((sub_2605E28D0() & 1) == 0)
    {
LABEL_36:
      swift_bridgeObjectRelease();
      int v27 = 1;
      goto LABEL_38;
    }
    int v39 = sub_2605E28C0();
    swift_bridgeObjectRelease();
    int v27 = v39 ^ 1;
LABEL_38:
    unint64_t v25 = sub_2605E2A60();
    unint64_t v26 = v40;
    if (!v40) {
      goto LABEL_54;
    }
  }
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
  return result;
}

uint64_t sub_2605D3338(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t result = *a1;
  if (*(void *)(*a1 + 16))
  {
    uint64_t v3 = sub_2605D3468(result);
    uint64_t v5 = v4;
    if (qword_26A88BD10 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_26A88C7C0;
    uint64_t v7 = *(void *)algn_26A88C7C8;
    if (!v5)
    {
LABEL_11:
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_2605C2A9C();
      uint64_t v10 = *(void *)(*a1 + 16);
      sub_2605C2B64(v10);
      uint64_t v11 = *a1;
      *(void *)(v11 + 16) = v10 + 1;
      uint64_t v12 = v11 + 16 * v10;
      *(void *)(v12 + 32) = v6;
      *(void *)(v12 + 40) = v7;
      return swift_endAccess();
    }
    if (v3 != qword_26A88C7C0 || v5 != *(void *)algn_26A88C7C8)
    {
      char v9 = sub_2605E2F40();
      uint64_t result = swift_bridgeObjectRelease();
      if (v9) {
        return result;
      }
      uint64_t v6 = qword_26A88C7C0;
      uint64_t v7 = *(void *)algn_26A88C7C8;
      goto LABEL_11;
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2605D3468(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

void sub_2605D34B0()
{
  if (*(void *)(*(void *)v0 + 16))
  {
    sub_2605D5808();
    if (!v1) {
      sub_2605D577C(*(void *)(*(void *)v0 + 16) - 1);
    }
  }
  else
  {
    __break(1u);
  }
}

unint64_t String.toLowerSnakeCase.getter(uint64_t a1, unint64_t a2)
{
  return sub_2605D2BEC(0, a1, a2);
}

unint64_t String.toLowerSnakeCaseRetainSymbols.getter(uint64_t a1, unint64_t a2)
{
  return sub_2605D2BEC(1, a1, a2);
}

unint64_t String.toTitleCase.getter()
{
  uint64_t v1 = sub_2605E2370();
  sub_2605C4B78();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_2605C64F8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_2605E2280();
  sub_2605C4B78();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_2605C6530();
  sub_2605E2250();
  sub_2605C4948();
  sub_2605E2CF0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v8);
  sub_2605E2520();
  sub_2605D3CE0();
  sub_2605D61F8((uint64_t)&unk_26A88C0F0);
  uint64_t v12 = sub_2605E2910();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v37 = MEMORY[0x263F8EE78];
    sub_2605D4D88(0, v13, 0);
    uint64_t v14 = v37;
    uint64_t v15 = v12 + 56;
    while (1)
    {
      uint64_t v36 = v14;
      unint64_t v16 = *(void *)(v15 - 24);
      unint64_t v17 = *(void *)(v15 - 16);
      swift_bridgeObjectRetain_n();
      unint64_t result = sub_2605D6800();
      unint64_t v20 = (v19 & 1) != 0 ? v17 : result;
      if (v20 >> 14 < v16 >> 14) {
        break;
      }
      sub_2605D6A2C(v16, v20);
      swift_bridgeObjectRelease();
      uint64_t v21 = sub_2605D6A08();
      MEMORY[0x261215A90](v21);
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_2605E2CE0();
      uint64_t v24 = v23;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t result = sub_2605D6800();
      if (v25) {
        unint64_t result = v17;
      }
      if (v17 >> 14 < result >> 14) {
        goto LABEL_15;
      }
      uint64_t v26 = sub_2605D6A2C(result, v17);
      uint64_t v28 = v27;
      uint64_t v30 = v29;
      uint64_t v32 = v31;
      swift_bridgeObjectRelease();
      MEMORY[0x261215A90](v26, v28, v30, v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = v36;
      unint64_t v34 = *(void *)(v36 + 16);
      unint64_t v33 = *(void *)(v36 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2605D4D88(v33 > 1, v34 + 1, 1);
        uint64_t v14 = v36;
      }
      *(void *)(v14 + 16) = v34 + 1;
      uint64_t v35 = v14 + 16 * v34;
      *(void *)(v35 + 32) = v22;
      *(void *)(v35 + 40) = v24;
      v15 += 32;
      if (!--v13) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    sub_2605BBCB8(&qword_26A88BDA8);
    sub_2605D5510((uint64_t)&unk_26A88C0F8);
    sub_2605E2920();
    swift_bridgeObjectRelease();
    return sub_2605D6AAC();
  }
  return result;
}

uint64_t sub_2605D3908(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2605E2A20();
    uint64_t v1 = sub_2605E2B10();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t String.quoted.getter()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_2605E2A60();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      BOOL v4 = v2 == 34 && v3 == 0xE100000000000000;
      if (v4 || (sub_2605E2F40() & 1) != 0) {
        sub_2605E2A50();
      }
      MEMORY[0x261215B10](v2, v3);
      swift_bridgeObjectRelease();
      uint64_t v2 = sub_2605E2A60();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  return 34;
}

uint64_t String.indented.getter()
{
  return 538976288;
}

Swift::String __swiftcall String.truncateForPrompting(allowedLength:)(Swift::Int allowedLength)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  Swift::Int v6 = sub_2605E2A10();
  swift_bridgeObjectRetain();
  if (v6 > allowedLength)
  {
    uint64_t v7 = sub_2605D3908(allowedLength);
    uint64_t v20 = MEMORY[0x261215A90](v7);
    uint64_t v21 = v8;
    sub_2605E2A30();
    uint64_t v9 = MEMORY[0x261215D40](v20, v21);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x261215A90](v9, v11, v13, v15);
    uint64_t v3 = v16;
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = v4;
  uint64_t v18 = v3;
  result._unint64_t object = v18;
  result._uint64_t countAndFlagsBits = v17;
  return result;
}

uint64_t type metadata accessor for CaptureDeviceContextState()
{
  return self;
}

uint64_t sub_2605D3C08(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2605D3C1C(a1, a2);
  }
  return a1;
}

uint64_t sub_2605D3C1C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2605D3C74(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2605D3C88(a1, a2);
  }
  return a1;
}

uint64_t sub_2605D3C88(uint64_t a1, unint64_t a2)
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

unint64_t sub_2605D3CE0()
{
  unint64_t result = qword_26A88C0E8;
  if (!qword_26A88C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C0E8);
  }
  return result;
}

uint64_t sub_2605D3D2C(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void sub_2605D3D48()
{
}

void sub_2605D3D5C()
{
}

uint64_t sub_2605D3D70(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2605E26F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_2605D61F8((uint64_t)&unk_26A88C180);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_2605E28A0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
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
      sub_2605D61F8((uint64_t)&unk_26A88C188);
      char v21 = sub_2605E2930();
      uint64_t v22 = *v17;
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
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_2605D448C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_2605D4094()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_2605E26F0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_2605BBCB8(&qword_26A88C190);
  uint64_t v5 = sub_2605E2D30();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    int64_t v40 = v13;
    for (unint64_t i = v16 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v39 + 72);
      char v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v14, v23 + v24 * i, v15);
      uint64_t v6 = v38;
      sub_2605D61F8((uint64_t)&unk_26A88C180);
      uint64_t result = sub_2605E28A0();
      uint64_t v26 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v6 + 48) + v29 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v22;
      int64_t v13 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v36) {
        goto LABEL_32;
      }
      unint64_t v19 = v37[v18];
      int64_t v20 = v13 + 1;
      if (!v19)
      {
        int64_t v20 = v13 + 2;
        if (v13 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          int64_t v20 = v13 + 3;
          if (v13 + 3 >= v36) {
            goto LABEL_32;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v13 + 4;
            if (v13 + 4 >= v36)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v35;
              uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
              if (v34 > 63) {
                sub_2605D3D2C(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *uint64_t v37 = -1 << v34;
              }
              *(void *)(v4 + 16) = 0;
              break;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                int64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_39;
                }
                if (v20 >= v36) {
                  goto LABEL_32;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v13 + 4;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v19 - 1) & v19;
      int64_t v40 = v20;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_2605D448C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_2605E26F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2605D4094();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2605D472C();
      goto LABEL_12;
    }
    sub_2605D49DC();
  }
  uint64_t v12 = *v3;
  sub_2605D61F8((uint64_t)&unk_26A88C180);
  uint64_t v13 = sub_2605E28A0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_2605D61F8((uint64_t)&unk_26A88C188);
      char v21 = sub_2605E2930();
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
  uint64_t result = sub_2605E2F50();
  __break(1u);
  return result;
}

void *sub_2605D472C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2605E26F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2605BBCB8(&qword_26A88C190);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_2605E2D20();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, v25, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v12 << 6))
  {
    unint64_t v22 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v22, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v22, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v25 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v25 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v16 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v26)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v25 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v12);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2605D49DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2605E26F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_2605BBCB8(&qword_26A88C190);
  uint64_t v7 = sub_2605E2D30();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_2605D61F8((uint64_t)&unk_26A88C180);
    uint64_t result = sub_2605E28A0();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_36;
    }
    if (v19 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v36)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_2605D4D88(char a1, uint64_t a2, char a3)
{
  sub_2605DACA0(a1, a2, a3, *v3);
  uint64_t *v3 = v4;
}

ValueMetadata *type metadata accessor for deviceContextState()
{
  return &type metadata for deviceContextState;
}

uint64_t method lookup function for CaptureDeviceContextState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CaptureDeviceContextState);
}

uint64_t dispatch thunk of CaptureDeviceContextState.__allocating_init(dumpDirectoryName:isRecordUX:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of CaptureDeviceContextState.captureSnapshot(index:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 200)
                                                          + **(int **)(*(void *)v3 + 200));
  uint64_t v7 = a3 & 1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2605D66C4;
  return v10(a1, a2, v7);
}

uint64_t dispatch thunk of CaptureDeviceContextState.captureSnapshot(index:screenshot:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 208)
                                                                   + **(int **)(*(void *)v4 + 208));
  uint64_t v9 = a3 & 1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_2605D502C;
  return v12(a1, a2, v9, a4);
}

uint64_t sub_2605D502C()
{
  sub_2605D67DC();
  sub_2605D66D8();
  uint64_t v1 = *v0;
  sub_2605D6760();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_2605D682C();
  return v3();
}

uint64_t destroy for ElementHierarchy()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s15UINavigationKit16ElementHierarchyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ElementHierarchy(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ElementHierarchy(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementHierarchy(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ElementHierarchy(uint64_t result, int a2, int a3)
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
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ElementHierarchy()
{
  return &type metadata for ElementHierarchy;
}

unint64_t sub_2605D5290()
{
  unint64_t result = qword_26A88C118;
  if (!qword_26A88C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C118);
  }
  return result;
}

unint64_t sub_2605D52DC()
{
  unint64_t result = qword_26A88C130;
  if (!qword_26A88C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C130);
  }
  return result;
}

unint64_t sub_2605D5328(uint64_t a1)
{
  unint64_t result = sub_2605D6998(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    sub_2605BBD9C(v3);
    v5();
    sub_2605D6A08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2605D538C()
{
  unint64_t result = qword_26A88C148;
  if (!qword_26A88C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C148);
  }
  return result;
}

unint64_t sub_2605D53D8()
{
  unint64_t result = qword_26A88C160;
  if (!qword_26A88C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C160);
  }
  return result;
}

unint64_t sub_2605D5424()
{
  unint64_t result = qword_26A88C170;
  if (!qword_26A88C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C170);
  }
  return result;
}

void sub_2605D5470(char a1, uint64_t a2, char a3)
{
  sub_2605DAD64(a1, a2, a3, *v3);
  uint64_t *v3 = v4;
}

void sub_2605D5490(char a1, uint64_t a2, char a3)
{
  sub_2605DAD98(a1, a2, a3, *v3);
  uint64_t *v3 = v4;
}

uint64_t sub_2605D54B0(uint64_t a1)
{
  uint64_t v2 = sub_2605BBCB8(&qword_26A88C178);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2605D5510(uint64_t a1)
{
  unint64_t result = sub_2605D6998(a1);
  if (!result)
  {
    sub_2605BBD9C(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2605D5550(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_2605D55F0(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_2605D5660(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_2605D55F0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_2605DAA04(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_2605D5660(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v8 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v8 << 16;
        }
      }
      else
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v7 = a2 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v12 = result >> 16;
          uint64_t v6 = sub_2605E2DB0();
          unint64_t v5 = v12;
        }
        if (v5 != v7 && (*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v8 = v5 - 1;
            int v9 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
          }
          while (v9 == 128);
          return v8 << 16;
        }
      }
      unint64_t v8 = v5;
      return v8 << 16;
    }
    uint64_t v10 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v10 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v10)
    {
      return MEMORY[0x270F9E998]();
    }
  }
  return result;
}

void sub_2605D577C(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2605D3D5C();
    uint64_t v3 = v6;
  }
  unint64_t v4 = *(void *)(v3 + 16);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    sub_2605D9CBC((char *)(v3 + 16 * a1 + 48), v4 - 1 - a1, (char *)(v3 + 16 * a1 + 32));
    *(void *)(v3 + 16) = v5;
    uint64_t *v1 = v3;
  }
}

void sub_2605D5808()
{
  uint64_t v1 = *v0;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2605D3D5C();
    uint64_t v1 = v3;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    *(void *)(v1 + 16) = v2 - 1;
    *uint64_t v0 = v1;
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_2605D5864()
{
  unint64_t result = qword_26A88C1A8;
  if (!qword_26A88C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C1A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ElementHierarchy.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ElementHierarchy.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2605D5A04);
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

unsigned char *sub_2605D5A2C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ElementHierarchy.CodingKeys()
{
  return &type metadata for ElementHierarchy.CodingKeys;
}

uint64_t destroy for IntelligenceCommandSet()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IntelligenceCommandSet(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for IntelligenceCommandSet(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for IntelligenceCommandSet(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for IntelligenceCommandSet(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommandSet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for IntelligenceCommandSet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommandSet()
{
  return &type metadata for IntelligenceCommandSet;
}

uint64_t destroy for IntelligenceElement()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IntelligenceElement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IntelligenceElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for IntelligenceElement(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for IntelligenceElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceElement(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 88))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for IntelligenceElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceElement()
{
  return &type metadata for IntelligenceElement;
}

unint64_t sub_2605D5F24()
{
  unint64_t result = qword_26A88C1B8;
  if (!qword_26A88C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C1B8);
  }
  return result;
}

unint64_t sub_2605D5F74()
{
  unint64_t result = qword_26A88C1C0;
  if (!qword_26A88C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C1C0);
  }
  return result;
}

unint64_t sub_2605D5FC4()
{
  unint64_t result = qword_26A88C1C8;
  if (!qword_26A88C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C1C8);
  }
  return result;
}

unint64_t sub_2605D6010()
{
  unint64_t result = qword_26A88C1D8;
  if (!qword_26A88C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C1D8);
  }
  return result;
}

unint64_t sub_2605D605C()
{
  unint64_t result = qword_26A88C1F8;
  if (!qword_26A88C1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C1F8);
  }
  return result;
}

unint64_t sub_2605D60A8(uint64_t a1)
{
  unint64_t result = sub_2605D6998(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_2605BBD9C(&qword_26A88C200);
    sub_2605D61F8(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_2605D6138(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2605BBCB8(a3);
  uint64_t v4 = sub_2605D6AAC();
  v5(v4);
  return a2;
}

unint64_t sub_2605D6198(uint64_t a1)
{
  unint64_t result = sub_2605D6998(a1);
  if (!result)
  {
    sub_2605BBD9C(&qword_26A88BDA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_2605D61F8(uint64_t a1)
{
  unint64_t result = sub_2605D6998(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for IntelligenceCommandSet.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2605D6308);
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

ValueMetadata *type metadata accessor for IntelligenceCommandSet.CodingKeys()
{
  return &type metadata for IntelligenceCommandSet.CodingKeys;
}

uint64_t getEnumTagSinglePayload for IntelligenceElement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for IntelligenceElement.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x2605D6494);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceElement.CodingKeys()
{
  return &type metadata for IntelligenceElement.CodingKeys;
}

unint64_t sub_2605D64D0()
{
  unint64_t result = qword_26A88C260;
  if (!qword_26A88C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C260);
  }
  return result;
}

unint64_t sub_2605D6520()
{
  unint64_t result = qword_26A88C268;
  if (!qword_26A88C268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C268);
  }
  return result;
}

unint64_t sub_2605D6570()
{
  unint64_t result = qword_26A88C270;
  if (!qword_26A88C270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C270);
  }
  return result;
}

unint64_t sub_2605D65C0()
{
  unint64_t result = qword_26A88C278;
  if (!qword_26A88C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C278);
  }
  return result;
}

unint64_t sub_2605D6610()
{
  unint64_t result = qword_26A88C280;
  if (!qword_26A88C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C280);
  }
  return result;
}

unint64_t sub_2605D6660()
{
  unint64_t result = qword_26A88C288;
  if (!qword_26A88C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C288);
  }
  return result;
}

uint64_t sub_2605D66CC(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t sub_2605D66F0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_2605D6708()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D6728()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D6744()
{
  return sub_2605E2F20();
}

uint64_t sub_2605D6780()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D679C()
{
  uint64_t v2 = *(void *)(v0 - 168);
  *(void *)(v0 - 176) = *(void *)(v0 - 176);
  *(void *)(v0 - 168) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2605D67B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return MEMORY[0x270EF24A0](a1, a2, 0, 0, 0, 1, a7, a7);
}

uint64_t sub_2605D67E8()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D6800()
{
  return MEMORY[0x270F9E4B0](v1, 1, v2, v1, v2, v3, v0);
}

uint64_t sub_2605D682C()
{
  return v0 + 8;
}

uint64_t sub_2605D6838(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 - 176) = a1;
  *(void *)(v2 - 168) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2605D6854()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D686C()
{
  *(void *)(v2 - 176) = v0;
  *(void *)(v2 - 168) = v1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2605D688C()
{
  return sub_2605E2F40();
}

uint64_t sub_2605D68B4()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D68CC()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_2605D68E8(uint64_t a1)
{
  return MEMORY[0x270EEDDD0](v3, v1, v2, v3, a1);
}

uint64_t sub_2605D6910()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D6934()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D6974()
{
  return MEMORY[0x270F3F1C8](v0, v1);
}

uint64_t sub_2605D6998(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_2605D69BC()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D69D4()
{
  return sub_2605E2A50();
}

uint64_t sub_2605D69F4()
{
  return v0;
}

uint64_t sub_2605D6A08()
{
  return v0;
}

uint64_t sub_2605D6A14()
{
  return sub_2605D3C88(v0, v1);
}

uint64_t sub_2605D6A2C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9E508](a1, a2, v3, v4, v5, v2);
}

uint64_t sub_2605D6A4C(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return swift_getErrorValue();
}

__n128 *sub_2605D6A6C(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[3].n128_u64[1] = v2;
  return result;
}

uint64_t sub_2605D6A80()
{
  return swift_allocObject();
}

uint64_t sub_2605D6AAC()
{
  return v0;
}

uint64_t sub_2605D6ACC()
{
  *(void *)(v2 - 112) = v1;
  *(void *)(v2 - 104) = v0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2605D6AEC()
{
  return swift_bridgeObjectRelease();
}

BOOL static DeviceActivityObserver.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DeviceActivityObserver.State.hash(into:)()
{
  return sub_2605E2FB0();
}

uint64_t DeviceActivityObserver.State.hashValue.getter()
{
  return sub_2605E2FC0();
}

uint64_t sub_2605D6BA0()
{
  swift_getKeyPath();
  uint64_t KeyPath = swift_getKeyPath();
  sub_2605D7658(KeyPath);
  swift_release();

  return swift_release();
}

uint64_t sub_2605D6C04()
{
  return sub_2605E2850();
}

uint64_t DeviceActivityObserver.__allocating_init(inactivityTimeout:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  DeviceActivityObserver.init(inactivityTimeout:)(a1);
  return v2;
}

uint64_t DeviceActivityObserver.init(inactivityTimeout:)(uint64_t a1)
{
  uint64_t v3 = sub_2605BBCB8(&qword_26A88C290);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v1 + OBJC_IVAR____TtC15UINavigationKit22DeviceActivityObserver__state;
  v9[15] = 2;
  sub_2605E2830();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 32))(v7, v6, v3);
  *(void *)(v1 + 16) = IOHIDEventSystemClientCreateWithType();
  *(void *)(v1 + 24) = a1;
  sub_2605D6EB0();
  return v1;
}

void sub_2605D6DDC()
{
  uint64_t v1 = *(__IOHIDEventSystemClient **)(v0 + 16);
  uint64_t v2 = (__CFString *)sub_2605E2960();
  CFTypeRef v3 = IOHIDEventSystemClientCopyProperty(v1, v2);

  if (v3)
  {
    swift_unknownObjectRetain();
    if (swift_dynamicCast()) {
      sub_2605D6C04();
    }
    swift_unknownObjectRelease();
  }
}

void sub_2605D6EB0()
{
  sub_2605BBCB8(&qword_26A88C2C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2605E39B0;
  *(void *)(inited + 32) = 0x7355656369766544;
  *(void *)(inited + 40) = 0xEB00000000656761;
  *(_DWORD *)(inited + 48) = 0xFFFF;
  *(void *)(inited + 56) = 0x7355656369766544;
  *(void *)(inited + 64) = 0xEF65676150656761;
  *(_DWORD *)(inited + 72) = 0xFFFF;
  sub_2605E2890();
  uint64_t v1 = (void *)sub_2605E2870();
  swift_bridgeObjectRelease();
  sub_2605D7690();
  IOHIDEventSystemClientSetMatching();

  sub_2605D7618();
  uint64_t v2 = (void *)sub_2605E2C20();
  sub_2605D7690();
  IOHIDEventSystemClientScheduleWithDispatchQueue();

  CFTypeRef v3 = (void *)sub_2605E2960();
  sub_2605D7690();
  IOHIDEventSystemClientRegisterPropertyChangedCallback();

  uint64_t v4 = (void *)sub_2605E2960();
  uint64_t v5 = (void *)sub_2605E2C90();
  uint64_t v6 = (__IOHIDEventSystemClient *)sub_2605D7690();
  IOHIDEventSystemClientSetProperty(v6, v7, v5);

  sub_2605D6DDC();
}

uint64_t sub_2605D7050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_getObjectType();
  v7[3] = result;
  v7[0] = a4;
  if (a1)
  {
    swift_unknownObjectRetain();
    swift_retain();
    sub_2605D6DDC();
    swift_release();
    return sub_2605BBC68((uint64_t)v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2605D70B8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  swift_unknownObjectRetain();
  sub_2605D7050(a1, a2, (uint64_t)v7, a4);

  return swift_unknownObjectRelease();
}

uint64_t DeviceActivityObserver.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15UINavigationKit22DeviceActivityObserver__state;
  sub_2605BBCB8(&qword_26A88C290);
  sub_2605D767C();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t DeviceActivityObserver.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15UINavigationKit22DeviceActivityObserver__state;
  sub_2605BBCB8(&qword_26A88C290);
  sub_2605D767C();
  (*(void (**)(char *))(v2 + 8))(v1);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2605D7228@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2605D6BA0();
  *a1 = v3;
  return result;
}

uint64_t sub_2605D7268()
{
  return sub_2605D6C04();
}

unint64_t sub_2605D72A8()
{
  unint64_t result = qword_26A88C2A0;
  if (!qword_26A88C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C2A0);
  }
  return result;
}

uint64_t sub_2605D72F4()
{
  return type metadata accessor for DeviceActivityObserver();
}

uint64_t type metadata accessor for DeviceActivityObserver()
{
  uint64_t result = qword_26A88C2A8;
  if (!qword_26A88C2A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2605D7344()
{
  sub_2605D7440();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for DeviceActivityObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceActivityObserver);
}

uint64_t dispatch thunk of DeviceActivityObserver.__allocating_init(inactivityTimeout:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of DeviceActivityObserver.getState()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

void sub_2605D7440()
{
  if (!qword_26A88C2B8)
  {
    unint64_t v0 = sub_2605E2860();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A88C2B8);
    }
  }
}

uint64_t getEnumTagSinglePayload for DeviceActivityObserver.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeviceActivityObserver.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2605D75E0);
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

ValueMetadata *type metadata accessor for DeviceActivityObserver.State()
{
  return &type metadata for DeviceActivityObserver.State;
}

unint64_t sub_2605D7618()
{
  unint64_t result = qword_26A88C2C8;
  if (!qword_26A88C2C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A88C2C8);
  }
  return result;
}

uint64_t sub_2605D7658(uint64_t a1)
{
  return MEMORY[0x270EE3DD8](v1, v2, a1);
}

uint64_t sub_2605D7690()
{
  return v0;
}

uint64_t sub_2605D769C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t HIDEventRecorder.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t HIDEventRecorder.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  return result;
}

void sub_2605D76DC()
{
  id v0 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 13);
  id v1 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 11);
  id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 1);
  id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 5);
  id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 65291);
  id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 12);
  id v6 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, 65376);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62CF0]), sel_init);
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2605E4550;
  uint64_t v9 = sub_2605BBCFC(0, &qword_26A88BD40);
  *(void *)(v8 + 32) = v0;
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = v1;
  *(void *)(v8 + 88) = v9;
  *(void *)(v8 + 96) = v2;
  *(void *)(v8 + 120) = v9;
  *(void *)(v8 + 128) = v3;
  *(void *)(v8 + 152) = v9;
  *(void *)(v8 + 160) = v4;
  *(void *)(v8 + 184) = v9;
  *(void *)(v8 + 192) = v5;
  *(void *)(v8 + 248) = v9;
  *(void *)(v8 + 216) = v9;
  *(void *)(v8 + 224) = v6;
  id v18 = v0;
  id v17 = v1;
  id v10 = v2;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  sub_2605D87AC(v8, v7);
  id v15 = objc_msgSend(self, sel_recorderWithConfiguration_, v7);
  sub_2605D769C((uint64_t)v15);
  id v16 = *(id *)(v19 + 16);
  objc_msgSend(v16, sel_startRecording);
}

void sub_2605D7910(char a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v8 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  id v17 = (char *)&v48 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v48 - v18;
  unint64_t v20 = *(void **)(v4 + 16);
  if (!v20) {
    goto LABEL_25;
  }
  unint64_t v50 = a3;
  id v21 = v20;
  objc_msgSend(v21, sel_stopRecording);
  if (a1)
  {
    id v49 = a4;
    id v22 = objc_msgSend(self, sel_defaultManager);
    id v23 = objc_msgSend(v22, sel_URLsForDirectory_inDomains_, 9, 1);

    uint64_t v24 = sub_2605E2B40();
    if (!*(void *)(v24 + 16))
    {
      __break(1u);
      goto LABEL_27;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v19, v24 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v8);
    swift_bridgeObjectRelease();
    sub_2605E2300();
    uint64_t v52 = 0x74754F7061636572;
    unint64_t v53 = 0xEB00000000747570;
    id v51 = v49;
    sub_2605E2F20();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    sub_2605E2300();
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)sub_2605E22F0();
    objc_msgSend(v21, sel_writeToURL_, v25);

    unint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v14, v8);
    v26(v17, v8);
    v26(v19, v8);
  }
  id v27 = v21;
  unint64_t v28 = sub_2605D881C(v27);
  if (!v28)
  {

LABEL_25:
    uint64_t v47 = swift_bridgeObjectRetain();
    sub_2605DC8E8(v47);
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v29 = v28;
  if (!(v28 >> 62))
  {
    uint64_t v30 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v30) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
  uint64_t v30 = sub_2605E2E40();
  if (!v30)
  {
LABEL_24:

    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_8:
  if (v30 >= 1)
  {
    uint64_t v31 = 0;
    id v49 = v27;
    unint64_t v50 = v29 & 0xC000000000000001;
    uint64_t v32 = MEMORY[0x263F8EE78];
    do
    {
      if (v50) {
        id v33 = (id)MEMORY[0x261215E60](v31, v29);
      }
      else {
        id v33 = *(id *)(v29 + 8 * v31 + 32);
      }
      uint64_t v34 = v33;
      id v35 = objc_msgSend(v33, sel_hidEvent);
      if (v35)
      {
        int64_t v36 = v35;
        uint64_t TimeStamp = IOHIDEventGetTimeStamp();
        uint64_t IntegerValue = IOHIDEventGetIntegerValue();
        IOHIDEventGetDoubleValue();
        uint64_t v40 = v39;
        IOHIDEventGetDoubleValue();
        uint64_t v42 = v41;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2605C2F5C();
          uint64_t v32 = v45;
        }
        unint64_t v43 = *(void *)(v32 + 16);
        if (v43 >= *(void *)(v32 + 24) >> 1)
        {
          sub_2605C2F5C();
          uint64_t v32 = v46;
        }
        *(void *)(v32 + 16) = v43 + 1;
        uint64_t v44 = (void *)(v32 + 32 * v43);
        v44[4] = v40;
        v44[5] = v42;
        v44[6] = TimeStamp;
        v44[7] = IntegerValue;
      }
      else
      {
        int64_t v36 = v34;
      }
      ++v31;
    }
    while (v30 != v31);

    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_27:
  __break(1u);
}

unint64_t sub_2605D7D68(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v45 - v14;
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v45 - v16;
  id v18 = objc_msgSend(self, sel_defaultManager);
  id v19 = objc_msgSend(v18, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v20 = sub_2605E2B40();
  if (!*(void *)(v20 + 16))
  {
    __break(1u);
    goto LABEL_24;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v17, v20 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v6);
  swift_bridgeObjectRelease();
  sub_2605E2300();
  sub_2605E2300();
  id v21 = *(void **)(v3 + 16);
  if (!v21)
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v36 = sub_2605C4BCC();
    *(_OWORD *)(v36 + 16) = xmmword_2605E3700;
    uint64_t v37 = sub_2605D89CC(v36, MEMORY[0x263F8D310]);
    sub_2605BC040(v37, v38);
LABEL_21:
    swift_bridgeObjectRelease();
    unint64_t v43 = *(void (**)(void))(v8 + 8);
    sub_2605D89BC();
    v43();
    sub_2605D89BC();
    v43();
    sub_2605D89BC();
    v43();
    return 0;
  }
  uint64_t v53 = a1;
  id v22 = v21;
  objc_msgSend(v22, sel_stopRecording);
  id v23 = (void *)sub_2605E22F0();
  objc_msgSend(v22, sel_writeToURL_, v23);

  v57._uint64_t countAndFlagsBits = 0;
  v57._unint64_t object = (void *)0xE000000000000000;
  id v52 = v22;
  unint64_t result = sub_2605D881C(v52);
  if (!result) {
    goto LABEL_15;
  }
  a1 = result;
  uint64_t v46 = a2;
  uint64_t v47 = v12;
  uint64_t v50 = v8;
  uint64_t v51 = v6;
  uint64_t v48 = v15;
  id v49 = v17;
  if (result >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_2605E2E40();
    unint64_t result = swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
  uint64_t v25 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v25)
  {
LABEL_6:
    if (v25 < 1)
    {
      __break(1u);
      return result;
    }
    for (uint64_t i = 0; i != v25; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v27 = (id)MEMORY[0x261215E60](i, a1);
      }
      else {
        id v27 = *(id *)(a1 + 8 * i + 32);
      }
      unint64_t v28 = v27;
      id v29 = objc_msgSend(v27, sel_hidEvent);
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t IntegerValue = IOHIDEventGetIntegerValue();
        IOHIDEventGetDoubleValue();
        IOHIDEventGetDoubleValue();
        uint64_t TimeStamp = IOHIDEventGetTimeStamp();
        uint64_t v55 = 0;
        unint64_t v56 = 0xE000000000000000;
        uint64_t v54 = TimeStamp;
        sub_2605E2F20();
        sub_2605E2A50();
        swift_bridgeObjectRelease();
        sub_2605C4BB4();
        uint64_t v54 = IntegerValue;
        sub_2605E2F20();
        sub_2605E2A50();
        swift_bridgeObjectRelease();
        sub_2605C4BB4();
        sub_2605E2BE0();
        sub_2605C4BB4();
        sub_2605E2BE0();
        sub_2605E2A50();
        sub_2605E2A50();

        swift_bridgeObjectRelease();
      }
    }
  }
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v8 = v50;
  a2 = v46;
LABEL_15:
  v33._uint64_t countAndFlagsBits = v53;
  v33._unint64_t object = a2;
  v34._uint64_t countAndFlagsBits = 0x7461446863756F74;
  v34._unint64_t object = (void *)0xEE00747865742E61;
  Swift::String v35 = writeStringToFile(folderName:fileName:data:)(v33, v34, v57);
  swift_bridgeObjectRelease();
  if (!v35._countAndFlagsBits && v35._object == (void *)0xE000000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_20:
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v40 = sub_2605C4BCC();
    *(_OWORD *)(v40 + 16) = xmmword_2605E3700;
    uint64_t v41 = sub_2605D89CC(v40, MEMORY[0x263F8D310]);
    sub_2605BC040(v41, v42);

    goto LABEL_21;
  }
  char v39 = sub_2605D89DC();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_20;
  }

  uint64_t v44 = *(void (**)(void))(v8 + 8);
  sub_2605D89BC();
  v44();
  sub_2605D89BC();
  v44();
  sub_2605D89BC();
  v44();
  return 1;
}

uint64_t sub_2605D82BC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = swift_bridgeObjectRetain() + 56;
    do
    {
      sub_2605E2F20();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      sub_2605C4BB4();
      sub_2605E2F20();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      sub_2605C4BB4();
      sub_2605E2BE0();
      sub_2605C4BB4();
      sub_2605E2BE0();
      sub_2605E2A50();
      sub_2605E2A50();
      swift_bridgeObjectRelease();
      v6 += 32;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v4 = a2;
    uint64_t v3 = a3;
  }
  sub_2605E2D70();
  swift_bridgeObjectRelease();
  sub_2605E2F20();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  v7._uint64_t countAndFlagsBits = 0x7461446863756F74;
  v8._uint64_t countAndFlagsBits = 0;
  v9._uint64_t countAndFlagsBits = v4;
  v9._unint64_t object = v3;
  v7._unint64_t object = (void *)0xE900000000000061;
  v8._unint64_t object = (void *)0xE000000000000000;
  Swift::String v10 = writeStringToFile(folderName:fileName:data:)(v9, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10._countAndFlagsBits || v10._object != (void *)0xE000000000000000)
  {
    char v11 = sub_2605D89DC();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v11 & 1) == 0) {
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v13 = sub_2605C4BCC();
  *(_OWORD *)(v13 + 16) = xmmword_2605E3700;
  uint64_t v14 = sub_2605D89CC(v13, MEMORY[0x263F8D310]);
  sub_2605BC040(v14, v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2605D8568(unint64_t a1, void *a2)
{
  if (sub_2605D7D68(a1, a2))
  {
    uint64_t v4 = readTrajectoryFile(nlg:)();
    v5._uint64_t countAndFlagsBits = a1;
    v5._unint64_t object = a2;
    unsigned long long v6 = (unsigned __int128)correlateActionWithScreenContextGridAware(trajectory:nlg:)((Swift::OpaquePointer)v4, v5);
    Swift::String v7 = (void *)v6;
    Swift::String v8 = (void *)*((void *)&v6 + 1);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return result;
    }
    uint64_t v10 = swift_bridgeObjectRetain();
    printPlanInSemanticActionSpace(semanticActionPlan:)((Swift::OpaquePointer)v10);
    swift_bridgeObjectRelease();
    v11._0._rawValue = v7;
    v11._1._rawValue = v8;
    v12._uint64_t countAndFlagsBits = a1;
    v12._unint64_t object = a2;
    retainPlanInSemanticActionSpaceGridAware(semanticActionBundle:nlg:)(v11, v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v13 = sub_2605C4BCC();
    *(_OWORD *)(v13 + 16) = xmmword_2605E3700;
    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    sub_2605BC040(v13, 0xD000000000000036);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605D8670(unint64_t a1, void *a2)
{
  if (sub_2605D7D68(a1, a2))
  {
    uint64_t v4 = readTrajectoryFile(nlg:)();
    v5._uint64_t countAndFlagsBits = a1;
    v5._unint64_t object = a2;
    unint64_t v6 = (unint64_t)correlateActionWithScreenContext(trajectory:nlg:)((Swift::OpaquePointer)v4, v5);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v6) {
      return result;
    }
    printPlanInSemanticActionSpace(semanticActionPlan:)((Swift::OpaquePointer)v6);
    v8._uint64_t countAndFlagsBits = a1;
    v8._unint64_t object = a2;
    retainPlanInSemanticActionSpace(semanticActionPlan:nlg:)((Swift::OpaquePointer)v6, v8);
  }
  else
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v9 = sub_2605C4BCC();
    *(_OWORD *)(v9 + 16) = xmmword_2605E3700;
    *(void *)(v9 + 56) = MEMORY[0x263F8D310];
    sub_2605BC040(v9, 0xD000000000000036);
  }

  return swift_bridgeObjectRelease();
}

uint64_t HIDEventRecorder.deinit()
{
  return v0;
}

uint64_t HIDEventRecorder.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void sub_2605D87AC(uint64_t a1, void *a2)
{
  id v3 = (id)sub_2605E2B30();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setDeviceUsagePageArray_, v3);
}

uint64_t sub_2605D881C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_events);

  if (!v2) {
    return 0;
  }
  sub_2605BBCFC(0, &qword_26A88C2D0);
  uint64_t v3 = sub_2605E2B40();

  return v3;
}

uint64_t type metadata accessor for HIDEventRecorder()
{
  return self;
}

uint64_t method lookup function for HIDEventRecorder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HIDEventRecorder);
}

uint64_t dispatch thunk of HIDEventRecorder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of HIDEventRecorder.startHIDEventRecording()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of HIDEventRecorder.stopRecordingWithoutRetainingTrajectory(retainRawRecording:dumpDir:index:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of HIDEventRecorder.stopRecordingAndRetainTrajectory(dumpDir:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of HIDEventRecorder.retainHIDEventStream(_:dumpDir:index:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of HIDEventRecorder.stopHIDEventRecordingGridAware(dumpDir:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of HIDEventRecorder.stopHIDEventRecording(dumpDir:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t sub_2605D89CC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 56) = a2;
  return result;
}

uint64_t sub_2605D89DC()
{
  return sub_2605E2F40();
}

uint64_t SessionObserver.deviceActivityObserver.getter()
{
  return swift_retain();
}

uint64_t SessionObserver.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SessionObserver.init()();
  return v0;
}

uint64_t SessionObserver.init()()
{
  *(void *)(v0 + 24) = sub_2605D8AB0;
  type metadata accessor for DeviceActivityObserver();
  swift_allocObject();
  *(void *)(v0 + 16) = DeviceActivityObserver.init(inactivityTimeout:)(1);
  return v0;
}

uint64_t sub_2605D8A98()
{
  return byte_26A88C2D8;
}

void sub_2605D8AA4()
{
  byte_26A88C2D8 = 0;
}

uint64_t SessionObserver.interruptHandler.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t SessionObserver.deinit()
{
  swift_release();
  return v0;
}

uint64_t SessionObserver.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for SessionObserver()
{
  return self;
}

uint64_t method lookup function for SessionObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SessionObserver);
}

uint64_t dispatch thunk of SessionObserver.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SessionObserver.getRunningStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

void *sub_2605D8B88()
{
  id v2 = v0;
  v0[2] = sub_2605E2890();
  type metadata accessor for CGPoint(0);
  v0[3] = sub_2605E2890();
  v0[5] = 0x3F9EB851EB851EB8;
  sub_2605E2450();
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  uint64_t v3 = (void *)sub_2605E2430();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for UIUnderstandingContextRetriever();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v0[4] = v3;
    id v4 = v3;
    sub_2605E23F0();

    id v5 = (id)v2[4];
    sub_2605E2420();
  }
  return v2;
}

void sub_2605D8CF8()
{
  uint64_t v1 = sub_2605E24B0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2605E24C0();
  if (!v5)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    sub_2605E2F60();
    __break(1u);
    goto LABEL_79;
  }
  unint64_t v6 = (void *)v5;
  Swift::String v7 = 0;
  sub_2605E2410();
  uint64_t v94 = v1;
  unint64_t v17 = sub_2605E24A0();
  swift_retain();
  unint64_t v18 = sub_2605D9874(v17);
  unint64_t v19 = v18;
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2605E2E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v96 = v0;
  uint64_t v92 = v4;
  uint64_t v93 = v2;
  id v91 = v6;
  if (v20)
  {
    v85[0] = 0;
    uint64_t v103 = MEMORY[0x263F8EE78];
    sub_2605D5470(0, v20 & ~(v20 >> 63), 0);
    if ((v20 & 0x8000000000000000) == 0)
    {
      uint64_t v21 = 0;
      uint64_t v22 = v103;
      uint64_t v100 = (uint64_t *)(v19 & 0xC000000000000001);
      uint64_t v97 = "containerClickable";
      unint64_t v98 = (unint64_t)"checkboxSelected";
      uint64_t v95 = "containerNotClickable";
      char v89 = "pictureClickable";
      unint64_t v90 = "iconNotClickable";
      unint64_t v88 = "pictureNotClickable";
      unint64_t v87 = "textNotClickable";
      long long v86 = "toggleNotSelected";
      v85[1] = "statusBarPosition";
      unint64_t v99 = v19;
      while (v20 != v21)
      {
        if (v100) {
          id v23 = (id)MEMORY[0x261215E60](v21, v19);
        }
        else {
          id v23 = *(id *)(v19 + 8 * v21 + 32);
        }
        uint64_t v24 = v23;
        uint64_t v25 = sub_2605E2500();
        if (!v26) {
          goto LABEL_76;
        }
        uint64_t v27 = v25;
        uint64_t v28 = v26;
        uint64_t v29 = sub_2605E24F0();
        uint64_t v30 = 0xD000000000000013;
        Swift::String v7 = (void *)(v98 | 0x8000000000000000);
        switch(v29)
        {
          case 0:
            break;
          case 1:
            uint64_t v31 = v97;
            goto LABEL_36;
          case 2:
            uint64_t v30 = 0xD000000000000012;
            Swift::String v34 = v95;
            goto LABEL_27;
          case 3:
            uint64_t v30 = 0xD000000000000015;
            Swift::String v34 = v90;
            goto LABEL_27;
          case 4:
            Swift::String v7 = (void *)0xE600000000000000;
            uint64_t v30 = 0x676F6C616964;
            break;
          case 5:
            unsigned int v32 = 1852793705;
            goto LABEL_31;
          case 6:
            uint64_t v31 = v89;
            goto LABEL_36;
          case 7:
            Swift::String v7 = (void *)0xEB000000006C6F72;
            uint64_t v30 = 0x746E6F4365676170;
            break;
          case 8:
            uint64_t v31 = v88;
            goto LABEL_36;
          case 9:
            uint64_t v30 = 0xD000000000000013;
            Swift::String v33 = &v106;
            goto LABEL_25;
          case 10:
            Swift::String v7 = (void *)0xE600000000000000;
            uint64_t v30 = 0x6E6F74747562;
            break;
          case 11:
            Swift::String v7 = (void *)0xE600000000000000;
            uint64_t v30 = 0x726564696C73;
            break;
          case 12:
            unsigned int v32 = 1954047348;
LABEL_31:
            uint64_t v30 = v32 | 0x63696C4300000000;
            Swift::String v7 = (void *)0xED0000656C62616BLL;
            break;
          case 13:
            uint64_t v31 = v86;
LABEL_36:
            Swift::String v7 = (void *)((unint64_t)v31 | 0x8000000000000000);
            uint64_t v30 = 0xD000000000000010;
            break;
          case 14:
            Swift::String v7 = (void *)0xE900000000000064;
            uint64_t v30 = 0x6C65696674786574;
            break;
          case 15:
            uint64_t v30 = 0xD000000000000011;
            Swift::String v33 = &v105;
LABEL_25:
            Swift::String v34 = (const char *)*(v33 - 32);
LABEL_27:
            Swift::String v7 = (void *)((unint64_t)v34 | 0x8000000000000000);
            break;
          case 16:
            Swift::String v7 = (void *)0xEE0064657463656CLL;
            uint64_t v30 = 0x6553656C67676F74;
            break;
          default:
            Swift::String v7 = (void *)0xE700000000000000;
            uint64_t v30 = 0x6E776F6E6B6E75;
            break;
        }
        Swift::String v35 = (void *)sub_2605E24E0();
        sub_2605E23D0();
        uint64_t v37 = v36;
        uint64_t v39 = v38;

        uint64_t v103 = v22;
        unint64_t v41 = *(void *)(v22 + 16);
        unint64_t v40 = *(void *)(v22 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_2605D5470(v40 > 1, v41 + 1, 1);
          uint64_t v22 = v103;
        }
        ++v21;
        *(void *)(v22 + 16) = v41 + 1;
        uint64_t v42 = (void *)(v22 + 48 * v41);
        v42[4] = v27;
        v42[5] = v28;
        v42[6] = v30;
        v42[7] = v7;
        v42[8] = v37;
        v42[9] = v39;
        unint64_t v19 = v99;
        if (v20 == v21)
        {
          swift_bridgeObjectRelease();
          Swift::String v7 = (void *)v85[0];
          goto LABEL_43;
        }
      }
      __break(1u);
      goto LABEL_70;
    }
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  swift_bridgeObjectRelease();
  uint64_t v22 = MEMORY[0x263F8EE78];
LABEL_43:
  uint64_t v103 = v22;
  swift_bridgeObjectRetain();
  sub_2605DAF5C(&v103);
  if (v7)
  {
LABEL_79:
    swift_release();
    __break(1u);
    JUMPOUT(0x2605D9830);
  }
  swift_bridgeObjectRelease();
  uint64_t v95 = (const char *)v103;
  unint64_t v43 = *(void *)(v103 + 16);
  if (!v43)
  {
LABEL_63:
    swift_release();
    if (qword_26A88BD00 != -1) {
      swift_once();
    }
    uint64_t v78 = sub_2605E2810();
    sub_2605C5664(v78, (uint64_t)qword_26A88C7A8);
    swift_retain_n();
    unint64_t v79 = sub_2605E2800();
    os_log_type_t v80 = sub_2605E2C00();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = (uint8_t *)swift_slowAlloc();
      unint64_t v102 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v81 = 136315138;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_2605E2880();
      unint64_t v84 = v83;
      swift_bridgeObjectRelease();
      uint64_t v101 = sub_2605DA48C(v82, v84, (uint64_t *)&v102);
      sub_2605E2CA0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2605B8000, v79, v80, "%s", v81, 0xCu);
      swift_arrayDestroy();
      sub_2605DBB20();
      sub_2605DBB20();
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(char *, uint64_t))(v93 + 8))(v92, v94);
    return;
  }
  uint64_t v100 = (uint64_t *)(v96 + 16);
  uint64_t v44 = (uint64_t *)(v95 + 72);
  uint64_t v97 = (const char *)(v96 + 24);
  while (1)
  {
    unint64_t v99 = v43;
    uint64_t v46 = *(v44 - 5);
    uint64_t v45 = *(v44 - 4);
    uint64_t v48 = *(v44 - 1);
    uint64_t v47 = *v44;
    id v49 = (const char *)*(v44 - 2);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v103 = sub_2605E2C40();
    uint64_t v104 = v50;
    swift_bridgeObjectRetain();
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v98 = (unint64_t)v49;
    sub_2605E2A50();
    swift_bridgeObjectRelease();
    Swift::String v7 = (void *)v103;
    uint64_t v51 = v104;
    id v52 = v100;
    swift_beginAccess();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v102 = (void *)*v52;
    *id v52 = 0x8000000000000000;
    sub_2605DBAD4();
    sub_2605DBAC0();
    if (v55) {
      break;
    }
    unint64_t v56 = v53;
    char v57 = v54;
    sub_2605BBCB8(&qword_26A88BD80);
    if (sub_2605DBB00())
    {
      unint64_t v58 = sub_2605DBAD4();
      if ((v57 & 1) != (v59 & 1)) {
        goto LABEL_78;
      }
      unint64_t v56 = v58;
    }
    uint64_t v60 = v102;
    if (v57)
    {
      char v61 = (void *)(v102[7] + 16 * v56);
      swift_bridgeObjectRelease();
      *char v61 = v7;
      v61[1] = v51;
    }
    else
    {
      sub_2605DBAA8((uint64_t)&v102[v56 >> 6]);
      uint64_t v62 = (void *)(v60[6] + 16 * v56);
      *uint64_t v62 = v46;
      v62[1] = v45;
      uint64_t v63 = (void *)(v60[7] + 16 * v56);
      *uint64_t v63 = v7;
      v63[1] = v51;
      uint64_t v64 = v60[2];
      BOOL v55 = __OFADD__(v64, 1);
      uint64_t v65 = v64 + 1;
      if (v55) {
        goto LABEL_72;
      }
      v60[2] = v65;
      swift_bridgeObjectRetain();
    }
    *uint64_t v100 = (uint64_t)v60;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v66 = (uint64_t *)v97;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    unint64_t v102 = (void *)*v66;
    *uint64_t v66 = 0x8000000000000000;
    sub_2605DBAD4();
    sub_2605DBAC0();
    if (v55) {
      goto LABEL_71;
    }
    unint64_t v69 = v67;
    char v70 = v68;
    sub_2605BBCB8(&qword_26A88C2E0);
    if (sub_2605DBB00())
    {
      unint64_t v71 = sub_2605DBAD4();
      if ((v70 & 1) != (v72 & 1)) {
        goto LABEL_78;
      }
      unint64_t v69 = v71;
    }
    Swift::String v7 = v102;
    if (v70)
    {
      uint64_t v73 = (void *)(v102[7] + 16 * v69);
      void *v73 = v48;
      v73[1] = v47;
    }
    else
    {
      sub_2605DBAA8((uint64_t)&v102[v69 >> 6]);
      uint64_t v74 = (void *)(v7[6] + 16 * v69);
      *uint64_t v74 = v46;
      v74[1] = v45;
      char v75 = (void *)(v7[7] + 16 * v69);
      *char v75 = v48;
      v75[1] = v47;
      uint64_t v76 = v7[2];
      BOOL v55 = __OFADD__(v76, 1);
      uint64_t v77 = v76 + 1;
      if (v55) {
        goto LABEL_73;
      }
      v7[2] = v77;
      swift_bridgeObjectRetain();
    }
    *uint64_t v66 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v44 += 6;
    unint64_t v43 = v99 - 1;
    if (v99 == 1) {
      goto LABEL_63;
    }
  }
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
  swift_once();
  uint64_t v8 = sub_2605E2810();
  sub_2605C5664(v8, (uint64_t)qword_26A88C7A8);
  uint64_t v9 = v7;
  uint64_t v10 = v7;
  Swift::tuple_OpaquePointer_OpaquePointer v11 = sub_2605E2800();
  os_log_type_t v12 = sub_2605E2C10();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    uint64_t v15 = v7;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v103 = v16;
    sub_2605E2CA0();
    *uint64_t v14 = v16;

    _os_log_impl(&dword_2605B8000, v11, v12, "caught: %@", v13, 0xCu);
    sub_2605BBCB8(&qword_26A88BE28);
    swift_arrayDestroy();
    sub_2605DBB20();
    sub_2605DBB20();
  }
  else
  {
  }
}

uint64_t sub_2605D9874(unint64_t a1)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x261215E60](v3, a1);
LABEL_7:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_16;
        }
        sub_2605E2500();
        uint64_t v8 = v7;
        swift_bridgeObjectRelease();
        if (v8 && (uint64_t v9 = (void *)sub_2605E24E0(), sub_2605E23D0(), v11 = v10, v9, v11 > 0.03))
        {
          sub_2605E2DD0();
          sub_2605E2DF0();
          sub_2605E2E00();
          sub_2605E2DE0();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2)
        {
          uint64_t v12 = v14;
          goto LABEL_19;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      uint64_t v2 = sub_2605E2E40();
      if (!v2) {
        goto LABEL_18;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_18:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_19:
  swift_release();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2605D9A0C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_2605D9A3C()
{
  sub_2605D9A0C();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for UIUnderstandingContextRetriever()
{
  return self;
}

uint64_t destroy for UIUnderstandingElement()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UIUnderstandingElement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UIUnderstandingElement(void *a1, void *a2)
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
  return a1;
}

__n128 initializeWithTake for UIUnderstandingElement(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for UIUnderstandingElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIUnderstandingElement(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for UIUnderstandingElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIUnderstandingElement()
{
  return &type metadata for UIUnderstandingElement;
}

void sub_2605D9C98()
{
}

char *sub_2605D9CBC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2605DBA58();
    __n128 result = (char *)sub_2605DBA6C();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_2605DBA3C(a3, result);
  }
  return result;
}

char *sub_2605D9D18(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2605DBA58();
    __n128 result = (char *)sub_2605DBA6C();
    __break(1u);
  }
  else if (a3 != result || &result[112 * a2] <= a3)
  {
    return (char *)sub_2605DBA3C(a3, result);
  }
  return result;
}

char *sub_2605D9D7C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2605DBA58();
    __n128 result = (char *)sub_2605DBA6C();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)sub_2605DBA3C(a3, result);
  }
  return result;
}

char *sub_2605D9DD8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2605E2E50();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_2605D9E74(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2605DBA58();
    __n128 result = (char *)sub_2605DBA6C();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)sub_2605DBA3C(a3, result);
  }
  return result;
}

char *sub_2605D9ED8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2605DBA58();
    __n128 result = (char *)sub_2605DBA6C();
    __break(1u);
  }
  else if (a3 != result || &result[88 * a2] <= a3)
  {
    return (char *)sub_2605DBA3C(a3, result);
  }
  return result;
}

char *sub_2605D9F3C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2605E2E50();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_2605D9FD8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_2605DBA58();
    __n128 result = (char *)sub_2605DBA6C();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)sub_2605DBA3C(a3, result);
  }
  return result;
}

uint64_t sub_2605DA03C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    sub_2605DBA58();
    uint64_t result = sub_2605E2E50();
    __break(1u);
  }
  else
  {
    sub_2605DB9A4();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2605DA120(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    sub_2605DBA58();
    uint64_t result = sub_2605E2E50();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2605DA1E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (BOOL v3 = a1 + 48 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_2605E2E50();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_2605DA2CC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[40 * a2] > __src ? (BOOL v3 = &__src[40 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2605E2E50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 40 * a2);
  }
  return result;
}

void *sub_2605DA3AC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[48 * a2] > __src ? (BOOL v3 = &__src[48 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2605E2E50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 48 * a2);
  }
  return result;
}

uint64_t sub_2605DA48C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2605DA560(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2605BBBC8((uint64_t)v12, *a3);
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
      sub_2605BBBC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2605BBC68((uint64_t)v12);
  return v7;
}

uint64_t sub_2605DA560(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2605DA6B8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2605E2CB0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_2605DA790(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_2605E2DB0();
    if (!v8)
    {
      uint64_t result = sub_2605E2E30();
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

void *sub_2605DA6B8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2605E2E50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_2605DA790(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2605DA828(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2605DAA60(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2605DAA60((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2605DA828(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_2605E2A70();
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
  unint64_t v3 = sub_2605DA99C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_2605E2D80();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_2605E2E50();
  __break(1u);
LABEL_14:
  uint64_t result = sub_2605E2E30();
  __break(1u);
  return result;
}

void *sub_2605DA99C(uint64_t a1, uint64_t a2)
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
  sub_2605BBCB8(&qword_26A88C2E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2605DAA04(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_2605E2AD0();
    sub_2605DBA90(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x261215B60](15, a1 >> 16);
    sub_2605DBA90(v3);
    return v4 | 8;
  }
}

char *sub_2605DAA60(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_2605BBCB8(&qword_26A88C2E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2605DAC10(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2605DAB38(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2605DAB38(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2605E2E50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2605DAC10(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2605E2E50();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_2605DACA0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2605C4C84();
    if (v7 != v8)
    {
      sub_2605C50F4();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_2605BBCB8(&qword_26A88BE20);
    size_t v11 = (char *)swift_allocObject();
    j__malloc_size(v11);
    sub_2605DBAEC();
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = v12;
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if (a1)
  {
    sub_2605D9CBC(v14, v9, v13);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2605DA120((unint64_t)v14, v9, (unint64_t)v13);
  }
  swift_release();
}

void sub_2605DAD64(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_2605DAD98(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_2605C4C84();
    if (v7 != v8)
    {
      sub_2605C50F4();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *(void *)(a4 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_2605BBCB8(&qword_26A88C300);
    size_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if (a1)
  {
    sub_2605D9F3C(v14, v9, v13);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2605DA2CC(v14, v9, v13);
  }
  swift_release();
}

void sub_2605DAE70(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, void *), void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    sub_2605C4C84();
    if (v12 != v13)
    {
      sub_2605C50F4();
      if (v12)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    sub_2605BBCB8(a5);
    uint64_t v16 = (void *)swift_allocObject();
    size_t v17 = j__malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 48);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v18 = v16 + 4;
  uint64_t v19 = a4 + 32;
  if (a1)
  {
    a6(v19, v14, v18);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    a7(v19, v14, v18);
  }
  swift_release();
}

void sub_2605DAF5C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2605DB94C(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_2605DAFC8(v5);
  *a1 = v2;
}

void sub_2605DAFC8(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_2605E2F10();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_2605DB62C(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_125;
  }
  uint64_t v5 = v4;
  uint64_t v101 = a1;
  uint64_t v102 = sub_2605C291C(v3 / 2);
  uint64_t v104 = v3;
  __dst = v6;
  if (v3 <= 0)
  {
    uint64_t v106 = MEMORY[0x263F8EE78];
    unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_91:
    if (v31 < 2)
    {
LABEL_102:
      swift_bridgeObjectRelease();
      if (v104 >= -1)
      {
        *(void *)(v102 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_130;
    }
    uint64_t v93 = *v101;
    while (1)
    {
      unint64_t v94 = v31 - 2;
      if (v31 < 2) {
        break;
      }
      if (!v93) {
        goto LABEL_134;
      }
      uint64_t v95 = v106;
      uint64_t v96 = *(void *)(v106 + 32 + 16 * v94);
      uint64_t v97 = *(void *)(v106 + 32 + 16 * (v31 - 1) + 8);
      sub_2605DB6BC((char *)(v93 + 48 * v96), (double *)(v93 + 48 * *(void *)(v106 + 32 + 16 * (v31 - 1))), v93 + 48 * v97, __dst);
      if (v1) {
        goto LABEL_87;
      }
      if (v97 < v96) {
        goto LABEL_120;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605DB938(v106);
        uint64_t v95 = v100;
      }
      if (v94 >= *(void *)(v95 + 16)) {
        goto LABEL_121;
      }
      unint64_t v98 = (void *)(v95 + 32 + 16 * v94);
      *unint64_t v98 = v96;
      v98[1] = v97;
      unint64_t v99 = *(void *)(v95 + 16);
      if (v31 > v99) {
        goto LABEL_122;
      }
      memmove((void *)(v95 + 32 + 16 * (v31 - 1)), (const void *)(v95 + 32 + 16 * v31), 16 * (v99 - v31));
      uint64_t v106 = v95;
      *(void *)(v95 + 16) = v99 - 1;
      unint64_t v31 = v99 - 1;
      if (v99 <= 2) {
        goto LABEL_102;
      }
    }
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v106 = MEMORY[0x263F8EE78];
  uint64_t v103 = v5;
  while (1)
  {
    uint64_t v9 = v7++;
    if (v7 < v3)
    {
      double v10 = *(double *)(v8 + 48 * v7 + 40);
      double v11 = *(double *)(v8 + 48 * v9 + 40);
      uint64_t v7 = v9 + 2;
      if (v9 + 2 < v3)
      {
        char v12 = (double *)(v8 + 136 + 48 * v9);
        double v13 = v10;
        while (1)
        {
          double v14 = v13;
          double v13 = *v12;
          if (v10 < v11 == *v12 >= v14) {
            break;
          }
          ++v7;
          v12 += 6;
          if (v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v10 < v11)
      {
        if (v7 < v9) {
          goto LABEL_127;
        }
        if (v9 < v7)
        {
          uint64_t v15 = 48 * v7;
          uint64_t v16 = 48 * v9;
          uint64_t v17 = v7;
          uint64_t v18 = v9;
          do
          {
            if (v18 != --v17)
            {
              if (!v8) {
                goto LABEL_133;
              }
              uint64_t v19 = (_OWORD *)(v8 + v16);
              long long v20 = *(_OWORD *)(v8 + v16);
              uint64_t v21 = v8 + v15;
              uint64_t v22 = *(void *)(v8 + v16 + 16);
              uint64_t v23 = *(void *)(v8 + v16 + 24);
              long long v24 = *(_OWORD *)(v8 + v16 + 32);
              long long v26 = *(_OWORD *)(v8 + v15 - 32);
              long long v25 = *(_OWORD *)(v8 + v15 - 16);
              *uint64_t v19 = *(_OWORD *)(v8 + v15 - 48);
              v19[1] = v26;
              v19[2] = v25;
              *(_OWORD *)(v21 - 48) = v20;
              *(void *)(v21 - 32) = v22;
              *(void *)(v21 - 24) = v23;
              *(_OWORD *)(v21 - 16) = v24;
            }
            ++v18;
            v15 -= 48;
            v16 += 48;
          }
          while (v18 < v17);
        }
      }
    }
    if (v7 >= v3) {
      goto LABEL_26;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_124;
    }
    if (v7 - v9 >= v5) {
      goto LABEL_26;
    }
    uint64_t v27 = v9 + v5;
    if (__OFADD__(v9, v5)) {
      goto LABEL_128;
    }
    if (v27 >= v3) {
      uint64_t v27 = v3;
    }
    if (v27 < v9) {
      goto LABEL_129;
    }
    if (v7 == v27)
    {
LABEL_26:
      uint64_t v28 = v106;
    }
    else
    {
      uint64_t v79 = v8 + 32 + 48 * v7;
      uint64_t v28 = v106;
      do
      {
        double v80 = *(double *)(v8 + 48 * v7 + 40);
        uint64_t v81 = v9;
        uint64_t v82 = v79;
        do
        {
          if (v80 >= *(double *)(v82 - 40)) {
            break;
          }
          if (!v8) {
            goto LABEL_131;
          }
          unint64_t v83 = (_OWORD *)(v82 - 32);
          unint64_t v84 = (_OWORD *)(v82 - 80);
          long long v86 = *(_OWORD *)(v82 - 64);
          long long v85 = *(_OWORD *)(v82 - 48);
          *(void *)(v82 - 48) = *(void *)v82;
          v82 -= 48;
          uint64_t v87 = *(void *)(v82 + 16);
          uint64_t v88 = *(void *)(v82 + 24);
          uint64_t v89 = *(void *)(v82 + 32);
          uint64_t v90 = *(void *)(v82 + 40);
          *unint64_t v83 = *v84;
          v83[1] = v86;
          v83[2] = v85;
          *(void *)(v82 - 32) = v87;
          *(void *)(v82 - 24) = v88;
          *(void *)(v82 - 16) = v89;
          *(void *)(v82 - 8) = v90;
          *(double *)(v82 + 8) = v80;
          ++v81;
        }
        while (v7 != v81);
        ++v7;
        v79 += 48;
      }
      while (v7 != v27);
      uint64_t v7 = v27;
    }
    if (v7 < v9) {
      goto LABEL_123;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2605DB860(0, *(void *)(v28 + 16) + 1, 1, (char *)v28);
      uint64_t v28 = v91;
    }
    unint64_t v30 = *(void *)(v28 + 16);
    unint64_t v29 = *(void *)(v28 + 24);
    unint64_t v31 = v30 + 1;
    if (v30 >= v29 >> 1)
    {
      sub_2605DB860(v29 > 1, v30 + 1, 1, (char *)v28);
      uint64_t v28 = v92;
    }
    *(void *)(v28 + 16) = v31;
    uint64_t v32 = v28 + 32;
    Swift::String v33 = (uint64_t *)(v28 + 32 + 16 * v30);
    uint64_t *v33 = v9;
    v33[1] = v7;
    uint64_t v106 = v28;
    if (v30) {
      break;
    }
    unint64_t v31 = 1;
LABEL_75:
    uint64_t v5 = v103;
    uint64_t v3 = v104;
    if (v7 >= v104) {
      goto LABEL_91;
    }
  }
  while (1)
  {
    unint64_t v34 = v31 - 1;
    if (v31 >= 4)
    {
      unint64_t v39 = v32 + 16 * v31;
      uint64_t v40 = *(void *)(v39 - 64);
      uint64_t v41 = *(void *)(v39 - 56);
      BOOL v45 = __OFSUB__(v41, v40);
      uint64_t v42 = v41 - v40;
      if (v45) {
        goto LABEL_108;
      }
      uint64_t v44 = *(void *)(v39 - 48);
      uint64_t v43 = *(void *)(v39 - 40);
      BOOL v45 = __OFSUB__(v43, v44);
      uint64_t v37 = v43 - v44;
      char v38 = v45;
      if (v45) {
        goto LABEL_109;
      }
      unint64_t v46 = v31 - 2;
      uint64_t v47 = (uint64_t *)(v32 + 16 * (v31 - 2));
      uint64_t v49 = *v47;
      uint64_t v48 = v47[1];
      BOOL v45 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      if (v45) {
        goto LABEL_110;
      }
      BOOL v45 = __OFADD__(v37, v50);
      uint64_t v51 = v37 + v50;
      if (v45) {
        goto LABEL_112;
      }
      if (v51 >= v42)
      {
        unint64_t v69 = (uint64_t *)(v32 + 16 * v34);
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v45 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v45) {
          goto LABEL_118;
        }
        BOOL v62 = v37 < v72;
        goto LABEL_64;
      }
    }
    else
    {
      if (v31 != 3)
      {
        uint64_t v63 = *(void *)(v28 + 32);
        uint64_t v64 = *(void *)(v28 + 40);
        BOOL v45 = __OFSUB__(v64, v63);
        uint64_t v56 = v64 - v63;
        char v57 = v45;
        goto LABEL_58;
      }
      uint64_t v36 = *(void *)(v28 + 32);
      uint64_t v35 = *(void *)(v28 + 40);
      BOOL v45 = __OFSUB__(v35, v36);
      uint64_t v37 = v35 - v36;
      char v38 = v45;
    }
    if (v38) {
      goto LABEL_111;
    }
    unint64_t v46 = v31 - 2;
    id v52 = (uint64_t *)(v32 + 16 * (v31 - 2));
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    BOOL v55 = __OFSUB__(v53, v54);
    uint64_t v56 = v53 - v54;
    char v57 = v55;
    if (v55) {
      goto LABEL_113;
    }
    unint64_t v58 = (uint64_t *)(v32 + 16 * v34);
    uint64_t v60 = *v58;
    uint64_t v59 = v58[1];
    BOOL v45 = __OFSUB__(v59, v60);
    uint64_t v61 = v59 - v60;
    if (v45) {
      goto LABEL_115;
    }
    if (__OFADD__(v56, v61)) {
      goto LABEL_117;
    }
    if (v56 + v61 >= v37)
    {
      BOOL v62 = v37 < v61;
LABEL_64:
      if (v62) {
        unint64_t v34 = v46;
      }
      goto LABEL_66;
    }
LABEL_58:
    if (v57) {
      goto LABEL_114;
    }
    uint64_t v65 = (uint64_t *)(v32 + 16 * v34);
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v45 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v45) {
      goto LABEL_116;
    }
    if (v68 < v56) {
      goto LABEL_75;
    }
LABEL_66:
    unint64_t v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
      goto LABEL_119;
    }
    if (!v8) {
      goto LABEL_132;
    }
    uint64_t v74 = (uint64_t *)(v32 + 16 * v73);
    uint64_t v75 = *v74;
    uint64_t v76 = (void *)(v32 + 16 * v34);
    uint64_t v77 = v76[1];
    sub_2605DB6BC((char *)(v8 + 48 * *v74), (double *)(v8 + 48 * *v76), v8 + 48 * v77, __dst);
    if (v1) {
      break;
    }
    if (v77 < v75) {
      goto LABEL_105;
    }
    if (v34 > *(void *)(v106 + 16)) {
      goto LABEL_106;
    }
    *uint64_t v74 = v75;
    *(void *)(v32 + 16 * v73 + 8) = v77;
    unint64_t v78 = *(void *)(v106 + 16);
    if (v34 >= v78) {
      goto LABEL_107;
    }
    uint64_t v28 = v106;
    unint64_t v31 = v78 - 1;
    memmove((void *)(v32 + 16 * v34), v76 + 2, 16 * (v78 - 1 - v34));
    *(void *)(v106 + 16) = v78 - 1;
    if (v78 <= 2) {
      goto LABEL_75;
    }
  }
LABEL_87:
  swift_bridgeObjectRelease();
  if (v104 < -1) {
    goto LABEL_126;
  }
  *(void *)(v102 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_2605DB62C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 48 * a3 + 32;
    while (2)
    {
      double v6 = *(double *)(v4 + 48 * a3 + 40);
      uint64_t v7 = result;
      uint64_t v8 = v5;
      do
      {
        if (v6 >= *(double *)(v8 - 40)) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        uint64_t v9 = (_OWORD *)(v8 - 32);
        double v10 = (_OWORD *)(v8 - 80);
        long long v12 = *(_OWORD *)(v8 - 64);
        long long v11 = *(_OWORD *)(v8 - 48);
        *(void *)(v8 - 48) = *(void *)v8;
        v8 -= 48;
        uint64_t v13 = *(void *)(v8 + 16);
        uint64_t v14 = *(void *)(v8 + 24);
        uint64_t v16 = *(void *)(v8 + 32);
        uint64_t v15 = *(void *)(v8 + 40);
        *uint64_t v9 = *v10;
        v9[1] = v12;
        v9[2] = v11;
        *(void *)(v8 - 32) = v13;
        *(void *)(v8 - 24) = v14;
        *(void *)(v8 - 16) = v16;
        *(void *)(v8 - 8) = v15;
        *(double *)(v8 + 8) = v6;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 48;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2605DB6BC(char *__src, double *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  double v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - __src;
  int64_t v9 = ((char *)a2 - __src) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  if (v9 >= v11)
  {
    sub_2605D9DD8((char *)a2, (uint64_t)(a3 - (void)a2) / 48, __dst);
    long long v12 = &v4[48 * v11];
    if (v7 >= (char *)v6 || v10 < 48) {
      goto LABEL_41;
    }
    long long v20 = (_OWORD *)(a3 - 48);
    while (1)
    {
      uint64_t v21 = v20 + 3;
      if (*((double *)v12 - 1) >= *(v6 - 1))
      {
        uint64_t v22 = (double *)(v12 - 48);
        BOOL v24 = v21 != (_OWORD *)v12 || v20 >= (_OWORD *)v12;
        v12 -= 48;
        if (!v24) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v22 = v6 - 6;
        BOOL v23 = v21 != (_OWORD *)v6 || v20 >= (_OWORD *)v6;
        v6 -= 6;
        if (!v23) {
          goto LABEL_37;
        }
      }
      long long v25 = *(_OWORD *)v22;
      long long v26 = *((_OWORD *)v22 + 2);
      v20[1] = *((_OWORD *)v22 + 1);
      v20[2] = v26;
      _OWORD *v20 = v25;
LABEL_37:
      v20 -= 3;
      if (v6 <= (double *)v7 || v12 <= v4) {
        goto LABEL_41;
      }
    }
  }
  sub_2605D9DD8(__src, ((char *)a2 - __src) / 48, __dst);
  long long v12 = &v4[48 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 48)
  {
    do
    {
      if (v6[5] >= *((double *)v4 + 5))
      {
        BOOL v13 = v7 == v4;
        uint64_t v14 = v4;
        v4 += 48;
        if (v13 && v7 < v4) {
          goto LABEL_16;
        }
      }
      else
      {
        BOOL v13 = v7 == (char *)v6;
        uint64_t v14 = (char *)v6;
        v6 += 6;
        if (v13 && v7 < (char *)v6) {
          goto LABEL_16;
        }
      }
      long long v17 = *(_OWORD *)v14;
      long long v18 = *((_OWORD *)v14 + 2);
      *((_OWORD *)v7 + 1) = *((_OWORD *)v14 + 1);
      *((_OWORD *)v7 + 2) = v18;
      *(_OWORD *)uint64_t v7 = v17;
LABEL_16:
      v7 += 48;
    }
    while (v4 < v12 && (unint64_t)v6 < a3);
  }
  double v6 = (double *)v7;
LABEL_41:
  sub_2605D9DD8(v4, (v12 - v4) / 48, (char *)v6);
  return 1;
}

void sub_2605DB860(char a1, uint64_t a2, char a3, char *a4)
{
  if (a3)
  {
    sub_2605C4C84();
    if (v7 != v8)
    {
      sub_2605C50F4();
      if (v7)
      {
        __break(1u);
        return;
      }
      sub_2605C4C74();
    }
  }
  else
  {
    uint64_t v6 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v6 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v6;
  }
  if (v10)
  {
    sub_2605BBCB8(&qword_26A88C2F0);
    uint64_t v11 = (char *)swift_allocObject();
    j__malloc_size(v11);
    sub_2605DBAEC();
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = v12;
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || &v14[16 * v9] <= v13) {
      memmove(v13, v14, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v9);
  }
  swift_bridgeObjectRelease();
}

void sub_2605DB938(uint64_t a1)
{
}

void sub_2605DB94C(uint64_t a1)
{
}

unint64_t sub_2605DB9A4()
{
  unint64_t result = qword_26A88BD50;
  if (!qword_26A88BD50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A88BD50);
  }
  return result;
}

void sub_2605DB9E4(uint64_t a1)
{
}

void *sub_2605DBA3C@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t sub_2605DBA6C()
{
  return sub_2605E2E50();
}

unint64_t sub_2605DBA90(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

void sub_2605DBAA8(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= 1 << v1;
}

unint64_t sub_2605DBAD4()
{
  return sub_2605C3A08(v1, v0);
}

uint64_t sub_2605DBB00()
{
  return sub_2605E2E20();
}

void sub_2605DBB20()
{
  JUMPOUT(0x261216700);
}

uint64_t ScrollAction.init(with:)@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C6548();
  uint64_t v8 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v9 = sub_2605C6508(v8);
  MEMORY[0x270FA5388](v9);
  sub_2605C6530();
  uint64_t v10 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v11 = sub_2605C6508(v10);
  MEMORY[0x270FA5388](v11);
  sub_2605C5138();
  uint64_t v12 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v13 = sub_2605C6508(v12);
  MEMORY[0x270FA5388](v13);
  sub_2605C64F8();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_2605E22B0();
  MEMORY[0x270FA5388](v17);
  sub_2605C64F8();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605DC8C0();
  sub_2605E22A0();
  sub_2605C3DD0(v16, 0, 1, v17);
  uint64_t v18 = sub_2605E2940();
  sub_2605C3DD0(v4, 1, 1, v18);
  uint64_t v19 = sub_2605E2140();
  sub_2605C3DD0(v3, 1, 1, v19);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v2, *MEMORY[0x263EFBDC8], v1);
  uint64_t v20 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v20;
  return result;
}

uint64_t sub_2605DBD9C(uint64_t a1, uint64_t a2)
{
  if (a1 == 28789 && a2 == 0xE200000000000000) {
    return 0;
  }
  uint64_t v5 = 0;
  if ((sub_2605DC8A4() & 1) == 0)
  {
    BOOL v6 = a1 == 1853321060 && a2 == 0xE400000000000000;
    if (v6 || (sub_2605DC8A4() & 1) != 0)
    {
      return 1;
    }
    else
    {
      BOOL v8 = a1 == 0x7468676972 && a2 == 0xE500000000000000;
      if (v8 || (sub_2605DC8A4() & 1) != 0)
      {
        return 3;
      }
      else
      {
        BOOL v9 = a1 == 1952867692 && a2 == 0xE400000000000000;
        if (v9 || (sub_2605DC8A4() & 1) != 0)
        {
          return 2;
        }
        else
        {
          BOOL v10 = a1 == 7368564 && a2 == 0xE300000000000000;
          if (v10 || (sub_2605DC8A4() & 1) != 0)
          {
            return 4;
          }
          else
          {
            uint64_t v5 = 5;
            if (a1 != 0x6D6F74746F62 || a2 != 0xE600000000000000)
            {
              if (sub_2605DC8A4()) {
                return 5;
              }
              else {
                return 3;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

uint64_t sub_2605DBF14()
{
  uint64_t v0 = sub_2605E22B0();
  sub_2605C6474(v0, qword_26A88C310);
  sub_2605C5664(v0, (uint64_t)qword_26A88C310);
  return sub_2605E22A0();
}

uint64_t static ScrollAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A88BD18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2605E22B0();
  uint64_t v3 = sub_2605C5664(v2, (uint64_t)qword_26A88C310);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t ScrollAction.init()@<X0>(uint64_t *a1@<X8>)
{
  sub_2605E21A0();
  sub_2605C64D8();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_2605C64F8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2605BBCB8(&qword_26A88BE48);
  uint64_t v12 = sub_2605C6508(v11);
  MEMORY[0x270FA5388](v12);
  sub_2605C64F8();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_2605BBCB8(&qword_26A88BE50);
  uint64_t v17 = sub_2605C6508(v16);
  MEMORY[0x270FA5388](v17);
  sub_2605C6548();
  uint64_t v18 = sub_2605BBCB8(&qword_26A88BE58);
  uint64_t v19 = sub_2605C6508(v18);
  MEMORY[0x270FA5388](v19);
  sub_2605C6530();
  uint64_t v20 = sub_2605E22B0();
  MEMORY[0x270FA5388](v20);
  sub_2605C5138();
  sub_2605BBCB8(&qword_26A88BE60);
  sub_2605DC8C0();
  sub_2605E22A0();
  sub_2605C3DD0(v3, 0, 1, v20);
  uint64_t v21 = sub_2605E2940();
  sub_2605C3DD0(v2, 1, 1, v21);
  uint64_t v22 = sub_2605E2140();
  sub_2605C3DD0(v15, 1, 1, v22);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, *MEMORY[0x263EFBDC8], v1);
  uint64_t v23 = sub_2605E2190();
  swift_retain();
  sub_2605E2180();
  uint64_t result = swift_release();
  *a1 = v23;
  return result;
}

uint64_t ScrollAction.perform()(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[4] = a1;
  v2[5] = v3;
  sub_2605E2BC0();
  v2[6] = sub_2605E2BB0();
  uint64_t v5 = sub_2605E2BA0();
  return MEMORY[0x270FA2498](sub_2605DC32C, v5, v4);
}

uint64_t sub_2605DC32C()
{
  swift_release();
  swift_retain();
  sub_2605E2170();
  swift_release();
  char v1 = sub_2605DBD9C(v0[2], v0[3]);
  swift_bridgeObjectRelease();
  type metadata accessor for AccessibilityActionPerformer();
  sub_2605C9F78(v1);
  sub_2605E2160();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

Swift::Bool __swiftcall ScrollAction.execute(with:)(UINavigationKit::ContextSource with)
{
  uint64_t v1 = *(unsigned __int8 *)with;
  swift_retain();
  sub_2605E2170();
  swift_release();
  char v2 = sub_2605DBD9C(v15, v16);
  swift_bridgeObjectRelease();
  switch(v1)
  {
    case 1:
      type metadata accessor for AccessibilityActionPerformer();
      return sub_2605C9F78(v2);
    case 2:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_2605E2810();
      os_log_type_t v4 = sub_2605C5664(v10, (uint64_t)qword_26A88C7A8);
      uint64_t v5 = sub_2605E2800();
      os_log_type_t v11 = sub_2605E2C10();
      if (!sub_2605C6514(v11)) {
        goto LABEL_16;
      }
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      uint64_t v8 = "ContextKit is unsupported for Scroll";
      break;
    case 3:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_2605E2810();
      os_log_type_t v4 = sub_2605C5664(v12, (uint64_t)qword_26A88C7A8);
      uint64_t v5 = sub_2605E2800();
      os_log_type_t v13 = sub_2605E2C10();
      if (!sub_2605C6514(v13)) {
        goto LABEL_16;
      }
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      uint64_t v8 = "UIUnderstanding is unsupported for Scroll";
      break;
    default:
      if (qword_26A88BD00 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_2605E2810();
      os_log_type_t v4 = sub_2605C5664(v3, (uint64_t)qword_26A88C7A8);
      uint64_t v5 = sub_2605E2800();
      os_log_type_t v6 = sub_2605E2C10();
      if (!sub_2605C6514(v6)) {
        goto LABEL_16;
      }
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      uint64_t v8 = "Unknown source sent";
      break;
  }
  _os_log_impl(&dword_2605B8000, v5, v4, v8, v7, 2u);
  MEMORY[0x261216700](v7, -1, -1);
LABEL_16:

  return 0;
}

uint64_t sub_2605DC664(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2605C6180;
  return ScrollAction.perform()(a1);
}

uint64_t sub_2605DC700(uint64_t a1)
{
  unint64_t v2 = sub_2605DC848();

  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_2605DC740()
{
  unint64_t result = qword_26A88C330;
  if (!qword_26A88C330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C330);
  }
  return result;
}

unint64_t sub_2605DC790()
{
  unint64_t result = qword_26A88C338;
  if (!qword_26A88C338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C338);
  }
  return result;
}

uint64_t sub_2605DC7DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2605DC7F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2605DC848()
{
  unint64_t result = qword_26A88C340;
  if (!qword_26A88C340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C340);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScrollAction()
{
  return &type metadata for ScrollAction;
}

uint64_t sub_2605DC8A4()
{
  return sub_2605E2F40();
}

uint64_t sub_2605DC8C0()
{
  return sub_2605E22A0();
}

uint64_t sub_2605DC8E8(uint64_t a1)
{
  sub_2605BBCB8(&qword_26A88C350);
  uint64_t v2 = sub_2605E2890();
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return v2;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  sub_2605DE684();
  uint64_t v9 = &off_265561000;
  while (2)
  {
    while (2)
    {
      uint64_t v10 = 0;
      char v11 = 0;
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
LABEL_4:
      uint64_t v16 = (double *)(a1 + 32 + 32 * v5++);
      while (1)
      {
        if (v5 - 1 >= v3)
        {
          __break(1u);
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        if (*((void *)v16 + 3) == 1)
        {
          double v17 = *v16;
          double v18 = v16[1];
          BOOL v19 = __OFADD__(v10++, 1);
          char v20 = v19;
          if (v11)
          {
            double v12 = v18;
            double v13 = v17;
            double v18 = v14;
            double v17 = v15;
            if (v20) {
              goto LABEL_63;
            }
          }
          else if (v20)
          {
LABEL_64:
            __break(1u);
            goto LABEL_65;
          }
          char v11 = 1;
          double v14 = v18;
          double v15 = v17;
          if (v5 != v3) {
            goto LABEL_4;
          }
          goto LABEL_60;
        }
        if (v11) {
          break;
        }
        char v11 = 0;
        v16 += 4;
        if (++v5 - v3 == 1) {
          goto LABEL_60;
        }
      }
      uint64_t v21 = v5 - v3;
      if (v10 >= 4)
      {
        double v22 = vabdd_f64(v15, v13);
        double v23 = vabdd_f64(v14, v12);
        if (v13 < v15) {
          char v24 = 1;
        }
        else {
          char v24 = v6;
        }
        if (v12 >= v14) {
          char v25 = v7;
        }
        else {
          char v25 = v8;
        }
        if (v23 >= v22) {
          char v24 = v25;
        }
        char v71 = v24;
        long long v26 = self;
        id v27 = [v26 (SEL)v9[153]];
        if (v27)
        {
          uint64_t v28 = v27;
          objc_msgSend(v27, sel_nativeSize);
          double v30 = v29;
          objc_msgSend(v28, (SEL)&off_265561030 + 2);
          double v32 = v31;

          double v15 = v15 * v30;
          double v14 = v14 * v32;
        }
        id v33 = objc_msgSend(v26, sel_mainDisplay);
        if (v33)
        {
          unint64_t v34 = v33;
          objc_msgSend(v33, sel_nativeSize);
          double v36 = v35;
          objc_msgSend(v34, sel_nativeSize);
          double v38 = v37;

          double v13 = v13 * v36;
          double v12 = v12 * v38;
        }
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v73 = v4;
        unint64_t v39 = sub_2605C3A80(v4);
        char v72 = v40;
        if (!__OFADD__(*(void *)(v2 + 16), (v40 & 1) == 0))
        {
          unint64_t v41 = v39;
          sub_2605BBCB8(&qword_26A88C358);
          uint64_t v9 = &off_265561000;
          if (sub_2605DE6D8())
          {
            unint64_t v42 = sub_2605C3A80(v4);
            if ((v72 & 1) != (v43 & 1)) {
              goto LABEL_71;
            }
            unint64_t v41 = v42;
          }
          if (v72)
          {
            uint64_t v44 = *(void *)(v2 + 56) + 40 * v41;
            *(unsigned char *)uint64_t v44 = v71;
            *(double *)(v44 + 8) = v15;
            *(double *)(v44 + 16) = v14;
            *(double *)(v44 + 24) = v13;
            *(double *)(v44 + 32) = v12;
          }
          else
          {
            sub_2605DE650();
            *(unsigned char *)uint64_t v65 = v71;
            sub_2605DE6F8(v65);
            if (v19) {
              goto LABEL_69;
            }
            *(void *)(v2 + 16) = v66;
          }
          swift_bridgeObjectRelease();
          ++v4;
          if (!__OFADD__(v73, 1))
          {
            sub_2605DE684();
            if (v21) {
              continue;
            }
            goto LABEL_60;
          }
          goto LABEL_66;
        }
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      break;
    }
    if (v10 == 3)
    {
      char v11 = 1;
      if (v21) {
        goto LABEL_4;
      }
LABEL_60:
      swift_bridgeObjectRelease();
      return v2;
    }
    BOOL v45 = self;
    id v46 = [v45 (SEL)v9[153]];
    if (v46)
    {
      uint64_t v47 = v46;
      objc_msgSend(v46, sel_nativeSize);
      double v49 = v48;
      objc_msgSend(v47, sel_nativeSize);
      double v51 = v50;

      double v15 = v15 * v49;
      double v14 = v14 * v51;
    }
    id v52 = objc_msgSend(v45, sel_mainDisplay);
    if (v52)
    {
      uint64_t v53 = v52;
      objc_msgSend(v52, sel_nativeSize);
      double v55 = v54;
      objc_msgSend(v53, sel_nativeSize);
      double v57 = v56;

      double v13 = v13 * v55;
      double v12 = v12 * v57;
    }
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v74 = v4;
    unint64_t v58 = sub_2605C3A80(v4);
    if (__OFADD__(*(void *)(v2 + 16), (v59 & 1) == 0)) {
      goto LABEL_67;
    }
    unint64_t v60 = v58;
    char v61 = v59;
    sub_2605BBCB8(&qword_26A88C358);
    uint64_t v9 = &off_265561000;
    if ((sub_2605DE6D8() & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v62 = sub_2605C3A80(v4);
    if ((v61 & 1) == (v63 & 1))
    {
      unint64_t v60 = v62;
LABEL_49:
      if (v61)
      {
        uint64_t v64 = *(void *)(v2 + 56) + 40 * v60;
        *(unsigned char *)uint64_t v64 = 0;
        *(double *)(v64 + 8) = v15;
        *(double *)(v64 + 16) = v14;
        *(double *)(v64 + 24) = v13;
        *(double *)(v64 + 32) = v12;
LABEL_58:
        swift_bridgeObjectRelease();
        ++v4;
        if (!__OFADD__(v74, 1))
        {
          sub_2605DE684();
          if (v69) {
            continue;
          }
          goto LABEL_60;
        }
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
      }
      else
      {
        sub_2605DE650();
        *(unsigned char *)uint64_t v67 = 0;
        sub_2605DE6F8(v67);
        if (!v19)
        {
          *(void *)(v2 + 16) = v68;
          goto LABEL_58;
        }
      }
      __break(1u);
    }
    break;
  }
LABEL_71:
  uint64_t result = sub_2605E2F60();
  __break(1u);
  return result;
}

uint64_t readTrajectoryFile(nlg:)()
{
  uint64_t v0 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v43 - v8;
  MEMORY[0x270FA5388](v7);
  char v11 = (char *)&v43 - v10;
  id v12 = objc_msgSend(self, sel_defaultManager);
  id v13 = objc_msgSend(v12, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v14 = sub_2605E2B40();
  if (*(void *)(v14 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v11, v14 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)), v0);
    swift_bridgeObjectRelease();
    sub_2605E2300();
    id v46 = v9;
    sub_2605E2300();
    uint64_t v15 = sub_2605BBCB8(&qword_26A88C350);
    uint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t v17 = sub_2605E2890();
    v18._uint64_t countAndFlagsBits = sub_2605E22C0();
    uint64_t v19 = (unint64_t)readMatrixFromActionFile(filePath:)(v18);
    swift_bridgeObjectRelease();
    if (v19)
    {
      swift_bridgeObjectRelease();
      uint64_t v17 = sub_2605DC8E8(v19);
      swift_bridgeObjectRelease();
    }
    BOOL v45 = v11;
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v20 = sub_2605C4BCC();
    long long v49 = xmmword_2605E3700;
    *(_OWORD *)(v20 + 16) = xmmword_2605E3700;
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    *(void *)(v20 + 32) = 0xD000000000000032;
    *(void *)(v20 + 40) = 0x80000002605E5F00;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_2605DDAF8(v17);
    swift_bridgeObjectRelease();
    double v51 = v21;
    sub_2605DDA8C((uint64_t *)&v51);
    uint64_t v47 = v6;
    uint64_t v48 = v2;
    swift_bridgeObjectRelease();
    uint64_t v22 = (uint64_t)v51;
    uint64_t v23 = v51[2];
    if (v23)
    {
      *(void *)&long long v50 = v0;
      double v51 = (void *)v16;
      sub_2605D5490(0, v23, 0);
      uint64_t v24 = (uint64_t)v51;
      unint64_t v25 = v51[2];
      uint64_t v26 = 40 * v25 + 32;
      id v27 = (_OWORD *)(v22 + 64);
      do
      {
        char v28 = *((unsigned char *)v27 - 24);
        long long v29 = *(v27 - 1);
        long long v30 = *v27;
        double v51 = (void *)v24;
        unint64_t v31 = *(void *)(v24 + 24);
        unint64_t v32 = v25 + 1;
        if (v25 >= v31 >> 1)
        {
          long long v43 = v30;
          long long v44 = v29;
          sub_2605D5490(v31 > 1, v25 + 1, 1);
          long long v30 = v43;
          long long v29 = v44;
          uint64_t v24 = (uint64_t)v51;
        }
        *(void *)(v24 + 16) = v32;
        uint64_t v33 = v24 + v26;
        *(unsigned char *)uint64_t v33 = v28;
        *(_OWORD *)(v33 + 8) = v29;
        *(_OWORD *)(v33 + 24) = v30;
        v26 += 40;
        v27 += 3;
        unint64_t v25 = v32;
        --v23;
      }
      while (v23);
      swift_release();
    }
    else
    {
      swift_release();
      uint64_t v24 = MEMORY[0x263F8EE78];
    }
    uint64_t v34 = *(void *)(v24 + 16);
    if (v34)
    {
      double v35 = (void *)(v24 + 64);
      do
      {
        char v36 = *((unsigned char *)v35 - 32);
        long long v50 = *(_OWORD *)(v35 - 3);
        uint64_t v37 = *(v35 - 1);
        uint64_t v38 = *v35;
        uint64_t v39 = sub_2605C4BCC();
        *(_OWORD *)(v39 + 16) = v49;
        *(void *)(v39 + 56) = v15;
        uint64_t v40 = swift_allocObject();
        *(void *)(v39 + 32) = v40;
        *(unsigned char *)(v40 + 16) = v36;
        *(_OWORD *)(v40 + 24) = v50;
        *(void *)(v40 + 40) = v37;
        *(void *)(v40 + 48) = v38;
        sub_2605C4B94();
        swift_bridgeObjectRelease();
        v35 += 5;
        --v34;
      }
      while (v34);
    }
    swift_bridgeObjectRelease();
    unint64_t v41 = *(void (**)(void))(v48 + 8);
    sub_2605DE698();
    v41();
    sub_2605DE698();
    v41();
    sub_2605DE698();
    v41();
    return v17;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
  }
  return result;
}

double hidEventFields.x.getter()
{
  return *(double *)v0;
}

double hidEventFields.y.getter()
{
  return *(double *)(v0 + 8);
}

uint64_t hidEventFields.time.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t hidEventFields.touchFlag.getter()
{
  return *(void *)(v0 + 24);
}

Swift::OpaquePointer_optional __swiftcall readMatrixFromActionFile(filePath:)(Swift::String filePath)
{
  uint64_t v1 = sub_2605E2280();
  sub_2605C4B78();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  sub_2605C64F8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_2605E29B0();
  MEMORY[0x270FA5388](v8 - 8);
  sub_2605C64F8();
  uint64_t v9 = sub_2605BBCB8(&qword_26A88BD90);
  MEMORY[0x270FA5388](v9 - 8);
  sub_2605C64F8();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_2605E2330();
  sub_2605C4B78();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_2605C64F8();
  uint64_t v19 = v18 - v17;
  sub_2605E2320();
  if (sub_2605C3DF8(v12, 1, v13) == 1)
  {
    sub_2605C89E8(v12);
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v20 = sub_2605C4BCC();
    *(_OWORD *)(v20 + 16) = xmmword_2605E3700;
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    *(void *)(v20 + 32) = 0xD000000000000011;
    *(void *)(v20 + 40) = 0x80000002605E5050;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    uint64_t v22 = 0;
LABEL_4:
    uint64_t isUniquelyReferenced_nonNull_native = v22;
    goto LABEL_94;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v19, v12, v13);
  sub_2605E29A0();
  uint64_t v68 = v19;
  sub_2605E2950();
  sub_2605E2270();
  sub_2605C4948();
  uint64_t v23 = sub_2605E2CC0();
  uint64_t v24 = v7;
  uint64_t v25 = v23;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v24, v1);
  uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(v25 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v29 = v68;
LABEL_86:
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v13);
    goto LABEL_4;
  }
  unint64_t v28 = 0;
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t v65 = v15;
  uint64_t v66 = v13;
  uint64_t v29 = v68;
  uint64_t v67 = v25;
  uint64_t v64 = *(void *)(v25 + 16);
  while (v28 < *(void *)(v25 + 16))
  {
    long long v30 = (void *)sub_2605E2CD0();
    if (v30[2] != 4)
    {
      uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      goto LABEL_59;
    }
    uint64_t v69 = v22;
    char v31 = 1;
    uint64_t isUniquelyReferenced_nonNull_native = sub_2605DE70C(0);
    uint64_t v33 = v30[4];
    unint64_t v32 = v30[5];
    uint64_t v34 = HIBYTE(v32) & 0xF;
    uint64_t v21 = v33 & 0xFFFFFFFFFFFFLL;
    if ((v32 & 0x2000000000000000) != 0) {
      uint64_t v35 = HIBYTE(v32) & 0xF;
    }
    else {
      uint64_t v35 = v33 & 0xFFFFFFFFFFFFLL;
    }
    if (v35)
    {
      if ((v32 & 0x1000000000000000) == 0)
      {
        if ((v32 & 0x2000000000000000) == 0)
        {
          if ((v33 & 0x1000000000000000) != 0) {
            char v36 = (unsigned __int8 *)((v32 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else {
            char v36 = (unsigned __int8 *)sub_2605E2DB0();
          }
          uint64_t v37 = (uint64_t)sub_2605C3DB8(v36, v21);
          LOBYTE(v15) = v38 & 1;
          goto LABEL_47;
        }
        if (v30[4] == 43)
        {
          if (!v34) {
            goto LABEL_89;
          }
          if (v34 == 1 || (BYTE1(v33) - 48) > 9u) {
            goto LABEL_43;
          }
          uint64_t v37 = (BYTE1(v33) - 48);
          if (v34 == 2) {
            goto LABEL_46;
          }
          if ((BYTE2(v33) - 48) <= 9u)
          {
            uint64_t v37 = 10 * (BYTE1(v33) - 48) + (BYTE2(v33) - 48);
            if (v34 != 3)
            {
              while (1)
              {
                sub_2605DE6B8();
                if (!v42 && v40) {
                  goto LABEL_43;
                }
                sub_2605DE6A8();
                if (!v42) {
                  goto LABEL_43;
                }
                BOOL v40 = __CFADD__(10 * v37, v43);
                uint64_t v37 = 10 * v37 + v43;
                if (v40) {
                  goto LABEL_43;
                }
                sub_2605DE6C8();
                if (v42) {
                  goto LABEL_47;
                }
              }
            }
            goto LABEL_46;
          }
        }
        else if (v30[4] == 45)
        {
          if (!v34) {
            goto LABEL_88;
          }
          if (v34 != 1)
          {
            unsigned __int8 v39 = BYTE1(v33) - 48;
            if ((BYTE1(v33) - 48) <= 9u)
            {
              uint64_t v37 = 0;
              BOOL v40 = v39 == 0;
              unint64_t v41 = -(uint64_t)v39;
              if (!v40)
              {
LABEL_44:
                LOBYTE(v15) = 1;
                goto LABEL_47;
              }
              if (v34 == 2)
              {
                LOBYTE(v15) = 0;
                uint64_t v37 = v41;
                goto LABEL_47;
              }
              unsigned __int8 v60 = BYTE2(v33) - 48;
              if ((BYTE2(v33) - 48) <= 9u && is_mul_ok(v41, 0xAuLL))
              {
                unint64_t v61 = 10 * v41;
                uint64_t v37 = v61 - v60;
                if (v61 >= v60)
                {
                  if (v34 != 3)
                  {
                    while (1)
                    {
                      sub_2605DE6B8();
                      if (!v42 && v40) {
                        goto LABEL_43;
                      }
                      sub_2605DE6A8();
                      if (!v42) {
                        goto LABEL_43;
                      }
                      BOOL v40 = 10 * v37 >= (unint64_t)v62;
                      uint64_t v37 = 10 * v37 - v62;
                      if (!v40) {
                        goto LABEL_43;
                      }
                      sub_2605DE6C8();
                      if (v42) {
                        goto LABEL_47;
                      }
                    }
                  }
LABEL_46:
                  LOBYTE(v15) = 0;
LABEL_47:
                  char v31 = v15 & 1;
                  if (v15) {
                    uint64_t v44 = 0;
                  }
                  else {
                    uint64_t v44 = v37;
                  }
                  goto LABEL_50;
                }
              }
            }
          }
        }
        else if (v34 && (v33 - 48) <= 9u)
        {
          uint64_t v37 = (v33 - 48);
          if (v34 == 1) {
            goto LABEL_46;
          }
          if ((BYTE1(v33) - 48) <= 9u)
          {
            uint64_t v37 = 10 * (v33 - 48) + (BYTE1(v33) - 48);
            if (v34 != 2)
            {
              while (1)
              {
                sub_2605DE6B8();
                if (!v42 && v40) {
                  goto LABEL_43;
                }
                sub_2605DE6A8();
                if (!v42) {
                  goto LABEL_43;
                }
                BOOL v40 = __CFADD__(10 * v37, v59);
                uint64_t v37 = 10 * v37 + v59;
                if (v40) {
                  goto LABEL_43;
                }
                sub_2605DE6C8();
                if (v42) {
                  goto LABEL_47;
                }
              }
            }
            goto LABEL_46;
          }
        }
LABEL_43:
        uint64_t v37 = 0;
        goto LABEL_44;
      }
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_2605C3E20(v33, v32, 10);
      LOBYTE(v15) = v63;
      swift_bridgeObjectRelease();
      goto LABEL_47;
    }
    uint64_t v44 = 0;
LABEL_50:
    sub_2605DE70C(1);
    uint64_t v45 = v30[6];
    unint64_t v46 = v30[7];
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2605BD14C(v45, v46);
    char v49 = v48;
    sub_2605DE70C(2);
    uint64_t v50 = v30[8];
    uint64_t v51 = v30[9];
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_2605C7A20(v50, v51);
    LOBYTE(v50) = v53;
    sub_2605DE70C(3);
    uint64_t v55 = v30[10];
    uint64_t v54 = v30[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t isUniquelyReferenced_nonNull_native = sub_2605C7A20(v55, v54);
    if (v50) {
      goto LABEL_90;
    }
    if (v21) {
      goto LABEL_91;
    }
    uint64_t v25 = v67;
    if (v31) {
      goto LABEL_92;
    }
    if (v49) {
      goto LABEL_93;
    }
    uint64_t v56 = isUniquelyReferenced_nonNull_native;
    uint64_t v22 = v69;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2605C2F5C();
      uint64_t v22 = isUniquelyReferenced_nonNull_native;
    }
    unint64_t v57 = *(void *)(v22 + 16);
    if (v57 >= *(void *)(v22 + 24) >> 1)
    {
      sub_2605C2F5C();
      uint64_t v22 = isUniquelyReferenced_nonNull_native;
    }
    *(void *)(v22 + 16) = v57 + 1;
    unint64_t v58 = (void *)(v22 + 32 * v57);
    v58[4] = v52;
    v58[5] = v56;
    v58[6] = v44;
    v58[7] = v47;
    uint64_t v15 = v65;
    uint64_t v13 = v66;
    uint64_t v29 = v68;
    uint64_t v27 = v64;
LABEL_59:
    if (++v28 == v27)
    {
      swift_bridgeObjectRelease();
      goto LABEL_86;
    }
  }
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  result.Swift::Bool is_nil = v21;
  result.value._rawValue = (void *)isUniquelyReferenced_nonNull_native;
  return result;
}

CGPoint __swiftcall transformPointCoordForInjection(point:)(CGPoint point)
{
  double y = point.y;
  double x = point.x;
  id v3 = objc_msgSend(self, sel_mainDisplay);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_nativeSize);
    double v6 = v5;
    objc_msgSend(v4, sel_nativeSize);
    double v8 = v7;

    double x = v6 * x;
    double y = v8 * y;
  }
  double v9 = x;
  double v10 = y;
  result.double y = v10;
  result.double x = v9;
  return result;
}

void sub_2605DDA8C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2605DB9E4(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_2605DDBFC(v5);
  *a1 = v2;
}

void *sub_2605DDAF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_2605BBCB8(&qword_26A88C308);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 48);
  double v5 = sub_2605DE494(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_2605DE648();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2605DDBDC()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

ValueMetadata *type metadata accessor for hidEventFields()
{
  return &type metadata for hidEventFields;
}

void sub_2605DDBFC(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_2605E2F10();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_2605DE25C(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_125;
  }
  uint64_t v5 = v4;
  unint64_t v99 = a1;
  uint64_t v100 = sub_2605C2998(v3 / 2);
  uint64_t v102 = v3;
  uint64_t v103 = v6;
  if (v3 <= 0)
  {
    uint64_t v104 = MEMORY[0x263F8EE78];
    unint64_t v32 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_91:
    if (v32 < 2)
    {
LABEL_102:
      swift_bridgeObjectRelease();
      if (v102 >= -1)
      {
        *(void *)(v100 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_130;
    }
    uint64_t v91 = *v99;
    while (1)
    {
      unint64_t v92 = v32 - 2;
      if (v32 < 2) {
        break;
      }
      if (!v91) {
        goto LABEL_134;
      }
      uint64_t v93 = v104;
      uint64_t v94 = *(void *)(v104 + 32 + 16 * v92);
      uint64_t v95 = *(void *)(v104 + 32 + 16 * (v32 - 1) + 8);
      sub_2605DE2EC((char *)(v91 + 48 * v94), (char *)(v91 + 48 * *(void *)(v104 + 32 + 16 * (v32 - 1))), v91 + 48 * v95, v103);
      if (v1) {
        goto LABEL_87;
      }
      if (v95 < v94) {
        goto LABEL_120;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2605DB938(v104);
        uint64_t v93 = v98;
      }
      if (v92 >= *(void *)(v93 + 16)) {
        goto LABEL_121;
      }
      uint64_t v96 = (void *)(v93 + 32 + 16 * v92);
      void *v96 = v94;
      v96[1] = v95;
      unint64_t v97 = *(void *)(v93 + 16);
      if (v32 > v97) {
        goto LABEL_122;
      }
      memmove((void *)(v93 + 32 + 16 * (v32 - 1)), (const void *)(v93 + 32 + 16 * v32), 16 * (v97 - v32));
      uint64_t v104 = v93;
      *(void *)(v93 + 16) = v97 - 1;
      unint64_t v32 = v97 - 1;
      if (v97 <= 2) {
        goto LABEL_102;
      }
    }
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v104 = MEMORY[0x263F8EE78];
  uint64_t v101 = v5;
  while (1)
  {
    uint64_t v9 = v7++;
    if (v7 < v3)
    {
      uint64_t v10 = *(void *)(v8 + 48 * v7);
      uint64_t v11 = *(void *)(v8 + 48 * v9);
      uint64_t v7 = v9 + 2;
      if (v9 + 2 < v3)
      {
        uint64_t v12 = (uint64_t *)(v8 + 96 + 48 * v9);
        uint64_t v13 = v10;
        while (1)
        {
          uint64_t v15 = *v12;
          v12 += 6;
          uint64_t v14 = v15;
          if (v10 < v11 == v15 >= v13) {
            break;
          }
          ++v7;
          uint64_t v13 = v14;
          if (v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v10 < v11)
      {
        if (v7 < v9) {
          goto LABEL_127;
        }
        if (v9 < v7)
        {
          uint64_t v16 = 48 * v7;
          uint64_t v17 = 48 * v9;
          uint64_t v18 = v7;
          uint64_t v19 = v9;
          do
          {
            if (v19 != --v18)
            {
              if (!v8) {
                goto LABEL_133;
              }
              uint64_t v20 = (_OWORD *)(v8 + v17);
              uint64_t v21 = *(void *)(v8 + v17);
              uint64_t v22 = v8 + v16;
              char v23 = *(unsigned char *)(v8 + v17 + 8);
              long long v24 = *(_OWORD *)(v8 + v17 + 16);
              long long v25 = *(_OWORD *)(v8 + v17 + 32);
              long long v27 = *(_OWORD *)(v8 + v16 - 32);
              long long v26 = *(_OWORD *)(v8 + v16 - 16);
              _OWORD *v20 = *(_OWORD *)(v8 + v16 - 48);
              v20[1] = v27;
              v20[2] = v26;
              *(void *)(v22 - 48) = v21;
              *(unsigned char *)(v22 - 40) = v23;
              *(_OWORD *)(v22 - 32) = v24;
              *(_OWORD *)(v22 - 16) = v25;
            }
            ++v19;
            v16 -= 48;
            v17 += 48;
          }
          while (v19 < v18);
        }
      }
    }
    if (v7 >= v3) {
      goto LABEL_26;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_124;
    }
    if (v7 - v9 >= v5) {
      goto LABEL_26;
    }
    uint64_t v28 = v9 + v5;
    if (__OFADD__(v9, v5)) {
      goto LABEL_128;
    }
    if (v28 >= v3) {
      uint64_t v28 = v3;
    }
    if (v28 < v9) {
      goto LABEL_129;
    }
    if (v7 == v28)
    {
LABEL_26:
      uint64_t v29 = v104;
    }
    else
    {
      uint64_t v80 = v8 + 32 + 48 * v7;
      uint64_t v29 = v104;
      do
      {
        uint64_t v81 = *(void *)(v8 + 48 * v7);
        uint64_t v82 = v9;
        uint64_t v83 = v80;
        do
        {
          unint64_t v84 = (_OWORD *)(v83 - 80);
          if (v81 >= *(void *)(v83 - 80)) {
            break;
          }
          if (!v8) {
            goto LABEL_131;
          }
          long long v86 = *(_OWORD *)(v83 - 64);
          long long v85 = *(_OWORD *)(v83 - 48);
          *(_OWORD *)(v83 - 48) = *(_OWORD *)v83;
          v83 -= 48;
          char v87 = *(unsigned char *)(v83 + 24);
          long long v88 = *(_OWORD *)(v83 + 32);
          v84[3] = *v84;
          v84[4] = v86;
          v84[5] = v85;
          *(void *)(v83 - 32) = v81;
          *(unsigned char *)(v83 - 24) = v87;
          *(_OWORD *)(v83 - 16) = v88;
          ++v82;
        }
        while (v7 != v82);
        ++v7;
        v80 += 48;
      }
      while (v7 != v28);
      uint64_t v7 = v28;
    }
    if (v7 < v9) {
      goto LABEL_123;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2605DB860(0, *(void *)(v29 + 16) + 1, 1, (char *)v29);
      uint64_t v29 = v89;
    }
    unint64_t v31 = *(void *)(v29 + 16);
    unint64_t v30 = *(void *)(v29 + 24);
    unint64_t v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      sub_2605DB860(v30 > 1, v31 + 1, 1, (char *)v29);
      uint64_t v29 = v90;
    }
    *(void *)(v29 + 16) = v32;
    uint64_t v33 = v29 + 32;
    uint64_t v34 = (uint64_t *)(v29 + 32 + 16 * v31);
    *uint64_t v34 = v9;
    v34[1] = v7;
    uint64_t v104 = v29;
    if (v31) {
      break;
    }
    unint64_t v32 = 1;
LABEL_75:
    uint64_t v5 = v101;
    uint64_t v3 = v102;
    if (v7 >= v102) {
      goto LABEL_91;
    }
  }
  while (1)
  {
    unint64_t v35 = v32 - 1;
    if (v32 >= 4)
    {
      unint64_t v40 = v33 + 16 * v32;
      uint64_t v41 = *(void *)(v40 - 64);
      uint64_t v42 = *(void *)(v40 - 56);
      BOOL v46 = __OFSUB__(v42, v41);
      uint64_t v43 = v42 - v41;
      if (v46) {
        goto LABEL_108;
      }
      uint64_t v45 = *(void *)(v40 - 48);
      uint64_t v44 = *(void *)(v40 - 40);
      BOOL v46 = __OFSUB__(v44, v45);
      uint64_t v38 = v44 - v45;
      char v39 = v46;
      if (v46) {
        goto LABEL_109;
      }
      unint64_t v47 = v32 - 2;
      char v48 = (uint64_t *)(v33 + 16 * (v32 - 2));
      uint64_t v50 = *v48;
      uint64_t v49 = v48[1];
      BOOL v46 = __OFSUB__(v49, v50);
      uint64_t v51 = v49 - v50;
      if (v46) {
        goto LABEL_110;
      }
      BOOL v46 = __OFADD__(v38, v51);
      uint64_t v52 = v38 + v51;
      if (v46) {
        goto LABEL_112;
      }
      if (v52 >= v43)
      {
        uint64_t v70 = (uint64_t *)(v33 + 16 * v35);
        uint64_t v72 = *v70;
        uint64_t v71 = v70[1];
        BOOL v46 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v46) {
          goto LABEL_118;
        }
        BOOL v63 = v38 < v73;
        goto LABEL_64;
      }
    }
    else
    {
      if (v32 != 3)
      {
        uint64_t v64 = *(void *)(v29 + 32);
        uint64_t v65 = *(void *)(v29 + 40);
        BOOL v46 = __OFSUB__(v65, v64);
        uint64_t v57 = v65 - v64;
        char v58 = v46;
        goto LABEL_58;
      }
      uint64_t v37 = *(void *)(v29 + 32);
      uint64_t v36 = *(void *)(v29 + 40);
      BOOL v46 = __OFSUB__(v36, v37);
      uint64_t v38 = v36 - v37;
      char v39 = v46;
    }
    if (v39) {
      goto LABEL_111;
    }
    unint64_t v47 = v32 - 2;
    char v53 = (uint64_t *)(v33 + 16 * (v32 - 2));
    uint64_t v55 = *v53;
    uint64_t v54 = v53[1];
    BOOL v56 = __OFSUB__(v54, v55);
    uint64_t v57 = v54 - v55;
    char v58 = v56;
    if (v56) {
      goto LABEL_113;
    }
    unsigned __int8 v59 = (uint64_t *)(v33 + 16 * v35);
    uint64_t v61 = *v59;
    uint64_t v60 = v59[1];
    BOOL v46 = __OFSUB__(v60, v61);
    uint64_t v62 = v60 - v61;
    if (v46) {
      goto LABEL_115;
    }
    if (__OFADD__(v57, v62)) {
      goto LABEL_117;
    }
    if (v57 + v62 >= v38)
    {
      BOOL v63 = v38 < v62;
LABEL_64:
      if (v63) {
        unint64_t v35 = v47;
      }
      goto LABEL_66;
    }
LABEL_58:
    if (v58) {
      goto LABEL_114;
    }
    uint64_t v66 = (uint64_t *)(v33 + 16 * v35);
    uint64_t v68 = *v66;
    uint64_t v67 = v66[1];
    BOOL v46 = __OFSUB__(v67, v68);
    uint64_t v69 = v67 - v68;
    if (v46) {
      goto LABEL_116;
    }
    if (v69 < v57) {
      goto LABEL_75;
    }
LABEL_66:
    unint64_t v74 = v35 - 1;
    if (v35 - 1 >= v32)
    {
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
      goto LABEL_119;
    }
    if (!v8) {
      goto LABEL_132;
    }
    uint64_t v75 = (uint64_t *)(v33 + 16 * v74);
    uint64_t v76 = *v75;
    uint64_t v77 = (void *)(v33 + 16 * v35);
    uint64_t v78 = v77[1];
    sub_2605DE2EC((char *)(v8 + 48 * *v75), (char *)(v8 + 48 * *v77), v8 + 48 * v78, v103);
    if (v1) {
      break;
    }
    if (v78 < v76) {
      goto LABEL_105;
    }
    if (v35 > *(void *)(v104 + 16)) {
      goto LABEL_106;
    }
    *uint64_t v75 = v76;
    *(void *)(v33 + 16 * v74 + 8) = v78;
    unint64_t v79 = *(void *)(v104 + 16);
    if (v35 >= v79) {
      goto LABEL_107;
    }
    uint64_t v29 = v104;
    unint64_t v32 = v79 - 1;
    memmove((void *)(v33 + 16 * v35), v77 + 2, 16 * (v79 - 1 - v35));
    *(void *)(v104 + 16) = v79 - 1;
    if (v79 <= 2) {
      goto LABEL_75;
    }
  }
LABEL_87:
  swift_bridgeObjectRelease();
  if (v102 < -1) {
    goto LABEL_126;
  }
  *(void *)(v100 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_2605DE25C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 48 * a3 + 32;
    while (2)
    {
      uint64_t v6 = *(void *)(v4 + 48 * a3);
      uint64_t v7 = result;
      uint64_t v8 = v5;
      do
      {
        uint64_t v9 = (_OWORD *)(v8 - 80);
        if (v6 >= *(void *)(v8 - 80)) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        long long v11 = *(_OWORD *)(v8 - 64);
        long long v10 = *(_OWORD *)(v8 - 48);
        *(_OWORD *)(v8 - 48) = *(_OWORD *)v8;
        v8 -= 48;
        char v12 = *(unsigned char *)(v8 + 24);
        long long v13 = *(_OWORD *)(v8 + 32);
        v9[3] = *v9;
        void v9[4] = v11;
        v9[5] = v10;
        *(void *)(v8 - 32) = v6;
        *(unsigned char *)(v8 - 24) = v12;
        *(_OWORD *)(v8 - 16) = v13;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 48;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_2605DE2EC(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  if (v9 >= v11)
  {
    sub_2605D9FD8(a2, (uint64_t)(a3 - (void)a2) / 48, a4);
    char v12 = &v4[48 * v11];
    if (v7 >= v6 || v10 < 48) {
      goto LABEL_35;
    }
    uint64_t v18 = (char *)(a3 - 48);
    while (1)
    {
      uint64_t v19 = v18 + 48;
      uint64_t v20 = v6 - 48;
      if (*((void *)v12 - 6) >= *((void *)v6 - 6))
      {
        BOOL v22 = v19 != v12 || v18 >= v12;
        uint64_t v20 = v12 - 48;
        v12 -= 48;
        if (!v22) {
          goto LABEL_31;
        }
      }
      else
      {
        BOOL v21 = v19 != v6 || v18 >= v6;
        v6 -= 48;
        if (!v21) {
          goto LABEL_31;
        }
      }
      long long v23 = *(_OWORD *)v20;
      long long v24 = *((_OWORD *)v20 + 2);
      *((_OWORD *)v18 + 1) = *((_OWORD *)v20 + 1);
      *((_OWORD *)v18 + 2) = v24;
      *(_OWORD *)uint64_t v18 = v23;
LABEL_31:
      v18 -= 48;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_35;
      }
    }
  }
  sub_2605D9FD8(a1, (a2 - a1) / 48, a4);
  char v12 = &v4[48 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 48)
  {
    while (*(void *)v6 >= *(void *)v4)
    {
      long long v13 = v4;
      BOOL v14 = v7 == v4;
      v4 += 48;
      if (!v14) {
        goto LABEL_9;
      }
LABEL_10:
      v7 += 48;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_15;
      }
    }
    long long v13 = v6;
    BOOL v14 = v7 == v6;
    v6 += 48;
    if (v14) {
      goto LABEL_10;
    }
LABEL_9:
    long long v15 = *(_OWORD *)v13;
    long long v16 = *((_OWORD *)v13 + 2);
    *((_OWORD *)v7 + 1) = *((_OWORD *)v13 + 1);
    *((_OWORD *)v7 + 2) = v16;
    *(_OWORD *)uint64_t v7 = v15;
    goto LABEL_10;
  }
LABEL_15:
  uint64_t v6 = v7;
LABEL_35:
  sub_2605D9FD8(v4, (v12 - v4) / 48, v6);
  return 1;
}

void *sub_2605DE494(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *CGPoint result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    uint64_t v17 = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    uint64_t v18 = *(void *)(a4 + 56) + 40 * v12;
    char v19 = *(unsigned char *)v18;
    long long v20 = *(_OWORD *)(v18 + 8);
    long long v21 = *(_OWORD *)(v18 + 24);
    *(void *)a2 = v17;
    *(unsigned char *)(a2 + 8) = v19;
    *(_OWORD *)(a2 + 16) = v20;
    *(_OWORD *)(a2 + 32) = v21;
    a2 += 48;
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2605DE648()
{
  return swift_release();
}

void sub_2605DE650()
{
  *(void *)(v0 + 8 * (v1 >> 6) + 64) |= 1 << v1;
  *(void *)(*(void *)(v0 + 48) + 8 * v1) = v2;
}

uint64_t sub_2605DE6D8()
{
  return sub_2605E2E20();
}

void sub_2605DE6F8(void *a1@<X8>)
{
  a1[1] = v4;
  a1[2] = v3;
  a1[3] = v2;
  a1[4] = v1;
}

uint64_t sub_2605DE70C(uint64_t a1)
{
  return sub_2605C39E4(a1, 1, v1);
}

uint64_t sub_2605DE724()
{
  uint64_t v0 = sub_2605E22B0();
  sub_2605C6474(v0, qword_26A88C360);
  sub_2605C5664(v0, (uint64_t)qword_26A88C360);
  return sub_2605E22A0();
}

uint64_t static OnScreenButtons.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A88BD20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2605E22B0();
  uint64_t v3 = sub_2605C5664(v2, (uint64_t)qword_26A88C360);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t OnScreenButtons.perform()(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  sub_2605E2BC0();
  *(void *)(v1 + 96) = sub_2605E2BB0();
  uint64_t v3 = sub_2605E2BA0();
  return MEMORY[0x270FA2498](sub_2605DE8CC, v3, v2);
}

uint64_t sub_2605DE8CC()
{
  swift_release();
  type metadata accessor for AccessibilityContextRetriever();
  swift_initStackObject();
  uint64_t v1 = sub_2605BC82C();
  sub_2605BC0B4();
  swift_beginAccess();
  uint64_t v2 = v1[3];
  swift_bridgeObjectRetain();
  swift_release();
  *(void *)(v0 + 80) = v2;
  sub_2605BBCB8(&qword_26A88BDA8);
  sub_2605C6FA4();
  sub_2605E2150();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t OnScreenButtons.getLabels()()
{
  type metadata accessor for AccessibilityContextRetriever();
  swift_initStackObject();
  uint64_t v0 = sub_2605BC82C();
  sub_2605BC0B4();
  swift_beginAccess();
  uint64_t v1 = v0[3];
  swift_bridgeObjectRetain();
  swift_release();
  return v1;
}

unint64_t sub_2605DEA34()
{
  unint64_t result = qword_26A88C380;
  if (!qword_26A88C380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C380);
  }
  return result;
}

unint64_t sub_2605DEA84()
{
  unint64_t result = qword_26A88C388;
  if (!qword_26A88C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C388);
  }
  return result;
}

uint64_t sub_2605DEAD0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2605DEB04()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2605DEB54()
{
  unint64_t result = qword_26A88C390;
  if (!qword_26A88C390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C390);
  }
  return result;
}

uint64_t sub_2605DEBA4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2605C6180;
  return OnScreenButtons.perform()(a1);
}

uint64_t sub_2605DEC3C(uint64_t a1)
{
  unint64_t v2 = sub_2605DEB54();

  return MEMORY[0x270EE0D28](a1, v2);
}

ValueMetadata *type metadata accessor for OnScreenButtons()
{
  return &type metadata for OnScreenButtons;
}

uint64_t dispatch thunk of NavigationActionProtocol.execute(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

void sub_2605DEC9C()
{
  id v1 = objc_msgSend(self, sel_clientWithDefaultRequestType_, 10);
  unint64_t v2 = (unint64_t)objc_msgSend(v1, sel_newRequest);
  objc_msgSend((id)v2, sel_setIncludeStructuredExtractionResults_, 1);
  objc_msgSend((id)v2, sel_setIncludeRequestInResponse_, 1);
  unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)objc_msgSend((id)v2, sel_execute);
  id v4 = objc_msgSend((id)isUniquelyReferenced_nonNull_native, sel_error);
  if (v4)
  {
    uint64_t v5 = v4;

LABEL_31:
    return;
  }
  id v6 = objc_msgSend((id)isUniquelyReferenced_nonNull_native, sel_debugRequest);
  if (!v6 || (unint64_t v7 = sub_2605DF2B0(v6)) == 0)
  {

    goto LABEL_31;
  }
  uint64_t v8 = v7;
  if (v7 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2605E2E40();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_7;
    }
LABEL_38:

    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_38;
  }
LABEL_7:
  uint64_t v50 = (void *)isUniquelyReferenced_nonNull_native;
  uint64_t v51 = (void *)v2;
  id v52 = v1;
  int64_t v10 = (uint64_t *)(v0 + 16);
  unint64_t v11 = (uint64_t *)(v0 + 24);
  uint64_t v53 = v8;
  unint64_t v54 = v8 & 0xC000000000000001;
  uint64_t v0 = 4;
  while (1)
  {
    if (v54) {
      id v12 = (id)MEMORY[0x261215E60](v0 - 4, v8);
    }
    else {
      id v12 = *(id *)(v8 + 8 * v0);
    }
    id v1 = v12;
    if (__OFADD__(v0 - 4, 1))
    {
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    uint64_t v55 = v0 - 3;
    uint64_t v56 = v0;
    unint64_t v2 = (unint64_t)v11;
    id v13 = objc_msgSend(v12, sel_text);
    uint64_t v14 = sub_2605E2970();
    uint64_t v16 = v15;

    id v58 = v1;
    id v17 = objc_msgSend(v1, sel_debugDescription);
    uint64_t v8 = sub_2605E2970();
    uint64_t v57 = v18;

    swift_beginAccess();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v0 = *v10;
    uint64_t v59 = *v10;
    *int64_t v10 = 0x8000000000000000;
    unint64_t v19 = sub_2605DF36C();
    if (__OFADD__(*(void *)(v0 + 16), (v20 & 1) == 0)) {
      goto LABEL_33;
    }
    unint64_t isUniquelyReferenced_nonNull_native = v19;
    id v1 = v20;
    sub_2605BBCB8(&qword_26A88BD80);
    if (sub_2605E2E20())
    {
      unint64_t v21 = sub_2605DF36C();
      if ((v1 & 1) != (v22 & 1)) {
        goto LABEL_39;
      }
      unint64_t isUniquelyReferenced_nonNull_native = v21;
    }
    uint64_t v0 = v59;
    if (v1)
    {
      long long v23 = (uint64_t *)(*(void *)(v59 + 56) + 16 * isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      *long long v23 = v8;
      v23[1] = v57;
    }
    else
    {
      sub_2605DF358(v59 + 8 * (isUniquelyReferenced_nonNull_native >> 6));
      long long v25 = (uint64_t *)(v24 + 16 * isUniquelyReferenced_nonNull_native);
      *long long v25 = v14;
      v25[1] = v16;
      long long v26 = (uint64_t *)(*(void *)(v59 + 56) + 16 * isUniquelyReferenced_nonNull_native);
      *long long v26 = v8;
      v26[1] = v57;
      uint64_t v27 = *(void *)(v59 + 16);
      BOOL v28 = __OFADD__(v27, 1);
      uint64_t v29 = v27 + 1;
      if (v28) {
        goto LABEL_35;
      }
      *(void *)(v59 + 16) = v29;
      swift_bridgeObjectRetain();
    }
    *int64_t v10 = v59;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    id v1 = v58;
    id v30 = objc_msgSend(v58, sel_text);
    uint64_t v31 = sub_2605E2970();
    uint64_t v33 = v32;

    objc_msgSend(v58, sel_absoluteOriginOnScreen);
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_beginAccess();
    unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v0 = *v11;
    uint64_t v60 = *v11;
    *unint64_t v11 = 0x8000000000000000;
    unint64_t v38 = sub_2605DF36C();
    uint64_t v40 = *(void *)(v0 + 16);
    BOOL v41 = (v39 & 1) == 0;
    uint64_t v8 = v40 + v41;
    if (__OFADD__(v40, v41)) {
      goto LABEL_34;
    }
    unint64_t v2 = v38;
    id v1 = v39;
    sub_2605BBCB8(&qword_26A88C2E0);
    if (sub_2605E2E20()) {
      break;
    }
LABEL_24:
    uint64_t v0 = v60;
    if (v1)
    {
      uint64_t v44 = (void *)(*(void *)(v60 + 56) + 16 * v2);
      void *v44 = v35;
      v44[1] = v37;
    }
    else
    {
      sub_2605DF358(v60 + 8 * (v2 >> 6));
      BOOL v46 = (uint64_t *)(v45 + 16 * v2);
      *BOOL v46 = v31;
      v46[1] = v33;
      unint64_t v47 = (void *)(*(void *)(v60 + 56) + 16 * v2);
      *unint64_t v47 = v35;
      v47[1] = v37;
      uint64_t v48 = *(void *)(v60 + 16);
      BOOL v28 = __OFADD__(v48, 1);
      uint64_t v49 = v48 + 1;
      if (v28) {
        goto LABEL_36;
      }
      *(void *)(v60 + 16) = v49;
      swift_bridgeObjectRetain();
    }
    *unint64_t v11 = v60;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

    uint64_t v0 = v56 + 1;
    uint64_t v8 = v53;
    if (v55 == v9)
    {

      swift_bridgeObjectRelease();
      id v1 = v52;
      goto LABEL_31;
    }
  }
  unint64_t v42 = sub_2605DF36C();
  if ((v1 & 1) == (v43 & 1))
  {
    unint64_t v2 = v42;
    goto LABEL_24;
  }
LABEL_39:
  sub_2605E2F60();
  __break(1u);
}

uint64_t sub_2605DF194()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2605DF1BC()
{
  sub_2605DF194();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for ContextKitRetriever()
{
  return self;
}

uint64_t sub_2605DF214()
{
  *(void *)(v0 + 16) = sub_2605E2890();
  type metadata accessor for CGPoint(0);
  *(void *)(v0 + 24) = sub_2605E2890();
  return v0;
}

void sub_2605DF28C()
{
}

uint64_t sub_2605DF2B0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_uiElements);

  if (!v2) {
    return 0;
  }
  sub_2605DF318();
  uint64_t v3 = sub_2605E2B40();

  return v3;
}

unint64_t sub_2605DF318()
{
  unint64_t result = qword_26A88C3A0;
  if (!qword_26A88C3A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A88C3A0);
  }
  return result;
}

void sub_2605DF358(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

unint64_t sub_2605DF36C()
{
  return sub_2605C3A08(v0, v1);
}

void sub_2605DF384()
{
  uint64_t v0 = objc_msgSend(self, sel_mainDisplay);
  if (v0)
  {
    id v4 = v0;
    [v0 pointScale];
    [v4 nativeSize];
    [v4 nativeSize];
    sub_2605DF4F4();
  }
  else
  {
    if (qword_26A88BD00 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2605E2810();
    sub_2605C5664(v1, (uint64_t)qword_26A88C7A8);
    id v4 = sub_2605E2800();
    os_log_type_t v2 = sub_2605E2C10();
    if (os_log_type_enabled(v4, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_2605B8000, v4, v2, "CA Display not found", v3, 2u);
      MEMORY[0x261216700](v3, -1, -1);
    }
  }
}

void sub_2605DF4F4()
{
  sub_2605BBCB8(&qword_26A88BE20);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2605E48A0;
  sub_2605DF6A0();
  *(void *)(v0 + 32) = 116;
  *(void *)(v0 + 40) = 0xE100000000000000;
  *(void *)(v0 + 48) = sub_2605E2BD0();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = sub_2605E2BD0();
  *(void *)(v0 + 72) = v2;
  id v3 = sub_2605DF604(v0);
  id v4 = self;
  id v5 = objc_allocWithZone(MEMORY[0x263F62CE8]);
  id v6 = v3;
  id v7 = objc_msgSend(v5, sel_init);
  objc_msgSend(v4, sel_playEventStream_withOptions_, v6, v7);
}

id sub_2605DF604(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)sub_2605E2B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = 0;
  }
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_eventStreamWithCLIArguments_, v1);

  return v2;
}

uint64_t type metadata accessor for RecapActionPerformer()
{
  return self;
}

unint64_t sub_2605DF6A0()
{
  unint64_t result = qword_26A88C3D0;
  if (!qword_26A88C3D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A88C3D0);
  }
  return result;
}

uint64_t dispatchActionOnly(_:point:advanceTime:)(unsigned char *a1, double a2, double a3)
{
  *(double *)(v3 + 16) = a2;
  *(double *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 32) = *a1;
  return sub_2605D66CC((uint64_t)sub_2605DF700);
}

uint64_t sub_2605DF700()
{
  sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v1 = (__n128 *)sub_2605C4BCC();
  sub_2605E1E28(v1, (__n128)xmmword_2605E3700);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(unsigned __int8 *)(v0 + 32);
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  uint64_t v3 = MEMORY[0x263F8D310];
  v1[3].n128_u64[1] = MEMORY[0x263F8D310];
  v1[2].n128_u64[0] = 0x6863746170736944;
  v1[2].n128_u64[1] = 0xE900000000000020;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  switch(v2)
  {
    case 1:
      injectSwipeLeft(advanceTime:)(0.3);
      break;
    case 2:
      injectSwipeRight(advanceTime:)(0.3);
      break;
    case 3:
      injectScrollDown(advanceTime:)(0.3);
      break;
    case 4:
      injectScrollUp(advanceTime:)(0.3);
      break;
    case 5:
      uint64_t v4 = sub_2605C4BCC();
      *(_OWORD *)(v4 + 16) = xmmword_2605E3700;
      *(void *)(v4 + 56) = v3;
      *(void *)(v4 + 32) = 0xD00000000000003BLL;
      *(void *)(v4 + 40) = 0x80000002605E5FE0;
      sub_2605C4B94();
      swift_bridgeObjectRelease();
      break;
    default:
      injectTapHIDEvent(point:advanceTime:)(*(CGPoint *)(v0 + 16), 0.5);
      break;
  }
  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2605DF900()
{
  return sub_2605E2FC0();
}

uint64_t sub_2605DF948()
{
  sub_2605E2A00();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2605DF99C()
{
  return sub_2605E2FC0();
}

UINavigationKit::UIAction_optional __swiftcall UIAction.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_2605E2E60();
  result.Swift::Int value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t UIAction.rawValue.getter()
{
  return qword_2605E49D0[*v0];
}

uint64_t sub_2605DFA5C(char *a1, char *a2)
{
  return sub_2605BCBBC(*a1, *a2);
}

uint64_t sub_2605DFA68()
{
  return sub_2605DF900();
}

uint64_t sub_2605DFA70()
{
  return sub_2605DF948();
}

uint64_t sub_2605DFA78()
{
  return sub_2605DF99C();
}

UINavigationKit::UIAction_optional sub_2605DFA80(Swift::String *a1)
{
  return UIAction.init(rawValue:)(*a1);
}

uint64_t sub_2605DFA8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UIAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t searchWithAction(_:dumpDirectoryName:referrableText:)(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 96) = a4;
  *(void *)(v5 + 104) = a5;
  *(void *)(v5 + 80) = a2;
  *(void *)(v5 + 88) = a3;
  *(unsigned char *)(v5 + 185) = *a1;
  return sub_2605D66CC((uint64_t)sub_2605DFAD8);
}

uint64_t sub_2605DFAD8()
{
  v0[14] = sub_2605BBCB8(&qword_26A88BD48);
  uint64_t v1 = (__n128 *)sub_2605C4BCC();
  sub_2605E1E90(v1, (__n128)xmmword_2605E3700);
  sub_2605E2D70();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  swift_bridgeObjectRelease();
  v1[3].n128_u64[1] = MEMORY[0x263F8D310];
  v1[2].n128_u64[0] = 0xD000000000000010;
  v1[2].n128_u64[1] = 0x80000002605E6020;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[15] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2605DFC28;
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  return captureScreenshotAndProcess(atDumpDir:indexStr:deleteExistingDir:)(v4, v3, 0, 0xE000000000000000, 0);
}

uint64_t sub_2605DFC28(uint64_t a1, uint64_t a2, void *a3)
{
  sub_2605D66D8();
  *(void *)(v6 + 128) = v4;
  *(void *)(v6 + 136) = v5;
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_2605DFD0C, 0, 0);
}

uint64_t sub_2605DFD0C()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v3 = *(void **)(v0 + 104);
  uint64_t v5 = parseUIUnderstandingDumpForMarkers(filePath:)(v2, (uint64_t)v1);
  v6._uint64_t countAndFlagsBits = v2;
  v6._unint64_t object = v1;
  v7._uint64_t countAndFlagsBits = v4;
  v7._unint64_t object = v3;
  if (parseUIUnderstandingDumpForText(filePath:textToBeSearched:)(v6, v7))
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 136);
    uint64_t v10 = *(void *)(v0 + 104);
    uint64_t v11 = *(void *)(v0 + 96);
    uint64_t v12 = sub_2605C4BCC();
    *(_OWORD *)(v12 + 16) = xmmword_2605E3700;
    sub_2605E2D70();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2605E2A50();
    *(void *)(v12 + 56) = MEMORY[0x263F8D310];
    *(void *)(v12 + 32) = v11;
    *(void *)(v12 + 40) = v10;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
    return v13(1, v9, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 144) = v5;
    uint64_t v15 = *(void *)(v0 + 104);
    char v16 = *(unsigned char *)(v0 + 185);
    uint64_t v17 = *(void *)(v0 + 96);
    uint64_t v18 = (__n128 *)sub_2605C4BCC();
    sub_2605E1DE8(v18, (__n128)xmmword_2605E3700);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v17;
    *(void *)(v0 + 24) = v15;
    sub_2605D68B4();
    unint64_t v19 = *(void *)(v0 + 16);
    unint64_t v20 = *(void *)(v0 + 24);
    v18[3].n128_u64[1] = MEMORY[0x263F8D310];
    v18[2].n128_u64[0] = v19;
    v18[2].n128_u64[1] = v20;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + 184) = v16;
    unint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v21;
    void *v21 = v0;
    v21[1] = sub_2605DFF54;
    char v22 = (unsigned char *)sub_2605E1E7C();
    return dispatchActionOnly(_:point:advanceTime:)(v22, v23, v24);
  }
}

uint64_t sub_2605DFF54()
{
  sub_2605D6B0C();
  sub_2605E1D60();
  uint64_t v3 = v2;
  sub_2605D6760();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  *uint64_t v4 = *v1;
  swift_task_dealloc();
  Swift::String v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 160) = v6;
  *Swift::String v6 = v5;
  v6[1] = sub_2605E0080;
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 80);
  return captureSnapshotUntilScreenStabilizes(dumpDirectoryName:)(v8, v7);
}

uint64_t sub_2605E0080(uint64_t a1, uint64_t a2, void *a3)
{
  sub_2605D66D8();
  *(void *)(v6 + 168) = v4;
  *(void *)(v6 + 176) = v5;
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_2605E0164, 0, 0);
}

uint64_t sub_2605E0164()
{
  v1._rawValue = *(void **)(v0 + 144);
  uint64_t v2 = parseUIUnderstandingDumpForMarkers(filePath:)(*(void *)(v0 + 168), *(void *)(v0 + 176));
  double v3 = markerMatchPercentage(markers1:markers2:)((Swift::OpaquePointer)v2, v1);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_2605C4BCC();
  *(_OWORD *)(v4 + 16) = xmmword_2605E3700;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0xE000000000000000;
  sub_2605E2D70();
  uint64_t v5 = *(void *)(v0 + 72);
  *(void *)(v0 + 48) = *(void *)(v0 + 64);
  *(void *)(v0 + 56) = v5;
  sub_2605D68B4();
  sub_2605E2BE0();
  sub_2605D68B4();
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 56);
  unint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v7;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v9 = *(void *)(v0 + 176);
  if (v3 == 1.0)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(BOOL, uint64_t, uint64_t))(v0 + 8);
    return v14(v3 != 1.0, v10, v9);
  }
  if (parseUIUnderstandingDumpForText(filePath:textToBeSearched:)(*(Swift::String *)(v0 + 168), *(Swift::String *)(v0 + 96)))
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 176);
    unint64_t v11 = *(void *)(v0 + 104);
    unint64_t v12 = *(void *)(v0 + 96);
    id v13 = (__n128 *)sub_2605C4BCC();
    sub_2605E1E28(v13, (__n128)xmmword_2605E3700);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2605E2A50();
    v13[3].n128_u64[1] = v8;
    v13[2].n128_u64[0] = v12;
    v13[2].n128_u64[1] = v11;
    sub_2605C4B94();
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 144) = v2;
  uint64_t v16 = *(void *)(v0 + 104);
  char v17 = *(unsigned char *)(v0 + 185);
  uint64_t v18 = *(void *)(v0 + 96);
  unint64_t v19 = (__n128 *)sub_2605C4BCC();
  sub_2605E1DE8(v19, (__n128)xmmword_2605E3700);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v18;
  *(void *)(v0 + 24) = v16;
  sub_2605D68B4();
  unint64_t v20 = *(void *)(v0 + 16);
  unint64_t v21 = *(void *)(v0 + 24);
  v19[3].n128_u64[1] = v8;
  v19[2].n128_u64[0] = v20;
  v19[2].n128_u64[1] = v21;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 184) = v17;
  char v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v22;
  *char v22 = v0;
  v22[1] = sub_2605DFF54;
  double v23 = (unsigned char *)sub_2605E1E7C();
  return dispatchActionOnly(_:point:advanceTime:)(v23, v24, v25);
}

uint64_t dispatchAction(_:point:advanceTime:dumpDirectoryName:)()
{
  sub_2605D6B0C();
  double v2 = v1;
  double v4 = v3;
  *(void *)(v0 + 16) = v5;
  *(void *)(v0 + 24) = v6;
  *(unsigned char *)(v0 + 48) = *v7;
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v8;
  *unint64_t v8 = v0;
  v8[1] = sub_2605E0508;
  return dispatchActionOnly(_:point:advanceTime:)((unsigned char *)(v0 + 48), v4, v2);
}

uint64_t sub_2605E0508()
{
  sub_2605D6B0C();
  sub_2605E1D60();
  uint64_t v3 = v2;
  sub_2605D6760();
  *double v4 = v3;
  uint64_t v5 = *v1;
  *double v4 = *v1;
  swift_task_dealloc();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_2605E0634;
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v8 = *(void *)(v0 + 16);
  return captureSnapshotUntilScreenStabilizes(dumpDirectoryName:)(v8, v7);
}

uint64_t sub_2605E0634()
{
  sub_2605D6B0C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_2605D66D8();
  uint64_t v7 = *v0;
  sub_2605D6760();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v9(v6, v4);
}

Swift::Void __swiftcall injectTapHIDEvent(point:advanceTime:)(CGPoint point, Swift::Double advanceTime)
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  sub_2605DF6A0();
  uint64_t v5 = swift_allocObject();
  *(CGFloat *)(v5 + 16) = x;
  *(CGFloat *)(v5 + 24) = y;
  *(Swift::Double *)(v5 + 32) = advanceTime;
  id v6 = sub_2605E1008((uint64_t)sub_2605E1B20, v5);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = self;
    id v9 = objc_allocWithZone(MEMORY[0x263F62CE8]);
    id v10 = v7;
    objc_msgSend(v9, sel_init);
    sub_2605E1DDC();
    objc_msgSend(v8, sel_playEventStream_withOptions_, v10);
    swift_release();
  }
  else
  {
    sub_2605BBCB8(&qword_26A88BD48);
    uint64_t v11 = sub_2605C4BCC();
    *(_OWORD *)(v11 + 16) = xmmword_2605E3700;
    uint64_t v12 = sub_2605E1D94(v11, MEMORY[0x263F8D310]);
    *(void *)(v12 + 32) = v13;
    *(void *)(v12 + 40) = 0x80000002605E60E0;
    sub_2605C4B94();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall injectSwipeLeft(advanceTime:)(Swift::Double advanceTime)
{
  id v2 = objc_msgSend(self, sel_mainDisplay);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_pointScale);
    sub_2605E1DA4();
    sub_2605E1DC4();
    sub_2605E1E64(0.9, v4);
    sub_2605DF6A0();
    uint64_t v5 = (void *)sub_2605E1ECC();
    sub_2605E1EA4(v5);
    id v6 = sub_2605E1008((uint64_t)sub_2605E1B38, v1);
    if (v6)
    {
      uint64_t v7 = v6;
      self;
      id v8 = objc_allocWithZone(MEMORY[0x263F62CE8]);
      id v9 = v7;
      objc_msgSend(v8, sel_init);
      sub_2605E1DDC();
      sub_2605E1E10(v10, sel_playEventStream_withOptions_);
      swift_release();

      sub_2605E1D40();
    }
    else
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v13 = sub_2605C4BCC();
      *(_OWORD *)(v13 + 16) = xmmword_2605E3700;
      uint64_t v14 = sub_2605E1D94(v13, MEMORY[0x263F8D310]);
      *(void *)(v14 + 32) = v15;
      *(void *)(v14 + 40) = 0x80000002605E60E0;
      sub_2605C4B94();
      swift_release();

      sub_2605E1D40();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2605E1D40();
  }
}

Swift::Void __swiftcall injectSwipeRight(advanceTime:)(Swift::Double advanceTime)
{
  id v2 = objc_msgSend(self, sel_mainDisplay);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_pointScale);
    sub_2605E1DA4();
    sub_2605E1DC4();
    sub_2605E1E64(0.4, v4);
    sub_2605DF6A0();
    uint64_t v5 = (void *)sub_2605E1ECC();
    sub_2605E1EA4(v5);
    id v6 = sub_2605E1008((uint64_t)sub_2605E1B38, v1);
    if (v6)
    {
      uint64_t v7 = v6;
      self;
      id v8 = objc_allocWithZone(MEMORY[0x263F62CE8]);
      id v9 = v7;
      objc_msgSend(v8, sel_init);
      sub_2605E1DDC();
      sub_2605E1E10(v10, sel_playEventStream_withOptions_);
      swift_release();

      sub_2605E1D40();
    }
    else
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v13 = sub_2605C4BCC();
      *(_OWORD *)(v13 + 16) = xmmword_2605E3700;
      uint64_t v14 = sub_2605E1D94(v13, MEMORY[0x263F8D310]);
      *(void *)(v14 + 32) = v15;
      *(void *)(v14 + 40) = 0x80000002605E60E0;
      sub_2605C4B94();
      swift_release();

      sub_2605E1D40();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2605E1D40();
  }
}

Swift::Void __swiftcall injectScrollDown(advanceTime:)(Swift::Double advanceTime)
{
  id v2 = objc_msgSend(self, sel_mainDisplay);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_pointScale);
    sub_2605E1DA4();
    sub_2605E1DC4();
    sub_2605DF6A0();
    double v4 = (void *)sub_2605E1ECC();
    sub_2605E1EB8(v4);
    id v5 = sub_2605E1008((uint64_t)sub_2605E1B38, v1);
    if (v5)
    {
      id v6 = v5;
      self;
      id v7 = objc_allocWithZone(MEMORY[0x263F62CE8]);
      id v8 = v6;
      objc_msgSend(v7, sel_init);
      sub_2605E1DDC();
      sub_2605E1E10(v9, sel_playEventStream_withOptions_);
      swift_release();

      sub_2605E1D78();
    }
    else
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v12 = sub_2605C4BCC();
      *(_OWORD *)(v12 + 16) = xmmword_2605E3700;
      uint64_t v13 = sub_2605E1D94(v12, MEMORY[0x263F8D310]);
      *(void *)(v13 + 32) = v14;
      *(void *)(v13 + 40) = 0x80000002605E60E0;
      sub_2605C4B94();
      swift_release();

      sub_2605E1D78();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2605E1D78();
  }
}

Swift::Void __swiftcall injectScrollUp(advanceTime:)(Swift::Double advanceTime)
{
  id v2 = objc_msgSend(self, sel_mainDisplay);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_pointScale);
    sub_2605E1DA4();
    sub_2605E1DC4();
    sub_2605DF6A0();
    double v4 = (void *)sub_2605E1ECC();
    sub_2605E1EB8(v4);
    id v5 = sub_2605E1008((uint64_t)sub_2605E1B38, v1);
    if (v5)
    {
      id v6 = v5;
      self;
      id v7 = objc_allocWithZone(MEMORY[0x263F62CE8]);
      id v8 = v6;
      objc_msgSend(v7, sel_init);
      sub_2605E1DDC();
      sub_2605E1E10(v9, sel_playEventStream_withOptions_);
      swift_release();

      sub_2605E1D78();
    }
    else
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v12 = sub_2605C4BCC();
      *(_OWORD *)(v12 + 16) = xmmword_2605E3700;
      uint64_t v13 = sub_2605E1D94(v12, MEMORY[0x263F8D310]);
      *(void *)(v13 + 32) = v14;
      *(void *)(v13 + 40) = 0x80000002605E60E0;
      sub_2605C4B94();
      swift_release();

      sub_2605E1D78();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2605E1D78();
  }
}

id sub_2605E1008(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a1;
    *(void *)(v4 + 24) = a2;
    v8[4] = sub_2605E1CF8;
    v8[5] = v4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    void v8[2] = sub_2605E10FC;
    v8[3] = &unk_270C7FDE8;
    id v5 = _Block_copy(v8);
    swift_release();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_eventStreamWithEventActions_, v5);
  _Block_release(v5);
  return v6;
}

uint64_t sub_2605E10FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

id sub_2605E1150(id result, double a2, double a3, double a4, double a5, double a6)
{
  if (result)
  {
    id v7 = result;
    objc_msgSend(result, sel_dragWithStartPoint_endPoint_duration_, a2, a3, a4, a5, 0.2);
    objc_msgSend(v7, sel_advanceTime_, a6);
    return objc_msgSend(v7, sel_liftUpAtAllActivePoints);
  }
  return result;
}

Swift::Void __swiftcall injectPhotosBackButton()()
{
  id v0 = objc_msgSend(self, sel_mainDisplay);
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = objc_msgSend(v0, sel_pointScale);
    double v3 = 57.0 / (double)(uint64_t)v2;
    double v4 = 203.0 / (double)(uint64_t)v2;
    sub_2605DF6A0();
    uint64_t v5 = swift_allocObject();
    *(double *)(v5 + 16) = v3;
    *(double *)(v5 + 24) = v4;
    id v6 = sub_2605E1008((uint64_t)sub_2605E1B90, v5);
    if (v6)
    {
      id v7 = v6;
      self;
      id v8 = objc_allocWithZone(MEMORY[0x263F62CE8]);
      id v9 = v7;
      objc_msgSend(v8, sel_init);
      sub_2605E1DDC();
      sub_2605E1E10(v10, sel_playEventStream_withOptions_);
      swift_release();
    }
    else
    {
      sub_2605BBCB8(&qword_26A88BD48);
      uint64_t v11 = sub_2605C4BCC();
      *(_OWORD *)(v11 + 16) = xmmword_2605E3700;
      uint64_t v12 = sub_2605E1D94(v11, MEMORY[0x263F8D310]);
      *(void *)(v12 + 32) = v13;
      *(void *)(v12 + 40) = 0x80000002605E60E0;
      sub_2605C4B94();
      swift_release();

      swift_bridgeObjectRelease();
    }
  }
}

id sub_2605E13AC(id result)
{
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend(result, sel_tap_);
    objc_msgSend(v1, sel_advanceTime_, 0.5);
    return objc_msgSend(v1, sel_liftUpAtAllActivePoints);
  }
  return result;
}

id sub_2605E1410(id result, double a2, double a3, double a4)
{
  if (result)
  {
    uint64_t v5 = result;
    objc_msgSend(result, sel_tap_);
    objc_msgSend(v5, sel_advanceTime_, a4);
    return objc_msgSend(v5, sel_liftUpAtAllActivePoints);
  }
  return result;
}

void sub_2605E1480(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C206570697753 && a2 == 0xEA00000000007466;
  if (v2 || (sub_2605E2F40() & 1) != 0)
  {
    injectSwipeLeft(advanceTime:)(0.3);
  }
  else
  {
    BOOL v5 = a1 == 0x6972206570697753 && a2 == 0xEB00000000746867;
    if (v5 || (sub_2605E2F40() & 1) != 0)
    {
      injectSwipeRight(advanceTime:)(0.3);
    }
    else
    {
      BOOL v6 = a1 == 0x75206C6C6F726353 && a2 == 0xE900000000000070;
      if (v6 || (sub_2605E1E4C(), (sub_2605E2F40() & 1) != 0))
      {
        injectScrollUp(advanceTime:)(0.3);
      }
      else
      {
        BOOL v7 = a1 == 0x64206C6C6F726353 && a2 == 0xEB000000006E776FLL;
        if (v7 || (sub_2605E1E4C(), (sub_2605E2F40() & 1) != 0))
        {
          injectScrollDown(advanceTime:)(0.3);
        }
      }
    }
  }
}

uint64_t injectSwipeScrollHIDEventUntilTextMatches(textToBeMatched:indexGiven:dumpDirectoryName:actionType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  v7[13] = a2;
  v7[14] = a3;
  v7[12] = a1;
  return sub_2605D66CC((uint64_t)sub_2605E1680);
}

uint64_t sub_2605E1680()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  v0[19] = sub_2605BBCB8(&qword_26A88BD48);
  BOOL v5 = (__n128 *)sub_2605C4BCC();
  sub_2605E1E90(v5, (__n128)xmmword_2605E3700);
  sub_2605E2D70();
  swift_bridgeObjectRelease();
  sub_2605E2A50();
  v5[3].n128_u64[1] = MEMORY[0x263F8D310];
  v5[2].n128_u64[0] = 0xD000000000000011;
  v5[2].n128_u64[1] = 0x80000002605E6110;
  sub_2605C4B94();
  swift_bridgeObjectRelease();
  type metadata accessor for CaptureDeviceContextState();
  v0[20] = swift_initStackObject();
  swift_bridgeObjectRetain();
  v0[21] = CaptureDeviceContextState.init(dumpDirectoryName:isRecordUX:)(v4, v3, 0);
  sub_2605E1480(v2, v1);
  usleep(0xF4240u);
  uint64_t v6 = v0[14];
  v0[22] = 0;
  v0[23] = v6;
  BOOL v7 = (void *)swift_task_alloc();
  v0[24] = v7;
  *BOOL v7 = v0;
  v7[1] = sub_2605E1830;
  return sub_2605CF45C((uint64_t)(v0 + 11), v6, 0);
}

uint64_t sub_2605E1830()
{
  sub_2605E1D60();
  uint64_t v1 = *v0;
  sub_2605D6760();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2605E191C, 0, 0);
}

uint64_t sub_2605E191C()
{
  v13.Swift::Int value = *(void *)(v0 + 184);
  v13.Swift::Bool is_nil = 0;
  uint64_t result = parseUIUnderstandingDumpForText(dumpDirectoryName:index:textToBeSearched:)(*(Swift::String *)(v0 + 120), v13, *(Swift::String *)(v0 + 96));
  int v2 = result;
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(v0 + 144);
    uint64_t v4 = *(void *)(v0 + 136);
    uint64_t v5 = sub_2605C4BCC();
    *(_OWORD *)(v5 + 16) = xmmword_2605E3700;
    *(void *)(v0 + 72) = 0;
    *(void *)(v0 + 80) = 0xE000000000000000;
    sub_2605E2D70();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 56) = 0xD000000000000015;
    *(void *)(v0 + 64) = 0x80000002605E6130;
    sub_2605E2A50();
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 64);
    *(void *)(v5 + 56) = MEMORY[0x263F8D310];
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v7;
    sub_2605C4B94();
    swift_bridgeObjectRelease();
    sub_2605E1480(v4, v3);
    uint64_t result = usleep(0xF4240u);
  }
  uint64_t v8 = *(void *)(v0 + 176);
  if (v8 == (*(void *)(v0 + 112) ^ 0x7FFFFFFFFFFFFFFFLL))
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 184) + 1;
    if (((v8 != 4) & ~v2) != 0)
    {
      *(void *)(v0 + 176) = v8 + 1;
      *(void *)(v0 + 184) = v9;
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_2605E1830;
      return sub_2605CF45C(v0 + 88, v9, 0);
    }
    else
    {
      swift_release();
      uint64_t v10 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
      return v10(v9, v2 & 1);
    }
  }
  return result;
}

uint64_t sub_2605E1B14()
{
  return sub_2605E1D38(v0, 40);
}

id sub_2605E1B20(void *a1)
{
  return sub_2605E1410(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2605E1B2C()
{
  return sub_2605E1D38(v0, 56);
}

uint64_t sub_2605E1B3C()
{
  return sub_2605E1D38(v0, 56);
}

id sub_2605E1B48(void *a1)
{
  return sub_2605E1150(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_2605E1B6C()
{
  return sub_2605E1D38(v0, 56);
}

uint64_t sub_2605E1B78()
{
  return sub_2605E1D38(v0, 56);
}

uint64_t sub_2605E1B84()
{
  return sub_2605E1D38(v0, 32);
}

id sub_2605E1B90(id result)
{
  return sub_2605E13AC(result);
}

unint64_t sub_2605E1B9C()
{
  unint64_t result = qword_26A88C3E0;
  if (!qword_26A88C3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A88C3E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UIAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x2605E1CB4);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIAction()
{
  return &type metadata for UIAction;
}

uint64_t sub_2605E1CEC()
{
  return sub_2605E1D38(v0, 32);
}

uint64_t sub_2605E1CF8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2605E1D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2605E1D30()
{
  return swift_release();
}

uint64_t sub_2605E1D38(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

uint64_t sub_2605E1D94@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 56) = a2;
  return result;
}

id sub_2605E1DA4()
{
  return objc_msgSend(v0, sel_nativeSize);
}

id sub_2605E1DC4()
{
  return [v0 (SEL)(v1 + 50)];
}

uint64_t sub_2605E1DE8(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  return sub_2605E2D70();
}

id sub_2605E1E10(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_2605E1E28(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2605E2D70();
}

uint64_t sub_2605E1E4C()
{
  return v0;
}

double sub_2605E1E64(double a1, double a2)
{
  return a2 * 0.5;
}

uint64_t sub_2605E1E7C()
{
  return v0;
}

__n128 *sub_2605E1E90(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

void *sub_2605E1EA4(void *result)
{
  result[2] = v3;
  result[3] = v4;
  result[4] = v2;
  result[5] = v4;
  result[6] = v1;
  return result;
}

void *sub_2605E1EB8(void *result)
{
  result[2] = v2;
  result[3] = v4;
  result[4] = v2;
  result[5] = v3;
  result[6] = v1;
  return result;
}

uint64_t sub_2605E1ECC()
{
  return swift_allocObject();
}

uint64_t sub_2605E1EE4(uint64_t a1, uint64_t a2)
{
  type metadata accessor for UIUnderstandingContextRetriever();
  swift_allocObject();
  uint64_t v4 = sub_2605D8B88();
  swift_retain();
  sub_2605D8CF8();
  swift_beginAccess();
  uint64_t v5 = v4[3];
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRetain();
  sub_2605BDA40(a1, a2, v5);
  char v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    type metadata accessor for RecapActionPerformer();
    swift_initStackObject();
    sub_2605DF384();
  }
  swift_release();
  return 1;
}

uint64_t type metadata accessor for UIUnderstandingActionPerformer()
{
  return self;
}

uint64_t sub_2605E20F0()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_2605E2100()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_2605E2110()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_2605E2120()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_2605E2140()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_2605E2150()
{
  return MEMORY[0x270EE0F98]();
}

uint64_t sub_2605E2160()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_2605E2170()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_2605E2180()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_2605E2190()
{
  return MEMORY[0x270EE1300]();
}

uint64_t sub_2605E21A0()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_2605E21C0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2605E21D0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2605E21E0()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_2605E21F0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_2605E2200()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_2605E2210()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2605E2220()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2605E2230()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2605E2240()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_2605E2250()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2605E2260()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_2605E2270()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_2605E2280()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2605E2290()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2605E22A0()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_2605E22B0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_2605E22C0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2605E22D0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2605E22E0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2605E22F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2605E2300()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2605E2310()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2605E2320()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2605E2330()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2605E2340()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2605E2350()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2605E2360()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2605E2370()
{
  return MEMORY[0x270FA12D8]();
}

uint64_t sub_2605E2380()
{
  return MEMORY[0x270F83080]();
}

uint64_t sub_2605E2390()
{
  return MEMORY[0x270F83088]();
}

uint64_t sub_2605E23A0()
{
  return MEMORY[0x270F83090]();
}

uint64_t sub_2605E23B0()
{
  return MEMORY[0x270F83098]();
}

uint64_t sub_2605E23C0()
{
  return MEMORY[0x270F830A0]();
}

uint64_t sub_2605E23D0()
{
  return MEMORY[0x270F830A8]();
}

uint64_t sub_2605E23E0()
{
  return MEMORY[0x270F830B0]();
}

uint64_t sub_2605E23F0()
{
  return MEMORY[0x270F830B8]();
}

uint64_t sub_2605E2400()
{
  return MEMORY[0x270F830C0]();
}

uint64_t sub_2605E2410()
{
  return MEMORY[0x270F830C8]();
}

uint64_t sub_2605E2420()
{
  return MEMORY[0x270F830D0]();
}

uint64_t sub_2605E2430()
{
  return MEMORY[0x270F830D8]();
}

uint64_t sub_2605E2440()
{
  return MEMORY[0x270F830E0]();
}

uint64_t sub_2605E2450()
{
  return MEMORY[0x270F830E8]();
}

uint64_t sub_2605E2460()
{
  return MEMORY[0x270F830F0]();
}

uint64_t sub_2605E2470()
{
  return MEMORY[0x270F830F8]();
}

uint64_t sub_2605E2480()
{
  return MEMORY[0x270F83100]();
}

uint64_t sub_2605E2490()
{
  return MEMORY[0x270F83108]();
}

uint64_t sub_2605E24A0()
{
  return MEMORY[0x270F83110]();
}

uint64_t sub_2605E24B0()
{
  return MEMORY[0x270F83118]();
}

uint64_t sub_2605E24C0()
{
  return MEMORY[0x270F83120]();
}

uint64_t sub_2605E24D0()
{
  return MEMORY[0x270F83128]();
}

uint64_t sub_2605E24E0()
{
  return MEMORY[0x270F83130]();
}

uint64_t sub_2605E24F0()
{
  return MEMORY[0x270F83138]();
}

uint64_t sub_2605E2500()
{
  return MEMORY[0x270F83140]();
}

uint64_t sub_2605E2510()
{
  return MEMORY[0x270F83148]();
}

uint64_t sub_2605E2520()
{
  return MEMORY[0x270FA1348]();
}

uint64_t sub_2605E2530()
{
  return MEMORY[0x270F80D98]();
}

uint64_t sub_2605E2540()
{
  return MEMORY[0x270F80DB0]();
}

uint64_t sub_2605E2550()
{
  return MEMORY[0x270F80E00]();
}

uint64_t sub_2605E2560()
{
  return MEMORY[0x270F80E58]();
}

uint64_t sub_2605E2570()
{
  return MEMORY[0x270F80E80]();
}

uint64_t sub_2605E2580()
{
  return MEMORY[0x270F80F98]();
}

uint64_t sub_2605E2590()
{
  return MEMORY[0x270F80FA8]();
}

uint64_t sub_2605E25A0()
{
  return MEMORY[0x270F80FB8]();
}

uint64_t sub_2605E25B0()
{
  return MEMORY[0x270F81038]();
}

uint64_t sub_2605E25C0()
{
  return MEMORY[0x270F810B8]();
}

uint64_t sub_2605E25D0()
{
  return MEMORY[0x270F810D8]();
}

uint64_t sub_2605E25E0()
{
  return MEMORY[0x270F810E8]();
}

uint64_t sub_2605E25F0()
{
  return MEMORY[0x270F810F8]();
}

uint64_t sub_2605E2600()
{
  return MEMORY[0x270F3F028]();
}

uint64_t sub_2605E2610()
{
  return MEMORY[0x270F3F038]();
}

uint64_t sub_2605E2620()
{
  return MEMORY[0x270F3F068]();
}

uint64_t sub_2605E2630()
{
  return MEMORY[0x270F3F088]();
}

uint64_t sub_2605E2650()
{
  return MEMORY[0x270F3F1D8]();
}

uint64_t sub_2605E2660()
{
  return MEMORY[0x270F3F1E0]();
}

uint64_t sub_2605E2670()
{
  return MEMORY[0x270F3F1E8]();
}

uint64_t sub_2605E2680()
{
  return MEMORY[0x270F3F1F0]();
}

uint64_t sub_2605E2690()
{
  return MEMORY[0x270F3F200]();
}

uint64_t sub_2605E26A0()
{
  return MEMORY[0x270F3F210]();
}

uint64_t sub_2605E26B0()
{
  return MEMORY[0x270F3F220]();
}

uint64_t sub_2605E26C0()
{
  return MEMORY[0x270F3F228]();
}

uint64_t sub_2605E26D0()
{
  return MEMORY[0x270F3F240]();
}

uint64_t sub_2605E26E0()
{
  return MEMORY[0x270F3F310]();
}

uint64_t sub_2605E26F0()
{
  return MEMORY[0x270F3F318]();
}

uint64_t sub_2605E2700()
{
  return MEMORY[0x270F3F330]();
}

uint64_t sub_2605E2710()
{
  return MEMORY[0x270F3F338]();
}

uint64_t sub_2605E2720()
{
  return MEMORY[0x270F3F440]();
}

uint64_t sub_2605E2730()
{
  return MEMORY[0x270F3F448]();
}

uint64_t sub_2605E2740()
{
  return MEMORY[0x270F3F450]();
}

uint64_t sub_2605E2750()
{
  return MEMORY[0x270F3F468]();
}

uint64_t sub_2605E2760()
{
  return MEMORY[0x270F3F470]();
}

uint64_t sub_2605E2770()
{
  return MEMORY[0x270F3F478]();
}

uint64_t sub_2605E2780()
{
  return MEMORY[0x270F3F480]();
}

uint64_t sub_2605E2790()
{
  return MEMORY[0x270F81580]();
}

uint64_t sub_2605E27A0()
{
  return MEMORY[0x270F81590]();
}

uint64_t sub_2605E27B0()
{
  return MEMORY[0x270F81598]();
}

uint64_t sub_2605E27C0()
{
  return MEMORY[0x270F815A8]();
}

uint64_t sub_2605E27D0()
{
  return MEMORY[0x270F81668]();
}

uint64_t sub_2605E27E0()
{
  return MEMORY[0x270F81670]();
}

uint64_t sub_2605E27F0()
{
  return MEMORY[0x270F81688]();
}

uint64_t sub_2605E2800()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2605E2810()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2605E2820()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2605E2830()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2605E2850()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2605E2860()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2605E2870()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2605E2880()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_2605E2890()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2605E28A0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2605E28B0()
{
  return MEMORY[0x270F9D360]();
}

uint64_t sub_2605E28C0()
{
  return MEMORY[0x270F9D388]();
}

uint64_t sub_2605E28D0()
{
  return MEMORY[0x270F9D390]();
}

uint64_t sub_2605E28E0()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_2605E28F0()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_2605E2900()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_2605E2910()
{
  return MEMORY[0x270FA2B60]();
}

uint64_t sub_2605E2920()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2605E2930()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2605E2940()
{
  return MEMORY[0x270EE1EF0]();
}

uint64_t sub_2605E2950()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_2605E2960()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2605E2970()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2605E2980()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2605E2990()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2605E29A0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2605E29B0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2605E29C0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2605E29D0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2605E29E0()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_2605E29F0()
{
  return MEMORY[0x270F9D6D0]();
}

uint64_t sub_2605E2A00()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2605E2A10()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2605E2A20()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2605E2A30()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2605E2A40()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_2605E2A50()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2605E2A60()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2605E2A70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2605E2A80()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2605E2A90()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2605E2AB0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2605E2AC0()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_2605E2AD0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2605E2AE0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2605E2AF0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2605E2B00()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2605E2B10()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2605E2B20()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2605E2B30()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2605E2B40()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2605E2B50()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2605E2B60()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2605E2B70()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2605E2B80()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2605E2B90()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2605E2BA0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2605E2BB0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2605E2BC0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2605E2BD0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_2605E2BE0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2605E2BF0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2605E2C00()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2605E2C10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2605E2C20()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2605E2C30()
{
  return MEMORY[0x270EE5908]();
}

uint64_t sub_2605E2C40()
{
  return MEMORY[0x270EE5920]();
}

uint64_t sub_2605E2C50()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2605E2C70()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_2605E2C90()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_2605E2CA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2605E2CB0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2605E2CC0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_2605E2CD0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2605E2CE0()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_2605E2CF0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2605E2D10()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_2605E2D20()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2605E2D30()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2605E2D40()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2605E2D60()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2605E2D70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2605E2D80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2605E2D90()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2605E2DA0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2605E2DB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2605E2DC0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_2605E2DD0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2605E2DE0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2605E2DF0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2605E2E00()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2605E2E10()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2605E2E20()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2605E2E30()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2605E2E40()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2605E2E50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2605E2E60()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2605E2E70()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2605E2E80()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2605E2E90()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2605E2EA0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2605E2EB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2605E2EC0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2605E2ED0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2605E2EE0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2605E2EF0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2605E2F00()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2605E2F10()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2605E2F20()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2605E2F30()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2605E2F40()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2605E2F50()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2605E2F60()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2605E2F70()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2605E2F80()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2605E2F90()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2605E2FA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2605E2FB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2605E2FC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2605E2FD0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2605E2FE0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2605E2FF0()
{
  return MEMORY[0x270F9FE70]();
}

uint64_t sub_2605E3000()
{
  return MEMORY[0x270F9FF18]();
}

uint64_t sub_2605E3010()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_2605E3020()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x270EF4320]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

CFTypeRef IOHIDEventSystemClientCopyProperty(IOHIDEventSystemClientRef client, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4410](client, key);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientRegisterPropertyChangedCallback()
{
  return MEMORY[0x270EF4468]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x270EF4470]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x270EF4490]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x270EF44A0](client, key, property);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90578]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x270F90588]();
}

uint64_t _AXTraitsAsStringInternal()
{
  return MEMORY[0x270F09960]();
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}