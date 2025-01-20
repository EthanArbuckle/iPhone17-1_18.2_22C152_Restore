uint64_t sub_1000049B8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  sub_100004A28(&qword_10000C168);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000078A0;
  v1 = sub_1000073D0();
  v2 = sub_100004A6C();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  return v0;
}

ValueMetadata *type metadata accessor for WeatherAppIntentsPackage()
{
  return &type metadata for WeatherAppIntentsPackage;
}

uint64_t sub_100004A28(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004A6C()
{
  unint64_t result = qword_10000C170;
  if (!qword_10000C170)
  {
    sub_1000073D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

uint64_t AppIntentsAssembly.load(in:)()
{
  uint64_t v0 = sub_100007540();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_100007500();
  sub_100004A28(&qword_10000C178);
  sub_100005E94();
  swift_release();
  sub_100007400();
  sub_1000074A0();
  swift_release();
  swift_release();
  sub_100007500();
  sub_100004A28(&qword_10000C180);
  sub_100005E94();
  swift_release();
  v2 = *(void (**)(uint64_t))(v1 + 104);
  uint64_t v3 = sub_100005EB4();
  v2(v3);
  sub_1000074B0();
  swift_release();
  swift_release();
  v4 = *(void (**)(uint64_t))(v1 + 8);
  uint64_t v5 = sub_100005ECC();
  v4(v5);
  sub_100007500();
  sub_100004A28(&qword_10000C188);
  sub_100005E94();
  swift_release();
  swift_release();
  sub_100007500();
  sub_100004A28(&qword_10000C190);
  sub_100005E94();
  swift_release();
  swift_release();
  sub_100007500();
  sub_100004A28(&qword_10000C198);
  sub_100005E94();
  swift_release();
  swift_release();
  sub_100007500();
  sub_100007660();
  sub_100005E94();
  swift_release();
  uint64_t v6 = sub_100005EB4();
  v2(v6);
  sub_1000074B0();
  swift_release();
  swift_release();
  uint64_t v7 = sub_100005ECC();
  v4(v7);
  sub_100007500();
  sub_100004A28(&qword_10000C1A0);
  sub_100005E94();
  swift_release();
  swift_release();
  sub_100007510();
  sub_100007520();
  return swift_release();
}

uint64_t sub_100004DE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C270);
  uint64_t result = sub_1000074C0();
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C250);
  uint64_t result = sub_1000074C0();
  if (!v8)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C280);
  uint64_t result = sub_1000074C0();
  if (v6)
  {
    sub_100005DE4(&v5, (uint64_t)v7);
    sub_100007400();
    swift_allocObject();
    uint64_t result = sub_1000073F0();
    *a2 = result;
    a2[1] = (uint64_t)&protocol witness table for GeocodeService;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100004F20(uint64_t a1, void *a2)
{
  sub_100005D78(a2, a2[3]);
  sub_100004A28(&qword_10000C240);
  uint64_t result = sub_1000074C0();
  if (v4)
  {
    sub_1000073E0();
    return sub_100005DFC((uint64_t)v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100004FA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100007690();
  swift_allocObject();
  uint64_t result = sub_100007680();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for NetworkMonitor;
  *a1 = result;
  return result;
}

uint64_t sub_100004FFC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100005C64(a1, &qword_10000C198, (uint64_t (*)(void))&type metadata accessor for WDSAuthenticatorFactory, (uint64_t (*)(char *))&WDSAuthenticatorFactory.init(clientConfigurationProvider:), (uint64_t)&protocol witness table for WDSAuthenticatorFactory, a2);
}

uint64_t sub_100005038@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v16 = sub_100007640();
  uint64_t v3 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  long long v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004A28(&qword_10000C268);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100007660();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C188);
  uint64_t result = sub_1000074C0();
  if (v18)
  {
    sub_100005DE4(&v17, (uint64_t)v19);
    sub_100005D78(a1, a1[3]);
    sub_1000074C0();
    uint64_t result = sub_100005DBC((uint64_t)v8, 1, v9);
    if (result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
      sub_100005D78(v19, v19[3]);
      uint64_t v14 = v16;
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for WDSVersion.tokenServiceVersion(_:), v16);
      sub_1000076A0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return sub_100005DFC((uint64_t)v19);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100005304@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C270);
  uint64_t result = sub_1000074C0();
  if (v6)
  {
    uint64_t v4 = sub_100007470();
    swift_allocObject();
    uint64_t v5 = sub_100007460();
    a2[3] = v4;
    uint64_t result = sub_100005E4C(&qword_10000C278, (void (*)(uint64_t))&type metadata accessor for AppConfigurationSettingsProvider);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000053D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v3 = sub_100007380();
  __chkstk_darwin(v3 - 8);
  uint64_t v13 = sub_100007440();
  uint64_t v4 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100007420();
  uint64_t v7 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000073C0();
  sub_1000073B0();
  sub_100007390();
  sub_1000073A0();
  swift_release();
  swift_release();
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C270);
  uint64_t result = sub_1000074C0();
  if (v16)
  {
    sub_100005DE4(&v15, (uint64_t)v17);
    sub_100005D78(v17, v17[3]);
    sub_100007450();
    sub_100007410();
    sub_100007430();
    sub_100007650();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v12);
    return sub_100005DFC((uint64_t)v17);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005660@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v21 = a2;
  uint64_t v3 = sub_100007620();
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  __chkstk_darwin(v3);
  v26 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100007630();
  uint64_t v5 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  v23 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000075D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004A28(&qword_10000C268);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005D78(a1, a1[3]);
  uint64_t v14 = sub_100007660();
  sub_1000074C0();
  v20[0] = v13;
  uint64_t result = sub_100005DBC((uint64_t)v13, 1, v14);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v16 = *(void (**)(char *, void, uint64_t))(v8 + 104);
  v20[1] = v10;
  v16(v10, enum case for WeatherDataCaching.disabled(_:), v7);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v23, enum case for WeatherAvailabilityCaching.disabled(_:), v22);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v26, enum case for WeatherStatisticsCaching.disabled(_:), v25);
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C180);
  uint64_t result = sub_1000074C0();
  if (!v29)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C190);
  uint64_t result = sub_1000074C0();
  if (!v28)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C198);
  uint64_t result = sub_1000074C0();
  if (v27)
  {
    long long v17 = (objc_class *)sub_100007610();
    id v18 = objc_allocWithZone(v17);
    uint64_t result = sub_100007600();
    v19 = v21;
    v21[3] = (uint64_t)v17;
    void v19[4] = (uint64_t)&protocol witness table for WeatherDataServiceProxy;
    uint64_t *v19 = result;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100005A44()
{
  sub_100004A28(&qword_10000C240);
  sub_100007530();
  swift_release();
  sub_100004A28(&qword_10000C248);
  sub_100007530();
  swift_release();
  sub_100004A28(&qword_10000C250);
  sub_100007530();

  return swift_release();
}

uint64_t sub_100005B18@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005D78(a1, a1[3]);
  sub_100004A28(&qword_10000C1A0);
  uint64_t result = sub_1000074C0();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for GeocodeWeatherService();
    uint64_t v5 = swift_allocObject();
    sub_100005DE4(&v6, v5 + 16);
    a2[3] = v4;
    uint64_t result = sub_100005E4C(&qword_10000C260, (void (*)(uint64_t))type metadata accessor for GeocodeWeatherService);
    a2[4] = result;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005BEC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100005C64(a1, &qword_10000C258, (uint64_t (*)(void))&type metadata accessor for PrivacySaltProvider, (uint64_t (*)(char *))&PrivacySaltProvider.init(identityService:), (uint64_t)&protocol witness table for PrivacySaltProvider, a2);
}

uint64_t sub_100005C28@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100005C64(a1, &qword_10000C248, (uint64_t (*)(void))&type metadata accessor for PrivacySampler, (uint64_t (*)(char *))&PrivacySampler.init(saltProvider:), (uint64_t)&protocol witness table for PrivacySampler, a2);
}

uint64_t sub_100005C64@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(char *)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  sub_100005D78(a1, a1[3]);
  sub_100004A28(a2);
  uint64_t result = sub_1000074C0();
  if (v14)
  {
    uint64_t v12 = a3(0);
    swift_allocObject();
    uint64_t result = a4(v13);
    a6[3] = v12;
    a6[4] = a5;
    *a6 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AppIntentsAssembly.deinit()
{
  return v0;
}

uint64_t AppIntentsAssembly.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100005D3C()
{
  return AppIntentsAssembly.load(in:)();
}

uint64_t type metadata accessor for AppIntentsAssembly()
{
  return self;
}

void *sub_100005D78(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100005DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100005DE4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100005DFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005E4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005E94()
{
  return sub_100007530();
}

uint64_t sub_100005EB4()
{
  return v0;
}

uint64_t sub_100005ECC()
{
  return v0;
}

id sub_100005EE0()
{
  id result = [objc_allocWithZone((Class)NSRecursiveLock) init];
  qword_10000C288 = (uint64_t)result;
  return result;
}

uint64_t sub_100005F14()
{
  uint64_t v0 = sub_100007590();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  long long v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000074D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (void *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100004A28(&qword_10000C2A8);
  uint64_t v8 = swift_allocObject();
  long long v17 = xmmword_1000078A0;
  *(_OWORD *)(v8 + 16) = xmmword_1000078A0;
  uint64_t v9 = sub_100007490();
  swift_allocObject();
  uint64_t v10 = sub_100007480();
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = sub_100006478(&qword_10000C2B0, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v8 + 32) = v10;
  sub_100004A28(&qword_10000C2B8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v17;
  uint64_t v12 = type metadata accessor for AppIntentsAssembly();
  uint64_t v13 = swift_allocObject();
  *(void *)(v11 + 56) = v12;
  *(void *)(v11 + 64) = sub_100006478(&qword_10000C2C0, (void (*)(uint64_t))type metadata accessor for AppIntentsAssembly);
  *(void *)(v11 + 32) = v13;
  sub_1000074F0();
  swift_allocObject();
  sub_1000074E0();
  if (qword_10000C158 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)qword_10000C288;
  *uint64_t v7 = qword_10000C288;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for ContainerLock.lock(_:), v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Container.Environment.normal(_:), v0);
  sub_1000075C0();
  swift_allocObject();
  id v15 = v14;
  uint64_t result = sub_1000075A0();
  qword_10000C290 = result;
  return result;
}

uint64_t sub_10000623C()
{
  sub_100007360();
  sub_100007350();
  if (qword_10000C160 != -1) {
    swift_once();
  }
  sub_1000075B0();
  sub_100007340();
  swift_release();
  return sub_100005DFC((uint64_t)v1);
}

uint64_t sub_1000062D0(uint64_t a1)
{
  unint64_t v2 = sub_10000641C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000637C()
{
  unint64_t result = qword_10000C298;
  if (!qword_10000C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

uint64_t sub_1000063CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000641C()
{
  unint64_t result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherAppIntentsExtension()
{
  return &type metadata for WeatherAppIntentsExtension;
}

uint64_t sub_100006478(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000064C0()
{
}

Swift::Int sub_1000064E8()
{
  return sub_100007720();
}

uint64_t sub_10000652C()
{
  return 1;
}

Swift::Int sub_10000653C()
{
  return sub_100007720();
}

uint64_t sub_10000658C()
{
  sub_100005DFC(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for GeocodeWeatherService()
{
  return self;
}

uint64_t sub_1000065E8(uint64_t a1, void *a2)
{
  sub_100005D78((void *)(v2 + 16), *(void *)(v2 + 40));
  [a2 coordinate];
  sub_1000075F0();
  uint64_t v4 = (void *)sub_100007550();
  sub_100007670();
  uint64_t v5 = sub_100007560();
  swift_release();

  return v5;
}

uint64_t sub_1000066A4(uint64_t *a1)
{
  uint64_t v3 = sub_1000075E0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v61 = (uint64_t)v48 - v8;
  uint64_t v9 = sub_100007670();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  v50 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v58 = (char *)v48 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v55 = (char *)v48 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v54 = (char *)v48 - v18;
  __chkstk_darwin(v17);
  v49 = (char *)v48 - v19;
  uint64_t v20 = sub_100004A28(&qword_10000C368);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  v23 = (char *)v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  v51 = (char *)v48 - v25;
  __chkstk_darwin(v24);
  uint64_t v52 = (uint64_t)v48 - v26;
  uint64_t v27 = *a1;
  uint64_t v28 = *(void *)(*a1 + 16);
  uint64_t v56 = v10;
  if (v28)
  {
    v48[0] = v27;
    v48[1] = v1;
    uint64_t v29 = v27 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v30 = *(void *)(v4 + 72);
    v59 = (void (**)(char *, char *, uint64_t))(v10 + 32);
    swift_bridgeObjectRetain();
    v60 = (char *)&_swiftEmptyArrayStorage;
    v53 = v7;
    uint64_t v57 = v3;
    v31 = v59;
    do
    {
      uint64_t v32 = v61;
      sub_100006D34(v29, v61);
      sub_100006D34(v32, (uint64_t)v7);
      if (swift_getEnumCaseMultiPayload() == 7)
      {
        v33 = *v31;
        v34 = v55;
        (*v31)(v55, v7, v9);
        v33(v23, v34, v9);
        uint64_t v35 = 0;
      }
      else
      {
        sub_100006D98((uint64_t)v7);
        uint64_t v35 = 1;
      }
      sub_100006DF4((uint64_t)v23, v35, 1, v9);
      sub_100006D98(v61);
      if (sub_100005DBC((uint64_t)v23, 1, v9) == 1)
      {
        sub_100006E1C((uint64_t)v23);
      }
      else
      {
        v36 = *v59;
        v37 = v54;
        (*v59)(v54, v23, v9);
        v36(v58, v37, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v60 = (char *)sub_100006F30(0, *((void *)v60 + 2) + 1, 1, (uint64_t)v60);
        }
        unint64_t v39 = *((void *)v60 + 2);
        unint64_t v38 = *((void *)v60 + 3);
        if (v39 >= v38 >> 1) {
          v60 = (char *)sub_100006F30(v38 > 1, v39 + 1, 1, (uint64_t)v60);
        }
        v40 = v60;
        *((void *)v60 + 2) = v39 + 1;
        v36(&v40[((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v39], v58, v9);
        uint64_t v7 = v53;
      }
      v29 += v30;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
  }
  else
  {
    v60 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v41 = (uint64_t)v51;
  uint64_t v42 = v52;
  sub_100006C68((uint64_t)v60, v52);
  swift_bridgeObjectRelease();
  sub_100006E7C(v42, v41);
  int v43 = sub_100005DBC(v41, 1, v9);
  uint64_t v44 = v56;
  if (v43 == 1)
  {
    sub_100006E1C(v41);
    sub_100006EE4();
    swift_allocError();
    sub_100004A28(&qword_10000C378);
    swift_allocObject();
    uint64_t v45 = sub_100007570();
  }
  else
  {
    v46 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v49, v41, v9);
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v50, v46, v9);
    sub_100004A28(&qword_10000C378);
    swift_allocObject();
    uint64_t v45 = sub_100007580();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v9);
  }
  sub_100006E1C(v42);
  return v45;
}

uint64_t sub_100006C68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_100007670();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return sub_100006DF4(a2, v7, 1, v6);
}

uint64_t sub_100006D10(uint64_t a1, void *a2)
{
  return sub_1000065E8(a1, a2);
}

uint64_t sub_100006D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000075E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006D98(uint64_t a1)
{
  uint64_t v2 = sub_1000075E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100006E1C(uint64_t a1)
{
  uint64_t v2 = sub_100004A28(&qword_10000C368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A28(&qword_10000C368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100006EE4()
{
  unint64_t result = qword_10000C370;
  if (!qword_10000C370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C370);
  }
  return result;
}

size_t sub_100006F30(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004A28(&qword_10000C380);
  uint64_t v10 = *(void *)(sub_100007670() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100007670() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_1000070E0(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_1000070E0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1 || (uint64_t result = sub_100007670(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = sub_100007670();
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return _swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GeocodeWeatherService.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for GeocodeWeatherService.Error(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000072ACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000072D4()
{
  return 0;
}

ValueMetadata *type metadata accessor for GeocodeWeatherService.Error()
{
  return &type metadata for GeocodeWeatherService.Error;
}

unint64_t sub_1000072F4()
{
  unint64_t result = qword_10000C388;
  if (!qword_10000C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C388);
  }
  return result;
}

uint64_t sub_100007340()
{
  return AppDependencyManager.addWeatherDependencies(from:)();
}

uint64_t sub_100007350()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_100007360()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_100007380()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007390()
{
  return static Settings.WeatherEnvironment.contentEnvironment.getter();
}

uint64_t sub_1000073A0()
{
  return SettingReader.read<A>(_:)();
}

uint64_t sub_1000073B0()
{
  return static SettingReader.shared.getter();
}

uint64_t sub_1000073C0()
{
  return type metadata accessor for SettingReader();
}

uint64_t sub_1000073D0()
{
  return type metadata accessor for WeatherCoreAppIntentsPackage();
}

uint64_t sub_1000073E0()
{
  return GeocodeService.setupWeatherKitGeocoding(using:)();
}

uint64_t sub_1000073F0()
{
  return GeocodeService.init(appConfigurationManager:privacySampler:locationMetadataUpdater:)();
}

uint64_t sub_100007400()
{
  return type metadata accessor for GeocodeService();
}

uint64_t sub_100007410()
{
  return AppConfiguration.endpointConfig(for:)();
}

uint64_t sub_100007420()
{
  return type metadata accessor for AppConfiguration();
}

uint64_t sub_100007430()
{
  return EndpointConfiguration.weatherDataURL.getter();
}

uint64_t sub_100007440()
{
  return type metadata accessor for EndpointConfiguration();
}

uint64_t sub_100007450()
{
  return dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
}

uint64_t sub_100007460()
{
  return AppConfigurationSettingsProvider.init(appConfigurationManager:)();
}

uint64_t sub_100007470()
{
  return type metadata accessor for AppConfigurationSettingsProvider();
}

uint64_t sub_100007480()
{
  return Assembly.init()();
}

uint64_t sub_100007490()
{
  return type metadata accessor for Assembly();
}

uint64_t sub_1000074A0()
{
  return Definition.thenConfigure<A>(as:configuration:)();
}

uint64_t sub_1000074B0()
{
  return Definition.inScope(_:)();
}

uint64_t sub_1000074C0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_1000074D0()
{
  return type metadata accessor for ContainerLock();
}

uint64_t sub_1000074E0()
{
  return SingletonPool.init()();
}

uint64_t sub_1000074F0()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_100007500()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_100007510()
{
  return ProxyContainer.private.getter();
}

uint64_t sub_100007520()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t sub_100007530()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_100007540()
{
  return type metadata accessor for Scope();
}

uint64_t sub_100007550()
{
  return zalgo.getter();
}

uint64_t sub_100007560()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_100007570()
{
  return Promise.init(error:)();
}

uint64_t sub_100007580()
{
  return Promise.init(value:)();
}

uint64_t sub_100007590()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_1000075A0()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:containerLock:)();
}

uint64_t sub_1000075B0()
{
  return Container.resolver.getter();
}

uint64_t sub_1000075C0()
{
  return type metadata accessor for Container();
}

uint64_t sub_1000075D0()
{
  return type metadata accessor for WeatherDataCaching();
}

uint64_t sub_1000075E0()
{
  return type metadata accessor for WeatherDataResponse();
}

uint64_t sub_1000075F0()
{
  return dispatch thunk of WeatherDataServiceType.perform(requests:for:with:)();
}

uint64_t sub_100007600()
{
  return WeatherDataServiceProxy.init(endpoint:caching:availableDataSetCaching:statisticsCaching:networkMonitor:authenticator:appConfigurationSettingsProvider:)();
}

uint64_t sub_100007610()
{
  return type metadata accessor for WeatherDataServiceProxy();
}

uint64_t sub_100007620()
{
  return type metadata accessor for WeatherStatisticsCaching();
}

uint64_t sub_100007630()
{
  return type metadata accessor for WeatherAvailabilityCaching();
}

uint64_t sub_100007640()
{
  return type metadata accessor for WDSVersion();
}

uint64_t sub_100007650()
{
  return WDSEndpoint.init(url:)();
}

uint64_t sub_100007660()
{
  return type metadata accessor for WDSEndpoint();
}

uint64_t sub_100007670()
{
  return type metadata accessor for LocationInfo();
}

uint64_t sub_100007680()
{
  return NetworkMonitor.init()();
}

uint64_t sub_100007690()
{
  return type metadata accessor for NetworkMonitor();
}

uint64_t sub_1000076A0()
{
  return dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:version:isJWTEnabled:)();
}

uint64_t sub_1000076B0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000076C0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000076D0()
{
  return Error._code.getter();
}

uint64_t sub_1000076E0()
{
  return Error._domain.getter();
}

uint64_t sub_1000076F0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100007700()
{
  return Hasher.init(_seed:)();
}

void sub_100007710(Swift::UInt a1)
{
}

Swift::Int sub_100007720()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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