void sub_100002E44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t vars8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  v5 = [v3 lowercaseString];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void sub_1000038DC(uint64_t a1)
{
}

void sub_1000038F8(uint64_t a1)
{
}

void sub_100003914(uint64_t a1, uint64_t a2, void *a3)
{
  type metadata accessor for Tag();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = sub_10000FD00();
  NSString v6 = sub_10000FD00();
  id v7 = [v4 initWithIdentifier:v5 displayString:v6];

  *a3 = v7;
}

uint64_t variable initialization expression of TagIntentResponse.code()
{
  return 0;
}

void sub_1000039B4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1000039C0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1000039D4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t _s16NewsTodayIntents9TagIntentC14equalInContent3lhs3rhsSbAC_ACtFZ_0(void *a1, void *a2)
{
  id v3 = [a1 tag];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];

    if (v5)
    {
      uint64_t v6 = sub_10000FD10();
      id v4 = v7;
    }
    else
    {
      uint64_t v6 = 0;
      id v4 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = [a2 tag];
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 identifier];

    if (v10)
    {
      uint64_t v11 = sub_10000FD10();
      v9 = v12;

      if (!v4) {
        goto LABEL_16;
      }
LABEL_11:
      if (v9)
      {
        if (v6 == v11 && v4 == v9)
        {
          swift_bridgeObjectRelease();
          char v13 = 1;
        }
        else
        {
          char v13 = sub_10000FEB0();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        char v13 = 0;
      }
      goto LABEL_20;
    }
    uint64_t v11 = 0;
    v9 = 0;
    if (v4) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v4) {
      goto LABEL_11;
    }
  }
LABEL_16:
  if (!v9)
  {
    char v13 = 1;
    return v13 & 1;
  }
  char v13 = 0;
LABEL_20:
  swift_bridgeObjectRelease();
  return v13 & 1;
}

void type metadata accessor for FCTagType()
{
  if (!qword_10002A630)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10002A630);
    }
  }
}

uint64_t sub_100003BB8(uint64_t a1)
{
  uint64_t v2 = sub_10000F9A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F960();
  sub_100006AEC(&qword_10002AA60);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_100006B40(0, &qword_10002AA68);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_100006AEC(&qword_10002AA70);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_100006AEC(&qword_10002AA78);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F970();
  v18[4] = sub_100006B40(0, &qword_10002AA80);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F970();
  v18[3] = sub_100006AEC(&qword_10002AA88);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_100006B40(0, &qword_10002AA90);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AA98);
  sub_10000F980();
  swift_release();
  uint64_t v6 = enum case for Scope.singleton(_:);
  id v7 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v7(v5, enum case for Scope.singleton(_:), v2);
  sub_10000F900();
  swift_release();
  id v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  sub_10000F8F0();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006B40(0, &qword_10002AAA0);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AAA8);
  sub_10000F990();
  swift_release();
  v19 = v7;
  v7(v5, v6, v2);
  uint64_t v21 = v3 + 104;
  sub_10000F900();
  swift_release();
  swift_release();
  v20 = v8;
  v8(v5, v2);
  sub_10000F960();
  sub_100006AEC(&qword_10002AAB0);
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_10000FB50();
  sub_10000F980();
  swift_release();
  v7(v5, v6, v2);
  sub_10000F900();
  swift_release();
  swift_release();
  v8(v5, v2);
  sub_10000F960();
  sub_100006AEC(&qword_10002AAB8);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AAC0);
  sub_10000F990();
  swift_release();
  swift_release();
  v18[1] = a1;
  sub_10000F960();
  sub_100006B40(0, &qword_10002AAC8);
  swift_retain();
  sub_10000F980();
  swift_release();
  swift_release();
  uint64_t v9 = v6;
  uint64_t v10 = v6;
  v18[0] = v2;
  uint64_t v11 = v19;
  v19(v5, v10, v2);
  sub_10000F900();
  swift_release();
  swift_release();
  v12 = v20;
  v20(v5, v2);
  sub_10000F960();
  sub_100006B40(0, &qword_10002AAD0);
  swift_retain();
  sub_10000F980();
  swift_release();
  swift_release();
  uint64_t v13 = v18[0];
  v11(v5, v9, v18[0]);
  sub_10000F900();
  swift_release();
  v12(v5, v13);
  sub_10000F8F0();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AAD8);
  sub_10000F980();
  swift_release();
  v14 = v19;
  v19(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v12(v5, v13);
  sub_10000F960();
  sub_100006B40(0, &qword_10002AAE0);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15 = v20;
  v20(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AAE8);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AAF0);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006B40(0, &qword_10002AAF8);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AB00);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006B40(0, &qword_10002AB08);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AB10);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006B40(0, &qword_10002AB18);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006B40(0, &qword_10002AB20);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AB28);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v15(v5, v13);
  sub_10000F960();
  sub_10000F980();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AB30);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v16 = v20;
  v20(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AB38);
  sub_10000F980();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v16(v5, v13);
  sub_10000F960();
  sub_100006AEC(&qword_10002AB40);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AB48);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AB50);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F960();
  sub_100006AEC(&qword_10002AB58);
  sub_10000F990();
  swift_release();
  v14(v5, v9, v13);
  sub_10000F900();
  swift_release();
  swift_release();
  v16(v5, v13);
  sub_10000F970();
  sub_100006B40(0, &qword_10002AB60);
  sub_10000F980();
  swift_release();
  return swift_release();
}

uint64_t sub_100004DD0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100006540(a1, (uint64_t (*)(void))&type metadata accessor for PaidBundleConfigManager, (uint64_t (*)(uint64_t))&PaidBundleConfigManager.init(configurationManager:), (uint64_t)&protocol witness table for PaidBundleConfigManager, a2);
}

id sub_100004E04(uint64_t a1)
{
  return sub_100006798(a1, (uint64_t)FCContextConfiguration_ptr, (SEL *)&selRef_defaultConfiguration);
}

id sub_100004E18(uint64_t a1)
{
  return sub_100006798(a1, (uint64_t)FCFeldsparIDProvider_ptr, (SEL *)&selRef_sharedInstance);
}

uint64_t sub_100004E2C(void *a1)
{
  sub_100006AEC(&qword_10002AB68);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AA68);
  uint64_t result = sub_10000F920();
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v5 = (void *)result;
  id v6 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v6)
  {
    id v7 = v6;
    sub_10000F880();

    uint64_t v8 = sub_10000F890();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_10000F890();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
  }
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AA70);
  uint64_t result = sub_10000F920();
  if (!result) {
    goto LABEL_11;
  }
  uint64_t v10 = result;
  uint64_t v11 = sub_10000F890();
  uint64_t v12 = *(void *)(v11 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1, v11) != 1)
  {
    sub_10000F870(v13);
    v14 = v15;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v11);
  }
  id v16 = [objc_allocWithZone((Class)FCConfigurationManager) initWithContextConfiguration:v5 contentHostDirectoryFileURL:v14 feldsparIDProvider:v10];

  uint64_t result = swift_unknownObjectRelease();
  if (v16) {
    return (uint64_t)v16;
  }
LABEL_12:
  __break(1u);
  return result;
}

id sub_1000050A0(void *a1)
{
  return sub_1000061A4(a1, (SEL *)&selRef_userInfo);
}

id sub_1000050B0()
{
  id v0 = objc_allocWithZone((Class)FCNetworkBehaviorMonitor);

  return [v0 initForLoggingOnly];
}

uint64_t sub_1000050E8(void *a1)
{
  uint64_t v2 = sub_10000F890();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006AEC(&qword_10002AB68);
  __chkstk_darwin();
  id v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AA68);
  uint64_t v8 = sub_10000F920();
  if (!v8)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AA78);
  uint64_t v10 = sub_10000F920();
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v11 = v10;
  id v12 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (!v12)
  {
LABEL_9:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v7, 1, 1, v2);
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  sub_10000F880();

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v7, v5, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v7, 0, 1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2);
  if (result == 1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AA90);
  uint64_t result = sub_10000F920();
  if (result)
  {
    v15 = (void *)result;
    id v16 = objc_allocWithZone((Class)FCContentContext);
    sub_10000F870(v17);
    v19 = v18;
    id v20 = [v16 initWithConfiguration:v9 configurationManager:v11 contentHostDirectory:v18 networkBehaviorMonitor:v15 desiredHeadlineFieldOptions:0 feedUsage:1 appActivityMonitor:0 backgroundTaskable:0 pptContext:0];

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    return (uint64_t)v20;
  }
LABEL_11:
  __break(1u);
  return result;
}

id sub_1000053F0(void *a1)
{
  return sub_100006118(a1, (SEL *)&selRef_tagController);
}

uint64_t sub_1000053FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_10000FCA0();
  swift_allocObject();
  uint64_t result = sub_10000FC90();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for FeatureAvailability;
  *a1 = result;
  return result;
}

uint64_t sub_100005454(void *a1)
{
  sub_100006B7C(a1, a1[3]);
  sub_10000FB50();
  uint64_t result = sub_10000F920();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000054A8(void *a1)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AAD8);
  uint64_t result = sub_10000F920();
  if (result)
  {
    id v2 = objc_allocWithZone((Class)sub_10000FB90());
    sub_10000FB80();
    sub_10000FB50();
    swift_allocObject();
    return sub_10000FB40();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005540@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AAA0);
  uint64_t result = sub_10000F920();
  if (result)
  {
    sub_100006B7C(a1, a1[3]);
    sub_100006B40(0, &qword_10002AAF8);
    uint64_t result = sub_10000F920();
    if (result)
    {
      uint64_t v5 = sub_10000FC60();
      swift_allocObject();
      uint64_t result = sub_10000FC50();
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for TagService;
      *a2 = result;
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

uint64_t sub_10000563C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_10000FC20();
  __chkstk_darwin();
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AA60);
  uint64_t result = sub_10000F930();
  if (!v15)
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AB00);
  uint64_t result = sub_10000F920();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AB10);
  uint64_t result = sub_10000F920();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AAA8);
  uint64_t result = sub_10000F930();
  uint64_t v5 = v13;
  if (!v13)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v6 = v14;
  id v7 = sub_100006B7C(v12, v13);
  v11[3] = v5;
  v11[4] = v6;
  uint64_t v8 = sub_100006E24(v11);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(v8, v7, v5);
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AAD8);
  uint64_t result = sub_10000F920();
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_10000FC00();
  swift_allocObject();
  sub_10000FBF0();
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AA88);
  uint64_t result = sub_10000F930();
  if (v10)
  {
    sub_10000FCD0();
    swift_allocObject();
    sub_10000FCC0();
    sub_10000FC10();
    sub_10000FBE0();
    swift_allocObject();
    uint64_t v9 = sub_10000FBD0();
    uint64_t result = sub_100006E88((uint64_t)v12);
    *a2 = v9;
    a2[1] = (uint64_t)&protocol witness table for FeedContextFactory;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_100005964()
{
  sub_100006AEC(&qword_10002AB68);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v12 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v2 = [objc_allocWithZone((Class)FCContextConfiguration) initWithEnvironment:sub_100005B84()];
  id v3 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v3)
  {
    uint64_t v4 = v3;
    sub_10000F880();

    uint64_t v5 = sub_10000F890();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 0, 1, v5);
  }
  else
  {
    uint64_t v5 = sub_10000F890();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 1, 1, v5);
  }
  id v6 = [self sharedInstance];
  sub_10000F890();
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v1, 1, v5) != 1)
  {
    sub_10000F870(v8);
    uint64_t v9 = v10;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v1, v5);
  }
  id v11 = [objc_allocWithZone((Class)FCConfigurationManager) initWithContextConfiguration:v2 contentHostDirectoryFileURL:v9 feldsparIDProvider:v6];

  if (!v11) {
    __break(1u);
  }
}

uint64_t sub_100005B84()
{
  uint64_t v0 = sub_10000FBC0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F8A0();
  sub_100006DD0();
  sub_10000F8D0();
  swift_release();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  uint64_t v5 = 0;
  if (v4 == enum case for NewsEnvironment.production(_:)) {
    return v5;
  }
  if (v4 == enum case for NewsEnvironment.staging(_:)) {
    return 1;
  }
  if (v4 == enum case for NewsEnvironment.qa(_:)) {
    return 2;
  }
  if (v4 == enum case for NewsEnvironment.test(_:)) {
    return 3;
  }
  if (v4 == enum case for NewsEnvironment.devel(_:)) {
    return 4;
  }
  if (v4 == enum case for NewsEnvironment.sandbox(_:)) {
    return 6;
  }
  if (v4 == enum case for NewsEnvironment.demo1(_:)) {
    return 7;
  }
  if (v4 == enum case for NewsEnvironment.demo2(_:)) {
    return 8;
  }
  uint64_t result = sub_10000FEA0();
  __break(1u);
  return result;
}

uint64_t sub_100005D80(void *a1)
{
  sub_100006AEC(&qword_10002AB68);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  id v6 = (char *)&v23 - v5;
  id v7 = [objc_allocWithZone((Class)FCContextConfiguration) initWithEnvironment:sub_100005B84()];
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AAC8);
  uint64_t result = sub_10000F920();
  if (!result)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v9 = result;
  id v10 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v10)
  {
    id v11 = v10;
    sub_10000F880();

    uint64_t v12 = sub_10000F890();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v6, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_10000F890();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  id v14 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  v24 = v7;
  if (v14)
  {
    uint64_t v15 = v14;
    sub_10000F880();

    uint64_t v16 = sub_10000F890();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = sub_10000F890();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 1, 1, v17);
  }
  id v18 = [objc_allocWithZone((Class)type metadata accessor for PrivateDataActionProvider()) init];
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AA90);
  uint64_t result = sub_10000F920();
  if (!result) {
    goto LABEL_13;
  }
  uint64_t v19 = result;
  id v20 = [objc_allocWithZone((Class)NUApplicationAppActivityMonitorIOS) init];
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AB60);
  uint64_t result = sub_10000F920();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v21 = result;
  id v22 = objc_allocWithZone((Class)FCCloudContext);
  uint64_t result = (uint64_t)sub_100006BC0(v24, v9, (uint64_t)v6, (uint64_t)v4, (uint64_t)v18, v19, (uint64_t)v20, 0xF87FFFFC1, 2, 0, 0, v21, 0);
  if (!result) {
LABEL_15:
  }
    __break(1u);
  return result;
}

id sub_1000060F8(id *a1)
{
  return [*a1 enableFlushingWithFlushingThreshold:2];
}

id sub_10000610C(void *a1)
{
  return sub_100006118(a1, (SEL *)&selRef_news_core_ConfigurationManager);
}

id sub_100006118(void *a1, SEL *a2)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AA98);
  id result = (id)sub_10000F920();
  if (result)
  {
    id v4 = [result *a2];
    swift_unknownObjectRelease();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100006198(void *a1)
{
  return sub_1000061A4(a1, (SEL *)&selRef_assetManager);
}

id sub_1000061A4(void *a1, SEL *a2)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AAD0);
  id result = (id)sub_10000F920();
  if (result)
  {
    id v4 = result;
    id v5 = [result *a2];

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000622C(void *a1)
{
}

void sub_100006238(void *a1)
{
}

void sub_100006244(void *a1, SEL *a2)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AAD0);
  uint64_t v3 = (void *)sub_10000F920();
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  id v4 = v3;
  id v5 = [v3 *a2];

  if (!v5) {
LABEL_5:
  }
    __break(1u);
}

void sub_1000062D4(void *a1)
{
}

void sub_1000062E0(void *a1)
{
}

id sub_1000062EC(void *a1)
{
  return sub_1000061A4(a1, (SEL *)&selRef_puzzleTypeController);
}

void sub_1000062F8(void *a1)
{
}

void sub_100006304(void *a1)
{
}

void sub_100006310(void *a1)
{
}

id sub_10000631C(uint64_t a1)
{
  return sub_100006798(a1, (uint64_t)FCAppleAccount_ptr, (SEL *)&selRef_sharedAccount);
}

uint64_t sub_100006330@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AA80);
  uint64_t result = sub_10000F920();
  if (result)
  {
    uint64_t v4 = sub_10000FC40();
    swift_allocObject();
    uint64_t result = sub_10000FC30();
    a2[3] = v4;
    a2[4] = (uint64_t)&protocol witness table for FeedUserInfo;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000063D4()
{
  id v0 = objc_allocWithZone((Class)sub_10000FCB0());

  return [v0 init];
}

uint64_t sub_10000640C(void *a1)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AB30);
  uint64_t result = sub_10000F920();
  if (result)
  {
    sub_100006B7C(a1, a1[3]);
    sub_100006AEC(&qword_10002AAF0);
    uint64_t result = sub_10000F920();
    if (result)
    {
      sub_10000FB30();
      swift_allocObject();
      return sub_10000FB20();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000064D8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100006540(a1, (uint64_t (*)(void))&type metadata accessor for NotificationConfigurationManager, (uint64_t (*)(uint64_t))&NotificationConfigurationManager.init(appConfigurationManager:), (uint64_t)&protocol witness table for NotificationConfigurationManager, a2);
}

uint64_t sub_10000650C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100006540(a1, (uint64_t (*)(void))&type metadata accessor for TopHeadlinesQueryTimeRangeConfigurationManager, (uint64_t (*)(uint64_t))&TopHeadlinesQueryTimeRangeConfigurationManager.init(appConfigurationManager:), (uint64_t)&protocol witness table for TopHeadlinesQueryTimeRangeConfigurationManager, a2);
}

uint64_t sub_100006540@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AAD8);
  uint64_t result = sub_10000F920();
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

uint64_t sub_1000065F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002AAD8);
  uint64_t result = sub_10000F920();
  if (result)
  {
    sub_100006B7C(a1, a1[3]);
    sub_100006AEC(&qword_10002AB58);
    uint64_t result = sub_10000F930();
    if (v6)
    {
      uint64_t v5 = sub_10000FBB0();
      swift_allocObject();
      uint64_t result = sub_10000FBA0();
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for SearchEndpointConfigManager;
      *a2 = result;
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

uint64_t sub_1000066E0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006B40(0, &qword_10002AAD0);
  uint64_t result = sub_10000F920();
  if (result)
  {
    uint64_t v4 = sub_10000FC80();
    swift_allocObject();
    uint64_t result = sub_10000FC70();
    a2[3] = v4;
    a2[4] = (uint64_t)&protocol witness table for ResourceService;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100006784(uint64_t a1)
{
  return sub_100006798(a1, (uint64_t)FCPrivateDataSyncAvailability_ptr, (SEL *)&selRef_notAvailable);
}

id sub_100006798(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = [self *a3];

  return v3;
}

uint64_t sub_1000067DC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for TodayIntentsServiceAssembly()
{
  return self;
}

uint64_t sub_100006810(uint64_t a1)
{
  return sub_100003BB8(a1);
}

uint64_t sub_100006834()
{
  return sub_10000F8D0();
}

uint64_t sub_100006864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_100006894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

uint64_t sub_1000068C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

uint64_t sub_100006A0C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100006A90()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

uint64_t type metadata accessor for PrivateDataActionProvider()
{
  return self;
}

uint64_t sub_100006AEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_100006B30()
{
}

uint64_t sub_100006B38(void *a1)
{
  return sub_100005D80(a1);
}

uint64_t sub_100006B40(uint64_t a1, unint64_t *a2)
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

void *sub_100006B7C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id sub_100006BC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14 = sub_10000F890();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  id v18 = 0;
  if (v16(a3, 1, v14) != 1)
  {
    sub_10000F870(v17);
    id v18 = v19;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  }
  if (v16(a4, 1, v14) == 1)
  {
    uint64_t v21 = 0;
  }
  else
  {
    sub_10000F870(v20);
    uint64_t v21 = v22;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a4, v14);
  }
  LOWORD(v24) = a10 & 0x101;
  id v28 = [v27 initWithConfiguration:a1 configurationManager:a2 contentHostDirectory:v18 privateDataHostDirectory:v21 privateDataActionProvider:a5 networkBehaviorMonitor:a6 appActivityMonitor:a7 desiredHeadlineFieldOptions:a8 feedUsage:a9 lockStoreFrontIfNeeded:a11 deviceIsiPad:a12 backgroundTaskable:a13 privateDataSyncAvailability:a14 pptContext:a15];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v28;
}

unint64_t sub_100006DD0()
{
  unint64_t result = qword_10002AB70;
  if (!qword_10002AB70)
  {
    type metadata accessor for TodayIntentsServiceAssembly();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AB70);
  }
  return result;
}

uint64_t *sub_100006E24(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100006E88(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006EE8()
{
  return swift_release();
}

uint64_t sub_100006EF4@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_100007294(v1 + 24, (uint64_t)&v4);
  if (v5) {
    return sub_100007428(&v4, a1);
  }
  sub_1000072FC((uint64_t)&v4);
  sub_10000FA60();
  sub_10000735C(a1, (uint64_t)&v4);
  swift_beginAccess();
  sub_1000073C0((uint64_t)&v4, v1 + 24);
  return swift_endAccess();
}

uint64_t sub_100006FA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000FA40();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + 56) = 0;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  sub_100006AEC(&qword_10002AC28);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001A2C0;
  uint64_t v7 = type metadata accessor for TodayIntentsServiceAssembly();
  uint64_t v8 = swift_allocObject();
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = sub_100007440(&qword_10002AC30, (void (*)(uint64_t))type metadata accessor for TodayIntentsServiceAssembly);
  *(void *)(v6 + 32) = v8;
  uint64_t v9 = sub_10000FB70();
  swift_allocObject();
  uint64_t v10 = sub_10000FB60();
  *(void *)(v6 + 96) = v9;
  *(void *)(v6 + 104) = sub_100007440(&qword_10002AC38, (void (*)(uint64_t))&type metadata accessor for SearchServiceAssembly);
  *(void *)(v6 + 72) = v10;
  uint64_t v11 = type metadata accessor for TodayIntentsAssembly();
  uint64_t v12 = swift_allocObject();
  *(void *)(v6 + 136) = v11;
  *(void *)(v6 + 144) = sub_100007440(&qword_10002AC40, (void (*)(uint64_t))type metadata accessor for TodayIntentsAssembly);
  *(void *)(v6 + 112) = v12;
  sub_10000F950();
  swift_allocObject();
  sub_10000F940();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Container.Environment.normal(_:), v2);
  sub_10000FA70();
  swift_allocObject();
  *(void *)(v1 + 16) = sub_10000FA50();
  return v1;
}

uint64_t sub_100007230()
{
  swift_release();
  sub_1000072FC(v0 + 24);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for TodayIntentsContainer()
{
  return self;
}

uint64_t sub_100007294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006AEC((uint64_t *)&unk_10002ADE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000072FC(uint64_t a1)
{
  uint64_t v2 = sub_100006AEC((uint64_t *)&unk_10002ADE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000735C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000073C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006AEC((uint64_t *)&unk_10002ADE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007428(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100007440(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007488@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  sub_100006AEC(&qword_10002ACE8);
  uint64_t result = sub_10000F930();
  if (v10)
  {
    sub_100006B7C(a1, a1[3]);
    sub_100006AEC(&qword_10002ACF0);
    uint64_t result = sub_10000F930();
    if (v8)
    {
      uint64_t v5 = type metadata accessor for FollowingTagsService();
      uint64_t v6 = swift_allocObject();
      sub_100007428(&v9, v6 + 16);
      uint64_t result = sub_100007428(&v7, v6 + 56);
      a2[3] = v5;
      a2[4] = (uint64_t)&off_10001CFB0;
      *a2 = v6;
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

uint64_t sub_100007584@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_10000F890();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006AEC(&qword_10002AB68);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (id)FCURLForTodayDropbox();
  if (v9)
  {
    uint64_t v10 = v9;
    sub_10000F880();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if (result != 1)
    {
      id v12 = objc_allocWithZone((Class)FCFileCoordinatedTodayDropbox);
      sub_10000F870(v13);
      uint64_t v15 = v14;
      id v16 = [v12 initWithFileURL:v14];

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      uint64_t result = sub_100006B40(0, &qword_10002ACF8);
      a1[3] = result;
      a1[4] = &off_10001D010;
      *a1 = v16;
      return result;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000077A4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100006B7C(a1, a1[3]);
  uint64_t v3 = sub_100006B40(0, &qword_10002AAA0);
  uint64_t result = sub_10000F920();
  if (result)
  {
    a2[3] = v3;
    a2[4] = (uint64_t)&off_10001CE98;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for TodayIntentsAssembly()
{
  return self;
}

uint64_t sub_10000784C()
{
  sub_10000F960();
  sub_100006AEC(&qword_10002ACE0);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_100006AEC(&qword_10002ACE8);
  sub_10000F990();
  swift_release();
  swift_release();
  sub_10000F970();
  sub_100006AEC(&qword_10002ACF0);
  sub_10000F990();
  swift_release();

  return swift_release();
}

id sub_10000795C()
{
  id v1 = [v0 identifier];
  sub_10000FD10();

  id v2 = [v0 nameCompact];
  if (!v2) {
    id v2 = [v0 name];
  }
  sub_10000FD10();

  type metadata accessor for Tag();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v4 = sub_10000FD00();
  swift_bridgeObjectRelease();
  NSString v5 = sub_10000FD00();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithIdentifier:v4 displayString:v5];

  id v7 = [v0 groupTitleColor];
  NSString v8 = v7;
  if (v7)
  {
    id v9 = [v7 hex];

    sub_10000FD10();
    NSString v8 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  [v6 setNameColorLight:v8];

  id v10 = [v0 groupDarkStyleTitleColor];
  NSString v11 = v10;
  if (v10)
  {
    id v12 = [v10 hex];

    sub_10000FD10();
    NSString v11 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  [v6 setNameColorDark:v11];

  return v6;
}

uint64_t sub_100007B74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver;
  swift_beginAccess();
  sub_10000AE94(v3, (uint64_t)&v5, (uint64_t *)&unk_10002ADE0);
  if (v6) {
    return sub_100007428(&v5, a1);
  }
  sub_10000AEF8((uint64_t)&v5, (uint64_t *)&unk_10002ADE0);
  sub_100006EF4(a1);
  sub_10000735C(a1, (uint64_t)&v5);
  swift_beginAccess();
  sub_10000AF54((uint64_t)&v5, v3, (uint64_t *)&unk_10002ADE0);
  return swift_endAccess();
}

uint64_t sub_100007C50@<X0>(uint64_t a1@<X8>)
{
  return sub_100007CB0(&OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___followingTagsService, (uint64_t *)&unk_10002ADD0, (uint64_t (*)(unsigned char *, uint64_t))sub_100007428, &qword_10002ACE0, a1);
}

uint64_t sub_100007C80@<X0>(uint64_t a1@<X8>)
{
  return sub_100007CB0(&OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___searchService, &qword_10002ADC0, (uint64_t (*)(unsigned char *, uint64_t))sub_100007428, &qword_10002ADC8, a1);
}

uint64_t sub_100007CB0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(unsigned char *, uint64_t)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = v5 + *a1;
  swift_beginAccess();
  sub_10000AE94(v10, (uint64_t)v14, a2);
  if (v15) {
    return a3(v14, a5);
  }
  sub_10000AEF8((uint64_t)v14, a2);
  sub_100007B74((uint64_t)v14);
  sub_100006B7C(v14, v15);
  sub_100006AEC(a4);
  uint64_t result = sub_10000F930();
  if (v13)
  {
    a3(v12, a5);
    sub_100006E88((uint64_t)v14);
    sub_10000735C(a5, (uint64_t)v14);
    swift_beginAccess();
    sub_10000AF54((uint64_t)v14, v10, a2);
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100007DE4()
{
  uint64_t v1 = OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___configurationManager;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___configurationManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___configurationManager);
LABEL_5:
    id v8 = v2;
    return (uint64_t)v3;
  }
  uint64_t v4 = v0;
  sub_100007B74((uint64_t)v9);
  sub_100006B7C(v9, v9[3]);
  sub_100006B40(0, &qword_10002AAC8);
  uint64_t result = sub_10000F920();
  if (result)
  {
    uint64_t v6 = (void *)result;
    sub_100006E88((uint64_t)v9);
    id v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    id v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_100007F74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  [super dealloc];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

uint64_t sub_100008080(uint64_t a1, uint64_t a2)
{
  sub_100007C50((uint64_t)v5);
  sub_100006B7C(v5, v5[3]);
  type metadata accessor for FollowingTagsService();
  uint64_t v3 = sub_10000BC18(a2);
  sub_100006E88((uint64_t)v5);
  return v3;
}

id sub_10000811C(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = (void *)sub_10000A20C(a1);
  if (v3)
  {
    id v4 = v3;
    sub_10000FD30();
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10000FD70();
    }
    sub_10000FD80();
    sub_10000FD60();
  }
  uint64_t v5 = (void *)sub_10000A440(a2);
  if (v5)
  {
    id v6 = v5;
    sub_10000FD30();
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10000FD70();
    }
    sub_10000FD80();
    sub_10000FD60();
  }
  id v7 = objc_allocWithZone((Class)INObjectCollection);
  sub_100006AEC(&qword_10002ADA0);
  Class isa = sub_10000FD40().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithSections:isa];

  return v9;
}

void sub_10000827C(uint64_t a1, void (*a2)(id, void))
{
  id v3 = objc_allocWithZone((Class)INObjectCollection);
  type metadata accessor for Tag();
  Class isa = sub_10000FD40().super.isa;
  id v5 = [v3 initWithItems:isa];

  id v6 = v5;
  a2(v5, 0);
}

uint64_t sub_10000832C()
{
  sub_100007C80((uint64_t)v4);
  sub_100006B7C(v4, v4[3]);
  sub_10000FB10();
  uint64_t v0 = (void *)sub_100007DE4();
  sub_100006B40(0, &qword_10002AAC8);
  sub_10000FDC0();

  uint64_t v1 = (void *)sub_10000F9C0();
  uint64_t v2 = sub_10000F9B0();
  swift_release();
  swift_release();

  sub_100006E88((uint64_t)v4);
  return v2;
}

uint64_t sub_100008414(uint64_t a1, void *a2, void (*a3)(id, void), uint64_t a4)
{
  uint64_t v49 = a4;
  v50 = a3;
  uint64_t v5 = sub_10000FAE0();
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  __chkstk_darwin(v5);
  id v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v55 = (unint64_t)_swiftEmptyArrayStorage;
  if (sub_10000FAB0())
  {
    swift_unknownObjectRetain();
    id v8 = (id)NSSNewsWidgetIntentsTopHitHeaderName();
    if (v8)
    {
      id v9 = v8;
      sub_10000FD10();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
    sub_100006AEC(&qword_10002ADA8);
    id v12 = (void *)swift_allocObject();
    *((_OWORD *)v12 + 1) = xmmword_10001A340;
    swift_getObjectType();
    v12[4] = sub_10000C9E8();
    v53 = v12;
    sub_10000FD60();
    if (v11)
    {
      NSString v13 = sub_10000FD00();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v13 = 0;
    }
    id v14 = objc_allocWithZone((Class)INObjectSection);
    type metadata accessor for Tag();
    Class isa = sub_10000FD40().super.isa;
    swift_bridgeObjectRelease();
    id v16 = [v14 initWithTitle:v13 items:isa];

    id v17 = v16;
    sub_10000FD30();
    if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10000FD70();
    }
    sub_10000FD80();
    sub_10000FD60();
    swift_unknownObjectRelease();

    v54 = &_swiftEmptySetSingleton;
    id v18 = [(id)swift_unknownObjectRetain() identifier];
    Swift::Int v19 = sub_10000FD10();
    Swift::Int v21 = v20;

    sub_1000091E4((Swift::Int *)&v53, v19, v21);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v54 = &_swiftEmptySetSingleton;
  }
  uint64_t result = (uint64_t)[a2 respondsToSelector:"deprecatedSportsTopicTagIds"];
  if ((result & 1) == 0) {
    goto LABEL_40;
  }
  id v23 = [a2 deprecatedSportsTopicTagIds];
  if (v23)
  {
    uint64_t v24 = v23;
    v25 = (void *)sub_10000FD50();
  }
  else
  {
    v25 = _swiftEmptyArrayStorage;
  }
  uint64_t v26 = sub_10000A6A4((uint64_t)v25);
  swift_bridgeObjectRelease();
  sub_100008A3C(v26);
  sub_10000FAD0();
  swift_bridgeObjectRelease();
  unint64_t v27 = sub_10000FAC0();
  unint64_t v28 = v27;
  unint64_t v29 = v27 >> 62;
  if (!(v27 >> 62))
  {
    if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_18;
    }
LABEL_37:
    swift_bridgeObjectRelease();
LABEL_38:
    id v43 = objc_allocWithZone((Class)INObjectCollection);
    sub_100006AEC(&qword_10002ADA0);
    Class v44 = sub_10000FD40().super.isa;
    swift_bridgeObjectRelease();
    id v45 = [v43 initWithSections:v44];

    id v46 = v45;
    v50(v45, 0);

    swift_unknownObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v7, v52);
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_10000FE90();
  swift_bridgeObjectRelease();
  if (!v42) {
    goto LABEL_37;
  }
LABEL_18:
  id v30 = (id)NSSNewsWidgetIntentsTopicsHeaderName();
  if (v30)
  {
    v31 = v30;
    sub_10000FD10();
    uint64_t v33 = v32;

    uint64_t v34 = v28 & 0xFFFFFFFFFFFFFF8;
    if (!v29) {
      goto LABEL_20;
    }
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_10000FE90();
    swift_bridgeObjectRelease();
    if (v35) {
      goto LABEL_21;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    if (v33)
    {
LABEL_28:
      NSString v37 = sub_10000FD00();
      swift_bridgeObjectRelease();
LABEL_33:
      id v38 = objc_allocWithZone((Class)INObjectSection);
      type metadata accessor for Tag();
      Class v39 = sub_10000FD40().super.isa;
      swift_bridgeObjectRelease();
      id v40 = [v38 initWithTitle:v37 items:v39];

      id v41 = v40;
      sub_10000FD30();
      if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10000FD70();
      }
      sub_10000FD80();
      sub_10000FD60();

      goto LABEL_38;
    }
LABEL_32:
    NSString v37 = 0;
    goto LABEL_33;
  }
  uint64_t v33 = 0;
  uint64_t v34 = v28 & 0xFFFFFFFFFFFFFF8;
  if (v29) {
    goto LABEL_30;
  }
LABEL_20:
  uint64_t v35 = *(void *)(v34 + 16);
  if (!v35) {
    goto LABEL_31;
  }
LABEL_21:
  v53 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10000FE40();
  if ((v35 & 0x8000000000000000) == 0)
  {
    v48 = v7;
    uint64_t v36 = 0;
    do
    {
      if ((v28 & 0xC000000000000001) != 0) {
        sub_10000FE00();
      }
      else {
        swift_unknownObjectRetain();
      }
      ++v36;
      swift_getObjectType();
      sub_10000C9E8();
      swift_unknownObjectRelease();
      sub_10000FE20();
      sub_10000FE50();
      sub_10000FE60();
      sub_10000FE30();
    }
    while (v35 != v36);
    swift_bridgeObjectRelease();
    id v7 = v48;
    if (v33) {
      goto LABEL_28;
    }
    goto LABEL_32;
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100008A3C(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (Swift::Int *)(*(void *)(v1 + 48) + 16 * v9);
    Swift::Int v11 = *v10;
    Swift::Int v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_1000091E4(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

void sub_100008C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_10000F860();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_100008D20(void *a1, int a2, void *a3, void *aBlock, uint64_t (*a5)(void), void *a6)
{
  uint64_t v10 = (void (**)(void *, id))_Block_copy(aBlock);
  id v11 = objc_allocWithZone((Class)a5(0));
  id v12 = a3;
  id v13 = a1;
  unint64_t v14 = (char *)[v11 init];
  int64_t v15 = &v14[*a6];
  swift_beginAccess();
  *(void *)int64_t v15 = 2;
  [v14 setUserActivity:0];
  v10[2](v10, v14);

  _Block_release(v10);
}

uint64_t sub_100008E08()
{
  sub_100007C50((uint64_t)v6);
  sub_100006B7C(v6, v6[3]);
  sub_100006AEC(&qword_10002AD88);
  sub_10000FA30();
  swift_retain();
  uint64_t v0 = (void *)sub_10000F9C0();
  sub_100006AEC(&qword_10002AD90);
  sub_10000F9D0();
  swift_release();
  swift_release();

  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = &off_10001CC20;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_10000AB84;
  *(void *)(v2 + 24) = v1;
  uint64_t v3 = (void *)sub_10000F9C0();
  sub_100006AEC(&qword_10002AD68);
  uint64_t v4 = sub_10000F9D0();
  swift_release();
  swift_release();

  sub_100006E88((uint64_t)v6);
  return v4;
}

uint64_t sub_100008F98(unint64_t *a1)
{
  unint64_t v8 = *a1;
  swift_bridgeObjectRetain();
  unint64_t v1 = swift_bridgeObjectRetain();
  sub_10000C1D4(v1);
  if (!(v8 >> 62))
  {
    uint64_t v2 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    sub_100006AEC(&qword_10002AD80);
    swift_allocObject();
    return sub_10000FA00();
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_10000FE90();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t result = sub_10000FE40();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v8 & 0xC000000000000001) != 0) {
        sub_10000FE00();
      }
      else {
        swift_unknownObjectRetain();
      }
      ++v4;
      id v5 = [objc_allocWithZone((Class)type metadata accessor for TagIntent()) init];
      swift_getObjectType();
      id v6 = v5;
      id v7 = sub_10000C9E8();
      [v6 setTag:v7];

      swift_unknownObjectRelease();
      sub_10000FE20();
      sub_10000FE50();
      sub_10000FE60();
      sub_10000FE30();
    }
    while (v2 != v4);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000091E4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10000FF20();
  swift_bridgeObjectRetain();
  sub_10000FD20();
  Swift::Int v8 = sub_10000FF40();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10000FEB0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_10000FEB0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100009674(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100009394()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006AEC((uint64_t *)&unk_10002ADB0);
  uint64_t v3 = sub_10000FDF0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_10000FF20();
      sub_10000FD20();
      uint64_t result = sub_10000FF40();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100009674(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100009394();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100009810();
      goto LABEL_22;
    }
    sub_1000099C4();
  }
  uint64_t v11 = *v4;
  sub_10000FF20();
  sub_10000FD20();
  uint64_t result = sub_10000FF40();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10000FEB0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10000FED0();
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
          uint64_t result = sub_10000FEB0();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_100009810()
{
  unint64_t v1 = v0;
  sub_100006AEC((uint64_t *)&unk_10002ADB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000FDE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_1000099C4()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006AEC((uint64_t *)&unk_10002ADB0);
  uint64_t v3 = sub_10000FDF0();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_10000FF20();
    swift_bridgeObjectRetain();
    sub_10000FD20();
    uint64_t result = sub_10000FF40();
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
    unint64_t v1 = v0;
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

void (*sub_100009C74(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100009D24(v6, a2, a3);
  return sub_100009CDC;
}

void sub_100009CDC(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_100009D24(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_10000FE00();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_100009DA4;
  }
  __break(1u);
  return result;
}

uint64_t sub_100009DA4()
{
  return swift_unknownObjectRelease();
}

void sub_100009DAC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_10000FB00();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  int64_t v13 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v33 - v14;
  if (!a2) {
    goto LABEL_6;
  }
  uint64_t v16 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v16)
  {
    swift_bridgeObjectRetain();
    sub_10000FAF0();
    unint64_t v17 = (void *)sub_10000F910();
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v4;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v19 + v18, v13, v9);
    id v20 = v4;
    sub_100006AEC(&qword_10002AD98);
    sub_10000FA20();

    swift_release();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a3;
    *(void *)(v21 + 24) = a4;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_10000AE08;
    *(void *)(v22 + 24) = v21;
    swift_retain();
    unint64_t v23 = (void *)sub_10000F9C0();
    sub_10000F9E0();
    swift_release();
    swift_release();

    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = a3;
    *(void *)(v24 + 24) = a4;
    swift_retain();
    char v25 = (void *)sub_10000F9C0();
    sub_10000F9F0();
    swift_release();
    swift_release();
    swift_release();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
  else
  {
LABEL_6:
    unint64_t v26 = (void *)sub_10000F910();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v4;
    *(void *)(v27 + 24) = &off_10001CBF8;
    id v28 = v4;
    sub_100006AEC(&qword_10002AD68);
    sub_10000FA20();

    swift_release();
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = a3;
    *(void *)(v29 + 24) = a4;
    swift_retain();
    id v30 = (void *)sub_10000F9C0();
    sub_10000F9E0();
    swift_release();
    swift_release();

    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = a3;
    *(void *)(v31 + 24) = a4;
    swift_retain();
    uint64_t v34 = sub_10000F9C0();
    sub_10000F9F0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v32 = (void *)v34;
  }
}

uint64_t sub_10000A20C(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    id v3 = (id)sub_10000FE90();
    swift_bridgeObjectRelease();
    if (!v3) {
      return (uint64_t)v3;
    }
  }
  else
  {
    id v3 = *(id *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      return (uint64_t)v3;
    }
  }
  id v4 = (id)NSSNewsWidgetIntentsFollowingHeaderName();
  if (v4)
  {
    uint64_t v5 = v4;
    sub_10000FD10();
    uint64_t v7 = v6;

    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    if (!v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    if (!v2)
    {
LABEL_5:
      uint64_t v9 = *(void *)(v8 + 16);
      swift_bridgeObjectRetain();
      if (v9) {
        goto LABEL_6;
      }
LABEL_16:
      swift_bridgeObjectRelease();
      if (v7)
      {
LABEL_13:
        NSString v12 = sub_10000FD00();
        swift_bridgeObjectRelease();
LABEL_18:
        id v13 = objc_allocWithZone((Class)INObjectSection);
        type metadata accessor for Tag();
        Class isa = sub_10000FD40().super.isa;
        swift_bridgeObjectRelease();
        id v3 = [v13 initWithTitle:v12 items:isa];

        return (uint64_t)v3;
      }
LABEL_17:
      NSString v12 = 0;
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10000FE90();
  if (!v9) {
    goto LABEL_16;
  }
LABEL_6:
  uint64_t result = sub_10000FE40();
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        sub_10000FE00();
      }
      else {
        swift_unknownObjectRetain();
      }
      ++v11;
      sub_10000795C();
      swift_unknownObjectRelease();
      sub_10000FE20();
      sub_10000FE50();
      sub_10000FE60();
      sub_10000FE30();
    }
    while (v9 != v11);
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A440(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    id v3 = (id)sub_10000FE90();
    swift_bridgeObjectRelease();
    if (!v3) {
      return (uint64_t)v3;
    }
  }
  else
  {
    id v3 = *(id *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      return (uint64_t)v3;
    }
  }
  if ([self progressivePersonalization] == (id)2) {
    id v4 = NSSNewsWidgetIntentsSuggestedBySiriHeaderName();
  }
  else {
    id v4 = NSSNewsWidgetIntentsSuggestedByNewsHeaderName();
  }
  id v5 = v4;
  if (v5)
  {
    sub_10000FD10();
    uint64_t v7 = v6;

    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    if (!v2)
    {
LABEL_8:
      uint64_t v9 = *(void *)(v8 + 16);
      swift_bridgeObjectRetain();
      if (v9) {
        goto LABEL_9;
      }
LABEL_19:
      swift_bridgeObjectRelease();
      if (v7)
      {
LABEL_16:
        NSString v12 = sub_10000FD00();
        swift_bridgeObjectRelease();
LABEL_21:
        id v13 = objc_allocWithZone((Class)INObjectSection);
        type metadata accessor for Tag();
        Class isa = sub_10000FD40().super.isa;
        swift_bridgeObjectRelease();
        id v3 = [v13 initWithTitle:v12 items:isa];

        return (uint64_t)v3;
      }
LABEL_20:
      NSString v12 = 0;
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10000FE90();
  if (!v9) {
    goto LABEL_19;
  }
LABEL_9:
  uint64_t result = sub_10000FE40();
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        sub_10000FE00();
      }
      else {
        swift_unknownObjectRetain();
      }
      ++v11;
      sub_10000795C();
      swift_unknownObjectRelease();
      sub_10000FE20();
      sub_10000FE50();
      sub_10000FE60();
      sub_10000FE30();
    }
    while (v9 != v11);
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A6A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_10000FD90();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000091E4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

id sub_10000A73C()
{
  unint64_t v1 = v0;
  id v2 = [self sharedAccount];
  id v3 = [v2 dynamicSupportedContentLanguage];

  if (v3 == (id)1)
  {
    if (qword_10002A1A0 != -1) {
      swift_once();
    }
    id v4 = &qword_10002A1A8;
  }
  else
  {
    if (qword_10002A190 != -1) {
      swift_once();
    }
    id v4 = &qword_10002A198;
  }
  Swift::Int v5 = (void *)*v4;
  id v6 = objc_allocWithZone((Class)type metadata accessor for TagIntent());
  id v7 = v5;
  id v8 = [v6 init];
  [v8 setTag:v7];

  sub_100006AEC(&qword_10002AD50);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001A350;
  id v10 = [v8 description];
  uint64_t v11 = sub_10000FD10();
  uint64_t v13 = v12;

  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 64) = sub_10000AA6C();
  *(void *)(v9 + 32) = v11;
  *(void *)(v9 + 40) = v13;
  sub_100006B40(0, &qword_10002AD60);
  uint64_t v14 = (void *)sub_10000FDD0();
  sub_10000FDA0();
  sub_10000FA80();
  swift_bridgeObjectRelease();

  sub_10000FD10();
  id v15 = v8;
  uint64_t v16 = (void *)sub_10000F910();
  *(void *)(swift_allocObject() + 16) = v1;
  id v17 = v1;
  sub_100006AEC(&qword_10002AD68);
  sub_10000FA20();

  swift_release();
  unint64_t v18 = (void *)sub_10000F9C0();
  sub_100006AEC(&qword_10002AD70);
  sub_10000F9D0();
  swift_release();

  sub_100006AEC(&qword_10002AD78);
  swift_allocObject();
  sub_10000FAA0();
  uint64_t v19 = (void *)sub_10000FA90();
  id v20 = [v19 tag];

  swift_release();
  return v20;
}

unint64_t sub_10000AA6C()
{
  unint64_t result = qword_10002AD58;
  if (!qword_10002AD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AD58);
  }
  return result;
}

uint64_t sub_10000AAC0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AAF8()
{
  return sub_100008E08();
}

uint64_t sub_10000AB14()
{
  return sub_10000B820(v0);
}

uint64_t sub_10000AB30(uint64_t *a1)
{
  return sub_10000B880(a1, v1);
}

uint64_t sub_10000AB4C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BA9C(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_10000AB8C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000ABC4(void *a1)
{
  return sub_10000BB74(a1, *(uint64_t (**)(void, void, void))(v1 + 16));
}

uint64_t sub_10000ABE0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000AC18(uint64_t a1, uint64_t a2)
{
  sub_100008C90(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000AC20()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AC60()
{
  return sub_100008080(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10000AC7C(unint64_t *a1)
{
  uint64_t v2 = *(void (**)(id, void))(v1 + 16);
  id v3 = sub_10000811C(*a1, a1[1]);
  v2(v3, 0);
}

void sub_10000ACCC(uint64_t a1)
{
  sub_10000827C(a1, *(void (**)(id, void))(v1 + 16));
}

uint64_t sub_10000ACD4()
{
  uint64_t v1 = sub_10000FB00();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000ADA0()
{
  return sub_10000832C();
}

uint64_t sub_10000AE08(uint64_t a1, void *a2)
{
  return sub_100008414(a1, a2, *(void (**)(id, void))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_10000AE10(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, void))(v1 + 16);
  uint64_t v4 = sub_100006AEC(&qword_10002AD98);
  return v3(a1, *(void *)(a1 + *(int *)(v4 + 48)));
}

uint64_t sub_10000AE64(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(v1 + 16))(0, a1);
}

uint64_t sub_10000AE94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006AEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000AEF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006AEC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000AF54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006AEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t static Tag.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Int sub_10000AFD4()
{
  return sub_10000FF40();
}

void sub_10000B018()
{
}

Swift::Int sub_10000B040()
{
  return sub_10000FF40();
}

void sub_10000B090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  sub_10000B218(a6);
  Class isa = sub_10000FD40().super.isa;
  swift_bridgeObjectRelease();
  sub_10000B568();
  uint64_t v14 = (void *)sub_10000FDB0();
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = sub_10000B530;
  v15[5] = v12;
  v17[4] = sub_10000B5E8;
  v17[5] = v15;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10000B3E4;
  v17[3] = &unk_10001CEF8;
  uint64_t v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  [a5 fetchTagsForTagIDs:isa qualityOfService:25 callbackQueue:v14 completionHandler:v16];
  _Block_release(v16);
}

void *sub_10000B218(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    sub_10000BF88(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000BF88(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000BF88((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_10000B660(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_10000B340(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(void))
{
  if (a1) {
    return a5();
  }
  if (a2)
  {
    uint64_t v7 = a2;
  }
  else
  {
    sub_10000B60C();
    uint64_t v7 = swift_allocError();
  }
  swift_errorRetain();
  a3(v7);

  return _swift_errorRelease(v7);
}

uint64_t sub_10000B3E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100006AEC(&qword_10002AE00);
    uint64_t v4 = sub_10000FCF0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B48C()
{
  return sub_10000FA10();
}

void sub_10000B4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000B090(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_10000B4F8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B530(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

unint64_t sub_10000B568()
{
  unint64_t result = qword_10002ADF8;
  if (!qword_10002ADF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002ADF8);
  }
  return result;
}

uint64_t sub_10000B5A8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B5E8(uint64_t a1, uint64_t a2)
{
  return sub_10000B340(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(void))(v2 + 32));
}

uint64_t sub_10000B5F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B604()
{
  return swift_release();
}

unint64_t sub_10000B60C()
{
  unint64_t result = qword_10002AE08;
  if (!qword_10002AE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AE08);
  }
  return result;
}

_OWORD *sub_10000B660(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t _s6ErrorsOwet(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s6ErrorsOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000B764);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B78C()
{
  return 0;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

unint64_t sub_10000B7A8()
{
  unint64_t result = qword_10002AE10;
  if (!qword_10002AE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AE10);
  }
  return result;
}

uint64_t type metadata accessor for Localized()
{
  return self;
}

uint64_t sub_10000B820(void *a1)
{
  uint64_t v1 = a1[5];
  uint64_t v2 = a1[6];
  sub_100006B7C(a1 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_10000B880(uint64_t *a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (uint64_t *)(v3 + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      swift_bridgeObjectRetain();
      NSString v8 = sub_10000FD00();
      unsigned int v9 = [v8 fc_isValidTagID];

      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_10000BFA8(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v11 = _swiftEmptyArrayStorage[2];
        unint64_t v10 = _swiftEmptyArrayStorage[3];
        if (v11 >= v10 >> 1) {
          sub_10000BFA8((char *)(v10 > 1), v11 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v11 + 1;
        uint64_t v12 = (char *)&_swiftEmptyArrayStorage[2 * v11];
        *((void *)v12 + 4) = v7;
        *((void *)v12 + 5) = v6;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v5 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    uint64_t v2 = a2;
  }
  sub_100006AEC(&qword_10002AF78);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000FA00();
  uint64_t v13 = v2 + 7;
  uint64_t v15 = v2[10];
  uint64_t v14 = v2[11];
  sub_100006B7C(v13, v15);
  uint64_t v16 = swift_bridgeObjectRetain();
  sub_10000C3A0(v16);
  (*(void (**)(void *, uint64_t, uint64_t))(v14 + 8))(_swiftEmptyArrayStorage, v15, v14);
  swift_bridgeObjectRelease();
  id v17 = (void *)sub_10000F9C0();
  uint64_t v18 = sub_10000F9B0();
  swift_release();
  swift_release();

  return v18;
}

uint64_t sub_10000BA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FA00();
}

uint64_t sub_10000BB74(void *a1, uint64_t (*a2)(void, void, void))
{
  return a2(*a1, a1[1], a1[2]);
}

uint64_t sub_10000BBB4()
{
  sub_100006E88(v0 + 16);
  sub_100006E88(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for FollowingTagsService()
{
  return self;
}

uint64_t sub_10000BC18(uint64_t a1)
{
  sub_100006AEC(&qword_10002AD88);
  sub_10000FA30();
  swift_retain();
  uint64_t v2 = (void *)sub_10000F9C0();
  sub_100006AEC(&qword_10002AD90);
  sub_10000F9D0();
  swift_release();
  swift_release();

  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_10000AB84;
  *(void *)(v4 + 24) = v3;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_10000F9C0();
  sub_100006AEC(&qword_10002AD68);
  uint64_t v6 = sub_10000F9D0();
  swift_release();
  swift_release();

  return v6;
}

uint64_t sub_10000BD7C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_100006B7C(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_10000BDD8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BE10()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BE48(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

char *sub_10000BE84(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006AEC((uint64_t *)&unk_10002AF80);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
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

char *sub_10000BF88(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000BFC8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000BFA8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000C0D0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000BFC8(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006AEC(qword_10002AFA0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

char *sub_10000C0D0(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006AEC((uint64_t *)&unk_10002AF80);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
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
  swift_release();
  return v10;
}

uint64_t sub_10000C1D4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000FE90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10000FE90();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10000FE10();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10000C5E8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10000FE90();
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

  return sub_10000FD60();
}

uint64_t sub_10000C3A0(uint64_t result)
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
  uint64_t result = (uint64_t)sub_10000BE84((char *)result, v10, 1, (char *)v3);
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
    uint64_t *v1 = v3;
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

unint64_t sub_10000C48C(uint64_t a1, uint64_t a2)
{
  sub_10000FF20();
  sub_10000FD20();
  Swift::Int v4 = sub_10000FF40();

  return sub_10000C504(a1, a2, v4);
}

unint64_t sub_10000C504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000FEB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000FEB0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000C5E8(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10000FE90();
    uint64_t result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_10000FE90();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000C944();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100006AEC(&qword_10002AF90);
            int64_t v10 = sub_100009C74(v13, i, a3);
            uint64_t v12 = *v11;
            swift_unknownObjectRetain();
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
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
        sub_100006AEC(&qword_10002AE00);
        swift_arrayInitWithCopy();
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

void *sub_10000C78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = _swiftEmptyArrayStorage;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  while (1)
  {
    if (!*(void *)(a2 + 16)) {
      goto LABEL_4;
    }
    uint64_t v9 = (uint64_t *)(a1 + 32 + 16 * v8);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    swift_bridgeObjectRetain_n();
    unint64_t v12 = sub_10000C48C(v10, v11);
    if (v13) {
      break;
    }
    swift_bridgeObjectRelease_n();
LABEL_4:
    if (++v8 == v5)
    {
      swift_bridgeObjectRelease();
      return _swiftEmptyArrayStorage;
    }
  }
  BOOL v14 = *(void **)(*(void *)(a2 + 56) + 8 * v12);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = [v14 tagType];
  uint64_t v15 = *(void *)(a3 + 16);
  if (!v15) {
    goto LABEL_17;
  }
  if (*(void **)(a3 + 32) == result)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    sub_10000FD30();
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10000FD70();
    }
    sub_10000FD80();
    sub_10000FD60();
    goto LABEL_4;
  }
  if (v15 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_4;
  }
  uint64_t v16 = 5;
  while (1)
  {
    uint64_t v17 = v16 - 3;
    if (__OFADD__(v16 - 4, 1)) {
      break;
    }
    if (*(void **)(a3 + 8 * v16) == result) {
      goto LABEL_9;
    }
    ++v16;
    if (v17 == v15) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10000C944()
{
  unint64_t result = qword_10002AF98;
  if (!qword_10002AF98)
  {
    sub_10000C9A0(&qword_10002AF90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002AF98);
  }
  return result;
}

uint64_t sub_10000C9A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_10000C9E8()
{
  type metadata accessor for Tag();
  id v1 = [v0 identifier];
  sub_10000FD10();

  sub_10000CBCC();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v3 = sub_10000FD00();
  swift_bridgeObjectRelease();
  NSString v4 = sub_10000FD00();
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithIdentifier:v3 displayString:v4];

  id v6 = [v0 groupTitleColor];
  NSString v7 = v6;
  if (v6)
  {
    id v8 = [v6 hex];

    sub_10000FD10();
    NSString v7 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  [v5 setNameColorLight:v7];

  id v9 = [v0 groupDarkStyleTitleColor];
  NSString v10 = v9;
  if (v9)
  {
    id v11 = [v9 hex];

    sub_10000FD10();
    NSString v10 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  [v5 setNameColorDark:v10];

  return v5;
}

uint64_t sub_10000CBCC()
{
  id v1 = [v0 nameCompact];
  if (!v1) {
    id v1 = [v0 name];
  }
  uint64_t v2 = sub_10000FD10();

  return v2;
}

void sub_10000CC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10000CF70;
  *(void *)(v9 + 24) = v8;
  v11[4] = sub_10000CFA8;
  uint64_t v11[5] = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000CE6C;
  v11[3] = &unk_10001D070;
  NSString v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [a5 peekWithAccessor:v10];
  _Block_release(v10);
}

uint64_t sub_10000CD58(void *a1, void (*a2)(uint64_t, void *))
{
  id v4 = [a1 autoFavoriteTagIDs];
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)sub_10000FD50();
  }
  else
  {
    id v6 = _swiftEmptyArrayStorage;
  }
  id v7 = [a1 rankedAllSubscribedTagIDs];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)sub_10000FD50();
  }
  else
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10000CFC8((uint64_t)v9, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a2(v10, v6);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000CE6C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_10000CECC()
{
  return sub_10000FA10();
}

void sub_10000CF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000CC48(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_10000CF38()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CF70(uint64_t a1, uint64_t a2)
{
  NSString v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_10000CFA8(void *a1)
{
  return sub_10000CD58(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

uint64_t sub_10000CFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CFC0()
{
  return swift_release();
}

uint64_t sub_10000CFC8(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v4 = 0;
  uint64_t v22 = result + 32;
  id v20 = a2 + 7;
  uint64_t v21 = _swiftEmptyArrayStorage;
  do
  {
    if (v4 <= v2) {
      unint64_t v5 = v2;
    }
    else {
      unint64_t v5 = v4;
    }
    unint64_t v23 = v5;
    while (1)
    {
      if (v4 == v23) {
        goto LABEL_33;
      }
      id v6 = (uint64_t *)(v22 + 16 * v4);
      uint64_t v7 = *v6;
      uint64_t v8 = v6[1];
      ++v4;
      uint64_t v9 = a2[2];
      if (!v9) {
        goto LABEL_24;
      }
      uint64_t result = a2[4];
      if (result != v7 || a2[5] != v8)
      {
        uint64_t result = sub_10000FEB0();
        if ((result & 1) == 0) {
          break;
        }
      }
LABEL_7:
      if (v4 == v2) {
        return (uint64_t)v21;
      }
    }
    if (v9 != 1)
    {
      id v11 = v20;
      uint64_t v12 = 1;
      while (1)
      {
        uint64_t v13 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          break;
        }
        uint64_t result = *(v11 - 1);
        if (result == v7 && *v11 == v8) {
          goto LABEL_7;
        }
        uint64_t result = sub_10000FEB0();
        if (result) {
          goto LABEL_7;
        }
        v11 += 2;
        ++v12;
        if (v13 == v9) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = v21;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10000BFA8(0, v21[2] + 1, 1);
      uint64_t v15 = v21;
    }
    uint64_t v16 = v15;
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      uint64_t result = (uint64_t)sub_10000BFA8((char *)(v17 > 1), v18 + 1, 1);
      uint64_t v16 = v21;
    }
    v16[2] = v18 + 1;
    uint64_t v21 = v16;
    uint64_t v19 = &v16[2 * v18];
    v19[4] = v7;
    v19[5] = v8;
  }
  while (v4 != v2);
  return (uint64_t)v21;
}

uint64_t sub_10000D190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_10000D19C()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10000D1D8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10000D210(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_10000D270(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_10000D27C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000D2BC(uint64_t *a1, int a2)
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

uint64_t sub_10000D304(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for FollowingResults()
{
  return sub_10000D358();
}

uint64_t sub_10000D358()
{
  return swift_getGenericMetadata();
}

char *TagIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  unint64_t v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  uint64_t v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id TagIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntent();
  return [super init];
}

id TagIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntent();
  [super initWithCoder:a1];

  return v3;
}

id TagIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id TagIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TagIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id TagIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_10000FD00();
  swift_bridgeObjectRelease();
  NSString v8 = sub_10000FD00();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_10000FCE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TagIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_10000FD00();
  swift_bridgeObjectRelease();
  NSString v8 = sub_10000FD00();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_10000FCE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for TagIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TagIntent.__deallocating_deinit()
{
  return sub_10000E108(type metadata accessor for TagIntent);
}

unint64_t TagIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_10000E140(a1);
}

Swift::Int sub_10000D9E0()
{
  Swift::UInt v1 = *v0;
  sub_10000FF20();
  sub_10000FF30(v1);
  return sub_10000FF40();
}

void sub_10000DA28()
{
  sub_10000FF30(*v0);
}

Swift::Int sub_10000DA54()
{
  Swift::UInt v1 = *v0;
  sub_10000FF20();
  sub_10000FF30(v1);
  return sub_10000FF40();
}

unint64_t sub_10000DA98@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_10000E140(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t TagIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TagIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *TagIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for TagIntent()
{
  return self;
}

id TagIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id TagIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___TagIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [super init];
}

id Tag.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id TagIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id TagIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id TagIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  [super initWithBackingStore:a1];

  return v3;
}

id sub_10000DF10(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [super a3];
}

id TagIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_10000FCE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id TagIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_10000FCE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id TagIntentResponse.__deallocating_deinit()
{
  return sub_10000E108(type metadata accessor for TagIntentResponse);
}

id sub_10000E108(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

unint64_t sub_10000E140(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for TagIntentResponse()
{
  return self;
}

unint64_t sub_10000E178()
{
  unint64_t result = qword_10002B038;
  if (!qword_10002B038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B038);
  }
  return result;
}

uint64_t sub_10000E1CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___TagIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_10000E220(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___TagIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TagIntentResponseCode()
{
  return &type metadata for TagIntentResponseCode;
}

char *TodayIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id TodayIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntent();
  return [super init];
}

id TodayIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntent();
  [super initWithCoder:a1];

  return v3;
}

id TodayIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TodayIntent();
  id v6 = [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id TodayIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_10000FD00();
  swift_bridgeObjectRelease();
  NSString v8 = sub_10000FD00();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_10000FCE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for TodayIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TodayIntent.__deallocating_deinit()
{
  return sub_10000EC70(type metadata accessor for TodayIntent);
}

uint64_t TodayIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TodayIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *TodayIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

uint64_t type metadata accessor for TodayIntent()
{
  return self;
}

id TodayIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [super init];
}

id TodayIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id TodayIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  id v3 = [super initWithBackingStore:a1];

  return v3;
}

id sub_10000EAFC(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [super a3];
}

id TodayIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_10000FCE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  [v5 initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id TodayIntentResponse.__deallocating_deinit()
{
  return sub_10000EC70(type metadata accessor for TodayIntentResponse);
}

id sub_10000EC70(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for TodayIntentResponse()
{
  return self;
}

unint64_t sub_10000ECD0()
{
  unint64_t result = qword_10002B098;
  if (!qword_10002B098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002B098);
  }
  return result;
}

uint64_t sub_10000ED24@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___TodayIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_10000ED78(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___TodayIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TodayIntentResponseCode()
{
  return &type metadata for TodayIntentResponseCode;
}

id Tag.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_10000FD00();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id Tag.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_10000FD00();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_10000FD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for Tag();
  id v11 = [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for Tag()
{
  return self;
}

id Tag.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Tag();
  [super initWithCoder:a1];

  return v3;
}

id Tag.__deallocating_deinit()
{
  return sub_10000F828(type metadata accessor for Tag);
}

id static TagResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static TagResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_10000F2B0();
    swift_bridgeObjectRetain();
    sub_10000FE80();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_10000FEC0();
    sub_10000F2B0();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_10000F2B0();
  Class isa = sub_10000FD40().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_10000F2B0()
{
  unint64_t result = qword_10002B118;
  if (!qword_10002B118)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002B118);
  }
  return result;
}

id static TagResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static TagResolutionResult.success(with:)()
{
}

void static TagResolutionResult.disambiguation(with:)()
{
}

void static TagResolutionResult.confirmationRequired(with:)()
{
}

id TagResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_10000FCE0().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id TagResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_10000FCE0().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TagResolutionResult();
  id v5 = [super initWithJSONDictionary:isa a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for TagResolutionResult()
{
  return self;
}

id TagResolutionResult.__deallocating_deinit()
{
  return sub_10000F828(type metadata accessor for TagResolutionResult);
}

id sub_10000F828(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_10000F860()
{
  return _convertErrorToNSError(_:)();
}

void sub_10000F870(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000F880()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F890()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000F8A0()
{
  return static Settings.NewsContentEnvironment.contentEnvironment.getter();
}

uint64_t sub_10000F8D0()
{
  return Configurable.setting<A>(_:)();
}

uint64_t sub_10000F8F0()
{
  return Definition.thenConfigure(_:)();
}

uint64_t sub_10000F900()
{
  return Definition.inScope(_:)();
}

uint64_t sub_10000F910()
{
  return zalgoIfMain.getter();
}

uint64_t sub_10000F920()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_10000F930()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_10000F940()
{
  return SingletonPool.init()();
}

uint64_t sub_10000F950()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_10000F960()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_10000F970()
{
  return ProxyContainer.private.getter();
}

uint64_t sub_10000F980()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_10000F990()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_10000F9A0()
{
  return type metadata accessor for Scope();
}

uint64_t sub_10000F9B0()
{
  return when2<A, B>(on:_:_:)();
}

uint64_t sub_10000F9C0()
{
  return zalgo.getter();
}

uint64_t sub_10000F9D0()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_10000F9E0()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_10000F9F0()
{
  return Promise.error(on:closure:)();
}

uint64_t sub_10000FA00()
{
  return Promise.init(value:)();
}

uint64_t sub_10000FA10()
{
  return Promise.init(resolver:)();
}

uint64_t sub_10000FA20()
{
  return firstly<A>(on:closure:)();
}

uint64_t sub_10000FA30()
{
  return firstly<A>(closure:)();
}

uint64_t sub_10000FA40()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_10000FA50()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t sub_10000FA60()
{
  return Container.resolver.getter();
}

uint64_t sub_10000FA70()
{
  return type metadata accessor for Container();
}

uint64_t sub_10000FA80()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_10000FA90()
{
  return DefaultIntentProvider.defaultIntent()();
}

uint64_t sub_10000FAA0()
{
  return DefaultIntentProvider.init(widgetKind:fallback:defaultIntentsPromise:)();
}

uint64_t sub_10000FAB0()
{
  return SearchResults.topHitTopic()();
}

uint64_t sub_10000FAC0()
{
  return SearchResults.topics()();
}

uint64_t sub_10000FAD0()
{
  return SearchResults.excluding(identifiers:)();
}

uint64_t sub_10000FAE0()
{
  return type metadata accessor for SearchResults();
}

uint64_t sub_10000FAF0()
{
  return SearchRequestData.init(searchString:origination:batchSize:refreshQueryParam:)();
}

uint64_t sub_10000FB00()
{
  return type metadata accessor for SearchRequestData();
}

uint64_t sub_10000FB10()
{
  return dispatch thunk of SearchServiceType.fetchSearchResults(searchData:)();
}

uint64_t sub_10000FB20()
{
  return LocalRegionManager.init(locationManager:localAreasManager:)();
}

uint64_t sub_10000FB30()
{
  return type metadata accessor for LocalRegionManager();
}

uint64_t sub_10000FB40()
{
  return FeatureAvailability.init(featureAvailabilityProvider:)();
}

uint64_t sub_10000FB50()
{
  return type metadata accessor for FeatureAvailability();
}

uint64_t sub_10000FB60()
{
  return SearchServiceAssembly.init()();
}

uint64_t sub_10000FB70()
{
  return type metadata accessor for SearchServiceAssembly();
}

uint64_t sub_10000FB80()
{
  return FeatureAvailabilityProvider.init(appConfigurationManager:)();
}

uint64_t sub_10000FB90()
{
  return type metadata accessor for FeatureAvailabilityProvider();
}

uint64_t sub_10000FBA0()
{
  return SearchEndpointConfigManager.init(appConfigManager:resourceService:)();
}

uint64_t sub_10000FBB0()
{
  return type metadata accessor for SearchEndpointConfigManager();
}

uint64_t sub_10000FBC0()
{
  return type metadata accessor for NewsEnvironment();
}

uint64_t sub_10000FBD0()
{
  return FeedContextFactory.init(paidBundleConfigManager:paidAccessChecker:bundleSubscriptionManager:bundleSessionManager:featureAvailability:appConfigManager:platform:userInfo:)();
}

uint64_t sub_10000FBE0()
{
  return type metadata accessor for FeedContextFactory();
}

uint64_t sub_10000FBF0()
{
  return FeedAppConfigManager.init(appConfigManager:)();
}

uint64_t sub_10000FC00()
{
  return type metadata accessor for FeedAppConfigManager();
}

uint64_t sub_10000FC10()
{
  return static FeedPlatform.current.getter();
}

uint64_t sub_10000FC20()
{
  return type metadata accessor for FeedPlatform();
}

uint64_t sub_10000FC30()
{
  return FeedUserInfo.init(userInfo:)();
}

uint64_t sub_10000FC40()
{
  return type metadata accessor for FeedUserInfo();
}

uint64_t sub_10000FC50()
{
  return TagService.init(tagController:subscriptionController:)();
}

uint64_t sub_10000FC60()
{
  return type metadata accessor for TagService();
}

uint64_t sub_10000FC70()
{
  return ResourceService.init(cloudContext:)();
}

uint64_t sub_10000FC80()
{
  return type metadata accessor for ResourceService();
}

uint64_t sub_10000FC90()
{
  return FeatureAvailability.init()();
}

uint64_t sub_10000FCA0()
{
  return type metadata accessor for FeatureAvailability();
}

uint64_t sub_10000FCB0()
{
  return type metadata accessor for LocationDetectionManager();
}

uint64_t sub_10000FCC0()
{
  return NoopBundleSessionManager.init()();
}

uint64_t sub_10000FCD0()
{
  return type metadata accessor for NoopBundleSessionManager();
}

NSDictionary sub_10000FCE0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000FCF0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10000FD00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000FD10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000FD20()
{
  return String.hash(into:)();
}

uint64_t sub_10000FD30()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10000FD40()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000FD50()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000FD60()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000FD70()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000FD80()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000FD90()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10000FDA0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000FDB0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10000FDC0()
{
  return FCNewsAppConfigurationManager.fetchAppConfigurationIfNeeded(cachedOnly:)();
}

uint64_t sub_10000FDD0()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_10000FDE0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10000FDF0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000FE00()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000FE10()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000FE20()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10000FE30()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10000FE40()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10000FE50()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10000FE60()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000FE70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000FE80()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10000FE90()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000FEA0()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_10000FEB0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000FEC0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_10000FED0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000FEE0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000FEF0()
{
  return Error._code.getter();
}

uint64_t sub_10000FF00()
{
  return Error._domain.getter();
}

uint64_t sub_10000FF10()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000FF20()
{
  return Hasher.init(_seed:)();
}

void sub_10000FF30(Swift::UInt a1)
{
}

Swift::Int sub_10000FF40()
{
  return Hasher._finalize()();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return _FCURLForContainerizedUserAccountCachesDirectory();
}

uint64_t FCURLForTodayDropbox()
{
  return _FCURLForTodayDropbox();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NSSNewsWidgetIntentsFollowingHeaderName()
{
  return _NSSNewsWidgetIntentsFollowingHeaderName();
}

uint64_t NSSNewsWidgetIntentsSuggestedByNewsHeaderName()
{
  return _NSSNewsWidgetIntentsSuggestedByNewsHeaderName();
}

uint64_t NSSNewsWidgetIntentsSuggestedBySiriHeaderName()
{
  return _NSSNewsWidgetIntentsSuggestedBySiriHeaderName();
}

uint64_t NSSNewsWidgetIntentsTopHitHeaderName()
{
  return _NSSNewsWidgetIntentsTopHitHeaderName();
}

uint64_t NSSNewsWidgetIntentsTopicsHeaderName()
{
  return _NSSNewsWidgetIntentsTopicsHeaderName();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectWithSize:options:attributes:context:];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return [a1 characterIsMember:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_compare_options_range_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:range:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_fastestEncoding(void *a1, const char *a2, ...)
{
  return _[a1 fastestEncoding];
}

id objc_msgSend_fr_accessibilityApplyLowerPitchTokenToRange_(void *a1, const char *a2, ...)
{
  return [a1 fr_accessibilityApplyLowerPitchTokenToRange:];
}

id objc_msgSend_fr_stringByDecodingHTMLEntities(void *a1, const char *a2, ...)
{
  return [a1 fr_stringByDecodingHTMLEntities];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return _[a1 parse];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return [a1 scanInt:];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanString_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanString:intoString:];
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanUpToString:intoString:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:range:];
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return [a1 setCharactersToBeSkipped:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_strings(void *a1, const char *a2, ...)
{
  return _[a1 strings];
}

id objc_msgSend_strippedString(void *a1, const char *a2, ...)
{
  return _[a1 strippedString];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}