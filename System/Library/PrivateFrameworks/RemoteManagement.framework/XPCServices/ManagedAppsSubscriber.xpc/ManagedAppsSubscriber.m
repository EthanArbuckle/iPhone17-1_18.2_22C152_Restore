int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  sub_100002AE8(&qword_10001CC40);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100014660;
  *(void *)(v4 + 32) = type metadata accessor for ManagedAppsApplicator();
  sub_100002AE8(&qword_10001CC48);
  isa = sub_100013CF8().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for ManagedAppsStatus();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:swift_getObjCClassFromMetadata()];

  return 0;
}

uint64_t sub_100002AE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100002B2C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002B3C(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for RMStoreScope()
{
  if (!qword_10001CC50)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001CC50);
    }
  }
}

uint64_t sub_100002BA0()
{
  uint64_t v0 = sub_100013B68();
  sub_10000DB54(v0, qword_10001D3B0);
  sub_10000DA60(v0, (uint64_t)qword_10001D3B0);
  type metadata accessor for ManagedAppsAdapter();
  sub_100002AE8(&qword_10001CD48);
  sub_100013C38();
  return sub_100013B58();
}

void sub_100002C38(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t v5 = 0xD00000000000001DLL;
  unint64_t v6 = 0xD000000000000032;
  unint64_t v7 = 0x8000000100015090;
  unint64_t v8 = 0x8000000100015070;
  switch(a3)
  {
    case 1:
      sub_100013E78(25);
      swift_bridgeObjectRelease();
      v16._countAndFlagsBits = a1;
      v16._object = a2;
      sub_100013C68(v16);
      unint64_t v6 = 0xD000000000000017;
      unint64_t v7 = 0x8000000100015100;
      unint64_t v5 = 0xD000000000000022;
      v13 = "ManagedApps.ConfigurationIsInvalid";
      goto LABEL_11;
    case 2:
      sub_100013E78(17);
      swift_bridgeObjectRelease();
      unint64_t v11 = 0x2064696C61766E49;
      unint64_t v12 = 0xEF203A65706F6373;
      goto LABEL_5;
    case 3:
      sub_100013E78(35);
      swift_bridgeObjectRelease();
      v18._countAndFlagsBits = a1;
      v18._object = a2;
      sub_100013C68(v18);
      unint64_t v6 = 0xD000000000000021;
      unint64_t v7 = 0x8000000100015040;
      v13 = "ManagedApps.InvalidVPPLicense";
      goto LABEL_11;
    case 4:
      sub_100013E78(17);
      swift_bridgeObjectRelease();
      v19._countAndFlagsBits = a1;
      v19._object = a2;
      sub_100013C68(v19);
      unint64_t v6 = 0x20676E697373694DLL;
      unint64_t v7 = 0xEF203A7465737361;
      unint64_t v5 = 0xD000000000000018;
      v13 = "ManagedApps.AssetInvalid";
      goto LABEL_11;
    case 5:
      sub_100013E78(17);
      swift_bridgeObjectRelease();
      v20._countAndFlagsBits = a1;
      v20._object = a2;
      sub_100013C68(v20);
      unint64_t v6 = 0x2064696C61766E49;
      unint64_t v7 = 0xEF203A7465737361;
      unint64_t v5 = 0xD00000000000001CLL;
      v13 = "ManagedApps.AssetTypeInvalid";
      goto LABEL_11;
    case 6:
      swift_errorRetain();
      sub_100013E78(27);
      swift_bridgeObjectRelease();
      sub_10000E61C();
      v21._countAndFlagsBits = sub_1000137D8();
      sub_100013C68(v21);
      swift_bridgeObjectRelease();
      sub_10000E338(a1, (uint64_t)a2, 6);
      unint64_t v6 = 0xD000000000000019;
      unint64_t v7 = 0x8000000100014FC0;
      unint64_t v5 = 0xD000000000000021;
      v13 = "ManagedApps.AssetResolutionFailed";
      goto LABEL_11;
    case 7:
      swift_errorRetain();
      sub_100013E78(37);
      swift_bridgeObjectRelease();
      sub_10000E61C();
      v22._countAndFlagsBits = sub_1000137D8();
      sub_100013C68(v22);
      swift_bridgeObjectRelease();
      sub_10000E338(a1, (uint64_t)a2, 7);
      unint64_t v6 = 0xD000000000000023;
      unint64_t v7 = 0x8000000100014F60;
      unint64_t v5 = 0xD00000000000001BLL;
      v13 = "ManagedApps.AppConfigFailed";
LABEL_11:
      unint64_t v8 = (unint64_t)(v13 - 32) | 0x8000000000000000;
      break;
    case 8:
      break;
    default:
      sub_100013E78(18);
      swift_bridgeObjectRelease();
      unint64_t v11 = 0xD000000000000010;
      unint64_t v12 = 0x8000000100015120;
LABEL_5:
      unint64_t v14 = v11;
      unint64_t v15 = v12;
      v17._countAndFlagsBits = a1;
      v17._object = a2;
      sub_100013C68(v17);
      unint64_t v5 = 0;
      unint64_t v8 = 0;
      unint64_t v6 = v14;
      unint64_t v7 = v15;
      break;
  }
  *a4 = v5;
  a4[1] = v8;
  a4[2] = v6;
  a4[3] = v7;
  a4[4] = 0;
}

__n128 sub_10000303C@<Q0>(uint64_t a1@<X8>)
{
  sub_100002C38(*(void *)v1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16), (unint64_t *)v5);
  uint64_t v3 = v6;
  __n128 result = (__n128)v5[1];
  *(_OWORD *)a1 = v5[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_10000308C(uint64_t a1)
{
  unint64_t v2 = sub_10000E61C();

  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000030C8(uint64_t a1)
{
  unint64_t v2 = sub_10000E61C();

  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_100003110(uint64_t a1)
{
  unint64_t v2 = sub_10000E570();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000314C(uint64_t a1)
{
  unint64_t v2 = sub_10000E570();

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000033A0(uint64_t a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_10001CE28 + dword_10001CE28);
  v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  void *v4 = v2;
  v4[1] = sub_100003454;
  return v6(a1);
}

uint64_t sub_100003454()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = sub_100013788();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v7 = (void *)v5;
  }
  else
  {
    sub_10000E288(0, &qword_10001CE30);
    sub_10000E220();
    Class isa = sub_100013D68().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    uint64_t v7 = isa;
  }
  unint64_t v8 = *(void (***)(void, void, void))(v3 + 16);
  ((void (**)(void, Class, uint64_t))v8)[2](v8, isa, v5);

  _Block_release(v8);
  v9 = *(uint64_t (**)(void))(v4 + 8);
  return v9();
}

uint64_t sub_10000377C(void *a1, void *a2, uint64_t a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  _OWORD v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  unint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10001CDE0 + dword_10001CDE0);
  id v10 = a1;
  id v11 = a2;
  id v12 = a5;
  v13 = (void *)swift_task_alloc();
  v5[6] = v13;
  void *v13 = v5;
  v13[1] = sub_10000386C;
  return v15((uint64_t)v10, a3);
}

uint64_t sub_10000386C()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v8 = sub_100013788();
    swift_errorRelease();
    Class isa = 0;
    id v10 = (void *)v8;
  }
  else
  {
    sub_10000E288(0, (unint64_t *)&qword_10001D0E0);
    Class isa = sub_100013CF8().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    id v10 = isa;
  }
  id v11 = *(void (***)(void, void, void))(v3 + 40);
  ((void (**)(void, Class, uint64_t))v11)[2](v11, isa, v8);

  _Block_release(v11);
  id v12 = *(uint64_t (**)(void))(v7 + 8);
  return v12();
}

void sub_100003A44(void *a1)
{
  id v1 = [a1 payloadInstallBehavior];
  if (!v1)
  {
    sub_1000138F8();
    return;
  }
  uint64_t v2 = v1;
  id v3 = [v1 payloadInstall];
  uint64_t v4 = sub_100013C18();
  uint64_t v6 = v5;

  if (sub_100013C18() == v4 && v7 == v6)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v9 = sub_100013F68();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    sub_1000138F8();
    goto LABEL_16;
  }
  if (sub_100013C18() == v4 && v10 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v12 = sub_100013F68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_18:
    sub_1000138E8();
    goto LABEL_16;
  }
  sub_100013E78(34);
  swift_bridgeObjectRelease();
  id v13 = [v2 payloadInstall];
  uint64_t v14 = sub_100013C18();
  uint64_t v16 = v15;

  v18._countAndFlagsBits = v14;
  v18._object = v16;
  sub_100013C68(v18);
  swift_bridgeObjectRelease();
  sub_10000DA98();
  swift_allocError();
  *(void *)uint64_t v17 = 0xD000000000000020;
  *(void *)(v17 + 8) = 0x8000000100014EF0;
  *(unsigned char *)(v17 + 16) = 1;
  swift_willThrow();
LABEL_16:
}

void sub_100003C4C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v4 = sub_100002AE8(&qword_10001CE00);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000137A8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100013978();
  uint64_t v49 = *(void *)(v11 - 8);
  uint64_t v50 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v48 - v15;
  id v17 = [a1 payloadAppStoreID];
  if (v17)
  {
    Swift::String v18 = v17;
    uint64_t v19 = sub_100013C18();
    unint64_t v21 = v20;

    uint64_t v22 = HIBYTE(v21) & 0xF;
    uint64_t v23 = v19 & 0xFFFFFFFFFFFFLL;
    if ((v21 & 0x2000000000000000) != 0) {
      uint64_t v24 = HIBYTE(v21) & 0xF;
    }
    else {
      uint64_t v24 = v19 & 0xFFFFFFFFFFFFLL;
    }
    if (v24)
    {
      if ((v21 & 0x1000000000000000) != 0)
      {
        sub_1000067D0(v19, v21, 10);
      }
      else
      {
        if ((v21 & 0x2000000000000000) != 0)
        {
          v52[0] = v19;
          v52[1] = v21 & 0xFFFFFFFFFFFFFFLL;
          if (v19 == 43)
          {
            if (v22)
            {
              if (v22 != 1
                && (BYTE1(v19) - 48) <= 9u
                && v22 != 2
                && (BYTE2(v19) - 48) <= 9u)
              {
                unint64_t v34 = 10 * (BYTE1(v19) - 48) + (BYTE2(v19) - 48);
                uint64_t v35 = v22 - 3;
                if (v35)
                {
                  v36 = (unsigned __int8 *)v52 + 3;
                  do
                  {
                    unsigned int v37 = *v36 - 48;
                    if (v37 > 9) {
                      break;
                    }
                    if (!is_mul_ok(v34, 0xAuLL)) {
                      break;
                    }
                    BOOL v29 = __CFADD__(10 * v34, v37);
                    unint64_t v34 = 10 * v34 + v37;
                    if (v29) {
                      break;
                    }
                    ++v36;
                    --v35;
                  }
                  while (v35);
                }
              }
              goto LABEL_44;
            }
          }
          else
          {
            if (v19 != 45)
            {
              if (v22)
              {
                if ((v19 - 48) <= 9u && v22 != 1 && (BYTE1(v19) - 48) <= 9u)
                {
                  unint64_t v38 = 10 * (v19 - 48) + (BYTE1(v19) - 48);
                  uint64_t v39 = v22 - 2;
                  if (v39)
                  {
                    v40 = (unsigned __int8 *)v52 + 2;
                    do
                    {
                      unsigned int v41 = *v40 - 48;
                      if (v41 > 9) {
                        break;
                      }
                      if (!is_mul_ok(v38, 0xAuLL)) {
                        break;
                      }
                      BOOL v29 = __CFADD__(10 * v38, v41);
                      unint64_t v38 = 10 * v38 + v41;
                      if (v29) {
                        break;
                      }
                      ++v40;
                      --v39;
                    }
                    while (v39);
                  }
                }
              }
              goto LABEL_44;
            }
            if (v22)
            {
              if (v22 != 1)
              {
                unsigned __int8 v28 = BYTE1(v19) - 48;
                if ((BYTE1(v19) - 48) <= 9u)
                {
                  BOOL v29 = v28 == 0;
                  unint64_t v30 = -(uint64_t)v28;
                  if (v29 && v22 != 2)
                  {
                    unsigned __int8 v42 = BYTE2(v19) - 48;
                    if ((BYTE2(v19) - 48) <= 9u && is_mul_ok(v30, 0xAuLL))
                    {
                      unint64_t v43 = 10 * v30;
                      unint64_t v44 = v43 - v42;
                      if (v43 >= v42)
                      {
                        uint64_t v45 = v22 - 3;
                        if (v45)
                        {
                          v46 = (unsigned __int8 *)v52 + 3;
                          do
                          {
                            unsigned int v47 = *v46 - 48;
                            if (v47 > 9) {
                              break;
                            }
                            if (!is_mul_ok(v44, 0xAuLL)) {
                              break;
                            }
                            BOOL v29 = 10 * v44 >= v47;
                            unint64_t v44 = 10 * v44 - v47;
                            if (!v29) {
                              break;
                            }
                            ++v46;
                            --v45;
                          }
                          while (v45);
                        }
                      }
                    }
                  }
                }
              }
              goto LABEL_44;
            }
            __break(1u);
          }
          __break(1u);
          return;
        }
        if ((v19 & 0x1000000000000000) != 0) {
          v25 = (unsigned __int8 *)((v21 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          v25 = (unsigned __int8 *)sub_100013E98();
        }
        sub_1000068B8(v25, v23, 10);
      }
    }
LABEL_44:
    swift_bridgeObjectRelease();
    sub_1000042CC(a1);
    if (!v2)
    {
      sub_100013928();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v16, v50);
    }
    return;
  }
  id v26 = [a1 payloadBundleID];
  if (!v26)
  {
    id v31 = [a1 payloadManifestURL];
    if (v31)
    {
      v32 = v31;
      sub_100013C18();

      sub_100013798();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
        sub_100013938();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        return;
      }
      sub_10000E088((uint64_t)v6, &qword_10001CE00);
    }
    sub_10000DA98();
    swift_allocError();
    *(void *)uint64_t v33 = 0xD00000000000001BLL;
    *(void *)(v33 + 8) = 0x8000000100014ED0;
    *(unsigned char *)(v33 + 16) = 1;
    swift_willThrow();
    return;
  }
  v27 = v26;
  sub_100013C18();

  sub_1000042CC(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100013928();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v50);
  }
}

uint64_t sub_1000042CC(void *a1)
{
  id v1 = [a1 payloadInstallBehavior];
  if (!v1
    || (v2 = v1, id v3 = [v1 payloadLicense], v2, !v3)
    || (id v4 = [v3 payloadAssignment], v3, !v4))
  {
    if (qword_10001CC30 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100013B68();
    sub_10000DA60(v12, (uint64_t)qword_10001D3B0);
    uint64_t v13 = sub_100013B48();
    os_log_type_t v14 = sub_100013D88();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Configuration for App Store app is missing the license assignment type", v15, 2u);
      swift_slowDealloc();
    }

    sub_10000DA98();
    swift_allocError();
    *(void *)uint64_t v16 = 0;
    *(void *)(v16 + 8) = 0;
    char v17 = 8;
    goto LABEL_17;
  }
  uint64_t v5 = sub_100013C18();
  uint64_t v7 = v6;

  if (sub_100013C18() == v5 && v8 == v7)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  char v10 = sub_100013F68();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_100013968();
  }
  if (sub_100013C18() != v5 || v11 != v7)
  {
    char v19 = sub_100013F68();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_21;
    }
    if (qword_10001CC30 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_100013B68();
    sub_10000DA60(v20, (uint64_t)qword_10001D3B0);
    unint64_t v21 = sub_100013B48();
    os_log_type_t v22 = sub_100013D88();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Configuration for App Store app has invalid license assignment type", v23, 2u);
      swift_slowDealloc();
    }

    sub_10000DA98();
    swift_allocError();
    *(void *)uint64_t v16 = v5;
    *(void *)(v16 + 8) = v7;
    char v17 = 3;
LABEL_17:
    *(unsigned char *)(v16 + 16) = v17;
    return swift_willThrow();
  }
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  return sub_100013958();
}

uint64_t sub_100004604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10001CD98 + dword_10001CD98);
  uint64_t v9 = (void *)swift_task_alloc();
  v6[4] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_1000046BC;
  return v11(a5, a6);
}

uint64_t sub_1000046BC(char a1)
{
  id v3 = (void *)*v1;
  id v4 = (void *)*v1;
  swift_task_dealloc();
  if (a1)
  {
    char v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10001CDA0 + dword_10001CDA0);
    uint64_t v5 = (void *)swift_task_alloc();
    v3[5] = v5;
    *uint64_t v5 = v4;
    v5[1] = sub_100004840;
    uint64_t v6 = v3[3];
    uint64_t v7 = v3[2];
    return v10(v7, v6);
  }
  else
  {
    uint64_t v9 = (uint64_t (*)(void))v4[1];
    return v9();
  }
}

uint64_t sub_100004840()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013D58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100013D48();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E088(a1, &qword_10001CCE8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100013D38();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004C60(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  char v10 = (uint64_t (*)(uint64_t))((char *)&dword_10001CD70 + dword_10001CD70);
  id v7 = a1;
  a4;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[5] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_100004D38;
  return v10((uint64_t)v7);
}

uint64_t sub_100004D38()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v9 = (void *)sub_100013788();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  char v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_100004ED4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100002AE8(&qword_10001CDB0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_10000DF00((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1000051C0(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_10001CD10 + dword_10001CD10);
  id v7 = a1;
  id v8 = a4;
  id v9 = (void *)swift_task_alloc();
  v4[5] = v9;
  *id v9 = v4;
  v9[1] = sub_100005294;
  return v11((uint64_t)v7);
}

uint64_t sub_100005294(char a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *(void *)(*v3 + 32);
  id v8 = *(void **)(*v3 + 24);
  id v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();

  uint64_t v11 = (void (**)(void, void, void, void))(v7 + 16);
  uint64_t v12 = *(const void **)(v10 + 32);
  if (v4)
  {
    uint64_t v13 = (void *)sub_100013788();
    swift_errorRelease();
    (*v11)(v12, 0, 0, v13);

    _Block_release(v12);
  }
  else
  {
    (*v11)(v12, a1 & 1, a2, 0);
    _Block_release(v12);
  }
  os_log_type_t v14 = *(uint64_t (**)(void))(v10 + 8);
  return v14();
}

id sub_10000549C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagedAppsAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ManagedAppsAdapter()
{
  return self;
}

uint64_t sub_1000054FC()
{
  objc_super v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000055BC;
  uint64_t v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_10001CCF0 + dword_10001CCF0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1000055BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000056B4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E670;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10001D070 + dword_10001D070);
  return v6(v2, v3, v4);
}

uint64_t sub_100005778(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000E670;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10001D080 + dword_10001D080);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100005844(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100005920;
  return v6(a1);
}

uint64_t sub_100005920()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_100005A18()
{
  uint64_t v1 = *v0;
  __n128 result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    __n128 result = sub_10000F554(result, *((void *)v1 + 2) + 1, 1, v1);
    *uint64_t v0 = result;
  }
  return result;
}

uint64_t sub_100005A64(void *a1, void *a2)
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
    uint64_t v9 = sub_100013E18();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_10000E288(0, &qword_10001CE30);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100013E08();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100005D04(v7, result + 1);
    unsigned __int8 v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100005EFC();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10000619C((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100013DA8(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_10000E288(0, &qword_10001CE30);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100013DB8();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_100013DB8();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100006220((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100005D04(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100002AE8((uint64_t *)&unk_10001CE40);
    uint64_t v2 = sub_100013E58();
    uint64_t v14 = v2;
    sub_100013DF8();
    if (sub_100013E28())
    {
      sub_10000E288(0, &qword_10001CE30);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100005EFC();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100013DA8(*(void *)(v2 + 40));
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
      while (sub_100013E28());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100005EFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100002AE8((uint64_t *)&unk_10001CE40);
  uint64_t v3 = sub_100013E48();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unsigned __int8 v28 = v0;
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
      uint64_t result = sub_100013DA8(*(void *)(v4 + 40));
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
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_10000619C(uint64_t a1, void *a2)
{
  sub_100013DA8(a2[5]);
  unint64_t result = sub_100013DE8();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100006220(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100005EFC();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000063A8();
      goto LABEL_14;
    }
    sub_100006554();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100013DA8(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10000E288(0, &qword_10001CE30);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100013DB8();

    if (v12)
    {
LABEL_13:
      sub_100013F78();
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
        char v15 = sub_100013DB8();

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

id sub_1000063A8()
{
  uint64_t v1 = v0;
  sub_100002AE8((uint64_t *)&unk_10001CE40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100013E38();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_100006554()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100002AE8((uint64_t *)&unk_10001CE40);
  uint64_t v3 = sub_100013E48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unsigned __int8 v28 = v0;
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
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_100013DA8(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
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

unsigned __int8 *sub_1000067D0(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100013CD8();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100006B34();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_100013E98();
  }
LABEL_7:
  uint64_t v11 = sub_1000068B8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1000068B8(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
            unint64_t v9 = 0;
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
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
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
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  id v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100006B34()
{
  unint64_t v0 = sub_100013CE8();
  uint64_t v4 = sub_100006BB4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100006BB4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100006D0C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10000FD7C(v9, 0),
          unint64_t v12 = sub_100006E0C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100013C48();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_100013C48();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_100013E98();
LABEL_4:

  return sub_100013C48();
}

uint64_t sub_100006D0C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_10000FDE4(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10000FDE4(v6, v5, v4);
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
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_100006E0C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      uint64_t result = sub_10000FDE4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_100013CB8();
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
          uint64_t result = sub_100013E98();
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
    uint64_t result = sub_10000FDE4(v12, a6, a7);
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
    unint64_t v12 = sub_100013C88();
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

uint64_t sub_100007020(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100013AE8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_1000070E0, 0, 0);
}

uint64_t sub_1000070E0()
{
  if (v0[2])
  {
    sub_100013AD8();
    unint64_t v1 = (void *)swift_task_alloc();
    v0[6] = v1;
    void *v1 = v0;
    v1[1] = sub_1000072C8;
    return DDMDeclarationKeysRequest.request()();
  }
  else
  {
    if (qword_10001CC30 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100013B68();
    sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
    unint64_t v3 = sub_100013B48();
    os_log_type_t v4 = sub_100013D88();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "iOS user scope is not supported", v5, 2u);
      swift_slowDealloc();
    }

    sub_10000DA98();
    swift_allocError();
    *(void *)uint64_t v6 = 0xD00000000000001FLL;
    *(void *)(v6 + 8) = 0x8000000100014F20;
    *(unsigned char *)(v6 + 16) = 2;
    swift_willThrow();
    swift_task_dealloc();
    unint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_1000072C8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v1;
  swift_task_dealloc();
  if (v1) {
    os_log_type_t v4 = sub_100007528;
  }
  else {
    os_log_type_t v4 = sub_1000073DC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000073DC()
{
  unint64_t v10 = v0;
  uint64_t v1 = v0[7];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = self;
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      NSString v5 = sub_100013C08();
      swift_bridgeObjectRelease();
      id v6 = [v3 newDeclarationKey:v5];

      sub_100005A64(&v9, v6);
      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  unint64_t v7 = (uint64_t (*)(void *))v0[1];
  return v7(&_swiftEmptySetSingleton);
}

uint64_t sub_100007528()
{
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

unint64_t sub_1000075A4(void *a1)
{
  id v2 = [a1 payloadAppStoreID];
  if (!v2)
  {
    id v2 = [a1 payloadBundleID];
    if (!v2)
    {
      id v2 = [a1 payloadManifestURL];
      if (!v2) {
        return 0xD000000000000013;
      }
    }
  }
  uint64_t v3 = sub_100013C18();

  return v3;
}

uint64_t sub_100007660(void *a1)
{
  uint64_t v75 = 0;
  unint64_t v76 = 0xE000000000000000;
  id v2 = [a1 payloadAppStoreID];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_100013C18();
    id v6 = v5;

    sub_100013E78(18);
    swift_bridgeObjectRelease();
    v74._countAndFlagsBits = 0x6F74537070412020;
    v74._object = (void *)0xEF203A4449646572;
    v77._countAndFlagsBits = v4;
    v77._object = v6;
    sub_100013C68(v77);
    swift_bridgeObjectRelease();
    v78._countAndFlagsBits = 10;
    v78._object = (void *)0xE100000000000000;
    sub_100013C68(v78);
    v79._countAndFlagsBits = 0x6F74537070412020;
    v79._object = (void *)0xEF203A4449646572;
    sub_100013C68(v79);
    swift_bridgeObjectRelease();
  }
  id v7 = objc_msgSend(a1, "payloadBundleID", v74._countAndFlagsBits, v74._object);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100013C18();
    uint64_t v11 = v10;

    strcpy((char *)&v74, "  BundleID: ");
    BYTE5(v74._object) = 0;
    HIWORD(v74._object) = -5120;
    v80._countAndFlagsBits = v9;
    v80._object = v11;
    sub_100013C68(v80);
    swift_bridgeObjectRelease();
    v81._countAndFlagsBits = 10;
    v81._object = (void *)0xE100000000000000;
    sub_100013C68(v81);
    sub_100013C68(v74);
    swift_bridgeObjectRelease();
  }
  id v12 = objc_msgSend(a1, "payloadManifestURL", v74._countAndFlagsBits, v74._object);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100013C18();
    uint64_t v16 = v15;

    sub_100013E78(18);
    swift_bridgeObjectRelease();
    v82._countAndFlagsBits = v14;
    v82._object = v16;
    sub_100013C68(v82);
    swift_bridgeObjectRelease();
    v83._countAndFlagsBits = 10;
    v83._object = (void *)0xE100000000000000;
    sub_100013C68(v83);
    v84._countAndFlagsBits = 0x6566696E614D2020;
    v84._object = (void *)0xEF203A4C52557473;
    sub_100013C68(v84);
    swift_bridgeObjectRelease();
  }
  sub_100013E78(22);
  swift_bridgeObjectRelease();
  id v17 = [a1 payloadIncludeInBackup];
  id v18 = [v17 description];
  uint64_t v19 = sub_100013C18();
  uint64_t v21 = v20;

  v85._countAndFlagsBits = v19;
  v85._object = v21;
  sub_100013C68(v85);

  swift_bridgeObjectRelease();
  v86._countAndFlagsBits = 10;
  v86._object = (void *)0xE100000000000000;
  sub_100013C68(v86);
  v87._countAndFlagsBits = 0xD000000000000013;
  v87._object = (void *)0x8000000100014DC0;
  sub_100013C68(v87);
  swift_bridgeObjectRelease();
  id v22 = [a1 payloadInstallBehavior];
  if (v22)
  {
    unint64_t v23 = v22;
    v88._countAndFlagsBits = 0xD000000000000014;
    v88._object = (void *)0x8000000100014EB0;
    sub_100013C68(v88);
    sub_100013E78(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v74, "    Install: ");
    HIWORD(v74._object) = -4864;
    id v24 = [v23 payloadInstall];
    uint64_t v25 = sub_100013C18();
    unint64_t v27 = v26;

    v89._countAndFlagsBits = v25;
    v89._object = v27;
    sub_100013C68(v89);
    swift_bridgeObjectRelease();
    unint64_t v28 = (void *)0xE100000000000000;
    v90._countAndFlagsBits = 10;
    v90._object = (void *)0xE100000000000000;
    sub_100013C68(v90);
    sub_100013C68(v74);
    swift_bridgeObjectRelease();
    sub_100013E78(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v74, "    License: ");
    HIWORD(v74._object) = -4864;
    id v29 = [v23 payloadLicense];
    if (v29
      && (char v30 = v29,
          id v31 = [v29 payloadAssignment],
          v30,
          v31))
    {
      uint64_t v32 = sub_100013C18();
      unint64_t v28 = v33;
    }
    else
    {
      uint64_t v32 = 45;
    }
    v91._countAndFlagsBits = v32;
    v91._object = v28;
    sub_100013C68(v91);
    swift_bridgeObjectRelease();
    v92._countAndFlagsBits = 10;
    v92._object = (void *)0xE100000000000000;
    sub_100013C68(v92);
    sub_100013C68(v74);
    swift_bridgeObjectRelease();
    v93._countAndFlagsBits = 175972384;
    v93._object = (void *)0xE400000000000000;
    sub_100013C68(v93);
  }
  id v34 = [a1 payloadAttributes];
  if (v34)
  {
    uint64_t v35 = v34;
    v94._countAndFlagsBits = 0x6269727474412020;
    v94._object = (void *)0xEF0A7B2073657475;
    sub_100013C68(v94);
    id v36 = [v35 payloadAssociatedDomains];
    if (v36)
    {
      unsigned int v37 = v36;
      sub_100013D08();

      sub_100013E78(26);
      swift_bridgeObjectRelease();
      v95._countAndFlagsBits = sub_100013D18();
      sub_100013C68(v95);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v96._countAndFlagsBits = 10;
      v96._object = (void *)0xE100000000000000;
      sub_100013C68(v96);
      v97._countAndFlagsBits = 0xD000000000000017;
      v97._object = (void *)0x8000000100014E90;
      sub_100013C68(v97);
      swift_bridgeObjectRelease();
    }
    sub_100013E78(47);
    swift_bridgeObjectRelease();
    v74._countAndFlagsBits = 0xD00000000000002CLL;
    v74._object = (void *)0x8000000100014DE0;
    id v38 = [v35 payloadAssociatedDomainsEnableDirectDownloads];
    id v39 = [v38 description];
    uint64_t v40 = sub_100013C18();
    unsigned __int8 v42 = v41;

    v98._countAndFlagsBits = v40;
    v98._object = v42;
    sub_100013C68(v98);

    swift_bridgeObjectRelease();
    v99._countAndFlagsBits = 10;
    v99._object = (void *)0xE100000000000000;
    sub_100013C68(v99);
    v100._countAndFlagsBits = 0xD00000000000002CLL;
    v100._object = (void *)0x8000000100014DE0;
    sub_100013C68(v100);
    swift_bridgeObjectRelease();
    id v43 = [v35 payloadCellularSliceUUID];
    if (v43)
    {
      unint64_t v44 = v43;
      uint64_t v45 = sub_100013C18();
      unsigned int v47 = v46;

      sub_100013E78(26);
      swift_bridgeObjectRelease();
      v74._countAndFlagsBits = 0xD000000000000017;
      v74._object = (void *)0x8000000100014E70;
      v101._countAndFlagsBits = v45;
      v101._object = v47;
      sub_100013C68(v101);
      swift_bridgeObjectRelease();
      v102._countAndFlagsBits = 10;
      v102._object = (void *)0xE100000000000000;
      sub_100013C68(v102);
      v103._countAndFlagsBits = 0xD000000000000017;
      v103._object = (void *)0x8000000100014E70;
      sub_100013C68(v103);
      swift_bridgeObjectRelease();
    }
    id v48 = objc_msgSend(v35, "payloadContentFilterUUID", v74._countAndFlagsBits, v74._object);
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = sub_100013C18();
      v52 = v51;

      sub_100013E78(26);
      swift_bridgeObjectRelease();
      v74._countAndFlagsBits = 0xD000000000000017;
      v74._object = (void *)0x8000000100014E50;
      v104._countAndFlagsBits = v50;
      v104._object = v52;
      sub_100013C68(v104);
      swift_bridgeObjectRelease();
      v105._countAndFlagsBits = 10;
      v105._object = (void *)0xE100000000000000;
      sub_100013C68(v105);
      v106._countAndFlagsBits = 0xD000000000000017;
      v106._object = (void *)0x8000000100014E50;
      sub_100013C68(v106);
      swift_bridgeObjectRelease();
    }
    id v53 = objc_msgSend(v35, "payloadDNSProxyUUID", v74._countAndFlagsBits, v74._object);
    if (v53)
    {
      v54 = v53;
      uint64_t v55 = sub_100013C18();
      v57 = v56;

      sub_100013E78(21);
      swift_bridgeObjectRelease();
      v74._countAndFlagsBits = 0xD000000000000012;
      v74._object = (void *)0x8000000100014E30;
      v107._countAndFlagsBits = v55;
      v107._object = v57;
      sub_100013C68(v107);
      swift_bridgeObjectRelease();
      v108._countAndFlagsBits = 10;
      v108._object = (void *)0xE100000000000000;
      sub_100013C68(v108);
      v109._countAndFlagsBits = 0xD000000000000012;
      v109._object = (void *)0x8000000100014E30;
      sub_100013C68(v109);
      swift_bridgeObjectRelease();
    }
    id v58 = objc_msgSend(v35, "payloadRelayUUID", v74._countAndFlagsBits, v74._object);
    if (v58)
    {
      v59 = v58;
      uint64_t v60 = sub_100013C18();
      v62 = v61;

      sub_100013E78(18);
      swift_bridgeObjectRelease();
      v110._countAndFlagsBits = v60;
      v110._object = v62;
      sub_100013C68(v110);
      swift_bridgeObjectRelease();
      v111._countAndFlagsBits = 10;
      v111._object = (void *)0xE100000000000000;
      sub_100013C68(v111);
      v112._countAndFlagsBits = 0x616C655220202020;
      v112._object = (void *)0xEF203A4449555579;
      sub_100013C68(v112);
      swift_bridgeObjectRelease();
    }
    sub_100013E78(27);
    swift_bridgeObjectRelease();
    id v63 = [v35 payloadTapToPayScreenLock];
    id v64 = [v63 description];
    uint64_t v65 = sub_100013C18();
    v67 = v66;

    v113._countAndFlagsBits = v65;
    v113._object = v67;
    sub_100013C68(v113);

    swift_bridgeObjectRelease();
    v114._countAndFlagsBits = 10;
    v114._object = (void *)0xE100000000000000;
    sub_100013C68(v114);
    v115._countAndFlagsBits = 0xD000000000000018;
    v115._object = (void *)0x8000000100014E10;
    sub_100013C68(v115);
    swift_bridgeObjectRelease();
    id v68 = [v35 payloadVPNUUID];
    if (v68)
    {
      v69 = v68;
      uint64_t v70 = sub_100013C18();
      v72 = v71;

      sub_100013E78(16);
      swift_bridgeObjectRelease();
      strcpy((char *)&v74, "    VPNUUID: ");
      HIWORD(v74._object) = -4864;
      v116._countAndFlagsBits = v70;
      v116._object = v72;
      sub_100013C68(v116);
      swift_bridgeObjectRelease();
      v117._countAndFlagsBits = 10;
      v117._object = (void *)0xE100000000000000;
      sub_100013C68(v117);
      sub_100013C68(v74);
      swift_bridgeObjectRelease();
    }
    v118._countAndFlagsBits = 175972384;
    v118._object = (void *)0xE400000000000000;
    sub_100013C68(v118);
  }
  return v75;
}

uint64_t sub_1000080E0(uint64_t a1)
{
  if (a1 == 1) {
    return 0;
  }
  if (!a1) {
    return 1;
  }
  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013B68();
  sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
  uint64_t v3 = sub_100013B48();
  os_log_type_t v4 = sub_100013D88();
  if (os_log_type_enabled(v3, v4))
  {
    NSString v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unknown scope", v5, 2u);
    swift_slowDealloc();
  }

  sub_10000DA98();
  swift_allocError();
  *(_OWORD *)uint64_t v6 = xmmword_1000146F0;
  *(unsigned char *)(v6 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_100008218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  _OWORD v5[2] = a1;
  uint64_t v6 = sub_100013828();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  sub_100002AE8(&qword_10001CDF8);
  v5[10] = swift_task_alloc();
  sub_100013B38();
  v5[11] = swift_task_alloc();
  uint64_t v7 = sub_100013998();
  v5[12] = v7;
  v5[13] = *(void *)(v7 - 8);
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  uint64_t v8 = sub_1000138C8();
  v5[16] = v8;
  v5[17] = *(void *)(v8 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  uint64_t v9 = sub_1000138A8();
  v5[20] = v9;
  v5[21] = *(void *)(v9 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  sub_100013948();
  v5[24] = swift_task_alloc();
  uint64_t v10 = sub_100013908();
  v5[25] = v10;
  v5[26] = *(void *)(v10 - 8);
  v5[27] = swift_task_alloc();
  uint64_t v11 = sub_100013988();
  v5[28] = v11;
  v5[29] = *(void *)(v11 - 8);
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return _swift_task_switch(sub_100008574, 0, 0);
}

uint64_t sub_100008574()
{
  uint64_t v1 = *(void **)(v0 + 16);
  type metadata accessor for ManagedAppsAdapter();
  sub_100003A44(v1);
  sub_100003C4C(*(void **)(v0 + 16), *(void *)(v0 + 192));
  uint64_t v2 = *(void *)(v0 + 48);
  os_log_type_t v4 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  sub_100013918();
  id v5 = [v4 payloadIncludeInBackup];
  [v5 BOOLValue];

  sub_100013898();
  sub_1000138B8();
  id v6 = [v3 key];
  sub_100013C18();

  id v7 = [v3 declarationIdentifier];
  sub_100013C18();

  sub_1000080E0(v2);
  uint64_t v9 = *(void *)(v0 + 176);
  uint64_t v8 = *(void *)(v0 + 184);
  uint64_t v11 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v12 = *(void *)(v0 + 144);
  uint64_t v13 = *(void *)(v0 + 136);
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v23 = *(void *)(v0 + 152);
  uint64_t v14 = *(void *)(v0 + 88);
  id v24 = *(id *)(v0 + 16);
  (*(void (**)(void, void, void))(*(void *)(v0 + 232) + 16))(*(void *)(v0 + 240), *(void *)(v0 + 248), *(void *)(v0 + 224));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v8, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v23, v22);
  swift_bridgeObjectRetain();
  sub_100013B28();
  sub_1000138D8();
  id v15 = objc_msgSend(v24, "payloadAttributes", v9, v12, v14);
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [v15 serializeWithType:0];
    sub_100013B88();

    sub_100013878();
    uint64_t v18 = *(void *)(v0 + 80);
    uint64_t v19 = sub_100013868();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 0, 1, v19);
    sub_100013888();
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 104) + 16))(*(void *)(v0 + 112), *(void *)(v0 + 120), *(void *)(v0 + 96));
  sub_100013808();
  id v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v20;
  *id v20 = v0;
  v20[1] = sub_100008A94;
  return DDMAppOrUpdateManagedAppRequest.request()();
}

uint64_t sub_100008A94()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100008D50;
  }
  else {
    uint64_t v2 = sub_100008BA8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008BA8()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[29];
  uint64_t v14 = v0[28];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[19];
  uint64_t v12 = v0[20];
  uint64_t v13 = v0[23];
  uint64_t v5 = v0[17];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[16];
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[12];
  (*(void (**)(void))(v0[8] + 8))();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100008D50()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[13];
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(void, void))(v0[29] + 8))(v0[31], v0[28]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100008EF4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return _swift_task_switch(sub_100008F14, 0, 0);
}

uint64_t sub_100008F14()
{
  uint64_t v53 = v0;
  uint64_t v2 = (id *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = self;
  NSString v4 = sub_100013C08();
  id v5 = [v3 newDeclarationKeyWithSubscriberIdentifier:v4 reference:v1];
  *(void *)(v0 + 56) = v5;

  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100013B68();
  sub_10000DA60(v6, (uint64_t)qword_10001D3B0);
  id v7 = v5;
  uint64_t v8 = sub_100013B48();
  os_log_type_t v9 = sub_100013D98();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    v52[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    id v11 = [v7 key];
    uint64_t v12 = sub_100013C18();
    unint64_t v14 = v13;

    uint64_t v15 = v12;
    uint64_t v2 = (id *)(v0 + 40);
    *(void *)(v0 + 32) = sub_10000F8DC(v15, v14, v52);
    sub_100013DC8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Applying configuration with key: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v16 = [*(id *)(v0 + 40) declaration];
  *(void *)(v0 + 64) = v16;
  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = v16;
    id v20 = sub_100013B48();
    os_log_type_t v21 = sub_100013D78();
    uint64_t v50 = (uint64_t)v7;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v52[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446210;
      unint64_t v23 = sub_1000075A4(v18);
      uint64_t v49 = v2;
      *(v2 - 2) = (id)sub_10000F8DC(v23, v24, v52);
      sub_100013DC8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "App: %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v36 = v19;
    unsigned int v37 = sub_100013B48();
    os_log_type_t v38 = sub_100013D78();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      v52[0] = swift_slowAlloc();
      *(_DWORD *)id v39 = 136446210;
      uint64_t v40 = sub_100007660(v18);
      *(v2 - 3) = (id)sub_10000F8DC(v40, v41, v52);
      sub_100013DC8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Declaration:\n%{public}s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v42 = objc_msgSend(*v2, "store", v49);
    id v43 = [v42 personaIdentifier];

    if (v43)
    {
      uint64_t v44 = sub_100013C18();
      uint64_t v46 = v45;
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v46 = 0;
    }
    *(void *)(v0 + 72) = v46;
    uint64_t v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10001CDF0
                                                                              + dword_10001CDF0);
    unsigned int v47 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v47;
    *unsigned int v47 = v0;
    v47[1] = sub_1000095F0;
    uint64_t v48 = *(void *)(v0 + 48);
    return v51((uint64_t)v18, v50, v44, v46, v48);
  }
  else
  {
    uint64_t v25 = *(void **)(v0 + 40);

    strcpy((char *)v52, "Wrong type: ");
    BYTE5(v52[1]) = 0;
    HIWORD(v52[1]) = -5120;
    id v26 = [v25 declaration];
    id v27 = [v26 declarationType];

    uint64_t v28 = sub_100013C18();
    char v30 = v29;

    v55._countAndFlagsBits = v28;
    v55._object = v30;
    sub_100013C68(v55);
    swift_bridgeObjectRelease();
    uint64_t v32 = v52[0];
    uint64_t v31 = v52[1];
    sub_10000DA98();
    swift_allocError();
    *(void *)uint64_t v33 = v32;
    *(void *)(v33 + 8) = v31;
    *(unsigned char *)(v33 + 16) = 1;
    swift_willThrow();

    id v34 = *(uint64_t (**)(void))(v0 + 8);
    return v34();
  }
}

uint64_t sub_1000095F0()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_100009790;
  }
  else {
    uint64_t v2 = sub_100009720;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100009720()
{
  uint64_t v1 = *(void **)(v0 + 64);

  uint64_t v2 = *(uint64_t (**)(void *))(v0 + 8);
  return v2(&_swiftEmptyArrayStorage);
}

uint64_t sub_100009790()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000980C(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  sub_100002AE8(&qword_10001CCE8);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_100013858();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  sub_100002AE8(&qword_10001CD18);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_100013B18();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  return _swift_task_switch(sub_100009988, 0, 0);
}

uint64_t sub_100009988()
{
  uint64_t v19 = v0;
  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = sub_100013B68();
  *(void *)(v0 + 104) = sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
  id v3 = v1;
  uint64_t v4 = sub_100013B48();
  os_log_type_t v5 = sub_100013D98();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = *(void **)(v0 + 24);
  uint64_t v8 = &ManagedAppsAdapter;
  if (v6)
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 136446210;
    id v10 = [v7 key];
    uint64_t v11 = sub_100013C18();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    uint64_t v8 = &ManagedAppsAdapter;
    *(void *)(v0 + 16) = sub_10000F8DC(v14, v13, &v18);
    sub_100013DC8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removing configuration with key: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v15 = [*(id *)(v0 + 24) (SEL)v8[257].count];
  sub_100013C18();

  sub_100013AF8();
  id v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v16;
  *id v16 = v0;
  v16[1] = sub_100009C18;
  return DDMDeclarationStatusRequest.request()();
}

uint64_t sub_100009C18(uint64_t a1)
{
  *(void *)(*(void *)v2 + 120) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    id v3 = sub_10000A22C;
  }
  else
  {
    id v3 = sub_100009D34;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100009D34()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_100013AB8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(*(void *)(v0 + 72), v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = *(void *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  uint64_t v8 = *(void *)(v0 + 72);
  if (v7 == 1)
  {
    sub_10000E088(*(void *)(v0 + 72), &qword_10001CD18);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_100013AA8();
    uint64_t v10 = v11;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
  }
  *(void *)(v0 + 128) = v9;
  *(void *)(v0 + 136) = v10;
  id v12 = [*(id *)(v0 + 24) declarationIdentifier];
  sub_100013C18();

  sub_100013838();
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v13;
  void *v13 = v0;
  v13[1] = sub_100009F38;
  return DDMRemoveManagedAppRequest.request()();
}

uint64_t sub_100009F38()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_10000A390;
  }
  else
  {
    uint64_t v2 = sub_10000A054;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000A054()
{
  uint64_t v1 = v0[17];
  if (v1)
  {
    uint64_t v2 = v0[16];
    uint64_t v4 = (void *)v0[4];
    uint64_t v3 = v0[5];
    uint64_t v5 = sub_100013D58();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = 0;
    v6[3] = 0;
    v6[4] = v4;
    v6[5] = v2;
    v6[6] = v1;
    id v7 = v4;
    sub_100004934(v3, (uint64_t)&unk_10001CD80, (uint64_t)v6);
    swift_release();
  }
  else
  {
    uint64_t v8 = sub_100013B48();
    os_log_type_t v9 = sub_100013D88();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Missing bundle ID when removing - will continue best effort", v10, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v12 = v0[11];
  uint64_t v11 = v0[12];
  uint64_t v13 = v0[10];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_10000A22C()
{
  uint64_t v1 = sub_100013B48();
  os_log_type_t v2 = sub_100013D88();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to get app status when removing", v3, 2u);
    swift_slowDealloc();
  }

  sub_10000DA98();
  swift_allocError();
  *(void *)uint64_t v4 = 0xD000000000000026;
  *(void *)(v4 + 8) = 0x8000000100014D20;
  *(unsigned char *)(v4 + 16) = 0;
  swift_willThrow();
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10000A390()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000A458(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return _swift_task_switch(sub_10000A478, 0, 0);
}

uint64_t sub_10000A478()
{
  id v1 = [objc_allocWithZone((Class)DMFFetchAppsRequest) init];
  uint64_t v2 = v1;
  v0[18] = v1;
  if (v1)
  {
    uint64_t v4 = v0[16];
    uint64_t v3 = v0[17];
    [v1 setType:3];
    sub_100002AE8(&qword_10001CD30);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100014660;
    *(void *)(v5 + 32) = v4;
    *(void *)(v5 + 40) = v3;
    id v6 = v2;
    swift_bridgeObjectRetain();
    Class isa = sub_100013CF8().super.isa;
    swift_bridgeObjectRelease();
    [v6 setBundleIdentifiers:isa];

    [v6 setManagedAppsOnly:1];
    id v8 = v6;
    Class v9 = sub_100013CF8().super.isa;
    [v8 setPropertyKeys:v9];
  }
  id v10 = [self currentUserConnection];
  v0[19] = v10;
  if (v10)
  {
    uint64_t v11 = v10;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_10000A6B0;
    uint64_t v12 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100004ED4;
    v0[13] = &unk_100018CF8;
    v0[14] = v12;
    [v11 performRequest:v2 completion:v0 + 10];
    id v10 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v10);
}

uint64_t sub_10000A6B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_10000AA88;
  }
  else {
    uint64_t v2 = sub_10000A7C0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000A7C0()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = *(void **)(v0 + 120);
  id v3 = v2;

  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100013B68();
  sub_10000DA60(v4, (uint64_t)qword_10001D3B0);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_100013B48();
  os_log_type_t v6 = sub_100013D78();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void *)(v0 + 136);
  if (!v7)
  {

    swift_bridgeObjectRelease_n();
    if (v2) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v18 = *(void **)(v0 + 152);

    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(v0 + 128);
  id v10 = (uint8_t *)swift_slowAlloc();
  uint64_t v21 = swift_slowAlloc();
  *(_DWORD *)id v10 = 136446210;
  swift_bridgeObjectRetain();
  *(void *)(v0 + 80) = sub_10000F8DC(v9, v8, &v21);
  sub_100013DC8();
  swift_bridgeObjectRelease_n();
  _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetched DMF app data for: %{public}s", v10, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  if (!v2) {
    goto LABEL_8;
  }
LABEL_5:
  self;
  uint64_t v11 = (void *)swift_dynamicCastObjCClass();
  uint64_t v12 = *(void **)(v0 + 144);
  uint64_t v13 = *(void **)(v0 + 152);
  if (v11)
  {
    id v14 = [v11 appsByBundleIdentifier];

    sub_10000E288(0, &qword_10001CDB8);
    uint64_t v15 = sub_100013B88();

    uint64_t v16 = *(void *)(v15 + 16);
    swift_bridgeObjectRelease();
    BOOL v17 = v16 != 0;
    goto LABEL_11;
  }

LABEL_10:
  BOOL v17 = 1;
LABEL_11:
  uint64_t v19 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v19(v17);
}

uint64_t sub_10000AA88()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013B68();
  sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
  swift_errorRetain();
  swift_errorRetain();
  id v3 = sub_100013B48();
  os_log_type_t v4 = sub_100013D88();
  BOOL v5 = os_log_type_enabled(v3, v4);
  os_log_type_t v6 = *(NSObject **)(v0 + 144);
  if (v5)
  {
    uint64_t v12 = *(void **)(v0 + 152);
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v9;
    sub_100013DC8();
    *unint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to fetch DMF app data: %@", v7, 0xCu);
    sub_100002AE8(&qword_10001D0B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    os_log_type_t v6 = v3;
  }
  swift_errorRelease();

  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10(0);
}

uint64_t sub_10000ACB4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return _swift_task_switch(sub_10000ACD4, 0, 0);
}

uint64_t sub_10000ACD4()
{
  id v1 = [objc_allocWithZone((Class)DMFStopManagingAppRequest) init];
  uint64_t v2 = v1;
  v0[18] = v1;
  if (v1)
  {
    id v3 = v1;
    NSString v4 = sub_100013C08();
    [v3 setBundleIdentifier:v4];

    id v5 = v3;
    NSString v6 = sub_100013C08();
    [v5 setSourceIdentifier:v6];
  }
  id v7 = [self currentUserConnection];
  v0[19] = v7;
  if (v7)
  {
    unint64_t v8 = v7;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_10000AEA4;
    uint64_t v9 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100004ED4;
    v0[13] = &unk_100018CE0;
    v0[14] = v9;
    [v8 performRequest:v2 completion:v0 + 10];
    id v7 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v7);
}

uint64_t sub_10000AEA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_10000B1D4;
  }
  else {
    uint64_t v2 = sub_10000AFB4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000AFB4()
{
  uint64_t v16 = v0;
  uint64_t v1 = *(void **)(v0 + 120);

  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013B68();
  sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
  swift_bridgeObjectRetain_n();
  id v3 = sub_100013B48();
  os_log_type_t v4 = sub_100013D78();
  BOOL v5 = os_log_type_enabled(v3, v4);
  id v7 = *(void **)(v0 + 144);
  NSString v6 = *(void **)(v0 + 152);
  unint64_t v8 = *(void *)(v0 + 136);
  if (v5)
  {
    id v14 = *(void **)(v0 + 144);
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v13 = *(void **)(v0 + 152);
    id v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)id v10 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 80) = sub_10000F8DC(v9, v8, &v15);
    sub_100013DC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Stopped DMF managing app: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_10000B1D4()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013B68();
  sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
  swift_errorRetain();
  swift_errorRetain();
  id v3 = sub_100013B48();
  os_log_type_t v4 = sub_100013D88();
  BOOL v5 = os_log_type_enabled(v3, v4);
  NSString v6 = *(NSObject **)(v0 + 144);
  if (v5)
  {
    uint64_t v12 = *(void **)(v0 + 152);
    id v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)id v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v9;
    sub_100013DC8();
    *unint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to stop DMF managing app: %@", v7, 0xCu);
    sub_100002AE8(&qword_10001D0B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    NSString v6 = v3;
  }
  swift_errorRelease();

  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_10000B3FC(void *a1, uint64_t a2)
{
  v194 = a1;
  sub_100013BD8();
  ((void (*)(void))__chkstk_darwin)();
  v199 = (char *)v187 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000137C8();
  ((void (*)(void))__chkstk_darwin)();
  BOOL v5 = (char *)v187 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013BF8();
  ((void (*)(void))__chkstk_darwin)();
  id v7 = (char *)v187 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002AE8(&qword_10001CD18);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v10 = (char *)v187 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v187 - v11;
  v205 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v198 = a2;
  sub_10000DAEC(a2, (uint64_t)v187 - v11);
  uint64_t v13 = sub_100013AB8();
  uint64_t v14 = *(void *)(v13 - 8);
  v197 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v197(v12, 1, v13) == 1)
  {
    uint64_t v15 = v14;
    sub_10000E088((uint64_t)v12, &qword_10001CD18);
    sub_100013B98();
    sub_1000137B8();
    uint64_t v16 = sub_100013C28();
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = sub_100013A48();
    uint64_t v18 = v19;
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  }
  uint64_t v203 = sub_100002AE8(&qword_10001CD30);
  uint64_t v20 = swift_allocObject();
  long long v202 = xmmword_100014700;
  *(_OWORD *)(v20 + 16) = xmmword_100014700;
  sub_100013B98();
  sub_1000137B8();
  v200 = v7;
  *(void *)(v20 + 32) = sub_100013C28();
  *(void *)(v20 + 40) = v21;
  uint64_t v190 = v16;
  *(void *)(v20 + 48) = v16;
  *(void *)(v20 + 56) = v18;
  uint64_t v22 = v18;
  uint64_t v23 = v205;
  uint64_t v191 = v22;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v201 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v23 = sub_10000F554(0, *((void *)v23 + 2) + 1, 1, v23);
  }
  uint64_t v25 = v15;
  unint64_t v27 = *((void *)v23 + 2);
  unint64_t v26 = *((void *)v23 + 3);
  if (v27 >= v26 >> 1) {
    uint64_t v23 = sub_10000F554((char *)(v26 > 1), v27 + 1, 1, v23);
  }
  *((void *)v23 + 2) = v27 + 1;
  *(void *)&v23[8 * v27 + 32] = v20;
  v205 = v23;
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v202;
  sub_100013B98();
  sub_1000137B8();
  *(void *)(v28 + 32) = sub_100013C28();
  *(void *)(v28 + 40) = v29;
  sub_10000DAEC(v198, (uint64_t)v10);
  if (v197(v10, 1, v13) == 1)
  {
    sub_10000E088((uint64_t)v10, &qword_10001CD18);
    sub_100013B98();
    sub_1000137B8();
    *(void *)(v28 + 48) = sub_100013C28();
    *(void *)(v28 + 56) = v30;
  }
  else
  {
    uint64_t v31 = sub_100013AA8();
    uint64_t v33 = v32;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v13);
    *(void *)(v28 + 48) = v31;
    *(void *)(v28 + 56) = v33;
    uint64_t v23 = v205;
  }
  id v34 = v194;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v23 = sub_10000F554(0, *((void *)v23 + 2) + 1, 1, v23);
  }
  unint64_t v36 = *((void *)v23 + 2);
  unint64_t v35 = *((void *)v23 + 3);
  if (v36 >= v35 >> 1) {
    uint64_t v23 = sub_10000F554((char *)(v35 > 1), v36 + 1, 1, v23);
  }
  *((void *)v23 + 2) = v36 + 1;
  *(void *)&v23[8 * v36 + 32] = v28;
  sub_100013B98();
  sub_1000137B8();
  uint64_t v192 = sub_100013C28();
  uint64_t v38 = v37;
  id v39 = [v34 payloadAppStoreID];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v189 = v38;
    uint64_t v41 = sub_100013C18();
    uint64_t v43 = v42;

    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = v202;
  }
  else
  {
    id v45 = [v34 payloadManifestURL];
    if (!v45)
    {
      uint64_t v189 = v38;
      goto LABEL_22;
    }
    uint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_100013C18();
    uint64_t v43 = v47;

    sub_100013B98();
    sub_1000137B8();
    uint64_t v192 = sub_100013C28();
    uint64_t v189 = v48;
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = v202;
  }
  sub_100013B98();
  sub_1000137B8();
  *(void *)(v44 + 32) = sub_100013C28();
  *(void *)(v44 + 40) = v49;
  *(void *)(v44 + 48) = v41;
  *(void *)(v44 + 56) = v43;
  unint64_t v51 = *((void *)v23 + 2);
  unint64_t v50 = *((void *)v23 + 3);
  if (v51 >= v50 >> 1) {
    uint64_t v23 = sub_10000F554((char *)(v50 > 1), v51 + 1, 1, v23);
  }
  *((void *)v23 + 2) = v51 + 1;
  *(void *)&v23[8 * v51 + 32] = v44;
LABEL_22:
  id v52 = [v34 payloadInstallBehavior];
  if (!v52)
  {
    sub_100013C18();
    goto LABEL_28;
  }
  uint64_t v53 = v52;
  id v54 = [v52 payloadInstall];

  uint64_t v55 = sub_100013C18();
  uint64_t v57 = v56;

  uint64_t v58 = sub_100013C18();
  if (!v57)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  if (v55 == v58 && v57 == v59)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_100013F68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_30:
  sub_100013B98();
  sub_1000137B8();
  uint64_t v60 = sub_100013C28();
  uint64_t v62 = v61;
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = v202;
  sub_100013B98();
  sub_1000137B8();
  *(void *)(v63 + 32) = sub_100013C28();
  *(void *)(v63 + 40) = v64;
  *(void *)(v63 + 48) = v60;
  *(void *)(v63 + 56) = v62;
  unint64_t v66 = *((void *)v23 + 2);
  unint64_t v65 = *((void *)v23 + 3);
  if (v66 >= v65 >> 1) {
    uint64_t v23 = sub_10000F554((char *)(v65 > 1), v66 + 1, 1, v23);
  }
  *((void *)v23 + 2) = v66 + 1;
  *(void *)&v23[8 * v66 + 32] = v63;
  v205 = v23;
  sub_100013B98();
  sub_1000137B8();
  uint64_t v188 = sub_100013C28();
  uint64_t v193 = v67;
  sub_100013B98();
  sub_1000137B8();
  uint64_t v68 = sub_100013C28();
  uint64_t v70 = v69;
  if ([self isSharediPad])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = v202;
    sub_100013B98();
    sub_1000137B8();
    *(void *)(v71 + 32) = sub_100013C28();
    *(void *)(v71 + 40) = v72;
    id v73 = [v34 payloadIncludeInBackup];
    LOBYTE(v204) = 2;
    uint64_t result = sub_100013D28();
    char v75 = v204;
    if (v204 == 2)
    {
      __break(1u);
      return result;
    }

    if (v75)
    {
      swift_bridgeObjectRelease();
      uint64_t v70 = v193;
      swift_bridgeObjectRetain();
      uint64_t v68 = v188;
    }
    *(void *)(v71 + 48) = v68;
    *(void *)(v71 + 56) = v70;
    unint64_t v77 = *((void *)v23 + 2);
    unint64_t v76 = *((void *)v23 + 3);
    if (v77 >= v76 >> 1) {
      uint64_t v23 = sub_10000F554((char *)(v76 > 1), v77 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v77 + 1;
    *(void *)&v23[8 * v77 + 32] = v71;
    v205 = v23;
  }
  id v78 = [v34 payloadAttributes];
  if (v78)
  {
    Swift::String v79 = v78;
    sub_100013B98();
    sub_1000137B8();
    uint64_t v196 = sub_100013C28();
    v197 = v80;
    id v81 = [v79 payloadAssociatedDomains];
    v195 = v79;
    if (v81)
    {
      Swift::String v82 = v81;
      uint64_t v83 = sub_100013D08();

      uint64_t v84 = *(void *)(v83 + 16);
      if (v84)
      {
        swift_bridgeObjectRetain();
        uint64_t v85 = 0;
        v187[1] = v83;
        Swift::String v86 = (uint64_t *)(v83 + 40);
        uint64_t v198 = 0x8000000100014CC0;
        do
        {
          uint64_t v91 = *(v86 - 1);
          uint64_t v92 = *v86;
          ++v85;
          uint64_t v93 = swift_allocObject();
          *(_OWORD *)(v93 + 16) = v202;
          if (v84 == 1)
          {
            swift_bridgeObjectRetain();
            sub_100013B98();
            sub_1000137B8();
            *(void *)(v93 + 32) = sub_100013C28();
            *(void *)(v93 + 40) = v87;
            *(void *)(v93 + 48) = v91;
            *(void *)(v93 + 56) = v92;
            unint64_t v89 = *((void *)v23 + 2);
            unint64_t v88 = *((void *)v23 + 3);
            unint64_t v90 = v89 + 1;
            if (v89 >= v88 >> 1) {
              uint64_t v23 = sub_10000F554((char *)(v88 > 1), v89 + 1, 1, v23);
            }
          }
          else
          {
            swift_bridgeObjectRetain();
            sub_100013BC8();
            v206._countAndFlagsBits = 0xD000000000000020;
            v206._object = (void *)0x8000000100014C90;
            sub_100013BB8(v206);
            uint64_t v204 = v85;
            sub_100013BA8();
            v207._countAndFlagsBits = 0;
            v207._object = (void *)0xE000000000000000;
            sub_100013BB8(v207);
            sub_100013BE8();
            sub_1000137B8();
            *(void *)(v93 + 32) = sub_100013C28();
            *(void *)(v93 + 40) = v94;
            *(void *)(v93 + 48) = v91;
            *(void *)(v93 + 56) = v92;
            v205 = v23;
            unint64_t v89 = *((void *)v23 + 2);
            unint64_t v95 = *((void *)v23 + 3);
            unint64_t v90 = v89 + 1;
            if (v89 >= v95 >> 1)
            {
              uint64_t v23 = sub_10000F554((char *)(v95 > 1), v89 + 1, 1, v23);
              v205 = v23;
            }
          }
          v86 += 2;
          *((void *)v23 + 2) = v90;
          *(void *)&v23[8 * v89 + 32] = v93;
          v205 = v23;
        }
        while (v84 != v85);
        swift_bridgeObjectRelease();
        Swift::String v79 = v195;
      }
      swift_bridgeObjectRelease();
      id v34 = v194;
    }
    id v96 = [v79 payloadAssociatedDomainsEnableDirectDownloads];
    unsigned int v97 = [v96 BOOLValue];

    if (v97)
    {
      uint64_t v98 = swift_allocObject();
      *(_OWORD *)(v98 + 16) = v202;
      sub_100013B98();
      sub_1000137B8();
      *(void *)(v98 + 32) = sub_100013C28();
      *(void *)(v98 + 40) = v99;
      Swift::String v100 = v197;
      *(void *)(v98 + 48) = v196;
      *(void *)(v98 + 56) = v100;
      unint64_t v101 = *((void *)v23 + 2);
      unint64_t v102 = *((void *)v23 + 3);
      swift_bridgeObjectRetain();
      if (v101 >= v102 >> 1) {
        uint64_t v23 = sub_10000F554((char *)(v102 > 1), v101 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v101 + 1;
      *(void *)&v23[8 * v101 + 32] = v98;
      v205 = v23;
      Swift::String v79 = v195;
    }
    id v103 = [v79 payloadCellularSliceUUID];
    if (v103)
    {

      uint64_t v104 = swift_allocObject();
      *(_OWORD *)(v104 + 16) = v202;
      sub_100013B98();
      sub_1000137B8();
      *(void *)(v104 + 32) = sub_100013C28();
      *(void *)(v104 + 40) = v105;
      Swift::String v106 = v197;
      *(void *)(v104 + 48) = v196;
      *(void *)(v104 + 56) = v106;
      unint64_t v107 = *((void *)v23 + 2);
      unint64_t v108 = *((void *)v23 + 3);
      swift_bridgeObjectRetain();
      if (v107 >= v108 >> 1) {
        uint64_t v23 = sub_10000F554((char *)(v108 > 1), v107 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v107 + 1;
      *(void *)&v23[8 * v107 + 32] = v104;
      v205 = v23;
      Swift::String v79 = v195;
    }
    id v109 = [v79 payloadContentFilterUUID];
    if (v109)
    {

      uint64_t v110 = swift_allocObject();
      *(_OWORD *)(v110 + 16) = v202;
      sub_100013B98();
      sub_1000137B8();
      *(void *)(v110 + 32) = sub_100013C28();
      *(void *)(v110 + 40) = v111;
      Swift::String v112 = v197;
      *(void *)(v110 + 48) = v196;
      *(void *)(v110 + 56) = v112;
      unint64_t v113 = *((void *)v23 + 2);
      unint64_t v114 = *((void *)v23 + 3);
      swift_bridgeObjectRetain();
      if (v113 >= v114 >> 1) {
        uint64_t v23 = sub_10000F554((char *)(v114 > 1), v113 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v113 + 1;
      *(void *)&v23[8 * v113 + 32] = v110;
      v205 = v23;
      Swift::String v79 = v195;
    }
    id v115 = [v79 payloadDNSProxyUUID];
    if (v115)
    {

      uint64_t v116 = swift_allocObject();
      *(_OWORD *)(v116 + 16) = v202;
      sub_100013B98();
      sub_1000137B8();
      *(void *)(v116 + 32) = sub_100013C28();
      *(void *)(v116 + 40) = v117;
      Swift::String v118 = v197;
      *(void *)(v116 + 48) = v196;
      *(void *)(v116 + 56) = v118;
      unint64_t v119 = *((void *)v23 + 2);
      unint64_t v120 = *((void *)v23 + 3);
      swift_bridgeObjectRetain();
      if (v119 >= v120 >> 1) {
        uint64_t v23 = sub_10000F554((char *)(v120 > 1), v119 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v119 + 1;
      *(void *)&v23[8 * v119 + 32] = v116;
      v205 = v23;
      Swift::String v79 = v195;
    }
    id v121 = [v79 payloadRelayUUID];
    if (v121)
    {

      uint64_t v122 = swift_allocObject();
      *(_OWORD *)(v122 + 16) = v202;
      sub_100013B98();
      sub_1000137B8();
      *(void *)(v122 + 32) = sub_100013C28();
      *(void *)(v122 + 40) = v123;
      v124 = v197;
      *(void *)(v122 + 48) = v196;
      *(void *)(v122 + 56) = v124;
      unint64_t v125 = *((void *)v23 + 2);
      unint64_t v126 = *((void *)v23 + 3);
      swift_bridgeObjectRetain();
      if (v125 >= v126 >> 1) {
        uint64_t v23 = sub_10000F554((char *)(v126 > 1), v125 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v125 + 1;
      *(void *)&v23[8 * v125 + 32] = v122;
      v205 = v23;
      Swift::String v79 = v195;
    }
    id v127 = [v79 payloadTapToPayScreenLock];
    unsigned int v128 = [v127 BOOLValue];

    if (v128)
    {
      uint64_t v129 = swift_allocObject();
      *(_OWORD *)(v129 + 16) = v202;
      sub_100013B98();
      sub_1000137B8();
      *(void *)(v129 + 32) = sub_100013C28();
      *(void *)(v129 + 40) = v130;
      v131 = v197;
      *(void *)(v129 + 48) = v196;
      *(void *)(v129 + 56) = v131;
      v205 = v23;
      unint64_t v132 = *((void *)v23 + 2);
      unint64_t v133 = *((void *)v23 + 3);
      swift_bridgeObjectRetain();
      if (v132 >= v133 >> 1)
      {
        uint64_t v23 = sub_10000F554((char *)(v133 > 1), v132 + 1, 1, v23);
        v205 = v23;
      }
      *((void *)v23 + 2) = v132 + 1;
      *(void *)&v23[8 * v132 + 32] = v129;
    }
    id v134 = [v79 payloadVPNUUID];
    if (v134)
    {

      uint64_t v135 = swift_allocObject();
      uint64_t v136 = sub_10000F8CC(v135, 2);
      v138 = v137;
      sub_100013B98();
      sub_1000137B8();
      uint64_t *v138 = sub_100013C28();
      v138[1] = v139;
      v140 = v197;
      v138[2] = v196;
      v138[3] = (uint64_t)v140;
      uint64_t v141 = nullsub_1(v136);
      sub_100005A18();
      v142 = v205;
      unint64_t v144 = *((void *)v205 + 2);
      unint64_t v143 = *((void *)v205 + 3);
      if (v144 >= v143 >> 1)
      {
        v142 = sub_10000F554((char *)(v143 > 1), v144 + 1, 1, v205);
        v205 = v142;
      }
      *((void *)v142 + 2) = v144 + 1;
      *(void *)&v142[8 * v144 + 32] = v141;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  id v145 = [v34 payloadAppConfigAssetReference];
  if (v145)
  {

    uint64_t v146 = swift_allocObject();
    *(_OWORD *)(v146 + 16) = v202;
    sub_100013B98();
    sub_1000137B8();
    *(void *)(v146 + 32) = sub_100013C28();
    *(void *)(v146 + 40) = v147;
    uint64_t v148 = v193;
    *(void *)(v146 + 48) = v188;
    *(void *)(v146 + 56) = v148;
    v149 = v205;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v149 = sub_10000F554(0, *((void *)v149 + 2) + 1, 1, v149);
    }
    unint64_t v151 = *((void *)v149 + 2);
    unint64_t v150 = *((void *)v149 + 3);
    if (v151 >= v150 >> 1) {
      v149 = sub_10000F554((char *)(v150 > 1), v151 + 1, 1, v149);
    }
    *((void *)v149 + 2) = v151 + 1;
    *(void *)&v149[8 * v151 + 32] = v146;
    v205 = v149;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v152 = [v34 payloadPasswordAppConfigs];
  if (v152)
  {
    v153 = v152;
    sub_10000E288(0, &qword_10001CD40);
    unint64_t v154 = sub_100013D08();

    uint64_t v155 = swift_allocObject();
    *(_OWORD *)(v155 + 16) = v202;
    sub_100013B98();
    sub_1000137B8();
    *(void *)(v155 + 32) = sub_100013C28();
    *(void *)(v155 + 40) = v156;
    if (v154 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v157 = sub_100013F08();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v157 = *(void *)((v154 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v204 = v157;
    *(void *)(v155 + 48) = sub_100013F58();
    *(void *)(v155 + 56) = v158;
    v159 = v205;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v159 = sub_10000F554(0, *((void *)v159 + 2) + 1, 1, v159);
    }
    unint64_t v161 = *((void *)v159 + 2);
    unint64_t v160 = *((void *)v159 + 3);
    if (v161 >= v160 >> 1) {
      v159 = sub_10000F554((char *)(v160 > 1), v161 + 1, 1, v159);
    }
    *((void *)v159 + 2) = v161 + 1;
    *(void *)&v159[8 * v161 + 32] = v155;
    v205 = v159;
  }
  id v162 = [v34 payloadIdentityAppConfigs];
  if (v162)
  {
    v163 = v162;
    sub_10000E288(0, &qword_10001CD40);
    unint64_t v164 = sub_100013D08();

    uint64_t v165 = swift_allocObject();
    *(_OWORD *)(v165 + 16) = v202;
    sub_100013B98();
    sub_1000137B8();
    *(void *)(v165 + 32) = sub_100013C28();
    *(void *)(v165 + 40) = v166;
    if (v164 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v167 = sub_100013F08();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v167 = *(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v204 = v167;
    *(void *)(v165 + 48) = sub_100013F58();
    *(void *)(v165 + 56) = v168;
    v169 = v205;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v169 = sub_10000F554(0, *((void *)v169 + 2) + 1, 1, v169);
    }
    unint64_t v171 = *((void *)v169 + 2);
    unint64_t v170 = *((void *)v169 + 3);
    if (v171 >= v170 >> 1) {
      v169 = sub_10000F554((char *)(v170 > 1), v171 + 1, 1, v169);
    }
    *((void *)v169 + 2) = v171 + 1;
    *(void *)&v169[8 * v171 + 32] = v165;
    v205 = v169;
  }
  id v172 = [v34 payloadCertificateAppConfigs];
  if (v172)
  {
    v173 = v172;
    sub_10000E288(0, &qword_10001CD40);
    unint64_t v174 = sub_100013D08();

    uint64_t v175 = swift_allocObject();
    *(_OWORD *)(v175 + 16) = v202;
    sub_100013B98();
    sub_1000137B8();
    *(void *)(v175 + 32) = sub_100013C28();
    *(void *)(v175 + 40) = v176;
    if (v174 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v177 = sub_100013F08();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v177 = *(void *)((v174 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v204 = v177;
    *(void *)(v175 + 48) = sub_100013F58();
    *(void *)(v175 + 56) = v178;
    v179 = v205;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v179 = sub_10000F554(0, *((void *)v179 + 2) + 1, 1, v179);
    }
    unint64_t v181 = *((void *)v179 + 2);
    unint64_t v180 = *((void *)v179 + 3);
    if (v181 >= v180 >> 1) {
      v179 = sub_10000F554((char *)(v180 > 1), v181 + 1, 1, v179);
    }
    *((void *)v179 + 2) = v181 + 1;
    *(void *)&v179[8 * v181 + 32] = v175;
    v205 = v179;
  }
  v182 = self;
  NSString v183 = sub_100013C08();
  swift_bridgeObjectRelease();
  NSString v184 = sub_100013C08();
  swift_bridgeObjectRelease();
  sub_100002AE8(&qword_10001CD38);
  Class isa = sub_100013CF8().super.isa;
  swift_bridgeObjectRelease();
  id v186 = [v182 configurationUIWithTitle:v183 description:v184 details:isa];

  return (uint64_t)v186;
}

uint64_t sub_10000CF24(uint64_t a1)
{
  v1[5] = a1;
  sub_100002AE8(&qword_10001CD18);
  v1[6] = swift_task_alloc();
  uint64_t v2 = sub_100013B18();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  return _swift_task_switch(sub_10000D014, 0, 0);
}

uint64_t sub_10000D014()
{
  uint64_t v32 = v0;
  if (qword_10001CC30 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = sub_100013B68();
  *(void *)(v0 + 80) = sub_10000DA60(v2, (uint64_t)qword_10001D3B0);
  id v3 = v1;
  uint64_t v4 = sub_100013B48();
  os_log_type_t v5 = sub_100013D78();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = *(void **)(v0 + 40);
  uint64_t v8 = &ManagedAppsAdapter;
  if (v6)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    id v10 = [v7 declaration];
    id v11 = [v10 declarationIdentifier];

    uint64_t v12 = sub_100013C18();
    unint64_t v14 = v13;

    uint64_t v15 = v12;
    uint64_t v8 = &ManagedAppsAdapter;
    *(void *)(v0 + 32) = sub_10000F8DC(v15, v14, &v31);
    sub_100013DC8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Get configuration UI for: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v16 = [*(id *)(v0 + 40) (SEL)v8[255].count];
  *(void *)(v0 + 88) = v16;
  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  *(void *)(v0 + 96) = v17;
  if (v17)
  {
    uint64_t v18 = *(void *)(v0 + 40);
    uint64_t v19 = self;
    id v20 = v16;
    NSString v21 = sub_100013C08();
    id v22 = [v19 newDeclarationKeyWithSubscriberIdentifier:v21 reference:v18];
    *(void *)(v0 + 104) = v22;

    id v23 = [v22 key];
    sub_100013C18();

    sub_100013AF8();
    unint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v24;
    *unint64_t v24 = v0;
    v24[1] = sub_10000D47C;
    return DDMDeclarationStatusRequest.request()();
  }
  else
  {

    uint64_t v25 = sub_100013B48();
    os_log_type_t v26 = sub_100013D88();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Invalid configuration type in configurationUI", v27, 2u);
      swift_slowDealloc();
    }

    sub_10000DA98();
    swift_allocError();
    *(void *)uint64_t v28 = 0xD00000000000002DLL;
    *(void *)(v28 + 8) = 0x8000000100014A70;
    *(unsigned char *)(v28 + 16) = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29(0);
  }
}

uint64_t sub_10000D47C(uint64_t a1)
{
  *(void *)(*(void *)v2 + 120) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    id v3 = sub_10000D8E8;
  }
  else
  {
    id v3 = sub_10000D598;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000D598()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2 == 1) {
    goto LABEL_7;
  }
  id v3 = *(id *)(v0 + 104);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100013B48();
  os_log_type_t v5 = sub_100013D88();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = *(void **)(v0 + 104);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    os_log_type_t type = v5;
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138543618;
    *(void *)(v0 + 16) = v7;
    id v10 = v7;
    sub_100013DC8();
    *uint64_t v9 = v7;

    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v0 + 24) = v2;
    sub_100013DC8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, type, "Invalid status returned for: %{public}@ - count: %ld", (uint8_t *)v8, 0x16u);
    sub_100002AE8(&qword_10001D0B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v4 = *(NSObject **)(v0 + 104);
  }

  if (*(void *)(v1 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 120);
LABEL_7:
    uint64_t v11 = *(void *)(v0 + 48);
    uint64_t v12 = sub_100013AB8();
    uint64_t v13 = *(void *)(v12 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 16))(v11, v1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v12);
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = sub_100013AB8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = 1;
LABEL_9:
  uint64_t v15 = *(void **)(v0 + 96);
  id v16 = *(void **)(v0 + 104);
  uint64_t v17 = *(void **)(v0 + 88);
  uint64_t v19 = *(void *)(v0 + 64);
  uint64_t v18 = *(void *)(v0 + 72);
  uint64_t v20 = *(void *)(v0 + 48);
  uint64_t v25 = *(void *)(v0 + 56);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v20, v14, 1, v12);
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_10000B3FC(v15, v20);

  sub_10000E088(v20, &qword_10001CD18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  id v22 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v22(1, v21);
}

uint64_t sub_10000D8E8()
{
  uint64_t v1 = sub_100013B48();
  os_log_type_t v2 = sub_100013D88();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to get app status for configurationUI", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = (void *)v0[13];
  os_log_type_t v5 = (void *)v0[11];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v8 = v0[7];

  sub_10000DA98();
  swift_allocError();
  *(void *)uint64_t v9 = 0xD00000000000002CLL;
  *(void *)(v9 + 8) = 0x8000000100014AD0;
  *(unsigned char *)(v9 + 16) = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  id v10 = (uint64_t (*)(void))v0[1];
  return v10(0);
}

uint64_t sub_10000DA60(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000DA98()
{
  unint64_t result = qword_10001CD20;
  if (!qword_10001CD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD20);
  }
  return result;
}

uint64_t sub_10000DAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002AE8(&qword_10001CD18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000DB54(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000DBBC()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000DC04()
{
  os_log_type_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  os_log_type_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000E670;
  uint64_t v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_10001CD50 + dword_10001CD50);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000DCCC()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000DD14()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10001CD98 + dword_10001CD98);
  v4[2] = v2;
  v4[3] = v3;
  v4[1] = sub_10000E670;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v4[4] = v5;
  *os_log_type_t v5 = v4;
  v5[1] = sub_1000046BC;
  return v7(v2, v3);
}

uint64_t sub_10000DE10()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DE48(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_1000055BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001CD88 + dword_10001CD88);
  return v6(a1, v4);
}

uint64_t sub_10000DF00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002AE8(&qword_10001CDA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DF68()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000DFB8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  os_log_type_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10000E670;
  uint64_t v8 = (uint64_t (*)(void *, void *, uint64_t, void *, void *))((char *)&dword_10001CDC0 + dword_10001CDC0);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_10000E088(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002AE8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000E0E4()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000E124()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10000E670;
  os_log_type_t v5 = (uint64_t (*)(uint64_t, void *))((char *)&dword_10001CE08 + dword_10001CE08);
  return v5(v2, v3);
}

uint64_t sub_10000E1E0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_10000E220()
{
  unint64_t result = qword_10001CE38;
  if (!qword_10001CE38)
  {
    sub_10000E288(255, &qword_10001CE30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CE38);
  }
  return result;
}

uint64_t sub_10000E288(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000E2C8(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    case 6:
    case 7:
      uint64_t result = swift_errorRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ManagedAppsAdapter.AdapterError(uint64_t a1)
{
  return sub_10000E338(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10000E338(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 6:
    case 7:
      uint64_t result = swift_errorRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s21ManagedAppsSubscriber18ManagedAppsAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000E2C8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ManagedAppsAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000E2C8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000E338(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ManagedAppsAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ManagedAppsAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000E338(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAppsAdapter.AdapterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF8 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 248);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 8) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagedAppsAdapter.AdapterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF7)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 248;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF8) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF8) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10000E524(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 7u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 8);
  }
}

uint64_t sub_10000E540(uint64_t result, unsigned int a2)
{
  if (a2 >= 8)
  {
    *(void *)__n128 result = a2 - 8;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 8;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ManagedAppsAdapter.AdapterError()
{
  return &type metadata for ManagedAppsAdapter.AdapterError;
}

unint64_t sub_10000E570()
{
  unint64_t result = qword_10001CE60;
  if (!qword_10001CE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CE60);
  }
  return result;
}

unint64_t sub_10000E5C8()
{
  unint64_t result = qword_10001CE68;
  if (!qword_10001CE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CE68);
  }
  return result;
}

unint64_t sub_10000E61C()
{
  unint64_t result = qword_10001CE70;
  if (!qword_10001CE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CE70);
  }
  return result;
}

id sub_10000E820()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagedAppsApplicator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ManagedAppsApplicator()
{
  return self;
}

uint64_t sub_10000E878()
{
  uint64_t v0 = sub_100013B68();
  sub_10000DB54(v0, qword_10001D3C8);
  sub_10000DA60(v0, (uint64_t)qword_10001D3C8);
  type metadata accessor for ManagedAppsStatus();
  sub_100002AE8((uint64_t *)&unk_10001D108);
  sub_100013C38();
  return sub_100013B58();
}

unint64_t sub_10000E9DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002AE8(&qword_10001D0C0);
  uint64_t v2 = sub_100013F38();
  unsigned int v3 = (void *)v2;
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
    sub_1000136D4(v6, (uint64_t)&v15, &qword_10001D100);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000FFB0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000135D4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
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

uint64_t sub_10000EC98(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v7 = sub_100013D08();
  v4[5] = v7;
  uint64_t v12 = (uint64_t (*)(uint64_t, id))((char *)&dword_10001D0A0 + dword_10001D0A0);
  id v8 = a2;
  id v9 = a4;
  char v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *char v10 = v4;
  v10[1] = sub_10000ED90;
  return v12(v7, v8);
}

uint64_t sub_10000ED90()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v7 = sub_100013788();
    swift_errorRelease();
    Class isa = 0;
    id v9 = (void *)v7;
  }
  else
  {
    Class isa = sub_100013B78().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    id v9 = isa;
  }
  char v10 = *(void (***)(void, void, void))(v3 + 32);
  ((void (**)(void, Class, uint64_t))v10)[2](v10, isa, v7);

  _Block_release(v10);
  uint64_t v11 = *(uint64_t (**)(void))(v6 + 8);
  return v11();
}

id sub_10000EFAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagedAppsStatus();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ManagedAppsStatus()
{
  return self;
}

uint64_t sub_10000F008()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F058()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000055BC;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_10001D060 + dword_10001D060);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000F118(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000E670;
  return v6();
}

uint64_t sub_10000F1E8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000E670;
  return v7();
}

uint64_t sub_10000F2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013D58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100013D48();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E088(a1, &qword_10001CCE8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100013D38();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000F464()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F49C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000055BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001D090 + dword_10001D090);
  return v6(a1, v4);
}

char *sub_10000F554(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100002AE8((uint64_t *)&unk_10001D120);
      char v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000107A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F664(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100002AE8(&qword_10001D0C8);
  uint64_t v10 = *(void *)(sub_100013AB8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_100013EF8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100013AB8() - 8);
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
    sub_100010A50(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10000F8CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_10000F8DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000F9B0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100013634((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100013634((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000135E4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000F9B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100013DD8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000FB6C(a5, a6);
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
  uint64_t v8 = sub_100013E98();
  if (!v8)
  {
    sub_100013EF8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100013F48();
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

uint64_t sub_10000FB6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000FC04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000FE60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000FE60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000FC04(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000FD7C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100013E88();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100013EF8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100013C78();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100013F48();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100013EF8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000FD7C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100002AE8(&qword_10001D0F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000FDE4(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100013CC8();
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
    uint64_t v5 = sub_100013C98();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10000FE60(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002AE8(&qword_10001D0F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100013F48();
  __break(1u);
  return result;
}

unint64_t sub_10000FFB0(uint64_t a1, uint64_t a2)
{
  sub_100013FD8();
  sub_100013C58();
  Swift::Int v4 = sub_100013FE8();

  return sub_100010328(a1, a2, v4);
}

uint64_t sub_100010028(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_100002AE8(&qword_10001D0C0);
  uint64_t v6 = sub_100013F28();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              char v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1000135D4(v24, v35);
      }
      else
      {
        sub_100013634((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_100013FD8();
      sub_100013C58();
      uint64_t result = sub_100013FE8();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      BOOL v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *BOOL v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1000135D4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unint64_t sub_100010328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100013F68() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100013F68() & 1) == 0);
    }
  }
  return v6;
}

void *sub_10001040C()
{
  uint64_t v1 = v0;
  sub_100002AE8(&qword_10001D0C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100013F18();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100013634(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_1000135D4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000105F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100010614(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100010614(char a1, int64_t a2, char a3, void *a4)
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
    sub_100002AE8(&qword_10001D0E8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100002AE8(&qword_10001D0F0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100013F48();
  __break(1u);
  return result;
}

uint64_t sub_1000107A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100002AE8(&qword_10001CD38);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100013F48();
  __break(1u);
  return result;
}

Swift::Int sub_1000108AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100002AE8(&qword_10001D118);
    uint64_t v3 = sub_100013E68();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100013FD8();
      swift_bridgeObjectRetain();
      sub_100013C58();
      Swift::Int result = sub_100013FE8();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_100013F68(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_100013F68();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100010A50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_100013AB8() - 8);
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
  uint64_t result = sub_100013F48();
  __break(1u);
  return result;
}

uint64_t sub_100010BA8(uint64_t a1)
{
  uint64_t v2 = sub_100013A68();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v19 - v7, a1, v2);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v8, v2);
  if (v10 == enum case for ManagedAppStatus.State.optional(_:)
    || v10 == enum case for ManagedAppStatus.State.queued(_:)
    || v10 == enum case for ManagedAppStatus.State.promptingForConsent(_:)
    || v10 == enum case for ManagedAppStatus.State.promptingForLogin(_:)
    || v10 == enum case for ManagedAppStatus.State.promptingForManagement(_:)
    || v10 == enum case for ManagedAppStatus.State.downloading(_:)
    || v10 == enum case for ManagedAppStatus.State.installing(_:)
    || v10 == enum case for ManagedAppStatus.State.managed(_:)
    || v10 == enum case for ManagedAppStatus.State.managedButUninstalled(_:)
    || v10 == enum case for ManagedAppStatus.State.failed(_:))
  {
    return sub_100013C18();
  }
  if (qword_10001CC38 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100013B68();
  sub_10000DA60(v12, (uint64_t)qword_10001D3C8);
  v9(v6, a1, v2);
  uint64_t v13 = sub_100013B48();
  os_log_type_t v14 = sub_100013D88();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v22 = v20;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v16 = sub_100013A58();
    uint64_t v21 = sub_10000F8DC(v16, v17, &v22);
    sub_100013DC8();
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v6, v2);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Unknown managed app state:%s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v6, v2);
  }

  v18(v8, v2);
  return 0;
}

uint64_t sub_100010FC0(uint64_t a1)
{
  uint64_t v2 = sub_100002AE8(&qword_10001D0D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000139B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v26 - v11;
  __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v26 - v13;
  sub_1000136D4(a1, (uint64_t)v4, &qword_10001D0D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000E088((uint64_t)v4, &qword_10001D0D0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v4, v5);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v16(v12, v14, v5);
    int v17 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v12, v5);
    if (v17 == enum case for ManagedAppStatus.UpdateState.available(_:)
      || v17 == enum case for ManagedAppStatus.UpdateState.promptingForUpdate(_:)
      || v17 == enum case for ManagedAppStatus.UpdateState.promptingForUpdateLogin(_:)
      || v17 == enum case for ManagedAppStatus.UpdateState.updating(_:)
      || v17 == enum case for ManagedAppStatus.UpdateState.failed(_:))
    {
      uint64_t v15 = sub_100013C18();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      return v15;
    }
    if (qword_10001CC38 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100013B68();
    sub_10000DA60(v19, (uint64_t)qword_10001D3C8);
    v16(v9, v14, v5);
    uint64_t v20 = sub_100013B48();
    os_log_type_t v21 = sub_100013D88();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v29 = v27;
      *(_DWORD *)uint64_t v22 = 136315138;
      unint64_t v26 = v22 + 4;
      uint64_t v23 = sub_1000139A8();
      uint64_t v28 = sub_10000F8DC(v23, v24, &v29);
      sub_100013DC8();
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
      v25(v9, v5);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Unknown managed app update state: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
      v25(v9, v5);
    }
    v25(v14, v5);
    v25(v12, v5);
  }
  return 0;
}

uint64_t sub_100011450(uint64_t a1)
{
  unint64_t v2 = 0xD000000000000012;
  uint64_t v3 = sub_100013A88();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v7 == enum case for ManagedAppStatus.Reason.unmanagedAppAlreadyInstalled(_:)) {
    return 0xD000000000000022;
  }
  if (v7 == enum case for ManagedAppStatus.Reason.duplicateConfiguredApp(_:)) {
    return 0xD00000000000001CLL;
  }
  if (v7 == enum case for ManagedAppStatus.Reason.appStoreDisabled(_:)) {
    return 0xD000000000000016;
  }
  if (v7 != enum case for ManagedAppStatus.Reason.couldNotVerifyAppID(_:))
  {
    if (v7 == enum case for ManagedAppStatus.Reason.notAnApp(_:))
    {
      return 0x6F4E2E726F727245;
    }
    else if (v7 == enum case for ManagedAppStatus.Reason.notSupported(_:))
    {
      return 0;
    }
    else if (v7 == enum case for ManagedAppStatus.Reason.licenseNotFound(_:))
    {
      return 0xD000000000000015;
    }
    else if (v7 == enum case for ManagedAppStatus.Reason.downloadFailed(_:))
    {
      return 0xD000000000000014;
    }
    else if (v7 == enum case for ManagedAppStatus.Reason.installFailed(_:))
    {
      return 0xD000000000000013;
    }
    else if (v7 != enum case for ManagedAppStatus.Reason.userRejected(_:))
    {
      if (v7 == enum case for ManagedAppStatus.Reason.updateAvailable(_:))
      {
        return 0xD000000000000014;
      }
      else if (v7 != enum case for ManagedAppStatus.Reason.updateFailed(_:))
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        return 0x6E552E726F727245;
      }
    }
  }
  return v2;
}

void *sub_100011738(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  sub_100013EC8();
  uint64_t v3 = *(void *)(sub_100013A88() - 8);
  uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = self;
  uint64_t v6 = *(void *)(v3 + 72);
  do
  {
    sub_100011450(v4);
    NSString v7 = sub_100013C08();
    swift_bridgeObjectRelease();
    id v8 = [v5 buildRequiredOnlyWithCode:v7];

    sub_100013EA8();
    sub_100013ED8();
    sub_100013EE8();
    sub_100013EB8();
    v4 += v6;
    --v1;
  }
  while (v1);
  return &_swiftEmptyArrayStorage;
}

id sub_10001188C()
{
  uint64_t v0 = sub_100002AE8(&qword_10001D0D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v42 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100013A68();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  __chkstk_darwin(v2);
  id v39 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002AE8(&qword_10001D0D8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  NSString v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v38 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v38 - v11;
  sub_100013AA8();
  NSString v45 = sub_100013C08();
  swift_bridgeObjectRelease();
  sub_100013A38();
  NSString v44 = sub_100013C08();
  swift_bridgeObjectRelease();
  sub_100013A48();
  NSString v43 = sub_100013C08();
  swift_bridgeObjectRelease();
  sub_100013A28();
  uint64_t v13 = sub_100013A18();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13) == 1)
  {
    sub_10000E088((uint64_t)v12, &qword_10001D0D8);
  }
  else
  {
    sub_1000139F8();
    char v17 = v16;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    if ((v17 & 1) == 0)
    {
      v18.super.super.Class isa = sub_100013FF8().super.super.isa;
      goto LABEL_6;
    }
  }
  v18.super.super.Class isa = 0;
LABEL_6:
  sub_100013A28();
  if (v15(v10, 1, v13) == 1)
  {
    sub_10000E088((uint64_t)v10, &qword_10001D0D8);
    NSString v19 = 0;
  }
  else
  {
    sub_100013A08();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
    NSString v19 = sub_100013C08();
    swift_bridgeObjectRelease();
  }
  sub_100013A28();
  if (v15(v7, 1, v13) == 1)
  {
    sub_10000E088((uint64_t)v7, &qword_10001D0D8);
    NSString v20 = 0;
  }
  else
  {
    sub_1000139E8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v13);
    NSString v20 = sub_100013C08();
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = (uint64_t)v39;
  sub_100013A78();
  sub_100010BA8(v21);
  uint64_t v23 = v22;
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v21, v41);
  if (v23)
  {
    NSString v24 = sub_100013C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v24 = 0;
  }
  uint64_t v25 = (uint64_t)v42;
  sub_1000139C8();
  sub_100010FC0(v25);
  uint64_t v27 = v26;
  sub_10000E088(v25, &qword_10001D0D0);
  if (v27)
  {
    NSString v28 = sub_100013C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v28 = 0;
  }
  uint64_t v29 = sub_100013A98();
  BOOL v30 = sub_100011738(v29);
  swift_bridgeObjectRelease();
  if (v30)
  {
    sub_100013694();
    v31.super.Class isa = sub_100013CF8().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v31.super.Class isa = 0;
  }
  uint64_t v32 = self;
  id v34 = v44;
  int64_t v33 = v45;
  unint64_t v35 = v43;
  id v36 = [v32 buildWithIdentifier:v45 removed:0 declarationIdentifier:v44 name:v43 externalVersionId:v18.super.super.isa version:v19 shortVersion:v20 state:v24 updateState:v28 reasons:v31.super.isa];

  return v36;
}

uint64_t sub_100011DB8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100013AB8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  uint64_t v3 = sub_100013B18();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_100011EF0, 0, 0);
}

uint64_t sub_100011EF0()
{
  sub_100013AF8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_100011F94;
  return DDMDeclarationStatusRequest.request()();
}

uint64_t sub_100011F94(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100012564;
  }
  else {
    uint64_t v4 = sub_1000120A8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000120A8()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    int64_t v28 = _swiftEmptyArrayStorage[2];
    if (v28) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
  uint64_t v3 = v0[4];
  uint64_t v4 = self;
  uint64_t v5 = *(void (**)(void, uint64_t, void))(v3 + 16);
  v3 += 16;
  id v46 = (id)v4;
  uint64_t v48 = v5;
  unint64_t v43 = (*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64);
  uint64_t v6 = v1 + v43;
  uint64_t v7 = *(void *)(v3 + 56);
  NSString v44 = (void (**)(uint64_t, uint64_t))(v3 - 8);
  uint64_t v42 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  uint64_t v45 = v7;
  do
  {
    uint64_t v10 = (void *)v0[2];
    v48(v0[7], v6, v0[3]);
    sub_1000139D8();
    NSString v11 = sub_100013C08();
    swift_bridgeObjectRelease();
    id v12 = [v46 newDeclarationKey:v11];

    id v13 = [v12 storeIdentifier];
    uint64_t v14 = sub_100013C18();
    uint64_t v16 = v15;

    id v17 = [v10 identifier];
    uint64_t v18 = sub_100013C18();
    uint64_t v20 = v19;

    if (v14 == v18 && v16 == v20)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v22 = sub_100013F68();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        (*v44)(v0[7], v0[3]);

        uint64_t v9 = v45;
        goto LABEL_4;
      }
    }
    v48(v0[6], v0[7], v0[3]);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = (char *)sub_10000F664(0, *((void *)v8 + 2) + 1, 1, (unint64_t)v8);
    }
    unint64_t v24 = *((void *)v8 + 2);
    unint64_t v23 = *((void *)v8 + 3);
    if (v24 >= v23 >> 1) {
      uint64_t v8 = (char *)sub_10000F664(v23 > 1, v24 + 1, 1, (unint64_t)v8);
    }
    uint64_t v25 = v0[6];
    uint64_t v26 = v0[7];
    uint64_t v27 = v0[3];
    *((void *)v8 + 2) = v24 + 1;
    uint64_t v9 = v45;
    (*v42)(&v8[v43 + v24 * v45], v25, v27);

    (*v44)(v26, v27);
LABEL_4:
    v6 += v9;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  int64_t v28 = *((void *)v8 + 2);
  if (!v28)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
LABEL_18:
  uint64_t v29 = v0[4];
  swift_bridgeObjectRetain();
  sub_1000105F4(0, v28, 0);
  NSArray v31 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 16);
  uint64_t v30 = v29 + 16;
  uint64_t v32 = &v8[(*(unsigned __int8 *)(v30 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 64)];
  uint64_t v47 = *(char **)(v30 + 56);
  uint64_t v49 = v31;
  do
  {
    uint64_t v33 = v0[5];
    uint64_t v34 = v0[3];
    v49(v33, v32, v34);
    id v35 = sub_10001188C();
    id v36 = [v35 serializeWithType:1];

    uint64_t v37 = sub_100013B88();
    (*(void (**)(uint64_t, uint64_t))(v30 - 8))(v33, v34);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_1000105F4(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v39 = _swiftEmptyArrayStorage[2];
    unint64_t v38 = _swiftEmptyArrayStorage[3];
    if (v39 >= v38 >> 1) {
      sub_1000105F4(v38 > 1, v39 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v39 + 1;
    _swiftEmptyArrayStorage[v39 + 4] = v37;
    uint64_t v32 = &v47[(void)v32];
    --v28;
  }
  while (v28);
  swift_bridgeObjectRelease_n();
LABEL_27:
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(void *))v0[1];
  return v40(_swiftEmptyArrayStorage);
}

uint64_t sub_100012564()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100012608(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return _swift_task_switch(sub_100012628, 0, 0);
}

uint64_t sub_100012628()
{
  uint64_t v26 = v0;
  if (qword_10001CC38 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100013B68();
  v0[27] = sub_10000DA60(v1, (uint64_t)qword_10001D3C8);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_100013B48();
  os_log_type_t v3 = sub_100013D78();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100013D18();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[24] = sub_10000F8DC(v5, v7, &v25);
    sub_100013DC8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Querying status for key paths:%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = v0[25];
  unint64_t v9 = sub_10000E9DC((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v10 = *(void *)(v8 + 16);
  v0[28] = v10;
  if (v10)
  {
    v0[29] = RMModelStatusItemAppManagedList;
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    while (1)
    {
      v0[30] = v9;
      v0[31] = v11;
      uint64_t v12 = v0[25] + 16 * v11;
      uint64_t v13 = *(void *)(v12 + 32);
      v0[32] = v13;
      unint64_t v14 = *(void *)(v12 + 40);
      v0[33] = v14;
      if (v13 == sub_100013C18() && v14 == v15) {
        break;
      }
      char v17 = sub_100013F68();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v17) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100013B48();
      os_log_type_t v19 = sub_100013D88();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v20 + 4) = sub_10000F8DC(v13, v14, &v25);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Ignoring unknown status key path: %s", (uint8_t *)v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v11 = v0[31] + 1;
      if (v11 == v0[28])
      {
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    uint64_t v21 = (void *)swift_task_alloc();
    v0[34] = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_100012A90;
    uint64_t v22 = v0[26];
    return sub_100011DB8(v22);
  }
  else
  {
LABEL_21:
    unint64_t v24 = (uint64_t (*)(unint64_t))v0[1];
    return v24(v9);
  }
}

uint64_t sub_100012A90(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 280) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100012FE8;
  }
  else
  {
    *(void *)(v4 + 288) = a1;
    uint64_t v5 = sub_100012BB8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100012BB8()
{
  uint64_t v40 = v0;
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v5 = sub_100002AE8(&qword_10001D0B8);
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 40) = v5;
  sub_1000135D4((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 80));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 184) = v4;
  unint64_t v8 = sub_10000FFB0(v3, v2);
  uint64_t v9 = *(void *)(v4 + 16);
  BOOL v10 = (v7 & 1) == 0;
  uint64_t v11 = (_OWORD *)(v9 + v10);
  if (__OFADD__(v9, v10))
  {
    __break(1u);
    goto LABEL_32;
  }
  char v12 = v7;
  if (*(void *)(*(void *)(v0 + 240) + 24) >= (uint64_t)v11)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10001040C();
    }
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 256);
    uint64_t v13 = *(void *)(v0 + 264);
    sub_100010028((uint64_t)v11, isUniquelyReferenced_nonNull_native);
    unint64_t v15 = sub_10000FFB0(v14, v13);
    if ((v12 & 1) != (v16 & 1))
    {
      uint64_t v11 = &type metadata for String;
      return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v11);
    }
    unint64_t v8 = v15;
  }
  char v17 = *(void **)(v0 + 184);
  if (v12)
  {
    uint64_t v18 = (_OWORD *)(v17[7] + 32 * v8);
    sub_1000135E4((uint64_t)v18);
    sub_1000135D4((_OWORD *)(v0 + 80), v18);
    goto LABEL_14;
  }
  uint64_t v20 = *(void *)(v0 + 256);
  uint64_t v19 = *(void *)(v0 + 264);
  v17[(v8 >> 6) + 8] |= 1 << v8;
  uint64_t v21 = (void *)(v17[6] + 16 * v8);
  *uint64_t v21 = v20;
  v21[1] = v19;
  uint64_t v11 = sub_1000135D4((_OWORD *)(v0 + 80), (_OWORD *)(v17[7] + 32 * v8));
  uint64_t v22 = v17[2];
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
LABEL_32:
    __break(1u);
    return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v11);
  }
  v17[2] = v24;
  swift_bridgeObjectRetain();
LABEL_14:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(v0 + 248) + 1;
  if (v25 == *(void *)(v0 + 224))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v26 = *(uint64_t (**)(void *))(v0 + 8);
    return v26(v17);
  }
  else
  {
    while (1)
    {
      *(void *)(v0 + 240) = v17;
      *(void *)(v0 + 248) = v25;
      uint64_t v29 = *(void *)(v0 + 200) + 16 * v25;
      uint64_t v30 = *(void *)(v29 + 32);
      *(void *)(v0 + 256) = v30;
      unint64_t v31 = *(void *)(v29 + 40);
      *(void *)(v0 + 264) = v31;
      if (v30 == sub_100013C18() && v31 == v32) {
        break;
      }
      char v34 = sub_100013F68();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v34) {
        break;
      }
      swift_bridgeObjectRetain();
      id v35 = sub_100013B48();
      os_log_type_t v36 = sub_100013D88();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v28 + 4) = sub_10000F8DC(v30, v31, &v39);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Ignoring unknown status key path: %s", (uint8_t *)v28, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v25 = *(void *)(v0 + 248) + 1;
      if (v25 == *(void *)(v0 + 224)) {
        goto LABEL_15;
      }
    }
    uint64_t v37 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_100012A90;
    uint64_t v38 = *(void *)(v0 + 208);
    return sub_100011DB8(v38);
  }
}

uint64_t sub_100012FE8()
{
  uint64_t v46 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100013B48();
  os_log_type_t v2 = sub_100013D88();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v3 + 4) = v5;
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not query managed app status key: %{public}@", (uint8_t *)v3, 0xCu);
    sub_100002AE8(&qword_10001D0B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(void *)(v0 + 256);
  uint64_t v6 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 240);

  swift_getErrorValue();
  uint64_t v9 = *(void *)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 152);
  *(void *)(v0 + 72) = v10;
  uint64_t v11 = sub_100013570((uint64_t *)(v0 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v11, v9, v10);
  sub_1000135D4((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 112));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 168) = v8;
  unint64_t v14 = sub_10000FFB0(v7, v6);
  uint64_t v15 = *(void *)(v8 + 16);
  BOOL v16 = (v13 & 1) == 0;
  char v17 = (_OWORD *)(v15 + v16);
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_35;
  }
  char v18 = v13;
  if (*(void *)(*(void *)(v0 + 240) + 24) >= (uint64_t)v17)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10001040C();
    }
  }
  else
  {
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v19 = *(void *)(v0 + 264);
    sub_100010028((uint64_t)v17, isUniquelyReferenced_nonNull_native);
    unint64_t v21 = sub_10000FFB0(v20, v19);
    if ((v18 & 1) != (v22 & 1))
    {
      char v17 = &type metadata for String;
      return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v17);
    }
    unint64_t v14 = v21;
  }
  BOOL v23 = *(void **)(v0 + 168);
  if (v18)
  {
    uint64_t v24 = (_OWORD *)(v23[7] + 32 * v14);
    sub_1000135E4((uint64_t)v24);
    sub_1000135D4((_OWORD *)(v0 + 112), v24);
    goto LABEL_17;
  }
  uint64_t v26 = *(void *)(v0 + 256);
  uint64_t v25 = *(void *)(v0 + 264);
  v23[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v27 = (void *)(v23[6] + 16 * v14);
  void *v27 = v26;
  v27[1] = v25;
  char v17 = sub_1000135D4((_OWORD *)(v0 + 112), (_OWORD *)(v23[7] + 32 * v14));
  uint64_t v28 = v23[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_35:
    __break(1u);
    return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v17);
  }
  v23[2] = v30;
  swift_bridgeObjectRetain();
LABEL_17:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  uint64_t v31 = *(void *)(v0 + 248) + 1;
  if (v31 == *(void *)(v0 + 224))
  {
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v32 = *(uint64_t (**)(void *))(v0 + 8);
    return v32(v23);
  }
  else
  {
    while (1)
    {
      *(void *)(v0 + 240) = v23;
      *(void *)(v0 + 248) = v31;
      uint64_t v35 = *(void *)(v0 + 200) + 16 * v31;
      uint64_t v36 = *(void *)(v35 + 32);
      *(void *)(v0 + 256) = v36;
      unint64_t v37 = *(void *)(v35 + 40);
      *(void *)(v0 + 264) = v37;
      if (v36 == sub_100013C18() && v37 == v38) {
        break;
      }
      char v40 = sub_100013F68();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v40) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_100013B48();
      os_log_type_t v42 = sub_100013D88();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v34 + 4) = sub_10000F8DC(v36, v37, &v45);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Ignoring unknown status key path: %s", (uint8_t *)v34, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v31 = *(void *)(v0 + 248) + 1;
      if (v31 == *(void *)(v0 + 224)) {
        goto LABEL_18;
      }
    }
    unint64_t v43 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v43;
    *unint64_t v43 = v0;
    v43[1] = sub_100012A90;
    uint64_t v44 = *(void *)(v0 + 208);
    return sub_100011DB8(v44);
  }
}

uint64_t *sub_100013570(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_1000135D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000135E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100013634(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100013694()
{
  unint64_t result = qword_10001D0E0;
  if (!qword_10001D0E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001D0E0);
  }
  return result;
}

uint64_t sub_1000136D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002AE8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013738()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_100013748()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_100013758()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100013768()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100013778()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100013788()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100013798()
{
  return URL.init(string:)();
}

uint64_t sub_1000137A8()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000137B8()
{
  return static Locale.current.getter();
}

uint64_t sub_1000137C8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000137D8()
{
  return RMAdapterError.underlyingErrorDescription(_:)();
}

uint64_t sub_100013808()
{
  return DDMAppOrUpdateManagedAppRequest.init(app:)();
}

uint64_t sub_100013828()
{
  return type metadata accessor for DDMAppOrUpdateManagedAppRequest();
}

uint64_t sub_100013838()
{
  return DDMRemoveManagedAppRequest.init(declarationIdentifier:)();
}

uint64_t sub_100013858()
{
  return type metadata accessor for DDMRemoveManagedAppRequest();
}

uint64_t sub_100013868()
{
  return type metadata accessor for ManagedAppDeclaration.Attributes();
}

uint64_t sub_100013878()
{
  return ManagedAppDeclaration.Attributes.init(_:)();
}

uint64_t sub_100013888()
{
  return ManagedAppDeclaration.attributes.setter();
}

uint64_t sub_100013898()
{
  return ManagedAppDeclaration.BackupBehavior.init(backupAppData:)();
}

uint64_t sub_1000138A8()
{
  return type metadata accessor for ManagedAppDeclaration.BackupBehavior();
}

uint64_t sub_1000138B8()
{
  return static ManagedAppDeclaration.UpdateBehavior.automaticallyUpdate(evid:)();
}

uint64_t sub_1000138C8()
{
  return type metadata accessor for ManagedAppDeclaration.UpdateBehavior();
}

uint64_t sub_1000138D8()
{
  return ManagedAppDeclaration.init(declarationKey:declarationIdentifier:managementScope:personaIdentifier:installBehavior:backupBehavior:updateBehavior:platform:)();
}

uint64_t sub_1000138E8()
{
  return static ManagedAppDeclaration.InstallBehavior.InstallTiming.immediately.getter();
}

uint64_t sub_1000138F8()
{
  return static ManagedAppDeclaration.InstallBehavior.InstallTiming.onDemand.getter();
}

uint64_t sub_100013908()
{
  return type metadata accessor for ManagedAppDeclaration.InstallBehavior.InstallTiming();
}

uint64_t sub_100013918()
{
  return ManagedAppDeclaration.InstallBehavior.init(installTiming:isAccountPromptAllowed:purchaseMethod:)();
}

uint64_t sub_100013928()
{
  return static ManagedAppDeclaration.InstallBehavior.PurchaseMethod.volumePurchaseProgram(_:license:)();
}

uint64_t sub_100013938()
{
  return static ManagedAppDeclaration.InstallBehavior.PurchaseMethod.manifest(_:)();
}

uint64_t sub_100013948()
{
  return type metadata accessor for ManagedAppDeclaration.InstallBehavior.PurchaseMethod();
}

uint64_t sub_100013958()
{
  return static ManagedAppDeclaration.InstallBehavior.License.user()();
}

uint64_t sub_100013968()
{
  return static ManagedAppDeclaration.InstallBehavior.License.device()();
}

uint64_t sub_100013978()
{
  return type metadata accessor for ManagedAppDeclaration.InstallBehavior.License();
}

uint64_t sub_100013988()
{
  return type metadata accessor for ManagedAppDeclaration.InstallBehavior();
}

uint64_t sub_100013998()
{
  return type metadata accessor for ManagedAppDeclaration();
}

uint64_t sub_1000139A8()
{
  return ManagedAppStatus.UpdateState.rawValue.getter();
}

uint64_t sub_1000139B8()
{
  return type metadata accessor for ManagedAppStatus.UpdateState();
}

uint64_t sub_1000139C8()
{
  return ManagedAppStatus.updateState.getter();
}

uint64_t sub_1000139D8()
{
  return ManagedAppStatus.declarationKey.getter();
}

uint64_t sub_1000139E8()
{
  return ManagedAppStatus.InstalledVersionInfo.bundleShortVersion.getter();
}

uint64_t sub_1000139F8()
{
  return ManagedAppStatus.InstalledVersionInfo.appleVersionID.getter();
}

uint64_t sub_100013A08()
{
  return ManagedAppStatus.InstalledVersionInfo.bundleVersion.getter();
}

uint64_t sub_100013A18()
{
  return type metadata accessor for ManagedAppStatus.InstalledVersionInfo();
}

uint64_t sub_100013A28()
{
  return ManagedAppStatus.installedVersionInfo.getter();
}

uint64_t sub_100013A38()
{
  return ManagedAppStatus.declarationIdentifier.getter();
}

uint64_t sub_100013A48()
{
  return ManagedAppStatus.name.getter();
}

uint64_t sub_100013A58()
{
  return ManagedAppStatus.State.rawValue.getter();
}

uint64_t sub_100013A68()
{
  return type metadata accessor for ManagedAppStatus.State();
}

uint64_t sub_100013A78()
{
  return ManagedAppStatus.state.getter();
}

uint64_t sub_100013A88()
{
  return type metadata accessor for ManagedAppStatus.Reason();
}

uint64_t sub_100013A98()
{
  return ManagedAppStatus.reasons.getter();
}

uint64_t sub_100013AA8()
{
  return ManagedAppStatus.bundleID.getter();
}

uint64_t sub_100013AB8()
{
  return type metadata accessor for ManagedAppStatus();
}

uint64_t sub_100013AD8()
{
  return DDMDeclarationKeysRequest.init()();
}

uint64_t sub_100013AE8()
{
  return type metadata accessor for DDMDeclarationKeysRequest();
}

uint64_t sub_100013AF8()
{
  return DDMDeclarationStatusRequest.init(declarationKey:)();
}

uint64_t sub_100013B18()
{
  return type metadata accessor for DDMDeclarationStatusRequest();
}

uint64_t sub_100013B28()
{
  return static Platform.iOS.getter();
}

uint64_t sub_100013B38()
{
  return type metadata accessor for Platform();
}

uint64_t sub_100013B48()
{
  return Logger.logObject.getter();
}

uint64_t sub_100013B58()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100013B68()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100013B78()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100013B88()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013B98()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100013BA8()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_100013BB8(Swift::String a1)
{
}

uint64_t sub_100013BC8()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100013BD8()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100013BE8()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_100013BF8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100013C08()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100013C18()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013C28()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100013C38()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100013C48()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100013C58()
{
  return String.hash(into:)();
}

void sub_100013C68(Swift::String a1)
{
}

Swift::Int sub_100013C78()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100013C88()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100013C98()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100013CB8()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100013CC8()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100013CD8()
{
  return String.init<A>(_:)();
}

uint64_t sub_100013CE8()
{
  return String.subscript.getter();
}

NSArray sub_100013CF8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100013D08()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013D18()
{
  return Array.description.getter();
}

uint64_t sub_100013D28()
{
  return static Bool._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100013D38()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100013D48()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100013D58()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100013D68()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100013D78()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100013D88()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100013D98()
{
  return static os_log_type_t.default.getter();
}

Swift::Int sub_100013DA8(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100013DB8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100013DC8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100013DD8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100013DE8()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100013DF8()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100013E08()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100013E18()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100013E28()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100013E38()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100013E48()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100013E58()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100013E68()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100013E78(Swift::Int a1)
{
}

uint64_t sub_100013E88()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100013E98()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100013EA8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100013EB8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100013EC8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100013ED8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100013EE8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100013EF8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100013F08()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100013F18()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100013F28()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100013F38()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100013F48()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100013F58()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100013F68()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100013F78()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100013FB8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100013FC8()
{
  return Error._userInfo.getter();
}

uint64_t sub_100013FD8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100013FE8()
{
  return Hasher._finalize()();
}

NSNumber sub_100013FF8()
{
  return UInt64._bridgeToObjectiveC()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}