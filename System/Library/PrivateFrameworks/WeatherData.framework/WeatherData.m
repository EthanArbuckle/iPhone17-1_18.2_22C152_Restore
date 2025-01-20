uint64_t OUTLINED_FUNCTION_32()
{
  return 0;
}

void type metadata accessor for WK2_ConditionCode()
{
}

uint64_t getEnumTagSinglePayload for Table(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 28))
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

void type metadata accessor for WK2_PrecipitationType()
{
}

void type metadata accessor for WK2_PressureTrend()
{
}

uint64_t destroy for ByteBuffer()
{
  return swift_release();
}

void WK2_DayPartForecast.precipitationType.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0x1Fu)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 30);
  int v6 = v4 + 30;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_WeatherCondition.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_179();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV17precipitationTypeAA0c14_PrecipitationG0Ovg_0(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0x1Du)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 28);
  int v6 = v4 + 28;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_WeatherCondition.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_179();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t static WK2_CurrentWeather.endCurrentWeather(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

uint64_t initializeWithCopy for Table(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t storeEnumTagSinglePayload for Table(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 28) = 1;
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
    *(unsigned char *)(result + 28) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void _s11WeatherData08WK2_HourA10ConditionsV13forecastStarts6UInt32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 5u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 4);
    int v4 = v2 + 4;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void sub_261700048()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_158(v8);
    }
    OUTLINED_FUNCTION_102(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV10cloudCovers4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 7u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 6);
    int v4 = v2 + 6;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void sub_261700184()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_130(v8);
    }
    OUTLINED_FUNCTION_90(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV20cloudCoverHighAltPcts4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0xDu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 12);
    int v4 = v2 + 12;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV19cloudCoverMidAltPcts4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0xBu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 10);
    int v4 = v2 + 10;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void sub_261700308()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 48;
    }
    OUTLINED_FUNCTION_202(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_261700400()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_160(v8);
    }
    OUTLINED_FUNCTION_89(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_2617004F4()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_103(v8);
    }
    OUTLINED_FUNCTION_77(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV17snowfallIntensitySfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x23u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 34);
  int v4 = v2 + 34;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData08WK2_HourA10ConditionsV10visibilitySfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x31u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 48);
  int v4 = v2 + 48;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData08WK2_HourA10ConditionsV19cloudCoverLowAltPcts4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 9u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 8);
    int v4 = v2 + 8;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void sub_2617006C8()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 38;
    }
    OUTLINED_FUNCTION_156(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV19temperatureDewPointSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Du) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 44);
  int v4 = v2 + 44;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData08WK2_HourA10ConditionsV19temperatureApparentSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x29u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 40);
  int v4 = v2 + 40;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData08WK2_HourA10ConditionsV11temperatureSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x27u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 38);
  int v4 = v2 + 38;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData18WK2_HourlyForecastV5hours2atAA0c5_HourA10ConditionsVSgs5Int32V_tF_0()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 7)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 6);
  int v5 = v3 + 6;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void sub_261700958()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 22;
    }
    OUTLINED_FUNCTION_125(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV19precipitationAmountSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x17u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 22);
  int v4 = v2 + 22;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData08WK2_HourA10ConditionsV8pressureSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x1Fu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 30);
  int v4 = v2 + 30;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void sub_261700AE8()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_212(v8);
    }
    OUTLINED_FUNCTION_122(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_261700BDC()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 52;
    }
    OUTLINED_FUNCTION_203(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV19precipitationChances4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x1Bu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 26);
    int v4 = v2 + 26;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV8windGustSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x35u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 52);
  int v4 = v2 + 52;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void sub_261700D68()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 54;
    }
    OUTLINED_FUNCTION_154(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData08WK2_HourA10ConditionsV9windSpeedSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x37u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 54);
  int v4 = v2 + 54;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void sub_261700EB0()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_157(v10);
    }
    OUTLINED_FUNCTION_128(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void type metadata accessor for WK2_HourWeatherConditions()
{
}

void _s11WeatherData08WK2_HourA10ConditionsV8humiditys4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x13u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 18);
    int v4 = v2 + 18;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_HourWeatherConditions.daylight.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x11u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 16);
    int v4 = v2 + 16;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_HourWeatherConditions.uvIndex.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x2Fu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 46);
    int v4 = v2 + 46;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_HourWeatherConditions.add(windSpeed:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700D68();
}

void static WK2_HourWeatherConditions.add(windGust:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700BDC();
}

void sub_26170113C()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_132(v8);
    }
    OUTLINED_FUNCTION_101(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_HourWeatherConditions.add(humidity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170113C();
}

void static WK2_HourWeatherConditions.add(daylight:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if ((v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v4 ^ v5 | v3) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v4 != v5) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v6;
  OUTLINED_FUNCTION_12();
  if (v4 ^ v5 | v3)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v8 = *(void *)(v7 + 32);
  }
  *(unsigned char *)(*(void *)(v7 + 24) + v8 + ~v6) = v1 & 1;
  OUTLINED_FUNCTION_53();
  if (!v3 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_207(v10);
    }
    OUTLINED_FUNCTION_152(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_HourWeatherConditions.add(uvIndex:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_210(v8);
    }
    OUTLINED_FUNCTION_126(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_HourWeatherConditions.add(perceivedPrecipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 20;
    }
    OUTLINED_FUNCTION_100(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_HourWeatherConditions.add(cloudCoverHighAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700400();
}

void static WK2_HourWeatherConditions.add(precipitationChance:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700AE8();
}

void static WK2_HourWeatherConditions.add(precipitationAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700958();
}

void static WK2_HourWeatherConditions.add(cloudCoverMidAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700184();
}

void static WK2_HourWeatherConditions.add(cloudCoverLowAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617004F4();
}

void static WK2_HourWeatherConditions.add(precipitationType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261701B5C();
}

void static WK2_HourWeatherConditions.add(windDirection:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_250();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_245();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(2);
  }
  unint64_t v4 = v0[2];
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = (v0[2] & 1) + v0[2];
  uint64_t v6 = v0[1];
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, v0[3]);
  }
  v0[2] = v5;
  OUTLINED_FUNCTION_63();
  if (v2 != v3)
  {
    OUTLINED_FUNCTION_180();
    uint64_t v9 = *(void *)(v6 + 32);
  }
  OUTLINED_FUNCTION_95(v9);
  if (!v1 & v10) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v12 & 1) == 0)
  {
    if (*(void *)(v11 + 32)) {
      OUTLINED_FUNCTION_206(v11);
    }
    OUTLINED_FUNCTION_151(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v10)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_HourWeatherConditions.add(forecastStart:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_HourWeatherConditions.add(conditionCode:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700EB0();
}

void static WK2_HourWeatherConditions.add(temperature:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617006C8();
}

void static WK2_HourWeatherConditions.add(visibility:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700308();
}

void static WK2_HourWeatherConditions.add(cloudCover:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700048();
}

void WK2_HourWeatherConditions.perceivedPrecipitationIntensity.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x15u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 20);
  int v4 = v2 + 20;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_HourWeatherConditions.windDirection.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x33u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 50);
    int v4 = v2 + 50;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_218(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_HourWeatherConditions.startHourWeatherConditions(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 208);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void sub_261701B5C()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_216(v10);
    }
    OUTLINED_FUNCTION_124(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void WK2_HourWeatherConditions.conditionCode.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0xFu)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 14);
  int v6 = v4 + 14;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_ConditionCode.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_217();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void OUTLINED_FUNCTION_97()
{
  sub_261706814();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t ByteBuffer.init(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v7 = a1;
  unint64_t v8 = a2;
  sub_2617026C0(a1, a2);
  uint64_t v4 = sub_26173BB70();
  type metadata accessor for ByteBuffer.Storage();
  uint64_t v5 = OUTLINED_FUNCTION_2_6();
  ByteBuffer.Storage.init(count:alignment:)(v4);
  v9[0] = v5;
  sub_261702338(&v7, (uint64_t)v9, a1, a2);
  sub_261702668(v7, v8);
  return v5;
}

uint64_t FlatbufferEncodable.asFlatbufferData.getter(uint64_t a1, uint64_t a2)
{
  type metadata accessor for FlatBufferBuilder.VTableStorage();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 8;
  *(void *)(v4 + 56) = 0;
  *(_WORD *)(v4 + 64) = 0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 80) = 0;
  uint64_t v5 = swift_slowAlloc();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v5;
  *(unsigned char *)(v4 + 48) = 0;
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v7 = sub_26173BB80();
  type metadata accessor for ByteBuffer.Storage();
  swift_allocObject();
  uint64_t v8 = ByteBuffer.Storage.init(count:alignment:)(1024);
  swift_retain();
  ByteBuffer.Storage.initialize(for:)(1024);
  swift_release();
  uint64_t v13 = v4;
  uint64_t v14 = v8;
  long long v15 = xmmword_26173E9E0;
  uint64_t v16 = v6;
  char v17 = 0;
  uint64_t v18 = v7;
  __int16 v19 = 0;
  uint64_t v20 = 0;
  (*(void (**)(unsigned char *__return_ptr, uint64_t *, uint64_t, uint64_t))(a2 + 8))(v12, &v13, a1, a2);
  FlatBufferBuilder.finish(offset:addPrefix:)((uint64_t)v12, 0);
  char v9 = sub_261702AB8((const void *)(*(void *)(v14 + 24) + *(void *)(v14 + 32) - v15), v15);
  uint64_t v10 = sub_2617021C8((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v10;
}

uint64_t type metadata accessor for ByteBuffer.Storage()
{
  return self;
}

uint64_t ByteBuffer.Storage.init(count:alignment:)(uint64_t a1)
{
  *(void *)(v1 + 24) = swift_slowAlloc();
  *(void *)(v1 + 32) = a1;
  *(unsigned char *)(v1 + 16) = 0;
  return v1;
}

void FlatBufferBuilder.finish(offset:addPrefix:)(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_9_1();
  if (!(v7 ^ v8 | v6))
  {
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v9 = v2[8];
  if (a2) {
    int v10 = -8;
  }
  else {
    int v10 = -4;
  }
  if ((v5 | v9) < 0) {
    goto LABEL_36;
  }
  if (v9 > 0xFFFFFFFFLL)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (!v9)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  int v11 = *v4;
  unint64_t v12 = v5 + ((v10 - v5) & (v9 - 1));
  OUTLINED_FUNCTION_12();
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v13, v14, v2[3]);
  }
  v2[2] = v12;
  if (v9 <= 3) {
    OUTLINED_FUNCTION_14(4);
  }
  if ((v12 & 0x8000000000000000) != 0) {
    goto LABEL_39;
  }
  if (HIDWORD(v12))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  unint64_t v15 = (-(int)v12 & 3) + v12;
  OUTLINED_FUNCTION_19_1();
  if (v7 != v8) {
    OUTLINED_FUNCTION_57_0(v16);
  }
  v2[2] = v15;
  if (HIDWORD(v15)) {
    goto LABEL_41;
  }
  int v17 = v15 - v11 + 4;
  unint64_t v18 = (-(int)v15 & 3) + v15;
  OUTLINED_FUNCTION_63();
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v19, v15, v2[3]);
  }
  v2[2] = v18;
  unint64_t v20 = v18 + 4;
  OUTLINED_FUNCTION_12();
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v18, v2[3]);
  }
  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)(v21 - 4) = v17;
  v2[2] = v20;
  if (v18 > 0xFFFFFFFB) {
    goto LABEL_42;
  }
  if (a2)
  {
    unint64_t v22 = (-(uint64_t)v18 & 3) + v20;
    OUTLINED_FUNCTION_16();
    if (v7 != v8) {
      OUTLINED_FUNCTION_57_0(v23);
    }
    v2[2] = v22;
    OUTLINED_FUNCTION_63();
    if (v7 != v8) {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v22, v2[3]);
    }
    OUTLINED_FUNCTION_43_0();
    *(_DWORD *)(v24 - 4) = v20;
    v2[2] = v22 + 4;
    if (v22 > 0xFFFFFFFB) {
LABEL_43:
    }
      __break(1u);
  }
  uint64_t v25 = *v2;
  *(_WORD *)(v25 + 64) = 0;
  *(void *)(v25 + 72) = 0;
  *(void *)(v25 + 80) = 0;
  *((unsigned char *)v2 + 56) = 1;
}

uint64_t type metadata accessor for FlatBufferBuilder.VTableStorage()
{
  return self;
}

Swift::Void __swiftcall ByteBuffer.Storage.initialize(for:)(Swift::Int a1)
{
  bzero(*(void **)(v1 + 24), a1);
}

uint64_t sub_2617021C8(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
  unint64_t v10 = sub_26170226C();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = *v2 + 32;
  uint64_t v4 = v3 + *(void *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_2617022C0(v3, v4, &v7);
  swift_bridgeObjectRelease();
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unint64_t sub_26170226C()
{
  unint64_t result = qword_26A92AE98;
  if (!qword_26A92AE98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B410988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AE98);
  }
  return result;
}

uint64_t sub_2617022C0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = sub_26173BB20();
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = MEMORY[0x263E3E830]();
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = MEMORY[0x263E3E840]();
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_261702338(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  sub_2617026C0(a3, a4);
  OUTLINED_FUNCTION_1_1();
  uint64_t v9 = *a1;
  unint64_t v8 = a1[1];
  switch(v8 >> 62)
  {
    case 1uLL:
      uint64_t v12 = v8 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_26173E5E0;
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_1_1();
      uint64_t v13 = v9 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_11;
      }
      if (v13 < (int)v9) {
        goto LABEL_15;
      }
      if (sub_26173BAD0() && __OFSUB__((int)v9, sub_26173BAF0())) {
        goto LABEL_16;
      }
      sub_26173BB00();
      swift_allocObject();
      uint64_t v18 = sub_26173BAC0();
      swift_release();
      uint64_t v12 = v18;
      uint64_t v13 = v9 >> 32;
LABEL_11:
      if (v13 < (int)v9)
      {
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
      }
      OUTLINED_FUNCTION_1_1();
      sub_261702718((int)v9, v13, v12, a2, a3, a4);
      OUTLINED_FUNCTION_0_3();
      OUTLINED_FUNCTION_0_3();
      OUTLINED_FUNCTION_0_3();
      *a1 = v9;
      a1[1] = v12 | 0x4000000000000000;
LABEL_13:
      OUTLINED_FUNCTION_0_3();
      return OUTLINED_FUNCTION_0_3();
    case 2uLL:
      *(void *)&long long v20 = *a1;
      *((void *)&v20 + 1) = v8 & 0x3FFFFFFFFFFFFFFFLL;
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_1_1();
      sub_26173BB30();
      uint64_t v14 = *((void *)&v20 + 1);
      uint64_t v15 = a2;
      uint64_t v16 = *(void *)(v20 + 16);
      uint64_t v17 = *(void *)(v20 + 24);
      OUTLINED_FUNCTION_1_1();
      sub_261702718(v16, v17, *((uint64_t *)&v20 + 1), v15, a3, a4);
      OUTLINED_FUNCTION_0_3();
      OUTLINED_FUNCTION_0_3();
      OUTLINED_FUNCTION_0_3();
      *a1 = v20;
      a1[1] = v14 | 0x8000000000000000;
      goto LABEL_13;
    case 3uLL:
      *(void *)((char *)&v20 + 7) = 0;
      *(void *)&long long v20 = 0;
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_4_0(&v20, 0);
      OUTLINED_FUNCTION_0_3();
      goto LABEL_13;
    default:
      *(void *)&long long v20 = *a1;
      WORD4(v20) = v8;
      BYTE10(v20) = BYTE2(v8);
      BYTE11(v20) = BYTE3(v8);
      BYTE12(v20) = BYTE4(v8);
      BYTE13(v20) = BYTE5(v8);
      uint64_t v10 = BYTE6(v8);
      BYTE14(v20) = BYTE6(v8);
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_4_0(&v20, v10);
      OUTLINED_FUNCTION_0_3();
      unint64_t v11 = DWORD2(v20) | ((unint64_t)BYTE12(v20) << 32) | ((unint64_t)BYTE13(v20) << 40) | ((unint64_t)BYTE14(v20) << 48);
      *a1 = v20;
      a1[1] = v11;
      goto LABEL_13;
  }
}

uint64_t sub_261702668(uint64_t a1, unint64_t a2)
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

uint64_t sub_2617026C0(uint64_t a1, unint64_t a2)
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

uint64_t sub_261702718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result = sub_26173BAD0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v10 = result;
  uint64_t result = sub_26173BAF0();
  BOOL v11 = __OFSUB__(a1, result);
  uint64_t v12 = a1 - result;
  if (v11)
  {
    __break(1u);
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t result = sub_26173BAE0();
  size_t v13 = 0;
  switch(a6 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a5), a5)) {
        goto LABEL_10;
      }
      size_t v13 = HIDWORD(a5) - (int)a5;
      break;
    case 2uLL:
      uint64_t v15 = *(void *)(a5 + 16);
      uint64_t v14 = *(void *)(a5 + 24);
      size_t v13 = v14 - v15;
      if (__OFSUB__(v14, v15)) {
        goto LABEL_11;
      }
      break;
    case 3uLL:
      break;
    default:
      size_t v13 = BYTE6(a6);
      break;
  }
  ByteBuffer.Storage.copy(from:count:)((void *)(v10 + v12), v13);
  return sub_261702668(a5, a6);
}

void *ByteBuffer.Storage.copy(from:count:)(void *__src, size_t __len)
{
  if ((__len & 0x8000000000000000) == 0) {
    return memmove(*(void **)(v2 + 24), __src, __len);
  }
  __break(1u);
  return __src;
}

void _s11WeatherData16WK2_LocationInfoV11countryCodeSSSgvg_0()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 9u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 8);
  int v4 = v2 + 8;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void WK2_AirQuality.scale.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x13u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 18);
  int v4 = v2 + 18;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void WK2_Metadata.providerName.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x11u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 16);
  int v4 = v2 + 16;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

Swift::String_optional __swiftcall Table.directString(at:)(Swift::Int32 at)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_26173BC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v12 = (char *)v21 - v11;
  uint64_t v13 = *(void *)(v2 + 24);
  int v14 = *(_DWORD *)(v13 + at);
  Swift::Int32 v15 = at + v14;
  if (__OFADD__(at, v14))
  {
    __break(1u);
  }
  else
  {
    int64_t v16 = *(int *)(v13 + v15);
    sub_26173BC00();
    v21[1] = sub_261702AB8((const void *)(*(void *)(v2 + 24) + v15 + 4), v16);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v12, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
    sub_261702B48();
    uint64_t v17 = sub_26173BBF0();
    Swift::Int v19 = v18;
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    uint64_t v9 = v17;
    uint64_t v10 = v19;
  }
  result.value._object = v10;
  result.value._countAndFlagsBits = v9;
  return result;
}

void *sub_261702AB8(const void *a1, int64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B410998);
    uint64_t v4 = (void *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

unint64_t sub_261702B48()
{
  unint64_t result = qword_26B410990;
  if (!qword_26B410990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B410988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B410990);
  }
  return result;
}

void OUTLINED_FUNCTION_216(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 28;
}

void _s11WeatherData18WK2_ForecastMinuteV05startdE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 32);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void sub_261702C30()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 8;
    }
    OUTLINED_FUNCTION_77(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_261702D28()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 10;
    }
    OUTLINED_FUNCTION_90(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData18WK2_ForecastMinuteV22precipitationIntensitySfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 9u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 8);
  int v4 = v2 + 8;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData18WK2_ForecastMinuteV31perceivedPrecipitationIntensitySfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xBu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData20WK2_NextHourForecastV7minutes2atAA0c1_F6MinuteVSgs5Int32V_tF_0()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0xF)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 14);
  int v5 = v3 + 14;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void type metadata accessor for WK2_ForecastMinute()
{
}

void static WK2_ForecastMinute.add(startTime:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_ForecastMinute.add(perceivedPrecipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261702D28();
}

void static WK2_ForecastMinute.add(precipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261702C30();
}

void static WK2_ForecastMinute.add(precipitationChance:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700048();
}

void static WK2_Pollutant.createPollutant(_:pollutantType:amount:units:)()
{
  OUTLINED_FUNCTION_228();
  int v2 = v1;
  static WK2_WeatherAlertCollection.startWeatherAlertCollection(_:)();
  OUTLINED_FUNCTION_246();
  OUTLINED_FUNCTION_219();
  static WK2_Pollutant.add(units:_:)();
  *int v2 = FlatBufferBuilder.endTable(at:)(v0);
  OUTLINED_FUNCTION_227();
}

void sub_26170314C()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if ((v1 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_103(v10);
    }
    OUTLINED_FUNCTION_77(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_Pollutant.add(units:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170314C();
}

void sub_261703290()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_129(v10);
    }
    OUTLINED_FUNCTION_91(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_Pollutant.add(pollutantType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261703290();
}

void sub_2617033D4()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_HourTide.add(height:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

void _s11WeatherData04WK2_A15AlertCollectionV05startadE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 24);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

ValueMetadata *type metadata accessor for Offset()
{
  return &type metadata for Offset;
}

void type metadata accessor for WK2_PollutantType()
{
}

uint64_t Dictionary.encode(using:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  sub_26173BBA0();
  swift_getWitnessTable();
  sub_26173BCA0();
  OUTLINED_FUNCTION_3_2();
  if (v9 ^ v10 | v8) {
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_8_2();
  if (!(v9 ^ v10 | v8))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if ((v12 | (4 * v3)) < 0)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (4 * v3 > 0xFFFFFFFFLL)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  Swift::Int v13 = OUTLINED_FUNCTION_4_1(v11, v12);
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v13, v14, *(void *)(a1 + 24));
  }
  *(void *)(a1 + 16) = v4;
  if (v4 < 0) {
    goto LABEL_50;
  }
  if (HIDWORD(v4))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  Swift::Int v23 = (_DWORD *)a3;
  unint64_t v24 = v3;
  Swift::Int v15 = OUTLINED_FUNCTION_7_2();
  if (v9 != v10) {
    OUTLINED_FUNCTION_10_1(v15);
  }
  *(void *)(a1 + 16) = v3;
  uint64_t v16 = MEMORY[0x10];
  if (MEMORY[0x10])
  {
    swift_bridgeObjectRetain();
    a3 = 0xFFFFFFFFLL;
    while (v16 <= MEMORY[0x10])
    {
      if (v3 > 0xFFFFFFFFLL) {
        goto LABEL_44;
      }
      Swift::Int v17 = OUTLINED_FUNCTION_0_4();
      if (v9 != v10) {
        OUTLINED_FUNCTION_9_2(v17);
      }
      if (v4 > 0xFFFFFFFFLL) {
        goto LABEL_45;
      }
      Swift::Int v18 = OUTLINED_FUNCTION_6_1();
      if (v9 != v10)
      {
        OUTLINED_FUNCTION_10_1(v18);
        uint64_t v19 = a2;
      }
      uint64_t v3 = v5 + 4;
      if (v19 < v5 + 4)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v5, *(void *)(a1 + 24));
        uint64_t v19 = a2;
      }
      OUTLINED_FUNCTION_1_4(v19);
      if (!(v9 ^ v10 | v8)) {
        goto LABEL_46;
      }
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        *(void *)(a1 + 16) = v3;
        goto LABEL_33;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_33:
  *(unsigned char *)(a1 + 40) = 0;
  if (v24 >> 31)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v3 > 0xFFFFFFFFLL)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  Swift::Int v20 = OUTLINED_FUNCTION_0_4();
  if (v9 != v10) {
    OUTLINED_FUNCTION_9_2(v20);
  }
  OUTLINED_FUNCTION_11_0();
  if (v9 != v10)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v4, *(void *)(a1 + 24));
    uint64_t v21 = a2;
  }
  uint64_t result = OUTLINED_FUNCTION_5_1(v21);
  *(void *)(a1 + 16) = a3;
  if (v4 > 4294967291) {
LABEL_54:
  }
    __break(1u);
  *Swift::Int v23 = a3;
  return result;
}

void sub_26170384C()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_207(v10);
    }
    OUTLINED_FUNCTION_152(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void sub_26170393C()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_157(v8);
    }
    OUTLINED_FUNCTION_128(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData19WK2_DayPartForecastV20cloudCoverHighAltPcts4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0xFu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 14);
    int v4 = v2 + 14;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

uint64_t Optional<A>.encode(using:)@<X0>(uint64_t a1@<X6>, uint64_t a2@<X8>)
{
  return sub_261703AE8((void (*)(char *, char *))sub_261703D5C, MEMORY[0x263F8E628], (uint64_t)&type metadata for Offset, a1, a2);
}

uint64_t sub_261703AE8@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  uint64_t v26 = a3;
  uint64_t v22 = *(void *)(a2 - 8);
  uint64_t v23 = a2;
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  char v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v7);
  Swift::Int v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  Swift::Int v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v18 + 16))(v17, v19);
  uint64_t v20 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v11) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v17, v11);
    v25(v15, v9);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    if (v5) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(v24, v9, v23);
    }
    uint64_t v20 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a5, v20, 1, v26);
}

uint64_t sub_261703D5C()
{
  return (*(uint64_t (**)(void, void))(v0[3] + 8))(v0[4], v0[2]);
}

void type metadata accessor for WK2_MoonPhase()
{
}

void OUTLINED_FUNCTION_27()
{
  sub_26170C1D8();
}

int64x2_t OUTLINED_FUNCTION_91@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_27_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

char *OUTLINED_FUNCTION_27_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, char a13)
{
  return &a13;
}

void _s11WeatherData19WK2_DayPartForecastV11humidityMaxs4Int8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x15u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 20);
    int v4 = v2 + 20;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void sub_261703E70()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_159(v8);
    }
    OUTLINED_FUNCTION_100(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData19WK2_DayPartForecastV14snowfallAmountSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x21u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 32);
  int v4 = v2 + 32;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData19WK2_DayPartForecastV19precipitationAmountSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x19u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 24);
  int v4 = v2 + 24;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData19WK2_DayPartForecastV13conditionCodeAA0c10_ConditionH0Ovg_0(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0x11u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 16);
  int v6 = v4 + 16;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_ConditionCode.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_217();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void type metadata accessor for WK2_DayPartForecast()
{
}

void WK2_DayPartForecast.windSpeed.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Fu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 46);
  int v4 = v2 + 46;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void static WK2_DayPartForecast.add(windSpeed:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 46;
    }
    OUTLINED_FUNCTION_126(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(cloudCoverHighAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170393C();
}

void static WK2_DayPartForecast.add(precipitationChance:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_216(v8);
    }
    OUTLINED_FUNCTION_124(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(cloudCoverMidAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700400();
}

void static WK2_DayPartForecast.add(cloudCoverLowAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700184();
}

void static WK2_DayPartForecast.add(precipitationType:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32))
    {
      OUTLINED_FUNCTION_81(v10);
      *(_WORD *)(v12 + 4) = 30;
    }
    OUTLINED_FUNCTION_155(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(windGustSpeedMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704B80();
}

void static WK2_DayPartForecast.add(snowfallAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704FC8();
}

void static WK2_DayPartForecast.add(windDirection:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_250();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_245();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(2);
  }
  unint64_t v4 = v0[2];
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = (v0[2] & 1) + v0[2];
  uint64_t v6 = v0[1];
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, v0[3]);
  }
  v0[2] = v5;
  OUTLINED_FUNCTION_63();
  if (v2 != v3)
  {
    OUTLINED_FUNCTION_180();
    uint64_t v9 = *(void *)(v6 + 32);
  }
  OUTLINED_FUNCTION_95(v9);
  if (!v1 & v10) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v12 & 1) == 0)
  {
    if (*(void *)(v11 + 32)) {
      OUTLINED_FUNCTION_131(v11);
    }
    OUTLINED_FUNCTION_99(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v10)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(visibilityMin:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704C78();
}

void static WK2_DayPartForecast.add(visibilityMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617006C8();
}

void static WK2_DayPartForecast.add(conditionCode:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170384C();
}

void static WK2_DayPartForecast.add(windSpeedMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700308();
}

void static WK2_DayPartForecast.add(humidityMin:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_208(v8);
    }
    OUTLINED_FUNCTION_125(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(humidityMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261703E70();
}

void static WK2_DayPartForecast.add(cloudCover:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617004F4();
}

void WK2_DayPartForecast.precipitationAmountByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x1Bu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 26);
  int v4 = v2 + 26;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_DayPartForecast.precipitationChance.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x1Du) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 28);
    int v4 = v2 + 28;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_DayPartForecast.windDirection.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x2Bu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 42);
    int v4 = v2 + 42;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_218(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_DayPartForecast.humidityMin.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x17u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 22);
    int v4 = v2 + 22;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_DayPartForecast.addVectorOf(precipitationAmountByType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704EA8();
}

void static WK2_DayPartForecast.startDayPartForecast(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 240);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void sub_261704B80()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 44;
    }
    OUTLINED_FUNCTION_127(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_261704C78()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 40;
    }
    OUTLINED_FUNCTION_123(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData19WK2_DayPartForecastV14temperatureMinSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x25u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 36);
  int v4 = v2 + 36;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_DayWeatherConditions.moonPhase.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0x11u)
  {
LABEL_9:
    char v9 = 0;
LABEL_10:
    *a1 = v9;
    return;
  }
  BOOL v5 = __OFADD__(v4, 16);
  int v6 = v4 + 16;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_9;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_MoonPhase.init(rawValue:)(*(unsigned char *)(v2 + v8));
    char v9 = v10;
    if (v10 == 8) {
      char v9 = 0;
    }
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
}

WeatherData::WK2_MoonPhase_optional __swiftcall WK2_MoonPhase.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

void static WK2_DayWeatherConditions.add(humidityMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700184();
}

void sub_261704EA8()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 26;
    }
    OUTLINED_FUNCTION_122(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_261704FC8()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 32;
    }
    OUTLINED_FUNCTION_149(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t sub_2617050C0(uint64_t a1)
{
  return sub_2617050E4(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 40));
}

uint64_t sub_2617050E4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_261705160(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 40))(a1, a2, *(void *)(v2 + 56));
}

void type metadata accessor for WK2_PollutantUnit()
{
}

void sub_26170519C()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_129(v14);
    }
    OUTLINED_FUNCTION_91(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

uint64_t Collection<>.encode(using:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v33 = a1;
  sub_2617089EC((void (*)(char *, char *))sub_26170913C, (uint64_t)v29, a2, (uint64_t)&type metadata for Offset, MEMORY[0x263F8E628], a3, MEMORY[0x263F8E658], a5);
  OUTLINED_FUNCTION_3_2();
  if (v13 ^ v14 | v12) {
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_8_2();
  if (!(v13 ^ v14 | v12))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if ((v16 | (4 * v7)) < 0)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (4 * v7 > 0xFFFFFFFFLL)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  Swift::Int v17 = OUTLINED_FUNCTION_4_1(v15, v16);
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v17, v18, *(void *)(a1 + 24));
  }
  *(void *)(a1 + 16) = v8;
  if (v8 < 0) {
    goto LABEL_50;
  }
  if (HIDWORD(v8))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v27 = (_DWORD *)a6;
  unint64_t v28 = v7;
  Swift::Int v19 = OUTLINED_FUNCTION_7_2();
  if (v13 != v14) {
    OUTLINED_FUNCTION_10_1(v19);
  }
  *(void *)(a1 + 16) = v7;
  uint64_t v20 = MEMORY[0x10];
  if (MEMORY[0x10])
  {
    swift_bridgeObjectRetain();
    a6 = 0xFFFFFFFFLL;
    while (v20 <= MEMORY[0x10])
    {
      if (v7 > 0xFFFFFFFFLL) {
        goto LABEL_44;
      }
      Swift::Int v21 = OUTLINED_FUNCTION_0_4();
      if (v13 != v14) {
        OUTLINED_FUNCTION_9_2(v21);
      }
      if (v8 > 0xFFFFFFFFLL) {
        goto LABEL_45;
      }
      Swift::Int v22 = OUTLINED_FUNCTION_6_1();
      if (v13 != v14)
      {
        OUTLINED_FUNCTION_10_1(v22);
        uint64_t v23 = *(void *)(v6 + 32);
      }
      uint64_t v7 = v9 + 4;
      if (v23 < v9 + 4)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v9, *(void *)(a1 + 24));
        uint64_t v23 = *(void *)(v6 + 32);
      }
      OUTLINED_FUNCTION_1_4(v23);
      if (!(v13 ^ v14 | v12)) {
        goto LABEL_46;
      }
      if (!--v20)
      {
        swift_bridgeObjectRelease();
        *(void *)(a1 + 16) = v7;
        goto LABEL_33;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_33:
  *(unsigned char *)(a1 + 40) = 0;
  if (v28 >> 31)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v7 > 0xFFFFFFFFLL)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  Swift::Int v24 = OUTLINED_FUNCTION_0_4();
  if (v13 != v14) {
    OUTLINED_FUNCTION_9_2(v24);
  }
  OUTLINED_FUNCTION_11_0();
  if (v13 != v14)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v8, *(void *)(a1 + 24));
    uint64_t v25 = *(void *)(v6 + 32);
  }
  uint64_t result = OUTLINED_FUNCTION_5_1(v25);
  *(void *)(a1 + 16) = a6;
  if (v8 > 4294967291) {
LABEL_54:
  }
    __break(1u);
  _DWORD *v27 = a6;
  return result;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, int a2)
{
  return -a2 & 3;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v3 + *(void *)(v2 + 24) - 4) = v5;
  *(void *)(v1 + 16) = v4;
}

void OUTLINED_FUNCTION_10()
{
  Verifier.rangeInBuffer(position:size:)(v0, 2);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_allocError();
}

int64x2_t OUTLINED_FUNCTION_111@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9EFF0](a1, 11, 2, 0xD000000000000035, a5, a6, 34, 2);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_2617026C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(void *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 64) = 3;
  return v2;
}

void OUTLINED_FUNCTION_1_4(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v3 + *(void *)(v1 + 24) - 4) = v2 - v4 + 4;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return MEMORY[0x270F9F4E0](v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_6@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>, double a8@<D0>, double a9, int a10, char a11)
{
  a9 = a8;
  a10 = v11;
  a11 = v12;
  return getCheckedRoot<A>(byteBuffer:fileId:options:)(a1, a2, a3, (uint64_t *)&a9, a4, a5, a6, a7);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v4 + *(void *)(v2 + 24) - 4) = v5;
  *(void *)(v1 + 16) = v3;
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  *(void *)a2 = a1;
  *(__n128 *)(a2 + 8) = a3;
  *(_DWORD *)(a2 + 24) = v3;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_229()
{
  return sub_26173BC20();
}

double OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = v2;
  double result = 0.0;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return result;
}

void OUTLINED_FUNCTION_3_1()
{
  uint64_t v2 = *(void *)(v1 - 128);
  *(void *)(v1 - 192) = *(void *)(v2 + 40);
  *(void *)(v1 - 184) = v2 + 40;
  uint64_t v3 = *(void *)(v1 - 136);
  *(void *)(v1 - 208) = v3 + 32;
  *(void *)(v1 - 200) = v3 + 16;
  uint64_t v4 = *(void *)(v1 - 224);
  *(void *)(v1 - 224) = v4 + 8;
  *(void *)(v1 - 216) = v4 + 16;
  *(void *)(v1 - 232) = v3 + 8;
  *(void *)(v1 - 176) = v0;
}

void OUTLINED_FUNCTION_3_2()
{
  *(unsigned char *)(v0 + 40) = 1;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_26173BC40();
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v4 + *(void *)(v2 + 24) - 4) = v3;
  *(void *)(v1 + 16) = v5;
}

void OUTLINED_FUNCTION_31()
{
  Verifier.rangeInBuffer(position:size:)(v0, 4);
}

void OUTLINED_FUNCTION_34(int a1, unint64_t position, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Verifier.visitTable(at:)(position, (uint64_t)&a10);
}

void OUTLINED_FUNCTION_21(uint64_t a1@<X8>)
{
  *(unsigned char *)(*(void *)(v2 + 24) + a1 + ~v3) = v4;
  *(void *)(v1 + 16) = v5;
}

void OUTLINED_FUNCTION_48(uint64_t a1@<X8>)
{
  *(_DWORD *)(v1 + *(void *)(a1 + 80)) = v2;
}

void OUTLINED_FUNCTION_35()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v1, v3);
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t a1)
{
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 8;
  *(void *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_18()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v1, v3);
}

void OUTLINED_FUNCTION_8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Verifier.rangeInBuffer(position:size:)(v10, 2);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0;
}

double OUTLINED_FUNCTION_134()
{
  return 0.0;
}

void OUTLINED_FUNCTION_57_0(Swift::Int a1)
{
  Swift::Int v4 = *(void *)(v1 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(a1, v2, v4);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_261702668(v1, v0);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return -v0 & 3;
}

double OUTLINED_FUNCTION_0_5@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 7;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>, uint64_t a2, uint64_t a3)
{
  Verifier.rangeInBuffer(position:size:)(a3 + a1, 1);
}

void OUTLINED_FUNCTION_6()
{
  *(void *)(v0 + 64) = 4;
  *(void *)(v0 + 24) = 4;
}

void OUTLINED_FUNCTION_29(Swift::Int a1)
{
  Verifier.rangeInBuffer(position:size:)(a1, 2);
}

uint64_t OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2)
{
  return sub_26172EC08(a1, a2, v4, v3, v2);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, int a2)
{
  return -a2 & 3;
}

void OUTLINED_FUNCTION_37(uint64_t a1@<X8>)
{
  *(_DWORD *)(v1 + *(void *)(a1 + 80)) = v2;
}

uint64_t OUTLINED_FUNCTION_136()
{
  return 0;
}

void OUTLINED_FUNCTION_59()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(0, v1, v3);
}

void OUTLINED_FUNCTION_59_0(uint64_t a1, uint64_t a2, Swift::Int a3)
{
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return *(void *)v0;
}

void OUTLINED_FUNCTION_7()
{
  *(void *)(v0 + 16) = v1;
}

void OUTLINED_FUNCTION_60()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v1, v3);
}

void OUTLINED_FUNCTION_60_0(Swift::Int a1)
{
  Swift::Int v4 = *(void *)(v1 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(a1, v2, v4);
}

int64x2_t OUTLINED_FUNCTION_77@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_29_0()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v1, v3);
}

void OUTLINED_FUNCTION_29_1()
{
  sub_2617159DC();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, int a2)
{
  return -a2 & 3;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return -v0 & 3;
}

void OUTLINED_FUNCTION_8_1()
{
  *(void *)(v0 + 64) = 4;
  *(void *)(v0 + 24) = 4;
}

int64x2_t OUTLINED_FUNCTION_102@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t result = v1;
  *(void *)(v2 - 128) = v0;
  *(void *)(v2 - 168) = v3;
  *(void *)(v2 - 160) = v0 + 32;
  return result;
}

void OUTLINED_FUNCTION_52(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_36(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_84(Swift::Int a1)
{
  Swift::Int v4 = *(void *)(v1 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(a1, v2, v4);
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 + 64) = a1;
  *(void *)(v1 + 24) = a1;
}

void OUTLINED_FUNCTION_24()
{
  sub_261708114(v0);
}

void OUTLINED_FUNCTION_25()
{
  *(void *)(v0 + 16) = v1;
}

uint64_t OUTLINED_FUNCTION_45(uint64_t result)
{
  *(unsigned char *)(result + 40) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_26173BCD0();
}

void OUTLINED_FUNCTION_113()
{
  JUMPOUT(0x263E3EDF0);
}

uint64_t OUTLINED_FUNCTION_88@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned int *)(a1 + v1);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v3 + *(void *)(v2 + 24) - 4) = v5;
  *(void *)(v4 + 16) = v1;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return -v0 & 3;
}

void OUTLINED_FUNCTION_7_1()
{
  *(void *)(v0 + 64) = 4;
  *(void *)(v0 + 24) = 4;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return -v0 & 3;
}

void OUTLINED_FUNCTION_129(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 4;
}

void OUTLINED_FUNCTION_43()
{
  *(void *)(v0 + 16) = v1;
}

void OUTLINED_FUNCTION_95(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 - v4 + *(void *)(v2 + 24) - 2) = v3;
  *(void *)(v1 + 16) = v5;
}

uint64_t OUTLINED_FUNCTION_244()
{
  return FlatBufferBuilder.endTable(at:)(v0);
}

uint64_t OUTLINED_FUNCTION_240()
{
  return 12;
}

int64x2_t OUTLINED_FUNCTION_148@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_123@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_122@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_198@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_206(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 50;
}

void OUTLINED_FUNCTION_147()
{
  sub_26170A074();
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return sub_26173BCC0();
}

int64x2_t OUTLINED_FUNCTION_125@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_213(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 34;
}

void OUTLINED_FUNCTION_212(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 26;
}

void OUTLINED_FUNCTION_209(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 54;
}

void OUTLINED_FUNCTION_205(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 12;
}

int64x2_t OUTLINED_FUNCTION_200@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_197@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_152@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_46(uint64_t result, __n128 a2)
{
  *(void *)uint64_t v2 = result;
  *(__n128 *)(v2 + 8) = a2;
  *(_DWORD *)(v2 + 24) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_73()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_72@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 32) = result;
  *(void *)(v2 + 40) = a2;
  *(unsigned char *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return v0 | ((HIDWORD(v0) & 1) << 32);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return *(void *)v0;
}

void OUTLINED_FUNCTION_132(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 18;
}

uint64_t OUTLINED_FUNCTION_165@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_166@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t a1@<X8>)
{
  return a1 | ((unint64_t)v1 << 32);
}

int64x2_t OUTLINED_FUNCTION_90@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_28_0(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v1 + *(void *)(v2 + 24) - 4) = v4;
  *(void *)(v5 + 16) = v3;
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1, int a2)
{
  return -a2 & 3;
}

void OUTLINED_FUNCTION_9_0()
{
  *(void *)(v0 + 16) = v1;
}

void OUTLINED_FUNCTION_9_2(Swift::Int a1)
{
  Swift::Int v4 = *(void *)(v1 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(a1, v2, v4);
}

void OUTLINED_FUNCTION_83()
{
  *(void *)(v0 + 16) = v1;
}

void OUTLINED_FUNCTION_81(uint64_t a1@<X8>)
{
  *(_DWORD *)(v1 + *(void *)(a1 + 80)) = v2;
}

uint64_t OUTLINED_FUNCTION_80()
{
  return 1;
}

void *OUTLINED_FUNCTION_49_0()
{
  uint64_t v5 = (void *)(*(void *)(v0 + 24) + *(void *)(v0 + 32) - v3);
  return memcpy(v5, v2, v1);
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  *(void *)(v1 + 16) = v0;
  *(void *)(v2 - 104) = *(void *)(v2 - 184);
  return sub_26173BD30();
}

void WK2_HourWeatherConditions.pressureTrend.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0x21u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 32);
  int v5 = v3 + 32;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_retain();
}

int64x2_t OUTLINED_FUNCTION_89@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_100@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_157(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 14;
}

uint64_t OUTLINED_FUNCTION_5_1@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - v2 + *(void *)(v1 + 24) - 4) = v3;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_223(uint64_t a1, void *a2)
{
  *a2 = v4;
  a2[1] = v2;
  a2[2] = v3;
}

uint64_t OUTLINED_FUNCTION_222()
{
  return v0;
}

void OUTLINED_FUNCTION_11_0()
{
  *(void *)(v0 + 16) = v1;
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1)
{
  *(void *)(v2 - 112) = a1;
  return v1;
}

void OUTLINED_FUNCTION_50(Swift::Int a1)
{
  Verifier.rangeInBuffer(position:size:)(a1, 4);
}

void *OUTLINED_FUNCTION_50_0()
{
  int v5 = (void *)(*(void *)(v1 + 24) + *(void *)(v1 + 32) - v3);
  return memcpy(v5, v2, v0);
}

void OUTLINED_FUNCTION_159(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 20;
}

int64x2_t OUTLINED_FUNCTION_128@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return v0;
}

int64x2_t OUTLINED_FUNCTION_124@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_38()
{
  *(void *)(v0 + 16) = v2;
  return v1;
}

int64x2_t OUTLINED_FUNCTION_151@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_131(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 42;
}

WeatherData::WK2_PollutantType_optional OUTLINED_FUNCTION_143(Swift::UInt8 a1)
{
  return WK2_PollutantType.init(rawValue:)(a1);
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

int64x2_t OUTLINED_FUNCTION_127@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

int64x2_t OUTLINED_FUNCTION_156@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_154@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_71()
{
  sub_26170C1D8();
}

void OUTLINED_FUNCTION_208(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 22;
}

void OUTLINED_FUNCTION_207(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 16;
}

int64x2_t OUTLINED_FUNCTION_202@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_201@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_153@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_150@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_142()
{
  static WK2_CurrentWeather.add(metadata:_:)();
}

unint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_26172E6F0();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_26173BF00();
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_allocObject();
}

void sub_261706814()
{
  OUTLINED_FUNCTION_173();
  OUTLINED_FUNCTION_120();
  if (v8 ^ v9 | v7) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_163();
  if (v7)
  {
    OUTLINED_FUNCTION_225();
    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      OUTLINED_FUNCTION_172();
      OUTLINED_FUNCTION_109();
      uint64_t v16 = OUTLINED_FUNCTION_44();
      *Swift::Int v17 = v4;
      goto LABEL_12;
    }
  }
  Swift::Int v22 = v10;
  Swift::Int v0 = v6 + 24;
  OUTLINED_FUNCTION_29(v4);
  if (!v1)
  {
    OUTLINED_FUNCTION_224();
    if (v12)
    {
      OUTLINED_FUNCTION_161();
      if (v13 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
        OUTLINED_FUNCTION_172();
        OUTLINED_FUNCTION_109();
        uint64_t v14 = OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_255(v14, v15);
LABEL_12:
        v17[1] = v0;
        v17[2] = v2;
        OUTLINED_FUNCTION_79(v16, (uint64_t)v17);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_50(v3);
      uint64_t v20 = OUTLINED_FUNCTION_187();
      sub_261706970(v20, v21, v22);
      goto LABEL_14;
    }
LABEL_9:
    if (v5)
    {
      sub_2617295E0();
      uint64_t v18 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_96(v18, v19);
LABEL_13:
      swift_willThrow();
    }
  }
LABEL_14:
  OUTLINED_FUNCTION_170();
}

Swift::Int sub_261706970(uint64_t a1, Swift::Int a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  Swift::Int result = sub_261706B18((unsigned __int8 *)a1, a2);
  if (v3) {
    return result;
  }
  Swift::Int v8 = result;
  uint64_t v9 = result + v7;
  if (result >= result + v7) {
    return result;
  }
  while (1)
  {
    unint64_t v10 = v8 + 4;
    if (!__OFADD__(v8, 4)) {
      break;
    }
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (*(unsigned char *)a1) {
      goto LABEL_8;
    }
LABEL_9:
    if ((v10 & 0x8000000000000000) != 0) {
      unint64_t v10 = -(uint64_t)v10;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    unint64_t v13 = *(void *)(v12 + 32);
    if ((v13 & 0x8000000000000000) != 0 || v13 < v10)
    {
      uint64_t v17 = *(void *)(a1 + 8);
      sub_2617295E0();
      uint64_t v18 = OUTLINED_FUNCTION_44();
      *(void *)uint64_t v19 = v10;
      *(void *)(v19 + 8) = v17;
      OUTLINED_FUNCTION_182(v18, (_OWORD *)v19);
LABEL_23:
      *(unsigned char *)(v20 + 64) = v21;
      return swift_willThrow();
    }
    unsigned int v14 = *(_DWORD *)(a1 + 16) + 4;
    *(_DWORD *)(a1 + 16) = v14;
    if (*(_DWORD *)(a1 + 64) < v14)
    {
      sub_2617295E0();
      uint64_t v22 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_105(v22, v23);
      goto LABEL_23;
    }
    uint64_t v15 = v8 + *(unsigned int *)(*(void *)(v12 + 24) + v8);
    if (v15 < 0) {
      uint64_t v15 = -v15;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v16 = v15;
    }
    Swift::Int result = a3(a1, v16);
    Swift::Int v8 = v11;
    if (v11 >= v9) {
      return result;
    }
  }
  uint64_t v11 = v8 + 4;
  if (!*(unsigned char *)a1) {
    goto LABEL_9;
  }
LABEL_8:
  if (((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)v8) & 3) == 0) {
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
  uint64_t v24 = OUTLINED_FUNCTION_229();
  Swift::Int v26 = v25;
  sub_2617295E0();
  uint64_t v27 = OUTLINED_FUNCTION_44();
  *unint64_t v28 = v8;
  v28[1] = v24;
  v28[2] = v26;
  OUTLINED_FUNCTION_79(v27, (uint64_t)v28);
  return swift_willThrow();
}

Swift::Int sub_261706B18(unsigned __int8 *a1, Swift::Int position)
{
  int v5 = *a1;
  if (v5 == 1 && ((*(_DWORD *)(*((void *)a1 + 5) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v6 = OUTLINED_FUNCTION_229();
    uint64_t v8 = v7;
    sub_2617295E0();
    uint64_t v9 = OUTLINED_FUNCTION_44();
    *unint64_t v10 = position;
LABEL_15:
    v10[1] = v6;
    v10[2] = v8;
    OUTLINED_FUNCTION_162(v9, (uint64_t)v10);
    return v2;
  }
  Verifier.rangeInBuffer(position:size:)(position, 4);
  if (!v11)
  {
    uint64_t v12 = *(void *)(*((void *)a1 + 5) + 24);
    unint64_t v13 = position + 4;
    if (position + 4 < 0) {
      unint64_t v13 = -4 - position;
    }
    if (v13 >= 0x7FFFFFFFFFFFFFFFLL) {
      Swift::Int v2 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      Swift::Int v2 = v13;
    }
    if ((((_BYTE)v12 + (_BYTE)v2) & 3) != 0) {
      int v14 = v5;
    }
    else {
      int v14 = 0;
    }
    if (v14 != 1)
    {
      Verifier.rangeInBuffer(position:size:)(v2, *(unsigned int *)(v12 + position));
      return v2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v6 = OUTLINED_FUNCTION_229();
    uint64_t v8 = v15;
    sub_2617295E0();
    uint64_t v16 = OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_255(v16, v17);
    goto LABEL_15;
  }
  return v2;
}

uint64_t OUTLINED_FUNCTION_241()
{
  return 10;
}

uint64_t OUTLINED_FUNCTION_226()
{
  return *(void *)v0;
}

void sub_261706CBC(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v29);
  if (!v2)
  {
    unint64_t v3 = v31;
    if (v31 < 5) {
      goto LABEL_42;
    }
    uint64_t v4 = v30 + 4;
    int v5 = v32;
    if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v30 + 4, 2);
      if (v6) {
        goto LABEL_42;
      }
      uint64_t v7 = *(void *)(v33 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v29 + v8;
        if ((((_BYTE)v7 + (_BYTE)v29 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1)
        {
          uint64_t v34 = MEMORY[0x263F8E8F8];
          unint64_t v10 = &qword_26A92AB80;
LABEL_41:
          __swift_instantiateConcreteTypeFromMangledName(v10);
          uint64_t v25 = sub_26173BC20();
          uint64_t v27 = v26;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v28 = v4;
          *(void *)(v28 + 8) = v25;
          *(void *)(v28 + 16) = v27;
          *(_OWORD *)(v28 + 24) = 0u;
          *(_OWORD *)(v28 + 40) = 0u;
          *(_OWORD *)(v28 + 49) = 0u;
          swift_willThrow();
          goto LABEL_42;
        }
        Verifier.rangeInBuffer(position:size:)(v29 + v8, 4);
        if (v11) {
          goto LABEL_42;
        }
      }
      if (v3 <= 6) {
        goto LABEL_42;
      }
      uint64_t v4 = v30 + 6;
      if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v30 + 6, 2);
        if (v12) {
          goto LABEL_42;
        }
        if (*(_WORD *)(*(void *)(v33 + 24) + v4))
        {
          Verifier.rangeInBuffer(position:size:)(v29 + *(unsigned __int16 *)(*(void *)(v33 + 24) + v4), 1);
          if (v13) {
            goto LABEL_42;
          }
        }
        if (v3 < 9) {
          goto LABEL_42;
        }
        uint64_t v4 = v30 + 8;
        int v14 = v32;
        if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
        {
          Verifier.rangeInBuffer(position:size:)(v30 + 8, 2);
          if (v15) {
            goto LABEL_42;
          }
          uint64_t v16 = *(void *)(v33 + 24);
          uint64_t v17 = *(unsigned __int16 *)(v16 + v4);
          if (*(_WORD *)(v16 + v4))
          {
            uint64_t v4 = v29 + v17;
            if ((((_BYTE)v16 + (_BYTE)v29 + (_BYTE)v17) & 3) != 0) {
              int v18 = v14;
            }
            else {
              int v18 = 0;
            }
            if (v18 == 1)
            {
LABEL_28:
              uint64_t v34 = MEMORY[0x263F8D5C8];
              unint64_t v10 = &qword_26A92AB88;
              goto LABEL_41;
            }
            Verifier.rangeInBuffer(position:size:)(v29 + v17, 4);
            if (v19) {
              goto LABEL_42;
            }
          }
          if (v3 <= 0xA)
          {
LABEL_42:
            swift_release();
            return;
          }
          uint64_t v4 = v30 + 10;
          int v20 = v32;
          if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
          {
            Verifier.rangeInBuffer(position:size:)(v30 + 10, 2);
            if (v21) {
              goto LABEL_42;
            }
            uint64_t v22 = *(void *)(v33 + 24);
            uint64_t v23 = *(unsigned __int16 *)(v22 + v4);
            if (!*(_WORD *)(v22 + v4)) {
              goto LABEL_42;
            }
            uint64_t v4 = v29 + v23;
            if ((((_BYTE)v22 + (_BYTE)v29 + (_BYTE)v23) & 3) != 0) {
              int v24 = v20;
            }
            else {
              int v24 = 0;
            }
            if (v24 == 1) {
              goto LABEL_28;
            }
            Verifier.rangeInBuffer(position:size:)(v29 + v23, 4);
            goto LABEL_42;
          }
        }
      }
    }
    uint64_t v34 = MEMORY[0x263F8E888];
    unint64_t v10 = &qword_26A92AB70;
    goto LABEL_41;
  }
}

WeatherData::WK2_PollutantType_optional __swiftcall WK2_PollutantType.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

char *OUTLINED_FUNCTION_104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, char a20)
{
  return &a20;
}

int64x2_t OUTLINED_FUNCTION_101@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void sub_261706FFC(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v36);
  uint64_t v3 = v2;
  if (!v2)
  {
    unint64_t v4 = v38;
    if (v38 >= 5)
    {
      uint64_t v5 = v37 + 4;
      sub_261708114(v37 + 4);
      if (*(_WORD *)(*(void *)(v39 + 24) + v5)) {
        sub_2617088FC(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v5));
      }
      if (v4 > 6)
      {
        uint64_t v6 = v37 + 6;
        sub_261708114(v37 + 6);
        if (*(_WORD *)(*(void *)(v39 + 24) + v6)) {
          sub_2617088FC(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v6));
        }
        if (v4 > 8)
        {
          uint64_t v7 = v37 + 8;
          sub_261708114(v37 + 8);
          if (*(_WORD *)(*(void *)(v39 + 24) + v7))
          {
            Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v7), 1);
            uint64_t v3 = v8;
            if (v8) {
              goto LABEL_44;
            }
          }
          if (v4 > 0xA)
          {
            uint64_t v9 = v37 + 10;
            sub_261708114(v37 + 10);
            if (v3) {
              goto LABEL_44;
            }
            if (*(_WORD *)(*(void *)(v39 + 24) + v9))
            {
              Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v9), 1);
              uint64_t v3 = v10;
              if (v10) {
                goto LABEL_44;
              }
            }
            if (v4 > 0xC)
            {
              uint64_t v11 = v37 + 12;
              sub_261708114(v37 + 12);
              if (v3) {
                goto LABEL_44;
              }
              if (*(_WORD *)(*(void *)(v39 + 24) + v11))
              {
                Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v11), 1);
                uint64_t v3 = v12;
                if (v12) {
                  goto LABEL_44;
                }
              }
              if (v4 > 0xE)
              {
                uint64_t v13 = v37 + 14;
                sub_261708114(v37 + 14);
                if (v3) {
                  goto LABEL_44;
                }
                if (*(_WORD *)(*(void *)(v39 + 24) + v13))
                {
                  Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v13), 1);
                  uint64_t v3 = v14;
                  if (v14) {
                    goto LABEL_44;
                  }
                }
                if (v4 > 0x10)
                {
                  uint64_t v15 = v37 + 16;
                  sub_261708114(v37 + 16);
                  if (v3) {
                    goto LABEL_44;
                  }
                  if (*(_WORD *)(*(void *)(v39 + 24) + v15))
                  {
                    Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v15), 1);
                    uint64_t v3 = v16;
                    if (v16) {
                      goto LABEL_44;
                    }
                  }
                  if (v4 > 0x12)
                  {
                    uint64_t v17 = v37 + 18;
                    sub_261708114(v37 + 18);
                    if (v3) {
                      goto LABEL_44;
                    }
                    if (*(_WORD *)(*(void *)(v39 + 24) + v17))
                    {
                      Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v17), 1);
                      uint64_t v3 = v18;
                      if (v18) {
                        goto LABEL_44;
                      }
                    }
                    if (v4 > 0x14)
                    {
                      uint64_t v19 = v37 + 20;
                      sub_261708114(v37 + 20);
                      if (v3) {
                        goto LABEL_44;
                      }
                      if (*(_WORD *)(*(void *)(v39 + 24) + v19))
                      {
                        Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v19), 1);
                        uint64_t v3 = v20;
                        if (v20) {
                          goto LABEL_44;
                        }
                      }
                      if (v4 > 0x16)
                      {
                        uint64_t v21 = v37 + 22;
                        sub_261708114(v37 + 22);
                        if (v3) {
                          goto LABEL_44;
                        }
                        if (*(_WORD *)(*(void *)(v39 + 24) + v21))
                        {
                          Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v21), 1);
                          uint64_t v3 = v22;
                          if (v22) {
                            goto LABEL_44;
                          }
                        }
                        if (v4 > 0x18)
                        {
                          uint64_t v23 = v37 + 24;
                          sub_261708114(v37 + 24);
                          if (v3) {
                            goto LABEL_44;
                          }
                          if (*(_WORD *)(*(void *)(v39 + 24) + v23)) {
                            sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v23));
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    sub_261706814();
    if (!v3)
    {
      if ((uint64_t)v4 >= 29)
      {
        uint64_t v24 = v37 + 28;
        sub_261708114(v37 + 28);
        if (*(_WORD *)(*(void *)(v39 + 24) + v24))
        {
          Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v24), 1);
          uint64_t v3 = v25;
          if (v25) {
            goto LABEL_44;
          }
        }
        if (v4 > 0x1E)
        {
          uint64_t v26 = v37 + 30;
          sub_261708114(v37 + 30);
          if (v3) {
            goto LABEL_44;
          }
          if (*(_WORD *)(*(void *)(v39 + 24) + v26))
          {
            Verifier.rangeInBuffer(position:size:)(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v26), 1);
            uint64_t v3 = v27;
            if (v27) {
              goto LABEL_44;
            }
          }
          if (v4 > 0x20)
          {
            uint64_t v28 = v37 + 32;
            sub_261708114(v37 + 32);
            if (v3) {
              goto LABEL_44;
            }
            if (*(_WORD *)(*(void *)(v39 + 24) + v28)) {
              sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v28));
            }
            if (v4 > 0x22)
            {
              uint64_t v29 = v37 + 34;
              sub_261708114(v37 + 34);
              if (*(_WORD *)(*(void *)(v39 + 24) + v29)) {
                sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v29));
              }
              if (v4 >= 0x25)
              {
                uint64_t v30 = v37 + 36;
                sub_261708114(v37 + 36);
                if (*(_WORD *)(*(void *)(v39 + 24) + v30)) {
                  sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v30));
                }
                if (v4 > 0x26)
                {
                  uint64_t v31 = v37 + 38;
                  sub_261708114(v37 + 38);
                  if (*(_WORD *)(*(void *)(v39 + 24) + v31)) {
                    sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v31));
                  }
                  if (v4 > 0x28)
                  {
                    uint64_t v32 = v37 + 40;
                    sub_261708114(v37 + 40);
                    if (*(_WORD *)(*(void *)(v39 + 24) + v32)) {
                      sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v32));
                    }
                    if (v4 > 0x2A)
                    {
                      uint64_t v33 = v37 + 42;
                      sub_261708114(v37 + 42);
                      if (*(_WORD *)(*(void *)(v39 + 24) + v33)) {
                        sub_261708114(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v33));
                      }
                      if (v4 > 0x2C)
                      {
                        uint64_t v34 = v37 + 44;
                        sub_261708114(v37 + 44);
                        if (*(_WORD *)(*(void *)(v39 + 24) + v34)) {
                          sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v34));
                        }
                        if (v4 >= 0x2F)
                        {
                          uint64_t v35 = v37 + 46;
                          sub_261708114(v37 + 46);
                          if (*(_WORD *)(*(void *)(v39 + 24) + v35)) {
                            sub_261708924(v36 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v35));
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      sub_261708290();
      if (!v3)
      {
        sub_261708290();
        sub_261708290();
        sub_261715A08(0x36u, 0x4D7865646E497675, 0xEA00000000006E69, 0);
        sub_261715A08(0x38u, 0x4D7865646E497675, 0xEA00000000007861, 0);
        sub_261708290();
        sub_261708290();
        sub_261715A08(0x3Eu, 0x746867696C796164, 0xE800000000000000, 0);
      }
    }
LABEL_44:
    swift_release();
  }
}

void sub_261707904(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v38);
  uint64_t v3 = v2;
  if (!v2)
  {
    unint64_t v4 = v40;
    if (v40 < 5) {
      goto LABEL_78;
    }
    uint64_t v5 = v39 + 4;
    sub_261708114(v39 + 4);
    if (*(_WORD *)(*(void *)(v41 + 24) + v5)) {
      sub_2617088FC(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v5));
    }
    if (v4 <= 6) {
      goto LABEL_78;
    }
    uint64_t v6 = v39 + 6;
    sub_261708114(v39 + 6);
    if (!*(_WORD *)(*(void *)(v41 + 24) + v6)
      || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v6), 1),
          (uint64_t v3 = v7) == 0))
    {
      if (v4 <= 8) {
        goto LABEL_78;
      }
      uint64_t v8 = v39 + 8;
      sub_261708114(v39 + 8);
      if (!v3)
      {
        if (!*(_WORD *)(*(void *)(v41 + 24) + v8)
          || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v8), 1),
              (uint64_t v3 = v9) == 0))
        {
          if (v4 <= 0xA) {
            goto LABEL_78;
          }
          uint64_t v10 = v39 + 10;
          sub_261708114(v39 + 10);
          if (!v3)
          {
            if (!*(_WORD *)(*(void *)(v41 + 24) + v10)
              || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v10), 1),
                  (uint64_t v3 = v11) == 0))
            {
              if (v4 <= 0xC) {
                goto LABEL_78;
              }
              uint64_t v12 = v39 + 12;
              sub_261708114(v39 + 12);
              if (!v3)
              {
                if (!*(_WORD *)(*(void *)(v41 + 24) + v12)
                  || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v12), 1), (uint64_t v3 = v13) == 0))
                {
                  if (v4 <= 0xE) {
                    goto LABEL_78;
                  }
                  uint64_t v14 = v39 + 14;
                  sub_261708114(v39 + 14);
                  if (!v3)
                  {
                    if (!*(_WORD *)(*(void *)(v41 + 24) + v14)
                      || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v14), 1), (uint64_t v3 = v15) == 0))
                    {
                      if (v4 <= 0x10) {
                        goto LABEL_78;
                      }
                      uint64_t v16 = v39 + 16;
                      sub_261708114(v39 + 16);
                      if (!v3)
                      {
                        if (!*(_WORD *)(*(void *)(v41 + 24) + v16)
                          || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v16), 1), (uint64_t v3 = v17) == 0))
                        {
                          if (v4 <= 0x12) {
                            goto LABEL_78;
                          }
                          uint64_t v18 = v39 + 18;
                          sub_261708114(v39 + 18);
                          if (!v3)
                          {
                            if (!*(_WORD *)(*(void *)(v41 + 24) + v18)
                              || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v18), 1), (uint64_t v3 = v19) == 0))
                            {
                              if (v4 <= 0x14) {
                                goto LABEL_78;
                              }
                              uint64_t v20 = v39 + 20;
                              sub_261708114(v39 + 20);
                              if (!v3)
                              {
                                if (*(_WORD *)(*(void *)(v41 + 24) + v20)) {
                                  sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v20));
                                }
                                if (v4 <= 0x16) {
                                  goto LABEL_78;
                                }
                                uint64_t v21 = v39 + 22;
                                sub_261708114(v39 + 22);
                                if (*(_WORD *)(*(void *)(v41 + 24) + v21)) {
                                  sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v21));
                                }
                                if (v4 <= 0x18) {
                                  goto LABEL_78;
                                }
                                uint64_t v22 = v39 + 24;
                                sub_261708114(v39 + 24);
                                if (*(_WORD *)(*(void *)(v41 + 24) + v22)) {
                                  sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v22));
                                }
                                if (v4 <= 0x1A) {
                                  goto LABEL_78;
                                }
                                uint64_t v23 = v39 + 26;
                                sub_261708114(v39 + 26);
                                if (!*(_WORD *)(*(void *)(v41 + 24) + v23)
                                  || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v23), 1), (uint64_t v3 = v24) == 0))
                                {
                                  if (v4 <= 0x1C) {
                                    goto LABEL_78;
                                  }
                                  uint64_t v25 = v39 + 28;
                                  sub_261708114(v39 + 28);
                                  if (!v3)
                                  {
                                    if (!*(_WORD *)(*(void *)(v41 + 24) + v25)
                                      || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v25), 1), (uint64_t v3 = v26) == 0))
                                    {
                                      if (v4 <= 0x1E) {
                                        goto LABEL_78;
                                      }
                                      uint64_t v27 = v39 + 30;
                                      sub_261708114(v39 + 30);
                                      if (!v3)
                                      {
                                        if (*(_WORD *)(*(void *)(v41 + 24) + v27)) {
                                          sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v27));
                                        }
                                        if (v4 <= 0x20) {
                                          goto LABEL_78;
                                        }
                                        uint64_t v28 = v39 + 32;
                                        sub_261708114(v39 + 32);
                                        if (!*(_WORD *)(*(void *)(v41 + 24) + v28)
                                          || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v28), 1), (uint64_t v3 = v29) == 0))
                                        {
                                          if (v4 <= 0x22) {
                                            goto LABEL_78;
                                          }
                                          uint64_t v30 = v39 + 34;
                                          sub_261708114(v39 + 34);
                                          if (!v3)
                                          {
                                            if (*(_WORD *)(*(void *)(v41 + 24) + v30)) {
                                              sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v30));
                                            }
                                            if (v4 < 0x25) {
                                              goto LABEL_78;
                                            }
                                            uint64_t v31 = v39 + 36;
                                            sub_261708114(v39 + 36);
                                            if (*(_WORD *)(*(void *)(v41 + 24) + v31)) {
                                              sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v31));
                                            }
                                            if (v4 <= 0x26) {
                                              goto LABEL_78;
                                            }
                                            uint64_t v32 = v39 + 38;
                                            sub_261708114(v39 + 38);
                                            if (*(_WORD *)(*(void *)(v41 + 24) + v32)) {
                                              sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v32));
                                            }
                                            if (v4 <= 0x28) {
                                              goto LABEL_78;
                                            }
                                            uint64_t v33 = v39 + 40;
                                            sub_261708114(v39 + 40);
                                            if (*(_WORD *)(*(void *)(v41 + 24) + v33)) {
                                              sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v33));
                                            }
                                            if (v4 <= 0x2A) {
                                              goto LABEL_78;
                                            }
                                            uint64_t v34 = v39 + 42;
                                            sub_261708114(v39 + 42);
                                            if (*(_WORD *)(*(void *)(v41 + 24) + v34)) {
                                              sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v34));
                                            }
                                            if (v4 < 0x2D) {
                                              goto LABEL_78;
                                            }
                                            uint64_t v35 = v39 + 44;
                                            sub_261708114(v39 + 44);
                                            if (*(_WORD *)(*(void *)(v41 + 24) + v35)) {
                                              sub_261708924(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v35));
                                            }
                                            if (v4 <= 0x2E
                                              || (uint64_t v36 = v39 + 46,
                                                  sub_261708114(v39 + 46),
                                                  !*(_WORD *)(*(void *)(v41 + 24) + v36))
                                              || (Verifier.rangeInBuffer(position:size:)(v38 + *(unsigned __int16 *)(*(void *)(v41 + 24) + v36), 1), (uint64_t v3 = v37) == 0))
                                            {
LABEL_78:
                                              sub_261708290();
                                              if (!v3)
                                              {
                                                sub_261708700(0x32u, 0x65726944646E6977, 0xED00006E6F697463, 0);
                                                sub_261708290();
                                                sub_261708290();
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    swift_release();
  }
}

void sub_261708114(Swift::Int position)
{
  if (*(unsigned char *)v1 == 1 && ((*(_DWORD *)(*(void *)(v1 + 40) + 24) + position) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    uint64_t v3 = OUTLINED_FUNCTION_229();
    sub_2617295E0();
    uint64_t v4 = OUTLINED_FUNCTION_44();
    *uint64_t v5 = position;
    v5[1] = v3;
    OUTLINED_FUNCTION_2_5(v4, (uint64_t)v5);
  }
  else
  {
    Verifier.rangeInBuffer(position:size:)(position, 2);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Verifier.rangeInBuffer(position:size:)(Swift::Int position, Swift::Int size)
{
  if (size + position >= 0) {
    unint64_t v3 = size + position;
  }
  else {
    unint64_t v3 = -(size + position);
  }
  unint64_t v4 = *(void *)(*(void *)(v2 + 40) + 32);
  if ((v4 & 0x8000000000000000) != 0 || v4 < v3)
  {
    uint64_t v9 = *(void *)(v2 + 8);
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v7 = v3;
    *(void *)(v7 + 8) = v9;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_OWORD *)(v7 + 32) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    char v8 = 1;
    goto LABEL_11;
  }
  if (size < 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(size))
  {
LABEL_14:
    __break(1u);
    return;
  }
  unsigned int v5 = *(_DWORD *)(v2 + 16) + size;
  *(_DWORD *)(v2 + 16) = v5;
  if (*(_DWORD *)(v2 + 64) >= v5) {
    return;
  }
  sub_2617295E0();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_0_5(v6, 6);
LABEL_11:
  *(unsigned char *)(v7 + 64) = v8;
  swift_willThrow();
}

void sub_261708290()
{
  OUTLINED_FUNCTION_173();
  char v5 = v4;
  Swift::Int v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v2;
  if (*(void *)(v0 + 16) <= (uint64_t)v2)
  {
LABEL_11:
    if (v5)
    {
      sub_2617295E0();
      uint64_t v19 = OUTLINED_FUNCTION_44();
      *uint64_t v20 = v10;
      v20[1] = v9;
      OUTLINED_FUNCTION_171(v19, (uint64_t)v20);
LABEL_15:
      swift_willThrow();
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  Swift::Int v11 = *(void *)(v0 + 8) + v2;
  int v12 = *(unsigned __int8 *)(v0 + 24);
  if (v12 == 1 && ((*(_DWORD *)(*(void *)(v0 + 64) + 24) + v11) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    OUTLINED_FUNCTION_172();
    OUTLINED_FUNCTION_109();
    uint64_t v17 = OUTLINED_FUNCTION_44();
    *uint64_t v18 = v11;
    v18[1] = v0;
    v18[2] = v7;
LABEL_14:
    OUTLINED_FUNCTION_79(v17, (uint64_t)v18);
    goto LABEL_15;
  }
  uint64_t v21 = v3;
  OUTLINED_FUNCTION_29(v11);
  if (!v1)
  {
    uint64_t v13 = *(void *)(*(void *)(v0 + 64) + 24);
    if (*(_WORD *)(v13 + v11))
    {
      if ((((_BYTE)v13 + *(unsigned char *)v0 + *(_WORD *)(v13 + v11)) & 3) != 0) {
        int v14 = v12;
      }
      else {
        int v14 = 0;
      }
      if (v14 != 1)
      {
        OUTLINED_FUNCTION_31();
        goto LABEL_16;
      }
      __swift_instantiateConcreteTypeFromMangledName(v21);
      OUTLINED_FUNCTION_172();
      OUTLINED_FUNCTION_87();
      uint64_t v15 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_135(v15, v16);
      goto LABEL_14;
    }
    goto LABEL_11;
  }
LABEL_16:
  OUTLINED_FUNCTION_170();
}

void Verifier.visitTable(at:)(unint64_t position@<X0>, uint64_t a2@<X8>)
{
  int v5 = *v2;
  if (v5 == 1 && ((*(_DWORD *)(*((void *)v2 + 5) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A92AEA0);
    uint64_t v6 = OUTLINED_FUNCTION_229();
    uint64_t v8 = v7;
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v9 = position;
    *(void *)(v9 + 8) = v6;
    *(void *)(v9 + 16) = v8;
LABEL_4:
    *(_OWORD *)(v9 + 24) = 0u;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 49) = 0u;
LABEL_18:
    swift_willThrow();
    return;
  }
  Verifier.rangeInBuffer(position:size:)(position, 4);
  if (v10) {
    return;
  }
  if ((position & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_38;
  }
  if (HIDWORD(position))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = *((void *)v2 + 5);
  uint64_t v12 = *(void *)(v11 + 24);
  uint64_t v13 = *(int *)(v12 + position);
  BOOL v14 = __CFADD__(position, -(int)v13);
  Swift::Int v15 = (position - v13);
  if ((int)v13 <= 0) {
    BOOL v16 = v14;
  }
  else {
    BOOL v16 = position < v13;
  }
  if (v16 || *(void *)(v11 + 32) < (uint64_t)v15)
  {
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v17 = v13;
    *(void *)(v17 + 8) = position;
    *(_OWORD *)(v17 + 16) = 0u;
    *(_OWORD *)(v17 + 32) = 0u;
    *(_OWORD *)(v17 + 48) = 0u;
    char v18 = 2;
LABEL_17:
    *(unsigned char *)(v17 + 64) = v18;
    goto LABEL_18;
  }
  if (v5 && ((v12 + v15) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    uint64_t v19 = OUTLINED_FUNCTION_229();
    uint64_t v21 = v20;
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v9 = v15;
LABEL_23:
    *(void *)(v9 + 8) = v19;
    *(void *)(v9 + 16) = v21;
    goto LABEL_4;
  }
  Verifier.rangeInBuffer(position:size:)(v15, 2);
  if (!v22)
  {
    uint64_t v23 = *(void *)(v11 + 24);
    Swift::Int v24 = *(unsigned __int16 *)(v23 + v15);
    if (v5 && ((v23 + v24 + v15) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v19 = OUTLINED_FUNCTION_229();
      uint64_t v21 = v25;
      sub_2617295E0();
      OUTLINED_FUNCTION_44();
      *(void *)uint64_t v9 = v24 + v15;
      goto LABEL_23;
    }
    Verifier.rangeInBuffer(position:size:)(v15, v24);
    if (!v26)
    {
      uint64_t v27 = *((void *)v2 + 3);
      BOOL v28 = __OFADD__(v27, 1);
      uint64_t v29 = v27 + 1;
      if (!v28)
      {
        *((void *)v2 + 3) = v29;
        uint64_t v30 = *((unsigned int *)v2 + 17);
        if (v29 > v30)
        {
          sub_2617295E0();
          OUTLINED_FUNCTION_44();
          uint64_t v32 = 3;
LABEL_35:
          OUTLINED_FUNCTION_0_5(v31, v32);
          goto LABEL_17;
        }
        uint64_t v33 = *((void *)v2 + 4);
        BOOL v28 = __OFADD__(v33, 1);
        uint64_t v34 = v33 + 1;
        if (!v28)
        {
          *((void *)v2 + 4) = v34;
          uint64_t v35 = *((unsigned int *)v2 + 18);
          if (v34 <= v35)
          {
            uint64_t v36 = *((void *)v2 + 1);
            int v37 = *((_DWORD *)v2 + 4);
            int v38 = *((_DWORD *)v2 + 16);
            unsigned __int8 v39 = v2[76];
            *(void *)a2 = position;
            *(void *)(a2 + 8) = v15;
            *(void *)(a2 + 16) = v24;
            *(unsigned char *)(a2 + 24) = v5;
            *(void *)(a2 + 32) = v36;
            *(_DWORD *)(a2 + 40) = v37;
            *(void *)(a2 + 48) = v29;
            *(void *)(a2 + 56) = v34;
            *(void *)(a2 + 64) = v11;
            *(_OWORD *)(a2 + 72) = *((_OWORD *)v2 + 3);
            *(_DWORD *)(a2 + 88) = v38;
            *(_DWORD *)(a2 + 92) = v30;
            *(_DWORD *)(a2 + 96) = v35;
            *(unsigned char *)(a2 + 100) = v39;
            swift_retain();
            return;
          }
          sub_2617295E0();
          OUTLINED_FUNCTION_44();
          uint64_t v32 = 4;
          goto LABEL_35;
        }
LABEL_40:
        __break(1u);
        return;
      }
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
  }
}

void sub_261708700(unsigned __int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a1;
  if (*(void *)(v4 + 16) > (uint64_t)a1)
  {
    Swift::Int v9 = *(void *)(v4 + 8) + a1;
    int v10 = *(unsigned __int8 *)(v4 + 24);
    if (v10 == 1 && ((*(_DWORD *)(*(void *)(v4 + 64) + 24) + v9) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v20 = sub_26173BC20();
      uint64_t v22 = v21;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v18 = v9;
      *(void *)(v18 + 8) = v20;
      *(void *)(v18 + 16) = v22;
LABEL_11:
      *(_OWORD *)(v18 + 24) = 0u;
      *(_OWORD *)(v18 + 40) = 0u;
      *(_OWORD *)(v18 + 49) = 0u;
      goto LABEL_12;
    }
    Verifier.rangeInBuffer(position:size:)(v9, 2);
    if (v11) {
      return;
    }
    uint64_t v12 = *(void *)(*(void *)(v4 + 64) + 24);
    if (*(_WORD *)(v12 + v9))
    {
      uint64_t v13 = *(unsigned __int16 *)(v12 + v9);
      uint64_t v14 = *(void *)v4 + v13;
      if ((v10 & (v12 + v14)) != 1)
      {
        Verifier.rangeInBuffer(position:size:)(*(void *)v4 + v13, 2);
        return;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v15 = sub_26173BC20();
      uint64_t v17 = v16;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v18 = v14;
      *(void *)(v18 + 8) = v15;
      *(void *)(v18 + 16) = v17;
      goto LABEL_11;
    }
  }
  if ((a4 & 1) == 0) {
    return;
  }
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v19 = v8;
  *(void *)(v19 + 8) = a2;
  *(void *)(v19 + 16) = a3;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_OWORD *)(v19 + 40) = 0u;
  *(void *)(v19 + 56) = 0;
  *(unsigned char *)(v19 + 64) = 3;
  swift_bridgeObjectRetain();
LABEL_12:
  swift_willThrow();
}

void sub_2617088FC(Swift::Int a1)
{
}

void sub_261708924(Swift::Int a1)
{
}

void sub_26170894C(Swift::Int position, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)v3 == 1 && ((*(_DWORD *)(*(void *)(v3 + 40) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v5 = OUTLINED_FUNCTION_229();
    sub_2617295E0();
    uint64_t v6 = OUTLINED_FUNCTION_44();
    *uint64_t v7 = position;
    v7[1] = v5;
    OUTLINED_FUNCTION_2_5(v6, (uint64_t)v7);
  }
  else
  {
    Verifier.rangeInBuffer(position:size:)(position, 4);
  }
}

uint64_t sub_2617089EC(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  v46 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unsigned __int8 v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v31 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v32 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = sub_26173BD60();
  if (!v20) {
    return sub_26173BCE0();
  }
  uint64_t v21 = v20;
  uint64_t v49 = sub_26173BE10();
  uint64_t v38 = sub_26173BE20();
  sub_26173BDF0();
  uint64_t v42 = a6;
  uint64_t result = sub_26173BD50();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v40 = (void (**)(char *))(v39 + 2);
    uint64_t v41 = v14;
    ++v39;
    while (1)
    {
      uint64_t v23 = (void (*)(char *, void))sub_26173BD80();
      Swift::Int v24 = v12;
      uint64_t v25 = v12;
      uint64_t v26 = AssociatedTypeWitness;
      (*v40)(v24);
      v23(v48, 0);
      uint64_t v27 = v47;
      v44(v25, v46);
      if (v27) {
        break;
      }
      uint64_t v47 = 0;
      (*v39)(v25, v26);
      sub_26173BE00();
      sub_26173BD70();
      --v21;
      uint64_t v12 = v25;
      if (!v21)
      {
        uint64_t v28 = v36;
        uint64_t v29 = v37;
        uint64_t v30 = v32;
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v32, v19, v37);
        sub_26173BDB0();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
        return v49;
      }
    }
    (*v39)(v25, v26);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v46, v34);
  }
  return result;
}

Swift::UInt32 __swiftcall FlatBufferBuilder.endTable(at:)(Swift::UInt32 at)
{
  OUTLINED_FUNCTION_42_0();
  unsigned __int16 v2 = v1;
  int v4 = v3;
  OUTLINED_FUNCTION_32_1();
  if (v6 ^ v7 | v5) {
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v8 = v1[2];
  if ((v8 & 0x8000000000000000) != 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (HIDWORD(v8))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  unint64_t v9 = (-*((_DWORD *)v1 + 4) & 3) + v8;
  uint64_t v10 = v1[1];
  OUTLINED_FUNCTION_63();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v11, v12, v2[3]);
  }
  v2[2] = v9;
  Swift::Int v13 = v9 + 4;
  OUTLINED_FUNCTION_36_0();
  if (v6 != v7) {
    OUTLINED_FUNCTION_29_0();
  }
  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)(v14 - 4) = 0;
  v2[2] = v13;
  if (v9 > 0xFFFFFFFB) {
    goto LABEL_42;
  }
  unsigned int v15 = v13 - v4;
  uint64_t v16 = *v2;
  uint64_t v17 = *(unsigned __int16 *)(*v2 + 64);
  uint64_t v18 = v17 + 2 + v13;
  OUTLINED_FUNCTION_15_0();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v17 + 2, v13, v2[3]);
  }
  v2[2] = v18;
  if (HIWORD(v15)) {
    goto LABEL_43;
  }
  uint64_t v19 = *(void *)(v10 + 24);
  uint64_t v20 = *(void *)(v10 + 32) - v18;
  *(_WORD *)(v20 + v19 + 2) = v15;
  if (v17 > 0xFFFD)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  *(_WORD *)(v19 + v20) = v17 + 2;
  uint64_t v21 = *(void *)(v16 + 80);
  if (v21 >= 1)
  {
    for (uint64_t i = 0; i < v21; i += 8)
    {
      if (*(unsigned char *)(v16 + 48)) {
        goto LABEL_49;
      }
      uint64_t v23 = *(void *)(v16 + 32);
      if (!v23) {
        goto LABEL_50;
      }
      int v24 = *(_DWORD *)(v23 + i);
      if (v24)
      {
        unsigned int v25 = v13 - v24;
        if (HIWORD(v25))
        {
          __break(1u);
          goto LABEL_40;
        }
        *(_WORD *)(*(void *)(v10 + 24) + *(void *)(v10 + 32) - v18 + *(unsigned __int16 *)(v23 + i + 4)) = v25;
      }
    }
  }
  *(_WORD *)(v16 + 64) = 0;
  *(void *)(v16 + 72) = 0;
  *(void *)(v16 + 80) = 0;
  if (v18 > 0xFFFFFFFFLL) {
    goto LABEL_45;
  }
  uint64_t v26 = v2 + 4;
  uint64_t v27 = v2[4];
  uint64_t v28 = *(void *)(v27 + 16);
  if (!v28) {
    goto LABEL_33;
  }
  uint64_t v41 = v2 + 4;
  uint64_t v42 = v2;
  unsigned int v43 = v13;
  uint64_t v30 = *(void *)(v10 + 24);
  uint64_t v29 = *(void *)(v10 + 32);
  size_t v31 = *(__int16 *)(v30 + v29 - v18);
  swift_bridgeObjectRetain();
  for (uint64_t j = 0; j != v28; ++j)
  {
    uint64_t v33 = *(unsigned int *)(v27 + 4 * j + 32);
    uint64_t v34 = (unsigned __int16 *)(v30 + v29 - v33);
    if (*v34 == (unsigned __int16)v31 && !memcmp(v34, (const void *)(v30 + v29 - v18), v31))
    {
      swift_bridgeObjectRelease();
      uint64_t v37 = v33 - v43;
      if (v37 >= (uint64_t)0xFFFFFFFF80000000)
      {
        unsigned __int16 v2 = v42;
        if (v37 <= 0x7FFFFFFF)
        {
          uint64_t v39 = *(void *)(v10 + 24);
          uint64_t v38 = *(void *)(v10 + 32);
          *(_DWORD *)(v39 + v38 - v43) = v37;
          bzero((void *)(v39 + v38 - v18), v18 - v43);
          v42[2] = v43;
          goto LABEL_38;
        }
        goto LABEL_48;
      }
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
    }
  }
  swift_bridgeObjectRelease();
  unsigned __int16 v2 = v42;
  LODWORD(v13) = v43;
  uint64_t v26 = v41;
LABEL_33:
  if ((int)v18 - (int)v13 < 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  *(_DWORD *)(*(void *)(v10 + 24) + *(void *)(v10 + 32) - v13) = v18 - v13;
  sub_261709230();
  uint64_t v35 = *(char **)(*v26 + 16);
  sub_2617091F0(v35);
  uint64_t v36 = *v26;
  *(void *)(v36 + 16) = v35 + 1;
  *(_DWORD *)(v36 + 4 * (void)v35 + 32) = v18;
  *uint64_t v26 = v36;
LABEL_38:
  *((unsigned char *)v2 + 40) = 0;
  OUTLINED_FUNCTION_41_0();
  return result;
}

uint64_t sub_26170913C(uint64_t a1)
{
  return sub_261709160(a1, v1[5], v1[2], v1[3], v1[4]);
}

uint64_t sub_261709160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return v7(a2, AssociatedTypeWitness, a5);
}

char *sub_2617091F0(char *result)
{
  unint64_t v2 = *((void *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    Swift::UInt32 result = sub_2617094CC((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = result;
  }
  return result;
}

char *sub_261709230()
{
  uint64_t v1 = *v0;
  Swift::UInt32 result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *Swift::Int v0 = v1;
  if (!result)
  {
    Swift::UInt32 result = sub_2617094CC(result, *((void *)v1 + 2) + 1, 1, v1);
    *Swift::Int v0 = result;
  }
  return result;
}

Swift::Void __swiftcall ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(Swift::Int _, Swift::Int writerSize, Swift::Int alignment)
{
  Swift::Int v5 = *(void *)(v3 + 32);
  Swift::Int v6 = writerSize + _;
  uint64_t v7 = v5;
  if (v6 >= v5)
  {
    do
    {
      BOOL v8 = v6 < 2 * v7;
      v7 *= 2;
    }
    while (!v8);
    *(void *)(v3 + 32) = v7;
  }
  Swift::Int v9 = v5 - writerSize;
  *(void *)(v3 + 32) = sub_26170932C(v7);
  uint64_t v10 = (char *)swift_slowAlloc();
  size_t v11 = *(void *)(v3 + 32) - writerSize;
  bzero(v10, v11);
  Swift::Int v12 = &v10[v11];
  uint64_t v13 = *(void *)(v3 + 24);
  memcpy(v12, (const void *)(v13 + v9), writerSize);
  MEMORY[0x263E3EDF0](v13, -1, -1);
  *(void *)(v3 + 24) = v10;
}

uint64_t sub_26170932C(uint64_t result)
{
  if (result < 1) {
    return 1;
  }
  if (HIDWORD(result))
  {
    __break(1u);
  }
  else
  {
    unsigned int v1 = (result - 1) | ((result - 1) >> 1) | (((result - 1) | ((result - 1) >> 1)) >> 2);
    unsigned int v2 = v1 | (v1 >> 4) | ((v1 | (v1 >> 4)) >> 8);
    int v3 = v2 | HIWORD(v2);
    BOOL v4 = __CFADD__(v3, 1);
    unsigned int v5 = v3 + 1;
    if (v4) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v5;
    }
  }
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

int64x2_t OUTLINED_FUNCTION_199@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_158(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 6;
}

int64x2_t OUTLINED_FUNCTION_155@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_149@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_130(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 10;
}

int64x2_t OUTLINED_FUNCTION_126@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

char *OUTLINED_FUNCTION_121(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, char a15)
{
  return &a15;
}

void OUTLINED_FUNCTION_103(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 8;
}

char *sub_2617094CC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AE88);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  Swift::Int v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[4 * v8] <= v12) {
      memmove(v12, v13, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_2617095C4(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v19);
  if (!v2)
  {
    unint64_t v3 = v21;
    if (v21 >= 5)
    {
      uint64_t v4 = v20 + 4;
      if (v22 == 1 && ((*(_DWORD *)(v23 + 24) + v4) & 1) != 0) {
        goto LABEL_25;
      }
      Verifier.rangeInBuffer(position:size:)(v20 + 4, 2);
      if (v5) {
        goto LABEL_27;
      }
      if (*(_WORD *)(*(void *)(v23 + 24) + v4))
      {
        Verifier.rangeInBuffer(position:size:)(v19 + *(unsigned __int16 *)(*(void *)(v23 + 24) + v4), 1);
        if (v6) {
          goto LABEL_27;
        }
      }
      if (v3 <= 6) {
        goto LABEL_27;
      }
      uint64_t v4 = v20 + 6;
      int v7 = v22;
      if (v22 == 1 && ((*(_DWORD *)(v23 + 24) + v4) & 1) != 0)
      {
LABEL_25:
        uint64_t v24 = MEMORY[0x263F8E888];
        Swift::Int v12 = &qword_26A92AB70;
        goto LABEL_26;
      }
      Verifier.rangeInBuffer(position:size:)(v20 + 6, 2);
      if (!v8)
      {
        uint64_t v9 = *(void *)(v23 + 24);
        uint64_t v10 = *(unsigned __int16 *)(v9 + v4);
        if (!*(_WORD *)(v9 + v4)) {
          goto LABEL_19;
        }
        uint64_t v4 = v19 + v10;
        if ((((_BYTE)v9 + (_BYTE)v19 + (_BYTE)v10) & 3) != 0) {
          int v11 = v7;
        }
        else {
          int v11 = 0;
        }
        if (v11 == 1)
        {
          uint64_t v24 = MEMORY[0x263F8D5C8];
          Swift::Int v12 = &qword_26A92AB88;
LABEL_26:
          __swift_instantiateConcreteTypeFromMangledName(v12);
          uint64_t v15 = sub_26173BC20();
          uint64_t v17 = v16;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v18 = v4;
          *(void *)(v18 + 8) = v15;
          *(void *)(v18 + 16) = v17;
          *(_OWORD *)(v18 + 24) = 0u;
          *(_OWORD *)(v18 + 40) = 0u;
          *(_OWORD *)(v18 + 49) = 0u;
          swift_willThrow();
          goto LABEL_27;
        }
        Verifier.rangeInBuffer(position:size:)(v19 + v10, 4);
        if (!v13)
        {
LABEL_19:
          if (v3 > 8)
          {
            uint64_t v4 = v20 + 8;
            if (v22 != 1 || ((*(_DWORD *)(v23 + 24) + v4) & 1) == 0)
            {
              Verifier.rangeInBuffer(position:size:)(v20 + 8, 2);
              if (!v14)
              {
                if (*(_WORD *)(*(void *)(v23 + 24) + v4)) {
                  Verifier.rangeInBuffer(position:size:)(v19 + *(unsigned __int16 *)(*(void *)(v23 + 24) + v4), 1);
                }
              }
              goto LABEL_27;
            }
            goto LABEL_25;
          }
        }
      }
    }
LABEL_27:
    swift_release();
  }
}

void sub_261709814(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v28);
  if (!v2)
  {
    unint64_t v3 = v30;
    if (v30 >= 5)
    {
      uint64_t v4 = v29 + 4;
      int v5 = v31;
      if (v31 == 1 && ((*(_DWORD *)(v32 + 24) + v4) & 1) != 0) {
        goto LABEL_42;
      }
      Verifier.rangeInBuffer(position:size:)(v29 + 4, 2);
      if (v6) {
        goto LABEL_44;
      }
      uint64_t v7 = *(void *)(v32 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v28 + v8;
        if ((((_BYTE)v7 + (_BYTE)v28 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v28 + v8, 4);
        if (v11) {
          goto LABEL_44;
        }
      }
      if (v3 < 7) {
        goto LABEL_41;
      }
      uint64_t v4 = v29 + 6;
      int v12 = v31;
      if (v31 == 1 && ((*(_DWORD *)(v32 + 24) + v4) & 1) != 0) {
        goto LABEL_42;
      }
      Verifier.rangeInBuffer(position:size:)(v29 + 6, 2);
      if (v13) {
        goto LABEL_44;
      }
      uint64_t v14 = *(void *)(v32 + 24);
      uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
      if (*(_WORD *)(v14 + v4))
      {
        uint64_t v4 = v28 + v15;
        if ((((_BYTE)v14 + (_BYTE)v28 + (_BYTE)v15) & 3) != 0) {
          int v16 = v12;
        }
        else {
          int v16 = 0;
        }
        if (v16 == 1)
        {
LABEL_11:
          uint64_t v33 = MEMORY[0x263F8E8F8];
          uint64_t v10 = &qword_26A92AB80;
LABEL_43:
          __swift_instantiateConcreteTypeFromMangledName(v10);
          uint64_t v24 = sub_26173BC20();
          uint64_t v26 = v25;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v27 = v4;
          *(void *)(v27 + 8) = v24;
          *(void *)(v27 + 16) = v26;
          *(_OWORD *)(v27 + 24) = 0u;
          *(_OWORD *)(v27 + 40) = 0u;
          *(_OWORD *)(v27 + 49) = 0u;
          swift_willThrow();
          goto LABEL_44;
        }
        Verifier.rangeInBuffer(position:size:)(v28 + v15, 4);
        if (v17)
        {
LABEL_44:
          swift_release();
          return;
        }
      }
      if (v3 >= 9)
      {
        uint64_t v4 = v29 + 8;
        if (v31 == 1 && ((*(_DWORD *)(v32 + 24) + v4) & 1) != 0) {
          goto LABEL_42;
        }
        Verifier.rangeInBuffer(position:size:)(v29 + 8, 2);
        if (v18) {
          goto LABEL_44;
        }
        if (*(_WORD *)(*(void *)(v32 + 24) + v4))
        {
          Verifier.rangeInBuffer(position:size:)(v28 + *(unsigned __int16 *)(*(void *)(v32 + 24) + v4), 1);
          if (v19) {
            goto LABEL_44;
          }
        }
        if (v3 >= 0xB)
        {
          uint64_t v4 = v29 + 10;
          if (v31 == 1 && ((*(_DWORD *)(v32 + 24) + v4) & 1) != 0) {
            goto LABEL_42;
          }
          Verifier.rangeInBuffer(position:size:)(v29 + 10, 2);
          if (v20) {
            goto LABEL_44;
          }
          if (*(_WORD *)(*(void *)(v32 + 24) + v4))
          {
            Verifier.rangeInBuffer(position:size:)(v28 + *(unsigned __int16 *)(*(void *)(v32 + 24) + v4), 1);
            if (v21) {
              goto LABEL_44;
            }
          }
          if (v3 >= 0xD)
          {
            uint64_t v4 = v29 + 12;
            if (v31 != 1 || ((*(_DWORD *)(v32 + 24) + v4) & 1) == 0)
            {
              Verifier.rangeInBuffer(position:size:)(v29 + 12, 2);
              if (v22) {
                goto LABEL_44;
              }
              if (*(_WORD *)(*(void *)(v32 + 24) + v4))
              {
                Verifier.rangeInBuffer(position:size:)(v28 + *(unsigned __int16 *)(*(void *)(v32 + 24) + v4), 1);
                if (v23) {
                  goto LABEL_44;
                }
              }
              goto LABEL_41;
            }
LABEL_42:
            uint64_t v33 = MEMORY[0x263F8E888];
            uint64_t v10 = &qword_26A92AB70;
            goto LABEL_43;
          }
        }
      }
    }
LABEL_41:
    sub_261706814();
    goto LABEL_44;
  }
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_172()
{
  return sub_26173BC20();
}

unint64_t OUTLINED_FUNCTION_109()
{
  return sub_2617295E0();
}

void static WK2_Weather.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v33, v34);
  if (!v8)
  {
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_237();
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_241();
    OUTLINED_FUNCTION_237();
    OUTLINED_FUNCTION_238();
    sub_26170A1D4(v9, v10, v11, v12, 0x7372756F68, 0xE500000000000000, v13, v14);
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_238();
    sub_26170A1D4(v15, v16, v17, v18, 0x6E656D6563616C70, 0xEA00000000007374, v19, v20);
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_238();
    sub_26170A1D4(v21, v22, v23, v24, 0x73697261706D6F63, 0xEB00000000736E6FLL, v25, v26);
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_147();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_238();
    sub_26170A1D4(v27, v28, v29, v30, 0x7473616365726F66, 0xE900000000000073, v31, v32);
    swift_release();
  }
}

Swift::Int OUTLINED_FUNCTION_146()
{
  uint64_t v4 = v1 + *(unsigned int *)(*(void *)(v2 + 24) + v1);
  if (v4 < 0) {
    uint64_t v4 = -v4;
  }
  if ((unint64_t)v4 >= 0x7FFFFFFFFFFFFFFFLL) {
    Swift::Int v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    Swift::Int v5 = v4;
  }
  return sub_261706B18(v0, v5);
}

void sub_26170A074()
{
  OUTLINED_FUNCTION_173();
  OUTLINED_FUNCTION_120();
  if (v8 ^ v9 | v7) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_163();
  if (v7)
  {
    OUTLINED_FUNCTION_225();
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      OUTLINED_FUNCTION_172();
      OUTLINED_FUNCTION_109();
      uint64_t v15 = OUTLINED_FUNCTION_44();
      *uint64_t v16 = v4;
      goto LABEL_12;
    }
  }
  Swift::Int v0 = v6 + 24;
  OUTLINED_FUNCTION_29(v4);
  if (!v1)
  {
    OUTLINED_FUNCTION_224();
    if (v11)
    {
      OUTLINED_FUNCTION_161();
      if (v12 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
        OUTLINED_FUNCTION_172();
        OUTLINED_FUNCTION_109();
        uint64_t v13 = OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_255(v13, v14);
LABEL_12:
        v16[1] = v0;
        v16[2] = v2;
        OUTLINED_FUNCTION_79(v15, (uint64_t)v16);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_50(v3);
      uint64_t v19 = OUTLINED_FUNCTION_144();
      v20(v19);
      goto LABEL_14;
    }
LABEL_9:
    if (v5)
    {
      sub_2617295E0();
      uint64_t v17 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_96(v17, v18);
LABEL_13:
      swift_willThrow();
    }
  }
LABEL_14:
  OUTLINED_FUNCTION_170();
}

void sub_26170A1D4(unsigned __int16 a1, uint64_t a2, uint64_t a3, Swift::Int a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = a1;
  if (*(void *)(v8 + 16) > (uint64_t)a1)
  {
    uint64_t v14 = (void *)v8;
    Swift::Int v15 = *(void *)(v8 + 8) + a1;
    int v16 = *(unsigned __int8 *)(v8 + 24);
    if (v16 == 1 && ((*(_DWORD *)(*(void *)(v8 + 64) + 24) + v15) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      sub_26173BC20();
      OUTLINED_FUNCTION_109();
      uint64_t v21 = OUTLINED_FUNCTION_44();
      *uint64_t v22 = v15;
LABEL_14:
      v22[1] = v8;
      v22[2] = a4;
      OUTLINED_FUNCTION_79(v21, (uint64_t)v22);
      goto LABEL_15;
    }
    v8 += 24;
    OUTLINED_FUNCTION_29(v15);
    if (v9) {
      return;
    }
    uint64_t v17 = *(void *)(v14[8] + 24);
    if (*(_WORD *)(v17 + v15))
    {
      uint64_t v18 = *(unsigned __int16 *)(v17 + v15);
      Swift::Int v19 = *v14 + v18;
      if ((((_BYTE)v17 + (_BYTE)v19) & 3) != 0) {
        int v20 = v16;
      }
      else {
        int v20 = 0;
      }
      if (v20 != 1)
      {
        OUTLINED_FUNCTION_50(*v14 + v18);
        int v25 = OUTLINED_FUNCTION_187();
        sub_2617181F4(v25, v26, a5, a6, a7, a8, v27, v28);
        return;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
      sub_26173BC20();
      OUTLINED_FUNCTION_109();
      uint64_t v21 = OUTLINED_FUNCTION_44();
      *uint64_t v22 = v19;
      goto LABEL_14;
    }
  }
  if ((a4 & 1) == 0) {
    return;
  }
  sub_2617295E0();
  uint64_t v23 = OUTLINED_FUNCTION_44();
  *Swift::Int v24 = v13;
  v24[1] = a2;
  v24[2] = a3;
  OUTLINED_FUNCTION_139(v23, (uint64_t)v24);
  swift_bridgeObjectRetain();
LABEL_15:
  swift_willThrow();
}

void OUTLINED_FUNCTION_180()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_171(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(void *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 64) = 3;
  return swift_bridgeObjectRetain();
}

void sub_26170A434(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v23);
  if (!v2)
  {
    sub_26170C1D8();
    uint64_t v3 = 0;
    unint64_t v4 = v25;
    if (v25 > 6)
    {
      uint64_t v5 = v24 + 6;
      if (v26 == 1 && ((*(_DWORD *)(v27 + 24) + v5) & 1) != 0) {
        goto LABEL_38;
      }
      Verifier.rangeInBuffer(position:size:)(v24 + 6, 2);
      uint64_t v3 = v6;
      if (v6) {
        goto LABEL_3;
      }
      if (*(_WORD *)(*(void *)(v27 + 24) + v5))
      {
        Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v5), 1);
        uint64_t v3 = v7;
        if (v7) {
          goto LABEL_3;
        }
      }
      if (v4 >= 9)
      {
        uint64_t v5 = v24 + 8;
        int v8 = v26;
        if (v26 == 1 && ((*(_DWORD *)(v27 + 24) + v5) & 1) != 0) {
          goto LABEL_38;
        }
        Verifier.rangeInBuffer(position:size:)(v24 + 8, 2);
        uint64_t v3 = v9;
        if (v9) {
          goto LABEL_3;
        }
        uint64_t v10 = *(void *)(v27 + 24);
        uint64_t v11 = *(unsigned __int16 *)(v10 + v5);
        if (*(_WORD *)(v10 + v5))
        {
          uint64_t v5 = v23 + v11;
          if ((v8 & (v10 + v23 + v11)) == 1) {
            goto LABEL_38;
          }
          Verifier.rangeInBuffer(position:size:)(v23 + v11, 2);
          uint64_t v3 = v12;
          if (v12)
          {
LABEL_3:
            swift_release();
            return;
          }
        }
        if (v4 >= 0xB)
        {
          uint64_t v5 = v24 + 10;
          if (v26 == 1 && ((*(_DWORD *)(v27 + 24) + v5) & 1) != 0) {
            goto LABEL_38;
          }
          Verifier.rangeInBuffer(position:size:)(v24 + 10, 2);
          uint64_t v3 = v13;
          if (v13) {
            goto LABEL_3;
          }
          if (*(_WORD *)(*(void *)(v27 + 24) + v5))
          {
            Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v5), 1);
            uint64_t v3 = v14;
            if (v14) {
              goto LABEL_3;
            }
          }
        }
      }
    }
    sub_261706814();
    if (!v3)
    {
      if ((uint64_t)v4 <= 14) {
        goto LABEL_37;
      }
      uint64_t v5 = v24 + 14;
      if (v26 == 1 && ((*(_DWORD *)(v27 + 24) + v5) & 1) != 0) {
        goto LABEL_38;
      }
      Verifier.rangeInBuffer(position:size:)(v24 + 14, 2);
      if (v15) {
        goto LABEL_3;
      }
      if (*(_WORD *)(*(void *)(v27 + 24) + v5))
      {
        Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v5), 1);
        if (v16) {
          goto LABEL_3;
        }
      }
      if (v4 < 0x11)
      {
LABEL_37:
        sub_26170C1D8();
        goto LABEL_3;
      }
      uint64_t v5 = v24 + 16;
      if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v5) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v24 + 16, 2);
        if (v17) {
          goto LABEL_3;
        }
        if (*(_WORD *)(*(void *)(v27 + 24) + v5))
        {
          Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v5), 1);
          if (v18) {
            goto LABEL_3;
          }
        }
        goto LABEL_37;
      }
LABEL_38:
      uint64_t v28 = MEMORY[0x263F8E888];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v19 = sub_26173BC20();
      uint64_t v21 = v20;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v22 = v5;
      *(void *)(v22 + 8) = v19;
      *(void *)(v22 + 16) = v21;
      *(_OWORD *)(v22 + 24) = 0u;
      *(_OWORD *)(v22 + 40) = 0u;
      *(_OWORD *)(v22 + 49) = 0u;
      swift_willThrow();
      goto LABEL_3;
    }
    goto LABEL_3;
  }
}

void sub_26170A820(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v22);
  if (!v2)
  {
    sub_26170C1D8();
    sub_261706814();
    sub_261706814();
    unint64_t v3 = v24;
    if (v24 > 10)
    {
      uint64_t v4 = v23 + 10;
      int v5 = v25;
      if (v25 == 1 && ((*(_DWORD *)(v26 + 24) + v4) & 1) != 0) {
        goto LABEL_24;
      }
      Verifier.rangeInBuffer(position:size:)(v23 + 10, 2);
      if (v6) {
        goto LABEL_26;
      }
      uint64_t v7 = *(void *)(v26 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v22 + v8;
        if ((((_BYTE)v7 + (_BYTE)v22 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v22 + v8, 4);
        if (v11) {
          goto LABEL_26;
        }
      }
      if (v3 >= 0xD)
      {
        uint64_t v4 = v23 + 12;
        int v12 = v25;
        if (v25 != 1 || ((*(_DWORD *)(v26 + 24) + v4) & 1) == 0)
        {
          Verifier.rangeInBuffer(position:size:)(v23 + 12, 2);
          if (!v13)
          {
            uint64_t v14 = *(void *)(v26 + 24);
            uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
            if (!*(_WORD *)(v14 + v4)) {
              goto LABEL_23;
            }
            uint64_t v4 = v22 + v15;
            if ((((_BYTE)v14 + (_BYTE)v22 + (_BYTE)v15) & 3) != 0) {
              int v16 = v12;
            }
            else {
              int v16 = 0;
            }
            if (v16 == 1)
            {
LABEL_11:
              uint64_t v27 = MEMORY[0x263F8E8F8];
              uint64_t v10 = &qword_26A92AB80;
LABEL_25:
              __swift_instantiateConcreteTypeFromMangledName(v10);
              uint64_t v18 = sub_26173BC20();
              uint64_t v20 = v19;
              sub_2617295E0();
              swift_allocError();
              *(void *)uint64_t v21 = v4;
              *(void *)(v21 + 8) = v18;
              *(void *)(v21 + 16) = v20;
              *(_OWORD *)(v21 + 24) = 0u;
              *(_OWORD *)(v21 + 40) = 0u;
              *(_OWORD *)(v21 + 49) = 0u;
              swift_willThrow();
              goto LABEL_26;
            }
            Verifier.rangeInBuffer(position:size:)(v22 + v15, 4);
            if (!v17) {
              goto LABEL_23;
            }
          }
LABEL_26:
          swift_release();
          return;
        }
LABEL_24:
        uint64_t v27 = MEMORY[0x263F8E888];
        uint64_t v10 = &qword_26A92AB70;
        goto LABEL_25;
      }
    }
LABEL_23:
    sub_261706814();
    goto LABEL_26;
  }
}

void sub_26170AB2C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v35);
  if (v2) {
    return;
  }
  sub_26170C1D8();
  if (v37 <= 6) {
    goto LABEL_12;
  }
  uint64_t v3 = v36 + 6;
  int v4 = v38[0];
  if (v38[0] == 1 && ((*(_DWORD *)(v41 + 24) + v3) & 1) != 0)
  {
    uint64_t v43 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_14;
  }
  Verifier.rangeInBuffer(position:size:)(v36 + 6, 2);
  if (v5) {
    goto LABEL_17;
  }
  uint64_t v6 = v41;
  uint64_t v7 = *(void *)(v41 + 24);
  uint64_t v8 = *(unsigned __int16 *)(v7 + v3);
  if (!*(_WORD *)(v7 + v3))
  {
LABEL_12:
    sub_2617295E0();
    swift_allocError();
    *(_OWORD *)uint64_t v11 = xmmword_26173C140;
    *(void *)(v11 + 16) = 0xE400000000000000;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *(void *)(v11 + 56) = 0;
    *(unsigned char *)(v11 + 64) = 3;
    goto LABEL_16;
  }
  uint64_t v3 = v35 + v8;
  if ((((_BYTE)v7 + (_BYTE)v35 + (_BYTE)v8) & 3) != 0) {
    int v9 = v4;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    uint64_t v43 = MEMORY[0x263F8E8F8];
    uint64_t v10 = &qword_26A92AB80;
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(v10);
    uint64_t v12 = sub_26173BC20();
    uint64_t v14 = v13;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v15 = v3;
    *(void *)(v15 + 8) = v12;
    *(void *)(v15 + 16) = v14;
    goto LABEL_15;
  }
  Verifier.rangeInBuffer(position:size:)(v35 + v8, 4);
  if (v16) {
    goto LABEL_17;
  }
  uint64_t v17 = v3 + *(unsigned int *)(*(void *)(v6 + 24) + v3);
  if (v17 < 0) {
    uint64_t v17 = -v17;
  }
  Swift::Int v18 = (unint64_t)v17 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v17;
  Swift::Int v19 = sub_261706B18(v38, v18);
  uint64_t v21 = v19 + v20;
  if (v19 >= v19 + v20) {
    goto LABEL_17;
  }
  while (1)
  {
    unint64_t v22 = v19 + 4;
    if (!__OFADD__(v19, 4)) {
      break;
    }
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v38[0]) {
      goto LABEL_31;
    }
LABEL_32:
    if ((v22 & 0x8000000000000000) != 0) {
      unint64_t v22 = -(uint64_t)v22;
    }
    unint64_t v24 = *(void *)(v41 + 32);
    if ((v24 & 0x8000000000000000) != 0 || v24 < v22)
    {
      uint64_t v27 = v39;
      unint64_t v28 = v22;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v29 = v28;
      *(void *)(v29 + 8) = v27;
      *(_OWORD *)(v29 + 16) = 0u;
      *(_OWORD *)(v29 + 32) = 0u;
      *(_OWORD *)(v29 + 48) = 0u;
      char v30 = 1;
LABEL_46:
      *(unsigned char *)(v29 + 64) = v30;
      goto LABEL_16;
    }
    v40 += 4;
    if (v42 < v40)
    {
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v29 = 6;
      *(_OWORD *)(v29 + 8) = 0u;
      *(_OWORD *)(v29 + 24) = 0u;
      *(_OWORD *)(v29 + 40) = 0u;
      *(void *)(v29 + 56) = 0;
      char v30 = 7;
      goto LABEL_46;
    }
    uint64_t v25 = v19 + *(unsigned int *)(*(void *)(v41 + 24) + v19);
    if (v25 < 0) {
      uint64_t v25 = -v25;
    }
    if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v26 = v25;
    }
    sub_26170B10C((int)v38, v26);
    Swift::Int v19 = v23;
    if (v23 >= v21) {
      goto LABEL_17;
    }
  }
  uint64_t v23 = v19 + 4;
  if (!v38[0]) {
    goto LABEL_32;
  }
LABEL_31:
  if (((*(_DWORD *)(v41 + 24) + (int)v19) & 3) == 0) {
    goto LABEL_32;
  }
  uint64_t v43 = MEMORY[0x263F8E8F8];
  Swift::Int v31 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
  uint64_t v32 = sub_26173BC20();
  uint64_t v34 = v33;
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v15 = v31;
  *(void *)(v15 + 8) = v32;
  *(void *)(v15 + 16) = v34;
LABEL_15:
  *(_OWORD *)(v15 + 24) = 0u;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 49) = 0u;
LABEL_16:
  swift_willThrow();
LABEL_17:
  swift_release();
}

void sub_26170AF00(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v3);
  if (!v2)
  {
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    swift_release();
  }
}

void sub_26170B10C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v33);
  uint64_t v3 = v2;
  if (!v2)
  {
    unint64_t v4 = v35;
    if (v35 >= 5)
    {
      uint64_t v5 = v34 + 4;
      sub_261708114(v34 + 4);
      if (*(_WORD *)(*(void *)(v36 + 24) + v5)) {
        sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v5));
      }
      if (v4 > 6)
      {
        uint64_t v6 = v34 + 6;
        sub_261708114(v34 + 6);
        if (*(_WORD *)(*(void *)(v36 + 24) + v6)) {
          sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v6));
        }
        if (v4 > 8)
        {
          uint64_t v7 = v34 + 8;
          sub_261708114(v34 + 8);
          if (*(_WORD *)(*(void *)(v36 + 24) + v7))
          {
            Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v7), 1);
            uint64_t v3 = v8;
            if (v8) {
              goto LABEL_38;
            }
          }
          if (v4 > 0xA)
          {
            uint64_t v9 = v34 + 10;
            sub_261708114(v34 + 10);
            if (v3) {
              goto LABEL_38;
            }
            if (*(_WORD *)(*(void *)(v36 + 24) + v9))
            {
              Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v9), 1);
              uint64_t v3 = v10;
              if (v10) {
                goto LABEL_38;
              }
            }
            if (v4 > 0xC)
            {
              uint64_t v11 = v34 + 12;
              sub_261708114(v34 + 12);
              if (v3) {
                goto LABEL_38;
              }
              if (*(_WORD *)(*(void *)(v36 + 24) + v11))
              {
                Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v11), 1);
                uint64_t v3 = v12;
                if (v12) {
                  goto LABEL_38;
                }
              }
              if (v4 > 0xE)
              {
                uint64_t v13 = v34 + 14;
                sub_261708114(v34 + 14);
                if (v3) {
                  goto LABEL_38;
                }
                if (*(_WORD *)(*(void *)(v36 + 24) + v13))
                {
                  Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v13), 1);
                  uint64_t v3 = v14;
                  if (v14) {
                    goto LABEL_38;
                  }
                }
                if (v4 > 0x10)
                {
                  uint64_t v15 = v34 + 16;
                  sub_261708114(v34 + 16);
                  if (v3) {
                    goto LABEL_38;
                  }
                  if (*(_WORD *)(*(void *)(v36 + 24) + v15))
                  {
                    Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v15), 1);
                    uint64_t v3 = v16;
                    if (v16) {
                      goto LABEL_38;
                    }
                  }
                  if (v4 > 0x12)
                  {
                    uint64_t v17 = v34 + 18;
                    sub_261708114(v34 + 18);
                    if (v3) {
                      goto LABEL_38;
                    }
                    if (*(_WORD *)(*(void *)(v36 + 24) + v17)) {
                      sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v17));
                    }
                    if (v4 > 0x14)
                    {
                      uint64_t v18 = v34 + 20;
                      sub_261708114(v34 + 20);
                      if (*(_WORD *)(*(void *)(v36 + 24) + v18)) {
                        sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v18));
                      }
                      if (v4 > 0x16)
                      {
                        uint64_t v19 = v34 + 22;
                        sub_261708114(v34 + 22);
                        if (*(_WORD *)(*(void *)(v36 + 24) + v19)) {
                          sub_261708924(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v19));
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    sub_261706814();
    if (!v3)
    {
      if ((uint64_t)v4 >= 27)
      {
        uint64_t v20 = v34 + 26;
        sub_261708114(v34 + 26);
        if (*(_WORD *)(*(void *)(v36 + 24) + v20))
        {
          Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v20), 1);
          uint64_t v3 = v21;
          if (v21) {
            goto LABEL_38;
          }
        }
        if (v4 > 0x1C)
        {
          uint64_t v22 = v34 + 28;
          sub_261708114(v34 + 28);
          if (v3) {
            goto LABEL_38;
          }
          if (*(_WORD *)(*(void *)(v36 + 24) + v22))
          {
            Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v22), 1);
            uint64_t v3 = v23;
            if (v23) {
              goto LABEL_38;
            }
          }
          if (v4 > 0x1E)
          {
            uint64_t v24 = v34 + 30;
            sub_261708114(v34 + 30);
            if (v3) {
              goto LABEL_38;
            }
            if (*(_WORD *)(*(void *)(v36 + 24) + v24)) {
              sub_261708924(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v24));
            }
            if (v4 > 0x20)
            {
              uint64_t v25 = v34 + 32;
              sub_261708114(v34 + 32);
              if (*(_WORD *)(*(void *)(v36 + 24) + v25)) {
                sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v25));
              }
              if (v4 > 0x22)
              {
                uint64_t v26 = v34 + 34;
                sub_261708114(v34 + 34);
                if (*(_WORD *)(*(void *)(v36 + 24) + v26)) {
                  sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v26));
                }
                if (v4 >= 0x25)
                {
                  uint64_t v27 = v34 + 36;
                  sub_261708114(v34 + 36);
                  if (*(_WORD *)(*(void *)(v36 + 24) + v27)) {
                    sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v27));
                  }
                  if (v4 > 0x26)
                  {
                    uint64_t v28 = v34 + 38;
                    sub_261708114(v34 + 38);
                    if (*(_WORD *)(*(void *)(v36 + 24) + v28)) {
                      sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v28));
                    }
                    if (v4 > 0x28)
                    {
                      uint64_t v29 = v34 + 40;
                      sub_261708114(v34 + 40);
                      if (*(_WORD *)(*(void *)(v36 + 24) + v29)) {
                        sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v29));
                      }
                      if (v4 > 0x2A)
                      {
                        uint64_t v30 = v34 + 42;
                        sub_261708114(v34 + 42);
                        if (*(_WORD *)(*(void *)(v36 + 24) + v30)) {
                          sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v30));
                        }
                        if (v4 >= 0x2D)
                        {
                          uint64_t v31 = v34 + 44;
                          sub_261708114(v34 + 44);
                          if (*(_WORD *)(*(void *)(v36 + 24) + v31)) {
                            sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v31));
                          }
                          if (v4 >= 0x2F)
                          {
                            uint64_t v32 = v34 + 46;
                            sub_261708114(v34 + 46);
                            if (*(_WORD *)(*(void *)(v36 + 24) + v32)) {
                              sub_2617088FC(v33 + *(unsigned __int16 *)(*(void *)(v36 + 24) + v32));
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      sub_261708290();
      if (!v3)
      {
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_261708290();
        sub_26170C1D8();
        sub_26170C1D8();
        sub_26170C1D8();
      }
    }
LABEL_38:
    swift_release();
  }
}

void sub_26170BC10(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v44);
  if (!v2)
  {
    sub_26170C1D8();
    uint64_t v3 = 0;
    uint64_t v4 = v46;
    if (v46 >= 7)
    {
      uint64_t v5 = v45 + 6;
      int v6 = v47;
      if (v47 == 1 && ((*(_DWORD *)(v48 + 24) + v5) & 1) != 0) {
        goto LABEL_71;
      }
      Verifier.rangeInBuffer(position:size:)(v45 + 6, 2);
      uint64_t v3 = v7;
      if (v7) {
        goto LABEL_3;
      }
      uint64_t v8 = *(void *)(v48 + 24);
      uint64_t v9 = *(unsigned __int16 *)(v8 + v5);
      if (*(_WORD *)(v8 + v5))
      {
        uint64_t v5 = v44 + v9;
        if ((((_BYTE)v8 + (_BYTE)v44 + (_BYTE)v9) & 3) != 0) {
          int v10 = v6;
        }
        else {
          int v10 = 0;
        }
        if (v10 == 1) {
          goto LABEL_14;
        }
        Verifier.rangeInBuffer(position:size:)(v44 + v9, 4);
        uint64_t v3 = v12;
        if (v12) {
          goto LABEL_3;
        }
      }
    }
    sub_26170C1D8();
    if (v3) {
      goto LABEL_3;
    }
    if (v4 >= 11)
    {
      uint64_t v5 = v45 + 10;
      int v13 = v47;
      if (v47 == 1 && ((*(_DWORD *)(v48 + 24) + v5) & 1) != 0) {
        goto LABEL_71;
      }
      Verifier.rangeInBuffer(position:size:)(v45 + 10, 2);
      uint64_t v3 = v14;
      if (v14) {
        goto LABEL_3;
      }
      uint64_t v15 = *(void *)(v48 + 24);
      uint64_t v16 = *(unsigned __int16 *)(v15 + v5);
      if (*(_WORD *)(v15 + v5))
      {
        uint64_t v5 = v44 + v16;
        if ((((_BYTE)v15 + (_BYTE)v44 + (_BYTE)v16) & 3) != 0) {
          int v17 = v13;
        }
        else {
          int v17 = 0;
        }
        if (v17 == 1) {
          goto LABEL_26;
        }
        Verifier.rangeInBuffer(position:size:)(v44 + v16, 4);
        uint64_t v3 = v18;
        if (v18) {
          goto LABEL_3;
        }
      }
      if ((unint64_t)v4 > 0xC)
      {
        uint64_t v5 = v45 + 12;
        int v19 = v47;
        if (v47 == 1 && ((*(_DWORD *)(v48 + 24) + v5) & 1) != 0) {
          goto LABEL_71;
        }
        Verifier.rangeInBuffer(position:size:)(v45 + 12, 2);
        uint64_t v3 = v20;
        if (v20) {
          goto LABEL_3;
        }
        uint64_t v21 = *(void *)(v48 + 24);
        uint64_t v22 = *(unsigned __int16 *)(v21 + v5);
        if (*(_WORD *)(v21 + v5))
        {
          uint64_t v5 = v44 + v22;
          if ((((_BYTE)v21 + (_BYTE)v44 + (_BYTE)v22) & 3) != 0) {
            int v23 = v19;
          }
          else {
            int v23 = 0;
          }
          if (v23 == 1)
          {
LABEL_26:
            uint64_t v49 = MEMORY[0x263F8D5C8];
            uint64_t v11 = &qword_26A92AB88;
            goto LABEL_72;
          }
          Verifier.rangeInBuffer(position:size:)(v44 + v22, 4);
          uint64_t v3 = v24;
          if (v24) {
            goto LABEL_3;
          }
        }
      }
    }
    sub_26170C1D8();
    if (v3) {
      goto LABEL_3;
    }
    sub_26170C1D8();
    if (v4 < 19) {
      goto LABEL_3;
    }
    uint64_t v5 = v45 + 18;
    int v25 = v47;
    if (v47 == 1 && ((*(_DWORD *)(v48 + 24) + v5) & 1) != 0) {
      goto LABEL_71;
    }
    Verifier.rangeInBuffer(position:size:)(v45 + 18, 2);
    if (v26) {
      goto LABEL_3;
    }
    uint64_t v27 = *(void *)(v48 + 24);
    uint64_t v28 = *(unsigned __int16 *)(v27 + v5);
    if (*(_WORD *)(v27 + v5))
    {
      uint64_t v5 = v44 + v28;
      if ((((_BYTE)v27 + (_BYTE)v44 + (_BYTE)v28) & 3) != 0) {
        int v29 = v25;
      }
      else {
        int v29 = 0;
      }
      if (v29 == 1) {
        goto LABEL_14;
      }
      Verifier.rangeInBuffer(position:size:)(v44 + v28, 4);
      if (v30) {
        goto LABEL_3;
      }
    }
    if ((unint64_t)v4 <= 0x14) {
      goto LABEL_3;
    }
    uint64_t v5 = v45 + 20;
    int v31 = v47;
    if (v47 != 1 || ((*(_DWORD *)(v48 + 24) + v5) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v45 + 20, 2);
      if (v32) {
        goto LABEL_3;
      }
      uint64_t v33 = *(void *)(v48 + 24);
      uint64_t v34 = *(unsigned __int16 *)(v33 + v5);
      if (!*(_WORD *)(v33 + v5)) {
        goto LABEL_59;
      }
      uint64_t v5 = v44 + v34;
      if ((((_BYTE)v33 + (_BYTE)v44 + (_BYTE)v34) & 3) != 0) {
        int v35 = v31;
      }
      else {
        int v35 = 0;
      }
      if (v35 != 1)
      {
        Verifier.rangeInBuffer(position:size:)(v44 + v34, 4);
        if (v36) {
          goto LABEL_3;
        }
LABEL_59:
        if ((unint64_t)v4 > 0x16)
        {
          uint64_t v5 = v45 + 22;
          if (v47 != 1 || ((*(_DWORD *)(v48 + 24) + v5) & 1) == 0)
          {
            Verifier.rangeInBuffer(position:size:)(v45 + 22, 2);
            if (v37) {
              goto LABEL_3;
            }
            if (*(_WORD *)(*(void *)(v48 + 24) + v5))
            {
              Verifier.rangeInBuffer(position:size:)(v44 + *(unsigned __int16 *)(*(void *)(v48 + 24) + v5), 1);
              if (v38) {
                goto LABEL_3;
              }
            }
            if ((unint64_t)v4 <= 0x18) {
              goto LABEL_3;
            }
            uint64_t v5 = v45 + 24;
            if (v47 != 1 || ((*(_DWORD *)(v48 + 24) + v5) & 1) == 0)
            {
              Verifier.rangeInBuffer(position:size:)(v45 + 24, 2);
              if (!v39)
              {
                if (*(_WORD *)(*(void *)(v48 + 24) + v5)) {
                  Verifier.rangeInBuffer(position:size:)(v44 + *(unsigned __int16 *)(*(void *)(v48 + 24) + v5), 1);
                }
              }
              goto LABEL_3;
            }
          }
          goto LABEL_71;
        }
LABEL_3:
        swift_release();
        return;
      }
LABEL_14:
      uint64_t v49 = MEMORY[0x263F8E8F8];
      uint64_t v11 = &qword_26A92AB80;
LABEL_72:
      __swift_instantiateConcreteTypeFromMangledName(v11);
      uint64_t v40 = sub_26173BC20();
      uint64_t v42 = v41;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v43 = v5;
      *(void *)(v43 + 8) = v40;
      *(void *)(v43 + 16) = v42;
      *(_OWORD *)(v43 + 24) = 0u;
      *(_OWORD *)(v43 + 40) = 0u;
      *(_OWORD *)(v43 + 49) = 0u;
      swift_willThrow();
      goto LABEL_3;
    }
LABEL_71:
    uint64_t v49 = MEMORY[0x263F8E888];
    uint64_t v11 = &qword_26A92AB70;
    goto LABEL_72;
  }
}

void sub_26170C1D8()
{
  OUTLINED_FUNCTION_173();
  OUTLINED_FUNCTION_120();
  if (v8 ^ v9 | v7) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_163();
  if (v7)
  {
    OUTLINED_FUNCTION_225();
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      OUTLINED_FUNCTION_172();
      OUTLINED_FUNCTION_109();
      uint64_t v15 = OUTLINED_FUNCTION_44();
      *uint64_t v16 = v4;
      goto LABEL_12;
    }
  }
  Swift::Int v0 = v6 + 24;
  OUTLINED_FUNCTION_29(v4);
  if (!v1)
  {
    OUTLINED_FUNCTION_224();
    if (v11)
    {
      OUTLINED_FUNCTION_161();
      if (v12 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
        OUTLINED_FUNCTION_172();
        OUTLINED_FUNCTION_109();
        uint64_t v13 = OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_255(v13, v14);
LABEL_12:
        v16[1] = v0;
        v16[2] = v2;
        OUTLINED_FUNCTION_79(v15, (uint64_t)v16);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_50(v3);
      uint64_t v19 = OUTLINED_FUNCTION_144();
      v20(v19);
      goto LABEL_14;
    }
LABEL_9:
    if (v5)
    {
      sub_2617295E0();
      uint64_t v17 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_96(v17, v18);
LABEL_13:
      swift_willThrow();
    }
  }
LABEL_14:
  OUTLINED_FUNCTION_170();
}

Swift::Int sub_26170C314(Swift::Int a1, Swift::Int a2)
{
  uint64_t v5 = sub_26173BC10();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - v10;
  Swift::Int result = sub_26170C568(a1, a2);
  if (!v2)
  {
    Swift::Int v14 = result;
    int64_t v15 = v13;
    uint64_t v27 = v6;
    uint64_t v16 = result + v13;
    Swift::Int v17 = *(void *)(a1 + 8);
    if (result + v13 >= v17)
    {
      if (v16 >= 0) {
        uint64_t v25 = result + v13;
      }
      else {
        uint64_t v25 = -v16;
      }
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v23 = v25;
      *(void *)(v23 + 8) = v17;
      *(_OWORD *)(v23 + 16) = 0u;
      *(_OWORD *)(v23 + 32) = 0u;
      *(_OWORD *)(v23 + 48) = 0u;
      char v24 = 1;
      goto LABEL_10;
    }
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      uint64_t v18 = *(void *)(a1 + 40);
      if (*(unsigned char *)(*(void *)(v18 + 24) + v16))
      {
        sub_26173BC00();
        uint64_t v28 = sub_261702AB8((const void *)(*(void *)(v18 + 24) + v14), v15);
        uint64_t v19 = v27;
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v9, v11, v5);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
        sub_261702B48();
        uint64_t v20 = sub_26173BBF0();
        uint64_t v22 = v21;
        swift_release();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v5);
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v23 = a2;
        *(void *)(v23 + 8) = v20;
        *(void *)(v23 + 16) = v22;
        *(_OWORD *)(v23 + 24) = 0u;
        *(_OWORD *)(v23 + 40) = 0u;
        *(void *)(v23 + 56) = 0;
        char v24 = 4;
LABEL_10:
        *(unsigned char *)(v23 + 64) = v24;
        return swift_willThrow();
      }
    }
  }
  return result;
}

Swift::Int sub_26170C568(Swift::Int a1, Swift::Int position)
{
  Swift::Int v3 = position;
  if (*(unsigned char *)a1 == 1 && ((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    OUTLINED_FUNCTION_229();
    OUTLINED_FUNCTION_87();
    uint64_t v5 = OUTLINED_FUNCTION_44();
    *uint64_t v6 = v3;
    v6[1] = a1;
    v6[2] = v2;
    OUTLINED_FUNCTION_36(v5, (uint64_t)v6);
  }
  else
  {
    Verifier.rangeInBuffer(position:size:)(position, 4);
    if (!v7)
    {
      Swift::Int v8 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 24) + v3);
      unint64_t v9 = v3 + 4;
      if (v3 + 4 < 0) {
        unint64_t v9 = -4 - v3;
      }
      if (v9 >= 0x7FFFFFFFFFFFFFFFLL) {
        Swift::Int v3 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        Swift::Int v3 = v9;
      }
      Verifier.rangeInBuffer(position:size:)(v3, v8);
    }
  }
  return v3;
}

void sub_26170C664(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v22);
  if (!v2)
  {
    sub_26170C1D8();
    unint64_t v3 = v24;
    if (v24 > 6)
    {
      uint64_t v4 = v23 + 6;
      int v5 = v25;
      if (v25 == 1 && ((*(_DWORD *)(v26 + 24) + v4) & 1) != 0) {
        goto LABEL_24;
      }
      Verifier.rangeInBuffer(position:size:)(v23 + 6, 2);
      if (v6) {
        goto LABEL_26;
      }
      uint64_t v7 = *(void *)(v26 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v22 + v8;
        if ((((_BYTE)v7 + (_BYTE)v22 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v22 + v8, 4);
        if (v11) {
          goto LABEL_26;
        }
      }
      if (v3 >= 9)
      {
        uint64_t v4 = v23 + 8;
        int v12 = v25;
        if (v25 != 1 || ((*(_DWORD *)(v26 + 24) + v4) & 1) == 0)
        {
          Verifier.rangeInBuffer(position:size:)(v23 + 8, 2);
          if (!v13)
          {
            uint64_t v14 = *(void *)(v26 + 24);
            uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
            if (!*(_WORD *)(v14 + v4)) {
              goto LABEL_23;
            }
            uint64_t v4 = v22 + v15;
            if ((((_BYTE)v14 + (_BYTE)v22 + (_BYTE)v15) & 3) != 0) {
              int v16 = v12;
            }
            else {
              int v16 = 0;
            }
            if (v16 == 1)
            {
LABEL_11:
              uint64_t v27 = MEMORY[0x263F8E8F8];
              uint64_t v10 = &qword_26A92AB80;
LABEL_25:
              __swift_instantiateConcreteTypeFromMangledName(v10);
              uint64_t v18 = sub_26173BC20();
              uint64_t v20 = v19;
              sub_2617295E0();
              swift_allocError();
              *(void *)uint64_t v21 = v4;
              *(void *)(v21 + 8) = v18;
              *(void *)(v21 + 16) = v20;
              *(_OWORD *)(v21 + 24) = 0u;
              *(_OWORD *)(v21 + 40) = 0u;
              *(_OWORD *)(v21 + 49) = 0u;
              swift_willThrow();
              goto LABEL_26;
            }
            Verifier.rangeInBuffer(position:size:)(v22 + v15, 4);
            if (!v17) {
              goto LABEL_23;
            }
          }
LABEL_26:
          swift_release();
          return;
        }
LABEL_24:
        uint64_t v27 = MEMORY[0x263F8E888];
        uint64_t v10 = &qword_26A92AB70;
        goto LABEL_25;
      }
    }
LABEL_23:
    sub_261706814();
    goto LABEL_26;
  }
}

void sub_26170C8E4(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v34);
  if (!v2)
  {
    sub_26170C1D8();
    uint64_t v3 = 0;
    unint64_t v4 = v36;
    if (v36 > 6)
    {
      uint64_t v5 = v35 + 6;
      sub_261708114(v35 + 6);
      if (*(_WORD *)(*(void *)(v37 + 24) + v5)) {
        sub_2617088FC(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v5));
      }
      if (v4 >= 9)
      {
        uint64_t v6 = v35 + 8;
        sub_261708114(v35 + 8);
        if (*(_WORD *)(*(void *)(v37 + 24) + v6))
        {
          Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v6), 1);
          uint64_t v3 = v7;
          if (v7) {
            goto LABEL_3;
          }
        }
        if (v4 >= 0xB)
        {
          uint64_t v8 = v35 + 10;
          sub_261708114(v35 + 10);
          if (v3) {
            goto LABEL_3;
          }
          if (*(_WORD *)(*(void *)(v37 + 24) + v8))
          {
            Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v8), 1);
            uint64_t v3 = v9;
            if (v9) {
              goto LABEL_3;
            }
          }
          if (v4 >= 0xD)
          {
            uint64_t v10 = v35 + 12;
            sub_261708114(v35 + 12);
            if (v3) {
              goto LABEL_3;
            }
            if (*(_WORD *)(*(void *)(v37 + 24) + v10))
            {
              Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v10), 1);
              uint64_t v3 = v11;
              if (v11) {
                goto LABEL_3;
              }
            }
            if (v4 >= 0xF)
            {
              uint64_t v12 = v35 + 14;
              sub_261708114(v35 + 14);
              if (v3) {
                goto LABEL_3;
              }
              if (*(_WORD *)(*(void *)(v37 + 24) + v12))
              {
                Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v12), 1);
                uint64_t v3 = v13;
                if (v13) {
                  goto LABEL_3;
                }
              }
              if (v4 >= 0x11)
              {
                uint64_t v14 = v35 + 16;
                sub_261708114(v35 + 16);
                if (v3) {
                  goto LABEL_3;
                }
                if (*(_WORD *)(*(void *)(v37 + 24) + v14))
                {
                  Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v14), 1);
                  uint64_t v3 = v15;
                  if (v15) {
                    goto LABEL_3;
                  }
                }
                if (v4 >= 0x13)
                {
                  uint64_t v16 = v35 + 18;
                  sub_261708114(v35 + 18);
                  if (v3) {
                    goto LABEL_3;
                  }
                  if (*(_WORD *)(*(void *)(v37 + 24) + v16))
                  {
                    Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v16), 1);
                    uint64_t v3 = v17;
                    if (v17) {
                      goto LABEL_3;
                    }
                  }
                  if (v4 >= 0x15)
                  {
                    uint64_t v18 = v35 + 20;
                    sub_261708114(v35 + 20);
                    if (v3) {
                      goto LABEL_3;
                    }
                    if (*(_WORD *)(*(void *)(v37 + 24) + v18))
                    {
                      Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v18), 1);
                      uint64_t v3 = v19;
                      if (v19) {
                        goto LABEL_3;
                      }
                    }
                    if (v4 >= 0x17)
                    {
                      uint64_t v20 = v35 + 22;
                      sub_261708114(v35 + 22);
                      if (v3) {
                        goto LABEL_3;
                      }
                      if (*(_WORD *)(*(void *)(v37 + 24) + v20)) {
                        sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v20));
                      }
                      if (v4 >= 0x19)
                      {
                        uint64_t v21 = v35 + 24;
                        sub_261708114(v35 + 24);
                        if (*(_WORD *)(*(void *)(v37 + 24) + v21)) {
                          sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v21));
                        }
                        if (v4 >= 0x1B)
                        {
                          uint64_t v22 = v35 + 26;
                          sub_261708114(v35 + 26);
                          if (*(_WORD *)(*(void *)(v37 + 24) + v22)) {
                            sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v22));
                          }
                          if (v4 >= 0x1D)
                          {
                            uint64_t v23 = v35 + 28;
                            sub_261708114(v35 + 28);
                            if (*(_WORD *)(*(void *)(v37 + 24) + v23)) {
                              sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v23));
                            }
                            if (v4 >= 0x1F)
                            {
                              uint64_t v24 = v35 + 30;
                              sub_261708114(v35 + 30);
                              if (*(_WORD *)(*(void *)(v37 + 24) + v24)) {
                                sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v24));
                              }
                              if (v4 >= 0x21)
                              {
                                uint64_t v25 = v35 + 32;
                                sub_261708114(v35 + 32);
                                if (*(_WORD *)(*(void *)(v37 + 24) + v25)) {
                                  sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v25));
                                }
                                if (v4 >= 0x23)
                                {
                                  uint64_t v26 = v35 + 34;
                                  sub_261708114(v35 + 34);
                                  if (*(_WORD *)(*(void *)(v37 + 24) + v26)) {
                                    sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v26));
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    sub_261706814();
    if (!v3)
    {
      sub_261706814();
      sub_261706814();
      sub_261706814();
      sub_261706814();
      sub_261706814();
      uint64_t v27 = 0;
      if ((uint64_t)v4 <= 48) {
        goto LABEL_74;
      }
      uint64_t v28 = v35 + 48;
      sub_261708114(v35 + 48);
      if (*(_WORD *)(*(void *)(v37 + 24) + v28)) {
        sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v28));
      }
      if (v4 < 0x33) {
        goto LABEL_74;
      }
      uint64_t v29 = v35 + 50;
      sub_261708114(v35 + 50);
      if (*(_WORD *)(*(void *)(v37 + 24) + v29)) {
        sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v29));
      }
      if (v4 < 0x35) {
        goto LABEL_74;
      }
      uint64_t v30 = v35 + 52;
      sub_261708114(v35 + 52);
      if (*(_WORD *)(*(void *)(v37 + 24) + v30))
      {
        Verifier.rangeInBuffer(position:size:)(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v30), 1);
        uint64_t v27 = v31;
        if (v31) {
          goto LABEL_3;
        }
      }
      if (v4 < 0x37) {
        goto LABEL_74;
      }
      uint64_t v32 = v35 + 54;
      sub_261708114(v35 + 54);
      if (!v27)
      {
        if (*(_WORD *)(*(void *)(v37 + 24) + v32)) {
          sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v32));
        }
        if (v4 >= 0x39)
        {
          uint64_t v33 = v35 + 56;
          sub_261708114(v35 + 56);
          if (*(_WORD *)(*(void *)(v37 + 24) + v33)) {
            sub_261708924(v34 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v33));
          }
        }
LABEL_74:
        sub_261708290();
        if (!v27)
        {
          sub_261708290();
          sub_261708290();
          sub_261708290();
          sub_261708290();
          sub_261708290();
          sub_261708290();
          sub_261708290();
          sub_261715A08(0x4Au, 0x7865646E497675, 0xE700000000000000, 0);
          sub_261708290();
          sub_261708700(0x4Eu, 0x65726944646E6977, 0xED00006E6F697463, 0);
          sub_261708290();
          sub_261708290();
        }
      }
    }
LABEL_3:
    swift_release();
  }
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

void WK2_Pollutant.pollutantType.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 5u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 4);
  int v6 = v4 + 4;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    OUTLINED_FUNCTION_143(*(unsigned char *)(v2 + v8));
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void sub_26170D558()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 68;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x44) {
      LOWORD(v16) = 68;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_26170D658()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 56;
    }
    OUTLINED_FUNCTION_200(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_26170D750()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 66;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x42) {
      LOWORD(v16) = 66;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void _s11WeatherData07WK2_DayA10ConditionsV12windSpeedMaxSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x41u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 64);
  int v4 = v2 + 64;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData07WK2_DayA10ConditionsV12windSpeedAvgSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x3Fu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 62);
  int v4 = v2 + 62;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData07WK2_DayA10ConditionsV16windGustSpeedMaxSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x3Du) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 60);
  int v4 = v2 + 60;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData07WK2_DayA10ConditionsV13visibilityMinSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x45u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 68);
  int v4 = v2 + 68;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData07WK2_DayA10ConditionsV14temperatureMinSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x39u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 56);
  int v4 = v2 + 56;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData07WK2_DayA10ConditionsV13visibilityMaxSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x43u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 66);
  int v4 = v2 + 66;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void type metadata accessor for WK2_DayWeatherConditions()
{
}

void WK2_DayWeatherConditions.solarNoon.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x23u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 34);
  int v4 = v2 + 34;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.moonrise.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x13u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 18);
  int v4 = v2 + 18;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.sunrise.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x25u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 36);
  int v4 = v2 + 36;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.moonset.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x15u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 20);
  int v4 = v2 + 20;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.sunset.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Du) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 44);
  int v4 = v2 + 44;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void static WK2_DayWeatherConditions.add(solarNoon:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_213(v12);
    }
    OUTLINED_FUNCTION_150(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(moonPhase:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170384C();
}

void static WK2_DayWeatherConditions.add(precipitationChance:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700AE8();
}

void static WK2_DayWeatherConditions.add(precipitationAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700958();
}

void static WK2_DayWeatherConditions.add(overnightForecast:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 72;
    }
    OUTLINED_FUNCTION_201(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(windGustSpeedMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EEA0();
}

void static WK2_DayWeatherConditions.add(daytimeForecast:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 70;
    }
    OUTLINED_FUNCTION_204(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(temperatureMin:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170D658();
}

void static WK2_DayWeatherConditions.add(temperatureMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700BDC();
}

void static WK2_DayWeatherConditions.add(snowfallAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EBB0();
}

void static WK2_DayWeatherConditions.add(visibilityMin:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170D558();
}

void static WK2_DayWeatherConditions.add(visibilityMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170D750();
}

void static WK2_DayWeatherConditions.add(solarMidnight:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_214(v12);
    }
    OUTLINED_FUNCTION_149(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(forecastStart:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_DayWeatherConditions.add(windSpeedMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170ECA8();
}

void static WK2_DayWeatherConditions.add(windSpeedAvg:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EDA8();
}

void static WK2_DayWeatherConditions.add(maxUvIndex:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170393C();
}

void WK2_DayWeatherConditions.precipitationAmountByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x19u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 24);
  int v4 = v2 + 24;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void _s11WeatherData07WK2_DayA10ConditionsV19sunriseAstronomicals6UInt32VSgvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Bu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 42);
  int v4 = v2 + 42;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.temperatureMinTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x3Bu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 58);
  int v4 = v2 + 58;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.temperatureMaxTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x37u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 54);
  int v4 = v2 + 54;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.sunsetAstronomical.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x33u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 50);
  int v4 = v2 + 50;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

uint64_t WK2_DayWeatherConditions.overnightForecast.getter()
{
  uint64_t result = OUTLINED_FUNCTION_226();
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v3 + v5) < 0x49u)
  {
    int v8 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v8, v4);
    int v9 = v8 + v4;
    if (!v6)
    {
      if (!__OFADD__(v9, *(_DWORD *)(v3 + v9))) {
        return OUTLINED_FUNCTION_94(result, v2, *(__n128 *)(v0 + 8));
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v5, 72);
  int v7 = v5 + 72;
  if (!v6)
  {
    int v8 = *(__int16 *)(v3 + v7);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

void WK2_DayWeatherConditions.sunriseNautical.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x29u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 40);
  int v4 = v2 + 40;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

uint64_t WK2_DayWeatherConditions.daytimeForecast.getter()
{
  uint64_t result = OUTLINED_FUNCTION_226();
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v3 + v5) < 0x47u)
  {
    int v8 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v8, v4);
    int v9 = v8 + v4;
    if (!v6)
    {
      if (!__OFADD__(v9, *(_DWORD *)(v3 + v9))) {
        return OUTLINED_FUNCTION_94(result, v2, *(__n128 *)(v0 + 8));
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v5, 70);
  int v7 = v5 + 70;
  if (!v6)
  {
    int v8 = *(__int16 *)(v3 + v7);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

void WK2_DayWeatherConditions.sunsetNautical.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x31u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 48);
  int v4 = v2 + 48;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.solarMidnight.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x21u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 32);
  int v4 = v2 + 32;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.conditionCode.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 9u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 8);
  int v6 = v4 + 8;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_ConditionCode.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_217();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void WK2_DayWeatherConditions.sunriseCivil.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x27u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 38);
  int v4 = v2 + 38;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_DayWeatherConditions.sunsetCivil.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Fu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 46);
  int v4 = v2 + 46;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void static WK2_DayWeatherConditions.addVectorOf(precipitationAmountByType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EA90();
}

void WK2_DayWeatherConditions.restOfDayForecast.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x4B)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 74);
  int v5 = v3 + 74;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void static WK2_DayWeatherConditions.startDayWeatherConditions(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 288);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void sub_26170EA90()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 24;
    }
    OUTLINED_FUNCTION_153(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_26170EBB0()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 30;
    }
    OUTLINED_FUNCTION_155(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_26170ECA8()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 64;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x40) {
      LOWORD(v16) = 64;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_26170EDA8()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 62;
    }
    OUTLINED_FUNCTION_198(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_26170EEA0()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 60;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x3C) {
      LOWORD(v16) = 60;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t _s11WeatherData14WK2_AirQualityV8metadataAA0C9_MetadataVSgvg_0()
{
  uint64_t result = OUTLINED_FUNCTION_226();
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v3 + v5) < 5u)
  {
    int v8 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v8, v4);
    int v9 = v8 + v4;
    if (!v6)
    {
      if (!__OFADD__(v9, *(_DWORD *)(v3 + v9))) {
        return OUTLINED_FUNCTION_94(result, v2, *(__n128 *)(v0 + 8));
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v5, 4);
  int v7 = v5 + 4;
  if (!v6)
  {
    int v8 = *(__int16 *)(v3 + v7);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_26170EFFC()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

ValueMetadata *type metadata accessor for WK2_Metadata()
{
  return &type metadata for WK2_Metadata;
}

void WK2_Metadata.longitude.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xDu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_Metadata.readTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x13u)
  {
LABEL_7:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 18);
  int v4 = v2 + 18;
  if (v3)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_7;
  }
  if (__OFADD__(v5, v1)) {
LABEL_10:
  }
    __break(1u);
}

void WK2_Metadata.latitude.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xBu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_Metadata.language.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 9u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 8);
  int v4 = v2 + 8;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void static WK2_Metadata.add(longitude:_:)(uint64_t a1, float a2)
{
  if (a2 == 0.0)
  {
    OUTLINED_FUNCTION_17();
    if (!v5) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(a1 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v9))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(a1 + 24));
  }
  *(void *)(a1 + 16) = v3;
  OUTLINED_FUNCTION_12();
  if (v7 != v8)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v3, *(void *)(a1 + 24));
    uint64_t v12 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_5(v12);
  if (!v5 & v13) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = *(void *)(v14 + 32);
    if (v16)
    {
      uint64_t v17 = v16 + *(void *)(v14 + 80);
      *(_DWORD *)uint64_t v17 = v3 + 4;
      *(_WORD *)(v17 + 4) = 12;
    }
    OUTLINED_FUNCTION_111(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (v19 <= 0xC) {
      LOWORD(v19) = 12;
    }
    *(_WORD *)(v18 + 64) = v19;
  }
}

void static WK2_Metadata.add(readTime:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  if (!v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v4 ^ v5 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = v1[2];
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = v1[1];
  OUTLINED_FUNCTION_12();
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v1[3]);
  }
  OUTLINED_FUNCTION_25();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v7 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v3 & v11) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 18;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x12) {
      LOWORD(v16) = 18;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_Metadata.add(latitude:_:)(uint64_t a1, float a2)
{
  if (a2 == 0.0)
  {
    OUTLINED_FUNCTION_17();
    if (!v5) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(a1 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v9))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(a1 + 24));
  }
  *(void *)(a1 + 16) = v3;
  OUTLINED_FUNCTION_12();
  if (v7 != v8)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v3, *(void *)(a1 + 24));
    uint64_t v12 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_5(v12);
  if (!v5 & v13) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = *(void *)(v14 + 32);
    if (v16)
    {
      uint64_t v17 = v16 + *(void *)(v14 + 80);
      *(_DWORD *)uint64_t v17 = v3 + 4;
      *(_WORD *)(v17 + 4) = 10;
    }
    OUTLINED_FUNCTION_111(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (v19 <= 0xA) {
      LOWORD(v19) = 10;
    }
    *(_WORD *)(v18 + 64) = v19;
  }
}

void static WK2_Metadata.add(temporarilyUnavailable:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  char v3 = v2;
  if ((v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_21:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v1[8] <= 0)
  {
    v1[8] = 1;
    v1[3] = 1;
  }
  unint64_t v5 = v1[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v5))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = v1[1];
  OUTLINED_FUNCTION_12();
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(0, v5, v1[3]);
  }
  v1[2] = v5;
  OUTLINED_FUNCTION_12();
  if (v7 ^ v8 | v4)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v5, v1[3]);
    uint64_t v9 = *(void *)(v6 + 32);
  }
  *(unsigned char *)(*(void *)(v6 + 24) + v9 + ~v5) = v3 & 1;
  v1[2] = v5 + 1;
  if (v5 > 0xFFFFFFFE) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32))
    {
      OUTLINED_FUNCTION_81(v10);
      *(_WORD *)(v12 + 4) = 22;
    }
    OUTLINED_FUNCTION_111(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (v14 <= 0x16) {
      LOWORD(v14) = 22;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_21;
  }
  __break(1u);
}

void static WK2_Metadata.add(providerName:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v2) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v4 != v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v6))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v9) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    if (!v10)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v11 = OUTLINED_FUNCTION_2();
  if (v4 != v5) {
    OUTLINED_FUNCTION_84(v11);
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_16();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v12);
  if (!v10 & v13) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32))
    {
      OUTLINED_FUNCTION_48(v14);
      *(_WORD *)(v16 + 4) = 16;
    }
    OUTLINED_FUNCTION_111(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (v18 <= 0x10) {
      LOWORD(v18) = 16;
    }
    *(_WORD *)(v17 + 64) = v18;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Metadata.add(expireTime:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  if (!v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v4 ^ v5 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = v1[2];
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = v1[1];
  OUTLINED_FUNCTION_12();
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v1[3]);
  }
  OUTLINED_FUNCTION_25();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v7 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v3 & v11) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 6;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 6) {
      LOWORD(v16) = 6;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_22;
  }
  __break(1u);
}

void WK2_Metadata.temporarilyUnavailable.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x17u)
  {
LABEL_7:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 22);
  int v4 = v2 + 22;
  if (v3)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_7;
  }
  if (__OFADD__(v5, v1)) {
LABEL_10:
  }
    __break(1u);
}

void WK2_Metadata.attributionUrl.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 5u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 4);
  int v4 = v2 + 4;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void WK2_Metadata.reportedTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x15u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 20);
  int v4 = v2 + 20;
  if (v3) {
    goto LABEL_9;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_10;
  }
}

void WK2_Metadata.providerLogo.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xFu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 14);
  int v4 = v2 + 14;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void WK2_Metadata.expireTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 7u)
  {
LABEL_7:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (v3)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_7;
  }
  if (__OFADD__(v5, v1)) {
LABEL_10:
  }
    __break(1u);
}

unint64_t static WK2_Metadata.startMetadata(_:)(unint64_t result)
{
  unint64_t v1 = result;
  *(unsigned char *)(result + 40) = 1;
  uint64_t v2 = *(void *)result;
  if (*(void *)(*(void *)result + 56) < *(void *)(*(void *)result + 80) + 88)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v3 = *(void *)(v2 + 32);
    if (v3) {
      MEMORY[0x263E3EDF0](v3, -1, -1);
    }
    uint64_t v4 = swift_slowAlloc();
    *(void *)(v2 + 32) = v4;
    *(void *)(v2 + 40) = v4 + 88;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 88;
  }
  uint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t static WK2_Metadata.endMetadata(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

unsigned char *sub_26170FBB8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t getCheckedRoot<A>(byteBuffer:fileId:options:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v45 = a7;
  uint64_t v42 = a6;
  uint64_t v43 = a8;
  uint64_t v44 = a2;
  uint64_t v12 = sub_26173BC10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unsigned int v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unsigned int v18 = (char *)&v41 - v17;
  uint64_t v19 = *a1;
  uint64_t v20 = *(void *)(*a1 + 32);
  if (v20 > 3221225471)
  {
    sub_2617295E0();
    swift_allocError();
    return OUTLINED_FUNCTION_0_6(v30, 2);
  }
  uint64_t v21 = *a4;
  int v22 = *((_DWORD *)a4 + 2);
  char v23 = *((unsigned char *)a4 + 12);
  v47[0] = 1;
  uint64_t v48 = v20;
  int v49 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = v19;
  long long v53 = *(_OWORD *)(a1 + 1);
  uint64_t v54 = v21;
  int v55 = v22;
  char v56 = v23;
  if (!a3)
  {
    swift_retain();
    goto LABEL_13;
  }
  swift_retain();
  sub_26173BC00();
  v57 = sub_261702AB8((const void *)(*(void *)(v19 + 24) + 4), 4);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
  sub_261702B48();
  uint64_t v24 = sub_26173BBF0();
  uint64_t v26 = v25;
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  if (v26)
  {
    if (v24 == v44 && v26 == a3)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v28 = sub_26173BE80();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0) {
        goto LABEL_9;
      }
    }
LABEL_13:
    uint64_t v32 = v46;
    static ForwardOffset.verify<A>(_:at:of:)((uint64_t)v47, 0, a5, a5, a5, v45);
    if (v32) {
      return swift_release();
    }
    uint64_t result = *a1;
    uint64_t v33 = a1[1];
    uint64_t v34 = *(void *)(*a1 + 32) - v33;
    int v35 = *(_DWORD *)(*(void *)(*a1 + 24) + v34);
    if (v35 < 0)
    {
      __break(1u);
    }
    else if (v34 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (v34 <= 0x7FFFFFFF)
      {
        uint64_t v36 = (v35 + v34);
        if (!__OFADD__(v35, v34))
        {
          uint64_t v37 = a1[2];
          uint64_t v38 = *(void *)(v42 + 8);
          uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 8);
          uint64_t v40 = swift_retain();
          v39(v40, v33, v37, v36, a5, v38);
          return swift_release();
        }
LABEL_24:
        __break(1u);
        return result;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
LABEL_9:
  sub_2617295E0();
  swift_allocError();
  *(_OWORD *)uint64_t v29 = 0u;
  *(_OWORD *)(v29 + 16) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_OWORD *)(v29 + 48) = 0u;
  *(unsigned char *)(v29 + 64) = 7;
  swift_willThrow();
  return swift_release();
}

void static ForwardOffset.verify<A>(_:at:of:)(uint64_t a1, Swift::Int position, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (*(unsigned char *)a1 == 1 && ((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v10 = sub_26173BC20();
    uint64_t v12 = v11;
    sub_2617295E0();
    uint64_t v13 = OUTLINED_FUNCTION_44();
    *uint64_t v14 = position;
    v14[1] = v10;
    v14[2] = v12;
    OUTLINED_FUNCTION_36(v13, (uint64_t)v14);
  }
  else
  {
    Verifier.rangeInBuffer(position:size:)(position, 4);
    if (!v15)
    {
      uint64_t v16 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 24) + position) + position;
      if (v16 < 0) {
        uint64_t v16 = -v16;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v17 = v16;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 8))(a1, v17, a4, a4, a6, a4, a6);
    }
  }
}

uint64_t _s11WeatherData011WK2_CurrentA0V_1oAcA10ByteBufferV_s5Int32VtcfC_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(_DWORD *)(a5 + 24) = a4;
  return result;
}

void sub_261710044(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void WK2_AirQuality.pollutants(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0xD)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 12);
  int v5 = v3 + 12;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void type metadata accessor for WK2_Pollutant()
{
}

void _s11WeatherData13WK2_PollutantV5unitsAA0c1_D4UnitOvg_0()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 9u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 8);
  int v5 = v3 + 8;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void _s11WeatherData13WK2_PollutantV6amountSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 7u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void type metadata accessor for WK2_ConditionToken()
{
}

uint64_t ByteBuffer.Storage.__deallocating_deinit()
{
  ByteBuffer.Storage.deinit();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t ByteBuffer.Storage.deinit()
{
  if ((*(unsigned char *)(v0 + 16) & 1) == 0) {
    MEMORY[0x263E3EDF0](*(void *)(v0 + 24), -1, -1);
  }
  return v0;
}

void sub_26171023C()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_93@<X0>(uint64_t a1@<X8>)
{
  return v1 | (a1 << 32);
}

void type metadata accessor for WK2_PreviousDayComparison()
{
}

void _s11WeatherData21WK2_ForecastConditionV05startdE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 48);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void type metadata accessor for WK2_ForecastToken()
{
}

void _s11WeatherData20WK2_NextHourForecastV14conditionCounts5Int32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 7u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void sub_261710454()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 12;
    }
    OUTLINED_FUNCTION_89(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_261710574()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 10;
    }
    OUTLINED_FUNCTION_90(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_261710694()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 8;
    }
    OUTLINED_FUNCTION_77(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void _s11WeatherData21WK2_ForecastConditionV15parametersCounts5Int32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xFu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 14);
  int v4 = v2 + 14;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void _s11WeatherData18WK2_HourlyForecastV05startdE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 16);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

ValueMetadata *type metadata accessor for WK2_SourceType()
{
  return &type metadata for WK2_SourceType;
}

void type metadata accessor for WK2_Location()
{
}

void sub_2617108AC()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 14;
    }
    OUTLINED_FUNCTION_128(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_2617109CC()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 18;
    }
    OUTLINED_FUNCTION_101(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void _s11WeatherData04WK2_A7ChangesV13forecastStarts6UInt32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 7u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 6);
    int v4 = v2 + 6;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_CurrentWeather.add(snowfallAmount24h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617243CC();
}

BOOL sub_261710B88(char a1, char a2)
{
  return a1 == a2;
}

void type metadata accessor for WK2_News()
{
}

void type metadata accessor for WK2_HourlyMarineConditions()
{
}

unsigned char *_s11WeatherData25WK2_PreviousDayComparisonOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        break;
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_167(result, a2 + 5);
        break;
    }
  }
  return result;
}

BOOL sub_261710C70(char *a1, char *a2)
{
  return sub_261710B88(*a1, *a2);
}

void type metadata accessor for WK2_HistoricalComparisons()
{
}

void type metadata accessor for WK2_ForecastCondition()
{
}

void _s11WeatherData21WK2_ForecastConditionV7endTimes6UInt32VSgvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 7u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void static WK2_ForecastCondition.add(startTime:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void WK2_ForecastCondition.forecastToken.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 9u)
  {
LABEL_9:
    char v9 = 0;
LABEL_10:
    *a1 = v9;
    return;
  }
  BOOL v5 = __OFADD__(v4, 8);
  int v6 = v4 + 8;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_9;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_ForecastToken.init(rawValue:)(*(unsigned char *)(v2 + v8));
    char v9 = v10;
    if (v10 == 6) {
      char v9 = 0;
    }
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
}

void static WK2_ForecastCondition.addVectorOf(parameters:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617108AC();
}

void WK2_ForecastCondition.beginCondition.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0xBu)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 10);
  int v6 = v4 + 10;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    OUTLINED_FUNCTION_143(*(unsigned char *)(v2 + v8));
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void WK2_ForecastCondition.endCondition.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0xDu)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 12);
  int v6 = v4 + 12;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    OUTLINED_FUNCTION_143(*(unsigned char *)(v2 + v8));
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void type metadata accessor for WK2_PeriodicForecast()
{
}

void type metadata accessor for WK2_NextHourForecast()
{
}

void static WK2_NextHourForecast.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_NextHourForecast.add(forecastStart:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_130(v12);
    }
    OUTLINED_FUNCTION_90(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void WK2_NextHourForecast.forecastStart.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xBu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void _s11WeatherData20WK2_NextHourForecastV12summaryCounts5Int32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 9u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 8);
  int v4 = v2 + 8;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void static WK2_NextHourForecast.addVectorOf(condition:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_NextHourForecast.addVectorOf(summary:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_NextHourForecast.addVectorOf(minutes:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617108AC();
}

void type metadata accessor for WK2_HourlyForecast()
{
}

void static WK2_HourlyForecast.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_HourlyForecast.addVectorOf(hours:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void type metadata accessor for WK2_DailyForecast()
{
}

void static WK2_DailyForecast.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_DailyForecast.addVectorOf(days:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

uint64_t FlatBufferBuilder.VTableStorage.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(v3 + 48))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 32);
    if (v4) {
      MEMORY[0x263E3EDF0](v4, -1, -1);
    }
    a1 = v3;
    a2 = 88;
    a3 = 7;
  }
  return MEMORY[0x270FA0228](a1, a2, a3);
}

void type metadata accessor for WK2_LocationInfo()
{
}

void WK2_LocationInfo.timeZone.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xBu)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

void static WK2_LocationInfo.add(timeZone:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710574();
}

void static WK2_LocationInfo.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_LocationInfo.add(primaryName:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710454();
}

void static WK2_LocationInfo.add(countryCode:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void WK2_LocationInfo.secondaryName.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xFu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 14);
  int v4 = v2 + 14;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void WK2_LocationInfo.primaryName.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xDu)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

ValueMetadata *type metadata accessor for VerifierOptions()
{
  return &type metadata for VerifierOptions;
}

uint64_t VerifierOptions.init(maxDepth:maxTableCount:maxApparentSize:ignoreMissingNullTerminators:)@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(_DWORD *)a5 = a3;
  *(_DWORD *)(a5 + 4) = a2;
  *(_DWORD *)(a5 + 8) = result;
  *(unsigned char *)(a5 + 12) = a4;
  return result;
}

void type metadata accessor for WK2_TideEvents()
{
}

void type metadata accessor for WK2_AirQuality()
{
}

void WK2_AirQuality.index.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 9u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 8);
    int v4 = v2 + 8;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_218(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_AirQuality.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_AirQuality.add(scale:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617109CC();
}

void static WK2_AirQuality.add(index:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_250();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_245();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(2);
  }
  unint64_t v4 = v0[2];
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = (v0[2] & 1) + v0[2];
  uint64_t v6 = v0[1];
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, v0[3]);
  }
  v0[2] = v5;
  OUTLINED_FUNCTION_63();
  if (v2 != v3)
  {
    OUTLINED_FUNCTION_180();
    uint64_t v9 = *(void *)(v6 + 32);
  }
  OUTLINED_FUNCTION_95(v9);
  if (!v1 & v10) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v12 & 1) == 0)
  {
    if (*(void *)(v11 + 32)) {
      OUTLINED_FUNCTION_103(v11);
    }
    OUTLINED_FUNCTION_77(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v10)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_AirQuality.add(primaryPollutant:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170384C();
}

void static WK2_AirQuality.add(isSignificant:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if ((v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v4 ^ v5 | v3) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v4 != v5) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v6;
  OUTLINED_FUNCTION_12();
  if (v4 ^ v5 | v3)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v8 = *(void *)(v7 + 32);
  }
  *(unsigned char *)(*(void *)(v7 + 24) + v8 + ~v6) = v1 & 1;
  OUTLINED_FUNCTION_53();
  if (!v3 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_130(v10);
    }
    OUTLINED_FUNCTION_90(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_AirQuality.add(categoryIndex:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700048();
}

void WK2_AirQuality.previousDayComparison.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0xFu)
  {
LABEL_9:
    char v9 = 0;
LABEL_10:
    *a1 = v9;
    return;
  }
  BOOL v5 = __OFADD__(v4, 14);
  int v6 = v4 + 14;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_9;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_ForecastToken.init(rawValue:)(*(unsigned char *)(v2 + v8));
    char v9 = v10;
    if (v10 == 6) {
      char v9 = 0;
    }
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
}

void WK2_AirQuality.primaryPollutant.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0x11u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 16);
  int v6 = v4 + 16;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    OUTLINED_FUNCTION_143(*(unsigned char *)(v2 + v8));
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void WK2_AirQuality.pollutantsCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xDu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_AirQuality.isSignificant.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0xBu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 10);
    int v4 = v2 + 10;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_AirQuality.addVectorOf(pollutants:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710454();
}

void static WK2_AirQuality.startAirQuality(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 64);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void WK2_Metadata.sourceType.getter(unsigned char *a1@<X8>)
{
  uint64_t v2 = v1[6];
  uint64_t v3 = *(void *)(*(void *)v1 + 24);
  int v4 = *(_DWORD *)(v3 + v2);
  BOOL v5 = __OFSUB__(v2, v4);
  int v6 = v2 - v4;
  if (v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v3 + v6) < 0x19u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(a1);
    return;
  }
  BOOL v5 = __OFADD__(v6, 24);
  int v7 = v6 + 24;
  if (v5) {
    goto LABEL_8;
  }
  int v8 = *(__int16 *)(v3 + v7);
  if (!v8 || !__OFADD__(v8, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void type metadata accessor for WK2_WeatherChanges()
{
}

void static WK2_WeatherChanges.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void _s11WeatherData04WK2_A7ChangesV12changesCounts5Int32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xBu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_WeatherChanges.forecastEnd.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 9u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 8);
    int v4 = v2 + 8;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_WeatherChanges.addVectorOf(changes:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710574();
}

void type metadata accessor for WK2_WeatherAlertCollection()
{
}

void _s11WeatherData16WK2_LocationInfoV11preciseNameSSSgvg_0()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 7u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void type metadata accessor for WK2_Weather()
{
}

unint64_t static WK2_Weather.version.getter()
{
  return 0xD000000000000010;
}

void WK2_Weather.news.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0xF)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 14);
  int v5 = v3 + 14;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void static WK2_Weather.add(forecastNextHour:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710454();
}

void static WK2_Weather.add(weatherChanges:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617109CC();
}

void static WK2_Weather.add(forecastHourly:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710574();
}

void static WK2_Weather.add(forecastDaily:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_Weather.add(locationInfo:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 22;
    }
    OUTLINED_FUNCTION_125(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Weather.add(airQuality:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_Weather.add(currentWeather:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void WK2_Weather.historicalComparisons.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x15)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 20);
  int v5 = v3 + 20;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void _s11WeatherData04WK2_A0V16forecastNextHourAA0c1_eF8ForecastVSgvg_0()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0xD)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 12);
  int v5 = v3 + 12;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.weatherChanges.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x13)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 18);
  int v5 = v3 + 18;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.marineForecast.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x19)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 24);
  int v5 = v3 + 24;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.forecastHourly.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0xB)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 10);
  int v5 = v3 + 10;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void _s11WeatherData04WK2_A0V13weatherAlertsAA0c1_A15AlertCollectionVSgvg_0()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x11)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 16);
  int v5 = v3 + 16;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void _s11WeatherData04WK2_A0V13forecastDailyAA0c1_E8ForecastVSgvg_0()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 9)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 8);
  int v5 = v3 + 8;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.locationInfo.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x17)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 22);
  int v5 = v3 + 22;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.tideEvents.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x1B)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 26);
  int v5 = v3 + 26;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.airQuality.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 5)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 4);
  int v5 = v3 + 4;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void WK2_Weather.currentWeather.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 7)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 6);
  int v5 = v3 + 6;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void static WK2_Weather.startWeather(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 112);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void type metadata accessor for WK2_CurrentWeather()
{
}

void WK2_CurrentWeather.windSpeed.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x53u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 82);
  int v4 = v2 + 82;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_CurrentWeather.windGust.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x51u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 80);
  int v4 = v2 + 80;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_CurrentWeather.daylight.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x13u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 18);
    int v4 = v2 + 18;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_CurrentWeather.uvIndex.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x4Bu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 74);
    int v4 = v2 + 74;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void _s11WeatherData011WK2_CurrentA0V41precipitationAmountPrevious24hByTypeCounts5Int32Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Fu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 46);
  int v4 = v2 + 46;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_CurrentWeather.precipitationAmountPrevious6hByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Du)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 44);
  int v4 = v2 + 44;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_CurrentWeather.precipitationAmountPrevious1hByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x2Bu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 42);
  int v4 = v2 + 42;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void static WK2_CurrentWeather.add(windSpeed:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 82;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x52) {
      LOWORD(v16) = 82;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(pressure:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172403C();
}

void static WK2_CurrentWeather.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_CurrentWeather.add(humidity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261703E70();
}

void static WK2_CurrentWeather.add(daylight:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if ((v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v4 ^ v5 | v3) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v4 != v5) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v6;
  OUTLINED_FUNCTION_12();
  if (v4 ^ v5 | v3)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v8 = *(void *)(v7 + 32);
  }
  *(unsigned char *)(*(void *)(v7 + 24) + v8 + ~v6) = v1 & 1;
  OUTLINED_FUNCTION_53();
  if (!v3 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_132(v10);
    }
    OUTLINED_FUNCTION_101(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(uvIndex:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32))
    {
      OUTLINED_FUNCTION_81(v8);
      *(_WORD *)(v10 + 4) = 74;
    }
    OUTLINED_FUNCTION_197(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v12 = v13;
    }
    *(_WORD *)(v11 + 64) = v12;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_261712F40()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_158(v14);
    }
    OUTLINED_FUNCTION_102(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(asOf:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261712F40();
}

void static WK2_CurrentWeather.add(perceivedPrecipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700958();
}

void sub_2617130E0()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 34;
    }
    OUTLINED_FUNCTION_150(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(precipitationAmountNext24h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617130E0();
}

void static WK2_CurrentWeather.add(precipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700308();
}

void static WK2_CurrentWeather.add(precipitationAmount24h:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 28;
    }
    OUTLINED_FUNCTION_124(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(precipitationAmount6h:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 26;
    }
    OUTLINED_FUNCTION_122(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_261713470()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 24;
    }
    OUTLINED_FUNCTION_153(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(precipitationAmount1h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261713470();
}

void static WK2_CurrentWeather.add(cloudCoverHighAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170393C();
}

void static WK2_CurrentWeather.add(temperatureDewPoint:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 72;
    }
    OUTLINED_FUNCTION_201(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(temperatureApparent:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170D558();
}

void static WK2_CurrentWeather.add(cloudCoverMidAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700400();
}

void static WK2_CurrentWeather.add(cloudCoverLowAltPct:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700184();
}

void static WK2_CurrentWeather.add(snowfallAmount6h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170D658();
}

void static WK2_CurrentWeather.add(snowfallAmount1h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700D68();
}

void static WK2_CurrentWeather.add(windDirection:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_250();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_245();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(2);
  }
  unint64_t v4 = v0[2];
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = (v0[2] & 1) + v0[2];
  uint64_t v6 = v0[1];
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, v0[3]);
  }
  v0[2] = v5;
  OUTLINED_FUNCTION_63();
  if (v2 != v3)
  {
    OUTLINED_FUNCTION_180();
    uint64_t v9 = *(void *)(v6 + 32);
  }
  OUTLINED_FUNCTION_95(v9);
  if (!v1 & v10) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v12 & 1) == 0)
  {
    if (*(void *)(v11 + 32))
    {
      OUTLINED_FUNCTION_81(v11);
      *(_WORD *)(v13 + 4) = 78;
    }
    OUTLINED_FUNCTION_111(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (v15 <= 0x4E) {
      LOWORD(v15) = 78;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(pressureTrend:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32))
    {
      OUTLINED_FUNCTION_81(v10);
      *(_WORD *)(v12 + 4) = 52;
    }
    OUTLINED_FUNCTION_203(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(conditionCode:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170384C();
}

void static WK2_CurrentWeather.add(temperature:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170D750();
}

void static WK2_CurrentWeather.add(visibility:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 76;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x4C) {
      LOWORD(v16) = 76;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(cloudCover:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617004F4();
}

void WK2_CurrentWeather.precipitationAmountNext24hByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x29u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 40);
  int v4 = v2 + 40;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_CurrentWeather.precipitationAmountNext6hByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x27u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 38);
  int v4 = v2 + 38;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_CurrentWeather.precipitationAmountNext1hByTypeCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x25u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 36);
  int v4 = v2 + 36;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

void WK2_CurrentWeather.precipitationAmount24h.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x1Du) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 28);
  int v4 = v2 + 28;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_CurrentWeather.precipitationAmount6h.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x1Bu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 26);
  int v4 = v2 + 26;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_CurrentWeather.temperatureDewPoint.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x49u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 72);
  int v4 = v2 + 72;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_CurrentWeather.windDirection.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x4Fu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 78);
    int v4 = v2 + 78;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_218(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_CurrentWeather.pressureTrend.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0x35u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 52);
  int v5 = v3 + 52;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void sub_261713F8C()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 46;
    }
    OUTLINED_FUNCTION_126(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious24hByType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261713F8C();
}

void static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious6hByType:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 44;
    }
    OUTLINED_FUNCTION_127(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious1hByType:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 42;
    }
    OUTLINED_FUNCTION_99(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_CurrentWeather.addVectorOf(precipitationAmountNext24hByType:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 40;
    }
    OUTLINED_FUNCTION_123(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void sub_261714460()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 38;
    }
    OUTLINED_FUNCTION_156(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_CurrentWeather.addVectorOf(precipitationAmountNext6hByType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261714460();
}

void sub_2617145D4()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 36;
    }
    OUTLINED_FUNCTION_148(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_CurrentWeather.addVectorOf(precipitationAmountNext1hByType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617145D4();
}

void WK2_CurrentWeather.visibility.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x4Du) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 76);
  int v4 = v2 + 76;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void static WK2_CurrentWeather.startCurrentWeather(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 320);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_187()
{
  return v0;
}

void String.encode(using:)(void *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X8>)
{
  v34[3] = *MEMORY[0x263EF8340];
  uint64_t v8 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x1000000000000000) != 0)
  {
LABEL_64:
    unint64_t v9 = sub_26173BC50();
  }
  else if ((a3 & 0x2000000000000000) != 0)
  {
    unint64_t v9 = HIBYTE(a3) & 0xF;
  }
  else
  {
    unint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if ((uint64_t)a1[8] <= 3) {
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_8_2();
  if (!(v12 ^ v13 | v11))
  {
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (((v10 | (v9 + 1)) & 0x8000000000000000) != 0) {
    goto LABEL_65;
  }
  if ((uint64_t)(v9 + 1) > 0xFFFFFFFFLL)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v33 = (_DWORD *)a4;
  Swift::Int v14 = (~(_BYTE)v9 - (_BYTE)v10) & 3;
  Swift::Int v15 = v14 + v10;
  a4 = a1[1];
  if (*(void *)(a4 + 32) < v14 + v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v14, v10, a1[3]);
  }
  a1[2] = v15;
  Swift::Int v16 = v15 + 1;
  if (*(void *)(a4 + 32) <= v15) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v15, a1[3]);
  }
  a1[2] = v16;
  if (*(void *)(a4 + 32) < (int64_t)(v16 + v9)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v15 + 1, a1[3]);
  }
  swift_bridgeObjectRetain();
  int v17 = sub_261714FB0(a2, a3, a1 + 1, v9);
  swift_bridgeObjectRelease();
  if (v17 != 2) {
    goto LABEL_51;
  }
  unint64_t v18 = (a3 & 0x2000000000000000) != 0 ? v8 : a2 & 0xFFFFFFFFFFFFLL;
  if (!v18) {
    goto LABEL_51;
  }
  uint64_t v19 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LODWORD(v19) = 1;
  }
  uint64_t v20 = 11;
  if (v19) {
    uint64_t v20 = 7;
  }
  unint64_t v21 = v20 | (v18 << 16);
  uint64_t v8 = 4 << v19;
  swift_bridgeObjectRetain();
  while (1)
  {
    if ((v21 & 0xC) != v8)
    {
      if ((a3 & 0x1000000000000000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_32;
    }
    unint64_t v22 = sub_26172DB28(v21, a2, a3);
    if (v22 < 0x4000) {
      break;
    }
    unint64_t v21 = v22;
    if ((a3 & 0x1000000000000000) == 0)
    {
LABEL_29:
      unint64_t v21 = (v21 & 0xFFFFFFFFFFFF0000) - 65532;
      goto LABEL_34;
    }
LABEL_32:
    if (v18 < v21 >> 16)
    {
      __break(1u);
      goto LABEL_64;
    }
    unint64_t v21 = sub_26173BC60();
LABEL_34:
    unint64_t v23 = v21;
    if ((v21 & 0xC) == v8) {
      unint64_t v23 = sub_26172DB28(v21, a2, a3);
    }
    a4 = v23 >> 16;
    if (v23 >> 16 >= v18) {
      goto LABEL_49;
    }
    if ((a3 & 0x1000000000000000) != 0)
    {
      char v25 = sub_26173BC80();
    }
    else if ((a3 & 0x2000000000000000) != 0)
    {
      v34[0] = a2;
      v34[1] = a3 & 0xFFFFFFFFFFFFFFLL;
      char v25 = *((unsigned char *)v34 + a4);
    }
    else
    {
      uint64_t v24 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a2 & 0x1000000000000000) == 0) {
        uint64_t v24 = sub_26173BDE0();
      }
      char v25 = *(unsigned char *)(v24 + a4);
    }
    a4 = a1[1];
    uint64_t v26 = a1[2];
    uint64_t v27 = *(void *)(a4 + 32);
    if (v27 < v26 + 1)
    {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, a1[2], a1[3]);
      uint64_t v27 = *(void *)(a4 + 32);
    }
    *(unsigned char *)(*(void *)(a4 + 24) + v27 + ~v26) = v25;
    a1[2] = v26 + 1;
    if (!(v21 >> 14)) {
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  swift_bridgeObjectRelease();
LABEL_51:
  if ((v9 & 0x8000000000000000) != 0) {
    goto LABEL_67;
  }
  if (HIDWORD(v9))
  {
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if ((uint64_t)a1[8] <= 3) {
    OUTLINED_FUNCTION_8_1();
  }
  unint64_t v28 = a1[2];
  if ((v28 & 0x8000000000000000) != 0) {
    goto LABEL_69;
  }
  if (HIDWORD(v28))
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  Swift::Int v29 = -*((unsigned char *)a1 + 16) & 3;
  unint64_t v30 = v29 + v28;
  if (*(void *)(a4 + 32) < (int64_t)(v29 + v28)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v29, v28, a1[3]);
  }
  a1[2] = v30;
  unint64_t v31 = v30 + 4;
  int64_t v32 = *(void *)(a4 + 32);
  if (v32 < (uint64_t)(v30 + 4))
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v30, a1[3]);
    int64_t v32 = *(void *)(a4 + 32);
  }
  *(_DWORD *)(v32 - v30 + *(void *)(a4 + 24) - 4) = v9;
  a1[2] = v31;
  if (v30 > 0xFFFFFFFB) {
LABEL_71:
  }
    __break(1u);
  *uint64_t v33 = v31;
}

void FlatBufferBuilder.create(string:)(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X8>)
{
  char v4 = v3;
  v40[3] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v8 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x1000000000000000) != 0) {
      goto LABEL_75;
    }
    if ((a2 & 0x2000000000000000) != 0) {
      unint64_t v9 = HIBYTE(a2) & 0xF;
    }
    else {
      unint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
LABEL_6:
    OUTLINED_FUNCTION_35_0();
    if (v11 ^ v12 | v10) {
      OUTLINED_FUNCTION_8_1();
    }
    OUTLINED_FUNCTION_9_1();
    if (!(v11 ^ v12 | v10))
    {
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    if (((v13 | (v9 + 1)) & 0x8000000000000000) != 0) {
      goto LABEL_76;
    }
    OUTLINED_FUNCTION_33_0();
    if (!(v11 ^ v12 | v10)) {
      goto LABEL_77;
    }
    unint64_t v39 = a3;
    Swift::Int v15 = ((~(_BYTE)v9 - (_BYTE)v14) & 3) + v14;
    a3 = v4[1];
    OUTLINED_FUNCTION_15_0();
    if (v11 != v12) {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v16, v17, v4[3]);
    }
    v4[2] = v15;
    OUTLINED_FUNCTION_15_0();
    if (v11 ^ v12 | v10)
    {
      Swift::Int v18 = OUTLINED_FUNCTION_54_0();
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v18, v15, v19);
    }
    v4[2] = v15 + 1;
    OUTLINED_FUNCTION_37_0();
    if (v11 != v12) {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v15 + 1, v4[3]);
    }
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_261714FB0(a1, a2, v4 + 1, v9);
    uint64_t v21 = swift_bridgeObjectRelease();
    if (v20 != 2) {
      goto LABEL_59;
    }
    unint64_t v22 = (a2 & 0x2000000000000000) != 0 ? v8 : a1 & 0xFFFFFFFFFFFFLL;
    if (!v22) {
      goto LABEL_59;
    }
    uint64_t v23 = (a1 >> 59) & 1;
    if ((a2 & 0x1000000000000000) == 0) {
      LODWORD(v23) = 1;
    }
    uint64_t v24 = 11;
    if (v23) {
      uint64_t v24 = 7;
    }
    unint64_t v20 = v24 | (v22 << 16);
    uint64_t v8 = 4 << v23;
    swift_bridgeObjectRetain();
    while (1)
    {
      if ((v20 & 0xC) == v8)
      {
        unint64_t v25 = sub_26172DB28(v20, a1, a2);
        if (v25 < 0x4000)
        {
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          uint64_t v21 = swift_bridgeObjectRelease();
LABEL_59:
          if ((v9 & 0x8000000000000000) == 0)
          {
            if (!HIDWORD(v9))
            {
              if ((uint64_t)v4[8] < 4) {
                OUTLINED_FUNCTION_8_1();
              }
              unint64_t v34 = v4[2];
              if ((v34 & 0x8000000000000000) == 0)
              {
                if (!HIDWORD(v34))
                {
                  OUTLINED_FUNCTION_31_0(v21, v34);
                  OUTLINED_FUNCTION_16();
                  if (v11 != v12) {
                    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v35, v36, v4[3]);
                  }
                  v4[2] = v20;
                  int v33 = v20 + 4;
                  OUTLINED_FUNCTION_5_0();
                  if (v11 != v12)
                  {
                    OUTLINED_FUNCTION_22_0();
                    uint64_t v37 = *(void *)(a3 + 32);
                  }
                  OUTLINED_FUNCTION_6_0(v37);
                  if (!(!v10 & v38))
                  {
                    a3 = v39;
                    goto LABEL_73;
                  }
LABEL_82:
                  __break(1u);
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
        unint64_t v20 = v25;
        if ((a2 & 0x1000000000000000) == 0)
        {
LABEL_35:
          OUTLINED_FUNCTION_46_0();
          goto LABEL_40;
        }
      }
      else if ((a2 & 0x1000000000000000) == 0)
      {
        goto LABEL_35;
      }
      if (v22 < v20 >> 16)
      {
        __break(1u);
LABEL_75:
        unint64_t v9 = sub_26173BC50();
        goto LABEL_6;
      }
      unint64_t v20 = sub_26173BC60();
LABEL_40:
      unint64_t v26 = v20;
      if ((v20 & 0xC) == v8) {
        unint64_t v26 = sub_26172DB28(v20, a1, a2);
      }
      a3 = v26 >> 16;
      if (v26 >> 16 >= v22) {
        goto LABEL_57;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        char v28 = sub_26173BC80();
      }
      else if ((a2 & 0x2000000000000000) != 0)
      {
        v40[0] = a1;
        v40[1] = a2 & 0xFFFFFFFFFFFFFFLL;
        char v28 = *((unsigned char *)v40 + a3);
      }
      else
      {
        uint64_t v27 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if ((a1 & 0x1000000000000000) == 0) {
          uint64_t v27 = sub_26173BDE0();
        }
        char v28 = *(unsigned char *)(v27 + a3);
      }
      a3 = v4[1];
      Swift::Int v29 = v4[2];
      OUTLINED_FUNCTION_63();
      if (v11 != v12)
      {
        Swift::Int v31 = OUTLINED_FUNCTION_54_0();
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v31, v29, v32);
        uint64_t v30 = *(void *)(a3 + 32);
      }
      *(unsigned char *)(*(void *)(a3 + 24) + v30 + ~v29) = v28;
      v4[2] = v29 + 1;
      if (!(v20 >> 14)) {
        goto LABEL_58;
      }
    }
  }
  int v33 = 0;
LABEL_73:
  *(_DWORD *)a3 = v33;
}

uint64_t sub_261714FB0(uint64_t a1, uint64_t a2, void *a3, size_t __n)
{
  if ((a2 & 0x1000000000000000) != 0) {
    return 2;
  }
  if ((a2 & 0x2000000000000000) != 0)
  {
    v10[0] = a1;
    v10[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    size_t v7 = a3[1] + __n;
    uint64_t v8 = (void *)(*(void *)(*a3 + 24) + *(void *)(*a3 + 32) - v7);
    unint64_t v6 = v10;
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      unint64_t v6 = (void *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t result = sub_26173BDE0();
      unint64_t v6 = (void *)result;
      if (!result)
      {
        __break(1u);
        return result;
      }
    }
    size_t v7 = a3[1] + __n;
    uint64_t v8 = (void *)(*(void *)(*a3 + 24) + *(void *)(*a3 + 32) - v7);
  }
  memcpy(v8, v6, __n);
  a3[1] = v7;
  return 1;
}

void static WK2_WeatherCondition.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_WeatherCondition_optional __swiftcall WK2_WeatherCondition.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

uint64_t sub_261715088()
{
  return sub_261738BC8(*v0);
}

uint64_t sub_261715090()
{
  return sub_261738C94();
}

uint64_t sub_261715098(uint64_t a1)
{
  return sub_261738D04(a1, *v1);
}

WeatherData::WK2_WeatherCondition_optional sub_2617150A0(Swift::UInt8 *a1)
{
  return WK2_WeatherCondition.init(rawValue:)(*a1);
}

uint64_t sub_2617150A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = WK2_WeatherCondition.value.getter();
  *a1 = result;
  return result;
}

void static WK2_PollutantType.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_PollutantType_optional sub_2617150E0(Swift::UInt8 *a1)
{
  return WK2_PollutantType.init(rawValue:)(*a1);
}

void static WK2_ConditionCode.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_ConditionCode_optional __swiftcall WK2_ConditionCode.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_ConditionCode_optional sub_261715108(Swift::UInt8 *a1)
{
  return WK2_ConditionCode.init(rawValue:)(*a1);
}

void static WK2_PressureTrend.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_PressureTrend_optional __swiftcall WK2_PressureTrend.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_PressureTrend_optional sub_261715130(Swift::UInt8 *a1)
{
  return WK2_PressureTrend.init(rawValue:)(*a1);
}

void static WK2_Placement.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_Placement_optional __swiftcall WK2_Placement.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_Placement_optional sub_261715158(Swift::UInt8 *a1)
{
  return WK2_Placement.init(rawValue:)(*a1);
}

void static WK2_ComparisonCondition.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_ComparisonCondition_optional __swiftcall WK2_ComparisonCondition.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_ComparisonCondition_optional sub_261715180(Swift::UInt8 *a1)
{
  return WK2_ComparisonCondition.init(rawValue:)(*a1);
}

void static WK2_Deviation.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_Deviation_optional __swiftcall WK2_Deviation.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_Deviation_optional sub_2617151A8(Swift::UInt8 *a1)
{
  return WK2_Deviation.init(rawValue:)(*a1);
}

void WK2_ComparisonBaselineType.init(rawValue:)(unsigned char *a1@<X8>)
{
}

void sub_2617151E0(unsigned char *a1@<X8>)
{
}

void OUTLINED_FUNCTION_261(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static WK2_PollutantUnit.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_PollutantUnit_optional __swiftcall WK2_PollutantUnit.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

BOOL sub_261715228(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_261738BB8(*a1, *a2);
}

uint64_t sub_261715234()
{
  return sub_261738C10(*v0);
}

uint64_t sub_26171523C()
{
  return sub_261738CDC();
}

uint64_t sub_261715244(uint64_t a1)
{
  return sub_261738D08(a1, *v1);
}

WeatherData::WK2_PollutantUnit_optional sub_26171524C(Swift::UInt8 *a1)
{
  return WK2_PollutantUnit.init(rawValue:)(*a1);
}

uint64_t sub_261715254@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = WK2_PollutantUnit.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_26171527C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = WK2_PollutantUnit.value.getter();
  *a1 = result;
  return result;
}

void static WK2_MoonPhase.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_MoonPhase_optional sub_2617152B4(Swift::UInt8 *a1)
{
  return WK2_MoonPhase.init(rawValue:)(*a1);
}

void static WK2_AlertResponseType.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_AlertResponseType_optional __swiftcall WK2_AlertResponseType.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_AlertResponseType_optional sub_2617152F0(Swift::UInt8 *a1)
{
  return WK2_AlertResponseType.init(rawValue:)(*a1);
}

void static WK2_ForecastToken.max.getter(unsigned char *a1@<X8>)
{
}

WeatherData::WK2_ForecastToken_optional __swiftcall WK2_ForecastToken.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

WeatherData::WK2_ForecastToken_optional sub_26171531C(Swift::UInt8 *a1)
{
  return WK2_ForecastToken.init(rawValue:)(*a1);
}

uint64_t sub_26171532C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_261739B90(*a1, *a2);
}

uint64_t sub_261715338(uint64_t a1)
{
  return sub_261739B84(a1, *v1);
}

void WK2_Weather.forecastPeriodic.getter()
{
  OUTLINED_FUNCTION_32_0();
  if (v0)
  {
    __break(1u);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_115();
  if (v4 < 0x1D)
  {
LABEL_8:
    uint64_t v7 = OUTLINED_FUNCTION_73();
    goto LABEL_9;
  }
  BOOL v0 = __OFADD__(v3, 28);
  int v5 = v3 + 28;
  if (v0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_8;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v7 = OUTLINED_FUNCTION_74();
    __n128 v8 = v9;
LABEL_9:
    OUTLINED_FUNCTION_46(v7, v8);
    return;
  }
LABEL_13:
  __break(1u);
}

void static WK2_Weather.add(news:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617108AC();
}

void static WK2_Weather.add(weatherAlerts:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261725A78();
}

void static WK2_Weather.add(historicalComparisons:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 20;
    }
    OUTLINED_FUNCTION_100(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Weather.add(marineForecast:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EA90();
}

void static WK2_Weather.add(tideEvents:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704EA8();
}

void static WK2_Weather.add(forecastPeriodic:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171F984();
}

uint64_t static WK2_Weather.createWeather(_:airQualityOffset:currentWeatherOffset:forecastDailyOffset:forecastHourlyOffset:forecastNextHourOffset:newsOffset:weatherAlertsOffset:weatherChangesOffset:historicalComparisonsOffset:locationInfoOffset:marineForecastOffset:tideEventsOffset:forecastPeriodicOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X1>, int *a3@<X2>, int *a4@<X3>, int *a5@<X4>, int *a6@<X5>, int *a7@<X6>, int *a8@<X7>, uint64_t a9@<X8>, int *a10, int *a11, _DWORD *a12, _DWORD *a13, _DWORD *a14, _DWORD *a15)
{
  int v15 = *a2;
  int v16 = *a3;
  int v17 = *a4;
  int v18 = *a5;
  int v19 = *a6;
  int v20 = *a7;
  int v21 = *a8;
  int v22 = *a10;
  int v23 = *a11;
  HIDWORD(v142) = *a12;
  LODWORD(v155) = *a13;
  HIDWORD(v155) = *a14;
  LODWORD(v168) = *a15;
  static WK2_Weather.startWeather(_:)(a1);
  HIDWORD(v168) = v24;
  OUTLINED_FUNCTION_121(v24, v25, v26, v27, v28, v29, v30, v31, v129, v142, v155, v168, a9, v196, v15);
  static WK2_CurrentWeather.add(metadata:_:)();
  OUTLINED_FUNCTION_121(v32, v33, v34, v35, v36, v37, v38, v39, v130, v143, v156, v169, v183, v197, v16);
  static WK2_Weather.add(currentWeather:_:)();
  OUTLINED_FUNCTION_121(v40, v41, v42, v43, v44, v45, v46, v47, v131, v144, v157, v170, v184, v198, v17);
  static WK2_Weather.add(forecastDaily:_:)();
  OUTLINED_FUNCTION_121(v48, v49, v50, v51, v52, v53, v54, v55, v132, v145, v158, v171, v185, v199, v18);
  static WK2_Weather.add(forecastHourly:_:)();
  OUTLINED_FUNCTION_121(v56, v57, v58, v59, v60, v61, v62, v63, v133, v146, v159, v172, v186, v200, v19);
  static WK2_Weather.add(forecastNextHour:_:)();
  OUTLINED_FUNCTION_121(v64, v65, v66, v67, v68, v69, v70, v71, v134, v147, v160, v173, v187, v201, v20);
  static WK2_Weather.add(news:_:)();
  OUTLINED_FUNCTION_121(v72, v73, v74, v75, v76, v77, v78, v79, v135, v148, v161, v174, v188, v202, v21);
  static WK2_Weather.add(weatherAlerts:_:)();
  OUTLINED_FUNCTION_121(v80, v81, v82, v83, v84, v85, v86, v87, v136, v149, v162, v175, v189, v203, v22);
  static WK2_Weather.add(weatherChanges:_:)();
  OUTLINED_FUNCTION_121(v88, v89, v90, v91, v92, v93, v94, v95, v137, v150, v163, v176, v190, v204, v23);
  static WK2_Weather.add(historicalComparisons:_:)();
  OUTLINED_FUNCTION_121(v96, v97, v98, v99, v100, v101, v102, v103, v138, v151, v164, v177, v191, v205, SBYTE4(v151));
  static WK2_Weather.add(locationInfo:_:)();
  OUTLINED_FUNCTION_121(v104, v105, v106, v107, v108, v109, v110, v111, v139, v152, v165, v178, v192, v206, v165);
  static WK2_Weather.add(marineForecast:_:)();
  OUTLINED_FUNCTION_121(v112, v113, v114, v115, v116, v117, v118, v119, v140, v153, v166, v179, v193, v207, SBYTE4(v166));
  static WK2_Weather.add(tideEvents:_:)();
  OUTLINED_FUNCTION_121(v120, v121, v122, v123, v124, v125, v126, v127, v141, v154, v167, v180, v194, v208, v180);
  static WK2_Weather.add(forecastPeriodic:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  _DWORD *v195 = result;
  return result;
}

void sub_261715820(unsigned __int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a1;
  if (*(void *)(v4 + 16) > (uint64_t)a1)
  {
    uint64_t v9 = *(void *)(v4 + 8) + a1;
    if (*(unsigned char *)(v4 + 24) == 1 && ((*(_DWORD *)(*(void *)(v4 + 64) + 24) + v9) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v12 = sub_26173BC20();
      uint64_t v14 = v13;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v15 = v9;
      *(void *)(v15 + 8) = v12;
      *(void *)(v15 + 16) = v14;
      *(_OWORD *)(v15 + 24) = 0u;
      *(_OWORD *)(v15 + 40) = 0u;
      *(_OWORD *)(v15 + 49) = 0u;
      goto LABEL_10;
    }
    Verifier.rangeInBuffer(position:size:)(*(void *)(v4 + 8) + a1, 2);
    if (v10) {
      return;
    }
    if (*(_WORD *)(*(void *)(*(void *)(v4 + 64) + 24) + v9))
    {
      sub_261726FBC((unsigned __int8 *)(v4 + 24), *(void *)v4 + *(unsigned __int16 *)(*(void *)(*(void *)(v4 + 64) + 24) + v9));
      return;
    }
  }
  if ((a4 & 1) == 0) {
    return;
  }
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v11 = v8;
  *(void *)(v11 + 8) = a2;
  *(void *)(v11 + 16) = a3;
  *(_OWORD *)(v11 + 24) = 0u;
  *(_OWORD *)(v11 + 40) = 0u;
  *(void *)(v11 + 56) = 0;
  *(unsigned char *)(v11 + 64) = 3;
  swift_bridgeObjectRetain();
LABEL_10:
  swift_willThrow();
}

void sub_2617159B0()
{
}

void sub_2617159DC()
{
}

void sub_261715A08(unsigned __int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a1;
  if (*(void *)(v4 + 16) > (uint64_t)a1)
  {
    Swift::Int v9 = *(void *)(v4 + 8) + a1;
    if (*(unsigned char *)(v4 + 24) == 1 && ((*(_DWORD *)(*(void *)(v4 + 64) + 24) + v9) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      OUTLINED_FUNCTION_229();
      OUTLINED_FUNCTION_109();
      uint64_t v12 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_181(v12, v13);
      OUTLINED_FUNCTION_79(v14, v15);
      goto LABEL_10;
    }
    OUTLINED_FUNCTION_29(v9);
    if (v5) {
      return;
    }
    if (*(_WORD *)(*(void *)(*(void *)(v4 + 64) + 24) + v9))
    {
      Verifier.rangeInBuffer(position:size:)(*(void *)v4 + *(unsigned __int16 *)(*(void *)(*(void *)(v4 + 64) + 24) + v9), 1);
      return;
    }
  }
  if ((a4 & 1) == 0) {
    return;
  }
  sub_2617295E0();
  uint64_t v10 = OUTLINED_FUNCTION_44();
  *uint64_t v11 = v8;
  v11[1] = a2;
  OUTLINED_FUNCTION_171(v10, (uint64_t)v11);
LABEL_10:
  swift_willThrow();
}

void sub_261715B38(unsigned __int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a1;
  if (*(void *)(v4 + 16) <= (uint64_t)a1) {
    goto LABEL_11;
  }
  Swift::Int v9 = *(void *)(v4 + 8) + a1;
  int v10 = *(unsigned __int8 *)(v4 + 24);
  if (v10 == 1 && ((*(_DWORD *)(*(void *)(v4 + 64) + 24) + v9) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    uint64_t v21 = sub_26173BC20();
    uint64_t v23 = v22;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v19 = v9;
    *(void *)(v19 + 8) = v21;
    *(void *)(v19 + 16) = v23;
    goto LABEL_14;
  }
  Verifier.rangeInBuffer(position:size:)(v9, 2);
  if (v11) {
    return;
  }
  uint64_t v12 = *(void *)(*(void *)(v4 + 64) + 24);
  if (!*(_WORD *)(v12 + v9))
  {
LABEL_11:
    if ((a4 & 1) == 0) {
      return;
    }
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v20 = v8;
    *(void *)(v20 + 8) = a2;
    *(void *)(v20 + 16) = a3;
    *(_OWORD *)(v20 + 24) = 0u;
    *(_OWORD *)(v20 + 40) = 0u;
    *(void *)(v20 + 56) = 0;
    *(unsigned char *)(v20 + 64) = 3;
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  uint64_t v13 = *(unsigned __int16 *)(v12 + v9);
  uint64_t v14 = *(void *)v4 + v13;
  if ((((_BYTE)v12 + (_BYTE)v14) & 3) != 0) {
    int v15 = v10;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v16 = sub_26173BC20();
    uint64_t v18 = v17;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v19 = v14;
    *(void *)(v19 + 8) = v16;
    *(void *)(v19 + 16) = v18;
LABEL_14:
    *(_OWORD *)(v19 + 24) = 0u;
    *(_OWORD *)(v19 + 40) = 0u;
    *(_OWORD *)(v19 + 49) = 0u;
LABEL_15:
    swift_willThrow();
    return;
  }
  uint64_t v24 = *(void *)(v4 + 64);
  Verifier.rangeInBuffer(position:size:)(*(void *)v4 + v13, 4);
  if (!v29)
  {
    uint64_t v30 = v14 + *(unsigned int *)(*(void *)(v24 + 24) + v14);
    if (v30 < 0) {
      uint64_t v30 = -v30;
    }
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v31 = v30;
    }
    sub_26172370C(v4 + 24, v31, MEMORY[0x263F8D5C8], &qword_26A92AB88, v25, v26, v27, v28);
  }
}

void sub_261715D7C()
{
}

void sub_261715DA8()
{
}

void sub_261715DD4()
{
}

void sub_261715E00()
{
}

void sub_261715E2C(unsigned __int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a1;
  if (*(void *)(v4 + 16) <= (uint64_t)a1) {
    goto LABEL_11;
  }
  Swift::Int v9 = *(void *)(v4 + 8) + a1;
  int v10 = *(unsigned __int8 *)(v4 + 24);
  if (v10 == 1 && ((*(_DWORD *)(*(void *)(v4 + 64) + 24) + v9) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    uint64_t v21 = sub_26173BC20();
    uint64_t v23 = v22;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v19 = v9;
    *(void *)(v19 + 8) = v21;
    *(void *)(v19 + 16) = v23;
    goto LABEL_14;
  }
  Verifier.rangeInBuffer(position:size:)(v9, 2);
  if (v11) {
    return;
  }
  uint64_t v12 = *(void *)(*(void *)(v4 + 64) + 24);
  if (!*(_WORD *)(v12 + v9))
  {
LABEL_11:
    if ((a4 & 1) == 0) {
      return;
    }
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v20 = v8;
    *(void *)(v20 + 8) = a2;
    *(void *)(v20 + 16) = a3;
    *(_OWORD *)(v20 + 24) = 0u;
    *(_OWORD *)(v20 + 40) = 0u;
    *(void *)(v20 + 56) = 0;
    *(unsigned char *)(v20 + 64) = 3;
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  uint64_t v13 = *(unsigned __int16 *)(v12 + v9);
  uint64_t v14 = *(void *)v4 + v13;
  if ((((_BYTE)v12 + (_BYTE)v14) & 3) != 0) {
    int v15 = v10;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v16 = sub_26173BC20();
    uint64_t v18 = v17;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v19 = v14;
    *(void *)(v19 + 8) = v16;
    *(void *)(v19 + 16) = v18;
LABEL_14:
    *(_OWORD *)(v19 + 24) = 0u;
    *(_OWORD *)(v19 + 40) = 0u;
    *(_OWORD *)(v19 + 49) = 0u;
LABEL_15:
    swift_willThrow();
    return;
  }
  uint64_t v24 = *(void *)(v4 + 64);
  Verifier.rangeInBuffer(position:size:)(*(void *)v4 + v13, 4);
  if (!v25)
  {
    uint64_t v26 = v14 + *(unsigned int *)(*(void *)(v24 + 24) + v14);
    if (v26 < 0) {
      uint64_t v26 = -v26;
    }
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFFLL) {
      Swift::Int v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      Swift::Int v27 = v26;
    }
    sub_26170C568(v4 + 24, v27);
  }
}

void sub_261716060()
{
}

void sub_26171608C()
{
}

void sub_2617160B8()
{
}

void WK2_AirQuality.hasPollutants.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0xDu)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 12)) {
    goto LABEL_7;
  }
}

void *WK2_AirQuality.scaleSegmentArray.getter()
{
  return sub_261716140((void *)0x12, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *sub_261716140(void *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5 = *(void *)(a2 + 24);
  int v6 = *(_DWORD *)(v5 + a5);
  BOOL v7 = __OFSUB__(a5, v6);
  int v8 = a5 - v6;
  if (v7)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v5 + v8) <= (int)result) {
    return 0;
  }
  BOOL v7 = __OFADD__(v8, result);
  int v9 = v8 + result;
  if (v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v10 = *(__int16 *)(v5 + v9);
  if (v10)
  {
    BOOL v7 = __OFADD__(v10, a5);
    int v11 = v10 + a5;
    if (!v7)
    {
      int v12 = *(_DWORD *)(v5 + v11);
      BOOL v7 = __OFADD__(v11, v12);
      int v13 = v11 + v12;
      if (!v7)
      {
        if (!__OFADD__(v13, 4)) {
          return sub_261702AB8((const void *)(v5 + v13 + 4), *(int *)(v5 + v13));
        }
        goto LABEL_15;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      return result;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return 0;
}

void static WK2_AirQuality.add(previousDayComparison:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700EB0();
}

uint64_t static WK2_AirQuality.createAirQuality(_:metadataOffset:categoryIndex:index:isSignificant:pollutantsVectorOffset:previousDayComparison:primaryPollutant:scaleOffset:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  static WK2_AirQuality.startAirQuality(_:)(a1);
  Swift::UInt32 v3 = v2;
  static WK2_CurrentWeather.add(metadata:_:)();
  static WK2_HourWeatherConditions.add(cloudCover:_:)();
  static WK2_AirQuality.add(index:_:)();
  OUTLINED_FUNCTION_243();
  static WK2_AirQuality.add(isSignificant:_:)();
  static WK2_Weather.add(forecastNextHour:_:)();
  static WK2_HourWeatherConditions.add(conditionCode:_:)();
  static WK2_CurrentWeather.add(conditionCode:_:)();
  static WK2_Weather.add(weatherChanges:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v3);
  *a2 = result;
  return result;
}

#error "261716328: call analysis failed (funcsize=148)"

uint64_t sub_26171658C()
{
  return static WK2_AirQuality.verify<A>(_:at:of:)();
}

void WK2_CurrentWeather.hasPrecipitationAmountNext1hByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x25u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 36)) {
    goto LABEL_7;
  }
}

void WK2_CurrentWeather.precipitationAmountNext1hByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x25)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 36);
  int v5 = v3 + 36;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void WK2_CurrentWeather.hasPrecipitationAmountNext6hByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x27u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 38)) {
    goto LABEL_7;
  }
}

void WK2_CurrentWeather.precipitationAmountNext6hByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x27)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 38);
  int v5 = v3 + 38;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void WK2_CurrentWeather.hasPrecipitationAmountNext24hByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x29u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 40)) {
    goto LABEL_7;
  }
}

void WK2_CurrentWeather.precipitationAmountNext24hByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x29)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 40);
  int v5 = v3 + 40;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void WK2_CurrentWeather.hasPrecipitationAmountPrevious1hByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x2Bu)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 42)) {
    goto LABEL_7;
  }
}

void WK2_CurrentWeather.precipitationAmountPrevious1hByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x2B)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 42);
  int v5 = v3 + 42;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void WK2_CurrentWeather.hasPrecipitationAmountPrevious6hByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x2Du)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 44)) {
    goto LABEL_7;
  }
}

void WK2_CurrentWeather.precipitationAmountPrevious6hByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x2D)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 44);
  int v5 = v3 + 44;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void WK2_CurrentWeather.precipitationAmountPrevious24hByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x2F)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 46);
  int v5 = v3 + 46;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void WK2_CurrentWeather.reserved0.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x47u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 70);
  int v4 = v2 + 70;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void static WK2_CurrentWeather.add(precipitationAmountNext1h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EBB0();
}

void static WK2_CurrentWeather.add(precipitationAmountNext6h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704FC8();
}

void static WK2_CurrentWeather.add(snowfallAmountNext1h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EEA0();
}

void static WK2_CurrentWeather.add(snowfallAmountNext6h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EDA8();
}

void static WK2_CurrentWeather.add(snowfallAmountNext24h:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170ECA8();
}

void static WK2_CurrentWeather.add(reserved0:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 70;
    }
    OUTLINED_FUNCTION_204(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_CurrentWeather.add(windGust:_:)()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 80;
    }
    OUTLINED_FUNCTION_111(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (v16 <= 0x50) {
      LOWORD(v16) = 80;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t static WK2_CurrentWeather.createCurrentWeather(_:metadataOffset:asOf:cloudCover:cloudCoverLowAltPct:cloudCoverMidAltPct:cloudCoverHighAltPct:conditionCode:daylight:humidity:perceivedPrecipitationIntensity:precipitationAmount1h:precipitationAmount6h:precipitationAmount24h:precipitationAmountNext1h:precipitationAmountNext6h:precipitationAmountNext24h:precipitationAmountNext1hByTypeVectorOffset:precipitationAmountNext6hByTypeVectorOffset:precipitationAmountNext24hByTypeVectorOffset:precipitationAmountPrevious1hByTypeVectorOffset:precipitationAmountPrevious6hByTypeVectorOffset:precipitationAmountPrevious24hByTypeVectorOffset:precipitationIntensity:pressure:pressureTrend:snowfallAmount1h:snowfallAmount6h:snowfallAmount24h:snowfallAmountNext1h:snowfallAmountNext6h:snowfallAmountNext24h:temperature:temperatureApparent:reserved0:temperatureDewPoint:uvIndex:visibility:windDirection:windGust:windSpeed:)()
{
  OUTLINED_FUNCTION_188();
  char v5 = v0;
  static WK2_CurrentWeather.startCurrentWeather(_:)(v1);
  Swift::UInt32 at = v2;
  static WK2_CurrentWeather.add(metadata:_:)();
  static WK2_CurrentWeather.add(asOf:_:)();
  static WK2_CurrentWeather.add(cloudCover:_:)();
  OUTLINED_FUNCTION_253();
  static WK2_CurrentWeather.add(cloudCoverLowAltPct:_:)();
  OUTLINED_FUNCTION_252();
  static WK2_CurrentWeather.add(cloudCoverMidAltPct:_:)();
  static WK2_CurrentWeather.add(cloudCoverHighAltPct:_:)();
  static WK2_CurrentWeather.add(conditionCode:_:)();
  OUTLINED_FUNCTION_243();
  static WK2_CurrentWeather.add(daylight:_:)();
  static WK2_CurrentWeather.add(humidity:_:)();
  OUTLINED_FUNCTION_251();
  static WK2_CurrentWeather.add(perceivedPrecipitationIntensity:_:)();
  OUTLINED_FUNCTION_222();
  static WK2_CurrentWeather.add(precipitationAmount1h:_:)();
  OUTLINED_FUNCTION_220();
  static WK2_CurrentWeather.add(precipitationAmount6h:_:)();
  OUTLINED_FUNCTION_186();
  static WK2_CurrentWeather.add(precipitationAmount24h:_:)();
  static WK2_CurrentWeather.add(precipitationAmountNext1h:_:)();
  OUTLINED_FUNCTION_249();
  static WK2_CurrentWeather.add(precipitationAmountNext6h:_:)();
  OUTLINED_FUNCTION_248();
  static WK2_CurrentWeather.add(precipitationAmountNext24h:_:)();
  OUTLINED_FUNCTION_138();
  static WK2_CurrentWeather.addVectorOf(precipitationAmountNext1hByType:_:)();
  OUTLINED_FUNCTION_138();
  static WK2_CurrentWeather.addVectorOf(precipitationAmountNext6hByType:_:)();
  OUTLINED_FUNCTION_138();
  static WK2_CurrentWeather.addVectorOf(precipitationAmountNext24hByType:_:)();
  OUTLINED_FUNCTION_138();
  static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious1hByType:_:)();
  OUTLINED_FUNCTION_138();
  static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious6hByType:_:)();
  OUTLINED_FUNCTION_138();
  static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious24hByType:_:)();
  static WK2_CurrentWeather.add(precipitationIntensity:_:)();
  static WK2_CurrentWeather.add(pressure:_:)();
  static WK2_CurrentWeather.add(pressureTrend:_:)();
  static WK2_CurrentWeather.add(snowfallAmount1h:_:)();
  static WK2_CurrentWeather.add(snowfallAmount6h:_:)();
  static WK2_CurrentWeather.add(snowfallAmount24h:_:)();
  static WK2_CurrentWeather.add(snowfallAmountNext1h:_:)();
  static WK2_CurrentWeather.add(snowfallAmountNext6h:_:)();
  static WK2_CurrentWeather.add(snowfallAmountNext24h:_:)();
  static WK2_CurrentWeather.add(temperature:_:)();
  static WK2_CurrentWeather.add(temperatureApparent:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_CurrentWeather.add(reserved0:_:)();
  static WK2_CurrentWeather.add(temperatureDewPoint:_:)();
  static WK2_CurrentWeather.add(uvIndex:_:)();
  static WK2_CurrentWeather.add(visibility:_:)();
  static WK2_CurrentWeather.add(windDirection:_:)();
  static WK2_CurrentWeather.add(windGust:_:)();
  static WK2_CurrentWeather.add(windSpeed:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *char v5 = result;
  return result;
}

#error "26171725C: call analysis failed (funcsize=473)"

uint64_t sub_261717A80()
{
  return static WK2_CurrentWeather.verify<A>(_:at:of:)();
}

uint64_t static WK2_DailyForecast.createDailyForecast(_:metadataOffset:daysVectorOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X2>, _DWORD *a3@<X8>)
{
  return sub_261717E78(a1, a2, (void (*)(void))static WK2_DailyForecast.startDailyForecast(_:), static WK2_DailyForecast.add(metadata:_:), (void (*)(int *, uint64_t))static WK2_DailyForecast.addVectorOf(days:_:), a3);
}

#error "261717AFC: call analysis failed (funcsize=149)"

uint64_t sub_261717D5C()
{
  return static WK2_DailyForecast.verify<A>(_:at:of:)();
}

void static WK2_PeriodicForecasts.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_PeriodicForecasts.addVectorOf(forecasts:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

uint64_t static WK2_PeriodicForecasts.createPeriodicForecasts(_:metadataOffset:forecastsVectorOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X2>, _DWORD *a3@<X8>)
{
  return sub_261717E78(a1, a2, (void (*)(void))static WK2_PeriodicForecasts.startPeriodicForecasts(_:), static WK2_PeriodicForecasts.add(metadata:_:), (void (*)(int *, uint64_t))static WK2_PeriodicForecasts.addVectorOf(forecasts:_:), a3);
}

uint64_t sub_261717E78@<X0>(uint64_t a1@<X0>, int *a2@<X2>, void (*a3)(void)@<X3>, void (*a4)(void)@<X4>, void (*a5)(int *, uint64_t)@<X5>, _DWORD *a6@<X8>)
{
  int v10 = *a2;
  a3();
  OUTLINED_FUNCTION_233();
  a4();
  int v12 = v10;
  a5(&v12, a1);
  uint64_t result = OUTLINED_FUNCTION_244();
  *a6 = result;
  return result;
}

uint64_t static WK2_PeriodicForecasts.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2617182EC(a1, a2, a3, a4, a5, 0x7473616365726F66, 0xE900000000000073, sub_261727D6C, sub_26170C1D8);
}

uint64_t sub_261717F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static WK2_PeriodicForecasts.verify<A>(_:at:of:)(a1, a2, a3, a4, a5);
}

void static WK2_PeriodicForecast.add(periodLength:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171E518();
}

void static WK2_PeriodicForecast.addVectorOf(periods:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_PeriodicForecast.createPeriodicForecast(_:periodLength:periodsVectorOffset:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_174();
  Swift::UInt32 v1 = static WK2_HourTide.startHourTide(_:)();
  static WK2_NewsPlacement.add(priority:_:)();
  OUTLINED_FUNCTION_137();
  *uint64_t v0 = FlatBufferBuilder.endTable(at:)(v1);
  OUTLINED_FUNCTION_20();
}

void static WK2_PeriodicForecast.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16);
  if (!v8)
  {
    if (v18 >= 5)
    {
      OUTLINED_FUNCTION_68();
      if (v9)
      {
        OUTLINED_FUNCTION_11();
        if (v10)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
          sub_26173BC20();
          OUTLINED_FUNCTION_87();
          uint64_t v12 = OUTLINED_FUNCTION_44();
          OUTLINED_FUNCTION_19(v12, v13);
          goto LABEL_9;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_2_0();
      if (v11) {
        OUTLINED_FUNCTION_4(v11, v15, v17);
      }
    }
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_97();
LABEL_9:
    swift_release();
  }
}

void sub_261718190(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

uint64_t static WK2_HourlyForecast.createHourlyForecast(_:metadataOffset:hoursVectorOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X2>, _DWORD *a3@<X8>)
{
  return sub_261717E78(a1, a2, (void (*)(void))static WK2_HourlyForecast.startHourlyForecast(_:), static WK2_HourlyForecast.add(metadata:_:), (void (*)(int *, uint64_t))static WK2_HourlyForecast.addVectorOf(hours:_:), a3);
}

void sub_2617181F4(int a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, (int)a6, a7, a8, v14, v15);
  if (!v8)
  {
    OUTLINED_FUNCTION_27();
    uint64_t v13 = OUTLINED_FUNCTION_140();
    a6(v13, a3, a4, 1, a5);
    swift_release();
  }
}

uint64_t static WK2_HourlyForecast.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2617182EC(a1, a2, a3, a4, a5, 0x7372756F68, 0xE500000000000000, sub_261707904, sub_261706814);
}

#error "261718310: call analysis failed (funcsize=37)"

uint64_t sub_261718384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static WK2_HourlyForecast.verify<A>(_:at:of:)(a1, a2, a3, a4, a5);
}

void WK2_NextHourForecast.forecastEnd.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xDu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void static WK2_NextHourForecast.add(forecastEnd:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_160(v12);
    }
    OUTLINED_FUNCTION_89(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_NextHourForecast.createNextHourForecast(_:metadataOffset:conditionVectorOffset:summaryVectorOffset:forecastStart:forecastEnd:minutesVectorOffset:)()
{
  OUTLINED_FUNCTION_117();
  unint64_t v1 = v0;
  unint64_t v3 = v2;
  char v5 = v4;
  Swift::UInt32 v6 = static WK2_LocationInfo.startLocationInfo(_:)();
  static WK2_CurrentWeather.add(metadata:_:)();
  static WK2_Weather.add(currentWeather:_:)();
  static WK2_Weather.add(forecastDaily:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(v3) & 1);
  static WK2_NextHourForecast.add(forecastStart:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(v1) & 1);
  static WK2_NextHourForecast.add(forecastEnd:_:)();
  OUTLINED_FUNCTION_230();
  *char v5 = FlatBufferBuilder.endTable(at:)(v6);
  OUTLINED_FUNCTION_116();
}

#error "2617185C0: call analysis failed (funcsize=111)"

uint64_t sub_2617187A8()
{
  return static WK2_NextHourForecast.verify<A>(_:at:of:)();
}

void static WK2_News.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_News.addVectorOf(placements:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

uint64_t static WK2_News.createNews(_:metadataOffset:placementsVectorOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X2>, _DWORD *a3@<X8>)
{
  return sub_261717E78(a1, a2, (void (*)(void))static WK2_News.startNews(_:), static WK2_News.add(metadata:_:), (void (*)(int *, uint64_t))static WK2_News.addVectorOf(placements:_:), a3);
}

uint64_t static WK2_News.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2617182EC(a1, a2, a3, a4, a5, 0x6E656D6563616C70, 0xEA00000000007374, sub_26171E71C, sub_261706814);
}

uint64_t sub_261718924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static WK2_News.verify<A>(_:at:of:)(a1, a2, a3, a4, a5);
}

void static WK2_WeatherAlertCollection.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_WeatherAlertCollection.add(detailsUrl:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_WeatherAlertCollection.addVectorOf(alerts:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_WeatherAlertCollection.createWeatherAlertCollection(_:metadataOffset:detailsUrlOffset:alertsVectorOffset:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_261719B88(a1, a2, a3, a4, (uint64_t)static WK2_WeatherAlertCollection.startWeatherAlertCollection(_:), (uint64_t)static WK2_WeatherAlertCollection.add(metadata:_:), (uint64_t)static WK2_WeatherAlertCollection.add(detailsUrl:_:), (uint64_t)static WK2_WeatherAlertCollection.addVectorOf(alerts:_:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_261718AA8(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v35);
  if (v2) {
    return;
  }
  sub_26170C1D8();
  sub_26170C1D8();
  if (v37 <= 8) {
    goto LABEL_12;
  }
  uint64_t v3 = v36 + 8;
  int v4 = v38[0];
  if (v38[0] == 1 && ((*(_DWORD *)(v41 + 24) + v3) & 1) != 0)
  {
    uint64_t v43 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_14;
  }
  Verifier.rangeInBuffer(position:size:)(v36 + 8, 2);
  if (v5) {
    goto LABEL_17;
  }
  uint64_t v6 = v41;
  uint64_t v7 = *(void *)(v41 + 24);
  uint64_t v8 = *(unsigned __int16 *)(v7 + v3);
  if (!*(_WORD *)(v7 + v3))
  {
LABEL_12:
    sub_2617295E0();
    swift_allocError();
    *(_OWORD *)uint64_t v11 = xmmword_26173C150;
    *(void *)(v11 + 16) = 0xE600000000000000;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *(void *)(v11 + 56) = 0;
    *(unsigned char *)(v11 + 64) = 3;
    goto LABEL_16;
  }
  uint64_t v3 = v35 + v8;
  if ((((_BYTE)v7 + (_BYTE)v35 + (_BYTE)v8) & 3) != 0) {
    int v9 = v4;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    uint64_t v43 = MEMORY[0x263F8E8F8];
    uint64_t v10 = &qword_26A92AB80;
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(v10);
    uint64_t v12 = sub_26173BC20();
    uint64_t v14 = v13;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v15 = v3;
    *(void *)(v15 + 8) = v12;
    *(void *)(v15 + 16) = v14;
    goto LABEL_15;
  }
  Verifier.rangeInBuffer(position:size:)(v35 + v8, 4);
  if (v16) {
    goto LABEL_17;
  }
  uint64_t v17 = v3 + *(unsigned int *)(*(void *)(v6 + 24) + v3);
  if (v17 < 0) {
    uint64_t v17 = -v17;
  }
  Swift::Int v18 = (unint64_t)v17 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v17;
  Swift::Int v19 = sub_261706B18(v38, v18);
  uint64_t v21 = v19 + v20;
  if (v19 >= v19 + v20) {
    goto LABEL_17;
  }
  while (1)
  {
    unint64_t v22 = v19 + 4;
    if (!__OFADD__(v19, 4)) {
      break;
    }
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v38[0]) {
      goto LABEL_31;
    }
LABEL_32:
    if ((v22 & 0x8000000000000000) != 0) {
      unint64_t v22 = -(uint64_t)v22;
    }
    unint64_t v24 = *(void *)(v41 + 32);
    if ((v24 & 0x8000000000000000) != 0 || v24 < v22)
    {
      uint64_t v27 = v39;
      unint64_t v28 = v22;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v29 = v28;
      *(void *)(v29 + 8) = v27;
      *(_OWORD *)(v29 + 16) = 0u;
      *(_OWORD *)(v29 + 32) = 0u;
      *(_OWORD *)(v29 + 48) = 0u;
      char v30 = 1;
LABEL_46:
      *(unsigned char *)(v29 + 64) = v30;
      goto LABEL_16;
    }
    v40 += 4;
    if (v42 < v40)
    {
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v29 = 6;
      *(_OWORD *)(v29 + 8) = 0u;
      *(_OWORD *)(v29 + 24) = 0u;
      *(_OWORD *)(v29 + 40) = 0u;
      *(void *)(v29 + 56) = 0;
      char v30 = 7;
      goto LABEL_46;
    }
    uint64_t v25 = v19 + *(unsigned int *)(*(void *)(v41 + 24) + v19);
    if (v25 < 0) {
      uint64_t v25 = -v25;
    }
    if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v26 = v25;
    }
    sub_2617203E8((int)v38, v26);
    Swift::Int v19 = v23;
    if (v23 >= v21) {
      goto LABEL_17;
    }
  }
  uint64_t v23 = v19 + 4;
  if (!v38[0]) {
    goto LABEL_32;
  }
LABEL_31:
  if (((*(_DWORD *)(v41 + 24) + (int)v19) & 3) == 0) {
    goto LABEL_32;
  }
  uint64_t v43 = MEMORY[0x263F8E8F8];
  Swift::Int v31 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
  uint64_t v32 = sub_26173BC20();
  uint64_t v34 = v33;
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v15 = v31;
  *(void *)(v15 + 8) = v32;
  *(void *)(v15 + 16) = v34;
LABEL_15:
  *(_OWORD *)(v15 + 24) = 0u;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 49) = 0u;
LABEL_16:
  swift_willThrow();
LABEL_17:
  swift_release();
}

#error "261718EDC: call analysis failed (funcsize=159)"

uint64_t sub_261719178()
{
  return static WK2_WeatherAlertCollection.verify<A>(_:at:of:)();
}

void WK2_WeatherChanges.changes(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0xB)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 10);
  int v5 = v3 + 10;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void static WK2_WeatherChanges.add(forecastStart:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261712F40();
}

void static WK2_WeatherChanges.add(forecastEnd:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_103(v14);
    }
    OUTLINED_FUNCTION_77(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

uint64_t static WK2_WeatherChanges.createWeatherChanges(_:metadataOffset:forecastStart:forecastEnd:changesVectorOffset:)@<X0>(_DWORD *a1@<X8>)
{
  static WK2_WeatherChanges.startWeatherChanges(_:)();
  OUTLINED_FUNCTION_233();
  static WK2_CurrentWeather.add(metadata:_:)();
  static WK2_CurrentWeather.add(asOf:_:)();
  static WK2_WeatherChanges.add(forecastEnd:_:)();
  static WK2_Weather.add(forecastHourly:_:)();
  uint64_t result = OUTLINED_FUNCTION_244();
  *a1 = result;
  return result;
}

#error "261719444: call analysis failed (funcsize=91)"

uint64_t sub_2617195B8()
{
  return static WK2_WeatherChanges.verify<A>(_:at:of:)();
}

void static WK2_HistoricalComparisons.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_HistoricalComparisons.addVectorOf(comparisons:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

uint64_t static WK2_HistoricalComparisons.createHistoricalComparisons(_:metadataOffset:comparisonsVectorOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X2>, _DWORD *a3@<X8>)
{
  return sub_261717E78(a1, a2, (void (*)(void))static WK2_HistoricalComparisons.startHistoricalComparisons(_:), static WK2_HistoricalComparisons.add(metadata:_:), (void (*)(int *, uint64_t))static WK2_HistoricalComparisons.addVectorOf(comparisons:_:), a3);
}

uint64_t static WK2_HistoricalComparisons.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2617182EC(a1, a2, a3, a4, a5, 0x73697261706D6F63, 0xEB00000000736E6FLL, sub_261722604, sub_261706814);
}

uint64_t sub_261719738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static WK2_HistoricalComparisons.verify<A>(_:at:of:)(a1, a2, a3, a4, a5);
}

void static WK2_LocationInfo.add(preciseName:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_LocationInfo.add(secondaryName:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617108AC();
}

void static WK2_LocationInfo.createLocationInfo(_:metadataOffset:preciseNameOffset:countryCodeOffset:timeZoneOffset:primaryNameOffset:secondaryNameOffset:)()
{
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_164();
  static WK2_LocationInfo.startLocationInfo(_:)();
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_137();
  OUTLINED_FUNCTION_191();
  OUTLINED_FUNCTION_232();
  OUTLINED_FUNCTION_231();
  OUTLINED_FUNCTION_230();
  *uint64_t v0 = FlatBufferBuilder.endTable(at:)(v1);
  OUTLINED_FUNCTION_116();
}

void static WK2_LocationInfo.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10);
  if (!v8)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_240();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_98();
    swift_release();
  }
}

void sub_2617199FC(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void static WK2_HourlyMarineConditions.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_HourlyMarineConditions.addVectorOf(hours:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_HourlyMarineConditions.add(closestWaterLocation:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_HourlyMarineConditions.createHourlyMarineConditions(_:metadataOffset:hoursVectorOffset:closestWaterLocationOffset:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_261719B88(a1, a2, a3, a4, (uint64_t)static WK2_HourlyMarineConditions.startHourlyMarineConditions(_:), (uint64_t)static WK2_HourlyMarineConditions.add(metadata:_:), (uint64_t)static WK2_HourlyMarineConditions.addVectorOf(hours:_:), (uint64_t)static WK2_HourlyMarineConditions.add(closestWaterLocation:_:), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_261719B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_117();
  a23 = v24;
  a24 = v25;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  Swift::Int v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  int v37 = *v36;
  int v39 = *v38;
  int v41 = *v40;
  Swift::UInt32 v43 = v42();
  a12 = v37;
  v31(&a12, v33);
  a11 = v39;
  v29(&a11, v33);
  a10 = v41;
  v27(&a10, v33);
  *uint64_t v35 = FlatBufferBuilder.endTable(at:)(v43);
  OUTLINED_FUNCTION_116();
}

void sub_261719C2C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v3);
  if (!v2)
  {
    sub_26170C1D8();
    sub_261706814();
    sub_261715B38(8u, 0xD000000000000014, 0x800000026173F0C0, 0);
    swift_release();
  }
}

void static WK2_HourlyMarineConditions.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v12, v13);
  if (!v8)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_97();
    unsigned __int16 v9 = OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_257(v9, v10, v11);
    swift_release();
  }
}

void sub_261719DD4(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void static WK2_TideEvents.add(metadata:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_TideEvents.addVectorOf(events:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_TideEvents.addVectorOf(hours:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_TideEvents.add(tideStationName:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710574();
}

void static WK2_TideEvents.add(closestWaterLocation:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710454();
}

uint64_t static WK2_TideEvents.createTideEvents(_:metadataOffset:eventsVectorOffset:hoursVectorOffset:tideStationNameOffset:closestWaterLocationOffset:)@<X0>(_DWORD *a1@<X8>)
{
  static WK2_TideEvents.startTideEvents(_:)();
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_137();
  OUTLINED_FUNCTION_191();
  OUTLINED_FUNCTION_232();
  OUTLINED_FUNCTION_231();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v1);
  *a1 = result;
  return result;
}

void sub_26171A040(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v3);
  if (!v2)
  {
    sub_26170C1D8();
    sub_261706814();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_261715B38(0xCu, 0xD000000000000014, 0x800000026173F0C0, 0);
    swift_release();
  }
}

void static WK2_TideEvents.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v12, v13);
  if (!v8)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_97();
    OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_98();
    unsigned __int16 v9 = OUTLINED_FUNCTION_240();
    OUTLINED_FUNCTION_257(v9, v10, v11);
    swift_release();
  }
}

void sub_26171A2F4(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void static WK2_Location.add(latitude:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617263E4();
}

void static WK2_Location.add(longitude:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

uint64_t static WK2_Location.createLocation(_:latitude:longitude:)@<X0>(_DWORD *a1@<X8>)
{
  Swift::UInt32 v2 = static WK2_HourTide.startHourTide(_:)();
  static WK2_Location.add(latitude:_:)();
  OUTLINED_FUNCTION_219();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v2);
  *a1 = result;
  return result;
}

void static WK2_Location.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void sub_26171A44C(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void static WK2_Pollutant.add(amount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

#error "26171A4D8: call analysis failed (funcsize=86)"

uint64_t sub_26171A624()
{
  return static WK2_Pollutant.verify<A>(_:at:of:)();
}

void WK2_PrecipitationRange.precipitationType.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 5u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 4);
  int v6 = v4 + 4;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_WeatherCondition.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_179();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void static WK2_PrecipitationRange.add(precipitationType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261703290();
}

void static WK2_PrecipitationRange.add(expected:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

void static WK2_PrecipitationRange.add(minimumSnow:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261702C30();
}

void static WK2_PrecipitationRange.add(maximumSnow:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261702D28();
}

void static WK2_PrecipitationRange.add(expectedSnow:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171DA28();
}

uint64_t static WK2_PrecipitationRange.createPrecipitationRange(_:precipitationType:expected:minimumSnow:maximumSnow:expectedSnow:)()
{
  OUTLINED_FUNCTION_221();
  uint64_t v2 = v1;
  static WK2_TideEvents.startTideEvents(_:)();
  OUTLINED_FUNCTION_246();
  OUTLINED_FUNCTION_222();
  static WK2_HourTide.add(height:_:)();
  OUTLINED_FUNCTION_220();
  static WK2_ForecastMinute.add(precipitationIntensity:_:)();
  OUTLINED_FUNCTION_186();
  static WK2_ForecastMinute.add(perceivedPrecipitationIntensity:_:)();
  static WK2_PrecipitationRange.add(expectedSnow:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v0);
  *uint64_t v2 = result;
  return result;
}

void sub_26171A8F4(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v35);
  if (!v2)
  {
    unint64_t v3 = v37;
    if (v37 < 5) {
      goto LABEL_51;
    }
    uint64_t v4 = v36 + 4;
    if (v38 == 1 && ((*(_DWORD *)(v39 + 24) + v4) & 1) != 0) {
      goto LABEL_49;
    }
    Verifier.rangeInBuffer(position:size:)(v36 + 4, 2);
    if (v5) {
      goto LABEL_51;
    }
    if (*(_WORD *)(*(void *)(v39 + 24) + v4))
    {
      Verifier.rangeInBuffer(position:size:)(v35 + *(unsigned __int16 *)(*(void *)(v39 + 24) + v4), 1);
      if (v6) {
        goto LABEL_51;
      }
    }
    if (v3 < 7) {
      goto LABEL_51;
    }
    uint64_t v4 = v36 + 6;
    int v7 = v38;
    if (v38 == 1 && ((*(_DWORD *)(v39 + 24) + v4) & 1) != 0) {
      goto LABEL_49;
    }
    Verifier.rangeInBuffer(position:size:)(v36 + 6, 2);
    if (v8) {
      goto LABEL_51;
    }
    uint64_t v9 = *(void *)(v39 + 24);
    uint64_t v10 = *(unsigned __int16 *)(v9 + v4);
    if (*(_WORD *)(v9 + v4))
    {
      uint64_t v4 = v35 + v10;
      if ((((_BYTE)v9 + (_BYTE)v35 + (_BYTE)v10) & 3) != 0) {
        int v11 = v7;
      }
      else {
        int v11 = 0;
      }
      if (v11 == 1) {
        goto LABEL_17;
      }
      Verifier.rangeInBuffer(position:size:)(v35 + v10, 4);
      if (v13) {
        goto LABEL_51;
      }
    }
    if (v3 < 9)
    {
LABEL_51:
      swift_release();
      return;
    }
    uint64_t v4 = v36 + 8;
    int v14 = v38;
    if (v38 == 1 && ((*(_DWORD *)(v39 + 24) + v4) & 1) != 0)
    {
LABEL_49:
      uint64_t v40 = MEMORY[0x263F8E888];
      uint64_t v12 = &qword_26A92AB70;
      goto LABEL_50;
    }
    Verifier.rangeInBuffer(position:size:)(v36 + 8, 2);
    if (v15) {
      goto LABEL_51;
    }
    uint64_t v16 = *(void *)(v39 + 24);
    uint64_t v17 = *(unsigned __int16 *)(v16 + v4);
    if (*(_WORD *)(v16 + v4))
    {
      uint64_t v4 = v35 + v17;
      if ((((_BYTE)v16 + (_BYTE)v35 + (_BYTE)v17) & 3) != 0) {
        int v18 = v14;
      }
      else {
        int v18 = 0;
      }
      if (v18 == 1) {
        goto LABEL_17;
      }
      Verifier.rangeInBuffer(position:size:)(v35 + v17, 4);
      if (v19) {
        goto LABEL_51;
      }
    }
    if (v3 < 0xB) {
      goto LABEL_51;
    }
    uint64_t v4 = v36 + 10;
    int v20 = v38;
    if (v38 == 1 && ((*(_DWORD *)(v39 + 24) + v4) & 1) != 0) {
      goto LABEL_49;
    }
    Verifier.rangeInBuffer(position:size:)(v36 + 10, 2);
    if (v21) {
      goto LABEL_51;
    }
    uint64_t v22 = *(void *)(v39 + 24);
    uint64_t v23 = *(unsigned __int16 *)(v22 + v4);
    if (!*(_WORD *)(v22 + v4)) {
      goto LABEL_39;
    }
    uint64_t v4 = v35 + v23;
    if ((((_BYTE)v22 + (_BYTE)v35 + (_BYTE)v23) & 3) != 0) {
      int v24 = v20;
    }
    else {
      int v24 = 0;
    }
    if (v24 != 1)
    {
      Verifier.rangeInBuffer(position:size:)(v35 + v23, 4);
      if (v25) {
        goto LABEL_51;
      }
LABEL_39:
      if (v3 < 0xD) {
        goto LABEL_51;
      }
      uint64_t v4 = v36 + 12;
      int v26 = v38;
      if (v38 != 1 || ((*(_DWORD *)(v39 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v36 + 12, 2);
        if (v27) {
          goto LABEL_51;
        }
        uint64_t v28 = *(void *)(v39 + 24);
        uint64_t v29 = *(unsigned __int16 *)(v28 + v4);
        if (!*(_WORD *)(v28 + v4)) {
          goto LABEL_51;
        }
        uint64_t v4 = v35 + v29;
        if ((((_BYTE)v28 + (_BYTE)v35 + (_BYTE)v29) & 3) != 0) {
          int v30 = v26;
        }
        else {
          int v30 = 0;
        }
        if (v30 == 1) {
          goto LABEL_17;
        }
        Verifier.rangeInBuffer(position:size:)(v35 + v29, 4);
        goto LABEL_51;
      }
      goto LABEL_49;
    }
LABEL_17:
    uint64_t v40 = MEMORY[0x263F8D5C8];
    uint64_t v12 = &qword_26A92AB88;
LABEL_50:
    __swift_instantiateConcreteTypeFromMangledName(v12);
    uint64_t v31 = sub_26173BC20();
    uint64_t v33 = v32;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v34 = v4;
    *(void *)(v34 + 8) = v31;
    *(void *)(v34 + 16) = v33;
    *(_OWORD *)(v34 + 24) = 0u;
    *(_OWORD *)(v34 + 40) = 0u;
    *(_OWORD *)(v34 + 49) = 0u;
    swift_willThrow();
    goto LABEL_51;
  }
}

#error "26171AC84: call analysis failed (funcsize=127)"

uint64_t sub_26171AE74()
{
  return static WK2_PrecipitationRange.verify<A>(_:at:of:)();
}

void WK2_DayWeatherConditions.hasPrecipitationAmountByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x19u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 24)) {
    goto LABEL_7;
  }
}

void WK2_DayWeatherConditions.precipitationAmountByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x19)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 24);
  int v5 = v3 + 24;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void static WK2_DayWeatherConditions.add(forecastEnd:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261712F40();
}

void static WK2_DayWeatherConditions.add(conditionCode:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617216A4();
}

void static WK2_DayWeatherConditions.add(humidityMin:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700400();
}

void static WK2_DayWeatherConditions.add(moonrise:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_132(v12);
    }
    OUTLINED_FUNCTION_101(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(moonset:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_159(v12);
    }
    OUTLINED_FUNCTION_100(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(precipitationType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261701B5C();
}

void static WK2_DayWeatherConditions.add(sunrise:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 36;
    }
    OUTLINED_FUNCTION_148(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunriseCivil:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 38;
    }
    OUTLINED_FUNCTION_156(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunriseNautical:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_215(v12);
    }
    OUTLINED_FUNCTION_123(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunriseAstronomical:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_131(v12);
    }
    OUTLINED_FUNCTION_99(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunset:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_211(v12);
    }
    OUTLINED_FUNCTION_127(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunsetCivil:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_210(v12);
    }
    OUTLINED_FUNCTION_126(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunsetNautical:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 48;
    }
    OUTLINED_FUNCTION_202(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(sunsetAstronomical:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_206(v12);
    }
    OUTLINED_FUNCTION_151(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(temperatureMaxTime:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_209(v12);
    }
    OUTLINED_FUNCTION_154(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(temperatureMinTime:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 58;
    }
    OUTLINED_FUNCTION_199(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayWeatherConditions.add(restOfDayForecast:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 74;
    }
    OUTLINED_FUNCTION_197(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

uint64_t static WK2_DayWeatherConditions.createDayWeatherConditions(_:forecastStart:forecastEnd:conditionCode:humidityMax:humidityMin:maxUvIndex:moonPhase:moonrise:moonset:precipitationAmount:precipitationAmountByTypeVectorOffset:precipitationChance:precipitationType:snowfallAmount:solarMidnight:solarNoon:sunrise:sunriseCivil:sunriseNautical:sunriseAstronomical:sunset:sunsetCivil:sunsetNautical:sunsetAstronomical:temperatureMax:temperatureMaxTime:temperatureMin:temperatureMinTime:windGustSpeedMax:windSpeedAvg:windSpeedMax:visibilityMax:visibilityMin:daytimeForecastOffset:overnightForecastOffset:restOfDayForecastOffset:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>, unint64_t a3, unint64_t a4, int *a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int *a21,int *a22,int *a23)
{
  int v25 = *a5;
  int v26 = *a21;
  int v27 = *a22;
  int v28 = *a23;
  static WK2_DayWeatherConditions.startDayWeatherConditions(_:)(a1);
  Swift::UInt32 at = v23;
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  OUTLINED_FUNCTION_253();
  static WK2_CurrentWeather.add(asOf:_:)();
  static WK2_DayWeatherConditions.add(conditionCode:_:)();
  OUTLINED_FUNCTION_252();
  static WK2_CurrentWeather.add(cloudCoverLowAltPct:_:)();
  static WK2_CurrentWeather.add(cloudCoverMidAltPct:_:)();
  static WK2_CurrentWeather.add(cloudCoverHighAltPct:_:)();
  static WK2_CurrentWeather.add(conditionCode:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(a3) & 1);
  static WK2_DayWeatherConditions.add(moonrise:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(a4) & 1);
  static WK2_DayWeatherConditions.add(moonset:_:)();
  static WK2_CurrentWeather.add(perceivedPrecipitationIntensity:_:)();
  OUTLINED_FUNCTION_178(v25);
  static WK2_Weather.add(marineForecast:_:)();
  static WK2_DayWeatherConditions.add(precipitationChance:_:)();
  static WK2_DayWeatherConditions.add(precipitationType:_:)();
  OUTLINED_FUNCTION_249();
  static WK2_CurrentWeather.add(precipitationAmountNext1h:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(a8) & 1);
  static WK2_DayWeatherConditions.add(solarMidnight:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(solarNoon:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunrise:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunriseCivil:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunriseNautical:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunriseAstronomical:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunset:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunsetCivil:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunsetNautical:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(sunsetAstronomical:_:)();
  OUTLINED_FUNCTION_248();
  static WK2_DayWeatherConditions.add(temperatureMax:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(temperatureMaxTime:_:)();
  static WK2_CurrentWeather.add(snowfallAmount6h:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_DayWeatherConditions.add(temperatureMinTime:_:)();
  OUTLINED_FUNCTION_251();
  static WK2_CurrentWeather.add(snowfallAmountNext1h:_:)();
  OUTLINED_FUNCTION_222();
  static WK2_CurrentWeather.add(snowfallAmountNext6h:_:)();
  OUTLINED_FUNCTION_186();
  static WK2_CurrentWeather.add(snowfallAmountNext24h:_:)();
  static WK2_CurrentWeather.add(temperature:_:)();
  OUTLINED_FUNCTION_220();
  static WK2_CurrentWeather.add(temperatureApparent:_:)();
  OUTLINED_FUNCTION_178(v26);
  static WK2_DayWeatherConditions.add(daytimeForecast:_:)();
  OUTLINED_FUNCTION_178(v27);
  static WK2_DayWeatherConditions.add(overnightForecast:_:)();
  OUTLINED_FUNCTION_178(v28);
  static WK2_DayWeatherConditions.add(restOfDayForecast:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

#error "26171BF88: call analysis failed (funcsize=442)"

uint64_t sub_26171C70C()
{
  return static WK2_DayWeatherConditions.verify<A>(_:at:of:)();
}

void static WK2_HourWeatherConditions.add(precipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261713470();
}

void static WK2_HourWeatherConditions.add(pressure:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EBB0();
}

void static WK2_HourWeatherConditions.add(pressureTrend:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171FC18();
}

void static WK2_HourWeatherConditions.add(snowfallIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617130E0();
}

void static WK2_HourWeatherConditions.add(snowfallAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261723EF0();
}

void static WK2_HourWeatherConditions.add(temperatureApparent:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704C78();
}

void static WK2_HourWeatherConditions.add(reserved0:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_131(v12);
    }
    OUTLINED_FUNCTION_99(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_HourWeatherConditions.add(temperatureDewPoint:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261704B80();
}

uint64_t static WK2_HourWeatherConditions.createHourWeatherConditions(_:forecastStart:cloudCover:cloudCoverLowAltPct:cloudCoverMidAltPct:cloudCoverHighAltPct:conditionCode:daylight:humidity:perceivedPrecipitationIntensity:precipitationAmount:precipitationIntensity:precipitationChance:precipitationType:pressure:pressureTrend:snowfallIntensity:snowfallAmount:temperature:temperatureApparent:reserved0:temperatureDewPoint:uvIndex:visibility:windDirection:windGust:windSpeed:)()
{
  OUTLINED_FUNCTION_221();
  char v5 = v0;
  static WK2_HourWeatherConditions.startHourWeatherConditions(_:)(v1);
  Swift::UInt32 at = v2;
  OUTLINED_FUNCTION_243();
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  OUTLINED_FUNCTION_254();
  static WK2_HourWeatherConditions.add(cloudCover:_:)();
  static WK2_CurrentWeather.add(cloudCover:_:)();
  static WK2_CurrentWeather.add(cloudCoverLowAltPct:_:)();
  OUTLINED_FUNCTION_253();
  static WK2_CurrentWeather.add(cloudCoverMidAltPct:_:)();
  static WK2_HourWeatherConditions.add(conditionCode:_:)();
  OUTLINED_FUNCTION_252();
  static WK2_HourWeatherConditions.add(daylight:_:)();
  static WK2_HourWeatherConditions.add(humidity:_:)();
  OUTLINED_FUNCTION_222();
  static WK2_HourWeatherConditions.add(perceivedPrecipitationIntensity:_:)();
  OUTLINED_FUNCTION_220();
  static WK2_CurrentWeather.add(perceivedPrecipitationIntensity:_:)();
  OUTLINED_FUNCTION_186();
  static WK2_CurrentWeather.add(precipitationAmount1h:_:)();
  static WK2_DayWeatherConditions.add(precipitationChance:_:)();
  static WK2_DayWeatherConditions.add(precipitationType:_:)();
  static WK2_CurrentWeather.add(precipitationAmountNext1h:_:)();
  static WK2_WeatherAlertSummary.add(severity:_:)();
  OUTLINED_FUNCTION_249();
  static WK2_CurrentWeather.add(precipitationAmountNext24h:_:)();
  OUTLINED_FUNCTION_248();
  static WK2_HourWeatherConditions.add(snowfallAmount:_:)();
  static WK2_HourWeatherConditions.add(temperature:_:)();
  static WK2_HourWeatherConditions.add(temperatureApparent:_:)();
  OUTLINED_FUNCTION_54();
  static WK2_HourWeatherConditions.add(reserved0:_:)();
  OUTLINED_FUNCTION_251();
  static WK2_HourWeatherConditions.add(temperatureDewPoint:_:)();
  static WK2_HourWeatherConditions.add(uvIndex:_:)();
  static WK2_CurrentWeather.add(precipitationIntensity:_:)();
  static WK2_HourWeatherConditions.add(windDirection:_:)();
  static WK2_DayWeatherConditions.add(temperatureMax:_:)();
  static WK2_CurrentWeather.add(snowfallAmount1h:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *char v5 = result;
  return result;
}

void static WK2_HourWeatherConditions.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v34, v36);
  if (!v8)
  {
    OUTLINED_FUNCTION_119();
    if (v10 == v11)
    {
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_2_0();
      if (v12) {
        OUTLINED_FUNCTION_64(v12, v35, v37);
      }
      if (v9 > 6)
      {
        OUTLINED_FUNCTION_24();
        OUTLINED_FUNCTION_2_0();
        if (v13) {
          OUTLINED_FUNCTION_4(v13, v35, v37);
        }
        if (v9 > 8)
        {
          OUTLINED_FUNCTION_24();
          OUTLINED_FUNCTION_2_0();
          if (v14) {
            OUTLINED_FUNCTION_4(v14, v35, v37);
          }
          if (v9 > 0xA)
          {
            OUTLINED_FUNCTION_24();
            OUTLINED_FUNCTION_2_0();
            if (v15) {
              OUTLINED_FUNCTION_4(v15, v35, v37);
            }
            if (v9 > 0xC)
            {
              OUTLINED_FUNCTION_24();
              OUTLINED_FUNCTION_2_0();
              if (v16) {
                OUTLINED_FUNCTION_4(v16, v35, v37);
              }
              if (v9 > 0xE)
              {
                OUTLINED_FUNCTION_24();
                OUTLINED_FUNCTION_2_0();
                if (v17) {
                  OUTLINED_FUNCTION_4(v17, v35, v37);
                }
                if (v9 > 0x10)
                {
                  OUTLINED_FUNCTION_24();
                  OUTLINED_FUNCTION_2_0();
                  if (v18) {
                    OUTLINED_FUNCTION_4(v18, v35, v37);
                  }
                  if (v9 > 0x12)
                  {
                    OUTLINED_FUNCTION_24();
                    OUTLINED_FUNCTION_2_0();
                    if (v19) {
                      OUTLINED_FUNCTION_4(v19, v35, v37);
                    }
                    if (v9 > 0x14)
                    {
                      OUTLINED_FUNCTION_24();
                      OUTLINED_FUNCTION_2_0();
                      if (v20) {
                        OUTLINED_FUNCTION_39(v20, v35, v37);
                      }
                      if (v9 > 0x16)
                      {
                        OUTLINED_FUNCTION_24();
                        OUTLINED_FUNCTION_2_0();
                        if (v21) {
                          OUTLINED_FUNCTION_39(v21, v35, v37);
                        }
                        if (v9 > 0x18)
                        {
                          OUTLINED_FUNCTION_24();
                          OUTLINED_FUNCTION_2_0();
                          if (v22) {
                            OUTLINED_FUNCTION_39(v22, v35, v37);
                          }
                          if (v9 > 0x1A)
                          {
                            OUTLINED_FUNCTION_24();
                            OUTLINED_FUNCTION_2_0();
                            if (v23) {
                              OUTLINED_FUNCTION_4(v23, v35, v37);
                            }
                            if (v9 > 0x1C)
                            {
                              OUTLINED_FUNCTION_24();
                              OUTLINED_FUNCTION_2_0();
                              if (v24) {
                                OUTLINED_FUNCTION_4(v24, v35, v37);
                              }
                              if (v9 > 0x1E)
                              {
                                OUTLINED_FUNCTION_24();
                                OUTLINED_FUNCTION_2_0();
                                if (v25) {
                                  OUTLINED_FUNCTION_39(v25, v35, v37);
                                }
                                if (v9 > 0x20)
                                {
                                  OUTLINED_FUNCTION_24();
                                  OUTLINED_FUNCTION_2_0();
                                  if (v26) {
                                    OUTLINED_FUNCTION_4(v26, v35, v37);
                                  }
                                  if (v9 > 0x22)
                                  {
                                    OUTLINED_FUNCTION_24();
                                    OUTLINED_FUNCTION_2_0();
                                    if (v27) {
                                      OUTLINED_FUNCTION_39(v27, v35, v37);
                                    }
                                    if (v9 >= 0x25)
                                    {
                                      OUTLINED_FUNCTION_24();
                                      OUTLINED_FUNCTION_2_0();
                                      if (v28) {
                                        OUTLINED_FUNCTION_39(v28, v35, v37);
                                      }
                                      if (v9 > 0x26)
                                      {
                                        OUTLINED_FUNCTION_24();
                                        OUTLINED_FUNCTION_2_0();
                                        if (v29) {
                                          OUTLINED_FUNCTION_39(v29, v35, v37);
                                        }
                                        if (v9 > 0x28)
                                        {
                                          OUTLINED_FUNCTION_24();
                                          OUTLINED_FUNCTION_2_0();
                                          if (v30) {
                                            OUTLINED_FUNCTION_39(v30, v35, v37);
                                          }
                                          if (v9 > 0x2A)
                                          {
                                            OUTLINED_FUNCTION_24();
                                            OUTLINED_FUNCTION_2_0();
                                            if (v31) {
                                              OUTLINED_FUNCTION_39(v31, v35, v37);
                                            }
                                            if (v9 >= 0x2D)
                                            {
                                              OUTLINED_FUNCTION_24();
                                              OUTLINED_FUNCTION_2_0();
                                              if (v32) {
                                                OUTLINED_FUNCTION_39(v32, v35, v37);
                                              }
                                              if (v9 > 0x2E)
                                              {
                                                OUTLINED_FUNCTION_24();
                                                OUTLINED_FUNCTION_2_0();
                                                if (v33) {
                                                  OUTLINED_FUNCTION_4(v33, v35, v37);
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_141(0x32u);
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_177();
    OUTLINED_FUNCTION_67();
    swift_release();
  }
}

void sub_26171D19C(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _s11WeatherData20WK2_NextHourForecastV10hasMinutesSbvg_0()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0xFu)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 14)) {
    goto LABEL_7;
  }
}

void static WK2_ForecastCondition.add(endTime:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171D850();
}

void static WK2_ForecastCondition.add(forecastToken:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617216A4();
}

void static WK2_ForecastCondition.add(beginCondition:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261722284();
}

void static WK2_ForecastCondition.add(endCondition:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172183C();
}

void static WK2_ForecastCondition.createForecastCondition(_:startTime:endTime:forecastToken:beginCondition:endCondition:parametersVectorOffset:)()
{
  OUTLINED_FUNCTION_117();
  int v1 = v0;
  Swift::UInt32 v2 = static WK2_LocationInfo.startLocationInfo(_:)();
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  OUTLINED_FUNCTION_260();
  static WK2_DayWeatherConditions.add(conditionCode:_:)();
  static WK2_TrendDeviation.add(minTemperatureChange:_:)();
  static WK2_TrendDeviation.add(dayPrecipitationChange:_:)();
  static WK2_Weather.add(news:_:)();
  *int v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_116();
}

#error "26171D420: call analysis failed (funcsize=131)"

uint64_t sub_26171D634()
{
  return static WK2_ForecastCondition.verify<A>(_:at:of:)();
}

void WK2_ForecastPeriodSummary.condition.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 9u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 8);
  int v6 = v4 + 8;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_WeatherCondition.init(rawValue:)(*(unsigned char *)(v2 + v8));
    OUTLINED_FUNCTION_179();
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void _s11WeatherData22WK2_PrecipitationRangeV12expectedSnowSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xDu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void _s11WeatherData14WK2_TideEventsV05startdE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 40);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void static WK2_ForecastPeriodSummary.add(startTime:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_ForecastPeriodSummary.add(endTime:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171D850();
}

void sub_26171D850()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_158(v12);
    }
    OUTLINED_FUNCTION_102(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_ForecastPeriodSummary.add(condition:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617216A4();
}

void static WK2_ForecastPeriodSummary.add(precipitationChance:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700184();
}

void static WK2_ForecastPeriodSummary.add(precipitationIntensity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171DA28();
}

void sub_26171DA28()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_205(v12);
    }
    OUTLINED_FUNCTION_89(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_23;
  }
  __break(1u);
}

uint64_t static WK2_ForecastPeriodSummary.createForecastPeriodSummary(_:startTime:endTime:condition:precipitationChance:precipitationIntensity:)@<X0>(_DWORD *a1@<X8>)
{
  Swift::UInt32 v2 = static WK2_TideEvents.startTideEvents(_:)();
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  OUTLINED_FUNCTION_260();
  static WK2_DayWeatherConditions.add(conditionCode:_:)();
  static WK2_CurrentWeather.add(cloudCoverLowAltPct:_:)();
  static WK2_PrecipitationRange.add(expectedSnow:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v2);
  *a1 = result;
  return result;
}

void sub_26171DBC8(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v31);
  if (!v2)
  {
    unint64_t v3 = v33;
    if (v33 < 5) {
      goto LABEL_47;
    }
    uint64_t v4 = v32 + 4;
    int v5 = v34;
    if (v34 != 1 || ((*(_DWORD *)(v35 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v32 + 4, 2);
      if (v6) {
        goto LABEL_47;
      }
      uint64_t v7 = *(void *)(v35 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v31 + v8;
        if ((((_BYTE)v7 + (_BYTE)v31 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v31 + v8, 4);
        if (v11) {
          goto LABEL_47;
        }
      }
      if (v3 < 7) {
        goto LABEL_47;
      }
      uint64_t v4 = v32 + 6;
      int v12 = v34;
      if (v34 != 1 || ((*(_DWORD *)(v35 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v32 + 6, 2);
        if (!v13)
        {
          uint64_t v14 = *(void *)(v35 + 24);
          uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
          if (!*(_WORD *)(v14 + v4)) {
            goto LABEL_23;
          }
          uint64_t v4 = v31 + v15;
          if ((((_BYTE)v14 + (_BYTE)v31 + (_BYTE)v15) & 3) != 0) {
            int v16 = v12;
          }
          else {
            int v16 = 0;
          }
          if (v16 == 1)
          {
LABEL_11:
            uint64_t v36 = MEMORY[0x263F8E8F8];
            uint64_t v10 = &qword_26A92AB80;
LABEL_46:
            __swift_instantiateConcreteTypeFromMangledName(v10);
            uint64_t v27 = sub_26173BC20();
            uint64_t v29 = v28;
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v30 = v4;
            *(void *)(v30 + 8) = v27;
            *(void *)(v30 + 16) = v29;
            *(_OWORD *)(v30 + 24) = 0u;
            *(_OWORD *)(v30 + 40) = 0u;
            *(_OWORD *)(v30 + 49) = 0u;
            swift_willThrow();
            goto LABEL_47;
          }
          Verifier.rangeInBuffer(position:size:)(v31 + v15, 4);
          if (!v17)
          {
LABEL_23:
            if (v3 >= 9)
            {
              uint64_t v4 = v32 + 8;
              if (v34 != 1 || ((*(_DWORD *)(v35 + 24) + v4) & 1) == 0)
              {
                Verifier.rangeInBuffer(position:size:)(v32 + 8, 2);
                if (v18) {
                  goto LABEL_47;
                }
                if (*(_WORD *)(*(void *)(v35 + 24) + v4))
                {
                  Verifier.rangeInBuffer(position:size:)(v31 + *(unsigned __int16 *)(*(void *)(v35 + 24) + v4), 1);
                  if (v19) {
                    goto LABEL_47;
                  }
                }
                if (v3 < 0xB) {
                  goto LABEL_47;
                }
                uint64_t v4 = v32 + 10;
                if (v34 != 1 || ((*(_DWORD *)(v35 + 24) + v4) & 1) == 0)
                {
                  Verifier.rangeInBuffer(position:size:)(v32 + 10, 2);
                  if (v20) {
                    goto LABEL_47;
                  }
                  if (*(_WORD *)(*(void *)(v35 + 24) + v4))
                  {
                    Verifier.rangeInBuffer(position:size:)(v31 + *(unsigned __int16 *)(*(void *)(v35 + 24) + v4), 1);
                    if (v21) {
                      goto LABEL_47;
                    }
                  }
                  if (v3 < 0xD) {
                    goto LABEL_47;
                  }
                  uint64_t v4 = v32 + 12;
                  int v22 = v34;
                  if (v34 != 1 || ((*(_DWORD *)(v35 + 24) + v4) & 1) == 0)
                  {
                    Verifier.rangeInBuffer(position:size:)(v32 + 12, 2);
                    if (v23) {
                      goto LABEL_47;
                    }
                    uint64_t v24 = *(void *)(v35 + 24);
                    uint64_t v25 = *(unsigned __int16 *)(v24 + v4);
                    if (!*(_WORD *)(v24 + v4)) {
                      goto LABEL_47;
                    }
                    uint64_t v4 = v31 + v25;
                    if ((((_BYTE)v24 + (_BYTE)v31 + (_BYTE)v25) & 3) != 0) {
                      int v26 = v22;
                    }
                    else {
                      int v26 = 0;
                    }
                    if (v26 != 1)
                    {
                      Verifier.rangeInBuffer(position:size:)(v31 + v25, 4);
                      goto LABEL_47;
                    }
                    uint64_t v36 = MEMORY[0x263F8D5C8];
                    uint64_t v10 = &qword_26A92AB88;
                    goto LABEL_46;
                  }
                }
              }
              goto LABEL_45;
            }
          }
        }
LABEL_47:
        swift_release();
        return;
      }
    }
LABEL_45:
    uint64_t v36 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_46;
  }
}

#error "26171DF58: call analysis failed (funcsize=129)"

uint64_t sub_26171E154()
{
  return static WK2_ForecastPeriodSummary.verify<A>(_:at:of:)();
}

uint64_t static WK2_ForecastMinute.createForecastMinute(_:startTime:precipitationChance:precipitationIntensity:perceivedPrecipitationIntensity:)()
{
  OUTLINED_FUNCTION_259();
  static WK2_WeatherChanges.startWeatherChanges(_:)();
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  static WK2_HourWeatherConditions.add(cloudCover:_:)();
  static WK2_ForecastMinute.add(precipitationIntensity:_:)();
  static WK2_ForecastMinute.add(perceivedPrecipitationIntensity:_:)();
  uint64_t result = OUTLINED_FUNCTION_244();
  *uint64_t v0 = result;
  return result;
}

#error "26171E208: call analysis failed (funcsize=113)"

uint64_t sub_26171E3C4()
{
  return static WK2_ForecastMinute.verify<A>(_:at:of:)();
}

void _s11WeatherData20WK2_PeriodicForecastV12periodLengths5UInt8Vvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 5u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 4);
    int v4 = v2 + 4;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_NewsPlacement.placement.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 9u)
  {
LABEL_9:
    char v9 = 0;
LABEL_10:
    *a1 = v9;
    return;
  }
  BOOL v5 = __OFADD__(v4, 8);
  int v6 = v4 + 8;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_9;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    WK2_Placement.init(rawValue:)(*(unsigned char *)(v2 + v8));
    char v9 = v10;
    if (v10 == 15) {
      char v9 = 0;
    }
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
}

void static WK2_NewsPlacement.add(priority:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171E518();
}

void sub_26171E518()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_129(v8);
    }
    OUTLINED_FUNCTION_91(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_NewsPlacement.addVectorOf(articles:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_NewsPlacement.add(placement:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617216A4();
}

void static WK2_NewsPlacement.createNewsPlacement(_:priority:articlesVectorOffset:placement:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_174();
  Swift::UInt32 v1 = static WK2_WeatherAlertCollection.startWeatherAlertCollection(_:)();
  static WK2_NewsPlacement.add(priority:_:)();
  OUTLINED_FUNCTION_137();
  static WK2_DayWeatherConditions.add(conditionCode:_:)();
  *uint64_t v0 = FlatBufferBuilder.endTable(at:)(v1);
  OUTLINED_FUNCTION_20();
}

void sub_26171E71C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v13);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v4 = v15;
    if (v15 >= 5)
    {
      uint64_t v5 = v14 + 4;
      if (v16 == 1 && ((*(_DWORD *)(v17 + 24) + v5) & 1) != 0) {
        goto LABEL_15;
      }
      Verifier.rangeInBuffer(position:size:)(v14 + 4, 2);
      uint64_t v3 = v6;
      if (v6) {
        goto LABEL_16;
      }
      if (*(_WORD *)(*(void *)(v17 + 24) + v5))
      {
        Verifier.rangeInBuffer(position:size:)(v13 + *(unsigned __int16 *)(*(void *)(v17 + 24) + v5), 1);
        uint64_t v3 = v7;
        if (v7) {
          goto LABEL_16;
        }
      }
    }
    sub_261706814();
    if (v3 || v4 < 9) {
      goto LABEL_16;
    }
    uint64_t v5 = v14 + 8;
    if (v16 != 1 || ((*(_DWORD *)(v17 + 24) + v5) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v14 + 8, 2);
      if (!v8)
      {
        if (*(_WORD *)(*(void *)(v17 + 24) + v5)) {
          Verifier.rangeInBuffer(position:size:)(v13 + *(unsigned __int16 *)(*(void *)(v17 + 24) + v5), 1);
        }
      }
      goto LABEL_16;
    }
LABEL_15:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    uint64_t v9 = sub_26173BC20();
    uint64_t v11 = v10;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v12 = v5;
    *(void *)(v12 + 8) = v9;
    *(void *)(v12 + 16) = v11;
    *(_OWORD *)(v12 + 24) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    *(_OWORD *)(v12 + 49) = 0u;
    swift_willThrow();
LABEL_16:
    swift_release();
  }
}

void static WK2_NewsPlacement.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v19, v21);
  if (!v8)
  {
    OUTLINED_FUNCTION_119();
    if (v10 == v11)
    {
      OUTLINED_FUNCTION_68();
      if (v12)
      {
        OUTLINED_FUNCTION_11();
        if (v13) {
          goto LABEL_14;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_2_0();
      if (v14) {
        OUTLINED_FUNCTION_4(v14, v20, v22);
      }
    }
    OUTLINED_FUNCTION_97();
    if (v9 < 9)
    {
LABEL_15:
      swift_release();
      return;
    }
    OUTLINED_FUNCTION_68();
    if (!v12 || (OUTLINED_FUNCTION_11(), (v15 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_2_0();
      if (v16) {
        OUTLINED_FUNCTION_4(v16, v20, v22);
      }
      goto LABEL_15;
    }
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    sub_26173BC20();
    OUTLINED_FUNCTION_87();
    uint64_t v17 = OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_19(v17, v18);
    goto LABEL_15;
  }
}

void sub_26171EA5C(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void *WK2_WeatherAlertSummary.areaIdSegmentArray.getter()
{
  return sub_261716140((void *)6, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *WK2_WeatherAlertSummary.areaNameSegmentArray.getter()
{
  return sub_261716140((void *)8, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void _s11WeatherData14WK2_TideEventsV15tideStationNameSSSgvg_0()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xBu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void *WK2_WeatherAlertSummary.attributionUrlSegmentArray.getter()
{
  return sub_261716140((void *)0xA, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *WK2_WeatherAlertSummary.countryCodeSegmentArray.getter()
{
  return sub_261716140((void *)0xC, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *WK2_WeatherAlertSummary.descriptionSegmentArray.getter()
{
  return sub_261716140((void *)0xE, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void WK2_WeatherAlertSummary.token.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x11u)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 16);
  int v4 = v2 + 16;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

void *WK2_WeatherAlertSummary.tokenSegmentArray.getter()
{
  return sub_261716140((void *)0x10, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void WK2_WeatherAlertSummary.effectiveTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x13u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 18);
    int v4 = v2 + 18;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_WeatherAlertSummary.expireTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x15u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 20);
    int v4 = v2 + 20;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_WeatherAlertSummary.issuedTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x17u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 22);
    int v4 = v2 + 22;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_WeatherAlertSummary.eventOnsetTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x19u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 24);
  int v4 = v2 + 24;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_WeatherAlertSummary.eventEndTime.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x1Bu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 26);
  int v4 = v2 + 26;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5)
  {
    BOOL v3 = __OFADD__(v5, v1);
    int v6 = v5 + v1;
    if (!v3)
    {
      OUTLINED_FUNCTION_28(*(unsigned int *)(v0 + v6));
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_28(0);
}

void WK2_WeatherAlertSummary.detailsUrl.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x1Du) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 28);
  int v4 = v2 + 28;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void *WK2_WeatherAlertSummary.detailsUrlSegmentArray.getter()
{
  return sub_261716140((void *)0x1C, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void WK2_WeatherAlertSummary.phenomenon.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x1Fu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 30);
  int v4 = v2 + 30;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void *WK2_WeatherAlertSummary.phenomenonSegmentArray.getter()
{
  return sub_261716140((void *)0x1E, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void WK2_WeatherAlertSummary.severity.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0x21u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 32);
  int v5 = v3 + 32;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_WeatherAlertSummary.significance.getter(unsigned char *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 0x23u)
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v4, 34);
  int v6 = v4 + 34;
  if (v5)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_7;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (!v5)
  {
    OUTLINED_FUNCTION_143(*(unsigned char *)(v2 + v8));
LABEL_8:
    *a1 = v9;
    return;
  }
LABEL_11:
  __break(1u);
}

void WK2_WeatherAlertSummary.source.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x25u)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 36);
  int v4 = v2 + 36;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

void *WK2_WeatherAlertSummary.sourceSegmentArray.getter()
{
  return sub_261716140((void *)0x24, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void WK2_WeatherAlertSummary.eventSource.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0x27u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 38);
  int v4 = v2 + 38;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void *WK2_WeatherAlertSummary.eventSourceSegmentArray.getter()
{
  return sub_261716140((void *)0x26, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void WK2_WeatherAlertSummary.urgency.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0x29u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 40);
  int v5 = v3 + 40;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_WeatherAlertSummary.certainty.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0x2Bu)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 42);
  int v5 = v3 + 42;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_WeatherAlertSummary.importance.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0x2Du)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 44);
  int v5 = v3 + 44;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void _s11WeatherData011WK2_CurrentA0V39hasPrecipitationAmountPrevious24hByTypeSbvg_0()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x2Fu)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 46)) {
    goto LABEL_7;
  }
}

WeatherData::WK2_AlertResponseType_optional __swiftcall WK2_WeatherAlertSummary.responses(at:)(Swift::Int32 at)
{
  char v2 = v1;
  OUTLINED_FUNCTION_1();
  if (v7)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (*(unsigned __int16 *)(v4 + v6) < 0x2Fu)
  {
LABEL_10:
    char v15 = 0;
    goto LABEL_11;
  }
  BOOL v7 = __OFADD__(v6, 46);
  int v8 = v6 + 46;
  if (v7)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  int v9 = *(__int16 *)(v4 + v8);
  if (!v9) {
    goto LABEL_10;
  }
  BOOL v7 = __OFADD__(v9, v5);
  int v10 = v9 + v5;
  if (v7)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  int v11 = *(_DWORD *)(v4 + v10);
  BOOL v7 = __OFADD__(v10, v11);
  int v12 = v10 + v11;
  if (v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  BOOL v7 = __OFADD__(v12, 4);
  int v13 = v12 + 4;
  if (v7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  BOOL v7 = __OFADD__(v13, v3);
  int v14 = v13 + v3;
  if (v7)
  {
LABEL_17:
    __break(1u);
    return (WeatherData::WK2_AlertResponseType_optional)v3;
  }
  LOBYTE(v3) = WK2_AlertResponseType.init(rawValue:)(*(unsigned char *)(v4 + v14));
  char v15 = v17;
LABEL_11:
  *char v2 = v15;
  return (WeatherData::WK2_AlertResponseType_optional)v3;
}

void static WK2_WeatherAlertSummary.startWeatherAlertSummary(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 176);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void static WK2_WeatherAlertSummary.add(id:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_WeatherAlertSummary.add(areaId:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_WeatherAlertSummary.add(areaName:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_WeatherAlertSummary.add(attributionUrl:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710574();
}

void static WK2_WeatherAlertSummary.add(countryCode:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710454();
}

void static WK2_WeatherAlertSummary.add(description:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617108AC();
}

void static WK2_WeatherAlertSummary.add(token:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261725A78();
}

void static WK2_WeatherAlertSummary.add(effectiveTime:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_132(v14);
    }
    OUTLINED_FUNCTION_101(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(expireTime:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_159(v14);
    }
    OUTLINED_FUNCTION_100(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(issuedTime:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_208(v14);
    }
    OUTLINED_FUNCTION_125(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(eventOnsetTime:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_81(v12);
      *(_WORD *)(v14 + 4) = 24;
    }
    OUTLINED_FUNCTION_153(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(eventEndTime:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v2 & 0x100000000) != 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_20();
    return;
  }
  OUTLINED_FUNCTION_41();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_8_0(v3, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_15(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32)) {
      OUTLINED_FUNCTION_212(v12);
    }
    OUTLINED_FUNCTION_122(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(detailsUrl:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171F984();
}

void sub_26171F984()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 28;
    }
    OUTLINED_FUNCTION_124(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(phenomenon:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 30;
    }
    OUTLINED_FUNCTION_155(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(severity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171FC18();
}

void sub_26171FC18()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_214(v10);
    }
    OUTLINED_FUNCTION_149(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(significance:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_213(v10);
    }
    OUTLINED_FUNCTION_150(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(source:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617145D4();
}

void static WK2_WeatherAlertSummary.add(eventSource:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261714460();
}

void static WK2_WeatherAlertSummary.add(urgency:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_215(v10);
    }
    OUTLINED_FUNCTION_123(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(certainty:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_131(v10);
    }
    OUTLINED_FUNCTION_99(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.add(importance:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_211(v10);
    }
    OUTLINED_FUNCTION_127(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_WeatherAlertSummary.addVectorOf(responses:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261713F8C();
}

uint64_t static WK2_WeatherAlertSummary.createWeatherAlertSummary(_:idOffset:areaIdOffset:areaNameOffset:attributionUrlOffset:countryCodeOffset:descriptionOffset:tokenOffset:effectiveTime:expireTime:issuedTime:eventOnsetTime:eventEndTime:detailsUrlOffset:phenomenonOffset:severity:significance:sourceOffset:eventSourceOffset:urgency:certainty:importance:responsesVectorOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X1>, int *a3@<X2>, int *a4@<X3>, int *a5@<X4>, int *a6@<X5>, int *a7@<X6>, int *a8@<X7>, uint64_t a9@<X8>, uint64_t a10, int a11, unint64_t a12, unint64_t a13, _DWORD *a14, _DWORD *a15, unsigned __int8 *a16, unsigned __int8 *a17, _DWORD *a18, _DWORD *a19, unsigned __int8 *a20,unsigned __int8 *a21,unsigned __int8 *a22,_DWORD *a23)
{
  LODWORD(v200) = a11;
  int v23 = *a2;
  int v24 = *a3;
  int v25 = *a4;
  int v26 = *a5;
  int v27 = *a6;
  int v28 = *a7;
  int v29 = *a8;
  HIDWORD(v200) = *a14;
  LODWORD(v217) = *a15;
  HIDWORD(v217) = *a16;
  LODWORD(v234) = *a17;
  HIDWORD(v234) = *a18;
  LODWORD(v251) = *a19;
  HIDWORD(v251) = *a20;
  LODWORD(v268) = *a21;
  HIDWORD(v268) = *a22;
  LODWORD(v285) = *a23;
  static WK2_WeatherAlertSummary.startWeatherAlertSummary(_:)(a1);
  HIDWORD(v285) = v30;
  OUTLINED_FUNCTION_104(v30, v31, v32, v33, v34, v35, v36, v37, v167, a10, v200, v217, v234, v251, v268, v285, a9, v321, v338,
    v23);
  static WK2_CurrentWeather.add(metadata:_:)();
  OUTLINED_FUNCTION_104(v38, v39, v40, v41, v42, v43, v44, v45, v168, v184, v201, v218, v235, v252, v269, v286, v304, v322, v339,
    v24);
  static WK2_Weather.add(currentWeather:_:)();
  OUTLINED_FUNCTION_104(v46, v47, v48, v49, v50, v51, v52, v53, v169, v185, v202, v219, v236, v253, v270, v287, v305, v323, v340,
    v25);
  static WK2_Weather.add(forecastDaily:_:)();
  OUTLINED_FUNCTION_104(v54, v55, v56, v57, v58, v59, v60, v61, v170, v186, v203, v220, v237, v254, v271, v288, v306, v324, v341,
    v26);
  static WK2_Weather.add(forecastHourly:_:)();
  OUTLINED_FUNCTION_104(v62, v63, v64, v65, v66, v67, v68, v69, v171, v187, v204, v221, v238, v255, v272, v289, v307, v325, v342,
    v27);
  static WK2_Weather.add(forecastNextHour:_:)();
  OUTLINED_FUNCTION_104(v70, v71, v72, v73, v74, v75, v76, v77, v172, v188, v205, v222, v239, v256, v273, v290, v308, v326, v343,
    v28);
  static WK2_Weather.add(news:_:)();
  OUTLINED_FUNCTION_104(v78, v79, v80, v81, v82, v83, v84, v85, v173, v189, v206, v223, v240, v257, v274, v291, v309, v327, v344,
    v29);
  static WK2_Weather.add(weatherAlerts:_:)();
  static WK2_WeatherAlertSummary.add(effectiveTime:_:)();
  static WK2_WeatherAlertSummary.add(expireTime:_:)();
  static WK2_WeatherAlertSummary.add(issuedTime:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(a12) & 1);
  static WK2_WeatherAlertSummary.add(eventOnsetTime:_:)();
  OUTLINED_FUNCTION_93(HIDWORD(a13) & 1);
  static WK2_WeatherAlertSummary.add(eventEndTime:_:)();
  OUTLINED_FUNCTION_104(v86, v87, v88, v89, v90, v91, v92, v93, v174, v190, v207, v224, v241, v258, v275, v292, v310, v328, v345,
    SBYTE4(v207));
  static WK2_Weather.add(forecastPeriodic:_:)();
  OUTLINED_FUNCTION_104(v94, v95, v96, v97, v98, v99, v100, v101, v175, v191, v208, v225, v242, v259, v276, v293, v311, v329, v346,
    v225);
  static WK2_WeatherAlertSummary.add(phenomenon:_:)();
  OUTLINED_FUNCTION_104(v102, v103, v104, v105, v106, v107, v108, v109, v176, v192, v209, v226, v243, v260, v277, v294, v312, v330, v347,
    SBYTE4(v226));
  static WK2_WeatherAlertSummary.add(severity:_:)();
  OUTLINED_FUNCTION_104(v110, v111, v112, v113, v114, v115, v116, v117, v177, v193, v210, v227, v244, v261, v278, v295, v313, v331, v348,
    v244);
  static WK2_WeatherAlertSummary.add(significance:_:)();
  OUTLINED_FUNCTION_104(v118, v119, v120, v121, v122, v123, v124, v125, v178, v194, v211, v228, v245, v262, v279, v296, v314, v332, v349,
    SBYTE4(v245));
  static WK2_CurrentWeather.addVectorOf(precipitationAmountNext1hByType:_:)();
  OUTLINED_FUNCTION_104(v126, v127, v128, v129, v130, v131, v132, v133, v179, v195, v212, v229, v246, v263, v280, v297, v315, v333, v350,
    v263);
  static WK2_CurrentWeather.addVectorOf(precipitationAmountNext6hByType:_:)();
  OUTLINED_FUNCTION_104(v134, v135, v136, v137, v138, v139, v140, v141, v180, v196, v213, v230, v247, v264, v281, v298, v316, v334, v351,
    SBYTE4(v264));
  static WK2_WeatherAlertSummary.add(urgency:_:)();
  OUTLINED_FUNCTION_104(v142, v143, v144, v145, v146, v147, v148, v149, v181, v197, v214, v231, v248, v265, v282, v299, v317, v335, v352,
    v282);
  static WK2_WeatherAlertSummary.add(certainty:_:)();
  OUTLINED_FUNCTION_104(v150, v151, v152, v153, v154, v155, v156, v157, v182, v198, v215, v232, v249, v266, v283, v300, v318, v336, v353,
    SBYTE4(v283));
  static WK2_WeatherAlertSummary.add(importance:_:)();
  OUTLINED_FUNCTION_104(v158, v159, v160, v161, v162, v163, v164, v165, v183, v199, v216, v233, v250, v267, v284, v301, v319, v337, v354,
    v301);
  static WK2_CurrentWeather.addVectorOf(precipitationAmountPrevious24hByType:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  _DWORD *v320 = result;
  return result;
}

void sub_2617203E8(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v57);
  if (!v2)
  {
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    uint64_t v3 = 0;
    unint64_t v4 = v59;
    if (v59 < 19) {
      goto LABEL_56;
    }
    int v5 = v60;
    if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v58 + 18) & 1) != 0)
    {
      uint64_t v62 = MEMORY[0x263F8E888];
      uint64_t v13 = v58 + 18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v14 = sub_26173BC20();
      uint64_t v16 = v15;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v17 = v13;
      *(void *)(v17 + 8) = v14;
      *(void *)(v17 + 16) = v16;
LABEL_91:
      *(_OWORD *)(v17 + 24) = 0u;
      *(_OWORD *)(v17 + 40) = 0u;
      *(_OWORD *)(v17 + 49) = 0u;
      swift_willThrow();
      goto LABEL_3;
    }
    uint64_t v6 = v58 + 18;
    Verifier.rangeInBuffer(position:size:)(v58 + 18, 2);
    uint64_t v3 = v7;
    if (v7) {
      goto LABEL_3;
    }
    uint64_t v8 = *(void *)(v61 + 24);
    uint64_t v9 = *(unsigned __int16 *)(v8 + v6);
    if (*(_WORD *)(v8 + v6))
    {
      int v10 = v5;
      uint64_t v11 = v57 + v9;
      if ((((_BYTE)v8 + (_BYTE)v57 + (_BYTE)v9) & 3) == 0) {
        int v10 = 0;
      }
      if (v10 == 1) {
        goto LABEL_13;
      }
      Verifier.rangeInBuffer(position:size:)(v57 + v9, 4);
      uint64_t v3 = v18;
      if (v18) {
        goto LABEL_3;
      }
    }
    if (v4 <= 0x14) {
      goto LABEL_56;
    }
    uint64_t v11 = v58 + 20;
    int v19 = v60;
    if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
      goto LABEL_89;
    }
    Verifier.rangeInBuffer(position:size:)(v58 + 20, 2);
    uint64_t v3 = v20;
    if (v20) {
      goto LABEL_3;
    }
    uint64_t v21 = *(void *)(v61 + 24);
    uint64_t v22 = *(unsigned __int16 *)(v21 + v11);
    if (*(_WORD *)(v21 + v11))
    {
      uint64_t v11 = v57 + v22;
      if ((((_BYTE)v21 + (_BYTE)v57 + (_BYTE)v22) & 3) != 0) {
        int v23 = v19;
      }
      else {
        int v23 = 0;
      }
      if (v23 == 1) {
        goto LABEL_13;
      }
      Verifier.rangeInBuffer(position:size:)(v57 + v22, 4);
      uint64_t v3 = v24;
      if (v24) {
        goto LABEL_3;
      }
    }
    if (v4 > 0x16)
    {
      uint64_t v11 = v58 + 22;
      int v25 = v60;
      if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
        goto LABEL_89;
      }
      Verifier.rangeInBuffer(position:size:)(v58 + 22, 2);
      uint64_t v3 = v26;
      if (v26) {
        goto LABEL_3;
      }
      uint64_t v27 = *(void *)(v61 + 24);
      uint64_t v28 = *(unsigned __int16 *)(v27 + v11);
      if (*(_WORD *)(v27 + v11))
      {
        uint64_t v11 = v57 + v28;
        if ((((_BYTE)v27 + (_BYTE)v57 + (_BYTE)v28) & 3) != 0) {
          int v29 = v25;
        }
        else {
          int v29 = 0;
        }
        if (v29 == 1) {
          goto LABEL_13;
        }
        Verifier.rangeInBuffer(position:size:)(v57 + v28, 4);
        uint64_t v3 = v30;
        if (v30) {
          goto LABEL_3;
        }
      }
      if (v4 > 0x18)
      {
        uint64_t v11 = v58 + 24;
        int v31 = v60;
        if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
          goto LABEL_89;
        }
        Verifier.rangeInBuffer(position:size:)(v58 + 24, 2);
        uint64_t v3 = v32;
        if (v32) {
          goto LABEL_3;
        }
        uint64_t v33 = *(void *)(v61 + 24);
        uint64_t v34 = *(unsigned __int16 *)(v33 + v11);
        if (*(_WORD *)(v33 + v11))
        {
          uint64_t v11 = v57 + v34;
          if ((((_BYTE)v33 + (_BYTE)v57 + (_BYTE)v34) & 3) != 0) {
            int v35 = v31;
          }
          else {
            int v35 = 0;
          }
          if (v35 == 1) {
            goto LABEL_13;
          }
          Verifier.rangeInBuffer(position:size:)(v57 + v34, 4);
          uint64_t v3 = v36;
          if (v36) {
            goto LABEL_3;
          }
        }
        if (v4 > 0x1A)
        {
          uint64_t v11 = v58 + 26;
          int v37 = v60;
          if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
            goto LABEL_89;
          }
          Verifier.rangeInBuffer(position:size:)(v58 + 26, 2);
          uint64_t v3 = v38;
          if (v38) {
            goto LABEL_3;
          }
          uint64_t v39 = *(void *)(v61 + 24);
          uint64_t v40 = *(unsigned __int16 *)(v39 + v11);
          if (*(_WORD *)(v39 + v11))
          {
            uint64_t v11 = v57 + v40;
            if ((((_BYTE)v39 + (_BYTE)v57 + (_BYTE)v40) & 3) != 0) {
              int v41 = v37;
            }
            else {
              int v41 = 0;
            }
            if (v41 != 1)
            {
              Verifier.rangeInBuffer(position:size:)(v57 + v40, 4);
              uint64_t v3 = v42;
              if (v42) {
                goto LABEL_3;
              }
              goto LABEL_56;
            }
LABEL_13:
            uint64_t v62 = MEMORY[0x263F8E8F8];
            uint64_t v12 = &qword_26A92AB80;
LABEL_90:
            __swift_instantiateConcreteTypeFromMangledName(v12);
            uint64_t v54 = sub_26173BC20();
            uint64_t v56 = v55;
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v17 = v11;
            *(void *)(v17 + 8) = v54;
            *(void *)(v17 + 16) = v56;
            goto LABEL_91;
          }
        }
      }
    }
LABEL_56:
    sub_26170C1D8();
    if (!v3)
    {
      sub_26170C1D8();
      uint64_t v43 = 0;
      if ((uint64_t)v4 >= 33)
      {
        uint64_t v11 = v58 + 32;
        if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
          goto LABEL_89;
        }
        Verifier.rangeInBuffer(position:size:)(v58 + 32, 2);
        uint64_t v43 = v44;
        if (v44) {
          goto LABEL_3;
        }
        if (*(_WORD *)(*(void *)(v61 + 24) + v11))
        {
          Verifier.rangeInBuffer(position:size:)(v57 + *(unsigned __int16 *)(*(void *)(v61 + 24) + v11), 1);
          uint64_t v43 = v45;
          if (v45) {
            goto LABEL_3;
          }
        }
        if (v4 > 0x22)
        {
          uint64_t v11 = v58 + 34;
          if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
            goto LABEL_89;
          }
          Verifier.rangeInBuffer(position:size:)(v58 + 34, 2);
          uint64_t v43 = v46;
          if (v46) {
            goto LABEL_3;
          }
          if (*(_WORD *)(*(void *)(v61 + 24) + v11))
          {
            Verifier.rangeInBuffer(position:size:)(v57 + *(unsigned __int16 *)(*(void *)(v61 + 24) + v11), 1);
            uint64_t v43 = v47;
            if (v47) {
              goto LABEL_3;
            }
          }
        }
      }
      sub_26170C1D8();
      if (!v43)
      {
        sub_26170C1D8();
        if ((uint64_t)v4 >= 41)
        {
          uint64_t v11 = v58 + 40;
          if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
            goto LABEL_89;
          }
          Verifier.rangeInBuffer(position:size:)(v58 + 40, 2);
          if (v48) {
            goto LABEL_3;
          }
          if (*(_WORD *)(*(void *)(v61 + 24) + v11))
          {
            Verifier.rangeInBuffer(position:size:)(v57 + *(unsigned __int16 *)(*(void *)(v61 + 24) + v11), 1);
            if (v49) {
              goto LABEL_3;
            }
          }
          if (v4 > 0x2A)
          {
            uint64_t v11 = v58 + 42;
            if (v60 == 1 && ((*(_DWORD *)(v61 + 24) + v11) & 1) != 0) {
              goto LABEL_89;
            }
            Verifier.rangeInBuffer(position:size:)(v58 + 42, 2);
            if (v50) {
              goto LABEL_3;
            }
            if (*(_WORD *)(*(void *)(v61 + 24) + v11))
            {
              Verifier.rangeInBuffer(position:size:)(v57 + *(unsigned __int16 *)(*(void *)(v61 + 24) + v11), 1);
              if (v51) {
                goto LABEL_3;
              }
            }
            if (v4 > 0x2C)
            {
              uint64_t v11 = v58 + 44;
              if (v60 != 1 || ((*(_DWORD *)(v61 + 24) + v11) & 1) == 0)
              {
                Verifier.rangeInBuffer(position:size:)(v58 + 44, 2);
                if (v52) {
                  goto LABEL_3;
                }
                if (*(_WORD *)(*(void *)(v61 + 24) + v11))
                {
                  Verifier.rangeInBuffer(position:size:)(v57 + *(unsigned __int16 *)(*(void *)(v61 + 24) + v11), 1);
                  if (v53) {
                    goto LABEL_3;
                  }
                }
                goto LABEL_88;
              }
LABEL_89:
              uint64_t v62 = MEMORY[0x263F8E888];
              uint64_t v12 = &qword_26A92AB70;
              goto LABEL_90;
            }
          }
        }
LABEL_88:
        sub_261715E2C(0x2Eu, 0x65736E6F70736572, 0xE900000000000073, 1);
      }
    }
LABEL_3:
    swift_release();
  }
}

#error "261720D74: call analysis failed (funcsize=370)"

uint64_t sub_261721400()
{
  return static WK2_WeatherAlertSummary.verify<A>(_:at:of:)();
}

void WK2_TrendDeviation.maxTemperatureChange.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 9u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 8);
  int v5 = v3 + 8;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_TrendDeviation.minTemperatureChange.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0xBu)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 10);
  int v5 = v3 + 10;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_TrendDeviation.dayPrecipitationChange.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0xDu)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 12);
  int v5 = v3 + 12;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_TrendDeviation.nightPrecipitationChange.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0xFu)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 14);
  int v5 = v3 + 14;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void static WK2_TrendDeviation.add(forecastStart:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_TrendDeviation.add(forecastEnd:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261712F40();
}

void static WK2_TrendDeviation.add(maxTemperatureChange:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617216A4();
}

void sub_2617216A4()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_103(v10);
    }
    OUTLINED_FUNCTION_77(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_TrendDeviation.add(minTemperatureChange:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261722284();
}

void static WK2_TrendDeviation.add(dayPrecipitationChange:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172183C();
}

void sub_26172183C()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_160(v10);
    }
    OUTLINED_FUNCTION_89(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_TrendDeviation.add(nightPrecipitationChange:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700EB0();
}

void static WK2_TrendDeviation.createTrendDeviation(_:forecastStart:forecastEnd:maxTemperatureChange:minTemperatureChange:dayPrecipitationChange:nightPrecipitationChange:)()
{
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_259();
  static WK2_LocationInfo.startLocationInfo(_:)();
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  static WK2_CurrentWeather.add(asOf:_:)();
  static WK2_DayWeatherConditions.add(conditionCode:_:)();
  static WK2_TrendDeviation.add(minTemperatureChange:_:)();
  static WK2_TrendDeviation.add(dayPrecipitationChange:_:)();
  static WK2_HourWeatherConditions.add(conditionCode:_:)();
  *uint64_t v0 = OUTLINED_FUNCTION_244();
  OUTLINED_FUNCTION_116();
}

void sub_261721A28(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v29);
  if (!v2)
  {
    unint64_t v3 = v31;
    if (v31 < 5) {
      goto LABEL_49;
    }
    uint64_t v4 = v30 + 4;
    int v5 = v32;
    if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v30 + 4, 2);
      if (v6) {
        goto LABEL_49;
      }
      uint64_t v7 = *(void *)(v33 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v29 + v8;
        if ((((_BYTE)v7 + (_BYTE)v29 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v29 + v8, 4);
        if (v11) {
          goto LABEL_49;
        }
      }
      if (v3 < 7) {
        goto LABEL_49;
      }
      uint64_t v4 = v30 + 6;
      int v12 = v32;
      if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v30 + 6, 2);
        if (!v13)
        {
          uint64_t v14 = *(void *)(v33 + 24);
          uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
          if (!*(_WORD *)(v14 + v4)) {
            goto LABEL_23;
          }
          uint64_t v4 = v29 + v15;
          if ((((_BYTE)v14 + (_BYTE)v29 + (_BYTE)v15) & 3) != 0) {
            int v16 = v12;
          }
          else {
            int v16 = 0;
          }
          if (v16 == 1)
          {
LABEL_11:
            uint64_t v34 = MEMORY[0x263F8E8F8];
            uint64_t v10 = &qword_26A92AB80;
LABEL_48:
            __swift_instantiateConcreteTypeFromMangledName(v10);
            uint64_t v25 = sub_26173BC20();
            uint64_t v27 = v26;
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v28 = v4;
            *(void *)(v28 + 8) = v25;
            *(void *)(v28 + 16) = v27;
            *(_OWORD *)(v28 + 24) = 0u;
            *(_OWORD *)(v28 + 40) = 0u;
            *(_OWORD *)(v28 + 49) = 0u;
            swift_willThrow();
            goto LABEL_49;
          }
          Verifier.rangeInBuffer(position:size:)(v29 + v15, 4);
          if (!v17)
          {
LABEL_23:
            if (v3 >= 9)
            {
              uint64_t v4 = v30 + 8;
              if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
              {
                Verifier.rangeInBuffer(position:size:)(v30 + 8, 2);
                if (v18) {
                  goto LABEL_49;
                }
                if (*(_WORD *)(*(void *)(v33 + 24) + v4))
                {
                  Verifier.rangeInBuffer(position:size:)(v29 + *(unsigned __int16 *)(*(void *)(v33 + 24) + v4), 1);
                  if (v19) {
                    goto LABEL_49;
                  }
                }
                if (v3 < 0xB) {
                  goto LABEL_49;
                }
                uint64_t v4 = v30 + 10;
                if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
                {
                  Verifier.rangeInBuffer(position:size:)(v30 + 10, 2);
                  if (v20) {
                    goto LABEL_49;
                  }
                  if (*(_WORD *)(*(void *)(v33 + 24) + v4))
                  {
                    Verifier.rangeInBuffer(position:size:)(v29 + *(unsigned __int16 *)(*(void *)(v33 + 24) + v4), 1);
                    if (v21) {
                      goto LABEL_49;
                    }
                  }
                  if (v3 < 0xD) {
                    goto LABEL_49;
                  }
                  uint64_t v4 = v30 + 12;
                  if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
                  {
                    Verifier.rangeInBuffer(position:size:)(v30 + 12, 2);
                    if (v22) {
                      goto LABEL_49;
                    }
                    if (*(_WORD *)(*(void *)(v33 + 24) + v4))
                    {
                      Verifier.rangeInBuffer(position:size:)(v29 + *(unsigned __int16 *)(*(void *)(v33 + 24) + v4), 1);
                      if (v23) {
                        goto LABEL_49;
                      }
                    }
                    if (v3 < 0xF) {
                      goto LABEL_49;
                    }
                    uint64_t v4 = v30 + 14;
                    if (v32 != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
                    {
                      Verifier.rangeInBuffer(position:size:)(v30 + 14, 2);
                      if (!v24)
                      {
                        if (*(_WORD *)(*(void *)(v33 + 24) + v4)) {
                          Verifier.rangeInBuffer(position:size:)(v29 + *(unsigned __int16 *)(*(void *)(v33 + 24) + v4), 1);
                        }
                      }
                      goto LABEL_49;
                    }
                  }
                }
              }
              goto LABEL_47;
            }
          }
        }
LABEL_49:
        swift_release();
        return;
      }
    }
LABEL_47:
    uint64_t v34 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_48;
  }
}

#error "261721DF8: call analysis failed (funcsize=137)"

uint64_t sub_261722010()
{
  return static WK2_TrendDeviation.verify<A>(_:at:of:)();
}

void WK2_HistoricalComparison.condition.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 5u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 4);
  int v5 = v3 + 4;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_HistoricalComparison.deviation.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 0xBu)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 10);
  int v5 = v3 + 10;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void WK2_HistoricalComparison.baselineStartDate.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0xFu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 14);
    int v4 = v2 + 14;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_HistoricalComparison.add(condition:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261703290();
}

void static WK2_HistoricalComparison.add(currentValue:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

void static WK2_HistoricalComparison.add(baselineValue:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261702C30();
}

void static WK2_HistoricalComparison.add(deviation:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261722284();
}

void sub_261722284()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if (!v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_130(v10);
    }
    OUTLINED_FUNCTION_90(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_HistoricalComparison.add(baselineType:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 57) != 1) {
    return;
  }
  if (*(uint64_t *)(a2 + 64) <= 0) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(a2 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (HIDWORD(v4))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(a2 + 16) = v4;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v8)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v7 = *(void *)(v2 + 32);
  }
  *(unsigned char *)(*(void *)(v2 + 24) + v7 + ~v4) = 0;
  *(void *)(a2 + 16) = v4 + 1;
  if (v4 > 0xFFFFFFFE) {
LABEL_22:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v9 + 32)) {
      OUTLINED_FUNCTION_205(v9);
    }
    OUTLINED_FUNCTION_89(v9, *(int64x2_t *)(v9 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v8 & v14)) {
      __int16 v12 = v13;
    }
    *(_WORD *)(v11 + 64) = v12;
  }
}

void static WK2_HistoricalComparison.add(baselineStartDate:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v5)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v7 ^ v8 | v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v9 = *(void *)(v0 + 16);
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v10 = OUTLINED_FUNCTION_8_0(v6, v9);
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v7 != v8)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  *(_DWORD *)(v12 - v3 + *(void *)(v1 + 24) - 4) = v2;
  OUTLINED_FUNCTION_43();
  if (!v5 & v13) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32)) {
      OUTLINED_FUNCTION_157(v14);
    }
    OUTLINED_FUNCTION_128(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v5 & v13)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_HistoricalComparison.createHistoricalComparison(_:condition:currentValue:baselineValue:deviation:baselineType:baselineStartDate:)()
{
  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_256();
  Swift::UInt32 v2 = static WK2_LocationInfo.startLocationInfo(_:)();
  OUTLINED_FUNCTION_196();
  static WK2_Pollutant.add(pollutantType:_:)();
  OUTLINED_FUNCTION_186();
  static WK2_HourTide.add(height:_:)();
  static WK2_ForecastMinute.add(precipitationIntensity:_:)();
  static WK2_TrendDeviation.add(minTemperatureChange:_:)();
  static WK2_HistoricalComparison.add(baselineType:_:)(v3, v0);
  OUTLINED_FUNCTION_254();
  static WK2_HistoricalComparison.add(baselineStartDate:_:)();
  *uint64_t v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_227();
}

void sub_261722604(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v33);
  if (!v2)
  {
    unint64_t v3 = v35;
    if (v35 < 5) {
      goto LABEL_53;
    }
    uint64_t v4 = v34 + 4;
    if (v36 != 1 || ((*(_DWORD *)(v37 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v34 + 4, 2);
      if (v5) {
        goto LABEL_53;
      }
      if (*(_WORD *)(*(void *)(v37 + 24) + v4))
      {
        Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v4), 1);
        if (v6) {
          goto LABEL_53;
        }
      }
      if (v3 <= 6) {
        goto LABEL_53;
      }
      uint64_t v4 = v34 + 6;
      int v7 = v36;
      if (v36 != 1 || ((*(_DWORD *)(v37 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v34 + 6, 2);
        if (v8) {
          goto LABEL_53;
        }
        uint64_t v9 = *(void *)(v37 + 24);
        uint64_t v10 = *(unsigned __int16 *)(v9 + v4);
        if (*(_WORD *)(v9 + v4))
        {
          uint64_t v4 = v33 + v10;
          if ((((_BYTE)v9 + (_BYTE)v33 + (_BYTE)v10) & 3) != 0) {
            int v11 = v7;
          }
          else {
            int v11 = 0;
          }
          if (v11 == 1) {
            goto LABEL_17;
          }
          Verifier.rangeInBuffer(position:size:)(v33 + v10, 4);
          if (v13) {
            goto LABEL_53;
          }
        }
        if (v3 < 9) {
          goto LABEL_53;
        }
        uint64_t v4 = v34 + 8;
        int v14 = v36;
        if (v36 != 1 || ((*(_DWORD *)(v37 + 24) + v4) & 1) == 0)
        {
          Verifier.rangeInBuffer(position:size:)(v34 + 8, 2);
          if (!v15)
          {
            uint64_t v16 = *(void *)(v37 + 24);
            uint64_t v17 = *(unsigned __int16 *)(v16 + v4);
            if (!*(_WORD *)(v16 + v4)) {
              goto LABEL_29;
            }
            uint64_t v4 = v33 + v17;
            if ((((_BYTE)v16 + (_BYTE)v33 + (_BYTE)v17) & 3) != 0) {
              int v18 = v14;
            }
            else {
              int v18 = 0;
            }
            if (v18 == 1)
            {
LABEL_17:
              uint64_t v38 = MEMORY[0x263F8D5C8];
              uint64_t v12 = &qword_26A92AB88;
LABEL_52:
              __swift_instantiateConcreteTypeFromMangledName(v12);
              uint64_t v29 = sub_26173BC20();
              uint64_t v31 = v30;
              sub_2617295E0();
              swift_allocError();
              *(void *)uint64_t v32 = v4;
              *(void *)(v32 + 8) = v29;
              *(void *)(v32 + 16) = v31;
              *(_OWORD *)(v32 + 24) = 0u;
              *(_OWORD *)(v32 + 40) = 0u;
              *(_OWORD *)(v32 + 49) = 0u;
              swift_willThrow();
              goto LABEL_53;
            }
            Verifier.rangeInBuffer(position:size:)(v33 + v17, 4);
            if (!v19)
            {
LABEL_29:
              if (v3 >= 0xB)
              {
                uint64_t v4 = v34 + 10;
                if (v36 != 1 || ((*(_DWORD *)(v37 + 24) + v4) & 1) == 0)
                {
                  Verifier.rangeInBuffer(position:size:)(v34 + 10, 2);
                  if (v20) {
                    goto LABEL_53;
                  }
                  if (*(_WORD *)(*(void *)(v37 + 24) + v4))
                  {
                    Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v4), 1);
                    if (v21) {
                      goto LABEL_53;
                    }
                  }
                  if (v3 < 0xD) {
                    goto LABEL_53;
                  }
                  uint64_t v4 = v34 + 12;
                  if (v36 != 1 || ((*(_DWORD *)(v37 + 24) + v4) & 1) == 0)
                  {
                    Verifier.rangeInBuffer(position:size:)(v34 + 12, 2);
                    if (v22) {
                      goto LABEL_53;
                    }
                    if (*(_WORD *)(*(void *)(v37 + 24) + v4))
                    {
                      Verifier.rangeInBuffer(position:size:)(v33 + *(unsigned __int16 *)(*(void *)(v37 + 24) + v4), 0);
                      if (v23) {
                        goto LABEL_53;
                      }
                    }
                    if (v3 < 0xF) {
                      goto LABEL_53;
                    }
                    uint64_t v4 = v34 + 14;
                    int v24 = v36;
                    if (v36 != 1 || ((*(_DWORD *)(v37 + 24) + v4) & 1) == 0)
                    {
                      Verifier.rangeInBuffer(position:size:)(v34 + 14, 2);
                      if (v25) {
                        goto LABEL_53;
                      }
                      uint64_t v26 = *(void *)(v37 + 24);
                      uint64_t v27 = *(unsigned __int16 *)(v26 + v4);
                      if (!*(_WORD *)(v26 + v4)) {
                        goto LABEL_53;
                      }
                      uint64_t v4 = v33 + v27;
                      if ((((_BYTE)v26 + (_BYTE)v33 + (_BYTE)v27) & 3) != 0) {
                        int v28 = v24;
                      }
                      else {
                        int v28 = 0;
                      }
                      if (v28 != 1)
                      {
                        Verifier.rangeInBuffer(position:size:)(v33 + v27, 4);
                        goto LABEL_53;
                      }
                      uint64_t v38 = MEMORY[0x263F8E8F8];
                      uint64_t v12 = &qword_26A92AB80;
                      goto LABEL_52;
                    }
                  }
                }
                goto LABEL_51;
              }
            }
          }
LABEL_53:
          swift_release();
          return;
        }
      }
    }
LABEL_51:
    uint64_t v38 = MEMORY[0x263F8E888];
    uint64_t v12 = &qword_26A92AB70;
    goto LABEL_52;
  }
}

#error "261722A04: call analysis failed (funcsize=149)"

uint64_t sub_261722C50()
{
  return static WK2_HistoricalComparison.verify<A>(_:at:of:)();
}

uint64_t WK2_HourMarineConditions.primarySwell.getter()
{
  uint64_t result = OUTLINED_FUNCTION_226();
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v3 + v5) < 7u)
  {
    int v8 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v8, v4);
    int v9 = v8 + v4;
    if (!v6)
    {
      if (!__OFADD__(v9, *(_DWORD *)(v3 + v9))) {
        return OUTLINED_FUNCTION_94(result, v2, *(__n128 *)(v0 + 8));
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v5, 6);
  int v7 = v5 + 6;
  if (!v6)
  {
    int v8 = *(__int16 *)(v3 + v7);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

void static WK2_HourMarineConditions.add(date:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_HourMarineConditions.add(primarySwell:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_HourMarineConditions.add(waterTemperature:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261702C30();
}

void static WK2_HourMarineConditions.createHourMarineConditions(_:date:primarySwellOffset:waterTemperature:)()
{
  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_174();
  static WK2_WeatherAlertCollection.startWeatherAlertCollection(_:)();
  OUTLINED_FUNCTION_190();
  OUTLINED_FUNCTION_137();
  static WK2_ForecastMinute.add(precipitationIntensity:_:)();
  *uint64_t v0 = FlatBufferBuilder.endTable(at:)(v1);
  OUTLINED_FUNCTION_227();
}

void sub_261722E2C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v22);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v4 = v24;
    if (v24 >= 5)
    {
      uint64_t v5 = v23 + 4;
      int v6 = v25;
      if (v25 == 1 && ((*(_DWORD *)(v26 + 24) + v5) & 1) != 0)
      {
LABEL_24:
        uint64_t v27 = MEMORY[0x263F8E888];
        int v11 = &qword_26A92AB70;
        goto LABEL_25;
      }
      Verifier.rangeInBuffer(position:size:)(v23 + 4, 2);
      uint64_t v3 = v7;
      if (v7) {
        goto LABEL_26;
      }
      uint64_t v8 = *(void *)(v26 + 24);
      uint64_t v9 = *(unsigned __int16 *)(v8 + v5);
      if (*(_WORD *)(v8 + v5))
      {
        uint64_t v5 = v22 + v9;
        if ((((_BYTE)v8 + (_BYTE)v22 + (_BYTE)v9) & 3) != 0) {
          int v10 = v6;
        }
        else {
          int v10 = 0;
        }
        if (v10 == 1)
        {
          uint64_t v27 = MEMORY[0x263F8E8F8];
          int v11 = &qword_26A92AB80;
LABEL_25:
          __swift_instantiateConcreteTypeFromMangledName(v11);
          uint64_t v18 = sub_26173BC20();
          uint64_t v20 = v19;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v21 = v5;
          *(void *)(v21 + 8) = v18;
          *(void *)(v21 + 16) = v20;
          *(_OWORD *)(v21 + 24) = 0u;
          *(_OWORD *)(v21 + 40) = 0u;
          *(_OWORD *)(v21 + 49) = 0u;
          swift_willThrow();
          goto LABEL_26;
        }
        Verifier.rangeInBuffer(position:size:)(v22 + v9, 4);
        uint64_t v3 = v12;
        if (v12)
        {
LABEL_26:
          swift_release();
          return;
        }
      }
    }
    sub_26170C1D8();
    if (v3 || v4 < 9) {
      goto LABEL_26;
    }
    uint64_t v5 = v23 + 8;
    int v13 = v25;
    if (v25 != 1 || ((*(_DWORD *)(v26 + 24) + v5) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v23 + 8, 2);
      if (v14) {
        goto LABEL_26;
      }
      uint64_t v15 = *(void *)(v26 + 24);
      uint64_t v16 = *(unsigned __int16 *)(v15 + v5);
      if (!*(_WORD *)(v15 + v5)) {
        goto LABEL_26;
      }
      uint64_t v5 = v22 + v16;
      if ((((_BYTE)v15 + (_BYTE)v22 + (_BYTE)v16) & 3) != 0) {
        int v17 = v13;
      }
      else {
        int v17 = 0;
      }
      if (v17 != 1)
      {
        Verifier.rangeInBuffer(position:size:)(v22 + v16, 4);
        goto LABEL_26;
      }
      uint64_t v27 = MEMORY[0x263F8D5C8];
      int v11 = &qword_26A92AB88;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
}

#error "2617230A8: call analysis failed (funcsize=91)"

uint64_t sub_261723224()
{
  return static WK2_HourMarineConditions.verify<A>(_:at:of:)();
}

void static WK2_TideEvent.add(date:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_TideEvent.add(height:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

void static WK2_TideEvent.add(eventType:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170314C();
}

void static WK2_TideEvent.createTideEvent(_:date:height:eventType:)()
{
  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_183();
  static WK2_WeatherAlertCollection.startWeatherAlertCollection(_:)();
  OUTLINED_FUNCTION_190();
  OUTLINED_FUNCTION_219();
  OUTLINED_FUNCTION_196();
  static WK2_Pollutant.add(units:_:)();
  *uint64_t v0 = FlatBufferBuilder.endTable(at:)(v1);
  OUTLINED_FUNCTION_227();
}

void sub_2617233A0(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v23);
  if (!v2)
  {
    unint64_t v3 = v25;
    if (v25 < 5) {
      goto LABEL_32;
    }
    uint64_t v4 = v24 + 4;
    int v5 = v26;
    if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v24 + 4, 2);
      if (v6) {
        goto LABEL_32;
      }
      uint64_t v7 = *(void *)(v27 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v23 + v8;
        if ((((_BYTE)v7 + (_BYTE)v23 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1)
        {
          uint64_t v28 = MEMORY[0x263F8E8F8];
          int v10 = &qword_26A92AB80;
LABEL_31:
          __swift_instantiateConcreteTypeFromMangledName(v10);
          uint64_t v19 = sub_26173BC20();
          uint64_t v21 = v20;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v22 = v4;
          *(void *)(v22 + 8) = v19;
          *(void *)(v22 + 16) = v21;
          *(_OWORD *)(v22 + 24) = 0u;
          *(_OWORD *)(v22 + 40) = 0u;
          *(_OWORD *)(v22 + 49) = 0u;
          swift_willThrow();
          goto LABEL_32;
        }
        Verifier.rangeInBuffer(position:size:)(v23 + v8, 4);
        if (v11) {
          goto LABEL_32;
        }
      }
      if (v3 <= 6) {
        goto LABEL_32;
      }
      uint64_t v4 = v24 + 6;
      int v12 = v26;
      if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v24 + 6, 2);
        if (!v13)
        {
          uint64_t v14 = *(void *)(v27 + 24);
          uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
          if (!*(_WORD *)(v14 + v4)) {
            goto LABEL_24;
          }
          uint64_t v4 = v23 + v15;
          if ((((_BYTE)v14 + (_BYTE)v23 + (_BYTE)v15) & 3) != 0) {
            int v16 = v12;
          }
          else {
            int v16 = 0;
          }
          if (v16 == 1)
          {
            uint64_t v28 = MEMORY[0x263F8D5C8];
            int v10 = &qword_26A92AB88;
            goto LABEL_31;
          }
          Verifier.rangeInBuffer(position:size:)(v23 + v15, 4);
          if (!v17)
          {
LABEL_24:
            if (v3 > 8)
            {
              uint64_t v4 = v24 + 8;
              if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
              {
                Verifier.rangeInBuffer(position:size:)(v24 + 8, 2);
                if (!v18)
                {
                  if (*(_WORD *)(*(void *)(v27 + 24) + v4)) {
                    Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v4), 1);
                  }
                }
                goto LABEL_32;
              }
              goto LABEL_30;
            }
          }
        }
LABEL_32:
        swift_release();
        return;
      }
    }
LABEL_30:
    uint64_t v28 = MEMORY[0x263F8E888];
    int v10 = &qword_26A92AB70;
    goto LABEL_31;
  }
}

void static WK2_TideEvent.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void sub_261723648(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void static WK2_HourTide.add(date:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

uint64_t static WK2_HourTide.createHourTide(_:date:height:)()
{
  OUTLINED_FUNCTION_183();
  static WK2_HourTide.startHourTide(_:)();
  OUTLINED_FUNCTION_190();
  OUTLINED_FUNCTION_219();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v1);
  *uint64_t v0 = result;
  return result;
}

void sub_26172370C(int a1, unint64_t a2, int a3, uint64_t *a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, (int)a4, a5, a6, a7, a8, v26, v27);
  if (!v8)
  {
    if (v28 < 5)
    {
LABEL_12:
      swift_release();
      return;
    }
    OUTLINED_FUNCTION_175();
    if (!v11 || (OUTLINED_FUNCTION_194(), (v12 & 1) == 0))
    {
      OUTLINED_FUNCTION_29(v9);
      OUTLINED_FUNCTION_193();
      if (v13)
      {
        OUTLINED_FUNCTION_145();
        if (v14 == 1)
        {
          uint64_t v15 = a4;
LABEL_10:
          __swift_instantiateConcreteTypeFromMangledName(v15);
          OUTLINED_FUNCTION_189();
          OUTLINED_FUNCTION_109();
          uint64_t v16 = OUTLINED_FUNCTION_44();
          OUTLINED_FUNCTION_181(v16, v17);
LABEL_11:
          OUTLINED_FUNCTION_162(v18, v19);
          goto LABEL_12;
        }
        OUTLINED_FUNCTION_50(v9);
      }
      if ((unint64_t)v28 <= 6) {
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_118();
      if (v11 && (OUTLINED_FUNCTION_11(), (v20 & 1) != 0))
      {
        uint64_t v23 = &qword_26A92AB70;
      }
      else
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (!v21) {
          goto LABEL_12;
        }
        OUTLINED_FUNCTION_47();
        if (v22 != 1)
        {
          OUTLINED_FUNCTION_31();
          goto LABEL_12;
        }
        uint64_t v23 = &qword_26A92AB88;
      }
      __swift_instantiateConcreteTypeFromMangledName(v23);
      OUTLINED_FUNCTION_189();
      OUTLINED_FUNCTION_87();
      uint64_t v24 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_135(v24, v25);
      goto LABEL_11;
    }
    uint64_t v15 = &qword_26A92AB70;
    goto LABEL_10;
  }
}

void static WK2_HourTide.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void sub_2617238C8(int a1, unint64_t a2, int a3, int a4, int a5, int a6, uint64_t *a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, (int)a7, a8, v26, v27);
  if (!v8)
  {
    if (v28 < 5)
    {
LABEL_12:
      swift_release();
      return;
    }
    OUTLINED_FUNCTION_175();
    if (!v11 || (OUTLINED_FUNCTION_194(), (v12 & 1) == 0))
    {
      OUTLINED_FUNCTION_29(v9);
      OUTLINED_FUNCTION_193();
      if (v13)
      {
        OUTLINED_FUNCTION_145();
        if (v14 == 1)
        {
          uint64_t v15 = a7;
LABEL_10:
          __swift_instantiateConcreteTypeFromMangledName(v15);
          OUTLINED_FUNCTION_189();
          OUTLINED_FUNCTION_109();
          uint64_t v16 = OUTLINED_FUNCTION_44();
          OUTLINED_FUNCTION_181(v16, v17);
LABEL_11:
          OUTLINED_FUNCTION_162(v18, v19);
          goto LABEL_12;
        }
        OUTLINED_FUNCTION_50(v9);
      }
      if ((unint64_t)v28 <= 6) {
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_118();
      if (v11 && (OUTLINED_FUNCTION_11(), (v20 & 1) != 0))
      {
        uint64_t v23 = &qword_26A92AB70;
      }
      else
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (!v21) {
          goto LABEL_12;
        }
        OUTLINED_FUNCTION_47();
        if (v22 != 1)
        {
          OUTLINED_FUNCTION_31();
          goto LABEL_12;
        }
        uint64_t v23 = &qword_26A92AB88;
      }
      __swift_instantiateConcreteTypeFromMangledName(v23);
      OUTLINED_FUNCTION_189();
      OUTLINED_FUNCTION_87();
      uint64_t v24 = OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_135(v24, v25);
      goto LABEL_11;
    }
    uint64_t v15 = &qword_26A92AB70;
    goto LABEL_10;
  }
}

void sub_261723A5C(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void WK2_DayPartForecast.hasPrecipitationAmountByType.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0x1Bu)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 26)) {
    goto LABEL_7;
  }
}

void WK2_DayPartForecast.precipitationAmountByType(at:)()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 0x1B)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 26);
  int v5 = v3 + 26;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void _s11WeatherData011WK2_CurrentA0V8pressureSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x33u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 50);
  int v4 = v2 + 50;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_DayPartForecast.uvIndexMin.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x37u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 54);
    int v4 = v2 + 54;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_DayPartForecast.uvIndexMax.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x39u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 56);
    int v4 = v2 + 56;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void _s11WeatherData011WK2_CurrentA0V17snowfallAmount24hSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0x3Bu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 58);
  int v4 = v2 + 58;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_DayPartForecast.daylight.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 0x3Fu) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 62);
    int v4 = v2 + 62;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_92(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void static WK2_DayPartForecast.add(forecastStart:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170519C();
}

void static WK2_DayPartForecast.add(forecastEnd:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261712F40();
}

void static WK2_DayPartForecast.add(humidity:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170113C();
}

void static WK2_DayPartForecast.add(precipitationAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261713470();
}

void static WK2_DayPartForecast.add(temperatureMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617130E0();
}

void static WK2_DayPartForecast.add(temperatureMin:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261723EF0();
}

void sub_261723EF0()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 36;
    }
    OUTLINED_FUNCTION_148(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(precipitationIntensityMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172403C();
}

void sub_26172403C()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 50;
    }
    OUTLINED_FUNCTION_151(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(perceivedPrecipitationIntensityMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261700BDC();
}

void static WK2_DayPartForecast.add(uvIndexMin:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32)) {
      OUTLINED_FUNCTION_209(v8);
    }
    OUTLINED_FUNCTION_154(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v11 = v12;
    }
    *(_WORD *)(v10 + 64) = v11;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(uvIndexMax:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_112();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    if (!v1)
    {
LABEL_23:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v2 ^ v3 | v1) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v4 = *(void *)(v0 + 16);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v4))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v2 != v3) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v4;
  OUTLINED_FUNCTION_12();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v6 = *(void *)(v5 + 32);
  }
  OUTLINED_FUNCTION_23(v6);
  if (!v1 & v7) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v9 & 1) == 0)
  {
    if (*(void *)(v8 + 32))
    {
      OUTLINED_FUNCTION_81(v8);
      *(_WORD *)(v10 + 4) = 56;
    }
    OUTLINED_FUNCTION_200(v8, *(int64x2_t *)(v8 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v1 & v7)) {
      __int16 v12 = v13;
    }
    *(_WORD *)(v11 + 64) = v12;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(temperatureApparentMin:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617243CC();
}

void sub_2617243CC()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 58;
    }
    OUTLINED_FUNCTION_199(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_DayPartForecast.add(temperatureApparentMax:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EEA0();
}

void static WK2_DayPartForecast.add(daylight:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_69();
  if ((v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v4 ^ v5 | v3) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_12();
  if (v4 != v5) {
    OUTLINED_FUNCTION_55();
  }
  *(void *)(v0 + 16) = v6;
  OUTLINED_FUNCTION_12();
  if (v4 ^ v5 | v3)
  {
    OUTLINED_FUNCTION_56();
    uint64_t v8 = *(void *)(v7 + 32);
  }
  *(unsigned char *)(*(void *)(v7 + 24) + v8 + ~v6) = v1 & 1;
  OUTLINED_FUNCTION_53();
  if (!v3 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32))
    {
      OUTLINED_FUNCTION_81(v10);
      *(_WORD *)(v12 + 4) = 62;
    }
    OUTLINED_FUNCTION_198(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v9)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_22;
  }
  __break(1u);
}

uint64_t static WK2_DayPartForecast.createDayPartForecast(_:forecastStart:forecastEnd:cloudCover:cloudCoverLowAltPct:cloudCoverMidAltPct:cloudCoverHighAltPct:conditionCode:humidity:humidityMax:humidityMin:precipitationAmount:precipitationAmountByTypeVectorOffset:precipitationChance:precipitationType:snowfallAmount:temperatureMax:temperatureMin:visibilityMax:visibilityMin:windDirection:windGustSpeedMax:windSpeed:windSpeedMax:precipitationIntensityMax:perceivedPrecipitationIntensityMax:uvIndexMin:uvIndexMax:temperatureApparentMin:temperatureApparentMax:daylight:)()
{
  OUTLINED_FUNCTION_188();
  char v5 = v0;
  static WK2_DayPartForecast.startDayPartForecast(_:)(v1);
  Swift::UInt32 at = v2;
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
  static WK2_CurrentWeather.add(asOf:_:)();
  static WK2_CurrentWeather.add(cloudCover:_:)();
  OUTLINED_FUNCTION_243();
  static WK2_CurrentWeather.add(cloudCoverLowAltPct:_:)();
  OUTLINED_FUNCTION_254();
  static WK2_CurrentWeather.add(cloudCoverMidAltPct:_:)();
  static WK2_CurrentWeather.add(cloudCoverHighAltPct:_:)();
  static WK2_CurrentWeather.add(conditionCode:_:)();
  OUTLINED_FUNCTION_253();
  static WK2_HourWeatherConditions.add(humidity:_:)();
  OUTLINED_FUNCTION_252();
  static WK2_CurrentWeather.add(humidity:_:)();
  static WK2_DayPartForecast.add(humidityMin:_:)();
  OUTLINED_FUNCTION_251();
  static WK2_CurrentWeather.add(precipitationAmount1h:_:)();
  static WK2_Weather.add(tideEvents:_:)();
  static WK2_DayPartForecast.add(precipitationChance:_:)();
  static WK2_DayPartForecast.add(precipitationType:_:)();
  OUTLINED_FUNCTION_222();
  static WK2_CurrentWeather.add(precipitationAmountNext6h:_:)();
  OUTLINED_FUNCTION_220();
  static WK2_CurrentWeather.add(precipitationAmountNext24h:_:)();
  OUTLINED_FUNCTION_186();
  static WK2_HourWeatherConditions.add(snowfallAmount:_:)();
  static WK2_HourWeatherConditions.add(temperature:_:)();
  OUTLINED_FUNCTION_248();
  static WK2_HourWeatherConditions.add(temperatureApparent:_:)();
  static WK2_DayPartForecast.add(windDirection:_:)();
  static WK2_HourWeatherConditions.add(temperatureDewPoint:_:)();
  static WK2_DayPartForecast.add(windSpeed:_:)();
  OUTLINED_FUNCTION_249();
  static WK2_CurrentWeather.add(precipitationIntensity:_:)();
  static WK2_CurrentWeather.add(pressure:_:)();
  static WK2_DayWeatherConditions.add(temperatureMax:_:)();
  static WK2_DayPartForecast.add(uvIndexMin:_:)();
  static WK2_DayPartForecast.add(uvIndexMax:_:)();
  static WK2_CurrentWeather.add(snowfallAmount24h:_:)();
  static WK2_CurrentWeather.add(snowfallAmountNext1h:_:)();
  static WK2_DayPartForecast.add(daylight:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *char v5 = result;
  return result;
}

#error "2617248A8: call analysis failed (funcsize=365)"

uint64_t sub_261724EA4()
{
  return static WK2_DayPartForecast.verify<A>(_:at:of:)();
}

void WK2_PrecipitationConditionParameter.type.getter()
{
  OUTLINED_FUNCTION_76();
  if (v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(v1 + v3) < 5u)
  {
LABEL_6:
    OUTLINED_FUNCTION_52(v0);
    return;
  }
  BOOL v4 = __OFADD__(v3, 4);
  int v5 = v3 + 4;
  if (v4) {
    goto LABEL_8;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6 || !__OFADD__(v6, v2)) {
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void static WK2_PrecipitationConditionParameter.add(type:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_110();
  if ((v1 & 1) == 0)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_22:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_58();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_14(1);
  }
  unint64_t v7 = *(void *)(v3 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_7_0();
  if (v5 != v6) {
    OUTLINED_FUNCTION_59();
  }
  *(void *)(v3 + 16) = v7;
  OUTLINED_FUNCTION_16();
  if (v5 ^ v6 | v4)
  {
    OUTLINED_FUNCTION_60();
    uint64_t v8 = *(void *)(v0 + 32);
  }
  OUTLINED_FUNCTION_21(v8);
  if (!v4 & v9) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32)) {
      OUTLINED_FUNCTION_129(v10);
    }
    OUTLINED_FUNCTION_91(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v9)) {
      __int16 v13 = v14;
    }
    *(_WORD *)(v12 + 64) = v13;
    goto LABEL_22;
  }
  __break(1u);
}

void static WK2_PrecipitationConditionParameter.add(date:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261712F40();
}

void static WK2_PrecipitationConditionParameter.createPrecipitationConditionParameter(_:type:date:)()
{
  OUTLINED_FUNCTION_22();
  char v1 = v0;
  Swift::UInt32 v2 = static WK2_HourTide.startHourTide(_:)();
  OUTLINED_FUNCTION_196();
  static WK2_PrecipitationConditionParameter.add(type:_:)();
  static WK2_CurrentWeather.add(asOf:_:)();
  *char v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_20();
}

void sub_2617250C8(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v17);
  if (!v2)
  {
    unint64_t v3 = v19;
    if (v19 >= 5)
    {
      uint64_t v4 = v18 + 4;
      if (v20 == 1 && ((*(_DWORD *)(v21 + 24) + v4) & 1) != 0) {
        goto LABEL_18;
      }
      Verifier.rangeInBuffer(position:size:)(v18 + 4, 2);
      if (v5) {
        goto LABEL_20;
      }
      if (*(_WORD *)(*(void *)(v21 + 24) + v4))
      {
        Verifier.rangeInBuffer(position:size:)(v17 + *(unsigned __int16 *)(*(void *)(v21 + 24) + v4), 1);
        if (v6) {
          goto LABEL_20;
        }
      }
      if (v3 < 7) {
        goto LABEL_20;
      }
      uint64_t v4 = v18 + 6;
      int v7 = v20;
      if (v20 == 1 && ((*(_DWORD *)(v21 + 24) + v4) & 1) != 0)
      {
LABEL_18:
        uint64_t v12 = &qword_26A92AB70;
      }
      else
      {
        Verifier.rangeInBuffer(position:size:)(v18 + 6, 2);
        if (v8) {
          goto LABEL_20;
        }
        uint64_t v9 = *(void *)(v21 + 24);
        uint64_t v10 = *(unsigned __int16 *)(v9 + v4);
        if (!*(_WORD *)(v9 + v4)) {
          goto LABEL_20;
        }
        uint64_t v4 = v17 + v10;
        if ((((_BYTE)v9 + (_BYTE)v17 + (_BYTE)v10) & 3) != 0) {
          int v11 = v7;
        }
        else {
          int v11 = 0;
        }
        if (v11 != 1)
        {
          Verifier.rangeInBuffer(position:size:)(v17 + v10, 4);
          goto LABEL_20;
        }
        uint64_t v12 = &qword_26A92AB80;
      }
      __swift_instantiateConcreteTypeFromMangledName(v12);
      uint64_t v13 = sub_26173BC20();
      uint64_t v15 = v14;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v16 = v4;
      *(void *)(v16 + 8) = v13;
      *(void *)(v16 + 16) = v15;
      *(_OWORD *)(v16 + 24) = 0u;
      *(_OWORD *)(v16 + 40) = 0u;
      *(_OWORD *)(v16 + 49) = 0u;
      swift_willThrow();
    }
LABEL_20:
    swift_release();
  }
}

void static WK2_PrecipitationConditionParameter.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v21, v23);
  if (!v8)
  {
    OUTLINED_FUNCTION_119();
    if (v10 == v11)
    {
      OUTLINED_FUNCTION_68();
      if (v12)
      {
        OUTLINED_FUNCTION_11();
        if (v13) {
          goto LABEL_15;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_2_0();
      if (v14) {
        OUTLINED_FUNCTION_4(v14, v22, v24);
      }
      if (v9 <= 6) {
        goto LABEL_17;
      }
      OUTLINED_FUNCTION_118();
      if (v12)
      {
        OUTLINED_FUNCTION_11();
        if (v15)
        {
LABEL_15:
          uint64_t v18 = &qword_26A92AB70;
LABEL_16:
          __swift_instantiateConcreteTypeFromMangledName(v18);
          sub_26173BC20();
          OUTLINED_FUNCTION_87();
          uint64_t v19 = OUTLINED_FUNCTION_44();
          OUTLINED_FUNCTION_19(v19, v20);
          goto LABEL_17;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v16)
      {
        OUTLINED_FUNCTION_47();
        if (v17 != 1)
        {
          OUTLINED_FUNCTION_31();
          goto LABEL_17;
        }
        uint64_t v18 = &qword_26A92AB80;
        goto LABEL_16;
      }
    }
LABEL_17:
    swift_release();
  }
}

void sub_2617253CC(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void WK2_Article.id.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 5u)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 4);
  int v4 = v2 + 4;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

void *WK2_Article.idSegmentArray.getter()
{
  return sub_261716140((void *)4, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void _s11WeatherData17WK2_DailyForecastV7hasDaysSbvg_0()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 7u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 6)) {
    goto LABEL_7;
  }
}

Swift::String_optional __swiftcall WK2_Article.supportedStorefronts(at:)(Swift::Int32 at)
{
  OUTLINED_FUNCTION_42();
  if (v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (*(unsigned __int16 *)(v4 + v5) < 7u)
  {
LABEL_12:
    uint64_t countAndFlagsBits = OUTLINED_FUNCTION_136();
    goto LABEL_21;
  }
  BOOL v6 = __OFADD__(v5, 6);
  int v7 = v5 + 6;
  if (v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v8 = *(__int16 *)(v4 + v7);
  if (!v8) {
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v8, v3);
  int v9 = v8 + v3;
  if (v6)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v10 = *(_DWORD *)(v4 + v9);
  BOOL v6 = __OFADD__(v9, v10);
  int v11 = v9 + v10;
  if (v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v11, 4))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_234();
  if (!v13) {
    goto LABEL_19;
  }
  BOOL v6 = __OFADD__(v12, 4 * countAndFlagsBits);
  uint64_t countAndFlagsBits = (v12 + 4 * countAndFlagsBits);
  if (v6)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  Swift::String_optional v14 = Table.directString(at:)(countAndFlagsBits);
  object = v14.value._object;
  uint64_t countAndFlagsBits = v14.value._countAndFlagsBits;
LABEL_21:
  result.value._object = object;
  result.value._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

void _s11WeatherData20WK2_NextHourForecastV10hasSummarySbvg_0()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 9u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 8)) {
    goto LABEL_7;
  }
}

void _s11WeatherData20WK2_NextHourForecastV7summary2atAA0c1_F13PeriodSummaryVSgs5Int32V_tF_0()
{
  OUTLINED_FUNCTION_30();
  if (v0)
  {
    __break(1u);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_134();
  if (v4 < 9)
  {
LABEL_13:
    uint64_t v11 = OUTLINED_FUNCTION_73();
    goto LABEL_14;
  }
  BOOL v0 = __OFADD__(v3, 8);
  int v5 = v3 + 8;
  if (v0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v6 = *(__int16 *)(v1 + v5);
  if (!v6) {
    goto LABEL_13;
  }
  if (__OFADD__(v6, v2))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_133();
  if (v0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (__OFADD__(v7, 4))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_57();
  if (!v10) {
    goto LABEL_20;
  }
  if (__OFADD__(v9, 4 * v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_75();
  if (!v0)
  {
    uint64_t v11 = OUTLINED_FUNCTION_74();
    __n128 v12 = v13;
LABEL_14:
    OUTLINED_FUNCTION_46(v11, v12);
    return;
  }
LABEL_22:
  __break(1u);
}

void _s11WeatherData04WK2_A7ChangesV03hasD0Sbvg_0()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 0xBu)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 10)) {
    goto LABEL_7;
  }
}

Swift::String_optional __swiftcall WK2_Article.phenomena(at:)(Swift::Int32 at)
{
  OUTLINED_FUNCTION_42();
  if (v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (*(unsigned __int16 *)(v4 + v5) < 0xBu)
  {
LABEL_12:
    uint64_t countAndFlagsBits = OUTLINED_FUNCTION_136();
    goto LABEL_21;
  }
  BOOL v6 = __OFADD__(v5, 10);
  int v7 = v5 + 10;
  if (v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v8 = *(__int16 *)(v4 + v7);
  if (!v8) {
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v8, v3);
  int v9 = v8 + v3;
  if (v6)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v10 = *(_DWORD *)(v4 + v9);
  BOOL v6 = __OFADD__(v9, v10);
  int v11 = v9 + v10;
  if (v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v11, 4))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_234();
  if (!v13) {
    goto LABEL_19;
  }
  BOOL v6 = __OFADD__(v12, 4 * countAndFlagsBits);
  uint64_t countAndFlagsBits = (v12 + 4 * countAndFlagsBits);
  if (v6)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  Swift::String_optional v14 = Table.directString(at:)(countAndFlagsBits);
  object = v14.value._object;
  uint64_t countAndFlagsBits = v14.value._countAndFlagsBits;
LABEL_21:
  result.value._object = object;
  result.value._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

void _s11WeatherData04WK2_A12AlertSummaryV11countryCodeSSSgvg_0()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xDu) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void _s11WeatherData04WK2_A12AlertSummaryV11descriptionSSSgvg_0()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 0xFu)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 14);
  int v4 = v2 + 14;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

void static WK2_Article.startArticle(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 56);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void static WK2_Article.add(id:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_Article.addVectorOf(supportedStorefronts:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

void static WK2_Article.addVectorOf(alertIds:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710694();
}

void static WK2_Article.addVectorOf(phenomena:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710574();
}

void static WK2_Article.add(headlineOverride:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261710454();
}

void static WK2_Article.add(locale:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617108AC();
}

void static WK2_Article.add(cta:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_261725A78();
}

void sub_261725A78()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v3) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v5 != v6) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v7))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v10) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v11)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    OUTLINED_FUNCTION_84(v12);
  }
  *(void *)(v0 + 16) = (-(int)v2 & 3) + v2;
  OUTLINED_FUNCTION_16();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 16;
    }
    OUTLINED_FUNCTION_152(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Article.createArticle(_:idOffset:supportedStorefrontsVectorOffset:alertIdsVectorOffset:phenomenaVectorOffset:headlineOverrideOffset:localeOffset:ctaOffset:)()
{
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_164();
  static WK2_Article.startArticle(_:)(v2);
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_137();
  OUTLINED_FUNCTION_191();
  OUTLINED_FUNCTION_232();
  OUTLINED_FUNCTION_231();
  OUTLINED_FUNCTION_230();
  static WK2_Weather.add(weatherAlerts:_:)();
  *uint64_t v0 = FlatBufferBuilder.endTable(at:)(v1);
  OUTLINED_FUNCTION_116();
}

void sub_261725C04(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v3);
  if (!v2)
  {
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    sub_26170C1D8();
    swift_release();
  }
}

void static WK2_Article.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10);
  if (!v8)
  {
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_176();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_241();
    OUTLINED_FUNCTION_247();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_98();
    swift_release();
  }
}

void sub_261725FCC(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void WK2_UUID.hasBytes.getter()
{
  OUTLINED_FUNCTION_78();
  if (v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v1) < 5u)
  {
    OUTLINED_FUNCTION_32();
    return;
  }
  if (__OFADD__(v1, 4)) {
    goto LABEL_7;
  }
}

void WK2_UUID.bytesCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 5u)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 4);
  int v4 = v2 + 4;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

Swift::UInt8 __swiftcall WK2_UUID.bytes(at:)(Swift::Int32 at)
{
  OUTLINED_FUNCTION_1();
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v2 + v4) < 5u)
  {
LABEL_10:
    LOBYTE(v1) = OUTLINED_FUNCTION_32();
    return v1;
  }
  BOOL v5 = __OFADD__(v4, 4);
  int v6 = v4 + 4;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    goto LABEL_10;
  }
  BOOL v5 = __OFADD__(v7, v3);
  int v8 = v7 + v3;
  if (v5)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  int v9 = *(_DWORD *)(v2 + v8);
  BOOL v5 = __OFADD__(v8, v9);
  int v10 = v8 + v9;
  if (v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  BOOL v5 = __OFADD__(v10, 4);
  int v11 = v10 + 4;
  if (v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (__OFADD__(v11, v1))
  {
LABEL_16:
    __break(1u);
    return v1;
  }
  LOBYTE(v1) = OUTLINED_FUNCTION_92(v2);
  return v1;
}

void *WK2_UUID.bytes.getter()
{
  Swift::String_optional result = sub_261716140((void *)4, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
  if (!result) {
    return (void *)MEMORY[0x263F8EE78];
  }
  return result;
}

void static WK2_UUID.startUUID(_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  OUTLINED_FUNCTION_114();
  if (v3 != v4)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_12:
      __break(1u);
      return;
    }
    if (*(void *)(v2 + 32)) {
      OUTLINED_FUNCTION_113();
    }
    uint64_t v5 = swift_slowAlloc();
    OUTLINED_FUNCTION_72(v5, v5 + 8);
  }
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(v6))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
}

void static WK2_UUID.addVectorOf(bytes:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

uint64_t static WK2_UUID.createUUID(_:bytesVectorOffset:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  static WK2_UUID.startUUID(_:)(a1);
  OUTLINED_FUNCTION_142();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v2);
  *a2 = result;
  return result;
}

void sub_261726244(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v3);
  if (!v2)
  {
    sub_261715820(4u, 0x7365747962, 0xE500000000000000, 1);
    swift_release();
  }
}

void static WK2_UUID.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10);
  if (!v8)
  {
    sub_261715820(4u, 0x7365747962, 0xE500000000000000, 1);
    swift_release();
  }
}

void sub_261726318(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void _s11WeatherData12WK2_LocationV8latitudeSfvg_0()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 5u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 4);
  int v4 = v2 + 4;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void static WK2_Swell.add(height:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617263E4();
}

void sub_2617263E4()
{
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v3)
  {
    OUTLINED_FUNCTION_17();
    if (!v3)
    {
LABEL_23:
      OUTLINED_FUNCTION_65();
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v5 ^ v6 | v3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = *(void *)(v0 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (HIDWORD(v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  Swift::Int v8 = OUTLINED_FUNCTION_0(v4, v7);
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_12();
  if (v5 != v6)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v3 & v11) {
LABEL_26:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v13 & 1) == 0)
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v3 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_23;
  }
  __break(1u);
}

void static WK2_Swell.add(direction:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617033D4();
}

void static WK2_Swell.add(timeIntervalSeconds:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_2617004F4();
}

uint64_t static WK2_Swell.createSwell(_:height:direction:timeIntervalSeconds:)()
{
  OUTLINED_FUNCTION_256();
  Swift::UInt32 v1 = static WK2_WeatherAlertCollection.startWeatherAlertCollection(_:)();
  static WK2_Location.add(latitude:_:)();
  OUTLINED_FUNCTION_219();
  OUTLINED_FUNCTION_254();
  static WK2_CurrentWeather.add(cloudCover:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v1);
  *uint64_t v0 = result;
  return result;
}

void sub_2617265E4(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v23);
  if (!v2)
  {
    unint64_t v3 = v25;
    if (v25 < 5) {
      goto LABEL_31;
    }
    uint64_t v4 = v24 + 4;
    int v5 = v26;
    if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v24 + 4, 2);
      if (v6) {
        goto LABEL_31;
      }
      uint64_t v7 = *(void *)(v27 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v23 + v8;
        if ((((_BYTE)v7 + (_BYTE)v23 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v23 + v8, 4);
        if (v11) {
          goto LABEL_31;
        }
      }
      if (v3 < 7) {
        goto LABEL_31;
      }
      uint64_t v4 = v24 + 6;
      int v12 = v26;
      if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v24 + 6, 2);
        if (!v13)
        {
          uint64_t v14 = *(void *)(v27 + 24);
          uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
          if (!*(_WORD *)(v14 + v4)) {
            goto LABEL_23;
          }
          uint64_t v4 = v23 + v15;
          if ((((_BYTE)v14 + (_BYTE)v23 + (_BYTE)v15) & 3) != 0) {
            int v16 = v12;
          }
          else {
            int v16 = 0;
          }
          if (v16 == 1)
          {
LABEL_11:
            uint64_t v28 = MEMORY[0x263F8D5C8];
            uint64_t v10 = &qword_26A92AB88;
LABEL_30:
            __swift_instantiateConcreteTypeFromMangledName(v10);
            uint64_t v19 = sub_26173BC20();
            uint64_t v21 = v20;
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v22 = v4;
            *(void *)(v22 + 8) = v19;
            *(void *)(v22 + 16) = v21;
            *(_OWORD *)(v22 + 24) = 0u;
            *(_OWORD *)(v22 + 40) = 0u;
            *(_OWORD *)(v22 + 49) = 0u;
            swift_willThrow();
            goto LABEL_31;
          }
          Verifier.rangeInBuffer(position:size:)(v23 + v15, 4);
          if (!v17)
          {
LABEL_23:
            if (v3 >= 9)
            {
              uint64_t v4 = v24 + 8;
              if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
              {
                Verifier.rangeInBuffer(position:size:)(v24 + 8, 2);
                if (!v18)
                {
                  if (*(_WORD *)(*(void *)(v27 + 24) + v4)) {
                    Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v4), 1);
                  }
                }
                goto LABEL_31;
              }
              goto LABEL_29;
            }
          }
        }
LABEL_31:
        swift_release();
        return;
      }
    }
LABEL_29:
    uint64_t v28 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_30;
  }
}

void static WK2_Swell.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

void sub_261726874(int a1, unint64_t a2, int a3, int a4, int a5, int a6, uint64_t *a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, (int)a7, a8, v28, v30);
  if (!v8)
  {
    if (v32 < 5)
    {
LABEL_12:
      swift_release();
      return;
    }
    OUTLINED_FUNCTION_175();
    if (v11)
    {
      OUTLINED_FUNCTION_194();
      if (v12)
      {
        uint64_t v15 = &qword_26A92AB70;
        goto LABEL_10;
      }
    }
    OUTLINED_FUNCTION_29(v9);
    OUTLINED_FUNCTION_193();
    if (v13)
    {
      OUTLINED_FUNCTION_145();
      if (v14 == 1)
      {
        uint64_t v15 = a7;
LABEL_10:
        __swift_instantiateConcreteTypeFromMangledName(v15);
        OUTLINED_FUNCTION_189();
        OUTLINED_FUNCTION_109();
        uint64_t v16 = OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_181(v16, v17);
LABEL_11:
        OUTLINED_FUNCTION_36(v18, v19);
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_50(v9);
    }
    if ((unint64_t)v32 <= 6) {
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_118();
    if (!v11 || (OUTLINED_FUNCTION_11(), (v20 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v21)
      {
        OUTLINED_FUNCTION_47();
        if (v22 == 1)
        {
          uint64_t v23 = &qword_26A92AB88;
LABEL_30:
          __swift_instantiateConcreteTypeFromMangledName(v23);
          OUTLINED_FUNCTION_189();
          OUTLINED_FUNCTION_87();
          uint64_t v26 = OUTLINED_FUNCTION_44();
          OUTLINED_FUNCTION_135(v26, v27);
          goto LABEL_11;
        }
        OUTLINED_FUNCTION_31();
      }
      if ((unint64_t)v32 <= 8) {
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_68();
      if (!v11 || (OUTLINED_FUNCTION_11(), (v24 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_2_0();
        if (v25) {
          OUTLINED_FUNCTION_4(v25, v29, v31);
        }
        goto LABEL_12;
      }
    }
    uint64_t v23 = &qword_26A92AB70;
    goto LABEL_30;
  }
}

void sub_261726A48(int a1, unint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
}

uint64_t _s11WeatherData04WK2_A0V8__bufferAA10ByteBufferVSgvg_0()
{
  return swift_retain();
}

void WK2_CallToAction.label.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 5u) {
    goto LABEL_7;
  }
  BOOL v3 = __OFADD__(v2, 4);
  int v4 = v2 + 4;
  if (v3)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  int v5 = *(__int16 *)(v1 + v4);
  if (v5)
  {
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_11;
  }
LABEL_7:
  OUTLINED_FUNCTION_136();
}

void WK2_CallToAction.url.getter()
{
  OUTLINED_FUNCTION_42();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v1 + v2) < 7u)
  {
    int v5 = 0;
LABEL_6:
    if (!__OFADD__(v5, v0))
    {
      Table.directString(at:)(v5 + v0);
      return;
    }
    goto LABEL_9;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (!v3)
  {
    int v5 = *(__int16 *)(v1 + v4);
    goto LABEL_6;
  }
LABEL_10:
  __break(1u);
}

void static WK2_CallToAction.add(label:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26170EFFC();
}

void static WK2_CallToAction.add(url:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26171023C();
}

uint64_t static WK2_CallToAction.createCallToAction(_:labelOffset:urlOffset:)@<X0>(uint64_t a1@<X0>, int *a2@<X2>, _DWORD *a3@<X8>)
{
  return sub_261717E78(a1, a2, (void (*)(void))static WK2_CallToAction.startCallToAction(_:), static WK2_CallToAction.add(label:_:), (void (*)(int *, uint64_t))static WK2_CallToAction.add(url:_:), a3);
}

void sub_261726C28(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v29);
  if (!v2)
  {
    unint64_t v3 = v31;
    if (v31 < 5) {
      goto LABEL_35;
    }
    uint64_t v4 = v30 + 4;
    int v5 = v32[0];
    if (v32[0] != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v30 + 4, 2);
      if (v6) {
        goto LABEL_39;
      }
      uint64_t v7 = v33;
      uint64_t v8 = *(void *)(v33 + 24);
      uint64_t v9 = *(unsigned __int16 *)(v8 + v4);
      if (*(_WORD *)(v8 + v4))
      {
        uint64_t v4 = v29 + v9;
        if ((((_BYTE)v8 + (_BYTE)v29 + (_BYTE)v9) & 3) != 0) {
          int v10 = v5;
        }
        else {
          int v10 = 0;
        }
        if (v10 == 1)
        {
LABEL_11:
          char v11 = &qword_26A92AB80;
LABEL_37:
          __swift_instantiateConcreteTypeFromMangledName(v11);
          uint64_t v25 = sub_26173BC20();
          uint64_t v27 = v26;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v28 = v4;
          *(void *)(v28 + 8) = v25;
          *(void *)(v28 + 16) = v27;
          *(_OWORD *)(v28 + 24) = 0u;
          *(_OWORD *)(v28 + 40) = 0u;
          *(_OWORD *)(v28 + 49) = 0u;
          goto LABEL_38;
        }
        Verifier.rangeInBuffer(position:size:)(v29 + v9, 4);
        if (v12) {
          goto LABEL_39;
        }
        uint64_t v13 = v4 + *(unsigned int *)(*(void *)(v7 + 24) + v4);
        if (v13 < 0) {
          uint64_t v13 = -v13;
        }
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFFLL) {
          Swift::Int v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          Swift::Int v14 = v13;
        }
        sub_26170C314((Swift::Int)v32, v14);
      }
      if (v3 < 7) {
        goto LABEL_35;
      }
      uint64_t v4 = v30 + 6;
      char v15 = v32[0];
      if (v32[0] != 1 || ((*(_DWORD *)(v33 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v30 + 6, 2);
        if (!v16)
        {
          uint64_t v17 = v33;
          uint64_t v18 = *(void *)(v33 + 24);
          uint64_t v19 = *(unsigned __int16 *)(v18 + v4);
          if (*(_WORD *)(v18 + v4))
          {
            uint64_t v4 = v29 + v19;
            if ((((_BYTE)v18 + (_BYTE)v29 + (_BYTE)v19) & 3) != 0) {
              char v20 = v15;
            }
            else {
              char v20 = 0;
            }
            if ((v20 & 1) == 0)
            {
              Verifier.rangeInBuffer(position:size:)(v29 + v19, 4);
              if (!v21)
              {
                uint64_t v22 = v4 + *(unsigned int *)(*(void *)(v17 + 24) + v4);
                if (v22 < 0) {
                  uint64_t v22 = -v22;
                }
                if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFFLL) {
                  Swift::Int v23 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  Swift::Int v23 = v22;
                }
                sub_26170C314((Swift::Int)v32, v23);
              }
              goto LABEL_39;
            }
            goto LABEL_11;
          }
LABEL_35:
          sub_2617295E0();
          swift_allocError();
          *(_OWORD *)uint64_t v24 = xmmword_26173C160;
          *(void *)(v24 + 16) = 0xE300000000000000;
          *(_OWORD *)(v24 + 24) = 0u;
          *(_OWORD *)(v24 + 40) = 0u;
          *(void *)(v24 + 56) = 0;
          *(unsigned char *)(v24 + 64) = 3;
LABEL_38:
          swift_willThrow();
        }
LABEL_39:
        swift_release();
        return;
      }
    }
    char v11 = &qword_26A92AB70;
    goto LABEL_37;
  }
}

void static WK2_CallToAction.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v9, v10);
  if (!v8)
  {
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_140();
    OUTLINED_FUNCTION_71();
    swift_release();
  }
}

void sub_261726F74(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

Swift::Int sub_261726F8C(Swift::Int a1, Swift::Int a2)
{
  return sub_26170C568(a1, a2);
}

Swift::Int sub_261726FA4(unsigned __int8 *a1, Swift::Int a2)
{
  return sub_261706B18(a1, a2);
}

void sub_261726FBC(unsigned __int8 *a1, Swift::Int position)
{
  int v4 = *a1;
  if (v4 == 1 && ((*(_DWORD *)(*((void *)a1 + 5) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v5 = sub_26173BC20();
    uint64_t v7 = v6;
    sub_2617295E0();
    swift_allocError();
    *(void *)uint64_t v8 = position;
    *(void *)(v8 + 8) = v5;
    *(void *)(v8 + 16) = v7;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 49) = 0u;
LABEL_4:
    swift_willThrow();
    return;
  }
  Verifier.rangeInBuffer(position:size:)(position, 4);
  if (!v9)
  {
    uint64_t v10 = *((void *)a1 + 5);
    uint64_t v11 = *(unsigned int *)(*(void *)(v10 + 24) + position) + position;
    if (v11 < 0) {
      uint64_t v11 = -v11;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFFLL) {
      Swift::Int v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      Swift::Int v12 = v11;
    }
    __swift_instantiateConcreteTypeFromMangledName(qword_26A92AC58);
    if (swift_dynamicCastMetatype())
    {
      Swift::Int v13 = sub_261706B18(a1, v12);
      Swift::Int v15 = v13 + v14;
      if (v13 < v13 + v14)
      {
        uint64_t v16 = v10;
        while (1)
        {
          if (v4) {
            uint64_t v16 = v10;
          }
          if (__OFADD__(v13, 4))
          {
            unint64_t v17 = v13 + 1;
            Swift::Int v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            if (v13 >= -1) {
              unint64_t v17 = v13 + 1;
            }
            else {
              unint64_t v17 = ~v13;
            }
            v13 += 4;
          }
          unint64_t v18 = *(void *)(v16 + 32);
          if ((v18 & 0x8000000000000000) != 0 || v18 < v17)
          {
            uint64_t v20 = *((void *)a1 + 1);
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v21 = v17;
            *(void *)(v21 + 8) = v20;
            *(_OWORD *)(v21 + 16) = 0u;
            *(_OWORD *)(v21 + 32) = 0u;
            *(_OWORD *)(v21 + 48) = 0u;
            char v22 = 1;
            goto LABEL_32;
          }
          unsigned int v19 = *((_DWORD *)a1 + 4) + 1;
          *((_DWORD *)a1 + 4) = v19;
          if (*((_DWORD *)a1 + 16) < v19) {
            break;
          }
          if (v13 >= v15) {
            return;
          }
        }
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v21 = 6;
        *(_OWORD *)(v21 + 8) = 0u;
        *(_OWORD *)(v21 + 24) = 0u;
        *(_OWORD *)(v21 + 40) = 0u;
        *(void *)(v21 + 56) = 0;
        char v22 = 7;
LABEL_32:
        *(unsigned char *)(v21 + 64) = v22;
        goto LABEL_4;
      }
    }
    else
    {
      sub_26170C568((Swift::Int)a1, v12);
    }
  }
}

void sub_261727200(uint64_t a1, Swift::Int a2)
{
  Swift::Int v4 = sub_261706B18((unsigned __int8 *)a1, a2);
  if (v2 || v4 >= v4 + v5) {
    return;
  }
  Swift::Int v52 = v4 + v5;
  while (1)
  {
    Swift::Int v6 = v4;
    unint64_t v7 = v4 + 4;
    if (__OFADD__(v4, 4))
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      if ((*(unsigned char *)a1 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = v4 + 4;
      if (!*(unsigned char *)a1) {
        goto LABEL_10;
      }
    }
    if (((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)v4) & 3) != 0)
    {
      uint64_t v54 = MEMORY[0x263F8E8F8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
      uint64_t v44 = sub_26173BC20();
      uint64_t v46 = v45;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v47 = v6;
      *(void *)(v47 + 8) = v44;
      *(void *)(v47 + 16) = v46;
      *(_OWORD *)(v47 + 24) = 0u;
      *(_OWORD *)(v47 + 40) = 0u;
      *(_OWORD *)(v47 + 49) = 0u;
      goto LABEL_101;
    }
LABEL_10:
    if ((v7 & 0x8000000000000000) != 0) {
      unint64_t v7 = -(uint64_t)v7;
    }
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v10 = *(void *)(v9 + 32);
    if ((v10 & 0x8000000000000000) != 0 || v10 < v7)
    {
      uint64_t v41 = *(void *)(a1 + 8);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v42 = v7;
      *(void *)(v42 + 8) = v41;
      *(_OWORD *)(v42 + 16) = 0u;
      *(_OWORD *)(v42 + 32) = 0u;
      *(_OWORD *)(v42 + 48) = 0u;
      char v43 = 1;
LABEL_97:
      *(unsigned char *)(v42 + 64) = v43;
LABEL_101:
      swift_willThrow();
      return;
    }
    unsigned int v11 = *(_DWORD *)(a1 + 16) + 4;
    *(_DWORD *)(a1 + 16) = v11;
    if (*(_DWORD *)(a1 + 64) < v11)
    {
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v42 = 6;
      *(_OWORD *)(v42 + 8) = 0u;
      *(_OWORD *)(v42 + 24) = 0u;
      *(_OWORD *)(v42 + 40) = 0u;
      *(void *)(v42 + 56) = 0;
      char v43 = 7;
      goto LABEL_97;
    }
    uint64_t v12 = v4 + *(unsigned int *)(*(void *)(v9 + 24) + v4);
    if (v12 < 0) {
      uint64_t v12 = -v12;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    Verifier.visitTable(at:)(v13, (uint64_t)&v54);
    Swift::Int v53 = v8;
    if (v56 < 5) {
      goto LABEL_93;
    }
    uint64_t v14 = v55 + 4;
    int v15 = v57;
    if (v57 == 1 && ((*(_DWORD *)(v60 + 24) + v14) & 1) != 0)
    {
      uint64_t v62 = MEMORY[0x263F8E888];
      uint64_t v40 = &qword_26A92AB70;
LABEL_103:
      __swift_instantiateConcreteTypeFromMangledName(v40);
      uint64_t v48 = sub_26173BC20();
      uint64_t v50 = v49;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v51 = v14;
      *(void *)(v51 + 8) = v48;
      *(void *)(v51 + 16) = v50;
      *(_OWORD *)(v51 + 24) = 0u;
      *(_OWORD *)(v51 + 40) = 0u;
      *(_OWORD *)(v51 + 49) = 0u;
      goto LABEL_108;
    }
    unint64_t v16 = v55 + 6;
    if (v55 + 6 < 0) {
      unint64_t v16 = -(uint64_t)v16;
    }
    unint64_t v17 = *(void *)(v60 + 32);
    if ((v17 & 0x8000000000000000) != 0 || v17 < v16)
    {
      uint64_t v39 = v58;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v37 = v16;
      goto LABEL_106;
    }
    int v18 = v59;
    unsigned int v19 = v61;
    if (v61 < v59 + 2) {
      goto LABEL_91;
    }
    uint64_t v20 = *(void *)(v60 + 24);
    uint64_t v21 = *(unsigned __int16 *)(v20 + v14);
    if (!*(_WORD *)(v20 + v14))
    {
LABEL_93:
      sub_2617295E0();
      swift_allocError();
      *(_OWORD *)uint64_t v37 = xmmword_26173C170;
      *(void *)(v37 + 16) = 0xE500000000000000;
      *(_OWORD *)(v37 + 24) = 0u;
      *(_OWORD *)(v37 + 40) = 0u;
      *(void *)(v37 + 56) = 0;
      char v38 = 3;
      goto LABEL_107;
    }
    uint64_t v14 = v54 + v21;
    if ((((_BYTE)v20 + (_BYTE)v54 + (_BYTE)v21) & 3) != 0) {
      int v22 = v57;
    }
    else {
      int v22 = 0;
    }
    if (v22 == 1)
    {
LABEL_94:
      uint64_t v62 = MEMORY[0x263F8E8F8];
      uint64_t v40 = &qword_26A92AB80;
      goto LABEL_103;
    }
    unint64_t v23 = v14 + 4 >= 0 ? v14 + 4 : -4 - v14;
    if (v17 < v23) {
      break;
    }
    if (v61 < v59 + 6) {
      goto LABEL_91;
    }
    uint64_t v24 = v14 + *(unsigned int *)(v20 + v14);
    if (v24 < 0) {
      uint64_t v24 = -v24;
    }
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v14 = v24;
    }
    __swift_instantiateConcreteTypeFromMangledName(qword_26A92AC58);
    uint64_t v25 = swift_dynamicCastMetatype();
    uint64_t v26 = (unsigned int *)(v20 + v14);
    if (((v20 + v14) & 3) != 0) {
      int v27 = v15;
    }
    else {
      int v27 = 0;
    }
    if (!v25)
    {
      if (v27) {
        goto LABEL_94;
      }
      if (v14 + 4 >= 0) {
        unint64_t v34 = v14 + 4;
      }
      else {
        unint64_t v34 = -4 - v14;
      }
      if (v17 < v34)
      {
        uint64_t v39 = v58;
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v37 = v34;
        goto LABEL_106;
      }
      int v35 = v18 + 10;
      if (v19 < v18 + 10) {
        goto LABEL_91;
      }
      uint64_t v36 = *v26;
      if ((v34 & 0x8000000000000000) != 0)
      {
        unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        if (v36 + 0x7FFFFFFFFFFFFFFFLL >= 0) {
          goto LABEL_82;
        }
        unint64_t v30 = v36 + 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        unint64_t v30 = v34 + v36;
        if ((uint64_t)(v34 + v36) >= 0)
        {
LABEL_82:
          if (v17 < v30)
          {
LABEL_92:
            uint64_t v39 = v58;
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v37 = v30;
            goto LABEL_106;
          }
          if (v19 < (int)v36 + v35) {
            goto LABEL_91;
          }
          goto LABEL_84;
        }
      }
      unint64_t v30 = -(uint64_t)v30;
      goto LABEL_82;
    }
    if (v27) {
      goto LABEL_94;
    }
    if (v14 + 4 >= 0) {
      v14 += 4;
    }
    else {
      uint64_t v14 = -4 - v14;
    }
    if (v17 < v14)
    {
      uint64_t v39 = v58;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v37 = v14;
      goto LABEL_106;
    }
    int v28 = v18 + 10;
    if (v19 < v18 + 10) {
      goto LABEL_91;
    }
    uint64_t v29 = *v26;
    if (v14 < 0)
    {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      if ((v15 & 1) == 0)
      {
        unint64_t v30 = v29 + 0x7FFFFFFFFFFFFFFFLL;
        if (v29 + 0x7FFFFFFFFFFFFFFFLL >= 0)
        {
          unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_58;
        }
LABEL_57:
        unint64_t v30 = -(uint64_t)v30;
        goto LABEL_58;
      }
    }
    else if ((v15 & 1) == 0)
    {
      goto LABEL_56;
    }
    if ((((_BYTE)v20 + (_BYTE)v14) & 3) != 0) {
      goto LABEL_94;
    }
LABEL_56:
    unint64_t v30 = v14 + v29;
    if (v14 + v29 < 0) {
      goto LABEL_57;
    }
LABEL_58:
    if (v17 < v30) {
      goto LABEL_92;
    }
    unsigned int v31 = v29 + v28;
    if (v19 < v31)
    {
LABEL_91:
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v37 = 6;
      *(_OWORD *)(v37 + 8) = 0u;
      *(_OWORD *)(v37 + 24) = 0u;
      *(_OWORD *)(v37 + 40) = 0u;
      *(void *)(v37 + 56) = 0;
      char v38 = 7;
      goto LABEL_107;
    }
    uint64_t v32 = v14 + v29;
    while (v14 < v32)
    {
      unint64_t v33 = ~v14;
      if (v14 >= -1) {
        unint64_t v33 = v14 + 1;
      }
      if (__OFADD__(v14, 4)) {
        unint64_t v30 = v14 + 1;
      }
      else {
        unint64_t v30 = v33;
      }
      if (__OFADD__(v14, 4)) {
        uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        v14 += 4;
      }
      if (v17 < v30) {
        goto LABEL_92;
      }
      if (v19 < ++v31) {
        goto LABEL_91;
      }
    }
LABEL_84:
    swift_release();
    Swift::Int v4 = v53;
    if (v53 >= v52) {
      return;
    }
  }
  uint64_t v39 = v58;
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v37 = v23;
LABEL_106:
  *(void *)(v37 + 8) = v39;
  *(_OWORD *)(v37 + 16) = 0u;
  *(_OWORD *)(v37 + 32) = 0u;
  *(_OWORD *)(v37 + 48) = 0u;
  char v38 = 1;
LABEL_107:
  *(unsigned char *)(v37 + 64) = v38;
LABEL_108:
  swift_willThrow();
  swift_release();
}

Swift::Int sub_261727850(unsigned __int8 *a1, Swift::Int a2)
{
  uint64_t v5 = sub_26173BC10();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unsigned int v11 = (char *)&v51 - v10;
  Swift::Int result = sub_261706B18(a1, a2);
  if (v2) {
    return result;
  }
  Swift::Int v14 = result;
  uint64_t v51 = v6;
  uint64_t v52 = v5;
  uint64_t v15 = result + v13;
  if (result >= result + v13) {
    return result;
  }
  int v16 = *a1;
  while (1)
  {
    unint64_t v17 = v14 + 4;
    if (__OFADD__(v14, 4))
    {
      if (v16)
      {
        uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_9;
      }
      int v19 = 0;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      if ((v17 & 0x8000000000000000) == 0) {
        goto LABEL_12;
      }
LABEL_11:
      unint64_t v17 = -(uint64_t)v17;
      goto LABEL_12;
    }
    uint64_t v18 = v14 + 4;
    if (!v16)
    {
      int v19 = 0;
      uint64_t v18 = v14 + 4;
      if ((v17 & 0x8000000000000000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_9:
    if (((*(_DWORD *)(*((void *)a1 + 5) + 24) + (int)v14) & 3) != 0)
    {
      Swift::Int v53 = (void *)MEMORY[0x263F8E8F8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
      uint64_t v46 = sub_26173BC20();
      uint64_t v48 = v47;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v49 = v14;
      goto LABEL_60;
    }
    int v19 = 1;
    if ((v17 & 0x8000000000000000) != 0) {
      goto LABEL_11;
    }
LABEL_12:
    uint64_t v20 = *((void *)a1 + 5);
    unint64_t v21 = *(void *)(v20 + 32);
    if ((v21 & 0x8000000000000000) != 0 || v21 < v17)
    {
      uint64_t v37 = *((void *)a1 + 1);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v34 = v17;
      *(void *)(v34 + 8) = v37;
      goto LABEL_50;
    }
    int v22 = *((_DWORD *)a1 + 4);
    *((_DWORD *)a1 + 4) = v22 + 4;
    unsigned int v23 = *((_DWORD *)a1 + 16);
    if (v23 < v22 + 4) {
      goto LABEL_47;
    }
    uint64_t v24 = *(void *)(v20 + 24);
    uint64_t v25 = v14 + *(unsigned int *)(v24 + v14);
    if (v25 >= 0) {
      uint64_t v26 = v14 + *(unsigned int *)(v24 + v14);
    }
    else {
      uint64_t v26 = -v25;
    }
    if ((v26 & 0x8000000000000000) == 0)
    {
      if (!v19) {
        goto LABEL_21;
      }
LABEL_20:
      if ((((_BYTE)v24 + (_BYTE)v26) & 3) == 0)
      {
LABEL_21:
        unint64_t v27 = v26 + 4;
        if (v26 + 4 >= 0) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      Swift::Int v53 = (void *)MEMORY[0x263F8E8F8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
      uint64_t v46 = sub_26173BC20();
      uint64_t v48 = v50;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v49 = v26;
LABEL_60:
      *(void *)(v49 + 8) = v46;
      *(void *)(v49 + 16) = v48;
      *(_OWORD *)(v49 + 24) = 0u;
      *(_OWORD *)(v49 + 40) = 0u;
      *(_OWORD *)(v49 + 49) = 0u;
      return swift_willThrow();
    }
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (v19) {
      goto LABEL_20;
    }
    unint64_t v27 = 0x8000000000000003;
LABEL_22:
    unint64_t v27 = -(uint64_t)v27;
LABEL_23:
    if (v21 < v27) {
      goto LABEL_48;
    }
    unsigned int v28 = v22 + 8;
    *((_DWORD *)a1 + 4) = v28;
    if (v23 < v28)
    {
LABEL_47:
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v34 = 6;
      *(_OWORD *)(v34 + 8) = 0u;
      *(_OWORD *)(v34 + 24) = 0u;
      *(_OWORD *)(v34 + 40) = 0u;
      *(void *)(v34 + 56) = 0;
      char v35 = 7;
LABEL_51:
      *(unsigned char *)(v34 + 64) = v35;
      return swift_willThrow();
    }
    int64_t v29 = *(unsigned int *)(v24 + v26);
    Swift::Int result = -4 - v26;
    if (v26 + 4 >= 0) {
      uint64_t v30 = v26 + 4;
    }
    else {
      uint64_t v30 = -4 - v26;
    }
    if ((v30 & 0x8000000000000000) == 0)
    {
      uint64_t v31 = v30 + v29;
      unint64_t v27 = v30 + v29;
      if (v30 + v29 >= 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    uint64_t v31 = v29 + 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    if (v29 + 0x7FFFFFFFFFFFFFFFLL < 0)
    {
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
      unint64_t v27 = -v31;
      goto LABEL_31;
    }
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_31:
    if (v21 < v27)
    {
LABEL_48:
      uint64_t v36 = *((void *)a1 + 1);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v34 = v27;
      *(void *)(v34 + 8) = v36;
LABEL_50:
      *(_OWORD *)(v34 + 16) = 0u;
      *(_OWORD *)(v34 + 32) = 0u;
      *(_OWORD *)(v34 + 48) = 0u;
      char v35 = 1;
      goto LABEL_51;
    }
    *((_DWORD *)a1 + 4) = v29 + v28;
    if (v23 < v29 + v28) {
      goto LABEL_47;
    }
    uint64_t v32 = v30 + v29;
    uint64_t v33 = *((void *)a1 + 1);
    if (v30 + v29 >= v33) {
      break;
    }
    if ((a1[76] & 1) == 0 && *(unsigned char *)(v24 + v32))
    {
      sub_26173BC00();
      Swift::Int v53 = sub_261702AB8((const void *)(*(void *)(v20 + 24) + v30), v29);
      uint64_t v42 = v51;
      uint64_t v41 = v52;
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v9, v11, v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
      sub_261702B48();
      uint64_t v43 = sub_26173BBF0();
      uint64_t v45 = v44;
      swift_release();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v41);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v39 = v26;
      *(void *)(v39 + 8) = v43;
      *(void *)(v39 + 16) = v45;
      *(_OWORD *)(v39 + 24) = 0u;
      *(_OWORD *)(v39 + 40) = 0u;
      *(void *)(v39 + 56) = 0;
      char v40 = 4;
      goto LABEL_57;
    }
    Swift::Int v14 = v18;
    if (v18 >= v15) {
      return result;
    }
  }
  if (v32 >= 0) {
    uint64_t v38 = v30 + v29;
  }
  else {
    uint64_t v38 = -v32;
  }
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v39 = v38;
  *(void *)(v39 + 8) = v33;
  *(_OWORD *)(v39 + 16) = 0u;
  *(_OWORD *)(v39 + 32) = 0u;
  *(_OWORD *)(v39 + 48) = 0u;
  char v40 = 1;
LABEL_57:
  *(unsigned char *)(v39 + 64) = v40;
  return swift_willThrow();
}

void sub_261727D6C(uint64_t a1, Swift::Int a2)
{
  Swift::Int v4 = sub_261706B18((unsigned __int8 *)a1, a2);
  if (v2) {
    return;
  }
  Swift::Int v6 = v4;
  uint64_t v7 = v4 + v5;
  if (v4 >= v4 + v5) {
    return;
  }
  while (1)
  {
    unint64_t v8 = v6 + 4;
    if (!__OFADD__(v6, 4)) {
      break;
    }
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (*(unsigned char *)a1) {
      goto LABEL_8;
    }
LABEL_9:
    if ((v8 & 0x8000000000000000) != 0) {
      unint64_t v8 = -(uint64_t)v8;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    unint64_t v11 = *(void *)(v10 + 32);
    if ((v11 & 0x8000000000000000) != 0 || v11 < v8)
    {
      uint64_t v20 = *(void *)(a1 + 8);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v21 = v8;
      *(void *)(v21 + 8) = v20;
      *(_OWORD *)(v21 + 16) = 0u;
      *(_OWORD *)(v21 + 32) = 0u;
      *(_OWORD *)(v21 + 48) = 0u;
      char v22 = 1;
LABEL_37:
      *(unsigned char *)(v21 + 64) = v22;
      goto LABEL_43;
    }
    unsigned int v12 = *(_DWORD *)(a1 + 16) + 4;
    *(_DWORD *)(a1 + 16) = v12;
    if (*(_DWORD *)(a1 + 64) < v12)
    {
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v21 = 6;
      *(_OWORD *)(v21 + 8) = 0u;
      *(_OWORD *)(v21 + 24) = 0u;
      *(_OWORD *)(v21 + 40) = 0u;
      *(void *)(v21 + 56) = 0;
      char v22 = 7;
      goto LABEL_37;
    }
    uint64_t v13 = v6 + *(unsigned int *)(*(void *)(v10 + 24) + v6);
    if (v13 < 0) {
      uint64_t v13 = -v13;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    Verifier.visitTable(at:)(v14, (uint64_t)&v34);
    if (v36 >= 5)
    {
      uint64_t v15 = v35 + 4;
      if (v37 == 1 && ((*(_DWORD *)(v40 + 24) + v15) & 1) != 0)
      {
        uint64_t v42 = MEMORY[0x263F8E888];
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
        uint64_t v30 = sub_26173BC20();
        uint64_t v32 = v31;
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v33 = v15;
        *(void *)(v33 + 8) = v30;
        *(void *)(v33 + 16) = v32;
        *(_OWORD *)(v33 + 24) = 0u;
        *(_OWORD *)(v33 + 40) = 0u;
        *(_OWORD *)(v33 + 49) = 0u;
        goto LABEL_41;
      }
      unint64_t v16 = v35 + 6;
      if (v35 + 6 < 0) {
        unint64_t v16 = -(uint64_t)v16;
      }
      unint64_t v17 = *(void *)(v40 + 32);
      if ((v17 & 0x8000000000000000) != 0 || v17 < v16)
      {
LABEL_38:
        uint64_t v23 = v38;
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v24 = v16;
        *(void *)(v24 + 8) = v23;
        *(_OWORD *)(v24 + 16) = 0u;
        *(_OWORD *)(v24 + 32) = 0u;
        *(_OWORD *)(v24 + 48) = 0u;
        char v25 = 1;
        goto LABEL_40;
      }
      unsigned int v18 = v39;
      v39 += 2;
      if (v41 < v39) {
        goto LABEL_39;
      }
      if (*(_WORD *)(*(void *)(v40 + 24) + v15))
      {
        uint64_t v19 = v34 + *(unsigned __int16 *)(*(void *)(v40 + 24) + v15);
        if (v19 + 1 >= 0) {
          unint64_t v16 = v19 + 1;
        }
        else {
          unint64_t v16 = ~v19;
        }
        if (v17 < v16) {
          goto LABEL_38;
        }
        unsigned int v39 = v18 + 3;
        if (v41 < v18 + 3)
        {
LABEL_39:
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v24 = 6;
          *(_OWORD *)(v24 + 8) = 0u;
          *(_OWORD *)(v24 + 24) = 0u;
          *(_OWORD *)(v24 + 40) = 0u;
          *(void *)(v24 + 56) = 0;
          char v25 = 7;
LABEL_40:
          *(unsigned char *)(v24 + 64) = v25;
LABEL_41:
          swift_willThrow();
          swift_release();
          return;
        }
      }
    }
    sub_261706814();
    swift_release();
    Swift::Int v6 = v9;
    if (v9 >= v7) {
      return;
    }
  }
  uint64_t v9 = v6 + 4;
  if (!*(unsigned char *)a1) {
    goto LABEL_9;
  }
LABEL_8:
  if (((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)v6) & 3) == 0) {
    goto LABEL_9;
  }
  uint64_t v34 = MEMORY[0x263F8E8F8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
  uint64_t v26 = sub_26173BC20();
  uint64_t v28 = v27;
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v29 = v6;
  *(void *)(v29 + 8) = v26;
  *(void *)(v29 + 16) = v28;
  *(_OWORD *)(v29 + 24) = 0u;
  *(_OWORD *)(v29 + 40) = 0u;
  *(_OWORD *)(v29 + 49) = 0u;
LABEL_43:
  swift_willThrow();
}

void sub_261728158(uint64_t a1, Swift::Int a2)
{
  Swift::Int v4 = sub_261706B18((unsigned __int8 *)a1, a2);
  if (v2) {
    return;
  }
  Swift::Int v10 = v4;
  uint64_t v11 = v4 + v5;
  if (v4 >= v4 + v5) {
    return;
  }
  int v12 = MEMORY[0x263F8E8F8];
  while (1)
  {
    unint64_t v13 = v10 + 4;
    if (!__OFADD__(v10, 4)) {
      break;
    }
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    if (*(unsigned char *)a1) {
      goto LABEL_9;
    }
LABEL_10:
    if ((v13 & 0x8000000000000000) != 0) {
      unint64_t v13 = -(uint64_t)v13;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    unint64_t v16 = *(void *)(v15 + 32);
    if ((v16 & 0x8000000000000000) != 0 || v16 < v13)
    {
      uint64_t v20 = *(void *)(a1 + 8);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v21 = v13;
      *(void *)(v21 + 8) = v20;
      *(_OWORD *)(v21 + 16) = 0u;
      *(_OWORD *)(v21 + 32) = 0u;
      *(_OWORD *)(v21 + 48) = 0u;
      char v22 = 1;
LABEL_24:
      *(unsigned char *)(v21 + 64) = v22;
      goto LABEL_25;
    }
    unsigned int v17 = *(_DWORD *)(a1 + 16) + 4;
    *(_DWORD *)(a1 + 16) = v17;
    if (*(_DWORD *)(a1 + 64) < v17)
    {
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v21 = 6;
      *(_OWORD *)(v21 + 8) = 0u;
      *(_OWORD *)(v21 + 24) = 0u;
      *(_OWORD *)(v21 + 40) = 0u;
      *(void *)(v21 + 56) = 0;
      char v22 = 7;
      goto LABEL_24;
    }
    uint64_t v18 = v10 + *(unsigned int *)(*(void *)(v15 + 24) + v10);
    if (v18 < 0) {
      uint64_t v18 = -v18;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v18;
    }
    sub_26172370C(a1, v19, v12, &qword_26A92AB80, v6, v7, v8, v9);
    Swift::Int v10 = v14;
    if (v14 >= v11) {
      return;
    }
  }
  uint64_t v14 = v10 + 4;
  if (!*(unsigned char *)a1) {
    goto LABEL_10;
  }
LABEL_9:
  if (((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)v10) & 3) == 0) {
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
  uint64_t v23 = sub_26173BC20();
  uint64_t v25 = v24;
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v26 = v10;
  *(void *)(v26 + 8) = v23;
  *(void *)(v26 + 16) = v25;
  *(_OWORD *)(v26 + 24) = 0u;
  *(_OWORD *)(v26 + 40) = 0u;
  *(_OWORD *)(v26 + 49) = 0u;
LABEL_25:
  swift_willThrow();
}

void sub_261728364(uint64_t a1, Swift::Int a2)
{
  Swift::Int v4 = sub_261706B18((unsigned __int8 *)a1, a2);
  if (v2) {
    return;
  }
  Swift::Int v6 = v4;
  uint64_t v7 = v4 + v5;
  if (v4 >= v4 + v5) {
    return;
  }
  while (1)
  {
    unint64_t v8 = v6 + 4;
    if (__OFADD__(v6, 4))
    {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      if ((*(unsigned char *)a1 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v9 = v6 + 4;
      if (!*(unsigned char *)a1) {
        goto LABEL_9;
      }
    }
    if (((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)v6) & 3) != 0)
    {
      uint64_t v36 = MEMORY[0x263F8E8F8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
      uint64_t v27 = sub_26173BC20();
      uint64_t v29 = v28;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v30 = v6;
      *(void *)(v30 + 8) = v27;
      *(void *)(v30 + 16) = v29;
      *(_OWORD *)(v30 + 24) = 0u;
      *(_OWORD *)(v30 + 40) = 0u;
      *(_OWORD *)(v30 + 49) = 0u;
      goto LABEL_43;
    }
LABEL_9:
    if ((v8 & 0x8000000000000000) != 0) {
      unint64_t v8 = -(uint64_t)v8;
    }
    uint64_t v10 = *(void *)(a1 + 40);
    unint64_t v11 = *(void *)(v10 + 32);
    if ((v11 & 0x8000000000000000) != 0 || v11 < v8)
    {
      uint64_t v21 = *(void *)(a1 + 8);
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v22 = v8;
      *(void *)(v22 + 8) = v21;
      *(_OWORD *)(v22 + 16) = 0u;
      *(_OWORD *)(v22 + 32) = 0u;
      *(_OWORD *)(v22 + 48) = 0u;
      char v23 = 1;
LABEL_38:
      *(unsigned char *)(v22 + 64) = v23;
LABEL_43:
      swift_willThrow();
      return;
    }
    unsigned int v12 = *(_DWORD *)(a1 + 16) + 4;
    *(_DWORD *)(a1 + 16) = v12;
    if (*(_DWORD *)(a1 + 64) < v12)
    {
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v22 = 6;
      *(_OWORD *)(v22 + 8) = 0u;
      *(_OWORD *)(v22 + 24) = 0u;
      *(_OWORD *)(v22 + 40) = 0u;
      *(void *)(v22 + 56) = 0;
      char v23 = 7;
      goto LABEL_38;
    }
    uint64_t v13 = v6 + *(unsigned int *)(*(void *)(v10 + 24) + v6);
    if (v13 < 0) {
      uint64_t v13 = -v13;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    Verifier.visitTable(at:)(v14, (uint64_t)&v36);
    if (v38 < 5) {
      goto LABEL_34;
    }
    uint64_t v15 = v37 + 4;
    if (v39 == 1 && ((*(_DWORD *)(v42 + 24) + v15) & 1) != 0)
    {
      uint64_t v31 = &qword_26A92AB70;
      goto LABEL_46;
    }
    unint64_t v16 = v37 + 6;
    if (v37 + 6 < 0) {
      unint64_t v16 = -(uint64_t)v16;
    }
    unint64_t v17 = *(void *)(v42 + 32);
    if ((v17 & 0x8000000000000000) != 0 || v17 < v16)
    {
LABEL_39:
      uint64_t v24 = v40;
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v25 = v16;
      *(void *)(v25 + 8) = v24;
      *(_OWORD *)(v25 + 16) = 0u;
      *(_OWORD *)(v25 + 32) = 0u;
      *(_OWORD *)(v25 + 48) = 0u;
      char v26 = 1;
      goto LABEL_41;
    }
    unsigned int v18 = v41;
    v41 += 2;
    if (v43 < v41) {
      break;
    }
    uint64_t v19 = *(void *)(v42 + 24);
    uint64_t v20 = *(unsigned __int16 *)(v19 + v15);
    if (*(_WORD *)(v19 + v15))
    {
      uint64_t v15 = v36 + v20;
      if ((v39 & (v19 + v36 + v20)) == 1)
      {
        uint64_t v31 = (uint64_t *)&unk_26A92AC50;
LABEL_46:
        __swift_instantiateConcreteTypeFromMangledName(v31);
        uint64_t v32 = sub_26173BC20();
        uint64_t v34 = v33;
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v35 = v15;
        *(void *)(v35 + 8) = v32;
        *(void *)(v35 + 16) = v34;
        *(_OWORD *)(v35 + 24) = 0u;
        *(_OWORD *)(v35 + 40) = 0u;
        *(_OWORD *)(v35 + 49) = 0u;
        goto LABEL_47;
      }
      if (v15 + 2 >= 0) {
        unint64_t v16 = v15 + 2;
      }
      else {
        unint64_t v16 = -2 - v15;
      }
      if (v17 < v16) {
        goto LABEL_39;
      }
      unsigned int v41 = v18 + 4;
      if (v43 < v18 + 4) {
        break;
      }
    }
LABEL_34:
    sub_26170C1D8();
    swift_release();
    Swift::Int v6 = v9;
    if (v9 >= v7) {
      return;
    }
  }
  sub_2617295E0();
  swift_allocError();
  *(void *)uint64_t v25 = 6;
  *(_OWORD *)(v25 + 8) = 0u;
  *(_OWORD *)(v25 + 24) = 0u;
  *(_OWORD *)(v25 + 40) = 0u;
  *(void *)(v25 + 56) = 0;
  char v26 = 7;
LABEL_41:
  *(unsigned char *)(v25 + 64) = v26;
LABEL_47:
  swift_willThrow();
  swift_release();
}

void sub_261728784(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v23);
  if (!v2)
  {
    unint64_t v3 = v25;
    if (v25 < 5) {
      goto LABEL_31;
    }
    uint64_t v4 = v24 + 4;
    if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v24 + 4, 2);
      if (v5) {
        goto LABEL_31;
      }
      if (*(_WORD *)(*(void *)(v27 + 24) + v4))
      {
        Verifier.rangeInBuffer(position:size:)(v23 + *(unsigned __int16 *)(*(void *)(v27 + 24) + v4), 1);
        if (v6) {
          goto LABEL_31;
        }
      }
      if (v3 < 7) {
        goto LABEL_31;
      }
      uint64_t v4 = v24 + 6;
      int v7 = v26;
      if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v24 + 6, 2);
        if (v8) {
          goto LABEL_31;
        }
        uint64_t v9 = *(void *)(v27 + 24);
        uint64_t v10 = *(unsigned __int16 *)(v9 + v4);
        if (*(_WORD *)(v9 + v4))
        {
          uint64_t v4 = v23 + v10;
          if ((((_BYTE)v9 + (_BYTE)v23 + (_BYTE)v10) & 3) != 0) {
            int v11 = v7;
          }
          else {
            int v11 = 0;
          }
          if (v11 == 1)
          {
LABEL_17:
            uint64_t v28 = MEMORY[0x263F8D5C8];
            unsigned int v12 = &qword_26A92AB88;
LABEL_30:
            __swift_instantiateConcreteTypeFromMangledName(v12);
            uint64_t v19 = sub_26173BC20();
            uint64_t v21 = v20;
            sub_2617295E0();
            swift_allocError();
            *(void *)uint64_t v22 = v4;
            *(void *)(v22 + 8) = v19;
            *(void *)(v22 + 16) = v21;
            *(_OWORD *)(v22 + 24) = 0u;
            *(_OWORD *)(v22 + 40) = 0u;
            *(_OWORD *)(v22 + 49) = 0u;
            swift_willThrow();
            goto LABEL_31;
          }
          Verifier.rangeInBuffer(position:size:)(v23 + v10, 4);
          if (v13) {
            goto LABEL_31;
          }
        }
        if (v3 < 9)
        {
LABEL_31:
          swift_release();
          return;
        }
        uint64_t v4 = v24 + 8;
        int v14 = v26;
        if (v26 != 1 || ((*(_DWORD *)(v27 + 24) + v4) & 1) == 0)
        {
          Verifier.rangeInBuffer(position:size:)(v24 + 8, 2);
          if (v15) {
            goto LABEL_31;
          }
          uint64_t v16 = *(void *)(v27 + 24);
          uint64_t v17 = *(unsigned __int16 *)(v16 + v4);
          if (!*(_WORD *)(v16 + v4)) {
            goto LABEL_31;
          }
          uint64_t v4 = v23 + v17;
          if ((((_BYTE)v16 + (_BYTE)v23 + (_BYTE)v17) & 3) != 0) {
            int v18 = v14;
          }
          else {
            int v18 = 0;
          }
          if (v18 == 1) {
            goto LABEL_17;
          }
          Verifier.rangeInBuffer(position:size:)(v23 + v17, 4);
          goto LABEL_31;
        }
      }
    }
    uint64_t v28 = MEMORY[0x263F8E888];
    unsigned int v12 = &qword_26A92AB70;
    goto LABEL_30;
  }
}

void sub_2617289EC(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v27);
  if (!v2)
  {
    unint64_t v3 = v29;
    if (v29 < 5) {
      goto LABEL_35;
    }
    uint64_t v4 = v28 + 4;
    int v5 = v30;
    if (v30 != 1 || ((*(_DWORD *)(v31 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v28 + 4, 2);
      if (v6) {
        goto LABEL_35;
      }
      uint64_t v7 = *(void *)(v31 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v27 + v8;
        if ((((_BYTE)v7 + (_BYTE)v27 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v27 + v8, 4);
        if (v11) {
          goto LABEL_35;
        }
      }
      if (v3 < 7) {
        goto LABEL_35;
      }
      uint64_t v4 = v28 + 6;
      int v12 = v30;
      if (v30 == 1 && ((*(_DWORD *)(v31 + 24) + v4) & 1) != 0) {
        goto LABEL_33;
      }
      Verifier.rangeInBuffer(position:size:)(v28 + 6, 2);
      if (v13) {
        goto LABEL_35;
      }
      uint64_t v14 = *(void *)(v31 + 24);
      uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
      if (*(_WORD *)(v14 + v4))
      {
        uint64_t v4 = v27 + v15;
        if ((((_BYTE)v14 + (_BYTE)v27 + (_BYTE)v15) & 3) != 0) {
          int v16 = v12;
        }
        else {
          int v16 = 0;
        }
        if (v16 == 1)
        {
LABEL_11:
          uint64_t v32 = MEMORY[0x263F8D5C8];
          uint64_t v10 = &qword_26A92AB88;
LABEL_34:
          __swift_instantiateConcreteTypeFromMangledName(v10);
          uint64_t v23 = sub_26173BC20();
          uint64_t v25 = v24;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v26 = v4;
          *(void *)(v26 + 8) = v23;
          *(void *)(v26 + 16) = v25;
          *(_OWORD *)(v26 + 24) = 0u;
          *(_OWORD *)(v26 + 40) = 0u;
          *(_OWORD *)(v26 + 49) = 0u;
          swift_willThrow();
          goto LABEL_35;
        }
        Verifier.rangeInBuffer(position:size:)(v27 + v15, 4);
        if (v17) {
          goto LABEL_35;
        }
      }
      if (v3 < 9)
      {
LABEL_35:
        swift_release();
        return;
      }
      uint64_t v4 = v28 + 8;
      int v18 = v30;
      if (v30 != 1 || ((*(_DWORD *)(v31 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v28 + 8, 2);
        if (v19) {
          goto LABEL_35;
        }
        uint64_t v20 = *(void *)(v31 + 24);
        uint64_t v21 = *(unsigned __int16 *)(v20 + v4);
        if (!*(_WORD *)(v20 + v4)) {
          goto LABEL_35;
        }
        uint64_t v4 = v27 + v21;
        if ((((_BYTE)v20 + (_BYTE)v27 + (_BYTE)v21) & 3) != 0) {
          int v22 = v18;
        }
        else {
          int v22 = 0;
        }
        if (v22 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v27 + v21, 4);
        goto LABEL_35;
      }
    }
LABEL_33:
    uint64_t v32 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_34;
  }
}

void sub_261728C6C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v21);
  if (!v2)
  {
    unint64_t v3 = v23;
    if (v23 < 5) {
      goto LABEL_25;
    }
    uint64_t v4 = v22 + 4;
    int v5 = v24;
    if (v24 != 1 || ((*(_DWORD *)(v25 + 24) + v4) & 1) == 0)
    {
      Verifier.rangeInBuffer(position:size:)(v22 + 4, 2);
      if (v6) {
        goto LABEL_25;
      }
      uint64_t v7 = *(void *)(v25 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v21 + v8;
        if ((((_BYTE)v7 + (_BYTE)v21 + (_BYTE)v8) & 3) != 0) {
          int v9 = v5;
        }
        else {
          int v9 = 0;
        }
        if (v9 == 1)
        {
LABEL_11:
          uint64_t v26 = MEMORY[0x263F8D5C8];
          uint64_t v10 = &qword_26A92AB88;
LABEL_24:
          __swift_instantiateConcreteTypeFromMangledName(v10);
          uint64_t v17 = sub_26173BC20();
          uint64_t v19 = v18;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v20 = v4;
          *(void *)(v20 + 8) = v17;
          *(void *)(v20 + 16) = v19;
          *(_OWORD *)(v20 + 24) = 0u;
          *(_OWORD *)(v20 + 40) = 0u;
          *(_OWORD *)(v20 + 49) = 0u;
          swift_willThrow();
          goto LABEL_25;
        }
        Verifier.rangeInBuffer(position:size:)(v21 + v8, 4);
        if (v11) {
          goto LABEL_25;
        }
      }
      if (v3 < 7)
      {
LABEL_25:
        swift_release();
        return;
      }
      uint64_t v4 = v22 + 6;
      int v12 = v24;
      if (v24 != 1 || ((*(_DWORD *)(v25 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v22 + 6, 2);
        if (v13) {
          goto LABEL_25;
        }
        uint64_t v14 = *(void *)(v25 + 24);
        uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
        if (!*(_WORD *)(v14 + v4)) {
          goto LABEL_25;
        }
        uint64_t v4 = v21 + v15;
        if ((((_BYTE)v14 + (_BYTE)v21 + (_BYTE)v15) & 3) != 0) {
          int v16 = v12;
        }
        else {
          int v16 = 0;
        }
        if (v16 == 1) {
          goto LABEL_11;
        }
        Verifier.rangeInBuffer(position:size:)(v21 + v15, 4);
        goto LABEL_25;
      }
    }
    uint64_t v26 = MEMORY[0x263F8E888];
    uint64_t v10 = &qword_26A92AB70;
    goto LABEL_24;
  }
}

void sub_261728E64(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v15);
  uint64_t v3 = v2;
  if (!v2)
  {
    if (v17 >= 5)
    {
      uint64_t v4 = v16 + 4;
      int v5 = v18;
      if (v18 == 1 && ((*(_DWORD *)(v19 + 24) + v4) & 1) != 0)
      {
        int v9 = &qword_26A92AB70;
        goto LABEL_10;
      }
      Verifier.rangeInBuffer(position:size:)(v16 + 4, 2);
      uint64_t v3 = v6;
      if (v6)
      {
LABEL_14:
        swift_release();
        return;
      }
      uint64_t v7 = *(void *)(v19 + 24);
      uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
      if (*(_WORD *)(v7 + v4))
      {
        uint64_t v4 = v15 + v8;
        if ((v5 & (v7 + v15 + v8)) == 1)
        {
          int v9 = (uint64_t *)&unk_26A92AC50;
LABEL_10:
          __swift_instantiateConcreteTypeFromMangledName(v9);
          uint64_t v10 = sub_26173BC20();
          uint64_t v12 = v11;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v13 = v4;
          *(void *)(v13 + 8) = v10;
          *(void *)(v13 + 16) = v12;
          *(_OWORD *)(v13 + 24) = 0u;
          *(_OWORD *)(v13 + 40) = 0u;
          *(_OWORD *)(v13 + 49) = 0u;
          swift_willThrow();
          goto LABEL_14;
        }
        Verifier.rangeInBuffer(position:size:)(v15 + v8, 2);
        uint64_t v3 = v14;
        if (v14) {
          goto LABEL_14;
        }
      }
    }
    sub_26170C1D8();
    if (!v3) {
      sub_26170C1D8();
    }
    goto LABEL_14;
  }
}

void sub_261729064(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v39);
  if (!v2)
  {
    unint64_t v3 = v41;
    if (v41 < 5) {
      goto LABEL_56;
    }
    uint64_t v4 = v40 + 4;
    int v5 = v42;
    if (v42 == 1 && ((*(_DWORD *)(v43 + 24) + v4) & 1) != 0) {
      goto LABEL_54;
    }
    Verifier.rangeInBuffer(position:size:)(v40 + 4, 2);
    if (v6) {
      goto LABEL_56;
    }
    uint64_t v7 = *(void *)(v43 + 24);
    uint64_t v8 = *(unsigned __int16 *)(v7 + v4);
    if (*(_WORD *)(v7 + v4))
    {
      uint64_t v4 = v39 + v8;
      if ((((_BYTE)v7 + (_BYTE)v39 + (_BYTE)v8) & 3) != 0) {
        int v9 = v5;
      }
      else {
        int v9 = 0;
      }
      if (v9 == 1)
      {
        uint64_t v44 = MEMORY[0x263F8E8F8];
        uint64_t v10 = &qword_26A92AB80;
LABEL_55:
        __swift_instantiateConcreteTypeFromMangledName(v10);
        uint64_t v35 = sub_26173BC20();
        uint64_t v37 = v36;
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v38 = v4;
        *(void *)(v38 + 8) = v35;
        *(void *)(v38 + 16) = v37;
        *(_OWORD *)(v38 + 24) = 0u;
        *(_OWORD *)(v38 + 40) = 0u;
        *(_OWORD *)(v38 + 49) = 0u;
        swift_willThrow();
        goto LABEL_56;
      }
      Verifier.rangeInBuffer(position:size:)(v39 + v8, 4);
      if (v11) {
        goto LABEL_56;
      }
    }
    if (v3 <= 6) {
      goto LABEL_56;
    }
    uint64_t v4 = v40 + 6;
    int v12 = v42;
    if (v42 == 1 && ((*(_DWORD *)(v43 + 24) + v4) & 1) != 0) {
      goto LABEL_54;
    }
    Verifier.rangeInBuffer(position:size:)(v40 + 6, 2);
    if (v13) {
      goto LABEL_56;
    }
    uint64_t v14 = *(void *)(v43 + 24);
    uint64_t v15 = *(unsigned __int16 *)(v14 + v4);
    if (*(_WORD *)(v14 + v4))
    {
      uint64_t v4 = v39 + v15;
      if ((((_BYTE)v14 + (_BYTE)v39 + (_BYTE)v15) & 3) != 0) {
        int v16 = v12;
      }
      else {
        int v16 = 0;
      }
      if (v16 == 1) {
        goto LABEL_22;
      }
      Verifier.rangeInBuffer(position:size:)(v39 + v15, 4);
      if (v17) {
        goto LABEL_56;
      }
    }
    if (v3 < 9)
    {
LABEL_56:
      swift_release();
      return;
    }
    uint64_t v4 = v40 + 8;
    int v18 = v42;
    if (v42 == 1 && ((*(_DWORD *)(v43 + 24) + v4) & 1) != 0)
    {
LABEL_54:
      uint64_t v44 = MEMORY[0x263F8E888];
      uint64_t v10 = &qword_26A92AB70;
      goto LABEL_55;
    }
    Verifier.rangeInBuffer(position:size:)(v40 + 8, 2);
    if (v19) {
      goto LABEL_56;
    }
    uint64_t v20 = *(void *)(v43 + 24);
    uint64_t v21 = *(unsigned __int16 *)(v20 + v4);
    if (*(_WORD *)(v20 + v4))
    {
      uint64_t v4 = v39 + v21;
      if ((((_BYTE)v20 + (_BYTE)v39 + (_BYTE)v21) & 3) != 0) {
        int v22 = v18;
      }
      else {
        int v22 = 0;
      }
      if (v22 == 1) {
        goto LABEL_22;
      }
      Verifier.rangeInBuffer(position:size:)(v39 + v21, 4);
      if (v23) {
        goto LABEL_56;
      }
    }
    if (v3 < 0xB) {
      goto LABEL_56;
    }
    uint64_t v4 = v40 + 10;
    int v24 = v42;
    if (v42 == 1 && ((*(_DWORD *)(v43 + 24) + v4) & 1) != 0) {
      goto LABEL_54;
    }
    Verifier.rangeInBuffer(position:size:)(v40 + 10, 2);
    if (v25) {
      goto LABEL_56;
    }
    uint64_t v26 = *(void *)(v43 + 24);
    uint64_t v27 = *(unsigned __int16 *)(v26 + v4);
    if (!*(_WORD *)(v26 + v4)) {
      goto LABEL_44;
    }
    uint64_t v4 = v39 + v27;
    if ((((_BYTE)v26 + (_BYTE)v39 + (_BYTE)v27) & 3) != 0) {
      int v28 = v24;
    }
    else {
      int v28 = 0;
    }
    if (v28 != 1)
    {
      Verifier.rangeInBuffer(position:size:)(v39 + v27, 4);
      if (v29) {
        goto LABEL_56;
      }
LABEL_44:
      if (v3 < 0xD) {
        goto LABEL_56;
      }
      uint64_t v4 = v40 + 12;
      int v30 = v42;
      if (v42 != 1 || ((*(_DWORD *)(v43 + 24) + v4) & 1) == 0)
      {
        Verifier.rangeInBuffer(position:size:)(v40 + 12, 2);
        if (v31) {
          goto LABEL_56;
        }
        uint64_t v32 = *(void *)(v43 + 24);
        uint64_t v33 = *(unsigned __int16 *)(v32 + v4);
        if (!*(_WORD *)(v32 + v4)) {
          goto LABEL_56;
        }
        uint64_t v4 = v39 + v33;
        if ((((_BYTE)v32 + (_BYTE)v39 + (_BYTE)v33) & 3) != 0) {
          int v34 = v30;
        }
        else {
          int v34 = 0;
        }
        if (v34 == 1) {
          goto LABEL_22;
        }
        Verifier.rangeInBuffer(position:size:)(v39 + v33, 4);
        goto LABEL_56;
      }
      goto LABEL_54;
    }
LABEL_22:
    uint64_t v44 = MEMORY[0x263F8D5C8];
    uint64_t v10 = &qword_26A92AB88;
    goto LABEL_55;
  }
}

void sub_26172940C(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v11);
  uint64_t v3 = v2;
  if (!v2)
  {
    if (v13 >= 5)
    {
      uint64_t v4 = v12 + 4;
      if (v14 == 1 && ((*(_DWORD *)(v15 + 24) + v4) & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
        uint64_t v7 = sub_26173BC20();
        uint64_t v9 = v8;
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v10 = v4;
        *(void *)(v10 + 8) = v7;
        *(void *)(v10 + 16) = v9;
        *(_OWORD *)(v10 + 24) = 0u;
        *(_OWORD *)(v10 + 40) = 0u;
        *(_OWORD *)(v10 + 49) = 0u;
        swift_willThrow();
LABEL_11:
        swift_release();
        return;
      }
      Verifier.rangeInBuffer(position:size:)(v12 + 4, 2);
      uint64_t v3 = v5;
      if (v5) {
        goto LABEL_11;
      }
      if (*(_WORD *)(*(void *)(v15 + 24) + v4))
      {
        Verifier.rangeInBuffer(position:size:)(v11 + *(unsigned __int16 *)(*(void *)(v15 + 24) + v4), 1);
        uint64_t v3 = v6;
        if (v6) {
          goto LABEL_11;
        }
      }
    }
    sub_26170C1D8();
    if (!v3) {
      sub_26170C1D8();
    }
    goto LABEL_11;
  }
}

unint64_t sub_2617295E0()
{
  unint64_t result = qword_26A92AB78;
  if (!qword_26A92AB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AB78);
  }
  return result;
}

unint64_t sub_261729630()
{
  unint64_t result = qword_26A92AB90;
  if (!qword_26A92AB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AB90);
  }
  return result;
}

_UNKNOWN **sub_26172967C()
{
  return &protocol witness table for UInt8;
}

_UNKNOWN **sub_261729688()
{
  return &protocol witness table for UInt8;
}

unint64_t sub_261729698()
{
  unint64_t result = qword_26A92AB98;
  if (!qword_26A92AB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AB98);
  }
  return result;
}

unint64_t sub_2617296E8()
{
  unint64_t result = qword_26A92ABA0;
  if (!qword_26A92ABA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABA0);
  }
  return result;
}

unint64_t sub_261729738()
{
  unint64_t result = qword_26A92ABA8;
  if (!qword_26A92ABA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABA8);
  }
  return result;
}

unint64_t sub_261729788()
{
  unint64_t result = qword_26A92ABB0;
  if (!qword_26A92ABB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABB0);
  }
  return result;
}

unint64_t sub_2617297D8()
{
  unint64_t result = qword_26A92ABB8;
  if (!qword_26A92ABB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABB8);
  }
  return result;
}

unint64_t sub_261729828()
{
  unint64_t result = qword_26A92ABC0;
  if (!qword_26A92ABC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABC0);
  }
  return result;
}

unint64_t sub_261729878()
{
  unint64_t result = qword_26A92ABC8;
  if (!qword_26A92ABC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABC8);
  }
  return result;
}

unint64_t sub_2617298C8()
{
  unint64_t result = qword_26A92ABD0;
  if (!qword_26A92ABD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABD0);
  }
  return result;
}

unint64_t sub_261729918()
{
  unint64_t result = qword_26A92ABD8;
  if (!qword_26A92ABD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABD8);
  }
  return result;
}

unint64_t sub_261729968()
{
  unint64_t result = qword_26A92ABE0;
  if (!qword_26A92ABE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABE0);
  }
  return result;
}

unint64_t sub_2617299B8()
{
  unint64_t result = qword_26A92ABE8;
  if (!qword_26A92ABE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABE8);
  }
  return result;
}

unint64_t sub_261729A08()
{
  unint64_t result = qword_26A92ABF0;
  if (!qword_26A92ABF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABF0);
  }
  return result;
}

unint64_t sub_261729A58()
{
  unint64_t result = qword_26A92ABF8;
  if (!qword_26A92ABF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92ABF8);
  }
  return result;
}

unint64_t sub_261729AA8()
{
  unint64_t result = qword_26A92AC00;
  if (!qword_26A92AC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC00);
  }
  return result;
}

unint64_t sub_261729AF8()
{
  unint64_t result = qword_26A92AC08;
  if (!qword_26A92AC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC08);
  }
  return result;
}

unint64_t sub_261729B48()
{
  unint64_t result = qword_26A92AC10;
  if (!qword_26A92AC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC10);
  }
  return result;
}

unint64_t sub_261729B98()
{
  unint64_t result = qword_26A92AC18;
  if (!qword_26A92AC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC18);
  }
  return result;
}

unint64_t sub_261729BE8()
{
  unint64_t result = qword_26A92AC20;
  if (!qword_26A92AC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC20);
  }
  return result;
}

unint64_t sub_261729C38()
{
  unint64_t result = qword_26A92AC28;
  if (!qword_26A92AC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC28);
  }
  return result;
}

unint64_t sub_261729C88()
{
  unint64_t result = qword_26A92AC30;
  if (!qword_26A92AC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC30);
  }
  return result;
}

unint64_t sub_261729CD8()
{
  unint64_t result = qword_26A92AC38;
  if (!qword_26A92AC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC38);
  }
  return result;
}

unint64_t sub_261729D28()
{
  unint64_t result = qword_26A92AC40;
  if (!qword_26A92AC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC40);
  }
  return result;
}

unint64_t sub_261729D78()
{
  unint64_t result = qword_26A92AC48;
  if (!qword_26A92AC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AC48);
  }
  return result;
}

uint64_t sub_261729DCC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_261729DD8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for WK2_WeatherCondition()
{
}

uint64_t getEnumTagSinglePayload for WK2_ConditionCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xDF)
  {
    if (a2 + 33 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 33) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 34;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x22;
  int v5 = v6 - 34;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WK2_ConditionCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 33 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 33) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDE)
  {
    unsigned int v6 = ((a2 - 223) >> 8) + 1;
    *unint64_t result = a2 + 33;
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
        JUMPOUT(0x261729F4CLL);
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
          *unint64_t result = a2 + 33;
        break;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WK2_Placement(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF2)
  {
    if (a2 + 14 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 14) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 15;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v5 = v6 - 15;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WK2_Placement(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x26172A0D0);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_Placement()
{
}

uint64_t getEnumTagSinglePayload for WK2_ComparisonCondition(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WK2_ComparisonCondition(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26172A258);
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

void type metadata accessor for WK2_ComparisonCondition()
{
}

void type metadata accessor for WK2_Deviation()
{
}

uint64_t getEnumTagSinglePayload for WK2_ComparisonBaselineType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WK2_ComparisonBaselineType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x26172A390);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for WK2_ComparisonBaselineType()
{
}

uint64_t _s11WeatherData20WK2_WeatherConditionOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 7);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 7);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 7);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

unsigned char *_s11WeatherData20WK2_WeatherConditionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x26172A50CLL);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_167(result, a2 + 6);
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_AlertSeverity()
{
}

void type metadata accessor for WK2_AlertSignificance()
{
}

void type metadata accessor for WK2_AlertUrgency()
{
}

uint64_t _s11WeatherData13WK2_DeviationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 5);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 5);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 5);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

unsigned char *_s11WeatherData13WK2_DeviationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x26172A6A0);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_167(result, a2 + 4);
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_AlertCertainty()
{
}

void type metadata accessor for WK2_AlertImportance()
{
}

uint64_t getEnumTagSinglePayload for WK2_AlertResponseType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WK2_AlertResponseType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x26172A834);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_AlertResponseType()
{
}

uint64_t _s11WeatherData17WK2_PressureTrendOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

unsigned char *_s11WeatherData17WK2_PressureTrendOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x26172A9A8);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_167(result, a2 + 2);
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_ChangeDirection()
{
}

uint64_t _s11WeatherData25WK2_PreviousDayComparisonOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 6);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 6);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 6);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

uint64_t _s11WeatherData17WK2_PollutantTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 13);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 13);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 13);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

unsigned char *_s11WeatherData17WK2_PollutantTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
    switch(v5)
    {
      case 1:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x26172ABC8);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_167(result, a2 + 12);
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_TideEventType()
{
}

uint64_t _s11WeatherData17WK2_PollutantUnitOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

unsigned char *_s11WeatherData17WK2_PollutantUnitOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x26172AD3CLL);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_167(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_PrecipitationConditionParameterType()
{
}

uint64_t _s11WeatherData13WK2_MoonPhaseOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_169(-1);
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 8);
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
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 8);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_169((*a1 | (v4 << 8)) - 8);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_169(v8);
}

unsigned char *_s11WeatherData13WK2_MoonPhaseOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_168((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_165((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x26172AEB0);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_166((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_167(result, a2 + 7);
        break;
    }
  }
  return result;
}

void type metadata accessor for WK2_StatementParameterType()
{
}

uint64_t initializeBufferWithCopyOfBuffer for Table(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void type metadata accessor for WK2_PeriodicForecasts()
{
}

void type metadata accessor for WK2_PrecipitationRange()
{
}

void type metadata accessor for WK2_ForecastPeriodSummary()
{
}

void type metadata accessor for WK2_NewsPlacement()
{
}

void type metadata accessor for WK2_WeatherAlertSummary()
{
}

void type metadata accessor for WK2_TrendDeviation()
{
}

void type metadata accessor for WK2_HistoricalComparison()
{
}

void type metadata accessor for WK2_HourMarineConditions()
{
}

void type metadata accessor for WK2_TideEvent()
{
}

void type metadata accessor for WK2_HourTide()
{
}

void type metadata accessor for WK2_PrecipitationConditionParameter()
{
}

void type metadata accessor for WK2_Article()
{
}

void type metadata accessor for WK2_UUID()
{
}

void type metadata accessor for WK2_Swell()
{
}

uint64_t assignWithCopy for Table(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for Table(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

void type metadata accessor for WK2_CallToAction()
{
}

void OUTLINED_FUNCTION_23(uint64_t a1@<X8>)
{
  *(unsigned char *)(*(void *)(v2 + 24) + a1 + ~v4) = v3;
  *(void *)(v1 + 16) = v5;
}

void OUTLINED_FUNCTION_39(uint64_t a1@<X8>, uint64_t a2, uint64_t a3)
{
  sub_261708924(a3 + a1);
}

void OUTLINED_FUNCTION_53()
{
  *(void *)(v0 + 16) = v1;
}

void OUTLINED_FUNCTION_55()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(0, v1, v3);
}

void OUTLINED_FUNCTION_56()
{
  Swift::Int v3 = *(void *)(v0 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v1, v3);
}

void OUTLINED_FUNCTION_64(uint64_t a1@<X8>, uint64_t a2, uint64_t a3)
{
  sub_2617088FC(a3 + a1);
}

void OUTLINED_FUNCTION_67()
{
  sub_261708290();
}

double OUTLINED_FUNCTION_79(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return result;
}

unint64_t OUTLINED_FUNCTION_87()
{
  return sub_2617295E0();
}

uint64_t OUTLINED_FUNCTION_92@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned __int8 *)(a1 + v1);
}

uint64_t OUTLINED_FUNCTION_96(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(void *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 64) = 3;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_98()
{
  sub_26170C1D8();
}

int64x2_t OUTLINED_FUNCTION_99@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

double OUTLINED_FUNCTION_105(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 6;
  double result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(void *)(a2 + 56) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_26173BC20();
}

double OUTLINED_FUNCTION_115()
{
  return 0.0;
}

void OUTLINED_FUNCTION_135(uint64_t a1, void *a2)
{
  *a2 = v3;
  a2[1] = v2;
  a2[2] = v4;
}

void OUTLINED_FUNCTION_137()
{
  static WK2_Weather.add(currentWeather:_:)();
}

double OUTLINED_FUNCTION_139(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(void *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 64) = 3;
  return result;
}

uint64_t OUTLINED_FUNCTION_140()
{
  return 6;
}

void OUTLINED_FUNCTION_141(unsigned __int16 a1)
{
  sub_261708700(a1, 0x65726944646E6977, 0xED00006E6F697463, 0);
}

uint64_t OUTLINED_FUNCTION_144()
{
  return v0;
}

void OUTLINED_FUNCTION_160(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 12;
}

uint64_t OUTLINED_FUNCTION_162(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return swift_willThrow();
}

unsigned char *OUTLINED_FUNCTION_167@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *double result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_168@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_169@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_176()
{
  return 8;
}

uint64_t OUTLINED_FUNCTION_178@<X0>(int a1@<W8>)
{
  *(_DWORD *)(v1 - 164) = a1;
  return v1 - 164;
}

void OUTLINED_FUNCTION_181(uint64_t a1, void *a2)
{
  *a2 = v4;
  a2[1] = v2;
  a2[2] = v3;
}

double OUTLINED_FUNCTION_182(uint64_t a1, _OWORD *a2)
{
  double result = 0.0;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_184()
{
  return 14;
}

uint64_t OUTLINED_FUNCTION_186()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_189()
{
  return sub_26173BC20();
}

void OUTLINED_FUNCTION_190()
{
  static WK2_DayWeatherConditions.add(forecastStart:_:)();
}

void OUTLINED_FUNCTION_191()
{
  static WK2_Weather.add(forecastDaily:_:)();
}

int64x2_t OUTLINED_FUNCTION_203@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

int64x2_t OUTLINED_FUNCTION_204@<Q0>(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  int64x2_t result = vaddq_s64(a2, a3);
  *(int64x2_t *)(a1 + 72) = result;
  return result;
}

void OUTLINED_FUNCTION_210(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 46;
}

void OUTLINED_FUNCTION_211(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 44;
}

void OUTLINED_FUNCTION_214(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 32;
}

void OUTLINED_FUNCTION_215(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(a1 + 80);
  *(_DWORD *)uint64_t v3 = v2;
  *(_WORD *)(v3 + 4) = 40;
}

uint64_t OUTLINED_FUNCTION_218@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned __int16 *)(a1 + v1);
}

void OUTLINED_FUNCTION_219()
{
  static WK2_HourTide.add(height:_:)();
}

uint64_t OUTLINED_FUNCTION_220()
{
  return v0;
}

void OUTLINED_FUNCTION_230()
{
  static WK2_Weather.add(news:_:)();
}

void OUTLINED_FUNCTION_231()
{
  static WK2_Weather.add(forecastNextHour:_:)();
}

void OUTLINED_FUNCTION_232()
{
  static WK2_Weather.add(forecastHourly:_:)();
}

void OUTLINED_FUNCTION_239(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  sub_261715A08(a1, a2, a3, 0);
}

uint64_t OUTLINED_FUNCTION_243()
{
  return v0;
}

void OUTLINED_FUNCTION_246()
{
  static WK2_Pollutant.add(pollutantType:_:)();
}

uint64_t OUTLINED_FUNCTION_248()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_249()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_251()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_252()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_253()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_254()
{
  return v0;
}

void OUTLINED_FUNCTION_255(uint64_t a1, void *a2)
{
  *a2 = v2;
}

void OUTLINED_FUNCTION_257(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  sub_261715B38(a1, 0xD000000000000014, a3, 0);
}

double OUTLINED_FUNCTION_258(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 49) = 0u;
  return result;
}

void OUTLINED_FUNCTION_260()
{
  static WK2_ForecastCondition.add(endTime:_:)();
}

uint64_t OUTLINED_FUNCTION_262()
{
  return *v0;
}

uint64_t static Verifiable.verifyRange<A>(_:at:of:)(uint64_t a1, Swift::Int position, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = position;
  if (*(unsigned char *)a1 == 1 && ((*(_DWORD *)(*(void *)(a1 + 40) + 24) + (int)position) & 3) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v9 = sub_26173BC20();
    uint64_t v11 = v10;
    sub_2617295E0();
    uint64_t v12 = OUTLINED_FUNCTION_44();
    *uint64_t v13 = v7;
    v13[1] = v9;
    v13[2] = v11;
    OUTLINED_FUNCTION_36(v12, (uint64_t)v13);
  }
  else
  {
    Verifier.rangeInBuffer(position:size:)(position, 4);
    if (!v14)
    {
      Swift::Int v15 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 24) + v7);
      unint64_t v16 = v7 + 4;
      if (v7 + 4 < 0) {
        unint64_t v16 = -4 - v7;
      }
      if (v16 >= 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v16;
      }
      Verifier.isAligned<A>(position:type:)(v7, a3, a5);
      Verifier.rangeInBuffer(position:size:)(v7, v15);
    }
  }
  return v7;
}

void static Verifiable<>.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_26172BC80(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

uint64_t static Vector.verify<A>(_:at:of:)(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  type metadata accessor for ForwardOffset();
  if (!swift_dynamicCastMetatype()) {
    return static Verifiable.verifyRange<A>(_:at:of:)(a1, a2, a5, v13, a5);
  }
  type metadata accessor for Vector();
  uint64_t result = static Verifiable.verifyRange<A>(_:at:of:)(a1, a2, MEMORY[0x263F8E8F8], v14, MEMORY[0x263F8E8F8]);
  if (!v7)
  {
    uint64_t v17 = result;
    uint64_t v18 = result + v16;
    if (result < result + v16)
    {
      uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 8);
      do
      {
        uint64_t result = v19(a1, v17, a4, a4, a7, a4, a7);
        if (__OFADD__(v17, 4)) {
          uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          v17 += 4;
        }
      }
      while (v17 < v18);
    }
  }
  return result;
}

uint64_t type metadata accessor for ForwardOffset()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Vector()
{
  return swift_getGenericMetadata();
}

uint64_t sub_26172BDEC(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  return static Vector.verify<A>(_:at:of:)(a1, a2, a3, a6[2], a6[3], (uint64_t)a6, a6[4]);
}

void static UnionVector.verify(_:keyPosition:fieldPosition:unionKeyName:fieldName:completion:)(unsigned __int8 *a1, Swift::Int a2, Swift::Int a3, void (**a4)(char *, uint64_t, uint64_t), uint64_t a5, void (*a6)(char *, uint64_t, uint64_t), uint64_t a7, void (*a8)(unsigned __int8 *, char *, Swift::Int), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v65 = a5;
  uint64_t v66 = a7;
  uint64_t v63 = a4;
  uint64_t v64 = a6;
  Swift::Int v69 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v67 = (char *)v55 - v15;
  sub_26173BD90();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_0_0();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v23 = (char *)v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v24 = *a1;
  if (v24 == 1 && ((*(_DWORD *)(*((void *)a1 + 5) + 24) + (int)a2) & 3) != 0)
  {
    uint64_t v70 = MEMORY[0x263F8E8F8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v25 = sub_26173BC20();
    uint64_t v27 = v26;
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v28 = a2;
LABEL_10:
    *(void *)(v28 + 8) = v25;
    *(void *)(v28 + 16) = v27;
    *(_OWORD *)(v28 + 24) = 0u;
    *(_OWORD *)(v28 + 40) = 0u;
    *(_OWORD *)(v28 + 49) = 0u;
LABEL_11:
    swift_willThrow();
    return;
  }
  uint64_t v58 = v18;
  int v59 = v21;
  uint64_t v61 = v20;
  uint64_t v62 = a11;
  uint64_t v57 = v19;
  uint64_t v60 = a8;
  Verifier.rangeInBuffer(position:size:)(a2, 4);
  if (v29) {
    return;
  }
  uint64_t v30 = *((void *)a1 + 5);
  uint64_t v31 = *(void *)(v30 + 24);
  if ((((_BYTE)v31 + (_BYTE)v69) & 3) != 0) {
    int v32 = v24;
  }
  else {
    int v32 = 0;
  }
  if (v32 == 1)
  {
    uint64_t v70 = MEMORY[0x263F8E8F8];
    Swift::Int v33 = v69;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB80);
    uint64_t v25 = sub_26173BC20();
    uint64_t v27 = v34;
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v28 = v33;
    goto LABEL_10;
  }
  uint64_t v35 = *(unsigned int *)(v31 + a2);
  Verifier.rangeInBuffer(position:size:)(v69, 4);
  if (!v37)
  {
    uint64_t v38 = *(unsigned int *)(*(void *)(v30 + 24) + v69);
    uint64_t v39 = static Verifiable.verifyRange<A>(_:at:of:)((uint64_t)a1, v35 + a2, AssociatedTypeWitness, v36, AssociatedTypeWitness);
    uint64_t v41 = v40;
    Swift::Int v42 = sub_261726FA4(a1, v38 + v69);
    uint64_t v44 = v43;
    if (v41 != v43)
    {
      sub_2617295E0();
      OUTLINED_FUNCTION_44();
      *(void *)uint64_t v51 = v41;
      *(void *)(v51 + 8) = v44;
      uint64_t v52 = v65;
      uint64_t v53 = v66;
      *(void *)(v51 + 16) = v63;
      *(void *)(v51 + 24) = v52;
      *(void *)(v51 + 32) = v64;
      *(void *)(v51 + 40) = v53;
      *(void *)(v51 + 48) = 0;
      *(void *)(v51 + 56) = 0;
      *(unsigned char *)(v51 + 64) = 6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_11;
    }
    if (v41 >= 1)
    {
      Swift::Int v69 = v39;
      v55[0] = v41;
      v55[1] = a9;
      Swift::Int v56 = v42;
      uint64_t v45 = sub_26173B7EC();
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = v61;
      uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 16);
      uint64_t v65 = v62 + 16;
      uint64_t v66 = v45;
      uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))(v59 + 4);
      uint64_t v64 = v49;
      ++v59;
      while ((unsigned __int128)(v14 * (__int128)v47) >> 64 == (v14 * v47) >> 63)
      {
        if (__OFADD__(v69, v14 * v47)) {
          goto LABEL_27;
        }
        uint64_t v50 = v67;
        sub_26173BDA0();
        v64(v50, a10, v62);
        if (__swift_getEnumTagSinglePayload(v48, 1, a10) == 1)
        {
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v48, v58);
          sub_2617295E0();
          OUTLINED_FUNCTION_44();
          *(void *)uint64_t v54 = 5;
          *(_OWORD *)(v54 + 8) = 0u;
          *(_OWORD *)(v54 + 24) = 0u;
          *(_OWORD *)(v54 + 40) = 0u;
          *(void *)(v54 + 56) = 0;
          *(unsigned char *)(v54 + 64) = 7;
          goto LABEL_11;
        }
        (*v63)(v23, v48, a10);
        if (v47 == 0x2000000000000000) {
          goto LABEL_28;
        }
        if (__OFADD__(v56, v46)) {
          goto LABEL_29;
        }
        v60(a1, v23, v56 + v46);
        (*v59)(v23, a10);
        ++v47;
        v46 += 4;
        if (v55[0] == v47) {
          return;
        }
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
    }
  }
}

uint64_t dispatch thunk of static Verifiable.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_26172C350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_26172C358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata accessor for UnionVector()
{
  return __swift_instantiateGenericMetadata();
}

void sub_26172C378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t WK2_HourlyWeatherStatistics.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = *(void *)v1;
  uint64_t v3 = *(int *)(v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 24);
  int v5 = *(_DWORD *)(v4 + v3);
  BOOL v6 = __OFSUB__(v3, v5);
  int v7 = v3 - v5;
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v4 + v7) < 5u)
  {
    int v9 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v9, v3);
    int v10 = v9 + v3;
    if (!v6)
    {
      if (!__OFADD__(v10, *(_DWORD *)(v4 + v10))) {
        return OUTLINED_FUNCTION_94(result, a1, *(__n128 *)(v1 + 8));
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v7, 4);
  int v8 = v7 + 4;
  if (!v6)
  {
    int v9 = *(__int16 *)(v4 + v8);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t WK2_HourlyWeatherStatistics.baselineStart.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 7u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 6);
    int v6 = v5 + 6;
    if (!v4)
    {
      int v7 = *(__int16 *)(v2 + v6);
      if (v7)
      {
        BOOL v4 = __OFADD__(v7, v1);
        int v8 = v7 + v1;
        if (!v4) {
          return *(unsigned int *)(v2 + v8);
        }
        goto LABEL_10;
      }
      return OUTLINED_FUNCTION_32();
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t WK2_HourlyWeatherStatistics.hasHours.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 9u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 8);
    int v6 = v5 + 8;
    if (!v4) {
      return *(unsigned __int16 *)(v2 + v6) != 0;
    }
  }
  __break(1u);
  return result;
}

uint64_t WK2_HourlyWeatherStatistics.hoursCount.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v5) < 9u) {
    return OUTLINED_FUNCTION_32();
  }
  BOOL v4 = __OFADD__(v5, 8);
  int v6 = v5 + 8;
  if (v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    return OUTLINED_FUNCTION_32();
  }
  BOOL v4 = __OFADD__(v7, v1);
  int v8 = v7 + v1;
  if (!v4)
  {
    int v9 = *(_DWORD *)(v2 + v8);
    BOOL v4 = __OFADD__(v8, v9);
    int v10 = v8 + v9;
    if (!v4) {
      return *(unsigned int *)(v2 + v10);
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t WK2_HourlyWeatherStatistics.hours(at:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t result = *(void *)v2;
  uint64_t v6 = *(int *)(v2 + 24);
  uint64_t v7 = *(void *)(*(void *)v2 + 24);
  int v8 = *(_DWORD *)(v7 + v6);
  BOOL v9 = __OFSUB__(v6, v8);
  int v10 = v6 - v8;
  if (v9)
  {
    __break(1u);
    goto LABEL_15;
  }
  long long v11 = 0uLL;
  if (*(unsigned __int16 *)(v7 + v10) < 9u)
  {
LABEL_12:
    uint64_t result = 0;
    int v20 = 0;
    goto LABEL_13;
  }
  BOOL v9 = __OFADD__(v10, 8);
  int v12 = v10 + 8;
  if (v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v13 = *(__int16 *)(v7 + v12);
  if (!v13) {
    goto LABEL_12;
  }
  BOOL v9 = __OFADD__(v13, v6);
  int v14 = v13 + v6;
  if (v9)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v15 = *(_DWORD *)(v7 + v14);
  BOOL v9 = __OFADD__(v14, v15);
  int v16 = v14 + v15;
  if (v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  BOOL v9 = __OFADD__(v16, 4);
  int v17 = v16 + 4;
  if (v9)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((a1 - 0x20000000) >> 30 != 3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v9 = __OFADD__(v17, 4 * a1);
  int v18 = v17 + 4 * a1;
  if (v9)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int v19 = *(_DWORD *)(v7 + v18);
  int v20 = v18 + v19;
  if (!__OFADD__(v18, v19))
  {
    long long v21 = *(_OWORD *)(v2 + 8);
    uint64_t result = swift_retain();
    long long v11 = v21;
LABEL_13:
    *(void *)a2 = result;
    *(_OWORD *)(a2 + 8) = v11;
    *(_DWORD *)(a2 + 24) = v20;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

unint64_t static WK2_HourlyWeatherStatistics.startHourlyWeatherStatistics(_:)(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (*(void *)(v2 + 56) < v4 + 24)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5) {
      MEMORY[0x263E3EDF0](v5, -1, -1);
    }
    uint64_t v6 = swift_slowAlloc();
    *(void *)(v2 + 32) = v6;
    *(void *)(v2 + 40) = v6 + 24;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 24;
  }
  unint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_HourlyWeatherStatistics.add(metadata:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_27;
  }
  __break(1u);
}

void static WK2_HourlyWeatherStatistics.add(baselineStart:_:)()
{
  OUTLINED_FUNCTION_22();
  int v3 = v2;
  int v5 = v4;
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v6)
    {
LABEL_20:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v3[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = v3[2];
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_19_0();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v3[3]);
  }
  v3[2] = v1;
  unint64_t v12 = v1 + 4;
  int64_t v13 = *(void *)(v0 + 32);
  if (v13 < (uint64_t)(v1 + 4))
  {
    OUTLINED_FUNCTION_18();
    int64_t v13 = *(void *)(v0 + 32);
  }
  *(_DWORD *)(v13 - v1 + *(void *)(v0 + 24) - 4) = v5;
  v3[2] = v12;
  if (v1 > 0xFFFFFFFB) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = *(void *)(v14 + 32);
    if (v16)
    {
      uint64_t v17 = v16 + *(void *)(v14 + 80);
      *(_DWORD *)uint64_t v17 = v12;
      *(_WORD *)(v17 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v6 & v21)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_HourlyWeatherStatistics.addVectorOf(hours:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 8;
    }
    *(int64x2_t *)(v15 + 72) = vaddq_s64(*(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v18 = *(unsigned __int16 *)(v15 + 64);
    if (v18 <= 8) {
      LOWORD(v18) = 8;
    }
    *(_WORD *)(v15 + 64) = v18;
    goto LABEL_27;
  }
  __break(1u);
}

uint64_t static WK2_HourlyWeatherStatistics.endHourlyWeatherStatistics(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

void static WK2_HourlyWeatherStatistics.createHourlyWeatherStatistics(_:metadataOffset:baselineStart:hoursVectorOffset:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  Swift::UInt32 v3 = static WK2_HourlyWeatherStatistics.startHourlyWeatherStatistics(_:)(v2);
  static WK2_HourlyWeatherStatistics.add(metadata:_:)();
  static WK2_HourlyWeatherStatistics.add(baselineStart:_:)();
  static WK2_HourlyWeatherStatistics.addVectorOf(hours:_:)();
  *uint64_t v1 = FlatBufferBuilder.endTable(at:)(v3);
  OUTLINED_FUNCTION_20();
}

void static WK2_HourlyWeatherStatistics.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v21);
  if (!v2)
  {
    sub_2617159B0();
    if (v21[2] >= 7)
    {
      uint64_t v11 = v21[1] + 6;
      int v12 = v22;
      if (v22 == 1 && ((*(_DWORD *)(v23 + 24) + v11) & 1) != 0)
      {
        char v16 = &qword_26A92AB70;
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_8(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21[0]);
      uint64_t v13 = *(void *)(v23 + 24);
      uint64_t v14 = *(unsigned __int16 *)(v13 + v11);
      if (*(_WORD *)(v13 + v11))
      {
        if ((((_BYTE)v13 + LOBYTE(v21[0]) + (_BYTE)v14) & 3) != 0) {
          int v15 = v12;
        }
        else {
          int v15 = 0;
        }
        if (v15 == 1)
        {
          char v16 = &qword_26A92AB80;
LABEL_12:
          __swift_instantiateConcreteTypeFromMangledName(v16);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v17 = swift_allocError();
          OUTLINED_FUNCTION_19(v17, v18);
LABEL_15:
          swift_release();
          return;
        }
        Verifier.rangeInBuffer(position:size:)(v21[0] + v14, 4);
        if (v19) {
          goto LABEL_15;
        }
      }
    }
    sub_2617160B8();
    goto LABEL_15;
  }
}

void sub_26172CC7C(int a1, unint64_t a2)
{
}

uint64_t WK2_HourOfYearWeatherStatistics.hourOfYear.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 5u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 4);
    int v6 = v5 + 4;
    if (!v4)
    {
      int v7 = *(__int16 *)(v2 + v6);
      if (v7)
      {
        BOOL v4 = __OFADD__(v7, v1);
        int v8 = v7 + v1;
        if (!v4) {
          return *(unsigned __int16 *)(v2 + v8);
        }
        goto LABEL_10;
      }
      return OUTLINED_FUNCTION_32();
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t WK2_HourOfYearWeatherStatistics.temperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = *(void *)v1;
  uint64_t v3 = *(int *)(v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 24);
  int v5 = *(_DWORD *)(v4 + v3);
  BOOL v6 = __OFSUB__(v3, v5);
  int v7 = v3 - v5;
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v4 + v7) < 7u)
  {
    int v9 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v9, v3);
    int v10 = v9 + v3;
    if (!v6)
    {
      if (!__OFADD__(v10, *(_DWORD *)(v4 + v10))) {
        return OUTLINED_FUNCTION_94(result, a1, *(__n128 *)(v1 + 8));
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v7, 6);
  int v8 = v7 + 6;
  if (!v6)
  {
    int v9 = *(__int16 *)(v4 + v8);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t static WK2_HourOfYearWeatherStatistics.startHourOfYearWeatherStatistics(_:)(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (*(void *)(v2 + 56) < v4 + 16)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5) {
      MEMORY[0x263E3EDF0](v5, -1, -1);
    }
    uint64_t v6 = swift_slowAlloc();
    *(void *)(v2 + 32) = v6;
    *(void *)(v2 + 40) = v6 + 16;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 16;
  }
  unint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_HourOfYearWeatherStatistics.add(hourOfYear:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  __int16 v5 = v4;
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v6)
    {
LABEL_20:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v3[8] <= 1)
  {
    v3[8] = 2;
    v3[3] = 2;
  }
  unint64_t v7 = v3[2];
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_19_0();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v3[3]);
  }
  v3[2] = v1;
  unint64_t v12 = v1 + 2;
  int64_t v13 = *(void *)(v0 + 32);
  if (v13 < (uint64_t)(v1 + 2))
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(2, v1, v3[3]);
    int64_t v13 = *(void *)(v0 + 32);
  }
  *(_WORD *)(v13 - v1 + *(void *)(v0 + 24) - 2) = v5;
  v3[2] = v12;
  if (v1 > 0xFFFFFFFD) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = *(void *)(v14 + 32);
    if (v16)
    {
      uint64_t v17 = v16 + *(void *)(v14 + 80);
      *(_DWORD *)uint64_t v17 = v12;
      *(_WORD *)(v17 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v6 & v21)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_HourOfYearWeatherStatistics.add(temperature:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_27;
  }
  __break(1u);
}

void static WK2_HourOfYearWeatherStatistics.createHourOfYearWeatherStatistics(_:hourOfYear:temperatureOffset:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  Swift::UInt32 v3 = static WK2_HourOfYearWeatherStatistics.startHourOfYearWeatherStatistics(_:)(v2);
  static WK2_HourOfYearWeatherStatistics.add(hourOfYear:_:)();
  static WK2_HourOfYearWeatherStatistics.add(temperature:_:)();
  *uint64_t v1 = FlatBufferBuilder.endTable(at:)(v3);
  OUTLINED_FUNCTION_20();
}

void static WK2_HourOfYearWeatherStatistics.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v20);
  if (!v2)
  {
    if (v20[2] >= 5)
    {
      uint64_t v11 = v20[1] + 4;
      int v12 = v21;
      if (v21 == 1 && ((*(_DWORD *)(v22 + 24) + v11) & 1) != 0)
      {
        uint64_t v15 = &qword_26A92AB70;
        goto LABEL_9;
      }
      OUTLINED_FUNCTION_8(v3, v4, v5, v6, v7, v8, v9, v10, v19, v20[0]);
      uint64_t v13 = *(void *)(v22 + 24);
      uint64_t v14 = *(unsigned __int16 *)(v13 + v11);
      if (*(_WORD *)(v13 + v11))
      {
        if ((v12 & (v13 + LODWORD(v20[0]) + v14)) == 1)
        {
          uint64_t v15 = (uint64_t *)&unk_26A92AC50;
LABEL_9:
          __swift_instantiateConcreteTypeFromMangledName(v15);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v16 = swift_allocError();
          OUTLINED_FUNCTION_19(v16, v17);
LABEL_12:
          swift_release();
          return;
        }
        Verifier.rangeInBuffer(position:size:)(v20[0] + v14, 2);
        if (v18) {
          goto LABEL_12;
        }
      }
    }
    sub_261716060();
    goto LABEL_12;
  }
}

void sub_26172D218(int a1, unint64_t a2)
{
}

ValueMetadata *type metadata accessor for WK2_HourlyWeatherStatistics()
{
  return &type metadata for WK2_HourlyWeatherStatistics;
}

ValueMetadata *type metadata accessor for WK2_HourOfYearWeatherStatistics()
{
  return &type metadata for WK2_HourOfYearWeatherStatistics;
}

Swift::Int static String.verify<A>(_:at:of:)(Swift::Int a1, Swift::Int a2)
{
  sub_26173BC10();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v28 - v12;
  Swift::Int result = sub_261726F8C(a1, a2);
  if (!v3)
  {
    Swift::Int v16 = result;
    int64_t v17 = v15;
    uint64_t v29 = v7;
    uint64_t v18 = result + v15;
    Swift::Int v19 = *(void *)(a1 + 8);
    if (result + v15 >= v19)
    {
      if (v18 >= 0) {
        uint64_t v27 = result + v15;
      }
      else {
        uint64_t v27 = -v18;
      }
      sub_2617295E0();
      swift_allocError();
      *(void *)uint64_t v25 = v27;
      *(void *)(v25 + 8) = v19;
      *(_OWORD *)(v25 + 16) = 0u;
      *(_OWORD *)(v25 + 32) = 0u;
      *(_OWORD *)(v25 + 48) = 0u;
      char v26 = 1;
      goto LABEL_10;
    }
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      uint64_t v20 = *(void *)(a1 + 40);
      if (*(unsigned char *)(*(void *)(v20 + 24) + v18))
      {
        sub_26173BC00();
        uint64_t v30 = sub_261702AB8((const void *)(*(void *)(v20 + 24) + v16), v17);
        uint64_t v21 = v29;
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v11, v13, v2);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
        sub_261702B48();
        uint64_t v22 = sub_26173BBF0();
        uint64_t v24 = v23;
        swift_release();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v2);
        sub_2617295E0();
        swift_allocError();
        *(void *)uint64_t v25 = a2;
        *(void *)(v25 + 8) = v22;
        *(void *)(v25 + 16) = v24;
        *(_OWORD *)(v25 + 24) = 0u;
        *(_OWORD *)(v25 + 40) = 0u;
        *(void *)(v25 + 56) = 0;
        char v26 = 4;
LABEL_10:
        *(unsigned char *)(v25 + 64) = v26;
        return swift_willThrow();
      }
    }
  }
  return result;
}

Swift::Int sub_26172D480(Swift::Int a1, Swift::Int a2)
{
  return static String.verify<A>(_:at:of:)(a1, a2);
}

uint64_t String.init(_:o:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_26173BC10();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v20 - v13;
  int64_t v15 = *(int *)(*(void *)(a1 + 24) + a4);
  sub_26173BC00();
  v20[1] = sub_261702AB8((const void *)(*(void *)(a1 + 24) + a4 + 4), v15);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v14, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
  sub_261702B48();
  uint64_t v16 = sub_26173BBF0();
  uint64_t v18 = v17;
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v4);
  swift_release();
  if (v18) {
    return v16;
  }
  else {
    return 0;
  }
}

uint64_t sub_26172D5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  uint64_t result = String.init(_:o:)(a1, a2, a3, a4);
  *a5 = result;
  a5[1] = v7;
  return result;
}

void static String.pack(_:obj:)(void *a1@<X0>, unint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  unint64_t v3 = a2[1];
  if (v3)
  {
    v4[0] = *a2;
    v4[1] = v3;
    static String.pack(_:obj:)(a1, v4, (unint64_t)a3);
  }
  else
  {
    *a3 = 0;
  }
}

void static String.pack(_:obj:)(void *a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X8>)
{
  v30[3] = *MEMORY[0x263EF8340];
  unint64_t v6 = *a2;
  unint64_t v5 = a2[1];
  uint64_t v7 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x1000000000000000) != 0)
  {
LABEL_63:
    unint64_t v8 = sub_26173BC50();
  }
  else if ((v5 & 0x2000000000000000) != 0)
  {
    unint64_t v8 = HIBYTE(v5) & 0xF;
  }
  else
  {
    unint64_t v8 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if ((uint64_t)a1[8] <= 3)
  {
    a1[8] = 4;
    a1[3] = 4;
  }
  Swift::Int v9 = a1[2];
  if (v9 > 0xFFFFFFFFLL)
  {
    __break(1u);
    goto LABEL_65;
  }
  if (((v9 | (v8 + 1)) & 0x8000000000000000) != 0)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if ((uint64_t)(v8 + 1) > 0xFFFFFFFFLL)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v29 = (_DWORD *)a3;
  Swift::Int v10 = (~(_BYTE)v8 - (_BYTE)v9) & 3;
  Swift::Int v11 = v10 + v9;
  a3 = a1[1];
  if (*(void *)(a3 + 32) < v10 + v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v9, a1[3]);
  }
  a1[2] = v11;
  Swift::Int v12 = v11 + 1;
  if (*(void *)(a3 + 32) <= v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v11, a1[3]);
  }
  a1[2] = v12;
  if (*(void *)(a3 + 32) < (int64_t)(v12 + v8)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v11 + 1, a1[3]);
  }
  swift_bridgeObjectRetain();
  int v13 = sub_261714FB0(v6, v5, a1 + 1, v8);
  swift_bridgeObjectRelease();
  if (v13 != 2) {
    goto LABEL_50;
  }
  unint64_t v14 = (v5 & 0x2000000000000000) != 0 ? v7 : v6 & 0xFFFFFFFFFFFFLL;
  if (!v14) {
    goto LABEL_50;
  }
  uint64_t v15 = (v6 >> 59) & 1;
  if ((v5 & 0x1000000000000000) == 0) {
    LODWORD(v15) = 1;
  }
  uint64_t v16 = 11;
  if (v15) {
    uint64_t v16 = 7;
  }
  unint64_t v17 = v16 | (v14 << 16);
  uint64_t v7 = 4 << v15;
  swift_bridgeObjectRetain();
  while (1)
  {
    if ((v17 & 0xC) != v7)
    {
      if ((v5 & 0x1000000000000000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_31;
    }
    unint64_t v18 = sub_26172DB28(v17, v6, v5);
    if (v18 < 0x4000) {
      break;
    }
    unint64_t v17 = v18;
    if ((v5 & 0x1000000000000000) == 0)
    {
LABEL_28:
      unint64_t v17 = (v17 & 0xFFFFFFFFFFFF0000) - 65532;
      goto LABEL_33;
    }
LABEL_31:
    if (v14 < v17 >> 16)
    {
      __break(1u);
      goto LABEL_63;
    }
    unint64_t v17 = sub_26173BC60();
LABEL_33:
    unint64_t v19 = v17;
    if ((v17 & 0xC) == v7) {
      unint64_t v19 = sub_26172DB28(v17, v6, v5);
    }
    a3 = v19 >> 16;
    if (v19 >> 16 >= v14) {
      goto LABEL_48;
    }
    if ((v5 & 0x1000000000000000) != 0)
    {
      char v21 = sub_26173BC80();
    }
    else if ((v5 & 0x2000000000000000) != 0)
    {
      v30[0] = v6;
      v30[1] = v5 & 0xFFFFFFFFFFFFFFLL;
      char v21 = *((unsigned char *)v30 + a3);
    }
    else
    {
      uint64_t v20 = (v5 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((v6 & 0x1000000000000000) == 0) {
        uint64_t v20 = sub_26173BDE0();
      }
      char v21 = *(unsigned char *)(v20 + a3);
    }
    a3 = a1[1];
    uint64_t v22 = a1[2];
    uint64_t v23 = *(void *)(a3 + 32);
    if (v23 < v22 + 1)
    {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, a1[2], a1[3]);
      uint64_t v23 = *(void *)(a3 + 32);
    }
    *(unsigned char *)(*(void *)(a3 + 24) + v23 + ~v22) = v21;
    a1[2] = v22 + 1;
    if (!(v17 >> 14)) {
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  swift_bridgeObjectRelease();
LABEL_50:
  if ((v8 & 0x8000000000000000) != 0) {
    goto LABEL_67;
  }
  if (HIDWORD(v8))
  {
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if ((uint64_t)a1[8] <= 3)
  {
    a1[8] = 4;
    a1[3] = 4;
  }
  unint64_t v24 = a1[2];
  if ((v24 & 0x8000000000000000) != 0) {
    goto LABEL_69;
  }
  if (HIDWORD(v24))
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  Swift::Int v25 = -*((unsigned char *)a1 + 16) & 3;
  unint64_t v26 = v25 + v24;
  if (*(void *)(a3 + 32) < (int64_t)(v25 + v24)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v25, v24, a1[3]);
  }
  a1[2] = v26;
  unint64_t v27 = v26 + 4;
  int64_t v28 = *(void *)(a3 + 32);
  if (v28 < (uint64_t)(v26 + 4))
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v26, a1[3]);
    int64_t v28 = *(void *)(a3 + 32);
  }
  *(_DWORD *)(v28 - v26 + *(void *)(a3 + 24) - 4) = v8;
  a1[2] = v27;
  if (v26 > 0xFFFFFFFB) {
LABEL_71:
  }
    __break(1u);
  *uint64_t v29 = v27;
}

Swift::String __swiftcall String.unpack()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t sub_26172DA78@<X0>(Swift::String *a1@<X8>)
{
  Swift::String v3 = String.unpack()();
  uint64_t result = v3._countAndFlagsBits;
  *a1 = v3;
  return result;
}

void String.serialize<A>(type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void String.serialize<A>(builder:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_26172DB28(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_26173BC90();
    OUTLINED_FUNCTION_2_1(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263E3E960](15, a1 >> 16);
    OUTLINED_FUNCTION_2_1(v3);
    return v4 | 8;
  }
}

uint64_t static FlatbuffersErrors.== infix(_:_:)()
{
  sub_2617295E0();
  uint64_t v0 = sub_26173BEA0();
  uint64_t v2 = v1;
  if (v0 == sub_26173BEA0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_26173BE80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_26172DCA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  switch(a9)
  {
    case 0:
    case 3:
    case 4:
      goto LABEL_3;
    case 5:
    case 6:
      swift_bridgeObjectRetain();
LABEL_3:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for FlatbuffersErrors(uint64_t a1)
{
  return sub_26172DD7C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
}

uint64_t sub_26172DD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  switch(a9)
  {
    case 0:
    case 3:
    case 4:
      goto LABEL_3;
    case 5:
    case 6:
      swift_bridgeObjectRelease();
LABEL_3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for FlatbuffersErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  char v11 = *(unsigned char *)(a2 + 64);
  sub_26172DCA8(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  return a1;
}

uint64_t assignWithCopy for FlatbuffersErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  char v11 = *(unsigned char *)(a2 + 64);
  sub_26172DCA8(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  char v20 = *(unsigned char *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_26172DD7C(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t assignWithTake for FlatbuffersErrors(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  char v12 = *(unsigned char *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(unsigned char *)(a1 + 64) = v3;
  sub_26172DD7C(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlatbuffersErrors(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF9 && *(unsigned char *)(a1 + 65))
    {
      int v2 = *(_DWORD *)a1 + 248;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
      if (v3 <= 7) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlatbuffersErrors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)uint64_t result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_26172E070(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 64) <= 6u) {
    return *(unsigned __int8 *)(a1 + 64);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_26172E088(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(void *)uint64_t result = a2 - 7;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(void *)(result + 56) = 0;
    LOBYTE(a2) = 7;
  }
  *(unsigned char *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FlatbuffersErrors()
{
  return &type metadata for FlatbuffersErrors;
}

void sub_26172E0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void static Enum<>.verify<A>(_:at:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t dispatch thunk of static Enum.byteSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Enum.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of UnionEnum.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_26172E160(const void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2) {
    return a2 != 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a3, a5);
  size_t v9 = *(void *)(*(void *)(a4 - 8) + 64);
  if ((v9 & 0x8000000000000000) == 0)
  {
    memcpy((void *)(*(void *)(result + 24) + a2), a1, v9);
    swift_release();
    return a2 != 0;
  }
  __break(1u);
  return result;
}

void Mutable<>.mutate<A>(_:index:)(uint64_t a1, int a2)
{
  if (a2)
  {
    OUTLINED_FUNCTION_0_2();
    if (v5) {
      __break(1u);
    }
    else {
      sub_26172E160(v2, v3, (uint64_t)&type metadata for Table, v4, (uint64_t)&protocol witness table for Table);
    }
  }
}

uint64_t Mutable<>.directMutate<A>(_:index:)(const void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_26172E30C(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&type metadata for Table, (uint64_t)&protocol witness table for Table) & 1;
}

{
  return sub_26172E30C(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&type metadata for Struct, (uint64_t)&protocol witness table for Struct) & 1;
}

void Mutable<>.mutate<A>(_:index:)()
{
  OUTLINED_FUNCTION_0_2();
  if (v3) {
    __break(1u);
  }
  else {
    sub_26172E160(v0, v1, (uint64_t)&type metadata for Struct, v2, (uint64_t)&protocol witness table for Struct);
  }
}

uint64_t sub_26172E30C(const void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_26172E160(a1, a2, a9, a7, a10) & 1;
}

uint64_t dispatch thunk of Mutable.bb.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Mutable.postion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t static FlatBufferDecodable<>.decode(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v57 = a1;
  unint64_t v58 = a2;
  sub_2617026C0(a1, a2);
  uint64_t v13 = sub_26173BB70();
  type metadata accessor for ByteBuffer.Storage();
  swift_allocObject();
  uint64_t v14 = ByteBuffer.Storage.init(count:alignment:)(v13);
  uint64_t v48 = v14;
  uint64_t v15 = *(void *)(v14 + 32);
  sub_2617026C0(a1, a2);
  sub_261702338(&v57, (uint64_t)&v48, a1, a2);
  sub_261702668(v57, v58);
  v59[0] = v14;
  v59[1] = v15;
  v59[2] = 1;
  uint64_t v48 = 0xF424080000000;
  LODWORD(v49) = 64;
  BYTE4(v49) = 0;
  getCheckedRoot<A>(byteBuffer:fileId:options:)(v59, 0, 0, &v48, a3, a4, a5, a6);
  if (!v6) {
    return swift_release();
  }
  uint64_t v57 = v6;
  MEMORY[0x263E3ED10](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92ADE0);
  if (swift_dynamicCast())
  {
    MEMORY[0x263E3ED00](v6);
    uint64_t v16 = v50;
    uint64_t v17 = v51;
    uint64_t v18 = v54;
    uint64_t v19 = v55;
    if (v56 == 3)
    {
      uint64_t v42 = v48;
      uint64_t v44 = v52;
      uint64_t v46 = v53;
      uint64_t v40 = v49;
      swift_bridgeObjectRetain();
      uint64_t v29 = OUTLINED_FUNCTION_2_2();
      uint64_t v31 = v30;
      sub_26172E730();
      OUTLINED_FUNCTION_44();
      *(void *)uint64_t v32 = v29;
      *(void *)(v32 + 8) = v31;
      *(void *)(v32 + 16) = v40;
      *(void *)(v32 + 24) = v16;
      *(_OWORD *)(v32 + 32) = 0u;
      *(_OWORD *)(v32 + 48) = 0u;
      *(unsigned char *)(v32 + 64) = 0x80;
      swift_willThrow();
      sub_26172DD7C(v42, v40, v16, v17, v44, v46, v18, v19, 3);
    }
    else if (v56 == 5)
    {
      uint64_t v43 = v48;
      uint64_t v45 = v52;
      uint64_t v47 = v53;
      uint64_t v41 = v49;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v33 = OUTLINED_FUNCTION_2_2();
      uint64_t v35 = v34;
      sub_26172E730();
      OUTLINED_FUNCTION_44();
      *(void *)uint64_t v36 = v33;
      *(void *)(v36 + 8) = v35;
      *(void *)(v36 + 16) = v16;
      *(void *)(v36 + 24) = v17;
      *(void *)(v36 + 32) = v18;
      *(void *)(v36 + 40) = v19;
      *(void *)(v36 + 48) = 0;
      *(void *)(v36 + 56) = 0;
      *(unsigned char *)(v36 + 64) = 0;
      swift_willThrow();
      sub_26172DD7C(v43, v41, v16, v17, v45, v47, v18, v19, 5);
    }
    else
    {
      if (v56 == 7 && !(v49 | v48 | v50 | v51 | v52 | v53 | v54 | v55))
      {
        uint64_t v37 = OUTLINED_FUNCTION_2_2();
        uint64_t v39 = v38;
        sub_26172E730();
        OUTLINED_FUNCTION_44();
        *(void *)uint64_t v26 = v37;
        *(void *)(v26 + 8) = v39;
        *(_OWORD *)(v26 + 16) = 0u;
        *(_OWORD *)(v26 + 32) = 0u;
        *(_OWORD *)(v26 + 48) = 0u;
        char v27 = 64;
      }
      else
      {
        LODWORD(v60) = v56 | 0xC0;
        uint64_t v20 = v53;
        uint64_t v21 = v52;
        uint64_t v22 = v49;
        uint64_t v23 = v55;
        uint64_t v24 = v54;
        uint64_t v25 = v48;
        sub_26172E730();
        OUTLINED_FUNCTION_44();
        *(void *)uint64_t v26 = v25;
        *(void *)(v26 + 8) = v22;
        *(void *)(v26 + 16) = v16;
        *(void *)(v26 + 24) = v17;
        *(void *)(v26 + 32) = v21;
        *(void *)(v26 + 40) = v20;
        *(void *)(v26 + 48) = v24;
        *(void *)(v26 + 56) = v23;
        char v27 = v60;
      }
      *(unsigned char *)(v26 + 64) = v27;
      swift_willThrow();
    }
  }
  swift_release();
  return MEMORY[0x263E3ED00](v57);
}

uint64_t sub_26172E6F0()
{
  return sub_26173BC20();
}

unint64_t sub_26172E730()
{
  unint64_t result = qword_26A92ADE8[0];
  if (!qword_26A92ADE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A92ADE8);
  }
  return result;
}

uint64_t sub_26172E77C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  switch(a9 >> 6)
  {
    case 1:
      goto LABEL_7;
    case 2:
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 3:
      return sub_26172DCA8(a1, a2, a3, a4, a5, a6, a7, a8, a9 & 0x3F);
    default:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_7:
      return swift_bridgeObjectRetain();
  }
}

uint64_t destroy for FlatBufferDecodeError(uint64_t a1)
{
  return sub_26172E87C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
}

uint64_t sub_26172E87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  switch(a9 >> 6)
  {
    case 1:
      goto LABEL_7;
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3:
      return sub_26172DD7C(a1, a2, a3, a4, a5, a6, a7, a8, a9 & 0x3F);
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_7:
      return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for FlatBufferDecodeError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 64);
  sub_26172E77C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  return a1;
}

uint64_t assignWithCopy for FlatBufferDecodeError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  unsigned __int8 v11 = *(unsigned char *)(a2 + 64);
  sub_26172E77C(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  unsigned __int8 v20 = *(unsigned char *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_26172E87C(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t assignWithTake for FlatBufferDecodeError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(unsigned char *)(a1 + 64) = v3;
  sub_26172E87C(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlatBufferDecodeError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x1D && *(unsigned char *)(a1 + 65))
    {
      unsigned int v2 = *(_DWORD *)a1 + 28;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 64) >> 1) & 0x1C | (*(unsigned __int8 *)(a1 + 64) >> 6)) ^ 0x1F;
      if (v2 >= 0x1C) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for FlatBufferDecodeError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1C)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)unint64_t result = a2 - 29;
    if (a3 >= 0x1D) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1D) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)unint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 64) = 8 * (((-a2 >> 2) & 7) - 8 * a2);
    }
  }
  return result;
}

uint64_t sub_26172EBB8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64) >> 6;
}

uint64_t sub_26172EBC4(uint64_t result)
{
  *(unsigned char *)(result + 64) &= 0x3Fu;
  return result;
}

uint64_t sub_26172EBD4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 64) = *(unsigned char *)(result + 64) & 7 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for FlatBufferDecodeError()
{
  return &type metadata for FlatBufferDecodeError;
}

uint64_t sub_26172EC08(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  size_t v7 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a4), a4))
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x26172ECA8);
      }
      size_t v7 = HIDWORD(a4) - (int)a4;
LABEL_6:
      ByteBuffer.Storage.copy(from:count:)(a1, v7);
      return sub_261702668(a4, a5);
    case 2uLL:
      uint64_t v9 = *(void *)(a4 + 16);
      uint64_t v8 = *(void *)(a4 + 24);
      size_t v7 = v8 - v9;
      if (!__OFSUB__(v8, v9)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      size_t v7 = BYTE6(a5);
      goto LABEL_6;
  }
}

void WK2_PrecipitationAmount.probability.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 5u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 4);
  int v4 = v2 + 4;
  if (v3) {
    goto LABEL_9;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_10;
  }
}

void static WK2_PrecipitationAmount.add(probability:_:)(char a1, void *a2)
{
  if (!a1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  if ((uint64_t)a2[8] <= 0)
  {
    a2[8] = 1;
    a2[3] = 1;
  }
  Swift::Int v5 = a2[2];
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (HIDWORD(v5))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v6 = a2[1];
  if (*(void *)(v6 + 32) < v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(0, a2[2], a2[3]);
  }
  a2[2] = v5;
  Swift::Int v7 = v5 + 1;
  Swift::Int v8 = *(void *)(v6 + 32);
  if (v8 <= v5)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v5, a2[3]);
    Swift::Int v8 = *(void *)(v6 + 32);
  }
  *(unsigned char *)(*(void *)(v6 + 24) + v8 + ~v5) = a1;
  a2[2] = v7;
  if ((unint64_t)v5 > 0xFFFFFFFE) {
LABEL_21:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = *(void *)(v9 + 32);
    if (v11)
    {
      uint64_t v12 = v11 + *(void *)(v9 + 80);
      *(_DWORD *)uint64_t v12 = v7;
      *(_WORD *)(v12 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v9, *(int64x2_t *)(v9 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v16)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
  }
}

void static WK2_PrecipitationAmount.add(averageAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F8BC(v0, v1);
}

void static WK2_PrecipitationAmount.add(averageSnowfallAmount:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F2F8(v0, v1);
}

uint64_t static WK2_PrecipitationAmount.createPrecipitationAmount(_:probability:averageAmount:averageSnowfallAmount:)@<X0>(void *a1@<X0>, char a2@<W1>, _DWORD *a3@<X8>)
{
  Swift::UInt32 v6 = static WK2_Quantiles.startQuantiles(_:)();
  static WK2_PrecipitationAmount.add(probability:_:)(a2, a1);
  static WK2_Quantiles.add(p50:_:)();
  static WK2_Quantiles.add(p90:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v6);
  *a3 = result;
  return result;
}

void static WK2_PrecipitationAmount.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v22, v23);
  if (!v8)
  {
    if (v26 < 5) {
      goto LABEL_24;
    }
    uint64_t v9 = v25 + 4;
    if (v27 != 1 || (OUTLINED_FUNCTION_11(), (v10 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      if (*(_WORD *)(*(void *)(v28 + 24) + v9))
      {
        Verifier.rangeInBuffer(position:size:)(v24 + *(unsigned __int16 *)(*(void *)(v28 + 24) + v9), 1);
        if (v11) {
          goto LABEL_24;
        }
      }
      if ((unint64_t)v26 <= 6) {
        goto LABEL_24;
      }
      OUTLINED_FUNCTION_86();
      if (!v12 || (OUTLINED_FUNCTION_11(), (v13 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v14)
        {
          OUTLINED_FUNCTION_26();
          if (v15 == 1)
          {
LABEL_13:
            char v16 = &qword_26A92AB88;
LABEL_23:
            __swift_instantiateConcreteTypeFromMangledName(v16);
            sub_26173BC20();
            sub_2617295E0();
            uint64_t v20 = swift_allocError();
            OUTLINED_FUNCTION_19(v20, v21);
            goto LABEL_24;
          }
          OUTLINED_FUNCTION_31();
        }
        if ((unint64_t)v26 <= 8)
        {
LABEL_24:
          swift_release();
          return;
        }
        OUTLINED_FUNCTION_20_0();
        if (!v12 || (OUTLINED_FUNCTION_11(), (v17 & 1) == 0))
        {
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_33();
          if (v18)
          {
            OUTLINED_FUNCTION_47();
            if (v19 == 1) {
              goto LABEL_13;
            }
            OUTLINED_FUNCTION_31();
          }
          goto LABEL_24;
        }
      }
    }
    char v16 = &qword_26A92AB70;
    goto LABEL_23;
  }
}

void sub_26172F13C(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

unint64_t _s11WeatherData23WK2_PrecipitationAmountV05startdE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (*(void *)(v2 + 56) < v4 + 24)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5) {
      MEMORY[0x263E3EDF0](v5, -1, -1);
    }
    uint64_t v6 = swift_slowAlloc();
    *(void *)(v2 + 32) = v6;
    *(void *)(v2 + 40) = v6 + 24;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 24;
  }
  unint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_Quantiles.add(p10:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F764(v0, v1);
}

void static WK2_Quantiles.add(p50:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F8BC(v0, v1);
}

void static WK2_Quantiles.add(p90:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F2F8(v0, v1);
}

void sub_26172F2F8(void *a1, float a2)
{
  if (a2 == 0.0)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  if ((uint64_t)a1[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v5 = a1[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v5))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v6 = OUTLINED_FUNCTION_0((uint64_t)a1, v5);
  if (v8 != v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v6, v7, a1[3]);
  }
  OUTLINED_FUNCTION_9_0();
  if (v8 != v9)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 8;
    }
    *(int64x2_t *)(v12 + 72) = vaddq_s64(*(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v15 = *(unsigned __int16 *)(v12 + 64);
    if (v15 <= 8) {
      LOWORD(v15) = 8;
    }
    *(_WORD *)(v12 + 64) = v15;
  }
}

uint64_t static WK2_Quantiles.endQuantiles(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

uint64_t static WK2_Quantiles.createQuantiles(_:p10:p50:p90:)@<X0>(_DWORD *a1@<X8>)
{
  Swift::UInt32 v2 = static WK2_Quantiles.startQuantiles(_:)();
  static WK2_Quantiles.add(p10:_:)();
  static WK2_Quantiles.add(p50:_:)();
  static WK2_Quantiles.add(p90:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v2);
  *a1 = result;
  return result;
}

void static WK2_Quantiles.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v22, v23);
  if (!v8)
  {
    if (v24 < 5) {
      goto LABEL_26;
    }
    OUTLINED_FUNCTION_86();
    if (!v9 || (OUTLINED_FUNCTION_11(), (v10 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v11)
      {
        OUTLINED_FUNCTION_26();
        if (v12 == 1)
        {
LABEL_8:
          char v13 = &qword_26A92AB88;
LABEL_25:
          __swift_instantiateConcreteTypeFromMangledName(v13);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v20 = swift_allocError();
          OUTLINED_FUNCTION_19(v20, v21);
          goto LABEL_26;
        }
        OUTLINED_FUNCTION_31();
      }
      if ((unint64_t)v24 <= 6) {
        goto LABEL_26;
      }
      OUTLINED_FUNCTION_86();
      if (v9)
      {
        OUTLINED_FUNCTION_11();
        if (v14) {
          goto LABEL_24;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v15)
      {
        OUTLINED_FUNCTION_26();
        if (v16 == 1) {
          goto LABEL_8;
        }
        OUTLINED_FUNCTION_31();
      }
      if ((unint64_t)v24 <= 8)
      {
LABEL_26:
        swift_release();
        return;
      }
      OUTLINED_FUNCTION_20_0();
      if (!v9 || (OUTLINED_FUNCTION_11(), (v17 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v18)
        {
          OUTLINED_FUNCTION_47();
          if (v19 == 1) {
            goto LABEL_8;
          }
          OUTLINED_FUNCTION_31();
        }
        goto LABEL_26;
      }
    }
LABEL_24:
    char v13 = &qword_26A92AB70;
    goto LABEL_25;
  }
}

void sub_26172F658(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

unint64_t static WK2_Range.startRange(_:)(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (*(void *)(v2 + 56) < v4 + 16)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5) {
      MEMORY[0x263E3EDF0](v5, -1, -1);
    }
    uint64_t v6 = swift_slowAlloc();
    *(void *)(v2 + 32) = v6;
    *(void *)(v2 + 40) = v6 + 16;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 16;
  }
  unint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_Range.add(min:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F764(v0, v1);
}

void sub_26172F764(void *a1, float a2)
{
  if (a2 == 0.0)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  if ((uint64_t)a1[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v5 = a1[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v5))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v6 = OUTLINED_FUNCTION_0((uint64_t)a1, v5);
  if (v8 != v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v6, v7, a1[3]);
  }
  OUTLINED_FUNCTION_9_0();
  if (v8 != v9)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v12, *(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v11)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
  }
}

void static WK2_Range.add(max:_:)()
{
  OUTLINED_FUNCTION_3();
  sub_26172F8BC(v0, v1);
}

void sub_26172F8BC(void *a1, float a2)
{
  if (a2 == 0.0)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  if ((uint64_t)a1[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v5 = a1[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v5))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v6 = OUTLINED_FUNCTION_0((uint64_t)a1, v5);
  if (v8 != v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v6, v7, a1[3]);
  }
  OUTLINED_FUNCTION_9_0();
  if (v8 != v9)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v10 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_5(v10);
  if (!v4 & v11) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v12 + 32))
    {
      OUTLINED_FUNCTION_37(v12);
      *(_WORD *)(v14 + 4) = 6;
    }
    *(int64x2_t *)(v12 + 72) = vaddq_s64(*(int64x2_t *)(v12 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v15 = *(unsigned __int16 *)(v12 + 64);
    if (v15 <= 6) {
      LOWORD(v15) = 6;
    }
    *(_WORD *)(v12 + 64) = v15;
  }
}

uint64_t static WK2_Range.createRange(_:min:max:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  Swift::UInt32 v3 = static WK2_Range.startRange(_:)(a1);
  static WK2_Quantiles.add(p10:_:)();
  static WK2_Quantiles.add(p50:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v3);
  *a2 = result;
  return result;
}

void static WK2_Range.verify<A>(_:at:of:)(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  OUTLINED_FUNCTION_34(a1, a2, a3, a4, a5, a6, a7, a8, v19, v20);
  if (!v8)
  {
    if (v21 < 5) {
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_86();
    if (!v9 || (OUTLINED_FUNCTION_11(), (v10 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v11)
      {
        OUTLINED_FUNCTION_26();
        if (v12 == 1)
        {
LABEL_8:
          char v13 = &qword_26A92AB88;
LABEL_17:
          __swift_instantiateConcreteTypeFromMangledName(v13);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v17 = swift_allocError();
          OUTLINED_FUNCTION_19(v17, v18);
          goto LABEL_18;
        }
        OUTLINED_FUNCTION_31();
      }
      if ((unint64_t)v21 <= 6)
      {
LABEL_18:
        swift_release();
        return;
      }
      if (v22 != 1 || (OUTLINED_FUNCTION_11(), (v14 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v15)
        {
          OUTLINED_FUNCTION_47();
          if (v16 == 1) {
            goto LABEL_8;
          }
          OUTLINED_FUNCTION_31();
        }
        goto LABEL_18;
      }
    }
    char v13 = &qword_26A92AB70;
    goto LABEL_17;
  }
}

void sub_26172FB90(int a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
}

void type metadata accessor for WK2_PrecipitationAmount()
{
}

void type metadata accessor for WK2_Quantiles()
{
}

void type metadata accessor for WK2_Range()
{
}

uint64_t WK2_DailyWeatherStatistics.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = *(void *)v1;
  uint64_t v3 = *(int *)(v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 24);
  int v5 = *(_DWORD *)(v4 + v3);
  BOOL v6 = __OFSUB__(v3, v5);
  int v7 = v3 - v5;
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  long long v8 = *(_OWORD *)(v1 + 8);
  if (*(unsigned __int16 *)(v4 + v7) < 5u)
  {
    int v10 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v10, v3);
    int v11 = v10 + v3;
    if (!v6)
    {
      int v12 = *(_DWORD *)(v4 + v11);
      BOOL v6 = __OFADD__(v11, v12);
      int v13 = v11 + v12;
      if (!v6)
      {
        *(void *)a1 = result;
        *(_OWORD *)(a1 + 8) = v8;
        *(_DWORD *)(a1 + 24) = v13;
        return swift_retain();
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v7, 4);
  int v9 = v7 + 4;
  if (!v6)
  {
    int v10 = *(__int16 *)(v4 + v9);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t WK2_DailyWeatherStatistics.baselineStart.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 7u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 6);
    int v6 = v5 + 6;
    if (!v4)
    {
      int v7 = *(__int16 *)(v2 + v6);
      if (v7)
      {
        BOOL v4 = __OFADD__(v7, v1);
        int v8 = v7 + v1;
        if (!v4) {
          return *(unsigned int *)(v2 + v8);
        }
        goto LABEL_10;
      }
      return OUTLINED_FUNCTION_32();
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t WK2_DailyWeatherStatistics.hasDays.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 9u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 8);
    int v6 = v5 + 8;
    if (!v4) {
      return *(unsigned __int16 *)(v2 + v6) != 0;
    }
  }
  __break(1u);
  return result;
}

uint64_t WK2_DailyWeatherStatistics.daysCount.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v5) < 9u) {
    return OUTLINED_FUNCTION_32();
  }
  BOOL v4 = __OFADD__(v5, 8);
  int v6 = v5 + 8;
  if (v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    return OUTLINED_FUNCTION_32();
  }
  BOOL v4 = __OFADD__(v7, v1);
  int v8 = v7 + v1;
  if (!v4)
  {
    int v9 = *(_DWORD *)(v2 + v8);
    BOOL v4 = __OFADD__(v8, v9);
    int v10 = v8 + v9;
    if (!v4) {
      return *(unsigned int *)(v2 + v10);
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t WK2_DailyWeatherStatistics.days(at:)(int a1)
{
  uint64_t result = *(void *)v1;
  uint64_t v4 = *(int *)(v1 + 24);
  uint64_t v5 = *(void *)(*(void *)v1 + 24);
  int v6 = *(_DWORD *)(v5 + v4);
  BOOL v7 = __OFSUB__(v4, v6);
  int v8 = v4 - v6;
  if (v7)
  {
    __break(1u);
    goto LABEL_15;
  }
  __n128 v9 = 0uLL;
  if (*(unsigned __int16 *)(v5 + v8) < 9u)
  {
LABEL_12:
    uint64_t v17 = 0;
    return OUTLINED_FUNCTION_46(v17, v9);
  }
  BOOL v7 = __OFADD__(v8, 8);
  int v10 = v8 + 8;
  if (v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v11 = *(__int16 *)(v5 + v10);
  if (!v11) {
    goto LABEL_12;
  }
  BOOL v7 = __OFADD__(v11, v4);
  int v12 = v11 + v4;
  if (v7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v13 = *(_DWORD *)(v5 + v12);
  BOOL v7 = __OFADD__(v12, v13);
  int v14 = v12 + v13;
  if (v7)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  BOOL v7 = __OFADD__(v14, 4);
  int v15 = v14 + 4;
  if (v7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((a1 - 0x20000000) >> 30 != 3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v7 = __OFADD__(v15, 4 * a1);
  int v16 = v15 + 4 * a1;
  if (v7)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (!__OFADD__(v16, *(_DWORD *)(v5 + v16)))
  {
    __n128 v18 = *(__n128 *)(v1 + 8);
    uint64_t v17 = swift_retain();
    __n128 v9 = v18;
    return OUTLINED_FUNCTION_46(v17, v9);
  }
LABEL_21:
  __break(1u);
  return result;
}

void static WK2_DailyWeatherStatistics.add(metadata:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_27;
  }
  __break(1u);
}

void static WK2_DailyWeatherStatistics.add(baselineStart:_:)()
{
  OUTLINED_FUNCTION_22();
  int v3 = v2;
  int v5 = v4;
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v6)
    {
LABEL_20:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v3[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v7 = v3[2];
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_19_0();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v3[3]);
  }
  v3[2] = v1;
  unint64_t v12 = v1 + 4;
  int64_t v13 = *(void *)(v0 + 32);
  if (v13 < (uint64_t)(v1 + 4))
  {
    OUTLINED_FUNCTION_18();
    int64_t v13 = *(void *)(v0 + 32);
  }
  *(_DWORD *)(v13 - v1 + *(void *)(v0 + 24) - 4) = v5;
  v3[2] = v12;
  if (v1 > 0xFFFFFFFB) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = *(void *)(v14 + 32);
    if (v16)
    {
      uint64_t v17 = v16 + *(void *)(v14 + 80);
      *(_DWORD *)uint64_t v17 = v12;
      *(_WORD *)(v17 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v6 & v21)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DailyWeatherStatistics.addVectorOf(days:_:)()
{
  sub_2617307F8();
}

void static WK2_DailyWeatherStatistics.createDailyWeatherStatistics(_:metadataOffset:baselineStart:daysVectorOffset:)()
{
  OUTLINED_FUNCTION_22();
  unint64_t v1 = v0;
  Swift::UInt32 v2 = static WK2_DayOfYearWeatherStatistics.startDayOfYearWeatherStatistics(_:)();
  static WK2_DailyWeatherStatistics.add(metadata:_:)();
  static WK2_DailyWeatherStatistics.add(baselineStart:_:)();
  static WK2_DayOfYearWeatherStatistics.add(precipitation:_:)();
  *unint64_t v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_20();
}

void static WK2_DailyWeatherStatistics.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v21);
  if (!v2)
  {
    sub_2617159B0();
    if (v21[2] >= 7)
    {
      uint64_t v11 = v21[1] + 6;
      int v12 = v22;
      if (v22 == 1 && ((*(_DWORD *)(v23 + 24) + v11) & 1) != 0)
      {
        uint64_t v16 = &qword_26A92AB70;
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_8(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21[0]);
      uint64_t v13 = *(void *)(v23 + 24);
      uint64_t v14 = *(unsigned __int16 *)(v13 + v11);
      if (*(_WORD *)(v13 + v11))
      {
        if ((((_BYTE)v13 + LOBYTE(v21[0]) + (_BYTE)v14) & 3) != 0) {
          int v15 = v12;
        }
        else {
          int v15 = 0;
        }
        if (v15 == 1)
        {
          uint64_t v16 = &qword_26A92AB80;
LABEL_12:
          __swift_instantiateConcreteTypeFromMangledName(v16);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v17 = swift_allocError();
          OUTLINED_FUNCTION_19(v17, v18);
LABEL_15:
          swift_release();
          return;
        }
        Verifier.rangeInBuffer(position:size:)(v21[0] + v14, 4);
        if (v19) {
          goto LABEL_15;
        }
      }
    }
    sub_261715E00();
    goto LABEL_15;
  }
}

void sub_2617302F8(int a1, unint64_t a2)
{
}

uint64_t WK2_DayOfYearWeatherStatistics.dayOfYear.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 5u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 4);
    int v6 = v5 + 4;
    if (!v4)
    {
      int v7 = *(__int16 *)(v2 + v6);
      if (v7)
      {
        BOOL v4 = __OFADD__(v7, v1);
        int v8 = v7 + v1;
        if (!v4) {
          return *(unsigned __int16 *)(v2 + v8);
        }
        goto LABEL_10;
      }
      return OUTLINED_FUNCTION_32();
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t WK2_DayOfYearWeatherStatistics.temperature.getter()
{
  uint64_t result = OUTLINED_FUNCTION_32_0();
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  __n128 v6 = 0uLL;
  if (*(unsigned __int16 *)(v2 + v4) < 7u)
  {
LABEL_8:
    uint64_t v10 = 0;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
  BOOL v5 = __OFADD__(v4, 6);
  int v7 = v4 + 6;
  if (v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v8 = *(__int16 *)(v2 + v7);
  if (!v8) {
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v8, v3);
  int v9 = v8 + v3;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!__OFADD__(v9, *(_DWORD *)(v2 + v9)))
  {
    __n128 v11 = *(__n128 *)(v0 + 8);
    uint64_t v10 = swift_retain();
    __n128 v6 = v11;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t WK2_DayOfYearWeatherStatistics.precipitation.getter()
{
  uint64_t result = OUTLINED_FUNCTION_32_0();
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  __n128 v6 = 0uLL;
  if (*(unsigned __int16 *)(v2 + v4) < 9u)
  {
LABEL_8:
    uint64_t v10 = 0;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
  BOOL v5 = __OFADD__(v4, 8);
  int v7 = v4 + 8;
  if (v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v8 = *(__int16 *)(v2 + v7);
  if (!v8) {
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v8, v3);
  int v9 = v8 + v3;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!__OFADD__(v9, *(_DWORD *)(v2 + v9)))
  {
    __n128 v11 = *(__n128 *)(v0 + 8);
    uint64_t v10 = swift_retain();
    __n128 v6 = v11;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t _s11WeatherData09WK2_DailyA10StatisticsV05startdaE0ys6UInt32VAA17FlatBufferBuilderVzFZ_0(unint64_t result)
{
  unint64_t v1 = result;
  *(unsigned char *)(result + 40) = 1;
  uint64_t v2 = *(void *)result;
  if (*(void *)(*(void *)result + 56) < *(void *)(*(void *)result + 80) + 24)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v3 = *(void *)(v2 + 32);
    if (v3) {
      MEMORY[0x263E3EDF0](v3, -1, -1);
    }
    uint64_t v4 = swift_slowAlloc();
    *(void *)(v2 + 32) = v4;
    *(void *)(v2 + 40) = v4 + 24;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 24;
  }
  uint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_DayOfYearWeatherStatistics.add(dayOfYear:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v3 = v2;
  __int16 v5 = v4;
  if (!v4)
  {
    OUTLINED_FUNCTION_17();
    if (!v6)
    {
LABEL_20:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v3[8] <= 1)
  {
    v3[8] = 2;
    v3[3] = 2;
  }
  unint64_t v7 = v3[2];
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (HIDWORD(v7))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_19_0();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v3[3]);
  }
  v3[2] = v1;
  unint64_t v12 = v1 + 2;
  int64_t v13 = *(void *)(v0 + 32);
  if (v13 < (uint64_t)(v1 + 2))
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(2, v1, v3[3]);
    int64_t v13 = *(void *)(v0 + 32);
  }
  *(_WORD *)(v13 - v1 + *(void *)(v0 + 24) - 2) = v5;
  v3[2] = v12;
  if (v1 > 0xFFFFFFFD) {
LABEL_23:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = *(void *)(v14 + 32);
    if (v16)
    {
      uint64_t v17 = v16 + *(void *)(v14 + 80);
      *(_DWORD *)uint64_t v17 = v12;
      *(_WORD *)(v17 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v6 & v21)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_20;
  }
  __break(1u);
}

void static WK2_DayOfYearWeatherStatistics.add(temperature:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_27;
  }
  __break(1u);
}

void static WK2_DayOfYearWeatherStatistics.add(precipitation:_:)()
{
  sub_2617307F8();
}

void sub_2617307F8()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 8;
    }
    *(int64x2_t *)(v15 + 72) = vaddq_s64(*(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v18 = *(unsigned __int16 *)(v15 + 64);
    if (v18 <= 8) {
      LOWORD(v18) = 8;
    }
    *(_WORD *)(v15 + 64) = v18;
    goto LABEL_27;
  }
  __break(1u);
}

uint64_t static WK2_DayOfYearWeatherStatistics.endDayOfYearWeatherStatistics(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

void static WK2_DayOfYearWeatherStatistics.createDayOfYearWeatherStatistics(_:dayOfYear:temperatureOffset:precipitationOffset:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  Swift::UInt32 v2 = static WK2_DayOfYearWeatherStatistics.startDayOfYearWeatherStatistics(_:)();
  static WK2_DayOfYearWeatherStatistics.add(dayOfYear:_:)();
  static WK2_DayOfYearWeatherStatistics.add(temperature:_:)();
  static WK2_DayOfYearWeatherStatistics.add(precipitation:_:)();
  *uint64_t v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_20();
}

void static WK2_DayOfYearWeatherStatistics.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v21);
  uint64_t v11 = v2;
  if (!v2)
  {
    if (v21[2] >= 5)
    {
      uint64_t v12 = v21[1] + 4;
      int v13 = v22;
      if (v22 == 1 && ((*(_DWORD *)(v23 + 24) + v12) & 1) != 0)
      {
        char v16 = &qword_26A92AB70;
        goto LABEL_9;
      }
      OUTLINED_FUNCTION_8(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21[0]);
      uint64_t v11 = 0;
      uint64_t v14 = *(void *)(v23 + 24);
      uint64_t v15 = *(unsigned __int16 *)(v14 + v12);
      if (*(_WORD *)(v14 + v12))
      {
        if ((v13 & (v14 + LODWORD(v21[0]) + v15)) == 1)
        {
          char v16 = (uint64_t *)&unk_26A92AC50;
LABEL_9:
          __swift_instantiateConcreteTypeFromMangledName(v16);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v17 = swift_allocError();
          OUTLINED_FUNCTION_19(v17, v18);
LABEL_13:
          swift_release();
          return;
        }
        Verifier.rangeInBuffer(position:size:)(v21[0] + v15, 2);
        uint64_t v11 = v19;
        if (v19) {
          goto LABEL_13;
        }
      }
    }
    sub_261715DA8();
    if (!v11) {
      sub_261715DD4();
    }
    goto LABEL_13;
  }
}

void sub_261730B80(int a1, unint64_t a2)
{
}

ValueMetadata *type metadata accessor for WK2_DailyWeatherStatistics()
{
  return &type metadata for WK2_DailyWeatherStatistics;
}

ValueMetadata *type metadata accessor for WK2_DayOfYearWeatherStatistics()
{
  return &type metadata for WK2_DayOfYearWeatherStatistics;
}

uint64_t WK2_DailySummary.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = *(void *)v1;
  uint64_t v3 = *(int *)(v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 24);
  int v5 = *(_DWORD *)(v4 + v3);
  BOOL v6 = __OFSUB__(v3, v5);
  int v7 = v3 - v5;
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  long long v8 = *(_OWORD *)(v1 + 8);
  if (*(unsigned __int16 *)(v4 + v7) < 5u)
  {
    int v10 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v10, v3);
    int v11 = v10 + v3;
    if (!v6)
    {
      int v12 = *(_DWORD *)(v4 + v11);
      BOOL v6 = __OFADD__(v11, v12);
      int v13 = v11 + v12;
      if (!v6)
      {
        *(void *)a1 = result;
        *(_OWORD *)(a1 + 8) = v8;
        *(_DWORD *)(a1 + 24) = v13;
        return swift_retain();
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v7, 4);
  int v9 = v7 + 4;
  if (!v6)
  {
    int v10 = *(__int16 *)(v4 + v9);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

void WK2_DailySummary.startDate.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 7u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 6);
    int v4 = v2 + 6;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_DailySummary.endDate.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 9u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 8);
    int v4 = v2 + 8;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

uint64_t WK2_DailySummary.hasDays.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 0xBu) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 10);
    int v6 = v5 + 10;
    if (!v4) {
      return *(unsigned __int16 *)(v2 + v6) != 0;
    }
  }
  __break(1u);
  return result;
}

void WK2_DailySummary.daysCount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xBu)
  {
LABEL_8:
    OUTLINED_FUNCTION_32();
    return;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (!v5) {
    goto LABEL_8;
  }
  BOOL v3 = __OFADD__(v5, v1);
  int v6 = v5 + v1;
  if (!v3)
  {
    if (!__OFADD__(v6, *(_DWORD *)(v0 + v6)))
    {
      OUTLINED_FUNCTION_88(v0);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
}

uint64_t WK2_DailySummary.days(at:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t result = *(void *)v2;
  uint64_t v6 = *(int *)(v2 + 24);
  uint64_t v7 = *(void *)(*(void *)v2 + 24);
  int v8 = *(_DWORD *)(v7 + v6);
  BOOL v9 = __OFSUB__(v6, v8);
  int v10 = v6 - v8;
  if (v9)
  {
    __break(1u);
    goto LABEL_15;
  }
  long long v11 = 0uLL;
  if (*(unsigned __int16 *)(v7 + v10) < 0xBu)
  {
LABEL_12:
    uint64_t result = 0;
    int v20 = 0;
    goto LABEL_13;
  }
  BOOL v9 = __OFADD__(v10, 10);
  int v12 = v10 + 10;
  if (v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v13 = *(__int16 *)(v7 + v12);
  if (!v13) {
    goto LABEL_12;
  }
  BOOL v9 = __OFADD__(v13, v6);
  int v14 = v13 + v6;
  if (v9)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v15 = *(_DWORD *)(v7 + v14);
  BOOL v9 = __OFADD__(v14, v15);
  int v16 = v14 + v15;
  if (v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  BOOL v9 = __OFADD__(v16, 4);
  int v17 = v16 + 4;
  if (v9)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((a1 - 0x20000000) >> 30 != 3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v9 = __OFADD__(v17, 4 * a1);
  int v18 = v17 + 4 * a1;
  if (v9)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int v19 = *(_DWORD *)(v7 + v18);
  int v20 = v18 + v19;
  if (!__OFADD__(v18, v19))
  {
    long long v21 = *(_OWORD *)(v2 + 8);
    uint64_t result = swift_retain();
    long long v11 = v21;
LABEL_13:
    *(void *)a2 = result;
    *(_OWORD *)(a2 + 8) = v11;
    *(_DWORD *)(a2 + 24) = v20;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

unint64_t static WK2_DailySummary.startDailySummary(_:)(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (*(void *)(v2 + 56) < v4 + 32)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5) {
      MEMORY[0x263E3EDF0](v5, -1, -1);
    }
    uint64_t v6 = swift_slowAlloc();
    *(void *)(v2 + 32) = v6;
    *(void *)(v2 + 40) = v6 + 32;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 32;
  }
  unint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_DailySummary.add(metadata:_:)(int *a1, void *a2)
{
  int v4 = *a1;
  if (!*a1) {
    return;
  }
  if ((uint64_t)a2[8] < 4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = a2[2];
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (HIDWORD(v6))
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0((uint64_t)a1, v6);
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, a2[3]);
  }
  a2[2] = v3;
  if (HIDWORD(v3)) {
    goto LABEL_29;
  }
  if (v3 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11) {
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v3, a2[3]);
  }
  OUTLINED_FUNCTION_7();
  if (v9 != v10)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_30:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v16)
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = *(void *)(v15 + 32);
    if (v17)
    {
      uint64_t v18 = v17 + *(void *)(v15 + 80);
      *(_DWORD *)uint64_t v18 = v3;
      *(_WORD *)(v18 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v20 = v21;
    }
    *(_WORD *)(v19 + 64) = v20;
  }
}

void static WK2_DailySummary.add(startDate:_:)(int a1, uint64_t a2)
{
  if (!a1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v6 ^ v7 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(a2 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_8_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(a2 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v11 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_15(v11);
  if (!v4 & v12) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v14)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v13 + 32))
    {
      OUTLINED_FUNCTION_81(v13);
      *(_WORD *)(v15 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v13, *(int64x2_t *)(v13 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v12)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
  }
}

void static WK2_DailySummary.add(endDate:_:)(int a1, uint64_t a2)
{
  if (!a1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v6 ^ v7 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(a2 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_8_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(a2 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v11 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_15(v11);
  if (!v4 & v12) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v14)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v13 + 32))
    {
      OUTLINED_FUNCTION_81(v13);
      *(_WORD *)(v15 + 4) = 8;
    }
    OUTLINED_FUNCTION_77(v13, *(int64x2_t *)(v13 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v12)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
  }
}

void static WK2_DailySummary.addVectorOf(days:_:)(int *a1, void *a2)
{
  int v4 = *a1;
  if (!*a1) {
    return;
  }
  if ((uint64_t)a2[8] < 4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = a2[2];
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (HIDWORD(v6))
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0((uint64_t)a1, v6);
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, a2[3]);
  }
  a2[2] = v3;
  if (HIDWORD(v3)) {
    goto LABEL_29;
  }
  if (v3 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11) {
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v3, a2[3]);
  }
  OUTLINED_FUNCTION_7();
  if (v9 != v10)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_30:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v16)
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = *(void *)(v15 + 32);
    if (v17)
    {
      uint64_t v18 = v17 + *(void *)(v15 + 80);
      *(_DWORD *)uint64_t v18 = v3;
      *(_WORD *)(v18 + 4) = 10;
    }
    OUTLINED_FUNCTION_90(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v20 = v21;
    }
    *(_WORD *)(v19 + 64) = v20;
  }
}

uint64_t static WK2_DailySummary.createDailySummary(_:metadataOffset:startDate:endDate:daysVectorOffset:)@<X0>(void *a1@<X0>, int *a2@<X1>, int a3@<W2>, int a4@<W3>, int *a5@<X4>, _DWORD *a6@<X8>)
{
  int v10 = *a2;
  int v11 = *a5;
  Swift::UInt32 v12 = static WK2_DailySummary.startDailySummary(_:)((uint64_t)a1);
  int v15 = v10;
  static WK2_DailySummary.add(metadata:_:)(&v15, a1);
  static WK2_DailySummary.add(startDate:_:)(a3, (uint64_t)a1);
  static WK2_DailySummary.add(endDate:_:)(a4, (uint64_t)a1);
  int v14 = v11;
  static WK2_DailySummary.addVectorOf(days:_:)(&v14, a1);
  uint64_t result = FlatBufferBuilder.endTable(at:)(v12);
  *a6 = result;
  return result;
}

void static WK2_DailySummary.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v14);
  if (!v2)
  {
    sub_2617159B0();
    unint64_t v3 = v15;
    if (v15 < 7) {
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_86();
    if (!v4 || (OUTLINED_FUNCTION_11(), (v5 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v6)
      {
        OUTLINED_FUNCTION_26();
        if (v7 == 1)
        {
LABEL_8:
          uint64_t v17 = MEMORY[0x263F8E8F8];
          Swift::Int v8 = &qword_26A92AB80;
LABEL_18:
          __swift_instantiateConcreteTypeFromMangledName(v8);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v12 = swift_allocError();
          OUTLINED_FUNCTION_19(v12, v13);
          goto LABEL_19;
        }
        OUTLINED_FUNCTION_31();
      }
      if (v3 <= 8)
      {
LABEL_16:
        sub_261715D7C();
LABEL_19:
        swift_release();
        return;
      }
      if (v16 != 1 || (OUTLINED_FUNCTION_11(), (v9 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v10)
        {
          OUTLINED_FUNCTION_47();
          if (v11 == 1) {
            goto LABEL_8;
          }
          OUTLINED_FUNCTION_31();
        }
        goto LABEL_16;
      }
    }
    uint64_t v17 = MEMORY[0x263F8E888];
    Swift::Int v8 = &qword_26A92AB70;
    goto LABEL_18;
  }
}

void sub_2617315BC(int a1, unint64_t a2)
{
}

void WK2_DaySummary.date.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v0 + v2) < 5u) {
      goto LABEL_7;
    }
    BOOL v3 = __OFADD__(v2, 4);
    int v4 = v2 + 4;
    if (!v3)
    {
      int v5 = *(__int16 *)(v0 + v4);
      if (v5)
      {
        if (!__OFADD__(v5, v1))
        {
          OUTLINED_FUNCTION_88(v0);
          return;
        }
        goto LABEL_10;
      }
LABEL_7:
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

void WK2_DaySummary.temperatureMin.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 7u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 6);
  int v4 = v2 + 6;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_DaySummary.temperatureMax.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 9u) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 8);
  int v4 = v2 + 8;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_DaySummary.precipitationAmount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xBu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 10);
  int v4 = v2 + 10;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

void WK2_DaySummary.snowfallAmount.getter()
{
  OUTLINED_FUNCTION_1();
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (*(unsigned __int16 *)(v0 + v2) < 0xDu) {
    return;
  }
  BOOL v3 = __OFADD__(v2, 12);
  int v4 = v2 + 12;
  if (v3) {
    goto LABEL_8;
  }
  int v5 = *(__int16 *)(v0 + v4);
  if (v5 && __OFADD__(v5, v1)) {
    goto LABEL_9;
  }
}

unint64_t static WK2_DaySummary.startDaySummary(_:)(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (*(void *)(v2 + 56) < v4 + 40)
  {
    if (*(unsigned char *)(v2 + 48))
    {
LABEL_11:
      __break(1u);
      return result;
    }
    uint64_t v5 = *(void *)(v2 + 32);
    if (v5) {
      MEMORY[0x263E3EDF0](v5, -1, -1);
    }
    uint64_t v6 = swift_slowAlloc();
    *(void *)(v2 + 32) = v6;
    *(void *)(v2 + 40) = v6 + 40;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = 40;
  }
  unint64_t result = *(void *)(v1 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(result))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void static WK2_DaySummary.add(date:_:)(int a1, uint64_t a2)
{
  if (!a1)
  {
    OUTLINED_FUNCTION_17();
    if (!v4) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v6 ^ v7 | v4) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(a2 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_8_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(a2 + 24));
  }
  OUTLINED_FUNCTION_25();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v11 = *(void *)(v2 + 32);
  }
  OUTLINED_FUNCTION_15(v11);
  if (!v4 & v12) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v14)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v13 + 32))
    {
      OUTLINED_FUNCTION_81(v13);
      *(_WORD *)(v15 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v13, *(int64x2_t *)(v13 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v12)) {
      __int16 v17 = v18;
    }
    *(_WORD *)(v16 + 64) = v17;
  }
}

void static WK2_DaySummary.add(temperatureMin:_:)()
{
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v2) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v4 ^ v5 | v2) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_9_0();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v9 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v9);
  if (!v2 & v10) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v12)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v11 + 32))
    {
      OUTLINED_FUNCTION_37(v11);
      *(_WORD *)(v13 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v2 & v10)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
  }
}

void static WK2_DaySummary.add(temperatureMax:_:)()
{
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v2) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v4 ^ v5 | v2) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_9_0();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v9 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v9);
  if (!v2 & v10) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v12)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v11 + 32))
    {
      OUTLINED_FUNCTION_37(v11);
      *(_WORD *)(v13 + 4) = 8;
    }
    OUTLINED_FUNCTION_77(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v2 & v10)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
  }
}

void static WK2_DaySummary.add(precipitationAmount:_:)()
{
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v2) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v4 ^ v5 | v2) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_9_0();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v9 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v9);
  if (!v2 & v10) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v12)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v11 + 32))
    {
      OUTLINED_FUNCTION_37(v11);
      *(_WORD *)(v13 + 4) = 10;
    }
    OUTLINED_FUNCTION_90(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v2 & v10)) {
      __int16 v15 = v16;
    }
    *(_WORD *)(v14 + 64) = v15;
  }
}

void static WK2_DaySummary.add(snowfallAmount:_:)()
{
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_61();
  if (v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v2) {
      return;
    }
  }
  OUTLINED_FUNCTION_51();
  if (v4 ^ v5 | v2) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (HIDWORD(v6))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_9_0();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_35();
    uint64_t v9 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_5(v9);
  if (!v2 & v10) {
LABEL_25:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if (v12)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v11 + 32))
    {
      OUTLINED_FUNCTION_37(v11);
      *(_WORD *)(v13 + 4) = 12;
    }
    *(int64x2_t *)(v11 + 72) = vaddq_s64(*(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v14 = *(unsigned __int16 *)(v11 + 64);
    if (v14 <= 0xC) {
      LOWORD(v14) = 12;
    }
    *(_WORD *)(v11 + 64) = v14;
  }
}

uint64_t static WK2_DaySummary.endDaySummary(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

uint64_t static WK2_DaySummary.createDaySummary(_:date:temperatureMin:temperatureMax:precipitationAmount:snowfallAmount:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  Swift::UInt32 v6 = static WK2_DaySummary.startDaySummary(_:)(a1);
  static WK2_DaySummary.add(date:_:)(a2, a1);
  static WK2_DaySummary.add(temperatureMin:_:)();
  static WK2_DaySummary.add(temperatureMax:_:)();
  static WK2_DaySummary.add(precipitationAmount:_:)();
  static WK2_DaySummary.add(snowfallAmount:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(v6);
  *a3 = result;
  return result;
}

void static WK2_DaySummary.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v23);
  if (!v2)
  {
    unint64_t v3 = v24;
    if (v24 < 5) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_86();
    if (!v4 || (OUTLINED_FUNCTION_11(), (v5 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v6)
      {
        OUTLINED_FUNCTION_26();
        if (v7 == 1)
        {
          uint64_t v26 = MEMORY[0x263F8E8F8];
          Swift::Int v8 = &qword_26A92AB80;
LABEL_39:
          __swift_instantiateConcreteTypeFromMangledName(v8);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v21 = swift_allocError();
          OUTLINED_FUNCTION_19(v21, v22);
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_31();
      }
      if (v3 <= 6) {
        goto LABEL_40;
      }
      OUTLINED_FUNCTION_86();
      if (!v4 || (OUTLINED_FUNCTION_11(), (v9 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v10)
        {
          OUTLINED_FUNCTION_26();
          if (v11 == 1)
          {
LABEL_16:
            uint64_t v26 = MEMORY[0x263F8D5C8];
            Swift::Int v8 = &qword_26A92AB88;
            goto LABEL_39;
          }
          OUTLINED_FUNCTION_31();
        }
        if (v3 < 9) {
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_86();
        if (v4)
        {
          OUTLINED_FUNCTION_11();
          if (v12) {
            goto LABEL_38;
          }
        }
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v13)
        {
          OUTLINED_FUNCTION_26();
          if (v14 == 1) {
            goto LABEL_16;
          }
          OUTLINED_FUNCTION_31();
        }
        if (v3 < 0xB) {
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_86();
        if (v4)
        {
          OUTLINED_FUNCTION_11();
          if (v15) {
            goto LABEL_38;
          }
        }
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v16)
        {
          OUTLINED_FUNCTION_26();
          if (v17 == 1) {
            goto LABEL_16;
          }
          OUTLINED_FUNCTION_31();
        }
        if (v3 < 0xD)
        {
LABEL_40:
          swift_release();
          return;
        }
        if (v25 != 1 || (OUTLINED_FUNCTION_11(), (v18 & 1) == 0))
        {
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_33();
          if (v19)
          {
            OUTLINED_FUNCTION_47();
            if (v20 == 1) {
              goto LABEL_16;
            }
            OUTLINED_FUNCTION_31();
          }
          goto LABEL_40;
        }
      }
    }
LABEL_38:
    uint64_t v26 = MEMORY[0x263F8E888];
    Swift::Int v8 = &qword_26A92AB70;
    goto LABEL_39;
  }
}

void sub_261732004(int a1, unint64_t a2)
{
}

ValueMetadata *type metadata accessor for WK2_DailySummary()
{
  return &type metadata for WK2_DailySummary;
}

ValueMetadata *type metadata accessor for WK2_DaySummary()
{
  return &type metadata for WK2_DaySummary;
}

uint64_t Message.object.getter(uint64_t a1)
{
  uint64_t result = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = *(void *)(*v1 + 32) - v4;
  if (v5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v5 > 0x7FFFFFFF) {
    goto LABEL_7;
  }
  int v6 = *(_DWORD *)(*(void *)(result + 24) + v5);
  if (v6 < 0) {
    goto LABEL_7;
  }
  uint64_t v7 = (v6 + v5);
  if (!__OFADD__(v6, v5))
  {
    uint64_t v8 = v1[2];
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = *(void *)(*(void *)(a1 + 24) + 8);
    int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8);
    uint64_t v12 = swift_retain();
    return v11(v12, v4, v8, v7, v9, v10);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t Message.rawPointer.getter()
{
  return *(void *)(*v0 + 24) + *(void *)(*v0 + 32) - v0[1];
}

unint64_t Message.size.getter()
{
  unint64_t result = *(void *)(v0 + 8);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (HIDWORD(result)) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t Message.init(byteBuffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void Message.init(builder:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  size_t v2 = *(void *)(a1 + 16);
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v2))
  {
    uint64_t v4 = (void *)(*(void *)(*(void *)(a1 + 8) + 24) + *(void *)(*(void *)(a1 + 8) + 32) - v2);
    type metadata accessor for ByteBuffer.Storage();
    swift_allocObject();
    uint64_t v5 = ByteBuffer.Storage.init(count:alignment:)(v2);
    ByteBuffer.Storage.copy(from:count:)(v4, v2);
    uint64_t v6 = *(void *)(v5 + 32);
    FlatBufferBuilder.clear()();
    *a2 = v5;
    a2[1] = v6;
    a2[2] = 1;
    return;
  }
  __break(1u);
}

uint64_t dispatch thunk of FlatBufferGRPCMessage.rawPointer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FlatBufferGRPCMessage.size.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FlatBufferGRPCMessage.init(byteBuffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t sub_26173223C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t initializeBufferWithCopyOfBuffer for ByteBuffer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

void *assignWithCopy for ByteBuffer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ByteBuffer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ByteBuffer(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t storeEnumTagSinglePayload for ByteBuffer(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Message()
{
  return __swift_instantiateGenericMetadata();
}

void *__swift_memcpy13_4(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VerifierOptions(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 13))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 12);
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
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

uint64_t storeEnumTagSinglePayload for VerifierOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 13) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 13) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 12) = a2 + 1;
    }
  }
  return result;
}

void TableVerifier.visit<A>(field:fieldName:required:type:)(unsigned __int16 a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = a1;
  if (*(void *)(v7 + 16) <= (uint64_t)a1)
  {
    uint64_t v13 = a2;
  }
  else
  {
    Swift::Int v12 = *(void *)(v7 + 8) + a1;
    if (*(unsigned char *)(v7 + 24) == 1 && ((*(_DWORD *)(*(void *)(v7 + 64) + 24) + v12) & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
      uint64_t v16 = sub_26173BC20();
      sub_2617295E0();
      uint64_t v17 = OUTLINED_FUNCTION_44();
      *char v18 = v12;
      v18[1] = v16;
      OUTLINED_FUNCTION_3_0(v17, (uint64_t)v18);
      goto LABEL_11;
    }
    uint64_t v13 = a2;
    OUTLINED_FUNCTION_29(v12);
    if (v8) {
      return;
    }
    if (*(_WORD *)(*(void *)(*(void *)(v7 + 64) + 24) + v12))
    {
      (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 8))(v7 + 24, *(void *)v7 + *(unsigned __int16 *)(*(void *)(*(void *)(v7 + 64) + 24) + v12), a6, a6, a7, a6, a7);
      return;
    }
  }
  if ((a4 & 1) == 0) {
    return;
  }
  sub_2617295E0();
  uint64_t v14 = OUTLINED_FUNCTION_44();
  *char v15 = v10;
  v15[1] = v13;
  OUTLINED_FUNCTION_1_2(v14, (uint64_t)v15);
  swift_bridgeObjectRetain();
LABEL_11:
  swift_willThrow();
}

Swift::Void __swiftcall TableVerifier.finish()()
{
  uint64_t v1 = *(void *)(v0 + 56);
  BOOL v2 = __OFSUB__(v1, 1);
  uint64_t v3 = v1 - 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(v0 + 56) = v3;
  }
}

void TableVerifier.visit<A>(unionKey:unionField:unionKeyName:fieldName:required:completion:)(unsigned __int16 a1, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(uint64_t, char *, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13 = v11;
  LODWORD(v64) = a7;
  uint64_t v65 = a5;
  uint64_t v66 = a6;
  uint64_t v67 = a3;
  uint64_t v61 = a11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v60 = (char *)&v52 - v18;
  sub_26173BD90();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_0_0();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v26 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = *(void *)(v13 + 16);
  if (v27 <= a1)
  {
    unint64_t v58 = a8;
    uint64_t v59 = a1;
    uint64_t v30 = 0;
    unsigned int v29 = 1;
  }
  else
  {
    uint64_t v62 = a4;
    Swift::Int v28 = *(void *)(v13 + 8) + a1;
    if (*(unsigned char *)(v13 + 24) == 1 && ((*(_DWORD *)(*(void *)(v13 + 64) + 24) + v28) & 1) != 0) {
      goto LABEL_17;
    }
    unint64_t v58 = a8;
    uint64_t v59 = a1;
    uint64_t v53 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v54 = v24;
    uint64_t v56 = v23;
    uint64_t v57 = v25;
    uint64_t v55 = v21;
    OUTLINED_FUNCTION_29(v28);
    if (v12) {
      return;
    }
    if (*(_WORD *)(*(void *)(*(void *)(v13 + 64) + 24) + v28))
    {
      unsigned int v29 = 0;
      uint64_t v30 = *(void *)v13 + *(unsigned __int16 *)(*(void *)(*(void *)(v13 + 64) + 24) + v28);
    }
    else
    {
      uint64_t v30 = 0;
      unsigned int v29 = 1;
    }
    a4 = v62;
    uint64_t v21 = v55;
    uint64_t v23 = v56;
    uint64_t v26 = v53;
    uint64_t v24 = v54;
    uint64_t v25 = v57;
  }
  if (v27 <= a2) {
    goto LABEL_19;
  }
  uint64_t v62 = a4;
  Swift::Int v28 = *(void *)(v13 + 8) + a2;
  if (*(unsigned char *)(v13 + 24) != 1 || ((*(_DWORD *)(*(void *)(v13 + 64) + 24) + v28) & 1) == 0)
  {
    uint64_t v31 = v30;
    uint64_t v53 = v26;
    uint64_t v54 = v24;
    uint64_t v56 = v23;
    uint64_t v57 = v25;
    uint64_t v55 = v21;
    Verifier.rangeInBuffer(position:size:)(v28, 2);
    if (v32) {
      return;
    }
    if (*(_WORD *)(*(void *)(*(void *)(v13 + 64) + 24) + v28))
    {
      uint64_t v64 = *(void *)v13 + *(unsigned __int16 *)(*(void *)(*(void *)(v13 + 64) + 24) + v28);
      if ((v29 & 1) == 0)
      {
        uint64_t v45 = AssociatedTypeWitness;
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness
                                                                                              + 8))(v13 + 24, v31, v45, v45, AssociatedConformanceWitness, v45, AssociatedConformanceWitness);
        sub_26173B7EC();
        uint64_t v47 = v60;
        sub_26173BDA0();
        (*(void (**)(char *, uint64_t))(v61 + 16))(v47, a10);
        uint64_t v48 = v57;
        if (__swift_getEnumTagSinglePayload(v57, 1, a10) != 1)
        {
          uint64_t v50 = v56;
          uint64_t v51 = v53;
          (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v53, v48, a10);
          v58(v13 + 24, v51, v64);
          (*(void (**)(char *, uint64_t))(v50 + 8))(v51, a10);
          return;
        }
        (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v48, v55);
        sub_2617295E0();
        OUTLINED_FUNCTION_44();
        *(void *)uint64_t v49 = 5;
        *(_OWORD *)(v49 + 8) = 0u;
        *(_OWORD *)(v49 + 24) = 0u;
        *(_OWORD *)(v49 + 40) = 0u;
        *(void *)(v49 + 56) = 0;
        *(unsigned char *)(v49 + 64) = 7;
        goto LABEL_25;
      }
      uint64_t v33 = 0;
      a4 = v62;
      uint64_t v34 = v67;
      uint64_t v35 = v64;
      goto LABEL_23;
    }
    a4 = v62;
    uint64_t v30 = v31;
LABEL_19:
    if (v29)
    {
      if ((v64 & 1) == 0) {
        return;
      }
      sub_2617295E0();
      uint64_t v40 = OUTLINED_FUNCTION_44();
      uint64_t v41 = v67;
      *uint64_t v42 = v59;
      v42[1] = v41;
      OUTLINED_FUNCTION_1_2(v40, (uint64_t)v42);
      goto LABEL_24;
    }
    uint64_t v31 = v30;
    uint64_t v35 = 0;
    uint64_t v33 = 1;
    uint64_t v34 = v67;
LABEL_23:
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    *(void *)uint64_t v43 = v31;
    *(void *)(v43 + 8) = v29;
    *(void *)(v43 + 16) = v34;
    *(void *)(v43 + 24) = a4;
    *(void *)(v43 + 32) = v35;
    *(void *)(v43 + 40) = v33;
    uint64_t v44 = v66;
    *(void *)(v43 + 48) = v65;
    *(void *)(v43 + 56) = v44;
    *(unsigned char *)(v43 + 64) = 5;
    swift_bridgeObjectRetain();
LABEL_24:
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v68 = MEMORY[0x263F8E888];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
  uint64_t v36 = sub_26173BC20();
  uint64_t v38 = v37;
  sub_2617295E0();
  OUTLINED_FUNCTION_44();
  *(void *)uint64_t v39 = v28;
  *(void *)(v39 + 8) = v36;
  *(void *)(v39 + 16) = v38;
  *(_OWORD *)(v39 + 24) = 0u;
  *(_OWORD *)(v39 + 40) = 0u;
  *(_OWORD *)(v39 + 49) = 0u;
LABEL_25:
  swift_willThrow();
}

void TableVerifier.visitUnionVector<A>(unionKey:unionField:unionKeyName:fieldName:required:completion:)(unsigned __int16 a1, unsigned __int16 a2, void (**a3)(char *, uint64_t, uint64_t), uint64_t a4, void (*a5)(char *, uint64_t, uint64_t), uint64_t a6, char a7, void (*a8)(unsigned __int8 *, char *, Swift::Int), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v15 = *(void *)(v11 + 16);
  if (v15 <= a1)
  {
    uint64_t v33 = a5;
    uint64_t v34 = a6;
    Swift::Int v20 = 0;
    char v19 = 1;
  }
  else
  {
    Swift::Int v16 = *(void *)(v11 + 8) + a1;
    if (*(unsigned char *)(v11 + 24) == 1 && ((*(_DWORD *)(*(void *)(v11 + 64) + 24) + v16) & 1) != 0) {
      goto LABEL_20;
    }
    uint64_t v31 = a3;
    uint64_t v33 = a5;
    uint64_t v17 = a4;
    uint64_t v18 = a8;
    uint64_t v34 = a6;
    OUTLINED_FUNCTION_29(v16);
    if (v12) {
      return;
    }
    if (*(_WORD *)(*(void *)(*(void *)(v11 + 64) + 24) + v16))
    {
      char v19 = 0;
      Swift::Int v20 = *(void *)v11 + *(unsigned __int16 *)(*(void *)(*(void *)(v11 + 64) + 24) + v16);
    }
    else
    {
      Swift::Int v20 = 0;
      char v19 = 1;
    }
    a8 = v18;
    a4 = v17;
    a3 = v31;
  }
  uint64_t v21 = a2;
  if (v15 > a2)
  {
    Swift::Int v16 = *(void *)(v11 + 8) + a2;
    if (*(unsigned char *)(v11 + 24) != 1 || ((*(_DWORD *)(*(void *)(v11 + 64) + 24) + v16) & 1) == 0)
    {
      char v22 = v19;
      Swift::Int v23 = v20;
      uint64_t v24 = a3;
      uint64_t v30 = a4;
      uint64_t v32 = a8;
      OUTLINED_FUNCTION_29(v16);
      if (v12) {
        return;
      }
      if (*(_WORD *)(*(void *)(*(void *)(v11 + 64) + 24) + v16)) {
        char v25 = v22;
      }
      else {
        char v25 = 1;
      }
      if ((v25 & 1) == 0)
      {
        static UnionVector.verify(_:keyPosition:fieldPosition:unionKeyName:fieldName:completion:)((unsigned __int8 *)(v11 + 24), v23, *(void *)v11 + *(unsigned __int16 *)(*(void *)(*(void *)(v11 + 64) + 24) + v16), v24, v30, v33, v34, v32, a9, a10, a11);
        return;
      }
      goto LABEL_18;
    }
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
    uint64_t v27 = sub_26173BC20();
    sub_2617295E0();
    uint64_t v28 = OUTLINED_FUNCTION_44();
    *unsigned int v29 = v16;
    v29[1] = v27;
    OUTLINED_FUNCTION_3_0(v28, (uint64_t)v29);
    goto LABEL_21;
  }
LABEL_18:
  if ((a7 & 1) == 0) {
    return;
  }
  sub_2617295E0();
  OUTLINED_FUNCTION_44();
  *(void *)uint64_t v26 = v21;
  *(void *)(v26 + 8) = v33;
  *(void *)(v26 + 16) = v34;
  *(_OWORD *)(v26 + 24) = 0u;
  *(_OWORD *)(v26 + 40) = 0u;
  *(void *)(v26 + 56) = 0;
  *(unsigned char *)(v26 + 64) = 3;
  swift_bridgeObjectRetain();
LABEL_21:
  swift_willThrow();
}

uint64_t destroy for TableVerifier()
{
  return swift_release();
}

uint64_t initializeWithCopy for TableVerifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v3 = *(void *)(a2 + 88);
  *(void *)(a1 + 93) = *(void *)(a2 + 93);
  *(void *)(a1 + 88) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TableVerifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 100) = *(unsigned char *)(a2 + 100);
  return a1;
}

void *__swift_memcpy101_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x65uLL);
}

uint64_t assignWithTake for TableVerifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 100) = *(unsigned char *)(a2 + 100);
  return a1;
}

uint64_t getEnumTagSinglePayload for TableVerifier(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 101))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 64);
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

uint64_t storeEnumTagSinglePayload for TableVerifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 100) = 0;
    *(_DWORD *)(result + 96) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 101) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 101) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TableVerifier()
{
  return &type metadata for TableVerifier;
}

uint64_t WK2_MonthlyWeatherStatistics.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = *(void *)v1;
  uint64_t v3 = *(int *)(v1 + 24);
  uint64_t v4 = *(void *)(*(void *)v1 + 24);
  int v5 = *(_DWORD *)(v4 + v3);
  BOOL v6 = __OFSUB__(v3, v5);
  int v7 = v3 - v5;
  if (v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  long long v8 = *(_OWORD *)(v1 + 8);
  if (*(unsigned __int16 *)(v4 + v7) < 5u)
  {
    int v10 = 0;
LABEL_6:
    BOOL v6 = __OFADD__(v10, v3);
    int v11 = v10 + v3;
    if (!v6)
    {
      int v12 = *(_DWORD *)(v4 + v11);
      BOOL v6 = __OFADD__(v11, v12);
      int v13 = v11 + v12;
      if (!v6)
      {
        *(void *)a1 = result;
        *(_OWORD *)(a1 + 8) = v8;
        *(_DWORD *)(a1 + 24) = v13;
        return swift_retain();
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  BOOL v6 = __OFADD__(v7, 4);
  int v9 = v7 + 4;
  if (!v6)
  {
    int v10 = *(__int16 *)(v4 + v9);
    goto LABEL_6;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t WK2_MonthlyWeatherStatistics.baselineStart.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 7u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 6);
    int v6 = v5 + 6;
    if (!v4)
    {
      int v7 = *(__int16 *)(v2 + v6);
      if (v7)
      {
        BOOL v4 = __OFADD__(v7, v1);
        int v8 = v7 + v1;
        if (!v4) {
          return *(unsigned int *)(v2 + v8);
        }
        goto LABEL_10;
      }
      return OUTLINED_FUNCTION_32();
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t WK2_MonthlyWeatherStatistics.hasMonths.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 9u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 8);
    int v6 = v5 + 8;
    if (!v4) {
      return *(unsigned __int16 *)(v2 + v6) != 0;
    }
  }
  __break(1u);
  return result;
}

uint64_t WK2_MonthlyWeatherStatistics.monthsCount.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned __int16 *)(v2 + v5) < 9u) {
    return OUTLINED_FUNCTION_32();
  }
  BOOL v4 = __OFADD__(v5, 8);
  int v6 = v5 + 8;
  if (v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v7 = *(__int16 *)(v2 + v6);
  if (!v7) {
    return OUTLINED_FUNCTION_32();
  }
  BOOL v4 = __OFADD__(v7, v1);
  int v8 = v7 + v1;
  if (!v4)
  {
    int v9 = *(_DWORD *)(v2 + v8);
    BOOL v4 = __OFADD__(v8, v9);
    int v10 = v8 + v9;
    if (!v4) {
      return *(unsigned int *)(v2 + v10);
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t WK2_MonthlyWeatherStatistics.months(at:)(int a1)
{
  uint64_t result = *(void *)v1;
  uint64_t v4 = *(int *)(v1 + 24);
  uint64_t v5 = *(void *)(*(void *)v1 + 24);
  int v6 = *(_DWORD *)(v5 + v4);
  BOOL v7 = __OFSUB__(v4, v6);
  int v8 = v4 - v6;
  if (v7)
  {
    __break(1u);
    goto LABEL_15;
  }
  __n128 v9 = 0uLL;
  if (*(unsigned __int16 *)(v5 + v8) < 9u)
  {
LABEL_12:
    uint64_t v17 = 0;
    return OUTLINED_FUNCTION_46(v17, v9);
  }
  BOOL v7 = __OFADD__(v8, 8);
  int v10 = v8 + 8;
  if (v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v11 = *(__int16 *)(v5 + v10);
  if (!v11) {
    goto LABEL_12;
  }
  BOOL v7 = __OFADD__(v11, v4);
  int v12 = v11 + v4;
  if (v7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v13 = *(_DWORD *)(v5 + v12);
  BOOL v7 = __OFADD__(v12, v13);
  int v14 = v12 + v13;
  if (v7)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  BOOL v7 = __OFADD__(v14, 4);
  int v15 = v14 + 4;
  if (v7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((a1 - 0x20000000) >> 30 != 3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v7 = __OFADD__(v15, 4 * a1);
  int v16 = v15 + 4 * a1;
  if (v7)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (!__OFADD__(v16, *(_DWORD *)(v5 + v16)))
  {
    __n128 v18 = *(__n128 *)(v1 + 8);
    uint64_t v17 = swift_retain();
    __n128 v9 = v18;
    return OUTLINED_FUNCTION_46(v17, v9);
  }
LABEL_21:
  __break(1u);
  return result;
}

void static WK2_MonthlyWeatherStatistics.add(metadata:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_27;
  }
  __break(1u);
}

void static WK2_MonthlyWeatherStatistics.add(baselineStart:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  int v3 = v2;
  if (!v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_19:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v1[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v5 = v1[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (HIDWORD(v5))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  Swift::Int v6 = -*((unsigned char *)v1 + 16) & 3;
  unint64_t v7 = v6 + v5;
  uint64_t v8 = v1[1];
  if (*(void *)(v8 + 32) < (int64_t)(v6 + v5)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v6, v5, v1[3]);
  }
  v1[2] = v7;
  unint64_t v9 = v7 + 4;
  int64_t v10 = *(void *)(v8 + 32);
  if (v10 < (uint64_t)(v7 + 4))
  {
    OUTLINED_FUNCTION_18();
    int64_t v10 = *(void *)(v8 + 32);
  }
  *(_DWORD *)(v10 - v7 + *(void *)(v8 + 24) - 4) = v3;
  v1[2] = v9;
  if (v7 > 0xFFFFFFFB) {
LABEL_22:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = *(void *)(v11 + 32);
    if (v13)
    {
      uint64_t v14 = v13 + *(void *)(v11 + 80);
      *(_DWORD *)uint64_t v14 = v9;
      *(_WORD *)(v14 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v11, *(int64x2_t *)(v11 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v18)) {
      __int16 v16 = v17;
    }
    *(_WORD *)(v15 + 64) = v16;
    goto LABEL_19;
  }
  __break(1u);
}

void static WK2_MonthlyWeatherStatistics.addVectorOf(months:_:)()
{
  sub_2617307F8();
}

uint64_t static WK2_MonthlyWeatherStatistics.endMonthlyWeatherStatistics(_:start:)@<X0>(Swift::UInt32 at@<W1>, _DWORD *a2@<X8>)
{
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *a2 = result;
  return result;
}

void static WK2_MonthlyWeatherStatistics.createMonthlyWeatherStatistics(_:metadataOffset:baselineStart:monthsVectorOffset:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  Swift::UInt32 v2 = static WK2_MonthlyWeatherStatistics.startMonthlyWeatherStatistics(_:)();
  static WK2_MonthlyWeatherStatistics.add(metadata:_:)();
  static WK2_MonthlyWeatherStatistics.add(baselineStart:_:)();
  static WK2_MonthlyWeatherStatistics.addVectorOf(months:_:)();
  *uint64_t v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_20();
}

void static WK2_MonthlyWeatherStatistics.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v21);
  if (!v2)
  {
    sub_2617159B0();
    if (v21[2] >= 7)
    {
      uint64_t v11 = v21[1] + 6;
      int v12 = v22;
      if (v22 == 1 && ((*(_DWORD *)(v23 + 24) + v11) & 1) != 0)
      {
        __int16 v16 = &qword_26A92AB70;
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_8(v3, v4, v5, v6, v7, v8, v9, v10, v20, v21[0]);
      uint64_t v13 = *(void *)(v23 + 24);
      uint64_t v14 = *(unsigned __int16 *)(v13 + v11);
      if (*(_WORD *)(v13 + v11))
      {
        if ((((_BYTE)v13 + LOBYTE(v21[0]) + (_BYTE)v14) & 3) != 0) {
          int v15 = v12;
        }
        else {
          int v15 = 0;
        }
        if (v15 == 1)
        {
          __int16 v16 = &qword_26A92AB80;
LABEL_12:
          __swift_instantiateConcreteTypeFromMangledName(v16);
          sub_26173BC20();
          sub_2617295E0();
          uint64_t v17 = swift_allocError();
          OUTLINED_FUNCTION_19(v17, v18);
LABEL_15:
          swift_release();
          return;
        }
        Verifier.rangeInBuffer(position:size:)(v21[0] + v14, 4);
        if (v19) {
          goto LABEL_15;
        }
      }
    }
    sub_26171608C();
    goto LABEL_15;
  }
}

void sub_261733778(int a1, unint64_t a2)
{
}

uint64_t WK2_MonthWeatherStatistics.month.getter()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(*(void *)v0 + 24);
  int v3 = *(_DWORD *)(v2 + v1);
  BOOL v4 = __OFSUB__(v1, v3);
  int v5 = v1 - v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v2 + v5) < 5u) {
      return OUTLINED_FUNCTION_32();
    }
    BOOL v4 = __OFADD__(v5, 4);
    int v6 = v5 + 4;
    if (!v4)
    {
      int v7 = *(__int16 *)(v2 + v6);
      if (v7)
      {
        BOOL v4 = __OFADD__(v7, v1);
        int v8 = v7 + v1;
        if (!v4) {
          return *(unsigned __int8 *)(v2 + v8);
        }
        goto LABEL_10;
      }
      return OUTLINED_FUNCTION_32();
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t WK2_MonthWeatherStatistics.temperature.getter()
{
  uint64_t result = OUTLINED_FUNCTION_32_0();
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  __n128 v6 = 0uLL;
  if (*(unsigned __int16 *)(v2 + v4) < 7u)
  {
LABEL_8:
    uint64_t v10 = 0;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
  BOOL v5 = __OFADD__(v4, 6);
  int v7 = v4 + 6;
  if (v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v8 = *(__int16 *)(v2 + v7);
  if (!v8) {
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v8, v3);
  int v9 = v8 + v3;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!__OFADD__(v9, *(_DWORD *)(v2 + v9)))
  {
    __n128 v11 = *(__n128 *)(v0 + 8);
    uint64_t v10 = swift_retain();
    __n128 v6 = v11;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t WK2_MonthWeatherStatistics.precipitation.getter()
{
  uint64_t result = OUTLINED_FUNCTION_32_0();
  if (v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  __n128 v6 = 0uLL;
  if (*(unsigned __int16 *)(v2 + v4) < 9u)
  {
LABEL_8:
    uint64_t v10 = 0;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
  BOOL v5 = __OFADD__(v4, 8);
  int v7 = v4 + 8;
  if (v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v8 = *(__int16 *)(v2 + v7);
  if (!v8) {
    goto LABEL_8;
  }
  BOOL v5 = __OFADD__(v8, v3);
  int v9 = v8 + v3;
  if (v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!__OFADD__(v9, *(_DWORD *)(v2 + v9)))
  {
    __n128 v11 = *(__n128 *)(v0 + 8);
    uint64_t v10 = swift_retain();
    __n128 v6 = v11;
    return OUTLINED_FUNCTION_46(v10, v6);
  }
LABEL_13:
  __break(1u);
  return result;
}

void static WK2_MonthWeatherStatistics.add(month:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  char v3 = v2;
  if (!v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_19:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v1[8] <= 0)
  {
    v1[8] = 1;
    v1[3] = 1;
  }
  Swift::Int v5 = v1[2];
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (HIDWORD(v5))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = v1[1];
  if (*(void *)(v6 + 32) < v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(0, v1[2], v1[3]);
  }
  v1[2] = v5;
  Swift::Int v7 = v5 + 1;
  Swift::Int v8 = *(void *)(v6 + 32);
  if (v8 <= v5)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v5, v1[3]);
    Swift::Int v8 = *(void *)(v6 + 32);
  }
  *(unsigned char *)(*(void *)(v6 + 24) + v8 + ~v5) = v3;
  v1[2] = v7;
  if ((unint64_t)v5 > 0xFFFFFFFE) {
LABEL_22:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = *(void *)(v9 + 32);
    if (v11)
    {
      uint64_t v12 = v11 + *(void *)(v9 + 80);
      *(_DWORD *)uint64_t v12 = v7;
      *(_WORD *)(v12 + 4) = 4;
    }
    OUTLINED_FUNCTION_91(v9, *(int64x2_t *)(v9 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v4 & v16)) {
      __int16 v14 = v15;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_19;
  }
  __break(1u);
}

void static WK2_MonthWeatherStatistics.add(temperature:_:)()
{
  OUTLINED_FUNCTION_22();
  int v4 = *v3;
  if (!*v3) {
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_49();
  if (v6 != v7) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v8 = *(void *)(v0 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (HIDWORD(v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  Swift::Int v9 = OUTLINED_FUNCTION_0(v5, v8);
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v10, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v2;
  if (HIDWORD(v2)) {
    goto LABEL_30;
  }
  if (v2 - v4 == -4)
  {
    OUTLINED_FUNCTION_17();
    if (!v11)
    {
LABEL_27:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v12 = OUTLINED_FUNCTION_2();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v2, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_7();
  if (v6 != v7)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v13 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v13);
  if (!v11 & v14) {
LABEL_31:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v16 & 1) == 0)
  {
    if (*(void *)(v15 + 32))
    {
      OUTLINED_FUNCTION_48(v15);
      *(_WORD *)(v17 + 4) = 6;
    }
    OUTLINED_FUNCTION_102(v15, *(int64x2_t *)(v15 + 72), (int64x2_t)xmmword_26173C130);
    if (!(!v11 & v14)) {
      __int16 v19 = v20;
    }
    *(_WORD *)(v18 + 64) = v19;
    goto LABEL_27;
  }
  __break(1u);
}

void static WK2_MonthWeatherStatistics.add(precipitation:_:)()
{
  sub_2617307F8();
}

void static WK2_MonthWeatherStatistics.createMonthWeatherStatistics(_:month:temperatureOffset:precipitationOffset:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  Swift::UInt32 v2 = static WK2_MonthlyWeatherStatistics.startMonthlyWeatherStatistics(_:)();
  static WK2_MonthWeatherStatistics.add(month:_:)();
  static WK2_MonthWeatherStatistics.add(temperature:_:)();
  static WK2_MonthlyWeatherStatistics.addVectorOf(months:_:)();
  *uint64_t v1 = FlatBufferBuilder.endTable(at:)(v2);
  OUTLINED_FUNCTION_20();
}

void static WK2_MonthWeatherStatistics.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)v17);
  uint64_t v11 = v2;
  if (!v2)
  {
    if (v17[2] >= 5)
    {
      uint64_t v12 = v17[1] + 4;
      if (v18 == 1 && ((*(_DWORD *)(v19 + 24) + v12) & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AB70);
        sub_26173BC20();
        sub_2617295E0();
        uint64_t v14 = swift_allocError();
        OUTLINED_FUNCTION_19(v14, v15);
LABEL_10:
        swift_release();
        return;
      }
      OUTLINED_FUNCTION_8(v3, v4, v5, v6, v7, v8, v9, v10, v16, v17[0]);
      uint64_t v11 = 0;
      if (*(_WORD *)(*(void *)(v19 + 24) + v12))
      {
        Verifier.rangeInBuffer(position:size:)(v17[0] + *(unsigned __int16 *)(*(void *)(v19 + 24) + v12), 1);
        uint64_t v11 = v13;
        if (v13) {
          goto LABEL_10;
        }
      }
    }
    sub_261715DA8();
    if (!v11) {
      sub_261715DD4();
    }
    goto LABEL_10;
  }
}

void sub_261733DDC(int a1, unint64_t a2)
{
}

ValueMetadata *type metadata accessor for WK2_MonthlyWeatherStatistics()
{
  return &type metadata for WK2_MonthlyWeatherStatistics;
}

ValueMetadata *type metadata accessor for WK2_MonthWeatherStatistics()
{
  return &type metadata for WK2_MonthWeatherStatistics;
}

uint64_t Offset.init(offset:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void Offset.init()(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t Offset.o.getter()
{
  return *v0;
}

uint64_t Offset.o.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Offset.o.modify())()
{
  return nullsub_1;
}

BOOL Offset.isEmpty.getter()
{
  return *v0 == 0;
}

uint64_t NativeObject.serialize<A>(type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for FlatBufferBuilder.VTableStorage();
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 8;
  *(void *)(v9 + 56) = 0;
  *(_WORD *)(v9 + 64) = 0;
  *(void *)(v9 + 72) = 0;
  *(void *)(v9 + 80) = 0;
  uint64_t v10 = swift_slowAlloc();
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v10;
  *(unsigned char *)(v9 + 48) = 0;
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v12 = sub_26173BB80();
  type metadata accessor for ByteBuffer.Storage();
  swift_allocObject();
  uint64_t v13 = ByteBuffer.Storage.init(count:alignment:)(1024);
  swift_retain();
  ByteBuffer.Storage.initialize(for:)(1024);
  swift_release();
  v18[0] = v9;
  v18[1] = v13;
  long long v19 = xmmword_26173E9E0;
  uint64_t v20 = v11;
  char v21 = 0;
  uint64_t v22 = v12;
  __int16 v23 = 0;
  uint64_t v24 = 0;
  NativeObject.serialize<A>(builder:type:)((uint64_t)v18, a1, a2, a3, v14, a5);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v16;
}

void NativeObject.serialize<A>(builder:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v6);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, char *, uint64_t, uint64_t))(a6 + 24))(&v17, a1, v13, a4, a6);
  FlatBufferBuilder.finish(offset:addPrefix:)((uint64_t)&v17, 0);
  size_t v14 = *(void *)(a1 + 16);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v14))
  {
    uint64_t v15 = (void *)(*(void *)(*(void *)(a1 + 8) + 24) + *(void *)(*(void *)(a1 + 8) + 32) - v14);
    type metadata accessor for ByteBuffer.Storage();
    swift_allocObject();
    ByteBuffer.Storage.init(count:alignment:)(v14);
    ByteBuffer.Storage.copy(from:count:)(v15, v14);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a3);
    return;
  }
  __break(1u);
}

Swift::UInt32 __swiftcall FlatBufferBuilder.startTable(with:)(Swift::Int with)
{
  *((unsigned char *)v1 + 40) = 1;
  uint64_t v2 = *v1;
  if (*(void *)(*v1 + 56) < *(void *)(*v1 + 80) + 8 * with)
  {
    if (*(unsigned char *)(v2 + 48)) {
      goto LABEL_11;
    }
    Swift::Int v3 = 8 * with;
    uint64_t v4 = *(void *)(v2 + 32);
    if (v4) {
      MEMORY[0x263E3EDF0](v4, -1, -1);
    }
    uint64_t v5 = swift_slowAlloc();
    *(void *)(v2 + 32) = v5;
    *(void *)(v2 + 40) = v5 + v3;
    *(unsigned char *)(v2 + 48) = 0;
    *(void *)(v2 + 56) = v3;
  }
  with = v1[2];
  if (with < 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(with))
  {
    return with;
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return with;
}

void FlatBufferBuilder.add(offset:at:)(int *a1, __int16 a2)
{
  int v3 = *a1;
  if (!*a1) {
    return;
  }
  OUTLINED_FUNCTION_32_1();
  if (v6 ^ v7 | v5) {
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v8 = *(void *)(v2 + 16);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (HIDWORD(v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v9 = (-*(_DWORD *)(v2 + 16) & 3) + v8;
  OUTLINED_FUNCTION_12();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v2 + 24));
  }
  *(void *)(v2 + 16) = v9;
  if (HIDWORD(v9)) {
    goto LABEL_27;
  }
  int v12 = v9 - v3 + 4;
  if (v9 - v3 == -4 && *(unsigned char *)(v2 + 57) != 1) {
    return;
  }
  unint64_t v13 = (-(int)v9 & 3) + v9;
  OUTLINED_FUNCTION_63();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v14, v9, *(void *)(v2 + 24));
  }
  *(void *)(v2 + 16) = v13;
  unint64_t v15 = v13 + 4;
  OUTLINED_FUNCTION_12();
  if (v6 != v7) {
    OUTLINED_FUNCTION_29_0();
  }
  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)(v16 - 4) = v12;
  *(void *)(v2 + 16) = v15;
  if (v13 > 0xFFFFFFFB) {
LABEL_28:
  }
    __break(1u);
  uint64_t v17 = *(void *)v2;
  if (*(unsigned char *)(*(void *)v2 + 48))
  {
    __break(1u);
  }
  else
  {
    uint64_t v18 = *(void *)(v17 + 32);
    if (v18)
    {
      uint64_t v19 = v18 + *(void *)(v17 + 80);
      *(_DWORD *)uint64_t v19 = v15;
      *(_WORD *)(v19 + 4) = a2;
    }
    OUTLINED_FUNCTION_25_0(v17, *(int64x2_t *)(v17 + 72), (int64x2_t)xmmword_26173C130);
  }
}

void FlatBufferBuilder.add<A>(element:def:at:)()
{
  OUTLINED_FUNCTION_1_3();
  __int16 v2 = v1;
  OUTLINED_FUNCTION_0_0();
  Swift::Int v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_52_0();
  if ((sub_26173BBC0() & 1) != 0 && *(unsigned char *)(v0 + 57) != 1)
  {
LABEL_23:
    OUTLINED_FUNCTION_2_3();
    return;
  }
  if (*(void *)(v0 + 64) < v4)
  {
    *(void *)(v0 + 64) = v4;
    *(void *)(v0 + 24) = v4;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v8 ^ v9 | v7))
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((v6 | v4) < 0) {
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_63_0();
  if (!(v8 ^ v9 | v7)) {
    goto LABEL_25;
  }
  if (!v4)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  Swift::Int v11 = v10 + ((v4 - 1) & (-(int)v10 - v4));
  OUTLINED_FUNCTION_15_0();
  if (v8 != v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v12, v13, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v11;
  OUTLINED_FUNCTION_30_0();
  if (v8 != v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v4, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_21_0();
  v14();
  OUTLINED_FUNCTION_49_0();
  uint64_t v15 = OUTLINED_FUNCTION_38();
  v16(v15);
  unint64_t v17 = *(void *)(v0 + 16);
  if ((v17 & 0x8000000000000000) != 0) {
    goto LABEL_27;
  }
  if (HIDWORD(v17)) {
    goto LABEL_28;
  }
  uint64_t v18 = *(void *)v0;
  if ((*(unsigned char *)(*(void *)v0 + 48) & 1) == 0)
  {
    uint64_t v19 = *(void *)(v18 + 32);
    if (v19)
    {
      uint64_t v20 = v19 + *(void *)(v18 + 80);
      *(_DWORD *)uint64_t v20 = v17;
      *(_WORD *)(v20 + 4) = v2;
    }
    OUTLINED_FUNCTION_25_0(v18, *(int64x2_t *)(v18 + 72), (int64x2_t)xmmword_26173C130);
    goto LABEL_23;
  }
  __break(1u);
}

void FlatBufferBuilder.add<A>(element:at:)()
{
  OUTLINED_FUNCTION_1_3();
  __int16 v1 = v0;
  uint64_t v3 = v2;
  int v39 = v4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_26173BD90();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v38[-v9];
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  unint64_t v17 = &v38[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = &v38[-v18];
  OUTLINED_FUNCTION_21_0();
  v20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v3) == 1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v5);
LABEL_24:
    OUTLINED_FUNCTION_2_3();
    return;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 32))(v19, v10, v3);
  if (v1[8] < v14)
  {
    v1[8] = v14;
    v1[3] = v14;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v23 ^ v24 | v22))
  {
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((v21 | v14) < 0) {
    goto LABEL_25;
  }
  if (v14 > 0xFFFFFFFFLL)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (!v14)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  Swift::Int v25 = v21 + ((v14 - 1) & (-(int)v21 - v14));
  uint64_t v26 = v1[1];
  OUTLINED_FUNCTION_15_0();
  if (v23 != v24) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v27, v28, v1[3]);
  }
  v1[2] = v25;
  Swift::Int v29 = v25 + v14;
  OUTLINED_FUNCTION_16();
  if (v23 != v24) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v14, v25, v1[3]);
  }
  OUTLINED_FUNCTION_21_0();
  v30();
  memcpy((void *)(*(void *)(v26 + 24) + *(void *)(v26 + 32) - v29), v17, v14);
  v1[2] = v29;
  uint64_t v31 = *(void (**)(unsigned char *, uint64_t))(v12 + 8);
  v31(v17, v3);
  unint64_t v32 = v1[2];
  if ((v32 & 0x8000000000000000) != 0) {
    goto LABEL_28;
  }
  if (HIDWORD(v32)) {
    goto LABEL_29;
  }
  uint64_t v33 = *v1;
  if ((*(unsigned char *)(*v1 + 48) & 1) == 0)
  {
    uint64_t v34 = *(void *)(v33 + 32);
    unsigned __int16 v35 = v39;
    if (v34)
    {
      uint64_t v36 = v34 + *(void *)(v33 + 80);
      *(_DWORD *)uint64_t v36 = v32;
      *(_WORD *)(v36 + 4) = v35;
    }
    *(int64x2_t *)(v33 + 72) = vaddq_s64(*(int64x2_t *)(v33 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v37 = *(unsigned __int16 *)(v33 + 64);
    if (v37 <= v35) {
      LOWORD(v37) = v35;
    }
    *(_WORD *)(v33 + 64) = v37;
    v31(v19, v3);
    goto LABEL_24;
  }
  __break(1u);
}

void FlatBufferBuilder.sizedBuffer.getter()
{
  size_t v1 = *(void *)(v0 + 16);
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v1))
  {
    uint64_t v2 = (void *)(*(void *)(*(void *)(v0 + 8) + 24) + *(void *)(*(void *)(v0 + 8) + 32) - v1);
    type metadata accessor for ByteBuffer.Storage();
    swift_allocObject();
    ByteBuffer.Storage.init(count:alignment:)(v1);
    ByteBuffer.Storage.copy(from:count:)(v2, v1);
    return;
  }
  __break(1u);
}

Swift::Void __swiftcall FlatBufferBuilder.clear()()
{
  size_t v1 = v0;
  v0[8] = 0;
  v0[3] = 0;
  *((unsigned char *)v0 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AE70);
  sub_26173BB90();
  uint64_t v2 = v0 + 4;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v4 = *v2;
  if (isUniquelyReferenced_nonNull_native)
  {
    sub_261738298(0, *(void *)(v4 + 16));
  }
  else
  {
    *uint64_t v2 = (uint64_t)sub_261738224(0, *(void *)(v4 + 24) >> 1);
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = *v1;
  *(_WORD *)(v5 + 64) = 0;
  *(void *)(v5 + 72) = 0;
  *(void *)(v5 + 80) = 0;
  *((_OWORD *)v1 + 1) = xmmword_26173E9E0;
  ByteBuffer.Storage.initialize(for:)(*(void *)(v1[1] + 32));
}

double FlatBufferBuilder.init(initialSize:serializeDefaults:)@<D0>(int a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  type metadata accessor for FlatBufferBuilder.VTableStorage();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = OUTLINED_FUNCTION_20_1(v6);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v7;
  *(unsigned char *)(v6 + 48) = 0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v9 = sub_26173BB80();
  uint64_t v10 = sub_26170932C(a1);
  type metadata accessor for ByteBuffer.Storage();
  swift_allocObject();
  uint64_t v11 = ByteBuffer.Storage.init(count:alignment:)(v10);
  swift_retain();
  ByteBuffer.Storage.initialize(for:)(v10);
  swift_release();
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v11;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = xmmword_26173E9E0;
  *(void *)(a3 + 32) = v8;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = v9;
  *(unsigned char *)(a3 + 56) = 0;
  *(unsigned char *)(a3 + 57) = a2;
  *(void *)(a3 + 64) = 0;
  return result;
}

uint64_t FlatBufferBuilder.VTableStorage.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_20_1(v0);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v1;
  *(unsigned char *)(v0 + 48) = 0;
  return v0;
}

uint64_t FlatBufferBuilder._vtableStorage.getter()
{
  return swift_retain();
}

uint64_t FlatBufferBuilder._vtableStorage.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*FlatBufferBuilder._vtableStorage.modify())()
{
  return nullsub_1;
}

uint64_t FlatBufferBuilder._bb.getter()
{
  return swift_retain();
}

uint64_t FlatBufferBuilder._bb.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_release();
  v3[1] = a1;
  v3[2] = a2;
  v3[3] = a3;
  return result;
}

uint64_t (*FlatBufferBuilder._bb.modify())()
{
  return nullsub_1;
}

uint64_t FlatBufferBuilder._minAlignment.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t FlatBufferBuilder._minAlignment.setter(uint64_t result)
{
  *(void *)(v1 + 64) = result;
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*FlatBufferBuilder._minAlignment.modify(void *a1))(uint64_t result, char a2)
{
  *a1 = v1;
  return sub_261734BEC;
}

uint64_t sub_261734BEC(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    *(void *)(*(void *)result + 24) = *(void *)(*(void *)result + 64);
  }
  return result;
}

unint64_t FlatBufferBuilder.size.getter()
{
  unint64_t result = *(void *)(v0 + 16);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (HIDWORD(result)) {
LABEL_5:
  }
    __break(1u);
  return result;
}

void FlatBufferBuilder.data.getter()
{
}

void *FlatBufferBuilder.fullSizedByteArray.getter()
{
  return sub_261702AB8(*(const void **)(*(void *)(v0 + 8) + 24), *(void *)(*(void *)(v0 + 8) + 32));
}

void *FlatBufferBuilder.sizedByteArray.getter()
{
  return sub_261702AB8((const void *)(*(void *)(*(void *)(v0 + 8) + 24)+ *(void *)(*(void *)(v0 + 8) + 32)- *(void *)(v0 + 16)), *(void *)(v0 + 16));
}

uint64_t FlatBufferBuilder.buffer.getter()
{
  return swift_retain();
}

void FlatBufferBuilder.finish(offset:fileId:addPrefix:)(uint64_t a1, unint64_t a2)
{
  v37[3] = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9_1();
  if (!(v9 ^ v10 | v8))
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v11 = v2;
  char v12 = v7;
  uint64_t v13 = v2[8];
  if (v7) {
    int v14 = -12;
  }
  else {
    int v14 = -8;
  }
  if ((v5 | v13) < 0) {
    goto LABEL_54;
  }
  if (v13 > 0xFFFFFFFFLL)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  BOOL v15 = v13 != 0;
  unsigned int v16 = v13 - 1;
  if (!v15) {
LABEL_56:
  }
    __break(1u);
  unint64_t v17 = v6;
  int v18 = *v4;
  Swift::Int v19 = v5 + ((v14 - v5) & v16);
  OUTLINED_FUNCTION_36_0();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v20, v21, v2[3]);
  }
  v2[2] = v19;
  OUTLINED_FUNCTION_37_0();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v19, v2[3]);
  }
  swift_bridgeObjectRetain();
  int v22 = sub_261714FB0(a2, v17, v2 + 1, 4uLL);
  swift_bridgeObjectRelease();
  if (v22 != 2) {
    goto LABEL_51;
  }
  unint64_t v23 = (v17 & 0x2000000000000000) != 0 ? HIBYTE(v17) & 0xF : a2 & 0xFFFFFFFFFFFFLL;
  if (!v23) {
    goto LABEL_51;
  }
  int v36 = v18;
  uint64_t v24 = (a2 >> 59) & 1;
  if ((v17 & 0x1000000000000000) == 0) {
    LODWORD(v24) = 1;
  }
  uint64_t v25 = 11;
  if (v24) {
    uint64_t v25 = 7;
  }
  unint64_t v26 = v25 | (v23 << 16);
  uint64_t v27 = 4 << v24;
  swift_bridgeObjectRetain();
  while (1)
  {
    if ((v26 & 0xC) != v27)
    {
      if ((v17 & 0x1000000000000000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_31;
    }
    unint64_t v28 = sub_26172DB28(v26, a2, v17);
    if (v28 < 0x4000) {
      break;
    }
    unint64_t v26 = v28;
    if ((v17 & 0x1000000000000000) == 0)
    {
LABEL_28:
      OUTLINED_FUNCTION_46_0();
      goto LABEL_33;
    }
LABEL_31:
    if (v23 < v26 >> 16)
    {
      __break(1u);
      goto LABEL_53;
    }
    unint64_t v26 = sub_26173BC60();
LABEL_33:
    unint64_t v29 = v26;
    if ((v26 & 0xC) == v27) {
      unint64_t v29 = sub_26172DB28(v26, a2, v17);
    }
    unint64_t v30 = v29 >> 16;
    if (v29 >> 16 >= v23) {
      goto LABEL_49;
    }
    if ((v17 & 0x1000000000000000) != 0)
    {
      char v32 = sub_26173BC80();
    }
    else if ((v17 & 0x2000000000000000) != 0)
    {
      v37[0] = a2;
      v37[1] = v17 & 0xFFFFFFFFFFFFFFLL;
      char v32 = *((unsigned char *)v37 + v30);
    }
    else
    {
      uint64_t v31 = (v17 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a2 & 0x1000000000000000) == 0) {
        uint64_t v31 = sub_26173BDE0();
      }
      char v32 = *(unsigned char *)(v31 + v30);
    }
    uint64_t v33 = v11[1];
    Swift::Int v34 = v11[2];
    OUTLINED_FUNCTION_12();
    if (v9 != v10)
    {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v34, v11[3]);
      uint64_t v35 = *(void *)(v33 + 32);
    }
    *(unsigned char *)(*(void *)(v33 + 24) + v35 + ~v34) = v32;
    v11[2] = v34 + 1;
    if (!(v26 >> 14)) {
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  swift_bridgeObjectRelease();
  int v18 = v36;
LABEL_51:
  LODWORD(v37[0]) = v18;
  FlatBufferBuilder.finish(offset:addPrefix:)((uint64_t)v37, v12 & 1);
}

Swift::Void __swiftcall FlatBufferBuilder.preAlign(len:alignment:)(Swift::Int len, Swift::Int alignment)
{
  if (v2[8] < alignment) {
    OUTLINED_FUNCTION_14(alignment);
  }
  OUTLINED_FUNCTION_39_0();
  if (!(v7 ^ v8 | v6))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v3 > 0xFFFFFFFFLL) {
    goto LABEL_15;
  }
  if ((v5 | v3 | v4) < 0)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_33_0();
  if (!(v7 ^ v8 | v6)) {
    goto LABEL_17;
  }
  BOOL v12 = v11 != 0;
  int v13 = v11 - 1;
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v14 = v10 + (v13 & -(v9 + v10));
  OUTLINED_FUNCTION_16();
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v15, v16, v2[3]);
  }
  v2[2] = v14;
}

Swift::UInt32 __swiftcall FlatBufferBuilder.refer(to:)(Swift::UInt32 to)
{
  OUTLINED_FUNCTION_32_1();
  if (v5 ^ v6 | v4) {
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v7 = *(void *)(v1 + 16);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (HIDWORD(v7))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return v3;
  }
  unint64_t v8 = (-*(_DWORD *)(v1 + 16) & 3) + v7;
  OUTLINED_FUNCTION_12();
  if (v5 != v6) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v3, v9, *(void *)(v1 + 24));
  }
  *(void *)(v1 + 16) = v8;
  if (HIDWORD(v8)) {
    goto LABEL_13;
  }
  LODWORD(v3) = v8 - to + 4;
  return v3;
}

void FlatBufferBuilder.push<A>(element:)()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v1;
  v20[1] = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  Swift::Int v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v7);
  if (v0[8] < v6)
  {
    v0[8] = v6;
    v0[3] = v6;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v10 ^ v11 | v9))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((v8 | v6) < 0) {
    goto LABEL_17;
  }
  if (v6 > 0xFFFFFFFFLL)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!v6)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  Swift::Int v12 = v8 + ((v6 - 1) & (-(int)v8 - v6));
  OUTLINED_FUNCTION_36_0();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v13, v14, v0[3]);
  }
  v0[2] = v12;
  OUTLINED_FUNCTION_47_0();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v6, v12, v0[3]);
  }
  OUTLINED_FUNCTION_21_0();
  v15();
  OUTLINED_FUNCTION_58_0();
  memcpy(v16, v17, v18);
  v0[2] = v12 + v6;
  (*(void (**)(char *, uint64_t))(v4 + 8))((char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v19 = v0[2];
  if ((v19 & 0x8000000000000000) != 0) {
    goto LABEL_20;
  }
  if (HIDWORD(v19)) {
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_2_3();
}

Swift::Void __swiftcall FlatBufferBuilder.minAlignment(size:)(Swift::Int size)
{
  if (*(void *)(v1 + 64) < size)
  {
    *(void *)(v1 + 64) = size;
    *(void *)(v1 + 24) = size;
  }
}

Swift::UInt32 __swiftcall FlatBufferBuilder.padding(bufSize:elementSize:)(Swift::UInt32 bufSize, Swift::UInt32 elementSize)
{
  if (elementSize) {
    return (elementSize - 1) & -bufSize;
  }
  __break(1u);
  return bufSize;
}

void FlatBufferBuilder.preAlign<A>(len:type:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 - 8) + 64);
  if (v3[8] < v4) {
    OUTLINED_FUNCTION_14(v4);
  }
  OUTLINED_FUNCTION_39_0();
  if (!(v9 ^ v10 | v8))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 > 0xFFFFFFFFLL) {
    goto LABEL_15;
  }
  if ((v7 | v5 | v6) < 0)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_33_0();
  if (!(v9 ^ v10 | v8)) {
    goto LABEL_17;
  }
  BOOL v14 = v13 != 0;
  int v15 = v13 - 1;
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v16 = v12 + (v15 & -(v11 + v12));
  OUTLINED_FUNCTION_16();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v17, v18, v3[3]);
  }
  v3[2] = v16;
}

Swift::Void __swiftcall FlatBufferBuilder.track(offset:at:)(Swift::UInt32 offset, Swift::UInt16 at)
{
  uint64_t v3 = *v2;
  if (*(unsigned char *)(*v2 + 48))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 32);
    if (v4)
    {
      uint64_t v5 = v4 + *(void *)(v3 + 80);
      *(_DWORD *)uint64_t v5 = offset;
      *(_WORD *)(v5 + 4) = at;
    }
    *(int64x2_t *)(v3 + 72) = vaddq_s64(*(int64x2_t *)(v3 + 72), (int64x2_t)xmmword_26173C130);
    unsigned int v6 = *(unsigned __int16 *)(v3 + 64);
    if (v6 <= at) {
      LOWORD(v6) = at;
    }
    *(_WORD *)(v3 + 64) = v6;
  }
}

Swift::Void __swiftcall FlatBufferBuilder.startVector(_:elementSize:)(Swift::Int _, Swift::Int elementSize)
{
  *(unsigned char *)(v2 + 40) = 1;
  Swift::Int v4 = *(void *)(v2 + 64);
  if (v4 <= 3)
  {
    Swift::Int v4 = 4;
    *(void *)(v2 + 64) = 4;
    *(void *)(v2 + 24) = 4;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v8 ^ v9 | v7))
  {
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int v10 = elementSize * v5;
  if ((v6 | (elementSize * v5)) < 0) {
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_63_0();
  if (!(v8 ^ v9 | v7)) {
    goto LABEL_22;
  }
  uint64_t v12 = ((-(int)v11 - v10) & 3) + v11;
  OUTLINED_FUNCTION_12();
  if (v8 != v9) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v13, v14, *(void *)(v2 + 24));
  }
  *(void *)(v2 + 16) = v12;
  if (v4 < elementSize)
  {
    *(void *)(v2 + 64) = elementSize;
    *(void *)(v2 + 24) = elementSize;
  }
  if (v12 > 0xFFFFFFFFLL) {
    goto LABEL_23;
  }
  if ((v12 | elementSize) < 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (elementSize > 0xFFFFFFFFLL)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!elementSize)
  {
LABEL_26:
    __break(1u);
    return;
  }
  uint64_t v15 = v12 + ((elementSize - 1) & -(v10 + v12));
  OUTLINED_FUNCTION_16();
  if (v8 != v9) {
    OUTLINED_FUNCTION_57_0(v16);
  }
  *(void *)(v2 + 16) = v15;
}

void FlatBufferBuilder.endVector(len:)(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  *(unsigned char *)(v2 + 40) = 0;
  if (a1 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_17;
  }
  int v4 = a1;
  if (a1 > 0x7FFFFFFF)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_32_1();
  if (v6 ^ v7 | v5) {
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v8 = *(void *)(v2 + 16);
  if ((v8 & 0x8000000000000000) != 0) {
    goto LABEL_18;
  }
  if (HIDWORD(v8))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v9 = (-*(_DWORD *)(v2 + 16) & 3) + v8;
  OUTLINED_FUNCTION_63();
  if (v6 != v7) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v10, v11, *(void *)(v2 + 24));
  }
  *(void *)(v2 + 16) = v9;
  unint64_t v12 = v9 + 4;
  OUTLINED_FUNCTION_19_1();
  if (v6 != v7) {
    OUTLINED_FUNCTION_29_0();
  }
  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)(v13 - 4) = v4;
  *(void *)(v2 + 16) = v12;
  if (v9 > 0xFFFFFFFB) {
LABEL_20:
  }
    __break(1u);
  *a2 = v12;
}

void FlatBufferBuilder.createVector<A>(_:)()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  char v5 = v4;
  int64_t v6 = MEMORY[0x263E3E9F0]();
  uint64_t v7 = *(void *)(*(void *)(v3 - 8) + 64);
  *(unsigned char *)(v0 + 40) = 1;
  uint64_t v8 = *(void *)(v0 + 64);
  if (v8 <= 3)
  {
    uint64_t v8 = 4;
    *(void *)(v0 + 64) = 4;
    *(void *)(v0 + 24) = 4;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v11 ^ v12 | v10))
  {
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  Swift::Int v13 = v7 * v6;
  if ((v9 | (v7 * v6)) < 0) {
    goto LABEL_38;
  }
  if (v13 > 0xFFFFFFFFLL)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v29 = v5;
  Swift::Int v14 = (uint64_t *)(v0 + 8);
  Swift::Int v15 = ((-(int)v9 - (int)v13) & 3) + v9;
  OUTLINED_FUNCTION_47_0();
  if (v11 != v12) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v16, v17, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v15;
  if (v8 < v7)
  {
    *(void *)(v0 + 64) = v7;
    *(void *)(v0 + 24) = v7;
  }
  if (v15 > 0xFFFFFFFFLL) {
    goto LABEL_40;
  }
  if ((v15 | v7) < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v7 > 0xFFFFFFFFLL)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!v7)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  Swift::Int v18 = v15 + ((v7 - 1) & -(v13 + v15));
  OUTLINED_FUNCTION_30_0();
  if (v11 != v12) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v19, v15, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v18;
  OUTLINED_FUNCTION_37_0();
  if (v11 != v12) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v13, v18, *(void *)(v0 + 24));
  }
  sub_26173BD30();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v20 = OUTLINED_FUNCTION_53_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_51_0();
  *(void *)(v21 - 16) = v14;
  sub_26173BE60();
  swift_getWitnessTable();
  sub_26173BCB0();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 40) = 0;
  if (v6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_44;
  }
  OUTLINED_FUNCTION_66_0();
  if (!(v11 ^ v12 | v10)) {
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_35_0();
  if (v11 ^ v12 | v10) {
    OUTLINED_FUNCTION_8_1();
  }
  unint64_t v23 = *(void *)(v0 + 16);
  if ((v23 & 0x8000000000000000) != 0) {
    goto LABEL_46;
  }
  if (HIDWORD(v23))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  OUTLINED_FUNCTION_31_0(v22, v23);
  uint64_t v24 = *v14;
  OUTLINED_FUNCTION_16();
  if (v11 != v12) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v25, v26, *(void *)(v1 + 24));
  }
  *(void *)(v1 + 16) = 0;
  OUTLINED_FUNCTION_5_0();
  if (v11 != v12)
  {
    OUTLINED_FUNCTION_22_0();
    uint64_t v27 = *(void *)(v24 + 32);
  }
  OUTLINED_FUNCTION_6_0(v27);
  if (!v10 & v28) {
LABEL_48:
  }
    __break(1u);
  *unint64_t v29 = 4;
  OUTLINED_FUNCTION_2_3();
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  void (**v8)(void);
  void (**v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t v28;
  Swift::Int v29;
  Swift::Int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::Int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  void (*v41)(uint64_t);
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  Swift::Int v46;
  void *v47;
  Swift::Int v48;
  Swift::Int v49;
  uint64_t v50;
  void (*v51)(uint64_t);
  void (*v52)(void);
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  unint64_t v59;
  _DWORD *v60;
  unint64_t v61;
  uint64_t v62;
  Swift::Int v63;
  Swift::Int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  _DWORD *v70;
  uint64_t v71;
  void (**v72)(void);
  uint64_t v73;
  uint64_t AssociatedTypeWitness;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  void v78[3];

  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v0;
  int v4 = v3;
  int64_t v6 = v5;
  uint64_t v70 = v7;
  v78[1] = *MEMORY[0x263EF8340];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_27_0(v11, v69);
  MEMORY[0x270FA5388](v12);
  uint64_t v76 = (char *)&v69 - v13;
  OUTLINED_FUNCTION_0_0();
  uint64_t v75 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x270FA5388](v16);
  Swift::Int v17 = MEMORY[0x263E3E9F0](v6, v4);
  Swift::Int v18 = OUTLINED_FUNCTION_16_0();
  v19(v18);
  OUTLINED_FUNCTION_44_0();
  if (v21 ^ v22 | v20)
  {
    uint64_t v1 = 4;
    v0[8] = 4;
    v0[3] = 4;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v21 ^ v22 | v20))
  {
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  Swift::Int v25 = v24 * v17;
  if ((v23 | (v24 * v17)) < 0) {
    goto LABEL_48;
  }
  OUTLINED_FUNCTION_64_0();
  if (!(v21 ^ v22 | v20)) {
    goto LABEL_49;
  }
  uint64_t v73 = v6;
  uint64_t v72 = v9;
  uint64_t v27 = ((-(int)v26 - v25) & 3) + v26;
  char v28 = v0[1];
  OUTLINED_FUNCTION_63();
  if (v21 != v22)
  {
    char v32 = v31;
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v29, v30, v2[3]);
    uint64_t v31 = v32;
  }
  v2[2] = v27;
  if (v1 < v31)
  {
    v2[8] = v31;
    v2[3] = v31;
  }
  OUTLINED_FUNCTION_63_0();
  if (!(v21 ^ v22 | v20)) {
    goto LABEL_50;
  }
  if ((v27 | v33) < 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v33 > 0xFFFFFFFFLL)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (!v33)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  Swift::Int v69 = v17;
  OUTLINED_FUNCTION_5_0();
  if (v21 != v22) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v34, v27, v2[3]);
  }
  OUTLINED_FUNCTION_48_0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_65_0();
  uint64_t v35 = v77;
  int v36 = swift_bridgeObjectRetain();
  unsigned int v37 = MEMORY[0x263E3EA00](v36, v4);
  swift_bridgeObjectRelease();
  v78[0] = v37;
  if (v37 != OUTLINED_FUNCTION_62_0())
  {
    OUTLINED_FUNCTION_3_1();
    do
    {
      MEMORY[0x263E3EA10](v78, v35, v4);
      sub_26173BCF0();
      OUTLINED_FUNCTION_45_0();
      if (v28)
      {
        uint64_t v38 = OUTLINED_FUNCTION_10_0();
        v39(v38);
      }
      else
      {
        uint64_t v56 = sub_26173BDD0();
        if (v71 != 8) {
          goto LABEL_55;
        }
        uint64_t v57 = OUTLINED_FUNCTION_13_0(v56);
        v58(v57);
        swift_unknownObjectRelease();
      }
      uint64_t v40 = OUTLINED_FUNCTION_26_0();
      v41(v40);
      uint64_t v42 = OUTLINED_FUNCTION_18_0();
      v43(v42);
      uint64_t v44 = OUTLINED_FUNCTION_40_0();
      uint64_t v46 = v45(v44);
      uint64_t v47 = v2;
      uint64_t v48 = v2[2] + v46;
      OUTLINED_FUNCTION_30_0();
      if (v21 != v22) {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v46, v49, v47[3]);
      }
      uint64_t v50 = OUTLINED_FUNCTION_17_0();
      v51(v50);
      OUTLINED_FUNCTION_50_0();
      v47[2] = v48;
      LOBYTE(v28) = (_BYTE)v72;
      uint64_t v52 = *v72;
      OUTLINED_FUNCTION_24_0();
      v52();
      OUTLINED_FUNCTION_24_0();
      v52();
      uint64_t v53 = OUTLINED_FUNCTION_23_0();
      v54(v53);
      uint64_t v55 = v78[0];
      uint64_t v2 = v47;
    }
    while (v55 != OUTLINED_FUNCTION_62_0());
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_55_0();
  if (v21 != v22) {
    goto LABEL_54;
  }
  OUTLINED_FUNCTION_66_0();
  if (!(v21 ^ v22 | v20))
  {
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if ((uint64_t)v2[8] <= 3)
  {
    v2[8] = 4;
    v2[3] = 4;
  }
  uint64_t v59 = v2[2];
  uint64_t v60 = v70;
  if ((v59 & 0x8000000000000000) != 0) {
    goto LABEL_57;
  }
  if (HIDWORD(v59))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v61 = (-*((_DWORD *)v2 + 4) & 3) + v59;
  uint64_t v62 = v2[1];
  OUTLINED_FUNCTION_5_0();
  if (v21 != v22) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v63, v64, v2[3]);
  }
  v2[2] = v61;
  OUTLINED_FUNCTION_16();
  if (v21 != v22)
  {
    OUTLINED_FUNCTION_59_0(v65, v66, v2[3]);
    uint64_t v67 = *(void *)(v62 + 32);
  }
  OUTLINED_FUNCTION_28_0(v67);
  if (!v20 & v68) {
LABEL_59:
  }
    __break(1u);
  *uint64_t v60 = v61 + 4;
  OUTLINED_FUNCTION_2_3();
}

void FlatBufferBuilder.createVector<A>(_:size:)()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  int64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(v2 - 8) + 64);
  *(unsigned char *)(v0 + 40) = 1;
  uint64_t v9 = *(void *)(v0 + 64);
  if (v9 <= 3)
  {
    uint64_t v9 = 4;
    *(void *)(v0 + 64) = 4;
    *(void *)(v0 + 24) = 4;
  }
  OUTLINED_FUNCTION_39_0();
  if (!(v13 ^ v14 | v12))
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v15 = v8 * v5;
  if ((v10 | (v8 * v5)) < 0) {
    goto LABEL_39;
  }
  if (v15 > 0xFFFFFFFFLL)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  char v32 = v11;
  Swift::Int v16 = (uint64_t *)(v0 + 8);
  Swift::Int v17 = ((-(int)v10 - (int)v15) & 3) + v10;
  OUTLINED_FUNCTION_15_0();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v18, v19, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v17;
  if (v9 < v8)
  {
    *(void *)(v0 + 64) = v8;
    *(void *)(v0 + 24) = v8;
  }
  if (v17 > 0xFFFFFFFFLL) {
    goto LABEL_41;
  }
  if ((v17 | v8) < 0)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  OUTLINED_FUNCTION_64_0();
  if (!(v13 ^ v14 | v12)) {
    goto LABEL_43;
  }
  if (!v8)
  {
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
  Swift::Int v20 = v17 + ((v8 - 1) & -(v15 + v17));
  OUTLINED_FUNCTION_47_0();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v21, v17, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v20;
  MEMORY[0x263E3E9F0](v7, v3);
  OUTLINED_FUNCTION_37_0();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v22, v20, *(void *)(v0 + 24));
  }
  sub_26173BD30();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v23 = OUTLINED_FUNCTION_53_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_51_0();
  *(void *)(v24 - 16) = v16;
  sub_26173BE60();
  swift_getWitnessTable();
  sub_26173BCB0();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 40) = 0;
  if (v5 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_66_0();
  if (!(v13 ^ v14 | v12)) {
    goto LABEL_46;
  }
  OUTLINED_FUNCTION_35_0();
  if (v13 ^ v14 | v12) {
    OUTLINED_FUNCTION_8_1();
  }
  unint64_t v26 = *(void *)(v0 + 16);
  if ((v26 & 0x8000000000000000) != 0) {
    goto LABEL_47;
  }
  if (HIDWORD(v26))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  OUTLINED_FUNCTION_31_0(v25, v26);
  uint64_t v27 = *v16;
  OUTLINED_FUNCTION_16();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v28, v29, *(void *)(v1 + 24));
  }
  *(void *)(v1 + 16) = 0;
  OUTLINED_FUNCTION_5_0();
  if (v13 != v14)
  {
    OUTLINED_FUNCTION_22_0();
    uint64_t v30 = *(void *)(v27 + 32);
  }
  OUTLINED_FUNCTION_6_0(v30);
  if (!v12 & v31) {
LABEL_49:
  }
    __break(1u);
  *char v32 = 4;
  OUTLINED_FUNCTION_2_3();
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void (**v10)(void);
  void (**v11)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  Swift::Int v28;
  uint64_t v29;
  Swift::Int v30;
  Swift::Int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  Swift::Int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  Swift::Int v48;
  void *v49;
  Swift::Int v50;
  Swift::Int v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void (*v54)(void);
  uint64_t v55;
  void (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t);
  unint64_t v61;
  _DWORD *v62;
  unint64_t v63;
  uint64_t v64;
  Swift::Int v65;
  Swift::Int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  _DWORD *v72;
  uint64_t v73;
  void (**v74)(void);
  uint64_t v75;
  uint64_t AssociatedTypeWitness;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  void v80[3];

  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v0;
  int64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v72 = v9;
  v80[1] = *MEMORY[0x263EF8340];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  char v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_27_0(v13, v71);
  MEMORY[0x270FA5388](v14);
  uint64_t v78 = (char *)&v71 - v15;
  OUTLINED_FUNCTION_0_0();
  uint64_t v77 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_34_0();
  MEMORY[0x270FA5388](v18);
  Swift::Int v19 = OUTLINED_FUNCTION_16_0();
  v20(v19);
  OUTLINED_FUNCTION_44_0();
  if (v22 ^ v23 | v21)
  {
    uint64_t v1 = 4;
    v0[8] = 4;
    v0[3] = 4;
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v22 ^ v23 | v21))
  {
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  unint64_t v26 = v25 * v6;
  if ((v24 | (v25 * v6)) < 0) {
    goto LABEL_48;
  }
  OUTLINED_FUNCTION_64_0();
  if (!(v22 ^ v23 | v21)) {
    goto LABEL_49;
  }
  uint64_t v75 = v8;
  uint64_t v74 = v11;
  Swift::Int v28 = ((-(int)v27 - v26) & 3) + v27;
  Swift::Int v29 = v0[1];
  OUTLINED_FUNCTION_63();
  if (v22 != v23)
  {
    uint64_t v33 = v6;
    Swift::Int v34 = v32;
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v30, v31, v2[3]);
    char v32 = v34;
    uint64_t v6 = v33;
  }
  v2[2] = v28;
  if (v1 < v32)
  {
    v2[8] = v32;
    v2[3] = v32;
  }
  OUTLINED_FUNCTION_63_0();
  if (!(v22 ^ v23 | v21)) {
    goto LABEL_50;
  }
  if ((v28 | v35) < 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v35 > 0xFFFFFFFFLL)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (!v35)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  uint64_t v71 = v6;
  OUTLINED_FUNCTION_5_0();
  if (v22 != v23) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v36, v28, v2[3]);
  }
  OUTLINED_FUNCTION_48_0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_65_0();
  unsigned int v37 = v79;
  uint64_t v38 = swift_bridgeObjectRetain();
  int v39 = MEMORY[0x263E3EA00](v38, v4);
  swift_bridgeObjectRelease();
  v80[0] = v39;
  if (v39 != OUTLINED_FUNCTION_62_0())
  {
    OUTLINED_FUNCTION_3_1();
    do
    {
      MEMORY[0x263E3EA10](v80, v37, v4);
      sub_26173BCF0();
      OUTLINED_FUNCTION_45_0();
      if (v29)
      {
        uint64_t v40 = OUTLINED_FUNCTION_10_0();
        v41(v40);
      }
      else
      {
        unint64_t v58 = sub_26173BDD0();
        if (v73 != 8) {
          goto LABEL_55;
        }
        uint64_t v59 = OUTLINED_FUNCTION_13_0(v58);
        v60(v59);
        swift_unknownObjectRelease();
      }
      uint64_t v42 = OUTLINED_FUNCTION_26_0();
      v43(v42);
      uint64_t v44 = OUTLINED_FUNCTION_18_0();
      v45(v44);
      uint64_t v46 = OUTLINED_FUNCTION_40_0();
      uint64_t v48 = v47(v46);
      uint64_t v49 = v2;
      uint64_t v50 = v2[2] + v48;
      OUTLINED_FUNCTION_30_0();
      if (v22 != v23) {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v48, v51, v49[3]);
      }
      uint64_t v52 = OUTLINED_FUNCTION_17_0();
      v53(v52);
      OUTLINED_FUNCTION_50_0();
      v49[2] = v50;
      LOBYTE(v29) = (_BYTE)v74;
      uint64_t v54 = *v74;
      OUTLINED_FUNCTION_24_0();
      v54();
      OUTLINED_FUNCTION_24_0();
      v54();
      uint64_t v55 = OUTLINED_FUNCTION_23_0();
      v56(v55);
      uint64_t v57 = v80[0];
      uint64_t v2 = v49;
    }
    while (v57 != OUTLINED_FUNCTION_62_0());
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_55_0();
  if (v22 != v23) {
    goto LABEL_54;
  }
  OUTLINED_FUNCTION_66_0();
  if (!(v22 ^ v23 | v21))
  {
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if ((uint64_t)v2[8] <= 3)
  {
    v2[8] = 4;
    v2[3] = 4;
  }
  uint64_t v61 = v2[2];
  uint64_t v62 = v72;
  if ((v61 & 0x8000000000000000) != 0) {
    goto LABEL_57;
  }
  if (HIDWORD(v61))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v63 = (-*((_DWORD *)v2 + 4) & 3) + v61;
  uint64_t v64 = v2[1];
  OUTLINED_FUNCTION_5_0();
  if (v22 != v23) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v65, v66, v2[3]);
  }
  v2[2] = v63;
  OUTLINED_FUNCTION_16();
  if (v22 != v23)
  {
    OUTLINED_FUNCTION_59_0(v67, v68, v2[3]);
    Swift::Int v69 = *(void *)(v64 + 32);
  }
  OUTLINED_FUNCTION_28_0(v69);
  if (!v21 & v70) {
LABEL_59:
  }
    __break(1u);
  *uint64_t v62 = v63 + 4;
  OUTLINED_FUNCTION_2_3();
}

void FlatBufferBuilder.createVector(ofOffsets:)()
{
  OUTLINED_FUNCTION_42_0();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  Swift::Int v7 = v6;
  unint64_t v8 = *(void *)(v4 + 16);
  *(unsigned char *)(v0 + 40) = 1;
  OUTLINED_FUNCTION_32_1();
  if (v10 ^ v11 | v9) {
    OUTLINED_FUNCTION_7_1();
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v10 ^ v11 | v9))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (((v12 | (4 * v8)) & 0x8000000000000000) != 0)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_33_0();
  if (!(v10 ^ v11 | v9)) {
    goto LABEL_45;
  }
  unint64_t v14 = (-(int)v13 & 3) + v13;
  uint64_t v0 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_19_1();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v15, v16, *(void *)(v3 + 24));
  }
  *(void *)(v3 + 16) = v14;
  if ((v14 & 0x8000000000000000) != 0) {
    goto LABEL_46;
  }
  if (HIDWORD(v14))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  Swift::Int v1 = (-(int)v14 & 3) + v14;
  OUTLINED_FUNCTION_63();
  if (v10 != v11) {
    OUTLINED_FUNCTION_60_0(v17);
  }
  uint64_t v2 = 4294967291;
  *(void *)(v3 + 16) = v1;
  if (v8)
  {
    Swift::Int v29 = v7;
    swift_bridgeObjectRetain();
    unint64_t v18 = v8 + 7;
    while (v1 <= 0xFFFFFFFFLL)
    {
      int v19 = *(_DWORD *)(v5 + 4 * v18);
      uint64_t v20 = (-(int)v1 & 3) + v1;
      OUTLINED_FUNCTION_19_1();
      if (v10 != v11) {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v21, v1, *(void *)(v3 + 24));
      }
      if (v20 > 0xFFFFFFFFLL) {
        goto LABEL_41;
      }
      Swift::Int v7 = (-(int)v20 & 3) + v20;
      OUTLINED_FUNCTION_36_0();
      if (v10 != v11)
      {
        OUTLINED_FUNCTION_60_0(v22);
        Swift::Int v23 = *(void *)(v0 + 32);
      }
      Swift::Int v1 = v7 + 4;
      if (v23 < v7 + 4)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v7, *(void *)(v3 + 24));
        Swift::Int v23 = *(void *)(v0 + 32);
      }
      *(_DWORD *)(v23 - v7 + *(void *)(v0 + 24) - 4) = v20 - v19 + 4;
      if (v7 > 4294967291) {
        goto LABEL_42;
      }
      if (--v18 == 7)
      {
        swift_bridgeObjectRelease();
        *(void *)(v3 + 16) = v1;
        *(unsigned char *)(v3 + 40) = 0;
        int v24 = v8;
        Swift::Int v7 = v29;
        if (!(v8 >> 31)) {
          goto LABEL_32;
        }
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
LABEL_48:
  int v24 = 0;
  *(unsigned char *)(v3 + 40) = 0;
  if (HIDWORD(v1))
  {
    __break(1u);
    goto LABEL_50;
  }
LABEL_32:
  Swift::Int v25 = (-(int)v1 & 3) + v1;
  OUTLINED_FUNCTION_12();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v26, v1, *(void *)(v3 + 24));
  }
  *(void *)(v3 + 16) = v25;
  Swift::Int v27 = v25 + 4;
  OUTLINED_FUNCTION_5_0();
  if (v10 != v11)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v25, *(void *)(v3 + 24));
    uint64_t v28 = *(void *)(v0 + 32);
  }
  *(_DWORD *)(v28 - v25 + *(void *)(v0 + 24) - 4) = v24;
  *(void *)(v3 + 16) = v27;
  if (v25 > v2) {
LABEL_51:
  }
    __break(1u);
  *(_DWORD *)Swift::Int v7 = v27;
  OUTLINED_FUNCTION_41_0();
}

void FlatBufferBuilder.createVector(ofOffsets:len:)()
{
  OUTLINED_FUNCTION_42_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  Swift::Int v7 = v6;
  *(unsigned char *)(v0 + 40) = 1;
  OUTLINED_FUNCTION_32_1();
  if (v9 ^ v10 | v8) {
    OUTLINED_FUNCTION_7_1();
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v9 ^ v10 | v8))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if ((v11 | (4 * v3)) < 0)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  OUTLINED_FUNCTION_33_0();
  if (!(v9 ^ v10 | v8)) {
    goto LABEL_48;
  }
  unint64_t v13 = (-(int)v12 & 3) + v12;
  uint64_t v14 = *(void *)(v0 + 8);
  OUTLINED_FUNCTION_36_0();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v15, v16, *(void *)(v1 + 24));
  }
  *(void *)(v1 + 16) = v13;
  if ((v13 & 0x8000000000000000) != 0) {
    goto LABEL_49;
  }
  if (HIDWORD(v13))
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v17 = (-(int)v13 & 3) + v13;
  OUTLINED_FUNCTION_19_1();
  if (v9 != v10) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v18, v13, *(void *)(v1 + 24));
  }
  *(void *)(v1 + 16) = v17;
  uint64_t v19 = *(void *)(v5 + 16);
  if (v19)
  {
    uint64_t v31 = v3;
    char v32 = v7;
    swift_bridgeObjectRetain();
    uint64_t v20 = v19 + 7;
    while (v17 <= 0xFFFFFFFFLL)
    {
      int v21 = *(_DWORD *)(v5 + 4 * v20);
      Swift::Int v22 = (-(int)v17 & 3) + v17;
      OUTLINED_FUNCTION_36_0();
      if (v9 != v10) {
        OUTLINED_FUNCTION_60_0(v23);
      }
      if (v22 > 0xFFFFFFFFLL) {
        goto LABEL_44;
      }
      Swift::Int v24 = (-(int)v22 & 3) + v22;
      OUTLINED_FUNCTION_15_0();
      if (v9 != v10)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v25, v22, *(void *)(v1 + 24));
        Swift::Int v26 = *(void *)(v14 + 32);
      }
      uint64_t v17 = v24 + 4;
      if (v26 < v24 + 4)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v24, *(void *)(v1 + 24));
        Swift::Int v26 = *(void *)(v14 + 32);
      }
      *(_DWORD *)(v26 - v24 + *(void *)(v14 + 24) - 4) = v22 - v21 + 4;
      if (v24 > 4294967291) {
        goto LABEL_45;
      }
      if (--v20 == 7)
      {
        swift_bridgeObjectRelease();
        *(void *)(v1 + 16) = v17;
        uint64_t v3 = v31;
        Swift::Int v7 = v32;
        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_32:
  *(unsigned char *)(v1 + 40) = 0;
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v17 > 0xFFFFFFFFLL)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  uint64_t v27 = (-(int)v17 & 3) + v17;
  OUTLINED_FUNCTION_63();
  if (v9 != v10) {
    OUTLINED_FUNCTION_60_0(v28);
  }
  *(void *)(v1 + 16) = v27;
  uint64_t v29 = v27 + 4;
  OUTLINED_FUNCTION_5_0();
  if (v9 != v10) {
    OUTLINED_FUNCTION_29_0();
  }
  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)(v30 - 4) = v3;
  *(void *)(v1 + 16) = v29;
  if (v27 > 4294967291) {
LABEL_54:
  }
    __break(1u);
  *Swift::Int v7 = v29;
  OUTLINED_FUNCTION_41_0();
}

unint64_t FlatBufferBuilder.push(element:)()
{
  OUTLINED_FUNCTION_32_1();
  if (v3 ^ v4 | v2) {
    OUTLINED_FUNCTION_14(4);
  }
  unint64_t v5 = *(void *)(v0 + 16);
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (HIDWORD(v5))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int v6 = *v1;
  unint64_t v7 = (-*(_DWORD *)(v0 + 16) & 3) + v5;
  OUTLINED_FUNCTION_12();
  if (v3 != v4) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, *(void *)(v0 + 24));
  }
  *(void *)(v0 + 16) = v7;
  if (HIDWORD(v7)) {
    goto LABEL_20;
  }
  int v10 = v7 - v6 + 4;
  unint64_t v11 = (-(int)v7 & 3) + v7;
  OUTLINED_FUNCTION_16();
  if (v3 != v4) {
    OUTLINED_FUNCTION_57_0(v12);
  }
  *(void *)(v0 + 16) = v11;
  OUTLINED_FUNCTION_12();
  if (v3 != v4) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v11, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_43_0();
  *(_DWORD *)(v13 - 4) = v10;
  *(void *)(v0 + 16) = v11 + 4;
  if (v11 > 0xFFFFFFFB) {
LABEL_21:
  }
    __break(1u);
  return v11 + 4;
}

uint64_t FlatBufferBuilder.createVector(ofStrings:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v4 = v2;
  v72[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = 4294967291;
  uint64_t v67 = *(void *)(a1 + 16);
  if (!v67)
  {
    Swift::Int v8 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_71;
  }
  Swift::Int v69 = (void *)(v2 + 8);
  uint64_t v6 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  Swift::Int v8 = (char *)MEMORY[0x263F8EE78];
  uint64_t v66 = v6;
  while (1)
  {
    uint64_t v68 = v7;
    Swift::Int v9 = (uint64_t *)(v6 + 16 * v7);
    uint64_t v5 = *v9;
    unint64_t v10 = v9[1];
    if ((v10 & 0x1000000000000000) != 0) {
      sub_26173BC50();
    }
    OUTLINED_FUNCTION_35_0();
    if (v13 ^ v14 | v12) {
      OUTLINED_FUNCTION_8_1();
    }
    Swift::Int v15 = *(void *)(v4 + 16);
    if (v15 > 0xFFFFFFFFLL)
    {
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
      goto LABEL_130;
    }
    if (((v15 | (v11 + 1)) & 0x8000000000000000) != 0) {
      goto LABEL_123;
    }
    if ((uint64_t)(v11 + 1) > 0xFFFFFFFFLL) {
      goto LABEL_124;
    }
    size_t v70 = v11;
    Swift::Int v16 = (~(_BYTE)v11 - (_BYTE)v15) & 3;
    Swift::Int v17 = v16 + v15;
    uint64_t v18 = *v69;
    Swift::Int v19 = *(void *)(*v69 + 32);
    if (v19 >= v16 + v15)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      Swift::Int v20 = *(void *)(v4 + 24);
      swift_bridgeObjectRetain();
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v16, v15, v20);
      Swift::Int v19 = *(void *)(v18 + 32);
    }
    if (v19 <= v17)
    {
      Swift::Int v21 = OUTLINED_FUNCTION_54_0();
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v21, v16 + v15, v22);
    }
    *(void *)(v4 + 16) = v17 + 1;
    OUTLINED_FUNCTION_37_0();
    if (v13 != v14) {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v70, v23, *(void *)(v4 + 24));
    }
    swift_bridgeObjectRetain();
    int v24 = sub_261714FB0(v5, v10, v69, v70);
    swift_bridgeObjectRelease();
    if (v24 == 2)
    {
      unint64_t v3 = (v10 & 0x2000000000000000) != 0 ? HIBYTE(v10) & 0xF : v5 & 0xFFFFFFFFFFFFLL;
      if (v3) {
        break;
      }
    }
LABEL_51:
    if ((v70 & 0x8000000000000000) != 0) {
      goto LABEL_125;
    }
    if (HIDWORD(v70)) {
      goto LABEL_126;
    }
    OUTLINED_FUNCTION_35_0();
    if (v13 ^ v14 | v12) {
      OUTLINED_FUNCTION_8_1();
    }
    unint64_t v37 = *(void *)(v4 + 16);
    uint64_t v5 = 4294967291;
    if ((v37 & 0x8000000000000000) != 0) {
      goto LABEL_127;
    }
    if (HIDWORD(v37)) {
      goto LABEL_128;
    }
    unint64_t v38 = (-*(_DWORD *)(v4 + 16) & 3) + v37;
    OUTLINED_FUNCTION_5_0();
    if (v13 != v14)
    {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v39, v40, *(void *)(v4 + 24));
      int64_t v41 = *(void *)(v18 + 32);
    }
    unint64_t v3 = v38 + 4;
    if (v41 < (uint64_t)(v38 + 4))
    {
      OUTLINED_FUNCTION_59_0(v39, v40, *(void *)(v4 + 24));
      int64_t v41 = *(void *)(v18 + 32);
    }
    *(_DWORD *)(v41 - v38 + *(void *)(v18 + 24) - 4) = v70;
    swift_bridgeObjectRelease();
    *(void *)(v4 + 16) = v3;
    if (v38 > 0xFFFFFFFB) {
      goto LABEL_129;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      Swift::Int v8 = sub_261738040(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v43 = *((void *)v8 + 2);
    unint64_t v42 = *((void *)v8 + 3);
    if (v43 >= v42 >> 1) {
      Swift::Int v8 = sub_261738040((char *)(v42 > 1), v43 + 1, 1, v8);
    }
    ++v7;
    *((void *)v8 + 2) = v43 + 1;
    *(_DWORD *)&v8[4 * v43 + 32] = v3;
    uint64_t v6 = v66;
    if (v68 + 1 == v67) {
      goto LABEL_121;
    }
  }
  uint64_t v64 = v8;
  uint64_t v25 = ((unint64_t)v5 >> 59) & 1;
  if ((v10 & 0x1000000000000000) == 0) {
    LODWORD(v25) = 1;
  }
  uint64_t v26 = 11;
  if (v25) {
    uint64_t v26 = 7;
  }
  unint64_t v27 = v26 | (v3 << 16);
  Swift::Int v8 = (char *)(4 << v25);
  swift_bridgeObjectRetain();
  while (1)
  {
    if ((char *)(v27 & 0xC) != v8)
    {
      if ((v10 & 0x1000000000000000) != 0) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
    unint64_t v28 = sub_26172DB28(v27, v5, v10);
    if (v28 < 0x4000) {
      break;
    }
    unint64_t v27 = v28;
    if ((v10 & 0x1000000000000000) != 0)
    {
LABEL_34:
      if (v3 < v27 >> 16) {
        goto LABEL_116;
      }
      unint64_t v27 = sub_26173BC60();
      goto LABEL_36;
    }
LABEL_31:
    unint64_t v27 = (v27 & 0xFFFFFFFFFFFF0000) - 65532;
LABEL_36:
    unint64_t v29 = v27;
    if ((char *)(v27 & 0xC) == v8) {
      unint64_t v29 = sub_26172DB28(v27, v5, v10);
    }
    unint64_t v30 = v29 >> 16;
    if (v29 >> 16 >= v3) {
      goto LABEL_115;
    }
    if ((v10 & 0x1000000000000000) != 0)
    {
      char v32 = sub_26173BC80();
    }
    else if ((v10 & 0x2000000000000000) != 0)
    {
      v72[0] = v5;
      v72[1] = v10 & 0xFFFFFFFFFFFFFFLL;
      char v32 = *((unsigned char *)v72 + v30);
    }
    else
    {
      uint64_t v31 = (v10 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((v5 & 0x1000000000000000) == 0) {
        uint64_t v31 = sub_26173BDE0();
      }
      char v32 = *(unsigned char *)(v31 + v30);
    }
    uint64_t v18 = *(void *)(v4 + 8);
    Swift::Int v33 = *(void *)(v4 + 16);
    OUTLINED_FUNCTION_63();
    if (v13 != v14)
    {
      Swift::Int v35 = OUTLINED_FUNCTION_54_0();
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v35, v33, v36);
      uint64_t v34 = *(void *)(v18 + 32);
    }
    *(unsigned char *)(*(void *)(v18 + 24) + v34 + ~v33) = v32;
    *(void *)(v4 + 16) = v33 + 1;
    if (!(v27 >> 14))
    {
      swift_bridgeObjectRelease();
      Swift::Int v8 = v64;
      goto LABEL_51;
    }
  }
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
  __break(1u);
LABEL_117:
  __break(1u);
LABEL_118:
  __break(1u);
LABEL_119:
  __break(1u);
LABEL_120:
  __break(1u);
LABEL_121:
  swift_bridgeObjectRelease();
LABEL_71:
  unint64_t v44 = *((void *)v8 + 2);
  *(unsigned char *)(v4 + 40) = 1;
  OUTLINED_FUNCTION_35_0();
  if (v13 ^ v14 | v12) {
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_9_1();
  if (!(v13 ^ v14 | v12))
  {
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
    goto LABEL_132;
  }
  if (((v45 | (4 * v44)) & 0x8000000000000000) != 0) {
    goto LABEL_131;
  }
  OUTLINED_FUNCTION_33_0();
  if (!(v13 ^ v14 | v12))
  {
LABEL_132:
    __break(1u);
    goto LABEL_133;
  }
  OUTLINED_FUNCTION_31_0(v46, v47);
  uint64_t v48 = *(void *)(v4 + 8);
  OUTLINED_FUNCTION_16();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v49, v50, *(void *)(v4 + 24));
  }
  *(void *)(v4 + 16) = v3;
  if ((v3 & 0x8000000000000000) != 0)
  {
LABEL_133:
    __break(1u);
    goto LABEL_134;
  }
  if (HIDWORD(v3))
  {
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
    goto LABEL_136;
  }
  Swift::Int v51 = (-(int)v3 & 3) + v3;
  OUTLINED_FUNCTION_5_0();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v52, v3, *(void *)(v4 + 24));
  }
  *(void *)(v4 + 16) = v51;
  uint64_t v53 = *((void *)v8 + 2);
  if (v53)
  {
    unint64_t v71 = v44;
    swift_bridgeObjectRetain();
    do
    {
      if (v53 > *((void *)v8 + 2)) {
        goto LABEL_117;
      }
      if (v51 > 0xFFFFFFFFLL) {
        goto LABEL_118;
      }
      uint64_t v54 = v8;
      Swift::Int v8 = (char *)*(unsigned int *)&v8[4 * v53 + 28];
      unint64_t v3 = (-(int)v51 & 3) + v51;
      OUTLINED_FUNCTION_16();
      if (v13 != v14) {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v55, v51, *(void *)(v4 + 24));
      }
      if ((uint64_t)v3 > 0xFFFFFFFFLL) {
        goto LABEL_119;
      }
      Swift::Int v56 = (-(int)v3 & 3) + v3;
      OUTLINED_FUNCTION_19_1();
      if (v13 != v14)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v57, v3, *(void *)(v4 + 24));
        Swift::Int v58 = *(void *)(v48 + 32);
      }
      Swift::Int v51 = v56 + 4;
      if (v58 < v56 + 4)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v56, *(void *)(v4 + 24));
        Swift::Int v58 = *(void *)(v48 + 32);
      }
      *(_DWORD *)(v58 - v56 + *(void *)(v48 + 24) - 4) = v3 - v8 + 4;
      if (v56 > v5) {
        goto LABEL_120;
      }
      --v53;
      Swift::Int v8 = v54;
    }
    while (v53);
    swift_bridgeObjectRelease();
    *(void *)(v4 + 16) = v51;
    unint64_t v44 = v71;
  }
  *(unsigned char *)(v4 + 40) = 0;
  if (v44 >> 31) {
    goto LABEL_135;
  }
  OUTLINED_FUNCTION_64_0();
  if (!(v13 ^ v14 | v12))
  {
LABEL_136:
    __break(1u);
    goto LABEL_137;
  }
  uint64_t v59 = (-(int)v51 & 3) + v51;
  OUTLINED_FUNCTION_16();
  if (v13 != v14) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v60, v51, *(void *)(v4 + 24));
  }
  *(void *)(v4 + 16) = v59;
  uint64_t v61 = v59 + 4;
  OUTLINED_FUNCTION_5_0();
  if (v13 != v14) {
    OUTLINED_FUNCTION_22_0();
  }
  OUTLINED_FUNCTION_43_0();
  *(_DWORD *)(v62 - 4) = v44;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v4 + 16) = v61;
  if (v59 > v5) {
LABEL_137:
  }
    __break(1u);
  *a2 = v61;
  return result;
}

void FlatBufferBuilder.createVector<A>(ofStructs:)()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  v87[1] = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  int64_t v10 = *(void *)(v9 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v77 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v84 = (char *)&v71 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  Swift::Int v17 = (char *)&v71 - v16;
  uint64_t v18 = MEMORY[0x263E3E9F0](v15);
  if ((unsigned __int128)(v18 * (__int128)v10) >> 64 != (v18 * v10) >> 63)
  {
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v19 = v18;
  uint64_t v80 = v17;
  unint64_t v81 = v10;
  unint64_t v82 = *(unsigned __int8 *)(v8 + 80);
  *(unsigned char *)(v0 + 40) = 1;
  uint64_t v20 = *(void *)(v0 + 64);
  if (v20 <= 3)
  {
    uint64_t v20 = 4;
    *(void *)(v0 + 64) = 4;
    *(void *)(v0 + 24) = 4;
  }
  OUTLINED_FUNCTION_39_0();
  if (!(v24 ^ v25 | v23)) {
    goto LABEL_58;
  }
  unint64_t v74 = v82 + 1;
  uint64_t v26 = (v82 + 1) * v22;
  if ((v21 | v26) < 0)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  if (v26 > 0xFFFFFFFFLL)
  {
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  Swift::Int v27 = ((-(int)v21 - (int)v26) & 3) + v21;
  OUTLINED_FUNCTION_12();
  if (v24 != v25) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v28, v29, *(void *)(v0 + 24));
  }
  uint64_t v85 = v0;
  *(void *)(v0 + 16) = v27;
  if (v20 <= v82)
  {
    uint64_t v30 = v85;
    unint64_t v31 = v74;
    *(void *)(v85 + 64) = v74;
    *(void *)(v30 + 24) = v31;
  }
  if (v27 > 0xFFFFFFFFLL) {
    goto LABEL_61;
  }
  if (v27 < 0)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  uint64_t v72 = v6;
  uint64_t v73 = v19;
  int v76 = v74 - 1;
  Swift::Int v32 = v27 + ((v74 - 1) & (-(int)v26 - v27));
  OUTLINED_FUNCTION_19_1();
  if (v24 != v25) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v33, v27, *(void *)(v85 + 24));
  }
  *(void *)(v85 + 16) = v32;
  v87[0] = v4;
  sub_26173BD30();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_26173BBB0();
  uint64_t v34 = v86;
  uint64_t v35 = swift_bridgeObjectRetain();
  uint64_t v36 = MEMORY[0x263E3EA00](v35, v2);
  swift_bridgeObjectRelease();
  v87[0] = v36;
  uint64_t v37 = sub_26173BCC0();
  Swift::Int v39 = v80;
  size_t v38 = v81;
  if (v36 != v37)
  {
    if ((v81 & 0x8000000000000000) != 0)
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (HIDWORD(v81))
    {
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    uint64_t v83 = (void (**)(void))(v8 + 16);
    unint64_t v78 = v34 + ((v82 + 32) & ~v82);
    uint64_t v79 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v75 = (void (**)(const void *, uint64_t))(v8 + 8);
    Swift::Int v40 = v77;
    while (1)
    {
      MEMORY[0x263E3EA10](v87, v34, v2);
      uint64_t v41 = v87[0];
      char v42 = sub_26173BCF0();
      sub_26173BCD0();
      if (v42)
      {
        unint64_t v43 = *(void (**)(void))(v8 + 16);
        ((void (*)(char *, unint64_t, uint64_t))v43)(v39, v78 + *(void *)(v8 + 72) * v41, v2);
      }
      else
      {
        uint64_t v58 = sub_26173BDD0();
        if (v38 != 8) {
          goto LABEL_66;
        }
        uint64_t v86 = v58;
        unint64_t v43 = *v83;
        OUTLINED_FUNCTION_21_0();
        v43();
        swift_unknownObjectRelease();
      }
      (*v79)(v84, v39, v2);
      unint64_t v44 = (void *)v85;
      if (*(void *)(v85 + 64) <= (int64_t)v82)
      {
        unint64_t v45 = v74;
        *(void *)(v85 + 64) = v74;
        v44[3] = v45;
      }
      unint64_t v46 = v44[2];
      if ((v46 & 0x8000000000000000) != 0) {
        break;
      }
      if (HIDWORD(v46)) {
        goto LABEL_54;
      }
      uint64_t v47 = v8;
      Swift::Int v48 = v46 + (v76 & (-(int)v38 - v46));
      uint64_t v49 = v44[1];
      OUTLINED_FUNCTION_19_1();
      if (v24 != v25)
      {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v50, v51, *(void *)(v85 + 24));
        uint64_t v52 = *(void *)(v49 + 32);
      }
      size_t v38 = v81;
      unint64_t v53 = v48 + v81;
      if (v52 < (uint64_t)(v48 + v81)) {
        ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v81, v48, *(void *)(v85 + 24));
      }
      OUTLINED_FUNCTION_21_0();
      v43();
      memcpy((void *)(*(void *)(v49 + 24) + *(void *)(v49 + 32) - v53), v40, v38);
      uint64_t v54 = v85;
      *(void *)(v85 + 16) = v53;
      Swift::Int v55 = *v75;
      (*v75)(v40, v2);
      unint64_t v56 = *(void *)(v54 + 16);
      if ((v56 & 0x8000000000000000) != 0) {
        goto LABEL_55;
      }
      if (HIDWORD(v56)) {
        goto LABEL_56;
      }
      v55(v84, v2);
      uint64_t v57 = sub_26173BCC0();
      uint64_t v8 = v47;
      Swift::Int v39 = v80;
      if (v41 == v57) {
        goto LABEL_39;
      }
    }
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
LABEL_39:
  swift_bridgeObjectRelease();
  uint64_t v59 = (void *)v85;
  *(unsigned char *)(v85 + 40) = 0;
  int v60 = v73;
  if (v73 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_65;
  }
  uint64_t v61 = v72;
  if (v73 > 0x7FFFFFFF)
  {
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if ((uint64_t)v59[8] <= 3) {
    OUTLINED_FUNCTION_7_1();
  }
  unint64_t v62 = v59[2];
  if ((v62 & 0x8000000000000000) != 0) {
    goto LABEL_68;
  }
  if (HIDWORD(v62))
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  unint64_t v63 = (-*((_DWORD *)v59 + 4) & 3) + v62;
  uint64_t v64 = v59[1];
  OUTLINED_FUNCTION_5_0();
  if (v24 != v25) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v65, v66, v59[3]);
  }
  v59[2] = v63;
  unint64_t v67 = v63 + 4;
  OUTLINED_FUNCTION_12();
  if (v24 != v25)
  {
    OUTLINED_FUNCTION_59_0(v68, v69, v59[3]);
    uint64_t v70 = *(void *)(v64 + 32);
  }
  *(_DWORD *)(v70 - v63 + *(void *)(v64 + 24) - 4) = v60;
  v59[2] = v67;
  if (v63 > 0xFFFFFFFB) {
LABEL_70:
  }
    __break(1u);
  *uint64_t v61 = v67;
  OUTLINED_FUNCTION_2_3();
}

void FlatBufferBuilder.create<A>(struct:)()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  Swift::Int v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_52_0();
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80) + 1;
  if (v0[8] < v8)
  {
    v0[8] = v8;
    v0[3] = v8;
  }
  OUTLINED_FUNCTION_39_0();
  if (!(v12 ^ v13 | v11))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v6 > 0xFFFFFFFFLL) {
    goto LABEL_16;
  }
  if ((v9 | v6) < 0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  Swift::Int v14 = v9 + (v10 & (-(int)v9 - v6));
  OUTLINED_FUNCTION_15_0();
  if (v12 != v13) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v15, v16, v0[3]);
  }
  v0[2] = v14;
  OUTLINED_FUNCTION_30_0();
  if (v12 != v13) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v6, v14, v0[3]);
  }
  OUTLINED_FUNCTION_21_0();
  v17();
  OUTLINED_FUNCTION_49_0();
  uint64_t v18 = OUTLINED_FUNCTION_38();
  v19(v18);
  unint64_t v20 = v0[2];
  if ((v20 & 0x8000000000000000) != 0) {
    goto LABEL_18;
  }
  if (HIDWORD(v20)) {
    goto LABEL_19;
  }
  *uint64_t v2 = v20;
  OUTLINED_FUNCTION_2_3();
}

void FlatBufferBuilder.create<A>(struct:position:)()
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  unsigned __int16 v5 = v4;
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(v2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80) + 1;
  if (v0[8] < v9)
  {
    v0[8] = v9;
    v0[3] = v9;
  }
  OUTLINED_FUNCTION_39_0();
  if (!(v14 ^ v15 | v13))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v7 > 0xFFFFFFFFLL) {
    goto LABEL_21;
  }
  if ((v10 | v7) < 0)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v28[0] = v11;
  Swift::Int v16 = v10 + (v12 & (-(int)v10 - v7));
  uint64_t v17 = v0[1];
  OUTLINED_FUNCTION_47_0();
  if (v14 != v15) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v18, v19, v1[3]);
  }
  v1[2] = v16;
  Swift::Int v20 = v16 + v7;
  OUTLINED_FUNCTION_5_0();
  if (v14 != v15) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v16, v1[3]);
  }
  OUTLINED_FUNCTION_21_0();
  v21();
  memcpy((void *)(*(void *)(v17 + 24) + *(void *)(v17 + 32) - v20), (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v1[2] = v20;
  (*(void (**)(char *, uint64_t))(v6 + 8))((char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  unint64_t v22 = v1[2];
  if ((v22 & 0x8000000000000000) != 0) {
    goto LABEL_23;
  }
  if (HIDWORD(v22))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  uint64_t v23 = *v1;
  if (*(unsigned char *)(*v1 + 48)) {
    goto LABEL_25;
  }
  uint64_t v24 = *(void *)(v23 + 32);
  char v25 = (_DWORD *)v28[0];
  if (v24)
  {
    uint64_t v26 = v24 + *(void *)(v23 + 80);
    *(_DWORD *)uint64_t v26 = v22;
    *(_WORD *)(v26 + 4) = v5;
  }
  *(int64x2_t *)(v23 + 72) = vaddq_s64(*(int64x2_t *)(v23 + 72), (int64x2_t)xmmword_26173C130);
  unsigned int v27 = *(unsigned __int16 *)(v23 + 64);
  if (v27 <= v5) {
    LOWORD(v27) = v5;
  }
  *(_WORD *)(v23 + 64) = v27;
  *char v25 = v22;
  OUTLINED_FUNCTION_2_3();
}

uint64_t FlatBufferBuilder.createShared(string:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  v53[3] = *MEMORY[0x263EF8340];
  if (!a2)
  {
    LODWORD(v14) = 0;
    goto LABEL_75;
  }
  unsigned __int16 v5 = v3;
  unint64_t v7 = result;
  uint64_t v8 = v3[6];
  uint64_t v9 = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  if (v9)
  {
    uint64_t v10 = OUTLINED_FUNCTION_61_0();
    unint64_t v12 = sub_26173839C(v10, v11);
    if (v13)
    {
      LODWORD(v14) = *(_DWORD *)(*(void *)(v8 + 56) + 4 * v12);
      goto LABEL_74;
    }
  }
  uint64_t v15 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_77;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v16 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v16 = v7 & 0xFFFFFFFFFFFFLL;
  }
LABEL_9:
  if ((uint64_t)v5[8] <= 3)
  {
    v5[8] = 4;
    v5[3] = 4;
  }
  Swift::Int v17 = v5[2];
  if (v17 > 0xFFFFFFFFLL)
  {
    __break(1u);
    goto LABEL_79;
  }
  if ((v17 | (v16 + 1)) < 0)
  {
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  OUTLINED_FUNCTION_33_0();
  if (!(v20 ^ v21 | v19)) {
    goto LABEL_80;
  }
  size_t v52 = v18;
  unint64_t v22 = v5 + 1;
  Swift::Int v23 = (~(_BYTE)v18 - (_BYTE)v17) & 3;
  Swift::Int v24 = v23 + v17;
  unint64_t v25 = v5[1];
  OUTLINED_FUNCTION_30_0();
  if (v20 != v21)
  {
    uint64_t v26 = v15;
    unsigned int v27 = a3;
    Swift::Int v28 = v5[3];
    swift_bridgeObjectRetain();
    Swift::Int v29 = v28;
    a3 = v27;
    uint64_t v15 = v26;
    unint64_t v22 = v5 + 1;
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v23, v17, v29);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v5[2] = v24;
  OUTLINED_FUNCTION_30_0();
  if (v20 ^ v21 | v19) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v24, v5[3]);
  }
  v5[2] = v24 + 1;
  OUTLINED_FUNCTION_37_0();
  if (v20 != v21) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v52, v24 + 1, v5[3]);
  }
  swift_bridgeObjectRetain();
  uint64_t v30 = OUTLINED_FUNCTION_61_0();
  int v32 = sub_261714FB0(v30, v31, v22, v52);
  swift_bridgeObjectRelease();
  if (v32 != 2) {
    goto LABEL_60;
  }
  unint64_t v33 = (a2 & 0x2000000000000000) != 0 ? v15 : v7 & 0xFFFFFFFFFFFFLL;
  if (!v33) {
    goto LABEL_60;
  }
  Swift::Int v51 = a3;
  uint64_t v34 = (v7 >> 59) & 1;
  if ((a2 & 0x1000000000000000) == 0) {
    LODWORD(v34) = 1;
  }
  uint64_t v35 = 11;
  if (v34) {
    uint64_t v35 = 7;
  }
  unint64_t v36 = v35 | (v33 << 16);
  a3 = (_DWORD *)(4 << v34);
  swift_bridgeObjectRetain();
  while (1)
  {
    if ((_DWORD *)(v36 & 0xC) != a3)
    {
      if ((a2 & 0x1000000000000000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    unint64_t v37 = sub_26172DB28(v36, v7, a2);
    if (v37 < 0x4000) {
      break;
    }
    unint64_t v36 = v37;
    if ((a2 & 0x1000000000000000) == 0)
    {
LABEL_37:
      OUTLINED_FUNCTION_46_0();
      goto LABEL_42;
    }
LABEL_40:
    if (v33 < v36 >> 16)
    {
      __break(1u);
LABEL_77:
      OUTLINED_FUNCTION_61_0();
      uint64_t v16 = sub_26173BC50();
      goto LABEL_9;
    }
    OUTLINED_FUNCTION_58_0();
    unint64_t v36 = sub_26173BC60();
LABEL_42:
    unint64_t v38 = v36;
    if ((_DWORD *)(v36 & 0xC) == a3) {
      unint64_t v38 = sub_26172DB28(v36, v7, a2);
    }
    unint64_t v25 = v38 >> 16;
    if (v38 >> 16 >= v33) {
      goto LABEL_58;
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
      OUTLINED_FUNCTION_58_0();
      char v40 = sub_26173BC80();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v53[0] = v7;
      v53[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      char v40 = *((unsigned char *)v53 + v25);
    }
    else
    {
      uint64_t v39 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((v7 & 0x1000000000000000) == 0)
      {
        OUTLINED_FUNCTION_61_0();
        uint64_t v39 = sub_26173BDE0();
      }
      char v40 = *(unsigned char *)(v39 + v25);
    }
    unint64_t v25 = v5[1];
    Swift::Int v41 = v5[2];
    uint64_t v15 = v41 + 1;
    OUTLINED_FUNCTION_15_0();
    if (v20 != v21)
    {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v41, v5[3]);
      uint64_t v42 = *(void *)(v25 + 32);
    }
    *(unsigned char *)(*(void *)(v25 + 24) + v42 + ~v41) = v40;
    v5[2] = v15;
    if (!(v36 >> 14)) {
      goto LABEL_59;
    }
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  swift_bridgeObjectRelease();
  a3 = v51;
LABEL_60:
  if ((v52 & 0x8000000000000000) != 0) {
    goto LABEL_81;
  }
  if (HIDWORD(v52))
  {
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  if ((uint64_t)v5[8] <= 3)
  {
    v5[8] = 4;
    v5[3] = 4;
  }
  unint64_t v43 = v5[2];
  if ((v43 & 0x8000000000000000) != 0) {
    goto LABEL_83;
  }
  if (HIDWORD(v43))
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  unint64_t v44 = (-*((_DWORD *)v5 + 4) & 3) + v43;
  OUTLINED_FUNCTION_47_0();
  if (v20 != v21) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v45, v46, v5[3]);
  }
  v5[2] = v44;
  unint64_t v14 = v44 + 4;
  OUTLINED_FUNCTION_16();
  if (v20 != v21)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v44, v5[3]);
    uint64_t v47 = *(void *)(v25 + 32);
  }
  *(_DWORD *)(v47 - v44 + *(void *)(v25 + 24) - 4) = v52;
  swift_bridgeObjectRelease();
  v5[2] = v14;
  if (v44 > 0xFFFFFFFB) {
LABEL_85:
  }
    __break(1u);
  OUTLINED_FUNCTION_58_0();
  sub_2617384F8(v48, v49, v50);
LABEL_74:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_75:
  *a3 = v14;
  return result;
}

uint64_t FlatBufferBuilder.debugDescription.getter()
{
  return 0;
}

uint64_t FlatBufferBuilder.VTableStorage.init()()
{
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 24) = 8;
  *(unsigned char *)(v0 + 48) = 1;
  *(void *)(v0 + 56) = 0;
  *(_WORD *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = 0;
  uint64_t v1 = swift_slowAlloc();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v1;
  *(unsigned char *)(v0 + 48) = 0;
  return v0;
}

void FlatBufferBuilder.VTableStorage.deinit()
{
  if (*(unsigned char *)(v0 + 48))
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 32);
    if (v1) {
      MEMORY[0x263E3EDF0](v1, -1, -1);
    }
  }
}

char *sub_261738040(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AE80);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[4 * v8] <= v12) {
      memmove(v12, v13, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_261738138(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B410998);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_261738224(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AE88);
  unsigned __int16 v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  unint64_t v4[2] = a1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 4);
  return v4;
}

unint64_t sub_261738298(unint64_t result, int64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v6 = result;
  unint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *(void *)(v4 + 24) >> 1)
  {
    if (!v8) {
      goto LABEL_22;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v10 = v5 + v8;
    }
    else {
      int64_t v10 = v5;
    }
    uint64_t result = (unint64_t)sub_2617094CC((char *)result, v10, 1, (char *)v4);
    unint64_t v4 = result;
    if (!v8) {
      goto LABEL_22;
    }
  }
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v12 = v11 - a2;
  if (__OFSUB__(v11, a2)) {
    goto LABEL_28;
  }
  char v13 = (const void *)(v4 + 32 + 4 * a2);
  uint64_t result = v4 + 32 + 4 * v6;
  if (v6 != a2 || (unint64_t)v13 + 4 * v12 <= result)
  {
    uint64_t result = (unint64_t)memmove((void *)result, v13, 4 * v12);
    uint64_t v11 = *(void *)(v4 + 16);
  }
  BOOL v15 = __OFADD__(v11, v8);
  uint64_t v16 = v11 + v8;
  if (!v15)
  {
    *(void *)(v4 + 16) = v16;
LABEL_22:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_26173839C(uint64_t a1, uint64_t a2)
{
  sub_26173BEF0();
  sub_26173BC30();
  uint64_t v4 = sub_26173BF10();
  return sub_261738414(a1, a2, v4);
}

unint64_t sub_261738414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_26173BE80() & 1) == 0)
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
      while (!v14 && (sub_26173BE80() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2617384F8(int a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_261738588(a1, a2, a3);
  *uint64_t v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_261738588(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_26173839C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A92AE78);
  uint64_t result = sub_26173BE40();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_26173839C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_26173BE90();
    __break(1u);
    return result;
  }
  unint64_t v11 = result;
LABEL_5:
  BOOL v15 = *v4;
  if (v12)
  {
    *(_DWORD *)(v15[7] + 4 * v11) = a1;
  }
  else
  {
    sub_2617386A8(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2617386A8(unint64_t result, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(_DWORD *)(a5[7] + 4 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_2617386F0(uint64_t a1)
{
  return sub_26173AC38(a1, *(void **)(v1 + 32), *(void *)(v1 + 16));
}

uint64_t sub_261738710@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 64);
  return result;
}

uint64_t sub_26173871C(uint64_t *a1)
{
  return FlatBufferBuilder._minAlignment.setter(*a1);
}

uint64_t destroy for FlatBufferBuilder()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FlatBufferBuilder(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FlatBufferBuilder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for FlatBufferBuilder(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlatBufferBuilder(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 72))
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

uint64_t storeEnumTagSinglePayload for FlatBufferBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FlatBufferBuilder()
{
  return &type metadata for FlatBufferBuilder;
}

uint64_t method lookup function for FlatBufferBuilder.VTableStorage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FlatBufferBuilder.VTableStorage);
}

uint64_t dispatch thunk of FlatBufferBuilder.VTableStorage.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t sub_261738A2C(uint64_t a1)
{
  return sub_2617386F0(a1);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return v0;
}

void OUTLINED_FUNCTION_22_0()
{
  Swift::Int v3 = *(void *)(v1 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(4, v0, v3);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return v0;
}

void OUTLINED_FUNCTION_25_0(uint64_t a1@<X8>, int64x2_t a2@<Q0>, int64x2_t a3@<Q1>)
{
  *(int64x2_t *)(a1 + 72) = vaddq_s64(a2, a3);
  unsigned int v4 = *(unsigned __int16 *)(a1 + 64);
  if (v4 <= v3) {
    LOWORD(v4) = v3;
  }
  *(_WORD *)(a1 + 64) = v4;
}

void OUTLINED_FUNCTION_34_0()
{
  *(void *)(v1 - 240) = v0;
}

void OUTLINED_FUNCTION_44_0()
{
  *(unsigned char *)(v0 + 40) = 1;
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return sub_26173BBB0();
}

void OUTLINED_FUNCTION_55_0()
{
  *(unsigned char *)(v0 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return sub_26173BBB0();
}

BOOL sub_261738BB8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_261738BCC()
{
  return sub_26173BF10();
}

uint64_t sub_261738C14()
{
  return sub_26173BF10();
}

uint64_t sub_261738C54()
{
  return sub_26173BF10();
}

uint64_t sub_261738C94()
{
  return OUTLINED_FUNCTION_2_4();
}

uint64_t sub_261738CB4()
{
  return sub_26173BF00();
}

uint64_t sub_261738CDC()
{
  return sub_26173BF00();
}

uint64_t sub_261738D0C()
{
  return sub_26173BF10();
}

uint64_t sub_261738D4C()
{
  return sub_26173BF10();
}

uint64_t sub_261738D88()
{
  return sub_26173BF10();
}

uint64_t WK2_Metadata.init(_:o:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(_DWORD *)(a5 + 24) = a4;
  return result;
}

uint64_t static WK2_SourceType.byteSize.getter()
{
  return 1;
}

uint64_t WK2_SourceType.value.getter()
{
  return *v0;
}

void static WK2_SourceType.max.getter(unsigned char *a1@<X8>)
{
}

void static WK2_SourceType.min.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

WeatherData::WK2_SourceType_optional __swiftcall WK2_SourceType.init(rawValue:)(Swift::UInt8 rawValue)
{
  OUTLINED_FUNCTION_52(v1);
  return result;
}

uint64_t sub_261738E08()
{
  return sub_261738C54();
}

uint64_t sub_261738E24()
{
  return sub_261738D4C();
}

WeatherData::WK2_SourceType_optional sub_261738E40(Swift::UInt8 *a1)
{
  return WK2_SourceType.init(rawValue:)(*a1);
}

uint64_t sub_261738E48@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = WK2_SourceType.value.getter();
  *a1 = result;
  return result;
}

uint64_t WK2_Metadata.__buffer.getter()
{
  return swift_retain();
}

void *WK2_Metadata.attributionUrlSegmentArray.getter()
{
  return sub_261716140((void *)4, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *WK2_Metadata.languageSegmentArray.getter()
{
  return sub_261716140((void *)8, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *WK2_Metadata.providerLogoSegmentArray.getter()
{
  return sub_261716140((void *)0xE, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void *WK2_Metadata.providerNameSegmentArray.getter()
{
  return sub_261716140((void *)0x10, *(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void static WK2_Metadata.add(attributionUrl:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v2) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v4 != v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v6))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v9) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    if (!v10)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v11 = OUTLINED_FUNCTION_2();
  if (v4 != v5) {
    OUTLINED_FUNCTION_84(v11);
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_16();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v12);
  if (!v10 & v13) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32))
    {
      OUTLINED_FUNCTION_48(v14);
      *(_WORD *)(v16 + 4) = 4;
    }
    OUTLINED_FUNCTION_111(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (v18 <= 4) {
      LOWORD(v18) = 4;
    }
    *(_WORD *)(v17 + 64) = v18;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Metadata.add(language:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v2) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v4 != v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v6))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v9) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    if (!v10)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v11 = OUTLINED_FUNCTION_2();
  if (v4 != v5) {
    OUTLINED_FUNCTION_84(v11);
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_16();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v12);
  if (!v10 & v13) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32))
    {
      OUTLINED_FUNCTION_48(v14);
      *(_WORD *)(v16 + 4) = 8;
    }
    OUTLINED_FUNCTION_111(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (v18 <= 8) {
      LOWORD(v18) = 8;
    }
    *(_WORD *)(v17 + 64) = v18;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Metadata.add(providerLogo:_:)()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_85();
  if (!v2) {
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_49();
  if (v4 != v5) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v6 = *(void *)(v0 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (HIDWORD(v6))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  Swift::Int v7 = OUTLINED_FUNCTION_0(v3, v6);
  if (v4 != v5) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v7, v8, *(void *)(v0 + 24));
  }
  OUTLINED_FUNCTION_83();
  if (v9) {
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_82();
  if (v10)
  {
    OUTLINED_FUNCTION_17();
    if (!v10)
    {
LABEL_28:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  Swift::Int v11 = OUTLINED_FUNCTION_2();
  if (v4 != v5) {
    OUTLINED_FUNCTION_84(v11);
  }
  *(void *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_16();
  if (v4 != v5)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v1 + 32);
  }
  OUTLINED_FUNCTION_9(v12);
  if (!v10 & v13) {
LABEL_32:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v15 & 1) == 0)
  {
    if (*(void *)(v14 + 32))
    {
      OUTLINED_FUNCTION_48(v14);
      *(_WORD *)(v16 + 4) = 14;
    }
    OUTLINED_FUNCTION_111(v14, *(int64x2_t *)(v14 + 72), (int64x2_t)xmmword_26173C130);
    if (v18 <= 0xE) {
      LOWORD(v18) = 14;
    }
    *(_WORD *)(v17 + 64) = v18;
    goto LABEL_28;
  }
  __break(1u);
}

void static WK2_Metadata.add(reportedTime:_:)()
{
  OUTLINED_FUNCTION_22();
  if ((v1 & 0x100000000) != 0)
  {
LABEL_19:
    OUTLINED_FUNCTION_20();
    return;
  }
  uint64_t v3 = v2;
  int v4 = v1;
  if ((uint64_t)v2[8] <= 3) {
    OUTLINED_FUNCTION_6();
  }
  unint64_t v5 = v3[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (HIDWORD(v5))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v6 = (-*((_DWORD *)v3 + 4) & 3) + v5;
  uint64_t v7 = v3[1];
  OUTLINED_FUNCTION_12();
  if (v10 != v11) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v8, v9, v3[3]);
  }
  OUTLINED_FUNCTION_25();
  if (v10 != v11)
  {
    OUTLINED_FUNCTION_18();
    uint64_t v12 = *(void *)(v7 + 32);
  }
  *(_DWORD *)(v12 - v6 + *(void *)(v7 + 24) - 4) = v4;
  v3[2] = v0;
  if (v6 > 0xFFFFFFFB) {
LABEL_22:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v14 & 1) == 0)
  {
    if (*(void *)(v13 + 32))
    {
      OUTLINED_FUNCTION_81(v13);
      *(_WORD *)(v15 + 4) = 20;
    }
    OUTLINED_FUNCTION_111(v13, *(int64x2_t *)(v13 + 72), (int64x2_t)xmmword_26173C130);
    if (v17 <= 0x14) {
      LOWORD(v17) = 20;
    }
    *(_WORD *)(v16 + 64) = v17;
    goto LABEL_19;
  }
  __break(1u);
}

void static WK2_Metadata.add(sourceType:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v1 = v0;
  char v3 = *v2;
  if (!*v2)
  {
    OUTLINED_FUNCTION_17();
    if (!v4)
    {
LABEL_21:
      OUTLINED_FUNCTION_20();
      return;
    }
  }
  if ((uint64_t)v1[8] <= 0)
  {
    v1[8] = 1;
    v1[3] = 1;
  }
  unint64_t v5 = v1[2];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(v5))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = v1[1];
  OUTLINED_FUNCTION_16();
  if (v7 != v8) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(0, v5, v1[3]);
  }
  v1[2] = v5;
  OUTLINED_FUNCTION_16();
  if (v7 ^ v8 | v4)
  {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v5, v1[3]);
    uint64_t v9 = *(void *)(v6 + 32);
  }
  *(unsigned char *)(*(void *)(v6 + 24) + v9 + ~v5) = v3;
  v1[2] = v5 + 1;
  if (v5 > 0xFFFFFFFE) {
LABEL_24:
  }
    __break(1u);
  OUTLINED_FUNCTION_13();
  if ((v11 & 1) == 0)
  {
    if (*(void *)(v10 + 32))
    {
      OUTLINED_FUNCTION_81(v10);
      *(_WORD *)(v12 + 4) = 24;
    }
    OUTLINED_FUNCTION_111(v10, *(int64x2_t *)(v10 + 72), (int64x2_t)xmmword_26173C130);
    if (v14 <= 0x18) {
      LOWORD(v14) = 24;
    }
    *(_WORD *)(v13 + 64) = v14;
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t static WK2_Metadata.createMetadata(_:attributionUrlOffset:expireTime:languageOffset:latitude:longitude:providerLogoOffset:providerNameOffset:readTime:reportedTime:temporarilyUnavailable:sourceType:)@<X0>(unint64_t a1@<X0>, int *a2@<X1>, int *a3@<X3>, int *a4@<X4>, int *a5@<X5>, uint64_t a6@<X8>, float a7@<S0>, float a8@<S1>, uint64_t a9, char *a10)
{
  int v13 = *a2;
  int v14 = *a3;
  int v15 = *a4;
  int v16 = *a5;
  char v17 = *a10;
  unint64_t v18 = static WK2_Metadata.startMetadata(_:)(a1);
  HIDWORD(v64) = v18;
  OUTLINED_FUNCTION_27_1(v18, v19, v20, v21, v22, v23, v24, v25, v59, v64, a6, v76, v13);
  static WK2_Metadata.add(attributionUrl:_:)();
  static WK2_Metadata.add(expireTime:_:)();
  OUTLINED_FUNCTION_27_1(v26, v27, v28, v29, v30, v31, v32, v33, v60, v65, v71, v77, v14);
  static WK2_Metadata.add(language:_:)();
  static WK2_Metadata.add(latitude:_:)(a1, a7);
  static WK2_Metadata.add(longitude:_:)(a1, a8);
  OUTLINED_FUNCTION_27_1(v34, v35, v36, v37, v38, v39, v40, v41, v61, v66, v72, v78, v15);
  static WK2_Metadata.add(providerLogo:_:)();
  OUTLINED_FUNCTION_27_1(v42, v43, v44, v45, v46, v47, v48, v49, v62, v67, v73, v79, v16);
  static WK2_Metadata.add(providerName:_:)();
  static WK2_Metadata.add(readTime:_:)();
  static WK2_Metadata.add(reportedTime:_:)();
  static WK2_Metadata.add(temporarilyUnavailable:_:)();
  OUTLINED_FUNCTION_27_1(v50, v51, v52, v53, v54, v55, v56, v57, v63, v68, v74, v80, v17);
  static WK2_Metadata.add(sourceType:_:)();
  uint64_t result = FlatBufferBuilder.endTable(at:)(at);
  *uint64_t v75 = result;
  return result;
}

void static WK2_Metadata.verify<A>(_:at:of:)(int a1, unint64_t position)
{
  Verifier.visitTable(at:)(position, (uint64_t)&v29);
  if (!v2)
  {
    OUTLINED_FUNCTION_29_1();
    uint64_t v3 = v31;
    if (v31 >= 7)
    {
      uint64_t v4 = v30 + 6;
      OUTLINED_FUNCTION_86();
      if (v5)
      {
        OUTLINED_FUNCTION_11();
        if (v6) {
          goto LABEL_52;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v7)
      {
        OUTLINED_FUNCTION_26();
        if (v8 == 1)
        {
LABEL_11:
          uint64_t v34 = MEMORY[0x263F8E8F8];
          uint64_t v9 = &qword_26A92AB80;
LABEL_53:
          __swift_instantiateConcreteTypeFromMangledName(v9);
          uint64_t v24 = sub_26173BC20();
          uint64_t v26 = v25;
          sub_2617295E0();
          swift_allocError();
          *(void *)uint64_t v27 = v4;
          *(void *)(v27 + 8) = v24;
          *(void *)(v27 + 16) = v26;
          *(_OWORD *)(v27 + 24) = 0u;
          *(_OWORD *)(v27 + 40) = 0u;
          *(_OWORD *)(v27 + 49) = 0u;
          swift_willThrow();
          goto LABEL_3;
        }
        OUTLINED_FUNCTION_31();
      }
    }
    OUTLINED_FUNCTION_29_1();
    if (v3 >= 11)
    {
      uint64_t v4 = v30 + 10;
      OUTLINED_FUNCTION_86();
      if (v5)
      {
        OUTLINED_FUNCTION_11();
        if (v10) {
          goto LABEL_52;
        }
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v11)
      {
        OUTLINED_FUNCTION_26();
        if (v12 == 1)
        {
LABEL_19:
          uint64_t v34 = MEMORY[0x263F8D5C8];
          uint64_t v9 = &qword_26A92AB88;
          goto LABEL_53;
        }
        OUTLINED_FUNCTION_31();
      }
      if ((unint64_t)v3 > 0xC)
      {
        uint64_t v4 = v30 + 12;
        OUTLINED_FUNCTION_86();
        if (v5)
        {
          OUTLINED_FUNCTION_11();
          if (v13) {
            goto LABEL_52;
          }
        }
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v14)
        {
          OUTLINED_FUNCTION_26();
          if (v15 == 1) {
            goto LABEL_19;
          }
          OUTLINED_FUNCTION_31();
        }
      }
    }
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_29_1();
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_29_1();
    if (v3 < 19) {
      goto LABEL_3;
    }
    uint64_t v4 = v30 + 18;
    OUTLINED_FUNCTION_86();
    if (!v5 || (OUTLINED_FUNCTION_11(), (v16 & 1) == 0))
    {
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_33();
      if (v17)
      {
        OUTLINED_FUNCTION_26();
        if (v18 == 1) {
          goto LABEL_11;
        }
        OUTLINED_FUNCTION_31();
      }
      if ((unint64_t)v3 <= 0x14) {
        goto LABEL_3;
      }
      uint64_t v4 = v30 + 20;
      OUTLINED_FUNCTION_86();
      if (!v5 || (OUTLINED_FUNCTION_11(), (v19 & 1) == 0))
      {
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_33();
        if (v20)
        {
          OUTLINED_FUNCTION_26();
          if (v21 == 1) {
            goto LABEL_11;
          }
          OUTLINED_FUNCTION_31();
        }
        if ((unint64_t)v3 > 0x16)
        {
          uint64_t v4 = v30 + 22;
          if (v32 != 1 || (OUTLINED_FUNCTION_11(), (v22 & 1) == 0))
          {
            OUTLINED_FUNCTION_10();
            if (*(_WORD *)(*(void *)(v33 + 24) + v4)) {
              OUTLINED_FUNCTION_4(*(unsigned __int16 *)(*(void *)(v33 + 24) + v4), v28, v29);
            }
            if ((unint64_t)v3 <= 0x18) {
              goto LABEL_3;
            }
            uint64_t v4 = v30 + 24;
            if (v32 != 1 || (OUTLINED_FUNCTION_11(), (v23 & 1) == 0))
            {
              OUTLINED_FUNCTION_10();
              if (*(_WORD *)(*(void *)(v33 + 24) + v4)) {
                OUTLINED_FUNCTION_4(*(unsigned __int16 *)(*(void *)(v33 + 24) + v4), v28, v29);
              }
              goto LABEL_3;
            }
          }
          goto LABEL_52;
        }
LABEL_3:
        swift_release();
        return;
      }
    }
LABEL_52:
    uint64_t v34 = MEMORY[0x263F8E888];
    uint64_t v9 = &qword_26A92AB70;
    goto LABEL_53;
  }
}

void sub_26173999C(int a1, unint64_t a2)
{
}

unint64_t sub_2617399BC()
{
  unint64_t result = qword_26A92AE90;
  if (!qword_26A92AE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A92AE90);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WK2_SourceType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WK2_SourceType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261739B5CLL);
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

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_26173BF00();
}

uint64_t static FlatBuffersUtils.getSizePrefix(bb:)(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(void *)(a1 + 24) + *(void *)(a1 + 32) - a2);
}

uint64_t static FlatBuffersUtils.removeSizePrefix(bb:)(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  size_t v2 = *(void *)(a1 + 32);
  type metadata accessor for ByteBuffer.Storage();
  swift_allocObject();
  uint64_t v3 = ByteBuffer.Storage.init(count:alignment:)(v2);
  ByteBuffer.Storage.copy(from:count:)(v1, v2);
  return v3;
}

ValueMetadata *type metadata accessor for FlatBuffersUtils()
{
  return &type metadata for FlatBuffersUtils;
}

void sub_261739C38(void *a1@<X0>, unint64_t a2@<X8>)
{
  String.encode(using:)(a1, *v2, v2[1], a2);
}

uint64_t dispatch thunk of FlatbufferEncodable.encode(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

void OUTLINED_FUNCTION_10_1(Swift::Int a1)
{
  Swift::Int v4 = *(void *)(v1 + 24);
  ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(a1, v2, v4);
}

uint64_t Verifier.isAligned<A>(position:type:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)v3 == 1)
  {
    uint64_t v4 = result;
    if ((*(unsigned char *)(*(void *)(a3 - 8) + 80) & (*(unsigned char *)(*(void *)(v3 + 40) + 24) + result)) != 0)
    {
      swift_getMetatypeMetadata();
      uint64_t v5 = OUTLINED_FUNCTION_229();
      sub_2617295E0();
      uint64_t v6 = OUTLINED_FUNCTION_44();
      *BOOL v7 = v4;
      v7[1] = v5;
      return OUTLINED_FUNCTION_2_5(v6, (uint64_t)v7);
    }
  }
  return result;
}

void Verifier.inBuffer<A>(position:of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Verifier.isAligned<A>(position:type:)(a1, a2, a3);
  if (!v3) {
    Verifier.rangeInBuffer(position:size:)(a1, *(void *)(*(void *)(a3 - 8) + 64));
  }
}

uint64_t Verifier.init(buffer:options:checkAlignment:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)(v5 + 32);
  if (v6 > 3221225471)
  {
    sub_2617295E0();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_0_5(v10, 2);
    *(unsigned char *)(v11 + 64) = v12;
    return swift_willThrow();
  }
  else
  {
    char v7 = *(unsigned char *)(a2 + 12);
    int v8 = *(_DWORD *)(a2 + 8);
    *(unsigned char *)a4 = a3 & 1;
    *(void *)(a4 + 8) = v6;
    *(_DWORD *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    *(void *)(a4 + 32) = 0;
    *(void *)(a4 + 40) = v5;
    *(_OWORD *)(a4 + 48) = *(_OWORD *)(a1 + 1);
    *(void *)(a4 + 64) = *(void *)a2;
    *(_DWORD *)(a4 + 72) = v8;
    *(unsigned char *)(a4 + 76) = v7;
    return swift_retain();
  }
}

Swift::Void __swiftcall Verifier.reset()()
{
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
}

uint64_t destroy for Verifier()
{
  return swift_release();
}

uint64_t initializeWithCopy for Verifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 69) = *(void *)(a2 + 69);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Verifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 76) = *(unsigned char *)(a2 + 76);
  return a1;
}

void *__swift_memcpy77_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x4DuLL);
}

uint64_t assignWithTake for Verifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 76) = *(unsigned char *)(a2 + 76);
  return a1;
}

uint64_t getEnumTagSinglePayload for Verifier(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 77))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for Verifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 76) = 0;
    *(_DWORD *)(result + 72) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 77) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 77) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Verifier()
{
  return &type metadata for Verifier;
}

uint64_t ByteBuffer.read<A>(def:position:)()
{
  sub_26173B7EC();
  return sub_26173BDA0();
}

uint64_t ByteBuffer.readString(at:count:type:)(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_26173BC10();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = sub_261702AB8((const void *)(*(void *)(a4 + 24) + a1), a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a3, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B410988);
  sub_261702B48();
  uint64_t v14 = sub_26173BBF0();
  swift_release();
  return v14;
}

uint64_t ByteBuffer.reader.getter(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) - a2;
}

uint64_t ByteBuffer.memory.getter(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

unint64_t ByteBuffer.size.getter(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a2))
  {
    return a2;
  }
  __break(1u);
  return result;
}

uint64_t ByteBuffer.capacity.getter(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void *ByteBuffer.underlyingBytes.getter(uint64_t a1, int64_t a2)
{
  return sub_261702AB8((const void *)(*(void *)(a1 + 24) + *(void *)(a1 + 32) - a2), a2);
}

Swift::Void __swiftcall ByteBuffer.clear()()
{
  *(_OWORD *)(v0 + 8) = xmmword_26173E9E0;
  bzero(*(void **)(*(void *)v0 + 24), *(void *)(*(void *)v0 + 32));
}

Swift::Void __swiftcall ByteBuffer.push(string:len:)(Swift::String string, Swift::Int len)
{
  uint64_t v3 = v2;
  unint64_t object = (unint64_t)string._object;
  unint64_t countAndFlagsBits = string._countAndFlagsBits;
  v22[3] = *MEMORY[0x263EF8340];
  Swift::Int v7 = v2[1];
  if (*(void *)(*v2 + 32) < v7 + len) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(len, v7, v2[2]);
  }
  swift_bridgeObjectRetain();
  int v8 = sub_261714FB0(countAndFlagsBits, object, v2, len);
  swift_bridgeObjectRelease();
  if (v8 != 2) {
    return;
  }
  unint64_t v9 = (object & 0x2000000000000000) != 0 ? HIBYTE(object) & 0xF : countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (!v9) {
    return;
  }
  uint64_t v10 = (countAndFlagsBits >> 59) & 1;
  if ((object & 0x1000000000000000) == 0) {
    LODWORD(v10) = 1;
  }
  uint64_t v11 = 11;
  if (v10) {
    uint64_t v11 = 7;
  }
  unint64_t v12 = v11 | (v9 << 16);
  uint64_t v13 = 4 << v10;
  swift_bridgeObjectRetain();
  while (1)
  {
    if ((v12 & 0xC) != v13)
    {
      if ((object & 0x1000000000000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    unint64_t v14 = sub_26172DB28(v12, countAndFlagsBits, object);
    if (v14 < 0x4000) {
      break;
    }
    unint64_t v12 = v14;
    if ((object & 0x1000000000000000) == 0)
    {
LABEL_15:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) - 65532;
      goto LABEL_20;
    }
LABEL_18:
    if (v9 < v12 >> 16) {
      __break(1u);
    }
    unint64_t v12 = sub_26173BC60();
LABEL_20:
    unint64_t v15 = v12;
    if ((v12 & 0xC) == v13) {
      unint64_t v15 = sub_26172DB28(v12, countAndFlagsBits, object);
    }
    unint64_t v16 = v15 >> 16;
    if (v15 >> 16 >= v9) {
      goto LABEL_36;
    }
    if ((object & 0x1000000000000000) != 0)
    {
      char v18 = sub_26173BC80();
    }
    else if ((object & 0x2000000000000000) != 0)
    {
      v22[0] = countAndFlagsBits;
      v22[1] = object & 0xFFFFFFFFFFFFFFLL;
      char v18 = *((unsigned char *)v22 + v16);
    }
    else
    {
      uint64_t v17 = (object & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((countAndFlagsBits & 0x1000000000000000) == 0) {
        uint64_t v17 = sub_26173BDE0();
      }
      char v18 = *(unsigned char *)(v17 + v16);
    }
    Swift::Int v19 = *v3;
    Swift::Int v20 = v3[1];
    Swift::Int v21 = *(void *)(*v3 + 32);
    if (v21 < v20 + 1)
    {
      ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(1, v3[1], v3[2]);
      Swift::Int v21 = *(void *)(v19 + 32);
    }
    *(unsigned char *)(*(void *)(v19 + 24) + v21 + ~v20) = v18;
    v3[1] = v20 + 1;
    if (!(v12 >> 14)) {
      goto LABEL_37;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall ByteBuffer.fill(padding:)(Swift::Int padding)
{
  Swift::Int v2 = v1[1];
  Swift::Int v3 = v2 + padding;
  if (*(void *)(*v1 + 32) < v2 + padding) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(padding, v2, v1[2]);
  }
  v1[1] = v3;
}

Swift::Void __swiftcall ByteBuffer.pop(_:)(Swift::Int a1)
{
  bzero((void *)(*(void *)(*v1 + 24) + *(void *)(*v1 + 32) - v1[1]), v1[1] - a1);
  v1[1] = a1;
}

uint64_t ByteBuffer.push<A>(elements:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v3 = *(void *)(*(void *)(a2 - 8) + 64) * MEMORY[0x263E3E9F0]();
  Swift::Int v4 = v2[1];
  if (*(void *)(*v2 + 32) < v3 + v4) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v3, v4, v2[2]);
  }
  sub_26173BD30();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v5 = sub_26173BBB0();
  MEMORY[0x270FA5388](v5);
  sub_26173BE60();
  swift_getWitnessTable();
  sub_26173BCB0();
  return swift_bridgeObjectRelease();
}

uint64_t ByteBuffer.push<A>(value:len:)(uint64_t a1, size_t a2, uint64_t a3)
{
  return sub_26173A76C(a1, a2, a3);
}

uint64_t ByteBuffer.push<A>(struct:size:)(uint64_t a1, size_t a2, uint64_t a3)
{
  return sub_26173A76C(a1, a2, a3);
}

uint64_t sub_26173A76C(uint64_t a1, size_t a2, uint64_t a3)
{
  Swift::Int v4 = v3;
  v18[1] = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = v3;
  uint64_t v14 = *v3;
  Swift::Int v13 = v15[1];
  size_t v16 = v13 + a2;
  if (*(void *)(v14 + 32) < (int64_t)(v13 + a2)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(a2, v13, v4[2]);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, a3);
  memcpy((void *)(*(void *)(v14 + 24) + *(void *)(v14 + 32) - v16), v12, a2);
  v4[1] = v16;
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a3);
}

uint64_t ByteBuffer.duplicate(removing:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v2 = *(const void **)(a2 + 24);
  size_t v3 = *(void *)(a2 + 32);
  type metadata accessor for ByteBuffer.Storage();
  uint64_t v4 = OUTLINED_FUNCTION_2_6();
  uint64_t result = ByteBuffer.Storage.init(count:alignment:)(v3);
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    memmove(*(void **)(v4 + 24), v2, v3);
    return v4;
  }
  return result;
}

uint64_t ByteBuffer.Storage.__allocating_init(count:alignment:)(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_6();
  ByteBuffer.Storage.init(count:alignment:)(a1);
  return v2;
}

uint64_t ByteBuffer.Storage.__allocating_init(memory:capacity:unowned:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = OUTLINED_FUNCTION_2_6();
  *(void *)(result + 24) = a1;
  *(void *)(result + 32) = a2;
  *(unsigned char *)(result + 16) = a3;
  return result;
}

uint64_t ByteBuffer.Storage.init(memory:capacity:unowned:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  *(unsigned char *)(v3 + 16) = a3;
  return v3;
}

uint64_t ByteBuffer._storage.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*ByteBuffer._storage.modify())()
{
  return nullsub_1;
}

uint64_t ByteBuffer.init(bytes:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for ByteBuffer.Storage();
  uint64_t v3 = OUTLINED_FUNCTION_2_6();
  swift_bridgeObjectRetain();
  ByteBuffer.Storage.init(count:alignment:)(v2);
  uint64_t v4 = (char *)a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_26173B024(a1);
  }
  memmove(*(void **)(v3 + 24), v4 + 32, *(void *)(a1 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t ByteBuffer.init<A>(contiguousBytes:count:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ByteBuffer.Storage();
  uint64_t v6 = OUTLINED_FUNCTION_2_6();
  ByteBuffer.Storage.init(count:alignment:)(a2);
  sub_26173BB10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v6;
}

void *sub_26173AB84(void *__src, uint64_t a2, uint64_t a3)
{
  if (__src)
  {
    if (a2 - (uint64_t)__src >= 0) {
      return memmove(*(void **)(*(void *)a3 + 24), __src, a2 - (void)__src);
    }
    __break(1u);
  }
  __break(1u);
  return __src;
}

uint64_t ByteBuffer.init(assumingMemoryBound:capacity:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ByteBuffer.Storage();
  uint64_t result = OUTLINED_FUNCTION_2_6();
  *(void *)(result + 24) = a1;
  *(void *)(result + 32) = a2;
  *(unsigned char *)(result + 16) = 1;
  return result;
}

Swift::Int __swiftcall ByteBuffer.ensureSpace(size:)(Swift::Int size)
{
  Swift::Int v3 = v1[1];
  if (*(void *)(*v1 + 32) < v3 + size) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(size, v3, v1[2]);
  }
  return size;
}

uint64_t sub_26173AC38(uint64_t a1, void *a2, uint64_t a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  size_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v10);
  Swift::Int v12 = *(void *)(v11 + 8);
  uint64_t v13 = *a2;
  size_t v14 = v12 + v9;
  if (*(void *)(*a2 + 32) < (int64_t)(v12 + v9)) {
    ByteBuffer.Storage.reallocate(_:writerSize:alignment:)(v9, v12, a2[2]);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  memcpy((void *)(*(void *)(v13 + 24) + *(void *)(v13 + 32) - v14), (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a2[1] = v14;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
}

uint64_t ByteBuffer.push(bytes:len:)(uint64_t __src, uint64_t a2, size_t a3)
{
  if (__src)
  {
    size_t v4 = v3[1] + a3;
    memcpy((void *)(*(void *)(*v3 + 24) + *(void *)(*v3 + 32) - v4), (const void *)__src, a3);
    v3[1] = v4;
    return 1;
  }
  else
  {
    __break(1u);
  }
  return __src;
}

Swift::Void __swiftcall ByteBuffer.clearSize()()
{
  *(void *)(v0 + 8) = 0;
}

uint64_t ByteBuffer.readSlice<A>(index:count:)()
{
  return sub_26173BD40();
}

Swift::Int32 __swiftcall ByteBuffer.skipPrefix()()
{
  uint64_t v1 = *v0;
  v0[1] -= 4;
  return **(_DWORD **)(v1 + 24);
}

uint64_t ByteBuffer.debugDescription.getter()
{
  return 0;
}

uint64_t sub_26173B01C()
{
  return ByteBuffer.debugDescription.getter();
}

char *sub_26173B024(uint64_t a1)
{
  return sub_261738138(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_26173B038(void *a1, uint64_t a2)
{
  return sub_26173AB84(a1, a2, *(void *)(v2 + 16));
}

ValueMetadata *type metadata accessor for ByteBuffer()
{
  return &type metadata for ByteBuffer;
}

uint64_t method lookup function for ByteBuffer.Storage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ByteBuffer.Storage);
}

uint64_t dispatch thunk of ByteBuffer.Storage.__allocating_init(count:alignment:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ByteBuffer.Storage.__allocating_init(memory:capacity:unowned:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t getPrefixedSizeCheckedRoot<A>(byteBuffer:fileId:options:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  a1[1] -= 4;
  return OUTLINED_FUNCTION_1_6(a1, a2, a3, a5, a6, a7, a8, *a4, v9, *(int *)v10, v10[4]);
}

uint64_t *getCheckedPrefixedSizeRoot<A>(byteBuffer:fileId:options:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  double v8 = *a4;
  uint64_t v9 = result[1] - 4;
  result[1] = v9;
  if (v9 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (HIDWORD(v9))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  int v10 = **(_DWORD **)(*result + 24);
  if ((v10 & 0x80000000) == 0 && v10 == v9) {
    return (uint64_t *)OUTLINED_FUNCTION_1_6(result, a2, a3, a5, a6, a7, a8, v8, v12, *(int *)v13, v13[4]);
  }
  sub_2617295E0();
  swift_allocError();
  return (uint64_t *)OUTLINED_FUNCTION_0_6(v11, 1);
}

uint64_t getPrefixedSizeRoot<A>(byteBuffer:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  a1[1] -= 4;
  return getRoot<A>(byteBuffer:)(a1, a2, a3);
}

uint64_t getRoot<A>(byteBuffer:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *(void *)(result + 32) - v5;
  int v7 = *(_DWORD *)(*(void *)(result + 24) + v6);
  if (v7 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v6 > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = (v7 + v6);
  if (!__OFADD__(v7, v6))
  {
    uint64_t v10 = a1[2];
    uint64_t v11 = *(void *)(a3 + 8);
    double v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8);
    uint64_t v13 = swift_retain();
    return v12(v13, v5, v10, v8, a2, v11);
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t dispatch thunk of FlatbuffersInitializable.init(_:o:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of FlatBufferObject.__buffer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static ObjectAPIPacker.pack(_:obj:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ObjectAPIPacker.unpack()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t FlatBufferMaxSize.getter()
{
  return 3221225472;
}

uint64_t Scalar<>.convertedEndian.getter(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getAssociatedTypeWitness();
  return swift_dynamicCast();
}

void sub_26173B3B4(void *a1@<X8>)
{
  Double.convertedEndian.getter();
  *a1 = v2;
}

void sub_26173B3E8(_DWORD *a1@<X8>)
{
  Float.convertedEndian.getter();
  *a1 = v2;
}

uint64_t Bool.convertedEndian.getter(char a1)
{
  return a1 & 1;
}

uint64_t sub_26173B41C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = Bool.convertedEndian.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_26173B448@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_26173B474@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_26173B4A0@<X0>(_WORD *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_26173B4CC@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of Scalar.convertedEndian.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t Struct.bb.getter()
{
  return swift_retain();
}

uint64_t sub_26173B54C()
{
  return *(unsigned int *)(v0 + 24);
}

uint64_t Struct.postion.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t Struct.readBuffer<A>(of:at:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (__OFADD__(a2, a6))
  {
    __break(1u);
  }
  else
  {
    sub_26173B7EC();
    return sub_26173BDA0();
  }
  return result;
}

ValueMetadata *type metadata accessor for Struct()
{
  return &type metadata for Struct;
}

Swift::Int32 __swiftcall Table.offset(_:)(Swift::Int32 result)
{
  uint64_t v3 = *(void *)(v1 + 24);
  int v4 = *(_DWORD *)(v3 + v2);
  BOOL v5 = __OFSUB__(v2, v4);
  int v6 = v2 - v4;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    if (*(unsigned __int16 *)(v3 + v6) <= result) {
      return 0;
    }
    BOOL v5 = __OFADD__(v6, result);
    Swift::Int32 v7 = v6 + result;
    if (!v5) {
      return *(__int16 *)(v3 + v7);
    }
  }
  __break(1u);
  return result;
}

Swift::Int32 __swiftcall Table.indirect(_:)(Swift::Int32 a1)
{
  int v2 = *(_DWORD *)(*(void *)(v1 + 24) + a1);
  BOOL v3 = __OFADD__(a1, v2);
  Swift::Int32 result = a1 + v2;
  if (v3) {
    __break(1u);
  }
  return result;
}

uint64_t Table.readBuffer<A>(of:at:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (!__OFADD__(a2, a6)) {
    return sub_26173BDA0();
  }
  __break(1u);
  return result;
}

Swift::Int32 __swiftcall Table.vector(count:)(Swift::Int32 count)
{
  Swift::Int32 v3 = count + v2;
  if (__OFADD__(count, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(v1 + 24);
    int v5 = *(_DWORD *)(v4 + v3);
    BOOL v6 = __OFADD__(v3, v5);
    Swift::Int32 v7 = v3 + v5;
    if (!v6) {
      return *(_DWORD *)(v4 + v7);
    }
  }
  __break(1u);
  return count;
}

Swift::Int32 __swiftcall Table.vector(at:)(Swift::Int32 at)
{
  Swift::Int32 v3 = at + v2;
  if (__OFADD__(at, v2))
  {
    __break(1u);
    goto LABEL_6;
  }
  int v4 = *(_DWORD *)(*(void *)(v1 + 24) + v3);
  BOOL v5 = __OFADD__(v3, v4);
  Swift::Int32 v6 = v3 + v4;
  if (v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  Swift::UInt32 at = v6 + 4;
  if (__OFADD__(v6, 4)) {
LABEL_7:
  }
    __break(1u);
  return at;
}

Swift::String_optional __swiftcall Table.string(at:)(Swift::Int32 at)
{
  BOOL v2 = __OFADD__(at, v1);
  uint64_t countAndFlagsBits = (at + v1);
  if (v2)
  {
    __break(1u);
  }
  else
  {
    Swift::String_optional v5 = Table.directString(at:)(countAndFlagsBits);
    unint64_t object = v5.value._object;
    uint64_t countAndFlagsBits = v5.value._countAndFlagsBits;
  }
  result.value._unint64_t object = object;
  result.value._uint64_t countAndFlagsBits = countAndFlagsBits;
  return result;
}

uint64_t Table.getVector<A>(at:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5 = *(void *)(a2 + 24);
  int v6 = *(_DWORD *)(v5 + a5);
  BOOL v7 = __OFSUB__(a5, v6);
  int v8 = a5 - v6;
  if (v7)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(unsigned __int16 *)(v5 + v8) <= (int)result) {
    return 0;
  }
  BOOL v7 = __OFADD__(v8, result);
  int v9 = v8 + result;
  if (v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v10 = *(__int16 *)(v5 + v9);
  if (v10)
  {
    BOOL v7 = __OFADD__(v10, a5);
    int v11 = v10 + a5;
    if (!v7)
    {
      int v12 = *(_DWORD *)(v5 + v11);
      BOOL v7 = __OFADD__(v11, v12);
      int v13 = v11 + v12;
      if (!v7)
      {
        if (!__OFADD__(v13, 4))
        {
          sub_26173BBD0();
          sub_26173BBE0();
          swift_getWitnessTable();
          return sub_26173BD40();
        }
        goto LABEL_15;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      return result;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return 0;
}

uint64_t Table.directRead<A>(of:offset:)()
{
  return sub_26173BDA0();
}

uint64_t Table.bb.getter()
{
  return swift_retain();
}

uint64_t Table.postion.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t sub_26173B7EC()
{
  return 0;
}

uint64_t Table.union<A>(_:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v7 = __OFADD__(a1, a5);
  uint64_t result = (a1 + a5);
  if (!v7) {
    return Table.directUnion<A>(_:)(result, a2, a3, a4, a5, a6, a7);
  }
  __break(1u);
  return result;
}

uint64_t Table.directUnion<A>(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7 = *(_DWORD *)(*(void *)(a2 + 24) + (int)result);
  uint64_t v8 = (result + v7);
  if (__OFADD__(result, v7))
  {
    __break(1u);
  }
  else
  {
    int v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 8);
    uint64_t v14 = swift_retain();
    return v13(v14, a3, a4, v8, a6, a7);
  }
  return result;
}

uint64_t static Table.indirect(_:_:)(int a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 + 24) + a1);
  BOOL v3 = __OFADD__(a1, v2);
  uint64_t result = (a1 + v2);
  if (v3) {
    __break(1u);
  }
  return result;
}

uint64_t static Table.offset(_:vOffset:fbb:)(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 32);
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  BOOL v4 = __OFSUB__(v3, result);
  int v5 = v3 - result;
  if (v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int v6 = v5 + a2;
  if (__OFADD__(v5, a2))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = *(void *)(a3 + 24);
  int v8 = *(_DWORD *)(v7 + v5);
  BOOL v4 = __OFSUB__(v6, v8);
  int v9 = v6 - v8;
  if (v4)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  int v10 = *(__int16 *)(v7 + v9);
  uint64_t result = (v5 + v10);
  if (__OFADD__(v5, v10)) {
LABEL_13:
  }
    __break(1u);
  return result;
}

uint64_t static Table.compare(_:_:fbb:)(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 24);
  int v4 = *(_DWORD *)(v3 + (int)result);
  int v5 = result + v4;
  if (__OFADD__(result, v4))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int v6 = *(_DWORD *)(v3 + a2);
  int v7 = a2 + v6;
  if (__OFADD__(a2, v6))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  int v8 = v5 + 4;
  if (__OFADD__(v5, 4))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int v9 = v7 + 4;
  if (__OFADD__(v7, 4))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  int v10 = *(_DWORD *)(v3 + v5);
  int v11 = *(_DWORD *)(v3 + v7);
  if (v11 >= v10) {
    int v12 = v10;
  }
  else {
    int v12 = v11;
  }
  if (v12 < 0)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    return result;
  }
  int v13 = 0;
  while (1)
  {
    if (v13 == v12)
    {
      int v14 = 0;
    }
    else
    {
      if (v13 == 0x7FFFFFFF) {
        goto LABEL_26;
      }
      int v14 = v13 + 1;
    }
    if (__OFADD__(v13, v8))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    uint64_t result = (v13 + v9);
    if (__OFADD__(v13, v9)) {
      goto LABEL_25;
    }
    int v15 = *(unsigned __int8 *)(v3 + v13 + v8);
    uint64_t result = *(unsigned __int8 *)(v3 + (int)result);
    if (v15 != result) {
      break;
    }
    BOOL v16 = v13 == v12;
    int v13 = v14;
    if (v16)
    {
      uint64_t result = (v10 - v11);
      if (!__OFSUB__(v10, v11)) {
        return result;
      }
      __break(1u);
      break;
    }
  }
  int v17 = (char)result - (char)v15;
  uint64_t result = (char)(result - v15);
  if (result != v17) {
    goto LABEL_32;
  }
  return result;
}

uint64_t static Table.compare(_:_:fbb:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  int v6 = *(_DWORD *)(v5 + (int)result);
  int v7 = result + v6;
  if (__OFADD__(result, v6))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v8 = *(void *)(a2 + 16);
  if (v8 >> 31)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  int v9 = v7 + 4;
  if (__OFADD__(v7, 4))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int v10 = *(_DWORD *)(v5 + v7);
  if (v10 >= (int)v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v10;
  }
  if ((v11 & 0x80000000) != 0) {
    goto LABEL_28;
  }
  if (v11)
  {
    uint64_t v12 = 0;
    while (v11 != v12)
    {
      if (__OFADD__(v12, v9)) {
        goto LABEL_23;
      }
      if (v8 == v12) {
        goto LABEL_24;
      }
      int v3 = *(char *)(v5 + (int)v12 + v9);
      int v4 = *(char *)(a2 + 32 + v12);
      if (v3 < 0 || v3 != v4) {
        goto LABEL_19;
      }
      if (v11 == ++v12) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_16:
  uint64_t result = (v10 - v8);
  if (__OFSUB__(v10, v8))
  {
    __break(1u);
LABEL_19:
    if (v4 < 0) {
      goto LABEL_29;
    }
    uint64_t result = (char)(v3 - v4);
    if (result != v3 - v4) {
LABEL_30:
    }
      __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for Table()
{
  return &type metadata for Table;
}

uint64_t sub_26173BAC0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_26173BAD0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_26173BAE0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_26173BAF0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_26173BB00()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_26173BB10()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_26173BB20()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_26173BB30()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_26173BB40()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_26173BB50()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_26173BB60()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_26173BB70()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_26173BB80()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_26173BB90()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_26173BBA0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_26173BBB0()
{
  return MEMORY[0x270F9D458]();
}

uint64_t sub_26173BBC0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_26173BBD0()
{
  return MEMORY[0x270F9D5A8]();
}

uint64_t sub_26173BBE0()
{
  return MEMORY[0x270F9D5C0]();
}

uint64_t sub_26173BBF0()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t sub_26173BC00()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_26173BC10()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_26173BC20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_26173BC30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26173BC40()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26173BC50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_26173BC60()
{
  return MEMORY[0x270F9D7F0]();
}

uint64_t sub_26173BC70()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_26173BC80()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_26173BC90()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_26173BCA0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_26173BCB0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_26173BCC0()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_26173BCD0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_26173BCE0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_26173BCF0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_26173BD00()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_26173BD10()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_26173BD20()
{
  return MEMORY[0x270F9DCC0]();
}

uint64_t sub_26173BD30()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_26173BD40()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_26173BD50()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_26173BD60()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_26173BD70()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_26173BD80()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_26173BD90()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_26173BDA0()
{
  return MEMORY[0x270F9E528]();
}

uint64_t sub_26173BDB0()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_26173BDC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_26173BDD0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_26173BDE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_26173BDF0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_26173BE00()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_26173BE10()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_26173BE20()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_26173BE30()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_26173BE40()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_26173BE60()
{
  return MEMORY[0x270F9F078]();
}

uint64_t sub_26173BE80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26173BE90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26173BEA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_26173BEB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_26173BEC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_26173BED0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_26173BEE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_26173BEF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26173BF00()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_26173BF10()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}