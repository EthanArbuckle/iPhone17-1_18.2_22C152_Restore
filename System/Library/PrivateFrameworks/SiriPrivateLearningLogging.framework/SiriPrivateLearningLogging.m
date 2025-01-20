id PLLoggingXPCServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t vars8;

  v8 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD4B410];
  v1 = (void *)MEMORY[0x263EFFA08];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:3];
  v3 = objc_msgSend(v1, "setWithArray:", v2, v5, v6);
  [v0 setClasses:v3 forSelector:sel_storeInstrumentationWithEvents_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t sub_21C978198(uint64_t a1)
{
  return sub_21C9782A0(a1, qword_267C936A8);
}

uint64_t sub_21C9781BC(uint64_t a1)
{
  return sub_21C9782A0(a1, qword_267C936C0);
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

uint64_t sub_21C97827C(uint64_t a1)
{
  return sub_21C9782A0(a1, qword_267C936D8);
}

uint64_t sub_21C9782A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21C9843C8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21C9843B8();
}

void *sub_21C978318@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_21C978324(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

const char *SiriPLUSFeatureFlag.domain.getter()
{
  return "SiriPLUS";
}

const char *SiriPLUSFeatureFlag.feature.getter()
{
  result = "Logging";
  switch(*v0)
  {
    case 1:
      result = "Analytics";
      break;
    case 2:
      result = "AnalyticsMaintenance";
      break;
    case 3:
      result = "AnalyticsEvents";
      break;
    case 4:
      result = "PICSRuntime";
      break;
    default:
      return result;
  }
  return result;
}

BOOL static SiriPLUSFeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SiriPLUSFeatureFlag.hash(into:)()
{
  return sub_21C984788();
}

uint64_t SiriPLUSFeatureFlag.hashValue.getter()
{
  return sub_21C984798();
}

BOOL sub_21C978460(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21C978474()
{
  return sub_21C984798();
}

uint64_t sub_21C9784BC()
{
  return sub_21C984788();
}

uint64_t sub_21C9784E8()
{
  return sub_21C984798();
}

unint64_t sub_21C978530()
{
  unint64_t result = qword_267C934E0;
  if (!qword_267C934E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C934E0);
  }
  return result;
}

const char *sub_21C978584()
{
  return "SiriPLUS";
}

const char *sub_21C978598()
{
  unint64_t result = "Logging";
  switch(*v0)
  {
    case 1:
      unint64_t result = "Analytics";
      break;
    case 2:
      unint64_t result = "AnalyticsMaintenance";
      break;
    case 3:
      unint64_t result = "AnalyticsEvents";
      break;
    case 4:
      unint64_t result = "PICSRuntime";
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  const char *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriPLUSFeatureFlag(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriPLUSFeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
    const char *result = a2 + 4;
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
        JUMPOUT(0x21C978798);
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
          const char *result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_21C9787C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21C9787CC(unsigned char *result, char a2)
{
  const char *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriPLUSFeatureFlag()
{
  return &type metadata for SiriPLUSFeatureFlag;
}

uint64_t sub_21C9787E4()
{
  type metadata accessor for SELFStoreFilter();
  uint64_t result = sub_21C978814();
  qword_267C936F0 = result;
  return result;
}

uint64_t sub_21C978814()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  int v2 = (void *)sub_21C984418();
  id v3 = objc_msgSend(v1, sel_objectForInfoDictionaryKey_, v2);

  if (v3)
  {
    sub_21C9845E8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_21C979D5C((uint64_t)&v13, (uint64_t)v15);
  sub_21C979E08((uint64_t)v15, (uint64_t)&v13);
  if (*((void *)&v14 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C93508);
    if (swift_dynamicCast())
    {
      unint64_t v4 = v12;
      goto LABEL_13;
    }
  }
  else
  {
    sub_21C979E70((uint64_t)&v13);
  }
  if (qword_267C933F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21C9843C8();
  __swift_project_value_buffer(v5, (uint64_t)qword_267C934E8);
  unsigned int v6 = sub_21C9843A8();
  os_log_type_t v7 = sub_21C984548();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(void *)&long long v13 = v9;
    *(_DWORD *)int v8 = 136315138;
    sub_21C97F130(0xD000000000000017, 0x800000021C985380, (uint64_t *)&v13);
    sub_21C9845C8();
    _os_log_impl(&dword_21C976000, v6, v7, "Bundle info is missing %s, using an empty allow list", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B37E0](v9, -1, -1);
    MEMORY[0x21D4B37E0](v8, -1, -1);
  }

  unint64_t v4 = sub_21C979BEC(MEMORY[0x263F8EE78]);
LABEL_13:
  type metadata accessor for SELFStoreFilter();
  uint64_t v10 = swift_allocObject();
  sub_21C978ABC(v4);
  sub_21C979E70((uint64_t)v15);
  return v10;
}

uint64_t sub_21C978ABC(uint64_t a1)
{
  uint64_t v42 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v43 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  os_log_type_t v7 = (char *)MEMORY[0x263F8EE78];
  int v8 = (void *)MEMORY[0x263F8EE78];
  while (v4)
  {
    unint64_t v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v10 = v9 | (v6 << 6);
LABEL_26:
    if (*(unsigned char *)(*(void *)(a1 + 56) + v10) == 1)
    {
      long long v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      swift_bridgeObjectRetain();
      id v17 = (id)sub_21C984418();
      if (([v17 isEqualToString:@"UNKNOWN_EVENT"] & 1) == 0)
      {
        if ([v17 isEqualToString:@"UEI_CLIENT_EVENT"])
        {
          int v25 = 1;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"UEI_SERVER_EVENT"])
        {
          int v25 = 2;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DAILY_DEVICE_STATUS"])
        {
          int v25 = 3;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"MT_CLIENT_EVENT"])
        {
          int v25 = 4;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PROACTIVE_EVENT_TRACKER"])
        {
          int v25 = 5;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ORDERED_ANY_EVENT"])
        {
          int v25 = 6;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PROVISIONAL_EVENT"])
        {
          int v25 = 7;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SIRI_UNDER_TEST_EVENT"])
        {
          int v25 = 8;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"REQUEST_LINK_EVENT"])
        {
          int v25 = 9;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ABE_CLIENT_EVENT"])
        {
          int v25 = 10;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ABE_SERVER_EVENT"])
        {
          int v25 = 11;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"FLOW_SERVER_EVENT"])
        {
          int v25 = 12;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"FLOW_CLIENT_EVENT"])
        {
          int v25 = 13;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CAM_CLIENT_EVENT"])
        {
          int v25 = 14;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"UNIFIED_SIRI_PERFORMANCE_EVENT"])
        {
          int v25 = 15;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GRR_CLIENT_EVENT"])
        {
          int v25 = 16;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DIM_CLIENT_EVENT"])
        {
          int v25 = 17;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"NLX_CLIENT_EVENT"])
        {
          int v25 = 18;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ORCH_CLIENT_EVENT"])
        {
          int v25 = 19;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ASR_CLIENT_EVENT"])
        {
          int v25 = 20;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DATA_UPLOAD_EVENT"])
        {
          int v25 = 21;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"IH_CLIENT_EVENT"])
        {
          int v25 = 22;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"MH_CLIENT_EVENT"])
        {
          int v25 = 23;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"TTS_CLIENT_EVENT"])
        {
          int v25 = 24;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CLP_CLIENT_EVENT"])
        {
          int v25 = 25;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"RR_CLIENT_EVENT"])
        {
          int v25 = 26;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CNV_CLIENT_EVENT"])
        {
          int v25 = 27;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ANC_CLIENT_EVENT"])
        {
          int v25 = 28;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ANC_SERVER_EVENT"])
        {
          int v25 = 29;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DELETE_HISTORY_TRIGGER_SERVER_EVENT"])
        {
          int v25 = 30;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"HAL_CLIENT_EVENT"])
        {
          int v25 = 31;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"NET_CLIENT_EVENT"])
        {
          int v25 = 32;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SAD_CLIENT_EVENT"])
        {
          int v25 = 33;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DFI_DATA_EVENT"])
        {
          int v25 = 34;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SERVER_ORDERED_ANY_EVENT"])
        {
          int v25 = 35;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SERVER_REQUEST_LINK_EVENT"])
        {
          int v25 = 36;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DODML_CLIENT_EVENT"])
        {
          int v25 = 37;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PLUS_CLIENT_EVENT"])
        {
          int v25 = 38;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"EXP_SEARCH_CLIENT_EVENT"])
        {
          int v25 = 39;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"EXP_SIRI_CLIENT_EVENT"])
        {
          int v25 = 40;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SRST_CLIENT_EVENT"])
        {
          int v25 = 41;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"POMMES_CLIENT_EVENT"])
        {
          int v25 = 42;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"MT_CLIENT_EVENT_V2"])
        {
          int v25 = 43;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CDA_CLIENT_EVENT"])
        {
          int v25 = 44;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"MWT_CLIENT_EVENT"])
        {
          int v25 = 45;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"HOME_CLIENT_EVENT"])
        {
          int v25 = 46;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"OPT_IN_CHANGELOG_CLIENT_EVENT"])
        {
          int v25 = 47;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"OPT_IN_PROPAGATION_CLIENT_EVENT"])
        {
          int v25 = 48;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PEGASUS_SERVER_EVENT"])
        {
          int v25 = 49;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"RSS_CLIENT_EVENT"])
        {
          int v25 = 50;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"EXP_SIRI_SERVER_EVENT"])
        {
          int v25 = 51;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SUGGESTIONS_CLIENT_EVENT"])
        {
          int v25 = 52;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"FLOW_LINK_CLIENT_EVENT"])
        {
          int v25 = 53;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"RF_CLIENT_EVENT"])
        {
          int v25 = 54;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SIRI_SERVER_ORDERED_ANY_EVENT"])
        {
          int v25 = 55;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SIC_CLIENT_EVENT"])
        {
          int v25 = 56;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"INFERENCE_CLIENT_EVENT"])
        {
          int v25 = 57;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CAAR_CLIENT_EVENT"])
        {
          int v25 = 58;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"RFG_CLIENT_EVENT"])
        {
          int v25 = 59;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SMT_CLIENT_EVENT"])
        {
          int v25 = 60;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SC_CLIENT_EVENT"])
        {
          int v25 = 61;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SIRI_SETUP_CLIENT_EVENT"])
        {
          int v25 = 62;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"OPT_IN_CLIENT_EVENT"])
        {
          int v25 = 63;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"LOG_REDACTION_CLIENT_EVENT"])
        {
          int v25 = 64;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PSE_CLIENT_EVENT"])
        {
          int v25 = 65;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GROUPED_MESSAGES_CLIENT_EVENT"])
        {
          int v25 = 66;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ACTIVATION_CLIENT_EVENT"])
        {
          int v25 = 67;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"IA_CLIENT_EVENT"])
        {
          int v25 = 68;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"NLG_CLIENT_EVENT"])
        {
          int v25 = 69;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"TTM_CLIENT_EVENT"])
        {
          int v25 = 70;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"TRP_REQUEST_LINK_CLIENT_EVENT"])
        {
          int v25 = 71;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ODM_SIRI_CLIENT_EVENT"])
        {
          int v25 = 72;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"IDENTITY_CLIENT_EVENT"])
        {
          int v25 = 73;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"HOMEKIT_CLIENT_EVENT"])
        {
          int v25 = 74;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"READ_CLIENT_EVENT"])
        {
          int v25 = 75;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"OPAQUE_CLIENT_EVENT"])
        {
          int v25 = 76;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GROUPED_MESSAGES_SERVER_EVENT"])
        {
          int v25 = 77;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GROUPED_MESSAGES_GROUPING"])
        {
          int v25 = 78;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GROUPED_MESSAGES_PRODUCER_METADATA"])
        {
          int v25 = 79;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"RTS_CLIENT_EVENT"])
        {
          int v25 = 80;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ODD_SIRI_CLIENT_EVENT"])
        {
          int v25 = 81;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SESSION_EVENT"])
        {
          int v25 = 82;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SESSION_BYTE_EVENT"])
        {
          int v25 = 83;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ODBATCH_CLIENT_EVENT"])
        {
          int v25 = 84;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"NLROUTER_CLIENT_EVENT"])
        {
          int v25 = 85;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PFA_CLIENT_EVENT"])
        {
          int v25 = 86;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SPEECH_DONATION_EVENT"])
        {
          int v25 = 87;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SR_CLIENT_EVENT"])
        {
          int v25 = 88;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"IFT_CLIENT_EVENT"])
        {
          int v25 = 89;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CM_CLIENT_EVENT"])
        {
          int v25 = 90;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PNR_ON_DEVICE_CLIENT_EVENT"])
        {
          int v25 = 91;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"JR_CLIENT_EVENT"])
        {
          int v25 = 92;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"RG_CLIENT_EVENT"])
        {
          int v25 = 93;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PR_CLIENT_EVENT"])
        {
          int v25 = 94;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"QUERY_DECORATION_CLIENT_EVENT"])
        {
          int v25 = 95;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"PG_CLIENT_EVENT"])
        {
          int v25 = 96;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"DIALOGENGINE_CLIENT_EVENT"])
        {
          int v25 = 97;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"UAF_CLIENT_EVENT"])
        {
          int v25 = 98;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"IF_PLATFORM_CLIENT_EVENT"])
        {
          int v25 = 99;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"IF_PLATFORM_REQUEST_CLIENT_EVENT"])
        {
          int v25 = 100;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"FL_CLIENT_EVENT"])
        {
          int v25 = 101;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"SEARCH_TOOL_CLIENT_EVENT"])
        {
          int v25 = 102;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ODSAMPLE_CLIENT_EVENT"])
        {
          int v25 = 103;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GAT_CLIENT_EVENT"])
        {
          int v25 = 104;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"EXECUTOR_CLIENT_EVENT"])
        {
          int v25 = 106;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"ODFUNNEL_SIRI_CLIENT_EVENT"])
        {
          int v25 = 107;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"GMS_CLIENT_EVENT"])
        {
          int v25 = 108;
          goto LABEL_252;
        }
        if ([v17 isEqualToString:@"CLOUDKIT_CLIENT_EVENT"])
        {
          int v25 = 109;
LABEL_252:

          goto LABEL_253;
        }
      }

      v18 = @"UNKNOWN_EVENT";
      v19 = @"UNKNOWN_EVENT";
      uint64_t v20 = sub_21C984428();
      uint64_t v22 = v21;

      if (v16 == v20 && v15 == v22)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v24 = sub_21C984748();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0) {
          goto LABEL_5;
        }
      }
      int v25 = 0;
LABEL_253:
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int v8 = sub_21C97A0A8(0, v8[2] + 1, 1, v8);
      }
      unint64_t v27 = v8[2];
      unint64_t v26 = v8[3];
      if (v27 >= v26 >> 1) {
        int v8 = sub_21C97A0A8((void *)(v26 > 1), v27 + 1, 1, v8);
      }
      v8[2] = v27 + 1;
      v28 = &v8[2 * v27];
      v28[4] = v16;
      v28[5] = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        os_log_type_t v7 = sub_21C979F98(0, *((void *)v7 + 2) + 1, 1, v7);
      }
      unint64_t v30 = *((void *)v7 + 2);
      unint64_t v29 = *((void *)v7 + 3);
      if (v30 >= v29 >> 1) {
        os_log_type_t v7 = sub_21C979F98((char *)(v29 > 1), v30 + 1, 1, v7);
      }
      *((void *)v7 + 2) = v30 + 1;
      *(_DWORD *)&v7[4 * v30 + 32] = v25;
LABEL_5:
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v11 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_267;
  }
  if (v11 >= v43) {
    goto LABEL_261;
  }
  unint64_t v12 = *(void *)(v42 + 8 * v11);
  ++v6;
  if (v12) {
    goto LABEL_25;
  }
  int64_t v6 = v11 + 1;
  if (v11 + 1 >= v43) {
    goto LABEL_261;
  }
  unint64_t v12 = *(void *)(v42 + 8 * v6);
  if (v12) {
    goto LABEL_25;
  }
  int64_t v6 = v11 + 2;
  if (v11 + 2 >= v43) {
    goto LABEL_261;
  }
  unint64_t v12 = *(void *)(v42 + 8 * v6);
  if (v12) {
    goto LABEL_25;
  }
  int64_t v6 = v11 + 3;
  if (v11 + 3 >= v43) {
    goto LABEL_261;
  }
  unint64_t v12 = *(void *)(v42 + 8 * v6);
  if (v12) {
    goto LABEL_25;
  }
  int64_t v6 = v11 + 4;
  if (v11 + 4 >= v43) {
    goto LABEL_261;
  }
  unint64_t v12 = *(void *)(v42 + 8 * v6);
  if (v12) {
    goto LABEL_25;
  }
  int64_t v13 = v11 + 5;
  if (v13 >= v43)
  {
LABEL_261:
    swift_release();
    swift_bridgeObjectRelease();
    if (qword_267C933E0 == -1)
    {
LABEL_262:
      uint64_t v31 = sub_21C9843C8();
      __swift_project_value_buffer(v31, (uint64_t)qword_267C936D8);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v32 = sub_21C9843A8();
      os_log_type_t v33 = sub_21C984538();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 134218242;
        uint64_t v44 = v35;
        sub_21C9845C8();
        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2080;
        uint64_t v36 = swift_bridgeObjectRetain();
        uint64_t v37 = MEMORY[0x21D4B3050](v36, MEMORY[0x263F8D310]);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        sub_21C97F130(v37, v39, &v44);
        sub_21C9845C8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21C976000, v32, v33, "SELFStoreFilter is configured to allow %ld event type(s): %s", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x21D4B37E0](v35, -1, -1);
        MEMORY[0x21D4B37E0](v34, -1, -1);
        swift_bridgeObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v40 = sub_21C97A4F4((uint64_t)v7);
      swift_bridgeObjectRelease();
      uint64_t result = v41;
      *(void *)(v41 + 16) = v40;
      return result;
    }
LABEL_267:
    swift_once();
    goto LABEL_262;
  }
  unint64_t v12 = *(void *)(v42 + 8 * v13);
  if (v12)
  {
    int64_t v6 = v13;
LABEL_25:
    unint64_t v4 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v6 << 6);
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v6 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v6 >= v43) {
      goto LABEL_261;
    }
    unint64_t v12 = *(void *)(v42 + 8 * v6);
    ++v13;
    if (v12) {
      goto LABEL_25;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_21C979BEC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93520);
  uint64_t v2 = (void *)sub_21C984718();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_21C97A1B8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

uint64_t sub_21C979D00()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for SELFStoreFilter()
{
  return self;
}

uint64_t sub_21C979D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C93500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_21C979E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C93500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C979E70(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C93500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C979ED0()
{
  uint64_t v0 = sub_21C9843C8();
  __swift_allocate_value_buffer(v0, qword_267C934E8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_267C934E8);
  if (qword_267C933E0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_267C936D8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

char *sub_21C979F98(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C93510);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_21C97A408(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21C97A0A8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C93518);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_21C97A314(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_21C97A1B8(uint64_t a1, uint64_t a2)
{
  sub_21C984778();
  sub_21C984458();
  uint64_t v4 = sub_21C984798();
  return sub_21C97A230(a1, a2, v4);
}

unint64_t sub_21C97A230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21C984748() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21C984748() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21C97A314(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_21C984728();
  __break(1u);
  return result;
}

char *sub_21C97A408(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21C984728();
  __break(1u);
  return result;
}

uint64_t sub_21C97A4F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_21C984508();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned int *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_21C981098(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

id sub_21C97A56C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)PLLoggingServiceStore), sel_init);
  qword_267C93528 = (uint64_t)result;
  return result;
}

id static PLLoggingServiceStore.sharedInstance.getter()
{
  if (qword_267C933F8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267C93528;
  return v0;
}

uint64_t PLLoggingServiceStore.storeInstrumentation(events:completion:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_267C93418 != -1) {
    swift_once();
  }
  return sub_21C98381C(a1, a2, a3);
}

unint64_t sub_21C97A7D8()
{
  unint64_t result = qword_267C93530;
  if (!qword_267C93530)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267C93530);
  }
  return result;
}

uint64_t sub_21C97A818(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21C97A828()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21C97A860()
{
  return sub_21C9800A0(*(void *)(v0 + 16));
}

id sub_21C97A86C(void *a1)
{
  id v26 = a1;
  uint64_t v24 = sub_21C984568();
  uint64_t v1 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C984558();
  MEMORY[0x270FA5388]();
  sub_21C984408();
  MEMORY[0x270FA5388]();
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_21C97C1A8(0, (unint64_t *)&qword_267C93680);
  id v5 = v4;
  sub_21C9843E8();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_21C97C1E4((unint64_t *)&unk_267C93580, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93690);
  sub_21C97C22C((unint64_t *)&unk_267C93590, &qword_267C93690);
  sub_21C9845F8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v24);
  int v6 = (void *)sub_21C984588();
  objc_msgSend(v5, sel_setSerialQueue_, v6);

  id v7 = PLLoggingXPCServiceInterface();
  id v8 = v26;
  objc_msgSend(v26, sel_setRemoteObjectInterface_, v7);

  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v25;
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v11;
  uint64_t v31 = sub_21C97C2EC;
  uint64_t v32 = v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v28 = 1107296256;
  unint64_t v29 = sub_21C97B740;
  unint64_t v30 = &block_descriptor_18;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_setInvalidationHandler_, v12);
  _Block_release(v12);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v11;
  uint64_t v31 = sub_21C97C324;
  uint64_t v32 = v14;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v28 = 1107296256;
  unint64_t v29 = sub_21C97B740;
  unint64_t v30 = &block_descriptor_25;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_setInterruptionHandler_, v15);
  _Block_release(v15);
  id v16 = objc_msgSend(v5, sel_serialQueue);
  objc_msgSend(v8, sel__setQueue_, v16);

  objc_msgSend(v5, sel_setClientConnection_, v8);
  id v17 = objc_msgSend(v5, sel_clientConnection);

  objc_msgSend(v17, sel_resume);
  if (qword_267C933D0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_21C9843C8();
  __swift_project_value_buffer(v18, (uint64_t)qword_267C936A8);
  v19 = sub_21C9843A8();
  os_log_type_t v20 = sub_21C984538();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_21C976000, v19, v20, "PLLoggingServiceClient initialized", v21, 2u);
    MEMORY[0x21D4B37E0](v21, -1, -1);
  }

  return v5;
}

uint64_t sub_21C97AE0C()
{
  uint64_t v1 = sub_21C9843D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  id v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = sub_21C984408();
  uint64_t v5 = *(void *)(v13[0] - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v0, sel_serialQueue);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_21C97C394;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C97B740;
  aBlock[3] = &block_descriptor_31;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v0;
  sub_21C9843F8();
  v13[1] = MEMORY[0x263F8EE78];
  sub_21C97C1E4(&qword_267C93540, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93548);
  sub_21C97C22C((unint64_t *)&unk_267C93550, &qword_267C93548);
  sub_21C9845F8();
  MEMORY[0x21D4B30E0](0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, void))(v5 + 8))(v7, v13[0]);
  return swift_release();
}

void sub_21C97B0C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), const char *a4)
{
  uint64_t v6 = a1 + 16;
  if (qword_267C933D0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21C9843C8();
  __swift_project_value_buffer(v7, (uint64_t)qword_267C936A8);
  id v8 = sub_21C9843A8();
  os_log_type_t v9 = a3();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21C976000, v8, v9, a4, v10, 2u);
    MEMORY[0x21D4B37E0](v10, -1, -1);
  }

  swift_beginAccess();
  uint64_t v11 = MEMORY[0x21D4B3830](v6);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    sub_21C97AE0C();
  }
}

uint64_t PLLoggingServiceClient.storeInstrumentation(events:completion:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v8 = sub_21C9843D8();
  uint64_t v28 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21C984408();
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267C933D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21C9843C8();
  __swift_project_value_buffer(v14, (uint64_t)qword_267C936A8);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_21C9843A8();
  os_log_type_t v16 = sub_21C984538();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v25 = a3;
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v17 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_21C984708();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock[0] = v18;
    sub_21C9845C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C976000, v15, v16, "storeInstrumentation called with %ld event(s)", v17, 0xCu);
    MEMORY[0x21D4B37E0](v17, -1, -1);

    a3 = v25;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v19 = objc_msgSend(v4, sel_serialQueue);
  os_log_type_t v20 = (void *)swift_allocObject();
  v20[2] = v4;
  v20[3] = a1;
  v20[4] = a2;
  v20[5] = a3;
  aBlock[4] = sub_21C97BE48;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C97B740;
  aBlock[3] = &block_descriptor;
  uint64_t v21 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v22 = v4;
  sub_21C97BEBC(a2);
  sub_21C9843F8();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_21C97C1E4(&qword_267C93540, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93548);
  sub_21C97C22C((unint64_t *)&unk_267C93550, &qword_267C93548);
  sub_21C9845F8();
  MEMORY[0x21D4B30E0](0, v13, v10, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v27);
  return swift_release();
}

id sub_21C97B618()
{
  id result = objc_msgSend(v0, sel_clientConnection);
  if (result)
  {
    uint64_t v2 = result;
    aBlock[4] = sub_21C97B868;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C97BA60;
    aBlock[3] = &block_descriptor_9;
    uint64_t v3 = _Block_copy(aBlock);
    id v4 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v3);
    _Block_release(v3);

    sub_21C9845E8();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C93560);
    if (swift_dynamicCast()) {
      return (id)v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21C97B740(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21C97B868(void *a1)
{
  if (qword_267C933D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21C9843C8();
  __swift_project_value_buffer(v2, (uint64_t)qword_267C936A8);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_21C9843A8();
  os_log_type_t v5 = sub_21C984548();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    id v8 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C93568);
    uint64_t v9 = sub_21C984438();
    sub_21C97F130(v9, v10, &v12);
    sub_21C9845C8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21C976000, oslog, v5, "Error communicating with PLLoggingService XPC %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B37E0](v7, -1, -1);
    MEMORY[0x21D4B37E0](v6, -1, -1);
  }
  else
  {
  }
}

void sub_21C97BA60(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_21C97BAC8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_clientConnection);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_setExportedObject_, 0);
  }
  id v4 = objc_msgSend(a1, sel_clientConnection);
  objc_msgSend(v4, sel_invalidate);

  return objc_msgSend(a1, sel_setClientConnection_, 0);
}

uint64_t sub_21C97BB68(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  *id v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21C97BB78(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21C97BBB4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_21C97BBE4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_21C984728();
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

unsigned char **sub_21C97BC88(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  char *result = v4 + 1;
  return result;
}

id _sSo22PLLoggingServiceClientC26SiriPrivateLearningLoggingE04makeC0AByFZ_0()
{
  if (qword_267C933D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21C9843C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_267C936A8);
  uint64_t v1 = sub_21C9843A8();
  os_log_type_t v2 = sub_21C984538();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21C976000, v1, v2, "makeClient: creating a new PLLoggingServiceClient", v3, 2u);
    MEMORY[0x21D4B37E0](v3, -1, -1);
  }

  sub_21C984428();
  id v4 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v5 = (void *)sub_21C984418();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 0);

  sub_21C97C1A8(0, (unint64_t *)&unk_267C93570);
  return sub_21C97A86C(v6);
}

uint64_t sub_21C97BDF8()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21C97BE48()
{
  unint64_t v1 = v0[3];
  os_log_type_t v2 = (void *)v0[4];
  uint64_t v3 = v0[5];
  id v4 = sub_21C97B618();
  sub_21C97BF4C(v4, v1, v2, v3);
  return swift_unknownObjectRelease();
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

uint64_t sub_21C97BEBC(uint64_t result)
{
  if (result) {
    return swift_retain();
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

uint64_t sub_21C97BF14()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21C97BF4C(void *a1, unint64_t a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    sub_21C97C1A8(0, (unint64_t *)&qword_267C93530);
    swift_unknownObjectRetain();
    id v8 = (void *)sub_21C9844B8();
    if (a3)
    {
      v14[4] = a3;
      v14[5] = a4;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 1107296256;
      v14[2] = sub_21C97B740;
      v14[3] = &block_descriptor_6;
      a3 = _Block_copy(v14);
      swift_retain();
      swift_release();
    }
    objc_msgSend(a1, sel_storeInstrumentationWithEvents_completion_, v8, a3);
    _Block_release(a3);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_267C933D0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_21C9843C8();
    __swift_project_value_buffer(v9, (uint64_t)qword_267C936A8);
    swift_bridgeObjectRetain_n();
    unint64_t v10 = sub_21C9843A8();
    os_log_type_t v11 = sub_21C984548();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 134217984;
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_21C984708();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v14[0] = v13;
      sub_21C9845C8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C976000, v10, v11, "Cannot store %ld event(s), unable to obtain a connection", v12, 0xCu);
      MEMORY[0x21D4B37E0](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_21C97C1A8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21C97C1E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21C97C22C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21C97C27C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21C97C2B4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21C97C2EC()
{
  sub_21C97B0C8(*(void *)(v0 + 16), *(void *)(v0 + 24), MEMORY[0x263F90280], "Client connection was invalidated");
}

void sub_21C97C324()
{
  sub_21C97B0C8(*(void *)(v0 + 16), *(void *)(v0 + 24), MEMORY[0x263F90278], "Client connection was interrupted");
}

uint64_t sub_21C97C35C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21C97C394()
{
  return sub_21C97BAC8(*(void **)(v0 + 16));
}

BOOL sub_21C97C3C8(unsigned int a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = MEMORY[0x21D4B32D0](*(void *)(a2 + 40), a1, 4);
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(_DWORD *)(v8 + 4 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_21C97C498()
{
  return sub_21C9842D8();
}

uint64_t sub_21C97C4B4()
{
  sub_21C984318();
  MEMORY[0x270FA5388]();
  unint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C9842D8();
  type metadata accessor for _FlatFileStore();
  uint64_t v2 = swift_allocObject();
  uint64_t result = _FlatFileStore.init(path:)((uint64_t)v1);
  qword_26AD2CEE8 = v2;
  return result;
}

uint64_t _FlatFileStore.__allocating_init()()
{
  sub_21C984318();
  MEMORY[0x270FA5388]();
  unint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C9842D8();
  type metadata accessor for _FlatFileStore();
  uint64_t v2 = swift_allocObject();
  _FlatFileStore.init(path:)((uint64_t)v1);
  return v2;
}

uint64_t static _FlatFileStore.shared.getter()
{
  if (qword_26AD2CEF0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t _FlatFileStore.__allocating_init(path:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  _FlatFileStore.init(path:)(a1);
  return v2;
}

uint64_t type metadata accessor for _FlatFileStore()
{
  uint64_t result = qword_26AD2CEF8;
  if (!qword_26AD2CEF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t _FlatFileStore.init(path:)(uint64_t a1)
{
  uint64_t v2 = v1;
  v23[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = v1 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  uint64_t v5 = sub_21C984318();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  id v7 = objc_msgSend(self, sel_defaultManager);
  uint64_t v8 = (void *)sub_21C9842E8();
  v23[0] = 0;
  unsigned int v9 = objc_msgSend(v7, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v8, 1, 0, v23);

  if (v9)
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    id v11 = v23[0];
    v10(a1, v5);
  }
  else
  {
    id v12 = v23[0];
    uint64_t v13 = (void *)sub_21C9842B8();

    swift_willThrow();
    if (qword_267C933E0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_21C9843C8();
    __swift_project_value_buffer(v14, (uint64_t)qword_267C936D8);
    swift_retain_n();
    uint64_t v15 = sub_21C9843A8();
    os_log_type_t v16 = sub_21C984548();
    if (os_log_type_enabled(v15, v16))
    {
      id v22 = v13;
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      v23[0] = v18;
      *(_DWORD *)id v17 = 136315138;
      sub_21C97FC90(&qword_267C935A0, MEMORY[0x263F06EA8]);
      uint64_t v19 = sub_21C984738();
      sub_21C97F130(v19, v20, (uint64_t *)v23);
      sub_21C9845C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C976000, v15, v16, "Unable to create directory: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B37E0](v18, -1, -1);
      MEMORY[0x21D4B37E0](v17, -1, -1);
    }
    else
    {

      swift_release_n();
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  }
  return v2;
}

uint64_t sub_21C97CA74(unint64_t a1)
{
  return sub_21C97E82C(a1, sub_21C97CA8C);
}

void sub_21C97CA8C(void **a1, uint64_t a2)
{
  uint64_t v84 = a2;
  uint64_t v87 = sub_21C984318();
  uint64_t v90 = *(void *)(v87 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v83 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v81 - v6;
  MEMORY[0x270FA5388](v5);
  v89 = (char *)&v81 - v8;
  uint64_t v9 = sub_21C984398();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21C984368();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  os_log_type_t v16 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = *a1;
  id v18 = sub_21C97EFB0(v17);
  v86 = v17;
  if (v18)
  {
    uint64_t v19 = v18;
    unsigned int v20 = objc_msgSend(v18, sel_anyEventType);
  }
  else
  {
    unsigned int v20 = objc_msgSend(v17, sel_anyEventType);
  }
  v85 = v7;
  if (v20 > 0x6D)
  {
    id v22 = @"UNKNOWN_EVENT";
    uint64_t v23 = @"UNKNOWN_EVENT";
  }
  else
  {
    uint64_t v21 = (int)v20;
    id v22 = off_26442EF38[v21];
    uint64_t v23 = off_26442F2A8[v21];
  }
  uint64_t v24 = v22;
  uint64_t v25 = v23;
  v88 = (void (*)(char *, uint64_t))sub_21C984428();
  unint64_t v27 = v26;

  if (qword_267C933E8 != -1) {
    swift_once();
  }
  if (sub_21C97C3C8(v20, *(void *)(qword_267C936F0 + 16)))
  {
    sub_21C984358();
    sub_21C984348();
    double v29 = v28;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    if ((~*(void *)&v29 & 0x7FF0000000000000) != 0)
    {
      if (v29 > -9.22337204e18)
      {
        if (v29 < 9.22337204e18)
        {
          v91[0] = (uint64_t)v29;
          sub_21C984738();
          v91[0] = (uint64_t)v88;
          v91[1] = v27;
          swift_bridgeObjectRetain();
          sub_21C984478();
          sub_21C984478();
          swift_bridgeObjectRelease();
          sub_21C984478();
          sub_21C984388();
          uint64_t v30 = sub_21C984378();
          unint64_t v32 = v31;
          (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
          uint64_t v34 = sub_21C980004(4, v30, v32, v33);
          uint64_t v36 = v35;
          uint64_t v38 = v37;
          uint64_t v40 = v39;
          swift_bridgeObjectRelease();
          MEMORY[0x21D4B2FB0](v34, v36, v38, v40);
          sub_21C984478();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_21C984478();
          uint64_t v13 = (uint64_t)v89;
          sub_21C9842F8();
          swift_bridgeObjectRelease();
          if (qword_267C933E0 == -1)
          {
LABEL_14:
            uint64_t v41 = sub_21C9843C8();
            uint64_t v42 = __swift_project_value_buffer(v41, (uint64_t)qword_267C936D8);
            uint64_t v43 = v90;
            uint64_t v44 = v85;
            uint64_t v45 = v87;
            v82 = *(void (**)(char *, uint64_t, uint64_t))(v90 + 16);
            v82(v85, v13, v87);
            swift_bridgeObjectRetain();
            uint64_t v84 = v42;
            v46 = sub_21C9843A8();
            os_log_type_t v47 = sub_21C984538();
            if (os_log_type_enabled(v46, v47))
            {
              uint64_t v48 = swift_slowAlloc();
              uint64_t v49 = swift_slowAlloc();
              v91[0] = v49;
              *(_DWORD *)uint64_t v48 = 136315394;
              swift_bridgeObjectRetain();
              uint64_t v92 = sub_21C97F130((uint64_t)v88, v27, v91);
              sub_21C9845C8();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v48 + 12) = 2080;
              uint64_t v50 = sub_21C984308();
              uint64_t v92 = sub_21C97F130(v50, v51, v91);
              sub_21C9845C8();
              swift_bridgeObjectRelease();
              v52 = *(void (**)(char *, uint64_t))(v90 + 8);
              uint64_t v45 = v87;
              v52(v44, v87);
              _os_log_impl(&dword_21C976000, v46, v47, "Storing an event of type=%s to path=%s", (uint8_t *)v48, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x21D4B37E0](v49, -1, -1);
              MEMORY[0x21D4B37E0](v48, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
              v52 = *(void (**)(char *, uint64_t))(v43 + 8);
              v52(v44, v45);
            }

            v58 = self;
            __swift_instantiateConcreteTypeFromMangledName(&qword_267C935C8);
            uint64_t v59 = swift_allocObject();
            *(_OWORD *)(v59 + 16) = xmmword_21C985080;
            *(void *)(v59 + 56) = sub_21C97A7D8();
            v60 = v86;
            *(void *)(v59 + 32) = v86;
            id v61 = v60;
            v62 = (void *)sub_21C9844B8();
            swift_bridgeObjectRelease();
            v63 = v89;
            sub_21C984308();
            v64 = (void *)sub_21C984418();
            swift_bridgeObjectRelease();
            id v65 = objc_msgSend(v58, sel_writeProtoBuffers_toFile_, v62, v64);

            if (v65)
            {
              v66 = v83;
              v82(v83, (uint64_t)v63, v45);
              id v67 = v65;
              v68 = sub_21C9843A8();
              os_log_type_t v69 = sub_21C984548();
              if (os_log_type_enabled(v68, v69))
              {
                uint64_t v70 = swift_slowAlloc();
                v88 = v52;
                v71 = v66;
                uint64_t v72 = v70;
                uint64_t v73 = swift_slowAlloc();
                v91[0] = v73;
                *(_DWORD *)uint64_t v72 = 136315394;
                uint64_t v74 = sub_21C984308();
                uint64_t v92 = sub_21C97F130(v74, v75, v91);
                sub_21C9845C8();
                swift_bridgeObjectRelease();
                v90 += 8;
                v76 = v71;
                v77 = v88;
                v88(v76, v45);
                *(_WORD *)(v72 + 12) = 2080;
                uint64_t v92 = (uint64_t)v67;
                id v78 = v67;
                __swift_instantiateConcreteTypeFromMangledName(&qword_267C93568);
                uint64_t v79 = sub_21C984438();
                uint64_t v92 = sub_21C97F130(v79, v80, v91);
                sub_21C9845C8();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_21C976000, v68, v69, "Failed to write an event to path=%s, error=%s", (uint8_t *)v72, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x21D4B37E0](v73, -1, -1);
                MEMORY[0x21D4B37E0](v72, -1, -1);

                v77(v89, v87);
              }
              else
              {

                v52(v66, v45);
                v52(v63, v45);
              }
            }
            else
            {
              v52(v63, v45);
            }
            return;
          }
LABEL_30:
          swift_once();
          goto LABEL_14;
        }
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
  if (qword_267C933E0 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_21C9843C8();
  __swift_project_value_buffer(v53, (uint64_t)qword_267C936D8);
  swift_bridgeObjectRetain();
  v54 = sub_21C9843A8();
  os_log_type_t v55 = sub_21C984538();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v91[0] = v57;
    *(_DWORD *)v56 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v92 = sub_21C97F130((uint64_t)v88, v27, v91);
    sub_21C9845C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C976000, v54, v55, "Dropping an event of type=%s: not allowed", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4B37E0](v57, -1, -1);
    MEMORY[0x21D4B37E0](v56, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_21C97D56C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_21C984708();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v5 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x21D4B3230](v5, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v5 + 32);
    }
    id v7 = v6;
    ++v5;
    uint64_t v8 = v6;
    sub_21C97CA8C(&v8, v1);
  }
  while (v3 != v5);
LABEL_10:
  return swift_bridgeObjectRelease();
}

unint64_t sub_21C97D660()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21C9842C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21C984318();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *))(v7 + 16);
  uint64_t v37 = v0 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  v10(v9);
  id v11 = objc_msgSend(self, sel_defaultManager);
  sub_21C984308();
  id v12 = (void *)sub_21C984418();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_enumeratorAtPath_, v12);

  if (v13)
  {
    uint64_t v36 = v6;
    unint64_t v42 = MEMORY[0x263F8EE78];
    id v14 = v13;
    sub_21C984518();

    sub_21C97FC90(&qword_267C935A8, MEMORY[0x263F06DC0]);
    sub_21C9845B8();
    while (v41)
    {
      sub_21C97FCD8(&v40, v39);
      sub_21C97DD2C((uint64_t)v39, (os_log_t *)&v38);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
      sub_21C97F788(v38);
      sub_21C9845B8();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    unint64_t v15 = v42;
    if (v42 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_21C984708();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:

      uint64_t v6 = v36;
      goto LABEL_19;
    }
    uint64_t v6 = v36;
    if (qword_267C933E0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_21C9843C8();
    __swift_project_value_buffer(v24, (uint64_t)qword_267C936D8);
    swift_retain_n();
    uint64_t v25 = sub_21C9843A8();
    os_log_type_t v26 = sub_21C984538();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(void *)&long long v40 = v35;
      uint64_t v34 = v27;
      *(_DWORD *)unint64_t v27 = 136315138;
      unint64_t v33 = v27 + 4;
      sub_21C97FC90(&qword_267C935A0, MEMORY[0x263F06EA8]);
      uint64_t v28 = sub_21C984738();
      *(void *)&v39[0] = sub_21C97F130(v28, v29, (uint64_t *)&v40);
      sub_21C9845C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      uint64_t v30 = v34;
      _os_log_impl(&dword_21C976000, v25, v26, "No events found in directory: %s", v34, 0xCu);
      uint64_t v31 = v35;
      swift_arrayDestroy();
      MEMORY[0x21D4B37E0](v31, -1, -1);
      MEMORY[0x21D4B37E0](v30, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    if (qword_267C933E0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_21C9843C8();
    __swift_project_value_buffer(v16, (uint64_t)qword_267C936D8);
    swift_retain_n();
    id v17 = sub_21C9843A8();
    os_log_type_t v18 = sub_21C984548();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(void *)&long long v40 = v20;
      uint64_t v36 = v1;
      *(_DWORD *)uint64_t v19 = 136315138;
      sub_21C97FC90(&qword_267C935A0, MEMORY[0x263F06EA8]);
      uint64_t v21 = sub_21C984738();
      *(void *)&v39[0] = sub_21C97F130(v21, v22, (uint64_t *)&v40);
      sub_21C9845C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C976000, v17, v18, "Unable to reference directory: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B37E0](v20, -1, -1);
      MEMORY[0x21D4B37E0](v19, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    unint64_t v15 = MEMORY[0x263F8EE78];
  }
LABEL_19:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

void sub_21C97DD2C(uint64_t a1@<X0>, os_log_t *a2@<X8>)
{
  uint64_t v5 = sub_21C984318();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v51 - v11;
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v51 - v13;
  sub_21C97FF90(a1, (uint64_t)&v60);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v55 = v5;
  v56 = a2;
  if ((sub_21C984498() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    a2 = v56;
LABEL_9:
    if (qword_267C933E0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_21C9843C8();
    __swift_project_value_buffer(v28, (uint64_t)qword_267C936D8);
    sub_21C97FF90(a1, (uint64_t)&v60);
    unint64_t v29 = sub_21C9843A8();
    os_log_type_t v30 = sub_21C984538();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v62 = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      sub_21C97FF90((uint64_t)&v60, (uint64_t)&v59);
      if (swift_dynamicCast())
      {
        uint64_t v33 = v57;
        unint64_t v34 = v58;
      }
      else
      {
        unint64_t v34 = 0x800000021C985DE0;
        uint64_t v33 = 0xD00000000000001DLL;
      }
      os_log_t v59 = (os_log_t)sub_21C97F130(v33, v34, &v62);
      sub_21C9845C8();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v60);
      _os_log_impl(&dword_21C976000, v29, v30, "Unexpected file extension (expected .pb) from file: %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B37E0](v32, -1, -1);
      MEMORY[0x21D4B37E0](v31, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v60);
    }

LABEL_18:
    os_log_t v35 = (os_log_t)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_21C9842F8();
  swift_bridgeObjectRelease();
  sub_21C97E56C((uint64_t *)&v59, &v60);
  if (!v2)
  {
    os_log_t v36 = v60;
    os_log_t v60 = 0;
    sub_21C97A7D8();
    uint64_t v37 = v36;
    sub_21C9844C8();
    os_log_t v35 = v60;
    a2 = v56;
    if (v60)
    {
      sub_21C97FFF8(v36);
      sub_21C97FFF8(v36);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v55);
      goto LABEL_19;
    }
    if (qword_267C933E0 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_21C9843C8();
    __swift_project_value_buffer(v38, (uint64_t)qword_267C936D8);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v55);
    uint64_t v39 = sub_21C9843A8();
    os_log_type_t v40 = sub_21C984548();
    os_log_t v54 = v39;
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      os_log_t v53 = (os_log_t)swift_slowAlloc();
      os_log_t v60 = v53;
      *(_DWORD *)uint64_t v41 = 136315138;
      v52 = v41 + 4;
      uint64_t v42 = sub_21C984308();
      os_log_t v59 = (os_log_t)sub_21C97F130(v42, v43, (uint64_t *)&v60);
      sub_21C9845C8();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v6 + 8);
      uint64_t v45 = v9;
      uint64_t v46 = v55;
      v44(v45, v55);
      os_log_t v47 = v54;
      _os_log_impl(&dword_21C976000, v54, v40, "Failed to deserialise [SISchemaAnyEvent] array from file=%s)", v41, 0xCu);
      os_log_t v48 = v53;
      swift_arrayDestroy();
      MEMORY[0x21D4B37E0](v48, -1, -1);
      uint64_t v49 = v41;
      a2 = v56;
      MEMORY[0x21D4B37E0](v49, -1, -1);
    }
    else
    {
      uint64_t v44 = *(void (**)(char *, uint64_t))(v6 + 8);
      uint64_t v50 = v9;
      uint64_t v46 = v55;
      v44(v50, v55);
    }
    sub_21C97FFF8(v36);
    sub_21C97FFF8(v36);
    v44(v14, v46);
    goto LABEL_18;
  }
  os_log_t v15 = v59;
  if (qword_267C933E0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_21C9843C8();
  __swift_project_value_buffer(v16, (uint64_t)qword_267C936D8);
  uint64_t v17 = v55;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v14, v55);
  sub_21C97FFEC(v15);
  sub_21C97FFEC(v15);
  os_log_type_t v18 = sub_21C9843A8();
  os_log_type_t v19 = sub_21C984548();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    os_log_t v54 = (os_log_t)swift_slowAlloc();
    os_log_t v59 = v54;
    *(_DWORD *)uint64_t v21 = 136315394;
    os_log_t v53 = v18;
    uint64_t v22 = sub_21C984308();
    os_log_t v60 = (os_log_t)sub_21C97F130(v22, v23, (uint64_t *)&v59);
    sub_21C9845C8();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    LODWORD(v52) = v20;
    v24(v12, v55);
    *(_WORD *)(v21 + 12) = 2080;
    os_log_t v60 = v15;
    char v61 = 1;
    sub_21C97FFEC(v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C935C0);
    uint64_t v25 = sub_21C984438();
    os_log_t v60 = (os_log_t)sub_21C97F130(v25, v26, (uint64_t *)&v59);
    uint64_t v17 = v55;
    sub_21C9845C8();
    swift_bridgeObjectRelease();
    sub_21C97FFF8(v15);
    sub_21C97FFF8(v15);
    os_log_type_t v18 = v53;
    _os_log_impl(&dword_21C976000, v53, (os_log_type_t)v52, "Failed to deserialise SISchemaAnyEvent instance(s) from file=%s, result=%s", (uint8_t *)v21, 0x16u);
    os_log_t v27 = v54;
    swift_arrayDestroy();
    MEMORY[0x21D4B37E0](v27, -1, -1);
    MEMORY[0x21D4B37E0](v21, -1, -1);
  }
  else
  {
    uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    v24(v12, v17);
    sub_21C97FFF8(v15);
    sub_21C97FFF8(v15);
  }

  sub_21C97FFF8(v15);
  v24(v14, v17);
  os_log_t v35 = (os_log_t)MEMORY[0x263F8EE78];
  a2 = v56;
LABEL_19:
  *a2 = v35;
}

id sub_21C97E56C@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = self;
  sub_21C97A7D8();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_21C984308();
  uint64_t v6 = (void *)sub_21C984418();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  id v7 = objc_msgSend(v4, sel_readProtoBuffersOfClass_fromFile_error_, ObjCClassFromMetadata, v6, v12);

  id v8 = v12[0];
  if (v7)
  {
    *a2 = v7;
    return v8;
  }
  else
  {
    id v10 = v12[0];
    uint64_t v11 = sub_21C9842B8();

    id result = (id)swift_willThrow();
    *a1 = v11;
  }
  return result;
}

uint64_t _FlatFileStore.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  uint64_t v2 = sub_21C984318();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t _FlatFileStore.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  uint64_t v2 = sub_21C984318();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_21C97E7A8(unint64_t a1)
{
  return sub_21C97CA74(a1);
}

unint64_t sub_21C97E7CC()
{
  return sub_21C97D660();
}

uint64_t sub_21C97E7F0(unint64_t a1)
{
  return sub_21C97D56C(a1);
}

uint64_t sub_21C97E814(unint64_t a1)
{
  return sub_21C97E82C(a1, sub_21C97E92C);
}

uint64_t sub_21C97E82C(unint64_t a1, void (*a2)(id *, uint64_t))
{
  uint64_t v4 = v2;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_21C984708();
    uint64_t v6 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_10;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v8 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x21D4B3230](v8, a1);
    }
    else {
      id v9 = *(id *)(a1 + 8 * v8 + 32);
    }
    id v10 = v9;
    ++v8;
    id v11 = v9;
    a2(&v11, v4);
  }
  while (v6 != v8);
LABEL_10:
  return swift_bridgeObjectRelease();
}

void sub_21C97E92C(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_21C984398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  id v9 = sub_21C97EFB0(*a1);
  if (v9)
  {
    id v10 = v9;
    unsigned int v11 = objc_msgSend(v9, sel_anyEventType);
  }
  else
  {
    unsigned int v11 = objc_msgSend(v8, sel_anyEventType);
  }
  uint64_t v48 = a2;
  if (v11 > 0x6D)
  {
    uint64_t v13 = @"UNKNOWN_EVENT";
    id v14 = @"UNKNOWN_EVENT";
  }
  else
  {
    uint64_t v12 = (int)v11;
    uint64_t v13 = off_26442F618[v12];
    id v14 = off_26442F988[v12];
  }
  os_log_t v15 = v13;
  uint64_t v16 = v14;
  uint64_t v17 = sub_21C984428();
  unint64_t v19 = v18;

  if (qword_267C933E8 != -1) {
    swift_once();
  }
  if (sub_21C97C3C8(v11, *(void *)(qword_267C936F0 + 16)))
  {
    sub_21C984388();
    sub_21C984378();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    double Current = CFAbsoluteTimeGetCurrent();
    id v21 = objc_msgSend(v8, sel_data);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = sub_21C984338();
      unint64_t v25 = v24;

      id v26 = objc_allocWithZone(MEMORY[0x263F2A950]);
      os_log_t v27 = (void *)sub_21C984418();
      swift_bridgeObjectRelease();
      uint64_t v28 = (void *)sub_21C984328();
      id v29 = objc_msgSend(v26, sel_initWithUniqueId_absoluteTimestamp_eventData_, v27, v28, Current);
      sub_21C97FEDC(v23, v25);

      if (qword_267C933E0 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_21C9843C8();
      __swift_project_value_buffer(v30, (uint64_t)qword_267C936D8);
      id v31 = v29;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_21C9843A8();
      os_log_type_t v33 = sub_21C984538();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        uint64_t v50 = v47;
        *(_DWORD *)uint64_t v34 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v49 = sub_21C97F130(v17, v19, &v50);
        sub_21C9845C8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v34 + 12) = 2080;
        v46[1] = v34 + 14;
        id v35 = objc_msgSend(v31, sel_uniqueId);
        uint64_t v36 = sub_21C984428();
        unint64_t v38 = v37;

        uint64_t v49 = sub_21C97F130(v36, v38, &v50);
        sub_21C9845C8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21C976000, v32, v33, "Storing an event of type=%s with id=%s to Biome", (uint8_t *)v34, 0x16u);
        uint64_t v39 = v47;
        swift_arrayDestroy();
        MEMORY[0x21D4B37E0](v39, -1, -1);
        MEMORY[0x21D4B37E0](v34, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v45 = objc_msgSend(*(id *)(v48 + 16), sel_source);
      objc_msgSend(v45, sel_sendEvent_, v31);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_267C933E0 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_21C9843C8();
    __swift_project_value_buffer(v40, (uint64_t)qword_267C936D8);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_21C9843A8();
    os_log_type_t v42 = sub_21C984538();
    if (os_log_type_enabled(v41, v42))
    {
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v50 = v44;
      *(_DWORD *)unint64_t v43 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_21C97F130(v17, v19, &v50);
      sub_21C9845C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C976000, v41, v42, "Dropping an event of type=%s: not allowed", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4B37E0](v44, -1, -1);
      MEMORY[0x21D4B37E0](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_21C97EF54()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_21C97EF8C(unint64_t a1)
{
  return sub_21C97E814(a1);
}

id sub_21C97EFB0(void *a1)
{
  if (objc_msgSend(a1, sel_anyEventType) != 6) {
    return a1;
  }
  id v2 = objc_msgSend(a1, sel_payload);
  if (v2)
  {
    uint64_t v3 = sub_21C984338();
    unint64_t v5 = v4;

    id v2 = (id)sub_21C984328();
    sub_21C97FEDC(v3, v5);
  }
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, v2);

  id v7 = objc_msgSend(v6, sel_event);
  return v7;
}

uint64_t sub_21C97F090(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21C97F0B8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_21C97F130(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_21C9845C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21C97F130(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21C97F204(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21C97FF90((uint64_t)v12, *a3);
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
      sub_21C97FF90((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21C97F204(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21C9845D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21C97F3C0(a5, a6);
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
  uint64_t v8 = sub_21C9846E8();
  if (!v8)
  {
    sub_21C9846F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21C984728();
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

uint64_t sub_21C97F3C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21C97F458(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21C97F638(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21C97F638(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C97F458(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21C97F5D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21C9846B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21C9846F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21C984488();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21C984728();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21C9846F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21C97F5D0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267C935D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21C97F638(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267C935D0);
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
  uint64_t result = sub_21C984728();
  __break(1u);
  return result;
}

uint64_t sub_21C97F788(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21C984708();
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
    uint64_t v5 = sub_21C984708();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
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
    unint64_t v4 = MEMORY[0x21D4B3240](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v10 = sub_21C97F954(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21C984708();
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
      return MEMORY[0x270F9DBB8](v10);
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  uint64_t v10 = swift_bridgeObjectRelease();
  return MEMORY[0x270F9DBB8](v10);
}

uint64_t sub_21C97F954(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21C984708();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21C984708();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_21C97FF34();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267C935B0);
          uint64_t v12 = sub_21C97FB58(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_21C97A7D8();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_21C984728();
  __break(1u);
  return result;
}

void (*sub_21C97FB58(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_21C97FC08(v6, a2, a3);
  return sub_21C97FBC0;
}

void sub_21C97FBC0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21C97FC08(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x21D4B3230](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_21C97FC88;
  }
  __break(1u);
  return result;
}

void sub_21C97FC88(id *a1)
{
}

uint64_t sub_21C97FC90(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_21C97FCD8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t dispatch thunk of _PLSELFStore.write(events:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of _PLSELFStore.readAll()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SELFEventStoreWritable.store(events:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_21C97FD74()
{
  return type metadata accessor for _FlatFileStore();
}

uint64_t sub_21C97FD7C()
{
  uint64_t result = sub_21C984318();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for _FlatFileStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _FlatFileStore);
}

uint64_t dispatch thunk of static _FlatFileStore.interactionPath.getter()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of _FlatFileStore.__allocating_init(path:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of _FlatFileStore.write(events:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of _FlatFileStore.store(events:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of _FlatFileStore.readAll()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t type metadata accessor for BiomeStore()
{
  return self;
}

uint64_t sub_21C97FEDC(uint64_t a1, unint64_t a2)
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

unint64_t sub_21C97FF34()
{
  unint64_t result = qword_267C935B8;
  if (!qword_267C935B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C935B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C935B8);
  }
  return result;
}

uint64_t sub_21C97FF90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_21C97FFEC(id a1)
{
  return a1;
}

void sub_21C97FFF8(id a1)
{
}

uint64_t sub_21C980004(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_21C984468();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_21C9800A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_21C9800AC(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v6 = a2 + 16;
  if (qword_267C933D8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21C9843C8();
  __swift_project_value_buffer(v7, (uint64_t)qword_267C936C0);
  uint64_t v8 = sub_21C9843A8();
  os_log_type_t v9 = sub_21C984538();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v10 = 67109120;
    sub_21C9845C8();
    _os_log_impl(&dword_21C976000, v8, v9, a4, v10, 8u);
    MEMORY[0x21D4B37E0](v10, -1, -1);
  }

  swift_beginAccess();
  uint64_t v11 = MEMORY[0x21D4B3830](v6);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    swift_beginAccess();
    BOOL v13 = (void *)MEMORY[0x21D4B3830](a3 + 16);
    sub_21C9805A0(v13);
  }
}

uint64_t sub_21C980284(void *a1)
{
  uint64_t v3 = sub_21C9843D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21C984408();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)&v1[OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_21C9833C0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C97B740;
  aBlock[3] = &block_descriptor_24;
  uint64_t v12 = _Block_copy(aBlock);
  BOOL v13 = v1;
  id v14 = a1;
  sub_21C9843F8();
  v16[1] = MEMORY[0x263F8EE78];
  sub_21C97C1E4(&qword_267C93540, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93548);
  sub_21C97C22C((unint64_t *)&unk_267C93550, &qword_267C93548);
  sub_21C9845F8();
  MEMORY[0x21D4B30E0](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_21C980538(uint64_t a1, void *a2)
{
  swift_beginAccess();
  sub_21C98119C(&v4, a2);
  uint64_t v3 = v4;
  swift_endAccess();
}

uint64_t sub_21C9805A0(void *a1)
{
  long long v2 = v1;
  uint64_t v4 = sub_21C9843D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21C984408();
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v25 = v10;
    uint64_t v26 = result;
    uint64_t v13 = qword_267C933D8;
    id v14 = a1;
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_21C9843C8();
    __swift_project_value_buffer(v15, (uint64_t)qword_267C936C0);
    id v16 = v14;
    uint64_t v17 = sub_21C9843A8();
    os_log_type_t v18 = sub_21C984538();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      unint64_t v24 = v7;
      *(_DWORD *)unint64_t v19 = 67109120;
      LODWORD(aBlock[0]) = objc_msgSend(v16, sel_processIdentifier);
      uint64_t v7 = v24;
      sub_21C9845C8();

      _os_log_impl(&dword_21C976000, v17, v18, "Removing connection (pid=%d)", v19, 8u);
      MEMORY[0x21D4B37E0](v19, -1, -1);
    }
    else
    {
    }
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v2;
    *(void *)(v20 + 24) = v16;
    aBlock[4] = sub_21C9833B8;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C97B740;
    aBlock[3] = &block_descriptor_18_0;
    id v21 = _Block_copy(aBlock);
    id v22 = v16;
    id v23 = v2;
    sub_21C9843F8();
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_21C97C1E4(&qword_267C93540, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C93548);
    sub_21C97C22C((unint64_t *)&unk_267C93550, &qword_267C93548);
    sub_21C9845F8();
    MEMORY[0x21D4B30E0](0, v12, v7, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v26);
    return swift_release();
  }
  return result;
}

void sub_21C980998(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t v3 = (void *)sub_21C9826B8(a2);
  swift_endAccess();
}

id sub_21C980A28()
{
  return sub_21C980BEC(type metadata accessor for PLLoggingServiceListenerDelegate);
}

id sub_21C980A8C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PLLoggingServiceDefaultHandler()), sel_init);
  qword_267C936F8 = (uint64_t)result;
  return result;
}

id sub_21C980BD4()
{
  return sub_21C980BEC(type metadata accessor for PLLoggingServiceDefaultHandler);
}

id sub_21C980BEC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_21C980C28()
{
  id result = sub_21C980C48();
  qword_267C935E0 = (uint64_t)result;
  return result;
}

id sub_21C980C48()
{
  uint64_t v0 = sub_21C984568();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  objc_super v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21C984558();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_21C984408();
  MEMORY[0x270FA5388](v5 - 8);
  sub_21C97C1A8(0, (unint64_t *)&qword_267C93680);
  sub_21C9843E8();
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_21C97C1E4((unint64_t *)&unk_267C93580, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93690);
  sub_21C97C22C((unint64_t *)&unk_267C93590, &qword_267C93690);
  sub_21C9845F8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t v6 = (void *)sub_21C984588();
  sub_21C984428();
  id v7 = objc_allocWithZone(MEMORY[0x263F08D88]);
  uint64_t v8 = (void *)sub_21C984418();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithMachServiceName_, v8);

  uint64_t v10 = (objc_class *)type metadata accessor for PLLoggingServiceListenerDelegate();
  id v11 = objc_allocWithZone(v10);
  id v12 = v6;
  uint64_t v13 = (char *)v11;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_21C984708()) {
    sub_21C983498(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v14 = MEMORY[0x263F8EE88];
  }
  *(void *)&v13[OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_connections] = v14;
  *(void *)&v13[OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue] = v12;
  id v15 = v12;

  v19.receiver = v13;
  v19.super_class = v10;
  id v16 = objc_msgSendSuper2(&v19, sel_init);

  return sub_21C982BD0(v9, v16, v15);
}

id static PLLoggingServiceListener.sharedInstance.getter()
{
  if (qword_267C93410 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267C935E0;
  return v0;
}

uint64_t type metadata accessor for PLLoggingServiceListenerDelegate()
{
  return self;
}

uint64_t type metadata accessor for PLLoggingServiceDefaultHandler()
{
  return self;
}

uint64_t sub_21C981098(_DWORD *a1, uint64_t a2)
{
  objc_super v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = MEMORY[0x21D4B32D0](*(void *)(v6 + 40), a2, 4);
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *objc_super v3 = 0x8000000000000000;
    sub_21C981BE0(a2, v9, isUniquelyReferenced_nonNull_native);
    *objc_super v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(_DWORD *)(v10 + 4 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v10 + 4 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_21C98119C(void *a1, void *a2)
{
  objc_super v3 = v2;
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
    uint64_t v9 = sub_21C984648();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_21C97C1A8(0, &qword_267C93668);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_21C984638();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_21C98143C(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_21C9818BC();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_21C981B5C((uint64_t)v8, v22);
    *objc_super v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_21C984598();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_21C97C1A8(0, &qword_267C93668);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_21C9845A8();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        objc_super v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_21C9845A8();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_21C981D08((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_21C98143C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C93670);
    uint64_t v2 = sub_21C984698();
    uint64_t v14 = v2;
    sub_21C984628();
    if (sub_21C984658())
    {
      sub_21C97C1A8(0, &qword_267C93668);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_21C9818BC();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_21C984598();
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
      while (sub_21C984658());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_21C981634()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93678);
  uint64_t result = sub_21C984688();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unint64_t v6 = (uint64_t *)(v2 + 56);
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
                  *unint64_t v6 = v26;
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
      unsigned int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
      uint64_t result = MEMORY[0x21D4B32D0](*(void *)(v4 + 40), v18, 4);
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
      *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21C9818BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93670);
  uint64_t v3 = sub_21C984688();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
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
      uint64_t result = sub_21C984598();
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

unint64_t sub_21C981B5C(uint64_t a1, uint64_t a2)
{
  sub_21C984598();
  unint64_t result = sub_21C984618();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_21C981BE0(uint64_t result, unint64_t a2, char a3)
{
  unsigned int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_21C981634();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_21C981E90();
      goto LABEL_14;
    }
    sub_21C9821D4();
  }
  uint64_t v8 = *v3;
  unint64_t result = MEMORY[0x21D4B32D0](*(void *)(*v3 + 40), v5, 4);
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      unint64_t result = sub_21C984758();
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
        if (*(_DWORD *)(v10 + 4 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v12 + 48) + 4 * a2) = v5;
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

void sub_21C981D08(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_21C9818BC();
  }
  else
  {
    if (v7 > v6)
    {
      sub_21C982028();
      goto LABEL_14;
    }
    sub_21C98243C();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_21C984598();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_21C97C1A8(0, &qword_267C93668);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_21C9845A8();

    if (v12)
    {
LABEL_13:
      sub_21C984758();
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
        char v15 = sub_21C9845A8();

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

void *sub_21C981E90()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93678);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21C984678();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
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

id sub_21C982028()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93670);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21C984678();
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
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
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

uint64_t sub_21C9821D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93678);
  uint64_t result = sub_21C984688();
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
    unsigned int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    uint64_t result = MEMORY[0x21D4B32D0](*(void *)(v4 + 40), v18, 4);
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
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
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

uint64_t sub_21C98243C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93670);
  uint64_t v3 = sub_21C984688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
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
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_21C984598();
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
          goto LABEL_36;
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
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
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

uint64_t sub_21C9826B8(void *a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = a1;
    char v5 = sub_21C984668();

    if (v5)
    {
      uint64_t v6 = sub_21C982890();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21C984598();
  uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
    goto LABEL_12;
  }
  sub_21C97C1A8(0, &qword_267C93668);
  id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
  char v11 = sub_21C9845A8();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v12;
      if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_12;
      }
      id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
      char v14 = sub_21C9845A8();
    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v1;
  uint64_t v18 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21C982028();
    uint64_t v16 = v18;
  }
  uint64_t v6 = *(void *)(*(void *)(v16 + 48) + 8 * v9);
  sub_21C982A2C(v9);
  uint64_t *v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21C982890()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_21C984638();
  uint64_t v3 = swift_unknownObjectRetain();
  uint64_t v4 = sub_21C98143C(v3, v2);
  uint64_t v15 = v4;
  swift_retain();
  uint64_t v5 = sub_21C984598();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    sub_21C97C1A8(0, &qword_267C93668);
    id v8 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
    char v9 = sub_21C9845A8();

    if (v9)
    {
LABEL_6:
      swift_release();
      uint64_t v13 = *(void *)(*(void *)(v4 + 48) + 8 * v7);
      sub_21C982A2C(v7);
      if (sub_21C9845A8())
      {
        uint64_t *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v6;
      while (1)
      {
        unint64_t v7 = (v7 + 1) & v10;
        if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          break;
        }
        id v11 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
        char v12 = sub_21C9845A8();

        if (v12) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_21C982A2C(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_21C984608();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        uint64_t v11 = sub_21C984598();

        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(v3 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v2);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
            {
              *uint64_t v16 = *v17;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

id sub_21C982BD0(void *a1, void *a2, void *a3)
{
  if (qword_267C933D8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21C9843C8();
  __swift_project_value_buffer(v6, (uint64_t)qword_267C936C0);
  uint64_t v7 = sub_21C9843A8();
  os_log_type_t v8 = sub_21C984528();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_21C976000, v7, v8, "Initializing PLLoggingServiceListener", v9, 2u);
    MEMORY[0x21D4B37E0](v9, -1, -1);
  }

  id v10 = objc_msgSend(objc_allocWithZone((Class)PLLoggingServiceListener), sel_init);
  objc_msgSend(v10, sel_setDelegate_, a2);
  objc_msgSend(v10, sel_setListener_, a1);
  id v11 = objc_msgSend(v10, sel_listener);
  objc_msgSend(v11, sel__setQueue_, a3);

  id v12 = objc_msgSend(v10, sel_listener);
  objc_msgSend(v12, sel_setDelegate_, objc_msgSend(v10, sel_delegate));

  swift_unknownObjectRelease();
  id v13 = objc_msgSend(v10, sel_listener);

  objc_msgSend(v13, sel_resume);
  char v14 = sub_21C9843A8();
  os_log_type_t v15 = sub_21C984528();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21C976000, v14, v15, "Started PLLoggingServiceListener", v16, 2u);
    MEMORY[0x21D4B37E0](v16, -1, -1);
  }

  return v10;
}

uint64_t sub_21C982E3C(void *a1)
{
  uint64_t v2 = v1;
  unsigned int v4 = objc_msgSend(a1, sel_processIdentifier);
  if (qword_267C933D8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21C9843C8();
  __swift_project_value_buffer(v5, (uint64_t)qword_267C936C0);
  uint64_t v6 = sub_21C9843A8();
  os_log_type_t v7 = sub_21C984528();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v8 = 67109120;
    LODWORD(v19) = v4;
    sub_21C9845C8();
    _os_log_impl(&dword_21C976000, v6, v7, "PLLoggingService connection request received (pid=%d)", v8, 8u);
    MEMORY[0x21D4B37E0](v8, -1, -1);
  }

  if (qword_267C93408 != -1) {
    swift_once();
  }
  objc_msgSend(a1, sel_setExportedObject_, qword_267C936F8, v19);
  id v9 = PLLoggingXPCServiceInterface();
  objc_msgSend(a1, sel_setExportedInterface_, v9);

  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(_DWORD *)(v12 + 16) = v4;
  *(void *)(v12 + 24) = v10;
  *(void *)(v12 + 32) = v11;
  char v23 = sub_21C983404;
  uint64_t v24 = v12;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  unint64_t v21 = sub_21C97B740;
  unint64_t v22 = &block_descriptor_36;
  id v13 = _Block_copy(&v19);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v13);
  _Block_release(v13);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = v4;
  *(void *)(v16 + 24) = v14;
  *(void *)(v16 + 32) = v15;
  char v23 = sub_21C983470;
  uint64_t v24 = v16;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  unint64_t v21 = sub_21C97B740;
  unint64_t v22 = &block_descriptor_44;
  unint64_t v17 = _Block_copy(&v19);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v17);
  _Block_release(v17);
  objc_msgSend(a1, sel__setQueue_, *(void *)(v2 + OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue));
  sub_21C980284(a1);
  objc_msgSend(a1, sel_resume);
  return 1;
}

void sub_21C9831E8(uint64_t a1, void *a2, uint64_t a3)
{
  if (qword_267C933F8 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_267C93528;
  sub_21C97C1A8(0, (unint64_t *)&qword_267C93530);
  uint64_t v6 = (void *)sub_21C9844B8();
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = sub_21C97B740;
    v7[3] = &block_descriptor_0;
    a2 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v5, sel_storeInstrumentationWithEvents_completion_, v6, a2);
  _Block_release(a2);
}

uint64_t sub_21C983318()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21C983350()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
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

uint64_t sub_21C983378()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21C9833B8()
{
  sub_21C980998(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_21C9833C0()
{
  sub_21C980538(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_21C9833C8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21C983404()
{
  sub_21C9800AC(*(unsigned int *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "Connection from %d was invalidated");
}

uint64_t objectdestroy_32Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21C983470()
{
  sub_21C9800AC(*(unsigned int *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "Connection from %d was interrupted");
}

void sub_21C983498(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_21C984708();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C93670);
      uint64_t v3 = sub_21C9846A8();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_21C984708();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x21D4B3230](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_21C984598();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_21C97C1A8(0, &qword_267C93668);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_21C9845A8();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_21C9845A8();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_21C984598();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_21C97C1A8(0, &qword_267C93668);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_21C9845A8();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_21C9845A8();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_21C98381C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_21C9843D8();
  uint64_t v27 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  BOOL v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21C984408();
  uint64_t v25 = *(void *)(v11 - 8);
  uint64_t v26 = v11;
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267C933E0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_21C9843C8();
  __swift_project_value_buffer(v14, (uint64_t)qword_267C936D8);
  swift_bridgeObjectRetain_n();
  unint64_t v15 = sub_21C9843A8();
  os_log_type_t v16 = sub_21C984538();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v24 = a3;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_21C984708();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock[0] = v18;
    sub_21C9845C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C976000, v15, v16, "Received %ld new SISChemaAnyEvent event(s)", v17, 0xCu);
    MEMORY[0x21D4B37E0](v17, -1, -1);

    a3 = v24;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  char v19 = (void *)swift_allocObject();
  v19[2] = v4;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = a3;
  aBlock[4] = sub_21C9841AC;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C97B740;
  aBlock[3] = &block_descriptor_1;
  uint64_t v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v21 = v4;
  sub_21C97BEBC(a2);
  sub_21C9843F8();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_21C97C1E4(&qword_267C93540, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93548);
  sub_21C97C22C((unint64_t *)&unk_267C93550, &qword_267C93548);
  sub_21C9845F8();
  MEMORY[0x21D4B30E0](0, v13, v10, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
  return swift_release();
}

uint64_t sub_21C983C38(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = (void *)(a1 + OBJC_IVAR____TtC26SiriPrivateLearningLogging25PLLoggingServiceStoreBase_store);
  uint64_t v6 = v5[3];
  uint64_t v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, v6, v7);
  if (a3) {
    return a3(result);
  }
  return result;
}

id sub_21C983CF0()
{
  return sub_21C9840FC(type metadata accessor for PLLoggingServiceStoreBase);
}

uint64_t type metadata accessor for PLLoggingServiceStoreBase()
{
  return self;
}

id sub_21C983D78()
{
  id result = sub_21C983D98();
  qword_267C93700 = (uint64_t)result;
  return result;
}

id sub_21C983D98()
{
  uint64_t v10 = sub_21C984568();
  uint64_t v0 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C984558();
  MEMORY[0x270FA5388]();
  sub_21C984408();
  MEMORY[0x270FA5388]();
  if (qword_26AD2CEF0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_26AD2CEE8;
  sub_21C984214();
  sub_21C9843F8();
  v13[0] = MEMORY[0x263F8EE78];
  sub_21C97C1E4((unint64_t *)&unk_267C93580, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C93690);
  sub_21C97C22C((unint64_t *)&unk_267C93590, &qword_267C93690);
  sub_21C9845F8();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F8F130], v10);
  uint64_t v4 = sub_21C984588();
  v13[3] = type metadata accessor for _FlatFileStore();
  v13[4] = &protocol witness table for _FlatFileStore;
  v13[0] = v3;
  uint64_t v5 = (char *)objc_allocWithZone((Class)type metadata accessor for PLLoggingServiceFlatFileStore());
  sub_21C984254((uint64_t)v13, (uint64_t)v12);
  *(void *)&v5[OBJC_IVAR____TtC26SiriPrivateLearningLogging25PLLoggingServiceStoreBase_queue] = v4;
  sub_21C984254((uint64_t)v12, (uint64_t)&v5[OBJC_IVAR____TtC26SiriPrivateLearningLogging25PLLoggingServiceStoreBase_store]);
  uint64_t v6 = (objc_class *)type metadata accessor for PLLoggingServiceStoreBase();
  v11.receiver = v5;
  v11.super_class = v6;
  swift_retain_n();
  id v7 = objc_msgSendSuper2(&v11, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  swift_release();
  return v7;
}

id sub_21C9840A4()
{
  return sub_21C9840FC(type metadata accessor for PLLoggingServiceFlatFileStore);
}

uint64_t type metadata accessor for PLLoggingServiceFlatFileStore()
{
  return self;
}

id sub_21C9840E4()
{
  return sub_21C9840FC(type metadata accessor for PLLoggingServiceBiomeStore);
}

id sub_21C9840FC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for PLLoggingServiceBiomeStore()
{
  return self;
}

uint64_t sub_21C98415C()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21C9841AC()
{
  return sub_21C983C38(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21C984214()
{
  unint64_t result = qword_267C93680;
  if (!qword_267C93680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267C93680);
  }
  return result;
}

uint64_t sub_21C984254(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C9842B8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21C9842C8()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_21C9842D8()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_21C9842E8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21C9842F8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_21C984308()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_21C984318()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21C984328()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21C984338()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21C984348()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_21C984358()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21C984368()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21C984378()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21C984388()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21C984398()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21C9843A8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21C9843B8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21C9843C8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21C9843D8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21C9843E8()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_21C9843F8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21C984408()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21C984418()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21C984428()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21C984438()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21C984448()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_21C984458()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21C984468()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_21C984478()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21C984488()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21C984498()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_21C9844B8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21C9844C8()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_21C9844D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21C9844E8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21C984508()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21C984518()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_21C984528()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21C984538()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21C984548()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21C984558()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21C984568()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21C984578()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21C984588()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21C984598()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_21C9845A8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21C9845B8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_21C9845C8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21C9845D8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21C9845E8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21C9845F8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21C984608()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21C984618()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_21C984628()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_21C984638()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_21C984648()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_21C984658()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_21C984668()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_21C984678()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21C984688()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21C984698()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_21C9846A8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21C9846B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21C9846C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21C9846D8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21C9846E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21C9846F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21C984708()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21C984718()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21C984728()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21C984738()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21C984748()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21C984758()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21C984768()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_21C984778()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21C984788()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21C984798()
{
  return MEMORY[0x270F9FC90]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}