void sub_100003928(id a1)
{
  uint64_t vars8;

  qword_10000C468 = objc_alloc_init(RCAppGroupStorage);

  _objc_release_x1();
}

id OSLogForCategory(void *a1)
{
  id v1 = a1;
  id v2 = &_os_log_default;
  if (qword_10000C478 == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_10000C478, &stru_100008650);
    if (v1)
    {
LABEL_3:
      v3 = [(id)qword_10000C470 objectForKey:v1];

      if (v3) {
        goto LABEL_15;
      }
      if ((unint64_t)[(id)qword_10000C470 count] > 0xA)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:
          v3 = &_os_log_default;
          id v8 = &_os_log_default;
          goto LABEL_15;
        }
        __int16 v10 = 0;
        v6 = "ERROR | Too many categories defined, use default";
        v7 = (uint8_t *)&v10;
      }
      else
      {
        id v4 = v1;
        os_log_t v5 = os_log_create("com.apple.VoiceMemos", (const char *)[v4 UTF8String]);
        if (v5)
        {
          v3 = v5;
          [(id)qword_10000C470 setObject:v5 forKey:v4];
          goto LABEL_15;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = "ERROR | Failed os_log_create, use default";
        v7 = buf;
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_12;
    }
  }
  v3 = &_os_log_default;
LABEL_15:

  return v3;
}

void sub_100003C3C(id a1)
{
  qword_10000C470 = (uint64_t)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];

  _objc_release_x1();
}

uint64_t sub_100003C80()
{
  if (qword_10000C480 != -1) {
    dispatch_once(&qword_10000C480, &stru_100008670);
  }
  return byte_10000C488;
}

void sub_100003CC4(id a1)
{
  byte_10000C488 = os_variant_has_internal_ui();
}

unint64_t sub_100003CEC()
{
  unint64_t result = qword_10000C290;
  if (!qword_10000C290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C290);
  }
  return result;
}

unint64_t sub_100003D44()
{
  unint64_t result = qword_10000C298;
  if (!qword_10000C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

unint64_t sub_100003D9C()
{
  unint64_t result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

uint64_t sub_100003DF0()
{
  uint64_t v0 = sub_1000067E0();
  sub_1000051D4(v0, qword_10000C990);
  sub_10000519C(v0, (uint64_t)qword_10000C990);
  return sub_1000067D0();
}

uint64_t sub_100003E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[13] = a2;
  v3[14] = a3;
  v3[12] = a1;
  sub_100006980();
  v3[15] = sub_100006970();
  uint64_t v5 = sub_100006960();
  v3[16] = v5;
  v3[17] = v4;
  return _swift_task_switch(sub_100003EF0, v5, v4);
}

uint64_t sub_100003EF0()
{
  sub_100006780();
  if (*(unsigned char *)(v0 + 176) == 1)
  {
    sub_1000066D0();
    uint64_t v1 = *(void *)(v0 + 80);
    uint64_t v2 = *(void *)(v0 + 88);
    sub_100005108((void *)(v0 + 56), v1);
    v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 8) + **(int **)(v2 + 8));
    v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v3;
    void *v3 = v0;
    v3[1] = sub_100004114;
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v6 = v1;
    uint64_t v7 = v2;
    id v8 = v13;
  }
  else
  {
    sub_1000066D0();
    uint64_t v9 = *(void *)(v0 + 40);
    uint64_t v10 = *(void *)(v0 + 48);
    sub_100005108((void *)(v0 + 16), v9);
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 16) + **(int **)(v10 + 16));
    v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v11;
    void *v11 = v0;
    v11[1] = sub_1000042C8;
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v6 = v9;
    uint64_t v7 = v10;
    id v8 = v14;
  }
  return v8(v5, v4, v6, v7);
}

uint64_t sub_100004114()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_10000447C;
  }
  else {
    uint64_t v5 = sub_100004250;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100004250()
{
  swift_release();
  sub_10000514C(v0 + 56);
  sub_100006760();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000042C8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_1000044EC;
  }
  else {
    uint64_t v5 = sub_100004404;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100004404()
{
  swift_release();
  sub_10000514C(v0 + 16);
  sub_100006760();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000447C()
{
  swift_release();
  sub_10000514C(v0 + 56);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000044EC()
{
  swift_release();
  sub_10000514C(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000455C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006780();
  *a1 = v3;
  return result;
}

uint64_t sub_100004598()
{
  return sub_100006790();
}

void (*sub_1000045D0(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006770();
  return sub_10000462C;
}

void sub_10000462C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10000467C()
{
  unint64_t result = qword_10000C2A8;
  if (!qword_10000C2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A8);
  }
  return result;
}

unint64_t sub_1000046D4()
{
  unint64_t result = qword_10000C2B0;
  if (!qword_10000C2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2B0);
  }
  return result;
}

uint64_t sub_100004728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004744()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004794@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C288 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000067E0();
  uint64_t v3 = sub_10000519C(v2, (uint64_t)qword_10000C990);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100004840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for IntentAuthenticationPolicy.alwaysAllowed(_:);
  uint64_t v3 = sub_1000067C0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_1000048B4()
{
  return 0;
}

uint64_t sub_1000048C4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100004970;
  return sub_100003E54(a1, v5, v4);
}

uint64_t sub_100004970()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004A64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004D28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004A8C(uint64_t a1)
{
  unint64_t v2 = sub_100003D44();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for RCControlCenterToggleRecording()
{
  swift_release();

  return swift_release();
}

void *_s21RecordWidgetExtension30RCControlCenterToggleRecordingVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for RCControlCenterToggleRecording(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RCControlCenterToggleRecording(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for RCControlCenterToggleRecording(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RCControlCenterToggleRecording(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RCControlCenterToggleRecording(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RCControlCenterToggleRecording()
{
  return &type metadata for RCControlCenterToggleRecording;
}

unint64_t sub_100004C84()
{
  unint64_t result = qword_10000C2C0;
  if (!qword_10000C2C0)
  {
    sub_100004CE0(&qword_10000C2C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2C0);
  }
  return result;
}

uint64_t sub_100004CE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004D28()
{
  uint64_t v0 = sub_1000067B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000050C4(&qword_10000C2D0);
  __chkstk_darwin();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000050C4(&qword_10000C2D8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000050C4(&qword_10000C2E0);
  __chkstk_darwin();
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000067E0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  sub_1000050C4(&qword_10000C2E8);
  sub_1000067D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  char v17 = 2;
  uint64_t v12 = sub_100006950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = sub_100006750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  uint64_t v14 = sub_1000067A0();
  sub_1000050C4(&qword_10000C2F0);
  v16[1] = 0xD00000000000002FLL;
  v16[2] = 0x80000001000071F0;
  sub_100006990();
  sub_100006700();
  sub_1000066F0();
  sub_1000066E0();
  return v14;
}

uint64_t sub_1000050C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100005108(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000514C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000519C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000051D4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000523C()
{
  uint64_t v0 = sub_1000050C4(&qword_10000C308);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000053E4();
  sub_100006830();
  sub_100005438();
  sub_100006810();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005364()
{
  unint64_t result = qword_10000C300;
  if (!qword_10000C300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C300);
  }
  return result;
}

ValueMetadata *type metadata accessor for RecordWidgetBundle()
{
  return &type metadata for RecordWidgetBundle;
}

uint64_t sub_1000053C8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000053E4()
{
  unint64_t result = qword_10000C310;
  if (!qword_10000C310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C310);
  }
  return result;
}

unint64_t sub_100005438()
{
  unint64_t result = qword_10000C318;
  if (!qword_10000C318)
  {
    sub_100004CE0(&qword_10000C308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C318);
  }
  return result;
}

uint64_t sub_100005494()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for ToggleRecordingControl()
{
  return &type metadata for ToggleRecordingControl;
}

uint64_t sub_100005500()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000551C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v32 = sub_1000067E0();
  uint64_t v29 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000050C4(&qword_10000C330);
  uint64_t v27 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1000050C4(&qword_10000C338);
  uint64_t v30 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000050C4(&qword_10000C340);
  uint64_t v33 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000050C4(&qword_10000C348);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  __chkstk_darwin(v10);
  v26 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1000050C4(&qword_10000C350);
  uint64_t v13 = sub_100004CE0(&qword_10000C358);
  uint64_t v14 = sub_10000639C(&qword_10000C360, &qword_10000C358);
  uint64_t v37 = v13;
  uint64_t v38 = v14;
  swift_getOpaqueTypeConformance2();
  sub_1000061AC();
  sub_100006940();
  sub_1000067D0();
  uint64_t v15 = sub_10000639C(&qword_10000C370, &qword_10000C330);
  sub_100006860();
  v16 = *(void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v17 = v32;
  v16(v2, v32);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v3);
  sub_1000067D0();
  uint64_t v37 = v3;
  uint64_t v38 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v28;
  sub_100006850();
  v16(v2, v17);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v19);
  uint64_t v37 = v19;
  uint64_t v38 = OpaqueTypeConformance2;
  uint64_t v20 = swift_getOpaqueTypeConformance2();
  v21 = v26;
  uint64_t v22 = v31;
  sub_100006840();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v22);
  uint64_t v37 = v22;
  uint64_t v38 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v34;
  sub_100006870();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v21, v23);
}

uint64_t sub_100005A80@<X0>(uint64_t a1@<X8>)
{
  v9[1] = a1;
  uint64_t v1 = sub_1000050C4(&qword_10000C358);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006800();
  v9[4] = sub_100004D28();
  v9[5] = v5;
  sub_1000050C4(&qword_10000C378);
  uint64_t v6 = sub_100004CE0(&qword_10000C380);
  unint64_t v7 = sub_1000062CC();
  v9[2] = v6;
  v9[3] = v7;
  swift_getOpaqueTypeConformance2();
  sub_1000063E0();
  sub_100006930();
  sub_1000068A0();
  sub_10000639C(&qword_10000C360, &qword_10000C358);
  sub_100006820();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_100005C88@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_100006920();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006900();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v33 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v33 - v15;
  uint64_t v17 = sub_1000050C4(&qword_10000C398);
  uint64_t v34 = *(void *)(v17 - 8);
  uint64_t v35 = v17;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_1000050C4(&qword_10000C380);
  __chkstk_darwin(v42);
  v41 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000050C4(&qword_10000C378);
  uint64_t v37 = *(void *)(v21 - 8);
  uint64_t v38 = v21;
  __chkstk_darwin(v21);
  uint64_t v36 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v39 = a1;
  sub_100006800();
  sub_1000068B0();
  sub_1000068F0();
  sub_1000068E0();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v33 = v8 + 8;
  v23(v16, v7);
  sub_1000068D0();
  v23(v14, v7);
  sub_100006910();
  uint64_t v24 = v7;
  uint64_t v25 = v41;
  v26 = &v41[*(int *)(v42 + 36)];
  sub_100006434((unint64_t *)&unk_10000C3B0, (void (*)(uint64_t))&type metadata accessor for BreatheSymbolEffect);
  sub_1000068C0();
  uint64_t v27 = sub_100006880();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v26[*(int *)(v27 + 20)], v6, v3);
  v26[*(int *)(v27 + 24)] = 1;
  uint64_t v29 = v34;
  uint64_t v28 = v35;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v25, v19, v35);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v23(v11, v24);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v28);
  sub_100006800();
  sub_1000062CC();
  uint64_t v30 = v36;
  uint64_t v31 = (uint64_t)v41;
  sub_100006890();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000647C(v31);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v40, v30, v38);
}

unint64_t sub_1000061AC()
{
  unint64_t result = qword_10000C368;
  if (!qword_10000C368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C368);
  }
  return result;
}

void sub_100006200(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100006208(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100006228, 0, 0);
}

uint64_t sub_100006228()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 16);
  id v2 = [self sharedInstance];
  unsigned __int8 v3 = [v2 isRecording];

  *uint64_t v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

unint64_t sub_1000062CC()
{
  unint64_t result = qword_10000C388;
  if (!qword_10000C388)
  {
    sub_100004CE0(&qword_10000C380);
    sub_10000639C(&qword_10000C390, &qword_10000C398);
    sub_100006434(&qword_10000C3A0, (void (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C388);
  }
  return result;
}

uint64_t sub_10000639C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004CE0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000063E0()
{
  unint64_t result = qword_10000C3A8;
  if (!qword_10000C3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C3A8);
  }
  return result;
}

uint64_t sub_100006434(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000647C(uint64_t a1)
{
  uint64_t v2 = sub_1000050C4(&qword_10000C380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for ToggleRecordingStateProvider()
{
  return &type metadata for ToggleRecordingStateProvider;
}

uint64_t sub_1000064EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006618()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10000664C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[RCAppGroupStorage init]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s -- app group user defaults are nil", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_1000066D0()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t sub_1000066E0()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t sub_1000066F0()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_100006700()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_100006710()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100006720()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006730()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006750()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006760()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006770()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006780()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006790()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000067A0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000067B0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000067C0()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t sub_1000067D0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000067E0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000067F0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006800()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100006810()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100006820()
{
  return ControlWidgetTemplate.tint(_:)();
}

uint64_t sub_100006830()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100006840()
{
  return ControlWidgetConfiguration.showsInControlCenter()();
}

uint64_t sub_100006850()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100006860()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100006870()
{
  return ControlWidgetConfiguration.showsContextualMenu(_:)();
}

uint64_t sub_100006880()
{
  return type metadata accessor for _IndefiniteSymbolEffectModifier();
}

uint64_t sub_100006890()
{
  return View.controlWidgetActionHint(_:)();
}

uint64_t sub_1000068A0()
{
  return static Color.red.getter();
}

uint64_t sub_1000068B0()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_1000068C0()
{
  return dispatch thunk of SymbolEffect.configuration.getter();
}

uint64_t sub_1000068D0()
{
  return BreatheSymbolEffect.wholeSymbol.getter();
}

uint64_t sub_1000068E0()
{
  return BreatheSymbolEffect.plain.getter();
}

uint64_t sub_1000068F0()
{
  return BreatheSymbolEffect.init()();
}

uint64_t sub_100006900()
{
  return type metadata accessor for BreatheSymbolEffect();
}

uint64_t sub_100006910()
{
  return static SymbolEffectOptions.default.getter();
}

uint64_t sub_100006920()
{
  return type metadata accessor for SymbolEffectOptions();
}

uint64_t sub_100006930()
{
  return ControlWidgetToggle<>.init<>(_:isOn:action:valueLabel:)();
}

uint64_t sub_100006940()
{
  return StaticControlConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_100006950()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100006960()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006970()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006980()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100006990()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}