unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
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

id AccessCheckerHasBundleSubscription(_:to:lineNumber:)(void *a1, uint64_t a2, void *a3, int a4)
{
  id v4 = a3;
  if (a3)
  {
    v7 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    if (objc_getAssociatedObject(v7, v7 + 1))
    {
      sub_25E4DAE50();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_25E4B9628((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      sub_25E4B9744();
      if (swift_dynamicCast())
      {
        v8 = v16;
        unint64_t v9 = (unint64_t)objc_msgSend(v16, sel_integerValue);
        if (v9 == -1) {
          goto LABEL_19;
        }
        goto LABEL_11;
      }
    }
    else
    {
      sub_25E4B96E8((uint64_t)v19);
    }
    v8 = 0;
    unint64_t v9 = 0;
LABEL_11:
    if (objc_getAssociatedObject(v7, (const void *)~v9))
    {
      sub_25E4DAE50();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_25E4B9628((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      sub_25E4B9744();
      if (swift_dynamicCast())
      {
        id v10 = v16;
        unsigned int v11 = objc_msgSend(v10, sel_integerValue);

        if ((((v11 - a4) ^ (v9 + a4)) & 1) == 0) {
          return 0;
        }
        goto LABEL_17;
      }
    }
    else
    {
      sub_25E4B96E8((uint64_t)v19);
    }
LABEL_19:

    if ((((v9 + a4) ^ a4) & 1) == 0) {
      return 0;
    }
LABEL_17:
    id v12 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    id v13 = objc_msgSend(v12, sel_bundleChannelIDs);

    v14 = (void *)sub_25E4DAC70();
    id v4 = objc_msgSend(v13, sel_containsObject_, v14);
  }
  return v4;
}

uint64_t sub_25E4B9628(uint64_t a1, uint64_t a2)
{
  sub_25E4B968C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25E4B968C()
{
  if (!qword_26B38CD08)
  {
    unint64_t v0 = sub_25E4DAE40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CD08);
    }
  }
}

uint64_t sub_25E4B96E8(uint64_t a1)
{
  sub_25E4B968C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25E4B9744()
{
  unint64_t result = qword_26B38CC30;
  if (!qword_26B38CC30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B38CC30);
  }
  return result;
}

BOOL AccessCheckerHasAccess(_:toItemPaid:isBundlePaid:channelID:lineNumber:)(id a1, char a2, char a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a2)
  {
    id v11 = objc_msgSend(a1, sel_purchaseProvider);
    if (!a5)
    {
      swift_unknownObjectRelease();
      return 0;
    }
    id v12 = objc_msgSend(v11, sel_purchasedTagIDs);
    uint64_t v13 = sub_25E4DADA0();

    LOBYTE(v12) = sub_25E4BA644(a4, a5, v13);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      if ((a3 & 1) == 0) {
        return 0;
      }
      goto LABEL_8;
    }
    return 1;
  }
  if ((a3 & 1) == 0) {
    return 1;
  }
  if (!a5) {
    return 0;
  }
LABEL_8:
  v14 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  if (objc_getAssociatedObject(v14, v14 + 1))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  sub_25E4B9628((uint64_t)&v25, (uint64_t)v27);
  if (!v28)
  {
    sub_25E4B96E8((uint64_t)v27);
    goto LABEL_17;
  }
  sub_25E4B9744();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_17:
    v15 = 0;
    unint64_t v16 = 0;
    goto LABEL_18;
  }
  v15 = v24;
  unint64_t v16 = (unint64_t)objc_msgSend(v24, sel_integerValue);
  if (v16 == -1)
  {
LABEL_26:

    if ((((v16 + a6) ^ a6) & 1) == 0) {
      return 0;
    }
    goto LABEL_27;
  }
LABEL_18:
  if (objc_getAssociatedObject(v14, (const void *)~v16))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  sub_25E4B9628((uint64_t)&v25, (uint64_t)v27);
  if (!v28)
  {
    sub_25E4B96E8((uint64_t)v27);
    goto LABEL_26;
  }
  sub_25E4B9744();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_26;
  }
  id v17 = v24;
  unsigned int v18 = objc_msgSend(v17, sel_integerValue);

  if ((((v18 - a6) ^ (v16 + a6)) & 1) == 0) {
    return 0;
  }
LABEL_27:
  id v19 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  id v20 = objc_msgSend(v19, sel_bundleChannelIDs);

  v21 = (void *)sub_25E4DAC70();
  unsigned __int8 v22 = objc_msgSend(v20, sel_containsObject_, v21);

  return (v22 & 1) != 0;
}

BOOL AccessCheckerHasAccess(_:to:lineNumber:)(void *a1, id a2, int a3)
{
  unsigned __int8 v6 = objc_msgSend(a2, sel_isPaid);
  if (objc_msgSend(a2, sel_respondsToSelector_, sel_isBundlePaid)) {
    unsigned int v7 = objc_msgSend(a2, sel_isBundlePaid);
  }
  else {
    unsigned int v7 = 0;
  }
  id v8 = objc_msgSend(a2, sel_sourceChannel);
  uint64_t v9 = (uint64_t)v8;
  if (v8)
  {
    id v10 = objc_msgSend(v8, sel_identifier);
    swift_unknownObjectRelease();
    uint64_t v11 = sub_25E4DAC80();
    uint64_t v9 = v12;

    if (v6) {
      goto LABEL_6;
    }
LABEL_11:
    if (v7) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  uint64_t v11 = 0;
  if ((v6 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  id v13 = objc_msgSend(a1, sel_purchaseProvider);
  if (v9)
  {
    id v14 = objc_msgSend(v13, sel_purchasedTagIDs);
    uint64_t v15 = sub_25E4DADA0();

    LOBYTE(v14) = sub_25E4BA644(v11, v9, v15);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      if (!v7) {
        goto LABEL_35;
      }
      goto LABEL_15;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 1;
  }
  swift_unknownObjectRelease();
  if (!v7) {
    goto LABEL_35;
  }
LABEL_15:
  if (v9)
  {
    id v17 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    if (objc_getAssociatedObject(v17, v17 + 1))
    {
      sub_25E4DAE50();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_25E4B9628((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      sub_25E4B9744();
      if (swift_dynamicCast())
      {
        unsigned int v18 = v26;
        unint64_t v19 = (unint64_t)objc_msgSend(v26, sel_integerValue);
        if (v19 == -1)
        {
LABEL_34:

          if ((((v19 + a3) ^ a3) & 1) == 0) {
            goto LABEL_35;
          }
          goto LABEL_31;
        }
        goto LABEL_25;
      }
    }
    else
    {
      sub_25E4B96E8((uint64_t)v29);
    }
    unsigned int v18 = 0;
    unint64_t v19 = 0;
LABEL_25:
    if (objc_getAssociatedObject(v17, (const void *)~v19))
    {
      sub_25E4DAE50();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_25E4B9628((uint64_t)&v27, (uint64_t)v29);
    if (!v30)
    {
      sub_25E4B96E8((uint64_t)v29);
      goto LABEL_34;
    }
    sub_25E4B9744();
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_34;
    }
    id v20 = v26;
    unsigned int v21 = objc_msgSend(v20, sel_integerValue);

    if (((v21 - a3) ^ (v19 + a3)))
    {
LABEL_31:
      id v22 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
      swift_unknownObjectRelease();
      id v23 = objc_msgSend(v22, sel_bundleChannelIDs);

      id v24 = (void *)sub_25E4DAC70();
      unsigned __int8 v25 = objc_msgSend(v23, sel_containsObject_, v24);
      swift_bridgeObjectRelease();

      return (v25 & 1) != 0;
    }
LABEL_35:
    swift_bridgeObjectRelease();
  }
  return 0;
}

{
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  void *v16;
  unint64_t v17;
  id v18;
  unsigned int v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  long long v24;
  long long v25;
  unsigned char v26[24];
  uint64_t v27;

  unsigned __int8 v6 = objc_msgSend(a2, sel_isPaid);
  unsigned int v7 = objc_msgSend(a2, sel_isBundlePaid);
  id v8 = objc_msgSend(objc_msgSend(a2, sel_sourceChannel), sel_identifier);
  swift_unknownObjectRelease();
  uint64_t v9 = sub_25E4DAC80();
  uint64_t v11 = v10;

  if ((v6 & 1) == 0)
  {
    if (v7) {
      goto LABEL_6;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v12 = objc_msgSend(objc_msgSend(a1, sel_purchaseProvider), sel_purchasedTagIDs);
  id v13 = sub_25E4DADA0();

  LOBYTE(v12) = sub_25E4BA644(v9, v11, v13);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_8;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_6:
  id v14 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  if (objc_getAssociatedObject(v14, v14 + 1))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    id v24 = 0u;
    unsigned __int8 v25 = 0u;
  }
  sub_25E4B9628((uint64_t)&v24, (uint64_t)v26);
  if (!v27)
  {
    sub_25E4B96E8((uint64_t)v26);
    goto LABEL_16;
  }
  sub_25E4B9744();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    unint64_t v16 = 0;
    id v17 = 0;
    goto LABEL_17;
  }
  unint64_t v16 = v23;
  id v17 = (unint64_t)objc_msgSend(v23, sel_integerValue);
  if (v17 == -1)
  {
LABEL_26:

    if ((((v17 + a3) ^ a3) & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
LABEL_17:
  if (objc_getAssociatedObject(v14, (const void *)~v17))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    id v24 = 0u;
    unsigned __int8 v25 = 0u;
  }
  sub_25E4B9628((uint64_t)&v24, (uint64_t)v26);
  if (!v27)
  {
    sub_25E4B96E8((uint64_t)v26);
    goto LABEL_26;
  }
  sub_25E4B9744();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_26;
  }
  unsigned int v18 = v23;
  unint64_t v19 = objc_msgSend(v18, sel_integerValue);

  if (((v19 - a3) ^ (v17 + a3)))
  {
LABEL_23:
    id v20 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
    swift_unknownObjectRelease();
    unsigned int v21 = objc_msgSend(v20, sel_bundleChannelIDs);

    id v22 = (void *)sub_25E4DAC70();
    LOBYTE(v20) = objc_msgSend(v21, sel_containsObject_, v22);
    swift_bridgeObjectRelease();

    return (v20 & 1) != 0;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t AccessCheckerHasAccess(_:with:lineNumber:)(void *a1, void *a2, int a3)
{
  id v6 = objc_msgSend(a1, sel_purchaseProvider);
  if (objc_msgSend((id)swift_unknownObjectRetain(), sel_tagType) == (id)3)
  {
    id v7 = objc_msgSend(a2, sel_asSection);
    if (!v7
      || (id v8 = objc_msgSend(v7, sel_parentID), swift_unknownObjectRelease(), !v8))
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = objc_msgSend(a2, sel_identifier);
  }
  uint64_t v9 = sub_25E4DAC80();
  uint64_t v11 = v10;

  id v12 = objc_msgSend(v6, sel_purchasedTagIDs);
  uint64_t v13 = sub_25E4DADA0();

  LOBYTE(v12) = sub_25E4BA644(v9, v11, v13);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12) {
    return 1;
  }
LABEL_8:
  uint64_t v15 = (char *)objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  if (objc_getAssociatedObject(v15, v15 + 1))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_25E4B9628((uint64_t)&v24, (uint64_t)v26);
  if (v27)
  {
    sub_25E4B9744();
    if (swift_dynamicCast())
    {
      unint64_t v16 = v23;
      unint64_t v17 = (unint64_t)objc_msgSend(v23, sel_integerValue);
      if (v17 == -1) {
        goto LABEL_27;
      }
      goto LABEL_17;
    }
  }
  else
  {
    sub_25E4B96E8((uint64_t)v26);
  }
  unint64_t v16 = 0;
  unint64_t v17 = 0;
LABEL_17:
  if (objc_getAssociatedObject(v15, (const void *)~v17))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_25E4B9628((uint64_t)&v24, (uint64_t)v26);
  if (v27)
  {
    sub_25E4B9744();
    if (swift_dynamicCast())
    {
      id v18 = v23;
      unsigned int v19 = objc_msgSend(v18, sel_integerValue);

      if ((((v19 - a3) ^ (v17 + a3)) & 1) == 0) {
        return 0;
      }
      goto LABEL_23;
    }
  }
  else
  {
    sub_25E4B96E8((uint64_t)v26);
  }
LABEL_27:

  if ((((v17 + a3) ^ a3) & 1) == 0) {
    return 0;
  }
LABEL_23:
  id v20 = objc_msgSend(objc_msgSend(a1, sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  id v21 = objc_msgSend(a2, sel_identifier);
  if (!v21)
  {
    sub_25E4DAC80();
    id v21 = (id)sub_25E4DAC70();
    swift_bridgeObjectRelease();
  }
  id v14 = objc_msgSend(v20, sel_containsTagID_, v21);

  return (uint64_t)v14;
}

uint64_t sub_25E4BA644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25E4DB020();
    sub_25E4DACD0();
    uint64_t v6 = sub_25E4DB040();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25E4DAFC0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25E4DAFC0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t Assembly.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_25E4BA888();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25E4DB670;
  uint64_t v2 = type metadata accessor for StocksTabiAssembly();
  uint64_t v3 = swift_allocObject();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = sub_25E4BA938();
  *(void *)(v1 + 32) = v3;
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t Assembly.init()()
{
  sub_25E4BA888();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25E4DB670;
  uint64_t v2 = type metadata accessor for StocksTabiAssembly();
  uint64_t v3 = swift_allocObject();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = sub_25E4BA938();
  *(void *)(v1 + 32) = v3;
  *(void *)(v0 + 16) = v1;
  return v0;
}

void sub_25E4BA888()
{
  if (!qword_26B38CCA0)
  {
    sub_25E4BA8E0();
    unint64_t v0 = sub_25E4DAFA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CCA0);
    }
  }
}

unint64_t sub_25E4BA8E0()
{
  unint64_t result = qword_26B38C3B0;
  if (!qword_26B38C3B0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B38C3B0);
  }
  return result;
}

unint64_t sub_25E4BA938()
{
  unint64_t result = qword_26B38C420;
  if (!qword_26B38C420)
  {
    type metadata accessor for StocksTabiAssembly();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C420);
  }
  return result;
}

uint64_t Assembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Assembly.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Assembly.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_25E4BA9F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Assembly()
{
  return self;
}

uint64_t method lookup function for Assembly(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Assembly);
}

uint64_t dispatch thunk of Assembly.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t StocksTabiUserEventHistoryScoringService.score<A>(items:identifiedBy:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v27 = a2;
  uint64_t v5 = sub_25E4DA9A0();
  uint64_t v31 = *(void *)(v5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v30 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25E4DA1D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v29 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)v23 - v11;
  uint64_t v13 = (int *)type metadata accessor for StocksTabiArticleScoringWork();
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  *(void *)&v34[0] = a1;
  sub_25E4DAD90();
  swift_getWitnessTable();
  if (sub_25E4DADB0()) {
    return sub_25E4BB158(MEMORY[0x263F8EE78]);
  }
  uint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_workService);
  uint64_t v25 = v5;
  uint64_t v26 = v17;
  id v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v18(v12, v27, v7);
  long long v24 = (void (*)(char *, char *, uint64_t))v18;
  LODWORD(v27) = *(unsigned __int8 *)(v3
                                    + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_isSubscribed);
  sub_25E4BB9B4(0, &qword_26B38C530);
  uint64_t v19 = sub_25E4DAEB0();
  v23[1] = v19;
  sub_25E4BB488(v3 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_articleFeaturesFactory, (uint64_t)v34);
  sub_25E4BB488(v3 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_userEmbeddingProvider, (uint64_t)v33);
  uint64_t v28 = *(void *)(v3
                  + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_paidAccessChecker);
  v18(v15, (uint64_t)v12, v7);
  v15[v13[5]] = v27;
  uint64_t v32 = v19;
  sub_25E4BB94C(0, &qword_26B38CBB8, &qword_26B38C530, (uint64_t)&protocol descriptor for StocksTabiArticleDataType, MEMORY[0x263F8D488]);
  sub_25E4BB7FC();
  swift_unknownObjectRetain();
  uint64_t v20 = sub_25E4DAD60();
  swift_bridgeObjectRelease();
  *(void *)&v15[v13[6]] = v20;
  v24(v29, v12, v7);
  id v21 = v30;
  sub_25E4DA990();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v15[v13[10]], v21, v25);
  sub_25E4BB880(v34, (uint64_t)&v15[v13[7]]);
  sub_25E4BB880(v33, (uint64_t)&v15[v13[8]]);
  *(void *)&v15[v13[9]] = v28;
  sub_25E4BBD18(0, &qword_26B38CB90, MEMORY[0x263F8D060]);
  sub_25E4BB898();
  sub_25E4DAAD0();
  sub_25E4BB8F0((uint64_t)v15);
  return v35;
}

unint64_t sub_25E4BB018(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_25E4BBBC8();
  uint64_t v2 = sub_25E4DAF00();
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
    sub_25E4BBC34(v6, (uint64_t)v15, (uint64_t (*)(void))sub_25E4BBC9C);
    unint64_t result = sub_25E4C89C0((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_25E4BBD08(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_25E4BB158(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_25E4BBD18(0, &qword_26A6F2B00, MEMORY[0x263F8DFB0]);
  uint64_t v2 = (void *)sub_25E4DAF00();
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
    unint64_t result = sub_25E4C8A04(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
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

unint64_t sub_25E4BB284(uint64_t a1)
{
  sub_25E4BBAF8();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (void *)((char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    char v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_25E4BBB60();
  uint64_t v7 = sub_25E4DAF00();
  char v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  long long v10 = (char *)v6 + *(int *)(v3 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v26[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v4 + 72);
  swift_retain();
  while (1)
  {
    sub_25E4BBC34(v13, (uint64_t)v6, (uint64_t (*)(void))sub_25E4BBAF8);
    uint64_t v15 = *v6;
    uint64_t v16 = v6[1];
    unint64_t result = sub_25E4C8A04(*v6, v16);
    if (v18) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v20 = (uint64_t *)(v8[6] + 16 * result);
    *uint64_t v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    uint64_t v22 = sub_25E4DABC0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v19, v10, v22);
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
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

uint64_t sub_25E4BB488(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t StocksTabiUserEventHistoryScoringService.prepareForUse()()
{
  return sub_25E4DA850();
}

uint64_t sub_25E4BB548(void (*a1)(void))
{
  uint64_t v2 = qword_26B38CAC0;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  id v3 = (id)qword_26B38CAB0;
  sub_25E4DADE0();
  sub_25E4DAA90();

  a1();
  return swift_release();
}

uint64_t StocksTabiUserEventHistoryScoringService.prepareForUse(completionHandler:)(uint64_t (*a1)(void))
{
  if (qword_26B38CAC0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26B38CAB0;
  sub_25E4DADE0();
  sub_25E4DAA90();

  return a1();
}

id StocksTabiUserEventHistoryScoringService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void StocksTabiUserEventHistoryScoringService.init()()
{
}

id StocksTabiUserEventHistoryScoringService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25E4BB7FC()
{
  unint64_t result = qword_26B38CBC0;
  if (!qword_26B38CBC0)
  {
    sub_25E4BB94C(255, &qword_26B38CBB8, &qword_26B38C530, (uint64_t)&protocol descriptor for StocksTabiArticleDataType, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38CBC0);
  }
  return result;
}

uint64_t sub_25E4BB880(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_25E4BB898()
{
  unint64_t result = qword_26B38C600;
  if (!qword_26B38C600)
  {
    type metadata accessor for StocksTabiArticleScoringWork();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C600);
  }
  return result;
}

uint64_t sub_25E4BB8F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StocksTabiArticleScoringWork();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25E4BB94C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_25E4BB9B4(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_25E4BB9B4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_25E4BBA04()
{
  unint64_t result = qword_26B38CB88;
  if (!qword_26B38CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38CB88);
  }
  return result;
}

uint64_t sub_25E4BBA58(void (*a1)(void))
{
  return sub_25E4BB548(a1);
}

void sub_25E4BBA60()
{
  if (!qword_26B38C3C8)
  {
    unint64_t v0 = sub_25E4DA860();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38C3C8);
    }
  }
}

uint64_t type metadata accessor for StocksTabiUserEventHistoryScoringService()
{
  return self;
}

uint64_t method lookup function for StocksTabiUserEventHistoryScoringService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StocksTabiUserEventHistoryScoringService);
}

void sub_25E4BBAF8()
{
  if (!qword_26B38CBA0)
  {
    sub_25E4DABC0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B38CBA0);
    }
  }
}

void sub_25E4BBB60()
{
  if (!qword_26B38CC68)
  {
    sub_25E4DABC0();
    unint64_t v0 = sub_25E4DAF10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CC68);
    }
  }
}

void sub_25E4BBBC8()
{
  if (!qword_26A6F2AF0)
  {
    unint64_t v0 = sub_25E4DAF10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6F2AF0);
    }
  }
}

uint64_t sub_25E4BBC34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_25E4BBC9C()
{
  if (!qword_26A6F2AF8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26A6F2AF8);
    }
  }
}

_OWORD *sub_25E4BBD08(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_25E4BBD18(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void, void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8D310], MEMORY[0x263F8D538], MEMORY[0x263F8D320]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25E4BBD7C()
{
  return sub_25E4BC000(&qword_26B38C6C0, (void (*)(uint64_t))type metadata accessor for StocksTabiEventAggregationWork);
}

uint64_t type metadata accessor for StocksTabiEventAggregationWork()
{
  uint64_t result = qword_26B38C6D0;
  if (!qword_26B38C6D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4BBE10()
{
  return sub_25E4BC000(&qword_26B38C6C8, (void (*)(uint64_t))type metadata accessor for StocksTabiEventAggregationWork);
}

unint64_t sub_25E4BBE5C()
{
  unint64_t result = qword_26B38C990;
  if (!qword_26B38C990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C990);
  }
  return result;
}

uint64_t sub_25E4BBEB0()
{
  return sub_25E4BC000(&qword_26B38C330, MEMORY[0x263F07508]);
}

uint64_t sub_25E4BBEF8()
{
  return sub_25E4BC000((unint64_t *)&unk_26B38CE28, MEMORY[0x263F59F30]);
}

unint64_t sub_25E4BBF40()
{
  return 0xD000000000000011;
}

uint64_t sub_25E4BBF5C()
{
  return 0;
}

uint64_t sub_25E4BBF64()
{
  return sub_25E4DA9C0();
}

uint64_t sub_25E4BBF90@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_retain();
}

uint64_t sub_25E4BBFB0()
{
  return 1;
}

uint64_t sub_25E4BBFB8()
{
  return sub_25E4BC000(&qword_26A6F2B08, MEMORY[0x263F07508]);
}

uint64_t sub_25E4BC000(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E4BC048@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25E4DA1D0();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t *sub_25E4BC0B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E4DA1D0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25E4DA9E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_25E4BC1B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_25E4DA9E0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_25E4BC260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25E4DA9E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_25E4BC318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25E4DA9E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_25E4BC3D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25E4DA9E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_25E4BC488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25E4DA9E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25E4BC540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4BC554);
}

uint64_t sub_25E4BC554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_25E4DA9E0();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_25E4BC64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4BC660);
}

uint64_t sub_25E4BC660(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_25E4DA1D0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_25E4DA9E0();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_25E4BC764()
{
  uint64_t result = sub_25E4DA1D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25E4DA9E0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25E4BC82C(uint64_t a1)
{
  uint64_t result = sub_25E4BC000(&qword_26B38C6C0, (void (*)(uint64_t))type metadata accessor for StocksTabiEventAggregationWork);
  *(void *)(a1 + 8) = result;
  return result;
}

_UNKNOWN **sub_25E4BC884()
{
  return &protocol witness table for HeadlineScores.Cohort;
}

_UNKNOWN **sub_25E4BC890()
{
  return &protocol witness table for HeadlineScores.StockEntityCohort;
}

id sub_25E4BC8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager] = a1;
  *(void *)&v3[OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_workService] = a2;
  v15.receiver = v3;
  v15.super_class = ObjectType;
  swift_retain();
  swift_retain();
  id v7 = objc_msgSendSuper2(&v15, sel_init);
  uint64_t v8 = self;
  id v9 = v7;
  id v10 = objc_msgSend(v8, sel_defaultCenter, v15.receiver, v15.super_class);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v9, sel_applicationDidEnterBackground_, *MEMORY[0x263F83330], 0);

  id v11 = objc_msgSend(v8, sel_defaultCenter);
  uint64_t v12 = *MEMORY[0x263F83318];
  id v13 = v9;
  objc_msgSend(v11, sel_addObserver_selector_name_object_, v13, sel_applicationDidBecomeActive_, v12, 0);

  swift_release();
  swift_release();
  return v13;
}

void sub_25E4BCA20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E4DA350();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B38C9C8 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_26B38C9B8;
  sub_25E4BD2E8();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25E4DB670;
  sub_25E4DA0A0();
  sub_25E4BD398();
  id v8 = v6;
  uint64_t v9 = sub_25E4DAF90();
  uint64_t v11 = v10;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_25E4BBA04();
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  sub_25E4DADE0();
  sub_25E4DAA90();

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(void *)(*(void *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager+ 24));
  sub_25E4DA5B0();
  uint64_t v12 = sub_25E4DA330();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_25E4CE4B8(v12);
    sub_25E4CE6A8(v13);
    sub_25E4CEAC4(v13);
    id v14 = sub_25E4CEF5C(v13);
    id v15 = sub_25E4CF640(v13);
    id v16 = sub_25E4CFD24(v13);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    LOBYTE(v13) = objc_msgSend(v16, sel_enabled);
    if ((v13 & 1) == 0)
    {
      id v17 = (id)qword_26B38C9B8;
      sub_25E4DADE0();
      sub_25E4DAA90();

      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v18 = (id)qword_26B38C9B8;
  sub_25E4DADE0();
  sub_25E4DAA90();

  sub_25E4DAAB0();
}

void sub_25E4BCDA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E4DA350();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B38C9C8 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_26B38C9B8;
  sub_25E4BD2E8();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25E4DB670;
  sub_25E4DA0A0();
  sub_25E4BD398();
  id v8 = v6;
  uint64_t v9 = sub_25E4DAF90();
  uint64_t v11 = v10;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_25E4BBA04();
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  sub_25E4DADE0();
  sub_25E4DAA90();

  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(void *)(*(void *)(v1+ OBJC_IVAR____TtC21StocksPersonalization36StocksTabiWorkServiceUnloaderService_configurationManager)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager+ 24));
  sub_25E4DA5B0();
  uint64_t v12 = sub_25E4DA330();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_25E4CE4B8(v12);
    sub_25E4CE6A8(v13);
    sub_25E4CEAC4(v13);
    id v14 = sub_25E4CEF5C(v13);
    id v15 = sub_25E4CF640(v13);
    id v16 = sub_25E4CFD24(v13);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    LOBYTE(v13) = objc_msgSend(v16, sel_enabled);
    if ((v13 & 1) == 0)
    {
      id v17 = (id)qword_26B38C9B8;
      sub_25E4DADE0();
      sub_25E4DAA90();

      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v18 = (id)qword_26B38C9B8;
  sub_25E4DADE0();
  sub_25E4DAA90();

  sub_25E4DAAA0();
}

uint64_t sub_25E4BD120(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_25E4DA0A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4DA090();
  id v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_25E4BD240()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StocksTabiWorkServiceUnloaderService()
{
  return self;
}

void sub_25E4BD2E8()
{
  if (!qword_26B38CCE0)
  {
    sub_25E4BD340();
    unint64_t v0 = sub_25E4DAFA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CCE0);
    }
  }
}

unint64_t sub_25E4BD340()
{
  unint64_t result = qword_26B38CCF8;
  if (!qword_26B38CCF8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B38CCF8);
  }
  return result;
}

unint64_t sub_25E4BD398()
{
  unint64_t result = qword_26B38C2F8;
  if (!qword_26B38C2F8)
  {
    sub_25E4DA0A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C2F8);
  }
  return result;
}

uint64_t sub_25E4BD3F0()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory()
{
  return self;
}

unint64_t sub_25E4BD450()
{
  unint64_t result = qword_26B38C6B8;
  if (!qword_26B38C6B8)
  {
    type metadata accessor for StocksTabiEventAggregationWork();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C6B8);
  }
  return result;
}

uint64_t sub_25E4BD4A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = sub_25E4DA9E0();
  uint64_t v2 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25E4DA1D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_25E4DA1C0();
  uint64_t v12 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 16);
  v12(a1, v11, v5);
  v12((uint64_t)v9, v11, v5);
  swift_retain();
  sub_25E4DA9D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  uint64_t v13 = type metadata accessor for StocksTabiEventAggregationWork();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v2 + 32))(a1 + *(int *)(v13 + 20), v4, v16);
}

BOOL sub_25E4BD6A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25E4BD6BC()
{
  return sub_25E4DB040();
}

uint64_t sub_25E4BD704()
{
  return sub_25E4DB030();
}

uint64_t sub_25E4BD730()
{
  return sub_25E4DB040();
}

uint64_t TabiConfiguration.packageIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TabiConfiguration.mlComputeUnits.getter()
{
  if ((unint64_t)(*(void *)(v0 + 24) - 1) >= 3) {
    return 0;
  }
  else {
    return *(void *)(v0 + 24);
  }
}

uint64_t TabiConfiguration.version.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabiConfiguration.init(version:packageAssetIDs:mlComputeUnits:eventAggregationConfiguration:feedPersonalizationConfiguration:unloadGraphOnBackgroundConfiguration:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v9 = 0x4649434550534E55;
  if (a2) {
    uint64_t v9 = result;
  }
  unint64_t v10 = 0xEB00000000444549;
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (a2) {
    unint64_t v10 = a2;
  }
  if (a3) {
    uint64_t v11 = a3;
  }
  *a9 = v9;
  a9[1] = v10;
  if (a5) {
    a4 = 0;
  }
  a9[2] = v11;
  a9[3] = a4;
  a9[4] = a6;
  a9[5] = a7;
  a9[6] = a8;
  return result;
}

unint64_t sub_25E4BD824(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x416567616B636170;
      break;
    case 2:
      unint64_t result = 0x7475706D6F436C6DLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000020;
      break;
    case 5:
      unint64_t result = 0xD000000000000024;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25E4BD914(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x416567616B636170;
      break;
    case 2:
      unint64_t result = 0x7475706D6F436C6DLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000020;
      break;
    case 5:
      unint64_t result = 0xD000000000000024;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E4BDA04(unsigned __int8 *a1, char *a2)
{
  return sub_25E4BDA10(*a1, *a2);
}

uint64_t sub_25E4BDA10(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x6E6F6973726576;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6E6F6973726576;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x416567616B636170;
      unint64_t v3 = 0xEF73444974657373;
      break;
    case 2:
      unint64_t v5 = 0x7475706D6F436C6DLL;
      unint64_t v3 = 0xEE007374696E5565;
      break;
    case 3:
      unint64_t v3 = 0x800000025E4DC4C0;
      unint64_t v5 = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000020;
      uint64_t v6 = "feedPersonalizationConfiguration";
      goto LABEL_7;
    case 5:
      unint64_t v5 = 0xD000000000000024;
      uint64_t v6 = "unloadGraphOnBackgroundConfiguration";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x416567616B636170;
      unint64_t v7 = 0xEF73444974657373;
      break;
    case 2:
      unint64_t v2 = 0x7475706D6F436C6DLL;
      unint64_t v7 = 0xEE007374696E5565;
      break;
    case 3:
      unint64_t v7 = 0x800000025E4DC4C0;
      unint64_t v2 = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t v2 = 0xD000000000000020;
      uint64_t v8 = "feedPersonalizationConfiguration";
      goto LABEL_14;
    case 5:
      unint64_t v2 = 0xD000000000000024;
      uint64_t v8 = "unloadGraphOnBackgroundConfiguration";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25E4DAFC0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25E4BDC48()
{
  return sub_25E4BDC50();
}

uint64_t sub_25E4BDC50()
{
  return sub_25E4DB040();
}

uint64_t sub_25E4BDD88()
{
  return sub_25E4BDD90();
}

uint64_t sub_25E4BDD90()
{
  sub_25E4DACD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E4BDEB4()
{
  return sub_25E4BDEBC();
}

uint64_t sub_25E4BDEBC()
{
  return sub_25E4DB040();
}

uint64_t sub_25E4BDFF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25E4C007C();
  *a1 = result;
  return result;
}

unint64_t sub_25E4BE020@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25E4BD824(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25E4BE04C()
{
  return sub_25E4BD914(*v0);
}

uint64_t sub_25E4BE054@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25E4C007C();
  *a1 = result;
  return result;
}

uint64_t sub_25E4BE07C()
{
  return 0;
}

void sub_25E4BE088(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25E4BE094(uint64_t a1)
{
  unint64_t v2 = sub_25E4BE738();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E4BE0D0(uint64_t a1)
{
  unint64_t v2 = sub_25E4BE738();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabiConfiguration.encode(to:)(void *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  sub_25E4BEC28(0, &qword_26A6F2B20, MEMORY[0x263F8E0C0]);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v47 - v5;
  unint64_t v7 = (void *)v1[2];
  uint64_t v50 = v1[3];
  v51 = v7;
  uint64_t v8 = (void *)v1[4];
  char v9 = (void *)v1[6];
  v48 = (void *)v1[5];
  v49 = v8;
  uint64_t v10 = a1[3];
  uint64_t v11 = a1;
  uint64_t v13 = v12;
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_25E4BE738();
  sub_25E4DB060();
  LOBYTE(v54) = 0;
  id v14 = v6;
  uint64_t v15 = v52;
  sub_25E4DAF60();
  if (v15) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v14, v13);
  }
  uint64_t v16 = v49;
  id v17 = v48;
  id v54 = v51;
  char v53 = 1;
  sub_25E4BE78C();
  sub_25E4BEC8C(&qword_26A6F2B28);
  sub_25E4DAF80();
  LOBYTE(v54) = 2;
  sub_25E4DAF70();
  v47 = v14;
  if (v16)
  {
    uint64_t v52 = v4;
    id v19 = objc_msgSend(v16, sel_dictionary);
    sub_25E4DAC40();

    uint64_t v20 = self;
    uint64_t v21 = (void *)sub_25E4DAC30();
    swift_bridgeObjectRelease();
    id v54 = 0;
    id v22 = objc_msgSend(v20, sel_dataWithJSONObject_options_error_, v21, 0, &v54);

    id v23 = v54;
    if (!v22)
    {
      uint64_t v35 = v23;
      sub_25E4DA0B0();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v47, v13);
    }
    BOOL v24 = (void *)sub_25E4DA160();
    unint64_t v26 = v25;

    id v54 = v24;
    unint64_t v55 = v26;
    char v53 = 3;
    sub_25E4BE7E4();
    sub_25E4DAF80();
    uint64_t v4 = v52;
    sub_25E4BE838((uint64_t)v24, v26);
  }
  if (v17)
  {
    id v27 = objc_msgSend(v17, sel_dictionary);
    sub_25E4DAC40();

    uint64_t v28 = self;
    v29 = (void *)sub_25E4DAC30();
    swift_bridgeObjectRelease();
    id v54 = 0;
    id v30 = objc_msgSend(v28, sel_dataWithJSONObject_options_error_, v29, 0, &v54);

    id v31 = v54;
    if (!v30)
    {
      v36 = v31;
      sub_25E4DA0B0();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v47, v13);
    }
    uint64_t v32 = (void *)sub_25E4DA160();
    unint64_t v34 = v33;

    id v54 = v32;
    unint64_t v55 = v34;
    char v53 = 4;
    sub_25E4BE7E4();
    id v14 = v47;
    sub_25E4DAF80();
    sub_25E4BE838((uint64_t)v32, v34);
  }
  else
  {
    id v14 = v47;
  }
  if (!v9) {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v14, v13);
  }
  v37 = v14;
  id v38 = objc_msgSend(v9, sel_dictionary);
  sub_25E4DAC40();

  v39 = self;
  v40 = (void *)sub_25E4DAC30();
  swift_bridgeObjectRelease();
  id v54 = 0;
  id v41 = objc_msgSend(v39, sel_dataWithJSONObject_options_error_, v40, 0, &v54);

  id v42 = v54;
  if (v41)
  {
    v43 = (void *)sub_25E4DA160();
    unint64_t v45 = v44;

    id v54 = v43;
    unint64_t v55 = v45;
    char v53 = 5;
    sub_25E4BE7E4();
    sub_25E4DAF80();
    sub_25E4BE838((uint64_t)v43, v45);
  }
  else
  {
    v46 = v42;
    sub_25E4DA0B0();

    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v37, v13);
}

unint64_t sub_25E4BE738()
{
  unint64_t result = qword_26B38C978;
  if (!qword_26B38C978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C978);
  }
  return result;
}

void sub_25E4BE78C()
{
  if (!qword_26B38CBC8)
  {
    unint64_t v0 = sub_25E4DAD90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CBC8);
    }
  }
}

unint64_t sub_25E4BE7E4()
{
  unint64_t result = qword_26A6F2B30;
  if (!qword_26A6F2B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F2B30);
  }
  return result;
}

uint64_t sub_25E4BE838(uint64_t a1, unint64_t a2)
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

uint64_t TabiConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_25E4BEC28(0, (unint64_t *)&unk_26B38CC78, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v9 = (char *)&v25 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BE738();
  sub_25E4DB050();
  if (!v2)
  {
    char v35 = 0;
    uint64_t v10 = sub_25E4DAF30();
    unint64_t v12 = v11;
    sub_25E4BE78C();
    char v34 = 1;
    sub_25E4BEC8C((unint64_t *)&unk_26B38CBD8);
    sub_25E4DAF50();
    uint64_t v31 = v32;
    char v33 = 2;
    uint64_t v13 = sub_25E4DAF40();
    char v15 = v14;
    uint64_t v30 = v13;
    v29 = sub_25E4BECEC((uint64_t)v9, 3, (Class *)0x263F59568);
    uint64_t v28 = sub_25E4BECEC((uint64_t)v9, 4, (Class *)0x263F59570);
    id v17 = sub_25E4BEF38();
    if (v12) {
      uint64_t v18 = v10;
    }
    else {
      uint64_t v18 = 0x4649434550534E55;
    }
    unint64_t v19 = 0xEB00000000444549;
    if (v12) {
      unint64_t v19 = v12;
    }
    unint64_t v26 = v19;
    uint64_t v27 = v18;
    if (v31) {
      uint64_t v20 = v31;
    }
    else {
      uint64_t v20 = MEMORY[0x263F8EE78];
    }
    if (v15) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v30;
    }
    uint64_t v22 = (uint64_t)v17;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    unint64_t v23 = v26;
    *a2 = v27;
    a2[1] = v23;
    a2[2] = v20;
    a2[3] = v21;
    BOOL v24 = v28;
    a2[4] = (uint64_t)v29;
    a2[5] = (uint64_t)v24;
    a2[6] = v22;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_25E4BEC28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_25E4BE738();
    unint64_t v7 = a3(a1, &type metadata for TabiConfiguration.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_25E4BEC8C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25E4BE78C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

Class *sub_25E4BECEC(uint64_t a1, char a2, Class *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  LOBYTE(v15) = a2;
  sub_25E4BEC28(0, (unint64_t *)&unk_26B38CC78, MEMORY[0x263F8E040]);
  sub_25E4C00C8();
  sub_25E4DAF50();
  if (!v3)
  {
    unint64_t v6 = v17;
    if (v17 >> 60 != 15)
    {
      uint64_t v7 = (uint64_t)v16;
      uint64_t v8 = self;
      char v9 = (void *)sub_25E4DA150();
      id v16 = 0;
      id v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, &v16, v15);

      if (v10)
      {
        id v11 = v16;
        sub_25E4DAE50();
        swift_unknownObjectRelease();
        sub_25E4C0188();
        if (swift_dynamicCast())
        {
          id v12 = objc_allocWithZone(*a3);
          uint64_t v13 = (void *)sub_25E4DAC30();
          swift_bridgeObjectRelease();
          a3 = (Class *)objc_msgSend(v12, sel_initWithDictionary_, v13);

          sub_25E4C0174(v7, v6);
          return a3;
        }
        sub_25E4BF224();
        swift_allocError();
        unsigned char *v14 = 0;
      }
      else
      {
        a3 = (Class *)v16;
        sub_25E4DA0B0();
      }
      swift_willThrow();
      sub_25E4C0174(v7, v6);
      return a3;
    }
    return 0;
  }
  return a3;
}

id sub_25E4BEF38()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  LOBYTE(v12) = 5;
  sub_25E4BEC28(0, (unint64_t *)&unk_26B38CC78, MEMORY[0x263F8E040]);
  sub_25E4C00C8();
  sub_25E4DAF50();
  if (!v0)
  {
    unint64_t v3 = v14;
    if (v14 >> 60 != 15)
    {
      uint64_t v4 = (uint64_t)v13;
      uint64_t v5 = self;
      sub_25E4C011C((uint64_t)v13, v14);
      unint64_t v6 = (void *)sub_25E4DA150();
      id v13 = 0;
      id v7 = objc_msgSend(v5, sel_JSONObjectWithData_options_error_, v6, 0, &v13, v12);

      if (v7)
      {
        id v8 = v13;
        sub_25E4DAE50();
        swift_unknownObjectRelease();
        sub_25E4C0188();
        id v1 = (id)(MEMORY[0x263F8EE58] + 8);
        if (swift_dynamicCast())
        {
          id v9 = objc_allocWithZone(MEMORY[0x263F59578]);
          id v10 = (void *)sub_25E4DAC30();
          swift_bridgeObjectRelease();
          id v1 = objc_msgSend(v9, sel_initWithDictionary_, v10);

          sub_25E4C0174(v4, v3);
          sub_25E4C0174(v4, v3);
          return v1;
        }
        sub_25E4BF224();
        swift_allocError();
        *id v11 = 0;
      }
      else
      {
        id v1 = v13;
        sub_25E4DA0B0();
      }
      swift_willThrow();
      sub_25E4C0174(v4, v3);
      sub_25E4C0174(v4, v3);
      return v1;
    }
    return objc_msgSend(objc_allocWithZone(MEMORY[0x263F59578]), sel_initWithDictionary_, 0, v12);
  }
  return v1;
}

uint64_t TabiConfiguration.init(with:)()
{
  swift_bridgeObjectRelease();
  sub_25E4BF224();
  swift_allocError();
  *uint64_t v0 = 1;
  return swift_willThrow();
}

unint64_t sub_25E4BF224()
{
  unint64_t result = qword_26A6F2B38;
  if (!qword_26A6F2B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F2B38);
  }
  return result;
}

uint64_t sub_25E4BF27C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_25E4DAFC0(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    id v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_25E4DAFC0() & 1) == 0) {
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

uint64_t sub_25E4BF348()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25E4BF378()
{
  return sub_25E4DAB00();
}

uint64_t sub_25E4BF390()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E4BF3A0()
{
  swift_bridgeObjectRelease();
  sub_25E4BF224();
  swift_allocError();
  *uint64_t v0 = 1;
  return swift_willThrow();
}

uint64_t sub_25E4BF3F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return TabiConfiguration.init(from:)(a1, a2);
}

uint64_t sub_25E4BF410(void *a1)
{
  return TabiConfiguration.encode(to:)(a1);
}

id _s21StocksPersonalization17TabiConfigurationV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v4 = a1[3];
  unint64_t v3 = (void *)a1[4];
  char v6 = (void *)a1[5];
  BOOL v5 = (void *)a1[6];
  id v7 = (void *)a2[2];
  uint64_t v8 = a2[3];
  if (*a1 == *a2 && a1[1] == a2[1] || (id v9 = 0, (sub_25E4DAFC0() & 1) != 0))
  {
    id v9 = 0;
    if ((sub_25E4BF27C(v2, v7) & 1) != 0 && v4 == v8)
    {
      if (v3)
      {
        id v10 = objc_msgSend(v3, sel_dictionary);
        sub_25E4DAC40();
      }
      else
      {
        sub_25E4BB018(MEMORY[0x263F8EE78]);
      }
      BOOL v11 = (void *)sub_25E4DAC30();
      swift_bridgeObjectRelease();
      if (v3)
      {
        id v12 = objc_msgSend(v3, sel_dictionary);
        sub_25E4DAC40();
      }
      else
      {
        sub_25E4BB018(MEMORY[0x263F8EE78]);
      }
      id v13 = (void *)sub_25E4DAC30();
      swift_bridgeObjectRelease();
      unsigned int v14 = objc_msgSend(v11, sel_isEqualToDictionary_, v13);

      if (!v14) {
        return 0;
      }
      if (v6)
      {
        id v15 = objc_msgSend(v6, sel_dictionary);
        sub_25E4DAC40();
      }
      else
      {
        sub_25E4BB018(MEMORY[0x263F8EE78]);
      }
      id v16 = (void *)sub_25E4DAC30();
      swift_bridgeObjectRelease();
      if (v6)
      {
        id v17 = objc_msgSend(v6, sel_dictionary);
        sub_25E4DAC40();
      }
      else
      {
        sub_25E4BB018(MEMORY[0x263F8EE78]);
      }
      uint64_t v18 = (void *)sub_25E4DAC30();
      swift_bridgeObjectRelease();
      unsigned int v19 = objc_msgSend(v16, sel_isEqualToDictionary_, v18);

      if (v19)
      {
        if (v5)
        {
          id v20 = objc_msgSend(v5, sel_dictionary);
          sub_25E4DAC40();
        }
        else
        {
          sub_25E4BB018(MEMORY[0x263F8EE78]);
        }
        uint64_t v21 = (void *)sub_25E4DAC30();
        swift_bridgeObjectRelease();
        if (v5)
        {
          id v22 = objc_msgSend(v5, sel_dictionary);
          sub_25E4DAC40();
        }
        else
        {
          sub_25E4BB018(MEMORY[0x263F8EE78]);
        }
        unint64_t v23 = (void *)sub_25E4DAC30();
        swift_bridgeObjectRelease();
        id v9 = objc_msgSend(v21, sel_isEqualToDictionary_, v23);
      }
      else
      {
        return 0;
      }
    }
  }
  return v9;
}

unint64_t sub_25E4BF810()
{
  unint64_t result = qword_26B38C9A0;
  if (!qword_26B38C9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C9A0);
  }
  return result;
}

unint64_t sub_25E4BF868()
{
  unint64_t result = qword_26B38C998;
  if (!qword_26B38C998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C998);
  }
  return result;
}

unint64_t sub_25E4BF8C0()
{
  unint64_t result = qword_26B38CD70[0];
  if (!qword_26B38CD70[0])
  {
    sub_25E4DA900();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B38CD70);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TabiConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for TabiConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 48);
}

void *initializeWithCopy for TabiConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  BOOL v5 = (void *)a2[4];
  char v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  id v7 = (void *)a2[6];
  a1[6] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  return a1;
}

void *assignWithCopy for TabiConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  uint64_t v4 = (void *)a1[4];
  BOOL v5 = (void *)a2[4];
  a1[4] = v5;
  id v6 = v5;

  id v7 = (void *)a1[5];
  id v8 = (void *)a2[5];
  a1[5] = v8;
  id v9 = v8;

  id v10 = (void *)a1[6];
  BOOL v11 = (void *)a2[6];
  a1[6] = v11;
  id v12 = v11;

  return a1;
}

uint64_t assignWithTake for TabiConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  BOOL v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for TabiConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TabiConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TabiConfiguration()
{
  return &type metadata for TabiConfiguration;
}

uint64_t getEnumTagSinglePayload for TabiConfiguration.Errors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TabiConfiguration.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E4BFD30);
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

uint64_t sub_25E4BFD58(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25E4BFD64(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TabiConfiguration.Errors()
{
  return &type metadata for TabiConfiguration.Errors;
}

uint64_t getEnumTagSinglePayload for TabiConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TabiConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E4BFEDCLL);
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

unsigned char *sub_25E4BFF04(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TabiConfiguration.CodingKeys()
{
  return &type metadata for TabiConfiguration.CodingKeys;
}

unint64_t sub_25E4BFF20()
{
  unint64_t result = qword_26A6F2B40;
  if (!qword_26A6F2B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F2B40);
  }
  return result;
}

unint64_t sub_25E4BFF78()
{
  unint64_t result = qword_26A6F2B48;
  if (!qword_26A6F2B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A6F2B48);
  }
  return result;
}

unint64_t sub_25E4BFFD0()
{
  unint64_t result = qword_26B38C988;
  if (!qword_26B38C988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C988);
  }
  return result;
}

unint64_t sub_25E4C0028()
{
  unint64_t result = qword_26B38C980;
  if (!qword_26B38C980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C980);
  }
  return result;
}

uint64_t sub_25E4C007C()
{
  unint64_t v0 = sub_25E4DAF20();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_25E4C00C8()
{
  unint64_t result = qword_26B38C328;
  if (!qword_26B38C328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38C328);
  }
  return result;
}

uint64_t sub_25E4C011C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25E4C0174(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25E4BE838(a1, a2);
  }
  return a1;
}

void sub_25E4C0188()
{
  if (!qword_26B38CB98)
  {
    unint64_t v0 = sub_25E4DAC50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CB98);
    }
  }
}

uint64_t sub_25E4C01F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return MEMORY[0x270FA2498](sub_25E4C0214, 0, 0);
}

uint64_t sub_25E4C0214()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25E4C02AC;
  return MEMORY[0x270F79AB8]();
}

uint64_t sub_25E4C02AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for StocksTabiWorkServiceStartupTask()
{
  return self;
}

uint64_t sub_25E4C03CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F7CFA0];
  uint64_t v3 = sub_25E4DA7D0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_25E4C0440()
{
  return sub_25E4DA820();
}

uint64_t sub_25E4C0494()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25E4C0538;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_25E4C0214, 0, 0);
}

uint64_t sub_25E4C0538()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of StocksCohortType.clicks.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StocksCohortType.impressions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StocksEntityCohortType.stockEntityID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StocksCohortDataType.globalCohort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StocksCohortDataType.sourceChannelCohort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of StocksCohortDataType.stockEntityCohorts.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of StocksEntityMetadataType.stockEntityID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StocksEntityMetadataType.importance.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StocksEntityMetadataType.prior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of StocksTabiArticleDataType.originEntityID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StocksTabiArticleDataType.cohortData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of StocksTabiArticleDataType.entityMetadataList.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of StocksTabiArticleDataType.newsData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_25E4C0730@<X0>(void *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v134 = a2;
  uint64_t v135 = a4;
  uint64_t v133 = type metadata accessor for StocksTabiArticleFeatures();
  MEMORY[0x270FA5388](v133);
  BOOL v7 = (uint64_t *)((char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9);
  uint64_t v12 = v11;
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 56))(v13, v14);
  swift_getAssociatedTypeWitness();
  uint64_t v136 = sub_25E4BB9B4(0, &qword_26B38C520);
  uint64_t v15 = sub_25E4DAEB0();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_25E4C16C8(v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25E4C1F30(v16, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E4C20A0();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_25E4DB670;
  *(void *)(v17 + 32) = v10;
  *(void *)(v17 + 40) = v12;
  swift_bridgeObjectRetain();
  if (__OFSUB__(objc_msgSend(a3, sel_maxTopicIds), 1)) {
    goto LABEL_50;
  }
  uint64_t v18 = v7;
  uint64_t v19 = sub_25E4DAD80();
  swift_bridgeObjectRelease();
  *(void *)&long long v146 = v17;
  sub_25E4C1E44(v19);
  *uint64_t v18 = v10;
  v18[1] = v12;
  id v20 = v18;
  *(void *)&long long v146 = 0;
  *((void *)&v146 + 1) = 0xE000000000000000;
  v138 = a3;
  objc_msgSend(a3, sel_maxTopicIds);
  uint64_t v21 = sub_25E4DAD70();
  swift_bridgeObjectRelease();
  v20[2] = v21;
  uint64_t v139 = (uint64_t)v20;
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  v140 = a1;
  BOOL v24 = *(void (**)(uint64_t, uint64_t))(v23 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v148 = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v146);
  uint64_t v137 = v21;
  swift_bridgeObjectRetain();
  v24(v22, v23);
  uint64_t v26 = AssociatedTypeWitness;
  uint64_t v27 = v148;
  __swift_project_boxed_opaque_existential_1(&v146, AssociatedTypeWitness);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 40);
  uint64_t v29 = swift_getAssociatedTypeWitness();
  uint64_t v144 = v29;
  uint64_t v30 = swift_getAssociatedConformanceWitness();
  uint64_t v145 = v30;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v28(v26, v27);
  float v31 = (*(double (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
  *((float *)v20 + 6) = v31;
  uint64_t v32 = v140[3];
  uint64_t v33 = v140[4];
  __swift_project_boxed_opaque_existential_1(v140, v32);
  char v34 = *(void (**)(uint64_t, uint64_t))(v33 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v35 = swift_getAssociatedConformanceWitness();
  uint64_t v148 = v35;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v146);
  v34(v32, v33);
  uint64_t v36 = AssociatedTypeWitness;
  uint64_t v37 = v148;
  __swift_project_boxed_opaque_existential_1(&v146, AssociatedTypeWitness);
  id v38 = *(void (**)(uint64_t, uint64_t))(v35 + 40);
  uint64_t v39 = swift_getAssociatedTypeWitness();
  uint64_t v144 = v39;
  uint64_t v40 = swift_getAssociatedConformanceWitness();
  uint64_t v145 = v40;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v38(v36, v37);
  float v41 = (*(double (**)(uint64_t, uint64_t))(v40 + 16))(v39, v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
  uint64_t v42 = v139;
  *(float *)(v139 + 28) = v41;
  uint64_t v43 = v140[3];
  uint64_t v44 = v140[4];
  __swift_project_boxed_opaque_existential_1(v140, v43);
  unint64_t v45 = *(void (**)(uint64_t, uint64_t))(v44 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = swift_getAssociatedConformanceWitness();
  uint64_t v148 = v46;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v146);
  v45(v43, v44);
  uint64_t v47 = AssociatedTypeWitness;
  uint64_t v48 = v148;
  __swift_project_boxed_opaque_existential_1(&v146, AssociatedTypeWitness);
  v49 = *(void (**)(uint64_t, uint64_t))(v46 + 48);
  uint64_t v50 = swift_getAssociatedTypeWitness();
  uint64_t v144 = v50;
  uint64_t v51 = swift_getAssociatedConformanceWitness();
  uint64_t v145 = v51;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v49(v47, v48);
  float v52 = (*(double (**)(uint64_t, uint64_t))(v51 + 8))(v50, v51);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
  *(float *)(v42 + 32) = v52;
  uint64_t v53 = v140[3];
  uint64_t v54 = v140[4];
  __swift_project_boxed_opaque_existential_1(v140, v53);
  unint64_t v55 = *(void (**)(uint64_t, uint64_t))(v54 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v56 = swift_getAssociatedConformanceWitness();
  uint64_t v148 = v56;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v146);
  v55(v53, v54);
  uint64_t v57 = AssociatedTypeWitness;
  uint64_t v58 = v148;
  __swift_project_boxed_opaque_existential_1(&v146, AssociatedTypeWitness);
  v59 = *(void (**)(uint64_t, uint64_t))(v56 + 48);
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v144 = v60;
  uint64_t v61 = swift_getAssociatedConformanceWitness();
  uint64_t v145 = v61;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v143);
  v59(v57, v58);
  uint64_t v62 = v60;
  v63 = v140;
  float v64 = (*(double (**)(uint64_t, uint64_t))(v61 + 16))(v62, v61);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
  *(float *)(v42 + 36) = v64;
  uint64_t v65 = v63[3];
  uint64_t v66 = v63[4];
  __swift_project_boxed_opaque_existential_1(v63, v65);
  v67 = *(void (**)(uint64_t, uint64_t))(v66 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v68 = swift_getAssociatedConformanceWitness();
  uint64_t v148 = v68;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v146);
  v67(v65, v66);
  uint64_t v69 = AssociatedTypeWitness;
  uint64_t v70 = v148;
  __swift_project_boxed_opaque_existential_1(&v146, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v68 + 56))(v69, v70);
  swift_getAssociatedTypeWitness();
  sub_25E4BB9B4(0, &qword_26B38C510);
  uint64_t v71 = sub_25E4DAEB0();
  swift_bridgeObjectRelease();
  uint64_t v72 = *(void *)(v71 + 16);
  if (!v72)
  {
    v74 = (void *)MEMORY[0x263F8EE80];
LABEL_19:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
    uint64_t v94 = MEMORY[0x263F8EE78];
    *(void *)&long long v146 = MEMORY[0x263F8EE78];
    *((void *)&v146 + 1) = MEMORY[0x263F8EE78];
    uint64_t v95 = v137;
    uint64_t v96 = *(void *)(v137 + 16);
    v97 = v138;
    uint64_t v98 = v139;
    if (v96)
    {
      swift_bridgeObjectRetain_n();
      v99 = (uint64_t *)(v95 + 40);
      do
      {
        uint64_t v100 = *v99;
        *(void *)&long long v143 = *(v99 - 1);
        *((void *)&v143 + 1) = v100;
        swift_bridgeObjectRetain();
        sub_25E4C17F4((char **)&v146, (uint64_t *)&v143, (uint64_t)v74);
        v99 += 2;
        swift_bridgeObjectRelease();
        --v96;
      }
      while (v96);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    *(_OWORD *)(v98 + 40) = v146;
    uint64_t v101 = v63[3];
    uint64_t v102 = v63[4];
    __swift_project_boxed_opaque_existential_1(v63, v101);
    (*(void (**)(uint64_t, uint64_t))(v102 + 56))(v101, v102);
    swift_getAssociatedTypeWitness();
    uint64_t v103 = sub_25E4DAEB0();
    swift_bridgeObjectRelease();
    uint64_t v104 = *(void *)(v103 + 16);
    if (!v104)
    {
      v106 = (void *)MEMORY[0x263F8EE80];
LABEL_41:
      swift_bridgeObjectRelease();
      *(void *)&long long v146 = v94;
      *((void *)&v146 + 1) = v94;
      uint64_t v125 = *(void *)(v95 + 16);
      if (v125)
      {
        swift_bridgeObjectRetain();
        v126 = (uint64_t *)(v95 + 40);
        do
        {
          uint64_t v127 = *v126;
          *(void *)&long long v143 = *(v126 - 1);
          *((void *)&v143 + 1) = v127;
          swift_bridgeObjectRetain();
          sub_25E4C1B24((char **)&v146, (uint64_t *)&v143, (uint64_t)v106);
          v126 += 2;
          swift_bridgeObjectRelease();
          --v125;
        }
        while (v125);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_OWORD *)(v98 + 56) = v146;
      uint64_t v128 = v63[3];
      uint64_t v129 = v63[4];
      __swift_project_boxed_opaque_existential_1(v63, v128);
      uint64_t v130 = (*(uint64_t (**)(uint64_t, uint64_t))(v129 + 64))(v128, v129);
      MEMORY[0x2611DA1F0](v130, v134 & 1, v97);
      sub_25E4C20F8(v98, v135);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
    }
    uint64_t v105 = v103 + 32;
    uint64_t v136 = v103;
    swift_bridgeObjectRetain();
    v106 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      sub_25E4BB488(v105, (uint64_t)&v146);
      uint64_t v108 = AssociatedTypeWitness;
      uint64_t v109 = v148;
      __swift_project_boxed_opaque_existential_1(&v146, AssociatedTypeWitness);
      uint64_t v110 = (*(uint64_t (**)(uint64_t, uint64_t))(v109 + 8))(v108, v109);
      uint64_t v112 = v111;
      sub_25E4BB488((uint64_t)&v146, (uint64_t)&v143);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v142[0] = v106;
      unint64_t v115 = sub_25E4C8A04(v110, v112);
      uint64_t v116 = v106[2];
      BOOL v117 = (v114 & 1) == 0;
      uint64_t v118 = v116 + v117;
      if (__OFADD__(v116, v117)) {
        goto LABEL_47;
      }
      char v119 = v114;
      if (v106[3] >= v118)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v106 = *(void **)&v142[0];
          if ((v114 & 1) == 0) {
            goto LABEL_35;
          }
        }
        else
        {
          sub_25E4C9EC0();
          v106 = *(void **)&v142[0];
          if ((v119 & 1) == 0) {
            goto LABEL_35;
          }
        }
      }
      else
      {
        sub_25E4C9430(v118, isUniquelyReferenced_nonNull_native);
        unint64_t v120 = sub_25E4C8A04(v110, v112);
        if ((v119 & 1) != (v121 & 1)) {
          goto LABEL_51;
        }
        unint64_t v115 = v120;
        v106 = *(void **)&v142[0];
        if ((v119 & 1) == 0)
        {
LABEL_35:
          v106[(v115 >> 6) + 8] |= 1 << v115;
          v122 = (uint64_t *)(v106[6] + 16 * v115);
          uint64_t *v122 = v110;
          v122[1] = v112;
          sub_25E4BB880(&v143, v106[7] + 40 * v115);
          uint64_t v123 = v106[2];
          BOOL v92 = __OFADD__(v123, 1);
          uint64_t v124 = v123 + 1;
          if (v92) {
            goto LABEL_49;
          }
          v106[2] = v124;
          swift_bridgeObjectRetain();
          goto LABEL_27;
        }
      }
      uint64_t v107 = v106[7] + 40 * v115;
      __swift_destroy_boxed_opaque_existential_1(v107);
      sub_25E4BB880(&v143, v107);
LABEL_27:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v146);
      v105 += 40;
      if (!--v104)
      {
        swift_bridgeObjectRelease();
        v63 = v140;
        v97 = v138;
        uint64_t v98 = v139;
        uint64_t v95 = v137;
        uint64_t v94 = MEMORY[0x263F8EE78];
        goto LABEL_41;
      }
    }
  }
  uint64_t v73 = v71 + 32;
  uint64_t v132 = v71;
  swift_bridgeObjectRetain();
  v74 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    sub_25E4BB488(v73, (uint64_t)&v143);
    uint64_t v76 = v144;
    uint64_t v77 = v145;
    __swift_project_boxed_opaque_existential_1(&v143, v144);
    uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 16))(v76, v77);
    uint64_t v80 = v79;
    sub_25E4BB488((uint64_t)&v143, (uint64_t)v142);
    char v81 = swift_isUniquelyReferenced_nonNull_native();
    v141 = v74;
    unint64_t v83 = sub_25E4C8A04(v78, v80);
    uint64_t v84 = v74[2];
    BOOL v85 = (v82 & 1) == 0;
    uint64_t v86 = v84 + v85;
    if (__OFADD__(v84, v85)) {
      break;
    }
    char v87 = v82;
    if (v74[3] >= v86)
    {
      if (v81)
      {
        v74 = v141;
        if ((v82 & 1) == 0) {
          goto LABEL_13;
        }
      }
      else
      {
        sub_25E4C9EF0();
        v74 = v141;
        if ((v87 & 1) == 0) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      sub_25E4C9460(v86, v81);
      unint64_t v88 = sub_25E4C8A04(v78, v80);
      if ((v87 & 1) != (v89 & 1)) {
        goto LABEL_51;
      }
      unint64_t v83 = v88;
      v74 = v141;
      if ((v87 & 1) == 0)
      {
LABEL_13:
        v74[(v83 >> 6) + 8] |= 1 << v83;
        v90 = (uint64_t *)(v74[6] + 16 * v83);
        uint64_t *v90 = v78;
        v90[1] = v80;
        sub_25E4BB880(v142, v74[7] + 40 * v83);
        uint64_t v91 = v74[2];
        BOOL v92 = __OFADD__(v91, 1);
        uint64_t v93 = v91 + 1;
        if (v92) {
          goto LABEL_48;
        }
        v74[2] = v93;
        swift_bridgeObjectRetain();
        goto LABEL_5;
      }
    }
    uint64_t v75 = v74[7] + 40 * v83;
    __swift_destroy_boxed_opaque_existential_1(v75);
    sub_25E4BB880(v142, v75);
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v143);
    v73 += 40;
    if (!--v72)
    {
      swift_bridgeObjectRelease();
      v63 = v140;
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_51:
  uint64_t result = sub_25E4DAFD0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for StocksTabiArticleFeatures()
{
  uint64_t result = qword_26B38C538;
  if (!qword_26B38C538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4C16C8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_25E4C8C28(0, v1, 0);
    uint64_t v2 = v14;
    uint64_t v4 = (void *)(a1 + 32);
    do
    {
      uint64_t v5 = v4[3];
      uint64_t v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      uint64_t v9 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_25E4C8C28(0, *(void *)(v14 + 16) + 1, 1);
      }
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_25E4C8C28((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4C17F4(char **a1, uint64_t *a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    uint64_t v5 = *a2;
    uint64_t v6 = a2[1];
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_25E4C8A04(v5, v6);
    if (v8)
    {
      sub_25E4BB488(*(void *)(a3 + 56) + 40 * v7, (uint64_t)&v38);
      swift_bridgeObjectRelease();
      if (*((void *)&v39 + 1))
      {
        sub_25E4BB880(&v38, (uint64_t)v41);
        uint64_t v10 = v42;
        uint64_t v9 = v43;
        __swift_project_boxed_opaque_existential_1(v41, v42);
        double v11 = (*(double (**)(uint64_t))(*(void *)(v9 + 8) + 8))(v10);
        uint64_t v12 = *a1;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_25E4D0498(0, *((void *)v12 + 2) + 1, 1, v12);
        }
        unint64_t v13 = *((void *)v12 + 2);
        unint64_t v14 = *((void *)v12 + 3);
        unint64_t v15 = v13 + 1;
        if (v13 >= v14 >> 1)
        {
          uint64_t v32 = v12;
          unint64_t v33 = *((void *)v12 + 2);
          char v34 = sub_25E4D0498((char *)(v14 > 1), v13 + 1, 1, v32);
          unint64_t v13 = v33;
          uint64_t v12 = v34;
        }
        float v16 = v11;
        *((void *)v12 + 2) = v15;
        *(float *)&v12[4 * v13 + 32] = v16;
        *a1 = v12;
        uint64_t v18 = v42;
        uint64_t v17 = v43;
        __swift_project_boxed_opaque_existential_1(v41, v42);
        double v19 = (*(double (**)(uint64_t))(*(void *)(v17 + 8) + 16))(v18);
        id v20 = a1[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v20 = sub_25E4D0498(0, *((void *)v20 + 2) + 1, 1, v20);
        }
        unint64_t v21 = *((void *)v20 + 2);
        unint64_t v22 = *((void *)v20 + 3);
        unint64_t v23 = v21 + 1;
        if (v21 >= v22 >> 1)
        {
          uint64_t v35 = v20;
          unint64_t v36 = *((void *)v20 + 2);
          uint64_t v37 = sub_25E4D0498((char *)(v22 > 1), v21 + 1, 1, v35);
          unint64_t v21 = v36;
          id v20 = v37;
        }
        float v24 = v19;
        *((void *)v20 + 2) = v23;
        *(float *)&v20[4 * v21 + 32] = v24;
        a1[1] = v20;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      }
    }
    else
    {
      uint64_t v40 = 0;
      long long v38 = 0u;
      long long v39 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_25E4C215C((uint64_t)&v38, &qword_26B38C518, &qword_26B38C510);
  uint64_t v26 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v26 = sub_25E4D0498(0, *((void *)v26 + 2) + 1, 1, v26);
  }
  unint64_t v28 = *((void *)v26 + 2);
  unint64_t v27 = *((void *)v26 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t v26 = sub_25E4D0498((char *)(v27 > 1), v28 + 1, 1, v26);
  }
  *((void *)v26 + 2) = v28 + 1;
  *(_DWORD *)&v26[4 * v28 + 32] = 0;
  *a1 = v26;
  uint64_t v29 = (uint64_t)a1[1];
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25E4D0498(0, *(void *)(v29 + 16) + 1, 1, (char *)v29);
    uint64_t v29 = result;
  }
  unint64_t v31 = *(void *)(v29 + 16);
  unint64_t v30 = *(void *)(v29 + 24);
  if (v31 >= v30 >> 1)
  {
    uint64_t result = (uint64_t)sub_25E4D0498((char *)(v30 > 1), v31 + 1, 1, (char *)v29);
    uint64_t v29 = result;
  }
  *(void *)(v29 + 16) = v31 + 1;
  *(_DWORD *)(v29 + 4 * v31 + 32) = 0;
  a1[1] = (char *)v29;
  return result;
}

uint64_t sub_25E4C1B24(char **a1, uint64_t *a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    uint64_t v5 = *a2;
    uint64_t v6 = a2[1];
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_25E4C8A04(v5, v6);
    if (v8)
    {
      sub_25E4BB488(*(void *)(a3 + 56) + 40 * v7, (uint64_t)&v30);
      swift_bridgeObjectRelease();
      if (*((void *)&v31 + 1))
      {
        sub_25E4BB880(&v30, (uint64_t)v33);
        uint64_t v9 = v34;
        uint64_t v10 = v35;
        __swift_project_boxed_opaque_existential_1(v33, v34);
        double v11 = (*(double (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
        uint64_t v12 = *a1;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_25E4D0498(0, *((void *)v12 + 2) + 1, 1, v12);
        }
        unint64_t v14 = *((void *)v12 + 2);
        unint64_t v13 = *((void *)v12 + 3);
        if (v14 >= v13 >> 1) {
          uint64_t v12 = sub_25E4D0498((char *)(v13 > 1), v14 + 1, 1, v12);
        }
        float v15 = v11;
        *((void *)v12 + 2) = v14 + 1;
        *(float *)&v12[4 * v14 + 32] = v15;
        *a1 = v12;
        uint64_t v16 = v34;
        uint64_t v17 = v35;
        __swift_project_boxed_opaque_existential_1(v33, v34);
        double v18 = (*(double (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
        double v19 = a1[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          double v19 = sub_25E4D0498(0, *((void *)v19 + 2) + 1, 1, v19);
        }
        unint64_t v21 = *((void *)v19 + 2);
        unint64_t v20 = *((void *)v19 + 3);
        if (v21 >= v20 >> 1) {
          double v19 = sub_25E4D0498((char *)(v20 > 1), v21 + 1, 1, v19);
        }
        float v22 = v18;
        *((void *)v19 + 2) = v21 + 1;
        *(float *)&v19[4 * v21 + 32] = v22;
        a1[1] = v19;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      }
    }
    else
    {
      uint64_t v32 = 0;
      long long v30 = 0u;
      long long v31 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
  }
  sub_25E4C215C((uint64_t)&v30, &qword_26B38C528, &qword_26B38C520);
  float v24 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    float v24 = sub_25E4D0498(0, *((void *)v24 + 2) + 1, 1, v24);
  }
  unint64_t v26 = *((void *)v24 + 2);
  unint64_t v25 = *((void *)v24 + 3);
  if (v26 >= v25 >> 1) {
    float v24 = sub_25E4D0498((char *)(v25 > 1), v26 + 1, 1, v24);
  }
  *((void *)v24 + 2) = v26 + 1;
  *(_DWORD *)&v24[4 * v26 + 32] = 0;
  *a1 = v24;
  uint64_t v27 = (uint64_t)a1[1];
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25E4D0498(0, *(void *)(v27 + 16) + 1, 1, (char *)v27);
    uint64_t v27 = result;
  }
  unint64_t v29 = *(void *)(v27 + 16);
  unint64_t v28 = *(void *)(v27 + 24);
  if (v29 >= v28 >> 1)
  {
    uint64_t result = (uint64_t)sub_25E4D0498((char *)(v28 > 1), v29 + 1, 1, (char *)v27);
    uint64_t v27 = result;
  }
  *(void *)(v27 + 16) = v29 + 1;
  *(_DWORD *)(v27 + 4 * v29 + 32) = 0;
  a1[1] = (char *)v27;
  return result;
}

uint64_t sub_25E4C1E44(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_25E4D0388((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *int64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_25E4C1F30(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(result + 16);
  if (!v3) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v6 = 0;
  uint64_t v7 = result + 40;
  uint64_t v8 = -(uint64_t)v3;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v19 = result + 40;
  do
  {
    if (v6 <= v3) {
      unint64_t v10 = v3;
    }
    else {
      unint64_t v10 = v6;
    }
    uint64_t v11 = -(uint64_t)v10;
    for (i = (uint64_t *)(v7 + 16 * v6++); ; i += 2)
    {
      if (v11 + v6 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v13 = *(i - 1);
      uint64_t v14 = *i;
      if (v13 != a2 || v14 != a3)
      {
        uint64_t result = sub_25E4DAFC0();
        if ((result & 1) == 0) {
          break;
        }
      }
      ++v6;
      if (v8 + v6 == 1) {
        return v9;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      uint64_t result = (uint64_t)sub_25E4C8C28(0, *(void *)(v9 + 16) + 1, 1);
    }
    unint64_t v17 = *(void *)(v9 + 16);
    unint64_t v16 = *(void *)(v9 + 24);
    if (v17 >= v16 >> 1) {
      uint64_t result = (uint64_t)sub_25E4C8C28((char *)(v16 > 1), v17 + 1, 1);
    }
    *(void *)(v9 + 16) = v17 + 1;
    uint64_t v18 = v9 + 16 * v17;
    *(void *)(v18 + 32) = v13;
    *(void *)(v18 + 40) = v14;
    unint64_t v3 = v20;
    uint64_t v7 = v19;
  }
  while (v8 + v6);
  return v9;
}

void sub_25E4C20A0()
{
  if (!qword_26B38D160)
  {
    unint64_t v0 = sub_25E4DAFA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38D160);
    }
  }
}

uint64_t sub_25E4C20F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StocksTabiArticleFeatures();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4C215C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_25E4C21B8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_25E4C21B8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_25E4BB9B4(255, a3);
    unint64_t v4 = sub_25E4DAE40();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_25E4C2210(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (void *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = a2[2];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v6 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v6;
    uint64_t v7 = a2[8];
    uint64_t v8 = *(int *)(a3 + 56);
    uint64_t v13 = (uint64_t)a2 + v8;
    uint64_t v14 = a1 + v8;
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v7;
    uint64_t v9 = sub_25E4DA960();
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v14, v13, v9);
  }
  return v3;
}

uint64_t sub_25E4C2350(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = sub_25E4DA960();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_25E4C23F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v11 = a2 + v7;
  uint64_t v12 = a1 + v7;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v8 = sub_25E4DA960();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v12, v11, v8);
  return a1;
}

uint64_t sub_25E4C24E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 56);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25E4DA960();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_25E4C2614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v4 = *(int *)(a3 + 56);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25E4DA960();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_25E4C26B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25E4DA960();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_25E4C2794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4C27A8);
}

uint64_t sub_25E4C27A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25E4DA960();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 56);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25E4C2858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4C286C);
}

uint64_t sub_25E4C286C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25E4DA960();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 56);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25E4C2914()
{
  uint64_t result = sub_25E4DA960();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25E4C29D4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_25E4C8C28(0, v1, 0);
    uint64_t v2 = v13;
    uint64_t v4 = *(void *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    uint64_t v5 = *(void *)(v4 + 72);
    uint64_t v6 = (uint64_t *)(((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + a1 + 8);
    do
    {
      uint64_t v8 = *(v6 - 1);
      uint64_t v7 = *v6;
      unint64_t v10 = *(void *)(v13 + 16);
      unint64_t v9 = *(void *)(v13 + 24);
      swift_bridgeObjectRetain();
      if (v10 >= v9 >> 1) {
        sub_25E4C8C28((char *)(v9 > 1), v10 + 1, 1);
      }
      uint64_t v6 = (uint64_t *)((char *)v6 + v5);
      *(void *)(v13 + 16) = v10 + 1;
      uint64_t v11 = v13 + 16 * v10;
      *(void *)(v11 + 32) = v8;
      *(void *)(v11 + 40) = v7;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4C2B04(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_25E4C8C98(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    uint64_t v5 = *(void *)(v4 + 72);
    uint64_t v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 24);
    do
    {
      int v7 = *v6;
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_25E4C8C98((char *)(v8 > 1), v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      uint64_t v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4C2C34(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_25E4C8C98(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    uint64_t v5 = *(void *)(v4 + 72);
    uint64_t v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 28);
    do
    {
      int v7 = *v6;
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_25E4C8C98((char *)(v8 > 1), v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      uint64_t v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4C2D64(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_25E4C8C98(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    uint64_t v5 = *(void *)(v4 + 72);
    uint64_t v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 32);
    do
    {
      int v7 = *v6;
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_25E4C8C98((char *)(v8 > 1), v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      uint64_t v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4C2E94(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_25E4C8C98(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(type metadata accessor for StocksTabiArticleFeatures() - 8);
    uint64_t v5 = *(void *)(v4 + 72);
    uint64_t v6 = (int *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + 36);
    do
    {
      int v7 = *v6;
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_25E4C8C98((char *)(v8 > 1), v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(_DWORD *)(v11 + 4 * v9 + 32) = v7;
      uint64_t v6 = (int *)((char *)v6 + v5);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4C2FC4(uint64_t a1)
{
  uint64_t v3 = sub_25E4DA960();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v7)
  {
    v14[1] = v1;
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_25E4C8C48(0, v7, 0);
    uint64_t v8 = v18;
    uint64_t v17 = type metadata accessor for StocksTabiArticleFeatures();
    uint64_t v9 = a1
       + ((*(unsigned __int8 *)(*(void *)(v17 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80));
    uint64_t v16 = *(void *)(*(void *)(v17 - 8) + 72);
    unint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v14[2] = v4 + 32;
    float v15 = v10;
    do
    {
      v15(v6, v9 + *(int *)(v17 + 56), v3);
      uint64_t v18 = v8;
      unint64_t v12 = *(void *)(v8 + 16);
      unint64_t v11 = *(void *)(v8 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_25E4C8C48(v11 > 1, v12 + 1, 1);
        uint64_t v8 = v18;
      }
      *(void *)(v8 + 16) = v12 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v12, v6, v3);
      v9 += v16;
      --v7;
    }
    while (v7);
  }
  return v8;
}

char *sub_25E4C31DC(uint64_t a1, uint64_t a2)
{
  uint64_t v105 = a2;
  uint64_t v3 = type metadata accessor for StocksTabiArticleFeatures();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v114 = (uint64_t)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v113 = (uint64_t)&v101 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v115 = (uint64_t)&v101 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v101 - v12;
  MEMORY[0x270FA5388](v11);
  float v15 = (char *)&v101 - v14;
  sub_25E4C3D74();
  sub_25E4BBAF8();
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(*(void *)(v16 - 8) + 72);
  unint64_t v19 = (*(unsigned __int8 *)(*(void *)(v16 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_25E4DBE70;
  uint64_t v103 = v20;
  unint64_t v21 = (void *)(v20 + v19);
  uint64_t v112 = v17;
  void *v21 = 0xD000000000000025;
  v21[1] = 0x800000025E4DCAE0;
  unint64_t v22 = 0;
  sub_25E4C29D4(a1);
  sub_25E4DABB0();
  swift_bridgeObjectRelease();
  uint64_t v110 = v21;
  uint64_t v111 = v18;
  unint64_t v23 = (void *)((char *)v21 + v18);
  *unint64_t v23 = 0xD000000000000020;
  v23[1] = 0x800000025E4DCB10;
  uint64_t v24 = *(void *)(a1 + 16);
  uint64_t v108 = v4;
  uint64_t v109 = v24;
  uint64_t v107 = a1;
  if (v24)
  {
    uint64_t v102 = v23;
    unint64_t v106 = 0;
    uint64_t v25 = v4;
    uint64_t v26 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v27 = *(void *)(v25 + 72);
    swift_bridgeObjectRetain();
    unint64_t v28 = (char *)MEMORY[0x263F8EE78];
    do
    {
      sub_25E4C3DCC(v26, (uint64_t)v15);
      uint64_t v116 = *((void *)v15 + 2);
      sub_25E4BE78C();
      sub_25E4C3E30();
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_25E4DAC60();
      uint64_t v31 = v30;
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v28 = sub_25E4D0388(0, *((void *)v28 + 2) + 1, 1, v28);
      }
      unint64_t v33 = *((void *)v28 + 2);
      unint64_t v32 = *((void *)v28 + 3);
      if (v33 >= v32 >> 1) {
        unint64_t v28 = sub_25E4D0388((char *)(v32 > 1), v33 + 1, 1, v28);
      }
      *((void *)v28 + 2) = v33 + 1;
      uint64_t v34 = &v28[16 * v33];
      *((void *)v34 + 4) = v29;
      *((void *)v34 + 5) = v31;
      sub_25E4C3E88((uint64_t)v15);
      v26 += v27;
      --v24;
    }
    while (v24);
    a1 = v107;
    swift_bridgeObjectRelease();
    uint64_t v4 = v108;
    unint64_t v22 = v106;
  }
  sub_25E4DABB0();
  swift_bridgeObjectRelease();
  uint64_t v35 = v110;
  uint64_t v36 = v111;
  uint64_t v37 = (void *)((char *)v110 + 2 * v111);
  void *v37 = 0xD00000000000002DLL;
  v37[1] = 0x800000025E4DCB40;
  sub_25E4C2B04(a1);
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  long long v38 = (void *)((char *)v35 + 3 * v36);
  unint64_t v106 = 0xD000000000000032;
  *long long v38 = 0xD000000000000032;
  v38[1] = 0x800000025E4DCB70;
  sub_25E4C2C34(a1);
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  long long v39 = (void *)((char *)v35 + 4 * v36);
  void *v39 = 0xD000000000000030;
  v39[1] = 0x800000025E4DCBB0;
  sub_25E4C2D64(a1);
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  uint64_t v40 = (void *)((char *)v35 + 5 * v36);
  void *v40 = 0xD000000000000035;
  v40[1] = 0x800000025E4DCBF0;
  sub_25E4C2E94(a1);
  uint64_t v102 = (void *)v22;
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  float v41 = (void *)((char *)v35 + 6 * v36);
  *float v41 = 0xD00000000000002DLL;
  v41[1] = 0x800000025E4DCC30;
  uint64_t v42 = v109;
  if (v109)
  {
    uint64_t v43 = v4;
    uint64_t v44 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v45 = *(void *)(v43 + 72);
    swift_bridgeObjectRetain();
    uint64_t v46 = (char *)MEMORY[0x263F8EE78];
    uint64_t v47 = v42;
    while (1)
    {
      uint64_t result = (char *)sub_25E4C3DCC(v44, (uint64_t)v13);
      uint64_t v49 = *((void *)v13 + 5);
      uint64_t v50 = *(void *)(v49 + 16);
      int64_t v51 = *((void *)v46 + 2);
      int64_t v52 = v51 + v50;
      if (__OFADD__(v51, v50)) {
        goto LABEL_83;
      }
      swift_bridgeObjectRetain();
      uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (result && v52 <= *((void *)v46 + 3) >> 1)
      {
        if (*(void *)(v49 + 16)) {
          goto LABEL_22;
        }
      }
      else
      {
        if (v51 <= v52) {
          int64_t v53 = v51 + v50;
        }
        else {
          int64_t v53 = v51;
        }
        uint64_t result = sub_25E4D0498(result, v53, 1, v46);
        uint64_t v46 = result;
        if (*(void *)(v49 + 16))
        {
LABEL_22:
          uint64_t v54 = *((void *)v46 + 2);
          if ((*((void *)v46 + 3) >> 1) - v54 < v50) {
            goto LABEL_90;
          }
          uint64_t result = (char *)memcpy(&v46[4 * v54 + 32], (const void *)(v49 + 32), 4 * v50);
          if (v50)
          {
            uint64_t v55 = *((void *)v46 + 2);
            BOOL v56 = __OFADD__(v55, v50);
            uint64_t v57 = v55 + v50;
            if (v56) {
              goto LABEL_94;
            }
            *((void *)v46 + 2) = v57;
          }
          goto LABEL_12;
        }
      }
      if (v50)
      {
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
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
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
LABEL_97:
        __break(1u);
        return result;
      }
LABEL_12:
      swift_bridgeObjectRelease();
      sub_25E4C3E88((uint64_t)v13);
      v44 += v45;
      if (!--v47)
      {
        a1 = v107;
        swift_bridgeObjectRelease();
        uint64_t v4 = v108;
        uint64_t v42 = v109;
        break;
      }
    }
  }
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  uint64_t v58 = (void *)((char *)&v110[v111] - v111);
  *uint64_t v58 = v106;
  v58[1] = 0x800000025E4DCC60;
  if (v42)
  {
    uint64_t v59 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v60 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    uint64_t v61 = (char *)MEMORY[0x263F8EE78];
    uint64_t v62 = v42;
    uint64_t v63 = v115;
    while (1)
    {
      uint64_t result = (char *)sub_25E4C3DCC(v59, v63);
      uint64_t v64 = *(void *)(v63 + 48);
      uint64_t v65 = *(void *)(v64 + 16);
      int64_t v66 = *((void *)v61 + 2);
      int64_t v67 = v66 + v65;
      if (__OFADD__(v66, v65)) {
        goto LABEL_84;
      }
      swift_bridgeObjectRetain();
      uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (result && v67 <= *((void *)v61 + 3) >> 1)
      {
        if (*(void *)(v64 + 16)) {
          goto LABEL_40;
        }
      }
      else
      {
        if (v66 <= v67) {
          int64_t v68 = v66 + v65;
        }
        else {
          int64_t v68 = v66;
        }
        uint64_t result = sub_25E4D0498(result, v68, 1, v61);
        uint64_t v61 = result;
        if (*(void *)(v64 + 16))
        {
LABEL_40:
          uint64_t v69 = *((void *)v61 + 2);
          if ((*((void *)v61 + 3) >> 1) - v69 < v65) {
            goto LABEL_91;
          }
          uint64_t result = (char *)memcpy(&v61[4 * v69 + 32], (const void *)(v64 + 32), 4 * v65);
          if (v65)
          {
            uint64_t v70 = *((void *)v61 + 2);
            BOOL v56 = __OFADD__(v70, v65);
            uint64_t v71 = v70 + v65;
            if (v56) {
              goto LABEL_95;
            }
            *((void *)v61 + 2) = v71;
          }
          goto LABEL_30;
        }
      }
      if (v65) {
        goto LABEL_86;
      }
LABEL_30:
      swift_bridgeObjectRelease();
      uint64_t v63 = v115;
      sub_25E4C3E88(v115);
      v59 += v60;
      if (!--v62)
      {
        swift_bridgeObjectRelease();
        uint64_t v72 = v114;
        uint64_t v4 = v108;
        uint64_t v42 = v109;
        goto LABEL_46;
      }
    }
  }
  uint64_t v72 = v114;
LABEL_46:
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  uint64_t v73 = &v110[v111];
  *uint64_t v73 = 0xD00000000000002DLL;
  v73[1] = 0x800000025E4DCCA0;
  if (v42)
  {
    uint64_t v74 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v75 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    uint64_t v76 = (char *)MEMORY[0x263F8EE78];
    uint64_t v77 = v42;
    uint64_t v78 = v113;
    while (1)
    {
      uint64_t result = (char *)sub_25E4C3DCC(v74, v78);
      uint64_t v79 = *(void *)(v78 + 56);
      uint64_t v80 = *(void *)(v79 + 16);
      int64_t v81 = *((void *)v76 + 2);
      int64_t v82 = v81 + v80;
      if (__OFADD__(v81, v80)) {
        goto LABEL_85;
      }
      swift_bridgeObjectRetain();
      uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (result && v82 <= *((void *)v76 + 3) >> 1)
      {
        if (*(void *)(v79 + 16)) {
          goto LABEL_59;
        }
      }
      else
      {
        if (v81 <= v82) {
          int64_t v83 = v81 + v80;
        }
        else {
          int64_t v83 = v81;
        }
        uint64_t result = sub_25E4D0498(result, v83, 1, v76);
        uint64_t v76 = result;
        if (*(void *)(v79 + 16))
        {
LABEL_59:
          uint64_t v84 = *((void *)v76 + 2);
          if ((*((void *)v76 + 3) >> 1) - v84 < v80) {
            goto LABEL_92;
          }
          uint64_t result = (char *)memcpy(&v76[4 * v84 + 32], (const void *)(v79 + 32), 4 * v80);
          if (v80)
          {
            uint64_t v85 = *((void *)v76 + 2);
            BOOL v56 = __OFADD__(v85, v80);
            uint64_t v86 = v85 + v80;
            if (v56) {
              goto LABEL_96;
            }
            *((void *)v76 + 2) = v86;
          }
          goto LABEL_49;
        }
      }
      if (v80) {
        goto LABEL_87;
      }
LABEL_49:
      swift_bridgeObjectRelease();
      uint64_t v78 = v113;
      sub_25E4C3E88(v113);
      v74 += v75;
      if (!--v77)
      {
        swift_bridgeObjectRelease();
        uint64_t v72 = v114;
        uint64_t v4 = v108;
        uint64_t v42 = v109;
        break;
      }
    }
  }
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  char v87 = (void *)((char *)v110 + 9 * v111);
  *char v87 = 0xD000000000000023;
  v87[1] = 0x800000025E4DCCD0;
  if (v42)
  {
    uint64_t v88 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v89 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    v90 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v91 = v42;
      uint64_t result = (char *)sub_25E4C3DCC(v88, v72);
      uint64_t v92 = *(void *)(v72 + 64);
      uint64_t v93 = *(void *)(v92 + 16);
      int64_t v94 = *((void *)v90 + 2);
      int64_t v95 = v94 + v93;
      if (__OFADD__(v94, v93)) {
        goto LABEL_88;
      }
      swift_bridgeObjectRetain();
      uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!result || v95 > *((void *)v90 + 3) >> 1)
      {
        if (v94 <= v95) {
          int64_t v96 = v94 + v93;
        }
        else {
          int64_t v96 = v94;
        }
        uint64_t result = sub_25E4D0498(result, v96, 1, v90);
        v90 = result;
      }
      if (*(void *)(v92 + 16))
      {
        uint64_t v97 = *((void *)v90 + 2);
        if ((*((void *)v90 + 3) >> 1) - v97 < v93) {
          goto LABEL_93;
        }
        uint64_t result = (char *)memcpy(&v90[4 * v97 + 32], (const void *)(v92 + 32), 4 * v93);
        if (v93)
        {
          uint64_t v98 = *((void *)v90 + 2);
          BOOL v56 = __OFADD__(v98, v93);
          uint64_t v99 = v98 + v93;
          if (v56) {
            goto LABEL_97;
          }
          *((void *)v90 + 2) = v99;
        }
      }
      else if (v93)
      {
        goto LABEL_89;
      }
      swift_bridgeObjectRelease();
      uint64_t v72 = v114;
      sub_25E4C3E88(v114);
      v88 += v89;
      uint64_t v42 = v91 - 1;
      if (v91 == 1)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  sub_25E4DABA0();
  swift_bridgeObjectRelease();
  sub_25E4BB284(v103);
  __swift_project_boxed_opaque_existential_1((void *)(v104 + 16), *(void *)(v104 + 40));
  sub_25E4C2FC4(a1);
  sub_25E4DAA50();
  swift_bridgeObjectRelease();
  sub_25E4DABC0();
  uint64_t v100 = sub_25E4DA790();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (char *)v100;
}

uint64_t sub_25E4C3D18()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StocksTabiArticleFeaturesFactory()
{
  return self;
}

void sub_25E4C3D74()
{
  if (!qword_26B38CCC0)
  {
    sub_25E4BBAF8();
    unint64_t v0 = sub_25E4DAFA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CCC0);
    }
  }
}

uint64_t sub_25E4C3DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StocksTabiArticleFeatures();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25E4C3E30()
{
  unint64_t result = qword_26B38CBD0;
  if (!qword_26B38CBD0)
  {
    sub_25E4BE78C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38CBD0);
  }
  return result;
}

uint64_t sub_25E4C3E88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StocksTabiArticleFeatures();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25E4C3EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a2;
  uint64_t v4 = sub_25E4DA9A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_25E4DA1D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v33 = &v25[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v25[-v12];
  uint64_t v14 = (int *)type metadata accessor for StocksTabiArticleScoringWork();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = &v25[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(void *)(a1 + 16))
  {
    uint64_t v17 = *(void *)(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_workService);
    uint64_t v30 = v5;
    uint64_t v31 = v17;
    uint64_t v29 = v7;
    uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16);
    v18(v13, v32, v8);
    uint64_t v27 = (void (*)(unsigned char *, unsigned char *, uint64_t))v18;
    int v26 = *(unsigned __int8 *)(v2
                             + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_isSubscribed);
    uint64_t v19 = sub_25E4C44C8(a1);
    uint64_t v32 = v4;
    uint64_t v20 = v19;
    sub_25E4BB488(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_articleFeaturesFactory, (uint64_t)v36);
    sub_25E4BB488(v2 + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_userEmbeddingProvider, (uint64_t)v35);
    uint64_t v28 = *(void *)(v2
                    + OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_paidAccessChecker);
    v18(v16, (uint64_t)v13, v8);
    v16[v14[5]] = v26;
    uint64_t v34 = v20;
    sub_25E4CC7C8(0, &qword_26B38CBB8, &qword_26B38C530, (uint64_t)&protocol descriptor for StocksTabiArticleDataType, MEMORY[0x263F8D488]);
    sub_25E4BB7FC();
    swift_unknownObjectRetain();
    uint64_t v21 = sub_25E4DAD60();
    swift_bridgeObjectRelease();
    *(void *)&v16[v14[6]] = v21;
    v27(v33, v13, v8);
    unint64_t v22 = v29;
    sub_25E4DA990();
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v13, v8);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v30 + 32))(&v16[v14[10]], v22, v32);
    sub_25E4BB880(v36, (uint64_t)&v16[v14[7]]);
    sub_25E4BB880(v35, (uint64_t)&v16[v14[8]]);
    *(void *)&v16[v14[9]] = v28;
    sub_25E4CC830(0, &qword_26B38CB90, MEMORY[0x263F8D538], MEMORY[0x263F8D060]);
    sub_25E4CCC3C((unint64_t *)&qword_26B38C600, (void (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork);
    sub_25E4DAAD0();
    sub_25E4CC948((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for StocksTabiArticleScoringWork);
    return v37;
  }
  else
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    return sub_25E4BB158(v23);
  }
}

uint64_t sub_25E4C44C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StocksTabiArticleData(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_25E4C8CB8(0, v6, 0);
    uint64_t v7 = v17;
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v9 = *(void *)(v3 + 72);
    do
    {
      sub_25E4CC8E4(v8, (uint64_t)v5);
      uint64_t v17 = v7;
      unint64_t v11 = *(void *)(v7 + 16);
      unint64_t v10 = *(void *)(v7 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_25E4C8CB8((void *)(v10 > 1), v11 + 1, 1);
        uint64_t v7 = v17;
      }
      uint64_t v15 = v2;
      uint64_t v16 = &off_26B38C4C8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
      sub_25E4CC8E4((uint64_t)v5, (uint64_t)boxed_opaque_existential_1);
      *(void *)(v7 + 16) = v11 + 1;
      sub_25E4BB880(&v14, v7 + 40 * v11 + 32);
      sub_25E4CC948((uint64_t)v5, type metadata accessor for StocksTabiArticleData);
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_25E4C4670(uint64_t a1)
{
  uint64_t v2 = sub_25E4DA2B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_25E4C8D90(0, v6, 0);
    uint64_t v7 = v22;
    unint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v18 = *(void *)(v8 + 56);
    do
    {
      v9(v5, v11, v2);
      uint64_t v22 = v7;
      unint64_t v13 = *(void *)(v7 + 16);
      unint64_t v12 = *(void *)(v7 + 24);
      if (v13 >= v12 >> 1) {
        sub_25E4C8D90((void *)(v12 > 1), v13 + 1, 1);
      }
      uint64_t v20 = v2;
      uint64_t v21 = MEMORY[0x263F7AA00];
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
      v9((char *)boxed_opaque_existential_1, (uint64_t)v5, v2);
      uint64_t v15 = v22;
      *(void *)(v22 + 16) = v13 + 1;
      sub_25E4BB880(&v19, v15 + 40 * v13 + 32);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      uint64_t v7 = v22;
      v11 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t NewsHeadlineScorerFactory.stockEntityService.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + 16, a1);
}

uint64_t NewsHeadlineScorerFactory.watchlistManager.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + 56, a1);
}

uint64_t NewsHeadlineScorerFactory.appConfigurationManager.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + 96, a1);
}

uint64_t NewsHeadlineScorerFactory.newsPersonalizationScorer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + 136, a1);
}

void *NewsHeadlineScorerFactory.tabiScorer.getter()
{
  uint64_t v1 = *(void **)(v0 + 176);
  id v2 = v1;
  return v1;
}

uint64_t NewsHeadlineScorerFactory.__allocating_init(stockEntityService:watchlistManager:appConfigurationManager:newsPersonalizationScorer:tabiScorer:)(long long *a1, long long *a2, long long *a3, long long *a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  sub_25E4BB880(a1, v10 + 16);
  sub_25E4BB880(a2, v10 + 56);
  sub_25E4BB880(a3, v10 + 96);
  sub_25E4BB880(a4, v10 + 136);
  *(void *)(v10 + 176) = a5;
  return v10;
}

uint64_t NewsHeadlineScorerFactory.init(stockEntityService:watchlistManager:appConfigurationManager:newsPersonalizationScorer:tabiScorer:)(long long *a1, long long *a2, long long *a3, long long *a4, uint64_t a5)
{
  sub_25E4BB880(a1, v5 + 16);
  sub_25E4BB880(a2, v5 + 56);
  sub_25E4BB880(a3, v5 + 96);
  sub_25E4BB880(a4, v5 + 136);
  *(void *)(v5 + 176) = a5;
  return v5;
}

uint64_t NewsHeadlineScorerFactory.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);

  return v0;
}

uint64_t NewsHeadlineScorerFactory.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);

  return swift_deallocClassInstance();
}

uint64_t NewsHeadlineScorerFactory.fetchHeadlineScorer()()
{
  sub_25E4CB6C0(0, &qword_26B38CE60, MEMORY[0x263F7AF08], MEMORY[0x263F8D488]);
  sub_25E4DA870();
  swift_retain();
  uint64_t v0 = (void *)sub_25E4DA800();
  sub_25E4C4EB4();
  sub_25E4DA830();
  swift_release();
  swift_release();

  swift_retain();
  uint64_t v1 = (void *)sub_25E4DA800();
  sub_25E4BB9B4(0, &qword_26B38CEC0);
  uint64_t v2 = sub_25E4DA830();
  swift_release();
  swift_release();

  return v2;
}

uint64_t sub_25E4C4BC0()
{
  return sub_25E4CC66C();
}

uint64_t sub_25E4C4BD8(uint64_t *a1, uint64_t a2)
{
  uint64_t v35 = sub_25E4DA610();
  uint64_t v5 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  sub_25E4BB488(a2 + 16, (uint64_t)v36);
  uint64_t v9 = v37;
  uint64_t v10 = v38;
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(v36, v37);
  int64_t v12 = *(void *)(v8 + 16);
  if (v12)
  {
    v28[1] = v11;
    v28[2] = v10;
    v28[3] = v9;
    uint64_t v30 = v2;
    uint64_t v39 = MEMORY[0x263F8EE78];
    sub_25E4C8C28(0, v12, 0);
    long long v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v13 = v5 + 16;
    uint64_t v15 = *(unsigned __int8 *)(v13 + 64);
    uint64_t v29 = v8;
    uint64_t v16 = v8 + ((v15 + 32) & ~v15);
    uint64_t v32 = *(void *)(v13 + 56);
    unint64_t v33 = v14;
    uint64_t v31 = (void (**)(char *, uint64_t))(v13 - 8);
    uint64_t v34 = v13;
    do
    {
      uint64_t v17 = v35;
      v33(v7, v16, v35);
      uint64_t v18 = sub_25E4DA600();
      uint64_t v20 = v19;
      (*v31)(v7, v17);
      uint64_t v21 = v39;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25E4C8C28(0, *(void *)(v21 + 16) + 1, 1);
        uint64_t v21 = v39;
      }
      unint64_t v23 = *(void *)(v21 + 16);
      unint64_t v22 = *(void *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_25E4C8C28((char *)(v22 > 1), v23 + 1, 1);
        uint64_t v21 = v39;
      }
      *(void *)(v21 + 16) = v23 + 1;
      uint64_t v24 = v21 + 16 * v23;
      *(void *)(v24 + 32) = v18;
      *(void *)(v24 + 40) = v20;
      v16 += v32;
      --v12;
    }
    while (v12);
    uint64_t v8 = v29;
  }
  sub_25E4DA570();
  swift_bridgeObjectRelease();
  *(void *)(swift_allocObject() + 16) = v8;
  swift_bridgeObjectRetain();
  uint64_t v25 = (void *)sub_25E4DA800();
  sub_25E4C4EB4();
  uint64_t v26 = sub_25E4DA840();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return v26;
}

uint64_t sub_25E4C4E98(uint64_t *a1)
{
  return sub_25E4C4BD8(a1, v1);
}

void sub_25E4C4EB4()
{
  if (!qword_26B38D118)
  {
    sub_25E4CB6C0(255, &qword_26B38CE60, MEMORY[0x263F7AF08], MEMORY[0x263F8D488]);
    sub_25E4DA3E0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B38D118);
    }
  }
}

uint64_t sub_25E4C4F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_25E4C4EB4();
  uint64_t v7 = (char *)a3 + *(int *)(v6 + 48);
  *a3 = a2;
  uint64_t v8 = sub_25E4DA3E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, a1, v8);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E4C4FEC(uint64_t *a1, uint64_t a2)
{
  uint64_t v43 = a2;
  uint64_t v47 = sub_25E4DA350();
  uint64_t v45 = *(void *)(v47 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v47);
  uint64_t v44 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v42 = (char *)&v38 - v5;
  uint64_t v6 = sub_25E4DA3E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int64_t v51 = (char *)&v38 - v10;
  sub_25E4C4EB4();
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  long long v14 = (uint64_t *)((char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(int *)(v12 + 56);
  uint64_t v16 = (char *)v14 + v15;
  uint64_t v17 = (char *)a1 + v15;
  uint64_t v18 = *a1;
  uint64_t *v14 = *a1;
  uint64_t v41 = v18;
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v39((char *)v14 + v15, (char *)a1 + v15, v6);
  uint64_t v48 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v19 = v48;
  uint64_t v49 = v7 + 8;
  swift_bridgeObjectRetain();
  v19(v16, v6);
  uint64_t v20 = (char *)v14 + *(int *)(v12 + 56);
  uint64_t v21 = v6;
  uint64_t v46 = v6;
  uint64_t v22 = v6;
  unint64_t v23 = v39;
  v39(v20, v17, v22);
  uint64_t v24 = v51;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v51, v20, v21);
  uint64_t v25 = v43;
  __swift_project_boxed_opaque_existential_1((void *)(v43 + 96), *(void *)(v43 + 120));
  uint64_t v26 = v42;
  sub_25E4DA5B0();
  uint64_t v27 = (uint64_t)v40;
  v23(v40, v24, v21);
  uint64_t v28 = (uint64_t)v44;
  uint64_t v29 = v45;
  uint64_t v30 = v47;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v44, v26, v47);
  sub_25E4BB488(v25 + 136, (uint64_t)v50);
  uint64_t v31 = *(void **)(v25 + 176);
  type metadata accessor for NewsHeadlineScorer(0);
  uint64_t v32 = swift_allocObject();
  id v33 = v31;
  NewsHeadlineScorer.init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(v41, v27, v28, v50, (uint64_t)v31);
  sub_25E4DA870();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_25E4CCB3C;
  *(void *)(v34 + 24) = v32;
  swift_retain();
  uint64_t v35 = (void *)sub_25E4DA800();
  sub_25E4BB9B4(0, &qword_26B38CEC0);
  uint64_t v36 = sub_25E4DA840();
  swift_release();
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v30);
  v48(v51, v46);
  return v36;
}

uint64_t sub_25E4C542C(uint64_t *a1)
{
  return sub_25E4C4FEC(a1, v1);
}

uint64_t NewsHeadlineScorer.__allocating_init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  NewsHeadlineScorer.init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t NewsHeadlineScorer.prepareForUse()()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(void *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  return sub_25E4DA580();
}

uint64_t sub_25E4C5504()
{
  sub_25E4CB6C0(0, &qword_26B38CE60, MEMORY[0x263F7AF08], MEMORY[0x263F8D488]);
  sub_25E4DA870();
  swift_retain();
  uint64_t v0 = (void *)sub_25E4DA800();
  sub_25E4C4EB4();
  sub_25E4DA830();
  swift_release();
  swift_release();

  swift_retain();
  uint64_t v1 = (void *)sub_25E4DA800();
  sub_25E4BB9B4(0, &qword_26B38CEC0);
  uint64_t v2 = sub_25E4DA830();
  swift_release();
  swift_release();

  return v2;
}

uint64_t NewsHeadlineScorer.stockEntities.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4C5688(&OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities, MEMORY[0x263F7AAD0], a1);
}

uint64_t NewsHeadlineScorer.appConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4C5688(&OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration, MEMORY[0x263F7AAA0], a1);
}

uint64_t sub_25E4C5688@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  return v7(a3, v5, v6);
}

uint64_t NewsHeadlineScorer.subscribedStockEntities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NewsHeadlineScorer.articleScorer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer, a1);
}

uint64_t NewsHeadlineScorer.newsPersonalizationScorer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer, a1);
}

void *NewsHeadlineScorer.tabiScorer.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_tabiScorer);
  id v2 = v1;
  return v1;
}

uint64_t NewsHeadlineScorer.init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = sub_25E4DA1A0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities;
  uint64_t v12 = sub_25E4DA3E0();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a2, v12);
  uint64_t v14 = v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration;
  uint64_t v15 = sub_25E4DA350();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, a3, v15);
  uint64_t v22 = a2;
  uint64_t v17 = sub_25E4C5A68((void (*)(uint64_t *__return_ptr, uint64_t))sub_25E4C5A04, (uint64_t)v21, a1);
  swift_bridgeObjectRelease();
  *(void *)(v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_subscribedStockEntities) = v17;
  v23[3] = sub_25E4DA5F0();
  v23[4] = MEMORY[0x263F7ADF8];
  __swift_allocate_boxed_opaque_existential_1(v23);
  swift_bridgeObjectRetain();
  sub_25E4DA340();
  sub_25E4DA190();
  uint64_t v25 = sub_25E4DA210();
  uint64_t v26 = MEMORY[0x263F7A978];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  sub_25E4DA1F0();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, v12);
  sub_25E4BB880(&v24, v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer);
  sub_25E4BB880(a4, v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer);
  *(void *)(v6 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_tabiScorer) = a5;
  return v6;
}

uint64_t sub_25E4C5A04@<X0>(uint64_t *a1@<X8>)
{
  sub_25E4DA600();
  uint64_t v2 = sub_25E4DA3D0();
  uint64_t v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

char *sub_25E4C5A68(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  void (*v18)(uint64_t *__return_ptr, uint64_t);

  uint64_t v18 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v6 = *(void *)(sub_25E4DA610() - 8);
  uint64_t v7 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v15 = *(void *)(v6 + 72);
  swift_bridgeObjectRetain();
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  do
  {
    v18(&v16, v7);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    uint64_t v10 = v17;
    if (v17)
    {
      uint64_t v11 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_25E4D0388(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v13 = *((void *)v8 + 2);
      unint64_t v12 = *((void *)v8 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v8 = sub_25E4D0388((char *)(v12 > 1), v13 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v13 + 1;
      uint64_t v9 = &v8[16 * v13];
      *((void *)v9 + 4) = v11;
      *((void *)v9 + 5) = v10;
    }
    v7 += v15;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t NewsHeadlineScorer.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities;
  uint64_t v2 = sub_25E4DA3E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration;
  uint64_t v4 = sub_25E4DA350();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer);

  return v0;
}

uint64_t NewsHeadlineScorer.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_stockEntities;
  uint64_t v2 = sub_25E4DA3E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_appConfiguration;
  uint64_t v4 = sub_25E4DA350();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer);

  return swift_deallocClassInstance();
}

uint64_t NewsHeadlineScorer.scoreHeadlines(_:origin:)(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E4DA1E0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v58 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_25E4DA550();
  uint64_t v59 = *(void *)(v67 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v67);
  int64_t v66 = (char *)v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)v54 - v10;
  uint64_t v61 = type metadata accessor for ScorableHeadline(0);
  MEMORY[0x270FA5388](v61);
  uint64_t v60 = (id *)((char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v63 = (void (**)(char *, char *, uint64_t))sub_25E4DA1D0();
  uint64_t v12 = (uint64_t)*(v63 - 1);
  MEMORY[0x270FA5388](v63);
  uint64_t v14 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void (*)(char *, unint64_t, uint64_t))sub_25E4C6510(a2);
  uint64_t v17 = v16;
  __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(void *)(v3 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  uint64_t v18 = sub_25E4DA590();
  swift_bridgeObjectRetain();
  uint64_t v64 = v15;
  unint64_t v65 = a1;
  size_t v19 = sub_25E4CA594(a1, (uint64_t)v15, v17);
  swift_bridgeObjectRelease();
  uint64_t v62 = v3;
  uint64_t v20 = *(void **)(v3 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_tabiScorer);
  if (v20)
  {
    id v21 = v20;
    sub_25E4DA1C0();
    unint64_t v22 = sub_25E4C3EE4(v19, (uint64_t)v14);

    (*(void (**)(char *, void (**)(char *, char *, uint64_t)))(v12 + 8))(v14, v63);
  }
  else
  {
    unint64_t v22 = sub_25E4BB158(MEMORY[0x263F8EE78]);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25E4CA7B4(v65, v64, v17, v18, v22);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  __swift_project_boxed_opaque_existential_1((void *)(v62 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer), *(void *)(v62 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_articleScorer + 24));
  sub_25E4CCC3C((unint64_t *)&unk_26B38CF68, (void (*)(uint64_t))type metadata accessor for ScorableHeadline);
  uint64_t v23 = sub_25E4DA3F0();
  swift_bridgeObjectRelease();
  long long v24 = *(void (**)(char *, unint64_t, uint64_t))(v23 + 16);
  uint64_t v25 = v60;
  if (!v24)
  {
    uint64_t v28 = (void *)MEMORY[0x263F8EE80];
LABEL_21:
    swift_bridgeObjectRelease();
    return (uint64_t)v28;
  }
  sub_25E4CA9EC();
  uint64_t v56 = v26;
  unint64_t v27 = v23
      + ((*(unsigned __int8 *)(*(void *)(v26 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v26 - 8) + 80));
  uint64_t v55 = *(void *)(*(void *)(v26 - 8) + 72);
  uint64_t v63 = (void (**)(char *, char *, uint64_t))(v59 + 32);
  v54[0] = v23;
  v54[1] = v59 + 40;
  swift_bridgeObjectRetain();
  uint64_t v28 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v64 = v24;
    sub_25E4DA230();
    id v29 = objc_msgSend(*v25, sel_identifier);
    unint64_t v65 = sub_25E4DAC80();
    uint64_t v31 = v30;

    uint64_t v32 = v62;
    swift_retain();
    uint64_t v33 = swift_bridgeObjectRetain();
    sub_25E4CB2AC(v33, v32);
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v34 = v27;
    uint64_t v35 = v65;
    sub_25E4DA220();
    id v36 = *(id *)((char *)v25 + *(int *)(v61 + 60));
    uint64_t v37 = v57;
    sub_25E4DA4A0();
    uint64_t v38 = *v63;
    (*v63)(v66, v37, v67);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int64_t v68 = v28;
    unint64_t v41 = sub_25E4C8A04(v35, v31);
    uint64_t v42 = v28[2];
    BOOL v43 = (v40 & 1) == 0;
    uint64_t v44 = v42 + v43;
    if (__OFADD__(v42, v43)) {
      break;
    }
    char v45 = v40;
    if (v28[3] >= v44)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v48 = v68;
        if (v40) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_25E4CA108();
        uint64_t v48 = v68;
        if (v45) {
          goto LABEL_6;
        }
      }
    }
    else
    {
      sub_25E4C97B0(v44, isUniquelyReferenced_nonNull_native);
      unint64_t v46 = sub_25E4C8A04(v35, v31);
      if ((v45 & 1) != (v47 & 1)) {
        goto LABEL_24;
      }
      unint64_t v41 = v46;
      uint64_t v48 = v68;
      if (v45)
      {
LABEL_6:
        (*(void (**)(unint64_t, char *, uint64_t))(v59 + 40))(v48[7] + *(void *)(v59 + 72) * v41, v66, v67);
        goto LABEL_7;
      }
    }
    v48[(v41 >> 6) + 8] |= 1 << v41;
    uint64_t v49 = (uint64_t *)(v48[6] + 16 * v41);
    uint64_t *v49 = v35;
    v49[1] = v31;
    v38((char *)(v48[7] + *(void *)(v59 + 72) * v41), v66, v67);
    uint64_t v50 = v48[2];
    BOOL v51 = __OFADD__(v50, 1);
    uint64_t v52 = v50 + 1;
    if (v51) {
      goto LABEL_23;
    }
    v48[2] = v52;
    swift_bridgeObjectRetain();
LABEL_7:
    uint64_t v28 = v68;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = v60;
    sub_25E4CC948((uint64_t)v60, type metadata accessor for ScorableHeadline);
    unint64_t v27 = v34 + v55;
    long long v24 = (void (*)(char *, unint64_t, uint64_t))((char *)v64 - 1);
    if (v64 == (void (*)(char *, unint64_t, uint64_t))1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25E4DAFD0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ScorableHeadline(uint64_t a1)
{
  return sub_25E4CC8AC(a1, qword_26B38CF78);
}

uint64_t sub_25E4C6510(uint64_t a1)
{
  uint64_t v2 = sub_25E4DA610();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E4DA250();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x263F7A9F8])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    sub_25E4DA600();
    uint64_t v11 = sub_25E4DA3D0();
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    if (!v13) {
      uint64_t v11 = 0;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    if (v10 != *MEMORY[0x263F7A9E8] && v10 != *MEMORY[0x263F7A9F0])
    {
      uint64_t result = sub_25E4DAFB0();
      __break(1u);
      return result;
    }
    return 0;
  }
  return v11;
}

uint64_t sub_25E4C6768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v18 = a1;
  uint64_t v17 = sub_25E4DA3C0();
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25E4DA320();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25E4C8290((uint64_t)v13);
  sub_25E4DAE00();
  uint64_t v14 = sub_25E4DA3B0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  *(void *)a3 = v18;
  *((void *)a3 + 1) = a2;
  uint64_t v15 = (int *)type metadata accessor for StocksTabiArticleData(0);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&a3[v15[5]], v13, v10);
  *(void *)&a3[v15[6]] = v14;
  *(void *)&a3[v15[7]] = v4;
  return swift_unknownObjectRetain();
}

void sub_25E4C6940(void **a1@<X0>, void (*a2)(char *, unint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v9 = *a1;
  swift_getObjectType();
  id v10 = objc_msgSend(v9, sel_articleID);
  uint64_t v11 = sub_25E4DAC80();
  uint64_t v13 = v12;

  id v14 = objc_msgSend(v9, sel_articleID);
  uint64_t v15 = sub_25E4DAC80();
  uint64_t v17 = v16;

  if (*(void *)(a4 + 16) && (unint64_t v18 = sub_25E4C8A04(v15, v17), (v19 & 1) != 0))
  {
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v18);
    id v21 = v20;
  }
  else
  {
    uint64_t v20 = 0;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(a5 + 16) && (unint64_t v22 = sub_25E4C8A04(v11, v13), (v23 & 1) != 0))
  {
    int v24 = 0;
    double v25 = *(double *)(*(void *)(a5 + 56) + 8 * v22);
  }
  else
  {
    double v25 = 0.0;
    int v24 = 1;
  }
  swift_bridgeObjectRelease();
  FCHeadlineProviding.scorable(withOrigin:newsScoreProfile:tabiScore:)(a2, a3, v20, v25, v24, a6);
}

uint64_t FCHeadlineProviding.scorable(withOrigin:newsScoreProfile:tabiScore:)@<X0>(void (*a1)(char *, unint64_t, uint64_t)@<X0>, uint64_t a2@<X1>, void *a3@<X2>, double a4@<X3>, int a5@<W4>, void *a6@<X8>)
{
  uint64_t v7 = v6;
  int v97 = a5;
  double v96 = a4;
  uint64_t v98 = a3;
  uint64_t v102 = a1;
  uint64_t v103 = a2;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_25E4CB6C0(0, &qword_26B38CE68, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v77 - v11;
  uint64_t v95 = sub_25E4DA1A0();
  uint64_t v94 = *(void *)(v95 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v95);
  uint64_t v80 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v93 = (char *)v77 - v15;
  uint64_t v104 = sub_25E4DA390();
  uint64_t v99 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v17 = (char *)v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4CB6C0(0, (unint64_t *)&unk_26B38CEA0, MEMORY[0x263F7AAC0], v9);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  id v21 = (char *)v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  int64_t v81 = (char *)v77 - v23;
  MEMORY[0x270FA5388](v22);
  double v25 = (char *)v77 - v24;
  uint64_t v91 = sub_25E4DA3C0();
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  unint64_t v27 = (char *)v77 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_25E4DA320();
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  id v29 = (char *)v77 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4C8290((uint64_t)v29);
  sub_25E4DAE00();
  uint64_t v100 = v25;
  sub_25E4DA3A0();
  uint64_t v107 = sub_25E4DA310();
  uint64_t v108 = MEMORY[0x263F7AA08];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v106);
  sub_25E4DA270();
  uint64_t v86 = v29;
  uint64_t v30 = sub_25E4DA2C0();
  uint64_t v85 = sub_25E4C4670(v30);
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v6, sel_sourceChannelID);
  uint64_t v92 = v12;
  int64_t v82 = v21;
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v84 = sub_25E4DAC80();
    unint64_t v83 = v33;
  }
  else
  {
    uint64_t v84 = 0;
    unint64_t v83 = 0xE000000000000000;
  }
  uint64_t v89 = v27;
  uint64_t v34 = sub_25E4DA3B0();
  int64_t v35 = *(void *)(v34 + 16);
  uint64_t v36 = v99;
  if (v35)
  {
    uint64_t v78 = a6;
    uint64_t v79 = v6;
    uint64_t v105 = MEMORY[0x263F8EE78];
    sub_25E4C8C28(0, v35, 0);
    uint64_t v38 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
    uint64_t v37 = v36 + 16;
    uint64_t v102 = v38;
    unint64_t v39 = (*(unsigned __int8 *)(v37 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 64);
    v77[1] = v34;
    unint64_t v40 = v34 + v39;
    uint64_t v101 = *(void *)(v37 + 56);
    uint64_t v103 = v37;
    unint64_t v41 = (void (**)(char *, uint64_t))(v37 - 8);
    do
    {
      uint64_t v42 = v104;
      v102(v17, v40, v104);
      uint64_t v43 = sub_25E4DA360();
      uint64_t v45 = v44;
      (*v41)(v17, v42);
      uint64_t v46 = v105;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25E4C8C28(0, *(void *)(v46 + 16) + 1, 1);
        uint64_t v46 = v105;
      }
      unint64_t v48 = *(void *)(v46 + 16);
      unint64_t v47 = *(void *)(v46 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_25E4C8C28((char *)(v47 > 1), v48 + 1, 1);
        uint64_t v46 = v105;
      }
      *(void *)(v46 + 16) = v48 + 1;
      uint64_t v49 = v46 + 16 * v48;
      *(void *)(v49 + 32) = v43;
      *(void *)(v49 + 40) = v45;
      v40 += v101;
      --v35;
    }
    while (v35);
    swift_bridgeObjectRelease();
    uint64_t v7 = v79;
    a6 = v78;
    uint64_t v36 = v99;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v46 = MEMORY[0x263F8EE78];
  }
  uint64_t v50 = (uint64_t)v81;
  objc_msgSend(v7, sel_globalUserFeedback);
  uint64_t v52 = v51;
  sub_25E4CB724((uint64_t)v100, v50);
  int64_t v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
  uint64_t v54 = v104;
  int v55 = v53(v50, 1, v104);
  uint64_t v56 = v95;
  uint64_t v57 = v94;
  if (v55 == 1)
  {
    sub_25E4CCA10(v50, (unint64_t *)&unk_26B38CEA0, MEMORY[0x263F7AAC0]);
    uint64_t v58 = 0;
  }
  else
  {
    sub_25E4DA370();
    uint64_t v58 = v59;
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v50, v54);
  }
  uint64_t v60 = (uint64_t)v82;
  sub_25E4CB724((uint64_t)v100, (uint64_t)v82);
  if (v53(v60, 1, v54) == 1)
  {
    sub_25E4CCA10(v60, (unint64_t *)&unk_26B38CEA0, MEMORY[0x263F7AAC0]);
    uint64_t v61 = 0;
  }
  else
  {
    sub_25E4DA380();
    uint64_t v61 = v62;
    (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v60, v54);
  }
  uint64_t v63 = v93;
  id v64 = objc_msgSend(v7, sel_publishDate);
  if (v64)
  {
    unint64_t v65 = v64;
    int64_t v66 = v80;
    sub_25E4DA180();

    uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
    uint64_t v68 = (uint64_t)v92;
    v67(v92, v66, v56);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v57 + 56))(v68, 0, 1, v56);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v68, 1, v56) != 1)
    {
      v67(v63, (char *)v68, v56);
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v68 = (uint64_t)v92;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v92, 1, 1, v56);
  }
  sub_25E4DA190();
  sub_25E4CCA10(v68, &qword_26B38CE68, MEMORY[0x263F07490]);
LABEL_24:
  id v69 = objc_msgSend(v7, sel_feedHalfLifeMilliseconds);
  sub_25E4CCA10((uint64_t)v100, (unint64_t *)&unk_26B38CEA0, MEMORY[0x263F7AAC0]);
  (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v91);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v88);
  if (v97) {
    double v70 = 0.0;
  }
  else {
    double v70 = v96;
  }
  double v71 = (double)(unint64_t)v69;
  *a6 = v7;
  sub_25E4BB880(&v106, (uint64_t)(a6 + 1));
  uint64_t v72 = v84;
  a6[6] = v85;
  a6[7] = v72;
  a6[8] = v83;
  a6[9] = v46;
  a6[10] = v52;
  a6[11] = v58;
  a6[12] = v61;
  uint64_t v73 = (int *)type metadata accessor for ScorableHeadline(0);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))((char *)a6 + v73[12], v63, v56);
  *(double *)((char *)a6 + v73[13]) = v71;
  *((unsigned char *)a6 + v73[14]) = 0;
  uint64_t v74 = v98;
  *(void *)((char *)a6 + v73[15]) = v98;
  *(double *)((char *)a6 + v73[16]) = v70;
  id v75 = v74;
  return swift_unknownObjectRetain();
}

uint64_t NewsHeadlineScorer.applyImportanceScoreRankPenalty(_:remainingSymbols:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E4DA5F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25E4DA340();
  sub_25E4DA5D0();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  uint64_t v8 = sub_25E4CB7B8(a2);
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_25E4CAA80(a1, v8);
  swift_bridgeObjectRelease_n();
  return v9;
}

uint64_t sub_25E4C757C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v64 = a3;
  uint64_t v68 = a2;
  uint64_t v4 = sub_25E4DA390();
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v52 - v8;
  uint64_t v71 = sub_25E4DA3C0();
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  id v69 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25E4DA550();
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v61 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25E4DA620();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (void *)((char *)v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16);
  v17(v16, a1, v13);
  unsigned int v18 = (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 88))(v16, v13);
  if (v18 != *MEMORY[0x263F7AF48])
  {
    v17(v64, a1, v13);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
  }
  unsigned int v55 = v18;
  (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v16, v13);
  uint64_t v19 = *v16;
  sub_25E4CC6B8();
  uint64_t v57 = v20;
  id v21 = (char *)v16 + *(int *)(v20 + 48);
  uint64_t v22 = v61;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v21, v63);
  sub_25E4DA400();
  double v24 = v23;
  swift_getObjectType();
  double v25 = v69;
  sub_25E4DAE00();
  uint64_t v26 = sub_25E4DA3B0();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v25, v71);
  uint64_t v27 = *(void *)(v26 + 16);
  uint64_t v56 = v14;
  uint64_t v71 = v27;
  if (v27)
  {
    uint64_t v53 = v19;
    uint64_t v54 = v13;
    uint64_t v28 = v67 + 16;
    id v29 = *(void (**)(char *, unint64_t, uint64_t))(v67 + 16);
    unint64_t v30 = v26 + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80));
    id v31 = (void (**)(char *, uint64_t))(v67 + 8);
    uint64_t v70 = *(void *)(v67 + 72);
    v52[1] = v26;
    swift_bridgeObjectRetain();
    uint64_t v32 = 0;
    uint64_t v66 = 0;
    v52[0] = v68 + 9;
    id v69 = (char *)((unint64_t)v31 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
    uint64_t v67 = v28;
    unint64_t v65 = v30;
    while (1)
    {
      v29(v9, v30 + v70 * v32, v4);
      sub_25E4DA370();
      double v35 = v34;
      v29(v7, (unint64_t)v9, v4);
      if (v24 < v35) {
        break;
      }
      unint64_t v33 = *v31;
      (*v31)(v7, v4);
LABEL_5:
      ++v32;
      v33(v9, v4);
      if (v32 == v71)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v13 = v54;
        uint64_t v45 = v61;
        uint64_t v46 = v53;
        uint64_t v47 = v66;
        goto LABEL_32;
      }
    }
    uint64_t v36 = sub_25E4DA360();
    uint64_t v38 = v37;
    uint64_t v39 = v68[2];
    if (v39)
    {
      uint64_t v40 = v36;
      if (v68[4] == v36 && v68[5] == v37 || (sub_25E4DAFC0() & 1) != 0) {
        goto LABEL_11;
      }
      if (v39 != 1)
      {
        if (v68[6] == v40 && v68[7] == v38 || (uint64_t result = sub_25E4DAFC0(), (result & 1) != 0))
        {
LABEL_11:
          swift_bridgeObjectRelease();
          unint64_t v33 = *v31;
          uint64_t result = ((uint64_t (*)(char *, uint64_t))*v31)(v7, v4);
          if (__OFADD__(v66, 1))
          {
            __break(1u);
            goto LABEL_35;
          }
          ++v66;
          goto LABEL_15;
        }
        if (v39 != 2)
        {
          uint64_t v42 = (void *)v52[0];
          uint64_t v43 = 2;
          while (!__OFADD__(v43, 1))
          {
            if (*(v42 - 1) == v40 && *v42 == v38) {
              goto LABEL_11;
            }
            uint64_t v59 = v43;
            uint64_t v60 = v42;
            uint64_t v58 = v43 + 1;
            uint64_t result = sub_25E4DAFC0();
            if (result) {
              goto LABEL_11;
            }
            uint64_t v42 = v60 + 2;
            uint64_t v43 = v59 + 1;
            if (v58 == v39) {
              goto LABEL_14;
            }
          }
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
      }
    }
LABEL_14:
    swift_bridgeObjectRelease();
    unint64_t v33 = *v31;
    (*v31)(v7, v4);
LABEL_15:
    unint64_t v30 = v65;
    goto LABEL_5;
  }
  uint64_t v45 = v22;
  swift_bridgeObjectRelease();
  uint64_t v47 = 0;
  uint64_t v46 = v19;
LABEL_32:
  unint64_t v48 = v64;
  *id v64 = v46;
  swift_unknownObjectRetain();
  uint64_t v71 = sub_25E4DA520();
  sub_25E4DA450();
  sub_25E4DA490();
  sub_25E4DA480();
  sub_25E4DA460();
  uint64_t v70 = sub_25E4DA4F0();
  sub_25E4DA4C0();
  sub_25E4DA440();
  sub_25E4DA200();
  uint64_t v50 = v49;
  sub_25E4DA430();
  sub_25E4DA200();
  id v69 = v51;
  sub_25E4DA420();
  sub_25E4DA200();
  sub_25E4DA470();
  sub_25E4DA4B0();
  sub_25E4DA500();
  uint64_t result = sub_25E4DA410();
  if (__OFADD__(result, v47)) {
    goto LABEL_36;
  }
  sub_25E4DA540();
  uint64_t v68 = v50;
  sub_25E4DA530();
  sub_25E4DA510();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v45, v63);
  return (*(uint64_t (**)(uint64_t *, void, uint64_t))(v56 + 104))(v48, v55, v13);
}

uint64_t NewsHeadlineScorer.applyChannelDiversificationPenalty(_:priorChannelIDs:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E4DA5F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4DA340();
  sub_25E4DA5E0();
  double v9 = v8;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v10 = *(void *)(a2 + 16);
  if (!v10)
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE80];
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25E4CAC38(a1, (uint64_t)v12, v9);
    swift_bridgeObjectRelease_n();
    return v33;
  }
  uint64_t v36 = a1;
  swift_bridgeObjectRetain();
  v35[1] = a2;
  uint64_t v11 = (uint64_t *)(a2 + 40);
  uint64_t v12 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v14 = *(v11 - 1);
    uint64_t v13 = *v11;
    uint64_t v15 = v12[2];
    swift_bridgeObjectRetain_n();
    if (!v15 || (unint64_t v16 = sub_25E4C8A04(v14, v13), (v17 & 1) == 0))
    {
      uint64_t v19 = 1;
      goto LABEL_11;
    }
    uint64_t v18 = *(void *)(v12[7] + 8 * v16);
    uint64_t v19 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
LABEL_11:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v37 = v12;
    unint64_t v22 = sub_25E4C8A04(v14, v13);
    uint64_t v23 = v12[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24)) {
      goto LABEL_25;
    }
    char v26 = v21;
    if (v12[3] >= v25)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v12 = v37;
        if (v21) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_25E4CA3C4();
        uint64_t v12 = v37;
        if (v26) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_25E4C9B94(v25, isUniquelyReferenced_nonNull_native);
      unint64_t v27 = sub_25E4C8A04(v14, v13);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_27;
      }
      unint64_t v22 = v27;
      uint64_t v12 = v37;
      if (v26)
      {
LABEL_3:
        *(void *)(v12[7] + 8 * v22) = v19;
        goto LABEL_4;
      }
    }
    v12[(v22 >> 6) + 8] |= 1 << v22;
    id v29 = (uint64_t *)(v12[6] + 16 * v22);
    uint64_t *v29 = v14;
    v29[1] = v13;
    *(void *)(v12[7] + 8 * v22) = v19;
    uint64_t v30 = v12[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_26;
    }
    v12[2] = v32;
    swift_bridgeObjectRetain();
LABEL_4:
    v11 += 2;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      a1 = v36;
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  uint64_t result = sub_25E4DAFD0();
  __break(1u);
  return result;
}

uint64_t sub_25E4C801C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(void *)(*v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  return sub_25E4DA580();
}

uint64_t sub_25E4C806C(unint64_t a1, uint64_t a2)
{
  return NewsHeadlineScorer.scoreHeadlines(_:origin:)(a1, a2);
}

uint64_t sub_25E4C8090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E4DA5F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25E4DA340();
  sub_25E4DA5D0();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  double v8 = sub_25E4CB7B8(a2);
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_25E4CAA80(a1, v8);
  swift_bridgeObjectRelease_n();
  return v9;
}

uint64_t sub_25E4C81E4(uint64_t a1, uint64_t a2)
{
  return NewsHeadlineScorer.applyChannelDiversificationPenalty(_:priorChannelIDs:)(a1, a2);
}

uint64_t sub_25E4C8208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_25E4DA320();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25E4C8278()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E4C8284()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_25E4C8290@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25E4DA310();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_25E4DACB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  double v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4CB6C0(0, &qword_26B38CE98, MEMORY[0x263F7AA10], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v20 - v10;
  if ((objc_msgSend(v1, sel_respondsToSelector_, sel_stocksFields) & 1) != 0
    && (id v12 = objc_msgSend(v1, sel_stocksFields)) != 0
    && (id v13 = objc_msgSend(v12, sel_stocksScoresJSON),
        swift_unknownObjectRelease(),
        v13))
  {
    v20[0] = a1;
    sub_25E4DAC80();

    sub_25E4DA050();
    swift_allocObject();
    sub_25E4DA040();
    sub_25E4DACA0();
    uint64_t v14 = sub_25E4DAC90();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v16 >> 60 == 15)
    {
      __break(1u);
    }
    else
    {
      uint64_t v18 = sub_25E4DA320();
      sub_25E4CCC3C(&qword_26B38CE90, MEMORY[0x263F7AA10]);
      sub_25E4DA030();
      sub_25E4C0174(v14, v16);
      swift_release();
      uint64_t v19 = *(void *)(v18 - 8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v18);
      return (*(uint64_t (**)(void, char *, uint64_t))(v19 + 32))(v20[0], v11, v18);
    }
  }
  else
  {
    sub_25E4DA2F0();
    sub_25E4DA2F0();
    return sub_25E4DA260();
  }
  return result;
}

uint64_t ScorableHeadline.headline.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t ScorableHeadline.globalCohort.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + 8, a1);
}

uint64_t ScorableHeadline.cohorts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScorableHeadline.sourceChannelID.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScorableHeadline.topics.getter()
{
  return swift_bridgeObjectRetain();
}

double ScorableHeadline.globalScore.getter()
{
  return *(double *)(v0 + 80);
}

double ScorableHeadline.importanceScore.getter()
{
  return *(double *)(v0 + 88);
}

double ScorableHeadline.publisherPrior.getter()
{
  return *(double *)(v0 + 96);
}

uint64_t ScorableHeadline.publishedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ScorableHeadline(0) + 48);
  uint64_t v4 = sub_25E4DA1A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

double ScorableHeadline.halfLife.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 52));
}

uint64_t ScorableHeadline.hasBeenRead.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 56));
}

void *ScorableHeadline.newsScoreProfile.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 60));
  id v2 = v1;
  return v1;
}

double ScorableHeadline.tabiScore.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 64));
}

double ScorableHeadline.newsPersonalizationScore.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for ScorableHeadline(0) + 60));
  if (!v1) {
    return 0.0;
  }
  objc_msgSend(v1, sel_personalizationScore);
  return result;
}

uint64_t sub_25E4C8894@<X0>(uint64_t a1@<X8>)
{
  return sub_25E4BB488(v1 + 8, a1);
}

uint64_t sub_25E4C88B4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E4C88BC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25E4C88EC()
{
  return swift_bridgeObjectRetain();
}

double sub_25E4C88F4(uint64_t a1)
{
  id v2 = *(void **)(v1 + *(int *)(a1 + 60));
  if (!v2) {
    return 0.0;
  }
  objc_msgSend(v2, sel_personalizationScore);
  return result;
}

double sub_25E4C8914()
{
  return *(double *)(v0 + 80);
}

double sub_25E4C891C(uint64_t a1)
{
  return *(double *)(v1 + *(int *)(a1 + 64));
}

double sub_25E4C8928()
{
  return *(double *)(v0 + 88);
}

double sub_25E4C8930()
{
  return *(double *)(v0 + 96);
}

uint64_t sub_25E4C8938@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 48);
  uint64_t v5 = sub_25E4DA1A0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

double sub_25E4C89A8(uint64_t a1)
{
  return *(double *)(v1 + *(int *)(a1 + 52));
}

uint64_t sub_25E4C89B4(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 56));
}

unint64_t sub_25E4C89C0(uint64_t a1)
{
  uint64_t v2 = sub_25E4DAE70();
  return sub_25E4C8A7C(a1, v2);
}

unint64_t sub_25E4C8A04(uint64_t a1, uint64_t a2)
{
  sub_25E4DB020();
  sub_25E4DACD0();
  uint64_t v4 = sub_25E4DB040();
  return sub_25E4C8B44(a1, a2, v4);
}

unint64_t sub_25E4C8A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25E4CCCD8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611DA720](v9, a1);
      sub_25E4CCD34((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_25E4C8B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25E4DAFC0() & 1) == 0)
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
      while (!v14 && (sub_25E4DAFC0() & 1) == 0);
    }
  }
  return v6;
}

char *sub_25E4C8C28(char *a1, int64_t a2, char a3)
{
  double result = sub_25E4C8EB8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25E4C8C48(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C9238(a1, a2, a3, (void *)*v3, &qword_26B38CCA8, MEMORY[0x263F59F00], MEMORY[0x263F59F00]);
  *uint64_t v3 = result;
  return result;
}

char *sub_25E4C8C98(char *a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C8FC8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_25E4C8CB8(void *a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C90D0(a1, a2, a3, *v3, &qword_26B38CCB0, &qword_26B38C530, (uint64_t)&protocol descriptor for StocksTabiArticleDataType);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25E4C8CF0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C9238(a1, a2, a3, (void *)*v3, &qword_26B38D158, type metadata accessor for ScorableHeadline, type metadata accessor for ScorableHeadline);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25E4C8D40(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C9238(a1, a2, a3, (void *)*v3, &qword_26B38D150, type metadata accessor for StocksTabiArticleData, type metadata accessor for StocksTabiArticleData);
  *uint64_t v3 = result;
  return result;
}

void *sub_25E4C8D90(void *a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C90D0(a1, a2, a3, *v3, &qword_26B38D138, (unint64_t *)&unk_26B38CE70, MEMORY[0x263F7A970]);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25E4C8DC8(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C9238(a1, a2, a3, (void *)*v3, &qword_26B38CC98, MEMORY[0x263F7AF50], MEMORY[0x263F7AF50]);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25E4C8E18(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C9238(a1, a2, a3, (void *)*v3, &qword_26B38CCB8, (uint64_t (*)(uint64_t))type metadata accessor for StocksTabiArticleFeatures, (uint64_t (*)(void))type metadata accessor for StocksTabiArticleFeatures);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25E4C8E68(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E4C9238(a1, a2, a3, (void *)*v3, &qword_26B38CC90, MEMORY[0x263F06EA8], MEMORY[0x263F06EA8]);
  *uint64_t v3 = result;
  return result;
}

char *sub_25E4C8EB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_25E4CC780(0, (unint64_t *)&qword_26B38D160);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_25E4C8FC8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_25E4CC780(0, (unint64_t *)&unk_26B38CCD0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

void *sub_25E4C90D0(void *result, int64_t a2, char a3, void *a4, unint64_t *a5, unint64_t *a6, uint64_t a7)
{
  char v9 = (char)result;
  if (a3)
  {
    unint64_t v10 = a4[3];
    int64_t v11 = v10 >> 1;
    if ((uint64_t)(v10 >> 1) < a2)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v11 = a2;
      }
    }
  }
  else
  {
    int64_t v11 = a2;
  }
  uint64_t v12 = a4[2];
  if (v11 <= v12) {
    uint64_t v13 = a4[2];
  }
  else {
    uint64_t v13 = v11;
  }
  if (v13)
  {
    sub_25E4CC7C8(0, a5, a6, a7, MEMORY[0x263F8E0F8]);
    BOOL v14 = (void *)swift_allocObject();
    size_t v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v12;
    void v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
  }
  else
  {
    BOOL v14 = (void *)MEMORY[0x263F8EE78];
  }
  if (v9)
  {
    if (v14 != a4 || v14 + 4 >= &a4[5 * v12 + 4]) {
      memmove(v14 + 4, a4 + 4, 40 * v12);
    }
    a4[2] = 0;
  }
  else
  {
    sub_25E4BB9B4(0, a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v14;
}

size_t sub_25E4C9238(size_t result, int64_t a2, char a3, void *a4, unint64_t *a5, uint64_t (*a6)(uint64_t), uint64_t (*a7)(void))
{
  char v9 = result;
  if (a3)
  {
    unint64_t v10 = a4[3];
    int64_t v11 = v10 >> 1;
    if ((uint64_t)(v10 >> 1) < a2)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v11 = a2;
      }
    }
  }
  else
  {
    int64_t v11 = a2;
  }
  uint64_t v12 = a4[2];
  if (v11 <= v12) {
    uint64_t v13 = a4[2];
  }
  else {
    uint64_t v13 = v11;
  }
  if (!v13)
  {
    char v17 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_25E4CB6C0(0, a5, a6, MEMORY[0x263F8E0F8]);
  uint64_t v14 = *(void *)(a7(0) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  char v17 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v17);
  if (!v15)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v16 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_29;
  }
  v17[2] = v12;
  v17[3] = 2 * ((uint64_t)(result - v16) / v15);
LABEL_19:
  uint64_t v19 = *(void *)(a7(0) - 8);
  if (v9)
  {
    if (v17 < a4
      || (unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80),
          (char *)v17 + v20 >= (char *)a4 + v20 + *(void *)(v19 + 72) * v12))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v17 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v17;
}

uint64_t sub_25E4C9430(uint64_t a1, char a2)
{
  return sub_25E4C9490(a1, a2, &qword_26B38CC60, &qword_26B38C520, (uint64_t)&protocol descriptor for StocksEntityMetadataType, (void (*)(uint64_t, unsigned char *))sub_25E4BB880);
}

uint64_t sub_25E4C9460(uint64_t a1, char a2)
{
  return sub_25E4C9490(a1, a2, (unint64_t *)&unk_26B38CC50, &qword_26B38C510, (uint64_t)&protocol descriptor for StocksEntityCohortType, (void (*)(uint64_t, unsigned char *))sub_25E4BB880);
}

uint64_t sub_25E4C9490(uint64_t a1, char a2, unint64_t *a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t, unsigned char *))
{
  uint64_t v8 = v6;
  uint64_t v10 = *v6;
  sub_25E4CC604(0, a3, a4);
  char v42 = a2;
  uint64_t v11 = sub_25E4DAEF0();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_39;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v40 = v6;
  uint64_t v41 = v10 + 64;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & *(void *)(v10 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v17 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  while (1)
  {
    if (v15)
    {
      unint64_t v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v23 = v22 | (v19 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v19++, 1)) {
      goto LABEL_41;
    }
    if (v19 >= v16) {
      break;
    }
    uint64_t v25 = (void *)(v10 + 64);
    unint64_t v26 = *(void *)(v41 + 8 * v19);
    if (!v26)
    {
      int64_t v27 = v19 + 1;
      if (v19 + 1 >= v16)
      {
LABEL_32:
        swift_release();
        uint64_t v8 = v40;
        if ((v42 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      unint64_t v26 = *(void *)(v41 + 8 * v27);
      if (!v26)
      {
        while (1)
        {
          int64_t v19 = v27 + 1;
          if (__OFADD__(v27, 1)) {
            break;
          }
          if (v19 >= v16) {
            goto LABEL_32;
          }
          unint64_t v26 = *(void *)(v41 + 8 * v19);
          ++v27;
          if (v26) {
            goto LABEL_19;
          }
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v19;
    }
LABEL_19:
    unint64_t v15 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v19 << 6);
LABEL_20:
    char v28 = (uint64_t *)(*(void *)(v10 + 48) + 16 * v23);
    uint64_t v30 = *v28;
    uint64_t v29 = v28[1];
    uint64_t v31 = *(void *)(v10 + 56) + 40 * v23;
    if (v42)
    {
      a6(v31, v43);
    }
    else
    {
      sub_25E4BB488(v31, (uint64_t)v43);
      swift_bridgeObjectRetain();
    }
    sub_25E4DB020();
    sub_25E4DACD0();
    uint64_t result = sub_25E4DB040();
    uint64_t v32 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1 << v33) & ~*(void *)(v17 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v33) & ~*(void *)(v17 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v17 + 8 * v34);
      }
      while (v38 == -1);
      unint64_t v20 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    char v21 = (void *)(*(void *)(v12 + 48) + 16 * v20);
    void *v21 = v30;
    v21[1] = v29;
    uint64_t result = ((uint64_t (*)(unsigned char *, unint64_t))a6)(v43, *(void *)(v12 + 56) + 40 * v20);
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v8 = v40;
  uint64_t v25 = (void *)(v10 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v39 = 1 << *(unsigned char *)(v10 + 32);
  if (v39 >= 64) {
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v39;
  }
  *(void *)(v10 + 16) = 0;
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v8 = v12;
  return result;
}

uint64_t sub_25E4C97B0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_25E4DA550();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  unint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_25E4CC9A8();
  int v47 = a2;
  uint64_t v8 = sub_25E4DAEF0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  char v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    unint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    char v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_25E4DB020();
    sub_25E4DACD0();
    uint64_t result = sub_25E4DB040();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    int64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *int64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_25E4C9B94(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25E4CC830(0, &qword_26B38CC70, MEMORY[0x263F8D6C8], MEMORY[0x263F8DFB0]);
  char v37 = a2;
  uint64_t v6 = sub_25E4DAEF0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25E4DB020();
    sub_25E4DACD0();
    uint64_t result = sub_25E4DB040();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_25E4C9EC0()
{
  return sub_25E4C9F20(&qword_26B38CC60, &qword_26B38C520, (uint64_t)&protocol descriptor for StocksEntityMetadataType, (void (*)(unsigned char *, uint64_t))sub_25E4BB880);
}

void *sub_25E4C9EF0()
{
  return sub_25E4C9F20((unint64_t *)&unk_26B38CC50, &qword_26B38C510, (uint64_t)&protocol descriptor for StocksEntityCohortType, (void (*)(unsigned char *, uint64_t))sub_25E4BB880);
}

void *sub_25E4C9F20(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t))
{
  uint64_t v5 = v4;
  sub_25E4CC604(0, a1, a2);
  uint64_t v6 = *v4;
  uint64_t v7 = sub_25E4DAEE0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_26:
    *uint64_t v5 = v8;
    return result;
  }
  uint64_t v29 = v5;
  uint64_t result = (void *)(v7 + 64);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v6 + 64);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v13++, 1)) {
      goto LABEL_28;
    }
    if (v13 >= v17)
    {
LABEL_24:
      uint64_t result = (void *)swift_release();
      uint64_t v5 = v29;
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v10 + 8 * v13);
    if (!v27) {
      break;
    }
LABEL_23:
    unint64_t v16 = (v27 - 1) & v27;
    unint64_t v19 = __clz(__rbit64(v27)) + (v13 << 6);
LABEL_12:
    uint64_t v20 = 16 * v19;
    int64_t v21 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v19);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = 40 * v19;
    sub_25E4BB488(*(void *)(v6 + 56) + 40 * v19, (uint64_t)v31);
    char v25 = (void *)(*(void *)(v8 + 48) + v20);
    *char v25 = v22;
    v25[1] = v23;
    a4(v31, *(void *)(v8 + 56) + v24);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v13 + 1;
  if (v13 + 1 >= v17) {
    goto LABEL_24;
  }
  unint64_t v27 = *(void *)(v10 + 8 * v28);
  if (v27)
  {
    ++v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v13 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v13 >= v17) {
      goto LABEL_24;
    }
    unint64_t v27 = *(void *)(v10 + 8 * v13);
    ++v28;
    if (v27) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25E4CA108()
{
  uint64_t v36 = sub_25E4DA550();
  uint64_t v1 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4CC9A8();
  uint64_t v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_25E4DAEE0();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v37 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v29 = v37;
    int64_t v28 = v31;
LABEL_28:
    *int64_t v28 = v29;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v37;
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  uint64_t v32 = v4 + 64;
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v34 = v1 + 32;
  uint64_t v35 = v1 + 16;
  uint64_t v15 = v36;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    unint64_t v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v22, v15);
    uint64_t v23 = v37;
    uint64_t v24 = (void *)(*(void *)(v37 + 48) + v18);
    *uint64_t v24 = v20;
    v24[1] = v21;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v3, v15);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    int64_t v28 = v31;
    uint64_t v29 = v37;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    int64_t v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25E4CA3C4()
{
  uint64_t v1 = v0;
  sub_25E4CC830(0, &qword_26B38CC70, MEMORY[0x263F8D6C8], MEMORY[0x263F8DFB0]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E4DAEE0();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

size_t sub_25E4CA594(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v6 = type metadata accessor for StocksTabiArticleData(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  int64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    if (!v10) {
      return v11;
    }
    uint64_t v21 = MEMORY[0x263F8EE78];
    size_t result = sub_25E4C8D40(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0) {
      break;
    }
    uint64_t v13 = 0;
    uint64_t v11 = v21;
    unint64_t v17 = v4;
    unint64_t v18 = a1 & 0xC000000000000001;
    unint64_t v14 = a1;
    while (v10 != v13)
    {
      if (v18) {
        MEMORY[0x2611DA730](v13, a1);
      }
      else {
        swift_unknownObjectRetain();
      }
      swift_getObjectType();
      sub_25E4C6768(v19, v20, v9);
      swift_unknownObjectRelease();
      uint64_t v21 = v11;
      unint64_t v16 = *(void *)(v11 + 16);
      unint64_t v15 = *(void *)(v11 + 24);
      unint64_t v4 = v16 + 1;
      if (v16 >= v15 >> 1)
      {
        sub_25E4C8D40(v15 > 1, v16 + 1, 1);
        uint64_t v11 = v21;
      }
      ++v13;
      *(void *)(v11 + 16) = v4;
      sub_25E4CCA80((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v16, type metadata accessor for StocksTabiArticleData);
      a1 = v14;
      if (v10 == v13) {
        return v11;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25E4DAED0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

size_t sub_25E4CA7B4(unint64_t a1, void (*a2)(char *, unint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v8 = type metadata accessor for ScorableHeadline(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (unint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    if (!v12) {
      return v13;
    }
    uint64_t v25 = MEMORY[0x263F8EE78];
    size_t result = sub_25E4C8CF0(0, v12 & ~(v12 >> 63), 0);
    if (v12 < 0) {
      break;
    }
    uint64_t v15 = 0;
    uint64_t v13 = v25;
    unint64_t v19 = a1 & 0xC000000000000001;
    while (v12 != v15)
    {
      if (v19)
      {
        unint64_t v16 = (void *)MEMORY[0x2611DA730](v15, a1);
      }
      else
      {
        unint64_t v16 = *(void **)(a1 + 8 * v15 + 32);
        swift_unknownObjectRetain();
      }
      unint64_t v24 = v16;
      sub_25E4C6940(&v24, v20, v21, v22, v23, v11);
      if (v6)
      {
        swift_release();
        swift_unknownObjectRelease();
        return v13;
      }
      uint64_t v6 = 0;
      swift_unknownObjectRelease();
      uint64_t v25 = v13;
      unint64_t v18 = *(void *)(v13 + 16);
      unint64_t v17 = *(void *)(v13 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_25E4C8CF0(v17 > 1, v18 + 1, 1);
        uint64_t v13 = v25;
      }
      ++v15;
      *(void *)(v13 + 16) = v18 + 1;
      sub_25E4CCA80((uint64_t)v11, v13+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v18, type metadata accessor for ScorableHeadline);
      if (v12 == v15) {
        return v13;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25E4DAED0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_25E4CA9EC()
{
  if (!qword_26B38CE80)
  {
    type metadata accessor for ScorableHeadline(255);
    sub_25E4CCC3C((unint64_t *)&unk_26B38CF68, (void (*)(uint64_t))type metadata accessor for ScorableHeadline);
    unint64_t v0 = sub_25E4DA240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CE80);
    }
  }
}

uint64_t sub_25E4CAA80(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  unint64_t v17 = a2;
  uint64_t v16 = sub_25E4DA620();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_25E4C8DC8(0, v8, 0);
    uint64_t v9 = v18;
    unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v10 = a1 + v15;
    uint64_t v11 = *(void *)(v5 + 72);
    while (1)
    {
      sub_25E4C757C(v10, v17, v7);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      uint64_t v18 = v9;
      unint64_t v13 = *(void *)(v9 + 16);
      unint64_t v12 = *(void *)(v9 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_25E4C8DC8(v12 > 1, v13 + 1, 1);
        uint64_t v9 = v18;
      }
      *(void *)(v9 + 16) = v13 + 1;
      (*(void (**)(unint64_t, uint64_t *, uint64_t))(v5 + 32))(v9 + v15 + v13 * v11, v7, v16);
      v10 += v11;
      if (!--v8) {
        return v9;
      }
    }
    swift_release();
  }
  return v9;
}

uint64_t sub_25E4CAC38(uint64_t a1, uint64_t a2, double a3)
{
  double v49 = a3;
  uint64_t v63 = a2;
  uint64_t v55 = sub_25E4DA550();
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25E4DA620();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v69 = (void **)((char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v72 = (void **)((char *)v47 - v12);
  int64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (!v13) {
    return v14;
  }
  uint64_t v58 = v7;
  v47[1] = v3;
  uint64_t v73 = MEMORY[0x263F8EE78];
  sub_25E4C8DC8(0, v13, 0);
  uint64_t v14 = v73;
  unint64_t v17 = *(void (**)(void **, uint64_t, uint64_t))(v9 + 16);
  uint64_t v15 = v9 + 16;
  uint64_t v16 = v17;
  unint64_t v67 = (*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64);
  uint64_t v18 = a1 + v67;
  uint64_t v66 = *(void *)(v15 + 56);
  uint64_t v68 = (uint64_t (**)(void **, uint64_t))(v15 + 72);
  uint64_t v61 = (void (**)(void **, uint64_t))(v15 + 80);
  uint64_t v62 = (void (**)(void **, uint64_t))(v15 - 8);
  uint64_t v60 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  unsigned int v70 = *MEMORY[0x263F7AF48];
  uint64_t v56 = (void (**)(char *, uint64_t))(v5 + 8);
  unint64_t v48 = (void (**)(void **, void, uint64_t))(v15 + 88);
  unint64_t v65 = (void (**)(unint64_t, void **, uint64_t))(v15 + 16);
  uint64_t v19 = v55;
  uint64_t v20 = v15;
  uint64_t v21 = v72;
  uint64_t v71 = v17;
  uint64_t v57 = v20;
  uint64_t v59 = v8;
  while (1)
  {
    uint64_t v22 = v69;
    v16(v69, v18, v8);
    int v23 = (*v68)(v22, v8);
    if (v23 != v70)
    {
      v16(v21, v18, v8);
      (*v62)(v22, v8);
      goto LABEL_13;
    }
    (*v61)(v22, v8);
    unint64_t v24 = *v22;
    sub_25E4CC6B8();
    uint64_t v25 = v58;
    (*v60)(v58, (char *)v22 + *(int *)(v26 + 48), v19);
    id v27 = objc_msgSend(v24, sel_sourceChannelID);
    if (!v27)
    {
      swift_unknownObjectRelease();
      (*v56)(v25, v19);
      goto LABEL_12;
    }
    int64_t v28 = v27;
    id v64 = v24;
    uint64_t v29 = v25;
    uint64_t v30 = sub_25E4DAC80();
    uint64_t v32 = v31;

    if (!*(void *)(v63 + 16) || (unint64_t v33 = sub_25E4C8A04(v30, v32), (v34 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      char v42 = v29;
      uint64_t v19 = v55;
      (*v56)(v42, v55);
      swift_unknownObjectRelease();
LABEL_12:
      uint64_t v8 = v59;
      v71(v72, v18, v59);
      goto LABEL_13;
    }
    uint64_t v35 = *(void *)(*(void *)(v63 + 56) + 8 * v33);
    swift_bridgeObjectRelease();
    *uint64_t v72 = v64;
    swift_unknownObjectRetain();
    uint64_t v36 = v29;
    uint64_t v51 = sub_25E4DA520();
    sub_25E4DA450();
    sub_25E4DA490();
    sub_25E4DA480();
    sub_25E4DA460();
    uint64_t v54 = sub_25E4DA4F0();
    sub_25E4DA400();
    sub_25E4DA4C0();
    sub_25E4DA440();
    uint64_t v38 = v37;
    sub_25E4DA430();
    uint64_t v53 = v39;
    sub_25E4DA420();
    sub_25E4DA200();
    uint64_t v52 = sub_25E4DA470();
    sub_25E4DA4B0();
    uint64_t result = sub_25E4DA500();
    BOOL v41 = __OFADD__(result, v35);
    uint64_t v8 = v59;
    if (v41) {
      break;
    }
    sub_25E4DA410();
    sub_25E4DA540();
    uint64_t v50 = v38;
    sub_25E4DA530();
    sub_25E4DA510();
    swift_unknownObjectRelease();
    uint64_t v19 = v55;
    (*v56)(v36, v55);
    (*v48)(v72, v70, v8);
LABEL_13:
    uint64_t v73 = v14;
    unint64_t v44 = *(void *)(v14 + 16);
    unint64_t v43 = *(void *)(v14 + 24);
    if (v44 >= v43 >> 1)
    {
      sub_25E4C8DC8(v43 > 1, v44 + 1, 1);
      uint64_t v19 = v55;
      uint64_t v14 = v73;
    }
    *(void *)(v14 + 16) = v44 + 1;
    uint64_t v45 = v66;
    unint64_t v46 = v14 + v67 + v44 * v66;
    uint64_t v21 = v72;
    (*v65)(v46, v72, v8);
    v18 += v45;
    --v13;
    uint64_t v16 = v71;
    if (!v13) {
      return v14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4CB2AC(uint64_t a1, uint64_t a2)
{
  sub_25E4CB6C0(0, (unint64_t *)&unk_26B38CEB0, MEMORY[0x263F7AB38], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v32 - v6;
  uint64_t v43 = sub_25E4DA4E0();
  uint64_t v8 = MEMORY[0x270FA5388](v43);
  uint64_t v38 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v35 = (char *)v32 - v11;
  uint64_t v42 = *(void *)(a1 + 16);
  if (!v42) {
    return MEMORY[0x263F8EE78];
  }
  v32[0] = a1;
  v32[1] = v2;
  uint64_t v39 = a1 + 32;
  uint64_t v12 = *(void **)(a2 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_subscribedStockEntities);
  BOOL v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v34 = v10;
  uint64_t v36 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  unint64_t v33 = v12 + 7;
  uint64_t v40 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v14 = v12[2];
    if (!v14) {
      goto LABEL_3;
    }
    uint64_t v15 = (uint64_t *)(v39 + 16 * v13);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    if (v12[4] != *v15 || v12[5] != v16)
    {
      uint64_t result = sub_25E4DAFC0();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_12:
    swift_bridgeObjectRetain_n();
    sub_25E4DA4D0();
    uint64_t v20 = v43;
    (*v41)(v7, 0, 1, v43);
    swift_bridgeObjectRelease();
    if ((*v37)(v7, 1, v20) != 1)
    {
      uint64_t v21 = v35;
      uint64_t v22 = *v36;
      uint64_t v23 = v43;
      (*v36)(v35, v7, v43);
      v22(v38, v21, v23);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        unint64_t v24 = v40;
      }
      else {
        unint64_t v24 = (void *)sub_25E4D05A0(0, v40[2] + 1, 1, v40);
      }
      unint64_t v26 = v24[2];
      unint64_t v25 = v24[3];
      if (v26 >= v25 >> 1) {
        unint64_t v24 = (void *)sub_25E4D05A0(v25 > 1, v26 + 1, 1, v24);
      }
      v24[2] = v26 + 1;
      unint64_t v27 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      uint64_t v40 = v24;
      v22((char *)v24 + v27 + *(void *)(v34 + 72) * v26, v38, v43);
      goto LABEL_5;
    }
LABEL_4:
    sub_25E4CCA10((uint64_t)v7, (unint64_t *)&unk_26B38CEB0, MEMORY[0x263F7AB38]);
LABEL_5:
    if (++v13 == v42)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v40;
    }
  }
  if (v14 == 1)
  {
LABEL_3:
    (*v41)(v7, 1, 1, v43);
    goto LABEL_4;
  }
  int64_t v28 = v33;
  uint64_t v29 = 1;
  while (1)
  {
    uint64_t v30 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (*(v28 - 1) == v17 && *v28 == v16) {
      goto LABEL_12;
    }
    uint64_t result = sub_25E4DAFC0();
    if (result) {
      goto LABEL_12;
    }
    v28 += 2;
    ++v29;
    if (v30 == v14) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

void sub_25E4CB6C0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_25E4CB724(uint64_t a1, uint64_t a2)
{
  sub_25E4CB6C0(0, (unint64_t *)&unk_26B38CEA0, MEMORY[0x263F7AAC0], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_25E4CB7B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = swift_bridgeObjectRetain() + 40;
  uint64_t v3 = (char *)MEMORY[0x263F8EE78];
  do
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25E4DA3D0();
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    if (v7)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_25E4D0388(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v9 = *((void *)v3 + 2);
      unint64_t v8 = *((void *)v3 + 3);
      if (v9 >= v8 >> 1) {
        uint64_t v3 = sub_25E4D0388((char *)(v8 > 1), v9 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v9 + 1;
      uint64_t v4 = &v3[16 * v9];
      *((void *)v4 + 4) = v5;
      *((void *)v4 + 5) = v7;
    }
    v2 += 16;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t type metadata accessor for NewsHeadlineScorerFactory()
{
  return self;
}

uint64_t method lookup function for NewsHeadlineScorerFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NewsHeadlineScorerFactory);
}

uint64_t dispatch thunk of NewsHeadlineScorerFactory.__allocating_init(stockEntityService:watchlistManager:appConfigurationManager:newsPersonalizationScorer:tabiScorer:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_25E4CB930()
{
  return type metadata accessor for NewsHeadlineScorer(0);
}

uint64_t type metadata accessor for NewsHeadlineScorer(uint64_t a1)
{
  return sub_25E4CC8AC(a1, qword_26B38D040);
}

uint64_t sub_25E4CB958()
{
  uint64_t result = sub_25E4DA3E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25E4DA350();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for NewsHeadlineScorer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NewsHeadlineScorer);
}

uint64_t dispatch thunk of NewsHeadlineScorer.__allocating_init(stocks:stockEntities:appConfiguration:newsPersonalizationScorer:tabiScorer:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t initializeBufferWithCopyOfBuffer for ScorableHeadline(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    unint64_t v8 = a2 + 1;
    long long v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v9;
    uint64_t v10 = v9;
    uint64_t v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_unknownObjectRetain();
    v11(a1 + 8, v8, v10);
    uint64_t v12 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v12;
    uint64_t v13 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v13;
    long long v14 = *((_OWORD *)a2 + 5);
    *(void *)(a1 + 96) = a2[12];
    uint64_t v15 = a3[12];
    uint64_t v25 = a1 + v15;
    uint64_t v16 = (uint64_t)a2 + v15;
    *(_OWORD *)(a1 + 80) = v14;
    uint64_t v17 = sub_25E4DA1A0();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v25, v16, v17);
    uint64_t v19 = a3[14];
    *(void *)(a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(unsigned char *)(a1 + v19) = *((unsigned char *)a2 + v19);
    uint64_t v20 = a3[15];
    uint64_t v21 = a3[16];
    uint64_t v22 = *(void **)((char *)a2 + v20);
    *(void *)(a1 + v20) = v22;
    *(void *)(a1 + v21) = *(uint64_t *)((char *)a2 + v21);
    id v23 = v22;
  }
  return a1;
}

void destroy for ScorableHeadline(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = sub_25E4DA1A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 60));
}

uint64_t initializeWithCopy for ScorableHeadline(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  long long v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_unknownObjectRetain();
  v9(a1 + 8, v6, v8);
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v11;
  long long v12 = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v13 = a3[12];
  uint64_t v23 = a1 + v13;
  uint64_t v14 = a2 + v13;
  *(_OWORD *)(a1 + 80) = v12;
  uint64_t v15 = sub_25E4DA1A0();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16(v23, v14, v15);
  uint64_t v17 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[15];
  uint64_t v19 = a3[16];
  uint64_t v20 = *(void **)(a2 + v18);
  *(void *)(a1 + v18) = v20;
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  id v21 = v20;
  return a1;
}

void *assignWithCopy for ScorableHeadline(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  uint64_t v6 = a3[12];
  long long v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E4DA1A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  *((unsigned char *)a1 + a3[14]) = *((unsigned char *)a2 + a3[14]);
  uint64_t v10 = a3[15];
  uint64_t v11 = *(void **)((char *)a1 + v10);
  long long v12 = *(void **)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = v12;
  id v13 = v12;

  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for ScorableHeadline(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v7 = a3[12];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v10 = sub_25E4DA1A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

uint64_t assignWithTake for ScorableHeadline(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v8 = a3[12];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_25E4DA1A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[15];
  uint64_t v14 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);

  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScorableHeadline(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4CC3B4);
}

uint64_t sub_25E4CC3B4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25E4DA1A0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 48);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ScorableHeadline(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4CC478);
}

void *sub_25E4CC478(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25E4DA1A0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 48);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25E4CC520()
{
  uint64_t result = sub_25E4DA1A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_25E4CC604(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_25E4BB9B4(255, a3);
    unint64_t v4 = sub_25E4DAF10();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25E4CC66C()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  return sub_25E4DA560();
}

void sub_25E4CC6B8()
{
  if (!qword_26B38CC08)
  {
    sub_25E4CC728();
    sub_25E4DA550();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B38CC08);
    }
  }
}

unint64_t sub_25E4CC728()
{
  unint64_t result = qword_26B38CC00;
  if (!qword_26B38CC00)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B38CC00);
  }
  return result;
}

void sub_25E4CC780(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_25E4DAFA0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_25E4CC7C8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_25E4BB9B4(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_25E4CC830(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, void, uint64_t, void))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, MEMORY[0x263F8D310], a3, MEMORY[0x263F8D320]);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t type metadata accessor for StocksTabiArticleData(uint64_t a1)
{
  return sub_25E4CC8AC(a1, qword_26B38CEC8);
}

uint64_t sub_25E4CC8AC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4CC8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StocksTabiArticleData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4CC948(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_25E4CC9A8()
{
  if (!qword_26B38D128)
  {
    sub_25E4DA550();
    unint64_t v0 = sub_25E4DAF10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38D128);
    }
  }
}

uint64_t sub_25E4CCA10(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_25E4CB6C0(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_25E4CCA80(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E4CCAE8()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer), *(void *)(v0 + OBJC_IVAR____TtC21StocksPersonalization18NewsHeadlineScorer_newsPersonalizationScorer + 24));
  return sub_25E4DA580();
}

uint64_t sub_25E4CCB3C@<X0>(void *a1@<X8>)
{
  a1[3] = *v1;
  a1[4] = sub_25E4CCC3C(&qword_26B38D038, (void (*)(uint64_t))type metadata accessor for NewsHeadlineScorer);
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_25E4CCBD4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E4CCC0C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25E4CCC3C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E4CCC84()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25E4CCCBC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25E4C4F54(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_25E4CCCD8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25E4CCD34(uint64_t a1)
{
  return a1;
}

uint64_t *sub_25E4CCD88(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25E4DA320();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v13) = *(uint64_t *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  return v4;
}

uint64_t sub_25E4CCEA0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25E4DA320();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

void *sub_25E4CCF38(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25E4DA320();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

void *sub_25E4CD000(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E4DA320();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

_OWORD *sub_25E4CD0DC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25E4DA320();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

void *sub_25E4CD17C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25E4DA320();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_25E4CD238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4CD24C);
}

uint64_t sub_25E4CD24C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25E4DA320();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25E4CD2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4CD310);
}

uint64_t sub_25E4CD310(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25E4DA320();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25E4CD3B8()
{
  uint64_t result = sub_25E4DA320();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_UNKNOWN **sub_25E4CD468()
{
  return &protocol witness table for HeadlineScores;
}

_UNKNOWN **sub_25E4CD474()
{
  return &protocol witness table for HeadlineMetadata.StockEntityMetadata;
}

uint64_t sub_25E4CD480@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEB00000000444549;
  uint64_t v3 = 0x4649434550534E55;
  uint64_t result = sub_25E4DA330();
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v17 = sub_25E4CE4B8(result);
    unint64_t v8 = v7;
    uint64_t v9 = sub_25E4CE6A8(v6);
    uint64_t v16 = sub_25E4CEAC4(v6);
    char v15 = v10;
    id v11 = sub_25E4CEF5C(v6);
    id v12 = sub_25E4CF640(v6);
    id v13 = sub_25E4CFD24(v6);
    uint64_t result = swift_bridgeObjectRelease();
    if (v8)
    {
      uint64_t v3 = v17;
      unint64_t v2 = v8;
    }
    if (v9) {
      uint64_t v5 = v9;
    }
    uint64_t v14 = v16;
    if (v15) {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
  }
  *a1 = v3;
  a1[1] = v2;
  a1[2] = (uint64_t)v5;
  a1[3] = v14;
  a1[4] = (uint64_t)v11;
  a1[5] = (uint64_t)v12;
  a1[6] = (uint64_t)v13;
  return result;
}

uint64_t sub_25E4CD598@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25E4DA8D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E4DA140();
  unint64_t v8 = v7;
  sub_25E4DA050();
  swift_allocObject();
  sub_25E4DA040();
  sub_25E4D10B0(&qword_26A6F2BD8, MEMORY[0x263F59EA8]);
  sub_25E4DA030();
  swift_release();
  uint64_t v9 = sub_25E4DA8C0();
  uint64_t v22 = v10;
  uint64_t v23 = v9;
  uint64_t v21 = sub_25E4DA8A0();
  uint64_t v20 = sub_25E4DA8B0();
  id v11 = (void *)sub_25E4DA890();
  id v12 = objc_msgSend(v11, sel_eventAggregationConfiguration);

  id v13 = (void *)sub_25E4DA890();
  id v14 = objc_msgSend(v13, sel_feedPersonalizationConfiguration);

  char v15 = (void *)sub_25E4DA890();
  id v16 = objc_msgSend(v15, sel_unloadGraphOnBackgroundConfiguration);

  sub_25E4BE838(v6, v8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v18 = v22;
  *a1 = v23;
  a1[1] = v18;
  uint64_t v19 = v20;
  a1[2] = v21;
  a1[3] = v19;
  a1[4] = (uint64_t)v12;
  a1[5] = (uint64_t)v14;
  a1[6] = (uint64_t)v16;
  return result;
}

uint64_t sub_25E4CDA60(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 88) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = sub_25E4DA350();
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = *(void *)(v4 - 8);
  *(void *)(v3 + 48) = swift_task_alloc();
  *(void *)(v3 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25E4CDB34, 0, 0);
}

uint64_t sub_25E4CDB34()
{
  int v1 = *(unsigned __int8 *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(void *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager+ 24));
  if (v1 == 1)
  {
    sub_25E4DA5B0();
    uint64_t v2 = *(void *)(v0 + 56);
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v4 = *(void *)(v0 + 40);
    sub_25E4CD480(*(uint64_t **)(v0 + 16));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    *(void *)(v0 + 64) = sub_25E4DA5C0();
    unint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v7;
    void *v7 = v0;
    v7[1] = sub_25E4CDC98;
    uint64_t v8 = *(void *)(v0 + 48);
    return MEMORY[0x270F7A5E8](v8);
  }
}

uint64_t sub_25E4CDC98()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25E4CDE50;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_25E4CDDB4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25E4CDDB4()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  sub_25E4CD480(*(uint64_t **)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25E4CDE50()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_25E4CDEC8(uint64_t a1, uint64_t a2, void (*a3)(void *))
{
  unint64_t v4 = 0xEB00000000444549;
  uint64_t v5 = 0x4649434550534E55;
  uint64_t v6 = sub_25E4DA330();
  unint64_t v7 = (char *)MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v18 = sub_25E4CE4B8(v6);
    unint64_t v10 = v9;
    id v11 = sub_25E4CE6A8(v8);
    uint64_t v17 = sub_25E4CEAC4(v8);
    char v13 = v12;
    id v14 = sub_25E4CEF5C(v8);
    id v15 = sub_25E4CF640(v8);
    id v19 = sub_25E4CFD24(v8);
    swift_bridgeObjectRelease();
    if (v10)
    {
      uint64_t v5 = v18;
      unint64_t v4 = v10;
    }
    if (v11) {
      unint64_t v7 = v11;
    }
    uint64_t v16 = v17;
    if (v13) {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    id v14 = 0;
    id v15 = 0;
    id v19 = 0;
  }
  v20[0] = v5;
  v20[1] = v4;
  void v20[2] = v7;
  v20[3] = v16;
  v20[4] = v14;
  v20[5] = v15;
  v20[6] = v19;
  a3(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_25E4CE034()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_bundledConfigurationURL;
  uint64_t v2 = sub_25E4DA130();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager);
  return swift_deallocClassInstance();
}

uint64_t sub_25E4CE0E4()
{
  return type metadata accessor for TabiConfigurationManager();
}

uint64_t type metadata accessor for TabiConfigurationManager()
{
  uint64_t result = qword_26B38C9E8;
  if (!qword_26B38C9E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4CE138()
{
  uint64_t result = sub_25E4DA130();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25E4CE1D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_25E4DA350();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(*v1 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(void *)(*v1 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager + 24));
  sub_25E4DA5B0();
  sub_25E4CD480(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25E4CE2E0@<X0>(uint64_t *a1@<X8>)
{
  return sub_25E4CD598(a1);
}

uint64_t sub_25E4CE304(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25E4C0538;
  return sub_25E4CDA60(a1, a2);
}

uint64_t sub_25E4CE3B0(uint64_t a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1((void *)(*v2 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager), *(void *)(*v2 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager + 24));
  sub_25E4DA5A0();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  sub_25E4DA730();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_25E4CE478()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25E4CE4B0(uint64_t a1, uint64_t a2)
{
  sub_25E4CDEC8(a1, a2, *(void (**)(void *))(v2 + 16));
}

uint64_t sub_25E4CE4B8(uint64_t a1)
{
  uint64_t v2 = sub_25E4DA7E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    unint64_t v6 = sub_25E4C8A04(0x6E6F6973726576, 0xE700000000000000);
    if (v7)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(a1 + 56) + *(void *)(v3 + 72) * v6, v2);
      if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == *MEMORY[0x263F7CFE0])
      {
        (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
        uint64_t v8 = *(void *)(*(void *)v5 + 16);
        swift_bridgeObjectRetain();
        swift_release();
        return v8;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  if (qword_26B38C970 != -1) {
    swift_once();
  }
  id v9 = (id)qword_26B38C968;
  sub_25E4DADD0();
  sub_25E4DAA90();

  return 0;
}

char *sub_25E4CE6A8(uint64_t a1)
{
  uint64_t v2 = sub_25E4DA7E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)&v33 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v33 - v10;
  if (*(void *)(a1 + 16))
  {
    unint64_t v12 = sub_25E4C8A04(0x416567616B636170, 0xEF73444974657373);
    if (v13)
    {
      uint64_t v14 = *(void *)(v3 + 72);
      unint64_t v15 = *(void *)(a1 + 56) + v14 * v12;
      uint64_t v42 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      v42(v11, v15, v2);
      uint64_t v40 = *(uint64_t (**)(char *, uint64_t))(v3 + 88);
      uint64_t v41 = v3 + 88;
      if (v40(v11, v2) == *MEMORY[0x263F7CFC8])
      {
        uint64_t v37 = *(void (**)(char *, uint64_t))(v3 + 96);
        uint64_t v38 = v3 + 96;
        v37(v11, v2);
        uint64_t v16 = *(void *)(*(void *)v11 + 16);
        swift_bridgeObjectRetain();
        swift_release();
        uint64_t v17 = *(void *)(v16 + 16);
        if (v17)
        {
          unint64_t v18 = v16 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
          int v39 = *MEMORY[0x263F7CFE0];
          uint64_t v19 = v16;
          uint64_t v20 = (void (**)(char *, uint64_t))(v3 + 8);
          uint64_t v33 = v19;
          swift_bridgeObjectRetain();
          uint64_t v21 = (char *)MEMORY[0x263F8EE78];
          uint64_t v35 = v3 + 16;
          uint64_t v36 = v14;
          uint64_t v34 = v9;
          do
          {
            uint64_t v23 = (void (*)(char *, char *, uint64_t))v42;
            v42(v9, v18, v2);
            v23(v6, v9, v2);
            int v24 = v40(v6, v2);
            if (v24 == v39)
            {
              v37(v6, v2);
              uint64_t v25 = v9;
              uint64_t v26 = *(void *)(*(void *)v6 + 16);
              uint64_t v27 = *(void *)(*(void *)v6 + 24);
              swift_bridgeObjectRetain();
              swift_release();
              (*v20)(v25, v2);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v21 = sub_25E4D0388(0, *((void *)v21 + 2) + 1, 1, v21);
              }
              unint64_t v29 = *((void *)v21 + 2);
              unint64_t v28 = *((void *)v21 + 3);
              if (v29 >= v28 >> 1) {
                uint64_t v21 = sub_25E4D0388((char *)(v28 > 1), v29 + 1, 1, v21);
              }
              *((void *)v21 + 2) = v29 + 1;
              uint64_t v30 = &v21[16 * v29];
              *((void *)v30 + 4) = v26;
              *((void *)v30 + 5) = v27;
              uint64_t v14 = v36;
              id v9 = v34;
            }
            else
            {
              uint64_t v22 = *v20;
              (*v20)(v6, v2);
              v22(v9, v2);
            }
            v18 += v14;
            --v17;
          }
          while (v17);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
          return (char *)MEMORY[0x263F8EE78];
        }
        return v21;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    }
  }
  if (qword_26B38C970 != -1) {
    swift_once();
  }
  id v31 = (id)qword_26B38C968;
  sub_25E4DADD0();
  sub_25E4DAA90();

  return 0;
}

uint64_t sub_25E4CEAC4(uint64_t a1)
{
  uint64_t v2 = sub_25E4DA7E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_57;
  }
  unint64_t v6 = sub_25E4C8A04(0x7475706D6F436C6DLL, 0xEE007374696E5565);
  if ((v7 & 1) == 0) {
    goto LABEL_57;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(a1 + 56) + *(void *)(v3 + 72) * v6, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) != *MEMORY[0x263F7CFD0])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_57;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
  uint64_t v8 = *(void *)v5;
  uint64_t v10 = *(void *)(*(void *)v5 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  uint64_t v12 = HIBYTE(v9) & 0xF;
  uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
  if ((v9 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v9) & 0xF;
  }
  else {
    uint64_t v14 = v10 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14)
  {
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  if ((v9 & 0x1000000000000000) != 0)
  {
    uint64_t v16 = (uint64_t)sub_25E4D0770(v10, v9, 10);
    LOBYTE(v10) = v31;
    goto LABEL_48;
  }
  if ((v9 & 0x2000000000000000) == 0)
  {
    if ((v10 & 0x1000000000000000) != 0) {
      unint64_t v15 = (unsigned __int8 *)((v9 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unint64_t v15 = (unsigned __int8 *)sub_25E4DAEA0();
    }
    uint64_t v16 = (uint64_t)sub_25E4D0858(v15, v13, 10);
    LOBYTE(v10) = v17 & 1;
LABEL_48:
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return v16;
    }
LABEL_57:
    if (qword_26B38C970 != -1) {
      swift_once();
    }
    id v30 = (id)qword_26B38C968;
    sub_25E4DADD0();
    sub_25E4DAA90();

    return 0;
  }
  v33[0] = v10;
  v33[1] = v9 & 0xFFFFFFFFFFFFFFLL;
  if (v10 == 43)
  {
    if (!v12) {
      goto LABEL_64;
    }
    if (v12 == 1 || (BYTE1(v10) - 48) > 9u) {
      goto LABEL_35;
    }
    uint64_t v16 = (BYTE1(v10) - 48);
    if (v12 != 2)
    {
      if ((BYTE2(v10) - 48) > 9u) {
        goto LABEL_35;
      }
      uint64_t v16 = 10 * (BYTE1(v10) - 48) + (BYTE2(v10) - 48);
      uint64_t v18 = v12 - 3;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v33 + 3;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_35;
          }
          uint64_t v21 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
            goto LABEL_35;
          }
          uint64_t v16 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_35;
          }
          LOBYTE(v10) = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_48;
          }
        }
      }
    }
LABEL_47:
    LOBYTE(v10) = 0;
    goto LABEL_48;
  }
  if (v10 != 45)
  {
    if (!v12 || (v10 - 48) > 9u) {
      goto LABEL_35;
    }
    uint64_t v16 = (v10 - 48);
    if (v12 != 1)
    {
      if ((BYTE1(v10) - 48) > 9u) {
        goto LABEL_35;
      }
      uint64_t v16 = 10 * (v10 - 48) + (BYTE1(v10) - 48);
      uint64_t v22 = v12 - 2;
      if (v22)
      {
        uint64_t v23 = (unsigned __int8 *)v33 + 2;
        while (1)
        {
          unsigned int v24 = *v23 - 48;
          if (v24 > 9) {
            goto LABEL_35;
          }
          uint64_t v25 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
            goto LABEL_35;
          }
          uint64_t v16 = v25 + v24;
          if (__OFADD__(v25, v24)) {
            goto LABEL_35;
          }
          LOBYTE(v10) = 0;
          ++v23;
          if (!--v22) {
            goto LABEL_48;
          }
        }
      }
    }
    goto LABEL_47;
  }
  if (v12)
  {
    if (v12 != 1 && (BYTE1(v10) - 48) <= 9u)
    {
      if (v12 == 2)
      {
        LOBYTE(v10) = 0;
        uint64_t v16 = -(uint64_t)(BYTE1(v10) - 48);
        goto LABEL_48;
      }
      if ((BYTE2(v10) - 48) <= 9u)
      {
        uint64_t v16 = -10 * (BYTE1(v10) - 48) - (BYTE2(v10) - 48);
        uint64_t v26 = v12 - 3;
        if (!v26) {
          goto LABEL_47;
        }
        uint64_t v27 = (unsigned __int8 *)v33 + 3;
        while (1)
        {
          unsigned int v28 = *v27 - 48;
          if (v28 > 9) {
            break;
          }
          uint64_t v29 = 10 * v16;
          if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
            break;
          }
          uint64_t v16 = v29 - v28;
          if (__OFSUB__(v29, v28)) {
            break;
          }
          LOBYTE(v10) = 0;
          ++v27;
          if (!--v26) {
            goto LABEL_48;
          }
        }
      }
    }
LABEL_35:
    uint64_t v16 = 0;
    LOBYTE(v10) = 1;
    goto LABEL_48;
  }
  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

id sub_25E4CEF5C(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_25E4DA7E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v9 = (char *)v36 - v8 + 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v36 - v10 + 8;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_9;
  }
  unint64_t v12 = sub_25E4C8A04(0xD00000000000001DLL, 0x800000025E4DC4C0);
  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v14(v9, *(void *)(a1 + 56) + *(void *)(v3 + 72) * v12, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v9, v2);
  v14(v6, (unint64_t)v11, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) != *MEMORY[0x263F7CFD8])
  {
    uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
    v19(v11, v2);
    v19(v6, v2);
LABEL_9:
    if (qword_26B38C970 != -1) {
      swift_once();
    }
    id v20 = (id)qword_26B38C968;
    sub_25E4DADD0();
    sub_25E4DAA90();

    return 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
  swift_release();
  sub_25E4DA080();
  swift_allocObject();
  sub_25E4DA070();
  sub_25E4D10B0(&qword_26B38CE20, MEMORY[0x263F7CFE8]);
  uint64_t v23 = sub_25E4DA060();
  unint64_t v25 = v24;
  swift_release();
  uint64_t v26 = self;
  uint64_t v27 = (void *)sub_25E4DA150();
  v36[0] = 0;
  id v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, v36);

  id v29 = v36[0];
  if (!v28)
  {
    uint64_t v32 = v29;
    uint64_t v33 = (void *)sub_25E4DA0B0();

    swift_willThrow();
    sub_25E4BE838(v23, v25);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    if (qword_26B38C970 != -1) {
      swift_once();
    }
    id v15 = (id)qword_26B38C968;
    sub_25E4DADD0();
    sub_25E4BD2E8();
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25E4DB670;
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    v36[0] = v33;
    sub_25E4BB9B4(0, &qword_26B38CCF0);
    sub_25E4DAEC0();
    uint64_t v17 = v37;
    unint64_t v18 = v38;
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = sub_25E4BBA04();
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v18;
    sub_25E4DAA90();

    swift_bridgeObjectRelease();
    return 0;
  }
  sub_25E4DAE50();
  swift_unknownObjectRelease();
  sub_25E4D032C((uint64_t)&v37, (uint64_t)v36);
  sub_25E4C0188();
  if (swift_dynamicCast())
  {
    id v30 = objc_allocWithZone(MEMORY[0x263F59568]);
    char v31 = (void *)sub_25E4DAC30();
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v30, sel_initWithDictionary_, v31);

    if (v21)
    {
      sub_25E4BE838(v23, v25);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      return v21;
    }
    if (qword_26B38C970 == -1) {
      goto LABEL_22;
    }
  }
  else if (qword_26B38C970 == -1)
  {
    goto LABEL_22;
  }
  swift_once();
LABEL_22:
  id v34 = (id)qword_26B38C968;
  sub_25E4DADD0();
  sub_25E4DAA90();
  sub_25E4BE838(v23, v25);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  return 0;
}

id sub_25E4CF640(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_25E4DA7E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v9 = (char *)v36 - v8 + 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v36 - v10 + 8;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_9;
  }
  unint64_t v12 = sub_25E4C8A04(0xD000000000000020, 0x800000025E4DC4E0);
  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v14(v9, *(void *)(a1 + 56) + *(void *)(v3 + 72) * v12, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v9, v2);
  v14(v6, (unint64_t)v11, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) != *MEMORY[0x263F7CFD8])
  {
    uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
    v19(v11, v2);
    v19(v6, v2);
LABEL_9:
    if (qword_26B38C970 != -1) {
      swift_once();
    }
    id v20 = (id)qword_26B38C968;
    sub_25E4DADD0();
    sub_25E4DAA90();

    return 0;
  }
  (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
  swift_release();
  sub_25E4DA080();
  swift_allocObject();
  sub_25E4DA070();
  sub_25E4D10B0(&qword_26B38CE20, MEMORY[0x263F7CFE8]);
  uint64_t v23 = sub_25E4DA060();
  unint64_t v25 = v24;
  swift_release();
  uint64_t v26 = self;
  uint64_t v27 = (void *)sub_25E4DA150();
  v36[0] = 0;
  id v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, v36);

  id v29 = v36[0];
  if (!v28)
  {
    uint64_t v32 = v29;
    uint64_t v33 = (void *)sub_25E4DA0B0();

    swift_willThrow();
    sub_25E4BE838(v23, v25);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    if (qword_26B38C970 != -1) {
      swift_once();
    }
    id v15 = (id)qword_26B38C968;
    sub_25E4DADD0();
    sub_25E4BD2E8();
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25E4DB670;
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    v36[0] = v33;
    sub_25E4BB9B4(0, &qword_26B38CCF0);
    sub_25E4DAEC0();
    uint64_t v17 = v37;
    unint64_t v18 = v38;
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = sub_25E4BBA04();
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v18;
    sub_25E4DAA90();

    swift_bridgeObjectRelease();
    return 0;
  }
  sub_25E4DAE50();
  swift_unknownObjectRelease();
  sub_25E4D032C((uint64_t)&v37, (uint64_t)v36);
  sub_25E4C0188();
  if (swift_dynamicCast())
  {
    id v30 = objc_allocWithZone(MEMORY[0x263F59570]);
    char v31 = (void *)sub_25E4DAC30();
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v30, sel_initWithDictionary_, v31);

    if (v21)
    {
      sub_25E4BE838(v23, v25);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      return v21;
    }
    if (qword_26B38C970 == -1) {
      goto LABEL_22;
    }
  }
  else if (qword_26B38C970 == -1)
  {
    goto LABEL_22;
  }
  swift_once();
LABEL_22:
  id v34 = (id)qword_26B38C968;
  sub_25E4DADD0();
  sub_25E4DAA90();
  sub_25E4BE838(v23, v25);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  return 0;
}

id sub_25E4CFD24(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_25E4DA7E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v9 = (char *)v34 - v8 + 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v34 - v10 + 8;
  if (*(void *)(a1 + 16))
  {
    unint64_t v12 = sub_25E4C8A04(0xD000000000000024, 0x800000025E4DC510);
    if (v13)
    {
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      v14(v9, *(void *)(a1 + 56) + *(void *)(v3 + 72) * v12, v2);
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v11, v9, v2);
      v14(v6, (unint64_t)v11, v2);
      if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) == *MEMORY[0x263F7CFD8])
      {
        (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
        swift_release();
        sub_25E4DA080();
        swift_allocObject();
        sub_25E4DA070();
        sub_25E4D10B0(&qword_26B38CE20, MEMORY[0x263F7CFE8]);
        uint64_t v23 = sub_25E4DA060();
        unint64_t v25 = v24;
        swift_release();
        uint64_t v26 = self;
        uint64_t v27 = (void *)sub_25E4DA150();
        v34[0] = 0;
        id v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, v34);

        id v29 = v34[0];
        if (v28)
        {
          sub_25E4DAE50();
          swift_unknownObjectRelease();
          sub_25E4D032C((uint64_t)&v35, (uint64_t)v34);
          sub_25E4C0188();
          if (swift_dynamicCast())
          {
            id v30 = (void *)sub_25E4DAC30();
            swift_bridgeObjectRelease();
          }
          else
          {
            id v30 = 0;
          }
          id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F59578]), sel_initWithDictionary_, v30);

          sub_25E4BE838(v23, v25);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
        }
        else
        {
          char v31 = v29;
          uint64_t v32 = (void *)sub_25E4DA0B0();

          swift_willThrow();
          sub_25E4BE838(v23, v25);
          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
          if (qword_26B38C970 != -1) {
            swift_once();
          }
          id v15 = (id)qword_26B38C968;
          sub_25E4DADD0();
          sub_25E4BD2E8();
          uint64_t v16 = swift_allocObject();
          *(_OWORD *)(v16 + 16) = xmmword_25E4DB670;
          uint64_t v35 = 0;
          unint64_t v36 = 0xE000000000000000;
          v34[0] = v32;
          sub_25E4BB9B4(0, &qword_26B38CCF0);
          sub_25E4DAEC0();
          uint64_t v17 = v35;
          unint64_t v18 = v36;
          *(void *)(v16 + 56) = MEMORY[0x263F8D310];
          *(void *)(v16 + 64) = sub_25E4BBA04();
          *(void *)(v16 + 32) = v17;
          *(void *)(v16 + 40) = v18;
          sub_25E4DAA90();

          swift_bridgeObjectRelease();
          id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F59578]), sel_initWithDictionary_, 0);
        }
        return v19;
      }
      id v20 = *(void (**)(char *, uint64_t))(v3 + 8);
      v20(v11, v2);
      v20(v6, v2);
    }
  }
  if (qword_26B38C970 != -1) {
    swift_once();
  }
  id v21 = (id)qword_26B38C968;
  sub_25E4DADD0();
  sub_25E4DAA90();

  return objc_msgSend(objc_allocWithZone(MEMORY[0x263F59578]), sel_initWithDictionary_, 0);
}

uint64_t sub_25E4D032C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_25E4D0388(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_25E4CC780(0, (unint64_t *)&qword_26B38D160);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25E4D0498(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_25E4CC780(0, (unint64_t *)&unk_26B38CCD0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_25E4D05A0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_25E4D10F8();
  uint64_t v10 = *(void *)(sub_25E4DA4E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25E4DA4E0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

unsigned __int8 *sub_25E4D0770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25E4DAD40();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_25E4D0AD4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_25E4DAEA0();
  }
LABEL_7:
  uint64_t v11 = sub_25E4D0858(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_25E4D0858(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_25E4D0AD4()
{
  unint64_t v0 = sub_25E4DAD50();
  uint64_t v4 = sub_25E4D0B54(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25E4D0B54(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25E4D0CAC(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25E4D0DAC(v9, 0);
      unint64_t v12 = sub_25E4D0E20((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25E4DAEA0();
LABEL_4:
        JUMPOUT(0x2611DA560);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611DA560](v11 + 4, v11[2]);
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
    return MEMORY[0x2611DA560]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25E4D0CAC(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25E4D1034(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25E4D1034(v6, v5, v4);
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

void *sub_25E4D0DAC(uint64_t a1, uint64_t a2)
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
  sub_25E4CC780(0, &qword_26A6F2BC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_25E4D0E20(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
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
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_25E4D1034(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25E4DAD20();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_25E4DAEA0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_25E4D1034(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_25E4DACF0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_25E4D1034(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25E4DAD30();
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
    uint64_t v5 = MEMORY[0x2611DA5A0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25E4D10B0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_25E4D10F8()
{
  if (!qword_26B38D140)
  {
    sub_25E4DA4E0();
    unint64_t v0 = sub_25E4DAFA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38D140);
    }
  }
}

uint64_t sub_25E4D1150(uint64_t a1)
{
  return sub_25E4D11FC(a1, 0x6154736B636F7453, 0xEA00000000006962, &qword_26B38C968);
}

unint64_t sub_25E4D1174()
{
  unint64_t result = qword_26B38CC40;
  if (!qword_26B38CC40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B38CC40);
  }
  return result;
}

uint64_t sub_25E4D11B4(uint64_t a1)
{
  return sub_25E4D11FC(a1, 0xD000000000000013, 0x800000025E4DD230, &qword_26B38C9B8);
}

uint64_t sub_25E4D11D8(uint64_t a1)
{
  return sub_25E4D11FC(a1, 0xD000000000000021, 0x800000025E4DD250, &qword_26B38CAB0);
}

uint64_t sub_25E4D11FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v5 = objc_msgSend(self, sel_mainBundle);
  id v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (v6)
  {
    sub_25E4DAC80();
  }
  sub_25E4D1174();
  uint64_t result = sub_25E4DAE30();
  *a4 = result;
  return result;
}

void *sub_25E4D12DC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E4DA1D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    long long v12 = *(_OWORD *)((char *)a2 + v9 + 24);
    *(_OWORD *)((char *)a1 + v9 + 24) = v12;
    uint64_t v13 = v12;
    uint64_t v14 = **(void (***)(char *, char *, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    v14(v10, v11, v13);
    uint64_t v15 = a3[8];
    long long v16 = *(_OWORD *)((char *)a2 + v15 + 24);
    *(_OWORD *)((char *)a1 + v15 + 24) = v16;
    (**(void (***)(void))(v16 - 8))();
    uint64_t v17 = a3[10];
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    unint64_t v18 = (char *)a1 + v17;
    char v19 = (char *)a2 + v17;
    uint64_t v20 = sub_25E4DA9A0();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_unknownObjectRetain();
    v21(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_25E4D14D4(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[8]);
  swift_unknownObjectRelease();
  uint64_t v5 = a1 + a2[10];
  uint64_t v6 = sub_25E4DA9A0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_25E4D15AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  long long v11 = *(_OWORD *)(a2 + v8 + 24);
  *(_OWORD *)(a1 + v8 + 24) = v11;
  uint64_t v12 = v11;
  uint64_t v13 = **(void (***)(uint64_t, uint64_t, uint64_t))(v11 - 8);
  swift_bridgeObjectRetain();
  v13(v9, v10, v12);
  uint64_t v14 = a3[8];
  long long v15 = *(_OWORD *)(a2 + v14 + 24);
  *(_OWORD *)(a1 + v14 + 24) = v15;
  (**(void (***)(void))(v15 - 8))();
  uint64_t v16 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_25E4DA9A0();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_unknownObjectRetain();
  v20(v17, v18, v19);
  return a1;
}

uint64_t sub_25E4D1754(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[8]), (uint64_t *)(a2 + a3[8]));
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v7 = a3[10];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25E4DA9A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_25E4D1870(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v8;
  long long v11 = (long long *)(a2 + v8);
  long long v12 = *v11;
  long long v13 = v11[1];
  *(void *)(v10 + 32) = *((void *)v11 + 4);
  *(_OWORD *)uint64_t v10 = v12;
  *(_OWORD *)(v10 + 16) = v13;
  uint64_t v14 = a1 + v9;
  uint64_t v15 = a2 + v9;
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(void *)(v14 + 32) = *(void *)(v15 + 32);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v21 = sub_25E4DA9A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  return a1;
}

uint64_t sub_25E4D1978(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  __swift_destroy_boxed_opaque_existential_1(a1 + v8);
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  __swift_destroy_boxed_opaque_existential_1(a1 + v12);
  long long v15 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v15;
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_unknownObjectRelease();
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_25E4DA9A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_25E4D1AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4D1AC4);
}

uint64_t sub_25E4D1AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4DA1D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_25E4DA9A0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 40);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_25E4D1BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4D1C04);
}

uint64_t sub_25E4D1C04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25E4DA1D0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_25E4DA9A0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 40);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for StocksTabiArticleScoringWork()
{
  uint64_t result = qword_26B38C610;
  if (!qword_26B38C610) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4D1D7C()
{
  uint64_t result = sub_25E4DA1D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25E4DA9A0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25E4D1E70()
{
  return sub_25E4D2AB4(&qword_26A6F2B08, MEMORY[0x263F07508]);
}

uint64_t sub_25E4D1EB8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_25E4C8C28(0, v1, 0);
    uint64_t v2 = v15;
    uint64_t v4 = (void *)(a1 + 32);
    do
    {
      uint64_t v5 = v4[3];
      uint64_t v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      id v7 = objc_msgSend((id)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 64))(v5, v6), sel_itemID);
      uint64_t v8 = sub_25E4DAC80();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_25E4C8C28(0, *(void *)(v15 + 16) + 1, 1);
      }
      unint64_t v12 = *(void *)(v15 + 16);
      unint64_t v11 = *(void *)(v15 + 24);
      if (v12 >= v11 >> 1) {
        sub_25E4C8C28((char *)(v11 > 1), v12 + 1, 1);
      }
      *(void *)(v15 + 16) = v12 + 1;
      uint64_t v13 = v15 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25E4D2018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v16[0] = a1;
  v16[1] = a2;
  uint64_t v6 = type metadata accessor for StocksTabiArticleFeatures();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_25E4C8E18(0, v10, 0);
    uint64_t v11 = v17;
    for (uint64_t i = a3 + 32; ; i += 40)
    {
      ((void (*)(uint64_t))v16[0])(i);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v17 = v11;
      unint64_t v14 = *(void *)(v11 + 16);
      unint64_t v13 = *(void *)(v11 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_25E4C8E18(v13 > 1, v14 + 1, 1);
        uint64_t v11 = v17;
      }
      *(void *)(v11 + 16) = v14 + 1;
      sub_25E4C20F8((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v14);
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

void sub_25E4D21A4(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  id v5 = objc_msgSend((id)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 64))(v3, v4), sel_itemID);
  uint64_t v6 = sub_25E4DAC80();
  uint64_t v8 = v7;
  swift_unknownObjectRelease();

  *a2 = v6;
  a2[1] = v8;
}

uint64_t sub_25E4D2240(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_25E4D2C0C(0, (unint64_t *)&unk_26B38CB68, MEMORY[0x263F7CAD0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v28 - v5;
  uint64_t v7 = sub_25E4DABC0();
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  id v29 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25E4DAA80();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = (int *)type metadata accessor for StocksTabiArticleScoringWork();
  uint64_t v14 = *(void *)(v2 + v13[6]);
  uint64_t v33 = v2;
  uint64_t v34 = a1;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_25E4D2018((uint64_t)sub_25E4D2B60, (uint64_t)v32, v14);
  swift_bridgeObjectRelease();
  sub_25E4DABF0();
  __swift_project_boxed_opaque_existential_1((void *)(v2 + v13[7]), *(void *)(v2 + v13[7] + 24));
  sub_25E4DAE10();
  sub_25E4C31DC(v15, (uint64_t)v12);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v16 = sub_25E4DABD0();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)(v2 + v13[8]);
  uint64_t v19 = v30;
  uint64_t v18 = v31;
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_25E4DAA30();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v6, 1, v18) == 1)
  {
    sub_25E4D2B80((uint64_t)v6);
  }
  else
  {
    uint64_t v20 = v29;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v29, v6, v18);
    sub_25E4D2C0C(0, (unint64_t *)&qword_26B38CCC0, (uint64_t (*)(uint64_t))sub_25E4BBAF8, MEMORY[0x263F8E0F8]);
    sub_25E4BBAF8();
    uint64_t v22 = v21 - 8;
    unint64_t v23 = (*(unsigned __int8 *)(*(void *)(v21 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_25E4DB670;
    uint64_t v25 = (void *)(v24 + v23);
    unint64_t v26 = v24 + v23 + *(int *)(v22 + 56);
    *uint64_t v25 = 0xD00000000000001DLL;
    v25[1] = 0x800000025E4DD2A0;
    (*(void (**)(unint64_t, char *, uint64_t))(v19 + 16))(v26, v20, v18);
    sub_25E4BB284(v24);
    sub_25E4DABD0();
    swift_bridgeObjectRelease();
    sub_25E4DABE0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
  }
  return v16;
}

uint64_t sub_25E4D2688@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v7 = objc_msgSend(objc_msgSend(*(id *)(a2 + *(int *)(type metadata accessor for StocksTabiArticleScoringWork() + 36)), sel_bundleSubscriptionProvider), sel_bundleSubscription);
  swift_unknownObjectRelease();
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  LODWORD(v8) = objc_msgSend(v7, sel_containsItem_, (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 64))(v8, v9));

  swift_unknownObjectRelease();
  sub_25E4BB488((uint64_t)a1, (uint64_t)v11);
  return sub_25E4C0730(v11, v8, a3, a4);
}

uint64_t sub_25E4D27A0(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_25E4D27AC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25E4D1EB8(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25E4D2808(void *a1)
{
  id v1 = objc_msgSend(a1, sel_defaultHeadlineScoringOutputName);
  uint64_t v2 = sub_25E4DAC80();

  return v2;
}

unint64_t sub_25E4D285C()
{
  return 0xD000000000000014;
}

uint64_t sub_25E4D2878(uint64_t a1, uint64_t a2)
{
  v5[3] = a2;
  v5[4] = sub_25E4D2AB4((unint64_t *)&unk_26B38C5F0, (void (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v5);
  sub_25E4D2AFC(v2, (uint64_t)boxed_opaque_existential_1);
  sub_25E4DA970();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_25E4D2938@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E4DA980();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E4D296C()
{
  return NPDeviceSupportsFeedPersonalization();
}

uint64_t sub_25E4D2984(uint64_t a1)
{
  uint64_t result = sub_25E4D2AB4((unint64_t *)&qword_26B38C600, (void (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25E4D29DC()
{
  return sub_25E4D2AB4(&qword_26B38C608, (void (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork);
}

uint64_t sub_25E4D2A24()
{
  return sub_25E4D2AB4(&qword_26B38C330, MEMORY[0x263F07508]);
}

uint64_t sub_25E4D2A6C()
{
  return sub_25E4D2AB4(&qword_26B38C3E8, MEMORY[0x263F59F10]);
}

uint64_t sub_25E4D2AB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E4D2AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StocksTabiArticleScoringWork();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4D2B60@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E4D2688(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_25E4D2B80(uint64_t a1)
{
  sub_25E4D2C0C(0, (unint64_t *)&unk_26B38CB68, MEMORY[0x263F7CAD0], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25E4D2C0C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_25E4D2C70(void *a1)
{
  sub_25E4D79B4(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v24 - v6;
  uint64_t v8 = sub_25E4DA920();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for TabiConfigurationManager();
  uint64_t result = sub_25E4DA6B0();
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v43 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C3F8);
  uint64_t result = sub_25E4DA6C0();
  if (!v42)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(v41, v42);
  sub_25E4DA9B0();
  int v13 = sub_25E4DA910();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D8304(0, &qword_26B38C9B0);
  uint64_t result = sub_25E4DA6C0();
  if (v37 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v31 = v36;
  uint64_t v32 = v37;
  long long v33 = v38;
  long long v34 = v39;
  uint64_t v35 = v40;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4DA940();
  uint64_t result = sub_25E4DA6B0();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v30 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D7970();
  uint64_t result = sub_25E4DA6A0();
  uint64_t v14 = v28;
  if (!v28)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v25 = v13;
  unint64_t v26 = v5;
  uint64_t v15 = v29;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v17 = sub_25E4DA130();
  sub_25E4DA6A0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t result = v19(v7, 1, v17);
  if (result == 1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v24[2] = sub_25E4DA110();
  v24[1] = v20;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v18 + 8);
  v21(v7, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v22 = v26;
  sub_25E4DA6A0();
  uint64_t result = v19(v22, 1, v17);
  if (result == 1)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_25E4DA110();
  v21(v22, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory();
  uint64_t result = sub_25E4DA6B0();
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v27 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D7A7C();
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    sub_25E4D77EC();
    uint64_t v23 = sub_25E4DAAC0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    return v23;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_25E4D31EC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D7D28(0, &qword_26B38CC28);
  uint64_t result = sub_25E4DA6B0();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = (void *)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D77EC();
  uint64_t result = sub_25E4DA6B0();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C8B0);
  uint64_t result = sub_25E4DA6C0();
  if (!v24)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C400);
  uint64_t result = sub_25E4DA6C0();
  if (!v22)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D7D28(0, (unint64_t *)&unk_26B38CC18);
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
    MEMORY[0x270FA5388](v6);
    uint64_t v8 = (void *)((char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v9 + 16))(v8);
    uint64_t v10 = *v8;
    uint64_t v19 = type metadata accessor for StocksTabiArticleFeaturesFactory();
    uint64_t v20 = &off_270B2D580;
    v18[0] = v10;
    uint64_t v11 = (char *)objc_allocWithZone((Class)type metadata accessor for StocksTabiUserEventHistoryScoringService());
    uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    MEMORY[0x270FA5388](v12);
    uint64_t v14 = (void *)((char *)&v18[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    id v16 = sub_25E4D7D7C(v3, v4, *v14, (uint64_t)v21, v5, v11);
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    return (uint64_t)v16;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25E4D3540@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D79E8();
  uint64_t v4 = v3;
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    uint64_t v6 = result;
    a2[3] = v4;
    uint64_t result = sub_25E4D7928((unint64_t *)&unk_26A6F2BE0, (void (*)(uint64_t))sub_25E4D79E8);
    a2[4] = result;
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4D35E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E4D61B8(a1, (uint64_t (*)(void))type metadata accessor for StocksTabiWorkServiceUnloaderService, (uint64_t)&off_270B2D3C8, a2);
}

uint64_t sub_25E4D3608@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v27 = a2;
  sub_25E4D79B4(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v29 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v30 = (char *)&v25 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v32 = (char *)&v25 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - v10;
  sub_25E4D81AC(0, &qword_26B38CC88, (uint64_t (*)(uint64_t))sub_25E4D7B88, MEMORY[0x263F8E0F8]);
  sub_25E4D7B88();
  uint64_t v31 = v12;
  unint64_t v13 = (*(unsigned __int8 *)(*(void *)(v12 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v12 - 8) + 80);
  uint64_t v28 = *(void *)(*(void *)(v12 - 8) + 72);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_25E4DC190;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v15 = sub_25E4DA130();
  sub_25E4DA6A0();
  uint64_t v16 = *(void *)(v15 - 8);
  long long v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t result = v34(v11, 1, v15);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v18 = v14 + v13;
  long long v33 = *(void (**)(unint64_t, char *, uint64_t))(v16 + 32);
  v33(v14 + v13, v11, v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v19 = v32;
  sub_25E4DA6A0();
  uint64_t result = v34(v19, 1, v15);
  if (result == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v26 = v14;
  uint64_t v20 = v31;
  v33(v18 + *(int *)(v31 + 48), v19, v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v21 = v30;
  sub_25E4DA6A0();
  uint64_t result = v34(v21, 1, v15);
  if (result == 1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v22 = v18 + v28;
  v33(v22, v21, v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v23 = v29;
  sub_25E4DA6A0();
  uint64_t result = v34(v23, 1, v15);
  if (result != 1)
  {
    v33(v22 + *(int *)(v20 + 48), v23, v15);
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v26;
    uint64_t v24 = v27;
    *uint64_t v27 = sub_25E4D7C28;
    v24[1] = (uint64_t (*)())result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_25E4D3A88(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v86 = sub_25E4DA130();
  uint64_t v2 = *(void *)(v86 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v86);
  uint64_t v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v71 - v6;
  sub_25E4D81AC(0, &qword_26B38C308, (uint64_t (*)(uint64_t))sub_25E4D7B88, MEMORY[0x263F8D8F0]);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v71 - v12;
  unint64_t v14 = *(void *)(a1 + 16);
  uint64_t v85 = (void (**)(char *, char *, uint64_t))(v2 + 32);
  uint64_t v82 = a1;
  unint64_t v83 = (void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  unint64_t v87 = 0;
  uint64_t v72 = 0;
  long long v75 = xmmword_25E4DC190;
  long long v71 = xmmword_25E4DC3D0;
  long long v81 = xmmword_25E4DB670;
  uint64_t v76 = v11;
  unint64_t v84 = v14;
  uint64_t v74 = v13;
  uint64_t v73 = v5;
  uint64_t v80 = v7;
  while (1)
  {
    if (v87 == v14)
    {
      sub_25E4D7B88();
      uint64_t v19 = v18;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
      unint64_t v87 = v14;
    }
    else
    {
      if (v87 >= v14) {
        __break(1u);
      }
      sub_25E4D7B88();
      uint64_t v19 = v20;
      uint64_t v21 = *(void *)(v20 - 8);
      unint64_t v22 = v87;
      sub_25E4D7C30(v82+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v87, (uint64_t)v11);
      unint64_t v87 = v22 + 1;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v11, 0, 1, v19);
    }
    sub_25E4D7C94((uint64_t)v11, (uint64_t)v13);
    sub_25E4D7B88();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v13, 1, v19) == 1) {
      break;
    }
    uint64_t v23 = &v13[*(int *)(v19 + 48)];
    uint64_t v24 = v86;
    uint64_t v25 = *v85;
    (*v85)(v7, v13, v86);
    v25(v5, v23, v24);
    char v91 = 1;
    uint64_t v26 = self;
    id v27 = objc_msgSend(v26, sel_defaultManager);
    sub_25E4DA110();
    uint64_t v28 = (void *)sub_25E4DAC70();
    swift_bridgeObjectRelease();
    LODWORD(v25) = objc_msgSend(v27, sel_fileExistsAtPath_isDirectory_, v28, &v91);

    if (v25)
    {
      if (v91 == 1)
      {
        if (qword_26B38C970 != -1) {
          swift_once();
        }
        uint64_t v29 = (void *)qword_26B38C968;
        sub_25E4BD2E8();
        uint64_t v77 = v30;
        uint64_t v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = v75;
        uint64_t v32 = sub_25E4D7928(&qword_26B38C310, MEMORY[0x263F06EA8]);
        id v33 = v29;
        uint64_t v34 = sub_25E4DAF90();
        uint64_t v36 = v35;
        uint64_t v37 = MEMORY[0x263F8D310];
        *(void *)(v31 + 56) = MEMORY[0x263F8D310];
        unint64_t v38 = sub_25E4BBA04();
        *(void *)(v31 + 64) = v38;
        *(void *)(v31 + 32) = v34;
        *(void *)(v31 + 40) = v36;
        long long v39 = v73;
        uint64_t v79 = v32;
        uint64_t v40 = sub_25E4DAF90();
        *(void *)(v31 + 96) = v37;
        *(void *)(v31 + 104) = v38;
        unint64_t v78 = v38;
        *(void *)(v31 + 72) = v40;
        *(void *)(v31 + 80) = v41;
        sub_25E4DADE0();
        sub_25E4DAA90();

        swift_bridgeObjectRelease();
        id v42 = objc_msgSend(v26, sel_defaultManager);
        uint64_t v7 = v80;
        uint64_t v43 = (void *)sub_25E4DA0F0();
        uint64_t v5 = v39;
        unint64_t v44 = (void *)sub_25E4DA0F0();
        id v89 = 0;
        LODWORD(v39) = objc_msgSend(v42, sel_moveItemAtURL_toURL_error_, v43, v44, &v89);

        if (v39)
        {
          uint64_t v15 = *v83;
          id v16 = v89;
          uint64_t v17 = v86;
          v15(v5, v86);
          v15(v7, v17);
        }
        else
        {
          id v45 = v89;
          unint64_t v46 = (void *)sub_25E4DA0B0();

          swift_willThrow();
          id v47 = (id)qword_26B38C968;
          LODWORD(v72) = sub_25E4DADD0();
          uint64_t v48 = swift_allocObject();
          *(_OWORD *)(v48 + 16) = v71;
          uint64_t v49 = v86;
          uint64_t v50 = sub_25E4DAF90();
          uint64_t v51 = MEMORY[0x263F8D310];
          unint64_t v52 = v78;
          *(void *)(v48 + 56) = MEMORY[0x263F8D310];
          *(void *)(v48 + 64) = v52;
          *(void *)(v48 + 32) = v50;
          *(void *)(v48 + 40) = v53;
          uint64_t v54 = sub_25E4DAF90();
          *(void *)(v48 + 96) = v51;
          *(void *)(v48 + 104) = v52;
          *(void *)(v48 + 72) = v54;
          *(void *)(v48 + 80) = v55;
          id v89 = 0;
          unint64_t v90 = 0xE000000000000000;
          uint64_t v88 = v46;
          sub_25E4BB9B4(0, &qword_26B38CCF0);
          sub_25E4DAEC0();
          id v56 = v89;
          unint64_t v57 = v90;
          *(void *)(v48 + 136) = v51;
          *(void *)(v48 + 144) = v52;
          *(void *)(v48 + 112) = v56;
          *(void *)(v48 + 120) = v57;
          sub_25E4DAA90();

          swift_bridgeObjectRelease();
          uint64_t v58 = *v83;
          (*v83)(v5, v49);
          v58(v80, v49);
          uint64_t v72 = 0;
        }
        uint64_t v11 = v76;
        unint64_t v14 = v84;
        unint64_t v13 = v74;
      }
      else
      {
        unint64_t v14 = v84;
        if (qword_26B38C970 != -1) {
          swift_once();
        }
        id v67 = (id)qword_26B38C968;
        sub_25E4DADD0();
        sub_25E4DAA90();

        uint64_t v68 = *v83;
        uint64_t v69 = v86;
        (*v83)(v5, v86);
        v68(v7, v69);
      }
    }
    else
    {
      if (qword_26B38C970 != -1) {
        swift_once();
      }
      uint64_t v59 = (void *)qword_26B38C968;
      sub_25E4BD2E8();
      uint64_t v60 = swift_allocObject();
      *(_OWORD *)(v60 + 16) = v81;
      sub_25E4D7928(&qword_26B38C310, MEMORY[0x263F06EA8]);
      id v61 = v59;
      uint64_t v62 = v86;
      uint64_t v63 = sub_25E4DAF90();
      uint64_t v65 = v64;
      *(void *)(v60 + 56) = MEMORY[0x263F8D310];
      *(void *)(v60 + 64) = sub_25E4BBA04();
      *(void *)(v60 + 32) = v63;
      *(void *)(v60 + 40) = v65;
      sub_25E4DADE0();
      sub_25E4DAA90();

      swift_bridgeObjectRelease();
      uint64_t v66 = *v83;
      (*v83)(v5, v62);
      v66(v7, v62);
      unint64_t v14 = v84;
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E4D43FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25E4D81AC(0, &qword_26B38C320, (uint64_t (*)(uint64_t))sub_25E4D79B4, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v17 - v5;
  uint64_t v7 = sub_25E4DA130();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D79B4(0);
  uint64_t v12 = v11;
  sub_25E4DA6A0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v6, 1, v12);
  if (result == 1)
  {
    __break(1u);
  }
  else if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_25E4D7B2C((uint64_t)v6);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(void *)(a2 + 48) = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_25E4DA050();
    swift_allocObject();
    sub_25E4DA040();
    uint64_t v14 = sub_25E4DA140();
    unint64_t v16 = v15;
    sub_25E4BF810();
    sub_25E4DA030();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_25E4BE838(v14, v16);
    uint64_t result = swift_release();
    *(void *)a2 = v17[3];
    *(_OWORD *)(a2 + 8) = v18;
    *(_OWORD *)(a2 + 24) = v19;
    *(_OWORD *)(a2 + 40) = v20;
  }
  return result;
}

uint64_t sub_25E4D4818@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v105 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_25E4DA0C0();
  unint64_t v4 = *(void *)(v3 - 8);
  uint64_t v91 = v3;
  unint64_t v92 = v4;
  MEMORY[0x270FA5388](v3);
  unint64_t v90 = (char *)v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E4DA130();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v85 = (char *)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v89 = (char *)v79 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v93 = (char *)v79 - v13;
  sub_25E4D79B4(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v101 = (void (*)(void))((char *)v79 - v19);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v79 - v20;
  sub_25E4D81AC(0, &qword_26B38CC90, MEMORY[0x263F06EA8], MEMORY[0x263F8E0F8]);
  unint64_t v22 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v102 = *(void *)(v7 + 72);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_25E4DC190;
  uint64_t v24 = a1[3];
  uint64_t v100 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  uint64_t v25 = v8;
  sub_25E4DA6A0();
  uint64_t v26 = v8 + 48;
  id v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v27(v21, 1, v6) == 1)
  {
    __break(1u);
LABEL_32:
    __break(1u);
  }
  uint64_t v83 = v23;
  unint64_t v87 = v22;
  uint64_t v88 = v25;
  uint64_t v28 = *(void (**)(void))(v25 + 32);
  unint64_t v86 = v23 + v22;
  v28();
  __swift_project_boxed_opaque_existential_1(v100, v100[3]);
  uint64_t v29 = v101;
  sub_25E4DA6A0();
  uint64_t v94 = v27;
  unsigned int v30 = v27((char *)v29, 1, v6);
  uint64_t v95 = v26;
  if (v30 == 1) {
    goto LABEL_32;
  }
  unint64_t v31 = v86;
  unint64_t v82 = v86 + v102;
  uint64_t v100 = (void *)(v25 + 32);
  uint64_t v101 = v28;
  v28();
  uint64_t v104 = (char *)MEMORY[0x263F8EE78];
  sub_25E4C8E68(0, 2, 0);
  uint64_t v33 = v88;
  uint64_t v32 = v89;
  uint64_t v34 = *MEMORY[0x263F06E38];
  uint64_t v98 = *(void (**)(char *, unint64_t, uint64_t))(v88 + 16);
  uint64_t v99 = v88 + 16;
  v98(v89, v31, v6);
  unint64_t v35 = v92;
  uint64_t v36 = *(void (**)(char *, void, uint64_t))(v92 + 104);
  strcpy((char *)v103, "configuration");
  v103[7] = -4864;
  uint64_t v37 = v90;
  unsigned int v81 = v34;
  uint64_t v38 = v91;
  uint64_t v80 = v36;
  v36(v90, v34, v91);
  v79[1] = sub_25E4D7AD8();
  sub_25E4DA120();
  long long v39 = *(void (**)(char *, uint64_t))(v35 + 8);
  unint64_t v92 = v35 + 8;
  v39(v37, v38);
  swift_bridgeObjectRelease();
  double v96 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v97 = v33 + 8;
  v96(v32, v6);
  uint64_t v40 = v104;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_25E4C8E68(0, *((void *)v40 + 2) + 1, 1);
    uint64_t v40 = v104;
  }
  unint64_t v41 = v87;
  unint64_t v43 = *((void *)v40 + 2);
  unint64_t v42 = *((void *)v40 + 3);
  if (v43 >= v42 >> 1)
  {
    sub_25E4C8E68(v42 > 1, v43 + 1, 1);
    uint64_t v40 = v104;
  }
  *((void *)v40 + 2) = v43 + 1;
  ((void (*)(char *, char *, uint64_t))v101)(&v40[v41 + v43 * v102], v93, v6);
  uint64_t v104 = v40;
  unint64_t v44 = v89;
  v98(v89, v82, v6);
  strcpy((char *)v103, "configuration");
  v103[7] = -4864;
  unint64_t v46 = v90;
  uint64_t v45 = v91;
  v80(v90, v81, v91);
  sub_25E4DA120();
  v39(v46, v45);
  swift_bridgeObjectRelease();
  v96(v44, v6);
  id v47 = v104;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_25E4C8E68(0, *((void *)v47 + 2) + 1, 1);
    id v47 = v104;
  }
  uint64_t v48 = v85;
  unint64_t v50 = *((void *)v47 + 2);
  unint64_t v49 = *((void *)v47 + 3);
  uint64_t v51 = v101;
  if (v50 >= v49 >> 1)
  {
    sub_25E4C8E68(v49 > 1, v50 + 1, 1);
    id v47 = v104;
  }
  *((void *)v47 + 2) = v50 + 1;
  unint64_t v52 = &v47[v87];
  ((void (*)(char *, char *, uint64_t))v51)(&v47[v87 + v50 * v102], v93, v6);
  uint64_t v104 = v47;
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v93 = v47;
  uint64_t v53 = *((void *)v47 + 2);
  unint64_t v54 = v88 + 56;
  if (v53)
  {
    unint64_t v92 = v54 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      v98(v17, (unint64_t)v52, v6);
      uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))v54;
      (*(void (**)(char *, void, uint64_t, uint64_t))v54)(v17, 0, 1, v6);
      if (v94(v17, 1, v6) == 1) {
        break;
      }
      ((void (*)(char *, char *, uint64_t))v101)(v48, v17, v6);
      LOBYTE(v103[0]) = 0;
      id v56 = objc_msgSend(self, sel_defaultManager);
      sub_25E4DA110();
      unint64_t v57 = (void *)sub_25E4DAC70();
      swift_bridgeObjectRelease();
      unsigned int v58 = objc_msgSend(v56, sel_fileExistsAtPath_isDirectory_, v57, v103);

      if (v58)
      {
        swift_release();
        if (v103[0])
        {
          uint64_t v64 = v84;
          uint64_t v65 = v85;
          if (qword_26B38C970 != -1) {
            swift_once();
          }
          id v66 = (id)qword_26B38C968;
          sub_25E4DADD0();
          sub_25E4BD2E8();
          uint64_t v67 = swift_allocObject();
          *(_OWORD *)(v67 + 16) = xmmword_25E4DB670;
          sub_25E4D7928(&qword_26B38C310, MEMORY[0x263F06EA8]);
          uint64_t v68 = sub_25E4DAF90();
          uint64_t v70 = v69;
          *(void *)(v67 + 56) = MEMORY[0x263F8D310];
          *(void *)(v67 + 64) = sub_25E4BBA04();
          *(void *)(v67 + 32) = v68;
          *(void *)(v67 + 40) = v70;
          sub_25E4DAA90();

          swift_bridgeObjectRelease();
          v96(v65, v6);
          uint64_t v61 = v64;
          goto LABEL_22;
        }
        uint64_t v71 = v84;
        uint64_t v72 = v85;
        if (qword_26B38C970 != -1) {
          swift_once();
        }
        uint64_t v73 = (void *)qword_26B38C968;
        sub_25E4BD2E8();
        uint64_t v74 = swift_allocObject();
        *(_OWORD *)(v74 + 16) = xmmword_25E4DB670;
        sub_25E4D7928(&qword_26B38C310, MEMORY[0x263F06EA8]);
        id v75 = v73;
        uint64_t v76 = sub_25E4DAF90();
        uint64_t v78 = v77;
        *(void *)(v74 + 56) = MEMORY[0x263F8D310];
        *(void *)(v74 + 64) = sub_25E4BBA04();
        *(void *)(v74 + 32) = v76;
        *(void *)(v74 + 40) = v78;
        sub_25E4DADE0();
        sub_25E4DAA90();

        swift_bridgeObjectRelease();
        ((void (*)(uint64_t, char *, uint64_t))v101)(v71, v72, v6);
        uint64_t v61 = v71;
        uint64_t v62 = 0;
        return v55(v61, v62, 1, v6);
      }
      v96(v48, v6);
      v52 += v102;
      if (!--v53) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))v54;
LABEL_18:
    v55((uint64_t)v17, 1, 1, v6);
  }
  uint64_t v59 = v84;
  swift_release();
  if (qword_26B38C970 != -1) {
    swift_once();
  }
  id v60 = (id)qword_26B38C968;
  sub_25E4DADE0();
  sub_25E4DAA90();

  uint64_t v61 = v59;
LABEL_22:
  uint64_t v62 = 1;
  return v55(v61, v62, 1, v6);
}

void *sub_25E4D53CC(void *a1)
{
  return sub_25E4D5408(a1, (SEL *)&selRef_tabiResourcesContentDirectoryLegacy);
}

void *sub_25E4D53D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E4D54F4(a1, 0x7365722D69626174, 0xEE0073656372756FLL, a2);
}

void *sub_25E4D53FC(void *a1)
{
  return sub_25E4D5408(a1, (SEL *)&selRef_tabiModelsContentDirectoryLegacy);
}

void *sub_25E4D5408(void *a1, SEL *a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D7D28(0, (unint64_t *)&unk_26B38CBF0);
  uint64_t result = (void *)sub_25E4DA6B0();
  if (result)
  {
    id v4 = [result *a2];
    swift_unknownObjectRelease();
    sub_25E4DAC80();

    sub_25E4DA0E0();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_25E4D54D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E4D54F4(a1, 0x646F6D2D69626174, 0xEB00000000736C65, a2);
}

void *sub_25E4D54F4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v17[0] = a3;
  v17[1] = a4;
  uint64_t v6 = sub_25E4DA0C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25E4DA130();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D834C(0, &qword_26B38CBE8);
  uint64_t result = (void *)sub_25E4DA6B0();
  if (result)
  {
    uint64_t v15 = result;
    id v16 = objc_msgSend(result, sel_privateDataDirectory);

    sub_25E4DAC80();
    sub_25E4DA0D0();
    swift_bridgeObjectRelease();
    v17[2] = a2;
    v17[3] = v17[0];
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F06E30], v6);
    sub_25E4D7AD8();
    sub_25E4DA120();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4D5754(void *a1)
{
  sub_25E4D79B4(0);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v5 = sub_25E4DA130();
  sub_25E4DA6A0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_25E4BB9B4(0, &qword_26B38C398);
    uint64_t result = sub_25E4DA6C0();
    if (v11)
    {
      type metadata accessor for TabiConfigurationManager();
      uint64_t v8 = swift_allocObject();
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v8 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_bundledConfigurationURL, v4, v5);
      sub_25E4BB880(&v10, v8 + OBJC_IVAR____TtC21StocksPersonalization24TabiConfigurationManager_configurationManager);
      return v8;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4D591C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E4D5C7C(a1, 0x72756769666E6F63, 0xED00006E6F697461, MEMORY[0x263F06E38], a2);
}

uint64_t sub_25E4D5948()
{
  uint64_t v0 = sub_25E4DA0C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25E4DA130();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4D79B4(0);
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4DA880();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v13 = objc_msgSend(v12, sel_resourceURL);

  if (v13)
  {
    sub_25E4DA100();

    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
    if (result != 1)
    {
      v15[0] = 0xD000000000000016;
      v15[1] = 0x800000025E4DD390;
      (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06E30], v0);
      sub_25E4D7AD8();
      sub_25E4DA120();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4D5C5C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E4D5C7C(a1, 0x736567616B636170, 0xE800000000000000, MEMORY[0x263F06E30], a2);
}

uint64_t sub_25E4D5C7C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v18[0] = a4;
  v18[1] = a5;
  uint64_t v8 = sub_25E4DA0C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4D79B4(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v15 = sub_25E4DA130();
  sub_25E4DA6A0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    v18[2] = a2;
    void v18[3] = a3;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *(unsigned int *)v18[0], v8);
    sub_25E4D7AD8();
    sub_25E4DA120();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v14, v15);
  }
  return result;
}

uint64_t sub_25E4D5EB4(void *a1)
{
  sub_25E4D79B4(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v5 = sub_25E4DA130();
  sub_25E4DA6A0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_25E4BB9B4(0, &qword_26B38CB78);
    uint64_t result = sub_25E4DA6C0();
    if (v7[4])
    {
      sub_25E4DA940();
      swift_allocObject();
      return sub_25E4DA930();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4D602C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, (unint64_t *)&unk_26B38C408);
  uint64_t result = sub_25E4DA6C0();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for StocksTabiArticleFeaturesFactory();
    uint64_t v5 = swift_allocObject();
    uint64_t result = sub_25E4BB880(&v6, v5 + 16);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_270B2D580;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_25E4D60DC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for TabiConfigurationManager();
  id result = (id)sub_25E4DA6B0();
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_25E4D77EC();
    id result = (id)sub_25E4DA6B0();
    if (result)
    {
      uint64_t v4 = (uint64_t)result;
      id v5 = objc_allocWithZone((Class)type metadata accessor for StocksTabiWorkServiceUnloaderService());
      return sub_25E4BC8BC(v3, v4);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4D6198@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E4D61B8(a1, MEMORY[0x263F59F60], MEMORY[0x263F59F50], a2);
}

uint64_t sub_25E4D61B8@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = a2(0);
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    a4[3] = v7;
    a4[4] = a3;
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4D623C(uint64_t a1)
{
  return sub_25E4D65A8(a1, MEMORY[0x263F59F60], MEMORY[0x263F59F58]);
}

uint64_t sub_25E4D6268(void *a1)
{
  return sub_25E4D63A8(a1, MEMORY[0x263F59F70], (void (*)(void))type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory);
}

uint64_t sub_25E4D6294(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C418);
  uint64_t result = sub_25E4DA6C0();
  if (v4)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_25E4BB9B4(0, &qword_26B38C3F0);
    uint64_t result = sub_25E4DA6C0();
    if (v3)
    {
      sub_25E4DAA70();
      swift_allocObject();
      return sub_25E4DAA60();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4D637C(void *a1)
{
  return sub_25E4D63A8(a1, (void (*)(void))sub_25E4D77EC, (void (*)(void))type metadata accessor for StocksTabiWorkServiceStartupTask);
}

uint64_t sub_25E4D63A8(void *a1, void (*a2)(void), void (*a3)(void))
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a2(0);
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    uint64_t v6 = result;
    a3(0);
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4D6434(uint64_t a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v2 = type metadata accessor for StocksTabiWorkServiceStartupTask();
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    uint64_t v4 = result;
    v5[3] = v2;
    v5[4] = sub_25E4D7928(&qword_26B38C800, (void (*)(uint64_t))type metadata accessor for StocksTabiWorkServiceStartupTask);
    v5[0] = v4;
    sub_25E4DA760();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4D64FC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4D77EC();
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    sub_25E4D79E8();
    swift_allocObject();
    return sub_25E4DA8E0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4D657C(uint64_t a1)
{
  return sub_25E4D65A8(a1, (void (*)(void))sub_25E4D7A7C, MEMORY[0x263F7CAC8]);
}

uint64_t sub_25E4D65A8(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_25E4D65EC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C388);
  uint64_t result = sub_25E4DA6C0();
  if (!v15)
  {
    __break(1u);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C380);
  uint64_t result = sub_25E4DA6C0();
  if (!v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C398);
  uint64_t result = sub_25E4DA6C0();
  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E4BB9B4(0, &qword_26B38C390);
  uint64_t result = sub_25E4DA6C0();
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for StocksTabiUserEventHistoryScoringService();
  uint64_t result = sub_25E4DA6B0();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = type metadata accessor for NewsHeadlineScorerFactory();
    uint64_t v7 = swift_allocObject();
    sub_25E4BB880(&v14, v7 + 16);
    sub_25E4BB880(&v12, v7 + 56);
    sub_25E4BB880(&v10, v7 + 96);
    sub_25E4BB880(&v8, v7 + 136);
    *(void *)(v7 + 176) = v5;
    a2[3] = v6;
    uint64_t result = sub_25E4D7928(&qword_26B38CAA8, (void (*)(uint64_t))type metadata accessor for NewsHeadlineScorerFactory);
    a2[4] = result;
    *a2 = v7;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25E4D681C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StocksTabiAssembly()
{
  return self;
}

uint64_t sub_25E4D6854(uint64_t a1)
{
  uint64_t v34 = sub_25E4DA6D0();
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v33 = (char *)v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25E4DA7F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4DA700();
  sub_25E4D77EC();
  sub_25E4DA7A0();
  swift_release();
  long long v8 = *(void (**)(void))(v4 + 104);
  unsigned int v37 = *MEMORY[0x263F7D010];
  uint64_t v7 = v37;
  ((void (*)(char *, void, uint64_t))v8)(v6, v37, v3);
  sub_25E4DA690();
  swift_release();
  swift_release();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v4 + 8);
  v9(v6, v3);
  sub_25E4DA710();
  type metadata accessor for StocksTabiUserEventHistoryScoringService();
  sub_25E4DA7A0();
  swift_release();
  ((void (*)(char *, uint64_t, uint64_t))v8)(v6, v7, v3);
  uint64_t v10 = v4 + 104;
  sub_25E4DA690();
  swift_release();
  swift_release();
  v9(v6, v3);
  uint64_t v40 = v4 + 8;
  unint64_t v41 = v9;
  sub_25E4DA700();
  sub_25E4BB9B4(0, &qword_26B38C3A8);
  sub_25E4DA7B0();
  swift_release();
  swift_release();
  sub_25E4DA700();
  sub_25E4BB9B4(0, &qword_26B38C960);
  sub_25E4DA7B0();
  swift_release();
  unsigned int v36 = *MEMORY[0x263F7D000];
  v8(v6);
  long long v39 = (void (*)(char *, uint64_t, uint64_t))v8;
  sub_25E4DA690();
  swift_release();
  swift_release();
  v9(v6, v3);
  sub_25E4DA710();
  sub_25E4D7970();
  sub_25E4DA7B0();
  swift_release();
  swift_release();
  sub_25E4DA710();
  sub_25E4D8304(0, &qword_26B38C9B0);
  sub_25E4DA7B0();
  swift_release();
  swift_release();
  sub_25E4DA710();
  sub_25E4D79B4(0);
  sub_25E4DA7B0();
  swift_release();
  swift_release();
  uint64_t v35 = a1;
  sub_25E4DA710();
  uint64_t v11 = sub_25E4DA130();
  sub_25E4DA7B0();
  swift_release();
  uint64_t v12 = v36;
  uint64_t v38 = v10;
  ((void (*)(char *, void, uint64_t))v8)(v6, v36, v3);
  sub_25E4DA690();
  swift_release();
  swift_release();
  uint64_t v13 = v41;
  v41(v6, v3);
  sub_25E4DA710();
  sub_25E4DA7B0();
  swift_release();
  long long v14 = v39;
  v39(v6, v12, v3);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v13(v6, v3);
  sub_25E4DA710();
  sub_25E4DA7B0();
  swift_release();
  v14(v6, v12, v3);
  sub_25E4DA690();
  swift_release();
  swift_release();
  uint64_t v15 = v41;
  v41(v6, v3);
  sub_25E4DA710();
  v31[1] = v11;
  sub_25E4DA7B0();
  swift_release();
  uint64_t v16 = v39;
  v39(v6, v36, v3);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v15(v6, v3);
  sub_25E4DA710();
  type metadata accessor for TabiConfigurationManager();
  sub_25E4DA7A0();
  swift_release();
  uint64_t v17 = v37;
  v16(v6, v37, v3);
  sub_25E4DA690();
  swift_release();
  swift_release();
  uint64_t v18 = v3;
  v15(v6, v3);
  uint64_t v19 = v15;
  sub_25E4DA710();
  sub_25E4DA7B0();
  swift_release();
  v31[0] = v18;
  uint64_t v20 = v39;
  v39(v6, v17, v18);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v19(v6, v18);
  sub_25E4DA710();
  sub_25E4DA7B0();
  swift_release();
  uint64_t v21 = v37;
  uint64_t v22 = v31[0];
  v20(v6, v37, v31[0]);
  sub_25E4DA690();
  swift_release();
  swift_release();
  uint64_t v23 = v41;
  v41(v6, v22);
  sub_25E4DA710();
  sub_25E4DA7B0();
  swift_release();
  v20(v6, v21, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v23(v6, v22);
  sub_25E4DA710();
  sub_25E4DA940();
  sub_25E4DA7A0();
  swift_release();
  v20(v6, v21, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v23(v6, v22);
  sub_25E4DA710();
  sub_25E4BB9B4(0, &qword_26B38C8B0);
  sub_25E4DA7B0();
  swift_release();
  swift_release();
  sub_25E4DA710();
  type metadata accessor for StocksTabiWorkServiceUnloaderService();
  sub_25E4DA7A0();
  swift_release();
  v20(v6, v36, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v23(v6, v22);
  sub_25E4DA710();
  sub_25E4BB9B4(0, (unint64_t *)&unk_26B38C408);
  sub_25E4DA7B0();
  swift_release();
  swift_release();
  sub_25E4DA710();
  sub_25E4DAA40();
  sub_25E4DA7A0();
  swift_release();
  swift_release();
  sub_25E4DA710();
  type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory();
  sub_25E4DA7A0();
  swift_release();
  v20(v6, v21, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v23(v6, v22);
  sub_25E4DA710();
  sub_25E4DAA70();
  sub_25E4DA7A0();
  swift_release();
  v20(v6, v21, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v23(v6, v22);
  sub_25E4DA710();
  type metadata accessor for StocksTabiWorkServiceStartupTask();
  sub_25E4DA7A0();
  swift_release();
  swift_release();
  sub_25E4DA720();
  __swift_project_boxed_opaque_existential_1(v42, v42[3]);
  sub_25E4DA770();
  uint64_t v24 = v32;
  uint64_t v25 = v33;
  uint64_t v26 = v34;
  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v33, *MEMORY[0x263F7CDE0], v34);
  sub_25E4DA7C0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  sub_25E4DA710();
  sub_25E4D79E8();
  sub_25E4DA7A0();
  swift_release();
  uint64_t v27 = v37;
  uint64_t v28 = v39;
  v39(v6, v37, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  uint64_t v29 = v41;
  v41(v6, v22);
  sub_25E4DA710();
  sub_25E4D7A7C();
  sub_25E4DA7A0();
  swift_release();
  v28(v6, v27, v22);
  sub_25E4DA690();
  swift_release();
  swift_release();
  v29(v6, v22);
  sub_25E4DA700();
  sub_25E4BB9B4(0, &qword_26B38C3A0);
  sub_25E4DA7B0();
  swift_release();
  return swift_release();
}

void sub_25E4D77EC()
{
  if (!qword_26B38CB58)
  {
    type metadata accessor for TabiConfigurationManager();
    type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory();
    sub_25E4DA940();
    sub_25E4D7928(&qword_26B38C9E0, (void (*)(uint64_t))type metadata accessor for TabiConfigurationManager);
    sub_25E4D7928(&qword_26B38C8B8, (void (*)(uint64_t))type metadata accessor for StocksTabiUserEventHistoryFeaturesFactory);
    sub_25E4D7928(&qword_26B38C3E0, MEMORY[0x263F59EF8]);
    unint64_t v0 = sub_25E4DAAF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CB58);
    }
  }
}

uint64_t sub_25E4D7928(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25E4D7970()
{
  unint64_t result = qword_26B38CD18;
  if (!qword_26B38CD18)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_26B38CD18);
  }
  return result;
}

void sub_25E4D79B4(uint64_t a1)
{
}

void sub_25E4D79E8()
{
  if (!qword_26B38C3D0)
  {
    sub_25E4D77EC();
    sub_25E4D7928((unint64_t *)&unk_26B38CB48, (void (*)(uint64_t))sub_25E4D77EC);
    unint64_t v0 = sub_25E4DA8F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38C3D0);
    }
  }
}

void sub_25E4D7A7C()
{
  if (!qword_26B38CB60)
  {
    sub_25E4BBE5C();
    unint64_t v0 = sub_25E4DAB90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38CB60);
    }
  }
}

unint64_t sub_25E4D7AD8()
{
  unint64_t result = qword_26B38CB80;
  if (!qword_26B38CB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38CB80);
  }
  return result;
}

uint64_t sub_25E4D7B2C(uint64_t a1)
{
  sub_25E4D79B4(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_25E4D7B88()
{
  if (!qword_26B38C300)
  {
    sub_25E4DA130();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B38C300);
    }
  }
}

uint64_t sub_25E4D7BF0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25E4D7C28()
{
  return sub_25E4D3A88(*(void *)(v0 + 16));
}

uint64_t sub_25E4D7C30(uint64_t a1, uint64_t a2)
{
  sub_25E4D7B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4D7C94(uint64_t a1, uint64_t a2)
{
  sub_25E4D81AC(0, &qword_26B38C308, (uint64_t (*)(uint64_t))sub_25E4D7B88, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4D7D28(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id sub_25E4D7D7C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_25E4DA780();
  MEMORY[0x270FA5388](v9);
  v31[3] = type metadata accessor for StocksTabiArticleFeaturesFactory();
  v31[4] = &off_270B2D580;
  v31[0] = a3;
  uint64_t v10 = OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_prepareForUseDeduper;
  v29[0] = MEMORY[0x263F8EE78];
  sub_25E4D7928(&qword_26B38C3C0, MEMORY[0x263F7CF38]);
  sub_25E4D81AC(0, &qword_26B38CBA8, MEMORY[0x263F7CF38], MEMORY[0x263F8D488]);
  sub_25E4D8210();
  uint64_t v11 = a6;
  sub_25E4DAE60();
  sub_25E4D8298();
  swift_allocObject();
  *(void *)&a6[v10] = sub_25E4DA6E0();
  sub_25E4D834C(0, (unint64_t *)&qword_26B38CC40);
  uint64_t v12 = (void *)sub_25E4DAE20();
  sub_25E4DADC0();
  sub_25E4DAA90();

  uint64_t v13 = (char *)objc_msgSend(a1, sel_cachedSubscription);
  if (objc_getAssociatedObject(v13, v13 + 1))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  sub_25E4B9628((uint64_t)&v27, (uint64_t)v29);
  if (!v30)
  {
    sub_25E4B96E8((uint64_t)v29);
    goto LABEL_9;
  }
  sub_25E4D834C(0, (unint64_t *)&qword_26B38CC30);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    long long v14 = 0;
    unint64_t v15 = 0;
    goto LABEL_10;
  }
  long long v14 = v25;
  unint64_t v15 = (unint64_t)objc_msgSend(v25, sel_integerValue);
  if (v15 == -1) {
    goto LABEL_17;
  }
LABEL_10:
  if (objc_getAssociatedObject(v13, (const void *)~v15))
  {
    sub_25E4DAE50();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  sub_25E4B9628((uint64_t)&v27, (uint64_t)v29);
  if (!v30)
  {
    sub_25E4B96E8((uint64_t)v29);
    goto LABEL_17;
  }
  sub_25E4D834C(0, (unint64_t *)&qword_26B38CC30);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_17:

    char v18 = -53;
    goto LABEL_18;
  }
  id v16 = v25;
  unsigned __int8 v17 = objc_msgSend(v16, sel_integerValue);

  char v18 = v17 - 53;
LABEL_18:
  v11[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_isSubscribed] = ((v15 + 1) ^ v18) & 1;
  *(void *)&v11[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_workService] = a2;
  sub_25E4BB488((uint64_t)v31, (uint64_t)&v11[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_articleFeaturesFactory]);
  sub_25E4BB488(a4, (uint64_t)&v11[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_userEmbeddingProvider]);
  *(void *)&v11[OBJC_IVAR____TtC21StocksPersonalization40StocksTabiUserEventHistoryScoringService_paidAccessChecker] = a5;
  swift_retain();
  swift_unknownObjectRetain();

  v26.receiver = v11;
  v26.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v26, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return v19;
}

void sub_25E4D81AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_25E4D8210()
{
  unint64_t result = qword_26B38CBB0;
  if (!qword_26B38CBB0)
  {
    sub_25E4D81AC(255, &qword_26B38CBA8, MEMORY[0x263F7CF38], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B38CBB0);
  }
  return result;
}

void sub_25E4D8298()
{
  if (!qword_26B38C3B8)
  {
    unint64_t v0 = sub_25E4DA6F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B38C3B8);
    }
  }
}

void sub_25E4D8304(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_25E4DAE40();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_25E4D834C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25E4D8388()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E4D83C0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for StocksTabiScoringContextEventProcessor()
{
  uint64_t result = qword_26A6F2CD0;
  if (!qword_26A6F2CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4D8434()
{
  uint64_t result = sub_25E4DAA20();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25E4DA130();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_25E4D8520(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_25E4DAC00();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v30 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E4DAC20();
  uint64_t v29 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4D9C74();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_25E4DAB40();
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v25 = v8;
    id v16 = v2;
    uint64_t v26 = *(void *)&v2[qword_26A6F2CC8];
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    unint64_t v18 = (v12 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = v6;
    uint64_t v19 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v19 + v17, v13, v10);
    *(void *)(v19 + v18) = v16;
    *(void *)(v19 + ((v18 + 15) & 0xFFFFFFFFFFFFFFF8)) = v15;
    aBlock[4] = sub_25E4D9DC4;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E4D8EFC;
    aBlock[3] = &block_descriptor_9;
    uint64_t v20 = _Block_copy(aBlock);
    id v21 = v16;
    swift_retain();
    uint64_t v22 = v25;
    sub_25E4DAC10();
    uint64_t v31 = MEMORY[0x263F8EE78];
    sub_25E4D9F54(&qword_26A6F2D40, MEMORY[0x263F8F030]);
    sub_25E4D9E5C(0, &qword_26A6F2D48, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    sub_25E4D9BEC();
    uint64_t v23 = v30;
    sub_25E4DAE60();
    MEMORY[0x2611DA690](0, v22, v23, v20);
    _Block_release(v20);
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v4);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v27);
    return swift_release();
  }
  return result;
}

uint64_t sub_25E4D8908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v38[1] = a3;
  uint64_t v41 = a2;
  uint64_t v4 = sub_25E4DA1D0();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for StocksTabiArticleScoringWork();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v45 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4D9E5C(0, &qword_26A6F2D78, MEMORY[0x263F58948], MEMORY[0x263F8D8F0]);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  long long v14 = (char *)v38 - v13;
  uint64_t v48 = sub_25E4DAA10();
  uint64_t v46 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  unint64_t v44 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4D9EC0();
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_25E4DA650();
  uint64_t v47 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v22 = (char *)v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4D9C74();
  uint64_t v43 = v23;
  v38[2] = a1;
  sub_25E4DAB30();
  sub_25E4DAB70();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v24 = sub_25E4DA640();
  sub_25E4DA630();
  uint64_t v25 = sub_25E4DA680();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v14, 1, v25);
  unint64_t v50 = v6;
  uint64_t v42 = v24;
  if (v28 == 1)
  {
    sub_25E4D9F9C((uint64_t)v14);
  }
  else
  {
    sub_25E4DA670();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v25);
  }
  uint64_t v29 = v39;
  sub_25E4DA630();
  if (v27(v12, 1, v25) == 1)
  {
    sub_25E4D9F9C((uint64_t)v12);
  }
  else
  {
    sub_25E4DA660();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v25);
  }
  uint64_t v31 = v40;
  uint64_t v30 = v41;
  swift_retain();
  uint64_t v32 = v44;
  sub_25E4DAA00();
  uint64_t v33 = (uint64_t)v45;
  sub_25E4DAB50();
  uint64_t v34 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v50, v33, v31);
  sub_25E4BB8F0(v33);
  sub_25E4DA1B0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v34, v31);
  swift_beginAccess();
  sub_25E4DA9F0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v32, v48);
  uint64_t v35 = (void **)(v30 + qword_26A6F2CC0);
  swift_beginAccess();
  unsigned int v36 = *v35;
  if (v36)
  {
    swift_endAccess();
    objc_msgSend(v36, sel_tickle);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v22, v49);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v49);
    return swift_endAccess();
  }
}

uint64_t sub_25E4D8EFC(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_25E4D8F40()
{
}

void sub_25E4D8F70()
{
  uint64_t v1 = v0 + qword_26A6F2CB0;
  uint64_t v2 = sub_25E4DAA20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + qword_26A6F2CB8;
  uint64_t v4 = sub_25E4DA130();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(void **)(v0 + qword_26A6F2CC8);
}

void sub_25E4D9040(uint64_t a1)
{
  uint64_t v2 = a1 + qword_26A6F2CB0;
  uint64_t v3 = sub_25E4DAA20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = a1 + qword_26A6F2CB8;
  uint64_t v5 = sub_25E4DA130();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  uint64_t v6 = *(void **)(a1 + qword_26A6F2CC8);
}

uint64_t sub_25E4D9114()
{
  return type metadata accessor for StocksTabiScoringContextEventProcessor();
}

uint64_t sub_25E4D911C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_25E4DA080();
  swift_allocObject();
  sub_25E4DA070();
  sub_25E4DAA20();
  sub_25E4D9F54((unint64_t *)&unk_26A6F2D58, MEMORY[0x263F59F38]);
  uint64_t v4 = sub_25E4DA060();
  uint64_t v5 = MEMORY[0x263F8D310];
  uint64_t v6 = v4;
  unint64_t v8 = v7;
  swift_release();
  if (qword_26B38CAC0 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_26B38CAB0;
  sub_25E4BD2E8();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25E4DB670;
  uint64_t v11 = (void *)v10;
  uint64_t v12 = 0;
  switch(v8 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v6), v6))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x25E4D95A4);
      }
      uint64_t v12 = HIDWORD(v6) - (int)v6;
LABEL_8:
      uint64_t v25 = a3;
      uint64_t v15 = self;
      id v16 = v9;
      id v17 = objc_msgSend(v15, sel_stringFromByteCount_countStyle_, v12, 0);
      sub_25E4DAC80();

      sub_25E4DACE0();
      swift_bridgeObjectRelease();
      v11[7] = v5;
      unint64_t v18 = sub_25E4BBA04();
      v11[8] = v18;
      v11[4] = 0;
      void v11[5] = 0xE000000000000000;
      sub_25E4DADE0();
      sub_25E4DAA90();

      swift_bridgeObjectRelease();
      sub_25E4DA170();
      uint64_t v20 = (void *)qword_26B38CAB0;
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_25E4DB670;
      sub_25E4DA130();
      sub_25E4D9F54(&qword_26B38C310, MEMORY[0x263F06EA8]);
      id v22 = v20;
      uint64_t v23 = sub_25E4DAF90();
      *(void *)(v21 + 56) = MEMORY[0x263F8D310];
      *(void *)(v21 + 64) = v18;
      *(void *)(v21 + 32) = v23;
      *(void *)(v21 + 40) = v24;
      sub_25E4DADE0();
      sub_25E4DAA90();

      swift_bridgeObjectRelease();
      sub_25E4BE838(v6, v8);
      return v25();
    case 2uLL:
      uint64_t v14 = *(void *)(v6 + 16);
      uint64_t v13 = *(void *)(v6 + 24);
      uint64_t v12 = v13 - v14;
      if (!__OFSUB__(v13, v14)) {
        goto LABEL_8;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_8;
    default:
      uint64_t v12 = BYTE6(v8);
      goto LABEL_8;
  }
}

uint64_t sub_25E4D95B4(void *a1, int a2, int a3, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  id v7 = a1;
  sub_25E4D969C((uint64_t)sub_25E4D968C, v6);
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t sub_25E4D9654()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25E4D968C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_25E4D969C(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v26 = sub_25E4DAC00();
  uint64_t v29 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25E4DAC20();
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25E4DAA20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *(void *)&v2[qword_26A6F2CC8];
  uint64_t v12 = &v2[qword_26A6F2CB0];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v12, v8);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v14 = (v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v13, v11, v8);
  *(void *)(v15 + v14) = v2;
  id v16 = (void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v17 = v24;
  *id v16 = v23;
  v16[1] = v17;
  aBlock[4] = sub_25E4D9B38;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E4D8EFC;
  aBlock[3] = &block_descriptor;
  unint64_t v18 = _Block_copy(aBlock);
  uint64_t v19 = v2;
  swift_retain();
  sub_25E4DAC10();
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_25E4D9F54(&qword_26A6F2D40, MEMORY[0x263F8F030]);
  sub_25E4D9E5C(0, &qword_26A6F2D48, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_25E4D9BEC();
  uint64_t v20 = v26;
  sub_25E4DAE60();
  MEMORY[0x2611DA690](0, v7, v4, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
  return swift_release();
}

uint64_t sub_25E4D9A78()
{
  uint64_t v1 = sub_25E4DAA20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  return MEMORY[0x270FA0238](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_25E4D9B38()
{
  uint64_t v1 = *(void *)(sub_25E4DAA20() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(uint64_t (**)(void))(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_25E4D911C(v0 + v2, v4, v5);
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

unint64_t sub_25E4D9BEC()
{
  unint64_t result = qword_26A6F2D50;
  if (!qword_26A6F2D50)
  {
    sub_25E4D9E5C(255, &qword_26A6F2D48, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F2D50);
  }
  return result;
}

void sub_25E4D9C74()
{
  if (!qword_26A6F2D68)
  {
    type metadata accessor for StocksTabiArticleScoringWork();
    sub_25E4D9F54((unint64_t *)&qword_26B38C600, (void (*)(uint64_t))type metadata accessor for StocksTabiArticleScoringWork);
    unint64_t v0 = sub_25E4DAB60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6F2D68);
    }
  }
}

uint64_t sub_25E4D9D08()
{
  sub_25E4D9C74();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  return MEMORY[0x270FA0238](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_25E4D9DC4()
{
  sub_25E4D9C74();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + v4);
  uint64_t v6 = *(void *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_25E4D8908(v0 + v3, v5, v6);
}

void sub_25E4D9E5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_25E4D9EC0()
{
  if (!qword_26A6F2D80)
  {
    sub_25E4DA900();
    sub_25E4D9F54(qword_26B38CD70, MEMORY[0x263F59EC8]);
    unint64_t v0 = sub_25E4DAB80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6F2D80);
    }
  }
}

uint64_t sub_25E4D9F54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E4D9F9C(uint64_t a1)
{
  sub_25E4D9E5C(0, &qword_26A6F2D78, MEMORY[0x263F58948], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E4DA030()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25E4DA040()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25E4DA050()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25E4DA060()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25E4DA070()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25E4DA080()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25E4DA090()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_25E4DA0A0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_25E4DA0B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25E4DA0C0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25E4DA0D0()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_25E4DA0E0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25E4DA0F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25E4DA100()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25E4DA110()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25E4DA120()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_25E4DA130()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25E4DA140()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25E4DA150()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25E4DA160()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25E4DA170()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25E4DA180()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25E4DA190()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25E4DA1A0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25E4DA1B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25E4DA1C0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25E4DA1D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25E4DA1E0()
{
  return MEMORY[0x270F77F60]();
}

uint64_t sub_25E4DA1F0()
{
  return MEMORY[0x270F78068]();
}

uint64_t sub_25E4DA200()
{
  return MEMORY[0x270F78070]();
}

uint64_t sub_25E4DA210()
{
  return MEMORY[0x270F78078]();
}

uint64_t sub_25E4DA220()
{
  return MEMORY[0x270F78088]();
}

uint64_t sub_25E4DA230()
{
  return MEMORY[0x270F78090]();
}

uint64_t sub_25E4DA240()
{
  return MEMORY[0x270F78098]();
}

uint64_t sub_25E4DA250()
{
  return MEMORY[0x270F78130]();
}

uint64_t sub_25E4DA260()
{
  return MEMORY[0x270F78138]();
}

uint64_t sub_25E4DA270()
{
  return MEMORY[0x270F78140]();
}

uint64_t sub_25E4DA280()
{
  return MEMORY[0x270F78148]();
}

uint64_t sub_25E4DA290()
{
  return MEMORY[0x270F78150]();
}

uint64_t sub_25E4DA2A0()
{
  return MEMORY[0x270F78158]();
}

uint64_t sub_25E4DA2B0()
{
  return MEMORY[0x270F78160]();
}

uint64_t sub_25E4DA2C0()
{
  return MEMORY[0x270F78168]();
}

uint64_t sub_25E4DA2D0()
{
  return MEMORY[0x270F78170]();
}

uint64_t sub_25E4DA2E0()
{
  return MEMORY[0x270F78178]();
}

uint64_t sub_25E4DA2F0()
{
  return MEMORY[0x270F78180]();
}

uint64_t sub_25E4DA300()
{
  return MEMORY[0x270F78188]();
}

uint64_t sub_25E4DA310()
{
  return MEMORY[0x270F78190]();
}

uint64_t sub_25E4DA320()
{
  return MEMORY[0x270F78198]();
}

uint64_t sub_25E4DA330()
{
  return MEMORY[0x270F78210]();
}

uint64_t sub_25E4DA340()
{
  return MEMORY[0x270F78240]();
}

uint64_t sub_25E4DA350()
{
  return MEMORY[0x270F78398]();
}

uint64_t sub_25E4DA360()
{
  return MEMORY[0x270F783E0]();
}

uint64_t sub_25E4DA370()
{
  return MEMORY[0x270F783E8]();
}

uint64_t sub_25E4DA380()
{
  return MEMORY[0x270F783F0]();
}

uint64_t sub_25E4DA390()
{
  return MEMORY[0x270F78400]();
}

uint64_t sub_25E4DA3A0()
{
  return MEMORY[0x270F78408]();
}

uint64_t sub_25E4DA3B0()
{
  return MEMORY[0x270F78410]();
}

uint64_t sub_25E4DA3C0()
{
  return MEMORY[0x270F78418]();
}

uint64_t sub_25E4DA3D0()
{
  return MEMORY[0x270F78438]();
}

uint64_t sub_25E4DA3E0()
{
  return MEMORY[0x270F78440]();
}

uint64_t sub_25E4DA3F0()
{
  return MEMORY[0x270F78448]();
}

uint64_t sub_25E4DA400()
{
  return MEMORY[0x270F78458]();
}

uint64_t sub_25E4DA410()
{
  return MEMORY[0x270F78460]();
}

uint64_t sub_25E4DA420()
{
  return MEMORY[0x270F78468]();
}

uint64_t sub_25E4DA430()
{
  return MEMORY[0x270F78470]();
}

uint64_t sub_25E4DA440()
{
  return MEMORY[0x270F78478]();
}

uint64_t sub_25E4DA450()
{
  return MEMORY[0x270F78480]();
}

uint64_t sub_25E4DA460()
{
  return MEMORY[0x270F78488]();
}

uint64_t sub_25E4DA470()
{
  return MEMORY[0x270F78490]();
}

uint64_t sub_25E4DA480()
{
  return MEMORY[0x270F78498]();
}

uint64_t sub_25E4DA490()
{
  return MEMORY[0x270F784A0]();
}

uint64_t sub_25E4DA4A0()
{
  return MEMORY[0x270F784A8]();
}

uint64_t sub_25E4DA4B0()
{
  return MEMORY[0x270F784B0]();
}

uint64_t sub_25E4DA4C0()
{
  return MEMORY[0x270F784B8]();
}

uint64_t sub_25E4DA4D0()
{
  return MEMORY[0x270F784C0]();
}

uint64_t sub_25E4DA4E0()
{
  return MEMORY[0x270F784D8]();
}

uint64_t sub_25E4DA4F0()
{
  return MEMORY[0x270F784E0]();
}

uint64_t sub_25E4DA500()
{
  return MEMORY[0x270F784E8]();
}

uint64_t sub_25E4DA510()
{
  return MEMORY[0x270F784F0]();
}

uint64_t sub_25E4DA520()
{
  return MEMORY[0x270F784F8]();
}

uint64_t sub_25E4DA530()
{
  return MEMORY[0x270F78500]();
}

uint64_t sub_25E4DA540()
{
  return MEMORY[0x270F78510]();
}

uint64_t sub_25E4DA550()
{
  return MEMORY[0x270F78518]();
}

uint64_t sub_25E4DA560()
{
  return MEMORY[0x270F78650]();
}

uint64_t sub_25E4DA570()
{
  return MEMORY[0x270F78798]();
}

uint64_t sub_25E4DA580()
{
  return MEMORY[0x270F788A8]();
}

uint64_t sub_25E4DA590()
{
  return MEMORY[0x270F788B0]();
}

uint64_t sub_25E4DA5A0()
{
  return MEMORY[0x270F78970]();
}

uint64_t sub_25E4DA5B0()
{
  return MEMORY[0x270F78978]();
}

uint64_t sub_25E4DA5C0()
{
  return MEMORY[0x270F78988]();
}

uint64_t sub_25E4DA5D0()
{
  return MEMORY[0x270F78990]();
}

uint64_t sub_25E4DA5E0()
{
  return MEMORY[0x270F78998]();
}

uint64_t sub_25E4DA5F0()
{
  return MEMORY[0x270F789A0]();
}

uint64_t sub_25E4DA600()
{
  return MEMORY[0x270F78C40]();
}

uint64_t sub_25E4DA610()
{
  return MEMORY[0x270F78C60]();
}

uint64_t sub_25E4DA620()
{
  return MEMORY[0x270F78D08]();
}

uint64_t sub_25E4DA630()
{
  return MEMORY[0x270F4E770]();
}

uint64_t sub_25E4DA640()
{
  return MEMORY[0x270F4E778]();
}

uint64_t sub_25E4DA650()
{
  return MEMORY[0x270F4E780]();
}

uint64_t sub_25E4DA660()
{
  return MEMORY[0x270F4E788]();
}

uint64_t sub_25E4DA670()
{
  return MEMORY[0x270F4E790]();
}

uint64_t sub_25E4DA680()
{
  return MEMORY[0x270F4E798]();
}

uint64_t sub_25E4DA690()
{
  return MEMORY[0x270F79ED8]();
}

uint64_t sub_25E4DA6A0()
{
  return MEMORY[0x270F79FE8]();
}

uint64_t sub_25E4DA6B0()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_25E4DA6C0()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_25E4DA6D0()
{
  return MEMORY[0x270F7A040]();
}

uint64_t sub_25E4DA6E0()
{
  return MEMORY[0x270F7A0A8]();
}

uint64_t sub_25E4DA6F0()
{
  return MEMORY[0x270F7A0B8]();
}

uint64_t sub_25E4DA700()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_25E4DA710()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_25E4DA720()
{
  return MEMORY[0x270F7A0D0]();
}

uint64_t sub_25E4DA730()
{
  return MEMORY[0x270F7A118]();
}

uint64_t sub_25E4DA740()
{
  return MEMORY[0x270F7A1A0]();
}

uint64_t sub_25E4DA750()
{
  return MEMORY[0x270F7A1B0]();
}

uint64_t sub_25E4DA760()
{
  return MEMORY[0x270F7A390]();
}

uint64_t sub_25E4DA770()
{
  return MEMORY[0x270F7A3A0]();
}

uint64_t sub_25E4DA780()
{
  return MEMORY[0x270F7A3B0]();
}

uint64_t sub_25E4DA790()
{
  return MEMORY[0x270F7A3B8]();
}

uint64_t sub_25E4DA7A0()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_25E4DA7B0()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_25E4DA7C0()
{
  return MEMORY[0x270F7A480]();
}

uint64_t sub_25E4DA7D0()
{
  return MEMORY[0x270F7A498]();
}

uint64_t sub_25E4DA7E0()
{
  return MEMORY[0x270F7A4D0]();
}

uint64_t sub_25E4DA7F0()
{
  return MEMORY[0x270F7A560]();
}

uint64_t sub_25E4DA800()
{
  return MEMORY[0x270F7A580]();
}

uint64_t sub_25E4DA820()
{
  return MEMORY[0x270F7A600]();
}

uint64_t sub_25E4DA830()
{
  return MEMORY[0x270F7A608]();
}

uint64_t sub_25E4DA840()
{
  return MEMORY[0x270F7A610]();
}

uint64_t sub_25E4DA850()
{
  return MEMORY[0x270F7A690]();
}

uint64_t sub_25E4DA860()
{
  return MEMORY[0x270F7A698]();
}

uint64_t sub_25E4DA870()
{
  return MEMORY[0x270F7A6E0]();
}

uint64_t sub_25E4DA880()
{
  return MEMORY[0x270F50058]();
}

uint64_t sub_25E4DA890()
{
  return MEMORY[0x270F50060]();
}

uint64_t sub_25E4DA8A0()
{
  return MEMORY[0x270F50068]();
}

uint64_t sub_25E4DA8B0()
{
  return MEMORY[0x270F50070]();
}

uint64_t sub_25E4DA8C0()
{
  return MEMORY[0x270F50078]();
}

uint64_t sub_25E4DA8D0()
{
  return MEMORY[0x270F50080]();
}

uint64_t sub_25E4DA8E0()
{
  return MEMORY[0x270F50088]();
}

uint64_t sub_25E4DA8F0()
{
  return MEMORY[0x270F50090]();
}

uint64_t sub_25E4DA900()
{
  return MEMORY[0x270F50098]();
}

uint64_t sub_25E4DA910()
{
  return MEMORY[0x270F500B8]();
}

uint64_t sub_25E4DA920()
{
  return MEMORY[0x270F500C0]();
}

uint64_t sub_25E4DA930()
{
  return MEMORY[0x270F500C8]();
}

uint64_t sub_25E4DA940()
{
  return MEMORY[0x270F500D0]();
}

uint64_t sub_25E4DA950()
{
  return MEMORY[0x270F500D8]();
}

uint64_t sub_25E4DA960()
{
  return MEMORY[0x270F500E0]();
}

uint64_t sub_25E4DA970()
{
  return MEMORY[0x270F500E8]();
}

uint64_t sub_25E4DA980()
{
  return MEMORY[0x270F500F0]();
}

uint64_t sub_25E4DA990()
{
  return MEMORY[0x270F500F8]();
}

uint64_t sub_25E4DA9A0()
{
  return MEMORY[0x270F50100]();
}

uint64_t sub_25E4DA9B0()
{
  return MEMORY[0x270F50108]();
}

uint64_t sub_25E4DA9C0()
{
  return MEMORY[0x270F50118]();
}

uint64_t sub_25E4DA9D0()
{
  return MEMORY[0x270F50120]();
}

uint64_t sub_25E4DA9E0()
{
  return MEMORY[0x270F50128]();
}

uint64_t sub_25E4DA9F0()
{
  return MEMORY[0x270F50130]();
}

uint64_t sub_25E4DAA00()
{
  return MEMORY[0x270F50138]();
}

uint64_t sub_25E4DAA10()
{
  return MEMORY[0x270F50140]();
}

uint64_t sub_25E4DAA20()
{
  return MEMORY[0x270F50148]();
}

uint64_t sub_25E4DAA30()
{
  return MEMORY[0x270F50150]();
}

uint64_t sub_25E4DAA40()
{
  return MEMORY[0x270F50158]();
}

uint64_t sub_25E4DAA50()
{
  return MEMORY[0x270F50160]();
}

uint64_t sub_25E4DAA60()
{
  return MEMORY[0x270F50168]();
}

uint64_t sub_25E4DAA70()
{
  return MEMORY[0x270F50170]();
}

uint64_t sub_25E4DAA80()
{
  return MEMORY[0x270F50178]();
}

uint64_t sub_25E4DAA90()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25E4DAAA0()
{
  return MEMORY[0x270F79A98]();
}

uint64_t sub_25E4DAAB0()
{
  return MEMORY[0x270F79AA0]();
}

uint64_t sub_25E4DAAC0()
{
  return MEMORY[0x270F79AA8]();
}

uint64_t sub_25E4DAAD0()
{
  return MEMORY[0x270F79AB0]();
}

uint64_t sub_25E4DAAF0()
{
  return MEMORY[0x270F79AC0]();
}

uint64_t sub_25E4DAB00()
{
  return MEMORY[0x270F79AC8]();
}

uint64_t sub_25E4DAB10()
{
  return MEMORY[0x270F79AD0]();
}

uint64_t sub_25E4DAB20()
{
  return MEMORY[0x270F79AD8]();
}

uint64_t sub_25E4DAB30()
{
  return MEMORY[0x270F79AE0]();
}

uint64_t sub_25E4DAB40()
{
  return MEMORY[0x270F79AE8]();
}

uint64_t sub_25E4DAB50()
{
  return MEMORY[0x270F79AF0]();
}

uint64_t sub_25E4DAB60()
{
  return MEMORY[0x270F79AF8]();
}

uint64_t sub_25E4DAB70()
{
  return MEMORY[0x270F50180]();
}

uint64_t sub_25E4DAB80()
{
  return MEMORY[0x270F79B00]();
}

uint64_t sub_25E4DAB90()
{
  return MEMORY[0x270F79B08]();
}

uint64_t sub_25E4DABA0()
{
  return MEMORY[0x270F50188]();
}

uint64_t sub_25E4DABB0()
{
  return MEMORY[0x270F50190]();
}

uint64_t sub_25E4DABC0()
{
  return MEMORY[0x270F79B10]();
}

uint64_t sub_25E4DABD0()
{
  return MEMORY[0x270F50198]();
}

uint64_t sub_25E4DABE0()
{
  return MEMORY[0x270F79B18]();
}

uint64_t sub_25E4DABF0()
{
  return MEMORY[0x270F79B20]();
}

uint64_t sub_25E4DAC00()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25E4DAC10()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25E4DAC20()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25E4DAC30()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25E4DAC40()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25E4DAC50()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25E4DAC60()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25E4DAC70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E4DAC80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E4DAC90()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25E4DACA0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25E4DACB0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25E4DACC0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25E4DACD0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E4DACE0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E4DACF0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25E4DAD00()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25E4DAD20()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25E4DAD30()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25E4DAD40()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25E4DAD50()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25E4DAD60()
{
  return MEMORY[0x270F7A7C8]();
}

uint64_t sub_25E4DAD70()
{
  return MEMORY[0x270F501A0]();
}

uint64_t sub_25E4DAD80()
{
  return MEMORY[0x270F501A8]();
}

uint64_t sub_25E4DAD90()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25E4DADA0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25E4DADB0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25E4DADC0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25E4DADD0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25E4DADE0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25E4DADF0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25E4DAE00()
{
  return MEMORY[0x270F78DD8]();
}

uint64_t sub_25E4DAE10()
{
  return MEMORY[0x270F501B0]();
}

uint64_t sub_25E4DAE20()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_25E4DAE30()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25E4DAE40()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25E4DAE50()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25E4DAE60()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25E4DAE70()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25E4DAE80()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25E4DAE90()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E4DAEA0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E4DAEB0()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_25E4DAEC0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25E4DAED0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E4DAEE0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25E4DAEF0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25E4DAF00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E4DAF10()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_25E4DAF20()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25E4DAF30()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25E4DAF40()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25E4DAF50()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25E4DAF60()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25E4DAF70()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25E4DAF80()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25E4DAF90()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E4DAFA0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_25E4DAFB0()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25E4DAFC0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E4DAFD0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25E4DAFE0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E4DAFF0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E4DB000()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E4DB010()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25E4DB020()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E4DB030()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E4DB040()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25E4DB050()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25E4DB060()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t NPDeviceSupportsFeedPersonalization()
{
  return MEMORY[0x270F501B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
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