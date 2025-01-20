uint64_t PNROnDeviceProvisionalPNRIntervalDurationMetricReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  double v21;
  uint64_t result;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          v19 = *v3;
          v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
          {
            v21 = *(double *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            v21 = 0.0;
          }
          [a1 setMetricValue:v21];
          continue;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v3;
            v27 = *(void *)(a2 + v26);
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v15 = v24++ >= 9;
                if (v15)
                {
                  v30 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            v30 = 0;
          }
          else {
            v30 = v25;
          }
LABEL_45:
          [a1 setStartTimestamp:v30];
          continue;
        case 3u:
          v31 = PBReaderReadString();
          [a1 setStartTimestampEventName:v31];
          goto LABEL_40;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          break;
        case 5u:
          v31 = PBReaderReadString();
          [a1 setEndTimestampEventName:v31];
LABEL_40:

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(void *)(a2 + v35);
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)(a2 + *v4)) {
          break;
        }
        v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0) {
          goto LABEL_47;
        }
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v39 = 0;
          goto LABEL_50;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
      v39 = *(unsigned char *)(a2 + *v5) ? 0 : v34;
LABEL_50:
      [a1 setEndTimestamp:v39];
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PNROnDeviceProvisionalPnROnDeviceFrameworkWrapperReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 102) {
        break;
      }
      if ((v10 >> 3) == 101)
      {
        v17 = objc_alloc_init(PNROnDeviceProvisionalPnRSiriRequestGrainSummary);
        if (!PBReaderPlaceMark() || !PNROnDeviceProvisionalPnRSiriRequestGrainSummaryReadFrom(v17, a2)) {
          goto LABEL_31;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setSiriRequestGrainMetrics:", v17, 0, 0);
LABEL_26:

        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    v17 = objc_alloc_init(PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary);
    if (!PBReaderPlaceMark() || !PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummaryReadFrom(v17, a2))
    {
LABEL_31:

      return 0;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setSiriRequestGrainDebugSummary:", v17, 0, 0);
    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummaryReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 102) {
        break;
      }
      if ((v10 >> 3) == 100)
      {
        v17 = PBReaderReadString();
        [a1 setTurnId:v17];
LABEL_22:

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    v17 = PBReaderReadString();
    [a1 setErrorMessage:v17];
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PNROnDeviceProvisionalPnRSiriRequestGrainSummaryReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((int)(v10 >> 3) > 199)
      {
        if (v17 == 200)
        {
          v18 = objc_alloc_init(PNROnDeviceProvisionalPNRIntervalDurationMetric);
          if (!PBReaderPlaceMark()
            || (PNROnDeviceProvisionalPNRIntervalDurationMetricReadFrom(v18, a2) & 1) == 0)
          {

            return 0;
          }
          PBReaderRecallMark();
          objc_msgSend(a1, "setSrt:", v18, 0, 0);
          goto LABEL_29;
        }
        if (v17 == 300)
        {
          PBReaderReadString();
          v18 = (PNROnDeviceProvisionalPNRIntervalDurationMetric *)objc_claimAutoreleasedReturnValue();
          [a1 setError:v18];
          goto LABEL_29;
        }
      }
      else
      {
        if (v17 == 100)
        {
          PBReaderReadString();
          v18 = (PNROnDeviceProvisionalPNRIntervalDurationMetric *)objc_claimAutoreleasedReturnValue();
          [a1 setTurnId:v18];
          goto LABEL_29;
        }
        if (v17 == 101)
        {
          PBReaderReadString();
          v18 = (PNROnDeviceProvisionalPNRIntervalDurationMetric *)objc_claimAutoreleasedReturnValue();
          [a1 setRequestStatus:v18];
LABEL_29:

          continue;
        }
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

unint64_t sub_259ECD5A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8820);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259EFFBF0;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000259F02360;
  *(void *)(inited + 48) = sub_259EFEC80();
  *(void *)(inited + 56) = 0x6D614E726F727265;
  *(void *)(inited + 64) = 0xE900000000000065;
  *(void *)(inited + 72) = sub_259EFEC80();
  *(void *)(inited + 80) = 0x6E6F73616572;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = sub_259EFEC80();
  return sub_259ED3514(inited);
}

id sub_259ECD69C(uint64_t a1)
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_259ECDC30();
    v4 = (void *)sub_259EFEC20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

BOOL sub_259ECD728(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_259ECD73C(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_259ECD748(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_259ECD750@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_259ECD764(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_259ECD794(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_259ECD7A8(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_259ECD7BC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_259ECD7C8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_259ECD7D8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void _s20PnROnDeviceFramework20CoreAnalyticsServiceO017submitReliabilityF08category6reasonyAA0I8CategoryO_SStFZ_0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *a1;
  unint64_t v4 = 0xD000000000000018;
  unint64_t v5 = 0xD000000000000020;
  unint64_t v6 = 0x8000000259F02330;
  unint64_t v7 = 0x8000000259F01F20;
  switch(v3 >> 5)
  {
    case 1u:
      break;
    case 2u:
      if (v3) {
        unint64_t v4 = 0x5564616552535062;
      }
      else {
        unint64_t v4 = 0x4664616552535062;
      }
      if (v3) {
        unint64_t v7 = 0xEE006E776F6E6B6ELL;
      }
      else {
        unint64_t v7 = 0xED000064656C6961;
      }
      unint64_t v5 = 0xD000000000000011;
      unint64_t v10 = "BiomeStreamIssues";
      goto LABEL_26;
    case 3u:
      unint64_t v4 = 0xD00000000000002BLL;
      unint64_t v6 = 0x8000000259F022F0;
      unint64_t v7 = 0x8000000259F01F60;
      unint64_t v5 = 0xD000000000000010;
      switch(v3 & 0x1F)
      {
        case 1u:
          unint64_t v4 = 0xD000000000000020;
          unint64_t v6 = 0x8000000259F022F0;
          uint64_t v11 = "siriTurnGrainLatencyUploadFailed";
          goto LABEL_30;
        case 2u:
          unint64_t v4 = 0xD00000000000001ALL;
          unint64_t v6 = 0x8000000259F022F0;
          uint64_t v11 = "IERequestGrainUploadFailed";
          goto LABEL_30;
        case 3u:
          unint64_t v4 = 0xD00000000000001ALL;
          unint64_t v6 = 0x8000000259F022F0;
          uint64_t v11 = "IEPlannerGrainUploadFailed";
          goto LABEL_30;
        case 4u:
          unint64_t v4 = 0xD000000000000019;
          unint64_t v6 = 0x8000000259F022F0;
          uint64_t v11 = "IEActionGrainUploadFailed";
LABEL_30:
          unint64_t v7 = (unint64_t)(v11 - 32) | 0x8000000000000000;
          break;
        default:
          goto LABEL_31;
      }
      break;
    case 4u:
      if (v3) {
        unint64_t v4 = 0xD000000000000016;
      }
      else {
        unint64_t v4 = 0x45636972656E6567;
      }
      if (v3) {
        unint64_t v7 = 0x8000000259F02030;
      }
      else {
        unint64_t v7 = 0xEC000000726F7272;
      }
      unint64_t v5 = 0xD000000000000014;
      unint64_t v10 = "MetricsComputeIssues";
      goto LABEL_26;
    case 5u:
      unint64_t v5 = 0xD000000000000017;
      if (v3) {
        unint64_t v4 = 0xD000000000000015;
      }
      else {
        unint64_t v4 = 0xD000000000000017;
      }
      if (v3) {
        unint64_t v7 = 0x8000000259F02070;
      }
      else {
        unint64_t v7 = 0x8000000259F02050;
      }
      unint64_t v10 = "PnROnDeviceWorkerIssues";
LABEL_26:
      unint64_t v6 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v6 = 0xEA0000000000726FLL;
      unint64_t v5 = 0x727245796D6D7544;
      unint64_t v7 = 0xE900000000000072;
      unint64_t v4 = 0x6F72724574736574;
      break;
  }
LABEL_31:
  unint64_t v12 = (void *)sub_259EFEC80();
  char v13 = (void *)swift_allocObject();
  v13[2] = v5;
  v13[3] = v6;
  v13[4] = v4;
  v13[5] = v7;
  v13[6] = a2;
  v13[7] = a3;
  v15[4] = sub_259ECDC08;
  v15[5] = v13;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_259ECD69C;
  v15[3] = &block_descriptor;
  v14 = _Block_copy(v15);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);
}

ValueMetadata *type metadata accessor for CoreAnalyticsService()
{
  return &type metadata for CoreAnalyticsService;
}

void type metadata accessor for SISchemaUEIRequestType(uint64_t a1)
{
}

void type metadata accessor for SISchemaUEIRequestStatus(uint64_t a1)
{
}

void sub_259ECDB78(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_259ECDBC0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

unint64_t sub_259ECDC08()
{
  return sub_259ECD5A0();
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

unint64_t sub_259ECDC30()
{
  unint64_t result = qword_26A3F8818;
  if (!qword_26A3F8818)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3F8818);
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

unint64_t ReliabilityCategory.AIMLInstrumentationStreamsIssues.rawValue.getter()
{
  return 0xD000000000000018;
}

uint64_t ReliabilityCategory.BiomeStreamIssues.rawValue.getter()
{
  if (*v0) {
    return 0x5564616552535062;
  }
  else {
    return 0x4664616552535062;
  }
}

unint64_t ReliabilityCategory.SELFUploadIssues.rawValue.getter()
{
  unint64_t result = 0xD00000000000002BLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000020;
      break;
    case 2:
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ReliabilityCategory.MetricsComputeIssues.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0x45636972656E6567;
  }
}

unint64_t ReliabilityCategory.PnROnDeviceWorkerIssues.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000015;
  }
  else {
    return 0xD000000000000017;
  }
}

uint64_t ReliabilityCategory.DummyError.rawValue.getter()
{
  return 0x6F72724574736574;
}

uint64_t ReliabilityCategory.DummyError.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_259ECE17C(a1);
}

uint64_t sub_259ECDE88()
{
  return sub_259EFF010();
}

uint64_t sub_259ECDF24()
{
  return sub_259EFF010();
}

uint64_t sub_259ECE01C()
{
  return sub_259EFF010();
}

uint64_t sub_259ECE0AC()
{
  return sub_259EFF010();
}

uint64_t sub_259ECE13C@<X0>(BOOL *a1@<X8>)
{
  return sub_259ECE2AC(a1);
}

uint64_t sub_259ECE148@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ReliabilityCategory.DummyError.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t ReliabilityCategory.AIMLInstrumentationStreamsIssues.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_259ECE17C(a1);
}

uint64_t sub_259ECE17C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_259EFEF30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_259ECE1D0()
{
  return 1;
}

uint64_t sub_259ECE1D8()
{
  return sub_259EFF010();
}

uint64_t sub_259ECE230()
{
  return sub_259EFECE0();
}

uint64_t sub_259ECE24C()
{
  return sub_259EFF010();
}

uint64_t sub_259ECE2A0@<X0>(BOOL *a1@<X8>)
{
  return sub_259ECE2AC(a1);
}

uint64_t sub_259ECE2AC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_259EFEF30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_259ECE2FC(void *a1@<X8>)
{
  *a1 = 0xD000000000000018;
  a1[1] = 0x8000000259F01F20;
}

PnROnDeviceFramework::ReliabilityCategory::BiomeStreamIssues_optional __swiftcall ReliabilityCategory.BiomeStreamIssues.init(rawValue:)(Swift::String rawValue)
{
  return (PnROnDeviceFramework::ReliabilityCategory::BiomeStreamIssues_optional)sub_259ECE4A4(v1);
}

uint64_t sub_259ECE328(char *a1, char *a2)
{
  return sub_259EDE494(*a1, *a2);
}

uint64_t sub_259ECE334()
{
  return sub_259ECDE88();
}

uint64_t sub_259ECE33C()
{
  return sub_259EDEB10();
}

uint64_t sub_259ECE344()
{
  return sub_259EDF06C();
}

PnROnDeviceFramework::ReliabilityCategory::BiomeStreamIssues_optional sub_259ECE34C(Swift::String *a1)
{
  return ReliabilityCategory.BiomeStreamIssues.init(rawValue:)(*a1);
}

uint64_t sub_259ECE358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ReliabilityCategory.BiomeStreamIssues.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

PnROnDeviceFramework::ReliabilityCategory::SELFUploadIssues_optional __swiftcall ReliabilityCategory.SELFUploadIssues.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259EFEF30();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_259ECE3DC(char *a1, char *a2)
{
  return sub_259EDE550(*a1, *a2);
}

uint64_t sub_259ECE3E8()
{
  return sub_259ECDF24();
}

uint64_t sub_259ECE3F0()
{
  return sub_259EDEB94();
}

uint64_t sub_259ECE3F8()
{
  return sub_259EDEF78();
}

PnROnDeviceFramework::ReliabilityCategory::SELFUploadIssues_optional sub_259ECE400(Swift::String *a1)
{
  return ReliabilityCategory.SELFUploadIssues.init(rawValue:)(*a1);
}

unint64_t sub_259ECE40C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ReliabilityCategory.SELFUploadIssues.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

PnROnDeviceFramework::ReliabilityCategory::MetricsComputeIssues_optional __swiftcall ReliabilityCategory.MetricsComputeIssues.init(rawValue:)(Swift::String rawValue)
{
  return (PnROnDeviceFramework::ReliabilityCategory::MetricsComputeIssues_optional)sub_259ECE4A4(v1);
}

uint64_t sub_259ECE440(char *a1, char *a2)
{
  return sub_259EDE3E4(*a1, *a2);
}

uint64_t sub_259ECE44C()
{
  return sub_259ECE01C();
}

uint64_t sub_259ECE454()
{
  return sub_259EDEA98();
}

uint64_t sub_259ECE45C()
{
  return sub_259EDF104();
}

PnROnDeviceFramework::ReliabilityCategory::MetricsComputeIssues_optional sub_259ECE464(Swift::String *a1)
{
  return ReliabilityCategory.MetricsComputeIssues.init(rawValue:)(*a1);
}

uint64_t sub_259ECE470@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ReliabilityCategory.MetricsComputeIssues.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

PnROnDeviceFramework::ReliabilityCategory::PnROnDeviceWorkerIssues_optional __swiftcall ReliabilityCategory.PnROnDeviceWorkerIssues.init(rawValue:)(Swift::String rawValue)
{
  return (PnROnDeviceFramework::ReliabilityCategory::PnROnDeviceWorkerIssues_optional)sub_259ECE4A4(v1);
}

uint64_t sub_259ECE4A4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_259EFEF30();
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

unint64_t sub_259ECE508()
{
  unint64_t result = qword_26A3F8828;
  if (!qword_26A3F8828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8828);
  }
  return result;
}

unint64_t sub_259ECE560()
{
  unint64_t result = qword_26A3F8830;
  if (!qword_26A3F8830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8830);
  }
  return result;
}

unint64_t sub_259ECE5B8()
{
  unint64_t result = qword_26A3F8838;
  if (!qword_26A3F8838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8838);
  }
  return result;
}

unint64_t sub_259ECE610()
{
  unint64_t result = qword_26A3F8840;
  if (!qword_26A3F8840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8840);
  }
  return result;
}

unint64_t sub_259ECE668()
{
  unint64_t result = qword_26A3F8848;
  if (!qword_26A3F8848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8848);
  }
  return result;
}

uint64_t sub_259ECE6BC(char *a1, char *a2)
{
  return sub_259EDE6F0(*a1, *a2);
}

unint64_t sub_259ECE6CC()
{
  unint64_t result = qword_26A3F8850;
  if (!qword_26A3F8850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8850);
  }
  return result;
}

uint64_t sub_259ECE720()
{
  return sub_259ECE0AC();
}

uint64_t sub_259ECE728()
{
  sub_259EFECE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259ECE79C()
{
  return sub_259EDEEF4();
}

PnROnDeviceFramework::ReliabilityCategory::PnROnDeviceWorkerIssues_optional sub_259ECE7A4(Swift::String *a1)
{
  return ReliabilityCategory.PnROnDeviceWorkerIssues.init(rawValue:)(*a1);
}

void sub_259ECE7B0(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000015;
  }
  else {
    unint64_t v2 = 0xD000000000000017;
  }
  unint64_t v3 = 0x8000000259F02050;
  if (*v1) {
    unint64_t v3 = 0x8000000259F02070;
  }
  *a1 = v2;
  a1[1] = v3;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ReliabilityCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x1B) {
    goto LABEL_17;
  }
  if (a2 + 229 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 229) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 229;
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
      return (*a1 | (v4 << 8)) - 229;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 229;
    }
  }
LABEL_17:
  unsigned int v6 = (*a1 & 0x18 | (*a1 >> 5)) ^ 0x1F;
  if (v6 >= 0x1A) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for ReliabilityCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 229 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 229) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x1B) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x1A)
  {
    unsigned int v6 = ((a2 - 27) >> 8) + 1;
    *unint64_t result = a2 - 27;
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
        JUMPOUT(0x259ECE978);
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
          *unint64_t result = 8 * (((-a2 >> 3) & 3) - 4 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_259ECE9A0(unsigned __int8 *a1)
{
  return *a1 >> 5;
}

unsigned char *sub_259ECE9AC(unsigned char *result)
{
  *result &= 0x1Fu;
  return result;
}

unsigned char *sub_259ECE9BC(unsigned char *result, char a2)
{
  *unint64_t result = *result & 7 | (32 * a2);
  return result;
}

ValueMetadata *type metadata accessor for ReliabilityCategory()
{
  return &type metadata for ReliabilityCategory;
}

uint64_t sub_259ECE9EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ReliabilityCategory.DummyError()
{
  return &type metadata for ReliabilityCategory.DummyError;
}

uint64_t _s20PnROnDeviceFramework19ReliabilityCategoryO10DummyErrorOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s20PnROnDeviceFramework19ReliabilityCategoryO10DummyErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x259ECEAF4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReliabilityCategory.AIMLInstrumentationStreamsIssues()
{
  return &type metadata for ReliabilityCategory.AIMLInstrumentationStreamsIssues;
}

ValueMetadata *type metadata accessor for ReliabilityCategory.BiomeStreamIssues()
{
  return &type metadata for ReliabilityCategory.BiomeStreamIssues;
}

uint64_t getEnumTagSinglePayload for ReliabilityCategory.SELFUploadIssues(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ReliabilityCategory.SELFUploadIssues(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x259ECECA0);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_259ECECC8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_259ECECD0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ReliabilityCategory.SELFUploadIssues()
{
  return &type metadata for ReliabilityCategory.SELFUploadIssues;
}

ValueMetadata *type metadata accessor for ReliabilityCategory.MetricsComputeIssues()
{
  return &type metadata for ReliabilityCategory.MetricsComputeIssues;
}

uint64_t getEnumTagSinglePayload for PnRError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s20PnROnDeviceFramework19ReliabilityCategoryO17BiomeStreamIssuesOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259ECEE54);
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

unsigned char *sub_259ECEE7C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ReliabilityCategory.PnROnDeviceWorkerIssues()
{
  return &type metadata for ReliabilityCategory.PnROnDeviceWorkerIssues;
}

uint64_t sub_259ECEE98()
{
  return sub_259EFF010();
}

void sub_259ECEEFC()
{
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_259EFEC00();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F8AB8);
  oslog = sub_259EFEBF0();
  os_log_type_t v1 = sub_259EFEDC0();
  if (os_log_type_enabled(oslog, v1))
  {
    int v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v2 = 67109120;
    sub_259EFEE10();
    _os_log_impl(&dword_259EC8000, oslog, v1, "#FileRadarUtils autoBugCapture: result: %{BOOL}d", v2, 8u);
    MEMORY[0x25A2EF270](v2, -1, -1);
  }
  else
  {
  }
}

void _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (AFIsInternalInstall())
  {
    sub_259EFE6B0();
    swift_allocObject();
    sub_259EFE6A0();
    sub_259EFE690();
    swift_release();
  }
  else
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_259EFEC00();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A3F8AB8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unsigned int v9 = sub_259EFEBF0();
    os_log_type_t v10 = sub_259EFEDC0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      swift_bridgeObjectRetain();
      sub_259ED2D5C(a1, a2, &v13);
      sub_259EFEE10();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_259ED2D5C(a3, a4, &v13);
      sub_259EFEE10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259EC8000, v9, v10, "#FileRadarUtils autoBugCapture: not an internal build. Skipping filing radar for \"%s\"/\"%s\"", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EF270](v12, -1, -1);
      MEMORY[0x25A2EF270](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

ValueMetadata *type metadata accessor for FileRadarUtils()
{
  return &type metadata for FileRadarUtils;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_259ECF348()
{
  uint64_t v0 = sub_259EFE620();
  __swift_allocate_value_buffer(v0, qword_26A3F8858);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F8858);
  return sub_259EFE600();
}

uint64_t static PnRIntervalConstants.timeSinceSevenDaysAgo.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A3F8768 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259EFE620();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8858);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t static PnRConstants.dataWorkerBundleID.getter()
{
  return 0xD000000000000039;
}

unint64_t static PnRConstants.FBFBundleId.getter()
{
  return 0xD000000000000026;
}

unint64_t static StreamIdentifier.SELFProcessedStreamIdentifier.getter()
{
  return 0xD000000000000024;
}

ValueMetadata *type metadata accessor for PnRIntervalConstants()
{
  return &type metadata for PnRIntervalConstants;
}

ValueMetadata *type metadata accessor for PnRConstants()
{
  return &type metadata for PnRConstants;
}

ValueMetadata *type metadata accessor for StreamIdentifier()
{
  return &type metadata for StreamIdentifier;
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

uint64_t sub_259ECF530(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8880);
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_259ED0C04();
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v8 = sub_259EFE800();
  uint64_t v9 = v8 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v8 + 64);
  uint64_t result = swift_beginAccess();
  int64_t v13 = 0;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_6;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v17 >= v14) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v17);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_24;
      }
      unint64_t v18 = *(void *)(v9 + 8 * v13);
      if (!v18)
      {
        int64_t v13 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v9 + 8 * v13);
        if (!v18)
        {
          int64_t v13 = v17 + 3;
          if (v17 + 3 >= v14) {
            goto LABEL_24;
          }
          unint64_t v18 = *(void *)(v9 + 8 * v13);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
LABEL_6:
    uint64_t result = sub_259EFB764(v42, *(void *)(*(void *)(v8 + 56) + 8 * v16));
  }
  int64_t v19 = v17 + 4;
  if (v19 < v14)
  {
    unint64_t v18 = *(void *)(v9 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          break;
        }
        if (v13 >= v14) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v9 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_23;
        }
      }
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    int64_t v13 = v19;
    goto LABEL_23;
  }
LABEL_24:
  swift_endAccess();
  swift_release();
  sub_259EFE7E0();
  uint64_t v20 = sub_259EFE890();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v6, 1, v20) == 1)
  {
    sub_259ED1170((uint64_t)v6, &qword_26A3F8880);
  }
  else
  {
    uint64_t v22 = sub_259EFE880();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v20);
    swift_beginAccess();
    sub_259EFB764(v42, v22);
    swift_endAccess();
  }
  long long v36 = xmmword_259EFFBF0;
  uint64_t v23 = v2[2];
  v37[3] = type metadata accessor for IEExecutionGrainDimensionsSpec();
  v37[4] = &off_2707DD278;
  v37[0] = v23;
  uint64_t v24 = v2[3];
  uint64_t v39 = type metadata accessor for IETranscriptLatencyIntervalSpec();
  v40 = &off_2707DD9A0;
  v38[0] = v24;
  uint64_t v25 = v2[4];
  v41[3] = v39;
  v41[4] = &off_2707DD9A0;
  v41[0] = v25;
  sub_259ED1078((uint64_t)v37, (uint64_t)v33);
  uint64_t v26 = v34;
  uint64_t v27 = v35;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v28(a1, v26, v27);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  if ((unint64_t)v36 < 2) {
    goto LABEL_33;
  }
  sub_259ED1078((uint64_t)v38, (uint64_t)v33);
  uint64_t v29 = v34;
  uint64_t v30 = v35;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 8))(a1, v29, v30);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  if ((unint64_t)v36 >= 3)
  {
    sub_259ED1078((uint64_t)v41, (uint64_t)v33);
    uint64_t v31 = v34;
    uint64_t v32 = v35;
    __swift_project_boxed_opaque_existential_1(v33, v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 8))(a1, v31, v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8888);
    return swift_arrayDestroy();
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_259ECF98C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9 = *(void **)(v7 + 16);
  uint64_t v24 = v9[21];
  uint64_t v10 = v9[7];
  uint64_t v22 = v9[9];
  uint64_t v11 = v9[5];
  uint64_t v28 = v9[10];
  uint64_t v29 = v9[4];
  uint64_t v12 = v9[3];
  uint64_t v30 = v9[2];
  uint64_t v31 = v9[6];
  uint64_t v32 = v9[12];
  uint64_t v20 = v9[13];
  uint64_t v21 = v9[11];
  uint64_t v34 = v9[14];
  uint64_t v33 = v9[15];
  swift_bridgeObjectRetain();
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_259EF339C();
  char v15 = v14;
  uint64_t v16 = sub_259EF339C();
  char v18 = v17;
  uint64_t result = swift_release();
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(void *)(a7 + 40) = a6;
  *(void *)(a7 + 48) = v27;
  *(void *)(a7 + 56) = v22;
  *(void *)(a7 + 64) = v28;
  *(void *)(a7 + 72) = v21;
  *(void *)(a7 + 80) = v29;
  *(void *)(a7 + 88) = v11;
  *(void *)(a7 + 96) = v30;
  *(void *)(a7 + 104) = v12;
  *(void *)(a7 + 112) = v31;
  *(void *)(a7 + 120) = v10;
  *(void *)(a7 + 128) = v32;
  *(void *)(a7 + 136) = v20;
  *(void *)(a7 + 144) = v34;
  *(void *)(a7 + 152) = v33;
  *(void *)(a7 + 160) = v13;
  *(unsigned char *)(a7 + 168) = v15 & 1;
  *(void *)(a7 + 176) = v16;
  *(unsigned char *)(a7 + 184) = v18 & 1;
  *(void *)(a7 + 192) = v24;
  return result;
}

uint64_t sub_259ECFB58()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for IEExecutionGrainSpec()
{
  return self;
}

void *sub_259ECFBCC()
{
  type metadata accessor for IEExecutionGrainDimensionsSpec();
  os_log_type_t v1 = (_OWORD *)swift_allocObject();
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  v1[5] = 0u;
  v1[6] = 0u;
  v1[7] = 0u;
  v1[8] = 0u;
  v1[9] = 0u;
  v1[10] = 0u;
  *(void *)(v0 + 16) = v1;
  type metadata accessor for IETranscriptLatencyIntervalSpec();
  uint64_t v2 = (_OWORD *)swift_allocObject();
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[1] = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8898);
  uint64_t v19 = sub_259EFE8F0();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v19 - 8) + 80);
  uint64_t v4 = *(void *)(v19 - 8);
  uint64_t v5 = (v3 + 32) & ~v3;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_259F002C0;
  uint64_t v22 = *(void (**)(uint64_t, void, uint64_t))(v4 + 104);
  v22(v6 + v5, *MEMORY[0x263F51648], v19);
  type metadata accessor for IETranscriptNextEvent(0);
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v7 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
  uint64_t v20 = sub_259EFE840();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v8, 1, 1, v20);
  *(void *)(v7 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v6;
  uint64_t v9 = type metadata accessor for IETranscriptEventFilter(0);
  uint64_t v25 = v9;
  uint64_t v26 = &off_2707DD9C0;
  v24[0] = v7;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v24, (uint64_t)(v2 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_259F002C0;
  v22(v10 + v5, *MEMORY[0x263F516B0], v19);
  uint64_t v11 = swift_allocObject();
  v21(v11 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v20);
  *(void *)(v11 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v10;
  uint64_t v25 = v9;
  uint64_t v26 = &off_2707DD9C0;
  v24[0] = v11;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v24, (uint64_t)v2 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v23[3] = v2;
  uint64_t v12 = (_OWORD *)swift_allocObject();
  v12[2] = 0u;
  v12[3] = 0u;
  v12[4] = 0u;
  v12[5] = 0u;
  v12[1] = 0u;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_259F002C0;
  v22(v13 + v5, *MEMORY[0x263F51650], v19);
  uint64_t v14 = swift_allocObject();
  v21(v14 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v20);
  *(void *)(v14 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v13;
  uint64_t v25 = v9;
  uint64_t v26 = &off_2707DD9C0;
  v24[0] = v14;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v24, (uint64_t)(v12 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_259F002C0;
  v22(v15 + v5, *MEMORY[0x263F51660], v19);
  uint64_t v16 = swift_allocObject();
  v21(v16 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v20);
  *(void *)(v16 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v15;
  uint64_t v25 = v9;
  uint64_t v26 = &off_2707DD9C0;
  v24[0] = v16;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v24, (uint64_t)v12 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v17 = MEMORY[0x263F8EE88];
  uint64_t result = v23;
  v23[4] = v12;
  v23[5] = v17;
  return result;
}

uint64_t sub_259ED0118(uint64_t a1)
{
  return sub_259ECF530(a1);
}

uint64_t sub_259ED013C()
{
  os_log_type_t v1 = v0;
  uint64_t v2 = sub_259EFE940();
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  MEMORY[0x270FA5388](v2);
  v54 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_259EFE9E0();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  MEMORY[0x270FA5388](v4);
  v51 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259EFE870();
  uint64_t v57 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v50 - v16;
  if (sub_259ED08D4())
  {
    v0[10] = sub_259EFE7C0();
    v0[11] = v18;
    swift_bridgeObjectRelease();
    v0[8] = sub_259EFE810();
    v0[9] = v19;
    swift_bridgeObjectRelease();
  }
  sub_259EFE7D0();
  uint64_t v20 = sub_259EFE8B0();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v11, 1, v20) == 1)
  {
    sub_259ED1170((uint64_t)v11, &qword_26A3F8870);
    uint64_t v22 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 1, 1, v22);
    return sub_259ED1170((uint64_t)v17, &qword_26A3F8878);
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
  uint64_t v23 = sub_259EFE920();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v17, 1, v23) == 1) {
    return sub_259ED1170((uint64_t)v17, &qword_26A3F8878);
  }
  sub_259ED0B9C((uint64_t)v17, (uint64_t)v15);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 88))(v15, v23);
  if (result == *MEMORY[0x263F516C8])
  {
    v0[4] = sub_259EFE820();
    v0[5] = v26;
    swift_bridgeObjectRelease();
LABEL_8:
    (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v23);
    return sub_259ED1170((uint64_t)v17, &qword_26A3F8878);
  }
  if (result == *MEMORY[0x263F516D0])
  {
    (*(void (**)(char *, uint64_t))(v24 + 96))(v15, v23);
    uint64_t v27 = v57;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v8, v15, v6);
    v0[2] = sub_259EFE820();
    v0[3] = v28;
    swift_bridgeObjectRelease();
    v0[12] = sub_259EFE820();
    v0[13] = v29;
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_259EFE860();
    uint64_t v32 = v31;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v6);
    v1[14] = v30;
    v1[15] = v32;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v33 = v1[16];
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v35 = v33 + 1;
    if (!v34)
    {
      v1[16] = v35;
      return sub_259ED1170((uint64_t)v17, &qword_26A3F8878);
    }
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (result == *MEMORY[0x263F516E0])
  {
    v0[6] = sub_259EFE820();
    v0[7] = v36;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v37 = v0[17];
    BOOL v34 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (!v34)
    {
      v0[17] = v38;
      goto LABEL_8;
    }
    goto LABEL_27;
  }
  if (result == *MEMORY[0x263F516D8])
  {
    (*(void (**)(char *, uint64_t))(v24 + 96))(v15, v23);
    uint64_t v40 = (uint64_t)v54;
    uint64_t v39 = v55;
    uint64_t v41 = v56;
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v55 + 32))(v54, v15, v56);
    uint64_t v42 = v0[20];
    BOOL v34 = __OFADD__(v42, 1);
    uint64_t v43 = v42 + 1;
    if (v34)
    {
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v0[20] = v43;
    uint64_t v44 = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor27TranscriptProtoSessionErrorV_tFZ_0(v40);
LABEL_18:
    uint64_t v45 = v44;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v41);
    v1[21] = v45;
    swift_release();
    return sub_259ED1170((uint64_t)v17, &qword_26A3F8878);
  }
  if (result == *MEMORY[0x263F516E8])
  {
    uint64_t v46 = v0[18];
    BOOL v34 = __OFADD__(v46, 1);
    uint64_t v47 = v46 + 1;
    if (!v34)
    {
      v0[18] = v47;
      goto LABEL_8;
    }
    goto LABEL_29;
  }
  if (result != *MEMORY[0x263F516F0]) {
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t))(v24 + 96))(v15, v23);
  uint64_t v40 = (uint64_t)v51;
  uint64_t v39 = v52;
  uint64_t v41 = v53;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v52 + 32))(v51, v15, v53);
  uint64_t v48 = v0[19];
  BOOL v34 = __OFADD__(v48, 1);
  uint64_t v49 = v48 + 1;
  if (!v34)
  {
    v0[19] = v49;
    uint64_t v44 = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor30TranscriptProtoStatementResultV_tFZ_0();
    goto LABEL_18;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_259ED07E0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_259ED0838()
{
  sub_259ED07E0();
  return MEMORY[0x270FA0228](v0, 176, 7);
}

uint64_t type metadata accessor for IEExecutionGrainDimensionsSpec()
{
  return self;
}

double sub_259ED0890()
{
  double result = 0.0;
  v0[9] = 0u;
  v0[10] = 0u;
  v0[7] = 0u;
  v0[8] = 0u;
  v0[5] = 0u;
  v0[6] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t sub_259ED08B0()
{
  return sub_259ED013C();
}

BOOL sub_259ED08D4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  sub_259EFE7D0();
  uint64_t v9 = sub_259EFE8B0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9) == 1)
  {
    sub_259ED1170((uint64_t)v2, &qword_26A3F8870);
    uint64_t v11 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
LABEL_4:
    BOOL v14 = 0;
    goto LABEL_5;
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v2, v9);
  uint64_t v12 = sub_259EFE920();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) == 1) {
    goto LABEL_4;
  }
  sub_259ED0B9C((uint64_t)v8, (uint64_t)v6);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v6, v12);
  if (v16 == *MEMORY[0x263F516D0])
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = v16 == *MEMORY[0x263F516E0];
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
  }
LABEL_5:
  sub_259ED1170((uint64_t)v8, &qword_26A3F8878);
  return v14;
}

uint64_t sub_259ED0B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259ED0C04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8890);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v1 = (char *)&v24 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - v7;
  sub_259EFE7D0();
  uint64_t v9 = sub_259EFE8B0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v3, 1, v9) == 1)
  {
    sub_259ED1170((uint64_t)v3, &qword_26A3F8870);
    uint64_t v11 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
LABEL_17:
    char v17 = 0;
    goto LABEL_18;
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v3, v9);
  uint64_t v12 = sub_259EFE920();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) == 1) {
    goto LABEL_17;
  }
  sub_259ED0B9C((uint64_t)v8, (uint64_t)v6);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v6, v12);
  if (v14 != *MEMORY[0x263F516D0] && v14 != *MEMORY[0x263F516E0] && v14 != *MEMORY[0x263F516E8])
  {
    if (v14 != *MEMORY[0x263F516F0])
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
      goto LABEL_17;
    }
    sub_259EFE830();
    uint64_t v18 = sub_259EFE9A0();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v1, 1, v18) == 1)
    {
      sub_259ED1170((uint64_t)v1, &qword_26A3F8890);
    }
    else
    {
      uint64_t v21 = sub_259EFE820();
      uint64_t v23 = v22;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v1, v18);
      if (v23)
      {
        if (v21 == 0x726F747563657865 && v23 == 0xE800000000000000)
        {
          swift_bridgeObjectRelease();
          char v17 = 1;
        }
        else
        {
          char v17 = sub_259EFEF50();
          swift_bridgeObjectRelease();
        }
        goto LABEL_24;
      }
    }
    char v17 = 0;
LABEL_24:
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
    goto LABEL_18;
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
  char v17 = 1;
LABEL_18:
  sub_259ED1170((uint64_t)v8, &qword_26A3F8878);
  return v17 & 1;
}

uint64_t sub_259ED1078(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_259ED1170(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_259ED11CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of BiomeReader.bookmark.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SELFProcessedTurnReader.read()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_259ED1338;
  return v7(a1, a2);
}

uint64_t sub_259ED1338(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t Bookmark.userDefaultsKey.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_259ED1480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_259EFE620();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v40 - v9;
  if (qword_26A3F8768 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26A3F8858);
  uint64_t v12 = *(uint8_t **)(v5 + 16);
  uint64_t v45 = v10;
  ((void (*)(char *, uint64_t, uint64_t))v12)(v10, v11, v4);
  uint64_t v13 = (void *)v2[2];
  if (v13)
  {
    uint64_t v44 = v12;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    int v14 = (void *)sub_259EFEC80();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v13, sel_valueForKey_, v14);

    if (v15)
    {
      sub_259EFEE40();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v46, 0, sizeof(v46));
    }
    sub_259ED20A4((uint64_t)v46, (uint64_t)&v48);
    if (*((void *)&v49 + 1))
    {
      sub_259ED2044((uint64_t)&v48);
      swift_bridgeObjectRetain();
      int v16 = (void *)sub_259EFEC80();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_doubleForKey_, v16);
      uint64_t v18 = v17;

      if (qword_26B3246C0 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_259EFEC00();
      __swift_project_value_buffer(v19, (uint64_t)qword_26A3F8AB8);
      swift_retain();
      uint64_t v20 = sub_259EFEBF0();
      os_log_type_t v21 = sub_259EFEDC0();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        *(void *)&long long v48 = v41;
        *(_DWORD *)uint64_t v22 = 136315394;
        uint64_t v42 = a1;
        uint64_t v43 = v5;
        uint64_t v23 = v2[5];
        unint64_t v24 = v2[6];
        swift_bridgeObjectRetain();
        *(void *)&v46[0] = sub_259ED2D5C(v23, v24, (uint64_t *)&v48);
        a1 = v42;
        sub_259EFEE10();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2048;
        *(void *)&v46[0] = v18;
        uint64_t v5 = v43;
        sub_259EFEE10();
        _os_log_impl(&dword_259EC8000, v20, v21, "The userdefault has key %s with the value %f", (uint8_t *)v22, 0x16u);
        uint64_t v25 = v41;
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v25, -1, -1);
        MEMORY[0x25A2EF270](v22, -1, -1);
      }
      else
      {

        swift_release();
      }
      uint64_t v37 = v44;
      uint64_t v36 = v45;
      sub_259EFE5E0();
      sub_259ED210C();
      if (sub_259EFEC60()) {
        uint64_t v38 = v8;
      }
      else {
        uint64_t v38 = v36;
      }
      ((void (*)(uint64_t, char *, uint64_t))v37)(a1, v38, v4);
      uint64_t v39 = *(void (**)(char *, uint64_t))(v5 + 8);
      v39(v8, v4);
      return ((uint64_t (*)(char *, uint64_t))v39)(v36, v4);
    }
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  sub_259ED2044((uint64_t)&v48);
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_259EFEC00();
  __swift_project_value_buffer(v26, (uint64_t)qword_26A3F8AB8);
  swift_retain();
  uint64_t v27 = sub_259EFEBF0();
  os_log_type_t v28 = sub_259EFEDC0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(void *)&v46[0] = v30;
    uint64_t v43 = v5;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v44 = v29 + 4;
    swift_beginAccess();
    uint64_t v31 = a1;
    uint64_t v33 = v2[5];
    unint64_t v32 = v2[6];
    swift_bridgeObjectRetain();
    uint64_t v34 = v33;
    a1 = v31;
    uint64_t v47 = sub_259ED2D5C(v34, v32, (uint64_t *)v46);
    uint64_t v5 = v43;
    sub_259EFEE10();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259EC8000, v27, v28, "The userdefault contained no value for %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v30, -1, -1);
    MEMORY[0x25A2EF270](v29, -1, -1);
  }
  else
  {

    swift_release();
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1, v45, v4);
}

uint64_t sub_259ED1A78(uint64_t a1)
{
  unint64_t v3 = v1[4];
  uint64_t v4 = v1[3] & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(v3) & 0xF;
  }
  if (v4)
  {
    uint64_t v5 = v1;
    sub_259EFE5F0();
    uint64_t v7 = v6;
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_259EFEC00();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A3F8AB8);
    swift_retain();
    uint64_t v9 = sub_259EFEBF0();
    os_log_type_t v10 = sub_259EFEDC0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v33[0] = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      swift_beginAccess();
      uint64_t v13 = v1[5];
      unint64_t v14 = v1[6];
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_259ED2D5C(v13, v14, v33);
      sub_259EFEE10();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2048;
      uint64_t v34 = v7;
      sub_259EFEE10();
      _os_log_impl(&dword_259EC8000, v9, v10, "Set key %s to %f", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EF270](v12, -1, -1);
      MEMORY[0x25A2EF270](v11, -1, -1);

      id v15 = (void *)v1[2];
      if (v15)
      {
LABEL_8:
        id v16 = v15;
        uint64_t v17 = (void *)sub_259EFED80();
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v18 = (void *)sub_259EFEC80();
        swift_bridgeObjectRelease();
        objc_msgSend(v16, sel_setValue_forKey_, v17, v18);

LABEL_21:
        uint64_t v32 = sub_259EFE620();
        return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8))(a1, v32);
      }
    }
    else
    {

      swift_release();
      id v15 = (void *)v1[2];
      if (v15) {
        goto LABEL_8;
      }
    }
    swift_retain_n();
    uint64_t v26 = sub_259EFEBF0();
    os_log_type_t v27 = sub_259EFEDC0();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v34 = v29;
      *(_DWORD *)os_log_type_t v28 = 136315138;
      swift_beginAccess();
      uint64_t v30 = v5[5];
      unint64_t v31 = v5[6];
      swift_bridgeObjectRetain();
      sub_259ED2D5C(v30, v31, &v34);
      sub_259EFEE10();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259EC8000, v26, v27, "Fail to set key %s due to empty userdefaults", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EF270](v29, -1, -1);
      MEMORY[0x25A2EF270](v28, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    goto LABEL_21;
  }
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_259EFEC00();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A3F8AB8);
  uint64_t v20 = sub_259EFEBF0();
  os_log_type_t v21 = sub_259EFEDC0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_259EC8000, v20, v21, "Skip userDefault set due to empty identifier", v22, 2u);
    MEMORY[0x25A2EF270](v22, -1, -1);
  }

  uint64_t v23 = sub_259EFE620();
  unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8);
  return v24(a1, v23);
}

uint64_t Bookmark.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Bookmark.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for Bookmark()
{
  return self;
}

uint64_t method lookup function for Bookmark(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Bookmark);
}

uint64_t sub_259ED2044(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259ED20A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_259ED210C()
{
  unint64_t result = qword_26A3F88B8;
  if (!qword_26A3F88B8)
  {
    sub_259EFE620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F88B8);
  }
  return result;
}

void SiriTurnGrainCalculator.init(from:)(void *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t v4 = (void *)qword_26A3F8D18;
    qword_26A3F8D18 = (uint64_t)a1;
    id v5 = a1;
  }
  *a2 = a1;
}

void SiriTurnGrainCalculator.extractLatencies()(uint64_t *a1@<X8>)
{
  uint64_t v4 = sub_259EFEC00();
  uint64_t v63 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_259EFE670();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  os_log_type_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  SiriTurnGrainCalculator.computeSRT()(&v68);
  v64 = v2;
  uint64_t v65 = v11;
  uint64_t v66 = v7;
  if (!v2)
  {
    uint64_t v25 = v8;
    v62 = v69;
    uint64_t v63 = v68;
    uint64_t v60 = v71;
    uint64_t v61 = v70;
    swift_beginAccess();
    uint64_t v26 = v10;
    if (qword_26A3F8D18)
    {
      id v27 = (id)qword_26A3F8D18;
      uint64_t v28 = sub_259EFEB30();

      uint64_t v29 = a1;
      uint64_t v30 = v25;
      if (v28)
      {
        uint64_t v67 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
        sub_259ED3468(0, &qword_26A3F88E8);
        sub_259ED33C4();
        unint64_t v31 = (void *)sub_259EFED20();
        swift_release();
        if (v31[2])
        {
          uint64_t v32 = v31[4];
          uint64_t v28 = v31[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v32 = 0;
          uint64_t v28 = 0;
        }
      }
      else
      {
        uint64_t v32 = 0;
      }
      uint64_t v58 = v28;
      uint64_t v59 = v32;
      if (qword_26A3F8D18)
      {
        id v35 = (id)qword_26A3F8D18;
        uint64_t v33 = sub_259EFEB30();

        if (v33)
        {
          uint64_t v67 = v33;
          *(void *)&v57[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
          sub_259ED3468(0, &qword_26A3F88D8);
          type metadata accessor for SISchemaUEIRequestStatus(0);
          sub_259ED33C4();
          uint64_t v36 = sub_259EFED20();
          swift_release();
          uint64_t v37 = *(void *)(v36 + 16);
          BOOL v34 = v37 == 0;
          if (v37) {
            LODWORD(v33) = *(_DWORD *)(v36 + 32);
          }
          else {
            LODWORD(v33) = 0;
          }
          swift_bridgeObjectRelease();
          uint64_t v38 = (void *)qword_26A3F8D18;
          if (qword_26A3F8D18) {
            goto LABEL_24;
          }
        }
        else
        {
          BOOL v34 = 1;
          uint64_t v38 = (void *)qword_26A3F8D18;
          if (qword_26A3F8D18)
          {
LABEL_24:
            int v56 = v33;
            id v39 = v38;
            uint64_t v40 = sub_259EFEB30();

            if (v40)
            {
              uint64_t v67 = v40;
              *(void *)&v57[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
              sub_259ED3468(0, &qword_26A3F88D8);
              type metadata accessor for SISchemaUEIRequestType(0);
              sub_259ED33C4();
              uint64_t v41 = sub_259EFED20();
              swift_release();
              uint64_t v42 = *(void *)(v41 + 16);
              BOOL v43 = v42 == 0;
              if (v42) {
                LODWORD(v42) = *(_DWORD *)(v41 + 32);
              }
              *(_DWORD *)uint64_t v57 = v43;
              *(_DWORD *)&v57[4] = v42;
              swift_bridgeObjectRelease();
            }
            else
            {
              *(void *)uint64_t v57 = 1;
            }
            LODWORD(v33) = v56;
            goto LABEL_30;
          }
        }
        *(_DWORD *)&v57[4] = 0;
      }
      else
      {
        LODWORD(v33) = 0;
        *(_DWORD *)&v57[4] = 0;
        BOOL v34 = 1;
      }
      *(_DWORD *)uint64_t v57 = 1;
    }
    else
    {
      LODWORD(v33) = 0;
      uint64_t v58 = 0;
      uint64_t v59 = 0;
      BOOL v34 = 1;
      *(void *)uint64_t v57 = 1;
      uint64_t v29 = a1;
      uint64_t v30 = v25;
    }
LABEL_30:
    sub_259EFEB90();
    uint64_t v44 = sub_259EFE640();
    uint64_t v46 = v45;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v26, v66);
    LODWORD(v67) = v33;
    BYTE4(v67) = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88C0);
    uint64_t v47 = sub_259EFEDF0();
    uint64_t v49 = v48;
    LODWORD(v67) = *(_DWORD *)&v57[4];
    BYTE4(v67) = v57[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88C8);
    uint64_t v50 = sub_259EFEDF0();
    *uint64_t v29 = v44;
    v29[1] = v46;
    v51 = v62;
    v29[2] = v63;
    v29[3] = (uint64_t)v51;
    uint64_t v52 = v60;
    v29[4] = v61;
    v29[5] = v52;
    uint64_t v53 = v58;
    v29[6] = v59;
    v29[7] = v53;
    v29[8] = v47;
    v29[9] = v49;
    v29[10] = v50;
    v29[11] = v54;
    return;
  }
  v62 = a1;
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v12 = v4;
  uint64_t v61 = v4;
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_26A3F8AB8);
  uint64_t v14 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v6, v13, v12);
  uint64_t v68 = 0;
  v69 = (uint64_t *)0xE000000000000000;
  sub_259EFEE80();
  swift_bridgeObjectRelease();
  uint64_t v68 = 0xD00000000000002FLL;
  v69 = (uint64_t *)0x8000000259F02690;
  sub_259EFEB90();
  sub_259EFE640();
  id v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v16 = v66;
  v15(v10, v66);
  sub_259EFECF0();
  swift_bridgeObjectRelease();
  uint64_t v17 = v68;
  LOBYTE(v68) = 0x80;
  Logger.debug(_:_:)(v17, (unint64_t)v69, (char *)&v68);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v61);
  sub_259EFEB90();
  uint64_t v18 = sub_259EFE640();
  uint64_t v20 = v19;
  v15(v10, v16);
  os_log_type_t v21 = v64;
  swift_getErrorValue();
  uint64_t v22 = sub_259EFEFA0();
  _s20PnROnDeviceFramework14SELFPnREmitterC42uploadProvisionalSiriTurnGrainDebugSummary3for12errorMessageySSSg_AGtF_0(v18, v20, v22, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26A3F8770 != -1) {
    swift_once();
  }
  _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(qword_26A3F8960, *(unint64_t *)algn_26A3F8968, 0xD000000000000014, 0x8000000259F00470);

  unint64_t v24 = v62;
  *(_OWORD *)v62 = xmmword_259F00480;
  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *((_OWORD *)v24 + 3) = 0u;
  *((_OWORD *)v24 + 4) = 0u;
  *((_OWORD *)v24 + 5) = 0u;
}

void SiriTurnGrainCalculator.computeSRT()(uint64_t *a1@<X8>)
{
  type metadata accessor for SELFComponent.UEI();
  swift_initStackObject();
  sub_259ED6B08(&v24);
  if (!v1)
  {
    uint64_t v3 = v24;
    uint64_t v4 = v25;
    type metadata accessor for SELFComponent.MH();
    swift_initStackObject();
    sub_259ED4C94(&v24);
    uint64_t v5 = v24;
    uint64_t v20 = v25;
    swift_initStackObject();
    sub_259ED6FFC(&v24);
    uint64_t v6 = v24;
    uint64_t v7 = v25;
    swift_beginAccess();
    if (qword_26A3F8D18)
    {
      id v8 = (id)qword_26A3F8D18;
      uint64_t v9 = sub_259EFEB30();

      if (v9)
      {
        uint64_t v24 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
        sub_259ED3468(0, &qword_26A3F88D8);
        type metadata accessor for SISchemaUEIRequestType(0);
        sub_259ED33C4();
        uint64_t v10 = sub_259EFED20();
        swift_release();
        if (*(void *)(v10 + 16))
        {
          int v11 = *(_DWORD *)(v10 + 32);
          swift_bridgeObjectRelease();
          if (v11 == 1)
          {
            uint64_t v6 = v5;
            uint64_t v7 = v20;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
    }
    uint64_t v23 = v6;
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_259EFEC00();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A3F8AB8);
    uint64_t v13 = sub_259EFEBF0();
    os_log_type_t v14 = sub_259EFEDC0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v22 = v3;
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      uint64_t v28 = v21;
      uint64_t v16 = v23;
      uint64_t v24 = v23;
      uint64_t v25 = v7;
      uint64_t v26 = v22;
      uint64_t v27 = v4;
      uint64_t v17 = PnRLatencyContextMetrics.description.getter();
      uint64_t v24 = sub_259ED2D5C(v17, v18, &v28);
      sub_259EFEE10();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259EC8000, v13, v14, "Compute Metrics srt: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EF270](v21, -1, -1);
      uint64_t v19 = v15;
      uint64_t v3 = v22;
      MEMORY[0x25A2EF270](v19, -1, -1);
    }
    else
    {

      uint64_t v16 = v23;
    }
    *a1 = v16;
    a1[1] = v7;
    a1[2] = v3;
    a1[3] = v4;
  }
}

uint64_t sub_259ED2C70(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_259ED2C80(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_259ED2CBC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_259ED2CE4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_259ED2D5C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_259EFEE10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_259ED2D5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_259ED2E30(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_259ED34B4((uint64_t)v12, *a3);
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
      sub_259ED34B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_259ED2E30(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_259EFEE20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_259ED2FEC(a5, a6);
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
  uint64_t v8 = sub_259EFEEB0();
  if (!v8)
  {
    sub_259EFEED0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_259EFEF20();
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

uint64_t sub_259ED2FEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_259ED3084(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_259ED3264(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_259ED3264(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_259ED3084(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_259ED31FC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_259EFEE90();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_259EFEED0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_259EFED00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_259EFEF20();
    __break(1u);
LABEL_14:
    uint64_t result = sub_259EFEED0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_259ED31FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_259ED3264(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

unsigned char **sub_259ED33B4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_259ED33C4()
{
  unint64_t result = qword_26A3F88E0;
  if (!qword_26A3F88E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F88D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F88E0);
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

uint64_t sub_259ED3468(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for SiriTurnGrainCalculator()
{
  return &type metadata for SiriTurnGrainCalculator;
}

uint64_t sub_259ED34B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_259ED3514(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8958);
  uint64_t v2 = (void *)sub_259EFEF10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    int64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_259EE9AF0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    size_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *size_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

unint64_t sub_259ED3630(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8948);
  uint64_t v2 = sub_259EFEF10();
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
    sub_259ED3FC0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_259EE9AF0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    size_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *size_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_259ED3C9C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_259ED375C(uint64_t a1)
{
  return sub_259ED37BC(a1, &qword_26A3F8938, (uint64_t (*)(uint64_t))sub_259EE9B68);
}

unint64_t sub_259ED377C(uint64_t a1)
{
  return sub_259ED37BC(a1, &qword_26A3F8930, (uint64_t (*)(uint64_t))sub_259EE9B74);
}

unint64_t sub_259ED379C(uint64_t a1)
{
  return sub_259ED37BC(a1, &qword_26A3F8940, (uint64_t (*)(uint64_t))sub_259EE9C00);
}

unint64_t sub_259ED37BC(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = (void *)sub_259EFEF10();
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  swift_retain();
  uint64_t v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v8 = *(v7 - 1);
    uint64_t v9 = *v7;
    uint64_t v10 = swift_retain();
    unint64_t result = a3(v10);
    if (v12) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = 8 * result;
    *(void *)(v5[6] + v13) = v8;
    *(void *)(v5[7] + v13) = v9;
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v5[2] = v16;
    v7 += 2;
    if (!--v6)
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

uint64_t sub_259ED38CC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8910);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 40) = 1;
  uint64_t v7 = v2 + OBJC_IVAR____TtC20PnROnDeviceFramework8PNRError_transcriptIFError;
  uint64_t v8 = sub_259EFEA70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v10(v7, 1, 1, v8);
  *(void *)(v2 + 16) = sub_259EFE820();
  *(void *)(v2 + 24) = v11;
  swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = sub_259EFEA50();
  *(unsigned char *)(v2 + 40) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v6, a1, v8);
  v10((uint64_t)v6, 0, 1, v8);
  swift_beginAccess();
  sub_259ED3F58((uint64_t)v6, v7);
  swift_endAccess();
  return v2;
}

uint64_t sub_259ED3A54()
{
  return 0;
}

unint64_t sub_259ED3B0C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F8);
  uint64_t inited = swift_initStackObject();
  uint64_t v2 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_259F004D0;
  *(void *)(inited + 32) = 0x6E69616D6F64;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v3 = *(void *)(v0 + 24);
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 16);
    uint64_t v11 = MEMORY[0x263F8D310];
    *(void *)&long long v10 = v4;
    *((void *)&v10 + 1) = v3;
    sub_259ED3C9C(&v10, (_OWORD *)(inited + 48));
  }
  else
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    v2[9] = sub_259ED3468(0, (unint64_t *)&qword_26A3F8900);
    v2[6] = v5;
  }
  v2[10] = 1701080931;
  v2[11] = 0xE400000000000000;
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    v2[15] = sub_259ED3468(0, (unint64_t *)&qword_26A3F8818);
    swift_bridgeObjectRetain();
LABEL_7:
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(v0 + 32);
  id v7 = objc_allocWithZone(NSNumber);
  swift_bridgeObjectRetain();
  id v8 = objc_msgSend(v7, sel_initWithLongLong_, v6);
  v2[15] = sub_259ED3468(0, (unint64_t *)&qword_26A3F8818);
  if (!v8) {
    goto LABEL_7;
  }
LABEL_8:
  v2[12] = v8;
  return sub_259ED3630((uint64_t)v2);
}

_OWORD *sub_259ED3C9C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t PNRError.deinit()
{
  swift_bridgeObjectRelease();
  sub_259ED3CDC(v0 + OBJC_IVAR____TtC20PnROnDeviceFramework8PNRError_transcriptIFError);
  return v0;
}

uint64_t sub_259ED3CDC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8910);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PNRError.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_259ED3CDC(v0 + OBJC_IVAR____TtC20PnROnDeviceFramework8PNRError_transcriptIFError);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_259ED3DA8()
{
  return type metadata accessor for PNRError();
}

uint64_t type metadata accessor for PNRError()
{
  uint64_t result = qword_26A3F8918;
  if (!qword_26A3F8918) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_259ED3DFC()
{
  sub_259ED3F00();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PNRError(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PNRError);
}

uint64_t dispatch thunk of PNRError.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of PNRError.dictionary.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

void sub_259ED3F00()
{
  if (!qword_26A3F8928)
  {
    sub_259EFEA70();
    unint64_t v0 = sub_259EFEE00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A3F8928);
    }
  }
}

uint64_t sub_259ED3F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_259ED3FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_259ED4028()
{
  qword_26A3F8960 = 0x6C61746146;
  *(void *)algn_26A3F8968 = 0xE500000000000000;
}

uint64_t static ErrorType.fatal.getter()
{
  return sub_259ED423C(&qword_26A3F8770, &qword_26A3F8960);
}

unint64_t static ErrorSubType.PnROnDeviceWorker.getter()
{
  return 0xD000000000000011;
}

unint64_t static ErrorSubType.PnROnDeviceFramework.getter()
{
  return 0xD000000000000014;
}

void sub_259ED40A8()
{
  qword_26A3F8970 = 0x656D6F6942;
  *(void *)algn_26A3F8978 = 0xE500000000000000;
}

uint64_t static ErrorSubType.Biome.getter()
{
  return sub_259ED423C(&qword_26A3F8778, &qword_26A3F8970);
}

void sub_259ED40F0()
{
  qword_26A3F8980 = 0x53494C4D4941;
  *(void *)algn_26A3F8988 = 0xE600000000000000;
}

uint64_t static ErrorSubType.AIMLIS.getter()
{
  return sub_259ED423C(&qword_26A3F8780, &qword_26A3F8980);
}

unint64_t static ErrorSubTypeContext.PnROnDeviceUploadException.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static ErrorSubTypeContext.PnRMetricsComputeException.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static ErrorSubTypeContext.PnROnDeviceWorkerException.getter()
{
  return 0xD00000000000001ALL;
}

void sub_259ED418C()
{
  *(_WORD *)&algn_26A3F8998[6] = -4864;
}

uint64_t static ErrorSubTypeContext.BPSReadFailed.getter()
{
  return sub_259ED423C(&qword_26A3F8788, &qword_26A3F8990);
}

void sub_259ED41E4()
{
  algn_26A3F89A8[7] = -18;
}

uint64_t static ErrorSubTypeContext.BPSReadUnknown.getter()
{
  return sub_259ED423C(&qword_26A3F8790, &qword_26A3F89A0);
}

uint64_t sub_259ED423C(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static ErrorSubTypeContext.SiriTurnFailedToGenerate.getter()
{
  return 0xD000000000000018;
}

BOOL static PnRError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PnRError.hash(into:)()
{
  return sub_259EFEFF0();
}

uint64_t PnRError.hashValue.getter()
{
  return sub_259EFF010();
}

BOOL sub_259ED4338(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_259ED4350()
{
  return sub_259EFF010();
}

uint64_t sub_259ED4398()
{
  return sub_259EFEFF0();
}

uint64_t sub_259ED43C4()
{
  return sub_259EFF010();
}

uint64_t sub_259ED4408(uint64_t a1)
{
  unint64_t v2 = sub_259ED48C4();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_259ED4444(uint64_t a1)
{
  unint64_t v2 = sub_259ED48C4();
  return MEMORY[0x270EF2668](a1, v2);
}

void sub_259ED4488()
{
  qword_26A3F89B0 = 0x726F727245526E50;
  qword_26A3F89B8 = 0xE800000000000000;
}

uint64_t static PnRError.errorDomain.getter()
{
  if (qword_26A3F8798 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_26A3F89B0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static PnRError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (qword_26A3F8798 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26A3F89B0 = a1;
  qword_26A3F89B8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PnRError.errorDomain.modify())()
{
  if (qword_26A3F8798 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PnRError.errorCode.getter()
{
  return *v0;
}

unint64_t sub_259ED4654()
{
  unint64_t result = qword_26A3F89C0;
  if (!qword_26A3F89C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F89C0);
  }
  return result;
}

unint64_t sub_259ED46AC()
{
  unint64_t result = qword_26A3F89C8;
  if (!qword_26A3F89C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F89C8);
  }
  return result;
}

uint64_t sub_259ED4700()
{
  if (qword_26A3F8798 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_26A3F89B0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_259ED4784()
{
  return *v0;
}

ValueMetadata *type metadata accessor for ErrorType()
{
  return &type metadata for ErrorType;
}

ValueMetadata *type metadata accessor for ErrorSubType()
{
  return &type metadata for ErrorSubType;
}

ValueMetadata *type metadata accessor for ErrorSubTypeContext()
{
  return &type metadata for ErrorSubTypeContext;
}

unsigned char *storeEnumTagSinglePayload for PnRError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259ED488CLL);
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

ValueMetadata *type metadata accessor for PnRError()
{
  return &type metadata for PnRError;
}

unint64_t sub_259ED48C4()
{
  unint64_t result = qword_26A3F89D0;
  if (!qword_26A3F89D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F89D0);
  }
  return result;
}

uint64_t SELFComponent.MH.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.MH.init()()
{
  return v0;
}

uint64_t sub_259ED4930()
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    return 0;
  }
  id v0 = (id)qword_26A3F8D18;
  uint64_t v1 = sub_259EFEB70();

  if (!v1) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F89D8);
  sub_259ED3468(0, &qword_26A3F89E0);
  sub_259ED55CC(&qword_26A3F89E8, &qword_26A3F89D8);
  unint64_t v2 = sub_259EFED10();
  swift_release();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_259EFEEE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  BOOL v4 = v3 != 0;
  if (!v3)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    MEMORY[0x25A2EEB20](0, v2);
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5) {
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_259ED4AC4()
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    return 0;
  }
  id v0 = (id)qword_26A3F8D18;
  uint64_t v1 = sub_259EFEB30();

  if (!v1) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
  sub_259ED3468(0, &qword_26A3F89F0);
  sub_259ED55CC((unint64_t *)&qword_26A3F88E0, &qword_26A3F88D0);
  unint64_t v2 = sub_259EFED10();
  uint64_t result = swift_release();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_259EFEEE0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      return v4;
    }
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v5 = (id)MEMORY[0x25A2EEB20](0, v2);
    goto LABEL_8;
  }
  if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v5 = *(id *)(v2 + 32);
LABEL_8:
    uint64_t v4 = (uint64_t)v5;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

BOOL sub_259ED4C50(void *a1)
{
  id v1 = objc_msgSend(a1, sel_ended);
  id v2 = v1;
  if (v1) {

  }
  return v2 != 0;
}

void sub_259ED4C94(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    goto LABEL_33;
  }
  id v2 = (id)qword_26A3F8D18;
  uint64_t v3 = sub_259EFEB70();

  if (!v3)
  {
LABEL_18:
    if (!qword_26A3F8D18) {
      goto LABEL_33;
    }
    id v15 = (id)qword_26A3F8D18;
    uint64_t v16 = sub_259EFEB30();

    if (!v16) {
      goto LABEL_33;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
    sub_259ED3468(0, &qword_26A3F89F0);
    sub_259ED55CC((unint64_t *)&qword_26A3F88E0, &qword_26A3F88D0);
    unint64_t v4 = sub_259EFED10();
    swift_release();
    if (!(v4 >> 62))
    {
      if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_32;
      }
LABEL_22:
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v17 = (id)MEMORY[0x25A2EEB20](0, v4);
      }
      else
      {
        if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_37;
        }
        id v17 = *(id *)(v4 + 32);
      }
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_259EFE6C0();
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        uint64_t v12 = sub_259EFE6D0();

        uint64_t v13 = 4;
        goto LABEL_34;
      }
      goto LABEL_39;
    }
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_259EFEEE0();
    swift_bridgeObjectRelease();
    if (!v21) {
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F89D8);
  sub_259ED3468(0, &qword_26A3F89E0);
  sub_259ED55CC(&qword_26A3F89E8, &qword_26A3F89D8);
  unint64_t v4 = sub_259EFED10();
  swift_release();
  if (!(v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_259EFEEE0();
  swift_bridgeObjectRelease();
  if (!v14)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_5:
  if ((v4 & 0xC000000000000001) != 0)
  {
    MEMORY[0x25A2EEB20](0, v4);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    __break(1u);
    goto LABEL_29;
  }
LABEL_7:
  if (!qword_26A3F8D18) {
    goto LABEL_33;
  }
  id v6 = (id)qword_26A3F8D18;
  uint64_t v7 = sub_259EFEB70();

  if (!v7) {
    goto LABEL_33;
  }
  sub_259ED3468(0, &qword_26A3F89F8);
  unint64_t v4 = sub_259EFED10();
  swift_release();
  if (!(v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_259EFEEE0();
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_32:
    swift_bridgeObjectRelease();
LABEL_33:
    uint64_t v12 = 0;
    uint64_t v13 = 12;
    goto LABEL_34;
  }
LABEL_11:
  if ((v4 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v8 = *(id *)(v4 + 32);
      goto LABEL_14;
    }
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
LABEL_37:
  id v8 = (id)MEMORY[0x25A2EEB20](0, v4);
LABEL_14:
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_259EFE6C0();
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = sub_259EFE6D0();

    uint64_t v13 = 9;
LABEL_34:
    *a1 = v13;
    a1[1] = v12;
    return;
  }
LABEL_40:
  __break(1u);
}

BOOL sub_259ED50CC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(a1, sel_ended);

  if (!v5) {
    return 0;
  }
  id v6 = objc_msgSend(a1, sel_trpId);
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = v6;
  sub_259EFEDB0();

  uint64_t v8 = sub_259EFE670();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8) == 1)
  {
    sub_259ED556C((uint64_t)v4);
LABEL_5:
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = sub_259EFE640();
  uint64_t v11 = v12;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v4, v8);
LABEL_7:
  swift_beginAccess();
  if (qword_26A3F8D18)
  {
    id v13 = (id)qword_26A3F8D18;
    uint64_t v14 = sub_259EFEB40();

    uint64_t v24 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A08);
    sub_259ED3468(0, (unint64_t *)&qword_26A3F8A10);
    sub_259ED55CC((unint64_t *)&qword_26A3F8A18, &qword_26A3F8A08);
    id v15 = (void *)sub_259EFED20();
    swift_bridgeObjectRelease();
    if (v15[2])
    {
      uint64_t v17 = v15[4];
      uint64_t v16 = v15[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (!v11) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  if (!v11)
  {
LABEL_10:
    if (v16) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
LABEL_14:
  if (!v16)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v10 == v17 && v11 == v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_259EFEF50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v18 & 1) == 0) {
      return result;
    }
  }
LABEL_20:
  if (qword_26A3F8D18)
  {
    id v20 = (id)qword_26A3F8D18;
    uint64_t v21 = sub_259EFEB40();

    uint64_t v24 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A08);
    sub_259ED3468(0, (unint64_t *)&qword_26A3F8A10);
    sub_259ED55CC((unint64_t *)&qword_26A3F8A18, &qword_26A3F8A08);
    uint64_t v22 = sub_259EFED20();
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(v22 + 16);
    swift_bridgeObjectRelease();
    return v23 != 0;
  }
  return 0;
}

uint64_t SELFComponent.MH.deinit()
{
  return v0;
}

uint64_t SELFComponent.MH.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SELFComponent.MH()
{
  return self;
}

uint64_t method lookup function for SELFComponent.MH(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFComponent.MH);
}

uint64_t dispatch thunk of SELFComponent.MH.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SELFComponent.MH.isMedoc.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of SELFComponent.MH.userStopSpeaking.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of SELFComponent.MH.userSpeakingEnded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_259ED556C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259ED55CC(unint64_t *a1, uint64_t *a2)
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

uint64_t SELFPnREmitter.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t static SELFPnREmitter.instance.getter()
{
  return MEMORY[0x270FA0480](v0, &unk_26A3F87F8);
}

uint64_t SELFPnREmitter.init()()
{
  return v0;
}

void SELFPnREmitter.uploadSiriTurnGrainLatency(for:)(_OWORD *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = a1[1];
  v49[0] = *a1;
  v49[1] = v5;
  long long v6 = a1[3];
  v49[2] = a1[2];
  v49[3] = v6;
  long long v7 = a1[5];
  v49[4] = a1[4];
  v49[5] = v7;
  uint64_t v8 = PnRSiriTurnGrainSummary.createSiriTurnGrainSummarySELFEvent()();
  if (!v8)
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_259EFEC00();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A3F8AB8);
    uint64_t v17 = sub_259EFEBF0();
    os_log_type_t v18 = sub_259EFEDC0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_259EC8000, v17, v18, "uploadSiriTurnGrainLatency failed due to createSELFEvent is nil.", v19, 2u);
      MEMORY[0x25A2EF270](v19, -1, -1);
    }
    goto LABEL_31;
  }
  uint64_t v9 = v8;
  id v10 = [v8 pnrodSiriTurnGrainSummary];
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_turnid);

  if (v12)
  {
    sub_259EFEDB0();

    uint64_t v13 = sub_259EFE670();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v4, 1, v13) == 1)
    {
      sub_259ED556C((uint64_t)v4);
LABEL_6:
      uint64_t v15 = 0;
      id v12 = 0;
      goto LABEL_13;
    }
    uint64_t v15 = sub_259EFE640();
    id v12 = v20;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v13);
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_13:
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_259EFEC00();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26A3F8AB8);
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_259EFEBF0();
  os_log_type_t v24 = sub_259EFEDC0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v48 = v22;
    *(_DWORD *)uint64_t v25 = 136315138;
    *(void *)&v49[0] = v26;
    if (v12) {
      uint64_t v27 = v15;
    }
    else {
      uint64_t v27 = 0;
    }
    if (v12) {
      unint64_t v28 = (unint64_t)v12;
    }
    else {
      unint64_t v28 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_259ED2D5C(v27, v28, (uint64_t *)v49);
    uint64_t v22 = v48;
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259EC8000, v23, v24, "Created now %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v26, -1, -1);
    MEMORY[0x25A2EF270](v25, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v29 = [v9 wrapAsAnyEvent];
  if (v29)
  {
    id v30 = v29;
    unint64_t v31 = v29;
    uint64_t v32 = sub_259EFEBF0();
    os_log_type_t v33 = sub_259EFEDC0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v47 = v31;
      uint64_t v48 = v22;
      id v35 = (uint8_t *)v34;
      uint64_t v36 = (void *)swift_slowAlloc();
      uint64_t v46 = v9;
      *(_DWORD *)id v35 = 138412290;
      *(void *)&v49[0] = v47;
      uint64_t v37 = v47;
      uint64_t v9 = v46;
      sub_259EFEE10();
      *uint64_t v36 = v30;

      _os_log_impl(&dword_259EC8000, v32, v33, "FBF reporter: store the SiriSELFEvent event %@ and send to server", v35, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A20);
      swift_arrayDestroy();
      MEMORY[0x25A2EF270](v36, -1, -1);
      uint64_t v38 = v35;
      unint64_t v31 = v47;
      MEMORY[0x25A2EF270](v38, -1, -1);
    }
    else
    {

      uint64_t v32 = v31;
    }

    id v39 = objc_msgSend(self, sel_sharedLogger);
    uint64_t v40 = (void *)sub_259EFEC80();
    objc_msgSend(v39, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v31, v40, 0);
  }
  uint64_t v41 = v9;
  uint64_t v17 = sub_259EFEBF0();
  os_log_type_t v42 = sub_259EFEDC0();
  if (os_log_type_enabled(v17, v42))
  {
    BOOL v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v43 = 138412290;
    *(void *)&v49[0] = v41;
    uint64_t v45 = v41;
    sub_259EFEE10();
    *uint64_t v44 = v9;

    _os_log_impl(&dword_259EC8000, v17, v42, "Emitted now %@", v43, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A20);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v44, -1, -1);
    MEMORY[0x25A2EF270](v43, -1, -1);

LABEL_31:
    return;
  }
}

void SELFPnREmitter.uploadProvisionalSiriTurnGrainLatency(for:)(uint64_t a1)
{
  uint64_t v19 = *(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional **)(a1 + 88);
  if (!AFIsInternalInstall())
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_259EFEC00();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A3F8AB8);
    id v12 = sub_259EFEBF0();
    os_log_type_t v13 = sub_259EFEDC0();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_17;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "#SELF Uploader: not an internal build. Skipping";
    goto LABEL_16;
  }
  PnRSiriTurnGrainSummary.createProvisionalSELFEvent()(v19);
  if (!v1)
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_259EFEC00();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A3F8AB8);
    id v12 = sub_259EFEBF0();
    os_log_type_t v13 = sub_259EFEDC0();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_17;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "uploadProvisionalSiriTurnGrainLatency failed due to createProvisionalSELFEvent is nil.";
LABEL_16:
    _os_log_impl(&dword_259EC8000, v12, v13, v15, v14, 2u);
    MEMORY[0x25A2EF270](v14, -1, -1);
LABEL_17:

    return;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_wrapAsAnyEvent);
  if (v3)
  {
    unint64_t v4 = v3;
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_259EFEC00();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A3F8AB8);
    id v6 = v4;
    long long v7 = sub_259EFEBF0();
    os_log_type_t v8 = sub_259EFEDC0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      id v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      id v21 = v6;
      id v10 = v6;
      sub_259EFEE10();
      *id v20 = v4;

      id v6 = v21;
      _os_log_impl(&dword_259EC8000, v7, v8, "FBF reporter: store the ProvisionalSELFEvent event %@ and send to server", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A20);
      swift_arrayDestroy();
      MEMORY[0x25A2EF270](v20, -1, -1);
      MEMORY[0x25A2EF270](v9, -1, -1);
    }
    else
    {
    }
    id v17 = objc_msgSend(self, sel_sharedLogger);
    os_log_type_t v18 = (void *)sub_259EFEC80();
    objc_msgSend(v17, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v6, v18, 0);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SELFPnREmitter.uploadIESELF(for:)(Swift::OpaquePointer a1)
{
  uint64_t v1 = *((void *)a1._rawValue + 2);
  if (v1)
  {
    uint64_t v2 = (char *)a1._rawValue + 32;
    swift_bridgeObjectRetain();
    id v3 = (SEL *)&_swift_FORCE_LOAD___swift_signal___PnROnDeviceFramework;
    unint64_t v28 = 0x8000000259F023C0;
    do
    {
      sub_259ED1078((uint64_t)v2, (uint64_t)v25);
      uint64_t v7 = v26;
      uint64_t v8 = v27;
      __swift_project_boxed_opaque_existential_1(v25, v26);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8))
      {
        uint64_t v9 = v26;
        uint64_t v10 = v27;
        __swift_project_boxed_opaque_existential_1(v25, v26);
        uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
        if (v11)
        {
          id v12 = v11;
          id v13 = [v11 v3[147]];

          if (v13)
          {
            if (qword_26B3246C0 != -1) {
              swift_once();
            }
            uint64_t v14 = sub_259EFEC00();
            __swift_project_value_buffer(v14, (uint64_t)qword_26A3F8AB8);
            uint64_t v15 = v13;
            unint64_t v4 = sub_259EFEBF0();
            os_log_type_t v16 = sub_259EFEDC0();
            if (os_log_type_enabled(v4, v16))
            {
              uint64_t v17 = swift_slowAlloc();
              os_log_type_t v18 = v3;
              uint64_t v19 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v17 = 138412290;
              *(void *)(v17 + 4) = v15;
              *uint64_t v19 = v13;
              _os_log_impl(&dword_259EC8000, v4, v16, "FBF reporter: store the event %@ and send to server", (uint8_t *)v17, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A20);
              swift_arrayDestroy();
              id v20 = v19;
              id v3 = v18;
              MEMORY[0x25A2EF270](v20, -1, -1);
              MEMORY[0x25A2EF270](v17, -1, -1);
            }
            else
            {

              unint64_t v4 = v15;
            }

            id v5 = objc_msgSend(self, sel_sharedLogger);
            id v6 = (void *)sub_259EFEC80();
            objc_msgSend(v5, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v15, v6, 0);
          }
        }
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      v2 += 40;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_259EFEC00();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A3F8AB8);
    uint64_t v22 = sub_259EFEBF0();
    os_log_type_t v23 = sub_259EFEDC0();
    if (os_log_type_enabled(v22, v23))
    {
      os_log_type_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v24 = 0;
      _os_log_impl(&dword_259EC8000, v22, v23, "uploadIESELFRequest skipped due to empty IESELFEvent.", v24, 2u);
      MEMORY[0x25A2EF270](v24, -1, -1);
    }
  }
}

uint64_t SELFPnREmitter.deinit()
{
  return v0;
}

uint64_t SELFPnREmitter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

void _s20PnROnDeviceFramework14SELFPnREmitterC42uploadProvisionalSiriTurnGrainDebugSummary3for12errorMessageySSSg_AGtF_0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (!AFIsInternalInstall())
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_259EFEC00();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A3F8AB8);
    oslog = sub_259EFEBF0();
    os_log_type_t v11 = sub_259EFEDC0();
    if (!os_log_type_enabled(oslog, v11)) {
      goto LABEL_21;
    }
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    id v13 = "#SELF Uploader: not an internal build. Skipping";
    goto LABEL_20;
  }
  id v6 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper), sel_init);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary), sel_init);
    if (v8)
    {
      uint64_t v9 = v8;
      if (a2) {
        a2 = (void *)sub_259EFEC80();
      }
      objc_msgSend(v9, sel_setTurnId_, a2);

      if (a4) {
        a4 = (void *)sub_259EFEC80();
      }
      objc_msgSend(v9, sel_setErrorMessage_, a4);

      objc_msgSend(v7, sel_setSiriRequestGrainDebugSummary_, v9);
      objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, v7);

      swift_unknownObjectRelease();
      return;
    }
  }
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_259EFEC00();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A3F8AB8);
  oslog = sub_259EFEBF0();
  os_log_type_t v11 = sub_259EFEDC0();
  if (os_log_type_enabled(oslog, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    id v13 = "PNROnDeviceProvisionalPnRSiriRequestGrainDebugSummary init failed!";
LABEL_20:
    _os_log_impl(&dword_259EC8000, oslog, v11, v13, v12, 2u);
    MEMORY[0x25A2EF270](v12, -1, -1);
  }
LABEL_21:
}

uint64_t type metadata accessor for SELFPnREmitter()
{
  return self;
}

uint64_t method lookup function for SELFPnREmitter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFPnREmitter);
}

uint64_t dispatch thunk of SELFPnREmitter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t SELFComponent.Orch.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.Orch.init()()
{
  return v0;
}

uint64_t sub_259ED6780()
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    return 0;
  }
  id v0 = (id)qword_26A3F8D18;
  sub_259EFEB40();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A08);
  sub_259ED69C8();
  sub_259ED6A08();
  uint64_t v1 = sub_259EFED20();
  swift_bridgeObjectRelease();
  if (!*(void *)(v1 + 16))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v2 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

id sub_259ED6880@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_trpId);
  if (!result) {
    goto LABEL_4;
  }
  id v8 = result;
  sub_259EFEDB0();

  uint64_t v9 = sub_259EFE670();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    id result = (id)sub_259ED556C((uint64_t)v6);
LABEL_4:
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  uint64_t v11 = sub_259EFE640();
  uint64_t v13 = v12;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  *a2 = v11;
  a2[1] = v13;
  return result;
}

unint64_t sub_259ED69C8()
{
  unint64_t result = qword_26A3F8A10;
  if (!qword_26A3F8A10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3F8A10);
  }
  return result;
}

unint64_t sub_259ED6A08()
{
  unint64_t result = qword_26A3F8A18;
  if (!qword_26A3F8A18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F8A08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8A18);
  }
  return result;
}

uint64_t SELFComponent.Orch.deinit()
{
  return v0;
}

uint64_t SELFComponent.Orch.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SELFComponent.Orch()
{
  return self;
}

uint64_t method lookup function for SELFComponent.Orch(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFComponent.Orch);
}

uint64_t dispatch thunk of SELFComponent.Orch.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SELFComponent.Orch.selectedTRPID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t SELFComponent.UEI.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.UEI.init()()
{
  return v0;
}

void sub_259ED6B08(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    goto LABEL_25;
  }
  id v2 = (id)qword_26A3F8D18;
  uint64_t v3 = sub_259EFEB30();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
    sub_259ED3468(0, &qword_26A3F8A28);
    sub_259ED33C4();
    unint64_t v4 = sub_259EFED10();
    swift_release();
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_259EFEEE0();
      swift_bridgeObjectRelease();
      if (v10) {
        goto LABEL_5;
      }
    }
    else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x25A2EEB20](0, v4);
LABEL_8:
        id v6 = v5;
        swift_bridgeObjectRelease();
        uint64_t v7 = sub_259EFE6C0();
        if (v7)
        {
          id v8 = (void *)v7;
          uint64_t v9 = 1;
LABEL_28:
          uint64_t v18 = sub_259EFE6D0();

LABEL_30:
          *a1 = v9;
          a1[1] = v18;
          return;
        }
        goto LABEL_34;
      }
      if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v5 = *(id *)(v4 + 32);
        goto LABEL_8;
      }
      __break(1u);
LABEL_23:
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_259EFEEE0();
      swift_bridgeObjectRelease();
      if (!v15) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
  }
  if (!qword_26A3F8D18 || (id v11 = (id)qword_26A3F8D18, v12 = sub_259EFEB30(), v11, !v12))
  {
LABEL_25:
    sub_259ED93FC();
    if (!v16)
    {
      uint64_t v18 = 0;
      uint64_t v9 = 12;
      goto LABEL_30;
    }
    id v6 = v16;
    uint64_t v17 = sub_259EFE6C0();
    if (v17)
    {
      id v8 = (void *)v17;
      uint64_t v9 = 8;
      goto LABEL_28;
    }
    goto LABEL_33;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
  sub_259ED3468(0, &qword_26A3F8A28);
  sub_259ED33C4();
  unint64_t v4 = sub_259EFED10();
  swift_release();
  if (v4 >> 62) {
    goto LABEL_23;
  }
  if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_16:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x25A2EEB20](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    id v13 = *(id *)(v4 + 32);
  }
  id v6 = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_259EFE6C0();
  if (v14)
  {
    id v8 = (void *)v14;
    uint64_t v9 = 2;
    goto LABEL_28;
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_259ED6E10(void *a1)
{
  unsigned int v2 = objc_msgSend(a1, sel_dialogPhase);
  if ((v2 >= 9 || ((0x107u >> v2) & 1) == 0)
    && (id v3 = objc_msgSend(a1, sel_aceCommandClass)) != 0
    && (unint64_t v4 = v3, v5 = sub_259EFEC90(), v7 = v6, v4, v7))
  {
    if (v5 == 0x5664644149554153 && v7 == 0xEC00000073776569) {
      char v9 = 1;
    }
    else {
      char v9 = sub_259EFEF50();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

uint64_t sub_259ED6F00(void *a1)
{
  unsigned int v2 = objc_msgSend(a1, sel_dialogPhase);
  if (v2 < 9 && ((0x107u >> v2) & 1) != 0) {
    goto LABEL_12;
  }
  id v3 = objc_msgSend(a1, sel_aceCommandClass);
  if (!v3 || (unint64_t v4 = v3, v5 = sub_259EFEC90(), v7 = v6, v4, !v7))
  {
    char v10 = 1;
    return v10 & 1;
  }
  if (v5 == 0x5664644149554153 && v7 == 0xEC00000073776569)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    char v10 = 0;
    return v10 & 1;
  }
  char v9 = sub_259EFEF50();
  swift_bridgeObjectRelease();
  char v10 = v9 ^ 1;
  return v10 & 1;
}

void sub_259ED6FFC(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    goto LABEL_12;
  }
  id v2 = (id)qword_26A3F8D18;
  uint64_t v3 = sub_259EFEB30();

  if (!v3) {
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
  sub_259ED3468(0, &qword_26A3F8A30);
  sub_259ED33C4();
  unint64_t v4 = sub_259EFED10();
  swift_release();
  if (!(v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_259EFEEE0();
  swift_bridgeObjectRelease();
  if (!v11)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v9 = 0;
    uint64_t v10 = 12;
    goto LABEL_13;
  }
LABEL_5:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v5 = (id)MEMORY[0x25A2EEB20](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_16;
    }
    id v5 = *(id *)(v4 + 32);
  }
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_259EFE6C0();
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = sub_259EFE6D0();

    uint64_t v10 = 7;
LABEL_13:
    *a1 = v10;
    a1[1] = v9;
    return;
  }
LABEL_16:
  __break(1u);
}

unint64_t sub_259ED719C()
{
  return sub_259ED7228(type metadata accessor for SISchemaUEIRequestStatus);
}

id sub_259ED71C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result = objc_msgSend(a1, sel_requestStatus);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

unint64_t sub_259ED71FC()
{
  return sub_259ED7228(type metadata accessor for SISchemaUEIRequestType);
}

unint64_t sub_259ED7228(void (*a1)(void))
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    goto LABEL_6;
  }
  id v2 = (id)qword_26A3F8D18;
  uint64_t v3 = sub_259EFEB30();

  if (!v3) {
    goto LABEL_6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
  sub_259ED3468(0, &qword_26A3F88D8);
  a1(0);
  sub_259ED33C4();
  uint64_t v4 = sub_259EFED20();
  swift_release();
  if (!*(void *)(v4 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t v5 = 0;
    unsigned __int8 v6 = 1;
    return v5 | ((unint64_t)v6 << 32);
  }
  uint64_t v5 = *(unsigned int *)(v4 + 32);
  swift_bridgeObjectRelease();
  unsigned __int8 v6 = 0;
  return v5 | ((unint64_t)v6 << 32);
}

id sub_259ED7348@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result = objc_msgSend(a1, sel_requestType);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t sub_259ED737C()
{
  swift_beginAccess();
  if (!qword_26A3F8D18) {
    return 0;
  }
  id v0 = (id)qword_26A3F8D18;
  uint64_t v1 = sub_259EFEB30();

  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88D0);
    sub_259ED3468(0, &qword_26A3F88E8);
    sub_259ED33C4();
    uint64_t v2 = sub_259EFED20();
    swift_release();
    if (*(void *)(v2 + 16))
    {
      uint64_t v1 = *(void *)(v2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v1;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  return v1;
}

void sub_259ED7490(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_error);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_errorDomain);

    if (v6)
    {
      uint64_t v7 = sub_259EFEC90();
      uint64_t v9 = v8;

      id v10 = objc_msgSend(a1, sel_error);
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = objc_msgSend(v10, sel_errorCode);

        if (v12)
        {
          sub_259EFEC90();

          swift_bridgeObjectRetain();
          sub_259EFECF0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_259EFECF0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *a2 = v7;
          a2[1] = v9;
          return;
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  *a2 = 0;
  a2[1] = 0;
}

uint64_t SELFComponent.UEI.deinit()
{
  return v0;
}

uint64_t SELFComponent.UEI.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_259ED75F0(void *a1)
{
  return sub_259ED6F00(a1);
}

uint64_t sub_259ED75F8(void *a1)
{
  return sub_259ED6E10(a1);
}

uint64_t type metadata accessor for SELFComponent.UEI()
{
  return self;
}

uint64_t method lookup function for SELFComponent.UEI(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFComponent.UEI);
}

uint64_t dispatch thunk of SELFComponent.UEI.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SELFComponent.UEI.uufrReady.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of SELFComponent.UEI.invocation.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SELFComponent.UEI.requestStatus.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 112))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of SELFComponent.UEI.requestType.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 120))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of SELFComponent.UEI.error.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t SELFProcessedStreamTurnReader.bookmark.getter()
{
  return swift_retain();
}

uint64_t SELFProcessedStreamTurnReader.bookmark.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

uint64_t (*SELFProcessedStreamTurnReader.bookmark.modify())()
{
  return nullsub_1;
}

uint64_t SELFProcessedStreamTurnReader.init(streamIdentifier:domain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  type metadata accessor for Bookmark();
  id v6 = (void *)swift_allocObject();
  id v7 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v8 = (void *)sub_259EFEC80();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithSuiteName_, v8);

  v6[2] = v9;
  v6[3] = a1;
  v6[4] = a2;
  swift_bridgeObjectRetain();
  uint64_t result = sub_259EFECF0();
  v6[5] = a1;
  v6[6] = a2;
  *a3 = v6;
  return result;
}

uint64_t SELFProcessedStreamTurnReader.read()()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3246F0);
  v1[31] = v2;
  v1[32] = *(void *)(v2 - 8);
  v1[33] = swift_task_alloc();
  uint64_t v3 = sub_259EFE620();
  v1[34] = v3;
  v1[35] = *(void *)(v3 - 8);
  v1[36] = swift_task_alloc();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *v0;
  v1[37] = v4;
  v1[38] = v5;
  return MEMORY[0x270FA2498](sub_259ED79D8, 0, 0);
}

uint64_t sub_259ED79D8()
{
  unint64_t v28 = v0;
  uint64_t v1 = swift_allocObject();
  v0[39] = v1;
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259EFEC00();
  v0[40] = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8AB8);
  swift_retain_n();
  uint64_t v3 = sub_259EFEBF0();
  os_log_type_t v4 = sub_259EFEDC0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[38];
  if (v5)
  {
    os_log_type_t type = v4;
    uint64_t v7 = v0[37];
    uint64_t v8 = v0[35];
    uint64_t v24 = v0[34];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = v26;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_beginAccess();
    uint64_t v10 = *(void *)(v6 + 40);
    unint64_t v11 = *(void *)(v6 + 48);
    swift_bridgeObjectRetain();
    v0[29] = sub_259ED2D5C(v10, v11, &v27);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    sub_259ED1480(v7);
    sub_259ED8C94();
    uint64_t v12 = sub_259EFEF40();
    unint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v24);
    v0[30] = sub_259ED2D5C(v12, v14, &v27);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_259EC8000, v3, type, "Bookmark: %s,  Last Bookmark Time is %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v26, -1, -1);
    MEMORY[0x25A2EF270](v9, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v16 = v0[35];
  uint64_t v15 = v0[36];
  uint64_t v17 = v0[34];
  sub_259EFEB20();
  sub_259EFEB60();
  uint64_t v18 = sub_259EFEB50();
  v0[41] = v18;
  sub_259ED1480(v15);
  sub_259EFE5F0();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v0[42] = v21;
  v0[43] = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v15, v17);
  uint64_t v22 = (void *)swift_task_alloc();
  v0[44] = v22;
  *uint64_t v22 = v0;
  v22[1] = sub_259ED7D84;
  char v31 = 1;
  uint64_t v30 = 0;
  return MEMORY[0x270F085A0](v0 + 2, v18, v20, 0, 0, 1, 0, 1);
}

uint64_t sub_259ED7D84()
{
  uint64_t v2 = *(void **)(*(void *)v1 + 328);
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();

  if (v0) {
    uint64_t v3 = sub_259ED8360;
  }
  else {
    uint64_t v3 = sub_259ED7EB0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_259ED7EB0()
{
  char v31 = v0;
  uint64_t v1 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v4 = v0[31];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  swift_retain();
  sub_259EFEB00();
  sub_259ED8C38();
  swift_retain();
  uint64_t v5 = (void *)sub_259EFE680();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_retain();
  uint64_t v6 = sub_259EFEBF0();
  os_log_type_t v7 = sub_259EFEDC0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = v0[39];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    swift_beginAccess();
    unint64_t v10 = *(void *)(v8 + 16);
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_259EFEEE0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v0[27] = v11;
    sub_259EFEE10();
    swift_release();
    _os_log_impl(&dword_259EC8000, v6, v7, "Received total of %ld turns", v9, 0xCu);
    MEMORY[0x25A2EF270](v9, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v12 = v0[37];
  sub_259EFE610();
  sub_259ED1A78(v12);
  swift_retain_n();
  unint64_t v13 = sub_259EFEBF0();
  os_log_type_t v14 = sub_259EFEDC0();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v28 = (void (*)(uint64_t, uint64_t))v0[42];
    uint64_t v15 = v0[38];
    uint64_t v16 = v0[37];
    uint64_t v27 = v0[34];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = v29;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_beginAccess();
    uint64_t v19 = *(void *)(v15 + 40);
    unint64_t v18 = *(void *)(v15 + 48);
    swift_bridgeObjectRetain();
    v0[24] = sub_259ED2D5C(v19, v18, &v30);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v17 + 12) = 2080;
    sub_259ED1480(v16);
    sub_259ED8C94();
    uint64_t v20 = sub_259EFEF40();
    unint64_t v22 = v21;
    v28(v16, v27);
    v0[25] = sub_259ED2D5C(v20, v22, &v30);
    sub_259EFEE10();
    uint64_t v1 = (uint64_t)(v0 + 2);
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_259EC8000, v13, v14, "Task Completed, Bookmark updated: %s,  Last Bookmark Time is %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v29, -1, -1);
    MEMORY[0x25A2EF270](v17, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();
    swift_release_n();
  }
  uint64_t v23 = v0[39];
  swift_beginAccess();
  uint64_t v24 = *(void *)(v23 + 16);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1(v1);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(uint64_t))v0[1];
  return v25(v24);
}

uint64_t sub_259ED8360()
{
  uint64_t v12 = v0;
  uint64_t v1 = v0[45];
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_259EFEE80();
  v0[22] = 0;
  v0[23] = 0xE000000000000000;
  sub_259EFECF0();
  v0[28] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A40);
  sub_259EFEEC0();
  uint64_t v2 = v0[22];
  unint64_t v3 = v0[23];
  LOBYTE(v11[0]) = 32;
  Logger.error(_:_:)(v2, v3, (char *)v11);
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  uint64_t v4 = sub_259EFEFA0();
  _s20PnROnDeviceFramework14SELFPnREmitterC42uploadProvisionalSiriTurnGrainDebugSummary3for12errorMessageySSSg_AGtF_0(0, 0, v4, v5);
  swift_bridgeObjectRelease();
  if (qword_26A3F8770 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_26A3F8960;
  unint64_t v6 = *(void *)algn_26A3F8968;
  if (qword_26A3F8780 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)v0[45];
  _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(v7, v6, qword_26A3F8980, *(unint64_t *)algn_26A3F8988);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9(0);
}

void sub_259ED8590(void *a1)
{
  if (objc_msgSend(a1, sel_state))
  {
    if (objc_msgSend(a1, sel_state) == (id)1)
    {
      if (qword_26B3246C0 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_259EFEC00();
      __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8AB8);
      char v12 = 64;
      Logger.error(_:_:)(0xD00000000000001ALL, 0x8000000259F02BC0, &v12);
      if (qword_26A3F8770 != -1) {
        swift_once();
      }
      uint64_t v3 = qword_26A3F8960;
      unint64_t v4 = *(void *)algn_26A3F8968;
      if (qword_26A3F8778 != -1) {
        swift_once();
      }
      uint64_t v5 = qword_26A3F8970;
      unint64_t v6 = *(void *)algn_26A3F8978;
      if (qword_26A3F8788 != -1) {
        swift_once();
      }
    }
    else
    {
      if (qword_26B3246C0 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_259EFEC00();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A3F8AB8);
      char v13 = 65;
      Logger.error(_:_:)(0xD00000000000001ALL, 0x8000000259F02BA0, &v13);
      if (qword_26A3F8770 != -1) {
        swift_once();
      }
      uint64_t v3 = qword_26A3F8960;
      unint64_t v4 = *(void *)algn_26A3F8968;
      if (qword_26A3F8778 != -1) {
        swift_once();
      }
      uint64_t v5 = qword_26A3F8970;
      unint64_t v6 = *(void *)algn_26A3F8978;
      if (qword_26A3F8790 != -1) {
        swift_once();
      }
    }
    _s20PnROnDeviceFramework14FileRadarUtilsO14autoBugCapture9errorType0k3SubL003subL7ContextySS_S2StFZ_0(v3, v4, v5, v6);
  }
  else
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_259EFEC00();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A3F8AB8);
    oslog = sub_259EFEBF0();
    os_log_type_t v8 = sub_259EFEDC0();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_259EC8000, oslog, v8, "Received the completion state", v9, 2u);
      MEMORY[0x25A2EF270](v9, -1, -1);
    }
  }
}

void sub_259ED891C(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = (void *)(a2 + 16);
    swift_beginAccess();
    id v4 = a1;
    MEMORY[0x25A2EE9B0]();
    if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_259EFED60();
    }
    sub_259EFED70();
    sub_259EFED50();
    swift_endAccess();
  }
  else
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_259EFEC00();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A3F8AB8);
    oslog = sub_259EFEBF0();
    os_log_type_t v6 = sub_259EFEDC0();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_259EC8000, oslog, v6, "receiving SELFProcessedEvent", v7, 2u);
      MEMORY[0x25A2EF270](v7, -1, -1);
    }
  }
}

uint64_t sub_259ED8A90()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_259ED1338;
  return SELFProcessedStreamTurnReader.read()();
}

uint64_t sub_259ED8B1C()
{
  return swift_retain();
}

void *sub_259ED8B24(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_259EFEF20();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_259ED8BC8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_259ED8BF8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_259ED8C30(void *a1)
{
  sub_259ED891C(a1, v1);
}

unint64_t sub_259ED8C38()
{
  unint64_t result = qword_26A3F8A48;
  if (!qword_26A3F8A48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3246F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8A48);
  }
  return result;
}

unint64_t sub_259ED8C94()
{
  unint64_t result = qword_26A3F8A50;
  if (!qword_26A3F8A50)
  {
    sub_259EFE620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8A50);
  }
  return result;
}

ValueMetadata *type metadata accessor for SELFProcessedStreamTurnReader()
{
  return &type metadata for SELFProcessedStreamTurnReader;
}

PnROnDeviceFramework::SelectedEvent_optional __swiftcall SelectedEvent.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259EFEF30();
  result.value = swift_bridgeObjectRelease();
  char v5 = 12;
  if (v3 < 0xC) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t SelectedEvent.rawValue.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
    case 0xA:
      return result;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0x4E55414C5F494555;
      break;
    case 7:
      unint64_t result = 0x4F564E495F494555;
      break;
    case 8:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000013;
      break;
    case 0xB:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      unint64_t result = 0x4E574F4E4B4E55;
      break;
  }
  return result;
}

uint64_t sub_259ED8EA8()
{
  return sub_259EDEA00();
}

uint64_t sub_259ED8EB4()
{
  return sub_259EFF010();
}

uint64_t sub_259ED8F1C()
{
  SelectedEvent.rawValue.getter();
  sub_259EFECE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259ED8F80()
{
  return sub_259EFF010();
}

PnROnDeviceFramework::SelectedEvent_optional sub_259ED8FE4(Swift::String *a1)
{
  return SelectedEvent.init(rawValue:)(*a1);
}

unint64_t sub_259ED8FF0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SelectedEvent.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void PnREvent.eventName.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t PnREvent.eventTimestamp.getter()
{
  return *(void *)(v0 + 8);
}

unint64_t sub_259ED9030()
{
  unint64_t result = qword_26A3F8A60;
  if (!qword_26A3F8A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8A60);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SelectedEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SelectedEvent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x259ED91E0);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelectedEvent()
{
  return &type metadata for SelectedEvent;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PnREvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF5 && a1[16]) {
    return (*(_DWORD *)a1 + 245);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 0xC;
  int v5 = v3 - 12;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PnREvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(void *)__n128 result = a2 - 245;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 11;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PnREvent()
{
  return &type metadata for PnREvent;
}

uint64_t SELFComponent.Flow.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFComponent.Flow.init()()
{
  return v0;
}

BOOL sub_259ED92D0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_flowState);
  id v2 = v1;
  if (v1) {

  }
  return v2 != 0;
}

id sub_259ED9314(void *a1)
{
  id result = objc_msgSend(a1, sel_flowStep);
  if (result)
  {
    id v2 = result;
    id v3 = objc_msgSend(result, sel_flowState);

    if (v3)
    {
      unsigned int v4 = objc_msgSend(v3, sel_flowStateType);

      return (id)(v4 == 142);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SELFComponent.Flow.deinit()
{
  return v0;
}

uint64_t SELFComponent.Flow.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SELFComponent.Flow()
{
  return self;
}

uint64_t method lookup function for SELFComponent.Flow(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFComponent.Flow);
}

uint64_t dispatch thunk of SELFComponent.Flow.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void sub_259ED93FC()
{
  swift_beginAccess();
  if (qword_26A3F8D18 && (id v0 = (id)qword_26A3F8D18, v1 = sub_259EFEB80(), v0, v1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A68);
    sub_259ED3468(0, &qword_26A3F8A70);
    sub_259ED55CC(&qword_26A3F8A78, &qword_26A3F8A68);
    sub_259EFED10();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A08);
    sub_259ED3468(0, &qword_26A3F8A80);
    sub_259ED55CC((unint64_t *)&qword_26A3F8A18, &qword_26A3F8A08);
    unint64_t v2 = sub_259EFED10();
    swift_bridgeObjectRelease();
    if (v2 >> 62) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v2 = MEMORY[0x263F8EE78];
    if (MEMORY[0x263F8EE78] >> 62)
    {
LABEL_4:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_259EFEEE0();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_8:
  if ((v2 & 0xC000000000000001) != 0)
  {
    MEMORY[0x25A2EEB20](0, v2);
    goto LABEL_11;
  }
  if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v4 = *(id *)(v2 + 32);
    goto LABEL_11;
  }
  __break(1u);
}

id toSISSchemaUUID(convertId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v3 - 8);
  int v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259EFE670();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    sub_259EFE630();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      id v11 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      char v12 = (void *)sub_259EFE650();
      id v10 = objc_msgSend(v11, sel_initWithNSUUID_, v12);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return v10;
    }
    sub_259ED556C((uint64_t)v5);
  }
  return 0;
}

uint64_t dispatch thunk of PnRRecord.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PnRLatencyContextRecord.metricsValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PnRSummary.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PnRSummary.createProvisionalSELFEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PnRSummary.createSiriTurnGrainSummarySELFEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for IELatencyConstantValue()
{
  return &type metadata for IELatencyConstantValue;
}

uint64_t dispatch thunk of IESELFEvent.SELFShouldEmit.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IESELFEvent.getSELFEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for IEIntDimensionConstantValue()
{
  return &type metadata for IEIntDimensionConstantValue;
}

uint64_t dispatch thunk of IELatencySELFEventPnROnDevice.createIESELFEvents()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t IEExecutionGrainMetricsRecord.description.getter()
{
  unint64_t v0 = IEExecutionGrainMetricsRecord.dictionary.getter();
  uint64_t v1 = sub_259EE3414(v0, 1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3) {
    return v1;
  }
  else {
    return 0xD00000000000002CLL;
  }
}

unint64_t IEExecutionGrainMetricsRecord.dictionary.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[5];
  uint64_t v8 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v38 = v0[17];
  uint64_t v9 = v0[19];
  uint64_t v36 = v0[16];
  uint64_t v37 = v0[18];
  uint64_t v10 = v0[20];
  uint64_t v11 = v0[22];
  char v39 = *((unsigned char *)v0 + 168);
  char v40 = *((unsigned char *)v0 + 184);
  uint64_t v41 = v0[24];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259F009E0;
  *(void *)(inited + 32) = 0x496E6F6973736573;
  *(void *)(inited + 40) = 0xE900000000000064;
  uint64_t v13 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = v2;
  uint64_t v14 = v13;
  *(void *)(inited + 72) = v13;
  strcpy((char *)(inited + 80), "rawSessionId");
  *(unsigned char *)(inited + 93) = 0;
  *(_WORD *)(inited + 94) = -5120;
  *(void *)(inited + 96) = v3;
  *(void *)(inited + 104) = v4;
  *(void *)(inited + 120) = v13;
  *(void *)(inited + 128) = 0x6552746E65696C63;
  *(void *)(inited + 136) = 0xEF64497473657571;
  *(void *)(inited + 144) = v5;
  *(void *)(inited + 152) = v6;
  *(void *)(inited + 168) = v13;
  *(void *)(inited + 176) = 0x6D45646C756F6873;
  *(void *)(inited + 184) = 0xEA00000000007469;
  *(void *)(inited + 216) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 192) = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_259ED3630(inited);
  unint64_t v46 = v15;
  if (v7)
  {
    uint64_t v43 = v14;
    *(void *)&long long v42 = v8;
    *((void *)&v42 + 1) = v7;
    sub_259ED3C9C(&v42, &v44);
    unint64_t v16 = v45;
  }
  else
  {
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v16 = sub_259EDB4F8();
    unint64_t v45 = v16;
    *(void *)&long long v44 = v17;
  }
  if (v16)
  {
    sub_259ED3C9C(&v44, &v42);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v42, 0xD000000000000013, 0x8000000259F02540, isUniquelyReferenced_nonNull_native);
    unint64_t v46 = v15;
    swift_bridgeObjectRelease();
    if (v38) {
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_259ED1170((uint64_t)&v44, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000013, 0x8000000259F02540, &v42);
    sub_259ED1170((uint64_t)&v42, &qword_26A3F88B0);
    if (v38)
    {
LABEL_6:
      uint64_t v43 = v14;
      *(void *)&long long v42 = v36;
      *((void *)&v42 + 1) = v38;
      sub_259ED3C9C(&v42, &v44);
      if (v45) {
        goto LABEL_7;
      }
      goto LABEL_17;
    }
  }
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  unint64_t v45 = sub_259EDB4F8();
  *(void *)&long long v44 = v31;
  if (v45)
  {
LABEL_7:
    sub_259ED3C9C(&v44, &v42);
    swift_bridgeObjectRetain();
    unint64_t v19 = v46;
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v42, 0x64496C6F6F74, 0xE600000000000000, v20);
    unint64_t v46 = v19;
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  sub_259ED1170((uint64_t)&v44, &qword_26A3F88B0);
  sub_259EDB05C(0x64496C6F6F74, 0xE600000000000000, &v42);
  sub_259ED1170((uint64_t)&v42, &qword_26A3F88B0);
  if (v9)
  {
LABEL_8:
    uint64_t v43 = v14;
    *(void *)&long long v42 = v37;
    *((void *)&v42 + 1) = v9;
    sub_259ED3C9C(&v42, &v44);
    if (v45) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  unint64_t v45 = sub_259EDB4F8();
  *(void *)&long long v44 = v32;
  if (v45)
  {
LABEL_9:
    sub_259ED3C9C(&v44, &v42);
    swift_bridgeObjectRetain();
    unint64_t v21 = v46;
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v42, 0x646E75426C6F6F74, 0xEC0000006449656CLL, v22);
    unint64_t v46 = v21;
    swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  sub_259ED1170((uint64_t)&v44, &qword_26A3F88B0);
  sub_259EDB05C(0x646E75426C6F6F74, 0xEC0000006449656CLL, &v42);
  sub_259ED1170((uint64_t)&v42, &qword_26A3F88B0);
  if (v39)
  {
LABEL_10:
    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v45 = sub_259EDB4F8();
    *(void *)&long long v44 = v23;
    if (v45) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v43 = MEMORY[0x263F8D538];
  *(void *)&long long v42 = v10;
  sub_259ED3C9C(&v42, &v44);
  if (v45)
  {
LABEL_11:
    sub_259ED3C9C(&v44, &v42);
    unint64_t v24 = v46;
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v42, 0xD000000000000012, 0x8000000259F02480, v25);
    unint64_t v46 = v24;
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  sub_259ED1170((uint64_t)&v44, &qword_26A3F88B0);
  sub_259EDB05C(0xD000000000000012, 0x8000000259F02480, &v42);
  sub_259ED1170((uint64_t)&v42, &qword_26A3F88B0);
  if (v40)
  {
LABEL_12:
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v45 = sub_259EDB4F8();
    *(void *)&long long v44 = v26;
    if (v45) {
      goto LABEL_13;
    }
LABEL_23:
    sub_259ED1170((uint64_t)&v44, &qword_26A3F88B0);
    sub_259EDB05C(0xD00000000000001ALL, 0x8000000259F024A0, &v42);
    sub_259ED1170((uint64_t)&v42, &qword_26A3F88B0);
    if (v41) {
      goto LABEL_14;
    }
LABEL_24:
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v30 = sub_259EDB4F8();
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v43 = MEMORY[0x263F8D538];
  *(void *)&long long v42 = v11;
  sub_259ED3C9C(&v42, &v44);
  if (!v45) {
    goto LABEL_23;
  }
LABEL_13:
  sub_259ED3C9C(&v44, &v42);
  unint64_t v27 = v46;
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(&v42, 0xD00000000000001ALL, 0x8000000259F024A0, v28);
  unint64_t v46 = v27;
  swift_bridgeObjectRelease();
  if (!v41) {
    goto LABEL_24;
  }
LABEL_14:
  id v29 = (id)sub_259EEE578();
  unint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A88);
LABEL_25:
  unint64_t v45 = v30;
  *(void *)&long long v44 = v29;
  sub_259ED3C9C(&v44, &v42);
  unint64_t v33 = v46;
  char v34 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(&v42, 0x496572756C696166, 0xEB000000006F666ELL, v34);
  swift_bridgeObjectRelease();
  return v33;
}

unint64_t sub_259EDA038()
{
  unint64_t v0 = IEExecutionGrainMetricsRecord.dictionary.getter();
  uint64_t v1 = sub_259EE3414(v0, 1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3) {
    return v1;
  }
  else {
    return 0xD00000000000002CLL;
  }
}

uint64_t sub_259EDA0A4()
{
  unint64_t v0 = IEExecutionGrainMetricsRecord.dictionary.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259F002C0;
  *(void *)(inited + 32) = swift_getKeyPath();
  if (*(void *)(v0 + 16) && (unint64_t v2 = sub_259EE9AF0(0xD000000000000012, 0x8000000259F02480), (v3 & 1) != 0))
  {
    sub_259ED34B4(*(void *)(v0 + 56) + 32 * v2, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1))
  {
    sub_259ED1170((uint64_t)&v9, &qword_26A3F88B0);
    goto LABEL_9;
  }
  if (!swift_dynamicCast())
  {
LABEL_9:
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  uint64_t v4 = v8;
LABEL_10:
  *(void *)(inited + 40) = v4;
  unint64_t v5 = sub_259ED379C(inited);
  uint64_t v6 = sub_259EE5A48(v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t IEExecutionGrainMetricsRecord.SELFShouldEmit.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (!v1) {
    return 0;
  }
  if (*(void *)(v0 + 48) == 0xD00000000000001ELL && v1 == 0x8000000259F02C40) {
    return 1;
  }
  return sub_259EFEF50();
}

void *IEExecutionGrainMetricsRecord.getSELFEvent()()
{
  uint64_t v1 = sub_259EFEC00();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v106 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259EFE670();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v106 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v115 = (char *)&v106 - v13;
  uint64_t v120 = *(void *)(v0 + 32);
  uint64_t v119 = *(void *)(v0 + 40);
  uint64_t v122 = *(void *)(v0 + 80);
  uint64_t v121 = *(void *)(v0 + 88);
  uint64_t v124 = *(void *)(v0 + 96);
  uint64_t v123 = *(void *)(v0 + 104);
  uint64_t v116 = *(void *)(v0 + 128);
  v125 = *(void **)(v0 + 136);
  uint64_t v117 = *(void *)(v0 + 144);
  v126 = *(void **)(v0 + 152);
  v118 = *(void **)(v0 + 192);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EA98]), sel_init);
  if (!v14) {
    goto LABEL_26;
  }
  unint64_t v15 = v14;
  v114 = v7;
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAB0]), sel_init);
  if (!v16)
  {

LABEL_26:
    if (qword_26A3F87C0 != -1) {
LABEL_62:
    }
      swift_once();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A3F8B30);
    char v40 = sub_259EFEBF0();
    os_log_type_t v41 = sub_259EFEDC0();
    if (os_log_type_enabled(v40, v41))
    {
      long long v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v42 = 0;
      _os_log_impl(&dword_259EC8000, v40, v41, "PNRODSchemaPNRODIntelligenceFlowActionGrainSummary init failed!", v42, 2u);
      MEMORY[0x25A2EF270](v42, -1, -1);
    }

    return 0;
  }
  id v17 = v16;
  id v145 = v16;
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAA0]), sel_init);
  if (!v18)
  {
    if (qword_26A3F87C0 != -1) {
      goto LABEL_64;
    }
    goto LABEL_33;
  }
  v106 = v12;
  uint64_t v110 = v9;
  uint64_t v107 = v8;
  id v113 = v18;
  v108 = v4;
  uint64_t v109 = v2;
  uint64_t v111 = v1;
  v112 = v15;
  long long v19 = *(_OWORD *)(v0 + 16);
  v128[0] = *(_OWORD *)v0;
  v128[1] = v19;
  uint64_t v129 = v120;
  uint64_t v130 = v119;
  long long v20 = *(_OWORD *)(v0 + 64);
  long long v131 = *(_OWORD *)(v0 + 48);
  long long v132 = v20;
  uint64_t v133 = v122;
  uint64_t v134 = v121;
  uint64_t v135 = v124;
  uint64_t v136 = v123;
  long long v137 = *(_OWORD *)(v0 + 112);
  uint64_t v138 = v116;
  v139 = v125;
  uint64_t v140 = v117;
  v141 = v126;
  long long v21 = *(_OWORD *)(v0 + 176);
  long long v142 = *(_OWORD *)(v0 + 160);
  long long v143 = v21;
  v144 = v118;
  uint64_t v22 = sub_259EDA0A4();
  uint64_t v23 = v22;
  uint64_t v1 = 0;
  uint64_t v24 = v22 + 64;
  uint64_t v25 = 1 << *(unsigned char *)(v22 + 32);
  uint64_t v26 = -1;
  if (v25 < 64) {
    uint64_t v26 = ~(-1 << v25);
  }
  unint64_t v27 = v26 & *(void *)(v22 + 64);
  int64_t v28 = (unint64_t)(v25 + 63) >> 6;
  unint64_t v15 = (void *)0x263F6E000;
  if (!v27) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v29 = __clz(__rbit64(v27));
  v27 &= v27 - 1;
  for (unint64_t i = v29 | (v1 << 6); ; unint64_t i = __clz(__rbit64(v32)) + (v1 << 6))
  {
    uint64_t v34 = 8 * i;
    id v17 = *(void **)(*(void *)(v23 + 48) + v34);
    double v35 = *(double *)(*(void *)(v23 + 56) + v34);
    id v36 = objc_allocWithZone(MEMORY[0x263F6EAC8]);
    swift_retain();
    id v37 = objc_msgSend(v36, sel_init);
    if (!v37)
    {
      if (qword_26A3F87C0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v111, (uint64_t)qword_26A3F8B30);
      uint64_t v48 = sub_259EFEBF0();
      os_log_type_t v49 = sub_259EFEDC0();
      BOOL v50 = os_log_type_enabled(v48, v49);
      v51 = v112;
      id v52 = v113;
      if (v50)
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v53 = 0;
        _os_log_impl(&dword_259EC8000, v48, v49, "PNRODSchemaPNRODMetricDurationMetric init failed!", v53, 2u);
        MEMORY[0x25A2EF270](v53, -1, -1);
      }
      swift_release();

      swift_release();
      return 0;
    }
    uint64_t v38 = v37;
    objc_msgSend(v37, sel_setMetricValue_, v35);
    *(void *)&v128[0] = v38;
    id v39 = v38;
    swift_setAtWritableKeyPath();

    swift_release();
    if (v27) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v31 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_62;
    }
    if (v31 >= v28)
    {
LABEL_41:
      swift_release();
      id v54 = v145;
      uint64_t v55 = v118;
      if (v118)
      {
        id v56 = v145;
        uint64_t v55 = sub_259EED1A4();
      }
      else
      {
        id v57 = v145;
      }
      uint64_t v43 = v112;
      uint64_t v58 = v111;
      uint64_t v59 = v109;
      uint64_t v60 = v107;
      uint64_t v61 = v110;
      objc_msgSend(v54, sel_setFailureInfo_, v55);

      id v62 = v54;
      uint64_t v63 = (uint64_t)v114;
      sub_259EFE630();
      v64 = (SEL *)&_swift_FORCE_LOAD___swift_signal___PnROnDeviceFramework;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v63, 1, v60) == 1)
      {
        sub_259ED1170(v63, &qword_26A3F8A00);
        id v65 = 0;
      }
      else
      {
        uint64_t v66 = v115;
        (*(void (**)(char *, uint64_t, uint64_t))(v61 + 32))(v115, v63, v60);
        id v67 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        uint64_t v68 = (void *)sub_259EFE650();
        v69 = v67;
        v64 = (SEL *)&_swift_FORCE_LOAD___swift_signal___PnROnDeviceFramework;
        id v65 = objc_msgSend(v69, sel_initWithNSUUID_, v68);

        (*(void (**)(char *, uint64_t))(v61 + 8))(v66, v60);
      }
      objc_msgSend(v62, sel_setClientRequestId_, v65);

      id v70 = v145;
      id v71 = toSISSchemaUUID(convertId:)(v122, v121);
      objc_msgSend(v70, sel_setPlanId_, v71);

      id v72 = v70;
      id v73 = toSISSchemaUUID(convertId:)(v124, v123);
      objc_msgSend(v72, sel_setActionId_, v73);

      v74 = v125;
      if (v125)
      {
        id v75 = v72;
        v74 = (void *)sub_259EFEC80();
      }
      else
      {
        id v76 = v72;
      }
      objc_msgSend(v72, sel_setToolId_, v74);

      v77 = v126;
      if (v126)
      {
        id v78 = v72;
        v77 = (void *)sub_259EFEC80();
      }
      else
      {
        id v79 = v72;
      }
      objc_msgSend(v72, sel_setBundleId_, v77);

      v80 = v106;
      sub_259EFE660();
      id v81 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      v82 = (void *)sub_259EFE650();
      id v83 = objc_msgSend(v81, v64[162], v82);

      (*(void (**)(char *, uint64_t))(v110 + 8))(v80, v60);
      id v84 = v113;
      objc_msgSend(v113, sel_setPnrodId_, v83);

      objc_msgSend(v43, sel_setEventMetadata_, v84);
      objc_msgSend(v43, sel_setPnrodIntelligenceFlowActionGrainSummary_, v145);
      if (qword_26A3F87C0 != -1) {
        swift_once();
      }
      uint64_t v85 = __swift_project_value_buffer(v58, (uint64_t)qword_26A3F8B30);
      v86 = v108;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v108, v85, v58);
      id v87 = v43;
      v88 = sub_259EFEBF0();
      os_log_type_t v89 = sub_259EFEDC0();
      if (os_log_type_enabled(v88, v89))
      {
        uint64_t v90 = swift_slowAlloc();
        uint64_t v91 = swift_slowAlloc();
        *(void *)&v128[0] = v91;
        *(_DWORD *)uint64_t v90 = 136315650;
        id v92 = objc_msgSend(v87, sel_qualifiedMessageName);
        uint64_t v93 = sub_259EFEC90();
        unint64_t v95 = v94;

        uint64_t v127 = sub_259ED2D5C(v93, v95, (uint64_t *)v128);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        *(_WORD *)(v90 + 12) = 2080;
        id v96 = objc_msgSend(v87, sel_formattedJsonBody);
        v126 = (void *)v91;
        if (v96)
        {
          v97 = v96;
          uint64_t v98 = sub_259EFEC90();
          unint64_t v100 = v99;
        }
        else
        {
          unint64_t v100 = 0xE500000000000000;
          uint64_t v98 = 0x3E4C494E3CLL;
        }
        uint64_t v127 = sub_259ED2D5C(v98, v100, (uint64_t *)v128);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        *(_WORD *)(v90 + 22) = 2080;
        id v101 = objc_msgSend(v87, sel_description);
        uint64_t v102 = sub_259EFEC90();
        unint64_t v104 = v103;

        uint64_t v127 = sub_259ED2D5C(v102, v104, (uint64_t *)v128);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v88, v89, "Creating %s\n%s\n%s", (uint8_t *)v90, 0x20u);
        v105 = v126;
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v105, -1, -1);
        MEMORY[0x25A2EF270](v90, -1, -1);

        (*(void (**)(char *, uint64_t))(v109 + 8))(v108, v111);
        return v112;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v59 + 8))(v86, v58);
      }
      return v43;
    }
    unint64_t v32 = *(void *)(v24 + 8 * v31);
    ++v1;
    if (!v32)
    {
      uint64_t v1 = v31 + 1;
      if (v31 + 1 >= v28) {
        goto LABEL_41;
      }
      unint64_t v32 = *(void *)(v24 + 8 * v1);
      if (!v32)
      {
        uint64_t v1 = v31 + 2;
        if (v31 + 2 >= v28) {
          goto LABEL_41;
        }
        unint64_t v32 = *(void *)(v24 + 8 * v1);
        if (!v32) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v27 = (v32 - 1) & v32;
  }
  int64_t v33 = v31 + 3;
  if (v33 >= v28) {
    goto LABEL_41;
  }
  unint64_t v32 = *(void *)(v24 + 8 * v33);
  if (v32)
  {
    uint64_t v1 = v33;
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v1 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v1 >= v28) {
      goto LABEL_41;
    }
    unint64_t v32 = *(void *)(v24 + 8 * v1);
    ++v33;
    if (v32) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_64:
  swift_once();
LABEL_33:
  __swift_project_value_buffer(v1, (uint64_t)qword_26A3F8B30);
  unint64_t v45 = sub_259EFEBF0();
  os_log_type_t v46 = sub_259EFEDC0();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_259EC8000, v45, v46, "PNRODSchemaPNRODClientEventMetadata init failed!", v47, 2u);
    MEMORY[0x25A2EF270](v47, -1, -1);
  }

  return 0;
}

uint64_t sub_259EDAFFC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (!v1) {
    return 0;
  }
  if (*(void *)(v0 + 48) == 0xD00000000000001ELL && v1 == 0x8000000259F02C40) {
    return 1;
  }
  return sub_259EFEF50();
}

double sub_259EDB05C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_259EE9AF0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_259EE2014();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_259ED3C9C((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_259EDB160(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_259EDB160(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_259EFEE50();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_259EFEFE0();
        swift_bridgeObjectRetain();
        sub_259EFECE0();
        uint64_t v10 = sub_259EFF010();
        double result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          id v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          id v16 = (_OWORD *)(v15 + 32 * v3);
          id v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *id v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    id v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    id v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_259EDB338(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_259EE9AF0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_259EE2014();
      goto LABEL_7;
    }
    sub_259EE1D14(v15, a4 & 1);
    unint64_t v21 = sub_259EE9AF0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      id v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    double result = (_OWORD *)sub_259EFEF70();
    __break(1u);
    return result;
  }
LABEL_7:
  id v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_259ED3C9C(a1, v19);
  }
LABEL_13:
  sub_259EDB48C(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_259EDB48C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_259ED3C9C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_259EDB4F8()
{
  unint64_t result = qword_26A3F8900;
  if (!qword_26A3F8900)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3F8900);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for IEExecutionGrainMetricsRecord(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IEExecutionGrainMetricsRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for IEExecutionGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  uint64_t v11 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  uint64_t v12 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v13;
  uint64_t v14 = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 176) = v14;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IEExecutionGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v4;
  LOBYTE(v4) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = v4;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy200_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for IEExecutionGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IEExecutionGrainMetricsRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 200)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IEExecutionGrainMetricsRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IEExecutionGrainMetricsRecord()
{
  return &type metadata for IEExecutionGrainMetricsRecord;
}

char *keypath_get_selector_executionTime()
{
  return sel_executionTime;
}

id sub_259EDBAC4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_executionTime);
  *a2 = result;
  return result;
}

id sub_259EDBB00(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExecutionTime_, *a1);
}

uint64_t IEExecutionGrainCalculator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t IEExecutionGrainCalculator.init()()
{
  return v0;
}

uint64_t sub_259EDBB30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  if (result)
  {
    sub_259ECF98C(a2, a3, a4, a5, a6, a7, (uint64_t)v23);
    swift_beginAccess();
    uint64_t v9 = *a9;
    sub_259EDDD20((uint64_t)v23);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a9 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v9 = sub_259EE9674(0, v9[2] + 1, 1, v9);
      *a9 = v9;
    }
    unint64_t v12 = v9[2];
    unint64_t v11 = v9[3];
    if (v12 >= v11 >> 1)
    {
      uint64_t v9 = sub_259EE9674((void *)(v11 > 1), v12 + 1, 1, v9);
      *a9 = v9;
    }
    v9[2] = v12 + 1;
    uint64_t v13 = &v9[25 * v12];
    *((_OWORD *)v13 + 2) = v23[0];
    long long v14 = v23[1];
    long long v15 = v23[2];
    long long v16 = v23[4];
    *((_OWORD *)v13 + 5) = v23[3];
    *((_OWORD *)v13 + 6) = v16;
    *((_OWORD *)v13 + 3) = v14;
    *((_OWORD *)v13 + 4) = v15;
    long long v17 = v23[5];
    long long v18 = v23[6];
    long long v19 = v23[8];
    *((_OWORD *)v13 + 9) = v23[7];
    *((_OWORD *)v13 + 10) = v19;
    *((_OWORD *)v13 + 7) = v17;
    *((_OWORD *)v13 + 8) = v18;
    long long v20 = v23[9];
    long long v21 = v23[10];
    long long v22 = v23[11];
    v13[28] = v24;
    *((_OWORD *)v13 + 12) = v21;
    *((_OWORD *)v13 + 13) = v22;
    *((_OWORD *)v13 + 11) = v20;
    swift_endAccess();
    return sub_259EDDDF0((uint64_t)v23);
  }
  return result;
}

uint64_t IEExecutionGrainCalculator.deinit()
{
  return v0;
}

uint64_t IEExecutionGrainCalculator.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unsigned __int8 *sub_259EDBCA4(void (*a1)(void, void, void), uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v165 = a6;
  uint64_t v147 = a4;
  uint64_t v148 = a5;
  uint64_t v11 = sub_259EFEC00();
  uint64_t v170 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v162 = (char *)v135 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v152 = (char *)v135 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  v139 = (char *)v135 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  *(void *)&long long v168 = (char *)v135 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v136 = (char *)v135 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v156 = (uint64_t)v135 - v23;
  MEMORY[0x270FA5388](v22);
  v176 = (char *)v135 - v24;
  v169 = (char *)sub_259EFE840();
  v175 = (void (**)(char *, uint64_t))*((void *)v169 - 1);
  uint64_t v25 = MEMORY[0x270FA5388](v169);
  v151 = (char *)v135 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v173 = (char *)v135 - v27;
  uint64_t v177 = sub_259EFE7A0();
  uint64_t v28 = *(void *)(v177 - 8);
  MEMORY[0x270FA5388](v177);
  unint64_t v30 = (char *)v135 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_259EFE750();
  uint64_t v142 = *(void *)(v31 - 8);
  uint64_t v143 = v31;
  MEMORY[0x270FA5388](v31);
  uint64_t v150 = (uint64_t)v135 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A3F87C0 != -1) {
    swift_once();
  }
  uint64_t v164 = a2;
  uint64_t v166 = v11;
  uint64_t v33 = __swift_project_value_buffer(v11, (uint64_t)qword_26A3F8B30);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v174 = v33;
  uint64_t v34 = sub_259EFEBF0();
  os_log_type_t v35 = sub_259EFEDD0();
  BOOL v36 = os_log_type_enabled(v34, v35);
  unint64_t v163 = a7;
  if (v36)
  {
    uint64_t v37 = swift_slowAlloc();
    v172 = a1;
    uint64_t v38 = v37;
    v171 = (unsigned __int8 *)swift_slowAlloc();
    *(void *)&long long v193 = v171;
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v179 = sub_259ED2D5C(v164, a3, (uint64_t *)&v193);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v179 = sub_259ED2D5C(v165, a7, (uint64_t *)&v193);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v34, v35, "start for sessionId: %s clientRequestId: %s", (uint8_t *)v38, 0x16u);
    id v39 = v171;
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v39, -1, -1);
    uint64_t v40 = v38;
    a1 = v172;
    MEMORY[0x25A2EF270](v40, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v41 = v175;
  v206 = (void *)MEMORY[0x263F8EE78];
  (*(void (**)(uint64_t, void, uint64_t))(v142 + 16))(v150, a1, v143);
  sub_259EFE740();
  uint64_t v42 = sub_259EFE790();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v177);
  uint64_t v44 = *(void *)(v42 + 16);
  unint64_t v178 = a3;
  if (v44)
  {
    unint64_t v45 = 0;
    uint64_t v47 = v41[2];
    os_log_type_t v46 = (unsigned __int8 *)(v41 + 2);
    v172 = (void (*)(void, void, void))v47;
    unint64_t v48 = (v46[64] + 32) & ~(unint64_t)v46[64];
    v135[1] = v42;
    unint64_t v49 = v42 + v48;
    uint64_t v167 = *((void *)v46 + 7);
    int v155 = *MEMORY[0x263F516D0];
    int v154 = *MEMORY[0x263F516E0];
    v175 = (void (**)(char *, uint64_t))v46;
    v171 = v46 - 8;
    id v145 = (void (**)(char *, uint64_t))(v170 + 8);
    v146 = (void (**)(char *, uint64_t))(v170 + 16);
    *(void *)&long long v43 = 136315138;
    long long v138 = v43;
    uint64_t v137 = MEMORY[0x263F8EE58] + 8;
    uint64_t v50 = v168;
    ((void (*)(char *, unint64_t, char *))v47)(v173, v42 + v48, v169);
    while (1)
    {
      sub_259EFE7D0();
      uint64_t v53 = sub_259EFE8B0();
      uint64_t v54 = *(void *)(v53 - 8);
      uint64_t v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
      if (v55(v50, 1, v53) == 1)
      {
        sub_259ED1170(v50, &qword_26A3F8870);
        uint64_t v56 = sub_259EFE920();
        uint64_t v57 = (uint64_t)v176;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v176, 1, 1, v56);
      }
      else
      {
        v161 = v55;
        uint64_t v177 = v44;
        uint64_t v58 = v176;
        sub_259EFE8A0();
        uint64_t v57 = (uint64_t)v58;
        uint64_t v44 = v177;
        v160 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        v160(v50, v53);
        uint64_t v59 = sub_259EFE920();
        uint64_t v60 = *(void *)(v59 - 8);
        v158 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 48);
        uint64_t v159 = v60 + 48;
        if (v158(v57, 1, v59) != 1)
        {
          uint64_t v61 = v156;
          sub_259ED0B9C(v57, v156);
          int v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 88))(v61, v59);
          v64 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
          uint64_t v63 = v60 + 8;
          uint64_t v65 = v61;
          uint64_t v66 = v176;
          v153 = v64;
          v64(v65, v59);
          BOOL v67 = v62 == v155 || v62 == v154;
          uint64_t v57 = (uint64_t)v66;
          uint64_t v44 = v177;
          if (v67)
          {
            uint64_t v141 = v63;
            uint64_t v144 = v59;
            sub_259ED1170(v57, &qword_26A3F8878);
            if (v45)
            {
              swift_retain();
              sub_259ECF98C(v164, v178, v147, v148, v165, v163, (uint64_t)&v193);
              long long v189 = v203;
              long long v190 = v204;
              uint64_t v191 = v205;
              long long v185 = v199;
              long long v186 = v200;
              long long v187 = v201;
              long long v188 = v202;
              long long v181 = v195;
              long long v182 = v196;
              long long v183 = v197;
              long long v184 = v198;
              long long v179 = v193;
              long long v180 = v194;
              swift_beginAccess();
              uint64_t v68 = v206;
              sub_259EDDD20((uint64_t)&v179);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v68 = sub_259EE9674(0, v68[2] + 1, 1, v68);
              }
              unint64_t v70 = v68[2];
              unint64_t v69 = v68[3];
              if (v70 >= v69 >> 1) {
                uint64_t v68 = sub_259EE9674((void *)(v69 > 1), v70 + 1, 1, v68);
              }
              v68[2] = v70 + 1;
              id v71 = &v68[25 * v70];
              *((_OWORD *)v71 + 2) = v179;
              long long v72 = v180;
              long long v73 = v181;
              long long v74 = v183;
              *((_OWORD *)v71 + 5) = v182;
              *((_OWORD *)v71 + 6) = v74;
              *((_OWORD *)v71 + 3) = v72;
              *((_OWORD *)v71 + 4) = v73;
              long long v75 = v184;
              long long v76 = v185;
              long long v77 = v187;
              *((_OWORD *)v71 + 9) = v186;
              *((_OWORD *)v71 + 10) = v77;
              *((_OWORD *)v71 + 7) = v75;
              *((_OWORD *)v71 + 8) = v76;
              long long v78 = v188;
              long long v79 = v189;
              long long v80 = v190;
              v71[28] = v191;
              *((_OWORD *)v71 + 12) = v79;
              *((_OWORD *)v71 + 13) = v80;
              *((_OWORD *)v71 + 11) = v78;
              v206 = v68;
              swift_endAccess();
              sub_259EDDDF0((uint64_t)&v179);
              swift_release();
            }
            type metadata accessor for IEExecutionGrainSpec();
            swift_allocObject();
            v157 = sub_259ECFBCC();
            swift_release();
            id v81 = v152;
            uint64_t v82 = v166;
            (*v146)(v152, v174);
            id v83 = v151;
            id v84 = v169;
            v172(v151, v173, v169);
            uint64_t v85 = sub_259EFEBF0();
            int v149 = sub_259EFEDD0();
            if (os_log_type_enabled(v85, (os_log_type_t)v149))
            {
              uint64_t v86 = swift_slowAlloc();
              uint64_t v140 = swift_slowAlloc();
              *(void *)&long long v193 = v140;
              *(_DWORD *)uint64_t v86 = v138;
              uint64_t v87 = (uint64_t)v139;
              sub_259EFE7D0();
              if (v161(v87, 1, v53) == 1)
              {
                sub_259ED1170(v87, &qword_26A3F8870);
                unint64_t v88 = 0xE300000000000000;
                uint64_t v89 = 7104878;
                unint64_t v45 = v157;
                uint64_t v50 = v168;
                uint64_t v52 = (uint64_t)v173;
              }
              else
              {
                uint64_t v90 = v86;
                uint64_t v91 = (uint64_t)v136;
                sub_259EFE8A0();
                v160(v87, v53);
                uint64_t v92 = v144;
                int v93 = v158(v91, 1, v144);
                uint64_t v52 = (uint64_t)v173;
                if (v93 == 1)
                {
                  sub_259ED1170(v91, &qword_26A3F8878);
                  unint64_t v88 = 0xE300000000000000;
                  uint64_t v89 = 7104878;
                }
                else
                {
                  uint64_t v89 = sub_259EFE910();
                  unint64_t v88 = v94;
                  v153(v91, v92);
                }
                unint64_t v45 = v157;
                uint64_t v50 = v168;
                uint64_t v86 = v90;
              }
              *(void *)(v86 + 4) = sub_259ED2D5C(v89, v88, (uint64_t *)&v193);
              swift_bridgeObjectRelease();
              v51 = v169;
              (*(void (**)(char *, char *))v171)(v151, v169);
              _os_log_impl(&dword_259EC8000, v85, (os_log_type_t)v149, "handling event %s", (uint8_t *)v86, 0xCu);
              uint64_t v95 = v140;
              swift_arrayDestroy();
              MEMORY[0x25A2EF270](v95, -1, -1);
              MEMORY[0x25A2EF270](v86, -1, -1);

              (*v145)(v152, v166);
            }
            else
            {
              (*(void (**)(char *, char *))v171)(v83, v84);

              (*v145)(v81, v82);
              unint64_t v45 = v157;
              uint64_t v50 = v168;
              v51 = v84;
              uint64_t v52 = (uint64_t)v173;
            }
            uint64_t v44 = v177;
LABEL_10:
            swift_retain();
            sub_259ECF530(v52);
            swift_release();
            goto LABEL_11;
          }
        }
      }
      sub_259ED1170(v57, &qword_26A3F8878);
      uint64_t v50 = v168;
      v51 = v169;
      uint64_t v52 = (uint64_t)v173;
      if (v45) {
        goto LABEL_10;
      }
LABEL_11:
      (*(void (**)(uint64_t, char *))v171)(v52, v51);
      v49 += v167;
      if (!--v44)
      {
        swift_bridgeObjectRelease();
        a3 = v178;
        goto LABEL_39;
      }
      v172(v52, v49, v51);
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v45 = 0;
LABEL_39:
  uint64_t v96 = swift_retain();
  uint64_t v97 = v164;
  uint64_t v98 = v165;
  unint64_t v99 = v163;
  uint64_t v100 = v150;
  sub_259EDBB30(v96, v164, a3, v147, v148, v165, v163, v150, &v206);
  v157 = v45;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v142 + 8))(v100, v143);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v101 = sub_259EFEBF0();
  os_log_type_t v102 = sub_259EFEDD0();
  if (os_log_type_enabled(v101, v102))
  {
    uint64_t v103 = swift_slowAlloc();
    uint64_t v104 = swift_slowAlloc();
    *(void *)&long long v193 = v104;
    *(_DWORD *)uint64_t v103 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v179 = sub_259ED2D5C(v97, a3, (uint64_t *)&v193);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v103 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v179 = sub_259ED2D5C(v98, v99, (uint64_t *)&v193);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v101, v102, "end for sessionId: %s clientRequestId: %s", (uint8_t *)v103, 0x16u);
    uint64_t v105 = MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v104, -1, -1);
    MEMORY[0x25A2EF270](v103, -1, -1);

    uint64_t v106 = v166;
    uint64_t v107 = v162;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v106 = v166;
    uint64_t v107 = v162;
    uint64_t v105 = MEMORY[0x263F8EE58];
  }
  swift_beginAccess();
  v108 = (unsigned __int8 *)v206;
  uint64_t v109 = v206[2];
  if (v109)
  {
    uint64_t v110 = *(char **)(v170 + 16);
    v170 += 16;
    v175 = (void (**)(char *, uint64_t))(v170 - 8);
    v176 = v110;
    v169 = (char *)&v179 + 8;
    swift_bridgeObjectRetain();
    uint64_t v111 = 32;
    *(void *)&long long v112 = 136315906;
    long long v168 = v112;
    uint64_t v167 = v105 + 8;
    id v113 = (char *)(v109 - 1);
    v171 = v108;
    while (1)
    {
      uint64_t v177 = v111;
      long long v193 = *(_OWORD *)&v108[v111];
      long long v114 = *(_OWORD *)&v108[v111 + 16];
      long long v115 = *(_OWORD *)&v108[v111 + 32];
      long long v116 = *(_OWORD *)&v108[v111 + 64];
      long long v196 = *(_OWORD *)&v108[v111 + 48];
      long long v197 = v116;
      long long v194 = v114;
      long long v195 = v115;
      long long v117 = *(_OWORD *)&v108[v111 + 80];
      long long v118 = *(_OWORD *)&v108[v111 + 96];
      long long v119 = *(_OWORD *)&v108[v111 + 128];
      long long v200 = *(_OWORD *)&v108[v111 + 112];
      long long v201 = v119;
      long long v198 = v117;
      long long v199 = v118;
      long long v120 = *(_OWORD *)&v108[v111 + 144];
      long long v121 = *(_OWORD *)&v108[v111 + 160];
      long long v122 = *(_OWORD *)&v108[v111 + 176];
      uint64_t v205 = *(void *)&v108[v111 + 192];
      long long v203 = v121;
      long long v204 = v122;
      long long v202 = v120;
      ((void (*)(char *, uint64_t, uint64_t))v176)(v107, v174, v106);
      sub_259EDDD20((uint64_t)&v193);
      sub_259EDDD20((uint64_t)&v193);
      sub_259EDDD20((uint64_t)&v193);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_259EDDD20((uint64_t)&v193);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_259EDDD20((uint64_t)&v193);
      uint64_t v123 = sub_259EFEBF0();
      os_log_type_t v124 = sub_259EFEDD0();
      if (os_log_type_enabled(v123, v124))
      {
        long long v125 = v199;
        uint64_t v126 = swift_slowAlloc();
        v172 = (void (*)(void, void, void))swift_slowAlloc();
        v192 = v172;
        *(_DWORD *)uint64_t v126 = v168;
        swift_bridgeObjectRetain();
        *(void *)&long long v179 = sub_259ED2D5C(v164, v178, (uint64_t *)&v192);
        v173 = v113;
        sub_259EFEE10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v126 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&long long v179 = sub_259ED2D5C(v165, v99, (uint64_t *)&v192);
        sub_259EFEE10();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v126 + 22) = 2080;
        uint64_t v127 = *((void *)&v125 + 1) ? v125 : 7104878;
        unint64_t v128 = *((void *)&v125 + 1) ? *((void *)&v125 + 1) : 0xE300000000000000;
        swift_bridgeObjectRetain();
        *(void *)&long long v179 = sub_259ED2D5C(v127, v128, (uint64_t *)&v192);
        sub_259EFEE10();
        swift_bridgeObjectRelease();
        sub_259EDDDF0((uint64_t)&v193);
        sub_259EDDDF0((uint64_t)&v193);
        *(_WORD *)(v126 + 32) = 2080;
        long long v189 = v203;
        long long v190 = v204;
        uint64_t v191 = v205;
        long long v185 = v199;
        long long v186 = v200;
        long long v187 = v201;
        long long v188 = v202;
        long long v181 = v195;
        long long v182 = v196;
        long long v183 = v197;
        long long v184 = v198;
        long long v179 = v193;
        long long v180 = v194;
        IEExecutionGrainMetricsRecord.dictionary.getter();
        uint64_t v129 = sub_259EFEC30();
        unint64_t v131 = v130;
        swift_bridgeObjectRelease();
        *(void *)&long long v179 = sub_259ED2D5C(v129, v131, (uint64_t *)&v192);
        id v113 = v173;
        sub_259EFEE10();
        unint64_t v99 = v163;
        swift_bridgeObjectRelease();
        sub_259EDDDF0((uint64_t)&v193);
        sub_259EDDDF0((uint64_t)&v193);
        _os_log_impl(&dword_259EC8000, v123, v124, "computed for sessionId: %s clientRequestId: %s %s\n%s", (uint8_t *)v126, 0x2Au);
        long long v132 = v172;
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v132, -1, -1);
        uint64_t v133 = v126;
        v108 = v171;
        uint64_t v106 = v166;
        uint64_t v107 = v162;
        MEMORY[0x25A2EF270](v133, -1, -1);

        sub_259EDDDF0((uint64_t)&v193);
      }
      else
      {
        sub_259EDDDF0((uint64_t)&v193);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        sub_259EDDDF0((uint64_t)&v193);
        sub_259EDDDF0((uint64_t)&v193);
        sub_259EDDDF0((uint64_t)&v193);
        sub_259EDDDF0((uint64_t)&v193);
      }
      (*v175)(v107, v106);
      if (!v113) {
        break;
      }
      --v113;
      uint64_t v111 = v177 + 200;
    }
    swift_bridgeObjectRelease();
    v108 = (unsigned __int8 *)v206;
  }
  swift_release();
  return v108;
}

uint64_t sub_259EDCFE8()
{
  uint64_t v0 = sub_259EFE750();
  uint64_t v98 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v107 = (char *)v82 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A98);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (void *)((char *)v82 - v6);
  unint64_t v8 = sub_259EFE780();
  uint64_t v87 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v105 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  int v93 = (void *)((char *)v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v82 - v13;
  if (qword_26A3F87C0 != -1) {
    goto LABEL_89;
  }
  while (1)
  {
    uint64_t v15 = sub_259EFEC00();
    v82[1] = __swift_project_value_buffer(v15, (uint64_t)qword_26A3F8B30);
    uint64_t v16 = sub_259EFEBF0();
    os_log_type_t v17 = sub_259EFEDD0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_259EC8000, v16, v17, "calculator start", v18, 2u);
      MEMORY[0x25A2EF270](v18, -1, -1);
    }

    uint64_t v109 = (void *)MEMORY[0x263F8EE78];
    uint64_t v19 = sub_259EFE7B0();
    int64_t v92 = 0;
    uint64_t v20 = *(void *)(v19 + 64);
    uint64_t v83 = v19 + 64;
    uint64_t v86 = v19;
    uint64_t v21 = 1 << *(unsigned char *)(v19 + 32);
    uint64_t v22 = v21 < 64 ? ~(-1 << v21) : -1;
    unint64_t v23 = v22 & v20;
    uint64_t v85 = v87 + 16;
    uint64_t v91 = (void (**)(char *, char *, unint64_t))(v87 + 32);
    uint64_t v97 = v98 + 16;
    uint64_t v100 = (void (**)(char *, uint64_t))(v98 + 8);
    id v101 = (void (**)(char *, char *, uint64_t))(v98 + 32);
    uint64_t v89 = (void (**)(char *, unint64_t))(v87 + 8);
    int64_t v84 = (unint64_t)(v21 + 63) >> 6;
    v82[0] = v84 - 1;
    uint64_t v103 = v7;
    unint64_t v90 = v8;
LABEL_9:
    uint64_t v24 = (uint64_t)v93;
    if (!v23) {
      break;
    }
    uint64_t v94 = (v23 - 1) & v23;
    unint64_t v25 = __clz(__rbit64(v23)) | (v92 << 6);
LABEL_11:
    uint64_t v26 = *(void *)(v86 + 56);
    uint64_t v27 = (void *)(*(void *)(v86 + 48) + 16 * v25);
    uint64_t v28 = v27[1];
    uint64_t v24 = (uint64_t)v93;
    *int v93 = *v27;
    *(void *)(v24 + 8) = v28;
    uint64_t v29 = v87;
    uint64_t v30 = v26 + *(void *)(v87 + 72) * v25;
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    (*(void (**)(uint64_t, uint64_t, unint64_t))(v29 + 16))(v24 + *(int *)(v31 + 48), v30, v8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v24, 0, 1, v31);
    swift_bridgeObjectRetain();
LABEL_30:
    sub_259EDDCBC(v24, (uint64_t)v14, &qword_26A3F8AA0);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v14, 1, v36) == 1)
    {
      swift_release();
      long long v74 = v109;
      swift_bridgeObjectRetain();
      long long v75 = sub_259EFEBF0();
      os_log_type_t v76 = sub_259EFEDD0();
      if (os_log_type_enabled(v75, v76))
      {
        long long v77 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)long long v77 = 134217984;
        uint64_t v108 = v74[2];
        sub_259EFEE10();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v75, v76, "computed metrics for %ld requests", v77, 0xCu);
        MEMORY[0x25A2EF270](v77, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      long long v78 = sub_259EFEBF0();
      os_log_type_t v79 = sub_259EFEDD0();
      if (os_log_type_enabled(v78, v79))
      {
        long long v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v80 = 0;
        _os_log_impl(&dword_259EC8000, v78, v79, "calculator end", v80, 2u);
        MEMORY[0x25A2EF270](v80, -1, -1);
      }

      swift_beginAccess();
      return (uint64_t)v109;
    }
    uint64_t v102 = *(void *)v14;
    unint64_t v104 = *((void *)v14 + 1);
    (*v91)(v105, &v14[*(int *)(v36 + 48)], v8);
    uint64_t v37 = sub_259EFE770();
    int64_t v106 = 0;
    uint64_t v38 = *(void *)(v37 + 64);
    uint64_t v95 = v37 + 64;
    uint64_t v99 = v37;
    uint64_t v39 = 1 << *(unsigned char *)(v37 + 32);
    if (v39 < 64) {
      uint64_t v40 = ~(-1 << v39);
    }
    else {
      uint64_t v40 = -1;
    }
    unint64_t v8 = v40 & v38;
    int64_t v96 = (unint64_t)(v39 + 63) >> 6;
    int64_t v88 = v96 - 1;
    os_log_type_t v41 = v103;
    uint64_t v7 = &qword_26A3F8AB0;
    while (1)
    {
      if (v8)
      {
        unint64_t v42 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v43 = v42 | (v106 << 6);
        goto LABEL_39;
      }
      int64_t v50 = v106 + 1;
      if (__OFADD__(v106, 1)) {
        goto LABEL_86;
      }
      if (v50 < v96)
      {
        unint64_t v51 = *(void *)(v95 + 8 * v50);
        if (v51) {
          goto LABEL_43;
        }
        int64_t v52 = v106 + 2;
        ++v106;
        if (v50 + 1 < v96)
        {
          unint64_t v51 = *(void *)(v95 + 8 * v52);
          if (v51) {
            goto LABEL_46;
          }
          int64_t v106 = v50 + 1;
          if (v50 + 2 < v96)
          {
            unint64_t v51 = *(void *)(v95 + 8 * (v50 + 2));
            if (v51)
            {
              v50 += 2;
LABEL_43:
              unint64_t v8 = (v51 - 1) & v51;
              unint64_t v43 = __clz(__rbit64(v51)) + (v50 << 6);
              int64_t v106 = v50;
LABEL_39:
              uint64_t v44 = v98;
              uint64_t v45 = *(void *)(v99 + 56);
              os_log_type_t v46 = (void *)(*(void *)(v99 + 48) + 16 * v43);
              uint64_t v47 = v46[1];
              *(void *)uint64_t v5 = *v46;
              *((void *)v5 + 1) = v47;
              uint64_t v48 = v45 + *(void *)(v44 + 72) * v43;
              uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
              (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(&v5[*(int *)(v49 + 48)], v48, v0);
              (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v5, 0, 1, v49);
              swift_bridgeObjectRetain();
              goto LABEL_58;
            }
            int64_t v52 = v50 + 3;
            int64_t v106 = v50 + 2;
            if (v50 + 3 < v96) {
              break;
            }
          }
        }
      }
LABEL_57:
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v5, 1, 1, v53);
      unint64_t v8 = 0;
LABEL_58:
      sub_259EDDCBC((uint64_t)v5, (uint64_t)v41, &qword_26A3F8A98);
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v41, 1, v54) == 1)
      {
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v8 = v90;
        (*v89)(v105, v90);
        unint64_t v23 = v94;
        goto LABEL_9;
      }
      uint64_t v7 = (uint64_t *)v5;
      uint64_t v5 = v14;
      uint64_t v55 = *v41;
      unint64_t v56 = v41[1];
      uint64_t v57 = (char *)v41 + *(int *)(v54 + 48);
      uint64_t v14 = v107;
      uint64_t v58 = v0;
      (*v101)(v107, v57, v0);
      uint64_t v59 = sub_259EFE760();
      uint64_t v61 = sub_259EDBCA4((void (*)(void, void, void))v14, v102, v104, v59, v60, v55, v56);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v62 = *((void *)v61 + 2);
      uint64_t v63 = v109;
      int64_t v64 = v109[2];
      uint64_t v0 = v64 + v62;
      if (__OFADD__(v64, v62))
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
        goto LABEL_87;
      }
      char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v0 > v63[3] >> 1)
      {
        if (v64 <= v0) {
          int64_t v66 = v64 + v62;
        }
        else {
          int64_t v66 = v64;
        }
        uint64_t v63 = sub_259EE9674(isUniquelyReferenced_nonNull_native, v66, 1, v63);
      }
      uint64_t v0 = v58;
      uint64_t v14 = v5;
      unint64_t v67 = *((void *)v61 + 2);
      uint64_t v5 = (char *)v7;
      os_log_type_t v41 = v103;
      if (v67)
      {
        uint64_t v68 = v63[2];
        uint64_t v7 = &qword_26A3F8AB0;
        if ((v63[3] >> 1) - v68 < (uint64_t)v67) {
          goto LABEL_84;
        }
        unint64_t v69 = (unint64_t)&v63[25 * v68 + 4];
        if ((unint64_t)(v61 + 32) < v69 + 200 * v67 && v69 < (unint64_t)&v61[200 * v67 + 32]) {
          goto LABEL_91;
        }
        swift_arrayInitWithCopy();
        if (v67 < v62) {
          goto LABEL_83;
        }
        uint64_t v71 = v63[2];
        BOOL v72 = __OFADD__(v71, v67);
        uint64_t v73 = v71 + v67;
        if (v72) {
          goto LABEL_85;
        }
        v63[2] = v73;
      }
      else
      {
        uint64_t v7 = &qword_26A3F8AB0;
        if (v62) {
          goto LABEL_83;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v109 = v63;
      (*v100)(v107, v0);
    }
    unint64_t v51 = *(void *)(v95 + 8 * v52);
    if (v51)
    {
LABEL_46:
      int64_t v50 = v52;
      goto LABEL_43;
    }
    while (1)
    {
      int64_t v50 = v52 + 1;
      if (__OFADD__(v52, 1)) {
        break;
      }
      if (v50 >= v96)
      {
        int64_t v106 = v88;
        goto LABEL_57;
      }
      unint64_t v51 = *(void *)(v95 + 8 * v50);
      ++v52;
      if (v51) {
        goto LABEL_43;
      }
    }
LABEL_88:
    __break(1u);
LABEL_89:
    swift_once();
  }
  int64_t v32 = v92 + 1;
  if (__OFADD__(v92, 1))
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v32 >= v84)
  {
LABEL_29:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v24, 1, 1, v35);
    uint64_t v94 = 0;
    goto LABEL_30;
  }
  unint64_t v33 = *(void *)(v83 + 8 * v32);
  if (v33)
  {
LABEL_15:
    uint64_t v94 = (v33 - 1) & v33;
    unint64_t v25 = __clz(__rbit64(v33)) + (v32 << 6);
    int64_t v92 = v32;
    goto LABEL_11;
  }
  int64_t v34 = v92 + 2;
  ++v92;
  if (v32 + 1 >= v84) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v83 + 8 * v34);
  if (v33) {
    goto LABEL_18;
  }
  int64_t v92 = v32 + 1;
  if (v32 + 2 >= v84) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v83 + 8 * (v32 + 2));
  if (v33)
  {
    v32 += 2;
    goto LABEL_15;
  }
  int64_t v34 = v32 + 3;
  int64_t v92 = v32 + 2;
  if (v32 + 3 >= v84) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v83 + 8 * v34);
  if (v33)
  {
LABEL_18:
    int64_t v32 = v34;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v32 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v32 >= v84)
    {
      int64_t v92 = v82[0];
      goto LABEL_29;
    }
    unint64_t v33 = *(void *)(v83 + 8 * v32);
    ++v34;
    if (v33) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_91:
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for IEExecutionGrainCalculator()
{
  return self;
}

uint64_t method lookup function for IEExecutionGrainCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IEExecutionGrainCalculator);
}

uint64_t dispatch thunk of IEExecutionGrainCalculator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of IEExecutionGrainCalculator.extractMetrics(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t sub_259EDDCBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_259EDDD20(uint64_t a1)
{
  return a1;
}

uint64_t sub_259EDDDF0(uint64_t a1)
{
  return a1;
}

void Logger.debug(_:_:)(uint64_t a1, unint64_t a2, char *a3)
{
}

void Logger.error(_:_:)(uint64_t a1, unint64_t a2, char *a3)
{
}

void sub_259EDDEF0(uint64_t a1, unint64_t a2, char *a3, uint64_t (*a4)(void))
{
  char v7 = *a3;
  swift_bridgeObjectRetain_n();
  unint64_t v8 = sub_259EFEBF0();
  os_log_type_t v9 = a4();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain();
    sub_259ED2D5C(a1, a2, &v12);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v8, v9, "%s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v11, -1, -1);
    MEMORY[0x25A2EF270](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  LOBYTE(v12) = v7;
  _s20PnROnDeviceFramework20CoreAnalyticsServiceO017submitReliabilityF08category6reasonyAA0I8CategoryO_SStFZ_0((unsigned __int8 *)&v12, a1, a2);
}

uint64_t sub_259EDE074(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8AB8);
}

uint64_t static Logger.pnr.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26B3246C0, (uint64_t)qword_26A3F8AB8, a1);
}

uint64_t sub_259EDE0BC(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8AD0);
}

uint64_t static Logger.pnrworker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26A3F87A0, (uint64_t)qword_26A3F8AD0, a1);
}

uint64_t sub_259EDE104(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8AE8);
}

uint64_t static Logger.IELatencyIntervalSpec.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26A3F87A8, (uint64_t)qword_26A3F8AE8, a1);
}

uint64_t sub_259EDE14C(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8B00);
}

uint64_t static Logger.IERequestGrainCalculator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26A3F87B0, (uint64_t)qword_26A3F8B00, a1);
}

uint64_t sub_259EDE194(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8B18);
}

uint64_t static Logger.IEPlannerGrainCalculator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26A3F87B8, (uint64_t)qword_26A3F8B18, a1);
}

uint64_t sub_259EDE1DC(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8B30);
}

uint64_t static Logger.IEExecutionGrainCalculator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26A3F87C0, (uint64_t)qword_26A3F8B30, a1);
}

uint64_t sub_259EDE224(uint64_t a1)
{
  return sub_259EDE248(a1, qword_26A3F8B48);
}

uint64_t sub_259EDE248(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_259EFEC00();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_259EDE3A4();
  sub_259EFEDE0();
  return sub_259EFEC10();
}

uint64_t static Logger.IEReliabilityCalculator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_259EDE2FC(&qword_26A3F87C8, (uint64_t)qword_26A3F8B48, a1);
}

uint64_t sub_259EDE2FC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_259EFEC00();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  char v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

unint64_t sub_259EDE3A4()
{
  unint64_t result = qword_26A3F8B60;
  if (!qword_26A3F8B60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3F8B60);
  }
  return result;
}

uint64_t sub_259EDE3E4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000016;
  }
  else {
    unint64_t v3 = 0x45636972656E6567;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000726F7272;
  }
  else {
    unint64_t v4 = 0x8000000259F02030;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000016;
  }
  else {
    unint64_t v5 = 0x45636972656E6567;
  }
  if (a2) {
    unint64_t v6 = 0x8000000259F02030;
  }
  else {
    unint64_t v6 = 0xEC000000726F7272;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_259EFEF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_259EDE494(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x5564616552535062;
  }
  else {
    uint64_t v3 = 0x4664616552535062;
  }
  if (v2) {
    unint64_t v4 = 0xED000064656C6961;
  }
  else {
    unint64_t v4 = 0xEE006E776F6E6B6ELL;
  }
  if (a2) {
    uint64_t v5 = 0x5564616552535062;
  }
  else {
    uint64_t v5 = 0x4664616552535062;
  }
  if (a2) {
    unint64_t v6 = 0xEE006E776F6E6B6ELL;
  }
  else {
    unint64_t v6 = 0xED000064656C6961;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_259EFEF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_259EDE550(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000002BLL;
  unint64_t v4 = 0x8000000259F01F60;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000020;
      uint64_t v5 = "siriTurnGrainLatencyUploadFailed";
      goto LABEL_7;
    case 2:
      unint64_t v6 = "IERequestGrainUploadFailed";
      goto LABEL_5;
    case 3:
      unint64_t v6 = "IEPlannerGrainUploadFailed";
LABEL_5:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD00000000000001ALL;
      break;
    case 4:
      unint64_t v3 = 0xD000000000000019;
      uint64_t v5 = "IEActionGrainUploadFailed";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD00000000000002BLL;
  unint64_t v8 = 0x8000000259F01F60;
  switch(a2)
  {
    case 1:
      unint64_t v9 = 0xD000000000000020;
      uint64_t v10 = "siriTurnGrainLatencyUploadFailed";
      goto LABEL_16;
    case 2:
      uint64_t v11 = "IERequestGrainUploadFailed";
      goto LABEL_12;
    case 3:
      uint64_t v11 = "IEPlannerGrainUploadFailed";
LABEL_12:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD00000000000001ALL;
      goto LABEL_13;
    case 4:
      unint64_t v9 = 0xD000000000000019;
      uint64_t v10 = "IEActionGrainUploadFailed";
LABEL_16:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      if (v3 == v9) {
        goto LABEL_17;
      }
      goto LABEL_19;
    default:
LABEL_13:
      if (v3 != v7) {
        goto LABEL_19;
      }
LABEL_17:
      if (v4 == v8) {
        char v12 = 1;
      }
      else {
LABEL_19:
      }
        char v12 = sub_259EFEF50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12 & 1;
  }
}

uint64_t sub_259EDE6F0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000015;
  }
  else {
    unint64_t v3 = 0xD000000000000017;
  }
  if (v2) {
    unint64_t v4 = 0x8000000259F02050;
  }
  else {
    unint64_t v4 = 0x8000000259F02070;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000015;
  }
  else {
    unint64_t v5 = 0xD000000000000017;
  }
  if (a2) {
    unint64_t v6 = 0x8000000259F02070;
  }
  else {
    unint64_t v6 = 0x8000000259F02050;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_259EFEF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_259EDE79C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x8000000259F021E0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEC00000065746169;
      unint64_t v5 = 0x64656D7265746E69;
      break;
    case 2:
      break;
    case 3:
      unint64_t v5 = 0xD00000000000001ALL;
      unint64_t v6 = "systemPromptResolvedAction";
      goto LABEL_7;
    case 4:
      unint64_t v3 = 0xEE0065736E6F7073;
      unint64_t v5 = 0x65526E6F69746361;
      break;
    case 5:
      unint64_t v6 = "actionWithoutResponse";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 6:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t v3 = 0xED00006E6F697463;
      unint64_t v5 = 0x4174736575716572;
      break;
  }
  unint64_t v7 = 0x8000000259F021E0;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEC00000065746169;
      if (v5 == 0x64656D7265746E69) {
        goto LABEL_20;
      }
      goto LABEL_23;
    case 2:
      goto LABEL_19;
    case 3:
      unint64_t v2 = 0xD00000000000001ALL;
      unint64_t v8 = "systemPromptResolvedAction";
      goto LABEL_18;
    case 4:
      unint64_t v7 = 0xEE0065736E6F7073;
      if (v5 != 0x65526E6F69746361) {
        goto LABEL_23;
      }
      goto LABEL_20;
    case 5:
      unint64_t v8 = "actionWithoutResponse";
LABEL_18:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
LABEL_19:
      if (v5 == v2) {
        goto LABEL_20;
      }
      goto LABEL_23;
    case 6:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_23;
      }
      goto LABEL_20;
    default:
      unint64_t v7 = 0xED00006E6F697463;
      if (v5 != 0x4174736575716572) {
        goto LABEL_23;
      }
LABEL_20:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_23:
      }
        char v9 = sub_259EFEF50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_259EDEA00()
{
  unint64_t v0 = SelectedEvent.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == SelectedEvent.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_259EFEF50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_259EDEA98()
{
  sub_259EFECE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259EDEB10()
{
  sub_259EFECE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259EDEB94()
{
  sub_259EFECE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259EDEC70()
{
  sub_259EFECE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259EDEDA4()
{
  return sub_259EFF010();
}

uint64_t sub_259EDEEF4()
{
  return sub_259EFF010();
}

uint64_t sub_259EDEF78()
{
  return sub_259EFF010();
}

uint64_t sub_259EDF06C()
{
  return sub_259EFF010();
}

uint64_t sub_259EDF104()
{
  return sub_259EFF010();
}

unint64_t IEPlannerGrainMetricsRecord.description.getter()
{
  uint64_t v0 = IEPlannerGrainMetricsRecord.dictionary.getter();
  uint64_t v1 = sub_259EE3414(v0, 1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3) {
    return v1;
  }
  else {
    return 0xD00000000000002ALL;
  }
}

uint64_t IEPlannerGrainMetricsRecord.dictionary.getter()
{
  memcpy(__dst, v0, sizeof(__dst));
  memcpy(v7, v0, sizeof(v7));
  unint64_t v1 = sub_259EDF650();
  unint64_t v2 = sub_259EDFD28();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7[0] = v1;
  sub_259EE2250(v2, (uint64_t)sub_259EE21FC, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v7);
  uint64_t v4 = v7[0];
  swift_bridgeObjectRelease();
  return v4;
}

__n128 sub_259EDF2B4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, uint64_t a11, uint64_t a12, unsigned char *a13, long long a14, long long a15, long long a16, long long a17, __n128 a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,char a28,uint64_t a29,char a30,uint64_t a31,char a32,uint64_t a33,char a34,uint64_t a35,char a36,uint64_t a37,char a38,uint64_t a39,char a40,uint64_t a41,char a42,uint64_t a43,char a44,uint64_t a45,char a46,uint64_t a47)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 80) = a11;
  *(void *)(a9 + 88) = a12;
  *(unsigned char *)(a9 + 96) = *a13;
  *(void *)(a9 + 184) = a19;
  *(unsigned char *)(a9 + 192) = a20 & 1;
  *(void *)(a9 + 200) = a21;
  *(unsigned char *)(a9 + 208) = a22 & 1;
  *(void *)(a9 + 216) = a23;
  *(unsigned char *)(a9 + 224) = a24 & 1;
  *(void *)(a9 + 232) = a25;
  *(unsigned char *)(a9 + 240) = a26 & 1;
  *(void *)(a9 + 248) = a27;
  *(unsigned char *)(a9 + 256) = a28 & 1;
  *(void *)(a9 + 264) = a29;
  *(unsigned char *)(a9 + 272) = a30 & 1;
  *(void *)(a9 + 280) = a31;
  *(unsigned char *)(a9 + 288) = a32 & 1;
  *(void *)(a9 + 296) = a33;
  *(unsigned char *)(a9 + 304) = a34 & 1;
  *(void *)(a9 + 312) = a35;
  *(unsigned char *)(a9 + 320) = a36 & 1;
  *(void *)(a9 + 328) = a37;
  *(unsigned char *)(a9 + 336) = a38 & 1;
  *(void *)(a9 + 344) = a39;
  *(unsigned char *)(a9 + 352) = a40 & 1;
  *(void *)(a9 + 360) = a41;
  *(unsigned char *)(a9 + 368) = a42 & 1;
  *(void *)(a9 + 376) = a43;
  *(unsigned char *)(a9 + 384) = a44 & 1;
  *(void *)(a9 + 392) = a45;
  *(unsigned char *)(a9 + 400) = a46 & 1;
  *(void *)(a9 + 408) = a47;
  __n128 result = a18;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 104) = a14;
  *(_OWORD *)(a9 + 120) = a15;
  *(_OWORD *)(a9 + 136) = a16;
  *(_OWORD *)(a9 + 152) = a17;
  *(__n128 *)(a9 + 168) = a18;
  return result;
}

unint64_t sub_259EDF434()
{
  uint64_t v0 = IEPlannerGrainMetricsRecord.dictionary.getter();
  uint64_t v1 = sub_259EE3414(v0, 1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3) {
    return v1;
  }
  else {
    return 0xD00000000000002ALL;
  }
}

PnROnDeviceFramework::PlannerGrainStage_optional __swiftcall PlannerGrainStage.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259EFEF30();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t PlannerGrainStage.rawValue.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x64656D7265746E69;
      break;
    case 2:
    case 5:
      return result;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
      unint64_t result = 0x65526E6F69746361;
      break;
    case 6:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x4174736575716572;
      break;
  }
  return result;
}

uint64_t sub_259EDF5F4(unsigned __int8 *a1, char *a2)
{
  return sub_259EDE79C(*a1, *a2);
}

uint64_t sub_259EDF600()
{
  return sub_259EDEDA4();
}

uint64_t sub_259EDF60C()
{
  return sub_259EDEC70();
}

uint64_t sub_259EDF614()
{
  return sub_259EDEDA4();
}

PnROnDeviceFramework::PlannerGrainStage_optional sub_259EDF61C(Swift::String *a1)
{
  return PlannerGrainStage.init(rawValue:)(*a1);
}

unint64_t sub_259EDF628@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PlannerGrainStage.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_259EDF650()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  unint64_t v33 = (void *)v0[6];
  int64_t v34 = (void *)v0[8];
  uint64_t v46 = v0[7];
  uint64_t v47 = v0[9];
  uint64_t v48 = v0[11];
  uint64_t v7 = *((unsigned __int8 *)v0 + 96);
  uint64_t v35 = (void *)v0[10];
  uint64_t v36 = v0[13];
  uint64_t v37 = v0[14];
  uint64_t v38 = v0[15];
  uint64_t v39 = v0[16];
  uint64_t v40 = v0[17];
  uint64_t v41 = v0[18];
  uint64_t v42 = v0[19];
  uint64_t v43 = v0[20];
  uint64_t v44 = v0[21];
  uint64_t v45 = v0[22];
  uint64_t v8 = v0[51];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_259F00B40;
  *(void *)(v9 + 32) = 0x496E6F6973736573;
  *(void *)(v9 + 40) = 0xE900000000000064;
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(v9 + 48) = v2;
  *(void *)(v9 + 56) = v1;
  *(void *)(v9 + 72) = v10;
  strcpy((char *)(v9 + 80), "rawSessionId");
  *(unsigned char *)(v9 + 93) = 0;
  *(_WORD *)(v9 + 94) = -5120;
  *(void *)(v9 + 96) = v3;
  *(void *)(v9 + 104) = v4;
  *(void *)(v9 + 120) = v10;
  *(void *)(v9 + 128) = 0x6552746E65696C63;
  *(void *)(v9 + 136) = 0xEF64497473657571;
  *(void *)(v9 + 144) = v6;
  *(void *)(v9 + 152) = v5;
  *(void *)(v9 + 168) = v10;
  *(void *)(v9 + 176) = 0x6D45646C756F6873;
  *(void *)(v9 + 184) = 0xEA00000000007469;
  uint64_t v11 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v9 + 192) = 1;
  *(void *)(v9 + 216) = v11;
  *(void *)(v9 + 224) = 0xD000000000000011;
  unint64_t v12 = 0x8000000259F021E0;
  *(void *)(v9 + 232) = 0x8000000259F02F60;
  uint64_t v13 = v9;
  unint64_t v14 = 0xD000000000000015;
  switch(v7)
  {
    case 1:
      unint64_t v12 = 0xEC00000065746169;
      unint64_t v14 = 0x64656D7265746E69;
      break;
    case 2:
      break;
    case 3:
      unint64_t v14 = 0xD00000000000001ALL;
      uint64_t v15 = "systemPromptResolvedAction";
      goto LABEL_7;
    case 4:
      unint64_t v12 = 0xEE0065736E6F7073;
      unint64_t v14 = 0x65526E6F69746361;
      break;
    case 5:
      uint64_t v15 = "actionWithoutResponse";
LABEL_7:
      unint64_t v12 = (unint64_t)(v15 - 32) | 0x8000000000000000;
      break;
    case 6:
      unint64_t v12 = 0xE700000000000000;
      unint64_t v14 = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t v12 = 0xED00006E6F697463;
      unint64_t v14 = 0x4174736575716572;
      break;
  }
  *(void *)(v9 + 240) = v14;
  *(void *)(v9 + 248) = v12;
  *(void *)(v9 + 264) = v10;
  *(void *)(v9 + 272) = 0x65757165526D756ELL;
  uint64_t v16 = MEMORY[0x263F8D6C8];
  *(void *)(v9 + 280) = 0xEA00000000007473;
  *(void *)(v9 + 288) = v36;
  *(void *)(v9 + 312) = v16;
  strcpy((char *)(v9 + 320), "numPlanCreated");
  *(unsigned char *)(v9 + 335) = -18;
  *(void *)(v9 + 336) = v37;
  *(void *)(v9 + 360) = v16;
  *(void *)(v9 + 368) = 0xD000000000000011;
  *(void *)(v9 + 376) = 0x8000000259F025A0;
  *(void *)(v9 + 384) = v38;
  *(void *)(v9 + 408) = v16;
  *(void *)(v9 + 416) = 0xD000000000000012;
  *(void *)(v9 + 424) = 0x8000000259F025C0;
  *(void *)(v9 + 432) = v39;
  *(void *)(v9 + 456) = v16;
  *(void *)(v9 + 464) = 0xD000000000000016;
  *(void *)(v9 + 472) = 0x8000000259F02F80;
  *(void *)(v9 + 480) = v40;
  *(void *)(v9 + 504) = v16;
  *(void *)(v9 + 512) = 0xD000000000000018;
  *(void *)(v9 + 520) = 0x8000000259F02FA0;
  *(void *)(v9 + 552) = v16;
  *(void *)(v9 + 528) = v41;
  *(void *)(v9 + 560) = 0xD000000000000015;
  *(void *)(v9 + 568) = 0x8000000259F02FC0;
  *(void *)(v9 + 600) = v16;
  *(void *)(v9 + 576) = v42;
  *(void *)(v9 + 608) = 0xD000000000000020;
  *(void *)(v9 + 616) = 0x8000000259F02FE0;
  *(void *)(v9 + 648) = v16;
  *(void *)(v9 + 624) = v43;
  *(void *)(v9 + 656) = 0xD000000000000017;
  *(void *)(v9 + 664) = 0x8000000259F03010;
  *(void *)(v9 + 696) = v16;
  *(void *)(v9 + 672) = v44;
  *(void *)(v9 + 704) = 0xD000000000000010;
  *(void *)(v9 + 712) = 0x8000000259F02600;
  *(void *)(v9 + 744) = v16;
  *(void *)(v9 + 720) = v45;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_259ED3630(v13);
  uint64_t v18 = v8;
  if (v46)
  {
    *((void *)&v50 + 1) = v46;
    unint64_t v19 = MEMORY[0x263F8D310];
    uint64_t v20 = v48;
    id v21 = v33;
  }
  else
  {
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v19 = sub_259EDB4F8();
    uint64_t v20 = v48;
  }
  unint64_t v51 = v19;
  *(void *)&long long v50 = v21;
  sub_259ED3C9C(&v50, v49);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(v49, 0xD000000000000013, 0x8000000259F02540, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  if (v47)
  {
    *((void *)&v50 + 1) = v47;
    unint64_t v23 = MEMORY[0x263F8D310];
    id v24 = v34;
  }
  else
  {
    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v23 = sub_259EDB4F8();
  }
  unint64_t v51 = v23;
  *(void *)&long long v50 = v24;
  sub_259ED3C9C(&v50, v49);
  swift_bridgeObjectRetain();
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(v49, 0x7972657551776172, 0xEF6449746E657645, v25);
  swift_bridgeObjectRelease();
  if (v20)
  {
    *((void *)&v50 + 1) = v20;
    unint64_t v26 = MEMORY[0x263F8D310];
    id v27 = v35;
  }
  else
  {
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v26 = sub_259EDB4F8();
  }
  unint64_t v51 = v26;
  *(void *)&long long v50 = v27;
  sub_259ED3C9C(&v50, v49);
  swift_bridgeObjectRetain();
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(v49, 0x6E6576456E616C70, 0xEB00000000644974, v28);
  swift_bridgeObjectRelease();
  if (v18)
  {
    id v29 = (id)sub_259EEE578();
    unint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A88);
  }
  else
  {
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v30 = sub_259EDB4F8();
  }
  unint64_t v51 = v30;
  *(void *)&long long v50 = v29;
  sub_259ED3C9C(&v50, v49);
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(v49, 0x496572756C696166, 0xEB000000006F666ELL, v31);
  swift_bridgeObjectRelease();
  return v17;
}

unint64_t sub_259EDFD28()
{
  uint64_t v1 = *(void *)(v0 + 184);
  char v2 = *(unsigned char *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 200);
  char v4 = *(unsigned char *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 216);
  char v6 = *(unsigned char *)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 232);
  char v8 = *(unsigned char *)(v0 + 240);
  uint64_t v9 = *(void *)(v0 + 248);
  char v10 = *(unsigned char *)(v0 + 256);
  uint64_t v11 = *(void *)(v0 + 264);
  uint64_t v12 = *(void *)(v0 + 280);
  char v13 = *(unsigned char *)(v0 + 288);
  uint64_t v14 = *(void *)(v0 + 296);
  char v15 = *(unsigned char *)(v0 + 304);
  char v16 = *(unsigned char *)(v0 + 320);
  uint64_t v70 = *(void *)(v0 + 312);
  uint64_t v71 = *(void *)(v0 + 328);
  char v76 = *(unsigned char *)(v0 + 272);
  char v77 = *(unsigned char *)(v0 + 336);
  uint64_t v72 = *(void *)(v0 + 344);
  uint64_t v73 = *(void *)(v0 + 360);
  char v80 = *(unsigned char *)(v0 + 368);
  char v78 = *(unsigned char *)(v0 + 352);
  char v79 = *(unsigned char *)(v0 + 384);
  uint64_t v74 = *(void *)(v0 + 376);
  uint64_t v75 = *(void *)(v0 + 392);
  char v17 = *(unsigned char *)(v0 + 400);
  unint64_t v18 = sub_259ED3630(MEMORY[0x263F8EE78]);
  unint64_t v86 = v18;
  char v81 = v17;
  if (v2)
  {
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v20 = sub_259EDB4F8();
    unint64_t v85 = v20;
    *(void *)&long long v84 = v19;
  }
  else
  {
    uint64_t v83 = MEMORY[0x263F8D538];
    *(void *)&long long v82 = v1;
    sub_259ED3C9C(&v82, &v84);
    unint64_t v20 = v85;
  }
  if (v20)
  {
    sub_259ED3C9C(&v84, &v82);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000013, 0x8000000259F00C90, isUniquelyReferenced_nonNull_native);
    unint64_t v86 = v18;
    swift_bridgeObjectRelease();
    if (v4)
    {
LABEL_6:
      id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v23 = sub_259EDB4F8();
      unint64_t v85 = v23;
      *(void *)&long long v84 = v22;
      goto LABEL_9;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000013, 0x8000000259F00C90, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v4) {
      goto LABEL_6;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v3;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v23 = v85;
LABEL_9:
  if (v23)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v24 = v86;
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD00000000000001CLL, 0x8000000259F02E30, v25);
    unint64_t v86 = v24;
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_11:
      id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v27 = sub_259EDB4F8();
      unint64_t v85 = v27;
      *(void *)&long long v84 = v26;
      goto LABEL_14;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD00000000000001CLL, 0x8000000259F02E30, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v6) {
      goto LABEL_11;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v5;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v27 = v85;
LABEL_14:
  if (v27)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v28 = v86;
    char v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000020, 0x8000000259F02E50, v29);
    unint64_t v86 = v28;
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_16:
      id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v31 = sub_259EDB4F8();
      unint64_t v85 = v31;
      *(void *)&long long v84 = v30;
      goto LABEL_19;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000020, 0x8000000259F02E50, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v8) {
      goto LABEL_16;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v7;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v31 = v85;
LABEL_19:
  if (v31)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v32 = v86;
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000016, 0x8000000259F00CD0, v33);
    unint64_t v86 = v32;
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_21:
      id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v35 = sub_259EDB4F8();
      unint64_t v85 = v35;
      *(void *)&long long v84 = v34;
      goto LABEL_24;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000016, 0x8000000259F00CD0, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v10) {
      goto LABEL_21;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v9;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v35 = v85;
LABEL_24:
  if (v35)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v36 = v86;
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000023, 0x8000000259F00D10, v37);
    unint64_t v86 = v36;
    swift_bridgeObjectRelease();
    if (v76)
    {
LABEL_26:
      id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v39 = sub_259EDB4F8();
      unint64_t v85 = v39;
      *(void *)&long long v84 = v38;
      goto LABEL_29;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000023, 0x8000000259F00D10, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v76) {
      goto LABEL_26;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v11;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v39 = v85;
LABEL_29:
  if (v39)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v40 = v86;
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000028, 0x8000000259F02E80, v41);
    unint64_t v86 = v40;
    swift_bridgeObjectRelease();
    if (v13)
    {
LABEL_31:
      id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v43 = sub_259EDB4F8();
      unint64_t v85 = v43;
      *(void *)&long long v84 = v42;
      goto LABEL_34;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000028, 0x8000000259F02E80, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v13) {
      goto LABEL_31;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v12;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v43 = v85;
LABEL_34:
  if (v43)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v44 = v86;
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD00000000000002CLL, 0x8000000259F02EB0, v45);
    unint64_t v86 = v44;
    swift_bridgeObjectRelease();
    if (v15)
    {
LABEL_36:
      id v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v47 = sub_259EDB4F8();
      unint64_t v85 = v47;
      *(void *)&long long v84 = v46;
      goto LABEL_39;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD00000000000002CLL, 0x8000000259F02EB0, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v15) {
      goto LABEL_36;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v14;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v47 = v85;
LABEL_39:
  if (v47)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v48 = v86;
    char v49 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000022, 0x8000000259F02EE0, v49);
    unint64_t v86 = v48;
    swift_bridgeObjectRelease();
    if (v16)
    {
LABEL_41:
      id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v51 = sub_259EDB4F8();
      unint64_t v85 = v51;
      *(void *)&long long v84 = v50;
      goto LABEL_44;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000022, 0x8000000259F02EE0, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v16) {
      goto LABEL_41;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v70;
  sub_259ED3C9C(&v82, &v84);
  unint64_t v51 = v85;
LABEL_44:
  if (v51)
  {
    sub_259ED3C9C(&v84, &v82);
    unint64_t v52 = v86;
    char v53 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000026, 0x8000000259F02F10, v53);
    unint64_t v86 = v52;
    swift_bridgeObjectRelease();
    if (v77) {
      goto LABEL_46;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000026, 0x8000000259F02F10, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    if (v77)
    {
LABEL_46:
      id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v85 = sub_259EDB4F8();
      *(void *)&long long v84 = v54;
      if (v85) {
        goto LABEL_47;
      }
      goto LABEL_58;
    }
  }
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v71;
  sub_259ED3C9C(&v82, &v84);
  if (v85)
  {
LABEL_47:
    sub_259ED3C9C(&v84, &v82);
    unint64_t v55 = v86;
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000029, 0x8000000259F00D60, v56);
    unint64_t v86 = v55;
    swift_bridgeObjectRelease();
    if (v78) {
      goto LABEL_48;
    }
    goto LABEL_59;
  }
LABEL_58:
  sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
  sub_259EDB05C(0xD000000000000029, 0x8000000259F00D60, &v82);
  sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
  if (v78)
  {
LABEL_48:
    id v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v85 = sub_259EDB4F8();
    *(void *)&long long v84 = v57;
    if (v85) {
      goto LABEL_49;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v72;
  sub_259ED3C9C(&v82, &v84);
  if (v85)
  {
LABEL_49:
    sub_259ED3C9C(&v84, &v82);
    unint64_t v58 = v86;
    char v59 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD00000000000001BLL, 0x8000000259F00DC0, v59);
    unint64_t v86 = v58;
    swift_bridgeObjectRelease();
    if (v80) {
      goto LABEL_50;
    }
    goto LABEL_61;
  }
LABEL_60:
  sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
  sub_259EDB05C(0xD00000000000001BLL, 0x8000000259F00DC0, &v82);
  sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
  if (v80)
  {
LABEL_50:
    id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v85 = sub_259EDB4F8();
    *(void *)&long long v84 = v60;
    if (v85) {
      goto LABEL_51;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v73;
  sub_259ED3C9C(&v82, &v84);
  if (v85)
  {
LABEL_51:
    sub_259ED3C9C(&v84, &v82);
    unint64_t v61 = v86;
    char v62 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD000000000000019, 0x8000000259F00E60, v62);
    unint64_t v86 = v61;
    swift_bridgeObjectRelease();
    if (v79) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }
LABEL_62:
  sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
  sub_259EDB05C(0xD000000000000019, 0x8000000259F00E60, &v82);
  sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
  if (v79)
  {
LABEL_52:
    id v63 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v85 = sub_259EDB4F8();
    *(void *)&long long v84 = v63;
    if (v85) {
      goto LABEL_53;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v83 = MEMORY[0x263F8D538];
  *(void *)&long long v82 = v74;
  sub_259ED3C9C(&v82, &v84);
  if (v85)
  {
LABEL_53:
    sub_259ED3C9C(&v84, &v82);
    unint64_t v64 = v86;
    char v65 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v82, 0xD00000000000001CLL, 0x8000000259F00E10, v65);
    unint64_t v86 = v64;
    swift_bridgeObjectRelease();
    if (v81) {
      goto LABEL_54;
    }
LABEL_65:
    uint64_t v83 = MEMORY[0x263F8D538];
    *(void *)&long long v82 = v75;
    sub_259ED3C9C(&v82, &v84);
    if (v85) {
      goto LABEL_55;
    }
LABEL_66:
    sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000016, 0x8000000259F02F40, &v82);
    sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
    return v86;
  }
LABEL_64:
  sub_259ED1170((uint64_t)&v84, &qword_26A3F88B0);
  sub_259EDB05C(0xD00000000000001CLL, 0x8000000259F00E10, &v82);
  sub_259ED1170((uint64_t)&v82, &qword_26A3F88B0);
  if ((v81 & 1) == 0) {
    goto LABEL_65;
  }
LABEL_54:
  id v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  unint64_t v85 = sub_259EDB4F8();
  *(void *)&long long v84 = v66;
  if (!v85) {
    goto LABEL_66;
  }
LABEL_55:
  sub_259ED3C9C(&v84, &v82);
  unint64_t v67 = v86;
  char v68 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(&v82, 0xD000000000000016, 0x8000000259F02F40, v68);
  swift_bridgeObjectRelease();
  return v67;
}

uint64_t sub_259EE0B24()
{
  uint64_t v0 = IEPlannerGrainMetricsRecord.dictionary.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B70);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_259F00B50;
  *(void *)(v1 + 32) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v2 = sub_259EE9AF0(0xD000000000000013, 0x8000000259F00C90), (v3 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v2, (uint64_t)&v27), swift_dynamicCast()))
  {
    uint64_t v4 = v26;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(void *)(v1 + 40) = v4;
  *(void *)(v1 + 48) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v5 = sub_259EE9AF0(0xD000000000000016, 0x8000000259F00CD0), (v6 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v5, (uint64_t)&v27), swift_dynamicCast()))
  {
    uint64_t v7 = v26;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *(void *)(v1 + 56) = v7;
  *(void *)(v1 + 64) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v8 = sub_259EE9AF0(0xD000000000000023, 0x8000000259F00D10), (v9 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v8, (uint64_t)&v27), swift_dynamicCast()))
  {
    uint64_t v10 = v26;
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)(v1 + 72) = v10;
  *(void *)(v1 + 80) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v11 = sub_259EE9AF0(0xD000000000000029, 0x8000000259F00D60), (v12 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v11, (uint64_t)&v27), swift_dynamicCast()))
  {
    uint64_t v13 = v26;
  }
  else
  {
    uint64_t v13 = 0;
  }
  *(void *)(v1 + 88) = v13;
  *(void *)(v1 + 96) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v14 = sub_259EE9AF0(0xD00000000000001BLL, 0x8000000259F00DC0), (v15 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v14, (uint64_t)&v27), swift_dynamicCast()))
  {
    uint64_t v16 = v26;
  }
  else
  {
    uint64_t v16 = 0;
  }
  *(void *)(v1 + 104) = v16;
  *(void *)(v1 + 112) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v17 = sub_259EE9AF0(0xD00000000000001CLL, 0x8000000259F00E10), (v18 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v17, (uint64_t)&v27), swift_dynamicCast()))
  {
    uint64_t v19 = v26;
  }
  else
  {
    uint64_t v19 = 0;
  }
  *(void *)(v1 + 120) = v19;
  *(void *)(v1 + 128) = swift_getKeyPath();
  if (*(void *)(v0 + 16) && (unint64_t v20 = sub_259EE9AF0(0xD000000000000019, 0x8000000259F00E60), (v21 & 1) != 0))
  {
    sub_259ED34B4(*(void *)(v0 + 56) + 32 * v20, (uint64_t)&v27);
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v28 + 1))
  {
    sub_259ED1170((uint64_t)&v27, &qword_26A3F88B0);
    goto LABEL_39;
  }
  if (!swift_dynamicCast())
  {
LABEL_39:
    uint64_t v22 = 0;
    goto LABEL_40;
  }
  uint64_t v22 = v26;
LABEL_40:
  *(void *)(v1 + 136) = v22;
  unint64_t v23 = sub_259ED375C(v1);
  uint64_t v24 = sub_259EE5A34(v23);
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t IEPlannerGrainMetricsRecord.SELFShouldEmit.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (!v1) {
    return 0;
  }
  if (*(void *)(v0 + 48) == 0xD00000000000001ELL && v1 == 0x8000000259F02C40) {
    return 1;
  }
  return sub_259EFEF50();
}

id IEPlannerGrainMetricsRecord.getSELFEvent()()
{
  uint64_t v1 = sub_259EFEC00();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v5 - 8);
  long long v115 = (char *)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_259EFE670();
  uint64_t v117 = *(void *)(v7 - 8);
  uint64_t v118 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  long long v116 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v114 = (char *)&v108 - v10;
  uint64_t v11 = *(void *)(v0 + 32);
  uint64_t v119 = *(void *)(v0 + 40);
  uint64_t v120 = v11;
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v122 = *(void *)(v0 + 88);
  uint64_t v123 = v12;
  unint64_t v13 = *(void *)(v0 + 112);
  unint64_t v125 = *(void *)(v0 + 120);
  unint64_t v126 = v13;
  unint64_t v14 = *(void *)(v0 + 136);
  unint64_t v124 = *(void *)(v0 + 128);
  unint64_t v15 = *(void *)(v0 + 144);
  unint64_t v16 = *(void *)(v0 + 168);
  long long v121 = *(void **)(v0 + 408);
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EA98]), sel_init);
  if (!v17) {
    goto LABEL_38;
  }
  char v18 = v17;
  id v113 = v4;
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAB8]), sel_init);
  if (!v19)
  {

LABEL_38:
    if (qword_26A3F87B8 != -1) {
LABEL_68:
    }
      swift_once();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A3F8B18);
    id v54 = sub_259EFEBF0();
    os_log_type_t v55 = sub_259EFEDC0();
    if (os_log_type_enabled(v54, v55))
    {
      char v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v56 = 0;
      _os_log_impl(&dword_259EC8000, v54, v55, "PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary init failed!", v56, 2u);
      MEMORY[0x25A2EF270](v56, -1, -1);
    }
    goto LABEL_45;
  }
  unint64_t v20 = v19;
  uint64_t v111 = v2;
  id v159 = v19;
  id v21 = objc_allocWithZone(MEMORY[0x263F6EAA0]);
  uint64_t v22 = v20;
  id v23 = objc_msgSend(v21, sel_init);
  if (!v23)
  {

    if (qword_26A3F87B8 != -1) {
      goto LABEL_70;
    }
    goto LABEL_42;
  }
  if ((v126 & 0x8000000000000000) != 0) {
    goto LABEL_71;
  }
  unint64_t v24 = v125;
  if (HIDWORD(v126)) {
    goto LABEL_71;
  }
  char v25 = v23;
  objc_msgSend(v22, sel_setNumPlansCreated_);
  if ((v24 & 0x8000000000000000) != 0) {
    goto LABEL_71;
  }
  if (HIDWORD(v24)) {
    goto LABEL_71;
  }
  objc_msgSend(v22, sel_setNumQueriesCreated_, v24);
  if ((v124 & 0x8000000000000000) != 0
    || HIDWORD(v124)
    || (objc_msgSend(v22, sel_setNumQueriesExecuted_), (v14 & 0x8000000000000000) != 0)
    || HIDWORD(v14)
    || (objc_msgSend(v22, sel_setNumClientActionsCreated_, v14), (v15 & 0x8000000000000000) != 0)
    || HIDWORD(v15)
    || (objc_msgSend(v22, sel_setNumActionResolverRequests_, v15),
        objc_msgSend(v22, sel_setNumStatementsEvaluatedFromPlanner_, v15),
        (v16 & 0x8000000000000000) != 0)
    || (v112 = v25, uint64_t v109 = v1, v110 = v18, HIDWORD(v16)))
  {
LABEL_71:
    id result = (id)sub_259EFEED0();
    __break(1u);
    return result;
  }
  uint64_t v1 = v0 + 48;
  uint64_t v108 = (long long *)(v0 + 152);
  objc_msgSend(v22, sel_setNumSystemPromptsResolved_, v16);

  long long v26 = *(_OWORD *)(v0 + 16);
  v128[0] = *(_OWORD *)v0;
  v128[1] = v26;
  uint64_t v129 = v120;
  uint64_t v130 = v119;
  long long v27 = *(_OWORD *)(v0 + 64);
  long long v131 = *(_OWORD *)(v0 + 48);
  long long v132 = v27;
  uint64_t v133 = v123;
  uint64_t v134 = v122;
  long long v135 = *(_OWORD *)(v0 + 96);
  unint64_t v136 = v126;
  unint64_t v137 = v125;
  unint64_t v138 = v124;
  unint64_t v139 = v14;
  long long v141 = *v108;
  unint64_t v140 = v15;
  unint64_t v142 = v16;
  long long v28 = *(_OWORD *)(v0 + 192);
  long long v143 = *(_OWORD *)(v0 + 176);
  long long v144 = v28;
  long long v29 = *(_OWORD *)(v0 + 256);
  long long v147 = *(_OWORD *)(v0 + 240);
  long long v148 = v29;
  long long v30 = *(_OWORD *)(v0 + 224);
  long long v145 = *(_OWORD *)(v0 + 208);
  long long v146 = v30;
  long long v31 = *(_OWORD *)(v0 + 320);
  long long v151 = *(_OWORD *)(v0 + 304);
  long long v152 = v31;
  long long v32 = *(_OWORD *)(v0 + 288);
  long long v149 = *(_OWORD *)(v0 + 272);
  long long v150 = v32;
  uint64_t v33 = *(void *)(v0 + 400);
  long long v34 = *(_OWORD *)(v0 + 384);
  long long v155 = *(_OWORD *)(v0 + 368);
  long long v156 = v34;
  long long v35 = *(_OWORD *)(v0 + 352);
  long long v153 = *(_OWORD *)(v0 + 336);
  long long v154 = v35;
  uint64_t v157 = v33;
  v158 = v121;
  uint64_t v36 = sub_259EE0B24();
  uint64_t v22 = (void *)v36;
  int64_t v37 = 0;
  uint64_t v38 = v36 + 64;
  uint64_t v39 = 1 << *(unsigned char *)(v36 + 32);
  uint64_t v40 = -1;
  if (v39 < 64) {
    uint64_t v40 = ~(-1 << v39);
  }
  unint64_t v41 = v40 & *(void *)(v36 + 64);
  int64_t v42 = (unint64_t)(v39 + 63) >> 6;
  char v18 = (void *)0x263F6E000;
  if (!v41) {
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v43 = __clz(__rbit64(v41));
  v41 &= v41 - 1;
  for (unint64_t i = v43 | (v37 << 6); ; unint64_t i = __clz(__rbit64(v46)) + (v37 << 6))
  {
    uint64_t v48 = 8 * i;
    uint64_t v1 = *(void *)(v22[6] + v48);
    double v49 = *(double *)(v22[7] + v48);
    id v50 = objc_allocWithZone(MEMORY[0x263F6EAC8]);
    swift_retain();
    id v51 = objc_msgSend(v50, sel_init);
    if (!v51)
    {
      if (qword_26A3F87B8 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v109, (uint64_t)qword_26A3F8B18);
      unint64_t v61 = sub_259EFEBF0();
      os_log_type_t v62 = sub_259EFEDC0();
      BOOL v63 = os_log_type_enabled(v61, v62);
      id v64 = v110;
      if (v63)
      {
        char v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v65 = 0;
        _os_log_impl(&dword_259EC8000, v61, v62, "PNRODSchemaPNRODMetricDurationMetric init failed!", v65, 2u);
        MEMORY[0x25A2EF270](v65, -1, -1);
      }
      swift_release();

      swift_release();
      return 0;
    }
    unint64_t v52 = v51;
    objc_msgSend(v51, sel_setMetricValue_, v49);
    *(void *)&v128[0] = v52;
    id v53 = v52;
    swift_setAtWritableKeyPath();

    swift_release();
    if (v41) {
      goto LABEL_19;
    }
LABEL_20:
    int64_t v45 = v37 + 1;
    if (__OFADD__(v37, 1))
    {
      __break(1u);
      goto LABEL_68;
    }
    if (v45 >= v42)
    {
LABEL_53:
      swift_release();
      id v66 = v159;
      uint64_t v67 = (uint64_t)v115;
      sub_259EFE630();
      uint64_t v69 = v117;
      uint64_t v68 = v118;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48))(v67, 1, v118) == 1)
      {
        sub_259ED1170(v67, &qword_26A3F8A00);
        id v70 = 0;
      }
      else
      {
        uint64_t v71 = v114;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v114, v67, v68);
        id v72 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        uint64_t v73 = (void *)sub_259EFE650();
        id v70 = objc_msgSend(v72, sel_initWithNSUUID_, v73);

        (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v68);
      }
      id v75 = v112;
      uint64_t v74 = v113;
      objc_msgSend(v66, sel_setClientRequestId_, v70);

      id v76 = v159;
      char v77 = v121;
      if (v121)
      {
        id v78 = v159;
        char v77 = sub_259EED1A4();
      }
      else
      {
        id v79 = v159;
      }
      objc_msgSend(v76, sel_setFailureInfo_, v77);

      id v80 = v76;
      id v81 = toSISSchemaUUID(convertId:)(v123, v122);
      objc_msgSend(v80, sel_setPlanId_, v81);

      long long v82 = v116;
      sub_259EFE660();
      id v83 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      long long v84 = (void *)sub_259EFE650();
      id v85 = objc_msgSend(v83, sel_initWithNSUUID_, v84);

      (*(void (**)(char *, uint64_t))(v69 + 8))(v82, v68);
      objc_msgSend(v75, sel_setPnrodId_, v85);

      id v59 = v110;
      objc_msgSend(v110, sel_setEventMetadata_, v75);
      objc_msgSend(v59, sel_setPnrodIntelligenceFlowPlannerGrainSummary_, v159);
      if (qword_26A3F87B8 != -1) {
        swift_once();
      }
      uint64_t v86 = v109;
      uint64_t v87 = __swift_project_value_buffer(v109, (uint64_t)qword_26A3F8B18);
      uint64_t v88 = v111;
      (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))(v74, v87, v86);
      uint64_t v89 = v74;
      id v90 = v59;
      uint64_t v91 = sub_259EFEBF0();
      int v92 = sub_259EFEDC0();
      if (os_log_type_enabled(v91, (os_log_type_t)v92))
      {
        LODWORD(v126) = v92;
        uint64_t v93 = swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        *(void *)&v128[0] = v94;
        *(_DWORD *)uint64_t v93 = 136315650;
        id v95 = objc_msgSend(v90, sel_qualifiedMessageName);
        uint64_t v96 = sub_259EFEC90();
        unint64_t v98 = v97;

        uint64_t v127 = sub_259ED2D5C(v96, v98, (uint64_t *)v128);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        *(_WORD *)(v93 + 12) = 2080;
        id v99 = objc_msgSend(v90, sel_formattedJsonBody);
        if (v99)
        {
          uint64_t v100 = v99;
          uint64_t v101 = sub_259EFEC90();
          unint64_t v103 = v102;
        }
        else
        {
          unint64_t v103 = 0xE500000000000000;
          uint64_t v101 = 0x3E4C494E3CLL;
        }
        uint64_t v127 = sub_259ED2D5C(v101, v103, (uint64_t *)v128);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        *(_WORD *)(v93 + 22) = 2080;
        id v104 = objc_msgSend(v90, sel_description);
        uint64_t v105 = sub_259EFEC90();
        unint64_t v107 = v106;

        uint64_t v127 = sub_259ED2D5C(v105, v107, (uint64_t *)v128);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v91, (os_log_type_t)v126, "Creating %s\n%s\n%s", (uint8_t *)v93, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v94, -1, -1);
        MEMORY[0x25A2EF270](v93, -1, -1);

        (*(void (**)(char *, uint64_t))(v111 + 8))(v113, v109);
        return v110;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v88 + 8))(v89, v86);
      }
      return v59;
    }
    unint64_t v46 = *(void *)(v38 + 8 * v45);
    ++v37;
    if (!v46)
    {
      int64_t v37 = v45 + 1;
      if (v45 + 1 >= v42) {
        goto LABEL_53;
      }
      unint64_t v46 = *(void *)(v38 + 8 * v37);
      if (!v46)
      {
        int64_t v37 = v45 + 2;
        if (v45 + 2 >= v42) {
          goto LABEL_53;
        }
        unint64_t v46 = *(void *)(v38 + 8 * v37);
        if (!v46) {
          break;
        }
      }
    }
LABEL_33:
    unint64_t v41 = (v46 - 1) & v46;
  }
  int64_t v47 = v45 + 3;
  if (v47 >= v42) {
    goto LABEL_53;
  }
  unint64_t v46 = *(void *)(v38 + 8 * v47);
  if (v46)
  {
    int64_t v37 = v47;
    goto LABEL_33;
  }
  while (1)
  {
    int64_t v37 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (v37 >= v42) {
      goto LABEL_53;
    }
    unint64_t v46 = *(void *)(v38 + 8 * v37);
    ++v47;
    if (v46) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_70:
  swift_once();
LABEL_42:
  __swift_project_value_buffer(v1, (uint64_t)qword_26A3F8B18);
  id v54 = sub_259EFEBF0();
  os_log_type_t v57 = sub_259EFEDC0();
  if (os_log_type_enabled(v54, v57))
  {
    unint64_t v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v58 = 0;
    _os_log_impl(&dword_259EC8000, v54, v57, "PNRODSchemaPNRODClientEventMetadata init failed!", v58, 2u);
    MEMORY[0x25A2EF270](v58, -1, -1);
  }

LABEL_45:
  return 0;
}

uint64_t sub_259EE1D14(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8948);
  uint64_t v6 = sub_259EFEF00();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
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
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v34 = -1 << v32;
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
      id v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_259ED3C9C(v24, v35);
      }
      else
      {
        sub_259ED34B4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_259EFEFE0();
      sub_259EFECE0();
      uint64_t result = sub_259EFF010();
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
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_259ED3C9C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void *sub_259EE2014()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8948);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259EFEEF0();
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
    sub_259ED34B4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    id v21 = (void *)(*(void *)(v4 + 48) + v16);
    *id v21 = v19;
    v21[1] = v18;
    sub_259ED3C9C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

uint64_t sub_259EE21FC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_259ED34B4((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_259EE2250(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v50 = a1;
  uint64_t v51 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v52 = v8;
  uint64_t v53 = 0;
  uint64_t v54 = v11 & v9;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_259EE25A8(&v48);
  uint64_t v12 = *((void *)&v48 + 1);
  if (!*((void *)&v48 + 1)) {
    goto LABEL_27;
  }
  uint64_t v13 = v48;
  sub_259ED3C9C(v49, v47);
  unint64_t v14 = *(void **)a5;
  unint64_t v16 = sub_259EE9AF0(v13, v12);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if (a4)
    {
      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_259EE2014();
      if (v20) {
        goto LABEL_12;
      }
    }
LABEL_14:
    int64_t v24 = *(void **)a5;
    *(void *)(*(void *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    uint64_t v25 = (uint64_t *)(v24[6] + 16 * v16);
    *uint64_t v25 = v13;
    v25[1] = v12;
    sub_259ED3C9C(v47, (_OWORD *)(v24[7] + 32 * v16));
    uint64_t v26 = v24[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_259EE25A8(&v48);
    for (uint64_t i = *((void *)&v48 + 1); *((void *)&v48 + 1); uint64_t i = *((void *)&v48 + 1))
    {
      uint64_t v31 = v48;
      sub_259ED3C9C(v49, v47);
      uint64_t v32 = *(void **)a5;
      unint64_t v34 = sub_259EE9AF0(v31, i);
      uint64_t v35 = v32[2];
      BOOL v36 = (v33 & 1) == 0;
      uint64_t v37 = v35 + v36;
      if (__OFADD__(v35, v36)) {
        goto LABEL_28;
      }
      char v38 = v33;
      if (v32[3] < v37)
      {
        sub_259EE1D14(v37, 1);
        unint64_t v39 = sub_259EE9AF0(v31, i);
        if ((v38 & 1) != (v40 & 1)) {
          goto LABEL_30;
        }
        unint64_t v34 = v39;
      }
      if (v38)
      {
        sub_259ED34B4((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        swift_bridgeObjectRelease();
        BOOL v30 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
        sub_259ED3C9C(v46, v30);
      }
      else
      {
        unint64_t v41 = *(void **)a5;
        *(void *)(*(void *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        int64_t v42 = (uint64_t *)(v41[6] + 16 * v34);
        *int64_t v42 = v31;
        v42[1] = i;
        sub_259ED3C9C(v47, (_OWORD *)(v41[7] + 32 * v34));
        uint64_t v43 = v41[2];
        BOOL v27 = __OFADD__(v43, 1);
        uint64_t v44 = v43 + 1;
        if (v27) {
          goto LABEL_29;
        }
        v41[2] = v44;
      }
      sub_259EE25A8(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_259EE337C();
    return swift_release();
  }
  sub_259EE1D14(v19, a4 & 1);
  unint64_t v21 = sub_259EE9AF0(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v16 = v21;
    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    sub_259ED34B4((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    swift_bridgeObjectRelease();
    unint64_t v23 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_259ED3C9C(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  uint64_t result = sub_259EFEF70();
  __break(1u);
  return result;
}

uint64_t sub_259EE25A8@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_259ED34B4(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  uint64_t *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_259EE3384((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_259ED1170((uint64_t)v21, &qword_26A3F8B80);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_259EE278C()
{
  return sub_259EFF010();
}

uint64_t sub_259EE27E0()
{
  return sub_259EFECE0();
}

unint64_t sub_259EE2800()
{
  unint64_t result = qword_26A3F8B68;
  if (!qword_26A3F8B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8B68);
  }
  return result;
}

uint64_t destroy for IEPlannerGrainMetricsRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for IEPlannerGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  uint64_t v9 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v9;
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  uint64_t v10 = *(void *)(a2 + 264);
  *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  uint64_t v11 = *(void *)(a2 + 280);
  *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
  *(void *)(a1 + 280) = v11;
  uint64_t v12 = *(void *)(a2 + 296);
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  *(void *)(a1 + 296) = v12;
  uint64_t v13 = *(void *)(a2 + 312);
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  *(void *)(a1 + 312) = v13;
  uint64_t v14 = *(void *)(a2 + 328);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  *(void *)(a1 + 328) = v14;
  uint64_t v15 = *(void *)(a2 + 344);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  *(void *)(a1 + 344) = v15;
  uint64_t v16 = *(void *)(a2 + 360);
  *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
  *(void *)(a1 + 360) = v16;
  uint64_t v17 = *(void *)(a2 + 376);
  *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
  *(void *)(a1 + 376) = v17;
  uint64_t v18 = *(void *)(a2 + 392);
  *(unsigned char *)(a1 + 400) = *(unsigned char *)(a2 + 400);
  *(void *)(a1 + 392) = v18;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IEPlannerGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  uint64_t v4 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v4;
  uint64_t v5 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v5;
  uint64_t v6 = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 216) = v6;
  uint64_t v7 = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 232) = v7;
  uint64_t v8 = *(void *)(a2 + 248);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(void *)(a1 + 248) = v8;
  uint64_t v9 = *(void *)(a2 + 264);
  *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
  *(void *)(a1 + 264) = v9;
  uint64_t v10 = *(void *)(a2 + 280);
  *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
  *(void *)(a1 + 280) = v10;
  uint64_t v11 = *(void *)(a2 + 296);
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  *(void *)(a1 + 296) = v11;
  uint64_t v12 = *(void *)(a2 + 312);
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  *(void *)(a1 + 312) = v12;
  uint64_t v13 = *(void *)(a2 + 328);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  *(void *)(a1 + 328) = v13;
  uint64_t v14 = *(void *)(a2 + 344);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  *(void *)(a1 + 344) = v14;
  uint64_t v15 = *(void *)(a2 + 360);
  *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
  *(void *)(a1 + 360) = v15;
  uint64_t v16 = *(void *)(a2 + 376);
  *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
  *(void *)(a1 + 376) = v16;
  uint64_t v17 = *(void *)(a2 + 392);
  *(unsigned char *)(a1 + 400) = *(unsigned char *)(a2 + 400);
  *(void *)(a1 + 392) = v17;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy416_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1A0uLL);
}

uint64_t assignWithTake for IEPlannerGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(unsigned char *)(a1 + 256) = *(unsigned char *)(a2 + 256);
  *(unsigned char *)(a1 + 272) = *(unsigned char *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  uint64_t v10 = *(void *)(a2 + 280);
  *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
  *(void *)(a1 + 280) = v10;
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(unsigned char *)(a1 + 336) = *(unsigned char *)(a2 + 336);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  uint64_t v11 = *(void *)(a2 + 360);
  *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
  *(void *)(a1 + 360) = v11;
  uint64_t v12 = *(void *)(a2 + 376);
  *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
  *(void *)(a1 + 376) = v12;
  uint64_t v13 = *(void *)(a2 + 392);
  *(unsigned char *)(a1 + 400) = *(unsigned char *)(a2 + 400);
  *(void *)(a1 + 392) = v13;
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IEPlannerGrainMetricsRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 416)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IEPlannerGrainMetricsRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 408) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 416) = 1;
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
    *(unsigned char *)(result + 416) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IEPlannerGrainMetricsRecord()
{
  return &type metadata for IEPlannerGrainMetricsRecord;
}

uint64_t getEnumTagSinglePayload for PlannerGrainStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlannerGrainStage(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x259EE30C0);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlannerGrainStage()
{
  return &type metadata for PlannerGrainStage;
}

char *keypath_get_selector_plannerResponseTime()
{
  return sel_plannerResponseTime;
}

id sub_259EE3104@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_plannerResponseTime);
  *a2 = result;
  return result;
}

id sub_259EE3140(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlannerResponseTime_, *a1);
}

char *keypath_get_selector_startToPlanCreatedTime()
{
  return sel_startToPlanCreatedTime;
}

id sub_259EE3160@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_startToPlanCreatedTime);
  *a2 = result;
  return result;
}

id sub_259EE319C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToPlanCreatedTime_, *a1);
}

char *keypath_get_selector_startToLastQueryDecorationEventTime()
{
  return sel_startToLastQueryDecorationEventTime;
}

id sub_259EE31BC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_startToLastQueryDecorationEventTime);
  *a2 = result;
  return result;
}

id sub_259EE31F8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToLastQueryDecorationEventTime_, *a1);
}

char *keypath_get_selector_lastQueryDecorationEventToPlanCreatedTime()
{
  return sel_lastQueryDecorationEventToPlanCreatedTime;
}

id sub_259EE3218@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_lastQueryDecorationEventToPlanCreatedTime);
  *a2 = result;
  return result;
}

id sub_259EE3254(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLastQueryDecorationEventToPlanCreatedTime_, *a1);
}

char *keypath_get_selector_startToContextRetrievedTime()
{
  return sel_startToContextRetrievedTime;
}

id sub_259EE3274@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_startToContextRetrievedTime);
  *a2 = result;
  return result;
}

id sub_259EE32B0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToContextRetrievedTime_, *a1);
}

char *keypath_get_selector_startToEntitySpanMatchedTime()
{
  return sel_startToEntitySpanMatchedTime;
}

id sub_259EE32D0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_startToEntitySpanMatchedTime);
  *a2 = result;
  return result;
}

id sub_259EE330C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToEntitySpanMatchedTime_, *a1);
}

char *keypath_get_selector_startToToolsRetrievedTime()
{
  return sel_startToToolsRetrievedTime;
}

id sub_259EE332C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_startToToolsRetrievedTime);
  *a2 = result;
  return result;
}

id sub_259EE3368(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartToToolsRetrievedTime_, *a1);
}

uint64_t sub_259EE337C()
{
  return swift_release();
}

uint64_t sub_259EE3384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of IEMetricsRecord.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of IEMetricsDictionary.dictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_259EE3414(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_259EFEC00();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v34 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_259EFECC0();
  MEMORY[0x270FA5388](v6 - 8);
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v33 = __swift_project_value_buffer(v3, (uint64_t)qword_26A3F8AB8);
  BOOL v7 = sub_259EFEBF0();
  os_log_type_t v8 = sub_259EFEDC0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    int v31 = (int)v2;
    int v2 = (uint8_t *)v9;
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v32 = v4;
    uint64_t v11 = v10;
    id v36 = v10;
    *(_DWORD *)int v2 = 136315138;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B90);
    uint64_t v12 = sub_259EFECD0();
    uint64_t v35 = sub_259ED2D5C(v12, v13, (uint64_t *)&v36);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259EC8000, v7, v8, "Converting %s metrics dictionary to json string", v2, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = v11;
    uint64_t v4 = v32;
    MEMORY[0x25A2EF270](v14, -1, -1);
    uint64_t v15 = v2;
    LOBYTE(v2) = v31;
    MEMORY[0x25A2EF270](v15, -1, -1);
  }

  if (v2) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 2;
  }
  uint64_t v17 = self;
  uint64_t v18 = (void *)sub_259EFEC20();
  id v36 = 0;
  id v19 = objc_msgSend(v17, sel_dataWithJSONObject_options_error_, v18, v16, &v36);

  id v20 = v36;
  if (v19)
  {
    uint64_t v21 = sub_259EFE5D0();
    unint64_t v23 = v22;

    sub_259EFECB0();
    uint64_t v24 = sub_259EFECA0();
    sub_259EE38A0(v21, v23);
  }
  else
  {
    uint64_t v25 = v20;
    uint64_t v26 = (void *)sub_259EFE5C0();

    swift_willThrow();
    BOOL v27 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v34, v33, v3);
    id v36 = 0;
    unint64_t v37 = 0xE000000000000000;
    sub_259EFEE80();
    sub_259EFECF0();
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B90);
    sub_259EFECD0();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
    sub_259EFECF0();
    uint64_t v28 = (uint64_t)v36;
    LOBYTE(v36) = -127;
    Logger.error(_:_:)(v28, v37, (char *)&v36);
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v27, v3);
    return 0;
  }
  return v24;
}

uint64_t sub_259EE38A0(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for IEMetricsRecordHelper()
{
  return &type metadata for IEMetricsRecordHelper;
}

uint64_t IERequestGrainCalculator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t IERequestGrainCalculator.init()()
{
  return v0;
}

uint64_t sub_259EE3924(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  if (result)
  {
    sub_259EEEE80(a2, a3, a4, a5, a6, a7, (uint64_t)v26);
    swift_beginAccess();
    uint64_t v9 = *a9;
    sub_259EE5924((uint64_t)v26);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a9 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v9 = sub_259EE97A4(0, v9[2] + 1, 1, v9);
      *a9 = v9;
    }
    unint64_t v12 = v9[2];
    unint64_t v11 = v9[3];
    if (v12 >= v11 >> 1)
    {
      uint64_t v9 = sub_259EE97A4((void *)(v11 > 1), v12 + 1, 1, v9);
      *a9 = v9;
    }
    v9[2] = v12 + 1;
    unint64_t v13 = &v9[32 * v12];
    long long v14 = v26[0];
    long long v15 = v26[1];
    long long v16 = v26[3];
    v13[4] = v26[2];
    v13[5] = v16;
    v13[2] = v14;
    v13[3] = v15;
    long long v17 = v26[4];
    long long v18 = v26[5];
    long long v19 = v26[7];
    v13[8] = v26[6];
    v13[9] = v19;
    v13[6] = v17;
    v13[7] = v18;
    long long v20 = v26[8];
    long long v21 = v26[9];
    long long v22 = v26[11];
    v13[12] = v26[10];
    v13[13] = v22;
    v13[10] = v20;
    v13[11] = v21;
    long long v23 = v26[12];
    long long v24 = v26[13];
    long long v25 = v26[15];
    v13[16] = v26[14];
    v13[17] = v25;
    v13[14] = v23;
    v13[15] = v24;
    swift_endAccess();
    return sub_259EE59AC((uint64_t)v26);
  }
  return result;
}

uint64_t IERequestGrainCalculator.deinit()
{
  return v0;
}

uint64_t IERequestGrainCalculator.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

void *sub_259EE3A8C(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v128 = a4;
  uint64_t v129 = a5;
  uint64_t v165 = a1;
  uint64_t v11 = sub_259EFEC00();
  long long v156 = *(void **)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v159 = (char *)&v125 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  unint64_t v138 = (char *)&v125 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  long long v145 = (char *)&v125 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  long long v135 = (char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v134 = (uint64_t)&v125 - v21;
  MEMORY[0x270FA5388](v20);
  long long v23 = (char *)&v125 - v22;
  uint64_t v164 = sub_259EFE840();
  uint64_t v146 = *(void *)(v164 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v164);
  v158 = (char *)&v125 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  BOOL v27 = (char *)&v125 - v26;
  uint64_t v28 = sub_259EFE7A0();
  unint64_t v162 = *(void *)(v28 - 8);
  uint64_t v163 = v28;
  MEMORY[0x270FA5388](v28);
  v161 = (uint64_t *)((char *)&v125 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v30 = sub_259EFE750();
  uint64_t v126 = *(void *)(v30 - 8);
  uint64_t v127 = v30;
  MEMORY[0x270FA5388](v30);
  uint64_t v132 = (uint64_t)&v125 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A3F87B0 != -1) {
LABEL_40:
  }
    swift_once();
  uint64_t v149 = a6;
  uint64_t v32 = __swift_project_value_buffer(v11, (uint64_t)qword_26A3F8B00);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v147 = v32;
  uint64_t v33 = sub_259EFEBF0();
  os_log_type_t v34 = sub_259EFEDD0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  unint64_t v148 = a7;
  uint64_t v130 = a2;
  unint64_t v131 = a3;
  uint64_t v157 = v11;
  long long v153 = v23;
  long long v154 = v27;
  if (v35)
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(void *)&v182[0] = v11;
    *(_DWORD *)uint64_t v36 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v166 = sub_259ED2D5C((uint64_t)a2, a3, (uint64_t *)v182);
    long long v23 = v153;
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v36 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v166 = sub_259ED2D5C(v149, v148, (uint64_t *)v182);
    a7 = v148;
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v33, v34, "start for sessionId: %s clientRequestId: %s", (uint8_t *)v36, 0x16u);
    uint64_t v37 = MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v11, -1, -1);
    uint64_t v38 = v36;
    BOOL v27 = v154;
    uint64_t v39 = v157;
    MEMORY[0x25A2EF270](v38, -1, -1);
  }
  else
  {
    uint64_t v39 = v11;

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v37 = MEMORY[0x263F8EE58];
  }
  long long v183 = (void *)MEMORY[0x263F8EE78];
  (*(void (**)(uint64_t, void *, uint64_t))(v126 + 16))(v132, v165, v127);
  char v40 = v161;
  sub_259EFE740();
  a6 = sub_259EFE790();
  (*(void (**)(void *, uint64_t))(v162 + 8))(v40, v163);
  uint64_t v144 = *(void *)(a6 + 16);
  if (v144)
  {
    a3 = 0;
    uint64_t v165 = 0;
    unint64_t v142 = a6 + ((*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80));
    uint64_t v163 = v146 + 16;
    int v133 = *MEMORY[0x263F51718];
    a2 = (void *)(v146 + 8);
    unint64_t v140 = (void (**)(char *, uint64_t))(v156 + 1);
    long long v141 = (void (**)(char *, uint64_t, uint64_t))(v156 + 2);
    *(void *)&long long v41 = 136315138;
    long long v137 = v41;
    uint64_t v136 = v37 + 8;
    long long v139 = xmmword_259F00F40;
    uint64_t v42 = v164;
    uint64_t v143 = a6;
    v160 = (void *)(v146 + 8);
    while (1)
    {
      if (a3 >= *(void *)(a6 + 16))
      {
        __break(1u);
        goto LABEL_40;
      }
      unint64_t v43 = v142 + *(void *)(v146 + 72) * a3;
      v161 = *(void **)(v146 + 16);
      unint64_t v162 = a3;
      ((void (*)(char *, unint64_t, uint64_t))v161)(v27, v43, v42);
      uint64_t v44 = (uint64_t)v145;
      sub_259EFE7D0();
      int64_t v45 = (void *)sub_259EFE8B0();
      uint64_t v46 = *(v45 - 1);
      long long v155 = *(void **)(v46 + 48);
      int v47 = ((uint64_t (*)(uint64_t, uint64_t, void *))v155)(v44, 1, v45);
      long long v156 = v45;
      long long v152 = (void *)v46;
      if (v47 == 1) {
        break;
      }
      sub_259EFE8A0();
      (*(void (**)(uint64_t, void *))(v46 + 8))(v44, v45);
      uint64_t v49 = sub_259EFE920();
      uint64_t v50 = *(void *)(v49 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v23, 1, v49) == 1) {
        goto LABEL_20;
      }
      uint64_t v51 = (uint64_t)v23;
      uint64_t v52 = v134;
      sub_259ED0B9C(v51, v134);
      int v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 88))(v52, v49);
      uint64_t v54 = v52;
      long long v23 = v153;
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v54, v49);
      BOOL v55 = v53 == v133;
      BOOL v27 = v154;
      uint64_t v39 = v157;
      if (!v55) {
        goto LABEL_20;
      }
      sub_259ED1170((uint64_t)v23, &qword_26A3F8878);
      if (v165)
      {
        swift_retain();
        sub_259EEEE80((uint64_t)v130, v131, v128, v129, v149, a7, (uint64_t)v182);
        long long v179 = v182[13];
        long long v180 = v182[14];
        long long v181 = v182[15];
        long long v175 = v182[9];
        long long v176 = v182[10];
        long long v177 = v182[11];
        long long v178 = v182[12];
        long long v170 = v182[4];
        long long v171 = v182[5];
        long long v172 = v182[6];
        long long v173 = v182[7];
        long long v174 = v182[8];
        long long v166 = v182[0];
        long long v167 = v182[1];
        long long v168 = v182[2];
        long long v169 = v182[3];
        swift_beginAccess();
        uint64_t v56 = v183;
        sub_259EE5924((uint64_t)&v166);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v56 = sub_259EE97A4(0, v56[2] + 1, 1, v56);
        }
        os_log_type_t v57 = v158;
        unint64_t v59 = v56[2];
        unint64_t v58 = v56[3];
        if (v59 >= v58 >> 1) {
          uint64_t v56 = sub_259EE97A4((void *)(v58 > 1), v59 + 1, 1, v56);
        }
        v56[2] = v59 + 1;
        id v60 = &v56[32 * v59];
        long long v61 = v166;
        long long v62 = v167;
        long long v63 = v169;
        v60[4] = v168;
        v60[5] = v63;
        v60[2] = v61;
        v60[3] = v62;
        long long v64 = v170;
        long long v65 = v171;
        long long v66 = v173;
        v60[8] = v172;
        v60[9] = v66;
        v60[6] = v64;
        v60[7] = v65;
        long long v67 = v174;
        long long v68 = v175;
        long long v69 = v177;
        v60[12] = v176;
        v60[13] = v69;
        v60[10] = v67;
        v60[11] = v68;
        long long v70 = v178;
        long long v71 = v179;
        long long v72 = v181;
        v60[16] = v180;
        v60[17] = v72;
        v60[14] = v70;
        v60[15] = v71;
        long long v183 = v56;
        swift_endAccess();
        sub_259EE59AC((uint64_t)&v166);
        swift_release();
        uint64_t v39 = v157;
        BOOL v27 = v154;
      }
      else
      {
        os_log_type_t v57 = v158;
      }
      type metadata accessor for IERequestGrainSpec();
      swift_allocObject();
      long long v114 = sub_259EEF10C();
      swift_release();
      uint64_t v165 = v114;
      uint64_t v73 = v159;
LABEL_21:
      uint64_t v74 = v39;
      (*v141)(v73, v147, v39);
      uint64_t v42 = v164;
      ((void (*)(char *, char *, uint64_t))v161)(v57, v27, v164);
      id v75 = sub_259EFEBF0();
      os_log_type_t v76 = sub_259EFEDD0();
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v77 = swift_slowAlloc();
        v161 = (void *)swift_slowAlloc();
        *(void *)&v182[0] = v161;
        *(_DWORD *)uint64_t v77 = v137;
        id v78 = v138;
        sub_259EFE7D0();
        id v79 = v156;
        if (((unsigned int (*)(char *, uint64_t, void *))v155)(v78, 1, v156) == 1)
        {
          uint64_t v80 = (uint64_t)v78;
          id v81 = &qword_26A3F8870;
          goto LABEL_27;
        }
        long long v84 = v135;
        sub_259EFE8A0();
        id v85 = v78;
        uint64_t v86 = (uint64_t)v84;
        ((void (*)(char *, void *))v152[1])(v85, v79);
        uint64_t v87 = sub_259EFE920();
        uint64_t v88 = *(void *)(v87 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v86, 1, v87) == 1)
        {
          uint64_t v80 = v86;
          id v81 = &qword_26A3F8878;
LABEL_27:
          sub_259ED1170(v80, v81);
          unint64_t v89 = 0xE300000000000000;
          uint64_t v90 = 7104878;
        }
        else
        {
          uint64_t v90 = sub_259EFE910();
          unint64_t v89 = v91;
          (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v86, v87);
        }
        uint64_t v42 = v164;
        int v92 = v161;
        *(void *)(v77 + 4) = sub_259ED2D5C(v90, v89, (uint64_t *)v182);
        swift_bridgeObjectRelease();
        a2 = v160;
        long long v82 = (void (*)(char *, uint64_t))*v160;
        ((void (*)(char *, uint64_t))*v160)(v158, v42);
        _os_log_impl(&dword_259EC8000, v75, v76, "handling event %s", (uint8_t *)v77, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v92, -1, -1);
        MEMORY[0x25A2EF270](v77, -1, -1);

        uint64_t v83 = v157;
        (*v140)(v159, v157);
        goto LABEL_30;
      }
      a2 = v160;
      long long v82 = (void (*)(char *, uint64_t))*v160;
      ((void (*)(char *, uint64_t))*v160)(v57, v42);

      (*v140)(v73, v74);
      uint64_t v83 = v74;
LABEL_30:
      uint64_t v93 = v154;
      uint64_t v94 = v165;
      if (v165)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B98);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v139;
        uint64_t v96 = v94[2];
        uint64_t v150 = type metadata accessor for RequestGrainDimensionsSpec();
        *(void *)(inited + 56) = v150;
        *(void *)(inited + 64) = &off_2707DD990;
        *(void *)(inited + 32) = v96;
        uint64_t v97 = v94[3];
        uint64_t v98 = type metadata accessor for IETranscriptLatencyIntervalSpec();
        *(void *)(inited + 96) = v98;
        *(void *)(inited + 104) = &off_2707DD9A0;
        *(void *)(inited + 72) = v97;
        long long v151 = (void *)(inited + 72);
        uint64_t v99 = v94[4];
        *(void *)(inited + 136) = v98;
        *(void *)(inited + 144) = &off_2707DD9A0;
        *(void *)(inited + 112) = v99;
        long long v152 = (void *)(inited + 112);
        uint64_t v100 = v165[5];
        *(void *)(inited + 176) = v98;
        *(void *)(inited + 184) = &off_2707DD9A0;
        *(void *)(inited + 152) = v100;
        long long v155 = (void *)(inited + 152);
        uint64_t v101 = v165[6];
        *(void *)(inited + 216) = v98;
        *(void *)(inited + 224) = &off_2707DD9A0;
        *(void *)(inited + 192) = v101;
        long long v156 = (void *)(inited + 192);
        uint64_t v102 = v165[7];
        *(void *)(inited + 256) = v98;
        *(void *)(inited + 264) = &off_2707DD9A0;
        *(void *)(inited + 232) = v102;
        v161 = (void *)(inited + 232);
        uint64_t v42 = v164;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        __swift_project_boxed_opaque_existential_1((void *)(inited + 32), v150);
        off_2707DD998();
        uint64_t v103 = *(void *)(inited + 96);
        uint64_t v104 = *(void *)(inited + 104);
        __swift_project_boxed_opaque_existential_1(v151, v103);
        (*(void (**)(char *, uint64_t, uint64_t))(v104 + 8))(v93, v103, v104);
        uint64_t v105 = *(void *)(inited + 136);
        uint64_t v106 = *(void *)(inited + 144);
        __swift_project_boxed_opaque_existential_1(v152, v105);
        (*(void (**)(char *, uint64_t, uint64_t))(v106 + 8))(v93, v105, v106);
        uint64_t v107 = *(void *)(inited + 176);
        uint64_t v108 = *(void *)(inited + 184);
        __swift_project_boxed_opaque_existential_1(v155, v107);
        (*(void (**)(char *, uint64_t, uint64_t))(v108 + 8))(v93, v107, v108);
        uint64_t v109 = *(void *)(inited + 216);
        uint64_t v110 = *(void *)(inited + 224);
        __swift_project_boxed_opaque_existential_1(v156, v109);
        (*(void (**)(char *, uint64_t, uint64_t))(v110 + 8))(v93, v109, v110);
        uint64_t v111 = *(void *)(inited + 256);
        uint64_t v112 = *(void *)(inited + 264);
        __swift_project_boxed_opaque_existential_1(v161, v111);
        uint64_t v113 = v111;
        uint64_t v83 = v157;
        (*(void (**)(char *, uint64_t, uint64_t))(v112 + 8))(v93, v113, v112);
        swift_bridgeObjectRelease();
        a2 = v160;
        swift_release();
        long long v82 = (void (*)(char *, uint64_t))*a2;
      }
      uint64_t v39 = v83;
      a3 = v162 + 1;
      v82(v93, v42);
      a6 = v143;
      a7 = v148;
      uint64_t v11 = v149;
      BOOL v27 = v93;
      long long v23 = v153;
      if (v144 == a3) {
        goto LABEL_35;
      }
    }
    sub_259ED1170(v44, &qword_26A3F8870);
    uint64_t v48 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v23, 1, 1, v48);
LABEL_20:
    sub_259ED1170((uint64_t)v23, &qword_26A3F8878);
    os_log_type_t v57 = v158;
    uint64_t v73 = v159;
    goto LABEL_21;
  }
  uint64_t v165 = 0;
  uint64_t v11 = v149;
LABEL_35:
  swift_bridgeObjectRelease();
  uint64_t v115 = swift_retain();
  uint64_t v116 = (uint64_t)v130;
  unint64_t v117 = v131;
  uint64_t v118 = v132;
  sub_259EE3924(v115, (uint64_t)v130, v131, v128, v129, v11, a7, v132, &v183);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v118, v127);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v119 = sub_259EFEBF0();
  os_log_type_t v120 = sub_259EFEDD0();
  if (os_log_type_enabled(v119, v120))
  {
    uint64_t v121 = swift_slowAlloc();
    uint64_t v122 = swift_slowAlloc();
    *(void *)&v182[0] = v122;
    *(_DWORD *)uint64_t v121 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v166 = sub_259ED2D5C(v116, v117, (uint64_t *)v182);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v121 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v166 = sub_259ED2D5C(v11, a7, (uint64_t *)v182);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v119, v120, "end for sessionId: %s clientRequestId: %s", (uint8_t *)v121, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v122, -1, -1);
    MEMORY[0x25A2EF270](v121, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t v123 = v183;
  swift_release();
  return v123;
}

uint64_t sub_259EE4C50()
{
  uint64_t v0 = sub_259EFE750();
  uint64_t v97 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v106 = (char *)v81 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A98);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (void *)((char *)v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v3);
  BOOL v7 = (void *)((char *)v81 - v6);
  unint64_t v8 = sub_259EFE780();
  uint64_t v86 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v104 = (char *)v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  int v92 = (void *)((char *)v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (void *)((char *)v81 - v13);
  if (qword_26A3F87B0 != -1) {
    goto LABEL_86;
  }
  while (1)
  {
    uint64_t v15 = sub_259EFEC00();
    v81[1] = __swift_project_value_buffer(v15, (uint64_t)qword_26A3F8B00);
    uint64_t v16 = sub_259EFEBF0();
    os_log_type_t v17 = sub_259EFEDD0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_259EC8000, v16, v17, "calculator start", v18, 2u);
      MEMORY[0x25A2EF270](v18, -1, -1);
    }

    uint64_t v108 = (void *)MEMORY[0x263F8EE78];
    uint64_t v19 = sub_259EFE7B0();
    int64_t v91 = 0;
    uint64_t v20 = *(void *)(v19 + 64);
    uint64_t v82 = v19 + 64;
    uint64_t v85 = v19;
    uint64_t v21 = 1 << *(unsigned char *)(v19 + 32);
    uint64_t v22 = v21 < 64 ? ~(-1 << v21) : -1;
    unint64_t v23 = v22 & v20;
    uint64_t v84 = v86 + 16;
    uint64_t v90 = (void (**)(char *, char *, unint64_t))(v86 + 32);
    uint64_t v96 = v97 + 16;
    uint64_t v99 = (void (**)(char *, uint64_t))(v97 + 8);
    uint64_t v100 = (void (**)(char *, char *, uint64_t))(v97 + 32);
    uint64_t v88 = (void (**)(char *, unint64_t))(v86 + 8);
    int64_t v83 = (unint64_t)(v21 + 63) >> 6;
    v81[0] = v83 - 1;
    uint64_t v102 = v7;
    unint64_t v89 = v8;
LABEL_9:
    uint64_t v24 = (uint64_t)v92;
    if (!v23) {
      break;
    }
    uint64_t v93 = (v23 - 1) & v23;
    unint64_t v25 = __clz(__rbit64(v23)) | (v91 << 6);
LABEL_11:
    uint64_t v26 = *(void *)(v85 + 56);
    BOOL v27 = (void *)(*(void *)(v85 + 48) + 16 * v25);
    uint64_t v28 = v27[1];
    uint64_t v24 = (uint64_t)v92;
    *int v92 = *v27;
    *(void *)(v24 + 8) = v28;
    uint64_t v29 = v86;
    uint64_t v30 = v26 + *(void *)(v86 + 72) * v25;
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    (*(void (**)(uint64_t, uint64_t, unint64_t))(v29 + 16))(v24 + *(int *)(v31 + 48), v30, v8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v24, 0, 1, v31);
    swift_bridgeObjectRetain();
LABEL_30:
    sub_259EDDCBC(v24, (uint64_t)v14, &qword_26A3F8AA0);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v14, 1, v36) == 1)
    {
      swift_release();
      uint64_t v73 = v108;
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_259EFEBF0();
      os_log_type_t v75 = sub_259EFEDD0();
      if (os_log_type_enabled(v74, v75))
      {
        os_log_type_t v76 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v76 = 134217984;
        uint64_t v107 = v73[2];
        sub_259EFEE10();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v74, v75, "computed metrics for %ld requests", v76, 0xCu);
        MEMORY[0x25A2EF270](v76, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      uint64_t v77 = sub_259EFEBF0();
      os_log_type_t v78 = sub_259EFEDD0();
      if (os_log_type_enabled(v77, v78))
      {
        id v79 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v79 = 0;
        _os_log_impl(&dword_259EC8000, v77, v78, "calculator end", v79, 2u);
        MEMORY[0x25A2EF270](v79, -1, -1);
      }

      swift_beginAccess();
      return (uint64_t)v108;
    }
    uint64_t v101 = (void *)*v14;
    unint64_t v103 = v14[1];
    (*v90)(v104, (char *)v14 + *(int *)(v36 + 48), v8);
    uint64_t v37 = sub_259EFE770();
    int64_t v105 = 0;
    uint64_t v38 = *(void *)(v37 + 64);
    uint64_t v94 = v37 + 64;
    uint64_t v98 = v37;
    uint64_t v39 = 1 << *(unsigned char *)(v37 + 32);
    if (v39 < 64) {
      uint64_t v40 = ~(-1 << v39);
    }
    else {
      uint64_t v40 = -1;
    }
    unint64_t v8 = v40 & v38;
    int64_t v95 = (unint64_t)(v39 + 63) >> 6;
    int64_t v87 = v95 - 1;
    long long v41 = v102;
    BOOL v7 = &qword_26A3F8AB0;
    while (1)
    {
      if (v8)
      {
        unint64_t v42 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v43 = v42 | (v105 << 6);
        goto LABEL_39;
      }
      int64_t v50 = v105 + 1;
      if (__OFADD__(v105, 1)) {
        goto LABEL_83;
      }
      if (v50 < v95)
      {
        unint64_t v51 = *(void *)(v94 + 8 * v50);
        if (v51) {
          goto LABEL_43;
        }
        int64_t v52 = v105 + 2;
        ++v105;
        if (v50 + 1 < v95)
        {
          unint64_t v51 = *(void *)(v94 + 8 * v52);
          if (v51) {
            goto LABEL_46;
          }
          int64_t v105 = v50 + 1;
          if (v50 + 2 < v95)
          {
            unint64_t v51 = *(void *)(v94 + 8 * (v50 + 2));
            if (v51)
            {
              v50 += 2;
LABEL_43:
              unint64_t v8 = (v51 - 1) & v51;
              unint64_t v43 = __clz(__rbit64(v51)) + (v50 << 6);
              int64_t v105 = v50;
LABEL_39:
              uint64_t v44 = v97;
              uint64_t v45 = *(void *)(v98 + 56);
              uint64_t v46 = (uint64_t *)(*(void *)(v98 + 48) + 16 * v43);
              uint64_t v47 = v46[1];
              uint64_t *v5 = *v46;
              v5[1] = v47;
              uint64_t v48 = v45 + *(void *)(v44 + 72) * v43;
              uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
              (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))((char *)v5 + *(int *)(v49 + 48), v48, v0);
              (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v5, 0, 1, v49);
              swift_bridgeObjectRetain();
              goto LABEL_58;
            }
            int64_t v52 = v50 + 3;
            int64_t v105 = v50 + 2;
            if (v50 + 3 < v95) {
              break;
            }
          }
        }
      }
LABEL_57:
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v5, 1, 1, v53);
      unint64_t v8 = 0;
LABEL_58:
      sub_259EDDCBC((uint64_t)v5, (uint64_t)v41, &qword_26A3F8A98);
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v41, 1, v54) == 1)
      {
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v8 = v89;
        (*v88)(v104, v89);
        unint64_t v23 = v93;
        goto LABEL_9;
      }
      BOOL v7 = v5;
      uint64_t v5 = v14;
      uint64_t v55 = *v41;
      unint64_t v56 = v41[1];
      os_log_type_t v57 = (char *)v41 + *(int *)(v54 + 48);
      uint64_t v14 = (uint64_t *)v106;
      uint64_t v58 = v0;
      (*v100)(v106, v57, v0);
      uint64_t v59 = sub_259EFE760();
      long long v61 = sub_259EE3A8C(v14, v101, v103, v59, v60, v55, v56);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v62 = v61[2];
      long long v63 = v108;
      int64_t v64 = v108[2];
      uint64_t v0 = v64 + v62;
      if (__OFADD__(v64, v62))
      {
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v0 > v63[3] >> 1)
      {
        if (v64 <= v0) {
          int64_t v66 = v64 + v62;
        }
        else {
          int64_t v66 = v64;
        }
        long long v63 = sub_259EE97A4(isUniquelyReferenced_nonNull_native, v66, 1, v63);
      }
      uint64_t v0 = v58;
      uint64_t v14 = v5;
      unint64_t v67 = v61[2];
      uint64_t v5 = v7;
      long long v41 = v102;
      if (v67)
      {
        uint64_t v68 = v63[2];
        BOOL v7 = &qword_26A3F8AB0;
        if ((v63[3] >> 1) - v68 < (uint64_t)v67) {
          goto LABEL_81;
        }
        unint64_t v69 = (unint64_t)&v63[32 * v68 + 4];
        if ((unint64_t)(v61 + 4) < v69 + (v67 << 8) && v69 < (unint64_t)&v61[32 * v67 + 4]) {
          goto LABEL_88;
        }
        swift_arrayInitWithCopy();
        if (v67 < v62) {
          goto LABEL_80;
        }
        uint64_t v70 = v63[2];
        BOOL v71 = __OFADD__(v70, v67);
        uint64_t v72 = v70 + v67;
        if (v71) {
          goto LABEL_82;
        }
        v63[2] = v72;
      }
      else
      {
        BOOL v7 = &qword_26A3F8AB0;
        if (v62) {
          goto LABEL_80;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v108 = v63;
      (*v99)(v106, v0);
    }
    unint64_t v51 = *(void *)(v94 + 8 * v52);
    if (v51)
    {
LABEL_46:
      int64_t v50 = v52;
      goto LABEL_43;
    }
    while (1)
    {
      int64_t v50 = v52 + 1;
      if (__OFADD__(v52, 1)) {
        break;
      }
      if (v50 >= v95)
      {
        int64_t v105 = v87;
        goto LABEL_57;
      }
      unint64_t v51 = *(void *)(v94 + 8 * v50);
      ++v52;
      if (v51) {
        goto LABEL_43;
      }
    }
LABEL_85:
    __break(1u);
LABEL_86:
    swift_once();
  }
  int64_t v32 = v91 + 1;
  if (__OFADD__(v91, 1))
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (v32 >= v83)
  {
LABEL_29:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v24, 1, 1, v35);
    uint64_t v93 = 0;
    goto LABEL_30;
  }
  unint64_t v33 = *(void *)(v82 + 8 * v32);
  if (v33)
  {
LABEL_15:
    uint64_t v93 = (v33 - 1) & v33;
    unint64_t v25 = __clz(__rbit64(v33)) + (v32 << 6);
    int64_t v91 = v32;
    goto LABEL_11;
  }
  int64_t v34 = v91 + 2;
  ++v91;
  if (v32 + 1 >= v83) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v82 + 8 * v34);
  if (v33) {
    goto LABEL_18;
  }
  int64_t v91 = v32 + 1;
  if (v32 + 2 >= v83) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v82 + 8 * (v32 + 2));
  if (v33)
  {
    v32 += 2;
    goto LABEL_15;
  }
  int64_t v34 = v32 + 3;
  int64_t v91 = v32 + 2;
  if (v32 + 3 >= v83) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v82 + 8 * v34);
  if (v33)
  {
LABEL_18:
    int64_t v32 = v34;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v32 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v32 >= v83)
    {
      int64_t v91 = v81[0];
      goto LABEL_29;
    }
    unint64_t v33 = *(void *)(v82 + 8 * v32);
    ++v34;
    if (v33) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_88:
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for IERequestGrainCalculator()
{
  return self;
}

uint64_t method lookup function for IERequestGrainCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IERequestGrainCalculator);
}

uint64_t dispatch thunk of IERequestGrainCalculator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of IERequestGrainCalculator.extractMetrics(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t sub_259EE5924(uint64_t a1)
{
  return a1;
}

uint64_t sub_259EE59AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_259EE5A34(uint64_t a1)
{
  return sub_259EE5A5C(a1, &qword_26A3F8BC0, &qword_26A3F8BC8);
}

uint64_t sub_259EE5A48(uint64_t a1)
{
  return sub_259EE5A5C(a1, &qword_26A3F8BD0, &qword_26A3F8BD8);
}

uint64_t sub_259EE5A5C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v5 = sub_259EFEF10();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE80];
  }
  uint64_t v30 = a1 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v29 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_28;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v29) {
      goto LABEL_37;
    }
    unint64_t v17 = *(void *)(v30 + 8 * v16);
    int64_t v18 = v11 + 1;
    if (!v17)
    {
      int64_t v18 = v11 + 2;
      if (v11 + 2 >= v29) {
        goto LABEL_37;
      }
      unint64_t v17 = *(void *)(v30 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v11 + 3;
        if (v11 + 3 >= v29) {
          goto LABEL_37;
        }
        unint64_t v17 = *(void *)(v30 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v11 + 4;
          if (v11 + 4 >= v29) {
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v30 + 8 * v18);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
    int64_t v11 = v18;
LABEL_28:
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8 * v15);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t result = sub_259EFEC40();
    uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
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
    uint64_t v13 = 8 * v12;
    *(void *)(*(void *)(v5 + 48) + v13) = v20;
    *(void *)(*(void *)(v5 + 56) + v13) = v21;
    ++*(void *)(v5 + 16);
  }
  int64_t v19 = v11 + 5;
  if (v11 + 5 >= v29)
  {
LABEL_37:
    swift_release();
    sub_259EE337C();
    return v5;
  }
  unint64_t v17 = *(void *)(v30 + 8 * v19);
  if (v17)
  {
    int64_t v18 = v11 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v18 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v18 >= v29) {
      goto LABEL_37;
    }
    unint64_t v17 = *(void *)(v30 + 8 * v18);
    ++v19;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t IERequestGrainMetricsRecord.description.getter()
{
  unint64_t v0 = IERequestGrainMetricsRecord.dictionary.getter();
  uint64_t v1 = sub_259EE3414(v0, 1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3) {
    return v1;
  }
  else {
    return 0xD00000000000002ALL;
  }
}

unint64_t IERequestGrainMetricsRecord.dictionary.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v48 = v0[7];
  uint64_t v49 = v0[8];
  uint64_t v50 = v0[9];
  uint64_t v51 = v0[10];
  uint64_t v52 = v0[11];
  uint64_t v53 = v0[12];
  uint64_t v8 = v0[15];
  uint64_t v54 = v0[13];
  uint64_t v55 = v0[14];
  long long v47 = *(_OWORD *)(v0 + 17);
  uint64_t v56 = v0[16];
  uint64_t v57 = v0[19];
  uint64_t v58 = v0[20];
  uint64_t v9 = v0[21];
  uint64_t v10 = v0[23];
  char v59 = *((unsigned char *)v0 + 176);
  int v60 = *((unsigned __int8 *)v0 + 192);
  uint64_t v11 = v0[25];
  uint64_t v12 = v0[27];
  int v61 = *((unsigned __int8 *)v0 + 208);
  int v62 = *((unsigned __int8 *)v0 + 224);
  uint64_t v13 = v0[29];
  char v63 = *((unsigned char *)v0 + 240);
  uint64_t v64 = v0[31];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F8);
  uint64_t v14 = swift_allocObject();
  unint64_t v15 = (void *)v14;
  *(_OWORD *)(v14 + 16) = xmmword_259F00FB0;
  *(void *)(v14 + 32) = 0x496E6F6973736573;
  *(void *)(v14 + 40) = 0xE900000000000064;
  uint64_t v16 = MEMORY[0x263F8D310];
  *(void *)(v14 + 48) = v1;
  *(void *)(v14 + 56) = v2;
  *(void *)(v14 + 72) = v16;
  strcpy((char *)(v14 + 80), "rawSessionId");
  *(unsigned char *)(v14 + 93) = 0;
  *(_WORD *)(v14 + 94) = -5120;
  *(void *)(v14 + 96) = v4;
  *(void *)(v14 + 104) = v3;
  *(void *)(v14 + 120) = v16;
  *(void *)(v14 + 128) = 0x6552746E65696C63;
  *(void *)(v14 + 136) = 0xEF64497473657571;
  *(void *)(v14 + 144) = v5;
  *(void *)(v14 + 152) = v6;
  *(void *)(v14 + 168) = v16;
  *(void *)(v14 + 176) = 0x6D45646C756F6873;
  *(void *)(v14 + 184) = 0xEA00000000007469;
  BOOL v18 = v7 > 0 || v8 > 0;
  uint64_t v19 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v14 + 192) = v18;
  *(void *)(v14 + 216) = v19;
  *(void *)(v14 + 224) = 0x65757165526D756ELL;
  uint64_t v20 = MEMORY[0x263F8D6C8];
  *(void *)(v14 + 232) = 0xEA00000000007473;
  *(void *)(v14 + 240) = v7;
  *(void *)(v14 + 264) = v20;
  strcpy((char *)(v14 + 272), "numPlanCreated");
  *(unsigned char *)(v14 + 287) = -18;
  *(void *)(v14 + 288) = v48;
  *(void *)(v14 + 312) = v20;
  *(void *)(v14 + 320) = 0xD000000000000019;
  *(void *)(v14 + 328) = 0x8000000259F030F0;
  *(void *)(v14 + 336) = v49;
  *(void *)(v14 + 360) = v20;
  *(void *)(v14 + 368) = 0xD000000000000011;
  *(void *)(v14 + 376) = 0x8000000259F025A0;
  *(void *)(v14 + 384) = v50;
  *(void *)(v14 + 408) = v20;
  *(void *)(v14 + 416) = 0xD000000000000010;
  *(void *)(v14 + 424) = 0x8000000259F02580;
  *(void *)(v14 + 432) = v51;
  *(void *)(v14 + 456) = v20;
  *(void *)(v14 + 464) = 0xD000000000000015;
  *(void *)(v14 + 472) = 0x8000000259F025E0;
  *(void *)(v14 + 480) = v52;
  *(void *)(v14 + 504) = v20;
  *(void *)(v14 + 512) = 0xD000000000000020;
  *(void *)(v14 + 520) = 0x8000000259F02FE0;
  *(void *)(v14 + 552) = v20;
  *(void *)(v14 + 528) = v53;
  *(void *)(v14 + 560) = 0xD00000000000001CLL;
  *(void *)(v14 + 568) = 0x8000000259F03110;
  *(void *)(v14 + 600) = v20;
  *(void *)(v14 + 576) = v54;
  *(void *)(v14 + 608) = 0xD00000000000001ALL;
  *(void *)(v14 + 616) = 0x8000000259F03130;
  *(void *)(v14 + 648) = v20;
  *(void *)(v14 + 624) = v55;
  *(void *)(v14 + 656) = 0xD000000000000017;
  *(void *)(v14 + 664) = 0x8000000259F03010;
  *(void *)(v14 + 696) = v20;
  *(void *)(v14 + 672) = v8;
  *(void *)(v14 + 704) = 0xD000000000000010;
  *(void *)(v14 + 712) = 0x8000000259F02600;
  *(void *)(v14 + 744) = v20;
  *(void *)(v14 + 720) = v56;
  *(void *)(v14 + 752) = 0x6449656C646E7562;
  *(void *)(v14 + 760) = 0xE900000000000073;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BA0);
  v15[99] = v21;
  v15[96] = v57;
  v15[100] = 0x7364496C6F6F74;
  v15[101] = 0xE700000000000000;
  v15[105] = v21;
  v15[102] = v58;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_259ED3630((uint64_t)v15);
  unint64_t v69 = v22;
  if (*((void *)&v47 + 1))
  {
    uint64_t v66 = v16;
    long long v65 = v47;
    sub_259ED3C9C(&v65, &v67);
    unint64_t v23 = v68;
  }
  else
  {
    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v23 = sub_259EDB4F8();
    unint64_t v68 = v23;
    *(void *)&long long v67 = v24;
  }
  if (v23)
  {
    sub_259ED3C9C(&v67, &v65);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v65, 0xD000000000000013, 0x8000000259F02540, isUniquelyReferenced_nonNull_native);
    unint64_t v69 = v22;
    swift_bridgeObjectRelease();
    if (v59)
    {
LABEL_12:
      id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v27 = sub_259EDB4F8();
      unint64_t v68 = v27;
      *(void *)&long long v67 = v26;
      goto LABEL_15;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000013, 0x8000000259F02540, &v65);
    sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
    if (v59) {
      goto LABEL_12;
    }
  }
  uint64_t v66 = MEMORY[0x263F8D538];
  *(void *)&long long v65 = v9;
  sub_259ED3C9C(&v65, &v67);
  unint64_t v27 = v68;
LABEL_15:
  if (v27)
  {
    sub_259ED3C9C(&v67, &v65);
    unint64_t v28 = v69;
    char v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v65, 0xD000000000000013, 0x8000000259F00FA0, v29);
    unint64_t v69 = v28;
    swift_bridgeObjectRelease();
    if (v60) {
      goto LABEL_17;
    }
  }
  else
  {
    sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
    sub_259EDB05C(0xD000000000000013, 0x8000000259F00FA0, &v65);
    sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
    if (v60)
    {
LABEL_17:
      id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v68 = sub_259EDB4F8();
      *(void *)&long long v67 = v30;
      if (v68) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  uint64_t v66 = MEMORY[0x263F8D538];
  *(void *)&long long v65 = v10;
  sub_259ED3C9C(&v65, &v67);
  if (v68)
  {
LABEL_18:
    sub_259ED3C9C(&v67, &v65);
    unint64_t v31 = v69;
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v65, 0x676E696E6E616C70, 0xEC000000656D6954, v32);
    unint64_t v69 = v31;
    swift_bridgeObjectRelease();
    if (v61) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
  sub_259EDB05C(0x676E696E6E616C70, 0xEC000000656D6954, &v65);
  sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
  if (v61)
  {
LABEL_19:
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v68 = sub_259EDB4F8();
    *(void *)&long long v67 = v33;
    if (v68) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v66 = MEMORY[0x263F8D538];
  *(void *)&long long v65 = v11;
  sub_259ED3C9C(&v65, &v67);
  if (v68)
  {
LABEL_20:
    sub_259ED3C9C(&v67, &v65);
    unint64_t v34 = v69;
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v65, 0x6D69547972657571, 0xE900000000000065, v35);
    unint64_t v69 = v34;
    swift_bridgeObjectRelease();
    if (v62) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
LABEL_31:
  sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
  sub_259EDB05C(0x6D69547972657571, 0xE900000000000065, &v65);
  sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
  if (v62)
  {
LABEL_21:
    id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v68 = sub_259EDB4F8();
    *(void *)&long long v67 = v36;
    if (v68) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v66 = MEMORY[0x263F8D538];
  *(void *)&long long v65 = v12;
  sub_259ED3C9C(&v65, &v67);
  if (v68)
  {
LABEL_22:
    sub_259ED3C9C(&v67, &v65);
    unint64_t v37 = v69;
    char v38 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v65, 0x6F69747563657865, 0xED0000656D69546ELL, v38);
    unint64_t v69 = v37;
    swift_bridgeObjectRelease();
    if (v63) {
      goto LABEL_23;
    }
    goto LABEL_34;
  }
LABEL_33:
  sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
  sub_259EDB05C(0x6F69747563657865, 0xED0000656D69546ELL, &v65);
  sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
  if (v63)
  {
LABEL_23:
    id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v68 = sub_259EDB4F8();
    *(void *)&long long v67 = v39;
    if (v68) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v66 = MEMORY[0x263F8D538];
  *(void *)&long long v65 = v13;
  sub_259ED3C9C(&v65, &v67);
  if (v68)
  {
LABEL_24:
    sub_259ED3C9C(&v67, &v65);
    unint64_t v40 = v69;
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_259EDB338(&v65, 0xD000000000000017, 0x8000000259F00FD0, v41);
    unint64_t v69 = v40;
    swift_bridgeObjectRelease();
    if (v64) {
      goto LABEL_25;
    }
LABEL_36:
    id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v68 = sub_259EDB4F8();
    *(void *)&long long v67 = v45;
    if (v68) {
      goto LABEL_26;
    }
LABEL_37:
    sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
    sub_259EDB05C(0x496572756C696166, 0xEB000000006F666ELL, &v65);
    sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
    return v69;
  }
LABEL_35:
  sub_259ED1170((uint64_t)&v67, &qword_26A3F88B0);
  sub_259EDB05C(0xD000000000000017, 0x8000000259F00FD0, &v65);
  sub_259ED1170((uint64_t)&v65, &qword_26A3F88B0);
  if (!v64) {
    goto LABEL_36;
  }
LABEL_25:
  unint64_t v42 = sub_259EEE578();
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A88);
  *(void *)&long long v65 = v42;
  sub_259ED3C9C(&v65, &v67);
  if (!v68) {
    goto LABEL_37;
  }
LABEL_26:
  sub_259ED3C9C(&v67, &v65);
  unint64_t v43 = v69;
  char v44 = swift_isUniquelyReferenced_nonNull_native();
  sub_259EDB338(&v65, 0x496572756C696166, 0xEB000000006F666ELL, v44);
  swift_bridgeObjectRelease();
  return v43;
}

uint64_t sub_259EE68D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_OWORD *)(a9 + 144) = a15;
  *(void *)(a9 + 160) = a16;
  *(void *)(a9 + 168) = a17;
  uint64_t result = a18 & 1;
  *(unsigned char *)(a9 + 176) = a18 & 1;
  *(void *)(a9 + 184) = a19;
  *(unsigned char *)(a9 + 192) = a20 & 1;
  *(void *)(a9 + 200) = a21;
  *(unsigned char *)(a9 + 208) = a22 & 1;
  *(void *)(a9 + 216) = a23;
  *(unsigned char *)(a9 + 224) = a24 & 1;
  *(void *)(a9 + 232) = a25;
  *(unsigned char *)(a9 + 240) = a26 & 1;
  *(void *)(a9 + 248) = a27;
  return result;
}

unint64_t sub_259EE6978()
{
  unint64_t v0 = IERequestGrainMetricsRecord.dictionary.getter();
  uint64_t v1 = sub_259EE3414(v0, 1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  if (v3) {
    return v1;
  }
  else {
    return 0xD00000000000002ALL;
  }
}

uint64_t sub_259EE69E0()
{
  unint64_t v0 = IERequestGrainMetricsRecord.dictionary.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259F009E0;
  *(void *)(inited + 32) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v2 = sub_259EE9AF0(0x676E696E6E616C70, 0xEC000000656D6954), (v3 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v2, (uint64_t)&v18), swift_dynamicCast()))
  {
    uint64_t v4 = v17;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 48) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v5 = sub_259EE9AF0(0x6F69747563657865, 0xED0000656D69546ELL), (v6 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v5, (uint64_t)&v18), swift_dynamicCast()))
  {
    uint64_t v7 = v17;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *(void *)(inited + 56) = v7;
  *(void *)(inited + 64) = swift_getKeyPath();
  if (*(void *)(v0 + 16)
    && (unint64_t v8 = sub_259EE9AF0(0xD000000000000013, 0x8000000259F00FA0), (v9 & 1) != 0)
    && (sub_259ED34B4(*(void *)(v0 + 56) + 32 * v8, (uint64_t)&v18), swift_dynamicCast()))
  {
    uint64_t v10 = v17;
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = swift_getKeyPath();
  if (*(void *)(v0 + 16) && (unint64_t v11 = sub_259EE9AF0(0xD000000000000017, 0x8000000259F00FD0), (v12 & 1) != 0))
  {
    sub_259ED34B4(*(void *)(v0 + 56) + 32 * v11, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1))
  {
    sub_259ED1170((uint64_t)&v18, &qword_26A3F88B0);
    goto LABEL_24;
  }
  if (!swift_dynamicCast())
  {
LABEL_24:
    uint64_t v13 = 0;
    goto LABEL_25;
  }
  uint64_t v13 = v17;
LABEL_25:
  *(void *)(inited + 88) = v13;
  unint64_t v14 = sub_259ED377C(inited);
  uint64_t v15 = sub_259EE5A5C(v14, &qword_26A3F8BB0, &qword_26A3F8BB8);
  swift_bridgeObjectRelease();
  return v15;
}

BOOL IERequestGrainMetricsRecord.SELFShouldEmit.getter()
{
  uint64_t v1 = v0[18];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[15];
  if (v0[17] == 0xD00000000000001ELL && v1 == 0x8000000259F02C40) {
    return v2 > 0 || v3 > 0;
  }
  char v4 = sub_259EFEF50();
  BOOL result = 0;
  if (v4) {
    return v2 > 0 || v3 > 0;
  }
  return result;
}

uint64_t IERequestGrainMetricsRecord.getSELFEvent()()
{
  uint64_t v1 = sub_259EFEC00();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v134 = (char *)&v121 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  unint64_t v131 = (char *)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v130 = (char *)&v121 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v129 = (char *)&v121 - v9;
  uint64_t v133 = sub_259EFE670();
  uint64_t v136 = *(void *)(v133 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v133);
  uint64_t v132 = (char *)&v121 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v128 = (char *)&v121 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v127 = (char *)&v121 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v126 = (char *)&v121 - v16;
  uint64_t v17 = *v0;
  uint64_t v141 = v0[1];
  uint64_t v142 = v17;
  uint64_t v18 = v0[2];
  uint64_t v139 = v0[3];
  uint64_t v140 = v18;
  uint64_t v19 = v0[4];
  uint64_t v137 = v0[5];
  uint64_t v138 = v19;
  unint64_t v20 = v0[7];
  uint64_t v135 = v0[6];
  unint64_t v22 = v0[8];
  unint64_t v21 = v0[9];
  unint64_t v23 = v0[10];
  uint64_t v24 = v0[19];
  uint64_t v144 = v0[20];
  uint64_t v145 = v24;
  uint64_t v143 = (void *)v0[31];
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EA98]), sel_init);
  if (!v25) {
    goto LABEL_34;
  }
  unint64_t v26 = (unint64_t)v25;
  uint64_t v124 = v2;
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAC0]), sel_init);
  if (!v27)
  {

LABEL_34:
    if (qword_26A3F87B0 != -1) {
LABEL_70:
    }
      swift_once();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A3F8B00);
    uint64_t v55 = sub_259EFEBF0();
    os_log_type_t v56 = sub_259EFEDC0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_259EC8000, v55, v56, "PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary init failed!", v57, 2u);
      MEMORY[0x25A2EF270](v57, -1, -1);
    }
    goto LABEL_41;
  }
  unint64_t v28 = v27;
  uint64_t v125 = (uint64_t *)v1;
  id v160 = v27;
  id v29 = objc_allocWithZone(MEMORY[0x263F6EAA0]);
  id v30 = v28;
  id v31 = objc_msgSend(v29, sel_init);
  if (!v31)
  {

    id v39 = v125;
    if (qword_26A3F87B0 != -1) {
      goto LABEL_72;
    }
    goto LABEL_38;
  }
  if ((v21 & 0x8000000000000000) != 0
    || HIDWORD(v21)
    || (char v32 = v31, objc_msgSend(v30, sel_setNumQueriesCreated_, v21), (v20 & 0x8000000000000000) != 0)
    || HIDWORD(v20)
    || (objc_msgSend(v30, sel_setNumPlansCreated_, v20), (v23 & 0x8000000000000000) != 0)
    || HIDWORD(v23)
    || (objc_msgSend(v30, sel_setNumActionsCreated_, v23), (v22 & 0x8000000000000000) != 0)
    || (uint64_t v122 = (void *)v26, v123 = v32, HIDWORD(v22)))
  {
    uint64_t result = sub_259EFEED0();
    __break(1u);
    return result;
  }
  id v33 = (long long *)(v0 + 11);
  unint64_t v34 = (long long *)(v0 + 21);
  objc_msgSend(v30, sel_setNumPlansCreatedForResponse_, v22);

  long long v35 = v33[1];
  long long v148 = *v33;
  long long v149 = v35;
  long long v36 = v33[3];
  long long v150 = v33[2];
  long long v151 = v36;
  long long v37 = v34[1];
  long long v154 = *v34;
  long long v158 = v34[4];
  long long v38 = v34[2];
  long long v157 = v34[3];
  long long v156 = v38;
  v147[0] = v142;
  v147[1] = v141;
  v147[2] = v140;
  v147[3] = v139;
  v147[4] = v138;
  v147[5] = v137;
  v147[6] = v135;
  v147[7] = v20;
  v147[8] = v22;
  v147[9] = v21;
  v147[10] = v23;
  uint64_t v152 = v145;
  uint64_t v153 = v144;
  long long v155 = v37;
  id v159 = v143;
  id v39 = v147;
  uint64_t v40 = sub_259EE69E0();
  uint64_t v41 = v40;
  uint64_t v42 = 0;
  uint64_t v43 = v40 + 64;
  uint64_t v44 = 1 << *(unsigned char *)(v40 + 32);
  uint64_t v45 = -1;
  if (v44 < 64) {
    uint64_t v45 = ~(-1 << v44);
  }
  unint64_t v26 = v45 & *(void *)(v40 + 64);
  uint64_t v1 = (unint64_t)(v44 + 63) >> 6;
  id v30 = &_swift_FORCE_LOAD___swift_signal___PnROnDeviceFramework;
  if (!v26) {
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v46 = __clz(__rbit64(v26));
  v26 &= v26 - 1;
  for (unint64_t i = v46 | (v42 << 6); ; unint64_t i = __clz(__rbit64(v49)) + (v42 << 6))
  {
    double v51 = *(double *)(*(void *)(v41 + 56) + 8 * i);
    id v52 = objc_allocWithZone(MEMORY[0x263F6EAC8]);
    swift_retain();
    id v53 = objc_msgSend(v52, sel_init);
    if (!v53)
    {
      if (qword_26A3F87B0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer((uint64_t)v125, (uint64_t)qword_26A3F8B00);
      int v62 = sub_259EFEBF0();
      os_log_type_t v63 = sub_259EFEDC0();
      BOOL v64 = os_log_type_enabled(v62, v63);
      long long v65 = v122;
      if (v64)
      {
        uint64_t v66 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v66 = 0;
        _os_log_impl(&dword_259EC8000, v62, v63, "PNROnDeviceProvisionalPNRIntervalDurationMetric init failed!", v66, 2u);
        MEMORY[0x25A2EF270](v66, -1, -1);
      }
      swift_release();

      swift_release();
      return 0;
    }
    uint64_t v54 = v53;
    objc_msgSend(v53, sel_setMetricValue_, v51);
    v147[0] = (uint64_t)v54;
    id v39 = v54;
    swift_setAtWritableKeyPath();

    swift_release();
    if (v26) {
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v48 = v42 + 1;
    if (__OFADD__(v42, 1))
    {
      __break(1u);
      goto LABEL_70;
    }
    if (v48 >= v1)
    {
LABEL_49:
      swift_release();
      id v67 = v160;
      uint64_t v68 = (uint64_t)v129;
      sub_259EFE630();
      uint64_t v69 = v136;
      uint64_t v70 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v136 + 48);
      uint64_t v71 = v133;
      if (v70(v68, 1, v133) == 1)
      {
        sub_259ED1170(v68, &qword_26A3F8A00);
        id v72 = 0;
      }
      else
      {
        uint64_t v73 = v126;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v126, v68, v71);
        id v74 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        os_log_type_t v75 = (void *)sub_259EFE650();
        id v72 = objc_msgSend(v74, sel_initWithNSUUID_, v75);

        uint64_t v69 = v136;
        (*(void (**)(char *, uint64_t))(v136 + 8))(v73, v71);
      }
      objc_msgSend(v67, sel_setClientRequestId_, v72);

      id v76 = v160;
      uint64_t v77 = (uint64_t)v130;
      sub_259EFE630();
      if (v70(v77, 1, v71) == 1)
      {
        sub_259ED1170(v77, &qword_26A3F8A00);
        id v78 = 0;
      }
      else
      {
        id v79 = v127;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v127, v77, v71);
        id v80 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        id v81 = (void *)sub_259EFE650();
        id v78 = objc_msgSend(v80, sel_initWithNSUUID_, v81);

        uint64_t v69 = v136;
        (*(void (**)(char *, uint64_t))(v136 + 8))(v79, v71);
      }
      objc_msgSend(v76, sel_setRawSessionId_, v78);

      id v82 = v160;
      uint64_t v83 = (uint64_t)v131;
      sub_259EFE630();
      if (v70(v83, 1, v71) == 1)
      {
        sub_259ED1170(v83, &qword_26A3F8A00);
        id v84 = 0;
      }
      else
      {
        uint64_t v85 = v128;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v128, v83, v71);
        id v86 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
        uint64_t v87 = v69;
        uint64_t v88 = (void *)sub_259EFE650();
        id v84 = objc_msgSend(v86, sel_initWithNSUUID_, v88);

        (*(void (**)(char *, uint64_t))(v87 + 8))(v85, v71);
      }
      int v60 = v122;
      uint64_t v90 = v124;
      uint64_t v89 = (uint64_t)v125;
      objc_msgSend(v82, sel_setClientSessionId_, v84);

      id v91 = v160;
      int v92 = v143;
      if (v143)
      {
        id v93 = v160;
        int v92 = sub_259EED1A4();
      }
      else
      {
        id v94 = v160;
      }
      objc_msgSend(v91, sel_setFailureInfo_, v92);

      id v95 = v91;
      uint64_t v96 = (void *)sub_259EFED40();
      objc_msgSend(v95, sel_setToolIds_, v96);

      id v97 = v95;
      uint64_t v98 = (void *)sub_259EFED40();
      objc_msgSend(v97, sel_setBundleIds_, v98);

      uint64_t v99 = v132;
      sub_259EFE660();
      id v100 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v101 = (void *)sub_259EFE650();
      id v102 = objc_msgSend(v100, sel_initWithNSUUID_, v101);

      (*(void (**)(char *, uint64_t))(v136 + 8))(v99, v71);
      id v103 = v123;
      objc_msgSend(v123, sel_setPnrodId_, v102);

      objc_msgSend(v60, sel_setEventMetadata_, v103);
      objc_msgSend(v60, sel_setPnrodIntelligenceFlowRequestGrainSummary_, v160);
      if (qword_26A3F87B0 != -1) {
        swift_once();
      }
      uint64_t v104 = __swift_project_value_buffer(v89, (uint64_t)qword_26A3F8B00);
      int64_t v105 = v134;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v134, v104, v89);
      id v106 = v60;
      uint64_t v107 = sub_259EFEBF0();
      uint64_t v108 = v89;
      os_log_type_t v109 = sub_259EFEDC0();
      if (os_log_type_enabled(v107, v109))
      {
        uint64_t v110 = swift_slowAlloc();
        uint64_t v111 = swift_slowAlloc();
        v147[0] = v111;
        *(_DWORD *)uint64_t v110 = 136315394;
        id v112 = objc_msgSend(v106, sel_qualifiedMessageName);
        uint64_t v113 = sub_259EFEC90();
        unint64_t v115 = v114;

        uint64_t v146 = sub_259ED2D5C(v113, v115, v147);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        *(_WORD *)(v110 + 12) = 2080;
        id v116 = objc_msgSend(v106, sel_formattedJsonBody);
        if (v116)
        {
          unint64_t v117 = v116;
          uint64_t v118 = sub_259EFEC90();
          unint64_t v120 = v119;
        }
        else
        {
          unint64_t v120 = 0xE500000000000000;
          uint64_t v118 = 0x3E4C494E3CLL;
        }
        uint64_t v146 = sub_259ED2D5C(v118, v120, v147);
        sub_259EFEE10();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v107, v109, "Creating %s\n%s", (uint8_t *)v110, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v111, -1, -1);
        MEMORY[0x25A2EF270](v110, -1, -1);

        (*(void (**)(char *, uint64_t *))(v124 + 8))(v134, v125);
        return (uint64_t)v122;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v90 + 8))(v105, v108);
      }
      return (uint64_t)v60;
    }
    unint64_t v49 = *(void *)(v43 + 8 * v48);
    ++v42;
    if (!v49)
    {
      uint64_t v42 = v48 + 1;
      if (v48 + 1 >= v1) {
        goto LABEL_49;
      }
      unint64_t v49 = *(void *)(v43 + 8 * v42);
      if (!v49)
      {
        uint64_t v42 = v48 + 2;
        if (v48 + 2 >= v1) {
          goto LABEL_49;
        }
        unint64_t v49 = *(void *)(v43 + 8 * v42);
        if (!v49) {
          break;
        }
      }
    }
LABEL_29:
    unint64_t v26 = (v49 - 1) & v49;
  }
  uint64_t v50 = v48 + 3;
  if (v50 >= v1) {
    goto LABEL_49;
  }
  unint64_t v49 = *(void *)(v43 + 8 * v50);
  if (v49)
  {
    uint64_t v42 = v50;
    goto LABEL_29;
  }
  while (1)
  {
    uint64_t v42 = v50 + 1;
    if (__OFADD__(v50, 1)) {
      break;
    }
    if (v42 >= v1) {
      goto LABEL_49;
    }
    unint64_t v49 = *(void *)(v43 + 8 * v42);
    ++v50;
    if (v49) {
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_72:
  swift_once();
LABEL_38:
  __swift_project_value_buffer((uint64_t)v39, (uint64_t)qword_26A3F8B00);
  uint64_t v55 = sub_259EFEBF0();
  os_log_type_t v58 = sub_259EFEDC0();
  if (os_log_type_enabled(v55, v58))
  {
    char v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v59 = 0;
    _os_log_impl(&dword_259EC8000, v55, v58, "PNRODSchemaPNRODClientEventMetadata init failed!", v59, 2u);
    MEMORY[0x25A2EF270](v59, -1, -1);
  }

LABEL_41:
  return 0;
}

uint64_t destroy for IERequestGrainMetricsRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for IERequestGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  long long v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  long long v8 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v8;
  uint64_t v9 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v9;
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  uint64_t v10 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v10;
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  uint64_t v11 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v11;
  uint64_t v12 = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 216) = v12;
  uint64_t v13 = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 232) = v13;
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IERequestGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 168) = v4;
  uint64_t v5 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v5;
  uint64_t v6 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v6;
  uint64_t v7 = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 216) = v7;
  uint64_t v8 = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 232) = v8;
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy256_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  long long v8 = a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  __n128 result = (__n128)a2[12];
  long long v12 = a2[13];
  long long v13 = a2[15];
  *(_OWORD *)(a1 + 224) = a2[14];
  *(_OWORD *)(a1 + 240) = v13;
  *(__n128 *)(a1 + 192) = result;
  *(_OWORD *)(a1 + 208) = v12;
  return result;
}

uint64_t assignWithTake for IERequestGrainMetricsRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  long long v9 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  uint64_t v10 = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 232) = v10;
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IERequestGrainMetricsRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 256)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IERequestGrainMetricsRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 248) = 0;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 256) = 1;
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
    *(unsigned char *)(result + 256) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IERequestGrainMetricsRecord()
{
  return &type metadata for IERequestGrainMetricsRecord;
}

char *keypath_get_selector_planningTime()
{
  return sel_planningTime;
}

id sub_259EE81A8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_planningTime);
  *a2 = result;
  return result;
}

id sub_259EE81E4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlanningTime_, *a1);
}

id sub_259EE81F8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_executionTime);
  *a2 = result;
  return result;
}

id sub_259EE8234(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExecutionTime_, *a1);
}

char *keypath_get_selector_requestResponseTime()
{
  return sel_requestResponseTime;
}

id sub_259EE8254@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_requestResponseTime);
  *a2 = result;
  return result;
}

id sub_259EE8290(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRequestResponseTime_, *a1);
}

char *keypath_get_selector_responsePreparationTime()
{
  return sel_responsePreparationTime;
}

id sub_259EE82B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_responsePreparationTime);
  *a2 = result;
  return result;
}

id sub_259EE82EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResponsePreparationTime_, *a1);
}

uint64_t static IEReliabilityCalculator.updatePlannerFailureSubtype(of:for:using:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = a1;
  if (!a1 || *(unsigned char *)(a1 + 16) != 3) {
    return swift_retain();
  }
  uint64_t v7 = a2 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a2 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  swift_retain();
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  uint64_t v68 = (void *)MEMORY[0x263F8EE78];
  unint64_t v66 = v4;
  while (1)
  {
    while (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      if (*(void *)(a3 + 16)) {
        goto LABEL_23;
      }
    }
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_75;
    }
    if (v15 >= v11) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v11) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v11) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v7 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
    if (*(void *)(a3 + 16))
    {
LABEL_23:
      uint64_t v3 = *(void *)(*(void *)(a2 + 48) + 8 * v14);
      sub_259EE9C0C(v3);
      if (v18)
      {
        unint64_t v19 = sub_259EE9C0C(v3);
        if (v20)
        {
          unint64_t v21 = v4;
          unint64_t v4 = *(void *)(*(void *)(a3 + 56) + 8 * v19);
          *(unsigned char *)(v21 + 17) = *(unsigned char *)(v4 + 17);
          uint64_t v77 = v3;
          unint64_t v78 = v4;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BE0);
          unint64_t v22 = (void *)sub_259EFEF10();
          uint64_t v23 = v3;
          uint64_t v3 = v4;
          unint64_t v24 = sub_259EE9C0C(v23);
          if (v25) {
            goto LABEL_78;
          }
          v22[(v24 >> 6) + 8] |= 1 << v24;
          uint64_t v26 = 8 * v24;
          *(void *)(v22[6] + v26) = v23;
          *(void *)(v22[7] + v26) = v4;
          uint64_t v27 = v22[2];
          BOOL v28 = __OFADD__(v27, 1);
          uint64_t v29 = v27 + 1;
          if (v28) {
            goto LABEL_79;
          }
          v22[2] = v29;
          swift_retain_n();
          swift_retain();
          swift_retain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BE8);
          swift_arrayDestroy();
          swift_release();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v68 = sub_259EE98B4(0, v68[2] + 1, 1, v68);
          }
          unint64_t v31 = v68[2];
          unint64_t v30 = v68[3];
          uint64_t v3 = v31 + 1;
          if (v31 >= v30 >> 1) {
            uint64_t v68 = sub_259EE98B4((void *)(v30 > 1), v31 + 1, 1, v68);
          }
          v68[2] = v3;
          v68[v31 + 4] = v22;
          swift_release();
          unint64_t v4 = v66;
        }
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v11) {
    goto LABEL_32;
  }
  unint64_t v16 = *(void *)(v7 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_77;
    }
    if (v12 >= v11) {
      break;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_32:
  swift_release();
  unint64_t v32 = v68[2];
  if (v32 < 2)
  {
    swift_release();
    swift_bridgeObjectRelease();
    return swift_retain();
  }
  uint64_t v76 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_259EE9E9C(0, v32, 0);
  uint64_t v33 = 0;
  uint64_t v34 = v76;
  unint64_t v67 = v32;
  while (1)
  {
    if (v33 == v32) {
      goto LABEL_76;
    }
    uint64_t v69 = v33;
    uint64_t v35 = v68[v33 + 4];
    int64_t v36 = *(void *)(v35 + 16);
    if (v36) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_59:
    v74[0] = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BA0);
    unint64_t v4 = sub_259EECAF8();
    uint64_t v3 = sub_259EFEC50();
    uint64_t v55 = v54;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v76 = v34;
    unint64_t v57 = *(void *)(v34 + 16);
    unint64_t v56 = *(void *)(v34 + 24);
    if (v57 >= v56 >> 1)
    {
      sub_259EE9E9C(v56 > 1, v57 + 1, 1);
      uint64_t v34 = v76;
    }
    uint64_t v33 = v69 + 1;
    *(void *)(v34 + 16) = v57 + 1;
    uint64_t v58 = v34 + 16 * v57;
    *(void *)(v58 + 32) = v3;
    *(void *)(v58 + 40) = v55;
    if (v69 + 1 == v32)
    {
      swift_bridgeObjectRelease_n();
      v74[0] = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BA0);
      uint64_t v3 = sub_259EFEC50();
      unint64_t v4 = v60;
      swift_bridgeObjectRelease();
      if (qword_26A3F87C8 != -1) {
        goto LABEL_80;
      }
      goto LABEL_66;
    }
  }
  uint64_t v75 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_259EE9E9C(0, v36, 0);
  uint64_t v37 = v75;
  uint64_t v3 = sub_259EEA028(v35);
  unint64_t v4 = v38;
  uint64_t v39 = 0;
  uint64_t v40 = v35 + 64;
  char v41 = *(unsigned char *)(v35 + 32);
  int64_t v70 = v36;
  unint64_t v71 = v38;
  uint64_t v72 = v35 + 64;
  while (2)
  {
    if ((v3 & 0x8000000000000000) == 0 && v3 < 1 << v41)
    {
      unint64_t v45 = (unint64_t)v3 >> 6;
      if ((*(void *)(v40 + 8 * ((unint64_t)v3 >> 6)) & (1 << v3)) == 0) {
        goto LABEL_70;
      }
      if (*(_DWORD *)(v35 + 36) != v4) {
        goto LABEL_71;
      }
      v74[0] = 0x203A64496E617053;
      v74[1] = 0xE800000000000000;
      uint64_t v73 = v39;
      swift_retain();
      sub_259EFEF40();
      sub_259EFECF0();
      swift_bridgeObjectRelease();
      sub_259EFECF0();
      sub_259EEE840();
      sub_259EFECF0();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v75 = v37;
      unint64_t v47 = *(void *)(v37 + 16);
      unint64_t v46 = *(void *)(v37 + 24);
      if (v47 >= v46 >> 1)
      {
        sub_259EE9E9C(v46 > 1, v47 + 1, 1);
        uint64_t v37 = v75;
      }
      *(void *)(v37 + 16) = v47 + 1;
      uint64_t v48 = v37 + 16 * v47;
      *(void *)(v48 + 32) = 0x203A64496E617053;
      *(void *)(v48 + 40) = 0xE800000000000000;
      char v41 = *(unsigned char *)(v35 + 32);
      unint64_t v42 = 1 << v41;
      if (v3 >= 1 << v41) {
        goto LABEL_72;
      }
      uint64_t v40 = v35 + 64;
      uint64_t v49 = *(void *)(v72 + 8 * v45);
      if ((v49 & (1 << v3)) == 0) {
        goto LABEL_73;
      }
      if (*(_DWORD *)(v35 + 36) != v4) {
        goto LABEL_74;
      }
      unint64_t v50 = v49 & (-2 << (v3 & 0x3F));
      if (v50)
      {
        unint64_t v42 = __clz(__rbit64(v50)) | v3 & 0xFFFFFFFFFFFFFFC0;
        int64_t v43 = v70;
        uint64_t v44 = v73;
      }
      else
      {
        unint64_t v51 = v45 + 1;
        unint64_t v52 = (v42 + 63) >> 6;
        int64_t v43 = v70;
        uint64_t v44 = v73;
        if (v45 + 1 < v52)
        {
          unint64_t v53 = *(void *)(v72 + 8 * v51);
          if (v53) {
            goto LABEL_51;
          }
          unint64_t v51 = v45 + 2;
          if (v45 + 2 < v52)
          {
            unint64_t v53 = *(void *)(v72 + 8 * v51);
            if (v53)
            {
LABEL_51:
              unint64_t v42 = __clz(__rbit64(v53)) + (v51 << 6);
            }
            else
            {
              while (v52 - 3 != v45)
              {
                unint64_t v53 = *(void *)(v35 + 88 + 8 * v45++);
                if (v53)
                {
                  unint64_t v51 = v45 + 2;
                  goto LABEL_51;
                }
              }
            }
          }
        }
      }
      uint64_t v39 = v44 + 1;
      unint64_t v4 = v71;
      uint64_t v3 = v42;
      if (v39 == v43)
      {
        unint64_t v32 = v67;
        goto LABEL_59;
      }
      continue;
    }
    break;
  }
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
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  swift_once();
LABEL_66:
  uint64_t v61 = sub_259EFEC00();
  __swift_project_value_buffer(v61, (uint64_t)qword_26A3F8B48);
  swift_bridgeObjectRetain();
  int v62 = sub_259EFEBF0();
  os_log_type_t v63 = sub_259EFEDC0();
  if (os_log_type_enabled(v62, v63))
  {
    BOOL v64 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    v74[0] = v65;
    *(_DWORD *)BOOL v64 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_259ED2D5C(v3, v4, v74);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v62, v63, "In updatePlannerFailureSubtype - Found multiple spans with failures, which is unexpected.\n    %s", v64, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v65, -1, -1);
    MEMORY[0x25A2EF270](v64, -1, -1);

    swift_release();
  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease_n();
  }
  return swift_retain();
}

uint64_t static IEReliabilityCalculator.getPlannerFailureInfo(from:iferror:)(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = a2;
  uint64_t v3 = sub_259EFEC00();
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8BF8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259EFEBE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int64_t v15 = (char *)&v44 - v14;
  uint64_t v16 = sub_259EFEBB0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v20 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v47 = a1;
  v20(v19, a1, v16);
  int v21 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (v21 == *MEMORY[0x263F4E930])
  {
    int v45 = 14;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E920])
  {
    int v45 = 15;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E918])
  {
    int v45 = 16;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E968])
  {
    int v45 = 17;
    int v46 = 8;
  }
  else if (v21 == *MEMORY[0x263F4E980])
  {
    int v45 = 18;
    int v46 = 8;
  }
  else if (v21 == *MEMORY[0x263F4E950])
  {
    int v45 = 19;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E960])
  {
    int v45 = 20;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E928])
  {
    int v45 = 21;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E938])
  {
    int v45 = 22;
    int v46 = 9;
  }
  else if (v21 == *MEMORY[0x263F4E9F8])
  {
    int v45 = 33;
    int v46 = 12;
  }
  else if (v21 == *MEMORY[0x263F4EA00])
  {
    int v45 = 34;
    int v46 = 12;
  }
  else if (v21 == *MEMORY[0x263F4EA30])
  {
    int v45 = 35;
    int v46 = 12;
  }
  else if (v21 == *MEMORY[0x263F4E940])
  {
    int v45 = 23;
    int v46 = 10;
  }
  else if (v21 == *MEMORY[0x263F4E958])
  {
    int v45 = 24;
    int v46 = 10;
  }
  else if (v21 == *MEMORY[0x263F4E998])
  {
    int v45 = 25;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4E9A0])
  {
    int v45 = 26;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4EA08])
  {
    int v45 = 27;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4E9B0])
  {
    int v45 = 28;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4E9F0])
  {
    int v45 = 29;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4E9E8])
  {
    int v45 = 30;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4EA18])
  {
    int v45 = 31;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4E9D0])
  {
    int v45 = 32;
    int v46 = 11;
  }
  else if (v21 == *MEMORY[0x263F4E978])
  {
    int v45 = 36;
    int v46 = 13;
  }
  else if (v21 == *MEMORY[0x263F4E990])
  {
    int v45 = 37;
    int v46 = 13;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    int v45 = 62;
    int v46 = 62;
  }
  uint64_t v56 = 0;
  sub_259EED0EC(v48, (uint64_t)v8, &qword_26A3F8BF8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_259ED1170((uint64_t)v8, &qword_26A3F8BF8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    type metadata accessor for PNRError();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 24) = 0;
    *(void *)(v22 + 32) = 0;
    *(void *)(v22 + 16) = 0;
    *(unsigned char *)(v22 + 40) = 1;
    uint64_t v23 = v22 + OBJC_IVAR____TtC20PnROnDeviceFramework8PNRError_transcriptIFError;
    uint64_t v24 = sub_259EFEA70();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
    *(void *)(v22 + 16) = sub_259EFEBC0();
    *(void *)(v22 + 24) = v25;
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_259EFEBD0();
    if (v27)
    {
      uint64_t v29 = *(void (**)(char *, uint64_t))(v10 + 8);
      v29(v13, v9);
    }
    else
    {
      uint64_t v28 = v26;
      uint64_t v29 = *(void (**)(char *, uint64_t))(v10 + 8);
      v29(v13, v9);
      *(void *)(v22 + 32) = v28;
      *(unsigned char *)(v22 + 40) = 0;
    }
    v29(v15, v9);
    swift_release();
    uint64_t v56 = v22;
  }
  uint64_t v31 = v49;
  uint64_t v30 = v50;
  if (qword_26A3F87C8 != -1) {
    swift_once();
  }
  uint64_t v32 = __swift_project_value_buffer(v30, (uint64_t)qword_26A3F8B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v5, v32, v30);
  uint64_t v33 = v56;
  swift_retain_n();
  uint64_t v34 = sub_259EFEBF0();
  os_log_type_t v35 = sub_259EFEDC0();
  if (!os_log_type_enabled(v34, v35))
  {

    swift_release_n();
    goto LABEL_62;
  }
  int64_t v36 = (uint8_t *)swift_slowAlloc();
  uint64_t result = swift_slowAlloc();
  uint64_t v52 = result;
  *(_DWORD *)int64_t v36 = 136315138;
  if (v33)
  {
    uint64_t v38 = result;
    uint64_t v39 = sub_259ED3A54();
    uint64_t v51 = sub_259ED2D5C(v39, v40, &v52);
    sub_259EFEE10();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259EC8000, v34, v35, "Processing PlannerFailure %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v38, -1, -1);
    MEMORY[0x25A2EF270](v36, -1, -1);

LABEL_62:
    (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v30);
    uint64_t v52 = 0;
    unint64_t v53 = 0xE000000000000000;
    sub_259EFEE80();
    swift_bridgeObjectRelease();
    uint64_t v52 = 0xD000000000000013;
    unint64_t v53 = 0x8000000259F03160;
    sub_259EFEBA0();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
    uint64_t v41 = v52;
    uint64_t v42 = v53;
    LOBYTE(v51) = 3;
    char v55 = v46;
    char v54 = v45;
    swift_beginAccess();
    uint64_t v43 = v56;
    type metadata accessor for IEFailureInfo();
    swift_allocObject();
    return sub_259EED164(&v51, &v55, &v54, v43, v41, v42);
  }
  __break(1u);
  return result;
}

void *sub_259EE9564(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C00);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259EECB64(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259EE9674(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C50);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 200);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[25 * v8 + 4]) {
          memmove(v12, a4 + 4, 200 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_259EECC58(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259EE97A4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C40);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 223;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 8);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259EECD4C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259EE98B4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C10);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_259EECE40(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259EE99C4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C08);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 416);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[52 * v8 + 4]) {
          memmove(v12, a4 + 4, 416 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_259EECF4C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_259EE9AF0(uint64_t a1, uint64_t a2)
{
  sub_259EFEFE0();
  sub_259EFECE0();
  uint64_t v4 = sub_259EFF010();
  return sub_259EE9C50(a1, a2, v4);
}

unint64_t sub_259EE9B68(uint64_t a1)
{
  return sub_259EE9B80(a1, &qword_26A3F8C48);
}

unint64_t sub_259EE9B74(uint64_t a1)
{
  return sub_259EE9B80(a1, &qword_26A3F8C38);
}

unint64_t sub_259EE9B80(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v4 = sub_259EFEC40();
  return sub_259EE9D34(a1, v4, a2);
}

unint64_t sub_259EE9C00(uint64_t a1)
{
  return sub_259EE9B80(a1, &qword_26A3F8C58);
}

unint64_t sub_259EE9C0C(uint64_t a1)
{
  uint64_t v2 = sub_259EFEFD0();
  return sub_259EE9E00(a1, v2);
}

unint64_t sub_259EE9C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_259EFEF50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_259EFEF50() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_259EE9D34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = ~v4;
    __swift_instantiateConcreteTypeFromMangledName(a3);
    do
    {
      if (sub_259EFEC70()) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v6;
    }
    while (((*(void *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_259EE9E00(uint64_t a1, uint64_t a2)
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

uint64_t sub_259EE9E9C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_259EE9EBC(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_259EE9EBC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C00);
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
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t sub_259EEA028(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_259EEA0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    BOOL v6 = v5 == 0xD000000000000017;
    if (v4 == 0x8000000259F031C0 && v5 == 0xD000000000000017)
    {
LABEL_9:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((*(unsigned char *)(a1 + 40) & 1) == 0)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9 == 1005)
        {
          LOBYTE(v19) = 6;
          LOBYTE(v17) = 43;
          char v10 = 61;
          goto LABEL_20;
        }
        if (v9 == 1004)
        {
          LOBYTE(v19) = 6;
          LOBYTE(v17) = 43;
          char v10 = 60;
          goto LABEL_20;
        }
      }
      LOBYTE(v19) = 6;
      char v11 = 43;
      goto LABEL_18;
    }
    unint64_t v8 = *(void *)(a1 + 24);
  }
  else
  {
    BOOL v6 = 0;
    uint64_t v5 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  if (sub_259EFEF50()) {
    goto LABEL_9;
  }
  if (v8 == 0x8000000259F031E0 && v5 == 0xD000000000000014 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 44;
LABEL_18:
    LOBYTE(v17) = v11;
LABEL_19:
    char v10 = 62;
    goto LABEL_20;
  }
  if (v8 == 0x8000000259F03200 && v5 == 0xD000000000000022 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 45;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03230 && v5 == 0xD000000000000019 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 46;
    goto LABEL_18;
  }
  uint64_t v19 = v5;
  unint64_t v20 = v8;
  unint64_t v17 = 0xD000000000000011;
  unint64_t v18 = 0x8000000259F03250;
  sub_259EED040();
  swift_bridgeObjectRetain();
  if (sub_259EFEE30())
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 47;
    goto LABEL_18;
  }
  uint64_t v19 = v5;
  unint64_t v20 = v8;
  unint64_t v17 = 0xD000000000000016;
  unint64_t v18 = 0x8000000259F03270;
  if (sub_259EFEE30())
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    LOBYTE(v17) = 48;
    goto LABEL_19;
  }
  uint64_t v19 = v5;
  unint64_t v20 = v8;
  unint64_t v17 = 0xD00000000000002CLL;
  unint64_t v18 = 0x8000000259F03290;
  if (sub_259EFEE30())
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 49;
    goto LABEL_18;
  }
  uint64_t v19 = v5;
  unint64_t v20 = v8;
  unint64_t v17 = 0xD000000000000027;
  unint64_t v18 = 0x8000000259F032C0;
  if (sub_259EFEE30())
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 50;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F032F0 && v5 == 0xD000000000000013 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 51;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03310 && v5 == 0xD000000000000018 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 52;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03330 && v5 == 0xD000000000000026 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 53;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03360 && v5 == 0xD000000000000015 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 54;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03380 && v5 == 0xD000000000000024
    || (sub_259EFEF50() & 1) != 0
    || v8 == 0x8000000259F033B0 && v5 == 0xD000000000000026
    || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 56;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F033E0 && v5 == 0xD00000000000001DLL
    || (sub_259EFEF50() & 1) != 0
    || v8 == 0x8000000259F03400 && v5 == 0xD00000000000001FLL
    || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 57;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03420 && v5 == 0xD000000000000022 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 55;
    goto LABEL_18;
  }
  char v13 = !v6;
  if (v8 != 0x8000000259F03450) {
    char v13 = 1;
  }
  if (v13 & 1) == 0 || (sub_259EFEF50())
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 58;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F03470 && v5 == 0xD000000000000022 || (sub_259EFEF50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 6;
    char v11 = 59;
    goto LABEL_18;
  }
  if (v8 == 0x8000000259F034A0 && v5 == 0xD000000000000024
    || (sub_259EFEF50() & 1) != 0
    || v8 == 0x8000000259F034D0 && v5 == 0xD000000000000030
    || (sub_259EFEF50() & 1) != 0
    || v8 == 0x8000000259F03510 && v5 == 0xD000000000000015
    || (sub_259EFEF50() & 1) != 0
    || (v19 = v5, v20 = v8, unint64_t v17 = 0xD000000000000010, v18 = 0x8000000259F03530, (sub_259EFEE30() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    LOBYTE(v19) = 4;
    char v10 = 62;
    LOBYTE(v17) = 62;
  }
  else
  {
    if (v8 == 0x8000000259F03550 && v5 == 0xD000000000000015
      || (sub_259EFEF50() & 1) != 0
      || v8 == 0x8000000259F03570 && v5 == 0xD000000000000012
      || (sub_259EFEF50() & 1) != 0
      || v8 == 0x8000000259F03590 && v5 == 0xD000000000000012)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = sub_259EFEF50();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        swift_retain();
        return a2;
      }
    }
    char v10 = 41;
    if ((*(unsigned char *)(a1 + 40) & 1) == 0)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14 == 4099) {
        char v10 = 61;
      }
      else {
        char v10 = 41;
      }
      if (v14 == 4097) {
        char v10 = 60;
      }
    }
    LOBYTE(v19) = 5;
    LOBYTE(v17) = 38;
  }
LABEL_20:
  char v16 = v10;
  type metadata accessor for IEFailureInfo();
  swift_allocObject();
  swift_retain();
  return sub_259EED164(&v19, (char *)&v17, &v16, a1, 0, 0);
}

uint64_t _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor30TranscriptProtoStatementResultV_tFZ_0()
{
  uint64_t v0 = sub_259EFEAF0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v77 = v0;
  uint64_t v78 = v1;
  MEMORY[0x270FA5388](v0);
  uint64_t v75 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C70);
  MEMORY[0x270FA5388](v3 - 8);
  id v80 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C78);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v76 = (uint64_t)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v79 = (char *)&v68 - v8;
  uint64_t v9 = sub_259EFE960();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v81 = v9;
  uint64_t v82 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v87 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C80);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v83 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_259EFEA40();
  uint64_t v84 = *(void *)(v86 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v86);
  char v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v68 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C88);
  MEMORY[0x270FA5388](v19 - 8);
  int v21 = (char *)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_259EFEA10();
  uint64_t v85 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C90);
  MEMORY[0x270FA5388](v25 - 8);
  char v27 = (char *)&v68 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_259EFEA90();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v68 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259EFE9D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
    uint64_t v32 = &qword_26A3F8C90;
    uint64_t v33 = (uint64_t)v27;
LABEL_14:
    sub_259ED1170(v33, v32);
    return 0;
  }
  uint64_t v72 = v16;
  uint64_t v73 = v18;
  id v74 = v24;
  uint64_t v34 = v86;
  os_log_type_t v35 = v87;
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v31, v27, v28);
  sub_259EFEA80();
  uint64_t v36 = v85;
  uint64_t v37 = v28;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(v21, 1, v22) == 1)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
    uint64_t v32 = &qword_26A3F8C88;
    uint64_t v33 = (uint64_t)v21;
    goto LABEL_14;
  }
  int64_t v70 = v31;
  uint64_t v71 = v29;
  uint64_t v38 = v74;
  (*(void (**)(void))(v36 + 32))();
  uint64_t v39 = v83;
  sub_259EFEA00();
  uint64_t v40 = v84;
  uint64_t v41 = v34;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(v39, 1, v34) == 1)
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v22);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v37);
    uint64_t v32 = &qword_26A3F8C80;
    uint64_t v33 = (uint64_t)v39;
    goto LABEL_14;
  }
  uint64_t v42 = v73;
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v73, v39, v41);
  uint64_t v43 = v72;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v72, v42, v41);
  if ((*(unsigned int (**)(char *, uint64_t))(v40 + 88))(v43, v41) == *MEMORY[0x263F51760])
  {
    uint64_t v69 = v37;
    uint64_t v83 = (char *)v22;
    (*(void (**)(char *, uint64_t))(v40 + 96))(v43, v41);
    uint64_t v45 = v81;
    uint64_t v44 = v82;
    int v46 = v43;
    uint64_t v47 = v35;
    (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v35, v46, v81);
    uint64_t v48 = (uint64_t)v80;
    sub_259EFE950();
    uint64_t v49 = sub_259EFE720();
    uint64_t v50 = *(void *)(v49 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49) == 1)
    {
      sub_259ED1170(v48, &qword_26A3F8C70);
      uint64_t v51 = sub_259EFE730();
      uint64_t v52 = (uint64_t)v79;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v79, 1, 1, v51);
    }
    else
    {
      uint64_t v52 = (uint64_t)v79;
      sub_259EFE710();
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v48, v49);
      uint64_t v54 = sub_259EFE730();
      uint64_t v55 = *(void *)(v54 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v52, 1, v54) != 1)
      {
        uint64_t v58 = v76;
        sub_259EED0EC(v52, v76, &qword_26A3F8C78);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v55 + 88))(v58, v54) == *MEMORY[0x263F51638])
        {
          (*(void (**)(uint64_t, uint64_t))(v55 + 96))(v58, v54);
          char v59 = v75;
          (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v75, v58, v77);
          uint64_t v60 = sub_259EFEAE0();
          id v80 = v61;
          uint64_t v62 = sub_259EFEAD0();
          type metadata accessor for PNRError();
          uint64_t v63 = swift_allocObject();
          *(void *)(v63 + 24) = 0;
          *(void *)(v63 + 32) = 0;
          *(void *)(v63 + 16) = 0;
          *(unsigned char *)(v63 + 40) = 1;
          uint64_t v64 = v63 + OBJC_IVAR____TtC20PnROnDeviceFramework8PNRError_transcriptIFError;
          uint64_t v65 = sub_259EFEA70();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v64, 1, 1, v65);
          unint64_t v66 = v80;
          *(void *)(v63 + 16) = v60;
          *(void *)(v63 + 24) = v66;
          swift_bridgeObjectRelease();
          *(void *)(v63 + 32) = v62;
          *(unsigned char *)(v63 + 40) = 0;
          v90[0] = 5;
          char v89 = 38;
          char v88 = 42;
          type metadata accessor for IEFailureInfo();
          swift_allocObject();
          swift_retain();
          uint64_t v67 = sub_259EED164(v90, &v89, &v88, v63, 0, 0);
          uint64_t v56 = sub_259EEA0B0(v63, v67);
          swift_release();
          swift_release();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v59, v77);
          (*(void (**)(char *, uint64_t))(v44 + 8))(v87, v45);
          (*(void (**)(char *, uint64_t))(v84 + 8))(v73, v41);
          (*(void (**)(char *, char *))(v36 + 8))(v74, v83);
          (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v69);
          sub_259ED1170(v52, &qword_26A3F8C78);
          return v56;
        }
        (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v45);
        (*(void (**)(char *, uint64_t))(v84 + 8))(v73, v41);
        (*(void (**)(char *, char *))(v36 + 8))(v74, v83);
        (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v69);
        (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v58, v54);
        goto LABEL_13;
      }
    }
    (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v45);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v73, v41);
    (*(void (**)(char *, char *))(v36 + 8))(v74, v83);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v69);
LABEL_13:
    uint64_t v32 = &qword_26A3F8C78;
    uint64_t v33 = v52;
    goto LABEL_14;
  }
  unint64_t v53 = *(void (**)(char *, uint64_t))(v40 + 8);
  v53(v42, v41);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v22);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v37);
  v53(v43, v41);
  return 0;
}

uint64_t _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor38TranscriptProtoSessionCoordinatorErrorV_tFZ_0()
{
  uint64_t v0 = sub_259EFEA70();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)v29 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v29 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C30);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v29 - v14;
  sub_259EFEAA0();
  uint64_t v16 = sub_259EFEAC0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
  {
    sub_259EED0EC((uint64_t)v15, (uint64_t)v13, &qword_26A3F8C30);
    int v19 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v13, v16);
    if (v19 == *MEMORY[0x263F51778])
    {
      (*(void (**)(char *, uint64_t))(v17 + 96))(v13, v16);
      (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v4, v13, v0);
      (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v9, v4, v0);
      type metadata accessor for PNRError();
      swift_allocObject();
      uint64_t v18 = sub_259ED38CC((uint64_t)v9);
      uint64_t v20 = qword_26A3F87C8;
      swift_retain();
      if (v20 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_259EFEC00();
      __swift_project_value_buffer(v21, (uint64_t)qword_26A3F8B48);
      swift_retain();
      uint64_t v22 = sub_259EFEBF0();
      os_log_type_t v23 = sub_259EFEDC0();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        uint64_t v32 = v30;
        *(_DWORD *)uint64_t v24 = 136315138;
        v29[1] = v24 + 4;
        uint64_t v25 = sub_259ED3A54();
        uint64_t v31 = sub_259ED2D5C(v25, v26, &v32);
        sub_259EFEE10();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v22, v23, "Processing TranscriptProtoSessionCoordinatorError.other %s", v24, 0xCu);
        uint64_t v27 = v30;
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v27, -1, -1);
        MEMORY[0x25A2EF270](v24, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    }
    else if (v19 == *MEMORY[0x263F51768] || v19 == *MEMORY[0x263F51770])
    {
      (*(void (**)(char *, uint64_t))(v17 + 96))(v13, v16);
      (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v9, v13, v0);
      (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v7, v9, v0);
      type metadata accessor for PNRError();
      swift_allocObject();
      uint64_t v18 = sub_259ED38CC((uint64_t)v7);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v16);
      uint64_t v18 = 0;
    }
  }
  sub_259ED1170((uint64_t)v15, &qword_26A3F8C30);
  LOBYTE(v32) = 2;
  LOBYTE(v31) = 62;
  char v33 = 62;
  type metadata accessor for IEFailureInfo();
  swift_allocObject();
  return sub_259EED164(&v32, (char *)&v31, &v33, v18, 0, 0);
}

uint64_t _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor28TranscriptProtoExecutorErrorV_tFZ_0()
{
  uint64_t v0 = sub_259EFEA70();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v29 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C20);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v29 - v11;
  sub_259EFE970();
  uint64_t v13 = sub_259EFEA20();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    goto LABEL_12;
  }
  sub_259EED0EC((uint64_t)v12, (uint64_t)v10, &qword_26A3F8C20);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v10, v13);
  if (v15 != *MEMORY[0x263F51750])
  {
    if (v15 == *MEMORY[0x263F51748])
    {
      LOBYTE(v32) = 4;
      LOBYTE(v31) = 62;
      char v33 = 62;
      type metadata accessor for PNRError();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 24) = 0;
      *(void *)(v24 + 32) = 0;
      *(void *)(v24 + 16) = 0;
      *(unsigned char *)(v24 + 40) = 1;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v24 + OBJC_IVAR____TtC20PnROnDeviceFramework8PNRError_transcriptIFError, 1, 1, v0);
      *(_OWORD *)(v24 + 16) = xmmword_259F01110;
      swift_bridgeObjectRelease();
      *(void *)(v24 + 32) = 0;
      *(unsigned char *)(v24 + 40) = 1;
      type metadata accessor for IEFailureInfo();
      swift_allocObject();
      uint64_t v25 = v24;
LABEL_13:
      uint64_t v27 = sub_259EED164(&v32, (char *)&v31, &v33, v25, 0, 0);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
LABEL_12:
    LOBYTE(v32) = 4;
    LOBYTE(v31) = 62;
    char v33 = 62;
    type metadata accessor for IEFailureInfo();
    swift_allocObject();
    uint64_t v25 = 0;
    goto LABEL_13;
  }
  (*(void (**)(char *, uint64_t))(v14 + 96))(v10, v13);
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v10, v0);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  type metadata accessor for PNRError();
  swift_allocObject();
  uint64_t v16 = sub_259ED38CC((uint64_t)v4);
  if (qword_26A3F87C8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_259EFEC00();
  __swift_project_value_buffer(v17, (uint64_t)qword_26A3F8B48);
  swift_retain_n();
  uint64_t v18 = sub_259EFEBF0();
  os_log_type_t v19 = sub_259EFEDC0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v20 = 136315138;
    v29[1] = v20 + 4;
    uint64_t v21 = sub_259ED3A54();
    uint64_t v31 = sub_259ED2D5C(v21, v22, &v32);
    sub_259EFEE10();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259EC8000, v18, v19, "Processing TranscriptProtoExecutorError.other %s", v20, 0xCu);
    uint64_t v23 = v30;
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v23, -1, -1);
    MEMORY[0x25A2EF270](v20, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  LOBYTE(v32) = 5;
  LOBYTE(v31) = 38;
  char v33 = 40;
  type metadata accessor for IEFailureInfo();
  swift_allocObject();
  swift_retain();
  uint64_t v26 = sub_259EED164(&v32, (char *)&v31, &v33, v16, 0, 0);
  uint64_t v27 = sub_259EEA0B0(v16, v26);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
LABEL_14:
  sub_259ED1170((uint64_t)v12, &qword_26A3F8C20);
  return v27;
}

uint64_t _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor27TranscriptProtoSessionErrorV_tFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_259EFEA70();
  uint64_t v75 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v73 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v74 = (char *)&v63 - v5;
  uint64_t v6 = sub_259EFE980();
  uint64_t v68 = *(void *)(v6 - 8);
  uint64_t v69 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259EFEAB0();
  uint64_t v71 = *(void *)(v9 - 8);
  uint64_t v72 = v9;
  MEMORY[0x270FA5388](v9);
  int64_t v70 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C60);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v76 = (uint64_t)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v82 = (uint64_t)&v63 - v14;
  uint64_t v15 = sub_259EFE940();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  os_log_type_t v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v63 - v20;
  if (qword_26A3F87C8 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_259EFEC00();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_26A3F8B48);
  id v79 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v80 = v16 + 16;
  v79(v21, a1, v15);
  uint64_t v81 = v23;
  uint64_t v24 = sub_259EFEBF0();
  os_log_type_t v25 = sub_259EFEDC0();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v78 = v16;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v67 = a1;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v64 = v8;
    uint64_t v30 = v29;
    uint64_t v84 = v29;
    uint64_t v65 = v19;
    uint64_t v66 = v2;
    *(_DWORD *)uint64_t v28 = 136315138;
    sub_259EED094();
    uint64_t v31 = sub_259EFE700();
    uint64_t v83 = sub_259ED2D5C(v31, v32, &v84);
    uint64_t v2 = v66;
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    os_log_type_t v19 = v65;
    uint64_t v77 = *(void (**)(char *, uint64_t))(v16 + 8);
    v77(v21, v15);
    _os_log_impl(&dword_259EC8000, v24, v25, "Processing criticalError from transcript: %s", v28, 0xCu);
    swift_arrayDestroy();
    uint64_t v33 = v30;
    uint64_t v8 = v64;
    MEMORY[0x25A2EF270](v33, -1, -1);
    uint64_t v34 = v28;
    a1 = v67;
    MEMORY[0x25A2EF270](v34, -1, -1);
  }
  else
  {
    uint64_t v77 = *(void (**)(char *, uint64_t))(v16 + 8);
    v77(v21, v15);
  }

  uint64_t v35 = v82;
  sub_259EFE930();
  uint64_t v36 = sub_259EFE9F0();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36) == 1) {
    goto LABEL_7;
  }
  uint64_t v44 = v76;
  sub_259EED0EC(v82, v76, &qword_26A3F8C60);
  int v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 88))(v44, v36);
  if (v45 == *MEMORY[0x263F51740])
  {
    (*(void (**)(uint64_t, uint64_t))(v37 + 96))(v44, v36);
    int v46 = v74;
    uint64_t v47 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 32))(v74, v44, v2);
    LOBYTE(v84) = 1;
    LOBYTE(v83) = 62;
    v85[0] = 62;
    uint64_t v48 = (uint64_t)v73;
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v73, v46, v2);
    type metadata accessor for PNRError();
    swift_allocObject();
    uint64_t v49 = sub_259ED38CC(v48);
    type metadata accessor for IEFailureInfo();
    swift_allocObject();
    uint64_t v50 = sub_259EED164(&v84, (char *)&v83, v85, v49, 0, 0);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v2);
    goto LABEL_19;
  }
  if (v45 == *MEMORY[0x263F51728])
  {
    (*(void (**)(uint64_t, uint64_t))(v37 + 96))(v44, v36);
    uint64_t v55 = v70;
    uint64_t v54 = v71;
    uint64_t v56 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v70, v44, v72);
    uint64_t v50 = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor38TranscriptProtoSessionCoordinatorErrorV_tFZ_0();
    unint64_t v57 = *(void (**)(char *, uint64_t))(v54 + 8);
    uint64_t v58 = v55;
LABEL_15:
    uint64_t v59 = v56;
LABEL_18:
    v57(v58, v59);
    goto LABEL_19;
  }
  if (v45 == *MEMORY[0x263F51730])
  {
    LOBYTE(v84) = 3;
    LOBYTE(v83) = 62;
    v85[0] = 62;
    type metadata accessor for IEFailureInfo();
    swift_allocObject();
    uint64_t v60 = v44;
    uint64_t v50 = sub_259EED164(&v84, (char *)&v83, v85, 0, 0, 0);
    unint64_t v57 = *(void (**)(char *, uint64_t))(v37 + 8);
    uint64_t v58 = (char *)v60;
    uint64_t v59 = v36;
    goto LABEL_18;
  }
  if (v45 == *MEMORY[0x263F51738])
  {
    (*(void (**)(uint64_t, uint64_t))(v37 + 96))(v44, v36);
    uint64_t v62 = v68;
    uint64_t v56 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 32))(v8, v44, v69);
    uint64_t v50 = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor28TranscriptProtoExecutorErrorV_tFZ_0();
    unint64_t v57 = *(void (**)(char *, uint64_t))(v62 + 8);
    uint64_t v58 = v8;
    goto LABEL_15;
  }
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v44, v36);
LABEL_7:
  v79(v19, a1, v15);
  uint64_t v38 = sub_259EFEBF0();
  os_log_type_t v39 = sub_259EFEDC0();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v84 = v41;
    *(_DWORD *)uint64_t v40 = 136315138;
    sub_259EED094();
    uint64_t v42 = sub_259EFE700();
    uint64_t v83 = sub_259ED2D5C(v42, v43, &v84);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    v77(v19, v15);
    _os_log_impl(&dword_259EC8000, v38, v39, "Unrecognized error from criticalError: %s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v41, -1, -1);
    MEMORY[0x25A2EF270](v40, -1, -1);
  }
  else
  {
    v77(v19, v15);
  }

  LOBYTE(v84) = 1;
  LOBYTE(v83) = 62;
  v85[0] = 62;
  sub_259EED094();
  uint64_t v51 = sub_259EFE700();
  uint64_t v53 = v52;
  type metadata accessor for IEFailureInfo();
  swift_allocObject();
  uint64_t v50 = sub_259EED164(&v84, (char *)&v83, v85, 0, v51, v53);
LABEL_19:
  sub_259ED1170(v82, &qword_26A3F8C60);
  return v50;
}

unint64_t sub_259EECAF8()
{
  unint64_t result = qword_26A3F8BF0;
  if (!qword_26A3F8BF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F8BA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8BF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for IEReliabilityCalculator()
{
  return &type metadata for IEReliabilityCalculator;
}

uint64_t sub_259EECB64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t sub_259EECC58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 200 * a1 + 32;
    unint64_t v6 = a3 + 200 * v4;
    if (v5 >= v6 || v5 + 200 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t sub_259EECD4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 8) + 32;
    unint64_t v6 = a3 + (v4 << 8);
    if (v5 >= v6 || v5 + (v4 << 8) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t sub_259EECE40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C18);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t sub_259EECF4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 416 * a1 + 32;
    unint64_t v6 = a3 + 416 * v4;
    if (v5 >= v6 || v5 + 416 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

unint64_t sub_259EED040()
{
  unint64_t result = qword_26A3F8C28;
  if (!qword_26A3F8C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8C28);
  }
  return result;
}

unint64_t sub_259EED094()
{
  unint64_t result = qword_26A3F8C68;
  if (!qword_26A3F8C68)
  {
    sub_259EFE940();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8C68);
  }
  return result;
}

uint64_t sub_259EED0EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t dispatch thunk of IEMetricsCalculator.extractMetrics(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_259EED164(unsigned char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7 = *a2;
  char v8 = *a3;
  *(unsigned char *)(v6 + 16) = *a1;
  *(unsigned char *)(v6 + 17) = v7;
  *(unsigned char *)(v6 + 18) = v8;
  *(void *)(v6 + 24) = a4;
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = a6;
  swift_bridgeObjectRelease();
  return v6;
}

void *sub_259EED1A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_259EFEC00();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v59 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v59 - v10;
  uint64_t v12 = 0;
  if (v1[16] != 62)
  {
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAA8]), sel_init);
    uint64_t v12 = v13;
    if (v13)
    {
      uint64_t v14 = v1[16];
      switch(v1[16])
      {
        case 1u:
          uint64_t v14 = 50;
          goto LABEL_66;
        case 2u:
          uint64_t v14 = 51;
          goto LABEL_66;
        case 3u:
          uint64_t v14 = 52;
          goto LABEL_66;
        case 4u:
          uint64_t v14 = 53;
          goto LABEL_66;
        case 5u:
          uint64_t v14 = 54;
          goto LABEL_66;
        case 6u:
          uint64_t v14 = 55;
          goto LABEL_66;
        case 7u:
          uint64_t v14 = 5201;
          goto LABEL_66;
        case 8u:
          uint64_t v14 = 5202;
          goto LABEL_66;
        case 9u:
          uint64_t v14 = 5203;
          goto LABEL_66;
        case 0xAu:
          uint64_t v14 = 5204;
          goto LABEL_66;
        case 0xBu:
          uint64_t v14 = 5205;
          goto LABEL_66;
        case 0xCu:
          uint64_t v14 = 5206;
          goto LABEL_66;
        case 0xDu:
          uint64_t v14 = 5207;
          goto LABEL_66;
        case 0xEu:
          uint64_t v14 = 520101;
          goto LABEL_66;
        case 0xFu:
          uint64_t v14 = 520102;
          goto LABEL_66;
        case 0x10u:
          uint64_t v15 = 520101;
          goto LABEL_65;
        case 0x11u:
          uint64_t v14 = 520201;
          goto LABEL_66;
        case 0x12u:
          uint64_t v14 = 520202;
          goto LABEL_66;
        case 0x13u:
          uint64_t v14 = 520301;
          goto LABEL_66;
        case 0x14u:
          uint64_t v14 = 520302;
          goto LABEL_66;
        case 0x15u:
          uint64_t v14 = 520303;
          goto LABEL_66;
        case 0x16u:
          uint64_t v14 = 520304;
          goto LABEL_66;
        case 0x17u:
          uint64_t v14 = 520401;
          goto LABEL_66;
        case 0x18u:
          uint64_t v14 = 520402;
          goto LABEL_66;
        case 0x19u:
          uint64_t v14 = 520501;
          goto LABEL_66;
        case 0x1Au:
          uint64_t v14 = 520502;
          goto LABEL_66;
        case 0x1Bu:
          uint64_t v14 = 520503;
          goto LABEL_66;
        case 0x1Cu:
          uint64_t v14 = 520504;
          goto LABEL_66;
        case 0x1Du:
          uint64_t v14 = 520505;
          goto LABEL_66;
        case 0x1Eu:
          uint64_t v14 = 520506;
          goto LABEL_66;
        case 0x1Fu:
          uint64_t v14 = 520507;
          goto LABEL_66;
        case 0x20u:
          uint64_t v14 = 520508;
          goto LABEL_66;
        case 0x21u:
          uint64_t v14 = 520601;
          goto LABEL_66;
        case 0x22u:
          uint64_t v14 = 520602;
          goto LABEL_66;
        case 0x23u:
          uint64_t v14 = 520603;
          goto LABEL_66;
        case 0x24u:
          uint64_t v14 = 520701;
          goto LABEL_66;
        case 0x25u:
          uint64_t v14 = 520702;
          goto LABEL_66;
        case 0x26u:
          uint64_t v14 = 5401;
          goto LABEL_66;
        case 0x27u:
          uint64_t v14 = 5402;
          goto LABEL_66;
        case 0x28u:
          uint64_t v14 = 540101;
          goto LABEL_66;
        case 0x29u:
          uint64_t v14 = 540102;
          goto LABEL_66;
        case 0x2Au:
          uint64_t v15 = 540101;
          goto LABEL_65;
        case 0x2Bu:
          uint64_t v14 = 5501;
          goto LABEL_66;
        case 0x2Cu:
          uint64_t v14 = 5502;
          goto LABEL_66;
        case 0x2Du:
          uint64_t v14 = 5503;
          goto LABEL_66;
        case 0x2Eu:
          uint64_t v14 = 5504;
          goto LABEL_66;
        case 0x2Fu:
          uint64_t v14 = 5511;
          goto LABEL_66;
        case 0x30u:
          uint64_t v14 = 5512;
          goto LABEL_66;
        case 0x31u:
          uint64_t v14 = 5521;
          goto LABEL_66;
        case 0x32u:
          uint64_t v14 = 5522;
          goto LABEL_66;
        case 0x33u:
          uint64_t v14 = 5531;
          goto LABEL_66;
        case 0x34u:
          uint64_t v14 = 5532;
          goto LABEL_66;
        case 0x35u:
          uint64_t v14 = 5533;
          goto LABEL_66;
        case 0x36u:
          uint64_t v14 = 5534;
          goto LABEL_66;
        case 0x37u:
          uint64_t v14 = 5535;
          goto LABEL_66;
        case 0x38u:
          uint64_t v14 = 5536;
          goto LABEL_66;
        case 0x39u:
          uint64_t v14 = 5537;
          goto LABEL_66;
        case 0x3Au:
          uint64_t v14 = 55101;
          goto LABEL_66;
        case 0x3Bu:
          uint64_t v14 = 55102;
          goto LABEL_66;
        case 0x3Cu:
          uint64_t v14 = 99994097;
          goto LABEL_66;
        case 0x3Du:
          uint64_t v15 = 99994097;
LABEL_65:
          uint64_t v14 = v15 | 2;
          goto LABEL_66;
        case 0x3Eu:
          goto LABEL_217;
        default:
LABEL_66:
          objc_msgSend(v13, sel_setFailureType_, v14);
          break;
      }
    }
    uint64_t v16 = 50;
    switch(v1[17])
    {
      case 1u:
        goto LABEL_134;
      case 2u:
        uint64_t v16 = 51;
        goto LABEL_134;
      case 3u:
        uint64_t v16 = 52;
        goto LABEL_134;
      case 4u:
        uint64_t v16 = 53;
        goto LABEL_134;
      case 5u:
        uint64_t v16 = 54;
        goto LABEL_134;
      case 6u:
        uint64_t v16 = 55;
        goto LABEL_134;
      case 7u:
        uint64_t v16 = 5201;
        goto LABEL_134;
      case 8u:
        uint64_t v16 = 5202;
        goto LABEL_134;
      case 9u:
        uint64_t v16 = 5203;
        goto LABEL_134;
      case 0xAu:
        uint64_t v16 = 5204;
        goto LABEL_134;
      case 0xBu:
        uint64_t v16 = 5205;
        goto LABEL_134;
      case 0xCu:
        uint64_t v16 = 5206;
        goto LABEL_134;
      case 0xDu:
        uint64_t v16 = 5207;
        goto LABEL_134;
      case 0xEu:
        uint64_t v16 = 520101;
        goto LABEL_134;
      case 0xFu:
        uint64_t v16 = 520102;
        goto LABEL_134;
      case 0x10u:
        uint64_t v29 = 520101;
        goto LABEL_133;
      case 0x11u:
        uint64_t v16 = 520201;
        goto LABEL_134;
      case 0x12u:
        uint64_t v16 = 520202;
        goto LABEL_134;
      case 0x13u:
        uint64_t v16 = 520301;
        goto LABEL_134;
      case 0x14u:
        uint64_t v16 = 520302;
        goto LABEL_134;
      case 0x15u:
        uint64_t v16 = 520303;
        goto LABEL_134;
      case 0x16u:
        uint64_t v16 = 520304;
        goto LABEL_134;
      case 0x17u:
        uint64_t v16 = 520401;
        goto LABEL_134;
      case 0x18u:
        uint64_t v16 = 520402;
        goto LABEL_134;
      case 0x19u:
        uint64_t v16 = 520501;
        goto LABEL_134;
      case 0x1Au:
        uint64_t v16 = 520502;
        goto LABEL_134;
      case 0x1Bu:
        uint64_t v16 = 520503;
        goto LABEL_134;
      case 0x1Cu:
        uint64_t v16 = 520504;
        goto LABEL_134;
      case 0x1Du:
        uint64_t v16 = 520505;
        goto LABEL_134;
      case 0x1Eu:
        uint64_t v16 = 520506;
        goto LABEL_134;
      case 0x1Fu:
        uint64_t v16 = 520507;
        goto LABEL_134;
      case 0x20u:
        uint64_t v16 = 520508;
        goto LABEL_134;
      case 0x21u:
        uint64_t v16 = 520601;
        goto LABEL_134;
      case 0x22u:
        uint64_t v16 = 520602;
        goto LABEL_134;
      case 0x23u:
        uint64_t v16 = 520603;
        goto LABEL_134;
      case 0x24u:
        uint64_t v16 = 520701;
        goto LABEL_134;
      case 0x25u:
        uint64_t v16 = 520702;
        goto LABEL_134;
      case 0x26u:
        uint64_t v16 = 5401;
        goto LABEL_134;
      case 0x27u:
        uint64_t v16 = 5402;
        goto LABEL_134;
      case 0x28u:
        uint64_t v16 = 540101;
        goto LABEL_134;
      case 0x29u:
        uint64_t v16 = 540102;
        goto LABEL_134;
      case 0x2Au:
        uint64_t v29 = 540101;
        goto LABEL_133;
      case 0x2Bu:
        uint64_t v16 = 5501;
        goto LABEL_134;
      case 0x2Cu:
        uint64_t v16 = 5502;
        goto LABEL_134;
      case 0x2Du:
        uint64_t v16 = 5503;
        goto LABEL_134;
      case 0x2Eu:
        uint64_t v16 = 5504;
        goto LABEL_134;
      case 0x2Fu:
        uint64_t v16 = 5511;
        goto LABEL_134;
      case 0x30u:
        uint64_t v16 = 5512;
        goto LABEL_134;
      case 0x31u:
        uint64_t v16 = 5521;
        goto LABEL_134;
      case 0x32u:
        uint64_t v16 = 5522;
        goto LABEL_134;
      case 0x33u:
        uint64_t v16 = 5531;
        goto LABEL_134;
      case 0x34u:
        uint64_t v16 = 5532;
        goto LABEL_134;
      case 0x35u:
        uint64_t v16 = 5533;
        goto LABEL_134;
      case 0x36u:
        uint64_t v16 = 5534;
        goto LABEL_134;
      case 0x37u:
        uint64_t v16 = 5535;
        goto LABEL_134;
      case 0x38u:
        uint64_t v16 = 5536;
        goto LABEL_134;
      case 0x39u:
        uint64_t v16 = 5537;
        goto LABEL_134;
      case 0x3Au:
        uint64_t v16 = 55101;
        goto LABEL_134;
      case 0x3Bu:
        uint64_t v16 = 55102;
        goto LABEL_134;
      case 0x3Cu:
        uint64_t v16 = 99994097;
        goto LABEL_134;
      case 0x3Du:
        uint64_t v29 = 99994097;
LABEL_133:
        uint64_t v16 = v29 | 2;
LABEL_134:
        if (v12) {
          objc_msgSend(v12, sel_setFailureSubType_, v16);
        }
        uint64_t v30 = 50;
        switch(v1[18])
        {
          case 1u:
            goto LABEL_204;
          case 2u:
            uint64_t v30 = 51;
            goto LABEL_204;
          case 3u:
            uint64_t v30 = 52;
            goto LABEL_204;
          case 4u:
            uint64_t v30 = 53;
            goto LABEL_204;
          case 5u:
            uint64_t v30 = 54;
            goto LABEL_204;
          case 6u:
            uint64_t v30 = 55;
            goto LABEL_204;
          case 7u:
            uint64_t v30 = 5201;
            goto LABEL_204;
          case 8u:
            uint64_t v30 = 5202;
            goto LABEL_204;
          case 9u:
            uint64_t v30 = 5203;
            goto LABEL_204;
          case 0xAu:
            uint64_t v30 = 5204;
            goto LABEL_204;
          case 0xBu:
            uint64_t v30 = 5205;
            goto LABEL_204;
          case 0xCu:
            uint64_t v30 = 5206;
            goto LABEL_204;
          case 0xDu:
            uint64_t v30 = 5207;
            goto LABEL_204;
          case 0xEu:
            uint64_t v30 = 520101;
            goto LABEL_204;
          case 0xFu:
            uint64_t v30 = 520102;
            goto LABEL_204;
          case 0x10u:
            uint64_t v44 = 520101;
            goto LABEL_203;
          case 0x11u:
            uint64_t v30 = 520201;
            goto LABEL_204;
          case 0x12u:
            uint64_t v30 = 520202;
            goto LABEL_204;
          case 0x13u:
            uint64_t v30 = 520301;
            goto LABEL_204;
          case 0x14u:
            uint64_t v30 = 520302;
            goto LABEL_204;
          case 0x15u:
            uint64_t v30 = 520303;
            goto LABEL_204;
          case 0x16u:
            uint64_t v30 = 520304;
            goto LABEL_204;
          case 0x17u:
            uint64_t v30 = 520401;
            goto LABEL_204;
          case 0x18u:
            uint64_t v30 = 520402;
            goto LABEL_204;
          case 0x19u:
            uint64_t v30 = 520501;
            goto LABEL_204;
          case 0x1Au:
            uint64_t v30 = 520502;
            goto LABEL_204;
          case 0x1Bu:
            uint64_t v30 = 520503;
            goto LABEL_204;
          case 0x1Cu:
            uint64_t v30 = 520504;
            goto LABEL_204;
          case 0x1Du:
            uint64_t v30 = 520505;
            goto LABEL_204;
          case 0x1Eu:
            uint64_t v30 = 520506;
            goto LABEL_204;
          case 0x1Fu:
            uint64_t v30 = 520507;
            goto LABEL_204;
          case 0x20u:
            uint64_t v30 = 520508;
            goto LABEL_204;
          case 0x21u:
            uint64_t v30 = 520601;
            goto LABEL_204;
          case 0x22u:
            uint64_t v30 = 520602;
            goto LABEL_204;
          case 0x23u:
            uint64_t v30 = 520603;
            goto LABEL_204;
          case 0x24u:
            uint64_t v30 = 520701;
            goto LABEL_204;
          case 0x25u:
            uint64_t v30 = 520702;
            goto LABEL_204;
          case 0x26u:
            uint64_t v30 = 5401;
            goto LABEL_204;
          case 0x27u:
            uint64_t v30 = 5402;
            goto LABEL_204;
          case 0x28u:
            uint64_t v30 = 540101;
            goto LABEL_204;
          case 0x29u:
            uint64_t v30 = 540102;
            goto LABEL_204;
          case 0x2Au:
            uint64_t v44 = 540101;
            goto LABEL_203;
          case 0x2Bu:
            uint64_t v30 = 5501;
            goto LABEL_204;
          case 0x2Cu:
            uint64_t v30 = 5502;
            goto LABEL_204;
          case 0x2Du:
            uint64_t v30 = 5503;
            goto LABEL_204;
          case 0x2Eu:
            uint64_t v30 = 5504;
            goto LABEL_204;
          case 0x2Fu:
            uint64_t v30 = 5511;
            goto LABEL_204;
          case 0x30u:
            uint64_t v30 = 5512;
            goto LABEL_204;
          case 0x31u:
            uint64_t v30 = 5521;
            goto LABEL_204;
          case 0x32u:
            uint64_t v30 = 5522;
            goto LABEL_204;
          case 0x33u:
            uint64_t v30 = 5531;
            goto LABEL_204;
          case 0x34u:
            uint64_t v30 = 5532;
            goto LABEL_204;
          case 0x35u:
            uint64_t v30 = 5533;
            goto LABEL_204;
          case 0x36u:
            uint64_t v30 = 5534;
            goto LABEL_204;
          case 0x37u:
            uint64_t v30 = 5535;
            goto LABEL_204;
          case 0x38u:
            uint64_t v30 = 5536;
            goto LABEL_204;
          case 0x39u:
            uint64_t v30 = 5537;
            goto LABEL_204;
          case 0x3Au:
            uint64_t v30 = 55101;
            goto LABEL_204;
          case 0x3Bu:
            uint64_t v30 = 55102;
            goto LABEL_204;
          case 0x3Cu:
            uint64_t v30 = 99994097;
            goto LABEL_204;
          case 0x3Du:
            uint64_t v44 = 99994097;
LABEL_203:
            uint64_t v30 = v44 | 2;
LABEL_204:
            if (v12) {
              objc_msgSend(v12, (SEL)0x265469863, v30);
            }
            if (qword_26A3F87A0 != -1) {
              swift_once();
            }
            uint64_t v45 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8AD0);
            (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v45, v2);
            swift_retain_n();
            id v46 = v12;
            uint64_t v47 = sub_259EFEBF0();
            os_log_type_t v48 = sub_259EFEDC0();
            if (!os_log_type_enabled(v47, v48))
            {

              swift_release_n();
              (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
              return v12;
            }
            uint64_t v59 = (uint64_t)v6;
            uint64_t v60 = v3;
            uint64_t v62 = v2;
            uint64_t v49 = swift_slowAlloc();
            uint64_t v50 = v12;
            uint64_t v51 = swift_slowAlloc();
            uint64_t v64 = v51;
            *(_DWORD *)uint64_t v49 = 136315394;
            uint64_t v52 = sub_259EEE840();
            uint64_t v63 = sub_259ED2D5C(v52, v53, &v64);
            sub_259EFEE10();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v49 + 12) = 2080;
            uint64_t v61 = v50;
            if (v50)
            {
              id v54 = objc_msgSend(v46, sel_description);
              uint64_t v55 = sub_259EFEC90();
              unint64_t v57 = v56;

              uint64_t v63 = sub_259ED2D5C(v55, v57, &v64);
              sub_259EFEE10();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_259EC8000, v47, v48, "converting failureInfo to SELFMessage: %s %s", (uint8_t *)v49, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x25A2EF270](v51, -1, -1);
              MEMORY[0x25A2EF270](v49, -1, -1);

              (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v62);
              return v61;
            }
            __break(1u);
            break;
          default:
            if (qword_26A3F87A0 != -1) {
              swift_once();
            }
            uint64_t v31 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8AD0);
            (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v31, v2);
            swift_retain_n();
            id v32 = v12;
            uint64_t v33 = sub_259EFEBF0();
            int v34 = sub_259EFEDC0();
            if (!os_log_type_enabled(v33, (os_log_type_t)v34))
            {

              swift_release_n();
              (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
              return v12;
            }
            LODWORD(v61) = v34;
            uint64_t v62 = v2;
            uint64_t v35 = swift_slowAlloc();
            uint64_t v60 = swift_slowAlloc();
            uint64_t v64 = v60;
            *(_DWORD *)uint64_t v35 = 136315394;
            uint64_t v36 = sub_259EEE840();
            uint64_t v63 = sub_259ED2D5C(v36, v37, &v64);
            sub_259EFEE10();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v35 + 12) = 2080;
            if (!v12) {
              goto LABEL_216;
            }
            uint64_t v38 = v12;
            id v39 = objc_msgSend(v32, sel_description, v35 + 14);
            uint64_t v40 = sub_259EFEC90();
            unint64_t v42 = v41;

            uint64_t v63 = sub_259ED2D5C(v40, v42, &v64);
            sub_259EFEE10();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_259EC8000, v33, (os_log_type_t)v61, "converting failureInfo to SELFMessage: %s %s", (uint8_t *)v35, 0x16u);
            uint64_t v43 = v60;
            swift_arrayDestroy();
            MEMORY[0x25A2EF270](v43, -1, -1);
            MEMORY[0x25A2EF270](v35, -1, -1);

            (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v62);
            return v38;
        }
        goto LABEL_215;
      default:
        if (qword_26A3F87A0 != -1) {
          swift_once();
        }
        uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26A3F8AD0);
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v17, v2);
        swift_retain_n();
        id v18 = v12;
        os_log_type_t v19 = sub_259EFEBF0();
        int v20 = sub_259EFEDC0();
        if (os_log_type_enabled(v19, (os_log_type_t)v20))
        {
          LODWORD(v60) = v20;
          uint64_t v62 = v2;
          uint64_t v21 = swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          uint64_t v64 = v59;
          *(_DWORD *)uint64_t v21 = 136315394;
          uint64_t v22 = sub_259EEE840();
          uint64_t v63 = sub_259ED2D5C(v22, v23, &v64);
          sub_259EFEE10();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v21 + 12) = 2080;
          uint64_t v61 = v12;
          if (!v12)
          {
LABEL_215:
            __break(1u);
LABEL_216:
            __break(1u);
LABEL_217:
            __break(1u);
            JUMPOUT(0x259EEE284);
          }
          id v24 = objc_msgSend(v18, sel_description);
          uint64_t v25 = sub_259EFEC90();
          unint64_t v27 = v26;

          uint64_t v63 = sub_259ED2D5C(v25, v27, &v64);
          sub_259EFEE10();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_259EC8000, v19, (os_log_type_t)v60, "converting failureInfo to SELFMessage: %s %s", (uint8_t *)v21, 0x16u);
          uint64_t v28 = v59;
          swift_arrayDestroy();
          MEMORY[0x25A2EF270](v28, -1, -1);
          MEMORY[0x25A2EF270](v21, -1, -1);

          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v62);
          uint64_t v12 = v61;
        }
        else
        {

          swift_release_n();
          (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
        }
        break;
    }
  }
  return v12;
}

unint64_t sub_259EEE578()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F88F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259F011A0;
  *(void *)(inited + 32) = 0x546572756C696166;
  *(void *)(inited + 40) = 0xEB00000000657079;
  if (*(unsigned char *)(v0 + 16) == 62)
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v4 = sub_259EDB4F8();
  }
  else
  {
    id v3 = (id)sub_259EFECD0();
    *(void *)(inited + 56) = v5;
    unint64_t v4 = MEMORY[0x263F8D310];
  }
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 72) = v4;
  strcpy((char *)(inited + 80), "failureSubType");
  *(unsigned char *)(inited + 95) = -18;
  if (*(unsigned char *)(v1 + 17) == 62)
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v7 = sub_259EDB4F8();
  }
  else
  {
    id v6 = (id)sub_259EFECD0();
    *(void *)(inited + 104) = v8;
    unint64_t v7 = MEMORY[0x263F8D310];
  }
  *(void *)(inited + 96) = v6;
  *(void *)(inited + 120) = v7;
  *(void *)(inited + 128) = 0xD000000000000011;
  *(void *)(inited + 136) = 0x8000000259F035D0;
  if (*(unsigned char *)(v1 + 18) == 62)
  {
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v10 = sub_259EDB4F8();
  }
  else
  {
    id v9 = (id)sub_259EFECD0();
    *(void *)(inited + 152) = v11;
    unint64_t v10 = MEMORY[0x263F8D310];
  }
  *(void *)(inited + 144) = v9;
  *(void *)(inited + 168) = v10;
  *(void *)(inited + 176) = 0x726F727265;
  *(void *)(inited + 184) = 0xE500000000000000;
  if (*(void *)(v1 + 24))
  {
    swift_retain();
    id v12 = (id)sub_259ED3B0C();
    swift_release();
    unint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A88);
  }
  else
  {
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v13 = sub_259EDB4F8();
  }
  *(void *)(inited + 192) = v12;
  *(void *)(inited + 216) = v13;
  *(void *)(inited + 224) = 0x666E496775626564;
  *(void *)(inited + 232) = 0xE90000000000006FLL;
  uint64_t v14 = *(void *)(v1 + 40);
  if (v14)
  {
    id v15 = *(id *)(v1 + 32);
    *(void *)(inited + 248) = v14;
    unint64_t v16 = MEMORY[0x263F8D310];
  }
  else
  {
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
    unint64_t v16 = sub_259EDB4F8();
  }
  *(void *)(inited + 264) = v16;
  *(void *)(inited + 240) = v15;
  swift_bridgeObjectRetain();
  return sub_259ED3630(inited);
}

uint64_t sub_259EEE840()
{
  unint64_t v1 = 0xE000000000000000;
  if (*(unsigned char *)(v0 + 16) == 62)
  {
    uint64_t v2 = 0;
  }
  else
  {
    sub_259EFEE80();
    swift_bridgeObjectRelease();
    strcpy((char *)v4, "\nfailureType: ");
    HIBYTE(v4[1]) = -18;
    sub_259EFEF40();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
    sub_259EFECF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C98);
    sub_259EFECD0();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
    uint64_t v2 = v4[0];
    unint64_t v1 = v4[1];
  }
  if (*(unsigned char *)(v0 + 17) != 62)
  {
    sub_259EFEE80();
    swift_bridgeObjectRelease();
    v4[0] = v2;
    v4[1] = v1;
    sub_259EFECF0();
    sub_259EFEF40();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
    sub_259EFECF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8C98);
    sub_259EFECD0();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
  }
  if (*(unsigned char *)(v0 + 18) != 62)
  {
    sub_259EFEE80();
    swift_bridgeObjectRelease();
    v4[0] = v2;
    v4[1] = v1;
    sub_259EFECF0();
    sub_259EFEF40();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
    sub_259EFECF0();
    sub_259EFECD0();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v0 + 24))
  {
    v4[0] = v2;
    v4[1] = v1;
    swift_retain();
    sub_259EFECF0();
    sub_259ED3A54();
    sub_259EFECF0();
    swift_release();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v0 + 40))
  {
    v4[0] = v2;
    v4[1] = v1;
    swift_bridgeObjectRetain();
    sub_259EFECF0();
    sub_259EFECF0();
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t IEFailureInfo.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t IEFailureInfo.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for IEFailureInfo()
{
  return self;
}

uint64_t method lookup function for IEFailureInfo(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IEFailureInfo);
}

uint64_t dispatch thunk of IEFailureInfo.getSELFMessage()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of IEFailureInfo.dictionary.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of IEFailureInfo.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t sub_259EEECB4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B98);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_259F00F40;
  uint64_t v2 = v0[2];
  *(void *)(v1 + 56) = type metadata accessor for RequestGrainDimensionsSpec();
  *(void *)(v1 + 64) = &off_2707DD990;
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = v0[3];
  uint64_t v4 = type metadata accessor for IETranscriptLatencyIntervalSpec();
  *(void *)(v1 + 96) = v4;
  *(void *)(v1 + 104) = &off_2707DD9A0;
  *(void *)(v1 + 72) = v3;
  *(void *)(v1 + 136) = v4;
  *(void *)(v1 + 144) = &off_2707DD9A0;
  uint64_t v5 = v0[5];
  *(void *)(v1 + 112) = v0[4];
  *(void *)(v1 + 176) = v4;
  *(void *)(v1 + 184) = &off_2707DD9A0;
  *(void *)(v1 + 152) = v5;
  *(void *)(v1 + 216) = v4;
  *(void *)(v1 + 224) = &off_2707DD9A0;
  uint64_t v7 = v0[6];
  uint64_t v6 = v0[7];
  *(void *)(v1 + 192) = v7;
  *(void *)(v1 + 256) = v4;
  *(void *)(v1 + 264) = &off_2707DD9A0;
  *(void *)(v1 + 232) = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v1;
}

uint64_t sub_259EEEDA0(uint64_t a1)
{
  uint64_t v2 = sub_259EEECB4();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 32;
    do
    {
      sub_259ED1078(v4, (uint64_t)v8);
      uint64_t v5 = v9;
      uint64_t v6 = v10;
      __swift_project_boxed_opaque_existential_1(v8, v9);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, v5, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      v4 += 40;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_259EEEE80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v40 = *(void *)(v8 + 24);
  uint64_t v41 = *(void *)(v8 + 16);
  long long v36 = *(_OWORD *)(v8 + 48);
  long long v37 = *(_OWORD *)(v8 + 32);
  long long v34 = *(_OWORD *)(v8 + 80);
  long long v35 = *(_OWORD *)(v8 + 64);
  uint64_t v32 = *(void *)(v8 + 112);
  uint64_t v33 = *(void *)(v8 + 96);
  uint64_t v31 = *(void *)(v8 + 120);
  swift_beginAccess();
  uint64_t v28 = *(void *)(v8 + 128);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_259EF339C();
  char v25 = v10 & 1;
  uint64_t v11 = sub_259EF339C();
  char v13 = v12 & 1;
  uint64_t v14 = sub_259EF339C();
  char v16 = v15 & 1;
  uint64_t v17 = sub_259EF339C();
  char v19 = v18 & 1;
  uint64_t v20 = sub_259EF339C();
  *(void *)&long long v24 = v31;
  *((void *)&v24 + 1) = v28;
  *(void *)&long long v23 = v33;
  *((void *)&v23 + 1) = v32;
  sub_259EE68D0(a1, a2, a3, a4, a5, a6, v41, v40, a7, v37, v36, v35, v34, v23, v24, v9, v26, v25, v11,
    v13,
    v14,
    v16,
    v17,
    v19,
    v20,
    v21 & 1,
    *(void *)(v8 + 104));
  return swift_retain();
}

uint64_t IERequestGrainSpec.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t IERequestGrainSpec.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

void *sub_259EEF10C()
{
  type metadata accessor for RequestGrainDimensionsSpec();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 128) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 136) = v2;
  *(void *)(v0 + 16) = v1;
  type metadata accessor for IETranscriptLatencyIntervalSpec();
  long long v35 = (_OWORD *)swift_allocObject();
  _OWORD v35[2] = 0u;
  v35[3] = 0u;
  v35[4] = 0u;
  v35[5] = 0u;
  v35[1] = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8898);
  uint64_t v43 = sub_259EFE8F0();
  uint64_t v3 = *(void *)(v43 - 8);
  uint64_t v41 = *(void *)(v3 + 72);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_259F002C0;
  uint64_t v6 = *(void (**)(void))(v3 + 104);
  ((void (*)(unint64_t, void, uint64_t))v6)(v5 + v4, *MEMORY[0x263F516B8], v43);
  type metadata accessor for IETranscriptNextEvent(0);
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v7 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
  uint64_t v9 = sub_259EFE840();
  uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v45(v8, 1, 1, v9);
  *(void *)(v7 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v5;
  uint64_t v10 = type metadata accessor for IETranscriptEventFilter(0);
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v7;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)(v35 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_259F004D0;
  unint64_t v42 = v4;
  unsigned int v38 = *MEMORY[0x263F51698];
  v6(v11 + v4);
  unsigned int v39 = *MEMORY[0x263F51690];
  uint64_t v40 = v6;
  v6(v11 + v4 + v41);
  type metadata accessor for IETranscriptLastEvent(0);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v9;
  v45(v12 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v9);
  *(void *)(v12 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v11;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v12;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)v35 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v44[3] = v35;
  uint64_t v14 = (_OWORD *)swift_allocObject();
  v14[1] = 0u;
  v14[2] = 0u;
  v14[3] = 0u;
  v14[4] = 0u;
  v14[5] = 0u;
  if (qword_26A3F87D0 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_26A3F9E30;
  uint64_t v16 = swift_allocObject();
  v45(v16 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v16 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v15;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v16;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)(v14 + 1));
  swift_endAccess();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_259F004D0;
  unsigned int v36 = *MEMORY[0x263F51648];
  v40(v17 + v42);
  ((void (*)(unint64_t, void, uint64_t))v40)(v17 + v42 + v41, v39, v43);
  uint64_t v18 = swift_allocObject();
  v45(v18 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v18 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v17;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v18;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)v14 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v44[4] = v14;
  char v19 = (_OWORD *)swift_allocObject();
  v19[2] = 0u;
  v19[3] = 0u;
  v19[4] = 0u;
  v19[5] = 0u;
  v19[1] = 0u;
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v40)(v20 + v42, *MEMORY[0x263F51650], v43);
  uint64_t v21 = swift_allocObject();
  v45(v21 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v21 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v20;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v21;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)(v19 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v40)(v22 + v42, *MEMORY[0x263F51660], v43);
  uint64_t v23 = swift_allocObject();
  v45(v23 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v23 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v22;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v23;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)v19 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v44[5] = v19;
  long long v24 = (_OWORD *)swift_allocObject();
  _OWORD v24[2] = 0u;
  void v24[3] = 0u;
  v24[4] = 0u;
  v24[5] = 0u;
  v24[1] = 0u;
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v40)(v25 + v42, v36, v43);
  uint64_t v26 = swift_allocObject();
  v45(v26 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v26 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v25;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v26;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)(v24 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_259F002C0;
  unsigned int v37 = *MEMORY[0x263F516B0];
  v40(v27 + v42);
  uint64_t v28 = swift_allocObject();
  v45(v28 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v28 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v27;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v28;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)v24 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v44[6] = v24;
  uint64_t v29 = (_OWORD *)swift_allocObject();
  void v29[2] = 0u;
  v29[3] = 0u;
  v29[4] = 0u;
  v29[5] = 0u;
  v29[1] = 0u;
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v40)(v30 + v42, v37, v43);
  uint64_t v31 = swift_allocObject();
  v45(v31 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v31 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v30;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v31;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)(v29 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_259F004D0;
  ((void (*)(unint64_t, void, uint64_t))v40)(v32 + v42, v38, v43);
  ((void (*)(unint64_t, void, uint64_t))v40)(v32 + v42 + v41, v39, v43);
  uint64_t v33 = swift_allocObject();
  v45(v33 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v13);
  *(void *)(v33 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v32;
  uint64_t v47 = v10;
  os_log_type_t v48 = &off_2707DD9C0;
  v46[0] = v33;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v46, (uint64_t)v29 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  unint64_t result = v44;
  v44[7] = v29;
  return result;
}

uint64_t sub_259EEFC9C(uint64_t a1)
{
  return sub_259EEEDA0(a1);
}

uint64_t sub_259EEFCC0()
{
  uint64_t v1 = sub_259EFE940();
  uint64_t v109 = *(void *)(v1 - 8);
  uint64_t v110 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v108 = (char *)&v103 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_259EFE9E0();
  uint64_t v106 = *(void *)(v3 - 8);
  uint64_t v107 = v3;
  MEMORY[0x270FA5388](v3);
  int64_t v105 = (char *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8890);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v104 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v111 = (char *)&v103 - v8;
  uint64_t v9 = sub_259EFE870();
  id v112 = *(char **)(v9 - 8);
  uint64_t v113 = (char *)v9;
  MEMORY[0x270FA5388](v9);
  unint64_t v114 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CA0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CA8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_259EFE8D0();
  uint64_t v115 = *(void *)(v17 - 8);
  uint64_t v116 = v17;
  MEMORY[0x270FA5388](v17);
  char v19 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v103 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v103 - v27;
  if (sub_259EF0C3C())
  {
    v0[14] = sub_259EFE810();
    v0[15] = v29;
    swift_bridgeObjectRelease();
  }
  unint64_t v117 = v0;
  sub_259EFE7D0();
  uint64_t v30 = sub_259EFE8B0();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v22, 1, v30) == 1)
  {
    sub_259ED1170((uint64_t)v22, &qword_26A3F8870);
    uint64_t v32 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v28, 1, 1, v32);
    return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v22, v30);
  uint64_t v33 = sub_259EFE920();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v28, 1, v33) == 1) {
    return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
  }
  sub_259ED0B9C((uint64_t)v28, (uint64_t)v26);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v34 + 88))(v26, v33);
  if (result == *MEMORY[0x263F51718])
  {
    (*(void (**)(char *, uint64_t))(v34 + 96))(v26, v33);
    uint64_t v37 = v115;
    uint64_t v36 = v116;
    (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v19, v26, v116);
    uint64_t v33 = (uint64_t)v19;
    sub_259EFE8C0();
    uint64_t v34 = sub_259EFE9C0();
    uint64_t v38 = *(void *)(v34 - 8);
    int v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v13, 1, v34);
    uint64_t v40 = v117;
    if (v39 == 1)
    {
      sub_259ED1170((uint64_t)v13, &qword_26A3F8CA0);
      uint64_t v41 = sub_259EFEA30();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v16, 1, 1, v41);
LABEL_13:
      sub_259ED1170((uint64_t)v16, &qword_26A3F8CA8);
LABEL_14:
      uint64_t v47 = v40[2];
      uint64_t v42 = (uint64_t)(v40 + 2);
      uint64_t v48 = v47 + 1;
      if (!__OFADD__(v47, 1))
      {
LABEL_15:
        *(void *)uint64_t v42 = v48;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v36);
        return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
      }
      __break(1u);
      goto LABEL_72;
    }
    uint64_t v33 = (uint64_t)v13;
    sub_259EFE9B0();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v34);
    uint64_t v34 = sub_259EFEA30();
    uint64_t v46 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v16, 1, v34) == 1) {
      goto LABEL_13;
    }
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v16, v34);
    int v55 = *MEMORY[0x263F51758];
    unint64_t v56 = *(uint64_t (**)(char *, uint64_t))(v46 + 8);
    uint64_t v26 = (char *)(v46 + 8);
    uint64_t result = v56(v16, v34);
    BOOL v57 = v33 == v55;
    uint64_t v40 = v117;
    if (!v57) {
      goto LABEL_14;
    }
    uint64_t v58 = v117[11];
    uint64_t v42 = (uint64_t)(v117 + 11);
    uint64_t v48 = v58 + 1;
    if (!__OFADD__(v58, 1)) {
      goto LABEL_15;
    }
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v42 = (uint64_t)v117;
  if (result == *MEMORY[0x263F516C8])
  {
    uint64_t v43 = v117[3];
    BOOL v44 = __OFADD__(v43, 1);
    uint64_t v45 = v43 + 1;
    if (v44)
    {
LABEL_72:
      __break(1u);
      goto LABEL_73;
    }
    v117[3] = v45;
LABEL_61:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v26, v33);
    return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
  }
  if (result == *MEMORY[0x263F516D0])
  {
    uint64_t v49 = *(void (**)(char *, uint64_t))(v34 + 96);
    v34 += 96;
    v49(v26, v33);
    uint64_t v13 = v112;
    uint64_t v16 = v113;
    char v19 = v114;
    (*((void (**)(char *, char *, char *))v112 + 4))(v114, v26, v113);
    uint64_t v50 = *(void *)(v42 + 48);
    BOOL v44 = __OFADD__(v50, 1);
    uint64_t v51 = v50 + 1;
    if (v44)
    {
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    *(void *)(v42 + 48) = v51;
    uint64_t v52 = (uint64_t)v111;
    sub_259EFE830();
    uint64_t v53 = sub_259EFE9A0();
    uint64_t v54 = *(void *)(v53 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53) == 1)
    {
      sub_259ED1170(v52, &qword_26A3F8890);
    }
    else
    {
      uint64_t v63 = sub_259EFE820();
      uint64_t v65 = v64;
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
      if (v65)
      {
        if (v63 == 0x6F7365526E616C70 && v65 == 0xEE006E6F6974756CLL)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v68 = sub_259EFEF50();
          swift_bridgeObjectRelease();
          if ((v68 & 1) == 0) {
            goto LABEL_53;
          }
        }
        uint64_t v69 = sub_259EFE860();
        if (v70) {
          uint64_t v42 = v69;
        }
        else {
          uint64_t v42 = 0x6669636570736E75;
        }
        if (v70) {
          char v19 = v70;
        }
        else {
          char v19 = (char *)0xEB00000000646569;
        }
        uint64_t v71 = v117;
        uint64_t v34 = (uint64_t)(v117 + 16);
        swift_beginAccess();
        uint64_t v33 = v71[16];
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v71[16] = v33;
        if (isUniquelyReferenced_nonNull_native) {
          goto LABEL_46;
        }
        goto LABEL_76;
      }
    }
LABEL_53:
    (*((void (**)(char *, char *))v13 + 1))(v19, v16);
    return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
  }
LABEL_25:
  if (result == *MEMORY[0x263F516E0])
  {
    uint64_t v59 = *(void *)(v42 + 40);
    BOOL v44 = __OFADD__(v59, 1);
    uint64_t v60 = v59 + 1;
    if (v44)
    {
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      uint64_t v33 = (uint64_t)sub_259EE9564(0, *(void *)(v33 + 16) + 1, 1, (void *)v33);
      *(void *)uint64_t v34 = v33;
LABEL_46:
      unint64_t v74 = *(void *)(v33 + 16);
      unint64_t v73 = *(void *)(v33 + 24);
      if (v74 >= v73 >> 1)
      {
        uint64_t v33 = (uint64_t)sub_259EE9564((void *)(v73 > 1), v74 + 1, 1, (void *)v33);
        *(void *)uint64_t v34 = v33;
      }
      *(void *)(v33 + 16) = v74 + 1;
      uint64_t v75 = v33 + 16 * v74;
      *(void *)(v75 + 32) = v42;
      *(void *)(v75 + 40) = v19;
      swift_endAccess();
      uint64_t v76 = sub_259EFE820();
      uint64_t v78 = v77;
      id v79 = v117;
      uint64_t v80 = v117 + 17;
      swift_beginAccess();
      uint64_t v81 = (void *)v79[17];
      char v82 = swift_isUniquelyReferenced_nonNull_native();
      v79[17] = v81;
      if ((v82 & 1) == 0)
      {
        uint64_t v81 = sub_259EE9564(0, v81[2] + 1, 1, v81);
        void *v80 = v81;
      }
      unint64_t v84 = v81[2];
      unint64_t v83 = v81[3];
      if (v84 >= v83 >> 1)
      {
        uint64_t v81 = sub_259EE9564((void *)(v83 > 1), v84 + 1, 1, v81);
        void *v80 = v81;
      }
      void v81[2] = v84 + 1;
      uint64_t v85 = &v81[2 * v84];
      v85[4] = v76;
      v85[5] = v78;
      swift_endAccess();
      char v19 = v114;
      goto LABEL_53;
    }
    *(void *)(v42 + 40) = v60;
    goto LABEL_61;
  }
  if (result == *MEMORY[0x263F516D8])
  {
    (*(void (**)(char *, uint64_t))(v34 + 96))(v26, v33);
    char v19 = v108;
    uint64_t v33 = v109;
    uint64_t v34 = v110;
    (*(void (**)(char *, char *, uint64_t))(v109 + 32))(v108, v26, v110);
    uint64_t v61 = *(void *)(v42 + 96);
    BOOL v44 = __OFADD__(v61, 1);
    uint64_t v62 = v61 + 1;
    if (!v44)
    {
      *(void *)(v42 + 96) = v62;
      *(void *)(v42 + 104) = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor27TranscriptProtoSessionErrorV_tFZ_0((uint64_t)v19);
      swift_release();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v34);
      return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
    }
    goto LABEL_75;
  }
  if (result == *MEMORY[0x263F51708])
  {
    uint64_t v66 = *(void *)(v42 + 72);
    BOOL v44 = __OFADD__(v66, 1);
    uint64_t v67 = v66 + 1;
    if (!v44)
    {
      *(void *)(v42 + 72) = v67;
      goto LABEL_61;
    }
    __break(1u);
    goto LABEL_78;
  }
  if (result == *MEMORY[0x263F51700])
  {
    uint64_t v86 = *(void *)(v42 + 80);
    BOOL v44 = __OFADD__(v86, 1);
    uint64_t v87 = v86 + 1;
    if (!v44)
    {
      *(void *)(v42 + 80) = v87;
      goto LABEL_61;
    }
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (result != *MEMORY[0x263F516F0]) {
    goto LABEL_61;
  }
  (*(void (**)(char *, uint64_t))(v34 + 96))(v26, v33);
  char v89 = v105;
  uint64_t v88 = v106;
  uint64_t v90 = v107;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v106 + 32))(v105, v26, v107);
  uint64_t v91 = *(void *)(v42 + 56);
  BOOL v44 = __OFADD__(v91, 1);
  uint64_t v92 = v91 + 1;
  if (v44) {
    goto LABEL_79;
  }
  *(void *)(v42 + 56) = v92;
  uint64_t v93 = (uint64_t)v104;
  sub_259EFE830();
  uint64_t v94 = sub_259EFE9A0();
  uint64_t v95 = *(void *)(v94 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v93, 1, v94) == 1)
  {
    sub_259ED1170(v93, &qword_26A3F8890);
    uint64_t v96 = v117;
LABEL_70:
    v96[13] = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor30TranscriptProtoStatementResultV_tFZ_0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v89, v90);
    return sub_259ED1170((uint64_t)v28, &qword_26A3F8878);
  }
  uint64_t v97 = sub_259EFE820();
  uint64_t v99 = v98;
  (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v93, v94);
  uint64_t v96 = v117;
  if (!v99) {
    goto LABEL_70;
  }
  if (v97 == 0x6F7365526E616C70 && v99 == 0xEE006E6F6974756CLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v100 = sub_259EFEF50();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v100 & 1) == 0) {
      goto LABEL_70;
    }
  }
  uint64_t v101 = v96[8];
  BOOL v44 = __OFADD__(v101, 1);
  uint64_t v102 = v101 + 1;
  if (!v44)
  {
    v96[8] = v102;
    goto LABEL_70;
  }
LABEL_80:
  __break(1u);
  return result;
}

uint64_t RequestGrainDimensionsSpec.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RequestGrainDimensionsSpec.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 144, 7);
}

double sub_259EF0B78()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 128) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 136) = v2;
  return result;
}

uint64_t sub_259EF0BA0()
{
  return sub_259EEFCC0();
}

uint64_t type metadata accessor for IERequestGrainSpec()
{
  return self;
}

uint64_t method lookup function for IERequestGrainSpec(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IERequestGrainSpec);
}

uint64_t type metadata accessor for RequestGrainDimensionsSpec()
{
  return self;
}

uint64_t method lookup function for RequestGrainDimensionsSpec(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RequestGrainDimensionsSpec);
}

BOOL sub_259EF0C3C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - v7;
  sub_259EFE7D0();
  uint64_t v9 = sub_259EFE8B0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9) == 1)
  {
    sub_259ED1170((uint64_t)v2, &qword_26A3F8870);
    uint64_t v11 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  else
  {
    sub_259EFE8A0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v2, v9);
    uint64_t v12 = sub_259EFE920();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
    {
      sub_259ED0B9C((uint64_t)v8, (uint64_t)v6);
      BOOL v14 = (*(unsigned int (**)(char *, uint64_t))(v13 + 88))(v6, v12) == *MEMORY[0x263F51718];
      (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
      goto LABEL_6;
    }
  }
  BOOL v14 = 0;
LABEL_6:
  sub_259ED1170((uint64_t)v8, &qword_26A3F8878);
  return v14;
}

uint64_t IEPlannerGrainCalculator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t IEPlannerGrainCalculator.init()()
{
  return v0;
}

uint64_t sub_259EF0EEC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  if (result)
  {
    sub_259EF8DC0(a2, a3, a4, a5, a6, a7, (uint64_t)__src);
    swift_beginAccess();
    uint64_t v9 = *a9;
    sub_259EF2DD4((uint64_t)__src);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a9 = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v9 = sub_259EE99C4(0, v9[2] + 1, 1, v9);
      *a9 = v9;
    }
    unint64_t v12 = v9[2];
    unint64_t v11 = v9[3];
    if (v12 >= v11 >> 1)
    {
      uint64_t v9 = sub_259EE99C4((void *)(v11 > 1), v12 + 1, 1, v9);
      *a9 = v9;
    }
    v9[2] = v12 + 1;
    memcpy(&v9[52 * v12 + 4], __src, 0x1A0uLL);
    swift_endAccess();
    return sub_259EF2E60((uint64_t)__src);
  }
  return result;
}

uint64_t IEPlannerGrainCalculator.deinit()
{
  return v0;
}

uint64_t IEPlannerGrainCalculator.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

char *sub_259EF1020(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v116 = a6;
  uint64_t v106 = a4;
  uint64_t v107 = a5;
  uint64_t v129 = a1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v104 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_259EFEC00();
  uint64_t v101 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v113 = (char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  int64_t v105 = (char *)&v100 - v18;
  uint64_t v112 = sub_259EFE840();
  uint64_t v130 = *(void *)(v112 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v112);
  uint64_t v125 = (char *)&v100 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v100 - v21;
  uint64_t v23 = sub_259EFE7A0();
  uint64_t v127 = *(void *)(v23 - 8);
  uint64_t v128 = (void (*)(char *, unint64_t, uint64_t))v23;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v100 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_259EFE750();
  uint64_t v102 = *(void *)(v26 - 8);
  uint64_t v103 = v26;
  MEMORY[0x270FA5388](v26);
  uint64_t v108 = (uint64_t)&v100 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A3F87B8 != -1) {
    swift_once();
  }
  uint64_t v115 = a2;
  uint64_t v28 = __swift_project_value_buffer(v15, (uint64_t)qword_26A3F8B18);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v121 = v28;
  uint64_t v29 = sub_259EFEBF0();
  os_log_type_t v30 = sub_259EFEDD0();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v122 = v15;
  unint64_t v123 = a7;
  unint64_t v114 = a3;
  uint64_t v111 = v12;
  *(void *)&long long v124 = v22;
  if (v31)
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v133[0] = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    swift_bridgeObjectRetain();
    v131[0] = sub_259ED2D5C(v115, a3, v133);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    v131[0] = sub_259ED2D5C(v116, a7, v133);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v29, v30, "start for sessionId: %s clientRequestId: %s", (uint8_t *)v32, 0x16u);
    uint64_t v34 = MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    uint64_t v35 = v33;
    uint64_t v15 = v122;
    MEMORY[0x25A2EF270](v35, -1, -1);
    uint64_t v36 = v32;
    uint64_t v22 = (char *)v124;
    MEMORY[0x25A2EF270](v36, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v34 = MEMORY[0x263F8EE58];
  }
  uint64_t v37 = v105;
  uint64_t v134 = (void *)MEMORY[0x263F8EE78];
  (*(void (**)(uint64_t, void *, uint64_t))(v102 + 16))(v108, v129, v103);
  sub_259EFE740();
  uint64_t v38 = sub_259EFE790();
  (*(void (**)(char *, void (*)(char *, unint64_t, uint64_t)))(v127 + 8))(v25, v128);
  uint64_t v40 = *(char **)(v38 + 16);
  uint64_t v41 = v112;
  if (v40)
  {
    uint64_t v42 = 0;
    uint64_t v128 = *(void (**)(char *, unint64_t, uint64_t))(v130 + 16);
    unint64_t v43 = (*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80);
    uint64_t v100 = v38;
    unint64_t v44 = v38 + v43;
    uint64_t v120 = *(void *)(v130 + 72);
    unint64_t v119 = (void (**)(char *, uint64_t, uint64_t))(v101 + 16);
    v130 += 16;
    uint64_t v127 = v130 - 8;
    uint64_t v118 = (void (**)(char *, uint64_t))(v101 + 8);
    *(void *)&long long v39 = 136315138;
    long long v110 = v39;
    uint64_t v109 = v34 + 8;
    unint64_t v45 = v123;
    while (1)
    {
      uint64_t v126 = (void (**)(char *, uint64_t))v40;
      v128(v22, v44, v41);
      if (sub_259EFC004())
      {
        uint64_t v46 = v125;
        if (v42)
        {
          swift_retain();
          sub_259EF8DC0(v115, v114, v106, v107, v116, v45, (uint64_t)v133);
          memcpy(v131, v133, sizeof(v131));
          swift_beginAccess();
          uint64_t v47 = v134;
          sub_259EF2DD4((uint64_t)v131);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v47 = sub_259EE99C4(0, v47[2] + 1, 1, v47);
          }
          unint64_t v49 = v47[2];
          unint64_t v48 = v47[3];
          if (v49 >= v48 >> 1) {
            uint64_t v47 = sub_259EE99C4((void *)(v48 > 1), v49 + 1, 1, v47);
          }
          _OWORD v47[2] = v49 + 1;
          memcpy(&v47[52 * v49 + 4], v131, 0x1A0uLL);
          uint64_t v134 = v47;
          swift_endAccess();
          sub_259EF2E60((uint64_t)v131);
          swift_release();
          uint64_t v46 = v125;
          uint64_t v22 = (char *)v124;
        }
        type metadata accessor for IEPlannerGrainSpec();
        swift_allocObject();
        uint64_t v50 = sub_259EF91D8();
        swift_release();
        uint64_t v42 = v50;
      }
      else
      {
        uint64_t v46 = v125;
      }
      (*v119)(v37, v121, v15);
      v128(v46, (unint64_t)v22, v41);
      uint64_t v51 = sub_259EFEBF0();
      uint64_t v52 = v15;
      os_log_type_t v53 = sub_259EFEDD0();
      if (os_log_type_enabled(v51, v53))
      {
        uint64_t v129 = v42;
        uint64_t v54 = swift_slowAlloc();
        uint64_t v117 = swift_slowAlloc();
        v133[0] = v117;
        *(_DWORD *)uint64_t v54 = v110;
        uint64_t v55 = (uint64_t)v111;
        sub_259EFE7D0();
        uint64_t v56 = sub_259EFE8B0();
        uint64_t v57 = *(void *)(v56 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v55, 1, v56) == 1)
        {
          sub_259ED1170(v55, &qword_26A3F8870);
          unint64_t v58 = 0xE300000000000000;
          uint64_t v59 = 7104878;
          unint64_t v45 = v123;
        }
        else
        {
          uint64_t v62 = (uint64_t)v104;
          sub_259EFE8A0();
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v56);
          uint64_t v63 = sub_259EFE920();
          uint64_t v64 = *(void *)(v63 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v62, 1, v63) == 1)
          {
            sub_259ED1170(v62, &qword_26A3F8878);
            unint64_t v58 = 0xE300000000000000;
            uint64_t v59 = 7104878;
          }
          else
          {
            uint64_t v59 = sub_259EFE910();
            unint64_t v58 = v65;
            (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v62, v63);
          }
          unint64_t v45 = v123;
          uint64_t v37 = v105;
        }
        *(void *)(v54 + 4) = sub_259ED2D5C(v59, v58, v133);
        swift_bridgeObjectRelease();
        uint64_t v61 = *(void (**)(char *, uint64_t))v127;
        uint64_t v41 = v112;
        (*(void (**)(char *, uint64_t))v127)(v125, v112);
        _os_log_impl(&dword_259EC8000, v51, v53, "handling event %s", (uint8_t *)v54, 0xCu);
        uint64_t v66 = v117;
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v66, -1, -1);
        MEMORY[0x25A2EF270](v54, -1, -1);

        uint64_t v15 = v122;
        (*v118)(v37, v122);
        uint64_t v42 = v129;
        uint64_t v22 = (char *)v124;
        if (!v129) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t v60 = v46;
        uint64_t v61 = *(void (**)(char *, uint64_t))v127;
        (*(void (**)(char *, uint64_t))v127)(v60, v41);

        (*v118)(v37, v52);
        uint64_t v15 = v52;
        uint64_t v22 = (char *)v124;
        if (!v42) {
          goto LABEL_8;
        }
      }
      swift_retain();
      sub_259EF73E8((uint64_t)v22);
      swift_release();
LABEL_8:
      v61(v22, v41);
      v44 += v120;
      uint64_t v40 = (char *)v126 - 1;
      if (v126 == (void (**)(char *, uint64_t))1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v42 = 0;
  unint64_t v45 = v123;
LABEL_31:
  uint64_t v67 = swift_retain();
  uint64_t v68 = v115;
  uint64_t v69 = v116;
  int64_t v70 = v42;
  unint64_t v71 = v114;
  uint64_t v72 = v108;
  sub_259EF0EEC(v67, v115, v114, v106, v107, v116, v45, v108, &v134);
  uint64_t v129 = v70;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v72, v103);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v73 = sub_259EFEBF0();
  os_log_type_t v74 = sub_259EFEDD0();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = v68;
    uint64_t v76 = swift_slowAlloc();
    uint64_t v77 = swift_slowAlloc();
    v133[0] = v77;
    *(_DWORD *)uint64_t v76 = 136315394;
    swift_bridgeObjectRetain();
    v131[0] = sub_259ED2D5C(v75, v71, v133);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v76 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v15 = v122;
    v131[0] = sub_259ED2D5C(v69, v45, v133);
    sub_259EFEE10();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259EC8000, v73, v74, "end for sessionId: %s clientRequestId: %s", (uint8_t *)v76, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v77, -1, -1);
    MEMORY[0x25A2EF270](v76, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  unint64_t v78 = v71;
  id v79 = v113;
  swift_beginAccess();
  uint64_t v80 = (char *)v134;
  uint64_t v81 = v134[2];
  if (v81)
  {
    uint64_t v126 = (void (**)(char *, uint64_t))(v101 + 8);
    uint64_t v127 = v101 + 16;
    swift_bridgeObjectRetain();
    uint64_t v130 = v81 - 1;
    uint64_t v82 = 32;
    *(void *)&long long v83 = 136315906;
    long long v124 = v83;
    uint64_t v121 = MEMORY[0x263F8EE58] + 8;
    uint64_t v125 = v80;
    while (1)
    {
      uint64_t v128 = (void (*)(char *, unint64_t, uint64_t))v82;
      memcpy(v133, &v80[v82], sizeof(v133));
      sub_259EF2DD4((uint64_t)v133);
      if (qword_26A3F87B0 != -1) {
        swift_once();
      }
      uint64_t v84 = __swift_project_value_buffer(v15, (uint64_t)qword_26A3F8B00);
      (*(void (**)(char *, uint64_t, uint64_t))v127)(v79, v84, v15);
      sub_259EF2DD4((uint64_t)v133);
      sub_259EF2DD4((uint64_t)v133);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_259EF2DD4((uint64_t)v133);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_259EF2DD4((uint64_t)v133);
      uint64_t v85 = sub_259EFEBF0();
      os_log_type_t v86 = sub_259EFEDD0();
      if (os_log_type_enabled(v85, v86))
      {
        uint64_t v87 = v133[10];
        uint64_t v88 = v133[11];
        uint64_t v89 = swift_slowAlloc();
        uint64_t v90 = swift_slowAlloc();
        uint64_t v132 = v90;
        *(_DWORD *)uint64_t v89 = v124;
        swift_bridgeObjectRetain();
        *(void *)(v89 + 4) = sub_259ED2D5C(v115, v78, &v132);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v89 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v89 + 14) = sub_259ED2D5C(v116, v45, &v132);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v89 + 22) = 2080;
        if (v88)
        {
          unint64_t v91 = v88;
        }
        else
        {
          uint64_t v87 = 7104878;
          unint64_t v91 = 0xE300000000000000;
        }
        swift_bridgeObjectRetain();
        *(void *)(v89 + 24) = sub_259ED2D5C(v87, v91, &v132);
        swift_bridgeObjectRelease();
        sub_259EF2E60((uint64_t)v133);
        sub_259EF2E60((uint64_t)v133);
        *(_WORD *)(v89 + 32) = 2080;
        memcpy(v131, v133, sizeof(v131));
        unint64_t v92 = sub_259EDF650();
        memcpy(v131, v133, sizeof(v131));
        unint64_t v93 = sub_259EDFD28();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v131[0] = v92;
        sub_259EE2250(v93, (uint64_t)sub_259EE21FC, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v131);
        swift_bridgeObjectRelease();
        uint64_t v95 = sub_259EFEC30();
        unint64_t v97 = v96;
        swift_bridgeObjectRelease();
        *(void *)(v89 + 34) = sub_259ED2D5C(v95, v97, &v132);
        swift_bridgeObjectRelease();
        sub_259EF2E60((uint64_t)v133);
        sub_259EF2E60((uint64_t)v133);
        _os_log_impl(&dword_259EC8000, v85, v86, "computed for sessionId: %s clientRequestId: %s %s\n%s", (uint8_t *)v89, 0x2Au);
        swift_arrayDestroy();
        MEMORY[0x25A2EF270](v90, -1, -1);
        MEMORY[0x25A2EF270](v89, -1, -1);

        sub_259EF2E60((uint64_t)v133);
        id v79 = v113;
        uint64_t v15 = v122;
        (*v126)(v113, v122);
        unint64_t v45 = v123;
        unint64_t v78 = v114;
        uint64_t v80 = v125;
        uint64_t v98 = v130;
        if (!v130)
        {
LABEL_46:
          swift_bridgeObjectRelease();
          uint64_t v80 = (char *)v134;
          break;
        }
      }
      else
      {
        sub_259EF2E60((uint64_t)v133);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        sub_259EF2E60((uint64_t)v133);
        sub_259EF2E60((uint64_t)v133);
        sub_259EF2E60((uint64_t)v133);
        sub_259EF2E60((uint64_t)v133);

        (*v126)(v79, v15);
        uint64_t v98 = v130;
        if (!v130) {
          goto LABEL_46;
        }
      }
      uint64_t v130 = v98 - 1;
      uint64_t v82 = (uint64_t)v128 + 416;
    }
  }
  swift_release();
  return v80;
}

uint64_t sub_259EF2100()
{
  uint64_t v0 = sub_259EFE750();
  uint64_t v98 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v107 = (char *)v82 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A98);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (void *)((char *)v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (void *)((char *)v82 - v6);
  unint64_t v8 = sub_259EFE780();
  uint64_t v87 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v105 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v93 = (void *)((char *)v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (void *)((char *)v82 - v13);
  if (qword_26A3F87B8 != -1) {
    goto LABEL_89;
  }
  while (1)
  {
    uint64_t v15 = sub_259EFEC00();
    v82[1] = __swift_project_value_buffer(v15, (uint64_t)qword_26A3F8B18);
    uint64_t v16 = sub_259EFEBF0();
    os_log_type_t v17 = sub_259EFEDD0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_259EC8000, v16, v17, "calculator start", v18, 2u);
      MEMORY[0x25A2EF270](v18, -1, -1);
    }

    uint64_t v109 = (void *)MEMORY[0x263F8EE78];
    uint64_t v19 = sub_259EFE7B0();
    int64_t v92 = 0;
    uint64_t v20 = *(void *)(v19 + 64);
    uint64_t v83 = v19 + 64;
    uint64_t v86 = v19;
    uint64_t v21 = 1 << *(unsigned char *)(v19 + 32);
    uint64_t v22 = v21 < 64 ? ~(-1 << v21) : -1;
    unint64_t v23 = v22 & v20;
    uint64_t v85 = v87 + 16;
    unint64_t v91 = (void (**)(char *, char *, unint64_t))(v87 + 32);
    uint64_t v97 = v98 + 16;
    uint64_t v100 = (void (**)(char *, uint64_t))(v98 + 8);
    uint64_t v101 = (void (**)(char *, char *, uint64_t))(v98 + 32);
    uint64_t v89 = (void (**)(char *, unint64_t))(v87 + 8);
    int64_t v84 = (unint64_t)(v21 + 63) >> 6;
    v82[0] = v84 - 1;
    uint64_t v103 = v7;
    unint64_t v90 = v8;
LABEL_9:
    uint64_t v24 = (uint64_t)v93;
    if (!v23) {
      break;
    }
    uint64_t v94 = (v23 - 1) & v23;
    unint64_t v25 = __clz(__rbit64(v23)) | (v92 << 6);
LABEL_11:
    uint64_t v26 = *(void *)(v86 + 56);
    uint64_t v27 = (void *)(*(void *)(v86 + 48) + 16 * v25);
    uint64_t v28 = v27[1];
    uint64_t v24 = (uint64_t)v93;
    *unint64_t v93 = *v27;
    *(void *)(v24 + 8) = v28;
    uint64_t v29 = v87;
    uint64_t v30 = v26 + *(void *)(v87 + 72) * v25;
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    (*(void (**)(uint64_t, uint64_t, unint64_t))(v29 + 16))(v24 + *(int *)(v31 + 48), v30, v8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v24, 0, 1, v31);
    swift_bridgeObjectRetain();
LABEL_30:
    sub_259EDDCBC(v24, (uint64_t)v14, &qword_26A3F8AA0);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v14, 1, v36) == 1)
    {
      swift_release();
      os_log_type_t v74 = v109;
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_259EFEBF0();
      os_log_type_t v76 = sub_259EFEDD0();
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v77 = 134217984;
        uint64_t v108 = v74[2];
        sub_259EFEE10();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259EC8000, v75, v76, "computed metrics for %ld requests", v77, 0xCu);
        MEMORY[0x25A2EF270](v77, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      unint64_t v78 = sub_259EFEBF0();
      os_log_type_t v79 = sub_259EFEDD0();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v80 = 0;
        _os_log_impl(&dword_259EC8000, v78, v79, "calculator end", v80, 2u);
        MEMORY[0x25A2EF270](v80, -1, -1);
      }

      swift_beginAccess();
      return (uint64_t)v109;
    }
    uint64_t v102 = *v14;
    unint64_t v104 = v14[1];
    (*v91)(v105, (char *)v14 + *(int *)(v36 + 48), v8);
    uint64_t v37 = sub_259EFE770();
    int64_t v106 = 0;
    uint64_t v38 = *(void *)(v37 + 64);
    uint64_t v95 = v37 + 64;
    uint64_t v99 = v37;
    uint64_t v39 = 1 << *(unsigned char *)(v37 + 32);
    if (v39 < 64) {
      uint64_t v40 = ~(-1 << v39);
    }
    else {
      uint64_t v40 = -1;
    }
    unint64_t v8 = v40 & v38;
    int64_t v96 = (unint64_t)(v39 + 63) >> 6;
    int64_t v88 = v96 - 1;
    uint64_t v41 = v103;
    uint64_t v7 = &qword_26A3F8AB0;
    while (1)
    {
      if (v8)
      {
        unint64_t v42 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v43 = v42 | (v106 << 6);
        goto LABEL_39;
      }
      int64_t v50 = v106 + 1;
      if (__OFADD__(v106, 1)) {
        goto LABEL_86;
      }
      if (v50 < v96)
      {
        unint64_t v51 = *(void *)(v95 + 8 * v50);
        if (v51) {
          goto LABEL_43;
        }
        int64_t v52 = v106 + 2;
        ++v106;
        if (v50 + 1 < v96)
        {
          unint64_t v51 = *(void *)(v95 + 8 * v52);
          if (v51) {
            goto LABEL_46;
          }
          int64_t v106 = v50 + 1;
          if (v50 + 2 < v96)
          {
            unint64_t v51 = *(void *)(v95 + 8 * (v50 + 2));
            if (v51)
            {
              v50 += 2;
LABEL_43:
              unint64_t v8 = (v51 - 1) & v51;
              unint64_t v43 = __clz(__rbit64(v51)) + (v50 << 6);
              int64_t v106 = v50;
LABEL_39:
              uint64_t v44 = v98;
              uint64_t v45 = *(void *)(v99 + 56);
              uint64_t v46 = (uint64_t *)(*(void *)(v99 + 48) + 16 * v43);
              uint64_t v47 = v46[1];
              uint64_t *v5 = *v46;
              v5[1] = v47;
              uint64_t v48 = v45 + *(void *)(v44 + 72) * v43;
              uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
              (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))((char *)v5 + *(int *)(v49 + 48), v48, v0);
              (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v5, 0, 1, v49);
              swift_bridgeObjectRetain();
              goto LABEL_58;
            }
            int64_t v52 = v50 + 3;
            int64_t v106 = v50 + 2;
            if (v50 + 3 < v96) {
              break;
            }
          }
        }
      }
LABEL_57:
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v5, 1, 1, v53);
      unint64_t v8 = 0;
LABEL_58:
      sub_259EDDCBC((uint64_t)v5, (uint64_t)v41, &qword_26A3F8A98);
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AB0);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48))(v41, 1, v54) == 1)
      {
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v8 = v90;
        (*v89)(v105, v90);
        unint64_t v23 = v94;
        goto LABEL_9;
      }
      uint64_t v7 = v5;
      uint64_t v5 = v14;
      uint64_t v55 = *v41;
      unint64_t v56 = v41[1];
      uint64_t v57 = (char *)v41 + *(int *)(v54 + 48);
      uint64_t v14 = (uint64_t *)v107;
      uint64_t v58 = v0;
      (*v101)(v107, v57, v0);
      uint64_t v59 = sub_259EFE760();
      uint64_t v61 = sub_259EF1020(v14, v102, v104, v59, v60, v55, v56);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v62 = *((void *)v61 + 2);
      uint64_t v63 = v109;
      int64_t v64 = v109[2];
      uint64_t v0 = v64 + v62;
      if (__OFADD__(v64, v62))
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
        goto LABEL_87;
      }
      char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v0 > v63[3] >> 1)
      {
        if (v64 <= v0) {
          int64_t v66 = v64 + v62;
        }
        else {
          int64_t v66 = v64;
        }
        uint64_t v63 = sub_259EE99C4(isUniquelyReferenced_nonNull_native, v66, 1, v63);
      }
      uint64_t v0 = v58;
      uint64_t v14 = v5;
      unint64_t v67 = *((void *)v61 + 2);
      uint64_t v5 = v7;
      uint64_t v41 = v103;
      if (v67)
      {
        uint64_t v68 = v63[2];
        uint64_t v7 = &qword_26A3F8AB0;
        if ((v63[3] >> 1) - v68 < (uint64_t)v67) {
          goto LABEL_84;
        }
        unint64_t v69 = (unint64_t)&v63[52 * v68 + 4];
        if ((unint64_t)(v61 + 32) < v69 + 416 * v67 && v69 < (unint64_t)&v61[416 * v67 + 32]) {
          goto LABEL_91;
        }
        swift_arrayInitWithCopy();
        if (v67 < v62) {
          goto LABEL_83;
        }
        uint64_t v71 = v63[2];
        BOOL v72 = __OFADD__(v71, v67);
        uint64_t v73 = v71 + v67;
        if (v72) {
          goto LABEL_85;
        }
        v63[2] = v73;
      }
      else
      {
        uint64_t v7 = &qword_26A3F8AB0;
        if (v62) {
          goto LABEL_83;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v109 = v63;
      (*v100)(v107, v0);
    }
    unint64_t v51 = *(void *)(v95 + 8 * v52);
    if (v51)
    {
LABEL_46:
      int64_t v50 = v52;
      goto LABEL_43;
    }
    while (1)
    {
      int64_t v50 = v52 + 1;
      if (__OFADD__(v52, 1)) {
        break;
      }
      if (v50 >= v96)
      {
        int64_t v106 = v88;
        goto LABEL_57;
      }
      unint64_t v51 = *(void *)(v95 + 8 * v50);
      ++v52;
      if (v51) {
        goto LABEL_43;
      }
    }
LABEL_88:
    __break(1u);
LABEL_89:
    swift_once();
  }
  int64_t v32 = v92 + 1;
  if (__OFADD__(v92, 1))
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  if (v32 >= v84)
  {
LABEL_29:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8AA8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v24, 1, 1, v35);
    uint64_t v94 = 0;
    goto LABEL_30;
  }
  unint64_t v33 = *(void *)(v83 + 8 * v32);
  if (v33)
  {
LABEL_15:
    uint64_t v94 = (v33 - 1) & v33;
    unint64_t v25 = __clz(__rbit64(v33)) + (v32 << 6);
    int64_t v92 = v32;
    goto LABEL_11;
  }
  int64_t v34 = v92 + 2;
  ++v92;
  if (v32 + 1 >= v84) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v83 + 8 * v34);
  if (v33) {
    goto LABEL_18;
  }
  int64_t v92 = v32 + 1;
  if (v32 + 2 >= v84) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v83 + 8 * (v32 + 2));
  if (v33)
  {
    v32 += 2;
    goto LABEL_15;
  }
  int64_t v34 = v32 + 3;
  int64_t v92 = v32 + 2;
  if (v32 + 3 >= v84) {
    goto LABEL_29;
  }
  unint64_t v33 = *(void *)(v83 + 8 * v34);
  if (v33)
  {
LABEL_18:
    int64_t v32 = v34;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v32 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v32 >= v84)
    {
      int64_t v92 = v82[0];
      goto LABEL_29;
    }
    unint64_t v33 = *(void *)(v83 + 8 * v32);
    ++v34;
    if (v33) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_91:
  uint64_t result = sub_259EFEF20();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for IEPlannerGrainCalculator()
{
  return self;
}

uint64_t method lookup function for IEPlannerGrainCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IEPlannerGrainCalculator);
}

uint64_t dispatch thunk of IEPlannerGrainCalculator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of IEPlannerGrainCalculator.extractMetrics(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t sub_259EF2DD4(uint64_t a1)
{
  return a1;
}

uint64_t sub_259EF2E60(uint64_t a1)
{
  return a1;
}

uint64_t sub_259EF2EEC(uint64_t a1)
{
  swift_beginAccess();
  sub_259EED0EC(v1 + 16, (uint64_t)v11, &qword_26A3F88A0);
  if (v12)
  {
    sub_259ED1078((uint64_t)v11, (uint64_t)v8);
    sub_259ED1170((uint64_t)v11, &qword_26A3F88A0);
    uint64_t v3 = v9;
    uint64_t v4 = v10;
    __swift_project_boxed_opaque_existential_1(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 + 8) + 8))(a1, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  else
  {
    sub_259ED1170((uint64_t)v11, &qword_26A3F88A0);
  }
  swift_beginAccess();
  sub_259EED0EC(v1 + 56, (uint64_t)v11, &qword_26A3F88A0);
  if (!v12) {
    return sub_259ED1170((uint64_t)v11, &qword_26A3F88A0);
  }
  sub_259ED1078((uint64_t)v11, (uint64_t)v8);
  sub_259ED1170((uint64_t)v11, &qword_26A3F88A0);
  uint64_t v5 = v9;
  uint64_t v6 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 + 8) + 8))(a1, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_259EF3068(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_beginAccess();
  sub_259EED0EC(v3 + 16, (uint64_t)v22, &qword_26A3F88A0);
  uint64_t v6 = v23;
  if (v23)
  {
    uint64_t v7 = v24;
    unint64_t v8 = __swift_project_boxed_opaque_existential_1(v22, v23);
    uint64_t v9 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v8);
    uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) + 40;
    (*(void (**)(char *))(v9 + 16))(v11);
    sub_259ED1170((uint64_t)v22, &qword_26A3F88A0);
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
  }
  else
  {
    sub_259ED1170((uint64_t)v22, &qword_26A3F88A0);
    uint64_t v12 = sub_259EFE840();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  swift_beginAccess();
  sub_259EED0EC(v3 + 56, (uint64_t)v22, &qword_26A3F88A0);
  uint64_t v13 = v23;
  if (v23)
  {
    uint64_t v14 = v24;
    uint64_t v15 = __swift_project_boxed_opaque_existential_1(v22, v23);
    uint64_t v16 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v15);
    uint64_t v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0) + 40;
    (*(void (**)(char *))(v16 + 16))(v18);
    sub_259ED1170((uint64_t)v22, &qword_26A3F88A0);
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v13, v14);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v13);
  }
  else
  {
    sub_259ED1170((uint64_t)v22, &qword_26A3F88A0);
    uint64_t v20 = sub_259EFE840();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a2, 1, 1, v20);
  }
}

uint64_t sub_259EF339C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  long long v178 = (char *)&v168 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  long long v177 = (char *)&v168 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v174 = (char *)&v168 - v8;
  MEMORY[0x270FA5388](v7);
  long long v173 = (char *)&v168 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  long long v176 = (void (**)(char *, uint64_t))((char *)&v168 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  long long v175 = (char *)&v168 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  long long v172 = (char *)&v168 - v16;
  MEMORY[0x270FA5388](v15);
  long long v171 = (char *)&v168 - v17;
  uint64_t v18 = sub_259EFEC00();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = ((char *)&v168 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v20);
  long long v179 = (char *)&v168 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  long long v183 = (char *)&v168 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  long long v182 = (char *)&v168 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v168 - v30;
  MEMORY[0x270FA5388](v29);
  unint64_t v33 = (char *)&v168 - v32;
  uint64_t v34 = sub_259EFE840();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  long long v180 = (char *)&v168 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  long long v181 = (char *)&v168 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  long long v184 = (char *)&v168 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v185 = (uint64_t)&v168 - v42;
  uint64_t v43 = v1 + 16;
  swift_beginAccess();
  sub_259EED0EC(v1 + 16, (uint64_t)&v192, &qword_26A3F88A0);
  uint64_t v44 = v193;
  uint64_t v188 = v34;
  uint64_t v189 = v35;
  os_log_t v186 = v22;
  uint64_t v187 = v1;
  if (!v193)
  {
    sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v33, 1, 1, v34);
    uint64_t v31 = v33;
    goto LABEL_14;
  }
  uint64_t v45 = v194;
  uint64_t v46 = __swift_project_boxed_opaque_existential_1(&v192, v193);
  uint64_t v47 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v49 = (char *)&v168 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v47 + 16))(v49);
  sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
  int64_t v50 = *(void (**)(uint64_t, uint64_t))(v45 + 16);
  uint64_t v51 = v45;
  uint64_t v52 = v188;
  v50(v44, v51);
  uint64_t v53 = v49;
  uint64_t v54 = v189;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v53, v44);
  uint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
  if (v55(v33, 1, v52) == 1)
  {
    uint64_t v31 = v33;
    uint64_t v22 = v186;
    uint64_t v1 = v187;
    goto LABEL_14;
  }
  long long v169 = *(void (**)(uint64_t, char *, uint64_t))(v54 + 32);
  v169(v185, v33, v52);
  uint64_t v56 = v187 + 56;
  swift_beginAccess();
  sub_259EED0EC(v56, (uint64_t)&v192, &qword_26A3F88A0);
  uint64_t v57 = v193;
  if (!v193)
  {
    sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v31, 1, 1, v52);
    uint64_t v22 = v186;
    goto LABEL_13;
  }
  uint64_t v58 = v194;
  uint64_t v59 = __swift_project_boxed_opaque_existential_1(&v192, v193);
  uint64_t v168 = (uint64_t)&v168;
  uint64_t v60 = *(void *)(v57 - 8);
  uint64_t v170 = v19;
  uint64_t v61 = v18;
  uint64_t v62 = v60;
  MEMORY[0x270FA5388](v59);
  int64_t v64 = (char *)&v168 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v62 + 16))(v64);
  sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
  unint64_t v65 = *(void (**)(uint64_t, uint64_t))(v58 + 16);
  uint64_t v66 = v58;
  uint64_t v52 = v188;
  v65(v57, v66);
  unint64_t v67 = v64;
  uint64_t v54 = v189;
  (*(void (**)(char *, uint64_t))(v62 + 8))(v67, v57);
  uint64_t v18 = v61;
  uint64_t v19 = v170;
  unsigned int v68 = v55(v31, 1, v52);
  uint64_t v22 = v186;
  if (v68 == 1)
  {
LABEL_13:
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v185, v52);
    uint64_t v1 = v187;
LABEL_14:
    sub_259ED1170((uint64_t)v31, &qword_26A3F8CE8);
    if (qword_26A3F87A8 != -1) {
      swift_once();
    }
    uint64_t v89 = __swift_project_value_buffer(v18, (uint64_t)qword_26A3F8AE8);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v19 + 16))(v22, v89, v18);
    swift_retain_n();
    unint64_t v90 = sub_259EFEBF0();
    os_log_type_t v91 = sub_259EFEDC0();
    if (!os_log_type_enabled(v90, v91))
    {

      swift_release_n();
      (*(void (**)(NSObject *, uint64_t))(v19 + 8))(v22, v18);
      return 0;
    }
    long long v184 = (char *)v18;
    uint64_t v185 = 7104878;
    uint64_t v92 = swift_slowAlloc();
    long long v181 = (char *)swift_slowAlloc();
    uint64_t v191 = v181;
    *(_DWORD *)uint64_t v92 = 136315394;
    sub_259EED0EC(v43, (uint64_t)&v192, &qword_26A3F88A0);
    uint64_t v93 = v193;
    if (!v193)
    {
      sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
      unint64_t v104 = 0xE300000000000000;
      uint64_t v105 = 7104878;
      goto LABEL_31;
    }
    uint64_t v94 = v194;
    uint64_t v95 = __swift_project_boxed_opaque_existential_1(&v192, v193);
    uint64_t v96 = *(void *)(v93 - 8);
    MEMORY[0x270FA5388](v95);
    uint64_t v98 = (char *)&v168 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v96 + 16))(v98);
    sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
    uint64_t v99 = v182;
    (*(void (**)(uint64_t, uint64_t))(v94 + 16))(v93, v94);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v98, v93);
    uint64_t v100 = v188;
    uint64_t v101 = v189;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v189 + 48))(v99, 1, v188) == 1)
    {
      uint64_t v102 = &qword_26A3F8CE8;
      uint64_t v103 = (uint64_t)v99;
    }
    else
    {
      int64_t v106 = v177;
      sub_259EFE7D0();
      (*(void (**)(char *, uint64_t))(v101 + 8))(v99, v100);
      uint64_t v107 = sub_259EFE8B0();
      uint64_t v108 = *(void *)(v107 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48))(v106, 1, v107) != 1)
      {
        uint64_t v109 = v106;
        uint64_t v110 = v19;
        uint64_t v111 = v175;
        sub_259EFE8A0();
        uint64_t v112 = v107;
        uint64_t v113 = (uint64_t)v111;
        (*(void (**)(char *, uint64_t))(v108 + 8))(v109, v112);
        uint64_t v114 = sub_259EFE920();
        uint64_t v115 = *(void *)(v114 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v113, 1, v114) == 1)
        {
          sub_259ED1170(v113, &qword_26A3F8878);
          unint64_t v104 = 0xE300000000000000;
          uint64_t v105 = 7104878;
        }
        else
        {
          uint64_t v105 = sub_259EFE910();
          uint64_t v117 = v113;
          unint64_t v104 = v118;
          (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v117, v114);
        }
        uint64_t v19 = v110;
        goto LABEL_30;
      }
      uint64_t v102 = &qword_26A3F8870;
      uint64_t v103 = (uint64_t)v106;
    }
    sub_259ED1170(v103, v102);
    unint64_t v104 = 0xE300000000000000;
    uint64_t v105 = 7104878;
LABEL_30:
    uint64_t v1 = v187;
LABEL_31:
    v192 = (char *)sub_259ED2D5C(v105, v104, (uint64_t *)&v191);
    sub_259EFEE10();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v92 + 12) = 2080;
    swift_beginAccess();
    sub_259EED0EC(v1 + 56, (uint64_t)&v192, &qword_26A3F88A0);
    uint64_t v119 = v193;
    if (v193)
    {
      uint64_t v120 = v194;
      uint64_t v121 = __swift_project_boxed_opaque_existential_1(&v192, v193);
      uint64_t v122 = *(void *)(v119 - 8);
      MEMORY[0x270FA5388](v121);
      long long v124 = (char *)&v168 - ((v123 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v122 + 16))(v124);
      sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
      uint64_t v125 = (uint64_t)v183;
      (*(void (**)(uint64_t, uint64_t))(v120 + 16))(v119, v120);
      (*(void (**)(char *, uint64_t))(v122 + 8))(v124, v119);
      uint64_t v126 = v188;
      uint64_t v127 = v189;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v189 + 48))(v125, 1, v188) == 1)
      {
        sub_259ED1170(v125, &qword_26A3F8CE8);
        unint64_t v128 = 0xE300000000000000;
        os_log_t v129 = v186;
      }
      else
      {
        uint64_t v130 = v178;
        sub_259EFE7D0();
        (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v125, v126);
        uint64_t v131 = sub_259EFE8B0();
        uint64_t v132 = *(void *)(v131 - 8);
        int v133 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v132 + 48))(v130, 1, v131);
        os_log_t v129 = v186;
        if (v133 == 1)
        {
          uint64_t v134 = &qword_26A3F8870;
          uint64_t v135 = (uint64_t)v130;
        }
        else
        {
          uint64_t v136 = v130;
          uint64_t v137 = v176;
          sub_259EFE8A0();
          uint64_t v138 = v136;
          uint64_t v139 = (uint64_t)v137;
          (*(void (**)(char *, uint64_t))(v132 + 8))(v138, v131);
          uint64_t v140 = sub_259EFE920();
          uint64_t v141 = *(void *)(v140 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v141 + 48))(v139, 1, v140) != 1)
          {
            uint64_t v185 = sub_259EFE910();
            unint64_t v128 = v142;
            (*(void (**)(uint64_t, uint64_t))(v141 + 8))(v139, v140);
            goto LABEL_41;
          }
          uint64_t v134 = &qword_26A3F8878;
          uint64_t v135 = v139;
        }
        sub_259ED1170(v135, v134);
        unint64_t v128 = 0xE300000000000000;
      }
    }
    else
    {
      sub_259ED1170((uint64_t)&v192, &qword_26A3F88A0);
      unint64_t v128 = 0xE300000000000000;
      os_log_t v129 = v186;
    }
LABEL_41:
    v192 = (char *)sub_259ED2D5C(v185, v128, (uint64_t *)&v191);
    sub_259EFEE10();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259EC8000, v90, v91, "calculateInterval - failed for begin: %s, end: %s", (uint8_t *)v92, 0x16u);
    uint64_t v143 = v181;
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v143, -1, -1);
    MEMORY[0x25A2EF270](v92, -1, -1);

    (*(void (**)(os_log_t, char *))(v19 + 8))(v129, v184);
    return 0;
  }
  v169((uint64_t)v184, v31, v52);
  uint64_t v69 = v185;
  uint64_t v70 = sub_259EF6C08();
  LODWORD(v187) = v71;
  uint64_t v72 = v52;
  if (qword_26A3F87A8 != -1) {
    swift_once();
  }
  uint64_t v73 = __swift_project_value_buffer(v18, (uint64_t)qword_26A3F8AE8);
  os_log_type_t v74 = v179;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v179, v73, v18);
  uint64_t v75 = v54;
  os_log_type_t v76 = *(void (**)(char *, uint64_t, uint64_t))(v54 + 16);
  v76(v181, v69, v72);
  uint64_t v77 = v180;
  v76(v180, (uint64_t)v184, v72);
  unint64_t v78 = sub_259EFEBF0();
  int v79 = sub_259EFEDC0();
  if (os_log_type_enabled(v78, (os_log_type_t)v79))
  {
    LODWORD(v183) = v79;
    os_log_t v186 = v78;
    uint64_t v80 = swift_slowAlloc();
    long long v182 = (char *)swift_slowAlloc();
    v192 = v182;
    *(_DWORD *)uint64_t v80 = 136315650;
    uint64_t v81 = (uint64_t)v173;
    uint64_t v82 = v181;
    sub_259EFE7D0();
    uint64_t v83 = sub_259EFE8B0();
    int64_t v84 = *(char **)(v83 - 8);
    uint64_t v85 = (char *)*((void *)v84 + 6);
    long long v178 = v84 + 48;
    long long v177 = v85;
    int v86 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v85)(v81, 1, v83);
    long long v176 = (void (**)(char *, uint64_t))v84;
    if (v86 == 1)
    {
      sub_259ED1170(v81, &qword_26A3F8870);
      unint64_t v87 = 0xE300000000000000;
      uint64_t v88 = 7104878;
    }
    else
    {
      uint64_t v145 = (uint64_t)v171;
      sub_259EFE8A0();
      (*((void (**)(uint64_t, uint64_t))v84 + 1))(v81, v83);
      uint64_t v146 = sub_259EFE920();
      uint64_t v147 = *(void *)(v146 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v147 + 48))(v145, 1, v146) == 1)
      {
        sub_259ED1170(v145, &qword_26A3F8878);
        unint64_t v87 = 0xE300000000000000;
        uint64_t v88 = 7104878;
      }
      else
      {
        uint64_t v148 = sub_259EFE910();
        uint64_t v149 = v145;
        uint64_t v88 = v148;
        unint64_t v87 = v150;
        (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v149, v146);
      }
      uint64_t v82 = v181;
    }
    uint64_t v190 = sub_259ED2D5C(v88, v87, (uint64_t *)&v192);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    long long v151 = *(void (**)(char *, uint64_t))(v189 + 8);
    v189 += 8;
    v151(v82, v188);
    *(_WORD *)(v80 + 12) = 2080;
    uint64_t v152 = v174;
    sub_259EFE7D0();
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v177)(v152, 1, v83) == 1)
    {
      uint64_t v153 = &qword_26A3F8870;
      uint64_t v154 = (uint64_t)v152;
    }
    else
    {
      long long v155 = v172;
      sub_259EFE8A0();
      v176[1](v152, v83);
      uint64_t v156 = sub_259EFE920();
      uint64_t v157 = *(void *)(v156 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v157 + 48))(v155, 1, v156) != 1)
      {
        uint64_t v160 = sub_259EFE910();
        unint64_t v158 = v161;
        (*(void (**)(char *, uint64_t))(v157 + 8))(v155, v156);
        id v159 = v180;
        goto LABEL_54;
      }
      uint64_t v153 = &qword_26A3F8878;
      uint64_t v154 = (uint64_t)v155;
    }
    sub_259ED1170(v154, v153);
    unint64_t v158 = 0xE300000000000000;
    id v159 = v180;
    uint64_t v160 = 7104878;
LABEL_54:
    uint64_t v190 = sub_259ED2D5C(v160, v158, (uint64_t *)&v192);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    unint64_t v162 = v159;
    uint64_t v163 = v188;
    v151(v162, v188);
    *(_WORD *)(v80 + 22) = 2080;
    uint64_t v164 = sub_259EFED90();
    uint64_t v190 = sub_259ED2D5C(v164, v165, (uint64_t *)&v192);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    os_log_t v166 = v186;
    _os_log_impl(&dword_259EC8000, v186, (os_log_type_t)v183, "calculateInterval - begin: %s, end: %s, duration: %s", (uint8_t *)v80, 0x20u);
    long long v167 = v182;
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v167, -1, -1);
    MEMORY[0x25A2EF270](v80, -1, -1);

    (*(void (**)(char *, uint64_t))(v170 + 8))(v179, v18);
    v151(v184, v163);
    v151((char *)v185, v163);
    return v70;
  }

  uint64_t v116 = *(void (**)(char *, uint64_t))(v75 + 8);
  v116(v77, v72);
  v116(v181, v72);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v74, v18);
  v116(v184, v72);
  v116((char *)v185, v72);
  return v70;
}

uint64_t IETranscriptLatencyIntervalSpec.deinit()
{
  sub_259ED1170(v0 + 16, &qword_26A3F88A0);
  sub_259ED1170(v0 + 56, &qword_26A3F88A0);
  return v0;
}

uint64_t IETranscriptLatencyIntervalSpec.__deallocating_deinit()
{
  sub_259ED1170(v0 + 16, &qword_26A3F88A0);
  sub_259ED1170(v0 + 56, &qword_26A3F88A0);
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t sub_259EF4A98(uint64_t a1)
{
  return sub_259EF2EEC(a1);
}

uint64_t sub_259EF4ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for IETranscriptLatencyIntervalSpec()
{
  return self;
}

uint64_t method lookup function for IETranscriptLatencyIntervalSpec(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IETranscriptLatencyIntervalSpec);
}

uint64_t sub_259EF4B0C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_259EF4B24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v136 = (uint64_t)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v135 = (char *)&v124 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8890);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v137 = (char *)&v124 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v124 - v9;
  uint64_t v140 = sub_259EFE840();
  uint64_t v146 = *(void *)(v140 - 8);
  MEMORY[0x270FA5388](v140);
  uint64_t v12 = (char *)&v124 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)sub_259EFEC00();
  uint64_t v142 = *(v13 - 1);
  uint64_t v143 = (void (*)(void, void, void))v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v124 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v124 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v124 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_259EFE8F0();
  uint64_t v148 = *(void *)(v150 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v150);
  uint64_t v141 = (char *)&v124 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v144 = (char *)&v124 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v139 = (char *)&v124 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v145 = (char *)&v124 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v124 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v124 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v149 = (char *)&v124 - v36;
  uint64_t v147 = a1;
  sub_259EFE7D0();
  uint64_t v37 = sub_259EFE8B0();
  uint64_t v38 = *(void *)(v37 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v18, 1, v37) == 1) {
    return sub_259ED1170((uint64_t)v18, &qword_26A3F8870);
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v18, v37);
  uint64_t v40 = sub_259EFE920();
  uint64_t v41 = *(void *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v21, 1, v40) == 1) {
    return sub_259ED1170((uint64_t)v21, &qword_26A3F8878);
  }
  sub_259EFE900();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v40);
  uint64_t v43 = v148;
  uint64_t v42 = v149;
  uint64_t v44 = v150;
  (*(void (**)(char *, char *, uint64_t))(v148 + 32))(v149, v35, v150);
  uint64_t v45 = *MEMORY[0x263F51678];
  uint64_t v46 = v43 + 104;
  int v133 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 104);
  v133(v32, v45, v44);
  char v47 = sub_259EFE8E0();
  int64_t v50 = *(uint64_t (**)(char *, uint64_t))(v43 + 8);
  uint64_t v48 = v43 + 8;
  uint64_t v49 = v50;
  v50(v32, v44);
  if ((v47 & 1) == 0) {
    return v49(v42, v44);
  }
  uint64_t v134 = v49;
  uint64_t v132 = v48;
  if (qword_26A3F87A8 != -1) {
    swift_once();
  }
  uint64_t v51 = v143;
  uint64_t v52 = __swift_project_value_buffer((uint64_t)v143, (uint64_t)qword_26A3F8AE8);
  uint64_t v53 = v142;
  uint64_t v54 = *(void (**)(char *))(v142 + 16);
  uint64_t v127 = v52;
  v54(v15);
  uint64_t v55 = v146;
  uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v146 + 16);
  uint64_t v57 = v140;
  uint64_t v129 = v146 + 16;
  unint64_t v128 = v56;
  v56(v12, v147, v140);
  uint64_t v58 = sub_259EFEBF0();
  int v130 = sub_259EFEDC0();
  BOOL v59 = os_log_type_enabled(v58, (os_log_type_t)v130);
  uint64_t v131 = v46;
  if (v59)
  {
    os_log_t v126 = v58;
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    uint64_t v125 = swift_slowAlloc();
    v152[0] = v125;
    *(_DWORD *)uint64_t v60 = 136315138;
    sub_259EFE830();
    uint64_t v61 = sub_259EFE9A0();
    uint64_t v62 = *(void *)(v61 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v10, 1, v61) == 1)
    {
      sub_259ED1170((uint64_t)v10, &qword_26A3F8890);
      unint64_t v63 = 0xE300000000000000;
      uint64_t v64 = 7104878;
    }
    else
    {
      uint64_t v64 = sub_259EFE820();
      unint64_t v63 = v65;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v10, v61);
    }
    uint64_t v151 = sub_259ED2D5C(v64, v63, v152);
    sub_259EFEE10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v146 + 8))(v12, v57);
    os_log_t v66 = v126;
    _os_log_impl(&dword_259EC8000, v126, (os_log_type_t)v130, "handleStatementEvaluated, sender: %s", v60, 0xCu);
    uint64_t v67 = v125;
    swift_arrayDestroy();
    MEMORY[0x25A2EF270](v67, -1, -1);
    MEMORY[0x25A2EF270](v60, -1, -1);

    (*(void (**)(char *, void (*)(void, void, void)))(v142 + 8))(v15, v143);
    uint64_t v44 = v150;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v55 + 8))(v12, v57);

    (*(void (**)(char *, void (*)(void, void, void)))(v53 + 8))(v15, v51);
  }
  unsigned int v68 = v134;
  uint64_t v69 = (uint64_t)v137;
  sub_259EFE830();
  uint64_t v70 = sub_259EFE9A0();
  uint64_t v71 = *(void *)(v70 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v69, 1, v70) == 1)
  {
    sub_259ED1170(v69, &qword_26A3F8890);
    return v68(v149, v44);
  }
  uint64_t v72 = sub_259EFE820();
  os_log_type_t v74 = v73;
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v69, v70);
  if (v72 == 0x726F747563657865 && v74 == (char *)0xE800000000000000 || (sub_259EFEF50() & 1) != 0)
  {
    uint64_t v132 = v72;
    uint64_t v137 = v74;
    uint64_t v75 = *(void *)(v138 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes);
    v133(v145, *MEMORY[0x263F516B0], v44);
    uint64_t v76 = *(void *)(v75 + 16);
    uint64_t v142 = v75;
    if (v76)
    {
      unint64_t v77 = (*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80);
      unint64_t v78 = v139;
      uint64_t v143 = *(void (**)(void, void, void))(v148 + 16);
      v143(v139, v75 + v77, v44);
      sub_259EF6AE0();
      swift_bridgeObjectRetain();
      char v79 = sub_259EFEC70();
      v68(v78, v44);
      if (v79)
      {
LABEL_23:
        uint64_t v44 = v150;
        unsigned int v68 = v134;
        v134(v145, v150);
        swift_bridgeObjectRelease();
        uint64_t v80 = sub_259EFEBF0();
        os_log_type_t v81 = sub_259EFEDC0();
        BOOL v82 = os_log_type_enabled(v80, v81);
        os_log_type_t v74 = v137;
        if (v82)
        {
          uint64_t v83 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v83 = 0;
          _os_log_impl(&dword_259EC8000, v80, v81, "handleStatementEvaluated - found event from executor", v83, 2u);
          MEMORY[0x25A2EF270](v83, -1, -1);
        }

        int64_t v84 = v135;
        uint64_t v85 = v140;
        v128(v135, v147, v140);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v146 + 56))(v84, 0, 1, v85);
        uint64_t v86 = (uint64_t)v84;
        uint64_t v87 = v136;
        sub_259EF6B38(v86, v136);
        uint64_t v88 = v138 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
        swift_beginAccess();
        sub_259EF6BA0(v87, v88);
        swift_endAccess();
        goto LABEL_33;
      }
      if (v76 != 1)
      {
        uint64_t v89 = *(void *)(v148 + 72);
        unint64_t v90 = v142 + v89 + v77;
        uint64_t v91 = 1;
        uint64_t v92 = v150;
        while (1)
        {
          uint64_t v93 = v139;
          uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v143)(v139, v90, v92);
          uint64_t v94 = v91 + 1;
          if (__OFADD__(v91, 1)) {
            break;
          }
          char v95 = sub_259EFEC70();
          uint64_t v96 = v93;
          char v97 = v95;
          v134(v96, v92);
          if (v97) {
            goto LABEL_23;
          }
          ++v91;
          v90 += v89;
          if (v94 == v76) {
            goto LABEL_32;
          }
        }
        __break(1u);
        goto LABEL_51;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
    }
LABEL_32:
    uint64_t v44 = v150;
    unsigned int v68 = v134;
    v134(v145, v150);
    swift_bridgeObjectRelease();
    os_log_type_t v74 = v137;
LABEL_33:
    uint64_t v72 = v132;
  }
  if (v72 == 0x6F7365526E616C70 && v74 == (char *)0xEE006E6F6974756CLL)
  {
    swift_bridgeObjectRelease();
    uint64_t v98 = v141;
  }
  else
  {
    char v99 = sub_259EFEF50();
    swift_bridgeObjectRelease();
    uint64_t v98 = v141;
    if ((v99 & 1) == 0) {
      return v68(v149, v44);
    }
  }
  uint64_t v100 = *(void *)(v138 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes);
  v133(v144, *MEMORY[0x263F516A8], v44);
  uint64_t v101 = v44;
  uint64_t v102 = *(void *)(v100 + 16);
  uint64_t v142 = v100;
  if (!v102)
  {
    swift_bridgeObjectRetain();
    goto LABEL_49;
  }
  unint64_t v103 = (*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80);
  uint64_t v145 = *(char **)(v148 + 16);
  ((void (*)(char *, unint64_t, uint64_t))v145)(v98, v100 + v103, v101);
  unint64_t v104 = (void (*)(void, void, void))sub_259EF6AE0();
  swift_bridgeObjectRetain();
  uint64_t v143 = v104;
  char v105 = sub_259EFEC70();
  v68(v98, v101);
  if ((v105 & 1) == 0)
  {
    if (v102 != 1)
    {
      uint64_t v115 = *(void *)(v148 + 72);
      uint64_t v116 = v141;
      uint64_t v117 = v142 + v115 + v103;
      uint64_t v118 = 1;
      uint64_t v119 = v150;
      while (1)
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v145)(v116, v117, v119);
        uint64_t v120 = v118 + 1;
        if (__OFADD__(v118, 1)) {
          break;
        }
        char v121 = sub_259EFEC70();
        v134(v116, v119);
        if (v121) {
          goto LABEL_40;
        }
        ++v118;
        v117 += v115;
        if (v120 == v102) {
          goto LABEL_49;
        }
      }
LABEL_51:
      __break(1u);
      return result;
    }
LABEL_49:
    uint64_t v122 = v150;
    uint64_t v123 = v134;
    v134(v144, v150);
    swift_bridgeObjectRelease();
    return v123(v149, v122);
  }
LABEL_40:
  uint64_t v106 = v150;
  uint64_t v107 = (void (*)(char *, uint64_t))v134;
  v134(v144, v150);
  swift_bridgeObjectRelease();
  uint64_t v108 = sub_259EFEBF0();
  os_log_type_t v109 = sub_259EFEDC0();
  if (os_log_type_enabled(v108, v109))
  {
    uint64_t v110 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v110 = 0;
    _os_log_impl(&dword_259EC8000, v108, v109, "handleStatementEvaluated - found event from planner", v110, 2u);
    MEMORY[0x25A2EF270](v110, -1, -1);
  }

  v107(v149, v106);
  uint64_t v111 = (uint64_t)v135;
  uint64_t v112 = v140;
  v128(v135, v147, v140);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v146 + 56))(v111, 0, 1, v112);
  uint64_t v113 = v136;
  sub_259EF6B38(v111, v136);
  uint64_t v114 = v138 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
  swift_beginAccess();
  sub_259EF6BA0(v113, v114);
  return swift_endAccess();
}

uint64_t sub_259EF5B64()
{
  sub_259ED1170(v0 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, &qword_26A3F8CE8);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_259EF5BE0()
{
  return type metadata accessor for IETranscriptEventFilter(0);
}

uint64_t type metadata accessor for IETranscriptEventFilter(uint64_t a1)
{
  return sub_259EF6A70(a1, (uint64_t *)&unk_26A3F8CB0);
}

void sub_259EF5C08()
{
  sub_259EF5CA4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_259EF5CA4()
{
  if (!qword_26A3F8CC0)
  {
    sub_259EFE840();
    unint64_t v0 = sub_259EFEE00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A3F8CC0);
    }
  }
}

uint64_t sub_259EF5CFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
  swift_beginAccess();
  return sub_259EED0EC(v3, a1, &qword_26A3F8CE8);
}

uint64_t sub_259EF5D5C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t sub_259EF5DA0(uint64_t a1)
{
  uint64_t v63 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259EFE8F0();
  uint64_t v60 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v49 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v61 = (char *)&v49 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v59 = (uint64_t)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v58 = (char *)&v49 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v49 - v21;
  uint64_t v62 = v1;
  uint64_t v23 = v1 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
  swift_beginAccess();
  sub_259EED0EC(v23, (uint64_t)v22, &qword_26A3F8CE8);
  uint64_t v24 = sub_259EFE840();
  uint64_t v57 = *(void *)(v24 - 8);
  int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 48))(v22, 1, v24);
  uint64_t result = sub_259ED1170((uint64_t)v22, &qword_26A3F8CE8);
  if (v25 == 1)
  {
    uint64_t v56 = v23;
    uint64_t v27 = v63;
    sub_259EFE7D0();
    uint64_t v28 = sub_259EFE8B0();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v4, 1, v28) == 1)
    {
      uint64_t v30 = &qword_26A3F8870;
      uint64_t v31 = (uint64_t)v4;
LABEL_6:
      sub_259ED1170(v31, v30);
      return sub_259EF4B24(v27);
    }
    sub_259EFE8A0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v28);
    uint64_t v32 = sub_259EFE920();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v7, 1, v32) == 1)
    {
      uint64_t v30 = &qword_26A3F8878;
      uint64_t v31 = (uint64_t)v7;
      goto LABEL_6;
    }
    sub_259EFE900();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v32);
    uint64_t v34 = v60;
    uint64_t v35 = v61;
    (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v61, v14, v8);
    uint64_t v36 = *(void *)(v62 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes);
    uint64_t v52 = *(void *)(v36 + 16);
    if (!v52)
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v8);
LABEL_20:
      uint64_t v27 = v63;
      return sub_259EF4B24(v27);
    }
    unint64_t v51 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    uint64_t v54 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
    v54(v11, v36 + v51, v8);
    unint64_t v37 = sub_259EF6AE0();
    swift_bridgeObjectRetain();
    unint64_t v53 = v37;
    char v38 = sub_259EFEC70();
    uint64_t v55 = *(void (**)(char *, uint64_t))(v34 + 8);
    v55(v11, v8);
    if (v38)
    {
      swift_bridgeObjectRelease();
LABEL_22:
      v55(v35, v8);
      uint64_t v45 = v57;
      uint64_t v44 = v58;
      uint64_t v27 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v58, v63, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v44, 0, 1, v24);
      uint64_t v46 = (uint64_t)v44;
      uint64_t v47 = v59;
      sub_259EF6B38(v46, v59);
      uint64_t v48 = v56;
      swift_beginAccess();
      sub_259EF6BA0(v47, v48);
      swift_endAccess();
      return sub_259EF4B24(v27);
    }
    uint64_t v50 = v36;
    uint64_t v39 = v52;
    if (v52 == 1)
    {
      swift_bridgeObjectRelease();
      v55(v35, v8);
      goto LABEL_20;
    }
    uint64_t v49 = (v34 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v60 = *(void *)(v60 + 72);
    unint64_t v40 = v50 + v60 + v51;
    uint64_t v41 = 1;
    while (1)
    {
      uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v54)(v11, v40, v8);
      uint64_t v42 = v41 + 1;
      if (__OFADD__(v41, 1)) {
        break;
      }
      char v43 = sub_259EFEC70();
      v55(v11, v8);
      if (v43)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = v61;
        goto LABEL_22;
      }
      ++v41;
      v40 += v60;
      if (v42 == v39)
      {
        swift_bridgeObjectRelease();
        v55(v61, v8);
        goto LABEL_20;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_259EF6430()
{
  return type metadata accessor for IETranscriptNextEvent(0);
}

uint64_t type metadata accessor for IETranscriptNextEvent(uint64_t a1)
{
  return sub_259EF6A70(a1, (uint64_t *)&unk_26A3F8CC8);
}

uint64_t sub_259EF645C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v54 = (uint64_t)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v53 = (char *)v47 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_259EFE8F0();
  uint64_t v55 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)v47 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v47 - v21;
  uint64_t v56 = a1;
  sub_259EFE7D0();
  uint64_t v23 = sub_259EFE8B0();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v10, 1, v23) == 1)
  {
    int v25 = &qword_26A3F8870;
    uint64_t v26 = (uint64_t)v10;
LABEL_5:
    sub_259ED1170(v26, v25);
    uint64_t v29 = v56;
    return sub_259EF4B24(v29);
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v23);
  uint64_t v27 = sub_259EFE920();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v13, 1, v27) == 1)
  {
    int v25 = &qword_26A3F8878;
    uint64_t v26 = (uint64_t)v13;
    goto LABEL_5;
  }
  sub_259EFE900();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v27);
  uint64_t v31 = v55;
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v22, v20, v14);
  uint64_t v32 = *(void *)(v2 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes);
  uint64_t v52 = *(void *)(v32 + 16);
  if (!v52)
  {
    uint64_t v29 = v56;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v22, v14);
    return sub_259EF4B24(v29);
  }
  uint64_t v48 = v2;
  unint64_t v33 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  unint64_t v51 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
  v51(v17, v32 + v33, v14);
  unint64_t v34 = sub_259EF6AE0();
  swift_bridgeObjectRetain();
  unint64_t v50 = v34;
  char v35 = sub_259EFEC70();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v31 + 8);
  v36(v17, v14);
  if (v35)
  {
    swift_bridgeObjectRelease();
LABEL_21:
    v36(v22, v14);
    uint64_t v42 = sub_259EFE840();
    uint64_t v43 = *(void *)(v42 - 8);
    uint64_t v44 = (uint64_t)v53;
    uint64_t v29 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v53, v56, v42);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v44, 0, 1, v42);
    uint64_t v45 = v54;
    sub_259EF6B38(v44, v54);
    uint64_t v46 = v48 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
    swift_beginAccess();
    sub_259EF6BA0(v45, v46);
    swift_endAccess();
    return sub_259EF4B24(v29);
  }
  v47[1] = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v52 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = v56;
LABEL_18:
    v36(v22, v14);
    return sub_259EF4B24(v29);
  }
  uint64_t v49 = v36;
  uint64_t v37 = *(void *)(v31 + 72);
  uint64_t v55 = v32;
  unint64_t v38 = v32 + v37 + v33;
  uint64_t v39 = 1;
  while (1)
  {
    uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v51)(v17, v38, v14);
    uint64_t v40 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      break;
    }
    char v41 = sub_259EFEC70();
    v49(v17, v14);
    if (v41)
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = v49;
      goto LABEL_21;
    }
    ++v39;
    v38 += v37;
    if (v40 == v52)
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = v49;
      uint64_t v29 = v56;
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_259EF6A48()
{
  return type metadata accessor for IETranscriptLastEvent(0);
}

uint64_t type metadata accessor for IETranscriptLastEvent(uint64_t a1)
{
  return sub_259EF6A70(a1, (uint64_t *)&unk_26A3F8CD8);
}

uint64_t sub_259EF6A70(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259EF6AA8()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_259EF6AE0()
{
  unint64_t result = qword_26A3F8CF0;
  if (!qword_26A3F8CF0)
  {
    sub_259EFE8F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8CF0);
  }
  return result;
}

uint64_t sub_259EF6B38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_259EF6BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_259EF6C08()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CF8);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v16 - v4;
  sub_259EFE7F0();
  uint64_t v6 = sub_259EFE6F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(v5, 1, v6) == 1)
  {
    uint64_t v9 = (uint64_t)v5;
LABEL_5:
    sub_259ED1170(v9, &qword_26A3F8CF8);
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  sub_259EFE6E0();
  double v11 = v10;
  uint64_t v12 = *(void (**)(char *, uint64_t))(v7 + 8);
  v12(v5, v6);
  sub_259EFE7F0();
  if (v8(v3, 1, v6) == 1)
  {
    uint64_t v9 = (uint64_t)v3;
    goto LABEL_5;
  }
  sub_259EFE6E0();
  double v15 = v14;
  v12(v3, v6);
  *(double *)&uint64_t result = v15 - v11;
  return result;
}

uint64_t sub_259EF6DD0(uint64_t a1)
{
  return sub_259EF70F0(a1, MEMORY[0x263F516B8], MEMORY[0x263F516B0], MEMORY[0x263F51688], &qword_26A3F9E30);
}

uint64_t sub_259EF6DF4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8898);
  uint64_t v0 = sub_259EFE8F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_259F011A0;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F51648], v0);
  v6(v5 + v2, *MEMORY[0x263F51680], v0);
  v6(v5 + 2 * v2, *MEMORY[0x263F516A8], v0);
  v6(v5 + 3 * v2, *MEMORY[0x263F51698], v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 4 * v2, *MEMORY[0x263F51690], v0);
  qword_26A3F9E38 = v4;
  return result;
}

uint64_t sub_259EF6F74()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8898);
  uint64_t v0 = sub_259EFE8F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_259F009E0;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F51648], v0);
  v6(v5 + v2, *MEMORY[0x263F51680], v0);
  v6(v5 + 2 * v2, *MEMORY[0x263F516A8], v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 3 * v2, *MEMORY[0x263F51698], v0);
  qword_26A3F9E40 = v4;
  return result;
}

uint64_t sub_259EF70CC(uint64_t a1)
{
  return sub_259EF70F0(a1, MEMORY[0x263F51668], MEMORY[0x263F51658], MEMORY[0x263F51670], &qword_26A3F9E48);
}

uint64_t sub_259EF70F0(uint64_t a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, uint64_t *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8898);
  uint64_t v9 = sub_259EFE8F0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_259EFFBF0;
  unint64_t v14 = v13 + v12;
  uint64_t v15 = *a2;
  uint64_t v16 = *(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 104);
  v16(v14, v15, v9);
  v16(v14 + v11, *a3, v9);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v16)(v14 + 2 * v11, *a4, v9);
  *a5 = v13;
  return result;
}

uint64_t sub_259EF7224()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8B98);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_259F00B40;
  uint64_t v2 = v0[2];
  *(void *)(v1 + 56) = type metadata accessor for PlannerGrainDimensionsSpec();
  *(void *)(v1 + 64) = &off_2707DD9D8;
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = v0[3];
  uint64_t v4 = type metadata accessor for IETranscriptLatencyIntervalSpec();
  *(void *)(v1 + 96) = v4;
  *(void *)(v1 + 104) = &off_2707DD9A0;
  *(void *)(v1 + 72) = v3;
  *(void *)(v1 + 136) = v4;
  *(void *)(v1 + 144) = &off_2707DD9A0;
  uint64_t v5 = v0[5];
  *(void *)(v1 + 112) = v0[4];
  *(void *)(v1 + 176) = v4;
  *(void *)(v1 + 184) = &off_2707DD9A0;
  *(void *)(v1 + 152) = v5;
  *(void *)(v1 + 216) = v4;
  *(void *)(v1 + 224) = &off_2707DD9A0;
  uint64_t v6 = v0[7];
  *(void *)(v1 + 192) = v0[6];
  *(void *)(v1 + 256) = v4;
  *(void *)(v1 + 264) = &off_2707DD9A0;
  *(void *)(v1 + 232) = v6;
  *(void *)(v1 + 296) = v4;
  *(void *)(v1 + 304) = &off_2707DD9A0;
  uint64_t v7 = v0[9];
  *(void *)(v1 + 272) = v0[8];
  *(void *)(v1 + 336) = v4;
  *(void *)(v1 + 344) = &off_2707DD9A0;
  *(void *)(v1 + 312) = v7;
  *(void *)(v1 + 376) = v4;
  *(void *)(v1 + 384) = &off_2707DD9A0;
  uint64_t v8 = v0[11];
  *(void *)(v1 + 352) = v0[10];
  *(void *)(v1 + 416) = v4;
  *(void *)(v1 + 424) = &off_2707DD9A0;
  *(void *)(v1 + 392) = v8;
  *(void *)(v1 + 456) = v4;
  *(void *)(v1 + 464) = &off_2707DD9A0;
  uint64_t v9 = v0[13];
  *(void *)(v1 + 432) = v0[12];
  *(void *)(v1 + 496) = v4;
  *(void *)(v1 + 504) = &off_2707DD9A0;
  *(void *)(v1 + 472) = v9;
  *(void *)(v1 + 536) = v4;
  *(void *)(v1 + 544) = &off_2707DD9A0;
  uint64_t v10 = v0[15];
  *(void *)(v1 + 512) = v0[14];
  *(void *)(v1 + 576) = v4;
  *(void *)(v1 + 584) = &off_2707DD9A0;
  *(void *)(v1 + 552) = v10;
  uint64_t v11 = v0[16];
  *(void *)(v1 + 616) = v4;
  *(void *)(v1 + 624) = &off_2707DD9A0;
  *(void *)(v1 + 592) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v1;
}

uint64_t sub_259EF73E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8880);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_259EFE800();
  uint64_t v6 = v5 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v5 + 64);
  uint64_t result = swift_beginAccess();
  int64_t v11 = 0;
  int64_t v12 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      return result;
    }
    if (v15 >= v12) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v12) {
        goto LABEL_23;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v12) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v11);
        if (!v16)
        {
          int64_t v11 = v15 + 3;
          if (v15 + 3 >= v12) {
            goto LABEL_23;
          }
          unint64_t v16 = *(void *)(v6 + 8 * v11);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_5:
    uint64_t result = sub_259EFB764(&v29, *(void *)(*(void *)(v5 + 56) + 8 * v14));
  }
  int64_t v17 = v15 + 4;
  if (v17 < v12)
  {
    unint64_t v16 = *(void *)(v6 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        int64_t v11 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_31;
        }
        if (v11 >= v12) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v11);
        ++v17;
        if (v16) {
          goto LABEL_22;
        }
      }
    }
    int64_t v11 = v17;
    goto LABEL_22;
  }
LABEL_23:
  swift_endAccess();
  swift_release();
  sub_259EFE7E0();
  uint64_t v18 = sub_259EFE890();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v4, 1, v18) == 1)
  {
    sub_259ED1170((uint64_t)v4, &qword_26A3F8880);
  }
  else
  {
    uint64_t v20 = sub_259EFE880();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v18);
    swift_beginAccess();
    sub_259EFB764(&v29, v20);
    swift_endAccess();
  }
  uint64_t v21 = sub_259EF7224();
  uint64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v23 = v21 + 32;
    do
    {
      sub_259ED1078(v23, (uint64_t)v26);
      uint64_t v24 = v27;
      uint64_t v25 = v28;
      __swift_project_boxed_opaque_existential_1(v26, v27);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 8))(a1, v24, v25);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      v23 += 40;
      --v22;
    }
    while (v22);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_259EF7708@<X0>(unsigned __int8 *a1@<X8>)
{
  uint64_t v170 = a1;
  uint64_t v173 = sub_259EFEC00();
  uint64_t v181 = *(void *)(v173 - 8);
  MEMORY[0x270FA5388](v173);
  long long v175 = (char *)&v153 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CA0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v154 = (char *)&v153 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CA8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v153 = (uint64_t)&v153 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v156 = (char *)&v153 - v7;
  uint64_t v161 = sub_259EFE8D0();
  uint64_t v162 = *(void *)(v161 - 8);
  MEMORY[0x270FA5388](v161);
  uint64_t v157 = (char *)&v153 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8D00);
  MEMORY[0x270FA5388](v171);
  uint64_t v10 = (char *)&v153 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v168 = (char *)&v153 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v165 = (char *)&v153 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v153 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v153 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  id v159 = (char *)&v153 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  unint64_t v158 = (char *)&v153 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v155 = (uint64_t)&v153 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v160 = (uint64_t)&v153 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v169 = (uint64_t)&v153 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  unint64_t v34 = (char *)&v153 - v33;
  MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v153 - v35;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CE8);
  uint64_t v38 = MEMORY[0x270FA5388](v37 - 8);
  long long v167 = (char *)&v153 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  uint64_t v166 = (uint64_t)&v153 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v177 = (uint64_t)&v153 - v43;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  long long v176 = (char *)&v153 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  uint64_t v48 = (char *)&v153 - v47;
  uint64_t v49 = MEMORY[0x270FA5388](v46);
  unint64_t v51 = (char *)&v153 - v50;
  uint64_t v52 = MEMORY[0x270FA5388](v49);
  MEMORY[0x270FA5388](v52);
  uint64_t v54 = (char *)&v153 - v53;
  unsigned __int8 v185 = 6;
  uint64_t v182 = v55;
  sub_259EF3068((uint64_t)&v153 - v53, v55);
  long long v174 = v54;
  sub_259EED0EC((uint64_t)v54, (uint64_t)v51, &qword_26A3F8CE8);
  uint64_t v56 = sub_259EFE840();
  uint64_t v57 = *(void *)(v56 - 8);
  long long v178 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 48);
  uint64_t v179 = v57 + 48;
  int v58 = v178(v51, 1, v56);
  uint64_t v180 = v56;
  uint64_t v172 = v57;
  if (v58 == 1)
  {
    uint64_t v59 = &qword_26A3F8CE8;
    uint64_t v60 = (uint64_t)v51;
LABEL_5:
    sub_259ED1170(v60, v59);
    uint64_t v63 = v182;
    uint64_t v64 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v36, 1, 1, v64);
    uint64_t v65 = v181;
    goto LABEL_7;
  }
  sub_259EFE7D0();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v51, v56);
  uint64_t v61 = sub_259EFE8B0();
  uint64_t v62 = *(void *)(v61 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v20, 1, v61) == 1)
  {
    uint64_t v59 = &qword_26A3F8870;
    uint64_t v60 = (uint64_t)v20;
    goto LABEL_5;
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v20, v61);
  uint64_t v65 = v181;
  uint64_t v63 = v182;
LABEL_7:
  sub_259EED0EC(v63, (uint64_t)v48, &qword_26A3F8CE8);
  uint64_t v66 = v180;
  if (v178(v48, 1, v180) == 1)
  {
    sub_259ED1170((uint64_t)v48, &qword_26A3F8CE8);
LABEL_11:
    uint64_t v69 = (uint64_t)v176;
    uint64_t v70 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v34, 1, 1, v70);
    goto LABEL_13;
  }
  sub_259EFE7D0();
  (*(void (**)(char *, uint64_t))(v172 + 8))(v48, v66);
  uint64_t v67 = sub_259EFE8B0();
  uint64_t v68 = *(void *)(v67 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v18, 1, v67) == 1)
  {
    sub_259ED1170((uint64_t)v18, &qword_26A3F8870);
    uint64_t v65 = v181;
    goto LABEL_11;
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v18, v67);
  uint64_t v65 = v181;
  uint64_t v69 = (uint64_t)v176;
LABEL_13:
  uint64_t v71 = (uint64_t)&v10[*(int *)(v171 + 48)];
  sub_259EFC43C((uint64_t)v36, (uint64_t)v10);
  sub_259EFC43C((uint64_t)v34, v71);
  uint64_t v72 = sub_259EFE920();
  uint64_t v73 = *(void *)(v72 - 8);
  os_log_type_t v74 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
  unsigned int v75 = v74(v10, 1, v72);
  uint64_t v164 = v73 + 48;
  uint64_t v163 = v72;
  if (v75 == 1) {
    goto LABEL_25;
  }
  uint64_t v76 = v169;
  sub_259EED0EC((uint64_t)v10, v169, &qword_26A3F8878);
  unint64_t v77 = *(uint64_t (**)(uint64_t, uint64_t))(v73 + 88);
  int v78 = v77(v76, v72);
  if (v78 != *MEMORY[0x263F51718])
  {
    if (v78 != *MEMORY[0x263F516F0])
    {
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v169, v72);
      goto LABEL_24;
    }
    unsigned int v79 = v74((char *)v71, 1, v72);
    uint64_t v69 = (uint64_t)v176;
    if (v79 != 1)
    {
      uint64_t v119 = v155;
      sub_259EED0EC(v71, v155, &qword_26A3F8878);
      int v120 = v77(v119, v72);
      uint64_t v121 = v169;
      if (v120 == *MEMORY[0x263F516D0])
      {
        unsigned __int8 v185 = 1;
        uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
        v122(v119, v72);
        uint64_t v123 = v169;
      }
      else
      {
        if (v120 == *MEMORY[0x263F51708])
        {
          unsigned __int8 v185 = 5;
          uint64_t v151 = v169;
          uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
          v122(v155, v72);
        }
        else
        {
          if (v120 != *MEMORY[0x263F51700])
          {
            uint64_t v152 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
            v152(v155, v72);
            v152(v121, v72);
            goto LABEL_25;
          }
          unsigned __int8 v185 = 4;
          uint64_t v151 = v169;
          uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
          v122(v155, v72);
        }
        uint64_t v123 = v151;
      }
      v122(v123, v72);
LABEL_76:
      uint64_t v91 = &qword_26A3F8878;
      sub_259ED1170(v71, &qword_26A3F8878);
      goto LABEL_26;
    }
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v169, v72);
LABEL_25:
    unsigned __int8 v185 = 6;
    uint64_t v91 = &qword_26A3F8D00;
LABEL_26:
    uint64_t v92 = v173;
    goto LABEL_27;
  }
  (*(void (**)(uint64_t, uint64_t))(v73 + 96))(v76, v72);
  if (v74((char *)v71, 1, v72) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v162 + 8))(v76, v161);
LABEL_24:
    uint64_t v69 = (uint64_t)v176;
    goto LABEL_25;
  }
  uint64_t v80 = v160;
  sub_259EED0EC(v71, v160, &qword_26A3F8878);
  int v81 = v77(v80, v72);
  if (v81 == *MEMORY[0x263F516D0])
  {
    uint64_t v82 = v162;
    uint64_t v83 = v161;
    (*(void (**)(char *, uint64_t, uint64_t))(v162 + 32))(v157, v169, v161);
    int64_t v84 = v154;
    sub_259EFE8C0();
    uint64_t v85 = (uint64_t)v84;
    uint64_t v86 = sub_259EFE9C0();
    uint64_t v87 = *(void *)(v86 - 8);
    uint64_t v88 = *(unsigned int (**)(uint64_t, uint64_t))(v87 + 48);
    uint64_t v171 = v86;
    if (v88(v85, 1) == 1)
    {
      (*(void (**)(char *, uint64_t))(v82 + 8))(v157, v83);
      sub_259ED1170(v85, &qword_26A3F8CA0);
      uint64_t v89 = sub_259EFEA30();
      uint64_t v90 = (uint64_t)v156;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v156, 1, 1, v89);
      uint64_t v69 = (uint64_t)v176;
    }
    else
    {
      sub_259EFE9B0();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v157, v83);
      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v85, v171);
      uint64_t v90 = (uint64_t)v156;
      uint64_t v145 = sub_259EFEA30();
      uint64_t v146 = *(void *)(v145 - 8);
      int v147 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v146 + 48))(v90, 1, v145);
      uint64_t v69 = (uint64_t)v176;
      if (v147 != 1)
      {
        uint64_t v171 = v145;
        uint64_t v148 = v153;
        sub_259EED0EC(v90, v153, &qword_26A3F8CA8);
        uint64_t v149 = v148;
        uint64_t v150 = v171;
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v146 + 88))(v149, v171) == *MEMORY[0x263F51758])
        {
          unsigned __int8 v185 = 3;
          (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v153, v150);
LABEL_75:
          sub_259ED1170(v90, &qword_26A3F8CA8);
          (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v160, v72);
          goto LABEL_76;
        }
        (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v153, v150);
      }
    }
    unsigned __int8 v185 = 0;
    goto LABEL_75;
  }
  uint64_t v124 = v162;
  uint64_t v125 = v161;
  if (v81 != *MEMORY[0x263F51700])
  {
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v160, v72);
    (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v169, v125);
    goto LABEL_24;
  }
  unsigned __int8 v185 = 2;
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v160, v72);
  (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v169, v125);
  uint64_t v91 = &qword_26A3F8878;
  sub_259ED1170(v71, &qword_26A3F8878);
  uint64_t v92 = v173;
  uint64_t v69 = (uint64_t)v176;
LABEL_27:
  uint64_t v93 = v74;
  uint64_t v169 = v73;
  sub_259ED1170((uint64_t)v10, v91);
  if (qword_26A3F87B8 != -1) {
    swift_once();
  }
  uint64_t v94 = __swift_project_value_buffer(v92, (uint64_t)qword_26A3F8B18);
  char v95 = v175;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v175, v94, v92);
  uint64_t v96 = (uint64_t)v174;
  sub_259EED0EC((uint64_t)v174, v69, &qword_26A3F8CE8);
  uint64_t v97 = v69;
  uint64_t v98 = v182;
  uint64_t v99 = v177;
  sub_259EED0EC(v182, v177, &qword_26A3F8CE8);
  uint64_t v171 = v185;
  uint64_t v100 = sub_259EFEBF0();
  int v101 = sub_259EFEDC0();
  if (!os_log_type_enabled(v100, (os_log_type_t)v101))
  {

    sub_259ED1170(v99, &qword_26A3F8CE8);
    sub_259ED1170(v97, &qword_26A3F8CE8);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v95, v92);
    sub_259ED1170(v98, &qword_26A3F8CE8);
    sub_259ED1170(v96, &qword_26A3F8CE8);
    uint64_t v110 = v170;
    goto LABEL_60;
  }
  LODWORD(v161) = v101;
  uint64_t v162 = 7104878;
  uint64_t v102 = swift_slowAlloc();
  uint64_t v103 = swift_slowAlloc();
  uint64_t v184 = v103;
  *(_DWORD *)uint64_t v102 = 136315650;
  uint64_t v104 = v166;
  sub_259EED0EC(v97, v166, &qword_26A3F8CE8);
  uint64_t v105 = v180;
  if (v178((char *)v104, 1, v180) == 1)
  {
    sub_259ED1170(v104, &qword_26A3F8CE8);
    unint64_t v106 = 0xE300000000000000;
    uint64_t v107 = 7104878;
    uint64_t v108 = (uint64_t)v167;
    os_log_type_t v109 = v168;
    goto LABEL_44;
  }
  uint64_t v160 = v103;
  uint64_t v111 = v165;
  sub_259EFE7D0();
  (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v104, v105);
  uint64_t v112 = sub_259EFE8B0();
  uint64_t v113 = *(void *)(v112 - 8);
  int v114 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v113 + 48))(v111, 1, v112);
  uint64_t v108 = (uint64_t)v167;
  os_log_type_t v109 = v168;
  if (v114 == 1)
  {
    uint64_t v115 = &qword_26A3F8870;
    uint64_t v116 = (uint64_t)v111;
  }
  else
  {
    uint64_t v117 = v158;
    sub_259EFE8A0();
    (*(void (**)(char *, uint64_t))(v113 + 8))(v111, v112);
    uint64_t v118 = v163;
    if (v93(v117, 1, v163) != 1)
    {
      uint64_t v107 = sub_259EFE910();
      unint64_t v106 = v126;
      (*(void (**)(char *, uint64_t))(v169 + 8))(v117, v118);
      goto LABEL_43;
    }
    uint64_t v115 = &qword_26A3F8878;
    uint64_t v116 = (uint64_t)v117;
  }
  sub_259ED1170(v116, v115);
  unint64_t v106 = 0xE300000000000000;
  uint64_t v107 = 7104878;
LABEL_43:
  uint64_t v97 = (uint64_t)v176;
  uint64_t v103 = v160;
LABEL_44:
  uint64_t v183 = sub_259ED2D5C(v107, v106, &v184);
  sub_259EFEE10();
  swift_bridgeObjectRelease();
  sub_259ED1170(v97, &qword_26A3F8CE8);
  *(_WORD *)(v102 + 12) = 2080;
  sub_259EED0EC(v177, v108, &qword_26A3F8CE8);
  uint64_t v127 = v180;
  if (v178((char *)v108, 1, v180) == 1)
  {
    unint64_t v128 = &qword_26A3F8CE8;
    uint64_t v129 = v108;
  }
  else
  {
    sub_259EFE7D0();
    (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v108, v127);
    uint64_t v130 = sub_259EFE8B0();
    uint64_t v131 = *(void *)(v130 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v131 + 48))(v109, 1, v130) == 1)
    {
      unint64_t v128 = &qword_26A3F8870;
      uint64_t v129 = (uint64_t)v109;
    }
    else
    {
      uint64_t v132 = v159;
      sub_259EFE8A0();
      (*(void (**)(char *, uint64_t))(v131 + 8))(v109, v130);
      uint64_t v133 = (uint64_t)v132;
      uint64_t v134 = v132;
      uint64_t v135 = v163;
      if (v93(v134, 1, v163) != 1)
      {
        uint64_t v162 = sub_259EFE910();
        unint64_t v136 = v144;
        (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v133, v135);
        goto LABEL_51;
      }
      unint64_t v128 = &qword_26A3F8878;
      uint64_t v129 = v133;
    }
  }
  sub_259ED1170(v129, v128);
  unint64_t v136 = 0xE300000000000000;
LABEL_51:
  uint64_t v110 = v170;
  uint64_t v137 = (uint64_t)v174;
  uint64_t v138 = v177;
  uint64_t v139 = 0xD000000000000015;
  uint64_t v183 = sub_259ED2D5C(v162, v136, &v184);
  sub_259EFEE10();
  swift_bridgeObjectRelease();
  sub_259ED1170(v138, &qword_26A3F8CE8);
  *(_WORD *)(v102 + 22) = 2080;
  unint64_t v140 = 0x8000000259F021E0;
  uint64_t v141 = v181;
  switch(v171)
  {
    case 1:
      unint64_t v140 = 0xEC00000065746169;
      uint64_t v139 = 0x64656D7265746E69;
      break;
    case 2:
      break;
    case 3:
      uint64_t v139 = 0xD00000000000001ALL;
      uint64_t v142 = "systemPromptResolvedAction";
      goto LABEL_57;
    case 4:
      unint64_t v140 = 0xEE0065736E6F7073;
      uint64_t v139 = 0x65526E6F69746361;
      break;
    case 5:
      uint64_t v142 = "actionWithoutResponse";
LABEL_57:
      unint64_t v140 = (unint64_t)(v142 - 32) | 0x8000000000000000;
      break;
    case 6:
      unint64_t v140 = 0xE700000000000000;
      uint64_t v139 = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t v140 = 0xED00006E6F697463;
      uint64_t v139 = 0x4174736575716572;
      break;
  }
  uint64_t v183 = sub_259ED2D5C(v139, v140, &v184);
  sub_259EFEE10();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_259EC8000, v100, (os_log_type_t)v161, "permutation - begin: %s, end: %s, result: %s", (uint8_t *)v102, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x25A2EF270](v103, -1, -1);
  MEMORY[0x25A2EF270](v102, -1, -1);

  (*(void (**)(char *, uint64_t))(v141 + 8))(v175, v173);
  sub_259ED1170(v182, &qword_26A3F8CE8);
  sub_259ED1170(v137, &qword_26A3F8CE8);
LABEL_60:
  uint64_t result = swift_beginAccess();
  *uint64_t v110 = v185;
  return result;
}

double sub_259EF8DC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  sub_259EF7708(v73);
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v51 = *(void *)(v8 + 152);
  uint64_t v68 = *(void *)(v8 + 40);
  uint64_t v57 = *(void *)(v8 + 48);
  uint64_t v67 = *(void *)(v8 + 56);
  uint64_t v54 = *(void *)(v8 + 64);
  uint64_t v66 = *(void *)(v8 + 24);
  uint64_t v61 = *(void *)(v8 + 32);
  long long v64 = *(_OWORD *)(v8 + 72);
  long long v62 = *(_OWORD *)(v8 + 88);
  long long v58 = *(_OWORD *)(v8 + 120);
  long long v59 = *(_OWORD *)(v8 + 104);
  unint64_t v56 = *(void *)(v8 + 136);
  unint64_t v55 = *(void *)(v8 + 144);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_259EF339C();
  char v52 = v9 & 1;
  uint64_t v50 = sub_259EF339C();
  char v49 = v10 & 1;
  uint64_t v48 = sub_259EF339C();
  char v47 = v11 & 1;
  uint64_t v46 = sub_259EF339C();
  char v45 = v12 & 1;
  uint64_t v44 = sub_259EF339C();
  char v43 = v13 & 1;
  uint64_t v42 = sub_259EF339C();
  char v41 = v14 & 1;
  uint64_t v40 = sub_259EF339C();
  char v39 = v15 & 1;
  uint64_t v38 = sub_259EF339C();
  char v37 = v16 & 1;
  uint64_t v36 = sub_259EF339C();
  char v35 = v17 & 1;
  uint64_t v18 = sub_259EF339C();
  char v20 = v19 & 1;
  uint64_t v21 = sub_259EF339C();
  char v23 = v22 & 1;
  uint64_t v24 = sub_259EF339C();
  char v26 = v25 & 1;
  uint64_t v27 = sub_259EF339C();
  char v29 = v28 & 1;
  uint64_t v30 = sub_259EF339C();
  v34.n128_u64[1] = v55;
  v34.n128_u64[0] = v56;
  *((void *)&v33 + 1) = v54;
  *(void *)&long long v33 = v67;
  *(void *)&double result = sub_259EDF2B4(a1, a2, a3, a4, a5, a6, v68, v57, a7, v33, v66, v61, v73, v64, v62, v59, v58, v34, v53,
                         v52,
                         v50,
                         v49,
                         v48,
                         v47,
                         v46,
                         v45,
                         v44,
                         v43,
                         v42,
                         v41,
                         v40,
                         v39,
                         v38,
                         v37,
                         v36,
                         v35,
                         v18,
                         v20,
                         v21,
                         v23,
                         v24,
                         v26,
                         v27,
                         v29,
                         v30,
                         v31 & 1,
                         v51).n128_u64[0];
  return result;
}

uint64_t sub_259EF90E8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_259EF9180()
{
  sub_259EF90E8();
  return MEMORY[0x270FA0228](v0, 144, 7);
}

uint64_t type metadata accessor for IEPlannerGrainSpec()
{
  return self;
}

void *sub_259EF91D8()
{
  type metadata accessor for PlannerGrainDimensionsSpec();
  uint64_t v1 = swift_allocObject();
  *(unsigned char *)(v1 + 16) = 6;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_OWORD *)(v1 + 136) = 0u;
  *(void *)(v1 + 152) = 0;
  v0[2] = v1;
  type metadata accessor for IETranscriptLatencyIntervalSpec();
  uint64_t v2 = (_OWORD *)swift_allocObject();
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  if (qword_26A3F87D0 != -1) {
    swift_once();
  }
  uint64_t v86 = v0;
  uint64_t v3 = qword_26A3F9E30;
  type metadata accessor for IETranscriptNextEvent(0);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent;
  uint64_t v6 = sub_259EFE840();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  *(void *)(v4 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v3;
  uint64_t v88 = type metadata accessor for IETranscriptEventFilter(0);
  uint64_t v89 = &off_2707DD9C0;
  uint64_t v85 = v88;
  v87[0] = v4;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v2 + 1));
  swift_endAccess();
  if (qword_26A3F87D8 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_26A3F9E38;
  type metadata accessor for IETranscriptLastEvent(0);
  uint64_t v9 = swift_allocObject();
  v7(v9 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v6);
  *(void *)(v9 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v8;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v9;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v2 + 56);
  swift_endAccess();
  v0[3] = v2;
  char v10 = (_OWORD *)swift_allocObject();
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[1] = 0u;
  uint64_t v11 = qword_26A3F9E30;
  uint64_t v12 = swift_allocObject();
  uint64_t v80 = v7;
  v7(v12 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v6);
  *(void *)(v12 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v11;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v12;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v10 + 1));
  swift_endAccess();
  if (qword_26A3F87E0 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_26A3F9E40;
  uint64_t v14 = swift_allocObject();
  uint64_t v83 = v6;
  v7(v14 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v6);
  *(void *)(v14 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v13;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v14;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v10 + 56);
  swift_endAccess();
  v0[4] = v10;
  char v15 = (_OWORD *)swift_allocObject();
  v15[2] = 0u;
  v15[3] = 0u;
  v15[4] = 0u;
  v15[5] = 0u;
  v15[1] = 0u;
  uint64_t v16 = qword_26A3F9E30;
  uint64_t v17 = swift_allocObject();
  v7(v17 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v6);
  *(void *)(v17 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v16;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v17;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v15 + 1));
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8898);
  uint64_t v81 = sub_259EFE8F0();
  uint64_t v18 = *(void *)(v81 - 8);
  unint64_t v84 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_259F002C0;
  uint64_t v82 = *(void (**)(unint64_t))(v18 + 104);
  unsigned int v78 = *MEMORY[0x263F516A0];
  v82(v19 + v84);
  uint64_t v20 = swift_allocObject();
  v7(v20 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v20 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v19;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v20;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v15 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v0[5] = v15;
  uint64_t v21 = (_OWORD *)swift_allocObject();
  v21[2] = 0u;
  _OWORD v21[3] = 0u;
  v21[4] = 0u;
  v21[5] = 0u;
  v21[1] = 0u;
  uint64_t v22 = qword_26A3F9E30;
  uint64_t v23 = swift_allocObject();
  v80(v23 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v23 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v22;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v23;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v21 + 1));
  swift_endAccess();
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_259F002C0;
  unsigned int v79 = *MEMORY[0x263F51640];
  v82(v24 + v84);
  uint64_t v25 = swift_allocObject();
  v80(v25 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v25 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v24;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v25;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v21 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v0[6] = v21;
  char v26 = (_OWORD *)swift_allocObject();
  _OWORD v26[2] = 0u;
  void v26[3] = 0u;
  v26[4] = 0u;
  v26[5] = 0u;
  v26[1] = 0u;
  uint64_t v27 = qword_26A3F9E30;
  uint64_t v28 = swift_allocObject();
  v80(v28 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v28 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v27;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v28;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v26 + 1));
  swift_endAccess();
  if (qword_26A3F87E8 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_26A3F9E48;
  uint64_t v30 = swift_allocObject();
  v80(v30 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v30 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v29;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v30;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v26 + 56);
  swift_endAccess();
  v86[7] = v26;
  char v31 = (_OWORD *)swift_allocObject();
  v31[2] = 0u;
  v31[3] = 0u;
  v31[4] = 0u;
  v31[5] = 0u;
  v31[1] = 0u;
  uint64_t v32 = qword_26A3F9E40;
  uint64_t v33 = swift_allocObject();
  v80(v33 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v33 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v32;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v33;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v31 + 1));
  swift_endAccess();
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v34 + v84, *MEMORY[0x263F51690], v81);
  uint64_t v35 = swift_allocObject();
  v80(v35 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v35 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v34;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v35;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v31 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v86[8] = v31;
  uint64_t v36 = (_OWORD *)swift_allocObject();
  v36[2] = 0u;
  v36[3] = 0u;
  v36[4] = 0u;
  v36[5] = 0u;
  v36[1] = 0u;
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v37 + v84, v78, v81);
  uint64_t v38 = swift_allocObject();
  v80(v38 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v38 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v37;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v38;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v36 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v39 = qword_26A3F9E40;
  uint64_t v40 = swift_allocObject();
  v80(v40 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v40 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v39;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v40;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v36 + 56);
  swift_endAccess();
  v86[9] = v36;
  char v41 = (_OWORD *)swift_allocObject();
  v41[2] = 0u;
  v41[3] = 0u;
  v41[4] = 0u;
  void v41[5] = 0u;
  v41[1] = 0u;
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v42 + v84, v79, v81);
  uint64_t v43 = swift_allocObject();
  v80(v43 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v43 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v42;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v43;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v41 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v44 = qword_26A3F9E40;
  uint64_t v45 = swift_allocObject();
  v80(v45 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v45 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v44;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v45;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v41 + 56);
  swift_endAccess();
  v86[10] = v41;
  uint64_t v46 = (_OWORD *)swift_allocObject();
  _OWORD v46[2] = 0u;
  void v46[3] = 0u;
  v46[4] = 0u;
  v46[5] = 0u;
  v46[1] = 0u;
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v47 + v84, v79, v81);
  uint64_t v48 = swift_allocObject();
  v80(v48 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v48 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v47;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v48;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v46 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v49 + v84, v78, v81);
  uint64_t v50 = swift_allocObject();
  v80(v50 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v50 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v49;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v50;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v46 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v86[11] = v46;
  uint64_t v51 = (_OWORD *)swift_allocObject();
  v51[2] = 0u;
  v51[3] = 0u;
  v51[4] = 0u;
  v51[5] = 0u;
  v51[1] = 0u;
  uint64_t v52 = qword_26A3F9E48;
  uint64_t v53 = swift_allocObject();
  v80(v53 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v53 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v52;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v53;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v51 + 1));
  swift_endAccess();
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v54 + v84, v79, v81);
  uint64_t v55 = swift_allocObject();
  v80(v55 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v55 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v54;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v55;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v51 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v86[12] = v51;
  unint64_t v56 = (_OWORD *)swift_allocObject();
  v56[2] = 0u;
  v56[3] = 0u;
  v56[4] = 0u;
  v56[5] = 0u;
  v56[1] = 0u;
  uint64_t v57 = qword_26A3F9E30;
  uint64_t v58 = swift_allocObject();
  v80(v58 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v58 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v57;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v58;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v56 + 1));
  swift_endAccess();
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v59 + v84, *MEMORY[0x263F51668], v81);
  uint64_t v60 = swift_allocObject();
  v80(v60 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v60 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v59;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v60;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v56 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v86[13] = v56;
  uint64_t v61 = (_OWORD *)swift_allocObject();
  v61[2] = 0u;
  v61[3] = 0u;
  v61[4] = 0u;
  v61[5] = 0u;
  v61[1] = 0u;
  uint64_t v62 = qword_26A3F9E30;
  uint64_t v63 = swift_allocObject();
  v80(v63 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v63 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v62;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v63;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v61 + 1));
  swift_endAccess();
  uint64_t v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v64 + v84, *MEMORY[0x263F51658], v81);
  uint64_t v65 = swift_allocObject();
  v80(v65 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v65 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v64;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v65;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v61 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v86[14] = v61;
  uint64_t v66 = (_OWORD *)swift_allocObject();
  v66[2] = 0u;
  v66[3] = 0u;
  v66[4] = 0u;
  v66[5] = 0u;
  v66[1] = 0u;
  uint64_t v67 = qword_26A3F9E30;
  uint64_t v68 = swift_allocObject();
  v80(v68 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v68 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v67;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v68;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v66 + 1));
  swift_endAccess();
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v69 + v84, *MEMORY[0x263F51670], v81);
  uint64_t v70 = swift_allocObject();
  v80(v70 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v70 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v69;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v70;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v66 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v86[15] = v66;
  uint64_t v71 = (_OWORD *)swift_allocObject();
  v71[2] = 0u;
  v71[3] = 0u;
  v71[4] = 0u;
  v71[5] = 0u;
  v71[1] = 0u;
  uint64_t v72 = swift_allocObject();
  *(_OWORD *)(v72 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v72 + v84, *MEMORY[0x263F51650], v81);
  uint64_t v73 = swift_allocObject();
  v80(v73 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v73 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v72;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v73;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)(v71 + 1));
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_259F002C0;
  ((void (*)(unint64_t, void, uint64_t))v82)(v74 + v84, *MEMORY[0x263F51660], v81);
  uint64_t v75 = swift_allocObject();
  v80(v75 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_foundEvent, 1, 1, v83);
  *(void *)(v75 + OBJC_IVAR____TtC20PnROnDeviceFramework23IETranscriptEventFilter_targetEventTypes) = v74;
  uint64_t v88 = v85;
  uint64_t v89 = &off_2707DD9C0;
  v87[0] = v75;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259ED11CC((uint64_t)v87, (uint64_t)v71 + 56);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v76 = MEMORY[0x263F8EE88];
  double result = v86;
  v86[16] = v71;
  v86[17] = v76;
  return result;
}

uint64_t sub_259EFAB84(uint64_t a1)
{
  return sub_259EF73E8(a1);
}

uint64_t sub_259EFABA8()
{
  uint64_t v1 = sub_259EFE940();
  uint64_t v88 = *(void *)(v1 - 8);
  uint64_t v89 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v87 = (char *)&v83 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8890);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v83 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_259EFE9E0();
  uint64_t v85 = *(void *)(v5 - 8);
  uint64_t v86 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v84 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CA0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8CA8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v91 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_259EFE8D0();
  uint64_t v90 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v83 - v22;
  if (sub_259EFC004())
  {
    v0[7] = sub_259EFE7C0();
    v0[8] = v24;
    swift_bridgeObjectRelease();
    v0[5] = sub_259EFE810();
    v0[6] = v25;
    swift_bridgeObjectRelease();
  }
  uint64_t v92 = v0;
  sub_259EFE7D0();
  uint64_t v26 = sub_259EFE8B0();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v17, 1, v26) == 1)
  {
    sub_259ED1170((uint64_t)v17, &qword_26A3F8870);
    uint64_t v28 = sub_259EFE920();
    uint64_t v29 = (uint64_t)v23;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v23, 1, 1, v28);
    return sub_259ED1170(v29, &qword_26A3F8878);
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v26);
  uint64_t v29 = (uint64_t)v23;
  uint64_t v30 = sub_259EFE920();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v23, 1, v30) == 1) {
    return sub_259ED1170(v29, &qword_26A3F8878);
  }
  sub_259EED0EC((uint64_t)v23, (uint64_t)v21, &qword_26A3F8878);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v31 + 88))(v21, v30);
  if (result == *MEMORY[0x263F51718])
  {
    (*(void (**)(char *, uint64_t))(v31 + 96))(v21, v30);
    uint64_t v33 = v90;
    (*(void (**)(char *, char *, uint64_t))(v90 + 32))(v14, v21, v12);
    sub_259EFE8C0();
    uint64_t v34 = sub_259EFE9C0();
    uint64_t v35 = *(void *)(v34 - 8);
    int v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v9, 1, v34);
    uint64_t v37 = v92;
    if (v36 == 1)
    {
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
      sub_259ED1170((uint64_t)v9, &qword_26A3F8CA0);
      uint64_t v38 = sub_259EFEA30();
      uint64_t v39 = (uint64_t)v91;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v91, 1, 1, v38);
    }
    else
    {
      uint64_t v39 = (uint64_t)v91;
      sub_259EFE9B0();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v34);
      uint64_t v45 = sub_259EFEA30();
      uint64_t v46 = *(void *)(v45 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v39, 1, v45) != 1)
      {
        int v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 88))(v39, v45);
        int v52 = *MEMORY[0x263F51758];
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8))(v39, v45);
        if (v51 == v52)
        {
          uint64_t v53 = v37[17];
          BOOL v43 = __OFADD__(v53, 1);
          uint64_t v54 = v53 + 1;
          if (!v43)
          {
            v37[17] = v54;
            return sub_259ED1170(v29, &qword_26A3F8878);
          }
          goto LABEL_52;
        }
        goto LABEL_14;
      }
    }
    uint64_t result = sub_259ED1170(v39, &qword_26A3F8CA8);
LABEL_14:
    uint64_t v47 = v37[9];
    BOOL v43 = __OFADD__(v47, 1);
    uint64_t v48 = v47 + 1;
    if (!v43)
    {
      v37[9] = v48;
      return sub_259ED1170(v29, &qword_26A3F8878);
    }
    __break(1u);
    goto LABEL_50;
  }
  uint64_t v40 = v92;
  if (result == *MEMORY[0x263F516C8])
  {
    v40[3] = sub_259EFE820();
    v40[4] = v41;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v42 = v40[10];
    BOOL v43 = __OFADD__(v42, 1);
    uint64_t v44 = v42 + 1;
    if (v43)
    {
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    v40[10] = v44;
LABEL_39:
    (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v30);
    return sub_259ED1170(v29, &qword_26A3F8878);
  }
  if (result == *MEMORY[0x263F516F8])
  {
    uint64_t v49 = v92[13];
    BOOL v43 = __OFADD__(v49, 1);
    uint64_t v50 = v49 + 1;
    if (v43)
    {
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    v92[13] = v50;
    goto LABEL_39;
  }
  if (result == *MEMORY[0x263F516E0])
  {
    uint64_t v55 = v92[11];
    BOOL v43 = __OFADD__(v55, 1);
    uint64_t v56 = v55 + 1;
    if (v43)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    v92[11] = v56;
    goto LABEL_39;
  }
  if (result == *MEMORY[0x263F516D8])
  {
    (*(void (**)(char *, uint64_t))(v31 + 96))(v21, v30);
    uint64_t v58 = (uint64_t)v87;
    uint64_t v57 = v88;
    uint64_t v59 = v89;
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v88 + 32))(v87, v21, v89);
    uint64_t v60 = v40[18];
    BOOL v43 = __OFADD__(v60, 1);
    uint64_t v61 = v60 + 1;
    if (v43)
    {
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    v40[18] = v61;
    uint64_t v62 = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor27TranscriptProtoSessionErrorV_tFZ_0(v58);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
LABEL_28:
    v40[19] = v62;
    swift_release();
    return sub_259ED1170(v29, &qword_26A3F8878);
  }
  if (result == *MEMORY[0x263F516E8])
  {
    uint64_t v63 = v92[12];
    BOOL v43 = __OFADD__(v63, 1);
    uint64_t v64 = v63 + 1;
    if (v43)
    {
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    v92[12] = v64;
    goto LABEL_39;
  }
  if (result == *MEMORY[0x263F51710])
  {
    uint64_t v65 = v92[14];
    BOOL v43 = __OFADD__(v65, 1);
    uint64_t v66 = v65 + 1;
    if (v43)
    {
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    v92[14] = v66;
    goto LABEL_39;
  }
  if (result != *MEMORY[0x263F516F0]) {
    goto LABEL_39;
  }
  (*(void (**)(char *, uint64_t))(v31 + 96))(v21, v30);
  uint64_t v68 = v84;
  uint64_t v67 = v85;
  uint64_t v69 = v86;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v85 + 32))(v84, v21, v86);
  uint64_t v70 = v40[15];
  BOOL v43 = __OFADD__(v70, 1);
  uint64_t v71 = v70 + 1;
  if (v43)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v40[15] = v71;
  uint64_t v72 = (uint64_t)v83;
  sub_259EFE830();
  uint64_t v73 = sub_259EFE9A0();
  uint64_t v74 = *(void *)(v73 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v72, 1, v73) == 1)
  {
    sub_259ED1170(v72, &qword_26A3F8890);
LABEL_48:
    uint64_t v62 = _s20PnROnDeviceFramework23IEReliabilityCalculatorO14getFailureInfo4fromAA09IEFailureI0CSg23LighthouseDataProcessor30TranscriptProtoStatementResultV_tFZ_0();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v69);
    goto LABEL_28;
  }
  uint64_t v75 = sub_259EFE820();
  uint64_t v76 = v72;
  uint64_t v77 = v75;
  uint64_t v79 = v78;
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v76, v73);
  if (!v79) {
    goto LABEL_48;
  }
  if (v77 == 0x6F7365526E616C70 && v79 == 0xEE006E6F6974756CLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v80 = sub_259EFEF50();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v80 & 1) == 0) {
      goto LABEL_48;
    }
  }
  uint64_t v81 = v40[16];
  BOOL v43 = __OFADD__(v81, 1);
  uint64_t v82 = v81 + 1;
  if (!v43)
  {
    v40[16] = v82;
    goto LABEL_48;
  }
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_259EFB694()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 160, 7);
}

uint64_t type metadata accessor for PlannerGrainDimensionsSpec()
{
  return self;
}

double sub_259EFB708()
{
  *(unsigned char *)(v0 + 16) = 6;
  double result = 0.0;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_OWORD *)(v0 + 120) = 0u;
  *(_OWORD *)(v0 + 136) = 0u;
  *(void *)(v0 + 152) = 0;
  return result;
}

uint64_t sub_259EFB740()
{
  return sub_259EFABA8();
}

uint64_t sub_259EFB764(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_259EFEFD0();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_259EFBAE4(a2, v9, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_259EFB860()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8D08);
  uint64_t result = sub_259EFEE70();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    uint64_t v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_259EFEFD0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_259EFBAE4(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_259EFB860();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_259EFBC08();
      goto LABEL_14;
    }
    sub_259EFBDA0();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_259EFEFD0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_259EFEF60();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_259EFBC08()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8D08);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259EFEE60();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_259EFBDA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8D08);
  uint64_t result = sub_259EFEE70();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_259EFEFD0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259EFC004()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8890);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8870);
  MEMORY[0x270FA5388](v3 - 8);
  int64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - v10;
  sub_259EFE7D0();
  uint64_t v12 = sub_259EFE8B0();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v12) == 1)
  {
    sub_259ED1170((uint64_t)v5, &qword_26A3F8870);
    uint64_t v14 = sub_259EFE920();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
LABEL_15:
    uint64_t v18 = 0;
    goto LABEL_16;
  }
  sub_259EFE8A0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
  uint64_t v15 = sub_259EFE920();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) == 1) {
    goto LABEL_15;
  }
  sub_259EED0EC((uint64_t)v11, (uint64_t)v9, &qword_26A3F8878);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v9, v15);
  if (v17 != *MEMORY[0x263F51718])
  {
    if (v17 == *MEMORY[0x263F516F0])
    {
      sub_259EFE830();
      uint64_t v19 = sub_259EFE9A0();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v2, 1, v19) == 1)
      {
        sub_259ED1170((uint64_t)v2, &qword_26A3F8890);
      }
      else
      {
        uint64_t v21 = sub_259EFE820();
        uint64_t v23 = v22;
        (*(void (**)(char *, uint64_t))(v20 + 8))(v2, v19);
        if (v23)
        {
          if (v21 == 0x726F747563657865 && v23 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
          char v24 = sub_259EFEF50();
          swift_bridgeObjectRelease();
          if (v24) {
            goto LABEL_5;
          }
        }
      }
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v15);
    goto LABEL_15;
  }
LABEL_5:
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v15);
  uint64_t v18 = 1;
LABEL_16:
  sub_259ED1170((uint64_t)v11, &qword_26A3F8878);
  return v18;
}

uint64_t sub_259EFC43C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t IEFailureTypeEnum.rawValue.getter()
{
  return qword_259F01A30[*v0];
}

PnROnDeviceFramework::IEFailureTypeEnum_optional __swiftcall IEFailureTypeEnum.init(rawValue:)(Swift::Int64 rawValue)
{
  if (rawValue <= 55100)
  {
    char v2 = 44;
    switch(rawValue)
    {
      case 5401:
        char *v1 = 38;
        break;
      case 5402:
        char *v1 = 39;
        break;
      case 5403:
      case 5404:
      case 5405:
      case 5406:
      case 5407:
      case 5408:
      case 5409:
      case 5410:
      case 5411:
      case 5412:
      case 5413:
      case 5414:
      case 5415:
      case 5416:
      case 5417:
      case 5418:
      case 5419:
      case 5420:
      case 5421:
      case 5422:
      case 5423:
      case 5424:
      case 5425:
      case 5426:
      case 5427:
      case 5428:
      case 5429:
      case 5430:
      case 5431:
      case 5432:
      case 5433:
      case 5434:
      case 5435:
      case 5436:
      case 5437:
      case 5438:
      case 5439:
      case 5440:
      case 5441:
      case 5442:
      case 5443:
      case 5444:
      case 5445:
      case 5446:
      case 5447:
      case 5448:
      case 5449:
      case 5450:
      case 5451:
      case 5452:
      case 5453:
      case 5454:
      case 5455:
      case 5456:
      case 5457:
      case 5458:
      case 5459:
      case 5460:
      case 5461:
      case 5462:
      case 5463:
      case 5464:
      case 5465:
      case 5466:
      case 5467:
      case 5468:
      case 5469:
      case 5470:
      case 5471:
      case 5472:
      case 5473:
      case 5474:
      case 5475:
      case 5476:
      case 5477:
      case 5478:
      case 5479:
      case 5480:
      case 5481:
      case 5482:
      case 5483:
      case 5484:
      case 5485:
      case 5486:
      case 5487:
      case 5488:
      case 5489:
      case 5490:
      case 5491:
      case 5492:
      case 5493:
      case 5494:
      case 5495:
      case 5496:
      case 5497:
      case 5498:
      case 5499:
      case 5500:
      case 5505:
      case 5506:
      case 5507:
      case 5508:
      case 5509:
      case 5510:
      case 5513:
      case 5514:
      case 5515:
      case 5516:
      case 5517:
      case 5518:
      case 5519:
      case 5520:
      case 5523:
      case 5524:
      case 5525:
      case 5526:
      case 5527:
      case 5528:
      case 5529:
      case 5530:
        goto LABEL_92;
      case 5501:
        char *v1 = 43;
        break;
      case 5502:
LABEL_25:
        char *v1 = v2;
        break;
      case 5503:
        char *v1 = 45;
        break;
      case 5504:
        char *v1 = 46;
        break;
      case 5511:
        char *v1 = 47;
        break;
      case 5512:
        char *v1 = 48;
        break;
      case 5521:
        char *v1 = 49;
        break;
      case 5522:
        char *v1 = 50;
        break;
      case 5531:
        char *v1 = 51;
        break;
      case 5532:
        char *v1 = 52;
        break;
      case 5533:
        char *v1 = 53;
        break;
      case 5534:
        char *v1 = 54;
        break;
      case 5535:
        char *v1 = 55;
        break;
      case 5536:
        char *v1 = 56;
        break;
      case 5537:
        char *v1 = 57;
        break;
      default:
        if ((unint64_t)rawValue <= 0xD73C)
        {
          char v2 = 0;
          switch(rawValue)
          {
            case 0:
              goto LABEL_25;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 43:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
              goto LABEL_92;
            case 50:
              char v2 = 1;
              goto LABEL_25;
            case 51:
              char *v1 = 2;
              return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
            case 52:
              char *v1 = 3;
              return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
            case 53:
              char *v1 = 4;
              return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
            case 54:
              char *v1 = 5;
              return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
            case 55:
              char *v1 = 6;
              return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
            default:
              JUMPOUT(0);
          }
        }
        switch(rawValue)
        {
          case 5201:
            char *v1 = 7;
            break;
          case 5202:
            char *v1 = 8;
            break;
          case 5203:
            char *v1 = 9;
            break;
          case 5204:
            char *v1 = 10;
            break;
          case 5205:
            char *v1 = 11;
            break;
          case 5206:
            char *v1 = 12;
            break;
          case 5207:
            char *v1 = 13;
            break;
          default:
            goto LABEL_92;
        }
        break;
    }
    return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
  }
  if (rawValue > 520500)
  {
    if (rawValue <= 520700)
    {
      switch(rawValue)
      {
        case 520501:
          char *v1 = 25;
          break;
        case 520502:
          char *v1 = 26;
          break;
        case 520503:
          char *v1 = 27;
          break;
        case 520504:
          char *v1 = 28;
          break;
        case 520505:
          char *v1 = 29;
          break;
        case 520506:
          char *v1 = 30;
          break;
        case 520507:
          char *v1 = 31;
          break;
        case 520508:
          char *v1 = 32;
          break;
        case 520601:
          char *v1 = 33;
          break;
        case 520602:
          char *v1 = 34;
          break;
        case 520603:
          char *v1 = 35;
          break;
        default:
          goto LABEL_92;
      }
      return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
    }
    if (rawValue <= 540101)
    {
      switch(rawValue)
      {
        case 520701:
          char *v1 = 36;
          return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
        case 520702:
          char *v1 = 37;
          return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
        case 540101:
          char *v1 = 40;
          return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
    }
    else if (rawValue > 99994096)
    {
      if (rawValue == 99994097)
      {
        char *v1 = 60;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
      if (rawValue == 99994099)
      {
        char *v1 = 61;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
    }
    else
    {
      if (rawValue == 540102)
      {
        char *v1 = 41;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
      if (rawValue == 540103)
      {
        char *v1 = 42;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
    }
LABEL_92:
    char *v1 = 62;
    return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
  }
  if (rawValue <= 520300)
  {
    if (rawValue <= 520101)
    {
      switch(rawValue)
      {
        case 55101:
          char *v1 = 58;
          return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
        case 55102:
          char *v1 = 59;
          return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
        case 520101:
          char *v1 = 14;
          return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
    }
    else if (rawValue > 520200)
    {
      if (rawValue == 520201)
      {
        char *v1 = 17;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
      if (rawValue == 520202)
      {
        char *v1 = 18;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
    }
    else
    {
      if (rawValue == 520102)
      {
        char *v1 = 15;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
      if (rawValue == 520103)
      {
        char *v1 = 16;
        return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
      }
    }
    goto LABEL_92;
  }
  switch(rawValue)
  {
    case 520301:
      char *v1 = 19;
      break;
    case 520302:
      char *v1 = 20;
      break;
    case 520303:
      char *v1 = 21;
      break;
    case 520304:
      char *v1 = 22;
      break;
    default:
      if (rawValue == 520401)
      {
        char *v1 = 23;
      }
      else
      {
        if (rawValue != 520402) {
          goto LABEL_92;
        }
        char *v1 = 24;
      }
      break;
  }
  return (PnROnDeviceFramework::IEFailureTypeEnum_optional)rawValue;
}

BOOL sub_259EFCEC8(char *a1, char *a2)
{
  return qword_259F01A30[*a1] == qword_259F01A30[*a2];
}

unint64_t sub_259EFCEF0()
{
  unint64_t result = qword_26A3F8D10;
  if (!qword_26A3F8D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F8D10);
  }
  return result;
}

uint64_t sub_259EFCF44()
{
  return sub_259EFF010();
}

uint64_t sub_259EFCF94()
{
  return sub_259EFF000();
}

uint64_t sub_259EFCFCC()
{
  return sub_259EFF010();
}

PnROnDeviceFramework::IEFailureTypeEnum_optional sub_259EFD018(Swift::Int64 *a1)
{
  return IEFailureTypeEnum.init(rawValue:)(*a1);
}

void sub_259EFD020(void *a1@<X8>)
{
  *a1 = qword_259F01A30[*v1];
}

uint64_t getEnumTagSinglePayload for IEFailureTypeEnum(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xC3) {
    goto LABEL_17;
  }
  if (a2 + 61 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 61) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 61;
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
      return (*a1 | (v4 << 8)) - 61;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 61;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x3E;
  int v8 = v6 - 62;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for IEFailureTypeEnum(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 61 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 61) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xC3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xC2)
  {
    unsigned int v6 = ((a2 - 195) >> 8) + 1;
    *unint64_t result = a2 + 61;
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
        JUMPOUT(0x259EFD194);
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
          *unint64_t result = a2 + 61;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IEFailureTypeEnum()
{
  return &type metadata for IEFailureTypeEnum;
}

uint64_t static SELFComponent.turn.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_26A3F8D18;
  id v1 = (id)qword_26A3F8D18;
  return v0;
}

void static SELFComponent.turn.setter(uint64_t a1)
{
  swift_beginAccess();
  int v2 = (void *)qword_26A3F8D18;
  qword_26A3F8D18 = a1;
}

uint64_t (*static SELFComponent.turn.modify())()
{
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for SELFComponent()
{
  return &type metadata for SELFComponent;
}

uint64_t PnRLatencyContextMetrics.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  sub_259EFEE80();
  sub_259EFECF0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3F8D20);
  sub_259EFECD0();
  sub_259EFECF0();
  swift_bridgeObjectRelease();
  sub_259EFECF0();
  sub_259EFECD0();
  sub_259EFECF0();
  swift_bridgeObjectRelease();
  sub_259EFECF0();
  if (v1 != 12 && v2 != 12) {
    sub_259EFEDA0();
  }
  sub_259EFECF0();
  swift_bridgeObjectRelease();
  sub_259EFECF0();
  return 0;
}

NSObject *PnRSiriTurnGrainSummary.createSiriTurnGrainSummarySELFEvent()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F8A00);
  MEMORY[0x270FA5388](v1 - 8);
  int v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_259EFE670();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v45 - v8;
  uint64_t v10 = v0[1];
  uint64_t v48 = *v0;
  uint64_t v49 = v10;
  uint64_t v11 = *((unsigned __int8 *)v0 + 16);
  unint64_t v12 = v0[3];
  uint64_t v13 = *((unsigned __int8 *)v0 + 32);
  unint64_t v14 = v0[5];
  uint64_t v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EA98]), sel_init);
  if (!v15) {
    goto LABEL_8;
  }
  uint64_t v16 = v15;
  id v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAD0]), sel_init);
  if (!v47)
  {

LABEL_8:
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_259EFEC00();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A3F8AB8);
    uint64_t v16 = sub_259EFEBF0();
    os_log_type_t v22 = sub_259EFEDC0();
    if (os_log_type_enabled(v16, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_259EC8000, v16, v22, "PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper init failed!", v23, 2u);
      MEMORY[0x25A2EF270](v23, -1, -1);
    }
    goto LABEL_32;
  }
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAA0]), sel_init);
  if (!v17)
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_259EFEC00();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A3F8AB8);
    uint64_t v25 = sub_259EFEBF0();
    os_log_type_t v26 = sub_259EFEDC0();
    BOOL v27 = os_log_type_enabled(v25, v26);
    id v28 = v47;
    if (!v27)
    {

      goto LABEL_32;
    }
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_259EC8000, v25, v26, "PNRODSchemaPNRODClientEventMetadata init failed!", v29, 2u);
    MEMORY[0x25A2EF270](v29, -1, -1);
LABEL_20:

LABEL_32:
    return 0;
  }
  id v46 = v17;
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EAC8]), sel_init);
  if (!v18)
  {
    if (qword_26B3246C0 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259EFEC00();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F8AB8);
    uint64_t v25 = sub_259EFEBF0();
    os_log_type_t v31 = sub_259EFEDC0();
    BOOL v32 = os_log_type_enabled(v25, v31);
    id v28 = v47;
    if (!v32)
    {

      goto LABEL_32;
    }
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_259EC8000, v25, v31, "PNROnDeviceProvisionalPNRIntervalDurationMetric init failed!", v33, 2u);
    MEMORY[0x25A2EF270](v33, -1, -1);

    goto LABEL_20;
  }
  double v19 = 0.0;
  if (v11 == 13)
  {
    uint64_t v20 = v4;
  }
  else
  {
    uint64_t v20 = v4;
    if (v11 != 12 && v13 != 12) {
      double v19 = ((double)v14 - (double)v12) / 1000000000.0;
    }
  }
  uint64_t v34 = v18;
  objc_msgSend(v18, sel_setMetricValue_, v19);
  uint64_t v35 = v50;
  if (v49)
  {
    sub_259EFE630();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v3, 1, v20) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v9, v3, v20);
      id v37 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v38 = (void *)sub_259EFE650();
      id v39 = objc_msgSend(v37, sel_initWithNSUUID_, v38);

      id v36 = v47;
      objc_msgSend(v47, sel_setTurnid_, v39);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v20);
      goto LABEL_30;
    }
    sub_259ED556C((uint64_t)v3);
  }
  id v36 = v47;
  objc_msgSend(v47, sel_setTurnid_, 0);
LABEL_30:
  objc_msgSend(v36, sel_setSrt_, v34);
  sub_259EFE660();
  id v40 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v41 = (void *)sub_259EFE650();
  id v42 = objc_msgSend(v40, sel_initWithNSUUID_, v41);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v20);
  id v43 = v46;
  objc_msgSend(v46, sel_setPnrodId_, v42);

  [v16 setEventMetadata:v43];
  [v16 setPnrodSiriTurnGrainSummary:v36];

  return v16;
}

void __swiftcall PnRSiriTurnGrainSummary.createProvisionalSELFEvent()(PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper_optional *__return_ptr retstr)
{
  uint64_t v2 = *(unsigned __int8 *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(unsigned __int8 *)(v1 + 32);
  unint64_t v5 = *(void *)(v1 + 40);
  uint64_t v30 = *(void *)(v1 + 8);
  uint64_t v6 = *(void *)(v1 + 56);
  uint64_t v7 = *(void *)(v1 + 72);
  uint64_t v8 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper), sel_init);
  if (v8)
  {
    unint64_t v9 = v8;
    id v10 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPnRSiriRequestGrainSummary), sel_init);
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = objc_msgSend(objc_allocWithZone((Class)PNROnDeviceProvisionalPNRIntervalDurationMetric), sel_init);
      if (!v12)
      {
        if (qword_26B3246C0 == -1)
        {
LABEL_13:
          uint64_t v17 = sub_259EFEC00();
          __swift_project_value_buffer(v17, (uint64_t)qword_26A3F8AB8);
          id v18 = sub_259EFEBF0();
          os_log_type_t v19 = sub_259EFEDC0();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl(&dword_259EC8000, v18, v19, "PNROnDeviceProvisionalPNRIntervalDurationMetric init failed!", v20, 2u);
            MEMORY[0x25A2EF270](v20, -1, -1);
          }
          else
          {
          }
          uint64_t v13 = v9;
          goto LABEL_49;
        }
LABEL_52:
        swift_once();
        goto LABEL_13;
      }
      uint64_t v13 = v12;
      if (v2 == 13)
      {
        [v12 setMetricValue:0.0];
        unint64_t v3 = 0;
      }
      else
      {
        double v21 = 0.0;
        if (v2 != 12 && v4 != 12) {
          double v21 = ((double)v5 - (double)v3) / 1000000000.0;
        }
        [v12 setMetricValue:v21];
        if (v2 == 12)
        {
          unint64_t v3 = 0;
        }
        else if ((v3 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
      }
      [v13 setStartTimestamp:v3];
      if ((v2 & 0xFE) == 0xC)
      {
        os_log_type_t v22 = 0;
      }
      else
      {
        SelectedEvent.rawValue.getter();
        os_log_type_t v22 = (void *)sub_259EFEC80();
        swift_bridgeObjectRelease();
      }
      [v13 setStartTimestampEventName:v22];

      BOOL v23 = v2 == 13 || v4 == 12;
      char v24 = v23;
      if (v23) {
        unint64_t v25 = 0;
      }
      else {
        unint64_t v25 = v5;
      }
      if ((v25 & 0x8000000000000000) == 0)
      {
        -[NSObject setEndTimestamp:](v13, sel_setEndTimestamp_);
        if (v24)
        {
          os_log_type_t v26 = 0;
        }
        else
        {
          SelectedEvent.rawValue.getter();
          os_log_type_t v26 = (void *)sub_259EFEC80();
          swift_bridgeObjectRelease();
        }
        [v13 setEndTimestampEventName:v26];

        objc_msgSend(v11, sel_setSrt_, v13);
        if (v6) {
          BOOL v27 = (void *)sub_259EFEC80();
        }
        else {
          BOOL v27 = 0;
        }
        objc_msgSend(v11, sel_setError_, v27);

        if (v7) {
          id v28 = (void *)sub_259EFEC80();
        }
        else {
          id v28 = 0;
        }
        objc_msgSend(v11, sel_setRequestStatus_, v28);

        if (v30) {
          uint64_t v29 = (void *)sub_259EFEC80();
        }
        else {
          uint64_t v29 = 0;
        }
        objc_msgSend(v11, sel_setTurnId_, v29);

        [v9 setSiriRequestGrainMetrics:v11];
        goto LABEL_49;
      }
      goto LABEL_51;
    }
  }
  if (qword_26B3246C0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_259EFEC00();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A3F8AB8);
  uint64_t v13 = sub_259EFEBF0();
  os_log_type_t v15 = sub_259EFEDC0();
  if (os_log_type_enabled(v13, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_259EC8000, v13, v15, "PNROnDeviceProvisionalPnROnDeviceFrameworkWrapper init failed!", v16, 2u);
    MEMORY[0x25A2EF270](v16, -1, -1);
  }
LABEL_49:
}

double PnRLatencyContextMetrics.metricsValue.getter()
{
  if (*(unsigned char *)v0 != 12 && *(unsigned char *)(v0 + 16) != 12) {
    return ((double)*(unint64_t *)(v0 + 24) - (double)*(unint64_t *)(v0 + 8)) / 1000000000.0;
  }
  return result;
}

double sub_259EFDF44()
{
  if (*(unsigned char *)v0 != 12 && *(unsigned char *)(v0 + 16) != 12) {
    return ((double)*(unint64_t *)(v0 + 24) - (double)*(unint64_t *)(v0 + 8)) / 1000000000.0;
  }
  return result;
}

uint64_t PnRSiriTurnGrainSummary.description.getter()
{
  return 0;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PnRLatencyContextMetrics(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF4 && a1[32]) {
    return (*(_DWORD *)a1 + 244);
  }
  if (*a1 <= 0xCu) {
    int v3 = 12;
  }
  else {
    int v3 = *a1;
  }
  int v4 = v3 - 13;
  if (*a1 < 0xCu) {
    int v5 = -1;
  }
  else {
    int v5 = v4;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PnRLatencyContextMetrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF3)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 244;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF4) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF4) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 12;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PnRLatencyContextMetrics()
{
  return &type metadata for PnRLatencyContextMetrics;
}

ValueMetadata *type metadata accessor for PnRDimension()
{
  return &type metadata for PnRDimension;
}

uint64_t destroy for PnRSiriTurnGrainSummary()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PnRSiriTurnGrainSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PnRSiriTurnGrainSummary(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for PnRSiriTurnGrainSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PnRSiriTurnGrainSummary(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 96)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PnRSiriTurnGrainSummary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PnRSiriTurnGrainSummary()
{
  return &type metadata for PnRSiriTurnGrainSummary;
}

uint64_t sub_259EFE5B0()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_259EFE5C0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_259EFE5D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_259EFE5E0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_259EFE5F0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_259EFE600()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_259EFE610()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_259EFE620()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_259EFE630()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_259EFE640()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_259EFE650()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_259EFE660()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_259EFE670()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_259EFE680()
{
  return MEMORY[0x270F10B28]();
}

uint64_t sub_259EFE690()
{
  return MEMORY[0x270F72C28]();
}

uint64_t sub_259EFE6A0()
{
  return MEMORY[0x270F72C30]();
}

uint64_t sub_259EFE6B0()
{
  return MEMORY[0x270F72C38]();
}

uint64_t sub_259EFE6C0()
{
  return MEMORY[0x270F66148]();
}

uint64_t sub_259EFE6D0()
{
  return MEMORY[0x270F661B8]();
}

uint64_t sub_259EFE6E0()
{
  return MEMORY[0x270F44660]();
}

uint64_t sub_259EFE6F0()
{
  return MEMORY[0x270F446A0]();
}

uint64_t sub_259EFE700()
{
  return MEMORY[0x270F44CC0]();
}

uint64_t sub_259EFE710()
{
  return MEMORY[0x270F472B8]();
}

uint64_t sub_259EFE720()
{
  return MEMORY[0x270F472C0]();
}

uint64_t sub_259EFE730()
{
  return MEMORY[0x270F472C8]();
}

uint64_t sub_259EFE740()
{
  return MEMORY[0x270F472D0]();
}

uint64_t sub_259EFE750()
{
  return MEMORY[0x270F472D8]();
}

uint64_t sub_259EFE760()
{
  return MEMORY[0x270F472E0]();
}

uint64_t sub_259EFE770()
{
  return MEMORY[0x270F472E8]();
}

uint64_t sub_259EFE780()
{
  return MEMORY[0x270F472F0]();
}

uint64_t sub_259EFE790()
{
  return MEMORY[0x270F472F8]();
}

uint64_t sub_259EFE7A0()
{
  return MEMORY[0x270F47300]();
}

uint64_t sub_259EFE7B0()
{
  return MEMORY[0x270F47308]();
}

uint64_t sub_259EFE7C0()
{
  return MEMORY[0x270F47310]();
}

uint64_t sub_259EFE7D0()
{
  return MEMORY[0x270F47318]();
}

uint64_t sub_259EFE7E0()
{
  return MEMORY[0x270F47320]();
}

uint64_t sub_259EFE7F0()
{
  return MEMORY[0x270F47328]();
}

uint64_t sub_259EFE800()
{
  return MEMORY[0x270F47330]();
}

uint64_t sub_259EFE810()
{
  return MEMORY[0x270F47338]();
}

uint64_t sub_259EFE820()
{
  return MEMORY[0x270F47340]();
}

uint64_t sub_259EFE830()
{
  return MEMORY[0x270F47348]();
}

uint64_t sub_259EFE840()
{
  return MEMORY[0x270F47350]();
}

uint64_t sub_259EFE850()
{
  return MEMORY[0x270F47358]();
}

uint64_t sub_259EFE860()
{
  return MEMORY[0x270F47360]();
}

uint64_t sub_259EFE870()
{
  return MEMORY[0x270F47368]();
}

uint64_t sub_259EFE880()
{
  return MEMORY[0x270F47370]();
}

uint64_t sub_259EFE890()
{
  return MEMORY[0x270F47378]();
}

uint64_t sub_259EFE8A0()
{
  return MEMORY[0x270F47380]();
}

uint64_t sub_259EFE8B0()
{
  return MEMORY[0x270F47388]();
}

uint64_t sub_259EFE8C0()
{
  return MEMORY[0x270F47390]();
}

uint64_t sub_259EFE8D0()
{
  return MEMORY[0x270F47398]();
}

uint64_t sub_259EFE8E0()
{
  return MEMORY[0x270F473A0]();
}

uint64_t sub_259EFE8F0()
{
  return MEMORY[0x270F473A8]();
}

uint64_t sub_259EFE900()
{
  return MEMORY[0x270F473B0]();
}

uint64_t sub_259EFE910()
{
  return MEMORY[0x270F473B8]();
}

uint64_t sub_259EFE920()
{
  return MEMORY[0x270F473C0]();
}

uint64_t sub_259EFE930()
{
  return MEMORY[0x270F473C8]();
}

uint64_t sub_259EFE940()
{
  return MEMORY[0x270F473D0]();
}

uint64_t sub_259EFE950()
{
  return MEMORY[0x270F473D8]();
}

uint64_t sub_259EFE960()
{
  return MEMORY[0x270F473E0]();
}

uint64_t sub_259EFE970()
{
  return MEMORY[0x270F473E8]();
}

uint64_t sub_259EFE980()
{
  return MEMORY[0x270F473F0]();
}

uint64_t sub_259EFE990()
{
  return MEMORY[0x270F473F8]();
}

uint64_t sub_259EFE9A0()
{
  return MEMORY[0x270F47400]();
}

uint64_t sub_259EFE9B0()
{
  return MEMORY[0x270F47408]();
}

uint64_t sub_259EFE9C0()
{
  return MEMORY[0x270F47410]();
}

uint64_t sub_259EFE9D0()
{
  return MEMORY[0x270F47418]();
}

uint64_t sub_259EFE9E0()
{
  return MEMORY[0x270F47420]();
}

uint64_t sub_259EFE9F0()
{
  return MEMORY[0x270F47428]();
}

uint64_t sub_259EFEA00()
{
  return MEMORY[0x270F47430]();
}

uint64_t sub_259EFEA10()
{
  return MEMORY[0x270F47438]();
}

uint64_t sub_259EFEA20()
{
  return MEMORY[0x270F47440]();
}

uint64_t sub_259EFEA30()
{
  return MEMORY[0x270F47448]();
}

uint64_t sub_259EFEA40()
{
  return MEMORY[0x270F47450]();
}

uint64_t sub_259EFEA50()
{
  return MEMORY[0x270F47458]();
}

uint64_t sub_259EFEA60()
{
  return MEMORY[0x270F47460]();
}

uint64_t sub_259EFEA70()
{
  return MEMORY[0x270F47468]();
}

uint64_t sub_259EFEA80()
{
  return MEMORY[0x270F47470]();
}

uint64_t sub_259EFEA90()
{
  return MEMORY[0x270F47478]();
}

uint64_t sub_259EFEAA0()
{
  return MEMORY[0x270F47480]();
}

uint64_t sub_259EFEAB0()
{
  return MEMORY[0x270F47488]();
}

uint64_t sub_259EFEAC0()
{
  return MEMORY[0x270F47490]();
}

uint64_t sub_259EFEAD0()
{
  return MEMORY[0x270F47498]();
}

uint64_t sub_259EFEAE0()
{
  return MEMORY[0x270F474A0]();
}

uint64_t sub_259EFEAF0()
{
  return MEMORY[0x270F474A8]();
}

uint64_t sub_259EFEB00()
{
  return MEMORY[0x270F08588]();
}

uint64_t sub_259EFEB20()
{
  return MEMORY[0x270F085B0]();
}

uint64_t sub_259EFEB30()
{
  return MEMORY[0x270F085C0]();
}

uint64_t sub_259EFEB40()
{
  return MEMORY[0x270F085E0]();
}

uint64_t sub_259EFEB50()
{
  return MEMORY[0x270F085F0]();
}

uint64_t sub_259EFEB60()
{
  return MEMORY[0x270F08618]();
}

uint64_t sub_259EFEB70()
{
  return MEMORY[0x270F08630]();
}

uint64_t sub_259EFEB80()
{
  return MEMORY[0x270F08638]();
}

uint64_t sub_259EFEB90()
{
  return MEMORY[0x270F08640]();
}

uint64_t sub_259EFEBA0()
{
  return MEMORY[0x270F41EE0]();
}

uint64_t sub_259EFEBB0()
{
  return MEMORY[0x270F41EE8]();
}

uint64_t sub_259EFEBC0()
{
  return MEMORY[0x270F43238]();
}

uint64_t sub_259EFEBD0()
{
  return MEMORY[0x270F43248]();
}

uint64_t sub_259EFEBE0()
{
  return MEMORY[0x270F43260]();
}

uint64_t sub_259EFEBF0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259EFEC00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259EFEC10()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_259EFEC20()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_259EFEC30()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_259EFEC40()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_259EFEC50()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_259EFEC60()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_259EFEC70()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_259EFEC80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_259EFEC90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_259EFECA0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_259EFECB0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_259EFECC0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_259EFECD0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_259EFECE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259EFECF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259EFED00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259EFED10()
{
  return MEMORY[0x270F08650]();
}

uint64_t sub_259EFED20()
{
  return MEMORY[0x270F08658]();
}

uint64_t sub_259EFED30()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_259EFED40()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_259EFED50()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_259EFED60()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_259EFED70()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_259EFED80()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_259EFED90()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_259EFEDA0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_259EFEDB0()
{
  return MEMORY[0x270F66218]();
}

uint64_t sub_259EFEDC0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_259EFEDD0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_259EFEDE0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_259EFEDF0()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_259EFEE00()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_259EFEE10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_259EFEE20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_259EFEE30()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_259EFEE40()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_259EFEE50()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_259EFEE60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_259EFEE70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_259EFEE80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_259EFEE90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_259EFEEA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_259EFEEB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_259EFEEC0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_259EFEED0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_259EFEEE0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_259EFEEF0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_259EFEF00()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_259EFEF10()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_259EFEF20()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_259EFEF30()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_259EFEF40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_259EFEF50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259EFEF60()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_259EFEF70()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_259EFEFA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_259EFEFB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_259EFEFC0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_259EFEFD0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_259EFEFE0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259EFEFF0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_259EFF000()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_259EFF010()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
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

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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