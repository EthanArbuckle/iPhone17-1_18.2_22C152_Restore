id NWMColorForValueInIndices(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t vars8;

  v3 = a1;
  v4 = NWMColorIndexForValueInIndices(v3, a2);
  if (v4)
  {
    v5 = [v3 firstObject];

    if (v4 != v5)
    {
      v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "indexOfObject:", v4) - 1);
      [v6 value];
      v8 = a2 - v7;
      [v4 value];
      v10 = v9;
      [v6 value];
      v12 = v8 / (v10 - v11);
      v13 = [v6 color];
      v14 = [v4 color];
      v15 = NWMInterpolateBetweenColors(v13, v14, v12);

      goto LABEL_7;
    }
    v16 = [v4 color];
  }
  else
  {
    v16 = [MEMORY[0x263F825C8] whiteColor];
  }
  v15 = (void *)v16;
LABEL_7:

  return v15;
}

id NWKUIBundle()
{
  if (NWKUIBundle_onceToken[0] != -1) {
    dispatch_once(NWKUIBundle_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)NWKUIBundle_Bundle;
  return v0;
}

uint64_t __NWKUIBundle_block_invoke()
{
  NWKUIBundle_Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id NWKUILocalizedString(void *a1)
{
  id v1 = a1;
  v2 = NWKUIBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_26E23BD88 table:0];

  return v3;
}

void sub_22E8163D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t NWMColorForRGB(double a1, double a2, double a3)
{
  return [MEMORY[0x263F825C8] colorWithRed:a1 / 255.0 green:a2 / 255.0 blue:a3 / 255.0 alpha:1.0];
}

id NWMInterpolateBetweenColors(void *a1, void *a2, double a3)
{
  double v16 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  id v5 = a2;
  [a1 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
  [v5 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];

  double v6 = fmin(fmax(a3, 0.0), 1.0);
  v7 = [MEMORY[0x263F825C8] colorWithRed:v16 + (v12 - v16) * v6 green:v15 + (v11 - v15) * v6 blue:v14 + (v10 - v14) * v6 alpha:v13 + (v9 - v13) * v6];
  return v7;
}

id NWMColorIndexForValueInIndices(void *a1, double a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = [v3 firstObject];
  [v4 value];
  double v6 = v5;

  if (v6 > a2)
  {
    uint64_t v7 = [v3 firstObject];
LABEL_5:
    double v11 = (void *)v7;
    goto LABEL_17;
  }
  v8 = [v3 lastObject];
  [v8 value];
  double v10 = v9;

  if (v10 < a2)
  {
    uint64_t v7 = [v3 lastObject];
    goto LABEL_5;
  }
  double v11 = [v3 firstObject];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v17, "value", (void)v21);
        if (v18 >= a2)
        {
          id v19 = v17;

          double v11 = v19;
          goto LABEL_16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_17:
  return v11;
}

uint64_t variable initialization expression of LocationDateFormatter.$__lazy_storage_$_accessibilityFormatter()
{
  return 0;
}

id variable initialization expression of NHPWidgetDateFormatter.dateFormatter()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08790]);
  return objc_msgSend(v0, sel_init);
}

id variable initialization expression of NHPWidgetDateFormatter.dateComponentsFormatter()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08780]);
  return objc_msgSend(v0, sel_init);
}

uint64_t _s25NanoWeatherKitUICompanion19VisibilityFormatterC14overrideLocale10Foundation0H0VSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22E846118();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

double variable initialization expression of PrecipitationChanceFormatter.maximumPercentage()
{
  return 1.0;
}

uint64_t variable initialization expression of PrecipitationChanceFormatter.percentFormatter()
{
  if (qword_268614E88 != -1) {
    swift_once();
  }
  return swift_retain();
}

id variable initialization expression of PercentFormatter.percentageFormatter()
{
  uint64_t v0 = sub_22E846118();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  sub_22E8460E8();
  double v5 = (void *)sub_22E8460D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v4, sel_setLocale_, v5);

  objc_msgSend(v4, sel_setNumberStyle_, 3);
  return v4;
}

double variable initialization expression of PercentFormatter.maximumPercentage()
{
  return 1.0;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22E818258(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22E818278(uint64_t result, int a2, int a3)
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

void type metadata accessor for CLLocationCoordinate2D()
{
  if (!qword_268614EE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268614EE0);
    }
  }
}

uint64_t WeatherCondition.conditionIconName(coordinates:date:)(double a1, double a2)
{
  if (qword_268614E18 != -1) {
    swift_once();
  }
  GEOLocationCoordinate2DMake(a1, a2);
  sub_22E845FB8();
  char isDayLightForLocation = geo_isDayLightForLocation();
  return _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0(v2, isDayLightForLocation);
}

Swift::String_optional __swiftcall WeatherCondition.conditionIconName(isDaytime:)(Swift::Bool isDaytime)
{
  if (qword_268614E50 != -1) {
    swift_once();
  }
  uint64_t v3 = _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0(v1, isDaytime);
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

uint64_t WeatherCondition.simplePrecipitationCondtion()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E846618();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  uint64_t v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F1F4F0]) {
    goto LABEL_22;
  }
  uint64_t v9 = v8;
  if (v8 == *MEMORY[0x263F1F500])
  {
LABEL_3:
    double v10 = (unsigned int *)MEMORY[0x263F1F4A8];
LABEL_23:
    uint64_t v9 = *v10;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x263F1F470] || v8 == *MEMORY[0x263F1F440]) {
    goto LABEL_22;
  }
  if (v8 == *MEMORY[0x263F1F490])
  {
LABEL_24:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104))(a1, v9, v4);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  if (v8 == *MEMORY[0x263F1F508]) {
    goto LABEL_22;
  }
  if (v8 == *MEMORY[0x263F1F510]) {
    goto LABEL_3;
  }
  BOOL v12 = v8 == *MEMORY[0x263F1F518] || v8 == *MEMORY[0x263F1F478];
  BOOL v13 = v12 || v8 == *MEMORY[0x263F1F4A0];
  if (v13 || v8 == *MEMORY[0x263F1F480]) {
    goto LABEL_22;
  }
  if (v8 == *MEMORY[0x263F1F4C0]) {
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x263F1F4A8]) {
    goto LABEL_3;
  }
  if (v8 == *MEMORY[0x263F1F460] || v8 == *MEMORY[0x263F1F468])
  {
LABEL_22:
    double v10 = (unsigned int *)MEMORY[0x263F1F4A0];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x263F1F520])
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104))(a1, v8, v4);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
  }
}

uint64_t WeatherCondition.iconHasRain.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E846618();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  BOOL v13 = v6 == *MEMORY[0x263F1F4F0]
     || v6 == *MEMORY[0x263F1F470]
     || v6 == *MEMORY[0x263F1F440]
     || v6 == *MEMORY[0x263F1F508]
     || v6 == *MEMORY[0x263F1F4A0]
     || v6 == *MEMORY[0x263F1F4C0]
     || v6 == *MEMORY[0x263F1F458]
     || v6 == *MEMORY[0x263F1F460];
  uint64_t v14 = v13;
  if (!v13) {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v14;
}

uint64_t WeatherCondition.fallbackCondition.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E846618();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, v2, v4);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v9 == *MEMORY[0x263F1F470])
  {
    double v10 = (unsigned int *)MEMORY[0x263F1F440];
  }
  else
  {
    if (v9 != *MEMORY[0x263F1F478] && v9 != *MEMORY[0x263F1F480] && v9 != *MEMORY[0x263F1F458])
    {
      v8(a1, v2, v4);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    double v10 = (unsigned int *)MEMORY[0x263F1F460];
  }
  return (*(uint64_t (**)(char *, void, uint64_t))(v5 + 104))(a1, *v10, v4);
}

id sub_22E818A34()
{
  uint64_t v1 = OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter____lazy_storage___accessibilityFormatter;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter____lazy_storage___accessibilityFormatter);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter____lazy_storage___accessibilityFormatter);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    uint64_t v5 = (void *)sub_22E846988();
    objc_msgSend(v4, sel_setDateFormat_, v5);

    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_22E818AD8()
{
  type metadata accessor for LocationDateFormatter();
  uint64_t v0 = swift_allocObject();
  _s25NanoWeatherKitUICompanion21LocationDateFormatterC8calendar33_F11D3163793300FBD0749B496D3764F410Foundation8CalendarVvpfi_0();
  *(void *)(v0
            + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter____lazy_storage___accessibilityFormatter) = 0;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  *(void *)(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_formatter) = v1;
  id v2 = v1;
  id v3 = (void *)sub_22E846988();
  objc_msgSend(v2, sel_setDateFormat_, v3);

  static LocationDateFormatter.shared = v0;
}

uint64_t *LocationDateFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E00 != -1) {
    swift_once();
  }
  return &static LocationDateFormatter.shared;
}

uint64_t static LocationDateFormatter.shared.getter()
{
  if (qword_268614E00 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t LocationDateFormatter.dayOfWeekForDate(_:timeZone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22E8461B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E846228();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  double v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a2, v8);
  uint64_t v31 = v2;
  uint64_t v13 = v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_calendar;
  swift_beginAccess();
  sub_22E846198();
  v12(v11, a2, v8);
  sub_22E846198();
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  LOBYTE(v13) = sub_22E846148();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v13)
  {
    if (qword_268614E40 != -1) {
      swift_once();
    }
    id v14 = (id)qword_268615028;
    uint64_t v15 = (void *)sub_22E846988();
    uint64_t v16 = (void *)sub_22E846988();
    v17 = (void *)sub_22E846988();
    id v18 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, v16, v17);

    uint64_t v19 = sub_22E846998();
  }
  else
  {
    v20 = *(void **)(v31 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_formatter);
    long long v21 = (void *)sub_22E8461E8();
    objc_msgSend(v20, sel_setTimeZone_, v21);

    long long v22 = (void *)sub_22E846018();
    id v23 = objc_msgSend(v20, sel_stringFromDate_, v22);

    uint64_t v24 = sub_22E846998();
    uint64_t v26 = v25;

    uint64_t v32 = v24;
    uint64_t v33 = v26;
    sub_22E819544();
    uint64_t v27 = sub_22E846CB8();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v32 = v27;
    uint64_t v33 = v29;
    uint64_t v19 = sub_22E846CD8();
    swift_bridgeObjectRelease();
  }
  return v19;
}

uint64_t LocationDateFormatter.accessibilityDayOfWeekForDate(_:timeZone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22E8461B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E846228();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  double v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  BOOL v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a2, v8);
  uint64_t v23 = v2;
  uint64_t v13 = v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_calendar;
  swift_beginAccess();
  sub_22E846198();
  v12(v11, a2, v8);
  sub_22E846198();
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  LOBYTE(v13) = sub_22E846148();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v13)
  {
    if (qword_268614E40 != -1) {
      swift_once();
    }
    id v14 = (id)qword_268615028;
    uint64_t v15 = (void *)sub_22E846988();
    uint64_t v16 = (void *)sub_22E846988();
    v17 = (void *)sub_22E846988();
    id v18 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, v16, v17);
  }
  else
  {
    id v20 = sub_22E818A34();
    long long v21 = (void *)sub_22E8461E8();
    objc_msgSend(v20, sel_setTimeZone_, v21);

    uint64_t v16 = sub_22E818A34();
    v17 = (void *)sub_22E846018();
    id v18 = objc_msgSend(v16, sel_stringFromDate_, v17);
  }

  uint64_t v19 = sub_22E846998();
  return v19;
}

uint64_t LocationDateFormatter.isDateToday(_:timeZone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22E8461B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E846228();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  uint64_t v10 = v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_calendar;
  swift_beginAccess();
  sub_22E846198();
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  LOBYTE(v10) = sub_22E846148();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 & 1;
}

unint64_t sub_22E819544()
{
  unint64_t result = qword_268614EF8;
  if (!qword_268614EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268614EF8);
  }
  return result;
}

uint64_t LocationDateFormatter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_calendar;
  uint64_t v2 = sub_22E8461B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter____lazy_storage___accessibilityFormatter));
  return v0;
}

uint64_t LocationDateFormatter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter_calendar;
  uint64_t v2 = sub_22E8461B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC25NanoWeatherKitUICompanion21LocationDateFormatter____lazy_storage___accessibilityFormatter));
  return swift_deallocClassInstance();
}

uint64_t sub_22E8196DC()
{
  return type metadata accessor for LocationDateFormatter();
}

uint64_t type metadata accessor for LocationDateFormatter()
{
  uint64_t result = qword_268614F08;
  if (!qword_268614F08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22E819730()
{
  uint64_t result = sub_22E8461B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22E8197D8()
{
  uint64_t v0 = sub_22E8467F8();
  __swift_allocate_value_buffer(v0, qword_268617B68);
  __swift_project_value_buffer(v0, (uint64_t)qword_268617B68);
  return sub_22E8467E8();
}

uint64_t static Logger.stringForDate(_:)()
{
  if (qword_268614E10 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.dateFormatter;
  unint64_t v1 = (void *)sub_22E846018();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  uint64_t v3 = sub_22E846998();
  return v3;
}

uint64_t *Logger.dateFormatter.unsafeMutableAddressor()
{
  if (qword_268614E10 != -1) {
    swift_once();
  }
  return &static Logger.dateFormatter;
}

id sub_22E81994C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setTimeStyle_, 1);
  id result = objc_msgSend(v0, sel_setDateStyle_, 1);
  static Logger.dateFormatter = (uint64_t)v0;
  return result;
}

id static Logger.dateFormatter.getter()
{
  if (qword_268614E10 != -1) {
    swift_once();
  }
  id v0 = (void *)static Logger.dateFormatter;
  return v0;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_22E819AA8()
{
  type metadata accessor for GeoServicesUtility();
  uint64_t result = swift_initStaticObject();
  static GeoServicesUtility.shared = result;
  return result;
}

uint64_t *GeoServicesUtility.shared.unsafeMutableAddressor()
{
  if (qword_268614E18 != -1) {
    swift_once();
  }
  return &static GeoServicesUtility.shared;
}

uint64_t static GeoServicesUtility.shared.getter()
{
  type metadata accessor for GeoServicesUtility();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for GeoServicesUtility()
{
  return self;
}

uint64_t GeoServicesUtility.isDaylight(coordinate:date:)(double a1, double a2)
{
  return geo_isDayLightForLocation();
}

uint64_t GeoServicesUtility.deinit()
{
  return v0;
}

uint64_t GeoServicesUtility.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E819C00()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268614F68);
  uint64_t v0 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268614F20) - 8);
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22E847DA0;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = (void *)(v4 + v0[14]);
  sub_22E846708();
  *uint64_t v5 = 22339;
  v5[1] = 0xE200000000000000;
  uint64_t v6 = (void *)(v4 + v1 + v0[14]);
  sub_22E8466E8();
  *uint64_t v6 = 4731954;
  v6[1] = 0xE300000000000000;
  id v7 = (void *)(v4 + 2 * v1 + v0[14]);
  sub_22E8466C8();
  void *v7 = 4468785;
  v7[1] = 0xE300000000000000;
  uint64_t v8 = (void *)(v4 + 3 * v1 + v0[14]);
  sub_22E8466B8();
  void *v8 = 4804929;
  v8[1] = 0xE300000000000000;
  uint64_t v9 = (void *)(v4 + 4 * v1 + v0[14]);
  sub_22E8466F8();
  *uint64_t v9 = 5261390;
  v9[1] = 0xE300000000000000;
  uint64_t v10 = (void *)(v4 + 5 * v1 + v0[14]);
  uint64_t result = sub_22E8466D8();
  *uint64_t v10 = 5653843;
  v10[1] = 0xE300000000000000;
  qword_268614F18 = v3;
  return result;
}

uint64_t WatchDataSets.description.getter()
{
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F20);
  uint64_t v1 = *(void *)(v29 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v29);
  unint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  id v7 = (char *)v27 - v6;
  if (qword_268614E20 != -1) {
    uint64_t v5 = swift_once();
  }
  uint64_t v8 = qword_268614F18;
  MEMORY[0x270FA5388](v5);
  v27[-2] = v0;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_22E81A124((uint64_t (*)(char *))sub_22E81A108, (uint64_t)&v27[-4], v8);
  int64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v30 = MEMORY[0x263F8EE78];
    sub_22E81ACA0(0, v10, 0);
    uint64_t v11 = v9 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    uint64_t v12 = *(void *)(v1 + 72);
    v27[1] = v9;
    uint64_t v28 = v12;
    do
    {
      sub_22E81ACC0(v11, (uint64_t)v7);
      uint64_t v13 = *(int *)(v29 + 48);
      id v14 = &v4[v13];
      uint64_t v15 = &v7[v13];
      uint64_t v16 = sub_22E846718();
      uint64_t v17 = *(void *)(v16 - 8);
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v4, v7, v16);
      uint64_t v18 = *(void *)v15;
      uint64_t v19 = *((void *)v15 + 1);
      *(void *)id v14 = *(void *)v15;
      *((void *)v14 + 1) = v19;
      id v20 = *(void (**)(char *, uint64_t))(v17 + 8);
      swift_bridgeObjectRetain();
      v20(v4, v16);
      sub_22E81AD28((uint64_t)v7);
      uint64_t v21 = v30;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22E81ACA0(0, *(void *)(v21 + 16) + 1, 1);
        uint64_t v21 = v30;
      }
      unint64_t v23 = *(void *)(v21 + 16);
      unint64_t v22 = *(void *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_22E81ACA0(v22 > 1, v23 + 1, 1);
        uint64_t v21 = v30;
      }
      *(void *)(v21 + 16) = v23 + 1;
      uint64_t v24 = v21 + 16 * v23;
      *(void *)(v24 + 32) = v18;
      *(void *)(v24 + 40) = v19;
      v11 += v28;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
  }
  uint64_t v30 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268614F28);
  sub_22E81AD88();
  uint64_t v25 = sub_22E846958();
  swift_bridgeObjectRelease();
  return v25;
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

uint64_t sub_22E81A108()
{
  return sub_22E81AE2C() & 1;
}

uint64_t sub_22E81A124(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268614F20) - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v22 = (uint64_t)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v19 - v10;
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v24 = MEMORY[0x263F8EE78];
  uint64_t v21 = *(void *)(a3 + 16);
  if (v21)
  {
    unint64_t v13 = 0;
    uint64_t v14 = MEMORY[0x263F8EE78];
    v19[1] = a2;
    uint64_t v20 = a3;
    v19[0] = a1;
    while (v13 < *(void *)(a3 + 16))
    {
      unint64_t v15 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
      uint64_t v12 = *(void *)(v23 + 72);
      sub_22E81ACC0(a3 + v15 + v12 * v13, (uint64_t)v11);
      char v16 = a1(v11);
      if (v3)
      {
        sub_22E81AD28((uint64_t)v11);
        swift_release();
        swift_bridgeObjectRelease();
        return v12;
      }
      if (v16)
      {
        sub_22E81B6FC((uint64_t)v11, v22);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_22E81AEA0(0, *(void *)(v14 + 16) + 1, 1);
        }
        uint64_t v14 = v24;
        unint64_t v18 = *(void *)(v24 + 16);
        unint64_t v17 = *(void *)(v24 + 24);
        if (v18 >= v17 >> 1)
        {
          sub_22E81AEA0(v17 > 1, v18 + 1, 1);
          uint64_t v14 = v24;
        }
        *(void *)(v14 + 16) = v18 + 1;
        uint64_t result = sub_22E81B6FC(v22, v14 + v15 + v18 * v12);
        a3 = v20;
        a1 = (uint64_t (*)(char *))v19[0];
      }
      else
      {
        uint64_t result = sub_22E81AD28((uint64_t)v11);
      }
      if (v21 == ++v13)
      {
        uint64_t v12 = v24;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_22E81A35C(uint64_t (*a1)(void), uint64_t a2, uint64_t a3)
{
  return sub_22E81A39C(a1, a2, a3, MEMORY[0x263F1F580], (void (*)(BOOL, uint64_t, uint64_t))sub_22E81AEFC);
}

uint64_t sub_22E81A39C(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(BOOL, uint64_t, uint64_t))
{
  uint64_t v23 = a5;
  uint64_t v33 = a4(0);
  uint64_t v9 = *(void *)(v33 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v33);
  uint64_t v32 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v22 - v13;
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v34 = MEMORY[0x263F8EE78];
  uint64_t v31 = *(void *)(a3 + 16);
  if (v31)
  {
    unint64_t v16 = 0;
    uint64_t v26 = a3;
    uint64_t v27 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v29 = (void (**)(char *, char *, uint64_t))(v9 + 32);
    uint64_t v30 = v9 + 16;
    uint64_t v24 = a1;
    uint64_t v25 = a2;
    while (v16 < *(void *)(a3 + 16))
    {
      unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v15 = *(void *)(v9 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v14, a3 + v17 + v15 * v16, v33);
      char v18 = a1(v14);
      if (v5)
      {
        (*v27)(v14, v33);
        swift_bridgeObjectRelease();
        swift_release();
        return v15;
      }
      if (v18)
      {
        uint64_t v28 = *v29;
        v28(v32, v14, v33);
        uint64_t v19 = v34;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v23(0, *(void *)(v19 + 16) + 1, 1);
          uint64_t v19 = v34;
        }
        unint64_t v21 = *(void *)(v19 + 16);
        unint64_t v20 = *(void *)(v19 + 24);
        if (v21 >= v20 >> 1)
        {
          v23(v20 > 1, v21 + 1, 1);
          uint64_t v19 = v34;
        }
        *(void *)(v19 + 16) = v21 + 1;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v28)(v19 + v17 + v21 * v15, v32, v33);
        uint64_t v34 = v19;
        a3 = v26;
        a1 = v24;
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v27)(v14, v33);
      }
      if (v31 == ++v16)
      {
        uint64_t v15 = v34;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t sub_22E81A658()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268614F50);
  sub_22E846718();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22E847DA0;
  sub_22E8466D8();
  sub_22E8466F8();
  sub_22E8466B8();
  sub_22E846708();
  sub_22E8466E8();
  uint64_t result = sub_22E8466C8();
  static WatchDataSets.allSets = v0;
  return result;
}

uint64_t *WatchDataSets.allSets.unsafeMutableAddressor()
{
  if (qword_268614E28 != -1) {
    swift_once();
  }
  return &static WatchDataSets.allSets;
}

uint64_t static WatchDataSets.allSets.getter()
{
  if (qword_268614E28 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t WatchDataSets.array.getter(uint64_t a1)
{
  if (qword_268614E28 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = static WatchDataSets.allSets;
  MEMORY[0x270FA5388](a1);
  v4[2] = v1;
  swift_bridgeObjectRetain();
  return sub_22E81A39C((uint64_t (*)(void))sub_22E81A108, (uint64_t)v4, v2, MEMORY[0x263F1F618], (void (*)(BOOL, uint64_t, uint64_t))sub_22E81AEC0);
}

uint64_t WatchDataSets.niceDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E846718();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v17 - v7, v1, v2);
  sub_22E846708();
  sub_22E81B6B8(&qword_268614F38);
  char v9 = sub_22E846978();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  if (v9)
  {
    v10(v8, v2);
    return 0x20746E6572727563;
  }
  else
  {
    sub_22E8466E8();
    char v12 = sub_22E846978();
    v10(v6, v2);
    if (v12)
    {
      v10(v8, v2);
      return 0x6620796C72756F68;
    }
    else
    {
      sub_22E8466C8();
      char v13 = sub_22E846978();
      v10(v6, v2);
      if (v13)
      {
        v10(v8, v2);
        return 0x6F6620796C696164;
      }
      else
      {
        sub_22E8466B8();
        char v14 = sub_22E846978();
        v10(v6, v2);
        if (v14)
        {
          v10(v8, v2);
          return 0x6C61757120726961;
        }
        else
        {
          sub_22E8466F8();
          char v15 = sub_22E846978();
          v10(v6, v2);
          if (v15)
          {
            v10(v8, v2);
            return 0xD000000000000017;
          }
          else
          {
            sub_22E8466D8();
            char v16 = sub_22E846978();
            v10(v6, v2);
            v10(v8, v2);
            if (v16) {
              return 0x6520657265766573;
            }
            else {
              return 0x6E776F6E6B6E55;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_22E81ACA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22E81AF58(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_22E81ACC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E81AD28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22E81AD88()
{
  unint64_t result = qword_268614F30;
  if (!qword_268614F30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268614F28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268614F30);
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

uint64_t sub_22E81AE2C()
{
  return sub_22E846D08() & 1;
}

uint64_t sub_22E81AEA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22E81B0C4(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_22E81AEC0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22E81B30C(a1, a2, a3, (void *)*v3, &qword_268614F50, MEMORY[0x263F1F618]);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_22E81AEFC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22E81B30C(a1, a2, a3, (void *)*v3, &qword_268614F48, MEMORY[0x263F1F580]);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_22E81AF38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22E81B554(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_22E81AF58(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268614F60);
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
  char v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E81B0C4(char a1, int64_t a2, char a3, void *a4)
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
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268614F68);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268614F20) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268614F20) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  char v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E81B30C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E81B554(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268614F40);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E81B6B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22E846718();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E81B6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t UVIndex.ExposureCategory.activeColor.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t result = sub_22E846888();
      break;
    case 2:
      uint64_t result = MEMORY[0x270F044C0]();
      break;
    case 3:
      uint64_t result = MEMORY[0x270F043E8]();
      break;
    case 4:
      uint64_t result = MEMORY[0x270F044C8]();
      break;
    default:
      uint64_t result = MEMORY[0x270F04488]();
      break;
  }
  return result;
}

uint64_t LocationSummary.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocationSummary.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocationSummary.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22E81BDAC(type metadata accessor for LocationSummary, MEMORY[0x263F079C8], a1);
}

uint64_t type metadata accessor for LocationSummary(uint64_t a1)
{
  return sub_22E81C5A8(a1, (uint64_t *)&unk_268614FC0);
}

uint64_t LocationSummary.isLocal.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for LocationSummary(0) + 28));
}

double LocationSummary.coordinates.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for LocationSummary(0) + 32));
}

uint64_t LocationSummary.init(name:isLocal:timeZone:id:coordinates:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a5;
  a7[3] = a6;
  uint64_t v14 = (int *)type metadata accessor for LocationSummary(0);
  unint64_t v15 = (char *)a7 + v14[6];
  uint64_t v16 = sub_22E846228();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, a4, v16);
  *((unsigned char *)a7 + v14[7]) = a3;
  char v18 = (double *)((char *)a7 + v14[8]);
  *char v18 = a8;
  v18[1] = a9;
  return result;
}

uint64_t sub_22E81B95C()
{
  uint64_t v0 = sub_22E846228();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (int *)type metadata accessor for LocationSummary(0);
  __swift_allocate_value_buffer((uint64_t)v4, static LocationSummary.invalid);
  uint64_t v5 = __swift_project_value_buffer((uint64_t)v4, (uint64_t)static LocationSummary.invalid);
  sub_22E846218();
  uint64_t v6 = *MEMORY[0x263F00B58];
  uint64_t v7 = *(void *)(MEMORY[0x263F00B58] + 8);
  *(void *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0xE000000000000000;
  strcpy((char *)(v5 + 16), "nil-location");
  *(unsigned char *)(v5 + 29) = 0;
  *(_WORD *)(v5 + 30) = -5120;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5 + v4[6], v3, v0);
  *(unsigned char *)(v5 + v4[7]) = 0;
  uint64_t v9 = (void *)(v5 + v4[8]);
  *uint64_t v9 = v6;
  v9[1] = v7;
  return result;
}

uint64_t LocationSummary.invalid.unsafeMutableAddressor()
{
  if (qword_268614E30 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocationSummary(0);
  return __swift_project_value_buffer(v0, (uint64_t)static LocationSummary.invalid);
}

uint64_t static LocationSummary.invalid.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268614E30 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocationSummary(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static LocationSummary.invalid);
  return sub_22E81BB84(v3, a1);
}

uint64_t sub_22E81BB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationSummary(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t LocationSummary.description.getter()
{
  return 0xD000000000000012;
}

unint64_t sub_22E81BC70()
{
  return 0xD000000000000012;
}

uint64_t sub_22E81BCF0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t LocationForecastSummary.location.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22E81BB84(v1, a1);
}

uint64_t LocationForecastSummary.forecast.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LocationForecastSummary(0) + 20);
  uint64_t v4 = sub_22E8463D8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t LocationForecastSummary.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22E81BDAC(type metadata accessor for LocationForecastSummary, MEMORY[0x263F07508], a1);
}

uint64_t sub_22E81BDAC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *(int *)(a1(0) + 24);
  uint64_t v7 = a2(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v8(a3, v6, v7);
}

uint64_t LocationForecastSummary.init(location:forecast:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F70);
  MEMORY[0x270FA5388](v5 - 8);
  v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F78);
  MEMORY[0x270FA5388](v7 - 8);
  v40 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F80);
  MEMORY[0x270FA5388](v9 - 8);
  v39 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F88);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F90);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F98);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_22E8463D8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v38 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v38 - v25;
  uint64_t v27 = type metadata accessor for LocationForecastSummary(0);
  _s25NanoWeatherKitUICompanion23LocationForecastSummaryV2id10Foundation4UUIDVvpfi_0();
  uint64_t v43 = a1;
  uint64_t v28 = a1;
  uint64_t v29 = v42;
  sub_22E81BB84(v28, a3);
  sub_22E81C5E0(v29, (uint64_t)v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_22E81C6A4((uint64_t)v19, &qword_268614F98);
    uint64_t v30 = sub_22E8464F8();
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56);
    v38 = v16;
    v31(v16, 1, 1, v30);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v13, 1, 1, v32);
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v39, 1, 1, v33);
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v40, 1, 1, v34);
    uint64_t v35 = sub_22E846638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v41, 1, 1, v35);
    sub_22E846388();
    sub_22E81C6A4(v29, &qword_268614F98);
    sub_22E81C648(v43);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(a3 + *(int *)(v27 + 20), v24, v20);
  }
  else
  {
    sub_22E81C6A4(v29, &qword_268614F98);
    sub_22E81C648(v43);
    v37 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    v37(v26, v19, v20);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v37)(a3 + *(int *)(v27 + 20), v26, v20);
  }
}

BOOL LocationForecastSummary.hasNHP.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F88);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LocationForecastSummary(0);
  sub_22E8463C8();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA0);
  BOOL v4 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3) != 1;
  sub_22E81C6A4((uint64_t)v2, &qword_268614F88);
  return v4;
}

uint64_t sub_22E81C43C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_22E8460C8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t _s25NanoWeatherKitUICompanion15LocationSummaryV23__derived_struct_equalsySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_22E846EB8() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_22E846EB8() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = (int *)type metadata accessor for LocationSummary(0);
  if ((MEMORY[0x230FA5270]((char *)a1 + v6[6], (char *)a2 + v6[6]) & 1) == 0
    || *((unsigned __int8 *)a1 + v6[7]) != *((unsigned __int8 *)a2 + v6[7]))
  {
    return 0;
  }
  uint64_t v12 = v6[8];
  v7.n128_u64[0] = *(void *)((char *)a1 + v12);
  v8.n128_u64[0] = *(void *)((char *)a1 + v12 + 8);
  uint64_t v13 = (void *)((char *)a2 + v12);
  v9.n128_u64[0] = *v13;
  v10.n128_u64[0] = v13[1];
  return MEMORY[0x270F84F98](v7, v8, v9, v10);
}

uint64_t type metadata accessor for LocationForecastSummary(uint64_t a1)
{
  return sub_22E81C5A8(a1, (uint64_t *)&unk_268614FD0);
}

uint64_t sub_22E81C5A8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22E81C5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E81C648(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocationSummary(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E81C6A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22E81C700()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_22E81C710()
{
  unint64_t result = qword_268614FB8;
  if (!qword_268614FB8)
  {
    sub_22E8460C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268614FB8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for LocationSummary(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[6];
    __n128 v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_22E846228();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(_OWORD *)((char *)v4 + v14) = *(_OWORD *)((char *)a2 + v14);
  }
  return v4;
}

uint64_t destroy for LocationSummary(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_22E846228();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for LocationSummary(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  __n128 v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22E846228();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  return a1;
}

void *assignWithCopy for LocationSummary(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22E846228();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

_OWORD *initializeWithTake for LocationSummary(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22E846228();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

void *assignWithTake for LocationSummary(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22E846228();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22E81CC28);
}

uint64_t sub_22E81CC28(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_22E846228();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LocationSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22E81CCEC);
}

uint64_t sub_22E81CCEC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22E846228();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22E81CD94()
{
  uint64_t result = sub_22E846228();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for LocationForecastSummary(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    void *v4 = *a2;
    unint64_t v4 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = (int *)type metadata accessor for LocationSummary(0);
    uint64_t v10 = v9[6];
    uint64_t v24 = (char *)v4 + v10;
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_22E846228();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v24, v11, v12);
    *((unsigned char *)v4 + v9[7]) = *((unsigned char *)a2 + v9[7]);
    *(_OWORD *)((char *)v4 + v9[8]) = *(_OWORD *)((char *)a2 + v9[8]);
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_22E8463D8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = *(int *)(a3 + 24);
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_22E8460C8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  }
  return v4;
}

uint64_t destroy for LocationForecastSummary(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for LocationSummary(0) + 24);
  uint64_t v5 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_22E8463D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t v9 = sub_22E8460C8();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  return v10(v8, v9);
}

void *initializeWithCopy for LocationForecastSummary(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = (int *)type metadata accessor for LocationSummary(0);
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22E846228();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *((unsigned char *)a1 + v7[7]) = *((unsigned char *)a2 + v7[7]);
  *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_22E8463D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_22E8460C8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  return a1;
}

void *assignWithCopy for LocationForecastSummary(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for LocationSummary(0);
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22E846228();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  uint64_t v11 = v6[8];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_22E8463D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_22E8460C8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

_OWORD *initializeWithTake for LocationForecastSummary(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = (int *)type metadata accessor for LocationSummary(0);
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22E846228();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *((unsigned char *)a1 + v7[7]) = *((unsigned char *)a2 + v7[7]);
  *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_22E8463D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_22E8460C8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

void *assignWithTake for LocationForecastSummary(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for LocationSummary(0);
  uint64_t v9 = v8[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_22E846228();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
  *(_OWORD *)((char *)a1 + v8[8]) = *(_OWORD *)((char *)a2 + v8[8]);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_22E8463D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_22E8460C8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationForecastSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22E81D6C4);
}

uint64_t sub_22E81D6C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LocationSummary(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_22E8463D8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_22E8460C8();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for LocationForecastSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22E81D824);
}

uint64_t sub_22E81D824(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LocationSummary(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_22E8463D8();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_22E8460C8();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

uint64_t sub_22E81D97C()
{
  uint64_t result = type metadata accessor for LocationSummary(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_22E8463D8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_22E8460C8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

id sub_22E81DA80()
{
  uint64_t v0 = sub_22E846118();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IntegerFormatter();
  uint64_t v4 = swift_allocObject();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  *(void *)(v4 + 16) = v5;
  id v6 = v5;
  sub_22E8460E8();
  uint64_t v7 = (void *)sub_22E8460D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v6, sel_setLocale_, v7);

  id result = objc_msgSend(*(id *)(v4 + 16), sel_setMaximumFractionDigits_, 0);
  static IntegerFormatter.shared = v4;
  return result;
}

uint64_t *IntegerFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E38 != -1) {
    swift_once();
  }
  return &static IntegerFormatter.shared;
}

uint64_t static IntegerFormatter.shared.getter()
{
  if (qword_268614E38 != -1) {
    swift_once();
  }
  return swift_retain();
}

Swift::String __swiftcall IntegerFormatter.formatValue(_:noValueStyle:)(Swift::Int_optional _, NanoWeatherKitUICompanion::FormatterNoValueStyle noValueStyle)
{
  if (_.is_nil
    || (uint64_t v4 = *(void **)(v2 + 16),
        id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, _.value),
        id v6 = objc_msgSend(v4, sel_stringFromNumber_, v5),
        v5,
        !v6))
  {
    uint64_t v10 = FormatterNoValueStyle.rawValue.getter(noValueStyle);
  }
  else
  {
    uint64_t v7 = sub_22E846998();
    uint64_t v9 = v8;

    uint64_t v10 = v7;
    uint64_t v11 = v9;
  }
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t IntegerFormatter.deinit()
{
  return v0;
}

uint64_t IntegerFormatter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IntegerFormatter()
{
  return self;
}

double static HourWeather.timeInterval.getter()
{
  return 3600.0;
}

double sub_22E81DDB0()
{
  return 3600.0;
}

Swift::String_optional __swiftcall HourWeather.conditionIconName(isDaytime:)(Swift::Bool isDaytime)
{
  uint64_t v2 = sub_22E846618();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E846368();
  if (qword_268614E50 != -1) {
    swift_once();
  }
  uint64_t v6 = _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0((uint64_t)v5, isDaytime);
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = v6;
  uint64_t v10 = v8;
  result.value._object = v10;
  result.value._countAndFlagsBits = v9;
  return result;
}

uint64_t HourWeather.conditionIconName(coordinate:date:)(double a1, double a2)
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_22E846618();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E846368();
  if (qword_268614E18 != -1) {
    swift_once();
  }
  v12[1] = GEOLocationCoordinate2DMake(a1, a2);
  v12[2] = v8;
  sub_22E845FB8();
  char isDayLightForLocation = geo_isDayLightForLocation();
  uint64_t v10 = _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0((uint64_t)v7, isDayLightForLocation);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t HourWeather.displayPrecipitationChance.getter()
{
  uint64_t v0 = sub_22E846618();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E846368();
  char isPrecipitationSbvg_0 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (isPrecipitationSbvg_0)
  {
    sub_22E8462F8();
    return sub_22E846A38();
  }
  return result;
}

uint64_t sub_22E81E148(void *a1)
{
  a1[1] = sub_22E81E1D4(&qword_268614FE0);
  a1[2] = sub_22E81E1D4(&qword_268614FE8);
  uint64_t result = sub_22E81E1D4(&qword_268614FF0);
  a1[3] = result;
  return result;
}

uint64_t sub_22E81E1D4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22E846378();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t FormatterNoValueStyle.rawValue.getter(unsigned __int8 a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_268614E40 == -1) {
        goto LABEL_7;
      }
    }
    else if (qword_268614E40 == -1)
    {
LABEL_7:
      id v2 = (id)qword_268615028;
      uint64_t v3 = (void *)sub_22E846988();
      uint64_t v4 = (void *)sub_22E846988();
      uint64_t v5 = (void *)sub_22E846988();
      id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

      uint64_t v1 = sub_22E846998();
      return v1;
    }
    swift_once();
    goto LABEL_7;
  }
  return a1;
}

void *static FormatterNoValueStyle.allCases.getter()
{
  return &unk_26E23AAC0;
}

uint64_t sub_22E81E3CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = FormatterNoValueStyle.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == FormatterNoValueStyle.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22E81E458()
{
  unsigned __int8 v1 = *v0;
  sub_22E846ED8();
  FormatterNoValueStyle.rawValue.getter(v1);
  sub_22E8469B8();
  swift_bridgeObjectRelease();
  return sub_22E846EF8();
}

uint64_t sub_22E81E4BC()
{
  FormatterNoValueStyle.rawValue.getter(*v0);
  sub_22E8469B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E81E510()
{
  unsigned __int8 v1 = *v0;
  sub_22E846ED8();
  FormatterNoValueStyle.rawValue.getter(v1);
  sub_22E8469B8();
  swift_bridgeObjectRelease();
  return sub_22E846EF8();
}

uint64_t sub_22E81E570@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s25NanoWeatherKitUICompanion21FormatterNoValueStyleO03rawG0ACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22E81E5A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FormatterNoValueStyle.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22E81E5CC(void *a1@<X8>)
{
  *a1 = &unk_26E23AAE8;
}

NanoWeatherKitUICompanion::PercentStyle_optional __swiftcall PercentStyle.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_22E846DD8();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = NanoWeatherKitUICompanion_PercentStyle_noPercent;
  }
  else {
    v2.value = NanoWeatherKitUICompanion_PercentStyle_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

void *static PercentStyle.allCases.getter()
{
  return &unk_26E23AB60;
}

uint64_t PercentStyle.rawValue.getter(char a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 37;
  }
}

uint64_t sub_22E81E658(char *a1, char *a2)
{
  return sub_22E841DF4(*a1, *a2);
}

uint64_t sub_22E81E664()
{
  return sub_22E846EF8();
}

uint64_t sub_22E81E6CC()
{
  sub_22E8469B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E81E720()
{
  return sub_22E846EF8();
}

uint64_t sub_22E81E784@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22E846DD8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_22E81E7E4(uint64_t *a1@<X8>)
{
  uint64_t v2 = 37;
  if (*v1) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = 0xE100000000000000;
  if (*v1) {
    unint64_t v3 = 0xE000000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_22E81E808(void *a1@<X8>)
{
  *a1 = &unk_26E23AB88;
}

uint64_t _s25NanoWeatherKitUICompanion21FormatterNoValueStyleO03rawG0ACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22E846DD8();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_22E81E868()
{
  unint64_t result = qword_268614FF8;
  if (!qword_268614FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268614FF8);
  }
  return result;
}

uint64_t sub_22E81E8BC()
{
  return sub_22E81E964(&qword_268615000, &qword_268615008);
}

unint64_t sub_22E81E8E8()
{
  unint64_t result = qword_268615010;
  if (!qword_268615010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615010);
  }
  return result;
}

uint64_t sub_22E81E93C()
{
  return sub_22E81E964(&qword_268615018, &qword_268615020);
}

uint64_t sub_22E81E964(unint64_t *a1, uint64_t *a2)
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FormatterNoValueStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FormatterNoValueStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E81EB1CLL);
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

uint64_t sub_22E81EB44(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22E81EB4C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FormatterNoValueStyle()
{
  return &type metadata for FormatterNoValueStyle;
}

uint64_t getEnumTagSinglePayload for PercentStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PercentStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x22E81ECC0);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_22E81ECE8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PercentStyle()
{
  return &type metadata for PercentStyle;
}

id sub_22E81ED04()
{
  type metadata accessor for NWKUIBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268615028 = (uint64_t)result;
  return result;
}

uint64_t sub_22E81ED5C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NWKUIBundle()
{
  return self;
}

double static Double.UI.oneMinute.getter()
{
  return 60.0;
}

double static Double.UI.fifteenMinutes.getter()
{
  return 900.0;
}

double static Double.UI.twentyMinutes.getter()
{
  return 1200.0;
}

double static Double.UI.thirtyMinutes.getter()
{
  return 1800.0;
}

double static Double.UI.fortyMinutes.getter()
{
  return 2400.0;
}

double static Double.UI.oneHour.getter()
{
  return 3600.0;
}

double static Double.UI.oneDay.getter()
{
  return 86400.0;
}

double static Double.UI.sevenDays.getter()
{
  return 604800.0;
}

ValueMetadata *type metadata accessor for Double.UI()
{
  return &type metadata for Double.UI;
}

uint64_t sub_22E81EE1C()
{
  type metadata accessor for VisibilityFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
  uint64_t v2 = sub_22E846118();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  static VisibilityFormatter.shared = v0;
  return result;
}

uint64_t *VisibilityFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E48 != -1) {
    swift_once();
  }
  return &static VisibilityFormatter.shared;
}

uint64_t static VisibilityFormatter.shared.getter()
{
  if (qword_268614E48 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t VisibilityFormatter.overrideLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
  swift_beginAccess();
  return sub_22E8207D4(v3, a1, &qword_268615030);
}

uint64_t VisibilityFormatter.overrideLocale.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
  swift_beginAccess();
  sub_22E81F004(a1, v3);
  return swift_endAccess();
}

uint64_t sub_22E81F004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*VisibilityFormatter.overrideLocale.modify())()
{
  return j__swift_endAccess;
}

BOOL static VisibilityFormatter.UnitStyle.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t VisibilityFormatter.UnitStyle.hash(into:)()
{
  return sub_22E846EE8();
}

uint64_t VisibilityFormatter.UnitStyle.hashValue.getter()
{
  return sub_22E846EF8();
}

BOOL sub_22E81F14C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22E81F160()
{
  return sub_22E846EF8();
}

uint64_t sub_22E81F1A8()
{
  return sub_22E846EE8();
}

uint64_t sub_22E81F1D4()
{
  return sub_22E846EF8();
}

uint64_t VisibilityFormatter.string(for:unitStyle:noValueStyle:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v97 = a3;
  uint64_t v98 = a1;
  LODWORD(v90) = a2;
  uint64_t v89 = sub_22E846918();
  uint64_t v99 = *(void *)(v89 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v89);
  v88 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v87 = (char *)&v80 - v6;
  MEMORY[0x270FA5388](v5);
  v86 = (char *)&v80 - v7;
  uint64_t v8 = sub_22E846908();
  uint64_t v93 = *(void *)(v8 - 8);
  uint64_t v94 = v8;
  MEMORY[0x270FA5388](v8);
  v92 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v84 = (uint64_t)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v82 = (char *)&v80 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v80 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  v81 = (char *)&v80 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v80 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v80 - v23;
  uint64_t v25 = sub_22E846BE8();
  uint64_t v100 = *(void *)(v25 - 8);
  uint64_t v101 = v25;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  v85 = (char *)&v80 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v83 = (char *)&v80 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v80 - v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615038);
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v80 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_22E846BD8();
  uint64_t v95 = *(void *)(v36 - 8);
  uint64_t v96 = v36;
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  v39 = (char *)&v80 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v42 = (char *)&v80 - v41;
  MEMORY[0x270FA5388](v40);
  v44 = (char *)&v80 - v43;
  if ((_BYTE)v90)
  {
    if (v90 == 1)
    {
      uint64_t v45 = v100;
      v46 = v83;
      (*(void (**)(char *, void, uint64_t))(v100 + 104))(v83, *MEMORY[0x263F86170], v101);
      uint64_t v47 = v91 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
      swift_beginAccess();
      sub_22E8207D4(v47, (uint64_t)v17, &qword_268615030);
      uint64_t v48 = sub_22E846118();
      uint64_t v49 = *(void *)(v48 - 8);
      int v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48))(v17, 1, v48);
      uint64_t v51 = v99;
      uint64_t v52 = v96;
      if (v50 == 1)
      {
        sub_22E81C6A4((uint64_t)v17, &qword_268615030);
        uint64_t v53 = (uint64_t)v81;
        sub_22E8460E8();
      }
      else
      {
        uint64_t v53 = (uint64_t)v81;
        (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v81, v17, v48);
      }
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v49 + 56))(v53, 0, 1, v48);
      sub_22E846A88();
      v68 = v92;
      uint64_t v67 = v93;
      uint64_t v69 = v94;
      (*(void (**)(char *, void, uint64_t))(v93 + 104))(v92, *MEMORY[0x263F860D8], v94);
      sub_22E8468E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v69);
      sub_22E81C6A4(v53, &qword_268615030);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v101);
      v70 = v87;
      uint64_t v71 = v89;
      (*(void (**)(char *, void, uint64_t))(v51 + 104))(v87, **((unsigned int **)&unk_2649DE260 + (char)v97), v89);
      sub_22E81FDB8();
      uint64_t v72 = sub_22E846C78();
      v44 = v42;
    }
    else
    {
      sub_22E846AA8();
      v60 = v85;
      (*(void (**)(char *, void, uint64_t))(v100 + 104))(v85, *MEMORY[0x263F86170], v101);
      uint64_t v61 = v91 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
      swift_beginAccess();
      uint64_t v62 = v84;
      sub_22E8207D4(v61, v84, &qword_268615030);
      uint64_t v63 = sub_22E846118();
      uint64_t v64 = *(void *)(v63 - 8);
      int v65 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v62, 1, v63);
      uint64_t v51 = v99;
      uint64_t v52 = v96;
      if (v65 == 1)
      {
        sub_22E81C6A4(v62, &qword_268615030);
        uint64_t v66 = (uint64_t)v82;
        sub_22E8460E8();
      }
      else
      {
        uint64_t v66 = (uint64_t)v82;
        (*(void (**)(char *, uint64_t, uint64_t))(v64 + 32))(v82, v62, v63);
      }
      uint64_t v71 = v89;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v64 + 56))(v66, 0, 1, v63);
      v77 = v92;
      uint64_t v76 = v93;
      uint64_t v78 = v94;
      (*(void (**)(char *, void, uint64_t))(v93 + 104))(v92, *MEMORY[0x263F860D8], v94);
      sub_22E8468E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v78);
      sub_22E81C6A4(v66, &qword_268615030);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v60, v101);
      v70 = v88;
      (*(void (**)(char *, void, uint64_t))(v51 + 104))(v88, **((unsigned int **)&unk_2649DE260 + (char)v97), v71);
      sub_22E81FDB8();
      uint64_t v72 = sub_22E846C78();
      v44 = v39;
    }
  }
  else
  {
    v90 = v24;
    sub_22E81FE10();
    sub_22E845ED8();
    sub_22E846A78();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
    uint64_t v54 = v100;
    v55 = v31;
    (*(void (**)(char *, void, uint64_t))(v100 + 104))(v31, *MEMORY[0x263F86170], v101);
    uint64_t v56 = v91 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
    swift_beginAccess();
    sub_22E8207D4(v56, (uint64_t)v22, &qword_268615030);
    uint64_t v57 = sub_22E846118();
    uint64_t v58 = *(void *)(v57 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v22, 1, v57) == 1)
    {
      sub_22E81C6A4((uint64_t)v22, &qword_268615030);
      uint64_t v59 = (uint64_t)v90;
      sub_22E8460E8();
    }
    else
    {
      uint64_t v59 = (uint64_t)v90;
      (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v90, v22, v57);
    }
    uint64_t v71 = v89;
    uint64_t v52 = v96;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v58 + 56))(v59, 0, 1, v57);
    v74 = v92;
    uint64_t v73 = v93;
    uint64_t v75 = v94;
    (*(void (**)(char *, void, uint64_t))(v93 + 104))(v92, *MEMORY[0x263F860D8], v94);
    sub_22E8468E8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v75);
    sub_22E81C6A4(v59, &qword_268615030);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v101);
    uint64_t v51 = v99;
    v70 = v86;
    (*(void (**)(char *, void, uint64_t))(v99 + 104))(v86, **((unsigned int **)&unk_2649DE260 + (char)v97), v71);
    sub_22E81FDB8();
    uint64_t v72 = sub_22E846C78();
  }
  (*(void (**)(char *, uint64_t))(v51 + 8))(v70, v71);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v44, v52);
  return v72;
}

unint64_t sub_22E81FDB8()
{
  unint64_t result = qword_268615040;
  if (!qword_268615040)
  {
    sub_22E846BD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615040);
  }
  return result;
}

unint64_t sub_22E81FE10()
{
  unint64_t result = qword_268615048;
  if (!qword_268615048)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268615048);
  }
  return result;
}

uint64_t VisibilityFormatter.localizedUnitString(for:unitStyle:)(uint64_t a1)
{
  uint64_t v41 = a1;
  uint64_t v42 = sub_22E846918();
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  v39 = (char *)v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_22E846908();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v36 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v33 - v8;
  uint64_t v10 = sub_22E846BE8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615038);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_22E846BD8();
  uint64_t v34 = *(void *)(v18 - 8);
  uint64_t v35 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E81FE10();
  sub_22E845ED8();
  sub_22E846A98();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F86170], v10);
  uint64_t v21 = v33[1] + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale;
  swift_beginAccess();
  sub_22E8207D4(v21, (uint64_t)v7, &qword_268615030);
  uint64_t v22 = sub_22E846118();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v7, 1, v22) == 1)
  {
    sub_22E81C6A4((uint64_t)v7, &qword_268615030);
    sub_22E8460E8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v9, v7, v22);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v9, 0, 1, v22);
  uint64_t v25 = v36;
  uint64_t v24 = v37;
  uint64_t v26 = v38;
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v36, *MEMORY[0x263F860D8], v38);
  sub_22E8468E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  sub_22E81C6A4((uint64_t)v9, &qword_268615030);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v28 = v39;
  uint64_t v27 = v40;
  uint64_t v29 = v42;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, *MEMORY[0x263F860E8], v42);
  sub_22E81FDB8();
  uint64_t v30 = v35;
  uint64_t v31 = sub_22E846C78();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v30);
  return v31;
}

uint64_t VisibilityFormatter.description(for:noValueStyle:)(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615050);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615058);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - v12;
  sub_22E8207D4(a1, (uint64_t)v6, &qword_268615050);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22E81C6A4((uint64_t)v6, &qword_268615050);
    return FormatterNoValueStyle.rawValue.getter(a2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    uint64_t v15 = self;
    id v16 = objc_msgSend(v15, sel_meters);
    sub_22E845EE8();

    sub_22E845EB8();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v8 + 8);
    v17(v11, v7);
    id v18 = objc_msgSend(v15, sel_miles);
    sub_22E845EE8();

    sub_22E845EB8();
    v17(v11, v7);
    if (qword_268614E40 != -1) {
      swift_once();
    }
    id v19 = (id)qword_268615028;
    uint64_t v20 = (void *)sub_22E846988();
    uint64_t v21 = (void *)sub_22E846988();
    id v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, v21);

    uint64_t v14 = sub_22E846998();
    swift_bridgeObjectRelease();

    v17(v13, v7);
  }
  return v14;
}

uint64_t sub_22E8207D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t VisibilityFormatter.deinit()
{
  sub_22E81C6A4(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale, &qword_268615030);
  return v0;
}

uint64_t VisibilityFormatter.__deallocating_deinit()
{
  sub_22E81C6A4(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion19VisibilityFormatter_overrideLocale, &qword_268615030);
  return swift_deallocClassInstance();
}

unint64_t sub_22E8208D8()
{
  unint64_t result = qword_268615060;
  if (!qword_268615060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615060);
  }
  return result;
}

uint64_t sub_22E82092C()
{
  return type metadata accessor for VisibilityFormatter();
}

uint64_t type metadata accessor for VisibilityFormatter()
{
  uint64_t result = qword_268615068;
  if (!qword_268615068) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22E820980()
{
  sub_22E820A10();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_22E820A10()
{
  if (!qword_268615078)
  {
    sub_22E846118();
    unint64_t v0 = sub_22E846C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268615078);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for VisibilityFormatter.UnitStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E820B34);
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

ValueMetadata *type metadata accessor for VisibilityFormatter.UnitStyle()
{
  return &type metadata for VisibilityFormatter.UnitStyle;
}

uint64_t *WeatherConditionSymbolMapper.shared.unsafeMutableAddressor()
{
  if (qword_268614E50 != -1) {
    swift_once();
  }
  return &static WeatherConditionSymbolMapper.shared;
}

uint64_t sub_22E820BB8()
{
  type metadata accessor for WeatherConditionSymbolMapper();
  uint64_t result = swift_initStaticObject();
  static WeatherConditionSymbolMapper.shared = result;
  return result;
}

uint64_t static WeatherConditionSymbolMapper.shared.getter()
{
  type metadata accessor for WeatherConditionSymbolMapper();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for WeatherConditionSymbolMapper()
{
  return self;
}

uint64_t WeatherConditionSymbolMapper.conditionIconName(condition:coordinates:date:)(uint64_t a1, double a2, double a3)
{
  if (qword_268614E18 != -1) {
    swift_once();
  }
  GEOLocationCoordinate2DMake(a2, a3);
  sub_22E845FB8();
  char isDayLightForLocation = geo_isDayLightForLocation();
  return _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0(a1, isDayLightForLocation);
}

uint64_t WeatherConditionSymbolMapper.deinit()
{
  return v0;
}

uint64_t WeatherConditionSymbolMapper.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_22E846618();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F1F4F8]) {
    return 0x6E732E64756F6C63;
  }
  int v10 = v8;
  if (v8 == *MEMORY[0x263F1F420]) {
    return 0x747375642E6E7573;
  }
  if (v8 == *MEMORY[0x263F1F428]) {
    return 0x6F6E732E646E6977;
  }
  if (v8 == *MEMORY[0x263F1F4D8]) {
    return 1684957559;
  }
  if (v8 == *MEMORY[0x263F1F4B0]) {
    goto LABEL_10;
  }
  uint64_t result = 0x69662E64756F6C63;
  if (v10 == *MEMORY[0x263F1F4E0]) {
    return result;
  }
  if (v10 == *MEMORY[0x263F1F4F0])
  {
    if (a2) {
      return 0xD000000000000012;
    }
    else {
      return 0xD000000000000014;
    }
  }
  if (v10 == *MEMORY[0x263F1F500]) {
    return 2003791475;
  }
  if (v10 == *MEMORY[0x263F1F4B8]) {
    return 0x6F662E64756F6C63;
  }
  if (v10 == *MEMORY[0x263F1F470]) {
    return 0xD000000000000012;
  }
  if (v10 == *MEMORY[0x263F1F440]) {
    return 0xD000000000000010;
  }
  if (v10 == *MEMORY[0x263F1F4E8]) {
    return 0xD000000000000015;
  }
  if (v10 == *MEMORY[0x263F1F490]) {
    return 0x61682E64756F6C63;
  }
  if (v10 == *MEMORY[0x263F1F498]) {
    goto LABEL_32;
  }
  if (v10 == *MEMORY[0x263F1F508]) {
    return 0xD000000000000014;
  }
  if (v10 == *MEMORY[0x263F1F510]) {
    return 0x6E732E64756F6C63;
  }
  if (v10 == *MEMORY[0x263F1F488]) {
    goto LABEL_10;
  }
  if (v10 == *MEMORY[0x263F1F518]) {
    return 0x6E61636972727568;
  }
  if (v10 == *MEMORY[0x263F1F478])
  {
LABEL_42:
    if (a2) {
      return 0x6F622E64756F6C63;
    }
    else {
      return 0xD000000000000014;
    }
  }
  if (v10 == *MEMORY[0x263F1F430])
  {
LABEL_10:
    if (a2) {
      return 0x2E78616D2E6E7573;
    }
    else {
      return 0x6174732E6E6F6F6DLL;
    }
  }
  if (v10 == *MEMORY[0x263F1F448]) {
    return result;
  }
  if (v10 != *MEMORY[0x263F1F450])
  {
    if (v10 == *MEMORY[0x263F1F4A0]) {
      return 0x61722E64756F6C63;
    }
    if (v10 != *MEMORY[0x263F1F480])
    {
      if (v10 == *MEMORY[0x263F1F4C0]) {
        return 0xD000000000000010;
      }
      if (v10 == *MEMORY[0x263F1F4C8])
      {
LABEL_32:
        if (a2) {
          return 0x657A61682E6E7573;
        }
        else {
          return 0x7A61682E6E6F6F6DLL;
        }
      }
      if (v10 == *MEMORY[0x263F1F4A8]) {
        return 2003791475;
      }
      if (v10 != *MEMORY[0x263F1F458])
      {
        if (v10 == *MEMORY[0x263F1F438]) {
          return 2003791475;
        }
        if (v10 == *MEMORY[0x263F1F418]) {
          return 0xD000000000000013;
        }
        if (v10 != *MEMORY[0x263F1F460])
        {
          if (v10 == *MEMORY[0x263F1F468]) {
            return 0x6C616369706F7274;
          }
          if (v10 == *MEMORY[0x263F1F4D0]) {
            return 1684957559;
          }
          if (v10 != *MEMORY[0x263F1F520])
          {
            (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
            return 0;
          }
          return 0xD000000000000010;
        }
      }
      return 0xD000000000000014;
    }
    goto LABEL_42;
  }
  if (a2) {
    return 0x75732E64756F6C63;
  }
  else {
    return 0x6F6D2E64756F6C63;
  }
}

uint64_t WatchWeather.hour(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F80);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E8463B8();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22E81C6A4((uint64_t)v6, &qword_268614F80);
    uint64_t v9 = sub_22E846378();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  }
  else
  {
    sub_22E822B0C(a1);
    if (v11)
    {
      uint64_t v13 = sub_22E846378();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a2, 1, 1, v13);
    }
    else
    {
      sub_22E846778();
      uint64_t v12 = sub_22E846378();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 0, 1, v12);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
}

uint64_t WatchWeather.hours(startingAt:size:sizeMustMatch:)(uint64_t a1, uint64_t a2, char a3)
{
  return sub_22E821D88(a1, a2, a3, &qword_268614F80, MEMORY[0x263F1F3C8], &qword_268614FA8, (uint64_t (*)(uint64_t, uint64_t, void))sub_22E8215E8);
}

uint64_t sub_22E8215E8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150D0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_22E822B0C(a1);
  if (v11) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  sub_22E824B28(&qword_2686150D8, &qword_268614FA8);
  sub_22E846AE8();
  sub_22E846B38();
  uint64_t result = sub_22E846B28();
  if (result < 0) {
    return MEMORY[0x263F8EE78];
  }
  if (a2 > 0
    || (sub_22E846AE8(), sub_22E846B38(), uint64_t result = sub_22E846B28(), a2 = result - v12, !__OFSUB__(result, v12)))
  {
    uint64_t v15 = v12 + a2;
    if (__OFADD__(v12, a2))
    {
      __break(1u);
    }
    else
    {
      sub_22E846AE8();
      sub_22E846B38();
      if (sub_22E846B28() < v15)
      {
        sub_22E846AE8();
        sub_22E846B38();
        uint64_t v15 = sub_22E846B28();
      }
      if (v12 >= v15) {
        return MEMORY[0x263F8EE78];
      }
      uint64_t v21 = v12;
      uint64_t v22 = v15;
      sub_22E846AE8();
      uint64_t result = sub_22E846B38();
      if (v17 >= v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = v17;
        sub_22E846B08();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))((char *)v9 + *(int *)(v7 + 40), v3, v13);
        *uint64_t v9 = v12;
        v9[1] = v15;
        size_t v16 = sub_22E8234A0(v9);
        sub_22E81C6A4((uint64_t)v9, &qword_2686150D0);
        if ((a3 & 1) == 0 || *(void *)(v16 + 16) == a2) {
          return v16;
        }
        swift_release();
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22E8218A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615088);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_22E822FA4(a1);
  if (v11) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  sub_22E824B28(&qword_268615090, &qword_268614FB0);
  sub_22E846AE8();
  sub_22E846B38();
  uint64_t result = sub_22E846B28();
  if (result < 0) {
    return MEMORY[0x263F8EE78];
  }
  if (a2 > 0
    || (sub_22E846AE8(), sub_22E846B38(), uint64_t result = sub_22E846B28(), a2 = result - v12, !__OFSUB__(result, v12)))
  {
    uint64_t v15 = v12 + a2;
    if (__OFADD__(v12, a2))
    {
      __break(1u);
    }
    else
    {
      sub_22E846AE8();
      sub_22E846B38();
      if (sub_22E846B28() < v15)
      {
        sub_22E846AE8();
        sub_22E846B38();
        uint64_t v15 = sub_22E846B28();
      }
      if (v12 >= v15) {
        return MEMORY[0x263F8EE78];
      }
      uint64_t v21 = v12;
      uint64_t v22 = v15;
      sub_22E846AE8();
      uint64_t result = sub_22E846B38();
      if (v17 >= v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = v17;
        sub_22E846B08();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))((char *)v9 + *(int *)(v7 + 40), v3, v13);
        *uint64_t v9 = v12;
        v9[1] = v15;
        size_t v16 = sub_22E823728(v9);
        sub_22E81C6A4((uint64_t)v9, &qword_268615088);
        if ((a3 & 1) == 0 || *(void *)(v16 + 16) == a2) {
          return v16;
        }
        swift_release();
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t WatchWeather.day(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F78);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E8463A8();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22E81C6A4((uint64_t)v6, &qword_268614F78);
    uint64_t v9 = sub_22E846278();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  }
  else
  {
    sub_22E822FA4(a1);
    if (v11)
    {
      uint64_t v13 = sub_22E846278();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a2, 1, 1, v13);
    }
    else
    {
      sub_22E846778();
      uint64_t v12 = sub_22E846278();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 0, 1, v12);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
}

uint64_t WatchWeather.days(startingAt:size:sizeMustMatch:)(uint64_t a1, uint64_t a2, char a3)
{
  return sub_22E821D88(a1, a2, a3, &qword_268614F78, MEMORY[0x263F1F3C0], &qword_268614FB0, (uint64_t (*)(uint64_t, uint64_t, void))sub_22E8218A4);
}

uint64_t sub_22E821D88(uint64_t a1, uint64_t a2, char a3, uint64_t *a4, void (*a5)(uint64_t), uint64_t *a6, uint64_t (*a7)(uint64_t, uint64_t, void))
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  a5(v15);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_22E81C6A4((uint64_t)v17, a4);
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v20 = a7(a1, a2, a3 & 1);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
  }
  return v20;
}

uint64_t WatchWeather.weather(for:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v57 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F80);
  MEMORY[0x270FA5388](v4 - 8);
  v55 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615080);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v56 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E8465F8();
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v51 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22E8460A8();
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v46 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F90);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v46 - v21;
  uint64_t v23 = sub_22E8464F8();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = v2;
  sub_22E846398();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_22E81C6A4((uint64_t)v22, &qword_268614F90);
    uint64_t v28 = (uint64_t)v55;
    uint64_t v27 = (uint64_t)v56;
    uint64_t v29 = v57;
  }
  else
  {
    uint64_t v48 = v20;
    uint64_t v49 = a2;
    uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v47(v26, v22, v23);
    sub_22E8464C8();
    sub_22E8465E8();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v51);
    sub_22E846008();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v52 + 8);
    uint64_t v31 = v14;
    uint64_t v32 = v53;
    v30(v31, v53);
    uint64_t v29 = v57;
    char v33 = sub_22E846038();
    v30(v16, v32);
    if (v33)
    {
      uint64_t v34 = (uint64_t)v48;
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v48, v26, v23);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v34, 0, 1, v23);
      sub_22E81C6A4(v34, &qword_268614F90);
      uint64_t v35 = v49;
      v49[3] = v23;
      v35[4] = (uint64_t)&protocol witness table for CurrentWeather;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
      return ((uint64_t (*)(uint64_t *, char *, uint64_t))v47)(boxed_opaque_existential_1, v26, v23);
    }
    uint64_t v38 = (uint64_t)v48;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v48, 1, 1, v23);
    sub_22E81C6A4(v38, &qword_268614F90);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    a2 = v49;
    uint64_t v28 = (uint64_t)v55;
    uint64_t v27 = (uint64_t)v56;
  }
  sub_22E8463B8();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v28, 1, v39) == 1)
  {
    sub_22E81C6A4(v28, &qword_268614F80);
    uint64_t v41 = sub_22E846378();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v27, 1, 1, v41);
LABEL_12:
    uint64_t result = sub_22E81C6A4(v27, &qword_268615080);
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    a2[4] = 0;
    return result;
  }
  sub_22E822B0C(v29);
  if (v42)
  {
    uint64_t v43 = sub_22E846378();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v27, 1, 1, v43);
  }
  else
  {
    sub_22E846778();
    uint64_t v43 = sub_22E846378();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v27, 0, 1, v43);
  }
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v28, v39);
  sub_22E846378();
  uint64_t v44 = *(void *)(v43 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v27, 1, v43) == 1) {
    goto LABEL_12;
  }
  a2[3] = v43;
  a2[4] = (uint64_t)&protocol witness table for HourWeather;
  uint64_t v45 = __swift_allocate_boxed_opaque_existential_1(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v44 + 32))(v45, v27, v43);
}

uint64_t sub_22E8225AC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E822604(MEMORY[0x263F1F570], MEMORY[0x263F1F578], a1);
}

uint64_t sub_22E8225D8@<X0>(uint64_t a1@<X8>)
{
  return sub_22E822604(MEMORY[0x263F1F3E0], MEMORY[0x263F1F3F0], a1);
}

uint64_t sub_22E822604@<X0>(void (*a1)(uint64_t)@<X1>, uint64_t (*a2)(void)@<X2>, uint64_t a3@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v5 = sub_22E8465F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E8460A8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v25 - v15;
  uint64_t v26 = v3;
  a1(v14);
  sub_22E8465E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22E846008();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  char v18 = sub_22E846038();
  v17(v16, v9);
  uint64_t v19 = v27(0);
  uint64_t v20 = *(void *)(v19 - 8);
  if (v18)
  {
    uint64_t v21 = v28;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v28, v26, v19);
    uint64_t v22 = 0;
    uint64_t v23 = v21;
  }
  else
  {
    uint64_t v22 = 1;
    uint64_t v23 = v28;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v23, v22, 1, v19);
}

uint64_t sub_22E822880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t v23 = sub_22E8465F8();
  uint64_t v3 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E8460A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v13 = (void (__cdecl *)())off_26E23B8B0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA0);
  uint64_t v22 = v2;
  v13();
  sub_22E8465E8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v23);
  sub_22E846008();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  char v16 = sub_22E846038();
  v15(v12, v6);
  uint64_t v17 = *(void *)(v14 - 8);
  if (v16)
  {
    uint64_t v18 = v25;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v25, v22, v14);
    uint64_t v19 = 0;
    uint64_t v20 = v18;
  }
  else
  {
    uint64_t v19 = 1;
    uint64_t v20 = v25;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v20, v19, 1, v14);
}

uint64_t sub_22E822B0C(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615080);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22E8460A8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E82C9AC((uint64_t)v7);
  uint64_t v15 = sub_22E846378();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15) == 1)
  {
    sub_22E81C6A4((uint64_t)v7, &qword_268615080);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
LABEL_4:
    sub_22E81C6A4((uint64_t)v10, &qword_2686150C0);
    return 0;
  }
  sub_22E846308();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  sub_22E8249E0();
  if (sub_22E846968())
  {
LABEL_15:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  uint64_t result = sub_22E845FF8();
  double v19 = v18 / 3600.0;
  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v21 = v25;
  uint64_t v20 = v26;
  if (v19 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  uint64_t v22 = (uint64_t)v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v4, v1, v26);
  if (v22 < 0)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v20);
    goto LABEL_15;
  }
  sub_22E824B28(&qword_2686150D8, &qword_268614FA8);
  sub_22E846AE8();
  sub_22E846B38();
  uint64_t v23 = sub_22E846B28();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v23 > v22) {
    return v22;
  }
  else {
    return 0;
  }
}

uint64_t sub_22E822FA4(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22E8460A8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E82C9D4((uint64_t)v7);
  uint64_t v15 = sub_22E846278();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15) == 1)
  {
    sub_22E81C6A4((uint64_t)v7, &qword_2686150B8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
LABEL_4:
    sub_22E81C6A4((uint64_t)v10, &qword_2686150C0);
    return 0;
  }
  sub_22E846258();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  sub_22E8249E0();
  if (sub_22E846968())
  {
LABEL_15:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  uint64_t result = sub_22E845FF8();
  double v19 = v18 / 86400.0;
  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v21 = v25;
  uint64_t v20 = v26;
  if (v19 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v19 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    return result;
  }
  uint64_t v22 = (uint64_t)v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v4, v1, v26);
  if (v22 < 0)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v20);
    goto LABEL_15;
  }
  sub_22E824B28(&qword_268615090, &qword_268614FB0);
  sub_22E846AE8();
  sub_22E846B38();
  uint64_t v23 = sub_22E846B28();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v23 > v22) {
    return v22;
  }
  else {
    return 0;
  }
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

size_t sub_22E8234A0(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150D0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150E0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  v20[0] = a1[1];
  v20[1] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  sub_22E824B28(&qword_2686150D8, &qword_268614FA8);
  uint64_t v9 = sub_22E846B28();
  if (!v9) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v10 = v9;
  if (v9 <= 0)
  {
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
LABEL_11:
    uint64_t v17 = *(void *)(sub_22E846378() - 8);
    double v18 = (char *)v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    sub_22E8207D4((uint64_t)a1, (uint64_t)v4, &qword_2686150D0);
    uint64_t v19 = sub_22E8239B0((uint64_t)v7, v18, v10);
    size_t result = sub_22E81C6A4((uint64_t)v7, &qword_2686150E0);
    if (v19 == v10) {
      return (size_t)v14;
    }
    __break(1u);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686150E8);
  uint64_t v11 = *(void *)(sub_22E846378() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v14);
  if (v12)
  {
    if (result - v13 == 0x8000000000000000 && v12 == -1) {
      goto LABEL_15;
    }
    v14[2] = v10;
    v14[3] = 2 * ((uint64_t)(result - v13) / v12);
    goto LABEL_11;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

size_t sub_22E823728(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615088);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615098);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  v20[0] = a1[1];
  v20[1] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  sub_22E824B28(&qword_268615090, &qword_268614FB0);
  uint64_t v9 = sub_22E846B28();
  if (!v9) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v10 = v9;
  if (v9 <= 0)
  {
    uint64_t v14 = (void *)MEMORY[0x263F8EE78];
LABEL_11:
    uint64_t v17 = *(void *)(sub_22E846278() - 8);
    double v18 = (char *)v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    sub_22E8207D4((uint64_t)a1, (uint64_t)v4, &qword_268615088);
    uint64_t v19 = sub_22E824028((uint64_t)v7, v18, v10);
    size_t result = sub_22E81C6A4((uint64_t)v7, &qword_268615098);
    if (v19 == v10) {
      return (size_t)v14;
    }
    __break(1u);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686150A0);
  uint64_t v11 = *(void *)(sub_22E846278() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v14);
  if (v12)
  {
    if (result - v13 == 0x8000000000000000 && v12 == -1) {
      goto LABEL_15;
    }
    v14[2] = v10;
    v14[3] = 2 * ((uint64_t)(result - v13) / v12);
    goto LABEL_11;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_22E8239B0(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v51 = a1;
  uint64_t v7 = sub_22E846378();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v55 = v7;
  uint64_t v56 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v54 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v53 = (char *)&v45 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150D0);
  MEMORY[0x270FA5388](v12);
  uint64_t v52 = (uint64_t)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150E0);
  uint64_t v14 = MEMORY[0x270FA5388](v57);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  double v18 = (uint64_t *)((char *)&v45 - v17);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = a2;
  uint64_t v64 = a3;
  uint64_t v45 = a3;
  uint64_t v58 = v12;
  uint64_t v24 = *(int *)(v12 + 40);
  uint64_t v25 = v21;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, &v4[v24], v21);
  uint64_t v59 = v4;
  v60 = sub_22E824A38;
  uint64_t v61 = &v62;
  sub_22E824B28(&qword_2686150F0, &qword_268614FA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686150F8);
  sub_22E8469D8();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v26 = v20 + 8;
  v27(v23, v25);
  if ((v67 & 1) == 0)
  {
    uint64_t v32 = v66[2];
    int v65 = *(void **)v4;
    sub_22E824B28(&qword_2686150D8, &qword_268614FA8);
    sub_22E846B18();
    uint64_t v33 = v51;
    sub_22E824B6C((uint64_t)v4, v51, &qword_2686150D0);
    *(void *)(v33 + *(int *)(v57 + 36)) = v66[0];
    return v32;
  }
  sub_22E8207D4((uint64_t)v4, (uint64_t)v16, &qword_2686150D0);
  uint64_t v28 = *(void **)v4;
  sub_22E81C6A4((uint64_t)v4, &qword_2686150D0);
  uint64_t v29 = v57;
  *(void *)&v16[*(int *)(v57 + 36)] = v28;
  sub_22E824B6C((uint64_t)v16, (uint64_t)v18, &qword_2686150E0);
  if (!a2)
  {
    sub_22E824B6C((uint64_t)v18, v51, &qword_2686150E0);
    return 0;
  }
  uint64_t v50 = v25;
  if (!v45)
  {
LABEL_13:
    sub_22E824B6C((uint64_t)v18, v51, &qword_2686150E0);
    return v45;
  }
  uint64_t v30 = v45;
  if ((v45 & 0x8000000000000000) == 0)
  {
    uint64_t v57 = (uint64_t)v18 + *(int *)(v29 + 36);
    uint64_t v31 = v18[1];
    if (*(void *)v57 == v31)
    {
      uint64_t v32 = 0;
LABEL_12:
      sub_22E824B6C((uint64_t)v18, v51, &qword_2686150E0);
      return v32;
    }
    uint64_t v49 = (void (**)(char *))(v56 + 16);
    uint64_t v48 = (void (**)(char *, char *, uint64_t))(v56 + 32);
    uint64_t v47 = sub_22E824B28(&qword_2686150D8, &qword_268614FA8);
    uint64_t v32 = 0;
    uint64_t v46 = v30 - 1;
    uint64_t v34 = v54;
    uint64_t v35 = v55;
    while (1)
    {
      v66[0] = *v18;
      v66[1] = v31;
      sub_22E846AF8();
      uint64_t v36 = (void (*)(void *, void))sub_22E846B88();
      (*v49)(v34);
      v36(v66, 0);
      uint64_t v37 = (uint64_t)v18;
      uint64_t v38 = a2;
      uint64_t v39 = v18;
      uint64_t v40 = v52;
      sub_22E8207D4(v37, v52, &qword_2686150D0);
      sub_22E846B48();
      uint64_t v41 = v40;
      double v18 = v39;
      sub_22E81C6A4(v41, &qword_2686150D0);
      char v42 = *v48;
      uint64_t v43 = v53;
      (*v48)(v53, v34, v35);
      v42(v38, v43, v35);
      if (v46 == v32) {
        goto LABEL_13;
      }
      a2 = &v38[*(void *)(v56 + 72)];
      uint64_t v31 = v18[1];
      ++v32;
      if (*(void *)v57 == v31) {
        goto LABEL_12;
      }
    }
  }
  __break(1u);

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v29, v30);
  __break(1u);
  return result;
}

uint64_t sub_22E824028(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v51 = a1;
  uint64_t v7 = sub_22E846278();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v55 = v7;
  uint64_t v56 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v54 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v53 = (char *)&v45 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615088);
  MEMORY[0x270FA5388](v12);
  uint64_t v52 = (uint64_t)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615098);
  uint64_t v14 = MEMORY[0x270FA5388](v57);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  double v18 = (uint64_t *)((char *)&v45 - v17);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = a2;
  uint64_t v64 = a3;
  uint64_t v45 = a3;
  uint64_t v58 = v12;
  uint64_t v24 = *(int *)(v12 + 40);
  uint64_t v25 = v21;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, &v4[v24], v21);
  uint64_t v59 = v4;
  v60 = sub_22E824824;
  uint64_t v61 = &v62;
  sub_22E824B28(&qword_2686150A8, &qword_268614FB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686150B0);
  sub_22E8469D8();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v26 = v20 + 8;
  v27(v23, v25);
  if ((v67 & 1) == 0)
  {
    uint64_t v32 = v66[2];
    int v65 = *(void **)v4;
    sub_22E824B28(&qword_268615090, &qword_268614FB0);
    sub_22E846B18();
    uint64_t v33 = v51;
    sub_22E824B6C((uint64_t)v4, v51, &qword_268615088);
    *(void *)(v33 + *(int *)(v57 + 36)) = v66[0];
    return v32;
  }
  sub_22E8207D4((uint64_t)v4, (uint64_t)v16, &qword_268615088);
  uint64_t v28 = *(void **)v4;
  sub_22E81C6A4((uint64_t)v4, &qword_268615088);
  uint64_t v29 = v57;
  *(void *)&v16[*(int *)(v57 + 36)] = v28;
  sub_22E824B6C((uint64_t)v16, (uint64_t)v18, &qword_268615098);
  if (!a2)
  {
    sub_22E824B6C((uint64_t)v18, v51, &qword_268615098);
    return 0;
  }
  uint64_t v50 = v25;
  if (!v45)
  {
LABEL_13:
    sub_22E824B6C((uint64_t)v18, v51, &qword_268615098);
    return v45;
  }
  uint64_t v30 = v45;
  if ((v45 & 0x8000000000000000) == 0)
  {
    uint64_t v57 = (uint64_t)v18 + *(int *)(v29 + 36);
    uint64_t v31 = v18[1];
    if (*(void *)v57 == v31)
    {
      uint64_t v32 = 0;
LABEL_12:
      sub_22E824B6C((uint64_t)v18, v51, &qword_268615098);
      return v32;
    }
    uint64_t v49 = (void (**)(char *))(v56 + 16);
    uint64_t v48 = (void (**)(char *, char *, uint64_t))(v56 + 32);
    uint64_t v47 = sub_22E824B28(&qword_268615090, &qword_268614FB0);
    uint64_t v32 = 0;
    uint64_t v46 = v30 - 1;
    uint64_t v34 = v54;
    uint64_t v35 = v55;
    while (1)
    {
      v66[0] = *v18;
      v66[1] = v31;
      sub_22E846AF8();
      uint64_t v36 = (void (*)(void *, void))sub_22E846B88();
      (*v49)(v34);
      v36(v66, 0);
      uint64_t v37 = (uint64_t)v18;
      uint64_t v38 = a2;
      uint64_t v39 = v18;
      uint64_t v40 = v52;
      sub_22E8207D4(v37, v52, &qword_268615088);
      sub_22E846B48();
      uint64_t v41 = v40;
      double v18 = v39;
      sub_22E81C6A4(v41, &qword_268615088);
      char v42 = *v48;
      uint64_t v43 = v53;
      (*v48)(v53, v34, v35);
      v42(v38, v43, v35);
      if (v46 == v32) {
        goto LABEL_13;
      }
      a2 = &v38[*(void *)(v56 + 72)];
      uint64_t v31 = v18[1];
      ++v32;
      if (*(void *)v57 == v31) {
        goto LABEL_12;
      }
    }
  }
  __break(1u);

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v29, v30);
  __break(1u);
  return result;
}

uint64_t sub_22E8246A0(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(void))
{
  unint64_t v5 = a1;
  if (!a2 || !a4)
  {
    if (a1) {
      a5(0);
    }
    return v5;
  }
  if (a2 >= a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = a2;
  }
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(*(void *)(((uint64_t (*)(void))a5)(0) - 8) + 72);
    if (a3 + v8 * v6 <= v5 || v5 + v8 * v6 <= a3)
    {
      swift_arrayInitWithCopy();
      v5 += v8 * v6;
      return v5;
    }
  }
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E824824@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22E824A64(a1, a2, MEMORY[0x263F1F358], a3);
}

void *sub_22E824850@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_22E824AE0(a1, &qword_268615088, &qword_268614FB0, &qword_268615090, MEMORY[0x263F1F358], a2);
}

void *sub_22E824894(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, void *), uint64_t a4, uint64_t *a5, uint64_t *a6, unint64_t *a7, uint64_t (*a8)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(a5);
  __swift_instantiateConcreteTypeFromMangledName(a6);
  sub_22E824B28(a7, a6);
  sub_22E846AE8();
  uint64_t v13 = sub_22E846B28();
  uint64_t result = (void *)sub_22E846B28();
  if (__OFADD__(v13, result))
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v15 = result;
  if ((uint64_t)result + v13 < v13)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v16 = 0;
  if (a1) {
    uint64_t v16 = a1 + *(void *)(*(void *)(a8(0) - 8) + 72) * v13;
  }
  uint64_t result = a3(&v18, v16, v15);
  if (!v8) {
    return (void *)v18;
  }
  return result;
}

unint64_t sub_22E8249E0()
{
  unint64_t result = qword_2686150C8;
  if (!qword_2686150C8)
  {
    sub_22E8460A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686150C8);
  }
  return result;
}

uint64_t sub_22E824A38@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22E824A64(a1, a2, MEMORY[0x263F1F3A0], a3);
}

uint64_t sub_22E824A64@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = sub_22E8246A0(a1, a2, *(void *)(v4 + 16), *(void *)(v4 + 24), a3);
  if (!v5)
  {
    *a4 = result;
    a4[1] = v8;
    a4[2] = v9;
  }
  return result;
}

void *sub_22E824A9C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_22E824AE0(a1, &qword_2686150D0, &qword_268614FA8, &qword_2686150D8, MEMORY[0x263F1F3A0], a2);
}

void *sub_22E824AE0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t *a3@<X3>, unint64_t *a4@<X4>, uint64_t (*a5)(void)@<X5>, void *a6@<X8>)
{
  uint64_t result = sub_22E824894(a1, *(void *)(v6 + 16), *(void *(**)(uint64_t *__return_ptr, uint64_t, void *))(v6 + 24), *(void *)(v6 + 32), a2, a3, a4, a5);
  if (!v7)
  {
    *a6 = result;
    a6[1] = v10;
    a6[2] = v11;
  }
  return result;
}

uint64_t sub_22E824B28(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22E824B6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E824BD0()
{
  uint64_t result = sub_22E824BF0();
  static UVIndex.spectrum = result;
  return result;
}

uint64_t sub_22E824BF0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615100);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22E848250;
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_greenColor);
  *(void *)(v0 + 32) = 0x3FF0000000000000;
  *(void *)(v0 + 40) = v2;
  sub_22E824E90();
  sub_22E846818();
  uint64_t v3 = sub_22E846C58();
  *(void *)(v0 + 48) = 0x4000000000000000;
  *(void *)(v0 + 56) = v3;
  id v4 = objc_msgSend(v1, sel_yellowColor);
  *(void *)(v0 + 64) = 0x4008000000000000;
  *(void *)(v0 + 72) = v4;
  sub_22E846818();
  uint64_t v5 = sub_22E846C58();
  *(void *)(v0 + 80) = 0x4010000000000000;
  *(void *)(v0 + 88) = v5;
  sub_22E846818();
  uint64_t v6 = sub_22E846C58();
  *(void *)(v0 + 96) = 0x4014000000000000;
  *(void *)(v0 + 104) = v6;
  id v7 = objc_msgSend(v1, sel_orangeColor);
  *(void *)(v0 + 112) = 0x4018000000000000;
  *(void *)(v0 + 120) = v7;
  sub_22E846818();
  uint64_t v8 = sub_22E846C58();
  *(void *)(v0 + 128) = 0x401C000000000000;
  *(void *)(v0 + 136) = v8;
  id v9 = objc_msgSend(v1, sel_systemPinkColor);
  *(void *)(v0 + 144) = 0x4020000000000000;
  *(void *)(v0 + 152) = v9;
  sub_22E846818();
  uint64_t v10 = sub_22E846C58();
  *(void *)(v0 + 160) = 0x4022000000000000;
  *(void *)(v0 + 168) = v10;
  sub_22E846818();
  uint64_t v11 = sub_22E846C58();
  *(void *)(v0 + 176) = 0x4024000000000000;
  *(void *)(v0 + 184) = v11;
  sub_22E846818();
  uint64_t v12 = sub_22E846C58();
  *(void *)(v0 + 192) = 0x4026000000000000;
  *(void *)(v0 + 200) = v12;
  return v0;
}

uint64_t *UVIndex.spectrum.unsafeMutableAddressor()
{
  if (qword_268614E58 != -1) {
    swift_once();
  }
  return &static UVIndex.spectrum;
}

uint64_t static UVIndex.spectrum.getter()
{
  if (qword_268614E58 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

void *UVIndex.maxValue.unsafeMutableAddressor()
{
  return &static UVIndex.maxValue;
}

uint64_t static UVIndex.maxValue.getter()
{
  return 11;
}

unint64_t sub_22E824E90()
{
  unint64_t result = qword_268615108;
  if (!qword_268615108)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268615108);
  }
  return result;
}

uint64_t static Calendar.Component.all.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615110);
  uint64_t v0 = sub_22E8461A8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22E848270;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F07878], v0);
  v6(v5 + v2, *MEMORY[0x263F078A0], v0);
  v6(v5 + 2 * v2, *MEMORY[0x263F078A8], v0);
  v6(v5 + 3 * v2, *MEMORY[0x263F07870], v0);
  v6(v5 + 4 * v2, *MEMORY[0x263F07890], v0);
  v6(v5 + 5 * v2, *MEMORY[0x263F078C0], v0);
  v6(v5 + 6 * v2, *MEMORY[0x263F078C8], v0);
  v6(v5 + 7 * v2, *MEMORY[0x263F078E8], v0);
  v6(v5 + 8 * v2, *MEMORY[0x263F07850], v0);
  v6(v5 + 9 * v2, *MEMORY[0x263F078D8], v0);
  v6(v5 + 10 * v2, *MEMORY[0x263F07848], v0);
  v6(v5 + 11 * v2, *MEMORY[0x263F07830], v0);
  v6(v5 + 12 * v2, *MEMORY[0x263F07860], v0);
  v6(v5 + 13 * v2, *MEMORY[0x263F07828], v0);
  v6(v5 + 14 * v2, *MEMORY[0x263F078F0], v0);
  v6(v5 + 15 * v2, *MEMORY[0x263F078F8], v0);
  uint64_t v7 = sub_22E82520C(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t sub_22E82520C(uint64_t a1)
{
  uint64_t v2 = sub_22E8461A8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268615118);
    uint64_t v9 = sub_22E846D18();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_22E8254FC(&qword_268615120);
      uint64_t v16 = sub_22E846948();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_22E8254FC(&qword_268615128);
          char v23 = sub_22E846978();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_22E8254FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22E8461A8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E825540()
{
  type metadata accessor for TemperatureFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
  uint64_t v2 = sub_22E846118();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  static TemperatureFormatter.shared = v0;
  return result;
}

uint64_t *TemperatureFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E60 != -1) {
    swift_once();
  }
  return &static TemperatureFormatter.shared;
}

uint64_t static TemperatureFormatter.shared.getter()
{
  if (qword_268614E60 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t TemperatureFormatter.overrideLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
  swift_beginAccess();
  return sub_22E8207D4(v3, a1, &qword_268615030);
}

uint64_t TemperatureFormatter.overrideLocale.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
  swift_beginAccess();
  sub_22E81F004(a1, v3);
  return swift_endAccess();
}

uint64_t (*TemperatureFormatter.overrideLocale.modify())()
{
  return j__swift_endAccess;
}

uint64_t TemperatureFormatter.unitString.getter()
{
  uint64_t v1 = sub_22E846918();
  uint64_t v33 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v31 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v30 = sub_22E846C28();
  uint64_t v32 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615130);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  uint64_t v34 = v16;
  sub_22E8207D4((uint64_t)v16, (uint64_t)v14, &qword_268615130);
  uint64_t v29 = v18;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17) == 1)
  {
    sub_22E81C6A4((uint64_t)v14, &qword_268615130);
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v28 = v1;
    sub_22E846AC8();
    uint64_t v20 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
    swift_beginAccess();
    sub_22E8207D4(v20, (uint64_t)v6, &qword_268615030);
    uint64_t v21 = sub_22E846118();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v6, 1, v21) == 1)
    {
      sub_22E81C6A4((uint64_t)v6, &qword_268615030);
      sub_22E8460E8();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v8, v6, v21);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v8, 0, 1, v21);
    sub_22E8468F8();
    swift_bridgeObjectRelease();
    sub_22E81C6A4((uint64_t)v8, &qword_268615030);
    uint64_t v23 = v33;
    uint64_t v24 = v31;
    uint64_t v25 = v28;
    (*(void (**)(char *, void, uint64_t))(v33 + 104))(v31, *MEMORY[0x263F860E8], v28);
    sub_22E8467C8();
    sub_22E8467B8();
    sub_22E825C60();
    uint64_t v26 = v30;
    uint64_t v19 = sub_22E845EC8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v26);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v17);
  }
  sub_22E81C6A4((uint64_t)v34, &qword_268615130);
  return v19;
}

unint64_t sub_22E825C60()
{
  unint64_t result = qword_268615140;
  if (!qword_268615140)
  {
    sub_22E846C28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615140);
  }
  return result;
}

uint64_t TemperatureFormatter.degreesStringForTemperature(_:)(uint64_t a1)
{
  return TemperatureFormatter.string(for:formattingStyle:noValueStyle:)(a1, 1, 1);
}

uint64_t TemperatureFormatter.valueStringForTemperature(_:)(uint64_t a1)
{
  return TemperatureFormatter.string(for:formattingStyle:noValueStyle:)(a1, 0, 0);
}

uint64_t TemperatureFormatter.string(for:formattingStyle:noValueStyle:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v42 = a3;
  int v43 = a2;
  uint64_t v45 = sub_22E846918();
  uint64_t v4 = *(void *)(v45 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v45);
  uint64_t v41 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t v9 = sub_22E846C28();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v41 - v13;
  uint64_t v15 = sub_22E8468B8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (uint64_t *)((char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22E826EB8(0, &qword_268615148);
  *uint64_t v18 = sub_22E846C38();
  (*(void (**)(uint64_t *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F8F0E0], v15);
  char v19 = sub_22E8468C8();
  (*(void (**)(uint64_t *, uint64_t))(v16 + 8))(v18, v15);
  if ((v19 & 1) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(a1, 1, v20);
  char v22 = v42;
  if (v21 != 1) {
    goto LABEL_9;
  }
  if (!FormatterNoValueStyle.rawValue.getter(v42) && v23 == 0xE000000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  char v24 = sub_22E846EB8();
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0)
  {
LABEL_9:
    sub_22E8269D8(v43);
    uint64_t v39 = v45;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v8, **((unsigned int **)&unk_2649DE278 + v22), v45);
    sub_22E825C60();
    uint64_t v38 = sub_22E846C88();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v39);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v14, v9);
    return v38;
  }
LABEL_7:
  sub_22E8269D8(v43);
  uint64_t v25 = v41;
  uint64_t v26 = v45;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v41, *MEMORY[0x263F860E0], v45);
  sub_22E825C60();
  uint64_t v27 = sub_22E846C88();
  uint64_t v29 = v28;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v9);
  uint64_t v50 = v27;
  uint64_t v51 = v29;
  if (qword_268614E40 != -1) {
LABEL_12:
  }
    swift_once();
  id v30 = (id)qword_268615028;
  uint64_t v31 = (void *)sub_22E846988();
  uint64_t v32 = (void *)sub_22E846988();
  uint64_t v33 = (void *)sub_22E846988();
  id v34 = objc_msgSend(v30, sel_localizedStringForKey_value_table_, v31, v32, v33);

  uint64_t v35 = sub_22E846998();
  uint64_t v37 = v36;

  uint64_t v48 = v35;
  uint64_t v49 = v37;
  uint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  sub_22E819544();
  uint64_t v38 = sub_22E846CE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v38;
}

Swift::String __swiftcall TemperatureFormatter.noDataString(formattingStyle:noValueStyle:)(NanoWeatherKitUICompanion::TemperatureFormatter::FormattingStyle formattingStyle, NanoWeatherKitUICompanion::FormatterNoValueStyle noValueStyle)
{
  uint64_t v2 = noValueStyle;
  int v3 = formattingStyle;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615130);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E8468B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22E826EB8(0, &qword_268615148);
  *uint64_t v10 = sub_22E846C38();
  (*(void (**)(uint64_t *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F0E0], v7);
  char v11 = sub_22E8468C8();
  uint64_t v12 = (*(uint64_t (**)(uint64_t *, uint64_t))(v8 + 8))(v10, v7);
  if (v11)
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
    uint64_t v15 = TemperatureFormatter.string(for:formattingStyle:noValueStyle:)((uint64_t)v6, v3, v2);
    uint64_t v17 = v16;
    sub_22E81C6A4((uint64_t)v6, &qword_268615130);
    uint64_t v12 = v15;
    uint64_t v13 = v17;
  }
  else
  {
    __break(1u);
  }
  result._object = v13;
  result._countAndFlagsBits = v12;
  return result;
}

uint64_t TemperatureFormatter.highLow(high:low:style:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = TemperatureFormatter.string(for:formattingStyle:noValueStyle:)(a1, 1, 1);
  uint64_t v7 = v6;
  uint64_t v8 = TemperatureFormatter.string(for:formattingStyle:noValueStyle:)(a2, 1, 1);
  uint64_t v10 = v9;
  if (!a3)
  {
    if (qword_268614E40 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    if (qword_268614E40 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (qword_268614E40 != -1) {
LABEL_9:
  }
    swift_once();
LABEL_8:
  id v11 = (id)qword_268615028;
  uint64_t v12 = (void *)sub_22E846988();
  uint64_t v13 = (void *)sub_22E846988();
  uint64_t v14 = (void *)sub_22E846988();
  id v15 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, v13, v14);

  sub_22E846998();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_22E848280;
  uint64_t v17 = MEMORY[0x263F8D310];
  *(void *)(v16 + 56) = MEMORY[0x263F8D310];
  unint64_t v18 = sub_22E826E64();
  *(void *)(v16 + 32) = v5;
  *(void *)(v16 + 40) = v7;
  *(void *)(v16 + 96) = v17;
  *(void *)(v16 + 104) = v18;
  *(void *)(v16 + 64) = v18;
  *(void *)(v16 + 72) = v8;
  *(void *)(v16 + 80) = v10;
  uint64_t v19 = sub_22E8469A8();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t TemperatureFormatter.rounded(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615130);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E8207D4(a1, (uint64_t)v6, &qword_268615130);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22E81C6A4((uint64_t)v6, &qword_268615130);
    uint64_t v11 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_22E845EB8();
    sub_22E845E98();
    sub_22E826EB8(0, &qword_268615160);
    sub_22E845EA8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v11 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v11, 1, v7);
}

uint64_t TemperatureFormatter.rounded(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
  sub_22E845EB8();
  sub_22E845E98();
  sub_22E826EB8(0, &qword_268615160);
  return sub_22E845EA8();
}

uint64_t sub_22E8269D8(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  id v15 = (char *)&v31 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v31 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v31 - v19;
  if (a1)
  {
    if (a1 == 1)
    {
      sub_22E846AB8();
      uint64_t v21 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
      swift_beginAccess();
      sub_22E8207D4(v21, (uint64_t)v12, &qword_268615030);
      uint64_t v22 = sub_22E846118();
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v22) == 1)
      {
        sub_22E81C6A4((uint64_t)v12, &qword_268615030);
        sub_22E8460E8();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v15, v12, v22);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v15, 0, 1, v22);
      sub_22E8468F8();
      uint64_t v20 = v15;
    }
    else
    {
      sub_22E846AB8();
      uint64_t v27 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
      swift_beginAccess();
      sub_22E8207D4(v27, (uint64_t)v6, &qword_268615030);
      uint64_t v28 = sub_22E846118();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v6, 1, v28) == 1)
      {
        sub_22E81C6A4((uint64_t)v6, &qword_268615030);
        sub_22E8460E8();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v9, v6, v28);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v9, 0, 1, v28);
      sub_22E8468F8();
      uint64_t v20 = v9;
    }
  }
  else
  {
    sub_22E846AD8();
    uint64_t v24 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale;
    swift_beginAccess();
    sub_22E8207D4(v24, (uint64_t)v18, &qword_268615030);
    uint64_t v25 = sub_22E846118();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v18, 1, v25) == 1)
    {
      sub_22E81C6A4((uint64_t)v18, &qword_268615030);
      sub_22E8460E8();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v20, v18, v25);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v20, 0, 1, v25);
    sub_22E8468F8();
  }
  swift_bridgeObjectRelease();
  return sub_22E81C6A4((uint64_t)v20, &qword_268615030);
}

unint64_t sub_22E826E64()
{
  unint64_t result = qword_268615158;
  if (!qword_268615158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615158);
  }
  return result;
}

uint64_t sub_22E826EB8(uint64_t a1, unint64_t *a2)
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

uint64_t TemperatureFormatter.deinit()
{
  sub_22E81C6A4(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale, &qword_268615030);
  return v0;
}

uint64_t TemperatureFormatter.__deallocating_deinit()
{
  sub_22E81C6A4(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion20TemperatureFormatter_overrideLocale, &qword_268615030);
  return swift_deallocClassInstance();
}

NanoWeatherKitUICompanion::TemperatureFormatter::FormattingStyle_optional __swiftcall TemperatureFormatter.FormattingStyle.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3) {
    LOBYTE(rawValue) = 3;
  }
  return (NanoWeatherKitUICompanion::TemperatureFormatter::FormattingStyle_optional)rawValue;
}

void *static TemperatureFormatter.FormattingStyle.allCases.getter()
{
  return &unk_26E23ABB0;
}

uint64_t TemperatureFormatter.FormattingStyle.rawValue.getter(uint64_t result)
{
  return result;
}

uint64_t *sub_22E826FB4@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_22E826FCC(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_22E826FD8(void *a1@<X8>)
{
  *a1 = &unk_26E23ABD8;
}

BOOL static TemperatureFormatter.HighLowStyle.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t TemperatureFormatter.HighLowStyle.hash(into:)()
{
  return sub_22E846EE8();
}

uint64_t TemperatureFormatter.HighLowStyle.hashValue.getter()
{
  return sub_22E846EF8();
}

unint64_t sub_22E82706C()
{
  unint64_t result = qword_268615168;
  if (!qword_268615168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615168);
  }
  return result;
}

unint64_t sub_22E8270C4()
{
  unint64_t result = qword_268615170;
  if (!qword_268615170)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268615178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615170);
  }
  return result;
}

unint64_t sub_22E827124()
{
  unint64_t result = qword_268615180;
  if (!qword_268615180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615180);
  }
  return result;
}

uint64_t sub_22E827178()
{
  return type metadata accessor for TemperatureFormatter();
}

uint64_t type metadata accessor for TemperatureFormatter()
{
  uint64_t result = qword_268615188;
  if (!qword_268615188) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *type metadata accessor for TemperatureFormatter.FormattingStyle()
{
  return &type metadata for TemperatureFormatter.FormattingStyle;
}

unsigned char *_s25NanoWeatherKitUICompanion20TemperatureFormatterC15FormattingStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E8272B0);
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

ValueMetadata *type metadata accessor for TemperatureFormatter.HighLowStyle()
{
  return &type metadata for TemperatureFormatter.HighLowStyle;
}

uint64_t PrecipitationOutlook.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22E8460A8();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

double PrecipitationOutlook.interval.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for PrecipitationOutlook(0) + 20));
}

uint64_t type metadata accessor for PrecipitationOutlook(uint64_t a1)
{
  return sub_22E81C5A8(a1, (uint64_t *)&unk_2686152B8);
}

uint64_t PrecipitationOutlook.isDaylight.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PrecipitationOutlook(0) + 24));
}

double PrecipitationOutlook.probability.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for PrecipitationOutlook(0) + 28));
}

uint64_t PrecipitationOutlook.state.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PrecipitationOutlook(0);
  return sub_22E832204(v1 + *(int *)(v3 + 32), a1, type metadata accessor for PrecipitationOutlook.State);
}

uint64_t type metadata accessor for PrecipitationOutlook.State(uint64_t a1)
{
  return sub_22E81C5A8(a1, (uint64_t *)&unk_2686152C8);
}

uint64_t PrecipitationOutlook.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PrecipitationOutlook(0) + 36);
  uint64_t v4 = sub_22E846228();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PrecipitationOutlook.changeDate.getter()
{
  type metadata accessor for PrecipitationOutlook(0);
  return sub_22E846048();
}

unint64_t PrecipitationOutlook.State.description.getter()
{
  uint64_t v1 = sub_22E846618();
  uint64_t v45 = *(void *)(v1 - 8);
  uint64_t v46 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v44 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  int v43 = (char *)&v43 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v43 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v43 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v43 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v43 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v43 - v24;
  uint64_t v26 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v43 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E832204(v0, (uint64_t)v28, type metadata accessor for PrecipitationOutlook.State);
  unint64_t v29 = 0x6E776F6E6B6E55;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0);
      sub_22E827C3C((uint64_t)&v28[*(int *)(v32 + 48)], (uint64_t)v20);
      sub_22E8207D4((uint64_t)v20, (uint64_t)v17, &qword_268615198);
      uint64_t v34 = v45;
      uint64_t v33 = v46;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v17, 1, v46) == 1)
      {
        sub_22E81C6A4((uint64_t)v17, &qword_268615198);
        sub_22E81C6A4((uint64_t)v20, &qword_268615198);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v33);
        unint64_t v29 = 0xD000000000000018;
      }
      else
      {
        uint64_t v38 = v43;
        (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v43, v17, v33);
        uint64_t v47 = 0x676562206C6C6957;
        unint64_t v48 = 0xEB00000000206E69;
        sub_22E831FC8(&qword_2686151A8, MEMORY[0x263F1F528]);
        sub_22E846EA8();
        sub_22E8469C8();
        swift_bridgeObjectRelease();
        unint64_t v29 = v47;
        uint64_t v39 = *(void (**)(char *, uint64_t))(v34 + 8);
        v39(v38, v33);
        sub_22E81C6A4((uint64_t)v20, &qword_268615198);
        v39(v28, v33);
      }
      break;
    case 2u:
      uint64_t v35 = &v28[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
      sub_22E827C3C((uint64_t)v28, (uint64_t)v14);
      sub_22E8207D4((uint64_t)v14, (uint64_t)v11, &qword_268615198);
      uint64_t v37 = v45;
      uint64_t v36 = v46;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v11, 1, v46) == 1)
      {
        unint64_t v29 = 0xD000000000000017;
        sub_22E81C6A4((uint64_t)v11, &qword_268615198);
        sub_22E81C6A4((uint64_t)v14, &qword_268615198);
        (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
      }
      else
      {
        uint64_t v40 = v44;
        (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v44, v11, v36);
        uint64_t v47 = 0x6F7473206C6C6957;
        unint64_t v48 = 0xEA00000000002070;
        sub_22E831FC8(&qword_2686151A8, MEMORY[0x263F1F528]);
        sub_22E846EA8();
        sub_22E8469C8();
        swift_bridgeObjectRelease();
        unint64_t v29 = v47;
        uint64_t v41 = *(void (**)(char *, uint64_t))(v37 + 8);
        v41(v40, v36);
        sub_22E81C6A4((uint64_t)v14, &qword_268615198);
        v41(v35, v36);
      }
      break;
    case 3u:
      return v29;
    case 4u:
      unint64_t v29 = 0x7261656C43;
      break;
    default:
      sub_22E827C3C((uint64_t)v28, (uint64_t)v25);
      sub_22E8207D4((uint64_t)v25, (uint64_t)v23, &qword_268615198);
      uint64_t v31 = v45;
      uint64_t v30 = v46;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v23, 1, v46) == 1)
      {
        unint64_t v29 = 0xD000000000000017;
        sub_22E81C6A4((uint64_t)v23, &qword_268615198);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v7, v23, v30);
        uint64_t v47 = 0x6C746E6572727543;
        unint64_t v48 = 0xEA00000000002079;
        sub_22E831FC8(&qword_2686151A8, MEMORY[0x263F1F528]);
        sub_22E846EA8();
        sub_22E8469C8();
        swift_bridgeObjectRelease();
        unint64_t v29 = v47;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v30);
      }
      sub_22E81C6A4((uint64_t)v25, &qword_268615198);
      break;
  }
  return v29;
}

uint64_t sub_22E827C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E827CA8()
{
  return 0;
}

uint64_t sub_22E827CB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_22E827CE4()
{
  return 0;
}

void sub_22E827CF0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22E827CFC(uint64_t a1)
{
  unint64_t v2 = sub_22E8320B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E827D38(uint64_t a1)
{
  unint64_t v2 = sub_22E8320B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22E827D7C()
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7261656C63;
      break;
    case 2:
      uint64_t result = 0x7469706963657270;
      break;
    case 3:
      uint64_t result = 0x696765426C6C6977;
      break;
    case 4:
      uint64_t result = 0x61656C436C6C6977;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22E827E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22E8322CC(a1, a2);
  *a3 = result;
  return result;
}

void sub_22E827E64(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_22E827E70(uint64_t a1)
{
  unint64_t v2 = sub_22E831F20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E827EAC(uint64_t a1)
{
  unint64_t v2 = sub_22E831F20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22E827EE8()
{
  return 1;
}

uint64_t sub_22E827EF0()
{
  return sub_22E846EF8();
}

uint64_t sub_22E827F34()
{
  return sub_22E846EE8();
}

uint64_t sub_22E827F5C()
{
  return sub_22E846EF8();
}

uint64_t sub_22E827F9C()
{
  return 12383;
}

uint64_t sub_22E827FA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_22E846EB8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_22E828028(uint64_t a1)
{
  unint64_t v2 = sub_22E832064();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E828064(uint64_t a1)
{
  unint64_t v2 = sub_22E832064();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22E8280A0(uint64_t a1)
{
  unint64_t v2 = sub_22E83210C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E8280DC(uint64_t a1)
{
  unint64_t v2 = sub_22E83210C();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_22E828118(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22E828130()
{
  if (*v0) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_22E82814C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22E832518(a1, a2);
  *a3 = result;
  return result;
}

void sub_22E828174(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_22E828180(uint64_t a1)
{
  unint64_t v2 = sub_22E832010();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E8281BC(uint64_t a1)
{
  unint64_t v2 = sub_22E832010();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22E8281F8(uint64_t a1)
{
  unint64_t v2 = sub_22E831F74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E828234(uint64_t a1)
{
  unint64_t v2 = sub_22E831F74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PrecipitationOutlook.State.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151B8);
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  MEMORY[0x270FA5388](v2);
  v68 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151C0);
  uint64_t v66 = *(void *)(v4 - 8);
  uint64_t v67 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v64 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_22E846618();
  uint64_t v73 = *(void *)(v75 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v75);
  v74 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int v65 = (char *)&v57 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151C8);
  uint64_t v62 = *(void *)(v9 - 8);
  uint64_t v63 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v61 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v71 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v72 = (uint64_t)&v57 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v60 = (uint64_t)&v57 - v16;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151D0);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151D8);
  uint64_t v57 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151E0);
  uint64_t v76 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22E831F20();
  v79 = v26;
  sub_22E846F18();
  sub_22E832204(v78, (uint64_t)v24, type metadata accessor for PrecipitationOutlook.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v33 = (uint64_t)&v24[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48)];
      uint64_t v34 = v73;
      uint64_t v35 = v65;
      (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v65, v24, v75);
      sub_22E827C3C(v33, v72);
      char v86 = 3;
      sub_22E832010();
      uint64_t v36 = v64;
      uint64_t v37 = v79;
      uint64_t v38 = v80;
      sub_22E846E58();
      char v85 = 0;
      sub_22E831FC8(&qword_2686151F8, MEMORY[0x263F1F528]);
      uint64_t v39 = v67;
      uint64_t v40 = v77;
      sub_22E846E98();
      if (v40)
      {
        (*(void (**)(char *, uint64_t))(v66 + 8))(v36, v39);
        sub_22E81C6A4(v72, &qword_268615198);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v75);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v37, v38);
      }
      else
      {
        char v84 = 1;
        uint64_t v54 = v72;
        uint64_t v55 = v75;
        sub_22E846E68();
        (*(void (**)(char *, uint64_t))(v66 + 8))(v36, v39);
        sub_22E81C6A4(v54, &qword_268615198);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v55);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v79, v80);
      }
      break;
    case 2u:
      uint64_t v41 = &v24[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
      uint64_t v42 = v71;
      sub_22E827C3C((uint64_t)v24, v71);
      uint64_t v43 = v73;
      (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v74, v41, v75);
      char v89 = 4;
      sub_22E831F74();
      uint64_t v44 = v68;
      uint64_t v46 = v79;
      uint64_t v45 = v80;
      sub_22E846E58();
      char v88 = 0;
      sub_22E831FC8(&qword_2686151F8, MEMORY[0x263F1F528]);
      uint64_t v47 = v70;
      uint64_t v48 = v77;
      sub_22E846E68();
      if (v48)
      {
        (*(void (**)(char *, uint64_t))(v69 + 8))(v44, v47);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v74, v75);
        uint64_t v49 = v42;
      }
      else
      {
        char v87 = 1;
        uint64_t v56 = v75;
        sub_22E846E98();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v44, v47);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v74, v56);
        uint64_t v49 = v71;
      }
      sub_22E81C6A4(v49, &qword_268615198);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v46, v45);
      break;
    case 3u:
      char v81 = 0;
      sub_22E83210C();
      uint64_t v51 = v79;
      uint64_t v50 = v80;
      sub_22E846E58();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v21, v19);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v51, v50);
      break;
    case 4u:
      char v82 = 1;
      sub_22E8320B8();
      uint64_t v52 = v79;
      uint64_t v53 = v80;
      sub_22E846E58();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v18, v59);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v52, v53);
      break;
    default:
      uint64_t v27 = v60;
      sub_22E827C3C((uint64_t)v24, v60);
      char v83 = 2;
      sub_22E832064();
      uint64_t v28 = v61;
      uint64_t v30 = v79;
      uint64_t v29 = v80;
      sub_22E846E58();
      sub_22E831FC8(&qword_2686151F8, MEMORY[0x263F1F528]);
      uint64_t v31 = v63;
      sub_22E846E68();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v28, v31);
      sub_22E81C6A4(v27, &qword_268615198);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v30, v29);
      break;
  }
  return result;
}

uint64_t PrecipitationOutlook.State.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615220);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  uint64_t v67 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v76 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615228);
  uint64_t v68 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v75 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615230);
  uint64_t v64 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v74 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615238);
  uint64_t v62 = *(void *)(v8 - 8);
  uint64_t v63 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v73 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615240);
  uint64_t v59 = *(void *)(v10 - 8);
  uint64_t v60 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v70 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615248);
  uint64_t v71 = *(void *)(v12 - 8);
  uint64_t v72 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v55 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v55 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v55 - v25;
  uint64_t v27 = a1[3];
  uint64_t v77 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v27);
  sub_22E831F20();
  uint64_t v28 = v78;
  sub_22E846F08();
  if (v28) {
    goto LABEL_14;
  }
  uint64_t v55 = v24;
  uint64_t v29 = v73;
  uint64_t v56 = v21;
  uint64_t v57 = v18;
  uint64_t v31 = v74;
  uint64_t v30 = v75;
  uint64_t v32 = v76;
  uint64_t v58 = v26;
  uint64_t v33 = v72;
  uint64_t v78 = sub_22E846E48();
  if (*(void *)(v78 + 16) != 1)
  {
    uint64_t v36 = sub_22E846D58();
    swift_allocError();
    uint64_t v37 = v33;
    uint64_t v39 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268615250);
    uint64_t *v39 = v15;
    sub_22E846DF8();
    sub_22E846D48();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v36);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v37);
LABEL_14:
    uint64_t v40 = (uint64_t)v77;
    return __swift_destroy_boxed_opaque_existential_1(v40);
  }
  switch(*(unsigned char *)(v78 + 32))
  {
    case 1:
      char v80 = 1;
      sub_22E8320B8();
      sub_22E846DE8();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v29, v63);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v33);
      uint64_t v35 = (uint64_t)v58;
      goto LABEL_7;
    case 2:
      char v81 = 2;
      sub_22E832064();
      sub_22E846DE8();
      sub_22E846618();
      sub_22E831FC8(&qword_268615258, MEMORY[0x263F1F528]);
      uint64_t v42 = (uint64_t)v55;
      uint64_t v43 = v61;
      sub_22E846E08();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v31, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v33);
      uint64_t v40 = (uint64_t)v77;
      swift_storeEnumTagMultiPayload();
      uint64_t v44 = v42;
      uint64_t v35 = (uint64_t)v58;
      sub_22E83286C(v44, (uint64_t)v58, type metadata accessor for PrecipitationOutlook.State);
      goto LABEL_9;
    case 3:
      char v84 = 3;
      sub_22E832010();
      sub_22E846DE8();
      uint64_t v45 = v33;
      uint64_t v46 = sub_22E846618();
      char v83 = 0;
      sub_22E831FC8(&qword_268615258, MEMORY[0x263F1F528]);
      uint64_t v47 = (uint64_t)v56;
      uint64_t v48 = v65;
      sub_22E846E38();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0);
      char v82 = 1;
      uint64_t v76 = (char *)v46;
      sub_22E846E08();
      uint64_t v53 = v71;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v30, v48);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v45);
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = (uint64_t)v58;
      sub_22E83286C(v47, (uint64_t)v58, type metadata accessor for PrecipitationOutlook.State);
      uint64_t v40 = (uint64_t)v77;
      uint64_t v41 = v69;
      goto LABEL_10;
    case 4:
      char v87 = 4;
      sub_22E831F74();
      sub_22E846DE8();
      uint64_t v50 = v33;
      uint64_t v75 = (char *)v15;
      sub_22E846618();
      char v86 = 0;
      sub_22E831FC8(&qword_268615258, MEMORY[0x263F1F528]);
      uint64_t v51 = (uint64_t)v57;
      uint64_t v52 = v66;
      sub_22E846E08();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      char v85 = 1;
      sub_22E846E38();
      uint64_t v54 = v71;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v32, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v14, v50);
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = (uint64_t)v58;
      sub_22E83286C(v51, (uint64_t)v58, type metadata accessor for PrecipitationOutlook.State);
      goto LABEL_8;
    default:
      char v79 = 0;
      sub_22E83210C();
      uint64_t v34 = v70;
      sub_22E846DE8();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v60);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v33);
      uint64_t v35 = (uint64_t)v58;
LABEL_7:
      swift_storeEnumTagMultiPayload();
LABEL_8:
      uint64_t v40 = (uint64_t)v77;
LABEL_9:
      uint64_t v41 = v69;
LABEL_10:
      sub_22E83286C(v35, v41, type metadata accessor for PrecipitationOutlook.State);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v40);
}

uint64_t sub_22E8299A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PrecipitationOutlook.State.init(from:)(a1, a2);
}

uint64_t sub_22E8299B8(void *a1)
{
  return PrecipitationOutlook.State.encode(to:)(a1);
}

uint64_t PrecipitationOutlook.init(date:interval:isDaylight:probability:state:timeZone:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v14 = sub_22E8460A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a5, a1, v14);
  uint64_t v15 = (int *)type metadata accessor for PrecipitationOutlook(0);
  *(double *)(a5 + v15[5]) = a6;
  *(unsigned char *)(a5 + v15[6]) = a2;
  *(double *)(a5 + v15[7]) = a7;
  sub_22E83286C(a3, a5 + v15[8], type metadata accessor for PrecipitationOutlook.State);
  uint64_t v16 = a5 + v15[9];
  uint64_t v17 = sub_22E846228();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32);
  return v18(v16, a4, v17);
}

uint64_t PrecipitationOutlook.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615260);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22E8321B0();
  sub_22E846F18();
  v8[15] = 0;
  sub_22E8460A8();
  sub_22E831FC8(&qword_268615270, MEMORY[0x263F07490]);
  sub_22E846E98();
  if (!v1)
  {
    type metadata accessor for PrecipitationOutlook(0);
    v8[14] = 1;
    sub_22E846E88();
    v8[13] = 2;
    sub_22E846E78();
    v8[12] = 3;
    sub_22E846E88();
    v8[11] = 4;
    type metadata accessor for PrecipitationOutlook.State(0);
    sub_22E831FC8(&qword_268615278, (void (*)(uint64_t))type metadata accessor for PrecipitationOutlook.State);
    sub_22E846E98();
    v8[10] = 5;
    sub_22E846228();
    sub_22E831FC8(&qword_268615280, MEMORY[0x263F079C8]);
    sub_22E846E98();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PrecipitationOutlook.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v27 = sub_22E846228();
  uint64_t v25 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v28 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v29);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E8460A8();
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v31 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615288);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for PrecipitationOutlook(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22E8321B0();
  uint64_t v33 = v9;
  uint64_t v13 = (uint64_t)v35;
  sub_22E846F08();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v14 = (uint64_t)v5;
  uint64_t v35 = a1;
  uint64_t v15 = v30;
  char v41 = 0;
  sub_22E831FC8(&qword_268615290, MEMORY[0x263F07490]);
  uint64_t v16 = v31;
  sub_22E846E38();
  uint64_t v17 = (uint64_t)v12;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v16, v6);
  char v40 = 1;
  sub_22E846E28();
  uint64_t v18 = v10;
  *(void *)&v12[v10[5]] = v19;
  char v39 = 2;
  v12[v10[6]] = sub_22E846E18() & 1;
  char v38 = 3;
  sub_22E846E28();
  *(void *)&v12[v10[7]] = v20;
  char v37 = 4;
  sub_22E831FC8(&qword_268615298, (void (*)(uint64_t))type metadata accessor for PrecipitationOutlook.State);
  sub_22E846E38();
  sub_22E83286C(v14, (uint64_t)&v12[v10[8]], type metadata accessor for PrecipitationOutlook.State);
  char v36 = 5;
  sub_22E831FC8(&qword_2686152A0, MEMORY[0x263F079C8]);
  uint64_t v22 = v27;
  uint64_t v23 = v28;
  sub_22E846E38();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v17 + v18[9], v23, v22);
  sub_22E832204(v17, v26, type metadata accessor for PrecipitationOutlook);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return sub_22E83226C(v17, type metadata accessor for PrecipitationOutlook);
}

uint64_t sub_22E82A3EC()
{
  uint64_t result = 1702125924;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C61767265746E69;
      break;
    case 2:
      uint64_t result = 0x67696C7961447369;
      break;
    case 3:
      uint64_t result = 0x6C696261626F7270;
      break;
    case 4:
      uint64_t result = 0x6574617473;
      break;
    case 5:
      uint64_t result = 0x656E6F5A656D6974;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22E82A4B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22E8325DC(a1, a2);
  *a3 = result;
  return result;
}

void sub_22E82A4DC(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_22E82A4E8(uint64_t a1)
{
  unint64_t v2 = sub_22E8321B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22E82A524(uint64_t a1)
{
  unint64_t v2 = sub_22E8321B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22E82A560@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PrecipitationOutlook.init(from:)(a1, a2);
}

uint64_t sub_22E82A578(void *a1)
{
  return PrecipitationOutlook.encode(to:)(a1);
}

uint64_t PrecipitationOutlook.description.getter()
{
  return 0;
}

uint64_t sub_22E82A6F4@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, void (*a4)(char *, uint64_t)@<X3>, uint64_t a5@<X8>)
{
  v231 = a4;
  uint64_t v215 = a3;
  uint64_t v236 = a5;
  uint64_t v219 = sub_22E846228();
  uint64_t v218 = *(void *)(v219 - 8);
  MEMORY[0x270FA5388](v219);
  v199 = (char *)&v195 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v213 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v213);
  v198 = (char *)&v195 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v217 = sub_22E8460A8();
  uint64_t v216 = *(void *)(v217 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v217);
  v207 = (char *)&v195 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v214 = (char *)&v195 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v206 = (char *)&v195 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v220 = (char *)&v195 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v201 = (uint64_t)&v195 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v209 = (uint64_t)&v195 - v19;
  uint64_t v226 = sub_22E846618();
  uint64_t v230 = *(void *)(v226 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v226);
  v203 = (char *)&v195 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v212 = (char *)&v195 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v202 = (char *)&v195 - v25;
  MEMORY[0x270FA5388](v24);
  v210 = (char *)&v195 - v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615378);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v29 = (char *)&v195 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_22E8466A8();
  uint64_t v225 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  v205 = (char *)&v195 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v211 = (char *)&v195 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v200 = (char *)&v195 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v208 = (char *)&v195 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v228 = (char *)&v195 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v229 = (char *)&v195 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v223 = (char *)&v195 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v221 = (char *)&v195 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v224 = (char *)&v195 - v48;
  MEMORY[0x270FA5388](v47);
  v227 = (char *)&v195 - v49;
  uint64_t v50 = sub_22E846698();
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v234 = v50;
  uint64_t v235 = v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v222 = (char *)&v195 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v233 = (char *)&v195 - v55;
  MEMORY[0x270FA5388](v54);
  v232 = (char *)&v195 - v56;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA0);
  uint64_t v58 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v60 = (char *)&v195 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F88);
  uint64_t v62 = MEMORY[0x270FA5388](v61 - 8);
  uint64_t v64 = (char *)&v195 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v62);
  uint64_t v66 = (char *)&v195 - v65;
  uint64_t v204 = a1;
  sub_22E82C2D8(a2, (char *)&v195 - v65);
  sub_22E8207D4((uint64_t)v66, (uint64_t)v64, &qword_268614F88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v64, 1, v57) == 1)
  {
    sub_22E81C6A4((uint64_t)v66, &qword_268614F88);
    uint64_t v67 = (uint64_t)v64;
LABEL_34:
    sub_22E81C6A4(v67, &qword_268614F88);
    uint64_t v124 = type metadata accessor for PrecipitationOutlook(0);
    v125 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56);
    uint64_t v126 = v236;
LABEL_46:
    uint64_t v157 = 1;
    return v125(v126, v157, 1, v124);
  }
  v196 = v66;
  uint64_t v197 = v58;
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v60, v64, v57);
  uint64_t v68 = sub_22E846758();
  MEMORY[0x270FA5388](v68);
  *(&v195 - 2) = (uint64_t)a2;
  uint64_t v70 = sub_22E81A35C((uint64_t (*)(void))v231, (uint64_t)(&v195 - 4), v69);
  unint64_t v71 = *(void *)(v70 + 16);
  if (v71 <= 1)
  {
    uint64_t v87 = v235;
    if (v71)
    {
      uint64_t v88 = v234;
      (*(void (**)(char *, unint64_t, uint64_t))(v235 + 16))(v29, v70 + ((*(unsigned __int8 *)(v235 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v235 + 80)), v234);
      uint64_t v89 = 0;
      uint64_t v90 = v230;
    }
    else
    {
      uint64_t v89 = 1;
      uint64_t v90 = v230;
      uint64_t v88 = v234;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56))(v29, v89, 1, v88);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48))(v29, 1, v88) == 1)
    {
      uint64_t v91 = &qword_268615378;
      uint64_t v92 = (uint64_t)v29;
    }
    else
    {
      uint64_t v93 = v222;
      (*(void (**)(void))(v87 + 32))();
      if ((sub_22E82CBA8((uint64_t)a2) & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v87 + 8))(v93, v88);
        goto LABEL_29;
      }
      uint64_t v94 = v205;
      sub_22E846648();
      uint64_t v95 = (uint64_t)v206;
      sub_22E82CEF4((uint64_t)v206);
      (*(void (**)(char *, uint64_t))(v225 + 8))(v94, v30);
      uint64_t v96 = v226;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48))(v95, 1, v226) != 1)
      {
        uint64_t v158 = v57;
        v159 = v203;
        (*(void (**)(char *, uint64_t, uint64_t))(v90 + 32))(v203, v95, v96);
        if (qword_268614E08 != -1) {
          swift_once();
        }
        uint64_t v160 = sub_22E8467F8();
        __swift_project_value_buffer(v160, (uint64_t)qword_268617B68);
        v161 = sub_22E8467D8();
        os_log_type_t v162 = sub_22E846BF8();
        if (os_log_type_enabled(v161, v162))
        {
          v163 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v163 = 0;
          _os_log_impl(&dword_22E811000, v161, v162, "NHP indicates precipitation.", v163, 2u);
          v164 = v163;
          v159 = v203;
          MEMORY[0x230FA6640](v164, -1, -1);
        }

        uint64_t v165 = (uint64_t)v198;
        (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v198, v159, v96);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v90 + 56))(v165, 0, 1, v96);
        swift_storeEnumTagMultiPayload();
        uint64_t v166 = v218;
        v167 = v199;
        uint64_t v168 = v219;
        (*(void (**)(char *, uint64_t, uint64_t))(v218 + 16))(v199, v215, v219);
        v169 = v214;
        sub_22E846078();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v159, v96);
        (*(void (**)(char *, uint64_t))(v235 + 8))(v222, v234);
        (*(void (**)(char *, uint64_t))(v197 + 8))(v60, v158);
        sub_22E81C6A4((uint64_t)v196, &qword_268614F88);
        uint64_t v170 = v236;
        (*(void (**)(uint64_t, char *, uint64_t))(v216 + 32))(v236, v169, v217);
        v171 = (int *)type metadata accessor for PrecipitationOutlook(0);
        *(void *)(v170 + v171[5]) = 0;
        *(unsigned char *)(v170 + v171[6]) = 1;
        *(void *)(v170 + v171[7]) = 0;
        sub_22E83286C(v165, v170 + v171[8], type metadata accessor for PrecipitationOutlook.State);
        (*(void (**)(uint64_t, char *, uint64_t))(v166 + 32))(v170 + v171[9], v167, v168);
        v125 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)v171 - 1) + 56);
        uint64_t v126 = v170;
        goto LABEL_58;
      }
      (*(void (**)(char *, uint64_t))(v87 + 8))(v93, v88);
      uint64_t v91 = &qword_268615198;
      uint64_t v92 = v95;
    }
    sub_22E81C6A4(v92, v91);
LABEL_29:
    uint64_t v118 = (uint64_t)v196;
    uint64_t v119 = v57;
    if (qword_268614E08 != -1) {
      swift_once();
    }
    uint64_t v120 = sub_22E8467F8();
    __swift_project_value_buffer(v120, (uint64_t)qword_268617B68);
    v121 = sub_22E8467D8();
    os_log_type_t v122 = sub_22E846C18();
    if (os_log_type_enabled(v121, v122))
    {
      v123 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v123 = 0;
      _os_log_impl(&dword_22E811000, v121, v122, "No valid summaries in the minute forecast.", v123, 2u);
      MEMORY[0x230FA6640](v123, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v197 + 8))(v60, v119);
    uint64_t v67 = v118;
    goto LABEL_34;
  }
  uint64_t v195 = v57;
  v206 = v60;
  v203 = (char *)a2;
  uint64_t v72 = v234;
  uint64_t v73 = v235 + 16;
  v74 = *(void (**)(char *, unint64_t, uint64_t))(v235 + 16);
  unint64_t v75 = v70 + ((*(unsigned __int8 *)(v235 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v235 + 80));
  v74(v232, v75, v234);
  v74(v233, v75 + *(void *)(v73 + 56), v72);
  swift_bridgeObjectRelease();
  uint64_t v76 = v227;
  sub_22E846648();
  uint64_t v77 = *MEMORY[0x263F1F590];
  char v79 = v224;
  uint64_t v78 = v225;
  char v81 = (char *)(v225 + 104);
  char v80 = *(char **)(v225 + 104);
  ((void (*)(char *, uint64_t, uint64_t))v80)(v224, v77, v30);
  v205 = (char *)sub_22E831FC8(&qword_268615380, MEMORY[0x263F1F5B8]);
  char v82 = sub_22E846978();
  char v83 = *(void (**)(char *, uint64_t))(v78 + 8);
  v83(v79, v30);
  v231 = v83;
  v83(v76, v30);
  LODWORD(v225) = v77;
  v222 = v80;
  if (v82) {
    goto LABEL_20;
  }
  char v84 = v221;
  sub_22E846648();
  v199 = v81;
  ((void (*)(char *, uint64_t, uint64_t))v80)(v223, v77, v30);
  sub_22E831FC8((unint64_t *)&qword_268615388, MEMORY[0x263F1F5B8]);
  sub_22E8469E8();
  sub_22E8469E8();
  if (v239 == v237 && v240 == v238)
  {
    swift_bridgeObjectRelease_n();
    char v85 = v231;
    v231(v223, v30);
    v85(v84, v30);
    uint64_t v86 = (uint64_t)v220;
  }
  else
  {
    LODWORD(v198) = sub_22E846EB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v97 = v231;
    v231(v223, v30);
    v97(v84, v30);
    uint64_t v77 = v225;
    char v80 = v222;
    uint64_t v86 = (uint64_t)v220;
    if ((v198 & 1) == 0) {
      goto LABEL_20;
    }
  }
  uint64_t v98 = v211;
  sub_22E846648();
  sub_22E82CEF4(v86);
  v231(v98, v30);
  uint64_t v99 = v230;
  uint64_t v100 = v226;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v230 + 48))(v86, 1, v226) == 1)
  {
    sub_22E81C6A4(v86, &qword_268615198);
    char v79 = v224;
    uint64_t v77 = v225;
    char v80 = v222;
LABEL_20:
    sub_22E846648();
    ((void (*)(char *, uint64_t, uint64_t))v80)(v228, v77, v30);
    sub_22E831FC8((unint64_t *)&qword_268615388, MEMORY[0x263F1F5B8]);
    sub_22E8469E8();
    sub_22E8469E8();
    if (v239 == v237 && v240 == v238)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v101 = v231;
      v231(v228, v30);
      v101(v229, v30);
    }
    else
    {
      char v102 = sub_22E846EB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v101 = v231;
      v231(v228, v30);
      v101(v229, v30);
      uint64_t v103 = v195;
      if ((v102 & 1) == 0)
      {
        uint64_t v127 = v234;
        v128 = *(void (**)(char *, uint64_t))(v235 + 8);
        v128(v233, v234);
        v128(v232, v127);
        (*(void (**)(char *, uint64_t))(v197 + 8))(v206, v103);
        goto LABEL_36;
      }
    }
    v104 = v227;
    v105 = v233;
    sub_22E846648();
    ((void (*)(char *, void, uint64_t))v222)(v79, v225, v30);
    char v106 = sub_22E846978();
    v101(v79, v30);
    v101(v104, v30);
    if (v106)
    {
      uint64_t v107 = v234;
      v108 = *(void (**)(char *, uint64_t))(v235 + 8);
      v108(v105, v234);
      v108(v232, v107);
      (*(void (**)(char *, uint64_t))(v197 + 8))(v206, v195);
LABEL_36:
      v129 = &qword_268614F88;
      uint64_t v130 = (uint64_t)v196;
LABEL_45:
      sub_22E81C6A4(v130, v129);
      uint64_t v156 = v236;
      uint64_t v124 = type metadata accessor for PrecipitationOutlook(0);
      v125 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56);
      uint64_t v126 = v156;
      goto LABEL_46;
    }
    v109 = v208;
    v110 = v232;
    sub_22E846648();
    uint64_t v111 = v209;
    sub_22E82CEF4(v209);
    v101(v109, v30);
    uint64_t v112 = v230;
    v113 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v230 + 48);
    uint64_t v114 = v226;
    if (v113(v111, 1, v226) == 1)
    {
      uint64_t v115 = v234;
      v116 = *(void (**)(char *, uint64_t))(v235 + 8);
      v116(v233, v234);
      v117 = v110;
LABEL_44:
      v116(v117, v115);
      (*(void (**)(char *, uint64_t))(v197 + 8))(v206, v195);
      sub_22E81C6A4((uint64_t)v196, &qword_268614F88);
      v129 = &qword_268615198;
      uint64_t v130 = v111;
      goto LABEL_45;
    }
    v231 = *(void (**)(char *, uint64_t))(v112 + 32);
    ((void (*)(char *, uint64_t, uint64_t))v231)(v210, v111, v114);
    v154 = v200;
    sub_22E846648();
    uint64_t v111 = v201;
    sub_22E82CEF4(v201);
    uint64_t v155 = v226;
    v101(v154, v30);
    if (v113(v111, 1, v155) == 1)
    {
      (*(void (**)(char *, uint64_t))(v112 + 8))(v210, v155);
      uint64_t v115 = v234;
      v116 = *(void (**)(char *, uint64_t))(v235 + 8);
      v116(v233, v234);
      v117 = v232;
      goto LABEL_44;
    }
    uint64_t v172 = v111;
    v173 = (void (*)(uint64_t, char *, uint64_t))v231;
    ((void (*)(char *, uint64_t, uint64_t))v231)(v202, v172, v155);
    uint64_t v174 = (uint64_t)v196;
    if (qword_268614E08 != -1) {
      swift_once();
    }
    uint64_t v175 = sub_22E8467F8();
    __swift_project_value_buffer(v175, (uint64_t)qword_268617B68);
    v176 = sub_22E8467D8();
    os_log_type_t v177 = sub_22E846BF8();
    BOOL v178 = os_log_type_enabled(v176, v177);
    v179 = v233;
    if (v178)
    {
      v180 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v180 = 0;
      _os_log_impl(&dword_22E811000, v176, v177, "NHP indicates no precipitation currently, but will soon.", v180, 2u);
      MEMORY[0x230FA6640](v180, -1, -1);
    }

    uint64_t v181 = v216;
    v182 = v214;
    uint64_t v183 = v217;
    (*(void (**)(char *, char *, uint64_t))(v216 + 16))(v214, v203, v217);
    v184 = v207;
    sub_22E846688();
    sub_22E845FF8();
    uint64_t v186 = v185;
    (*(void (**)(char *, uint64_t))(v181 + 8))(v184, v183);
    sub_22E846668();
    uint64_t v188 = v187;
    uint64_t v189 = v234;
    v190 = *(void (**)(char *, uint64_t))(v235 + 8);
    v190(v179, v234);
    v190(v232, v189);
    (*(void (**)(char *, uint64_t))(v197 + 8))(v206, v195);
    sub_22E81C6A4(v174, &qword_268614F88);
    v171 = (int *)type metadata accessor for PrecipitationOutlook(0);
    uint64_t v191 = v236;
    uint64_t v192 = v236 + v171[8];
    uint64_t v193 = v192 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
    uint64_t v194 = v226;
    v173(v192, v210, v226);
    v173(v193, v202, v194);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v230 + 56))(v193, 0, 1, v194);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v218 + 16))(v191 + v171[9], v215, v219);
    (*(void (**)(uint64_t, char *, uint64_t))(v181 + 32))(v191, v182, v183);
    *(void *)(v191 + v171[5]) = v186;
    *(unsigned char *)(v191 + v171[6]) = 1;
    *(void *)(v191 + v171[7]) = v188;
    v125 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)v171 - 1) + 56);
    uint64_t v126 = v191;
LABEL_58:
    uint64_t v157 = 0;
    uint64_t v124 = (uint64_t)v171;
    return v125(v126, v157, 1, v124);
  }
  uint64_t v131 = (uint64_t)v206;
  v231 = *(void (**)(char *, uint64_t))(v99 + 32);
  ((void (*)(char *, uint64_t, uint64_t))v231)(v212, v86, v100);
  if (qword_268614E08 != -1) {
    swift_once();
  }
  uint64_t v132 = sub_22E8467F8();
  __swift_project_value_buffer(v132, (uint64_t)qword_268617B68);
  v133 = sub_22E8467D8();
  os_log_type_t v134 = sub_22E846BF8();
  BOOL v135 = os_log_type_enabled(v133, v134);
  uint64_t v136 = (uint64_t)v203;
  if (v135)
  {
    v137 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v137 = 0;
    _os_log_impl(&dword_22E811000, v133, v134, "NHP indicates precipitation and a stop later.", v137, 2u);
    MEMORY[0x230FA6640](v137, -1, -1);
  }

  uint64_t v138 = v216;
  v139 = v214;
  uint64_t v140 = v217;
  (*(void (**)(char *, uint64_t, uint64_t))(v216 + 16))(v214, v136, v217);
  v141 = v207;
  v142 = v233;
  sub_22E846688();
  sub_22E845FF8();
  uint64_t v144 = v143;
  (*(void (**)(char *, uint64_t))(v138 + 8))(v141, v140);
  LOBYTE(v141) = sub_22E82D148(v136);
  uint64_t v145 = v234;
  v146 = *(void (**)(char *, uint64_t))(v235 + 8);
  v146(v142, v234);
  v146(v232, v145);
  (*(void (**)(uint64_t, uint64_t))(v197 + 8))(v131, v195);
  sub_22E81C6A4((uint64_t)v196, &qword_268614F88);
  v147 = (int *)type metadata accessor for PrecipitationOutlook(0);
  uint64_t v148 = v236;
  uint64_t v149 = v236 + v147[8];
  uint64_t v150 = v149 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48);
  uint64_t v151 = v226;
  ((void (*)(uint64_t, char *, uint64_t))v231)(v149, v212, v226);
  uint64_t v152 = v230;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v230 + 56))(v149, 0, 1, v151);
  (*(void (**)(uint64_t, void, uint64_t))(v152 + 104))(v150, *MEMORY[0x263F1F450], v151);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v218 + 16))(v148 + v147[9], v215, v219);
  (*(void (**)(uint64_t, char *, uint64_t))(v138 + 32))(v148, v139, v140);
  *(void *)(v148 + v147[5]) = v144;
  *(unsigned char *)(v148 + v147[6]) = v141 & 1;
  *(void *)(v148 + v147[7]) = 0;
  return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v147 - 1) + 56))(v148, 0, 1, v147);
}

uint64_t sub_22E82C2D8@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_22E8466A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v52 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)v36 - v8;
  uint64_t v50 = sub_22E846698();
  uint64_t v9 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v49 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F88);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E8463C8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_22E81C6A4((uint64_t)v13, &qword_268614F88);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(a2, 1, 1, v14);
  }
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  uint64_t v42 = v15 + 32;
  v41(v17, v13, v14);
  if (!sub_22E840BE8(a1))
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(a2, 1, 1, v14);
  }
  uint64_t v18 = v5;
  uint64_t v19 = sub_22E846758();
  uint64_t v20 = *(void *)(v19 + 16);
  if (!v20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v37 = v17;
  uint64_t v38 = v15;
  uint64_t v39 = v14;
  uint64_t v40 = a2;
  uint64_t v22 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
  uint64_t v21 = v9 + 16;
  uint64_t v47 = v22;
  unint64_t v23 = (*(unsigned __int8 *)(v21 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 64);
  v36[1] = v19;
  unint64_t v24 = v19 + v23;
  unsigned int v46 = *MEMORY[0x263F1F590];
  uint64_t v25 = (void (**)(char *, void, uint64_t))(v18 + 104);
  uint64_t v26 = (void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v44 = (void (**)(char *, uint64_t))(v21 - 8);
  uint64_t v45 = v25;
  uint64_t v48 = v21;
  uint64_t v43 = *(void *)(v21 + 56);
  uint64_t v27 = v49;
  uint64_t v28 = v50;
  uint64_t v30 = v51;
  uint64_t v29 = v52;
  while (1)
  {
    v47(v27, v24, v28);
    sub_22E846648();
    (*v45)(v29, v46, v4);
    sub_22E831FC8(&qword_268615380, MEMORY[0x263F1F5B8]);
    char v31 = sub_22E846978();
    uint64_t v32 = *v26;
    (*v26)(v29, v4);
    v32(v30, v4);
    (*v44)(v27, v28);
    if ((v31 & 1) == 0) {
      break;
    }
    v24 += v43;
    if (!--v20)
    {
      swift_bridgeObjectRelease();
      uint64_t v14 = v39;
      a2 = v40;
      uint64_t v17 = v37;
      uint64_t v15 = v38;
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v35 = v39;
  uint64_t v34 = v40;
  v41(v40, v37, v39);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v34, 0, 1, v35);
}

uint64_t sub_22E82C780()
{
  uint64_t v0 = sub_22E8460A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v12 - v8;
  sub_22E846658();
  sub_22E8207D4((uint64_t)v9, (uint64_t)v7, &qword_2686150C0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v7, 1, v0) == 1)
  {
    sub_22E81C6A4((uint64_t)v9, &qword_2686150C0);
    char v10 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v7, v0);
    sub_22E831FC8((unint64_t *)&qword_2686150C8, MEMORY[0x263F07490]);
    char v10 = sub_22E846968() ^ 1;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v7 = v9;
  }
  sub_22E81C6A4((uint64_t)v7, &qword_2686150C0);
  return v10 & 1;
}

uint64_t sub_22E82C9AC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E82C9FC(&qword_268614FA8, &qword_2686150D8, MEMORY[0x263F1F3A0], a1);
}

uint64_t sub_22E82C9D4@<X0>(uint64_t a1@<X8>)
{
  return sub_22E82C9FC(&qword_268614FB0, &qword_268615090, MEMORY[0x263F1F358], a1);
}

uint64_t sub_22E82C9FC@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_22E83701C(a2, a1);
  sub_22E846AE8();
  sub_22E846B38();
  if (v15[4] == v15[0])
  {
    uint64_t v8 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 1, 1, v8);
  }
  else
  {
    char v10 = (void (*)(void *, void))sub_22E846B88();
    uint64_t v12 = v11;
    uint64_t v13 = a3(0);
    uint64_t v14 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(a4, v12, v13);
    v10(v15, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a4, 0, 1, v13);
  }
}

uint64_t sub_22E82CB80@<X0>(uint64_t a1@<X8>)
{
  return sub_22E82C9FC(&qword_268614FA0, &qword_268615390, MEMORY[0x263F1F3D8], a1);
}

uint64_t sub_22E82CBA8(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v2 = sub_22E846698();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v27 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E8460A8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v25 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v25 - v16;
  uint64_t v26 = v1;
  sub_22E846658();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_22E845FE8();
    sub_22E81C6A4((uint64_t)v7, &qword_2686150C0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v17, v7, v8);
  }
  uint64_t v18 = v28;
  char v19 = sub_22E846038();
  uint64_t v20 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v27, v26, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v18, v8);
  if (v19)
  {
    sub_22E846688();
    char v21 = sub_22E846038();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
    v22(v12, v8);
    v22(v15, v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v20, v2);
    v22(v17, v8);
  }
  else
  {
    unint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
    v23(v15, v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v20, v2);
    v23(v17, v8);
    char v21 = 0;
  }
  return v21 & 1;
}

uint64_t sub_22E82CEF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E8466A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F1F588])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F1F490];
  }
  else if (v8 == *MEMORY[0x263F1F598])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F1F4A0];
  }
  else if (v8 == *MEMORY[0x263F1F5B0])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F1F4C0];
  }
  else
  {
    if (v8 != *MEMORY[0x263F1F5A0])
    {
      uint64_t v14 = sub_22E846618();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    uint64_t v9 = (unsigned int *)MEMORY[0x263F1F4A8];
  }
  uint64_t v10 = *v9;
  uint64_t v11 = sub_22E846618();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t sub_22E82D148(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v56 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v49 = (char *)&v47 - v5;
  uint64_t v6 = sub_22E8460A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v53 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v52 = (char *)&v47 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v51 = (char *)&v47 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v50 = (char *)&v47 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F78);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150B8);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_22E8467A8();
  uint64_t v54 = *(void *)(v21 - 8);
  uint64_t v55 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  unint64_t v24 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v47 - v25;
  sub_22E8463A8();
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v17, 1, v27) == 1)
  {
    sub_22E81C6A4((uint64_t)v17, &qword_268614F78);
    uint64_t v29 = sub_22E846278();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v20, 1, 1, v29);
LABEL_7:
    sub_22E81C6A4((uint64_t)v20, &qword_2686150B8);
    char v34 = 1;
    return v34 & 1;
  }
  uint64_t v47 = a1;
  uint64_t v48 = v7;
  sub_22E822FA4(a1);
  if (v30)
  {
    uint64_t v31 = sub_22E846278();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v20, 1, 1, v31);
  }
  else
  {
    sub_22E846778();
    uint64_t v31 = sub_22E846278();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v20, 0, 1, v31);
  }
  uint64_t v32 = (uint64_t)v56;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v27);
  sub_22E846278();
  uint64_t v33 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v20, 1, v31) == 1) {
    goto LABEL_7;
  }
  sub_22E846248();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v31);
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v26, v24, v55);
  uint64_t v35 = (uint64_t)v49;
  sub_22E846798();
  uint64_t v36 = v48;
  uint64_t v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  if (v37(v35, 1, v6) == 1)
  {
    uint64_t v38 = v50;
    sub_22E845FD8();
    sub_22E81C6A4(v35, &qword_2686150C0);
  }
  else
  {
    uint64_t v38 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v50, v35, v6);
  }
  uint64_t v40 = v51;
  uint64_t v39 = v52;
  sub_22E846788();
  if (v37(v32, 1, v6) == 1)
  {
    sub_22E845FE8();
    sub_22E81C6A4(v32, &qword_2686150C0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v40, v32, v6);
  }
  uint64_t v41 = v47;
  char v42 = sub_22E846028();
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  v43(v39, v41, v6);
  uint64_t v44 = v53;
  v43(v53, (uint64_t)v40, v6);
  if (v42) {
    char v34 = sub_22E846038();
  }
  else {
    char v34 = 0;
  }
  uint64_t v45 = *(void (**)(char *, uint64_t))(v36 + 8);
  v45(v44, v6);
  v45(v39, v6);
  v45(v40, v6);
  v45(v38, v6);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v26, v55);
  return v34 & 1;
}

uint64_t static AppPrecipitationOutlookFormatter.outlook(for:at:in:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v185 = a4;
  uint64_t v186 = sub_22E846278();
  uint64_t v178 = *(void *)(v186 - 8);
  MEMORY[0x270FA5388](v186);
  uint64_t v187 = (char *)&v156 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v163 = (uint64_t)&v156 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v192 = sub_22E846378();
  uint64_t v188 = *(void *)(v192 - 8);
  MEMORY[0x270FA5388](v192);
  uint64_t v11 = (char *)&v156 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_22E846228();
  uint64_t v175 = *(void *)(v174 - 8);
  MEMORY[0x270FA5388](v174);
  v182 = (char *)&v156 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v171);
  uint64_t v161 = (uint64_t)&v156 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = (void (*)(char *, uint64_t))sub_22E8465F8();
  unint64_t v169 = *((void *)v181 - 1);
  MEMORY[0x270FA5388](v181);
  uint64_t v168 = (void (**)(char *, uint64_t))((char *)&v156 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_22E8460A8();
  uint64_t v179 = *(void *)(v15 - 8);
  uint64_t v180 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v189 = (char *)&v156 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v166 = (char *)&v156 - v18;
  uint64_t v190 = sub_22E846618();
  uint64_t v165 = *(void *)(v190 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v190);
  os_log_type_t v162 = (char *)&v156 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v191 = (char *)&v156 - v21;
  uint64_t v177 = sub_22E8464F8();
  uint64_t v176 = *(void *)(v177 - 8);
  MEMORY[0x270FA5388](v177);
  uint64_t v172 = (char *)&v156 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F80);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v25 = (char *)&v156 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F90);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v29 = (char *)&v156 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v156 - v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686152B0);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  uint64_t v35 = (char *)&v156 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = (void (**)(uint64_t, uint64_t))((char *)&v156 - v36);
  uint64_t v193 = (uint64_t)a2;
  v173 = (void (*)(char *, uint64_t))a3;
  sub_22E82A6F4(a1, a2, a3, (void (*)(char *, uint64_t))sub_22E83706C, (uint64_t)&v156 - v36);
  sub_22E8207D4((uint64_t)v37, (uint64_t)v35, &qword_2686152B0);
  uint64_t v38 = type metadata accessor for PrecipitationOutlook(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 48))(v35, 1, v38) != 1)
  {
    sub_22E81C6A4((uint64_t)v37, &qword_2686152B0);
    return sub_22E83286C((uint64_t)v35, v185, type metadata accessor for PrecipitationOutlook);
  }
  uint64_t v160 = v37;
  sub_22E81C6A4((uint64_t)v35, &qword_2686152B0);
  sub_22E846398();
  uint64_t v164 = a1;
  sub_22E8463B8();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = (uint64_t)v31;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v25, 1, v39) == 1)
  {
    sub_22E81C6A4((uint64_t)v25, &qword_268614F80);
    uint64_t v167 = MEMORY[0x263F8EE78];
    uint64_t v42 = v193;
  }
  else
  {
    uint64_t v42 = v193;
    uint64_t v167 = sub_22E8215E8(v193, 24, 0);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v25, v39);
  }
  uint64_t v44 = v176;
  uint64_t v45 = v173;
  uint64_t v46 = sub_22E8328D4(v164, v42, (uint64_t)v173);
  sub_22E8207D4(v41, (uint64_t)v29, &qword_268614F90);
  uint64_t v47 = v177;
  int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48))(v29, 1, v177);
  uint64_t v49 = v185;
  if (v48 == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22E81C6A4((uint64_t)v29, &qword_268614F90);
    goto LABEL_36;
  }
  uint64_t v158 = v46;
  uint64_t v50 = v172;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v172, v29, v47);
  uint64_t v170 = *(void *)(v167 + 16);
  if (!v170)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v50, v47);
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRelease();
LABEL_36:
    uint64_t v86 = v160;
    if (qword_268614E08 == -1)
    {
LABEL_37:
      uint64_t v104 = sub_22E8467F8();
      __swift_project_value_buffer(v104, (uint64_t)qword_268617B68);
      v105 = sub_22E8467D8();
      os_log_type_t v106 = sub_22E846BF8();
      if (os_log_type_enabled(v105, v106))
      {
        uint64_t v107 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v107 = 0;
        _os_log_impl(&dword_22E811000, v105, v106, "Forecasts are nil, so precipitation state is unknown.", v107, 2u);
        MEMORY[0x230FA6640](v107, -1, -1);
      }

      sub_22E81C6A4(v41, &qword_268614F90);
      sub_22E81C6A4((uint64_t)v86, &qword_2686152B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v179 + 16))(v49, v193, v180);
      (*(void (**)(uint64_t, void (*)(char *, uint64_t), uint64_t))(v175 + 16))(v49 + *(int *)(v38 + 36), v45, v174);
      uint64_t result = swift_storeEnumTagMultiPayload();
      *(void *)(v49 + *(int *)(v38 + 20)) = 0;
      *(unsigned char *)(v49 + *(int *)(v38 + 24)) = 1;
      *(void *)(v49 + *(int *)(v38 + 28)) = 0;
      return result;
    }
LABEL_62:
    swift_once();
    goto LABEL_37;
  }
  v159 = *(void (**)(char *, uint64_t))(v158 + 16);
  if (!v159)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v172, v47);
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  uint64_t v51 = v191;
  sub_22E8464E8();
  char isPrecipitationSbvg_0 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
  uint64_t v183 = *(void (**)(char *, uint64_t))(v165 + 8);
  uint64_t v184 = v165 + 8;
  v183(v51, v190);
  uint64_t v157 = (int *)v38;
  uint64_t v53 = v166;
  if ((isPrecipitationSbvg_0 & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v54 = v168;
  sub_22E8464C8();
  uint64_t v55 = v189;
  sub_22E8465E8();
  (*(void (**)(void, void *))(v169 + 8))(v54, v181);
  sub_22E846008();
  uint64_t v56 = *(void (**)(char *, uint64_t))(v179 + 8);
  uint64_t v57 = v55;
  uint64_t v58 = v41;
  uint64_t v59 = v180;
  v56(v57, v180);
  char v60 = sub_22E846028();
  uint64_t v61 = v59;
  uint64_t v41 = v58;
  v56(v53, v61);
  if ((v60 & 1) == 0)
  {
LABEL_18:
    if (qword_268614E08 != -1) {
      swift_once();
    }
    uint64_t v156 = v41;
    uint64_t v73 = sub_22E8467F8();
    uint64_t v161 = __swift_project_value_buffer(v73, (uint64_t)qword_268617B68);
    v74 = sub_22E8467D8();
    os_log_type_t v75 = sub_22E846C08();
    BOOL v76 = os_log_type_enabled(v74, v75);
    uint64_t v49 = v180;
    if (v76)
    {
      uint64_t v77 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v77 = 0;
      _os_log_impl(&dword_22E811000, v74, v75, "No preciptiation in currentWeather.", v77, 2u);
      MEMORY[0x230FA6640](v77, -1, -1);
    }

    uint64_t v78 = v166;
    sub_22E846008();
    char v79 = v182;
    sub_22E846218();
    char v80 = v189;
    sub_22E845FC8();
    (*(void (**)(char *, uint64_t))(v175 + 8))(v79, v174);
    char v81 = v78;
    sub_22E845FF8();
    double v83 = v82;
    char v84 = (char *)(v179 + 8);
    char v85 = *(void (**)(char *, uint64_t))(v179 + 8);
    v85(v80, v49);
    uint64_t v181 = v85;
    v182 = v84;
    v85(v81, v49);
    uint64_t v38 = 0;
    unint64_t v169 = v167 + ((*(unsigned __int8 *)(v188 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80));
    uint64_t v86 = (void (**)(uint64_t, uint64_t))(v188 + 16);
    uint64_t v168 = (void (**)(char *, uint64_t))(v188 + 8);
    uint64_t v45 = v181;
    while (1)
    {
      uint64_t v41 = v38 + 1;
      if (__OFADD__(v38, 1)) {
        break;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v188 + 16))(v11, v169 + *(void *)(v188 + 72) * v38, v192);
      uint64_t v87 = v191;
      sub_22E846368();
      char v88 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
      v183(v87, v190);
      uint64_t v89 = v189;
      sub_22E846308();
      sub_22E846008();
      v45(v89, v49);
      char v90 = sub_22E846028();
      v45(v81, v49);
      if (v88 & 1) != 0 && (v90)
      {
        uint64_t v91 = sub_22E8467D8();
        os_log_type_t v92 = sub_22E846BF8();
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v93 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v93 = 0;
          _os_log_impl(&dword_22E811000, v91, v92, "Hourly forecast indicates precipitation.", v93, 2u);
          uint64_t v94 = v93;
          uint64_t v49 = v180;
          MEMORY[0x230FA6640](v94, -1, -1);
        }

        sub_22E846308();
        sub_22E845FF8();
        double v96 = v95;
        v181(v81, v49);
        double v97 = fmax(v96, 3600.0);
        sub_22E8462F8();
        double v99 = v98;
        if (v98 >= 0.6 && v97 < 25200.0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v100 = sub_22E8467D8();
          os_log_type_t v101 = sub_22E846BF8();
          if (os_log_type_enabled(v100, v101))
          {
            uint64_t v102 = swift_slowAlloc();
            *(_DWORD *)uint64_t v102 = 134218240;
            double v194 = v99;
            sub_22E846CA8();
            *(_WORD *)(v102 + 12) = 2048;
            double v194 = v97;
            sub_22E846CA8();
            uint64_t v103 = ">= 60%% chance (%f) in the next six hours (%f).";
            goto LABEL_53;
          }
          goto LABEL_54;
        }
        if (v97 <= v83)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v100 = sub_22E8467D8();
          os_log_type_t v101 = sub_22E846BF8();
          if (os_log_type_enabled(v100, v101))
          {
            uint64_t v102 = swift_slowAlloc();
            *(_DWORD *)uint64_t v102 = 134218240;
            double v194 = v99;
            sub_22E846CA8();
            *(_WORD *)(v102 + 12) = 2048;
            double v194 = v97;
            sub_22E846CA8();
            uint64_t v103 = ">= 10%% chance (%f) before midnight tonight (%f).";
LABEL_53:
            _os_log_impl(&dword_22E811000, v100, v101, v103, (uint8_t *)v102, 0x16u);
            uint64_t v135 = v102;
            uint64_t v49 = v180;
            MEMORY[0x230FA6640](v135, -1, -1);
          }
LABEL_54:

          uint64_t v136 = v172;
          sub_22E8464E8();
          v137 = v162;
          sub_22E846368();
          uint64_t v138 = v163;
          sub_22E8306D8(v163);
          uint64_t v139 = v190;
          v183(v137, v190);
          uint64_t v140 = v179;
          (*(void (**)(char *, uint64_t, uint64_t))(v179 + 16))(v81, v193, v49);
          uint64_t v141 = (uint64_t)v189;
          sub_22E846308();
          char v142 = sub_22E82D148(v141);
          v181((char *)v141, v49);
          (*v168)(v11, v192);
          (*(void (**)(char *, uint64_t))(v176 + 8))(v136, v177);
          sub_22E81C6A4(v156, &qword_268614F90);
          sub_22E81C6A4((uint64_t)v160, &qword_2686152B0);
          uint64_t v143 = v157;
          uint64_t v144 = v185;
          uint64_t v145 = v185 + v157[8];
          uint64_t v146 = v145 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
          (*(void (**)(uint64_t, char *, uint64_t))(v165 + 32))(v145, v191, v139);
          sub_22E827C3C(v138, v146);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(uint64_t, void (*)(char *, uint64_t), uint64_t))(v175 + 16))(v144 + v143[9], v173, v174);
          uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v140 + 32))(v144, v81, v49);
          *(double *)(v144 + v143[5]) = v97;
          *(unsigned char *)(v144 + v143[6]) = v142 & 1;
          *(double *)(v144 + v143[7]) = v99;
          return result;
        }
      }
      (*v168)(v11, v192);
      ++v38;
      if (v41 == v170)
      {
        swift_bridgeObjectRelease();
        v108 = sub_22E8467D8();
        os_log_type_t v109 = sub_22E846C08();
        if (os_log_type_enabled(v108, v109))
        {
          v110 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v110 = 0;
          _os_log_impl(&dword_22E811000, v108, v109, "No preciptiation in hourly forecast.", v110, 2u);
          MEMORY[0x230FA6640](v110, -1, -1);
        }

        uint64_t v111 = 0;
        uint64_t v38 = v158 + ((*(unsigned __int8 *)(v178 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v178 + 80));
        uint64_t v86 = (void (**)(uint64_t, uint64_t))(v178 + 8);
        uint64_t v49 = 0x3FD3333333333333;
        uint64_t v41 = (uint64_t)v187;
        while (1)
        {
          uint64_t v45 = (void (*)(char *, uint64_t))(v111 + 1);
          if (__OFADD__(v111, 1)) {
            goto LABEL_61;
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 16))(v41, v38 + *(void *)(v178 + 72) * v111, v186);
          uint64_t v112 = v191;
          sub_22E846268();
          char v113 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
          uint64_t v114 = v112;
          uint64_t v41 = (uint64_t)v187;
          v183(v114, v190);
          sub_22E846238();
          if (v113)
          {
            double v116 = v115;
            if (v115 >= 0.3) {
              break;
            }
          }
          (*v86)(v41, v186);
          ++v111;
          if (v45 == v159)
          {
            swift_bridgeObjectRelease();
            uint64_t v147 = v185;
            uint64_t v148 = (uint64_t)v173;
            uint64_t v120 = v180;
            uint64_t v117 = v193;
LABEL_57:
            uint64_t v149 = (uint64_t)v160;
            uint64_t v150 = sub_22E8467D8();
            os_log_type_t v151 = sub_22E846C08();
            if (os_log_type_enabled(v150, v151))
            {
              uint64_t v152 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v152 = 0;
              _os_log_impl(&dword_22E811000, v150, v151, "No preciptiation in daily forecast, therefore it will not rain.", v152, 2u);
              v153 = v152;
              char v81 = v166;
              MEMORY[0x230FA6640](v153, -1, -1);
            }

            uint64_t v154 = v179;
            (*(void (**)(char *, uint64_t, uint64_t))(v179 + 16))(v81, v117, v120);
            (*(void (**)(char *, uint64_t))(v176 + 8))(v172, v177);
            sub_22E81C6A4(v156, &qword_268614F90);
            sub_22E81C6A4(v149, &qword_2686152B0);
            uint64_t v155 = v157;
            swift_storeEnumTagMultiPayload();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v175 + 16))(v147 + v155[9], v148, v174);
            uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v154 + 32))(v147, v81, v120);
            *(void *)(v147 + v155[5]) = 0x412A5E0000000000;
            *(unsigned char *)(v147 + v155[6]) = 1;
            *(void *)(v147 + v155[7]) = 0;
            return result;
          }
        }
        swift_bridgeObjectRelease();
        sub_22E846258();
        uint64_t v117 = v193;
        sub_22E845FF8();
        double v119 = v118;
        uint64_t v120 = v180;
        v181(v81, v180);
        double v121 = fmax(v119, 86400.0);
        if (v121 < 691200.0)
        {
          os_log_type_t v122 = sub_22E8467D8();
          os_log_type_t v123 = sub_22E846BF8();
          BOOL v124 = os_log_type_enabled(v122, v123);
          uint64_t v125 = v185;
          if (v124)
          {
            uint64_t v126 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v126 = 0;
            _os_log_impl(&dword_22E811000, v122, v123, "Daily forecast indicates precipitation.", v126, 2u);
            MEMORY[0x230FA6640](v126, -1, -1);
          }

          uint64_t v127 = v172;
          sub_22E8464E8();
          v128 = v162;
          v129 = v187;
          sub_22E846268();
          uint64_t v130 = v163;
          sub_22E8306D8(v163);
          uint64_t v131 = v190;
          v183(v128, v190);
          (*v86)((uint64_t)v129, v186);
          (*(void (**)(char *, uint64_t))(v176 + 8))(v127, v177);
          sub_22E81C6A4(v156, &qword_268614F90);
          sub_22E81C6A4((uint64_t)v160, &qword_2686152B0);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v179 + 16))(v125, v117, v120);
          uint64_t v132 = v157;
          uint64_t v133 = v125 + v157[8];
          uint64_t v134 = v133 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
          (*(void (**)(uint64_t, char *, uint64_t))(v165 + 32))(v133, v191, v131);
          sub_22E827C3C(v130, v134);
          swift_storeEnumTagMultiPayload();
          uint64_t result = (*(uint64_t (**)(uint64_t, void (*)(char *, uint64_t), uint64_t))(v175 + 16))(v125 + v132[9], v173, v174);
          *(double *)(v125 + v132[5]) = v121;
          *(unsigned char *)(v125 + v132[6]) = 1;
          *(double *)(v125 + v132[7]) = v116;
          return result;
        }
        (*v86)(v41, v186);
        uint64_t v147 = v185;
        uint64_t v148 = (uint64_t)v173;
        goto LABEL_57;
      }
    }
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_268614E08 != -1) {
    swift_once();
  }
  uint64_t v62 = sub_22E8467F8();
  __swift_project_value_buffer(v62, (uint64_t)qword_268617B68);
  uint64_t v63 = sub_22E8467D8();
  os_log_type_t v64 = sub_22E846BF8();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v65 = 0;
    _os_log_impl(&dword_22E811000, v63, v64, "CurrentWeather indicates precipitation.", v65, 2u);
    MEMORY[0x230FA6640](v65, -1, -1);
  }

  uint64_t v66 = v179;
  uint64_t v67 = v180;
  uint64_t v68 = v193;
  (*(void (**)(char *, uint64_t, uint64_t))(v179 + 16))(v53, v193, v180);
  LODWORD(v193) = sub_22E82D148(v68);
  uint64_t v69 = v191;
  uint64_t v70 = v172;
  sub_22E8464E8();
  uint64_t v71 = v161;
  sub_22E8306D8(v161);
  v183(v69, v190);
  (*(void (**)(char *, uint64_t))(v176 + 8))(v70, v177);
  sub_22E81C6A4(v41, &qword_268614F90);
  sub_22E81C6A4((uint64_t)v160, &qword_2686152B0);
  swift_storeEnumTagMultiPayload();
  uint64_t v72 = v157;
  (*(void (**)(uint64_t, void (*)(char *, uint64_t), uint64_t))(v175 + 16))(v49 + v157[9], v45, v174);
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v49, v53, v67);
  *(void *)(v49 + v72[5]) = 0;
  *(unsigned char *)(v49 + v72[6]) = v193 & 1;
  *(void *)(v49 + v72[7]) = 0;
  return sub_22E83286C(v71, v49 + v72[8], type metadata accessor for PrecipitationOutlook.State);
}

uint64_t static WidgetPrecipitationOutlookFormatter.outlook(for:at:in:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v149 = a4;
  uint64_t v131 = sub_22E846278();
  uint64_t v148 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  uint64_t v152 = (char *)v128 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v135 = (uint64_t)v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_22E8460A8();
  uint64_t v141 = *(void *)(v157 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v157);
  v153 = (char *)v128 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v154 = (char *)v128 - v12;
  uint64_t v158 = sub_22E846618();
  uint64_t v136 = *(void *)(v158 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v158);
  uint64_t v132 = (char *)v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v159 = (char *)v128 - v15;
  uint64_t v160 = sub_22E846378();
  uint64_t v155 = *(void *)(v160 - 8);
  MEMORY[0x270FA5388](v160);
  uint64_t v17 = (char *)v128 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_22E8464F8();
  uint64_t v140 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v138 = (char *)v128 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F80);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F90);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)v128 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v128 - v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686152B0);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v31 = (char *)v128 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v128 - v32;
  uint64_t v146 = a3;
  sub_22E82A6F4(a1, a2, a3, (void (*)(char *, uint64_t))sub_22E836FFC, (uint64_t)v128 - v32);
  sub_22E8207D4((uint64_t)v33, (uint64_t)v31, &qword_2686152B0);
  uint64_t v34 = type metadata accessor for PrecipitationOutlook(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 48))(v31, 1, v34) != 1)
  {
    sub_22E81C6A4((uint64_t)v33, &qword_2686152B0);
    return sub_22E83286C((uint64_t)v31, v149, type metadata accessor for PrecipitationOutlook);
  }
  uint64_t v134 = v33;
  uint64_t v156 = (uint64_t)a2;
  sub_22E81C6A4((uint64_t)v31, &qword_2686152B0);
  uint64_t v133 = v27;
  sub_22E846398();
  sub_22E8463B8();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FA8);
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v21, 1, v35) == 1)
  {
    sub_22E81C6A4((uint64_t)v21, &qword_268614F80);
    uint64_t v137 = MEMORY[0x263F8EE78];
    uint64_t v37 = v156;
  }
  else
  {
    uint64_t v37 = v156;
    uint64_t v137 = sub_22E8215E8(v156, 24, 0);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v35);
  }
  uint64_t v39 = v139;
  uint64_t v40 = v146;
  uint64_t v41 = sub_22E8328D4(a1, v37, v146);
  uint64_t v42 = v133;
  sub_22E8207D4((uint64_t)v133, (uint64_t)v25, &qword_268614F90);
  uint64_t v43 = v140;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v140 + 48))(v25, 1, v39) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22E81C6A4((uint64_t)v25, &qword_268614F90);
    uint64_t isPrecipitationSbvg_0 = (uint64_t)v134;
    uint64_t v45 = v149;
  }
  else
  {
    uint64_t v129 = v41;
    v128[2] = a1;
    uint64_t v46 = v138;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v138, v25, v39);
    uint64_t isPrecipitationSbvg_0 = (uint64_t)v134;
    uint64_t v147 = *(void *)(v137 + 16);
    if (v147)
    {
      uint64_t v45 = v149;
      uint64_t v130 = *(void *)(v129 + 16);
      if (v130)
      {
        if (qword_268614E08 != -1) {
          swift_once();
        }
        v128[0] = v34;
        uint64_t v47 = sub_22E8467F8();
        v128[1] = __swift_project_value_buffer(v47, (uint64_t)qword_268617B68);
        int v48 = sub_22E8467D8();
        os_log_type_t v49 = sub_22E846C08();
        if (os_log_type_enabled(v48, v49))
        {
          uint64_t isPrecipitationSbvg_0 = swift_slowAlloc();
          *(_WORD *)uint64_t isPrecipitationSbvg_0 = 0;
          _os_log_impl(&dword_22E811000, v48, v49, "No preciptiation in currentWeather,", (uint8_t *)isPrecipitationSbvg_0, 2u);
          MEMORY[0x230FA6640](isPrecipitationSbvg_0, -1, -1);
        }

        uint64_t v50 = 0;
        unint64_t v144 = v137 + ((*(unsigned __int8 *)(v155 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v155 + 80));
        uint64_t v34 = v155 + 16;
        os_log_type_t v151 = (void (**)(char *, uint64_t))(v136 + 8);
        uint64_t v145 = v141 + 8;
        uint64_t v143 = (void (**)(uint64_t, uint64_t))(v155 + 8);
        uint64_t v42 = (char *)(v141 + 8);
        while (1)
        {
          uint64_t v40 = v50 + 1;
          if (__OFADD__(v50, 1)) {
            break;
          }
          (*(void (**)(char *, unint64_t, uint64_t))(v155 + 16))(v17, v144 + *(void *)(v155 + 72) * v50, v160);
          uint64_t v51 = v159;
          sub_22E846368();
          uint64_t isPrecipitationSbvg_0 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
          uint64_t v150 = *v151;
          v150(v51, v158);
          uint64_t v52 = v153;
          uint64_t v45 = (uint64_t)v17;
          sub_22E846308();
          uint64_t v53 = v154;
          sub_22E846008();
          uint64_t v54 = *(void (**)(uint64_t, uint64_t))v42;
          uint64_t v55 = v157;
          (*(void (**)(char *, uint64_t))v42)(v52, v157);
          char v56 = sub_22E846028();
          char v142 = v54;
          v54((uint64_t)v53, v55);
          if (isPrecipitationSbvg_0 & 1) != 0 && (v56)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v57 = sub_22E8467D8();
            os_log_type_t v58 = sub_22E846BF8();
            if (os_log_type_enabled(v57, v58))
            {
              uint64_t v59 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v59 = 0;
              _os_log_impl(&dword_22E811000, v57, v58, "Hourly forecast indicates precipitation.", v59, 2u);
              MEMORY[0x230FA6640](v59, -1, -1);
            }

            char v60 = v154;
            uint64_t v61 = v45;
            sub_22E846308();
            uint64_t v62 = v156;
            sub_22E845FF8();
            double v64 = v63;
            uint64_t v65 = v157;
            uint64_t v66 = v142;
            v142((uint64_t)v60, v157);
            double v67 = fmax(v64, 3600.0);
            sub_22E8464E8();
            uint64_t v68 = v132;
            sub_22E846368();
            sub_22E8306D8(v135);
            uint64_t v69 = v158;
            v150(v68, v158);
            uint64_t v70 = v141;
            (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v60, v62, v65);
            uint64_t v71 = (uint64_t)v153;
            sub_22E846308();
            LODWORD(v156) = sub_22E82D148(v71);
            uint64_t v72 = v65;
            v66(v71, v65);
            sub_22E8462F8();
            uint64_t v74 = v73;
            (*v143)(v61, v160);
            (*(void (**)(char *, uint64_t))(v140 + 8))(v138, v139);
            sub_22E81C6A4((uint64_t)v133, &qword_268614F90);
            sub_22E81C6A4((uint64_t)v134, &qword_2686152B0);
            os_log_type_t v75 = (int *)v128[0];
            uint64_t v76 = v149;
            uint64_t v77 = v149 + *(int *)(v128[0] + 32);
            uint64_t v78 = v77 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
            (*(void (**)(uint64_t, char *, uint64_t))(v136 + 32))(v77, v159, v69);
            sub_22E827C3C(v135, v78);
            type metadata accessor for PrecipitationOutlook.State(0);
            swift_storeEnumTagMultiPayload();
            uint64_t v79 = v76 + v75[9];
            uint64_t v80 = sub_22E846228();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 16))(v79, v146, v80);
            uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v70 + 32))(v76, v60, v72);
            *(double *)(v76 + v75[5]) = v67;
            *(unsigned char *)(v76 + v75[6]) = v156 & 1;
            *(void *)(v76 + v75[7]) = v74;
            return result;
          }
          uint64_t v17 = (char *)v45;
          (*v143)(v45, v160);
          ++v50;
          uint64_t v37 = (uint64_t)v152;
          if (v40 == v147)
          {
            swift_bridgeObjectRelease();
            uint64_t v87 = sub_22E8467D8();
            os_log_type_t v88 = sub_22E846C08();
            BOOL v89 = os_log_type_enabled(v87, v88);
            uint64_t v42 = v138;
            if (v89)
            {
              char v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)char v90 = 0;
              _os_log_impl(&dword_22E811000, v87, v88, "No preciptiation in hourly forecast.", v90, 2u);
              MEMORY[0x230FA6640](v90, -1, -1);
            }

            uint64_t v91 = 0;
            uint64_t v45 = v129 + ((*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80));
            uint64_t v34 = v148 + 8;
            uint64_t v92 = v131;
            uint64_t isPrecipitationSbvg_0 = (uint64_t)v159;
            while (1)
            {
              uint64_t v40 = v91 + 1;
              if (__OFADD__(v91, 1)) {
                break;
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 16))(v37, v45 + *(void *)(v148 + 72) * v91, v92);
              sub_22E846268();
              uint64_t v93 = v92;
              char v94 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
              v150((char *)isPrecipitationSbvg_0, v158);
              if (v94)
              {
                swift_bridgeObjectRelease();
                v105 = sub_22E8467D8();
                os_log_type_t v106 = sub_22E846BF8();
                if (os_log_type_enabled(v105, v106))
                {
                  uint64_t v107 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v107 = 0;
                  _os_log_impl(&dword_22E811000, v105, v106, "Daily forecast indicates precipitation.", v107, 2u);
                  MEMORY[0x230FA6640](v107, -1, -1);
                }

                v108 = v154;
                sub_22E846258();
                uint64_t v109 = v156;
                sub_22E845FF8();
                double v111 = v110;
                uint64_t v112 = v157;
                v142((uint64_t)v108, v157);
                double v113 = fmax(v111, 86400.0);
                sub_22E8464E8();
                uint64_t v114 = v132;
                sub_22E846268();
                double v115 = v42;
                uint64_t v116 = v37;
                uint64_t v117 = v135;
                sub_22E8306D8(v135);
                uint64_t v118 = v158;
                v150(v114, v158);
                uint64_t v119 = v141;
                (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v108, v109, v112);
                sub_22E846238();
                uint64_t v121 = v120;
                (*(void (**)(uint64_t, uint64_t))v34)(v116, v131);
                (*(void (**)(char *, uint64_t))(v140 + 8))(v115, v139);
                sub_22E81C6A4((uint64_t)v133, &qword_268614F90);
                sub_22E81C6A4((uint64_t)v134, &qword_2686152B0);
                os_log_type_t v122 = (int *)v128[0];
                uint64_t v123 = v149;
                uint64_t v124 = v149 + *(int *)(v128[0] + 32);
                uint64_t v125 = v124 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
                (*(void (**)(uint64_t, char *, uint64_t))(v136 + 32))(v124, v159, v118);
                sub_22E827C3C(v117, v125);
                type metadata accessor for PrecipitationOutlook.State(0);
                swift_storeEnumTagMultiPayload();
                uint64_t v126 = v123 + v122[9];
                uint64_t v127 = sub_22E846228();
                (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 16))(v126, v146, v127);
                uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v119 + 32))(v123, v108, v112);
                *(double *)(v123 + v122[5]) = v113;
                *(unsigned char *)(v123 + v122[6]) = 1;
                *(void *)(v123 + v122[7]) = v121;
                return result;
              }
              (*(void (**)(uint64_t, uint64_t))v34)(v37, v93);
              ++v91;
              uint64_t v92 = v93;
              if (v40 == v130)
              {
                swift_bridgeObjectRelease();
                double v95 = sub_22E8467D8();
                os_log_type_t v96 = sub_22E846C08();
                if (os_log_type_enabled(v95, v96))
                {
                  double v97 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)double v97 = 0;
                  _os_log_impl(&dword_22E811000, v95, v96, "No preciptiation in daily forecast, therefore it will not rain.", v97, 2u);
                  MEMORY[0x230FA6640](v97, -1, -1);
                }

                uint64_t v98 = v141;
                double v99 = v154;
                uint64_t v100 = v157;
                (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v154, v156, v157);
                (*(void (**)(char *, uint64_t))(v140 + 8))(v42, v139);
                sub_22E81C6A4((uint64_t)v133, &qword_268614F90);
                sub_22E81C6A4((uint64_t)v134, &qword_2686152B0);
                os_log_type_t v101 = (int *)v128[0];
                uint64_t v102 = v149;
                type metadata accessor for PrecipitationOutlook.State(0);
                swift_storeEnumTagMultiPayload();
                uint64_t v103 = v102 + v101[9];
                uint64_t v104 = sub_22E846228();
                (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 16))(v103, v146, v104);
                uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v98 + 32))(v102, v99, v100);
                *(void *)(v102 + v101[5]) = 0x412A5E0000000000;
                *(unsigned char *)(v102 + v101[6]) = 1;
                *(void *)(v102 + v101[7]) = 0;
                return result;
              }
            }
            goto LABEL_42;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v45 = v149;
    }
    uint64_t v40 = v146;
  }
  if (qword_268614E08 != -1) {
LABEL_43:
  }
    swift_once();
  uint64_t v81 = sub_22E8467F8();
  __swift_project_value_buffer(v81, (uint64_t)qword_268617B68);
  double v82 = sub_22E8467D8();
  os_log_type_t v83 = sub_22E846BF8();
  if (os_log_type_enabled(v82, v83))
  {
    char v84 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v84 = 0;
    _os_log_impl(&dword_22E811000, v82, v83, "Forecasts are nil, so precipitation state is unknown.", v84, 2u);
    uint64_t v37 = v156;
    MEMORY[0x230FA6640](v84, -1, -1);
  }

  sub_22E81C6A4((uint64_t)v42, &qword_268614F90);
  sub_22E81C6A4(isPrecipitationSbvg_0, &qword_2686152B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 16))(v45, v37, v157);
  uint64_t v85 = v45 + *(int *)(v34 + 36);
  uint64_t v86 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 16))(v85, v40, v86);
  type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(void *)(v45 + *(int *)(v34 + 20)) = 0;
  *(unsigned char *)(v45 + *(int *)(v34 + 24)) = 1;
  *(void *)(v45 + *(int *)(v34 + 28)) = 0;
  return result;
}

uint64_t sub_22E8306D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = (char *)a1;
  uint64_t v1 = sub_22E846618();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v25 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615398);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v29 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - v14;
  WeatherCondition.simplePrecipitationCondtion()((uint64_t)&v24 - v14);
  uint64_t v16 = *MEMORY[0x263F1F520];
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v26(v13, v16, v1);
  uint64_t v27 = *(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56);
  v27(v13, 0, 1, v1);
  uint64_t v17 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_22E8207D4((uint64_t)v15, (uint64_t)v7, &qword_268615198);
  sub_22E8207D4((uint64_t)v13, v17, &qword_268615198);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v18((uint64_t)v7, 1, v1) == 1)
  {
    sub_22E81C6A4((uint64_t)v13, &qword_268615198);
    if (v18(v17, 1, v1) == 1)
    {
      sub_22E81C6A4((uint64_t)v7, &qword_268615198);
LABEL_8:
      sub_22E81C6A4((uint64_t)v15, &qword_268615198);
      uint64_t v22 = (uint64_t)v28;
      v26(v28, *MEMORY[0x263F1F4A8], v1);
      return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v27)(v22, 0, 1, v1);
    }
    goto LABEL_6;
  }
  sub_22E8207D4((uint64_t)v7, (uint64_t)v29, &qword_268615198);
  if (v18(v17, 1, v1) == 1)
  {
    sub_22E81C6A4((uint64_t)v13, &qword_268615198);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v29, v1);
LABEL_6:
    sub_22E81C6A4((uint64_t)v7, &qword_268615398);
    return sub_22E827C3C((uint64_t)v15, (uint64_t)v28);
  }
  uint64_t v19 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v25, v17, v1);
  sub_22E831FC8(&qword_2686153A0, MEMORY[0x263F1F528]);
  char v20 = sub_22E846978();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v2 + 8);
  v21(v19, v1);
  sub_22E81C6A4((uint64_t)v13, &qword_268615198);
  v21(v29, v1);
  sub_22E81C6A4((uint64_t)v7, &qword_268615198);
  if (v20) {
    goto LABEL_8;
  }
  return sub_22E827C3C((uint64_t)v15, (uint64_t)v28);
}

uint64_t _s25NanoWeatherKitUICompanion20PrecipitationOutlookV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = (int *)type metadata accessor for PrecipitationOutlook(0);
  uint64_t v4 = MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v41 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v41 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v41 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v41 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v41 - v23;
  char v25 = sub_22E846068();
  sub_22E832204(a1, (uint64_t)v24, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a2, (uint64_t)v22, type metadata accessor for PrecipitationOutlook);
  if ((v25 & 1) == 0)
  {
    sub_22E83226C((uint64_t)v22, type metadata accessor for PrecipitationOutlook);
    sub_22E83226C((uint64_t)v24, type metadata accessor for PrecipitationOutlook);
    sub_22E832204(a1, (uint64_t)v19, type metadata accessor for PrecipitationOutlook);
    sub_22E832204(a2, (uint64_t)v16, type metadata accessor for PrecipitationOutlook);
    uint64_t v30 = (uint64_t)v42;
    uint64_t v29 = (uint64_t)v43;
    goto LABEL_9;
  }
  uint64_t v26 = v44;
  double v27 = *(double *)&v24[v44[5]];
  sub_22E83226C((uint64_t)v24, type metadata accessor for PrecipitationOutlook);
  double v28 = *(double *)&v22[v26[5]];
  sub_22E83226C((uint64_t)v22, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a1, (uint64_t)v19, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a2, (uint64_t)v16, type metadata accessor for PrecipitationOutlook);
  uint64_t v30 = (uint64_t)v42;
  uint64_t v29 = (uint64_t)v43;
  if (v27 != v28)
  {
LABEL_9:
    sub_22E83226C((uint64_t)v16, type metadata accessor for PrecipitationOutlook);
    sub_22E83226C((uint64_t)v19, type metadata accessor for PrecipitationOutlook);
    sub_22E832204(a1, (uint64_t)v13, type metadata accessor for PrecipitationOutlook);
    sub_22E832204(a2, (uint64_t)v10, type metadata accessor for PrecipitationOutlook);
    goto LABEL_10;
  }
  uint64_t v31 = v44;
  double v32 = *(double *)&v19[v44[7]];
  sub_22E83226C((uint64_t)v19, type metadata accessor for PrecipitationOutlook);
  double v33 = *(double *)&v16[v31[7]];
  sub_22E83226C((uint64_t)v16, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a1, (uint64_t)v13, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a2, (uint64_t)v10, type metadata accessor for PrecipitationOutlook);
  if (v32 != v33)
  {
LABEL_10:
    sub_22E83226C((uint64_t)v10, type metadata accessor for PrecipitationOutlook);
    sub_22E83226C((uint64_t)v13, type metadata accessor for PrecipitationOutlook);
    sub_22E832204(a1, v30, type metadata accessor for PrecipitationOutlook);
    sub_22E832204(a2, v29, type metadata accessor for PrecipitationOutlook);
    goto LABEL_11;
  }
  char v34 = _s25NanoWeatherKitUICompanion20PrecipitationOutlookV5StateO21__derived_enum_equalsySbAE_AEtFZ_0((uint64_t)&v13[v44[8]], (uint64_t)&v10[v44[8]]);
  sub_22E83226C((uint64_t)v10, type metadata accessor for PrecipitationOutlook);
  sub_22E83226C((uint64_t)v13, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a1, v30, type metadata accessor for PrecipitationOutlook);
  sub_22E832204(a2, v29, type metadata accessor for PrecipitationOutlook);
  if ((v34 & 1) == 0)
  {
LABEL_11:
    char v39 = 0;
    goto LABEL_12;
  }
  uint64_t v35 = sub_22E8461C8();
  uint64_t v37 = v36;
  if (v35 == sub_22E8461C8() && v37 == v38)
  {
    swift_bridgeObjectRelease_n();
    char v39 = 1;
  }
  else
  {
    char v39 = sub_22E846EB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  sub_22E83226C(v29, type metadata accessor for PrecipitationOutlook);
  sub_22E83226C(v30, type metadata accessor for PrecipitationOutlook);
  return v39 & 1;
}

uint64_t _s25NanoWeatherKitUICompanion20PrecipitationOutlookV5StateO21__derived_enum_equalsySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v118 = (char *)a2;
  uint64_t v3 = sub_22E846618();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v116 = v3;
  uint64_t v117 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  double v113 = (void (*)(char *, uint64_t, uint64_t))((char *)&v102 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  double v110 = (char *)&v102 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  double v111 = (char *)&v102 - v10;
  MEMORY[0x270FA5388](v9);
  v105 = (char *)&v102 - v11;
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615398);
  uint64_t v12 = MEMORY[0x270FA5388](v115);
  uint64_t v108 = (uint64_t)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v107 = (uint64_t)&v102 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v106 = (uint64_t)&v102 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v104 = (uint64_t)&v102 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v112 = (uint64_t)&v102 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v103 = (uint64_t)&v102 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v114 = (uint64_t)&v102 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v109 = (uint64_t)&v102 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v102 - v29;
  MEMORY[0x270FA5388](v28);
  double v32 = (char *)&v102 - v31;
  uint64_t v33 = type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  uint64_t v36 = (char *)&v102 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  char v39 = (char *)&v102 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v102 - v40;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686153A8);
  uint64_t v43 = MEMORY[0x270FA5388](v42 - 8);
  uint64_t v45 = (char *)&v102 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = (uint64_t)&v45[*(int *)(v43 + 56)];
  sub_22E832204(a1, (uint64_t)v45, type metadata accessor for PrecipitationOutlook.State);
  sub_22E832204((uint64_t)v118, v46, type metadata accessor for PrecipitationOutlook.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_22E832204((uint64_t)v45, (uint64_t)v39, type metadata accessor for PrecipitationOutlook.State);
      uint64_t v64 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      uint64_t v65 = (uint64_t)&v39[v64];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_22E81C6A4((uint64_t)&v39[v64], &qword_268615198);
        (*(void (**)(char *, uint64_t))(v117 + 8))(v39, v116);
        goto LABEL_20;
      }
      uint64_t v118 = v45;
      uint64_t v66 = v46 + v64;
      uint64_t v67 = v117;
      uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t))(v117 + 32);
      uint64_t v69 = v46;
      uint64_t v70 = v116;
      v68(v111, v69, v116);
      uint64_t v71 = v109;
      sub_22E827C3C(v65, v109);
      sub_22E827C3C(v66, v114);
      sub_22E831FC8(&qword_2686153B0, MEMORY[0x263F1F528]);
      sub_22E8469E8();
      sub_22E8469E8();
      if (v121 == v119 && v122 == v120) {
        char v72 = 1;
      }
      else {
        char v72 = sub_22E846EB8();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v79 = *(void (**)(char *, uint64_t))(v67 + 8);
      v79(v39, v70);
      if ((v72 & 1) == 0)
      {
        sub_22E81C6A4(v114, &qword_268615198);
        sub_22E81C6A4(v71, &qword_268615198);
        v79(v111, v70);
        sub_22E83226C((uint64_t)v118, type metadata accessor for PrecipitationOutlook.State);
        return 0;
      }
      double v113 = v68;
      uint64_t v80 = v107;
      uint64_t v81 = v107 + *(int *)(v115 + 48);
      sub_22E8207D4(v71, v107, &qword_268615198);
      uint64_t v82 = v114;
      uint64_t v83 = v80;
      sub_22E8207D4(v114, v81, &qword_268615198);
      char v84 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48);
      if (v84(v83, 1, v70) == 1)
      {
        sub_22E81C6A4(v82, &qword_268615198);
        uint64_t v83 = v107;
        sub_22E81C6A4(v71, &qword_268615198);
        v79(v111, v70);
        if (v84(v81, 1, v70) == 1)
        {
          sub_22E81C6A4(v83, &qword_268615198);
          uint64_t v62 = (uint64_t)v118;
          goto LABEL_12;
        }
        goto LABEL_43;
      }
      uint64_t v92 = v103;
      sub_22E8207D4(v83, v103, &qword_268615198);
      if (v84(v81, 1, v70) == 1)
      {
        sub_22E81C6A4(v114, &qword_268615198);
        sub_22E81C6A4(v109, &qword_268615198);
        v79(v111, v70);
        v79((char *)v92, v70);
LABEL_43:
        sub_22E81C6A4(v83, &qword_268615398);
        uint64_t v62 = (uint64_t)v118;
LABEL_44:
        sub_22E83226C(v62, type metadata accessor for PrecipitationOutlook.State);
        return 0;
      }
      uint64_t v100 = v105;
      v113(v105, v81, v70);
      sub_22E831FC8(&qword_2686153A0, MEMORY[0x263F1F528]);
      char v101 = sub_22E846978();
      v79(v100, v70);
      sub_22E81C6A4(v114, &qword_268615198);
      sub_22E81C6A4(v109, &qword_268615198);
      v79(v111, v70);
      v79((char *)v92, v70);
      sub_22E81C6A4(v83, &qword_268615198);
      uint64_t v62 = (uint64_t)v118;
      if ((v101 & 1) == 0) {
        goto LABEL_44;
      }
      goto LABEL_12;
    case 2u:
      sub_22E832204((uint64_t)v45, (uint64_t)v36, type metadata accessor for PrecipitationOutlook.State);
      uint64_t v48 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48);
      os_log_type_t v49 = &v36[v48];
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        (*(void (**)(char *, uint64_t))(v117 + 8))(&v36[v48], v116);
        uint64_t v47 = (uint64_t)v36;
        goto LABEL_18;
      }
      uint64_t v50 = v46 + v48;
      uint64_t v51 = v112;
      sub_22E827C3C(v46, v112);
      uint64_t v52 = v116;
      uint64_t v53 = v117;
      uint64_t v54 = *(void (**)(void))(v117 + 32);
      uint64_t v55 = v110;
      ((void (*)(char *, char *, uint64_t))v54)(v110, v49, v116);
      ((void (*)(void, uint64_t, uint64_t))v54)(v113, v50, v52);
      uint64_t v56 = v108;
      uint64_t v57 = v108 + *(int *)(v115 + 48);
      sub_22E827C3C((uint64_t)v36, v108);
      uint64_t v58 = v51;
      uint64_t v59 = v56;
      sub_22E8207D4(v58, v57, &qword_268615198);
      char v60 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48);
      if (v60(v56, 1, v52) != 1)
      {
        uint64_t v77 = v104;
        sub_22E8207D4(v56, v104, &qword_268615198);
        if (v60(v57, 1, v52) != 1)
        {
          uint64_t v87 = v105;
          v54();
          sub_22E831FC8(&qword_2686153A0, MEMORY[0x263F1F528]);
          os_log_type_t v88 = v87;
          char v89 = sub_22E846978();
          uint64_t v78 = *(void (**)(char *, uint64_t))(v53 + 8);
          char v90 = v88;
          uint64_t v61 = (char *)v113;
          v78(v90, v52);
          v78((char *)v77, v52);
          sub_22E81C6A4(v59, &qword_268615198);
          uint64_t v55 = v110;
          if (v89) {
            goto LABEL_38;
          }
          v78(v61, v52);
LABEL_50:
          v78(v55, v52);
          uint64_t v85 = &qword_268615198;
          uint64_t v86 = v112;
          goto LABEL_51;
        }
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v77, v52);
        uint64_t v55 = v110;
LABEL_27:
        sub_22E81C6A4(v56, &qword_268615398);
        uint64_t v78 = *(void (**)(char *, uint64_t))(v53 + 8);
        v78((char *)v113, v52);
        goto LABEL_50;
      }
      if (v60(v57, 1, v52) != 1) {
        goto LABEL_27;
      }
      sub_22E81C6A4(v56, &qword_268615198);
      uint64_t v61 = (char *)v113;
LABEL_38:
      sub_22E831FC8(&qword_2686153B0, MEMORY[0x263F1F528]);
      sub_22E8469E8();
      sub_22E8469E8();
      if (v121 == v119 && v122 == v120)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v91 = *(void (**)(char *, uint64_t))(v53 + 8);
        v91(v61, v52);
        v91(v55, v52);
        sub_22E81C6A4(v112, &qword_268615198);
        goto LABEL_11;
      }
      char v93 = sub_22E846EB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v94 = *(void (**)(char *, uint64_t))(v53 + 8);
      v94(v61, v52);
      v94(v55, v52);
      sub_22E81C6A4(v112, &qword_268615198);
      if ((v93 & 1) == 0) {
        goto LABEL_52;
      }
LABEL_11:
      uint64_t v62 = (uint64_t)v45;
LABEL_12:
      sub_22E83226C(v62, type metadata accessor for PrecipitationOutlook.State);
      return 1;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_20;
      }
      goto LABEL_11;
    case 4u:
      if (swift_getEnumCaseMultiPayload() == 4) {
        goto LABEL_11;
      }
      goto LABEL_20;
    default:
      sub_22E832204((uint64_t)v45, (uint64_t)v41, type metadata accessor for PrecipitationOutlook.State);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v47 = (uint64_t)v41;
LABEL_18:
        sub_22E81C6A4(v47, &qword_268615198);
LABEL_20:
        sub_22E81C6A4((uint64_t)v45, &qword_2686153A8);
        return 0;
      }
      sub_22E827C3C(v46, (uint64_t)v32);
      uint64_t v73 = v106;
      uint64_t v74 = v106 + *(int *)(v115 + 48);
      sub_22E827C3C((uint64_t)v41, v106);
      sub_22E8207D4((uint64_t)v32, v74, &qword_268615198);
      uint64_t v75 = v116;
      uint64_t v76 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48);
      if (v76(v73, 1, v116) == 1)
      {
        sub_22E81C6A4((uint64_t)v32, &qword_268615198);
        if (v76(v74, 1, v75) == 1)
        {
          sub_22E81C6A4(v73, &qword_268615198);
          goto LABEL_11;
        }
      }
      else
      {
        sub_22E8207D4(v73, (uint64_t)v30, &qword_268615198);
        if (v76(v74, 1, v75) != 1)
        {
          uint64_t v95 = v73;
          uint64_t v96 = v117;
          double v97 = v105;
          (*(void (**)(char *, uint64_t, uint64_t))(v117 + 32))(v105, v74, v75);
          sub_22E831FC8(&qword_2686153A0, MEMORY[0x263F1F528]);
          char v98 = sub_22E846978();
          double v99 = *(void (**)(char *, uint64_t))(v96 + 8);
          v99(v97, v75);
          sub_22E81C6A4((uint64_t)v32, &qword_268615198);
          v99(v30, v75);
          sub_22E81C6A4(v95, &qword_268615198);
          if (v98) {
            goto LABEL_11;
          }
LABEL_52:
          sub_22E83226C((uint64_t)v45, type metadata accessor for PrecipitationOutlook.State);
          return 0;
        }
        sub_22E81C6A4((uint64_t)v32, &qword_268615198);
        (*(void (**)(char *, uint64_t))(v117 + 8))(v30, v75);
      }
      uint64_t v85 = &qword_268615398;
      uint64_t v86 = v73;
LABEL_51:
      sub_22E81C6A4(v86, v85);
      goto LABEL_52;
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_22E831F20()
{
  unint64_t result = qword_2686151E8;
  if (!qword_2686151E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686151E8);
  }
  return result;
}

unint64_t sub_22E831F74()
{
  unint64_t result = qword_2686151F0;
  if (!qword_2686151F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686151F0);
  }
  return result;
}

uint64_t sub_22E831FC8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22E832010()
{
  unint64_t result = qword_268615200;
  if (!qword_268615200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615200);
  }
  return result;
}

unint64_t sub_22E832064()
{
  unint64_t result = qword_268615208;
  if (!qword_268615208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615208);
  }
  return result;
}

unint64_t sub_22E8320B8()
{
  unint64_t result = qword_268615210;
  if (!qword_268615210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615210);
  }
  return result;
}

unint64_t sub_22E83210C()
{
  unint64_t result = qword_268615218;
  if (!qword_268615218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615218);
  }
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

unint64_t sub_22E8321B0()
{
  unint64_t result = qword_268615268;
  if (!qword_268615268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615268);
  }
  return result;
}

uint64_t sub_22E832204(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E83226C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22E8322CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261656C63 && a2 == 0xE500000000000000 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7469706963657270 && a2 == 0xED0000676E697461 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x696765426C6C6977 && a2 == 0xE90000000000006ELL || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x61656C436C6C6977 && a2 == 0xE900000000000072)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_22E846EB8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_22E832518(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_22E846EB8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_22E8325DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x67696C7961447369 && a2 == 0xEA00000000007468 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C696261626F7270 && a2 == 0xEB00000000797469 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_22E846EB8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656E6F5A656D6974 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_22E846EB8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_22E83286C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E8328D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a3;
  uint64_t v38 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614F78);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150B8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22E8460A8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v36 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v32 - v20;
  uint64_t v39 = a1;
  sub_22E8463A8();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268614FB0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  uint64_t v35 = v23;
  if (v34(v9, 1, v22) == 1)
  {
    sub_22E81C6A4((uint64_t)v9, &qword_268614F78);
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    uint64_t v26 = v38;
    uint64_t v27 = (uint64_t)v36;
LABEL_6:
    sub_22E845FD8();
    sub_22E81C6A4((uint64_t)v15, &qword_2686150C0);
    goto LABEL_7;
  }
  uint64_t v33 = v7;
  sub_22E82C9FC(&qword_268614FB0, &qword_268615090, MEMORY[0x263F1F358], (uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v22);
  uint64_t v24 = sub_22E846278();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v12, 1, v24) == 1)
  {
    sub_22E81C6A4((uint64_t)v12, &qword_2686150B8);
    uint64_t v7 = v33;
    goto LABEL_5;
  }
  sub_22E846258();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  int v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16);
  uint64_t v7 = v33;
  uint64_t v26 = v38;
  uint64_t v27 = (uint64_t)v36;
  if (v31 == 1) {
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v21, v15, v16);
LABEL_7:
  if (sub_22E846098()) {
    sub_22E846008();
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v27, v26, v16);
  }
  sub_22E8463A8();
  if (v34(v7, 1, v22) == 1)
  {
    sub_22E81C6A4((uint64_t)v7, &qword_268614F78);
    uint64_t v28 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v28 = sub_22E8218A4(v27, 10, 0);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v22);
  }
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v29(v27, v16);
  v29((uint64_t)v21, v16);
  return v28;
}

void *initializeBufferWithCopyOfBuffer for PrecipitationOutlook(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = sub_22E8460A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for PrecipitationOutlook.State(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v18 = sub_22E846618();
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, v18))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
      }
      else
      {
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
        v21(v10, v11, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
      }
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      v21(&v10[*(int *)(v28 + 48)], &v11[*(int *)(v28 + 48)], v18);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v22 = sub_22E846618();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
      v24(v10, v11, v22);
      uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      __dst = &v10[v25];
      uint64_t v26 = &v11[v25];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v26, 1, v22))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(__dst, v26, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        v24(__dst, v26, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
      }
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
LABEL_19:
        uint64_t v29 = a3[9];
        uint64_t v30 = (char *)a1 + v29;
        int v31 = (char *)a2 + v29;
        uint64_t v32 = sub_22E846228();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
        return a1;
      }
      uint64_t v14 = sub_22E846618();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v10, v11, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
      }
    }
    swift_storeEnumTagMultiPayload();
    goto LABEL_19;
  }
  uint64_t v17 = *a2;
  *a1 = *a2;
  a1 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t destroy for PrecipitationOutlook(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22E8460A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  type metadata accessor for PrecipitationOutlook.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v9 = sub_22E846618();
      uint64_t v10 = *(void *)(v9 - 8);
      int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9);
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      if (!v11) {
        v12(v5, v9);
      }
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      v12(v5 + *(int *)(v13 + 48), v9);
      break;
    case 1:
      uint64_t v14 = sub_22E846618();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v16(v5, v14);
      uint64_t v17 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v14)) {
        v16(v17, v14);
      }
      break;
    case 0:
      uint64_t v7 = sub_22E846618();
      uint64_t v8 = *(void *)(v7 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7)) {
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
      }
      break;
  }
  uint64_t v18 = a1 + *(int *)(a2 + 36);
  uint64_t v19 = sub_22E846228();
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8);
  return v20(v18, v19);
}

uint64_t initializeWithCopy for PrecipitationOutlook(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22E8460A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for PrecipitationOutlook.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v16 = sub_22E846618();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
        uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
      }
      else
      {
        uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
        v19(v9, v10, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      }
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      v19(&v9[*(int *)(v26 + 48)], &v10[*(int *)(v26 + 48)], v16);
      goto LABEL_16;
    case 1:
      uint64_t v20 = sub_22E846618();
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
      v22(v9, v10, v20);
      uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      __dst = &v9[v23];
      uint64_t v24 = &v10[v23];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v24, 1, v20))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(__dst, v24, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        v22(__dst, v24, v20);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
      }
      goto LABEL_16;
    case 0:
      uint64_t v13 = sub_22E846618();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v9, v10, v13);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
      }
LABEL_16:
      swift_storeEnumTagMultiPayload();
      goto LABEL_17;
  }
  memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
LABEL_17:
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  return a1;
}

uint64_t assignWithCopy for PrecipitationOutlook(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22E8460A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  if (a1 != a2)
  {
    uint64_t v7 = a3[8];
    uint64_t v8 = (char *)(a1 + v7);
    uint64_t v9 = (char *)(a2 + v7);
    sub_22E83226C(a1 + v7, type metadata accessor for PrecipitationOutlook.State);
    uint64_t v10 = type metadata accessor for PrecipitationOutlook.State(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v15 = sub_22E846618();
        uint64_t v16 = *(void *)(v15 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, v15))
        {
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v8, v9, *(void *)(*(void *)(v17 - 8) + 64));
          uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
        }
        else
        {
          uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
          v18(v8, v9, v15);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 1, v15);
        }
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
        v18(&v8[*(int *)(v25 + 48)], &v9[*(int *)(v25 + 48)], v15);
        goto LABEL_17;
      case 1:
        uint64_t v19 = sub_22E846618();
        uint64_t v20 = *(void *)(v19 - 8);
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
        v21(v8, v9, v19);
        uint64_t v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
        __dst = &v8[v22];
        uint64_t v23 = &v9[v22];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v23, 1, v19))
        {
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(__dst, v23, *(void *)(*(void *)(v24 - 8) + 64));
        }
        else
        {
          v21(__dst, v23, v19);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
        }
        goto LABEL_17;
      case 0:
        uint64_t v12 = sub_22E846618();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12))
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v9, v12);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
        }
LABEL_17:
        swift_storeEnumTagMultiPayload();
        goto LABEL_18;
    }
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
LABEL_18:
  uint64_t v26 = a3[9];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 24))(v27, v28, v29);
  return a1;
}

uint64_t initializeWithTake for PrecipitationOutlook(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22E8460A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for PrecipitationOutlook.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v16 = sub_22E846618();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
        uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
      }
      else
      {
        uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
        v19(v9, v10, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      }
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      v19(&v9[*(int *)(v26 + 48)], &v10[*(int *)(v26 + 48)], v16);
      goto LABEL_16;
    case 1:
      uint64_t v20 = sub_22E846618();
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
      v22(v9, v10, v20);
      uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      __dst = &v9[v23];
      uint64_t v24 = &v10[v23];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v24, 1, v20))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(__dst, v24, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        v22(__dst, v24, v20);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
      }
      goto LABEL_16;
    case 0:
      uint64_t v13 = sub_22E846618();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v9, v10, v13);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
      }
LABEL_16:
      swift_storeEnumTagMultiPayload();
      goto LABEL_17;
  }
  memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
LABEL_17:
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  return a1;
}

uint64_t assignWithTake for PrecipitationOutlook(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22E8460A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  if (a1 != a2)
  {
    uint64_t v8 = a3[8];
    uint64_t v9 = (char *)(a1 + v8);
    uint64_t v10 = (char *)(a2 + v8);
    sub_22E83226C(a1 + v8, type metadata accessor for PrecipitationOutlook.State);
    uint64_t v11 = type metadata accessor for PrecipitationOutlook.State(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v16 = sub_22E846618();
        uint64_t v17 = *(void *)(v16 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
        {
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
          uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
        }
        else
        {
          uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
          v19(v9, v10, v16);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
        }
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
        v19(&v9[*(int *)(v26 + 48)], &v10[*(int *)(v26 + 48)], v16);
        goto LABEL_17;
      case 1:
        uint64_t v20 = sub_22E846618();
        uint64_t v21 = *(void *)(v20 - 8);
        uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
        v22(v9, v10, v20);
        uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
        __dst = &v9[v23];
        uint64_t v24 = &v10[v23];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v24, 1, v20))
        {
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(__dst, v24, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          v22(__dst, v24, v20);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
        }
        goto LABEL_17;
      case 0:
        uint64_t v13 = sub_22E846618();
        uint64_t v14 = *(void *)(v13 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v9, v10, v13);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
        }
LABEL_17:
        swift_storeEnumTagMultiPayload();
        goto LABEL_18;
    }
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
LABEL_18:
  uint64_t v27 = a3[9];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrecipitationOutlook(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22E834814);
}

uint64_t sub_22E834814(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22E8460A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  if (a2 == 254)
  {
    unsigned int v11 = *(unsigned __int8 *)(a1 + a3[6]);
    if (v11 >= 2) {
      return ((v11 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  uint64_t v13 = type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v10 = a1 + a3[8];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    goto LABEL_8;
  }
  uint64_t v15 = sub_22E846228();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[9];
  return v16(v18, a2, v17);
}

uint64_t storeEnumTagSinglePayload for PrecipitationOutlook(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22E8349B4);
}

uint64_t sub_22E8349B4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_22E8460A8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unsigned int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[6]) = a2 + 1;
    return result;
  }
  uint64_t v13 = type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[8];
    unsigned int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = sub_22E846228();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[9];
  return v16(v18, a2, a2, v17);
}

uint64_t sub_22E834B30()
{
  uint64_t result = sub_22E8460A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PrecipitationOutlook.State(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_22E846228();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PrecipitationOutlook.State(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v13 = sub_22E846618();
        uint64_t v14 = *(void *)(v13 - 8);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v14 + 48))(a2, 1, v13))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
          uint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v14 + 16);
        }
        else
        {
          uint64_t v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v14 + 16);
          v16(a1, a2, v13);
          (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
        }
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
        v16((uint64_t *)((char *)a1 + *(int *)(v24 + 48)), (uint64_t *)((char *)a2 + *(int *)(v24 + 48)), v13);
        swift_storeEnumTagMultiPayload();
        break;
      case 1:
        uint64_t v17 = sub_22E846618();
        uint64_t v18 = *(void *)(v17 - 8);
        uint64_t v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v18 + 16);
        v19(a1, a2, v17);
        uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (char *)a2 + v20;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v22, 1, v17))
        {
          uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
        }
        else
        {
          v19((uint64_t *)v21, (uint64_t *)v22, v17);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
        }
        goto LABEL_15;
      case 0:
        uint64_t v8 = sub_22E846618();
        uint64_t v9 = *(void *)(v8 - 8);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
        {
          uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 16))(a1, a2, v8);
          (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
        }
LABEL_15:
        swift_storeEnumTagMultiPayload();
        return a1;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for PrecipitationOutlook.State(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v7 = sub_22E846618();
    uint64_t v15 = *(void *)(v7 - 8);
    int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a1, 1, v7);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    if (!v8) {
      v13(a1, v7);
    }
    uint64_t v9 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48);
    return ((uint64_t (*)(uint64_t, uint64_t))v13)(v9, v7);
  }
  else
  {
    if (result == 1)
    {
      uint64_t v10 = sub_22E846618();
      uint64_t v11 = *(void *)(v10 - 8);
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v16(a1, v10);
      uint64_t v12 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10);
      if (result) {
        return result;
      }
      uint64_t v5 = v12;
      uint64_t v6 = v10;
      uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))v16;
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t v3 = sub_22E846618();
      uint64_t v14 = *(void *)(v3 - 8);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(a1, 1, v3);
      if (result) {
        return result;
      }
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
      uint64_t v5 = a1;
      uint64_t v6 = v3;
    }
    return v4(v5, v6);
  }
}

char *initializeWithCopy for PrecipitationOutlook.State(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v10 = sub_22E846618();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
      }
      else
      {
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
        v13(a1, a2, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      v13(&a1[*(int *)(v21 + 48)], &a2[*(int *)(v21 + 48)], v10);
      goto LABEL_16;
    case 1:
      uint64_t v14 = sub_22E846618();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
      v16(a1, a2, v14);
      uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        v16(v18, v19, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
      }
      goto LABEL_16;
    case 0:
      uint64_t v7 = sub_22E846618();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithCopy for PrecipitationOutlook.State(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E83226C((uint64_t)a1, type metadata accessor for PrecipitationOutlook.State);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v10 = sub_22E846618();
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
        {
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
          uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
        }
        else
        {
          uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
          v13(a1, a2, v10);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
        }
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
        v13(&a1[*(int *)(v21 + 48)], &a2[*(int *)(v21 + 48)], v10);
        goto LABEL_17;
      case 1:
        uint64_t v14 = sub_22E846618();
        uint64_t v15 = *(void *)(v14 - 8);
        uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
        v16(a1, a2, v14);
        uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
        {
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
        }
        else
        {
          v16(v18, v19, v14);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
        }
        goto LABEL_17;
      case 0:
        uint64_t v7 = sub_22E846618();
        uint64_t v8 = *(void *)(v7 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
        {
          uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v8 + 16))(a1, a2, v7);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
        }
LABEL_17:
        swift_storeEnumTagMultiPayload();
        return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *initializeWithTake for PrecipitationOutlook.State(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v10 = sub_22E846618();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      }
      else
      {
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
        v13(a1, a2, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
      v13(&a1[*(int *)(v21 + 48)], &a2[*(int *)(v21 + 48)], v10);
      goto LABEL_16;
    case 1:
      uint64_t v14 = sub_22E846618();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v16(a1, a2, v14);
      uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        v16(v18, v19, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
      }
      goto LABEL_16;
    case 0:
      uint64_t v7 = sub_22E846618();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for PrecipitationOutlook.State(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E83226C((uint64_t)a1, type metadata accessor for PrecipitationOutlook.State);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v10 = sub_22E846618();
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
        {
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
          uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
        }
        else
        {
          uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
          v13(a1, a2, v10);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
        }
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
        v13(&a1[*(int *)(v21 + 48)], &a2[*(int *)(v21 + 48)], v10);
        goto LABEL_17;
      case 1:
        uint64_t v14 = sub_22E846618();
        uint64_t v15 = *(void *)(v14 - 8);
        uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
        v16(a1, a2, v14);
        uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
        {
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
        }
        else
        {
          v16(v18, v19, v14);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
        }
        goto LABEL_17;
      case 0:
        uint64_t v7 = sub_22E846618();
        uint64_t v8 = *(void *)(v7 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
        {
          uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
          memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
        }
LABEL_17:
        swift_storeEnumTagMultiPayload();
        return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PrecipitationOutlook.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PrecipitationOutlook.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_22E836260()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_22E836270()
{
  sub_22E836368();
  if (v1 <= 0x3F)
  {
    uint64_t v5 = *(void *)(v0 - 8) + 64;
    sub_22E846618();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v6 = &v4;
      swift_getTupleTypeLayout2();
      uint64_t v7 = &v3;
      swift_initEnumMetadataMultiPayload();
    }
  }
}

void sub_22E836368()
{
  if (!qword_2686152D8)
  {
    sub_22E846618();
    unint64_t v0 = sub_22E846C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2686152D8);
    }
  }
}

ValueMetadata *type metadata accessor for AppPrecipitationOutlookFormatter()
{
  return &type metadata for AppPrecipitationOutlookFormatter;
}

ValueMetadata *type metadata accessor for WidgetPrecipitationOutlookFormatter()
{
  return &type metadata for WidgetPrecipitationOutlookFormatter;
}

uint64_t getEnumTagSinglePayload for PrecipitationOutlook.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrecipitationOutlook.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x22E83653CLL);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.CodingKeys()
{
  return &type metadata for PrecipitationOutlook.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PrecipitationOutlook.State.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrecipitationOutlook.State.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E8366D0);
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

ValueMetadata *type metadata accessor for PrecipitationOutlook.State.CodingKeys()
{
  return &type metadata for PrecipitationOutlook.State.CodingKeys;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.State.UnknownCodingKeys()
{
  return &type metadata for PrecipitationOutlook.State.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.State.ClearCodingKeys()
{
  return &type metadata for PrecipitationOutlook.State.ClearCodingKeys;
}

uint64_t getEnumTagSinglePayload for PrecipitationOutlook.State.PrecipitatingCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PrecipitationOutlook.State.PrecipitatingCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x22E836818);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22E836840()
{
  return 0;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.State.PrecipitatingCodingKeys()
{
  return &type metadata for PrecipitationOutlook.State.PrecipitatingCodingKeys;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.State.WillBeginCodingKeys()
{
  return &type metadata for PrecipitationOutlook.State.WillBeginCodingKeys;
}

unsigned char *_s25NanoWeatherKitUICompanion20PrecipitationOutlookV5StateO19WillBeginCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x22E83693CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.State.WillClearCodingKeys()
{
  return &type metadata for PrecipitationOutlook.State.WillClearCodingKeys;
}

unint64_t sub_22E836978()
{
  unint64_t result = qword_2686152E0;
  if (!qword_2686152E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686152E0);
  }
  return result;
}

unint64_t sub_22E8369D0()
{
  unint64_t result = qword_2686152E8;
  if (!qword_2686152E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686152E8);
  }
  return result;
}

unint64_t sub_22E836A28()
{
  unint64_t result = qword_2686152F0;
  if (!qword_2686152F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686152F0);
  }
  return result;
}

unint64_t sub_22E836A80()
{
  unint64_t result = qword_2686152F8;
  if (!qword_2686152F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686152F8);
  }
  return result;
}

unint64_t sub_22E836AD8()
{
  unint64_t result = qword_268615300;
  if (!qword_268615300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615300);
  }
  return result;
}

unint64_t sub_22E836B30()
{
  unint64_t result = qword_268615308;
  if (!qword_268615308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615308);
  }
  return result;
}

unint64_t sub_22E836B88()
{
  unint64_t result = qword_268615310;
  if (!qword_268615310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615310);
  }
  return result;
}

unint64_t sub_22E836BE0()
{
  unint64_t result = qword_268615318;
  if (!qword_268615318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615318);
  }
  return result;
}

unint64_t sub_22E836C38()
{
  unint64_t result = qword_268615320;
  if (!qword_268615320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615320);
  }
  return result;
}

unint64_t sub_22E836C90()
{
  unint64_t result = qword_268615328;
  if (!qword_268615328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615328);
  }
  return result;
}

unint64_t sub_22E836CE8()
{
  unint64_t result = qword_268615330;
  if (!qword_268615330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615330);
  }
  return result;
}

unint64_t sub_22E836D40()
{
  unint64_t result = qword_268615338;
  if (!qword_268615338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615338);
  }
  return result;
}

unint64_t sub_22E836D98()
{
  unint64_t result = qword_268615340;
  if (!qword_268615340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615340);
  }
  return result;
}

unint64_t sub_22E836DF0()
{
  unint64_t result = qword_268615348;
  if (!qword_268615348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615348);
  }
  return result;
}

unint64_t sub_22E836E48()
{
  unint64_t result = qword_268615350;
  if (!qword_268615350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615350);
  }
  return result;
}

unint64_t sub_22E836EA0()
{
  unint64_t result = qword_268615358;
  if (!qword_268615358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615358);
  }
  return result;
}

unint64_t sub_22E836EF8()
{
  unint64_t result = qword_268615360;
  if (!qword_268615360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615360);
  }
  return result;
}

unint64_t sub_22E836F50()
{
  unint64_t result = qword_268615368;
  if (!qword_268615368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615368);
  }
  return result;
}

unint64_t sub_22E836FA8()
{
  unint64_t result = qword_268615370;
  if (!qword_268615370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615370);
  }
  return result;
}

uint64_t sub_22E836FFC()
{
  return sub_22E82C780() & 1;
}

uint64_t sub_22E83701C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22E83706C()
{
  return sub_22E836FFC() & 1;
}

uint64_t NHPWidgetDateFormatter.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22E837160(&OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_timeZone, MEMORY[0x263F079C8], a1);
}

uint64_t NHPWidgetDateFormatter.timeZone.setter(uint64_t a1)
{
  return sub_22E837210(a1, &OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_timeZone, MEMORY[0x263F079C8]);
}

uint64_t (*NHPWidgetDateFormatter.timeZone.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NHPWidgetDateFormatter.locale.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22E837160(&OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale, MEMORY[0x263F07690], a1);
}

uint64_t sub_22E837160@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  uint64_t v7 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, v6, v7);
}

uint64_t NHPWidgetDateFormatter.locale.setter(uint64_t a1)
{
  return sub_22E837210(a1, &OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale, MEMORY[0x263F07690]);
}

uint64_t sub_22E837210(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  uint64_t v7 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v6, a1, v7);
  return swift_endAccess();
}

uint64_t (*NHPWidgetDateFormatter.locale.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_22E837304()
{
  uint64_t v1 = sub_22E8460F8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v39 = (char *)&v32 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = sub_22E846118();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v37 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale;
  swift_beginAccess();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v36 = v19;
  uint64_t v34 = v20;
  v20(v18, v19, v13);
  sub_22E846108();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v38 = v13;
  uint64_t v33 = v21;
  v21(v18, v13);
  uint64_t v22 = *MEMORY[0x263F07680];
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v32(v10, v22, v1);
  unint64_t v23 = sub_22E838248();
  sub_22E8469E8();
  unint64_t v35 = v23;
  sub_22E8469E8();
  uint64_t v40 = v5;
  if (v43 == v41 && v44 == v42) {
    char v24 = 1;
  }
  else {
    char v24 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v2 + 8);
  v25(v10, v1);
  v25(v12, v1);
  if (v24)
  {
    char v26 = 1;
  }
  else
  {
    uint64_t v27 = v37;
    uint64_t v28 = v38;
    v34(v37, v36, v38);
    uint64_t v29 = v39;
    sub_22E846108();
    v33(v27, v28);
    uint64_t v30 = v40;
    v32(v40, *MEMORY[0x263F07678], v1);
    sub_22E8469E8();
    sub_22E8469E8();
    if (v43 == v41 && v44 == v42) {
      char v26 = 1;
    }
    else {
      char v26 = sub_22E846EB8();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v25(v30, v1);
    v25(v29, v1);
  }
  return v26 & 1;
}

uint64_t sub_22E83772C(char *a1, char *a2)
{
  uint64_t v33 = a2;
  uint64_t v34 = a1;
  uint64_t v30 = sub_22E846228();
  uint64_t v32 = *(void *)(v30 - 8);
  uint64_t v4 = v32;
  MEMORY[0x270FA5388](v30);
  unint64_t v35 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_22E846118();
  uint64_t v6 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateFormatter;
  *(void *)(v2 + v9) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateComponentsFormatter;
  *(void *)(v2 + v10) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  uint64_t v29 = v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_timeZone;
  uint64_t v27 = v2;
  int v31 = *(void (**)(void))(v4 + 16);
  v31();
  uint64_t v11 = (char *)(v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale);
  uint64_t v12 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 16);
  uint64_t v13 = v36;
  v12(v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale, a2, v36);
  uint64_t v28 = OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateFormatter;
  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateFormatter);
  swift_beginAccess();
  v12((uint64_t)v8, v11, v13);
  id v15 = v14;
  uint64_t v16 = (void *)sub_22E8460D8();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v8, v13);
  objc_msgSend(v15, sel_setLocale_, v16);

  uint64_t v18 = v27;
  uint64_t v19 = *(void **)(v27 + v28);
  uint64_t v20 = v29;
  swift_beginAccess();
  uint64_t v21 = v35;
  uint64_t v22 = v20;
  uint64_t v23 = v30;
  ((void (*)(char *, uint64_t, uint64_t))v31)(v35, v22, v30);
  char v24 = (void *)sub_22E8461E8();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v32 + 8);
  v25(v21, v23);
  objc_msgSend(v19, sel_setTimeZone_, v24);

  v17(v33, v36);
  v25(v34, v23);
  return v18;
}

Swift::String __swiftcall NHPWidgetDateFormatter.relativeTimeString(for:style:)(Swift::Double a1, NSDateComponentsFormatterUnitsStyle style)
{
  double v5 = 86400.0;
  uint64_t v6 = 16;
  if (a1 < 86400.0)
  {
    uint64_t v6 = 32;
    double v5 = 3600.0;
  }
  if (a1 >= 3600.0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 64;
  }
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateComponentsFormatter);
  if (a1 >= 3600.0) {
    double v9 = v5;
  }
  else {
    double v9 = 60.0;
  }
  objc_msgSend(v8, sel_setAllowedUnits_, v7, v5);
  objc_msgSend(v8, sel_setUnitsStyle_, style);
  id v10 = objc_msgSend(v8, sel_stringFromTimeInterval_, v9 * ceil(a1 / v9));
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_22E846998();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0xE000000000000000;
  }
  uint64_t v15 = v12;
  uint64_t v16 = (void *)v14;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

uint64_t NHPWidgetDateFormatter.absoluteTimeString(for:withChange:)(double a1)
{
  if (a1 >= 3600.0)
  {
    if (a1 >= 86400.0)
    {
      sub_22E837304();
      uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateFormatter);
      if (a1 >= 604800.0)
      {
        char v26 = (void *)sub_22E846988();
        objc_msgSend(v8, sel_setLocalizedDateFormatFromTemplate_, v26);

        double v5 = (void *)sub_22E846018();
        id v6 = objc_msgSend(v8, sel_stringFromDate_, v5);
        goto LABEL_12;
      }
      double v9 = (void *)sub_22E846988();
      objc_msgSend(v8, sel_setDateFormat_, v9);

      id v10 = (void *)sub_22E846018();
      id v11 = objc_msgSend(v8, sel_stringFromDate_, v10);

      sub_22E846998();
      sub_22E819544();
      uint64_t v12 = sub_22E846CC8();
    }
    else
    {
      sub_22E837304();
      uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateFormatter);
      unint64_t v13 = (void *)sub_22E846988();
      objc_msgSend(v7, sel_setDateFormat_, v13);

      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v14 = (id)qword_268615028;
      uint64_t v15 = (void *)sub_22E846988();
      uint64_t v16 = (void *)sub_22E846988();
      uint64_t v17 = (void *)sub_22E846988();
      id v18 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, v16, v17);

      sub_22E846998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_22E848DA0;
      uint64_t v20 = (void *)sub_22E846018();
      id v21 = objc_msgSend(v7, sel_stringFromDate_, v20);

      uint64_t v22 = sub_22E846998();
      uint64_t v24 = v23;

      *(void *)(v19 + 56) = MEMORY[0x263F8D310];
      *(void *)(v19 + 64) = sub_22E826E64();
      *(void *)(v19 + 32) = v22;
      *(void *)(v19 + 40) = v24;
      uint64_t v12 = sub_22E8469A8();
    }
    swift_bridgeObjectRelease();
    return v12;
  }
  sub_22E837304();
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_dateFormatter);
  uint64_t v4 = (void *)sub_22E846988();
  objc_msgSend(v3, sel_setDateFormat_, v4);

  double v5 = (void *)sub_22E846018();
  id v6 = objc_msgSend(v3, sel_stringFromDate_, v5);
LABEL_12:
  id v27 = v6;

  uint64_t v28 = sub_22E846998();
  return v28;
}

uint64_t NHPWidgetDateFormatter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_timeZone;
  uint64_t v2 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale;
  uint64_t v4 = sub_22E846118();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t NHPWidgetDateFormatter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_timeZone;
  uint64_t v2 = sub_22E846228();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion22NHPWidgetDateFormatter_locale;
  uint64_t v4 = sub_22E846118();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_22E838118()
{
  return type metadata accessor for NHPWidgetDateFormatter();
}

uint64_t type metadata accessor for NHPWidgetDateFormatter()
{
  uint64_t result = qword_2686153C8;
  if (!qword_2686153C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22E83816C()
{
  uint64_t result = sub_22E846228();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_22E846118();
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

unint64_t sub_22E838248()
{
  unint64_t result = qword_2686153D8;
  if (!qword_2686153D8)
  {
    sub_22E8460F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686153D8);
  }
  return result;
}

uint64_t TemperatureSpectrumModel.colors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TemperatureSpectrumModel.stops.getter()
{
  return swift_bridgeObjectRetain();
}

char *static TemperatureColor.colorForTemperature(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_celsius);
  sub_22E845EE8();

  sub_22E845EB8();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  unint64_t v13 = _s25NanoWeatherKitUICompanion13ColorSpectrumV13colorForValueySo7UIColorCSdF_0(v12, v11);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t static TemperatureColor.colorSpectrumBetween(low:high:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615138);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  double v11 = (char *)&v21 - v10;
  uint64_t v12 = self;
  id v13 = objc_msgSend(v12, sel_celsius);
  sub_22E845EE8();

  sub_22E845EB8();
  double v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v11, v5);
  id v17 = objc_msgSend(v12, sel_celsius);
  sub_22E845EE8();

  sub_22E845EB8();
  double v19 = v18;
  v16(v9, v5);
  return static TemperatureColor.colorSpectrumBetween(low:high:)(a3, v21, v15, v19);
}

uint64_t static TemperatureColor.colorSpectrumBetween(low:high:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686153E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22E848DA0;
  *(void *)(v8 + 32) = 0;
  id v9 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
  uint64_t v10 = v9(a1, a2);
  double v11 = _s25NanoWeatherKitUICompanion13ColorSpectrumV13colorForValueySo7UIColorCSdF_0(v10, a3);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 40) = v11;
  if (a3 == a4)
  {
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v30 = a1;
    uint64_t v13 = v9(a1, a2);
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      double v15 = (id *)(v13 + 40);
      do
      {
        double v17 = *((double *)v15 - 1);
        if (v17 >= a3 && v17 <= a4)
        {
          double v19 = fmin((v17 - a3) / (a4 - a3), 1.0);
          if (v19 < 0.0) {
            double v20 = 0.0;
          }
          else {
            double v20 = v19;
          }
          unint64_t v21 = *(void *)(v8 + 16);
          unint64_t v22 = *(void *)(v8 + 24);
          id v23 = *v15;
          if (v21 >= v22 >> 1) {
            uint64_t v8 = (uint64_t)sub_22E838D10((void *)(v22 > 1), v21 + 1, 1, (void *)v8, &qword_2686153E0, (void (*)(void, int64_t, void *, void *))sub_22E8391A8);
          }
          *(void *)(v8 + 16) = v21 + 1;
          uint64_t v16 = v8 + 16 * v21;
          *(double *)(v16 + 32) = v20;
          *(void *)(v16 + 40) = v23;
        }
        v15 += 2;
        --v14;
      }
      while (v14);
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = v30;
  }
  uint64_t v24 = v9(v12, a2);
  uint64_t v25 = _s25NanoWeatherKitUICompanion13ColorSpectrumV13colorForValueySo7UIColorCSdF_0(v24, a4);
  swift_bridgeObjectRelease();
  unint64_t v27 = *(void *)(v8 + 16);
  unint64_t v26 = *(void *)(v8 + 24);
  if (v27 >= v26 >> 1) {
    uint64_t v8 = (uint64_t)sub_22E838D10((void *)(v26 > 1), v27 + 1, 1, (void *)v8, &qword_2686153E0, (void (*)(void, int64_t, void *, void *))sub_22E8391A8);
  }
  *(void *)(v8 + 16) = v27 + 1;
  uint64_t v28 = v8 + 16 * v27;
  *(void *)(v28 + 32) = 0x3FF0000000000000;
  *(void *)(v28 + 40) = v25;
  return sub_22E838E2C(v8);
}

double static TemperatureColor.percentageBetween(low:high:current:)(double a1, double a2, double a3)
{
  double result = fmin((a3 - a1) / (a2 - a1), 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

id sub_22E838858()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615100);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22E848DE0;
  unint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_systemCyanColor);
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = v2;
  id v3 = objc_msgSend(v1, sel_systemGreenColor);
  *(void *)(v0 + 48) = 0x4024000000000000;
  *(void *)(v0 + 56) = v3;
  id v4 = objc_msgSend(v1, sel_systemYellowColor);
  *(void *)(v0 + 64) = 0x4034000000000000;
  *(void *)(v0 + 72) = v4;
  id result = objc_msgSend(v1, sel_systemRedColor);
  *(void *)(v0 + 80) = 0x403E000000000000;
  *(void *)(v0 + 88) = result;
  static ComplicationTemperatureColor.temperatureColorSpectrum = v0;
  return result;
}

uint64_t *ComplicationTemperatureColor.temperatureColorSpectrum.unsafeMutableAddressor()
{
  if (qword_268614E68 != -1) {
    swift_once();
  }
  return &static ComplicationTemperatureColor.temperatureColorSpectrum;
}

uint64_t static ComplicationTemperatureColor.temperatureColorSpectrum.getter()
{
  return sub_22E838C30(&qword_268614E68);
}

uint64_t sub_22E83899C(uint64_t a1, uint64_t a2)
{
  return sub_22E838CA0(a1, a2, &qword_268614E68);
}

uint64_t sub_22E8389C0()
{
  uint64_t result = sub_22E8389E0();
  static AppTemperatureColor.temperatureColorSpectrum = result;
  return result;
}

uint64_t sub_22E8389E0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615100);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22E848DF0;
  sub_22E824E90();
  sub_22E846818();
  uint64_t v1 = sub_22E846C58();
  *(void *)(v0 + 32) = 0xC0551C28F5C28F5CLL;
  *(void *)(v0 + 40) = v1;
  sub_22E846818();
  uint64_t v2 = sub_22E846C58();
  *(void *)(v0 + 48) = 0xC0498D70A3D70A3DLL;
  *(void *)(v0 + 56) = v2;
  sub_22E846818();
  uint64_t v3 = sub_22E846C58();
  *(void *)(v0 + 64) = 0xC031C51EB851EB84;
  *(void *)(v0 + 72) = v3;
  sub_22E846818();
  uint64_t v4 = sub_22E846C58();
  *(void *)(v0 + 80) = 0xBFF1A3D70A3D7080;
  *(void *)(v0 + 88) = v4;
  sub_22E846818();
  uint64_t v5 = sub_22E846C58();
  *(void *)(v0 + 96) = 0x402404B17E4B17E8;
  *(void *)(v0 + 104) = v5;
  sub_22E846818();
  uint64_t v6 = sub_22E846C58();
  *(void *)(v0 + 112) = 0x40351EEEEEEEEEF0;
  *(void *)(v0 + 120) = v6;
  sub_22E846818();
  uint64_t v7 = sub_22E846C58();
  *(void *)(v0 + 128) = 0x403AAD3A06D3A070;
  *(void *)(v0 + 136) = v7;
  sub_22E846818();
  uint64_t v8 = sub_22E846C58();
  *(void *)(v0 + 144) = 0x4042E4E81B4E81B4;
  *(void *)(v0 + 152) = v8;
  sub_22E846818();
  uint64_t v9 = sub_22E846C58();
  *(void *)(v0 + 160) = 0x4048733333333334;
  *(void *)(v0 + 168) = v9;
  return v0;
}

uint64_t *AppTemperatureColor.temperatureColorSpectrum.unsafeMutableAddressor()
{
  if (qword_268614E70 != -1) {
    swift_once();
  }
  return &static AppTemperatureColor.temperatureColorSpectrum;
}

uint64_t static AppTemperatureColor.temperatureColorSpectrum.getter()
{
  return sub_22E838C30(&qword_268614E70);
}

uint64_t sub_22E838C30(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_22E838C7C(uint64_t a1, uint64_t a2)
{
  return sub_22E838CA0(a1, a2, &qword_268614E70);
}

uint64_t sub_22E838CA0(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

void *sub_22E838CF0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_22E838D10(a1, a2, a3, a4, &qword_268615100, (void (*)(void, int64_t, void *, void *))sub_22E8392B4);
}

void *sub_22E838D10(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, void (*a6)(void, int64_t, void *, void *))
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  int64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v10 = a2;
    }
LABEL_8:
    int64_t v11 = a4[2];
    if (v10 <= v11) {
      int64_t v12 = a4[2];
    }
    else {
      int64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v13 = (void *)swift_allocObject();
      int64_t v14 = _swift_stdlib_malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 17;
      }
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 4);
      uint64_t v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      uint64_t v16 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[2 * v11 + 4]) {
          memmove(v16, a4 + 4, 16 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    a6(0, v11, v16, a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_22E838E2C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    sub_22E846D88();
    uint64_t v4 = (uint64_t *)(a1 + 32);
    uint64_t v5 = (void **)(a1 + 40);
    int64_t v6 = v2;
    do
    {
      uint64_t v7 = *v5;
      v5 += 2;
      id v8 = v7;
      sub_22E846D68();
      sub_22E846D98();
      sub_22E846DA8();
      sub_22E846D78();
      --v6;
    }
    while (v6);
    sub_22E81AF38(0, v2, 0);
    unint64_t v9 = *(void *)(v3 + 16);
    do
    {
      uint64_t v10 = *v4;
      unint64_t v11 = *(void *)(v3 + 24);
      if (v9 >= v11 >> 1) {
        sub_22E81AF38(v11 > 1, v9 + 1, 1);
      }
      *(void *)(v3 + 16) = v9 + 1;
      *(void *)(v3 + 8 * v9 + 32) = v10;
      v4 += 2;
      ++v9;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t destroy for TemperatureSpectrumModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s25NanoWeatherKitUICompanion24TemperatureSpectrumModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TemperatureSpectrumModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for TemperatureSpectrumModel(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TemperatureSpectrumModel(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TemperatureSpectrumModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TemperatureSpectrumModel()
{
  return &type metadata for TemperatureSpectrumModel;
}

ValueMetadata *type metadata accessor for ComplicationTemperatureColor()
{
  return &type metadata for ComplicationTemperatureColor;
}

ValueMetadata *type metadata accessor for AppTemperatureColor()
{
  return &type metadata for AppTemperatureColor;
}

uint64_t sub_22E8391A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686153E8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E8392B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_22E846DC8();
  __break(1u);
  return result;
}

uint64_t sub_22E8393A8()
{
  type metadata accessor for PrecipitationChanceFormatter();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_overrideLocale;
  uint64_t v2 = sub_22E846118();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(void *)(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_maximumPercentage) = 0x3FF0000000000000;
  uint64_t v3 = OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_percentFormatter;
  if (qword_268614E88 != -1) {
    swift_once();
  }
  *(void *)(v0 + v3) = static PercentFormatter.shared;
  static PrecipitationChanceFormatter.shared = v0;
  return swift_retain();
}

uint64_t *PrecipitationChanceFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E78 != -1) {
    swift_once();
  }
  return &static PrecipitationChanceFormatter.shared;
}

uint64_t static PrecipitationChanceFormatter.shared.getter()
{
  if (qword_268614E78 != -1) {
    swift_once();
  }
  return swift_retain();
}

void sub_22E839540()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E846118();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_overrideLocale;
  swift_beginAccess();
  sub_22E8207D4(v11, (uint64_t)v3, &qword_268615030);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_22E81C6A4((uint64_t)v3, &qword_268615030);
    id v12 = objc_retain(*(id *)(*(void *)(v0
                                        + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_percentFormatter)
                            + 16));
    sub_22E8460E8();
    uint64_t v13 = (void *)sub_22E8460D8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    objc_msgSend(v12, sel_setLocale_, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    id v14 = objc_retain(*(id *)(*(void *)(v0
                                        + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_percentFormatter)
                            + 16));
    uint64_t v15 = (void *)sub_22E8460D8();
    objc_msgSend(v14, sel_setLocale_, v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
}

uint64_t PrecipitationChanceFormatter.overrideLocale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_overrideLocale;
  swift_beginAccess();
  return sub_22E8207D4(v3, a1, &qword_268615030);
}

uint64_t PrecipitationChanceFormatter.overrideLocale.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_overrideLocale;
  swift_beginAccess();
  sub_22E839878(a1, v3);
  swift_endAccess();
  sub_22E839540();
  return sub_22E81C6A4(a1, &qword_268615030);
}

uint64_t sub_22E839878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void (*PrecipitationChanceFormatter.overrideLocale.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22E839940;
}

void sub_22E839940(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_22E839540();
  }
}

Swift::String __swiftcall PrecipitationChanceFormatter.demoPercent(chance:isSignificant:)(Swift::Double_optional chance, Swift::Bool_optional isSignificant)
{
  if (isSignificant.value)
  {
    if (qword_268614E40 == -1) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  uint64_t v3 = *(void **)(*(void *)(v2
                            + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_percentFormatter)
                + 16);
  uint64_t v4 = (void *)sub_22E846988();
  objc_msgSend(v3, sel_setPercentSymbol_, v4);

  uint64_t v5 = (void *)sub_22E846A18();
  id v6 = objc_msgSend(v3, sel_stringForObjectValue_, v5);

  if (!v6)
  {
    if (qword_268614E40 == -1)
    {
LABEL_6:
      id v7 = (id)qword_268615028;
      id v8 = (void *)sub_22E846988();
      uint64_t v9 = (void *)sub_22E846988();
      uint64_t v10 = (void *)sub_22E846988();
      id v6 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, v9, v10);

      goto LABEL_7;
    }
LABEL_8:
    swift_once();
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v11 = sub_22E846998();
  uint64_t v13 = v12;

  uint64_t v14 = v11;
  uint64_t v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

uint64_t PrecipitationChanceFormatter.percent(for:)(uint64_t a1)
{
  return PrecipitationChanceFormatter.string(for:percentStyle:noValueStyle:applyFloor:)(a1, 0, 1, 1);
}

uint64_t PrecipitationChanceFormatter.string(for:percentStyle:noValueStyle:applyFloor:)(uint64_t a1, int a2, BOOL a3, int a4)
{
  return sub_22E839CDC(a1, a2, a3, a4, &qword_268615080, MEMORY[0x263F1F3A0], MEMORY[0x263F1F388], MEMORY[0x263F1F398]);
}

{
  return sub_22E839CDC(a1, a2, a3, a4, &qword_2686150B8, MEMORY[0x263F1F358], MEMORY[0x263F1F348], MEMORY[0x263F1F350]);
}

uint64_t sub_22E839CDC(uint64_t a1, int a2, BOOL a3, int a4, uint64_t *a5, uint64_t (*a6)(void), double (*a7)(void), void (*a8)(void))
{
  uint64_t v33 = a7;
  uint64_t v34 = a8;
  int v38 = a4;
  BOOL v39 = a3;
  int v37 = a2;
  uint64_t v11 = sub_22E846618();
  uint64_t v35 = *(void *)(v11 - 8);
  uint64_t v36 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  double v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  double v19 = (char *)&v32 - v18;
  sub_22E8207D4(a1, (uint64_t)&v32 - v18, a5);
  uint64_t v20 = a6(0);
  uint64_t v21 = *(void *)(v20 - 8);
  unint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v19, 1, v20);
  if (v23 == 1)
  {
    sub_22E81C6A4((uint64_t)v19, a5);
    char v24 = 0;
  }
  else
  {
    char v25 = COERCE_UNSIGNED_INT64(v33());
    (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v20);
    char v24 = v25;
  }
  sub_22E8207D4(a1, (uint64_t)v17, a5);
  if (v22(v17, 1, v20) == 1)
  {
    sub_22E81C6A4((uint64_t)v17, a5);
    NanoWeatherKitUICompanion::PercentStyle v27 = NanoWeatherKitUICompanion_PercentStyle_unknownDefault;
  }
  else
  {
    char v28 = v24;
    v34();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v17, v20);
    char isPrecipitationSbvg_0 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v36);
    NanoWeatherKitUICompanion::PercentStyle v27 = isPrecipitationSbvg_0 & 1;
    char v24 = v28;
  }
  char v30 = v24;
  return PrecipitationChanceFormatter.string(for:isSignificant:percentStyle:noValueStyle:applyFloor:)(*(Swift::Double_optional *)&v26, (Swift::Bool_optional)(v23 == 1), v27, (NanoWeatherKitUICompanion::FormatterNoValueStyle)(v37 & 1), v39)._countAndFlagsBits;
}

Swift::String __swiftcall PrecipitationChanceFormatter.string(for:percentStyle:noValueStyle:)(Swift::Double_optional a1, NanoWeatherKitUICompanion::PercentStyle percentStyle, NanoWeatherKitUICompanion::FormatterNoValueStyle noValueStyle)
{
  if (percentStyle)
  {
    uint64_t v10 = FormatterNoValueStyle.rawValue.getter(v3);
    unint64_t v6 = v12;
  }
  else
  {
    uint64_t v5 = *(void **)(*(void *)(v4
                              + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_percentFormatter)
                  + 16);
    unint64_t v6 = 0xE000000000000000;
    id v7 = (void *)sub_22E846988();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setPercentSymbol_, v7);

    id v8 = (void *)sub_22E846A18();
    id v9 = objc_msgSend(v5, sel_stringForObjectValue_, v8);

    if (v9)
    {
      uint64_t v10 = sub_22E846998();
      unint64_t v6 = v11;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  uint64_t v13 = v10;
  uint64_t v14 = (void *)v6;
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

Swift::String __swiftcall PrecipitationChanceFormatter.string(for:isSignificant:percentStyle:noValueStyle:applyFloor:)(Swift::Double_optional a1, Swift::Bool_optional isSignificant, NanoWeatherKitUICompanion::PercentStyle percentStyle, NanoWeatherKitUICompanion::FormatterNoValueStyle noValueStyle, Swift::Bool applyFloor)
{
  if (isSignificant.value) {
    goto LABEL_4;
  }
  id v7 = *(void **)(*(void *)(v5
                            + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_percentFormatter)
                + 16);
  id v8 = (void *)sub_22E846988();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setPercentSymbol_, v8);

  id v9 = (void *)sub_22E846A18();
  id v10 = objc_msgSend(v7, sel_stringForObjectValue_, v9);

  if (!v10)
  {
LABEL_4:
    uint64_t v14 = FormatterNoValueStyle.rawValue.getter(applyFloor);
  }
  else
  {
    uint64_t v11 = sub_22E846998();
    uint64_t v13 = v12;

    uint64_t v14 = v11;
    uint64_t v15 = v13;
  }
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

Swift::Double __swiftcall PrecipitationChanceFormatter.roundedChance(_:isSignificant:applyFloor:)(Swift::Double_optional _, Swift::Bool isSignificant, Swift::Bool applyFloor)
{
  double v4 = 0.0;
  if (!isSignificant)
  {
    double v4 = 10.0;
    if (*(double *)&_.is_nil <= 1.0)
    {
      double v4 = 0.0;
      if (v3) {
        double v5 = 0.0;
      }
      else {
        double v5 = *(double *)&_.is_nil;
      }
      if (applyFloor) {
        double v5 = *(double *)&_.is_nil;
      }
      double v6 = v5 * 10.0;
      if (*(double *)&_.is_nil >= 0.0) {
        double v4 = v6;
      }
    }
  }
  return round(v4) / 10.0;
}

uint64_t PrecipitationChanceFormatter.deinit()
{
  sub_22E81C6A4(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_overrideLocale, &qword_268615030);
  swift_release();
  return v0;
}

uint64_t PrecipitationChanceFormatter.__deallocating_deinit()
{
  sub_22E81C6A4(v0 + OBJC_IVAR____TtC25NanoWeatherKitUICompanion28PrecipitationChanceFormatter_overrideLocale, &qword_268615030);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_22E83A330()
{
  return type metadata accessor for PrecipitationChanceFormatter();
}

uint64_t type metadata accessor for PrecipitationChanceFormatter()
{
  uint64_t result = qword_268615400;
  if (!qword_268615400) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22E83A384()
{
  sub_22E820A10();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t UIExpirationDate.relevant(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_22E8460A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  LOBYTE(a2) = sub_22E846038();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v11 = *(void *)(a1 - 8);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a3, v3, a1);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a3, v12, 1, a1);
}

uint64_t UIExpirationDate.uiExpirationDate.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v14[1] = a3;
  uint64_t v5 = sub_22E8460A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E8465F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_22E8465E8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  sub_22E846008();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double AirQuality.additionalValidity.getter()
{
  return 1800.0;
}

uint64_t sub_22E83A78C(uint64_t a1, uint64_t a2)
{
  return sub_22E83A7E4(a1, a2, MEMORY[0x263F1F570]);
}

double sub_22E83A7A8()
{
  return 1800.0;
}

double CurrentWeather.additionalValidity.getter()
{
  return 1800.0;
}

uint64_t sub_22E83A7CC(uint64_t a1, uint64_t a2)
{
  return sub_22E83A7E4(a1, a2, MEMORY[0x263F1F3E0]);
}

uint64_t sub_22E83A7E4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_22E8460A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E8465F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3(v10);
  sub_22E8465E8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  sub_22E846008();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

double Forecast<>.additionalValidity.getter()
{
  return 1200.0;
}

uint64_t sub_22E83A990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22E8460A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E8465F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_22E8465E8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_22E846008();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

double sub_22E83AB44()
{
  return 1200.0;
}

uint64_t static ColorIndex.== infix(_:_:)(double a1, double a2)
{
  if (a1 != a2) {
    return 0;
  }
  sub_22E83B340();
  return sub_22E846C68() & 1;
}

uint64_t sub_22E83ABC0(double *a1, double *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  sub_22E83B340();
  return sub_22E846C68() & 1;
}

NanoWeatherKitUICompanion::ColorSpectrum __swiftcall ColorSpectrum.init(colors:)(NanoWeatherKitUICompanion::ColorSpectrum colors)
{
  unint64_t rawValue = (unint64_t)colors.allIndices._rawValue;
  if (!((unint64_t)colors.allIndices._rawValue >> 62))
  {
    uint64_t v2 = *(void *)(((unint64_t)colors.allIndices._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v3 = v2;
    if (v2) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    return (NanoWeatherKitUICompanion::ColorSpectrum)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_22E846DB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_22E846DB8();
  colors.allIndices._unint64_t rawValue = (void *)swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_20;
  }
LABEL_3:
  if (v2 >= 1)
  {
    double v4 = 1.0 / (double)v3;
    if ((rawValue & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
      double v7 = v4;
      do
      {
        id v8 = (id)MEMORY[0x230FA5DA0](v5, rawValue);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_22E838CF0(0, v6[2] + 1, 1, v6);
        }
        unint64_t v10 = v6[2];
        unint64_t v9 = v6[3];
        if (v10 >= v9 >> 1) {
          uint64_t v6 = sub_22E838CF0((void *)(v9 > 1), v10 + 1, 1, v6);
        }
        ++v5;
        v6[2] = v10 + 1;
        uint64_t v11 = (double *)&v6[2 * v10];
        v11[4] = v7;
        *((void *)v11 + 5) = v8;
        swift_unknownObjectRelease();
        double v7 = v4 + v7;
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
      double v13 = v4;
      do
      {
        id v14 = *(id *)(rawValue + 8 * v12 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_22E838CF0(0, v6[2] + 1, 1, v6);
        }
        unint64_t v16 = v6[2];
        unint64_t v15 = v6[3];
        if (v16 >= v15 >> 1) {
          uint64_t v6 = sub_22E838CF0((void *)(v15 > 1), v16 + 1, 1, v6);
        }
        ++v12;
        v6[2] = v16 + 1;
        double v17 = (double *)&v6[2 * v16];
        v17[4] = v13;
        *((void *)v17 + 5) = v14;

        double v13 = v4 + v13;
      }
      while (v2 != v12);
    }
    swift_bridgeObjectRelease();
    return (NanoWeatherKitUICompanion::ColorSpectrum)v6;
  }
  __break(1u);
  return colors;
}

uint64_t sub_22E83AE60(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = 0;
  for (uint64_t i = (void **)(a3 + 40); ; i += 2)
  {
    if (*((double *)i - 1) == a1)
    {
      double v7 = *i;
      sub_22E83B340();
      id v8 = v7;
      char v9 = sub_22E846C68();

      if (v9) {
        break;
      }
    }
    if (v3 == ++v5) {
      return 0;
    }
  }
  return v5;
}

uint64_t _s25NanoWeatherKitUICompanion13ColorSpectrumV18colorIndexForValue_9inIndicesAA0eH0VSgSd_SayAGGtF_0(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return 0;
  }
  double v3 = *(double *)(result + 32);
  double v4 = *(void **)(result + 40);
  if (v3 > a2)
  {
    uint64_t v5 = *(void *)(result + 32);
    id v6 = v4;
    return v5;
  }
  uint64_t v7 = result + 32 + 16 * v2;
  if (*(double *)(v7 - 16) < a2)
  {
    uint64_t v5 = *(void *)(v7 - 16);
    id v8 = *(id *)(v7 - 8);
    return v5;
  }
  if (v3 >= a2)
  {
LABEL_16:
    v4;
    return *(void *)&v3;
  }
  if (v2 == 1) {
    return 0;
  }
  char v9 = (void **)(result + 56);
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    double v3 = *((double *)v9 - 1);
    if (v3 >= a2)
    {
      double v4 = *v9;
      goto LABEL_16;
    }
    uint64_t v5 = 0;
    v9 += 2;
    if (v11 == v2) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void _s25NanoWeatherKitUICompanion13ColorSpectrumV18interpolateBetween6color16color28fractionSo7UIColorCAI_AI12CoreGraphics7CGFloatVtF_0(void *a1, void *a2, double a3)
{
  id v5 = objc_msgSend(a1, sel_CGColor);
  uint64_t v6 = sub_22E846B98();

  if (v6)
  {
    unint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      if (v7 != 1)
      {
        if (v7 >= 3)
        {
          if (v7 != 3)
          {
            double v8 = *(double *)(v6 + 32);
            double v9 = *(double *)(v6 + 40);
            double v11 = *(double *)(v6 + 48);
            double v10 = *(double *)(v6 + 56);
            swift_bridgeObjectRelease();
            goto LABEL_8;
          }
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
          goto LABEL_34;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  double v8 = 0.0;
LABEL_8:
  id v12 = objc_msgSend(a2, sel_CGColor);
  uint64_t v13 = sub_22E846B98();

  double v26 = v10;
  if (!v13)
  {
    double v17 = 0.0;
    double v19 = 1.0;
    if (a3 <= 1.0) {
      double v19 = a3;
    }
    if (a3 <= 0.0) {
      double v19 = 0.0;
    }
    double v18 = 0.0;
    double v16 = 0.0;
    double v15 = 0.0;
    goto LABEL_22;
  }
  unint64_t v14 = *(void *)(v13 + 16);
  if (!v14) {
    goto LABEL_33;
  }
  if (v14 == 1)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 < 3)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v14 == 3)
  {
LABEL_36:
    __break(1u);
    return;
  }
  double v15 = *(double *)(v13 + 32);
  double v16 = *(double *)(v13 + 40);
  double v18 = *(double *)(v13 + 48);
  double v17 = *(double *)(v13 + 56);
  swift_bridgeObjectRelease();
  double v19 = 0.0;
  if (a3 > 0.0)
  {
    double v19 = 1.0;
    if (a3 <= 1.0) {
      double v19 = a3;
    }
  }
LABEL_22:
  double v20 = v8 + v19 * (v15 - v8);
  double v21 = 1.0;
  if (a3 <= 1.0) {
    double v21 = a3;
  }
  if (a3 <= 0.0) {
    double v21 = 0.0;
  }
  double v22 = v9 + v21 * (v16 - v9);
  double v23 = v11 + v21 * (v18 - v11);
  double v24 = v26 + v21 * (v17 - v26);
  id v25 = objc_allocWithZone(MEMORY[0x263F825C8]);
  objc_msgSend(v25, sel_initWithRed_green_blue_alpha_, v20, v22, v23, v24);
}

char *_s25NanoWeatherKitUICompanion13ColorSpectrumV13colorForValueySo7UIColorCSdF_0(uint64_t a1, double a2)
{
  double v4 = COERCE_DOUBLE(_s25NanoWeatherKitUICompanion13ColorSpectrumV18colorIndexForValue_9inIndicesAA0eH0VSgSd_SayAGGtF_0(a1, a2));
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = v4;
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      if (*(double *)(a1 + 32) == v4)
      {
        double v9 = *(void **)(a1 + 40);
        sub_22E83B340();
        id v10 = v6;
        id v11 = v9;
        char v12 = sub_22E846C68();

        if (v12) {
          return (char *)v10;
        }
      }
    }
    uint64_t result = (char *)sub_22E83AE60(v7, (uint64_t)v6, a1);
    if ((v14 & 1) == 0)
    {
      double v15 = result - 1;
      if (__OFSUB__(result, 1))
      {
        __break(1u);
        return result;
      }
      if (((unint64_t)v15 & 0x8000000000000000) == 0 && (unint64_t)v15 < v8)
      {
        uint64_t v16 = a1 + 16 * (void)v15;
        double v17 = *(void **)(v16 + 40);
        double v18 = (a2 - *(double *)(v16 + 32)) / (v7 - *(double *)(v16 + 32));
        id v19 = v6;
        id v20 = v17;
        _s25NanoWeatherKitUICompanion13ColorSpectrumV18interpolateBetween6color16color28fractionSo7UIColorCAI_AI12CoreGraphics7CGFloatVtF_0(v20, v19, v18);
        uint64_t v22 = v21;

        return (char *)v22;
      }
    }
  }
  id v23 = objc_msgSend(self, sel_whiteColor);
  return (char *)v23;
}

unint64_t sub_22E83B340()
{
  unint64_t result = qword_268615410;
  if (!qword_268615410)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268615410);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ColorIndex(void *a1, void *a2)
{
  double v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for ColorIndex(uint64_t a1)
{
}

void *assignWithCopy for ColorIndex(void *a1, void *a2)
{
  *a1 = *a2;
  double v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for ColorIndex(void *a1, void *a2)
{
  *a1 = *a2;
  double v3 = (void *)a1[1];
  a1[1] = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for ColorIndex(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorIndex(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorIndex()
{
  return &type metadata for ColorIndex;
}

ValueMetadata *type metadata accessor for ColorSpectrum()
{
  return &type metadata for ColorSpectrum;
}

uint64_t Date.endOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v52 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v51 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v40 - v6;
  uint64_t v45 = sub_22E846228();
  uint64_t v8 = *(void *)(v45 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v45);
  uint64_t v50 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v54 = (char *)&v40 - v11;
  uint64_t v12 = sub_22E846128();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  double v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22E8461B8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v55 = v16;
  uint64_t v56 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v47 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v40 - v20;
  uint64_t v22 = sub_22E845F98();
  uint64_t v48 = *(void *)(v22 - 8);
  uint64_t v49 = v22;
  MEMORY[0x270FA5388](v22);
  double v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.Component.all.getter();
  id v25 = *(void (**)(void))(v13 + 104);
  unsigned int v44 = *MEMORY[0x263F07718];
  uint64_t v43 = (void (*)(char *, void, uint64_t))v25;
  v25(v15);
  sub_22E846138();
  double v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v46 = v12;
  uint64_t v42 = v26;
  v26(v15, v12);
  sub_22E8461D8();
  uint64_t v27 = (uint64_t)v7;
  char v28 = v7;
  uint64_t v29 = v45;
  uint64_t v41 = *(uint64_t (**)(char *, uint64_t))(v8 + 48);
  int v30 = v41(v28, 1);
  uint64_t v40 = v8;
  if (v30 == 1)
  {
    sub_22E846218();
    sub_22E81C6A4(v27, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v54, v27, v29);
  }
  uint64_t v31 = v29;
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v56 + 8);
  v56 += 8;
  v32(v21, v55);
  sub_22E845F48();
  sub_22E845F68();
  sub_22E845F78();
  sub_22E845F38();
  uint64_t v33 = v46;
  v43(v15, v44, v46);
  uint64_t v34 = v47;
  sub_22E846138();
  v42(v15, v33);
  uint64_t v35 = (uint64_t)v51;
  sub_22E8461D8();
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v41)(v35, 1, v31) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4(v35, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(v50, v35, v31);
  }
  uint64_t v36 = (uint64_t)v52;
  sub_22E846198();
  sub_22E846178();
  v32(v34, v55);
  uint64_t v37 = sub_22E8460A8();
  uint64_t v38 = *(void *)(v37 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37) == 1)
  {
    sub_22E845FE8();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v49);
    return sub_22E81C6A4(v36, &qword_2686150C0);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v49);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v53, v36, v37);
  }
}

uint64_t Date.dateComponents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E846228();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E846128();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22E8461B8();
  uint64_t v12 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.Component.all.getter();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F07718], v8);
  sub_22E846138();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_22E8461D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4((uint64_t)v3, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v17);
}

uint64_t static Date.calendar.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22E846228();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E846128();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F07718], v7);
  sub_22E846138();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22E8461D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4((uint64_t)v2, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  }
  return sub_22E846198();
}

uint64_t Date.minutelyDateEnumerationToEndDate(_:maxCount:block:)(uint64_t a1, void (**a2)(char *, uint64_t), void (*a3)(char *), uint64_t a4)
{
  return sub_22E83C9CC(a1, a2, a3, a4, MEMORY[0x263F078C0]);
}

uint64_t Date.dateEnumerationToEndDate(_:maxCount:componentToIterate:componentsToRound:block:)(uint64_t a1, void (**a2)(char *, uint64_t), uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v71 = a2;
  uint64_t v67 = a5;
  uint64_t v68 = a6;
  uint64_t v61 = a3;
  uint64_t v62 = a4;
  uint64_t v70 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v65 = (void (**)(char *, char *, uint64_t))((char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_22E846228();
  uint64_t v64 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v66 = (unsigned int (**)(char *, uint64_t, uint64_t))((char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v63 = sub_22E846128();
  uint64_t v13 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  double v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22E845F98();
  uint64_t v55 = *(void *)(v16 - 8);
  uint64_t v56 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_22E8461B8();
  uint64_t v19 = *(void *)(v60 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v60);
  uint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  double v24 = (char *)&v54 - v23;
  uint64_t v25 = sub_22E8460A8();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v69 = (char *)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  int v30 = (char *)&v54 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v58 = v32;
  uint64_t v59 = (char *)&v54 - v31;
  (*(void (**)(void))(v32 + 16))();
  char v72 = v24;
  uint64_t v33 = v11;
  sub_22E846188();
  uint64_t v57 = static Calendar.Component.all.getter();
  unint64_t v34 = v63;
  (*(void (**)(char *, void, unint64_t))(v13 + 104))(v15, *MEMORY[0x263F07718], v63);
  sub_22E846138();
  (*(void (**)(char *, unint64_t))(v13 + 8))(v15, v34);
  uint64_t v35 = (uint64_t)v65;
  sub_22E8461D8();
  uint64_t v36 = v64;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v35, 1, v33) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4(v35, &qword_268615418);
  }
  else
  {
    (*(void (**)(unsigned int (**)(char *, uint64_t, uint64_t), uint64_t, uint64_t))(v36 + 32))(v66, v35, v33);
  }
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v19 + 8);
  uint64_t v57 = v19 + 8;
  uint64_t v54 = v37;
  v37(v22, v60);
  sub_22E845FD8();
  uint64_t v38 = sub_22E846088();
  uint64_t v39 = v62;
  uint64_t v40 = v69;
  uint64_t v41 = (uint64_t)v71;
  if (v38 == 1 || (uint64_t)v71 <= 0)
  {
    uint64_t v43 = *(void (**)(char *, uint64_t))(v58 + 8);
    uint64_t v71 = (void (**)(char *, uint64_t))(v58 + 8);
  }
  else
  {
    unint64_t v42 = 0;
    uint64_t v71 = (void (**)(char *, uint64_t))(v58 + 8);
    uint64_t v65 = (void (**)(char *, char *, uint64_t))(v58 + 32);
    uint64_t v66 = (unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48);
    unint64_t v63 = v41 & ~(v41 >> 63);
    uint64_t v64 = (v58 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    while (1)
    {
      sub_22E846178();
      if ((*v66)(v8, 1, v25) == 1)
      {
        sub_22E845FD8();
        uint64_t v43 = *v71;
        (*v71)(v30, v25);
        sub_22E81C6A4((uint64_t)v8, &qword_2686150C0);
        (*v65)(v30, v40, v25);
      }
      else
      {
        uint64_t v43 = *v71;
        (*v71)(v30, v25);
        unsigned int v44 = *v65;
        (*v65)(v40, v8, v25);
        v44(v30, v40, v25);
      }
      v67(v30);
      uint64_t v45 = sub_22E845F58();
      if (v46) {
        break;
      }
      BOOL v47 = __OFADD__(v45, 1);
      uint64_t result = v45 + 1;
      if (v47)
      {
        __break(1u);
        return result;
      }
      uint64_t v49 = v8;
      sub_22E845F88();
      uint64_t v50 = *(void *)(v39 + 16);
      if (v50)
      {
        uint64_t v51 = *(void *)(sub_22E8461A8() - 8);
        uint64_t v52 = v39 + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80));
        uint64_t v53 = *(void *)(v51 + 72);
        swift_bridgeObjectRetain();
        do
        {
          sub_22E845F88();
          v52 += v53;
          --v50;
        }
        while (v50);
        uint64_t v39 = v62;
        swift_bridgeObjectRelease();
      }
      if (sub_22E846088() != 1)
      {
        ++v42;
        uint64_t v8 = v49;
        uint64_t v40 = v69;
        if (v42 < v63) {
          continue;
        }
      }
      break;
    }
  }
  v43(v30, v25);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v18, v56);
  v54(v72, v60);
  return ((uint64_t (*)(char *, uint64_t))v43)(v59, v25);
}

uint64_t Date.hourlyDateEnumerationToEndDate(_:maxCount:block:)(uint64_t a1, void (**a2)(char *, uint64_t), void (*a3)(char *), uint64_t a4)
{
  uint64_t v19 = a4;
  uint64_t v18 = a3;
  uint64_t v6 = sub_22E8461A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v11(v10, *MEMORY[0x263F07890], v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615110);
  uint64_t v12 = *(void *)(v7 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_22E848280;
  unint64_t v15 = v14 + v13;
  v11((char *)v15, *MEMORY[0x263F078C8], v6);
  v11((char *)(v15 + v12), *MEMORY[0x263F078C0], v6);
  Date.dateEnumerationToEndDate(_:maxCount:componentToIterate:componentsToRound:block:)(a1, a2, (uint64_t)v10, v14, v18, v19);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v6);
}

uint64_t Date.dailyDateEnumerationToEndDate(_:maxCount:block:)(uint64_t a1, void (**a2)(char *, uint64_t), void (*a3)(char *), uint64_t a4)
{
  return sub_22E83C9CC(a1, a2, a3, a4, MEMORY[0x263F07870]);
}

uint64_t sub_22E83C9CC(uint64_t a1, void (**a2)(char *, uint64_t), void (*a3)(char *), uint64_t a4, unsigned int *a5)
{
  uint64_t v10 = sub_22E8461A8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *a5, v10);
  Date.dateEnumerationToEndDate(_:maxCount:componentToIterate:componentsToRound:block:)(a1, a2, (uint64_t)v13, MEMORY[0x263F8EE78], a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t Date.isEqualTo(_:components:)(uint64_t a1, uint64_t a2)
{
  uint64_t v81 = a2;
  uint64_t v73 = a1;
  uint64_t v2 = sub_22E8461A8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v78 = (char *)&v60 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  char v72 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v60 - v11;
  int64_t v76 = sub_22E846228();
  uint64_t v13 = *(void *)(v76 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v76);
  uint64_t v71 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v74 = (char *)&v60 - v16;
  uint64_t v17 = sub_22E846128();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_22E8461B8();
  uint64_t v77 = *(void *)(v75 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v75);
  uint64_t v70 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  double v24 = (char *)&v60 - v23;
  uint64_t v25 = sub_22E845F98();
  uint64_t v62 = *(void *)(v25 - 8);
  uint64_t v63 = v25;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v79 = (char *)&v60 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v80 = (char *)&v60 - v28;
  uint64_t v64 = static Calendar.Component.all.getter();
  uint64_t v29 = *(void (**)(void))(v18 + 104);
  unsigned int v68 = *MEMORY[0x263F07718];
  uint64_t v67 = (void (*)(char *, void, uint64_t))v29;
  v29(v20);
  sub_22E846138();
  int v30 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v69 = v17;
  uint64_t v66 = v30;
  v30(v20, v17);
  sub_22E8461D8();
  uint64_t v65 = *(uint64_t (**)(char *, uint64_t, int64_t))(v13 + 48);
  int v31 = v65(v12, 1, v76);
  uint64_t v61 = v13;
  if (v31 == 1)
  {
    sub_22E846218();
    sub_22E81C6A4((uint64_t)v12, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, char *, int64_t))(v13 + 32))(v74, v12, v76);
  }
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  uint64_t v32 = *(char **)(v77 + 8);
  v77 += 8;
  uint64_t v74 = v32;
  ((void (*)(char *, uint64_t))v32)(v24, v75);
  static Calendar.Component.all.getter();
  uint64_t v33 = v69;
  v67(v20, v68, v69);
  unint64_t v34 = v70;
  sub_22E846138();
  v66(v20, v33);
  uint64_t v35 = (uint64_t)v72;
  sub_22E8461D8();
  int64_t v36 = v76;
  if (v65((char *)v35, 1, v76) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4(v35, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, uint64_t, int64_t))(v61 + 32))(v71, v35, v36);
  }
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v74)(v34, v75);
  uint64_t v37 = *(void *)(v81 + 56);
  uint64_t v75 = v81 + 56;
  uint64_t v38 = 1 << *(unsigned char *)(v81 + 32);
  uint64_t v39 = -1;
  if (v38 < 64) {
    uint64_t v39 = ~(-1 << v38);
  }
  unint64_t v40 = v39 & v37;
  int64_t v76 = (unint64_t)(v38 + 63) >> 6;
  uint64_t v77 = v3 + 16;
  uint64_t v41 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v43 = 0;
  while (1)
  {
    if (v40)
    {
      unint64_t v44 = __clz(__rbit64(v40));
      v40 &= v40 - 1;
      unint64_t v45 = v44 | (v43 << 6);
      goto LABEL_26;
    }
    int64_t v46 = v43 + 1;
    if (__OFADD__(v43, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v46 >= v76) {
      goto LABEL_33;
    }
    unint64_t v47 = *(void *)(v75 + 8 * v46);
    ++v43;
    if (!v47)
    {
      int64_t v43 = v46 + 1;
      if (v46 + 1 >= v76) {
        goto LABEL_33;
      }
      unint64_t v47 = *(void *)(v75 + 8 * v43);
      if (!v47)
      {
        int64_t v43 = v46 + 2;
        if (v46 + 2 >= v76) {
          goto LABEL_33;
        }
        unint64_t v47 = *(void *)(v75 + 8 * v43);
        if (!v47) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v40 = (v47 - 1) & v47;
    unint64_t v45 = __clz(__rbit64(v47)) + (v43 << 6);
LABEL_26:
    uint64_t v49 = v78;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v78, *(void *)(v81 + 48) + *(void *)(v3 + 72) * v45, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v49, v2);
    uint64_t v50 = sub_22E845F58();
    if (v51)
    {
      (*v41)(v6, v2);
LABEL_31:
      swift_release();
      uint64_t v56 = v63;
      uint64_t v57 = *(void (**)(char *, uint64_t))(v62 + 8);
      v57(v79, v63);
      v57(v80, v56);
      return 0;
    }
    uint64_t v52 = v50;
    uint64_t v53 = sub_22E845F58();
    char v55 = v54;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*v41)(v6, v2);
    if ((v55 & 1) != 0 || v52 != v53) {
      goto LABEL_31;
    }
  }
  int64_t v48 = v46 + 3;
  if (v48 >= v76)
  {
LABEL_33:
    swift_release();
    uint64_t v58 = v63;
    uint64_t v59 = *(void (**)(char *, uint64_t))(v62 + 8);
    v59(v79, v63);
    v59(v80, v58);
    return 1;
  }
  unint64_t v47 = *(void *)(v75 + 8 * v48);
  if (v47)
  {
    int64_t v43 = v48;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v43 = v48 + 1;
    if (__OFADD__(v48, 1)) {
      break;
    }
    if (v43 >= v76) {
      goto LABEL_33;
    }
    unint64_t v47 = *(void *)(v75 + 8 * v43);
    ++v48;
    if (v47) {
      goto LABEL_25;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t Date.roundDownToHour()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E846228();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v29 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E846128();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_22E8461B8();
  uint64_t v10 = *(void *)(v30 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v30);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v28 = sub_22E845F98();
  uint64_t v16 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.Component.all.getter();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F07718], v6);
  sub_22E846138();
  uint64_t v19 = v9;
  uint64_t v20 = v26;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
  uint64_t v21 = v27;
  sub_22E8461D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v3, 1, v21) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4((uint64_t)v3, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v29, v3, v21);
  }
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v23 = v30;
  v22(v15, v30);
  sub_22E845F38();
  sub_22E845F78();
  sub_22E845F68();
  sub_22E846188();
  sub_22E846178();
  v22(v13, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v28);
}

uint64_t Date.roundDownToDay()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615418);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E846228();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E846128();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_22E8461B8();
  uint64_t v11 = *(void *)(v32 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v32);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v17 = sub_22E845F98();
  uint64_t v30 = *(void *)(v17 - 8);
  uint64_t v31 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.Component.all.getter();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F07718], v7);
  sub_22E846138();
  uint64_t v20 = v10;
  uint64_t v21 = v7;
  uint64_t v23 = v28;
  uint64_t v22 = v29;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v20, v21);
  sub_22E8461D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    sub_22E846218();
    sub_22E81C6A4((uint64_t)v3, &qword_268615418);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v6, v3, v22);
  }
  sub_22E846198();
  sub_22E846158();
  swift_bridgeObjectRelease();
  double v24 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v25 = v32;
  v24(v16, v32);
  sub_22E845F38();
  sub_22E845F78();
  sub_22E845F68();
  sub_22E845F48();
  sub_22E846188();
  sub_22E846178();
  v24(v14, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v19, v31);
}

double DayPartForecast.displayPrecipitationChance.getter()
{
  return sub_22E83E07C(MEMORY[0x263F1F638], MEMORY[0x263F1F630]);
}

uint64_t DayWeather.isTimeDayTime(_:)(uint64_t a1)
{
  uint64_t v40 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  int64_t v43 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v35 - v5;
  uint64_t v7 = sub_22E8467A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v35 - v12;
  uint64_t v14 = sub_22E8460A8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v37 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v38 = (char *)&v35 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v39 = (char *)&v35 - v21;
  MEMORY[0x270FA5388](v20);
  unint64_t v44 = (char *)&v35 - v22;
  uint64_t v42 = v1;
  sub_22E846248();
  sub_22E846798();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v13, v7);
  double v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v24(v6, 1, v14) != 1)
  {
    uint64_t v41 = v15;
    int64_t v36 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v36(v44, v6, v14);
    sub_22E846248();
    uint64_t v6 = v43;
    sub_22E846788();
    v23(v11, v7);
    if (v24(v6, 1, v14) != 1)
    {
      uint64_t v26 = v39;
      v36(v39, v6, v14);
      uint64_t v27 = v40;
      char v28 = sub_22E846038();
      uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
      uint64_t v30 = v38;
      v29(v38, v27, v14);
      uint64_t v31 = v37;
      v29(v37, (uint64_t)v26, v14);
      if (v28)
      {
        uint64_t v32 = *(void (**)(char *, uint64_t))(v41 + 8);
        v32(v31, v14);
        v32(v30, v14);
        v32(v26, v14);
        v32(v44, v14);
      }
      else
      {
        sub_22E8249E0();
        char v33 = sub_22E846968();
        unint64_t v34 = *(void (**)(char *, uint64_t))(v41 + 8);
        v34(v31, v14);
        v34(v30, v14);
        v34(v26, v14);
        v34(v44, v14);
        if (v33) {
          return 1;
        }
      }
      return 0;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v14);
  }
  sub_22E83DFF0((uint64_t)v6);
  return 1;
}

uint64_t sub_22E83DFF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double DayWeather.displayPrecipitationChance.getter()
{
  return sub_22E83E07C(MEMORY[0x263F1F350], MEMORY[0x263F1F348]);
}

double sub_22E83E07C(uint64_t (*a1)(uint64_t), void (*a2)(uint64_t))
{
  uint64_t v4 = sub_22E846618();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1(v6);
  a2(v9);
  double v10 = 0.0;
  if (_s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0())
  {
    sub_22E846A38();
    double v10 = v11;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

uint64_t Forecast<>.value(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_22E83E430(a1, a2, a3);
  if (v6)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 56);
    uint64_t v8 = a4;
    uint64_t v9 = 1;
  }
  else
  {
    sub_22E846778();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 56);
    uint64_t v8 = a4;
    uint64_t v9 = 0;
  }
  return v7(v8, v9, 1);
}

uint64_t Forecast<>.values(startingAt:size:sizeMustMatch:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  swift_getWitnessTable();
  uint64_t v10 = sub_22E846EC8();
  MEMORY[0x270FA5388](v10);
  sub_22E83E430(a1, a4, a5);
  if (v12) {
    goto LABEL_13;
  }
  uint64_t v13 = v11;
  uint64_t result = sub_22E846B58();
  if (result < 0) {
    goto LABEL_13;
  }
  if (a2 <= 0)
  {
    uint64_t result = sub_22E846B58();
    a2 = result - v13;
    if (__OFSUB__(result, v13))
    {
LABEL_17:
      __break(1u);
      return result;
    }
  }
  uint64_t v15 = v13 + a2;
  if (__OFADD__(v13, a2))
  {
    __break(1u);
    goto LABEL_17;
  }
  if (sub_22E846B58() < v15) {
    uint64_t v15 = sub_22E846B58();
  }
  if (v13 < v15)
  {
    sub_22E846B78();
    uint64_t v16 = *(void *)(a4 + 16);
    swift_getWitnessTable();
    uint64_t v17 = sub_22E846A08();
    uint64_t v18 = v17;
    if ((a3 & 1) != 0 && MEMORY[0x230FA5A60](v17, v16) != a2)
    {
      swift_bridgeObjectRelease();
      return sub_22E846928();
    }
    return v18;
  }
LABEL_13:
  return sub_22E846928();
}

void sub_22E83E430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a1;
  uint64_t v32 = a3;
  uint64_t v29 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  char v28 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v8 = sub_22E846C98();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v26 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22E8460A8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v30 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[1] = swift_getWitnessTable();
  uint64_t v27 = v3;
  sub_22E846B68();
  uint64_t v18 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
LABEL_4:
    sub_22E83DFF0((uint64_t)v14);
    return;
  }
  uint64_t v19 = v32;
  (*(void (**)(uint64_t, uint64_t))(v32 + 32))(v7, v32);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    goto LABEL_4;
  }
  uint64_t v20 = v30;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v30, v14, v15);
  sub_22E8249E0();
  if (sub_22E846968())
  {
LABEL_12:
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
    return;
  }
  sub_22E845FF8();
  double v22 = v21 / (*(double (**)(uint64_t, uint64_t))(v19 + 40))(v7, v19);
  if ((~*(void *)&v22 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  double v24 = v28;
  uint64_t v23 = v29;
  if (v22 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v22 < 9.22337204e18)
  {
    uint64_t v25 = (uint64_t)v22;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v28, v27, a2);
    if ((v25 & 0x8000000000000000) == 0)
    {
      sub_22E846B58();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v24, a2);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
      return;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, a2);
    goto LABEL_12;
  }
LABEL_15:
  __break(1u);
}

uint64_t Forecast<>.forecast(startingAt:size:sizeMustMatch:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_22E8465F8();
  MEMORY[0x270FA5388](v10 - 8);
  Forecast<>.values(startingAt:size:sizeMustMatch:)(a1, a2, a3, a4, a5);
  sub_22E846748();
  return sub_22E846768();
}

uint64_t sub_22E83E9DC()
{
  type metadata accessor for UltraVioletFormatter();
  uint64_t result = swift_initStaticObject();
  static UltraVioletFormatter.shared = result;
  return result;
}

uint64_t *UltraVioletFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E80 != -1) {
    swift_once();
  }
  return &static UltraVioletFormatter.shared;
}

uint64_t static UltraVioletFormatter.shared.getter()
{
  type metadata accessor for UltraVioletFormatter();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for UltraVioletFormatter()
{
  return self;
}

Swift::String __swiftcall UltraVioletFormatter.stringForIndex(_:noValueStyle:)(Swift::Int_optional _, NanoWeatherKitUICompanion::FormatterNoValueStyle noValueStyle)
{
  if (_.is_nil)
  {
    uint64_t v3 = FormatterNoValueStyle.rawValue.getter(noValueStyle);
  }
  else
  {
    sub_22E83EB00();
    uint64_t v3 = sub_22E846CF8();
  }
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

unint64_t sub_22E83EB00()
{
  unint64_t result = qword_268615420;
  if (!qword_268615420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615420);
  }
  return result;
}

uint64_t UltraVioletFormatter.deinit()
{
  return v0;
}

uint64_t UltraVioletFormatter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

double static DayWeather.timeInterval.getter()
{
  return 86400.0;
}

double sub_22E83EB80()
{
  return 86400.0;
}

uint64_t sub_22E83EB90(void *a1)
{
  a1[1] = sub_22E83EC1C(&qword_268615428);
  a1[2] = sub_22E83EC1C(&qword_268615430);
  uint64_t result = sub_22E83EC1C(&qword_268615438);
  a1[3] = result;
  return result;
}

uint64_t sub_22E83EC1C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22E846278();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Measurement<>.formattedWindSpeedComponents(locale:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v49 = a1;
  char v55 = a2;
  uint64_t v61 = sub_22E846918();
  uint64_t v74 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  char v51 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E846BC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_22E846BB8();
  uint64_t v73 = *(void *)(v58 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v58);
  char v54 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v45 - v13;
  sub_22E846A68();
  unsigned int v70 = *MEMORY[0x263F86150];
  uint64_t v15 = v8;
  uint64_t v16 = *(void (**)(void))(v8 + 104);
  uint64_t v71 = v8 + 104;
  char v72 = (void (*)(char *, void, uint64_t))v16;
  uint64_t v17 = v7;
  uint64_t v46 = v7;
  v16(v10);
  uint64_t v18 = sub_22E846118();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v48 = v19 + 16;
  uint64_t v50 = v20;
  uint64_t v56 = v18;
  v20(v6, a1, v18);
  double v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
  uint64_t v57 = v19 + 56;
  uint64_t v59 = v21;
  v21(v6, 0, 1, v18);
  sub_22E8468D8();
  swift_bridgeObjectRelease();
  sub_22E83F390((uint64_t)v6);
  double v22 = *(void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v64 = v15 + 8;
  uint64_t v65 = v22;
  v22(v10, v17);
  unsigned int v67 = *MEMORY[0x263F860E8];
  uint64_t v23 = v74;
  double v24 = *(void (**)(void))(v74 + 104);
  uint64_t v68 = v74 + 104;
  uint64_t v69 = (void (*)(char *, void, uint64_t))v24;
  uint64_t v25 = v51;
  uint64_t v26 = v61;
  v24(v51);
  uint64_t v66 = sub_22E8467C8();
  sub_22E8467B8();
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615440);
  unint64_t v62 = sub_22E83F3F0();
  uint64_t v27 = v58;
  uint64_t v53 = sub_22E845EC8();
  uint64_t v52 = v28;
  swift_release();
  uint64_t v60 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v74 = v23 + 8;
  uint64_t v29 = v26;
  v60(v25, v26);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v73 + 8);
  v73 += 8;
  unint64_t v47 = v30;
  v30(v14, v27);
  sub_22E846A58();
  uint64_t v31 = v46;
  v72(v10, v70, v46);
  uint64_t v32 = v56;
  v50(v6, v49, v56);
  v59(v6, 0, 1, v32);
  sub_22E8468D8();
  swift_bridgeObjectRelease();
  sub_22E83F390((uint64_t)v6);
  v65(v10, v31);
  v69(v25, v67, v29);
  sub_22E8467B8();
  uint64_t v33 = v58;
  uint64_t v50 = (void (*)(char *, uint64_t, uint64_t))sub_22E845EC8();
  uint64_t v49 = v34;
  swift_release();
  v60(v25, v29);
  uint64_t v35 = v47;
  v47(v14, v33);
  sub_22E846A58();
  v72(v10, v70, v31);
  v59(v6, 1, 1, v56);
  sub_22E8468D8();
  swift_bridgeObjectRelease();
  sub_22E83F390((uint64_t)v6);
  v65(v10, v31);
  int64_t v36 = v54;
  sub_22E846BA8();
  v35(v14, v33);
  uint64_t v37 = v61;
  v69(v25, v67, v61);
  sub_22E8467B8();
  uint64_t v38 = sub_22E845EC8();
  uint64_t v40 = v39;
  swift_release();
  v60(v25, v37);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v36, v33);
  uint64_t v42 = v55;
  uint64_t v43 = v52;
  uint64_t *v55 = v53;
  v42[1] = v43;
  uint64_t v44 = v49;
  v42[2] = (uint64_t)v50;
  v42[3] = v44;
  v42[4] = v38;
  v42[5] = v40;
  return result;
}

uint64_t sub_22E83F390(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22E83F3F0()
{
  unint64_t result = qword_268615448[0];
  if (!qword_268615448[0])
  {
    sub_22E846BB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268615448);
  }
  return result;
}

uint64_t Measurement<>.formattedWindSpeed(locale:)(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_22E846918();
  uint64_t v22 = *(void *)(v1 - 8);
  uint64_t v23 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615030);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E846BC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22E846BB8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F86150], v7);
  uint64_t v15 = sub_22E846118();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v6, v21, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v6, 0, 1, v15);
  sub_22E846A48();
  sub_22E8468D8();
  swift_bridgeObjectRelease();
  sub_22E83F390((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = v22;
  uint64_t v17 = v23;
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v3, *MEMORY[0x263F860E8], v23);
  sub_22E8467C8();
  sub_22E8467B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268615440);
  sub_22E83F3F0();
  uint64_t v19 = sub_22E845EC8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v17);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v19;
}

uint64_t Measurement<>.WindSpeedComponents.speed.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Measurement<>.WindSpeedComponents.unit.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Measurement<>.WindSpeedComponents.accessibleUnit.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22E83F878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t _s12AppViewModelVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_22E83F8B4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_22E83F8F8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22E83F950(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

void *sub_22E83F9F4(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22E83FA4C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22E83FA94(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Measurement<>.WindSpeedComponents()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static WeatherLaunchType.componentsFromURL(_:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686154D0);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22E845F28();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E845EF8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_22E83FCE8((uint64_t)v2);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    sub_22E845F18();
    _s25NanoWeatherKitUICompanion0B10LaunchTypeO8rawValueACSgSS_tcfC_0();
    uint64_t v7 = sub_22E845F08();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7;
}

uint64_t sub_22E83FCE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686154D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *static WeatherLaunchType.allCases.getter()
{
  return &unk_26E23AD70;
}

uint64_t WeatherLaunchType.rawValue.getter(char a1)
{
  uint64_t result = 6910305;
  switch(a1)
  {
    case 1:
      uint64_t result = 6911605;
      break;
    case 2:
      uint64_t result = 0x776F72726F6D6F74;
      break;
    case 3:
      uint64_t result = 1684957559;
      break;
    case 4:
      uint64_t result = 0x65636E616863;
      break;
    case 5:
      uint64_t result = 0x74617265706D6574;
      break;
    case 6:
      uint64_t result = 0x6F697469646E6F63;
      break;
    case 7:
      uint64_t result = 0x6572757373657270;
      break;
    case 8:
      uint64_t result = 0x79746964696D7568;
      break;
    case 9:
      uint64_t result = 0x696C696269736976;
      break;
    case 10:
      uint64_t result = 0x7961447473616CLL;
      break;
    case 11:
      uint64_t result = 0x44746E6572727563;
      break;
    case 12:
      uint64_t result = 0x657265766573;
      break;
    case 13:
      uint64_t result = 1701736302;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22E83FEEC(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = WeatherLaunchType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == WeatherLaunchType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22E83FF78()
{
  char v1 = *v0;
  sub_22E846ED8();
  WeatherLaunchType.rawValue.getter(v1);
  sub_22E8469B8();
  swift_bridgeObjectRelease();
  return sub_22E846EF8();
}

uint64_t sub_22E83FFDC()
{
  WeatherLaunchType.rawValue.getter(*v0);
  sub_22E8469B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E840030()
{
  char v1 = *v0;
  sub_22E846ED8();
  WeatherLaunchType.rawValue.getter(v1);
  sub_22E8469B8();
  swift_bridgeObjectRelease();
  return sub_22E846EF8();
}

uint64_t sub_22E840090@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s25NanoWeatherKitUICompanion0B10LaunchTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22E8400C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherLaunchType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22E8400EC(void *a1@<X8>)
{
  *a1 = &unk_26E23AD70;
}

uint64_t WeatherLaunchDestination.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6F4E6C6961746564;
  }
  if (a1 == 1) {
    return 0x6F486C6961746564;
  }
  return 0x61446C6961746564;
}

uint64_t sub_22E84016C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22E841E80(*a1, *a2);
}

uint64_t sub_22E840178()
{
  return sub_22E846EF8();
}

uint64_t sub_22E840230()
{
  sub_22E8469B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E8402D4()
{
  return sub_22E846EF8();
}

uint64_t sub_22E840388@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s25NanoWeatherKitUICompanion0B17LaunchDestinationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_22E8403B8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000077;
  unint64_t v4 = 0xEC000000796C7275;
  uint64_t v5 = 0x6F486C6961746564;
  if (v2 != 1)
  {
    uint64_t v5 = 0x61446C6961746564;
    unint64_t v4 = 0xEB00000000796C69;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6F4E6C6961746564;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t _s25NanoWeatherKitUICompanion0B10LaunchTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22E846DD8();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE) {
    return 14;
  }
  else {
    return v0;
  }
}

uint64_t _s25NanoWeatherKitUICompanion0B17LaunchDestinationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22E846DD8();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_22E8404C8()
{
  unint64_t result = qword_2686154D8;
  if (!qword_2686154D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686154D8);
  }
  return result;
}

unint64_t sub_22E840520()
{
  unint64_t result = qword_2686154E0;
  if (!qword_2686154E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2686154E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686154E0);
  }
  return result;
}

unint64_t sub_22E840580()
{
  unint64_t result = qword_2686154F0;
  if (!qword_2686154F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686154F0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WeatherLaunchType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WeatherLaunchType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E840730);
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

ValueMetadata *type metadata accessor for WeatherLaunchType()
{
  return &type metadata for WeatherLaunchType;
}

unsigned char *storeEnumTagSinglePayload for WeatherLaunchDestination(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E840834);
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

ValueMetadata *type metadata accessor for WeatherLaunchDestination()
{
  return &type metadata for WeatherLaunchDestination;
}

uint64_t CLLocationCoordinate2D.isDaylight(for:)(double a1, double a2)
{
  return geo_isDayLightForLocation();
}

UIColor __swiftcall UIColor.init(hex:)(Swift::String hex)
{
  sub_22E846818();
  return (UIColor)sub_22E846C58();
}

uint64_t Color.blend(with:)()
{
  uint64_t v0 = sub_22E846828();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E846808();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  sub_22E846808();
  double v12 = v11 * v10 + v5 * (1.0 - v11);
  double v14 = v11 * v13 + v7 * (1.0 - v11);
  double v16 = v11 * v15 + v9 * (1.0 - v11);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F1B388], v0);
  return MEMORY[0x230FA5900](v3, v12, v14, v16, 1.0);
}

uint64_t static Color.blend(color1:intensity1:color2:intensity2:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = sub_22E846828();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  double v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v12 = a3 + a4;
  double v13 = a3 / (a3 + a4);
  if (v13 <= 0.0)
  {
    swift_retain();
    return a2;
  }
  else
  {
    double v14 = a4 / v12;
    if (a4 / v12 <= 0.0)
    {
      swift_retain();
    }
    else
    {
      sub_22E846808();
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      sub_22E846808();
      double v24 = v13 * v16 + v14 * v23;
      double v26 = v13 * v18 + v14 * v25;
      double v28 = v13 * v20 + v14 * v27;
      double v30 = v13 * v22 + v14 * v29;
      (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F1B388], v8);
      return MEMORY[0x230FA5900](v11, v24, v26, v28, v30);
    }
  }
  return a1;
}

BOOL sub_22E840BE8(void (*a1)(char *, char *, uint64_t))
{
  uint64_t v121 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686154F8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v100 = (char *)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E8466A8();
  unint64_t v118 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  double v113 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v112 = (char *)&v94 - v7;
  uint64_t v122 = sub_22E846698();
  uint64_t v120 = *(void *)(v122 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v122);
  uint64_t v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  double v111 = (char *)&v94 - v12;
  MEMORY[0x270FA5388](v11);
  double v14 = (char *)&v94 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615500);
  MEMORY[0x270FA5388](v15 - 8);
  double v17 = (char *)&v94 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v109 = (char *)&v94 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  double v99 = (char *)&v94 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  double v110 = (char *)&v94 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v114 = (char *)&v94 - v26;
  MEMORY[0x270FA5388](v25);
  double v28 = (char *)&v94 - v27;
  uint64_t v29 = sub_22E8460A8();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v95 = (char *)&v94 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  char v98 = (char *)&v94 - v33;
  uint64_t v119 = v1;
  sub_22E82CB80((uint64_t)v17);
  uint64_t v34 = sub_22E8463F8();
  uint64_t v35 = *(void *)(v34 - 8);
  int v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v17, 1, v34);
  uint64_t v115 = v29;
  uint64_t v97 = v30;
  if (v36 == 1)
  {
    sub_22E81C6A4((uint64_t)v17, &qword_268615500);
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
    v37(v28, 1, 1, v29);
LABEL_4:
    uint64_t v38 = v113;
    uint64_t v39 = (uint64_t)v28;
    uint64_t v40 = v10;
    uint64_t v41 = v98;
    sub_22E845FD8();
    sub_22E81C6A4(v39, &qword_2686150C0);
    uint64_t v29 = v115;
    goto LABEL_6;
  }
  sub_22E8463E8();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v34);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  v37(v28, 0, 1, v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1) {
    goto LABEL_4;
  }
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  uint64_t v41 = v98;
  v42(v98, v28, v29);
  uint64_t v38 = v113;
  uint64_t v40 = v10;
LABEL_6:
  sub_22E845FF8();
  if (v43 > 900.0)
  {
    (*(void (**)(char *, uint64_t))(v97 + 8))(v41, v29);
    return 0;
  }
  uint64_t v45 = v97;
  v37(v114, 1, 1, v29);
  uint64_t v46 = sub_22E846758();
  uint64_t v47 = *(void *)(v46 + 16);
  if (v47)
  {
    uint64_t v121 = *(void (**)(char *, char *, uint64_t))(v120 + 16);
    unint64_t v48 = (*(unsigned __int8 *)(v120 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80);
    uint64_t v94 = v46;
    unint64_t v49 = v46 + v48;
    unsigned int v107 = *MEMORY[0x263F1F590];
    uint64_t v106 = (void (**)(char *, void, uint64_t))(v118 + 104);
    v105 = (void (**)(char *, uint64_t))(v118 + 8);
    uint64_t v119 = (void (**)(char *, uint64_t))(v120 + 8);
    uint64_t v108 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48);
    uint64_t v96 = (void (**)(uint64_t, uint64_t))(v45 + 8);
    v120 += 16;
    uint64_t v101 = *(void *)(v120 + 56);
    uint64_t v102 = v4;
    uint64_t v50 = v14;
    char v51 = v112;
    uint64_t v52 = v122;
    uint64_t v104 = v50;
    uint64_t v103 = v40;
    while (1)
    {
      uint64_t v117 = v47;
      unint64_t v118 = v49;
      uint64_t v57 = v121;
      ((void (*)(char *))v121)(v50);
      sub_22E846648();
      (*v106)(v38, v107, v4);
      sub_22E84184C();
      sub_22E8469E8();
      sub_22E8469E8();
      BOOL v58 = v125 == v123 && v126 == v124;
      uint64_t v59 = v52;
      if (v58)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v69 = *v105;
        (*v105)(v38, v4);
        v69(v51, v4);
        uint64_t v64 = v111;
        v57(v111, v50, v59);
        uint64_t v65 = v119;
      }
      else
      {
        uint64_t v60 = v51;
        uint64_t v61 = v59;
        char v62 = sub_22E846EB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v63 = *v105;
        (*v105)(v38, v4);
        v63(v60, v4);
        uint64_t v64 = v111;
        v121(v111, v50, v61);
        uint64_t v65 = v119;
        if ((v62 & 1) == 0)
        {
          uint64_t v66 = *v119;
          (*v119)(v64, v122);
          BOOL v116 = 0;
          unsigned int v67 = v104;
          uint64_t v68 = v103;
          goto LABEL_23;
        }
      }
      uint64_t v70 = (uint64_t)v100;
      sub_22E846678();
      uint64_t v71 = sub_22E846738();
      uint64_t v72 = *(void *)(v71 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71) == 1)
      {
        uint64_t v66 = *v65;
        (*v65)(v64, v122);
        sub_22E81C6A4(v70, &qword_2686154F8);
        double v73 = 0.0;
      }
      else
      {
        sub_22E846728();
        double v73 = v74;
        uint64_t v66 = *v65;
        (*v65)(v64, v122);
        (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v70, v71);
      }
      unsigned int v67 = v104;
      uint64_t v68 = v103;
      BOOL v116 = v73 == 0.0;
LABEL_23:
      uint64_t v75 = v108;
      uint64_t v76 = (uint64_t)v110;
      sub_22E846658();
      uint64_t v77 = *v75;
      uint64_t v78 = v115;
      unsigned int v79 = (*v75)(v76, 1, v115);
      sub_22E81C6A4(v76, &qword_2686150C0);
      uint64_t v80 = v122;
      v121(v68, v67, v122);
      if (v79 == 1)
      {
        v66(v68, v80);
        if (!v116) {
          goto LABEL_34;
        }
LABEL_30:
        uint64_t v53 = v66;
        uint64_t v54 = (uint64_t)v114;
        uint64_t v52 = v122;
        goto LABEL_11;
      }
      uint64_t v81 = (uint64_t)v99;
      sub_22E846658();
      if (v77(v81, 1, v78) != 1)
      {
        sub_22E846058();
        double v83 = v82;
        v66(v68, v122);
        (*v96)(v81, v78);
        char v84 = v116;
        if (v83 <= 0.0) {
          char v84 = 1;
        }
        if ((v84 & 1) == 0)
        {
LABEL_34:
          uint64_t v85 = v66;
          swift_bridgeObjectRelease();
          uint64_t v87 = (uint64_t)v114;
          uint64_t v86 = v115;
          if (v77((uint64_t)v114, 1, v115))
          {
            v85(v67, v122);
            (*v96)((uint64_t)v98, v86);
            BOOL v44 = 1;
          }
          else
          {
            uint64_t v88 = v97 + 16;
            char v89 = v95;
            (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v95, v114, v86);
            sub_22E846058();
            double v91 = v90;
            uint64_t v92 = *(void (**)(char *, uint64_t))(v88 - 8);
            uint64_t v87 = (uint64_t)v114;
            v92(v89, v86);
            v85(v67, v122);
            v92(v98, v86);
            BOOL v44 = v91 <= 3000.0;
          }
          sub_22E81C6A4(v87, &qword_2686150C0);
          return v44;
        }
        goto LABEL_30;
      }
      uint64_t v52 = v122;
      uint64_t v53 = v66;
      v66(v68, v122);
      sub_22E81C6A4(v81, &qword_2686150C0);
      uint64_t v54 = (uint64_t)v114;
LABEL_11:
      uint64_t v50 = v67;
      uint64_t v55 = v117;
      uint64_t v56 = (uint64_t)v109;
      sub_22E846658();
      v53(v50, v52);
      sub_22E8418A4(v56, v54);
      unint64_t v49 = v118 + v101;
      uint64_t v47 = v55 - 1;
      uint64_t v4 = v102;
      char v51 = v112;
      uint64_t v38 = v113;
      if (!v47)
      {
        swift_bridgeObjectRelease();
        uint64_t v29 = v115;
        uint64_t v45 = v97;
        goto LABEL_33;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_33:
  (*(void (**)(char *, uint64_t))(v45 + 8))(v98, v29);
  sub_22E81C6A4((uint64_t)v114, &qword_2686150C0);
  return 0;
}

unint64_t sub_22E84184C()
{
  unint64_t result = qword_268615388;
  if (!qword_268615388)
  {
    sub_22E8466A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615388);
  }
  return result;
}

uint64_t sub_22E8418A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686150C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *PercentFormatter.shared.unsafeMutableAddressor()
{
  if (qword_268614E88 != -1) {
    swift_once();
  }
  return &static PercentFormatter.shared;
}

uint64_t sub_22E841958()
{
  type metadata accessor for PercentFormatter();
  swift_allocObject();
  uint64_t result = sub_22E8419F0();
  static PercentFormatter.shared = result;
  return result;
}

uint64_t static PercentFormatter.shared.getter()
{
  if (qword_268614E88 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_22E8419F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E846118();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  sub_22E8460E8();
  uint64_t v7 = (void *)sub_22E8460D8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v6, sel_setLocale_, v7);

  objc_msgSend(v6, sel_setNumberStyle_, 3);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = 0x3FF0000000000000;
  return v1;
}

Swift::String __swiftcall PercentFormatter.string(for:percentStyle:noValueStyle:)(Swift::Double_optional a1, NanoWeatherKitUICompanion::PercentStyle percentStyle, NanoWeatherKitUICompanion::FormatterNoValueStyle noValueStyle)
{
  unsigned __int8 v5 = v3;
  if (percentStyle) {
    goto LABEL_4;
  }
  id v6 = *(void **)(v4 + 16);
  uint64_t v7 = (void *)sub_22E846988();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setPercentSymbol_, v7);

  uint64_t v8 = (void *)sub_22E846A18();
  id v9 = objc_msgSend(v6, sel_stringForObjectValue_, v8);

  if (!v9)
  {
LABEL_4:
    uint64_t v13 = FormatterNoValueStyle.rawValue.getter(v5);
  }
  else
  {
    uint64_t v10 = sub_22E846998();
    uint64_t v12 = v11;

    uint64_t v13 = v10;
    double v14 = v12;
  }
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

uint64_t PercentFormatter.deinit()
{
  return v0;
}

uint64_t PercentFormatter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PercentFormatter()
{
  return self;
}

uint64_t sub_22E841CAC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x74726F6873;
  }
  else {
    uint64_t v3 = 0x647261646E617473;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x74726F6873;
  }
  else {
    uint64_t v5 = 0x647261646E617473;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22E841D50(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x72656E726F63;
  }
  else {
    uint64_t v3 = 0x72616C7563726963;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x72656E726F63;
  }
  else {
    uint64_t v5 = 0x72616C7563726963;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22E841DF4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 37;
  }
  if (v2) {
    unint64_t v4 = 0xE100000000000000;
  }
  else {
    unint64_t v4 = 0xE000000000000000;
  }
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 37;
  }
  if (a2) {
    unint64_t v6 = 0xE000000000000000;
  }
  else {
    unint64_t v6 = 0xE100000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22E841E80(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xE900000000000077;
  uint64_t v3 = 0x6F4E6C6961746564;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6F486C6961746564;
    }
    else {
      uint64_t v5 = 0x61446C6961746564;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEC000000796C7275;
    }
    else {
      unint64_t v6 = 0xEB00000000796C69;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x6F4E6C6961746564;
  unint64_t v6 = 0xE900000000000077;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6F486C6961746564;
    }
    else {
      uint64_t v3 = 0x61446C6961746564;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xEC000000796C7275;
    }
    else {
      unint64_t v2 = 0xEB00000000796C69;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22E846EB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t PrecipitationOutlook.AppViewModel.text.getter(uint64_t a1)
{
  return a1;
}

uint64_t PrecipitationOutlook.AppViewModel.fallback.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t PrecipitationOutlook.WidgetViewModel.text.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrecipitationOutlook.WidgetViewModel.fallback.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrecipitationOutlook.WidgetViewModel.textTint.getter()
{
  return swift_retain();
}

uint64_t PrecipitationOutlook.WidgetViewModel.image.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrecipitationOutlook.WidgetViewModel.imageTint.getter()
{
  return swift_retain();
}

uint64_t sub_22E8420C4()
{
  uint64_t v0 = sub_22E846118();
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22E846228();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E8461F8();
  sub_22E8460E8();
  type metadata accessor for NHPWidgetDateFormatter();
  swift_allocObject();
  uint64_t result = sub_22E83772C(v5, v2);
  qword_268615508 = result;
  return result;
}

uint64_t PrecipitationOutlook.ViewFormatter.AppType.init(rawValue:)()
{
  return sub_22E8428A4();
}

uint64_t PrecipitationOutlook.ViewFormatter.AppType.rawValue.getter(char a1)
{
  if (a1) {
    return 0x74726F6873;
  }
  else {
    return 0x647261646E617473;
  }
}

uint64_t sub_22E8421EC(char *a1, char *a2)
{
  return sub_22E841CAC(*a1, *a2);
}

uint64_t sub_22E8421F8()
{
  return sub_22E846EF8();
}

uint64_t sub_22E842278()
{
  sub_22E8469B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E8422E4()
{
  return sub_22E846EF8();
}

uint64_t sub_22E842360@<X0>(char *a1@<X8>)
{
  return sub_22E842AA8(a1);
}

void sub_22E84236C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x647261646E617473;
  if (*v1) {
    uint64_t v2 = 0x74726F6873;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_22E8423A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  char v8 = (char *)&v26 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - v9;
  sub_22E845E2C(v1, (uint64_t)&v26 - v9);
  uint64_t v11 = sub_22E846618();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11) == 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = (uint64_t)v10;
LABEL_20:
    sub_22E845D1C(v15);
    return v14;
  }
  uint64_t v27 = v8;
  char isPrecipitationSbvg_0 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
  double v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  v17(v10, v11);
  if (isPrecipitationSbvg_0)
  {
    uint64_t v18 = (uint64_t)v27;
    sub_22E845E2C(v1, (uint64_t)v27);
    if (v13((char *)v18, 1, v11) == 1) {
      goto LABEL_5;
    }
    sub_22E845E2C(v18, (uint64_t)v5);
    int v19 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v5, v11);
    if (v19 == *MEMORY[0x263F1F490])
    {
      if (qword_268614E40 == -1) {
        goto LABEL_19;
      }
    }
    else if (v19 == *MEMORY[0x263F1F4A0])
    {
      if (qword_268614E40 == -1) {
        goto LABEL_19;
      }
    }
    else if (v19 == *MEMORY[0x263F1F4C0])
    {
      if (qword_268614E40 == -1) {
        goto LABEL_19;
      }
    }
    else if (v19 == *MEMORY[0x263F1F4A8])
    {
      if (qword_268614E40 == -1)
      {
LABEL_19:
        id v20 = (id)qword_268615028;
        uint64_t v21 = (void *)sub_22E846988();
        uint64_t v22 = (void *)sub_22E846988();
        id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, v22);
        uint64_t v15 = (uint64_t)v27;
        id v24 = v23;

        uint64_t v14 = sub_22E846998();
        goto LABEL_20;
      }
    }
    else
    {
      if (v19 != *MEMORY[0x263F1F520])
      {
        v17(v5, v11);
LABEL_5:
        if (qword_268614E40 == -1) {
          goto LABEL_19;
        }
        goto LABEL_26;
      }
      if (qword_268614E40 == -1) {
        goto LABEL_19;
      }
    }
LABEL_26:
    swift_once();
    goto LABEL_19;
  }
  return 0;
}

uint64_t static PrecipitationOutlook.ViewFormatter.appViewModel(for:type:)(uint64_t a1, char a2)
{
  if (a2) {
    return sub_22E8437DC(a1);
  }
  else {
    return sub_22E843154(a1);
  }
}

uint64_t PrecipitationOutlook.ViewFormatter.WidgetType.init(rawValue:)()
{
  return sub_22E8428A4();
}

uint64_t sub_22E8428A4()
{
  uint64_t v0 = sub_22E846DD8();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t PrecipitationOutlook.ViewFormatter.WidgetType.rawValue.getter(char a1)
{
  if (a1) {
    return 0x72656E726F63;
  }
  else {
    return 0x72616C7563726963;
  }
}

uint64_t sub_22E842928(char *a1, char *a2)
{
  return sub_22E841D50(*a1, *a2);
}

uint64_t sub_22E842934()
{
  return sub_22E846EF8();
}

uint64_t sub_22E8429B4()
{
  sub_22E8469B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E842A20()
{
  return sub_22E846EF8();
}

uint64_t sub_22E842A9C@<X0>(char *a1@<X8>)
{
  return sub_22E842AA8(a1);
}

uint64_t sub_22E842AA8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22E846DD8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_22E842B04(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x72616C7563726963;
  if (*v1) {
    uint64_t v2 = 0x72656E726F63;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_22E842B40()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  char v8 = (char *)&v24 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  sub_22E845E2C(v0, (uint64_t)&v24 - v9);
  uint64_t v11 = sub_22E846618();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11) == 1)
  {
    uint64_t v14 = 0;
    char v8 = v10;
LABEL_19:
    sub_22E845D1C((uint64_t)v8);
    return v14;
  }
  char isPrecipitationSbvg_0 = _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0();
  uint64_t v16 = v10;
  double v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  v17(v16, v11);
  if (isPrecipitationSbvg_0)
  {
    sub_22E845E2C(v1, (uint64_t)v8);
    if (v13(v8, 1, v11) == 1)
    {
LABEL_5:
      uint64_t v14 = 0;
      goto LABEL_19;
    }
    sub_22E845E2C((uint64_t)v8, (uint64_t)v5);
    int v18 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v5, v11);
    if (v18 == *MEMORY[0x263F1F490])
    {
      if (qword_268614E40 == -1) {
        goto LABEL_18;
      }
    }
    else if (v18 == *MEMORY[0x263F1F4A0])
    {
      if (qword_268614E40 == -1) {
        goto LABEL_18;
      }
    }
    else if (v18 == *MEMORY[0x263F1F4C0])
    {
      if (qword_268614E40 == -1) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v18 != *MEMORY[0x263F1F4A8])
      {
        v17(v5, v11);
        goto LABEL_5;
      }
      if (qword_268614E40 == -1)
      {
LABEL_18:
        id v19 = (id)qword_268615028;
        id v20 = (void *)sub_22E846988();
        uint64_t v21 = (void *)sub_22E846988();
        id v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, v21);

        uint64_t v14 = sub_22E846998();
        goto LABEL_19;
      }
    }
    swift_once();
    goto LABEL_18;
  }
  return 0;
}

__n128 static PrecipitationOutlook.ViewFormatter.widgetViewModel(for:type:)@<Q0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (a2) {
    sub_22E844A3C(a1, v9);
  }
  else {
    sub_22E8441F4(a1, v9);
  }
  uint64_t v5 = v12;
  uint64_t v4 = v13;
  uint64_t v6 = v9[1];
  long long v8 = v10;
  __n128 result = v11;
  *(void *)a3 = v9[0];
  *(void *)(a3 + 8) = v6;
  *(_OWORD *)(a3 + 16) = v8;
  *(__n128 *)(a3 + 32) = result;
  *(void *)(a3 + 48) = v5;
  *(void *)(a3 + 56) = v4;
  return result;
}

uint64_t PrecipitationOutlook.appViewModel(for:)(char a1)
{
  if (a1) {
    return sub_22E8437DC(v1);
  }
  else {
    return sub_22E843154(v1);
  }
}

__n128 PrecipitationOutlook.widgetViewModel(for:)@<Q0>(char a1@<W0>, uint64_t a2@<X8>)
{
  if (a1) {
    sub_22E844A3C(v2, v9);
  }
  else {
    sub_22E8441F4(v2, v9);
  }
  uint64_t v5 = v12;
  uint64_t v4 = v13;
  uint64_t v6 = v9[1];
  long long v8 = v10;
  __n128 result = v11;
  *(void *)a2 = v9[0];
  *(void *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v8;
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + 56) = v4;
  return result;
}

uint64_t sub_22E843154(uint64_t a1)
{
  uint64_t v2 = sub_22E846118();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615520);
  uint64_t v38 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v6);
  long long v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  MEMORY[0x270FA5388](v9 - 8);
  __n128 v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PrecipitationOutlook(0);
  sub_22E845C5C(a1 + *(int *)(v12 + 32), (uint64_t)v8);
  uint64_t v13 = 0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v37 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48)];
      sub_22E846A38();
      uint64_t v15 = v14;
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v16 = (id)qword_268615028;
      double v17 = (void *)sub_22E846988();
      int v18 = (void *)sub_22E846988();
      id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

      v36[1] = sub_22E846998();
      void v36[2] = v20;

      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_22E848280;
      uint64_t v39 = v15;
      sub_22E8460E8();
      sub_22E845D7C();
      sub_22E845FA8();
      *(void *)(v21 + 56) = MEMORY[0x263F8D310];
      unint64_t v22 = sub_22E826E64();
      *(void *)(v21 + 64) = v22;
      sub_22E845DD0();
      sub_22E846938();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v3);
      Swift::Double v23 = *(double *)(a1 + *(int *)(v12 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v24 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v23, NSDateComponentsFormatterUnitsStyleFull);
      *(void *)(v21 + 96) = MEMORY[0x263F8D310];
      *(void *)(v21 + 104) = v22;
      *(Swift::String *)(v21 + 72) = v24;
      uint64_t v13 = sub_22E8469A8();
      swift_bridgeObjectRelease();
      sub_22E845D1C((uint64_t)v37);
      uint64_t v25 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v8, v25);
      break;
    case 2u:
      uint64_t v26 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
      sub_22E827C3C((uint64_t)v8, (uint64_t)v11);
      uint64_t v27 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
      goto LABEL_9;
    case 3u:
      return v13;
    case 4u:
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v28 = (id)qword_268615028;
      uint64_t v29 = (void *)sub_22E846988();
      uint64_t v30 = (void *)sub_22E846988();
      id v31 = objc_msgSend(v28, sel_localizedStringForKey_value_table_, v29, 0, v30);

      sub_22E846998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_22E848DA0;
      Swift::Double v33 = *(double *)(a1 + *(int *)(v12 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v34 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v33, NSDateComponentsFormatterUnitsStyleFull);
      *(void *)(v32 + 56) = MEMORY[0x263F8D310];
      *(void *)(v32 + 64) = sub_22E826E64();
      *(Swift::String *)(v32 + 32) = v34;
      uint64_t v13 = sub_22E8469A8();
      swift_bridgeObjectRelease();
      break;
    default:
      sub_22E827C3C((uint64_t)v8, (uint64_t)v11);
LABEL_9:
      uint64_t v13 = sub_22E8423A8();
      sub_22E845D1C((uint64_t)v11);
      break;
  }
  return v13;
}

uint64_t sub_22E8437DC(uint64_t a1)
{
  uint64_t v2 = sub_22E846118();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615520);
  uint64_t v38 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v6);
  long long v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  MEMORY[0x270FA5388](v9 - 8);
  __n128 v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PrecipitationOutlook(0);
  sub_22E845C5C(a1 + *(int *)(v12 + 32), (uint64_t)v8);
  uint64_t v13 = 0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v37 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48)];
      sub_22E846A38();
      uint64_t v15 = v14;
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v16 = (id)qword_268615028;
      double v17 = (void *)sub_22E846988();
      int v18 = (void *)sub_22E846988();
      id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

      v36[1] = sub_22E846998();
      void v36[2] = v20;

      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_22E848280;
      uint64_t v39 = v15;
      sub_22E8460E8();
      sub_22E845D7C();
      sub_22E845FA8();
      *(void *)(v21 + 56) = MEMORY[0x263F8D310];
      unint64_t v22 = sub_22E826E64();
      *(void *)(v21 + 64) = v22;
      sub_22E845DD0();
      sub_22E846938();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v3);
      Swift::Double v23 = *(double *)(a1 + *(int *)(v12 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v24 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v23, NSDateComponentsFormatterUnitsStyleFull);
      *(void *)(v21 + 96) = MEMORY[0x263F8D310];
      *(void *)(v21 + 104) = v22;
      *(Swift::String *)(v21 + 72) = v24;
      uint64_t v13 = sub_22E8469A8();
      swift_bridgeObjectRelease();
      sub_22E845D1C((uint64_t)v37);
      uint64_t v25 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v8, v25);
      break;
    case 2u:
      uint64_t v26 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
      sub_22E827C3C((uint64_t)v8, (uint64_t)v11);
      uint64_t v27 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
      goto LABEL_9;
    case 3u:
      return v13;
    case 4u:
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v28 = (id)qword_268615028;
      uint64_t v29 = (void *)sub_22E846988();
      uint64_t v30 = (void *)sub_22E846988();
      id v31 = objc_msgSend(v28, sel_localizedStringForKey_value_table_, v29, 0, v30);

      sub_22E846998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_22E848DA0;
      Swift::Double v33 = *(double *)(a1 + *(int *)(v12 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v34 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v33, NSDateComponentsFormatterUnitsStyleShort);
      *(void *)(v32 + 56) = MEMORY[0x263F8D310];
      *(void *)(v32 + 64) = sub_22E826E64();
      *(Swift::String *)(v32 + 32) = v34;
      uint64_t v13 = sub_22E8469A8();
      swift_bridgeObjectRelease();
      break;
    default:
      sub_22E827C3C((uint64_t)v8, (uint64_t)v11);
LABEL_9:
      uint64_t v13 = sub_22E8423A8();
      sub_22E845D1C((uint64_t)v11);
      break;
  }
  return v13;
}

uint64_t sub_22E843E64(uint64_t a1)
{
  uint64_t v2 = sub_22E846618();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PrecipitationOutlook.State(0);
  MEMORY[0x270FA5388](v6);
  long long v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v27 - v13;
  sub_22E846858();
  uint64_t v15 = type metadata accessor for PrecipitationOutlook(0);
  sub_22E845C5C(a1 + *(int *)(v15 + 32), (uint64_t)v8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, &v8[*(int *)(v17 + 48)], v2);
    char v18 = *(unsigned char *)(a1 + *(int *)(v15 + 24));
    if (qword_268614E50 != -1) {
      swift_once();
    }
    uint64_t v19 = _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0((uint64_t)v5, v18);
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v21) {
      swift_release();
    }
    else {
      uint64_t v19 = 0x616C6C6572626D75;
    }
    sub_22E845D1C((uint64_t)v8);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0);
      sub_22E827C3C((uint64_t)&v8[*(int *)(v22 + 48)], (uint64_t)v14);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        sub_22E845CC0((uint64_t)v8);
        return 0x616C6C6572626D75;
      }
      sub_22E827C3C((uint64_t)v8, (uint64_t)v14);
    }
    char v23 = *(unsigned char *)(a1 + *(int *)(v15 + 24));
    sub_22E827C3C((uint64_t)v14, (uint64_t)v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
    {
      sub_22E845D1C((uint64_t)v12);
      return 0x616C6C6572626D75;
    }
    uint64_t v19 = _s25NanoWeatherKitUICompanion0B21ConditionSymbolMapperC17conditionIconName0H09isDaytimeSSSg0bC00bE0O_SbtF_0((uint64_t)v12, v23);
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    if (!v25) {
      return 0x616C6C6572626D75;
    }
    swift_release();
  }
  return v19;
}

uint64_t sub_22E8441F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_22E846118();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615520);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E8460A8();
  uint64_t v70 = *(void *)(v9 - 8);
  uint64_t v71 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  double v74 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v69 - v15;
  uint64_t v17 = type metadata accessor for PrecipitationOutlook(0);
  uint64_t v18 = *(int *)(v17 + 32);
  uint64_t v75 = a1;
  uint64_t v72 = a1 + v18;
  sub_22E845C5C(a1 + v18, (uint64_t)v16);
  uint64_t v73 = v12;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0);
      sub_22E845D1C((uint64_t)&v16[*(int *)(v26 + 48)]);
      uint64_t v27 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v16, v27);
      goto LABEL_7;
    case 2u:
      id v28 = &v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
      uint64_t v29 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
      sub_22E845D1C((uint64_t)v16);
LABEL_7:
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v30 = (id)qword_268615028;
      id v31 = (void *)sub_22E846988();
      uint64_t v32 = (void *)sub_22E846988();
      id v33 = objc_msgSend(v30, sel_localizedStringForKey_value_table_, v31, 0, v32);

      sub_22E846998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_22E848DA0;
      uint64_t v35 = v75;
      Swift::Double v36 = *(double *)(v75 + *(int *)(v17 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v37 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v36, NSDateComponentsFormatterUnitsStyleAbbreviated);
      *(void *)(v34 + 56) = MEMORY[0x263F8D310];
      *(void *)(v34 + 64) = sub_22E826E64();
      *(Swift::String *)(v34 + 32) = v37;
      uint64_t v23 = sub_22E8469A8();
      uint64_t v25 = v38;
      swift_bridgeObjectRelease();
      sub_22E846048();
      uint64_t v39 = NHPWidgetDateFormatter.absoluteTimeString(for:withChange:)(v36);
      uint64_t v41 = v40;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v11, v71);
      goto LABEL_17;
    case 3u:
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v42 = (id)qword_268615028;
      double v43 = (void *)sub_22E846988();
      BOOL v44 = (void *)sub_22E846988();
      uint64_t v45 = (void *)sub_22E846988();
      id v46 = objc_msgSend(v42, sel_localizedStringForKey_value_table_, v43, v44, v45);

      uint64_t v23 = sub_22E846998();
      uint64_t v25 = v47;

      goto LABEL_15;
    case 4u:
      uint64_t v35 = v75;
      sub_22E846A38();
      uint64_t v76 = v48;
      sub_22E8460E8();
      sub_22E845D7C();
      sub_22E845FA8();
      sub_22E845DD0();
      sub_22E846938();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      uint64_t v39 = 0;
      uint64_t v41 = 0;
      uint64_t v23 = v77;
      uint64_t v25 = v78;
      goto LABEL_17;
    default:
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v19 = (id)qword_268615028;
      uint64_t v20 = (void *)sub_22E846988();
      uint64_t v21 = (void *)sub_22E846988();
      id v22 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, v21);

      uint64_t v23 = sub_22E846998();
      uint64_t v25 = v24;

      sub_22E845CC0((uint64_t)v16);
LABEL_15:
      uint64_t v39 = 0;
      uint64_t v41 = 0;
      uint64_t v35 = v75;
LABEL_17:
      uint64_t v49 = (uint64_t)v74;
      uint64_t v50 = sub_22E843E64(v35);
      uint64_t v52 = v51;
      uint64_t v54 = v53;
      sub_22E845C5C(v72, v49);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v55 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48);
        uint64_t v75 = v54;
        uint64_t v56 = v52;
        uint64_t v57 = v50;
        uint64_t v58 = v41;
        uint64_t v59 = v39;
        uint64_t v60 = a2;
        uint64_t v61 = v25;
        uint64_t v62 = v23;
        uint64_t v63 = v49 + v55;
        uint64_t v64 = sub_22E846888();
        uint64_t v65 = sub_22E846618();
        uint64_t v66 = v63;
        uint64_t v23 = v62;
        uint64_t v25 = v61;
        a2 = v60;
        uint64_t v39 = v59;
        uint64_t v41 = v58;
        uint64_t v50 = v57;
        uint64_t v52 = v56;
        uint64_t v54 = v75;
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v65 - 8) + 8))(v66, v65);
        uint64_t result = sub_22E845D1C(v49);
      }
      else
      {
        id v68 = objc_msgSend(self, sel_systemCyanColor);
        uint64_t v64 = MEMORY[0x230FA5910](v68);
        uint64_t result = sub_22E845CC0(v49);
      }
      *a2 = v23;
      a2[1] = v25;
      a2[2] = v39;
      a2[3] = v41;
      a2[4] = v64;
      a2[5] = v50;
      a2[6] = v52;
      a2[7] = v54;
      return result;
  }
}

uint64_t sub_22E844A3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_22E846118();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615520);
  uint64_t v85 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PrecipitationOutlook.State(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)v81 - v15;
  uint64_t v17 = type metadata accessor for PrecipitationOutlook(0);
  uint64_t v87 = a1 + *(int *)(v17 + 32);
  sub_22E845C5C(v87, (uint64_t)v16);
  uint64_t v88 = v11;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      char v84 = v14;
      double v82 = &v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151B0) + 48)];
      sub_22E846A38();
      uint64_t v23 = v22;
      uint64_t v83 = a1;
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v24 = (id)qword_268615028;
      uint64_t v25 = (void *)sub_22E846988();
      uint64_t v26 = (void *)sub_22E846988();
      id v27 = objc_msgSend(v24, sel_localizedStringForKey_value_table_, v25, 0, v26);

      uint64_t v86 = sub_22E846998();
      v81[0] = v28;

      v81[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_22E848280;
      uint64_t v90 = v23;
      sub_22E8460E8();
      sub_22E845D7C();
      sub_22E845FA8();
      *(void *)(v29 + 56) = MEMORY[0x263F8D310];
      unint64_t v30 = sub_22E826E64();
      *(void *)(v29 + 64) = v30;
      sub_22E845DD0();
      sub_22E846938();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v7, v5);
      a1 = v83;
      Swift::Double v31 = *(double *)(v83 + *(int *)(v17 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v32 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v31, NSDateComponentsFormatterUnitsStyleAbbreviated);
      uint64_t v33 = MEMORY[0x263F8D310];
      *(void *)(v29 + 96) = MEMORY[0x263F8D310];
      *(void *)(v29 + 104) = v30;
      *(Swift::String *)(v29 + 72) = v32;
      uint64_t v86 = sub_22E8469A8();
      uint64_t v19 = v34;
      swift_bridgeObjectRelease();
      id v35 = (id)qword_268615028;
      Swift::Double v36 = (void *)sub_22E846988();
      Swift::String v37 = (void *)sub_22E846988();
      id v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, 0, v37);

      sub_22E846998();
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_22E848DA0;
      Swift::String v40 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v31, NSDateComponentsFormatterUnitsStyleAbbreviated);
      *(void *)(v39 + 56) = v33;
      *(void *)(v39 + 64) = v30;
      *(Swift::String *)(v39 + 32) = v40;
      uint64_t v20 = sub_22E8469A8();
      uint64_t v21 = v41;
      swift_bridgeObjectRelease();
      sub_22E845D1C((uint64_t)v82);
      uint64_t v42 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v42 - 8) + 8))(v16, v42);
      goto LABEL_21;
    case 2u:
      uint64_t v43 = a1;
      char v84 = v14;
      BOOL v44 = &v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v45 = (id)qword_268615028;
      id v46 = (void *)sub_22E846988();
      uint64_t v47 = (void *)sub_22E846988();
      id v48 = objc_msgSend(v45, sel_localizedStringForKey_value_table_, v46, 0, v47);

      sub_22E846998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_22E848DA0;
      Swift::Double v50 = *(double *)(v43 + *(int *)(v17 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v51 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v50, NSDateComponentsFormatterUnitsStyleAbbreviated);
      *(void *)(v49 + 56) = MEMORY[0x263F8D310];
      *(void *)(v49 + 64) = sub_22E826E64();
      *(Swift::String *)(v49 + 32) = v51;
      uint64_t v86 = sub_22E8469A8();
      uint64_t v19 = v52;
      swift_bridgeObjectRelease();
      uint64_t v53 = sub_22E846618();
      (*(void (**)(char *, uint64_t))(*(void *)(v53 - 8) + 8))(v44, v53);
      sub_22E845D1C((uint64_t)v16);
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v14 = v84;
      a1 = v43;
      break;
    case 3u:
      uint64_t v54 = a1;
      uint64_t v55 = v14;
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v56 = (id)qword_268615028;
      uint64_t v57 = (void *)sub_22E846988();
      uint64_t v58 = (void *)sub_22E846988();
      uint64_t v59 = (void *)sub_22E846988();
      id v60 = objc_msgSend(v56, sel_localizedStringForKey_value_table_, v57, v58, v59);

      uint64_t v86 = sub_22E846998();
      uint64_t v19 = v61;

      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v14 = v55;
      a1 = v54;
      break;
    case 4u:
      uint64_t v83 = a1;
      char v84 = v14;
      if (qword_268614E40 != -1) {
        swift_once();
      }
      id v62 = (id)qword_268615028;
      uint64_t v63 = (void *)sub_22E846988();
      uint64_t v64 = (void *)sub_22E846988();
      id v65 = objc_msgSend(v62, sel_localizedStringForKey_value_table_, v63, 0, v64);

      uint64_t v86 = sub_22E846998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268615150);
      uint64_t v66 = swift_allocObject();
      *(_OWORD *)(v66 + 16) = xmmword_22E848DA0;
      a1 = v83;
      Swift::Double v67 = *(double *)(v83 + *(int *)(v17 + 20));
      if (qword_268614E90 != -1) {
        swift_once();
      }
      Swift::String v68 = NHPWidgetDateFormatter.relativeTimeString(for:style:)(v67, NSDateComponentsFormatterUnitsStyleAbbreviated);
      *(void *)(v66 + 56) = MEMORY[0x263F8D310];
      *(void *)(v66 + 64) = sub_22E826E64();
      *(Swift::String *)(v66 + 32) = v68;
      uint64_t v86 = sub_22E8469A8();
      uint64_t v19 = v69;
      swift_bridgeObjectRelease();
      sub_22E846A38();
      uint64_t v89 = v70;
      sub_22E8460E8();
      sub_22E845D7C();
      sub_22E845FA8();
      sub_22E845DD0();
      sub_22E846938();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v7, v5);
      uint64_t v20 = v90;
      uint64_t v21 = v91;
LABEL_21:
      uint64_t v14 = v84;
      break;
    default:
      sub_22E827C3C((uint64_t)v16, (uint64_t)v10);
      uint64_t v86 = sub_22E842B40();
      uint64_t v19 = v18;
      sub_22E845D1C((uint64_t)v10);
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      break;
  }
  uint64_t v71 = sub_22E843E64(a1);
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  sub_22E845C5C(v87, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v76 = &v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686151A0) + 48)];
    uint64_t v77 = sub_22E846888();
    uint64_t v78 = sub_22E846618();
    (*(void (**)(char *, uint64_t))(*(void *)(v78 - 8) + 8))(v76, v78);
    uint64_t result = sub_22E845D1C((uint64_t)v14);
  }
  else
  {
    id v80 = objc_msgSend(self, sel_systemCyanColor);
    uint64_t v77 = MEMORY[0x230FA5910](v80);
    uint64_t result = sub_22E845CC0((uint64_t)v14);
  }
  *a2 = v86;
  a2[1] = v19;
  a2[2] = v20;
  a2[3] = v21;
  a2[4] = v77;
  a2[5] = v71;
  a2[6] = v73;
  a2[7] = v75;
  return result;
}

unint64_t sub_22E8455F0()
{
  unint64_t result = qword_268615510;
  if (!qword_268615510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615510);
  }
  return result;
}

unint64_t sub_22E845648()
{
  unint64_t result = qword_268615518;
  if (!qword_268615518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615518);
  }
  return result;
}

uint64_t _s12AppViewModelVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s12AppViewModelVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s12AppViewModelVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *_s12AppViewModelVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12AppViewModelVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s12AppViewModelVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.AppViewModel()
{
  return &type metadata for PrecipitationOutlook.AppViewModel;
}

uint64_t _s15WidgetViewModelVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *_s15WidgetViewModelVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *_s15WidgetViewModelVwca(void *a1, void *a2)
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
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  return a1;
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

uint64_t _s15WidgetViewModelVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t _s15WidgetViewModelVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s15WidgetViewModelVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.WidgetViewModel()
{
  return &type metadata for PrecipitationOutlook.WidgetViewModel;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.ViewFormatter()
{
  return &type metadata for PrecipitationOutlook.ViewFormatter;
}

ValueMetadata *type metadata accessor for PrecipitationOutlook.ViewFormatter.AppType()
{
  return &type metadata for PrecipitationOutlook.ViewFormatter.AppType;
}

unsigned char *_s13ViewFormatterV7AppTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E845C24);
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

ValueMetadata *type metadata accessor for PrecipitationOutlook.ViewFormatter.WidgetType()
{
  return &type metadata for PrecipitationOutlook.ViewFormatter.WidgetType;
}

uint64_t sub_22E845C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrecipitationOutlook.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E845CC0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PrecipitationOutlook.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E845D1C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22E845D7C()
{
  unint64_t result = qword_268615528;
  if (!qword_268615528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615528);
  }
  return result;
}

unint64_t sub_22E845DD0()
{
  unint64_t result = qword_268615530;
  if (!qword_268615530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268615520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268615530);
  }
  return result;
}

uint64_t sub_22E845E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268615198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E845E98()
{
  return MEMORY[0x270EEDFA0]();
}

uint64_t sub_22E845EA8()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_22E845EB8()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_22E845EC8()
{
  return MEMORY[0x270F85268]();
}

uint64_t sub_22E845ED8()
{
  return MEMORY[0x270EEDFF8]();
}

uint64_t sub_22E845EE8()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_22E845EF8()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_22E845F08()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_22E845F18()
{
  return MEMORY[0x270EEE590]();
}

uint64_t sub_22E845F28()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_22E845F38()
{
  return MEMORY[0x270EEE6C8]();
}

uint64_t sub_22E845F48()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_22E845F58()
{
  return MEMORY[0x270EEE818]();
}

uint64_t sub_22E845F68()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_22E845F78()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_22E845F88()
{
  return MEMORY[0x270EEE8B8]();
}

uint64_t sub_22E845F98()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22E845FA8()
{
  return MEMORY[0x270EEF978]();
}

uint64_t sub_22E845FB8()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_22E845FC8()
{
  return MEMORY[0x270F84AE8]();
}

uint64_t sub_22E845FD8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_22E845FE8()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_22E845FF8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_22E846008()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_22E846018()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22E846028()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22E846038()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_22E846048()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_22E846058()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_22E846068()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_22E846078()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22E846088()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_22E846098()
{
  return MEMORY[0x270F85320]();
}

uint64_t sub_22E8460A8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t _s25NanoWeatherKitUICompanion23LocationForecastSummaryV2id10Foundation4UUIDVvpfi_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22E8460C8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22E8460D8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_22E8460E8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_22E8460F8()
{
  return MEMORY[0x270EF1098]();
}

uint64_t sub_22E846108()
{
  return MEMORY[0x270EF10A0]();
}

uint64_t sub_22E846118()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22E846128()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_22E846138()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_22E846148()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_22E846158()
{
  return MEMORY[0x270EF1258]();
}

uint64_t _s25NanoWeatherKitUICompanion21LocationDateFormatterC8calendar33_F11D3163793300FBD0749B496D3764F4LL10Foundation8CalendarVvpfi_0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_22E846178()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_22E846188()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22E846198()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_22E8461A8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22E8461B8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22E8461C8()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_22E8461D8()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_22E8461E8()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_22E8461F8()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_22E846208()
{
  return MEMORY[0x270EF15E0]();
}

uint64_t sub_22E846218()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_22E846228()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_22E846238()
{
  return MEMORY[0x270F06B50]();
}

uint64_t sub_22E846248()
{
  return MEMORY[0x270F06B68]();
}

uint64_t sub_22E846258()
{
  return MEMORY[0x270F06B70]();
}

uint64_t sub_22E846268()
{
  return MEMORY[0x270F06B88]();
}

uint64_t sub_22E846278()
{
  return MEMORY[0x270F06B90]();
}

uint64_t sub_22E846288()
{
  return MEMORY[0x270F06B98]();
}

uint64_t sub_22E846298()
{
  return MEMORY[0x270F06BA8]();
}

uint64_t sub_22E8462A8()
{
  return MEMORY[0x270F06BB0]();
}

uint64_t sub_22E8462B8()
{
  return MEMORY[0x270F06BB8]();
}

uint64_t sub_22E8462C8()
{
  return MEMORY[0x270F06BC0]();
}

uint64_t sub_22E8462D8()
{
  return MEMORY[0x270F06BD0]();
}

uint64_t sub_22E8462E8()
{
  return MEMORY[0x270F06BD8]();
}

uint64_t sub_22E8462F8()
{
  return MEMORY[0x270F06BF8]();
}

uint64_t sub_22E846308()
{
  return MEMORY[0x270F06C10]();
}

uint64_t sub_22E846318()
{
  return MEMORY[0x270F06C18]();
}

uint64_t sub_22E846328()
{
  return MEMORY[0x270F06C20]();
}

uint64_t sub_22E846338()
{
  return MEMORY[0x270F06C28]();
}

uint64_t sub_22E846348()
{
  return MEMORY[0x270F06C30]();
}

uint64_t sub_22E846358()
{
  return MEMORY[0x270F06C38]();
}

uint64_t sub_22E846368()
{
  return MEMORY[0x270F06C40]();
}

uint64_t sub_22E846378()
{
  return MEMORY[0x270F06C48]();
}

uint64_t sub_22E846388()
{
  return MEMORY[0x270F06C50]();
}

uint64_t sub_22E846398()
{
  return MEMORY[0x270F06C58]();
}

uint64_t sub_22E8463A8()
{
  return MEMORY[0x270F06C68]();
}

uint64_t sub_22E8463B8()
{
  return MEMORY[0x270F06C70]();
}

uint64_t sub_22E8463C8()
{
  return MEMORY[0x270F06C78]();
}

uint64_t sub_22E8463D8()
{
  return MEMORY[0x270F06C88]();
}

uint64_t sub_22E8463E8()
{
  return MEMORY[0x270F06C98]();
}

uint64_t sub_22E8463F8()
{
  return MEMORY[0x270F06CA0]();
}

uint64_t sub_22E846408()
{
  return MEMORY[0x270F06CA8]();
}

uint64_t sub_22E846418()
{
  return MEMORY[0x270F06CB8]();
}

uint64_t sub_22E846428()
{
  return MEMORY[0x270F06CC0]();
}

uint64_t sub_22E846438()
{
  return MEMORY[0x270F06CC8]();
}

uint64_t sub_22E846448()
{
  return MEMORY[0x270F06CD0]();
}

uint64_t sub_22E846458()
{
  return MEMORY[0x270F06CD8]();
}

uint64_t sub_22E846468()
{
  return MEMORY[0x270F06CE0]();
}

uint64_t sub_22E846478()
{
  return MEMORY[0x270F06D38]();
}

uint64_t sub_22E846488()
{
  return MEMORY[0x270F06D40]();
}

uint64_t sub_22E846498()
{
  return MEMORY[0x270F06D48]();
}

uint64_t sub_22E8464A8()
{
  return MEMORY[0x270F06D50]();
}

uint64_t sub_22E8464B8()
{
  return MEMORY[0x270F06D58]();
}

uint64_t sub_22E8464C8()
{
  return MEMORY[0x270F06D60]();
}

uint64_t sub_22E8464D8()
{
  return MEMORY[0x270F06D68]();
}

uint64_t sub_22E8464E8()
{
  return MEMORY[0x270F06D70]();
}

uint64_t sub_22E8464F8()
{
  return MEMORY[0x270F06D78]();
}

uint64_t sub_22E846508()
{
  return MEMORY[0x270F06D80]();
}

uint64_t sub_22E846518()
{
  return MEMORY[0x270F06D88]();
}

uint64_t sub_22E846528()
{
  return MEMORY[0x270F06D90]();
}

uint64_t sub_22E846538()
{
  return MEMORY[0x270F06D98]();
}

uint64_t sub_22E846548()
{
  return MEMORY[0x270F06DA0]();
}

uint64_t sub_22E846558()
{
  return MEMORY[0x270F06DA8]();
}

uint64_t sub_22E846568()
{
  return MEMORY[0x270F06DB0]();
}

uint64_t sub_22E846578()
{
  return MEMORY[0x270F06DB8]();
}

uint64_t sub_22E846588()
{
  return MEMORY[0x270F06DC0]();
}

uint64_t sub_22E846598()
{
  return MEMORY[0x270F06DC8]();
}

uint64_t sub_22E8465A8()
{
  return MEMORY[0x270F06DD0]();
}

uint64_t sub_22E8465B8()
{
  return MEMORY[0x270F06DD8]();
}

uint64_t sub_22E8465C8()
{
  return MEMORY[0x270F06DE0]();
}

uint64_t sub_22E8465D8()
{
  return MEMORY[0x270F06DE8]();
}

uint64_t sub_22E8465E8()
{
  return MEMORY[0x270F06EC0]();
}

uint64_t sub_22E8465F8()
{
  return MEMORY[0x270F06ED8]();
}

uint64_t _s10WeatherKit0A9ConditionO04NanoaB11UICompanionE21nwkui_isPrecipitationSbvg_0()
{
  return MEMORY[0x270F85368]();
}

uint64_t sub_22E846618()
{
  return MEMORY[0x270F06EF8]();
}

uint64_t sub_22E846628()
{
  return MEMORY[0x270F06F78]();
}

uint64_t sub_22E846638()
{
  return MEMORY[0x270F06F80]();
}

uint64_t sub_22E846648()
{
  return MEMORY[0x270F06F98]();
}

uint64_t sub_22E846658()
{
  return MEMORY[0x270F06FA0]();
}

uint64_t sub_22E846668()
{
  return MEMORY[0x270F06FA8]();
}

uint64_t sub_22E846678()
{
  return MEMORY[0x270F06FB0]();
}

uint64_t sub_22E846688()
{
  return MEMORY[0x270F06FB8]();
}

uint64_t sub_22E846698()
{
  return MEMORY[0x270F06FC0]();
}

uint64_t sub_22E8466A8()
{
  return MEMORY[0x270F06FE0]();
}

uint64_t sub_22E8466B8()
{
  return MEMORY[0x270F07000]();
}

uint64_t sub_22E8466C8()
{
  return MEMORY[0x270F07008]();
}

uint64_t sub_22E8466D8()
{
  return MEMORY[0x270F07010]();
}

uint64_t sub_22E8466E8()
{
  return MEMORY[0x270F07018]();
}

uint64_t sub_22E8466F8()
{
  return MEMORY[0x270F07020]();
}

uint64_t sub_22E846708()
{
  return MEMORY[0x270F07028]();
}

uint64_t sub_22E846718()
{
  return MEMORY[0x270F07030]();
}

uint64_t sub_22E846728()
{
  return MEMORY[0x270F071A0]();
}

uint64_t sub_22E846738()
{
  return MEMORY[0x270F071A8]();
}

uint64_t sub_22E846748()
{
  return MEMORY[0x270F07260]();
}

uint64_t sub_22E846758()
{
  return MEMORY[0x270F07288]();
}

uint64_t sub_22E846768()
{
  return MEMORY[0x270F07298]();
}

uint64_t sub_22E846778()
{
  return MEMORY[0x270F072A0]();
}

uint64_t sub_22E846788()
{
  return MEMORY[0x270F072C8]();
}

uint64_t sub_22E846798()
{
  return MEMORY[0x270F072D0]();
}

uint64_t sub_22E8467A8()
{
  return MEMORY[0x270F072F0]();
}

uint64_t sub_22E8467B8()
{
  return MEMORY[0x270F84BB8]();
}

uint64_t sub_22E8467C8()
{
  return MEMORY[0x270F84BD8]();
}

uint64_t sub_22E8467D8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22E8467E8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22E8467F8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22E846808()
{
  return MEMORY[0x270F853C8]();
}

uint64_t sub_22E846818()
{
  return MEMORY[0x270F853D0]();
}

uint64_t sub_22E846828()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_22E846858()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_22E846888()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_22E846898()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_22E8468A8()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_22E8468B8()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_22E8468C8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_22E8468D8()
{
  return MEMORY[0x270F85460]();
}

uint64_t sub_22E8468E8()
{
  return MEMORY[0x270F85468]();
}

uint64_t sub_22E8468F8()
{
  return MEMORY[0x270F85488]();
}

uint64_t sub_22E846908()
{
  return MEMORY[0x270F854A0]();
}

uint64_t sub_22E846918()
{
  return MEMORY[0x270F854A8]();
}

uint64_t sub_22E846928()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_22E846938()
{
  return MEMORY[0x270EF1808]();
}

uint64_t sub_22E846948()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22E846958()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22E846968()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22E846978()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22E846988()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22E846998()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22E8469A8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22E8469B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22E8469C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22E8469D8()
{
  return MEMORY[0x270F9D920]();
}

uint64_t sub_22E8469E8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_22E8469F8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_22E846A08()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_22E846A18()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_22E846A28()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_22E846A38()
{
  return MEMORY[0x270F85640]();
}

uint64_t sub_22E846A48()
{
  return MEMORY[0x270F85648]();
}

uint64_t sub_22E846A58()
{
  return MEMORY[0x270F85650]();
}

uint64_t sub_22E846A68()
{
  return MEMORY[0x270F85658]();
}

uint64_t sub_22E846A78()
{
  return MEMORY[0x270F85660]();
}

uint64_t sub_22E846A88()
{
  return MEMORY[0x270F85668]();
}

uint64_t sub_22E846A98()
{
  return MEMORY[0x270F85670]();
}

uint64_t sub_22E846AA8()
{
  return MEMORY[0x270F85680]();
}

uint64_t sub_22E846AB8()
{
  return MEMORY[0x270F856A0]();
}

uint64_t sub_22E846AC8()
{
  return MEMORY[0x270F856B0]();
}

uint64_t sub_22E846AD8()
{
  return MEMORY[0x270F856B8]();
}

uint64_t sub_22E846AE8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22E846AF8()
{
  return MEMORY[0x270F9E088]();
}

uint64_t sub_22E846B08()
{
  return MEMORY[0x270F9E090]();
}

uint64_t sub_22E846B18()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t sub_22E846B28()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_22E846B38()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_22E846B48()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22E846B58()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_22E846B68()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_22E846B78()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t sub_22E846B88()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22E846B98()
{
  return MEMORY[0x270EE5820]();
}

uint64_t sub_22E846BA8()
{
  return MEMORY[0x270F856C8]();
}

uint64_t sub_22E846BB8()
{
  return MEMORY[0x270F856D0]();
}

uint64_t sub_22E846BC8()
{
  return MEMORY[0x270F856D8]();
}

uint64_t sub_22E846BD8()
{
  return MEMORY[0x270F856E8]();
}

uint64_t sub_22E846BE8()
{
  return MEMORY[0x270F856F0]();
}

uint64_t sub_22E846BF8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22E846C08()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22E846C18()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22E846C28()
{
  return MEMORY[0x270F85778]();
}

uint64_t sub_22E846C38()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22E846C58()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_22E846C68()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22E846C78()
{
  return MEMORY[0x270F857B0]();
}

uint64_t sub_22E846C88()
{
  return MEMORY[0x270F857B8]();
}

uint64_t sub_22E846C98()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22E846CA8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22E846CB8()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_22E846CC8()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_22E846CD8()
{
  return MEMORY[0x270EF2498]();
}

uint64_t sub_22E846CE8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_22E846CF8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_22E846D08()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_22E846D18()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22E846D28()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22E846D38()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22E846D48()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_22E846D58()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_22E846D68()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22E846D78()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22E846D88()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22E846D98()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22E846DA8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22E846DB8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22E846DC8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22E846DD8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22E846DE8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_22E846DF8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_22E846E08()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_22E846E18()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_22E846E28()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_22E846E38()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22E846E48()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_22E846E58()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_22E846E68()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_22E846E78()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_22E846E88()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_22E846E98()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22E846EA8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22E846EB8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22E846EC8()
{
  return MEMORY[0x270F9FBD8]();
}

uint64_t sub_22E846ED8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22E846EE8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22E846EF8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22E846F08()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22E846F18()
{
  return MEMORY[0x270F9FD98]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x270F30258]();
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}