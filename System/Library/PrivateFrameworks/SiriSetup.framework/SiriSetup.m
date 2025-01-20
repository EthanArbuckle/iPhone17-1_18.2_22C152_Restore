uint64_t SRSGetDeviceClass()
{
  return MEMORY[0x270F95FE8](@"DeviceClassNumber", 0xFFFFFFFFLL);
}

BOOL SetupSchemaProvisionalSiriSetupContextReadFrom(void *a1, uint64_t a2)
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v18 = objc_alloc_init(SetupSchemaProvisionalSiriSetupStep);
        if (!PBReaderPlaceMark() || (SetupSchemaProvisionalSiriSetupStepReadFrom(v18, a2) & 1) == 0)
        {
LABEL_35:

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setStep:", v18, 0, 0);
        goto LABEL_30;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        v18 = objc_alloc_init(SetupSchemaProvisionalSiriSetupStarted);
        if (!PBReaderPlaceMark() || (SetupSchemaProvisionalSiriSetupStartedReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_35;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setStarted:", v18, 0, 0);
LABEL_30:

        goto LABEL_32;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_32:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    v18 = objc_alloc_init(SetupSchemaProvisionalSiriSetupEnded);
    if (!PBReaderPlaceMark() || (SetupSchemaProvisionalSiriSetupEndedReadFrom(v18, a2) & 1) == 0) {
      goto LABEL_35;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setEnded:", v18, 0, 0);
    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SetupSchemaProvisionalSiriSetupStartedReadFrom(void *a1, uint64_t a2)
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
        break;
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
        BOOL v14 = v9++ >= 9;
        if (v14)
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        [a1 setExists:v19 != 0];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SetupSchemaProvisionalSiriSetupEndedReadFrom(void *a1, uint64_t a2)
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
        break;
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
        BOOL v14 = v9++ >= 9;
        if (v14)
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_43:
        [a1 setSiriEnabled:v25 != 0];
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_39:
        [a1 setDismissed:v19 != 0];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SetupSchemaProvisionalSiriSetupStepReadFrom(void *a1, uint64_t a2)
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
        break;
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
        BOOL v14 = v9++ >= 9;
        if (v14)
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v23 = 0;
            goto LABEL_32;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        uint64_t v23 = *(unsigned char *)(a2 + *v5) ? 0 : v19;
LABEL_32:
        [a1 setPage:v23];
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SetupSchemaProvisionalSiriSetupEventReadFrom(void *a1, uint64_t a2)
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
      if ((v10 >> 3) == 100) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(SetupSchemaProvisionalSiriSetupEventMetadata);
        if (!PBReaderPlaceMark()
          || (SetupSchemaProvisionalSiriSetupEventMetadataReadFrom(v17, a2) & 1) == 0)
        {
          goto LABEL_31;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setEventMetadata:", v17, 0, 0);
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
    char v17 = objc_alloc_init(SetupSchemaProvisionalSiriSetupContext);
    if (!PBReaderPlaceMark() || !SetupSchemaProvisionalSiriSetupContextReadFrom(v17, a2))
    {
LABEL_31:

      return 0;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setSiriSetupContext:", v17, 0, 0);
    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SetupSchemaProvisionalSiriSetupEventMetadataReadFrom(void *a1, uint64_t a2)
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
        break;
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v17 = objc_alloc_init(MEMORY[0x263F6EEE0]);
        if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setSetupId:", v17, 0, 0);
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_235A33378()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DaemonSessionWrapper()
{
  return self;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void type metadata accessor for AFBoolean(uint64_t a1)
{
}

void type metadata accessor for AFSiriDataSharingOptInStatus(uint64_t a1)
{
}

BOOL sub_235A33410(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_235A33424(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_235A33430@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void type metadata accessor for SRSTrainingManagerSessionStatus(uint64_t a1)
{
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void sub_235A33468(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

char *sub_235A334B8(long long *a1)
{
  long long v2 = a1[9];
  long long v78 = a1[8];
  long long v79 = v2;
  long long v3 = a1[11];
  long long v80 = a1[10];
  long long v81 = v3;
  long long v4 = a1[5];
  long long v74 = a1[4];
  long long v75 = v4;
  long long v5 = a1[7];
  long long v76 = a1[6];
  long long v77 = v5;
  long long v6 = a1[1];
  long long v70 = *a1;
  long long v71 = v6;
  long long v7 = a1[3];
  long long v72 = a1[2];
  long long v73 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_orbView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection] = 0;
  uint64_t v8 = OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceOptionsView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for VoiceOptionsView());
  unint64_t v10 = v1;
  *(void *)&v1[v8] = objc_msgSend(v9, sel_init);
  *(void *)&v10[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceSelectionPresenter] = 0;

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62370]), sel_initWithCardStyle_, 0);
  v69.receiver = v10;
  v69.super_class = (Class)type metadata accessor for VoiceSelectionProxCardController();
  id v67 = v11;
  unint64_t v12 = (char *)objc_msgSendSuper2(&v69, sel_initWithContentView_, v11);
  char v13 = (void *)sub_235A68AF0();
  objc_msgSend(v12, sel_setTitle_, v13);

  BOOL v14 = (void *)sub_235A68AF0();
  id v15 = objc_msgSend(self, sel_bundleWithIdentifier_, v14);

  v16 = (void *)sub_235A68AF0();
  id v66 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v16, v15, 0);

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v66);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v17, sel_setContentMode_, 1);
  unsigned int v18 = v11;
  uint64_t v19 = v17;
  objc_msgSend(v18, sel_addSubview_, v17);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F75418]), sel_init);
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F75458]), sel_init);
  uint64_t v22 = OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceOptionsView;
  uint64_t v23 = *(void **)&v12[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceOptionsView];
  id v24 = objc_allocWithZone(MEMORY[0x263F75460]);
  uint64_t v25 = v12;
  id v65 = v21;
  id v26 = v23;
  id v27 = v20;
  char v28 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  v64 = v27;
  id v29 = objc_msgSend(v24, sel_initWithDataManaging_view_delegate_voicePreviewing_recognitionLanguage_, v65, v26, v25, v27, v28);

  v63 = v25;
  v30 = *(void **)&v25[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceSelectionPresenter];
  *(void *)&v25[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceSelectionPresenter] = v29;

  id v31 = *(id *)(*(void *)&v12[v22] + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView);
  objc_msgSend(v31, sel_setAlwaysBounceVertical_, 0);
  objc_msgSend(v31, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v67, sel_addSubview_, v31);
  id v32 = objc_msgSend(v67, sel_mainContentGuide);
  id v62 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D2F0);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_235A6A7C0;
  id v34 = objc_msgSend(v19, sel_topAnchor);
  id v35 = objc_msgSend(v32, sel_topAnchor);
  id v36 = objc_msgSend(v34, sel_constraintGreaterThanOrEqualToAnchor_, v35);

  *(void *)(v33 + 32) = v36;
  id v37 = objc_msgSend(v19, sel_centerXAnchor);
  id v38 = objc_msgSend(v32, sel_centerXAnchor);
  id v39 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v38);

  *(void *)(v33 + 40) = v39;
  id v40 = objc_msgSend(v19, sel_heightAnchor);
  id v41 = objc_msgSend(v40, sel_constraintEqualToConstant_, 65.0);

  *(void *)(v33 + 48) = v41;
  id v42 = objc_msgSend(v31, sel_topAnchor);
  id v43 = objc_msgSend(v19, sel_bottomAnchor);
  id v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v43);

  *(void *)(v33 + 56) = v44;
  id v45 = objc_msgSend(v31, sel_centerXAnchor);
  id v46 = objc_msgSend(v32, sel_centerXAnchor);
  id v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_, v46);

  *(void *)(v33 + 64) = v47;
  id v48 = objc_msgSend(v31, sel_heightAnchor);
  objc_msgSend(v31, sel_sizeThatFits_, 1.79769313e308, 1.79769313e308);
  id v50 = objc_msgSend(v48, sel_constraintEqualToConstant_, v49);

  *(void *)(v33 + 72) = v50;
  id v51 = objc_msgSend(v31, sel_leadingAnchor);
  id v52 = objc_msgSend(v32, sel_leadingAnchor);
  id v53 = objc_msgSend(v51, sel_constraintEqualToAnchor_constant_, v52, -10.0);

  *(void *)(v33 + 80) = v53;
  id v54 = objc_msgSend(v31, sel_trailingAnchor);
  id v55 = objc_msgSend(v32, sel_trailingAnchor);
  id v56 = objc_msgSend(v54, sel_constraintEqualToAnchor_constant_, v55, 10.0);

  *(void *)(v33 + 88) = v56;
  id v57 = objc_msgSend(v31, sel_bottomAnchor);
  id v58 = objc_msgSend(v32, sel_bottomAnchor);
  id v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v58, 35.0);

  *(void *)(v33 + 96) = v59;
  sub_235A68B90();
  sub_235A348B8(0, (unint64_t *)&qword_26882D2F8);
  v60 = (void *)sub_235A68B60();
  swift_bridgeObjectRelease();
  objc_msgSend(v62, sel_activateConstraints_, v60);

  objc_msgSend(v63, sel_setDismissalType_, 1);
  v68[8] = v78;
  v68[9] = v79;
  v68[10] = v80;
  v68[11] = v81;
  v68[4] = v74;
  v68[5] = v75;
  v68[6] = v76;
  v68[7] = v77;
  v68[0] = v70;
  v68[1] = v71;
  v68[2] = v72;
  v68[3] = v73;
  sub_235A33EB0((uint64_t)v68);

  sub_235A346CC((uint64_t)&v70);
  return v63;
}

void sub_235A33CDC(void *a1)
{
  long long v2 = v1;
  id v4 = objc_msgSend(v2, sel_actions);
  sub_235A348B8(0, (unint64_t *)&qword_26882D300);
  unint64_t v5 = sub_235A68B70();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_235A68E50();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_14;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x237DEC2A0](0, v5);
  }
  else
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(v5 + 32);
  }
  long long v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = a1;
  char v9 = sub_235A68D40();

  if (v9)
  {
    uint64_t v10 = OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection;
    if (*(void *)&v2[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection])
    {
      objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceSelectionPresenter], sel_stopVoicePreview);
      if (MEMORY[0x237DECD00](&v2[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_delegate]))
      {
        id v11 = *(void **)&v2[v10];
        id v12 = v11;
        sub_235A505E8(v11);

        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_235A33EB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  id v5 = v1;
  id v6 = (void *)sub_235A68AF0();
  id v26 = sub_235A3486C;
  uint64_t v27 = v4;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  id v24 = sub_235A6046C;
  uint64_t v25 = &block_descriptor;
  long long v7 = _Block_copy(&aBlock);
  id v8 = self;
  id v9 = objc_msgSend(v8, sel_actionWithTitle_style_handler_, v6, 0, v7);

  _Block_release(v7);
  swift_release();
  objc_msgSend(v5, sel_setDismissButtonAction_, v9);

  if (v3)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v5;
    id v11 = v5;
    swift_bridgeObjectRetain();
    id v12 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v26 = sub_235A34894;
    uint64_t v27 = v10;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v23 = 1107296256;
    id v24 = sub_235A6046C;
    uint64_t v25 = &block_descriptor_27;
    uint64_t v13 = _Block_copy(&aBlock);
    id v14 = objc_msgSend(v8, sel_actionWithTitle_style_handler_, v12, 0, v13);

    _Block_release(v13);
    swift_release();
    id v15 = objc_msgSend(v11, sel_addAction_, v14);
  }
  if (v2)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v5;
    id v17 = v5;
    swift_bridgeObjectRetain();
    unsigned int v18 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v26 = sub_235A3488C;
    uint64_t v27 = v16;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v23 = 1107296256;
    id v24 = sub_235A6046C;
    uint64_t v25 = &block_descriptor_21;
    uint64_t v19 = _Block_copy(&aBlock);
    id v20 = objc_msgSend(v8, sel_actionWithTitle_style_handler_, v18, 1, v19);

    _Block_release(v19);
    swift_release();
    id v21 = objc_msgSend(v17, sel_addAction_, v20);
  }
}

uint64_t sub_235A34204(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x237DECD00](a2 + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_delegate);
  if (result)
  {
    uint64_t v3 = result;
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_235A68920();
    __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
    os_log_type_t v5 = sub_235A68C40();
    sub_235A65720(v5, 0xD000000000000015, 0x8000000235A6BD70, 0xD00000000000001CLL, 0x8000000235A6BD90);
    if (MEMORY[0x237DECD00](v3 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate))
    {
      uint64_t v6 = swift_retain();
      sub_235A370C8(v6);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_235A34334(void *a1, char *a2)
{
  id v4 = objc_msgSend(a2, sel_actions);
  sub_235A348B8(0, (unint64_t *)&qword_26882D300);
  unint64_t v5 = sub_235A68B70();

  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    id v11 = *(void **)&a2[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceSelectionPresenter];
    if (v11)
    {
      v14[4] = nullsub_1;
      v14[5] = 0;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 1107296256;
      v14[2] = sub_235A3AAE4;
      v14[3] = &block_descriptor_30;
      id v12 = _Block_copy(v14);
      id v13 = v11;
      objc_msgSend(v13, sel_selectRandomVoiceWithCompletion_, v12);
      _Block_release(v12);
    }
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_235A68E50();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_9;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x237DEC2A0](0, v5);
  }
  else
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(v5 + 32);
  }
  long long v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = a1;
  char v9 = sub_235A68D40();

  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
}

id sub_235A3453C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceSelectionProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceSelectionProxCardController()
{
  return self;
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

uint64_t sub_235A346CC(uint64_t a1)
{
  return a1;
}

void sub_235A347A4(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection);
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection) = a1;
  id v4 = a1;

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceOptionsView);
  id v6 = *(void **)(v1 + v2);
  id v8 = *(id *)(v5 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice);
  *(void *)(v5 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice) = v6;
  id v7 = v6;
}

uint64_t sub_235A34834()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A3486C(uint64_t a1)
{
  return sub_235A34204(a1, *(void *)(v1 + 16));
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

void sub_235A3488C(void *a1)
{
  sub_235A34334(a1, *(char **)(v1 + 16));
}

void sub_235A34894(void *a1)
{
}

uint64_t sub_235A348B8(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_235A3492C(uint64_t a1)
{
  return a1;
}

char *sub_235A34974(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v10 = &v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  id v11 = &v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_dataSource];
  *(void *)id v11 = a1;
  *((void *)v11 + 1) = a2;
  id v12 = &v5[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_dataSourceWriter];
  *(void *)id v12 = a3;
  *((void *)v12 + 1) = a4;
  uint64_t ObjectType = swift_getObjectType();
  id v14 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 64);
  id v15 = v5;
  id v16 = a1;
  id v63 = a3;
  v64 = v16;
  id v62 = v15;
  v15[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewStyle] = v14(ObjectType, a2);
  if (qword_26882D0F0 != -1) {
    swift_once();
  }
  char v17 = byte_26882EE38;
  sub_235A4F2CC(0x4F49544143554445, 0xEF454C5449545F4ELL, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v17);
  strcpy((char *)v66, "%DEVICE_NAME%");
  unint64_t v18 = sub_235A35654();
  uint64_t v19 = MEMORY[0x263F8D310];
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v17);
  uint64_t v60 = sub_235A68D90();
  uint64_t v61 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v21 = byte_26882EE38;
  sub_235A4F2CC(0xD00000000000001ELL, 0x8000000235A6BF20, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v21);
  strcpy((char *)v66, "%DEVICE_NAME%");
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v21);
  uint64_t v22 = sub_235A68D90();
  uint64_t v59 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_235A6A830;
  char v25 = byte_26882EE38;
  uint64_t v26 = sub_235A4F2CC(0xD000000000000011, 0x8000000235A6BF40, 0, byte_26882EE38, 0xAu);
  uint64_t v28 = v27;
  sub_235A643F8(v25);
  uint64_t v74 = v26;
  uint64_t v75 = v28;
  strcpy((char *)v73, "%DEVICE_NAME%");
  uint64_t v29 = sub_235A68D90();
  uint64_t v31 = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&v73[0] = v29;
  *((void *)&v73[0] + 1) = v31;
  *(void *)&v66[0] = 0xD000000000000015;
  *((void *)&v66[0] + 1) = 0x8000000235A6BF00;
  unint64_t v67 = sub_235A643F8(v25);
  uint64_t v68 = v32;
  unint64_t v57 = v18;
  unint64_t v58 = v18;
  unint64_t v56 = v18;
  uint64_t v33 = sub_235A68D90();
  uint64_t v35 = v34;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v24 + 32) = v33;
  *(void *)(v24 + 40) = v35;
  id v36 = &v62[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel];
  *(void *)id v36 = 0;
  *((void *)v36 + 1) = 0;
  *((void *)v36 + 2) = v60;
  *((void *)v36 + 3) = v61;
  *((void *)v36 + 4) = v22;
  *((void *)v36 + 5) = v59;
  *((void *)v36 + 6) = v24;
  *(_OWORD *)(v36 + 56) = 0u;
  *(_OWORD *)(v36 + 72) = 0u;
  *(_OWORD *)(v36 + 88) = 0u;
  *(_OWORD *)(v36 + 104) = 0u;
  *(_OWORD *)(v36 + 120) = 0u;
  v36[136] = 2;
  *((_DWORD *)v36 + 35) = *(_DWORD *)&v72[3];
  *(_DWORD *)(v36 + 137) = *(_DWORD *)v72;
  *((void *)v36 + 18) = 0;
  *((void *)v36 + 19) = 0;
  *((_WORD *)v36 + 84) = 0;
  *((void *)v36 + 20) = 0;
  int v37 = v70;
  *((_WORD *)v36 + 87) = v71;
  *(_DWORD *)(v36 + 170) = v37;
  *((void *)v36 + 22) = 0;
  *((void *)v36 + 23) = 0;
  *(void *)&v62[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_page] = a5;
  swift_retain();

  v69.receiver = v62;
  v69.super_class = (Class)type metadata accessor for EducationPresenter();
  id v38 = objc_msgSendSuper2(&v69, sel_init, v19, v56, v57, v58);
  id v39 = (long long *)&v38[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel];
  LOBYTE(v33) = v38[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewStyle];
  swift_beginAccess();
  long long v40 = *v39;
  long long v41 = v39[1];
  long long v42 = v39[3];
  v73[2] = v39[2];
  v73[3] = v42;
  v73[0] = v40;
  v73[1] = v41;
  long long v43 = v39[4];
  long long v44 = v39[5];
  long long v45 = v39[7];
  v73[6] = v39[6];
  v73[7] = v45;
  v73[4] = v43;
  v73[5] = v44;
  long long v46 = v39[8];
  long long v47 = v39[9];
  long long v48 = v39[11];
  v73[10] = v39[10];
  v73[11] = v48;
  v73[8] = v46;
  v73[9] = v47;
  v66[8] = v39[8];
  v66[9] = v39[9];
  v66[10] = v39[10];
  v66[11] = v39[11];
  v66[4] = v39[4];
  v66[5] = v39[5];
  v66[6] = v39[6];
  v66[7] = v39[7];
  v66[0] = *v39;
  v66[1] = v39[1];
  v66[2] = v39[2];
  v66[3] = v39[3];
  double v49 = v38;
  sub_235A3557C((uint64_t)v73);
  id v50 = sub_235A35018(v33, v66);
  id v52 = v51;

  swift_release();
  sub_235A346CC((uint64_t)v73);
  id v53 = (char **)&v49[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController];
  id v54 = *(void **)&v49[OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController];
  *id v53 = v50;
  v53[1] = v52;

  return v49;
}

char *sub_235A35018(char a1, _OWORD *a2)
{
  long long v2 = a2[9];
  v22[8] = a2[8];
  v22[9] = v2;
  long long v3 = a2[11];
  v22[10] = a2[10];
  v22[11] = v3;
  long long v4 = a2[5];
  v22[4] = a2[4];
  v22[5] = v4;
  long long v5 = a2[7];
  v22[6] = a2[6];
  v22[7] = v5;
  long long v6 = a2[1];
  v22[0] = *a2;
  v22[1] = v6;
  long long v7 = a2[3];
  v22[2] = a2[2];
  v22[3] = v7;
  if (a1)
  {
    *(void *)&v20[0] = 0;
    *((void *)&v20[0] + 1) = 0xE000000000000000;
    sub_235A68DE0();
    sub_235A68B30();
    char v21 = a1;
    sub_235A68E20();
    sub_235A68B30();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_235A68920();
    __swift_project_value_buffer(v9, (uint64_t)qword_26882DE48);
    os_log_type_t v10 = sub_235A68C30();
    sub_235A65720(v10, 0xD000000000000030, 0x8000000235A6BEA0, *(uint64_t *)&v20[0], *((unint64_t *)&v20[0] + 1));
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    long long v12 = a2[9];
    v20[8] = a2[8];
    v20[9] = v12;
    long long v13 = a2[11];
    v20[10] = a2[10];
    v20[11] = v13;
    long long v14 = a2[5];
    v20[4] = a2[4];
    v20[5] = v14;
    long long v15 = a2[7];
    v20[6] = a2[6];
    v20[7] = v15;
    long long v16 = a2[1];
    v20[0] = *a2;
    v20[1] = v16;
    long long v17 = a2[3];
    v20[2] = a2[2];
    v20[3] = v17;
    id v18 = objc_allocWithZone((Class)type metadata accessor for EducationWelcomeController());
    sub_235A3557C((uint64_t)v22);
    id v11 = (char *)sub_235A484FC(v20);
    *(void *)&v11[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate + 8] = &off_26E8EC3F0;
    swift_unknownObjectWeakAssign();
  }
  return v11;
}

id sub_235A3524C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EducationPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EducationPresenter()
{
  return self;
}

uint64_t sub_235A35360@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

uint64_t sub_235A35424(_OWORD *a1)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v6 = v3[11];
  v18[9] = v3[9];
  v18[10] = v5;
  v18[11] = v6;
  long long v7 = v3[5];
  v18[4] = v3[4];
  v18[5] = v7;
  long long v8 = v3[7];
  v18[6] = v3[6];
  v18[7] = v8;
  v18[8] = v4;
  long long v9 = v3[1];
  v18[0] = *v3;
  v18[1] = v9;
  long long v10 = v3[3];
  v18[2] = v3[2];
  v18[3] = v10;
  long long v11 = a1[9];
  v3[8] = a1[8];
  v3[9] = v11;
  long long v12 = a1[11];
  v3[10] = a1[10];
  v3[11] = v12;
  long long v13 = a1[5];
  v3[4] = a1[4];
  v3[5] = v13;
  long long v14 = a1[7];
  v3[6] = a1[6];
  v3[7] = v14;
  long long v15 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v15;
  long long v16 = a1[3];
  v3[2] = a1[2];
  v3[3] = v16;
  return sub_235A346CC((uint64_t)v18);
}

uint64_t (*sub_235A354E4())()
{
  return j__swift_endAccess;
}

void *sub_235A35544()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_presentingViewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A3557C(uint64_t a1)
{
  return a1;
}

unint64_t sub_235A35654()
{
  unint64_t result = qword_26882DCA0;
  if (!qword_26882DCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26882DCA0);
  }
  return result;
}

SiriSetup::SiriSetupCoordinator::ViewConfiguration __swiftcall SiriSetupCoordinator.ViewConfiguration.init()()
{
  *uint64_t v0 = 0;
  return result;
}

unsigned __int8 *sub_235A356B0(unsigned __int8 *result)
{
  void (*v7)(uint64_t *__return_ptr, uint64_t, uint64_t);
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  uint64_t v86;
  uint64_t v87;

  unsigned __int8 v2 = result[1];
  long long v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_viewConfiguration);
  unsigned __int8 *v3 = *result;
  v3[1] = v2;
  long long v4 = (void *)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
  if (*(void *)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter))
  {
    uint64_t v5 = v4[1];
    uint64_t ObjectType = swift_getObjectType();
    long long v7 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 40);
    swift_unknownObjectRetain();
    v7(&v63, ObjectType, v5);
    swift_unknownObjectRelease();
    long long v8 = *v3;
    long long v9 = v3[1];
    if (v84 != v8 || ((v85 ^ v9) & 1) != 0)
    {
      long long v11 = v69;
      long long v13 = v66;
      long long v12 = v67;
      long long v15 = v64;
      long long v14 = v65;
      long long v16 = v63;
      if (*v4)
      {
        long long v24 = v68;
        long long v25 = v77;
        uint64_t v35 = v87;
        id v36 = v4[1];
        long long v27 = v75;
        long long v28 = v79;
        uint64_t v33 = v83;
        uint64_t v34 = v86;
        long long v31 = v81;
        long long v32 = v82;
        long long v29 = v80;
        long long v30 = v9;
        long long v26 = v78;
        uint64_t v22 = v74;
        long long v23 = v76;
        long long v20 = v72;
        char v21 = v73;
        long long v17 = v71;
        long long v18 = v70;
        int v37 = swift_getObjectType();
        id v38 = v16;
        id v39 = v15;
        long long v40 = v14;
        long long v41 = v13;
        long long v42 = v12;
        long long v43 = v24;
        long long v44 = v11;
        long long v45 = v18;
        long long v46 = v17;
        long long v47 = v20;
        long long v48 = v21;
        double v49 = v22;
        id v50 = v27;
        id v51 = v23;
        id v52 = v25;
        id v53 = v26;
        id v54 = v28;
        id v55 = v29;
        unint64_t v56 = v31;
        unint64_t v57 = v32;
        unint64_t v58 = v33;
        uint64_t v59 = v8;
        uint64_t v60 = v30;
        uint64_t v61 = v34;
        id v62 = v35;
        long long v19 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v36 + 48);
        swift_unknownObjectRetain();
        v19(&v38, v37, v36);
        return (unsigned __int8 *)swift_unknownObjectRelease();
      }
      id v38 = v63;
      id v39 = v64;
      long long v40 = v65;
      long long v41 = v66;
      long long v42 = v67;
      long long v43 = v68;
      long long v44 = v69;
      long long v45 = v70;
      long long v46 = v71;
      long long v47 = v72;
      long long v48 = v73;
      double v49 = v74;
      id v50 = v75;
      id v51 = v76;
      id v52 = v77;
      id v53 = v78;
      id v54 = v79;
      id v55 = v80;
      unint64_t v56 = v81;
      unint64_t v57 = v82;
      unint64_t v58 = v83;
      uint64_t v59 = v8;
      uint64_t v60 = v9;
      uint64_t v61 = v86;
      id v62 = v87;
      long long v10 = &v38;
    }
    else
    {
      long long v10 = &v63;
    }
    return (unsigned __int8 *)sub_235A346CC((uint64_t)v10);
  }
  return result;
}

id SiriSetupCoordinator.__allocating_init(enrollmentMode:navigationController:delegate:assistantConfiguration:)(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v11 = objc_allocWithZone(v5);
  return SiriSetupCoordinator.init(enrollmentMode:navigationController:delegate:assistantConfiguration:)(a1, a2, a3, a4, a5);
}

id SiriSetupCoordinator.init(enrollmentMode:navigationController:delegate:assistantConfiguration:)(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v9 = *a1;
  long long v10 = &v5[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate];
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v11 = &v5[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  *(_WORD *)&v5[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_viewConfiguration] = 0;
  v45[0] = 0;
  v45[1] = 0xE000000000000000;
  long long v12 = v5;
  sub_235A68DE0();
  sub_235A68B30();
  sub_235A68E20();
  sub_235A68B30();
  uint64_t v49 = a4;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D360);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  long long v48 = a5;
  id v44 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D368);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_235A68920();
  __swift_project_value_buffer(v13, (uint64_t)qword_26882DE48);
  os_log_type_t v14 = sub_235A68C40();
  sub_235A65720(v14, 0xD00000000000004ALL, 0x8000000235A6BF80, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  *((void *)v10 + 1) = a4;
  swift_unknownObjectWeakAssign();
  *(void *)&v12[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationController] = a2;
  LOBYTE(v45[0]) = v9;
  id v15 = objc_allocWithZone((Class)type metadata accessor for Defaults());
  id v16 = a2;
  long long v17 = sub_235A605B4((char *)v45, 0, 0);
  long long v18 = (char **)&v12[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource];
  void *v18 = v17;
  v18[1] = (char *)&off_26E8EDBD8;
  long long v19 = (objc_class *)type metadata accessor for Configurator();
  long long v20 = objc_allocWithZone(v19);
  v20[OBJC_IVAR____TtC9SiriSetup12Configurator_enrollmentMode] = v9;
  char v21 = (char **)&v20[OBJC_IVAR____TtC9SiriSetup12Configurator_dataSource];
  *char v21 = v17;
  v21[1] = (char *)&off_26E8EDBD8;
  v47.receiver = v20;
  v47.super_class = v19;
  uint64_t v22 = v17;
  id v23 = objc_msgSendSuper2(&v47, sel_init);
  *(void *)&v12[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_configurator] = v23;
  LOBYTE(v45[0]) = v9;
  id v24 = v23;
  uint64_t v25 = sub_235A393FC();

  *(void *)&v12[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pages] = v25;
  long long v26 = *v18;
  long long v27 = v18[1];
  uint64_t ObjectType = swift_getObjectType();
  long long v29 = (uint64_t (*)(uint64_t, char *))*((void *)v27 + 8);
  long long v30 = v26;
  LOBYTE(v27) = v29(ObjectType, v27);

  v12[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationStyle] = 0x10200u >> (8 * (_BYTE)v27);
  uint64_t v31 = type metadata accessor for SetupPageListHandler();
  swift_allocObject();
  uint64_t v32 = swift_bridgeObjectRetain();
  uint64_t v33 = sub_235A5B54C(v32);
  uint64_t v34 = &v12[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler];
  *((void *)v34 + 3) = v31;
  *((void *)v34 + 4) = &off_26E8EDA60;
  *(void *)uint64_t v34 = v33;

  uint64_t v35 = (objc_class *)type metadata accessor for SiriSetupCoordinator();
  v46.receiver = v12;
  v46.super_class = v35;
  id v36 = objc_msgSendSuper2(&v46, sel_init);
  uint64_t v37 = (uint64_t)v36 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  uint64_t v38 = *(void *)(v37 + 24);
  uint64_t v39 = *(void *)(v37 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v37, v38);
  long long v40 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v39 + 16);
  id v41 = v36;
  v40(v36, &off_26E8EC500, v38, v39);
  swift_endAccess();
  if (a5)
  {
    id v42 = v44;
    sub_235A35EB4(v42);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  return v41;
}

uint64_t sub_235A35E0C()
{
  sub_235A466AC();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  sub_235A38180(v1, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  id v3 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  sub_235A5B7C0(0, 0, 0, v3, v2);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

void sub_235A35EB4(void *a1)
{
  uint64_t v2 = v1;
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  id v4 = a1;
  id v5 = objc_msgSend(v4, sel_description);
  sub_235A68B00();

  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_235A68920();
  __swift_project_value_buffer(v6, (uint64_t)qword_26882DE48);
  os_log_type_t v7 = sub_235A68C40();
  sub_235A65720(v7, 0x6F6328796C707061, 0xEE00293A6769666ELL, 0xD000000000000018, 0x8000000235A6BFF0);
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
  sub_235A3EB00((uint64_t)v4);
  uint64_t v9 = v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource;
  long long v10 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  uint64_t v11 = *(void *)(v9 + 8);
  swift_getObjectType();
  long long v12 = *(void (**)(void))(v11 + 200);
  id v13 = v10;
  id v14 = v8;
  v12();
}

void static SiriSetupCoordinator.apply(config:)(void *a1)
{
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  v10[0] = 0xD000000000000018;
  v10[1] = 0x8000000235A6BFF0;
  id v2 = a1;
  id v3 = objc_msgSend(v2, sel_description);
  sub_235A68B00();

  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_235A68920();
  __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
  os_log_type_t v5 = sub_235A68C40();
  sub_235A65720(v5, 0x6F6328796C707061, 0xEE00293A6769666ELL, 0xD000000000000018, 0x8000000235A6BFF0);
  swift_bridgeObjectRelease();
  LOBYTE(v10[0]) = 0;
  id v6 = objc_allocWithZone((Class)type metadata accessor for Defaults());
  os_log_type_t v7 = sub_235A605B4((char *)v10, 0, 0);
  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
  sub_235A3EB00((uint64_t)v2);
  id v9 = v8;
  sub_235A37DB4((uint64_t)v9, (uint64_t)v7);
}

void sub_235A3624C(uint64_t a1)
{
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  sub_235A389E8();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_235A68920();
  __swift_project_value_buffer(v3, (uint64_t)qword_26882DE48);
  os_log_type_t v4 = sub_235A68C40();
  sub_235A65720(v4, 0x287373696D736964, 0xEE00293A6D6F7266, 0xD00000000000001ELL, 0x8000000235A6C010);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  id v6 = *(id *)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  swift_retain();
  uint64_t v7 = sub_235A389E8();
  unint64_t v9 = v8;
  swift_release();
  os_log_type_t v10 = sub_235A68C40();
  sub_235A65720(v10, 0xD00000000000001DLL, 0x8000000235A6C030, v7, v9);
  swift_bridgeObjectRelease();
  sub_235A5E638(a1, (uint64_t)v6, v5);

  sub_235A36910();
}

uint64_t sub_235A36400(char *a1)
{
  uint64_t v2 = sub_235A68A20();
  MEMORY[0x270FA5388](v2);
  char v3 = *a1;
  char v4 = a1[1];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(unsigned char *)(v6 + 24) = v3;
  *(unsigned char *)(v6 + 25) = v4;
  aBlock[4] = sub_235A382E8;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_0;
  _Block_copy(aBlock);
  sub_235A38320();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A38378();
  sub_235A68DB0();
  sub_235A68AA0();
  swift_allocObject();
  sub_235A68A80();
  swift_release();
  swift_release();
  if (objc_msgSend(self, sel_isMainThread))
  {
    sub_235A68A90();
  }
  else
  {
    sub_235A3841C();
    uint64_t v7 = (void *)sub_235A68CD0();
    sub_235A68D00();
  }
  return swift_release();
}

void sub_235A36610(uint64_t a1, __int16 a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x237DECD00](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    __int16 v6 = a2 & 0x101;
    sub_235A356B0((unsigned __int8 *)&v6);
  }
}

uint64_t sub_235A3667C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_235A366C0()
{
  void (*v4)(uint64_t *__return_ptr, uint64_t, uint64_t);
  int v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  uint64_t v83;
  uint64_t v84;

  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
  if (*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter))
  {
    uint64_t v2 = v1[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v4 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v2 + 40);
    swift_unknownObjectRetain();
    v4(&v60, ObjectType, v2);
    swift_unknownObjectRelease();
    uint64_t v5 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_viewConfiguration);
    __int16 v6 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_viewConfiguration + 1);
    if (v81 != v5 || ((v82 ^ v6) & 1) != 0)
    {
      unint64_t v8 = v66;
      os_log_type_t v10 = v63;
      unint64_t v9 = v64;
      long long v12 = v61;
      uint64_t v11 = v62;
      id v13 = v60;
      if (*v1)
      {
        char v21 = v65;
        uint64_t v22 = v74;
        uint64_t v32 = v84;
        uint64_t v33 = v1[1];
        id v24 = v72;
        uint64_t v25 = v76;
        long long v30 = v80;
        uint64_t v31 = v83;
        long long v28 = v78;
        long long v29 = v79;
        long long v26 = v77;
        long long v27 = *(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_viewConfiguration + 1);
        id v23 = v75;
        long long v19 = v71;
        long long v20 = v73;
        long long v17 = v69;
        long long v18 = v70;
        id v14 = v68;
        id v15 = v67;
        uint64_t v34 = swift_getObjectType();
        uint64_t v35 = v13;
        id v36 = v12;
        uint64_t v37 = v11;
        uint64_t v38 = v10;
        uint64_t v39 = v9;
        long long v40 = v21;
        id v41 = v8;
        id v42 = v15;
        long long v43 = v14;
        id v44 = v17;
        long long v45 = v18;
        objc_super v46 = v19;
        objc_super v47 = v24;
        long long v48 = v20;
        uint64_t v49 = v22;
        id v50 = v23;
        id v51 = v25;
        id v52 = v26;
        id v53 = v28;
        id v54 = v29;
        id v55 = v30;
        unint64_t v56 = v5;
        unint64_t v57 = v27;
        unint64_t v58 = v31;
        uint64_t v59 = v32;
        id v16 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v33 + 48);
        swift_unknownObjectRetain();
        v16(&v35, v34, v33);
        swift_unknownObjectRelease();
        return;
      }
      uint64_t v35 = v60;
      id v36 = v61;
      uint64_t v37 = v62;
      uint64_t v38 = v63;
      uint64_t v39 = v64;
      long long v40 = v65;
      id v41 = v66;
      id v42 = v67;
      long long v43 = v68;
      id v44 = v69;
      long long v45 = v70;
      objc_super v46 = v71;
      objc_super v47 = v72;
      long long v48 = v73;
      uint64_t v49 = v74;
      id v50 = v75;
      id v51 = v76;
      id v52 = v77;
      id v53 = v78;
      id v54 = v79;
      id v55 = v80;
      unint64_t v56 = v5;
      unint64_t v57 = v6;
      unint64_t v58 = v83;
      uint64_t v59 = v84;
      uint64_t v7 = &v35;
    }
    else
    {
      uint64_t v7 = &v60;
    }
    sub_235A346CC((uint64_t)v7);
  }
}

void sub_235A36910()
{
  void (*v22)(unsigned char *__return_ptr, uint64_t, uint64_t);
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  id v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  id v34;
  char v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  unsigned char v40[9];
  unint64_t v41;

  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t ObjectType = swift_getObjectType();
  __int16 v6 = *(void (**)(uint64_t, uint64_t))(v4 + 160);
  id v7 = v3;
  v6(ObjectType, v4);

  unint64_t v8 = *(void **)v2;
  uint64_t v9 = *(void *)(v2 + 8);
  uint64_t v10 = swift_getObjectType();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 88);
  id v12 = v8;
  char v13 = v11(v10, v9);

  v40[8] = 0;
  id v41 = 0xE000000000000000;
  sub_235A68DE0();
  sub_235A68B30();
  *(void *)long long v40 = v13 & 1;
  sub_235A68E20();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_235A68920();
  __swift_project_value_buffer(v14, (uint64_t)qword_26882DE48);
  os_log_type_t v15 = sub_235A68C40();
  sub_235A65720(v15, 0xD000000000000012, 0x8000000235A6C260, *(uint64_t *)&v40[1], 0xE000000000000000);
  swift_bridgeObjectRelease();
  uint64_t v16 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate;
  if (MEMORY[0x237DECD00](v16))
  {
    uint64_t v17 = *(void *)(v16 + 8);
    uint64_t v18 = swift_getObjectType();
    v40[1] = v13 & 1;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 8))(&v40[1], v18, v17);
    swift_unknownObjectRelease();
  }
  long long v19 = *(void **)v2;
  uint64_t v20 = *(void *)(v2 + 8);
  uint64_t v21 = swift_getObjectType();
  uint64_t v22 = *(void (**)(unsigned char *__return_ptr, uint64_t, uint64_t))(v20 + 24);
  id v23 = v19;
  v22(&v40[1], v21, v20);

  id v24 = *(void **)v2;
  uint64_t v25 = *(void *)(v2 + 8);
  long long v26 = swift_getObjectType();
  long long v27 = *(uint64_t (**)(uint64_t, uint64_t))(v25 + 88);
  long long v28 = v24;
  long long v29 = v27(v26, v25);

  long long v30 = *(void **)v2;
  uint64_t v31 = *(void *)(v2 + 8);
  uint64_t v32 = swift_getObjectType();
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t))(v31 + 96);
  uint64_t v34 = v30;
  uint64_t v35 = v33(v32, v31);

  id v36 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupContext), sel_init);
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupEnded), sel_init);
    if (v38)
    {
      uint64_t v39 = v38;
      objc_msgSend(v38, sel_setSiriEnabled_, v29 & 1);
      objc_msgSend(v39, sel_setDismissed_, v35 & 1);
      objc_msgSend(v37, sel_setEnded_, v39);
      sub_235A46484((uint64_t)v37);

      uint64_t v37 = v39;
    }
  }
}

id SiriSetupCoordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void SiriSetupCoordinator.init()()
{
}

id SiriSetupCoordinator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSetupCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235A36DAC(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  v11[0] = 0xD00000000000001FLL;
  v11[1] = 0x8000000235A6C180;
  sub_235A389E8();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_235A68920();
  __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
  os_log_type_t v5 = sub_235A68C40();
  sub_235A65720(v5, 0xD000000000000010, 0x8000000235A6C160, 0xD00000000000001FLL, 0x8000000235A6C180);
  swift_bridgeObjectRelease();
  uint64_t v6 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  sub_235A38180(v6, (uint64_t)v11);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  id v7 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  id v9 = v7;
  sub_235A5B7C0(a1, 2, 1, v9, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_235A36F38(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  v11[0] = 0xD00000000000001BLL;
  v11[1] = 0x8000000235A6C140;
  sub_235A389E8();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_235A68920();
  __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
  os_log_type_t v5 = sub_235A68C40();
  sub_235A65720(v5, 0x2864657070696B73, 0xEE00293A6D6F7266, 0xD00000000000001BLL, 0x8000000235A6C140);
  swift_bridgeObjectRelease();
  uint64_t v6 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_pageListHandler;
  swift_beginAccess();
  sub_235A38180(v6, (uint64_t)v11);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  id v7 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
  id v9 = v7;
  sub_235A5B7C0(a1, 2, 2, v9, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

void sub_235A370C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource;
  os_log_type_t v5 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = *(unsigned __int8 (**)(uint64_t, uint64_t))(v6 + 64);
  id v9 = v5;
  LODWORD(v6) = v8(ObjectType, v6);

  if (v6 == 2)
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    sub_235A389E8();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_235A68920();
    __swift_project_value_buffer(v10, (uint64_t)qword_26882DE48);
    os_log_type_t v11 = sub_235A68C40();
    sub_235A65720(v11, 0xD000000000000010, 0x8000000235A6C1A0, 0xD000000000000020, 0x8000000235A6C1C0);
    swift_bridgeObjectRelease();
    uint64_t v12 = v2 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate;
    if (MEMORY[0x237DECD00](v12))
    {
      uint64_t v13 = *(void *)(v12 + 8);
      uint64_t v14 = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(a1, v14, v13);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_235A3624C(a1);
  }
}

void sub_235A372D8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  swift_retain();
  uint64_t v6 = sub_235A389E8();
  unint64_t v8 = v7;
  swift_release();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_235A68920();
  __swift_project_value_buffer(v9, (uint64_t)qword_26882DE48);
  os_log_type_t v10 = sub_235A68C40();
  sub_235A65720(v10, 0xD000000000000023, 0x8000000235A6C2B0, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationStyle;
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationStyle) == 2)
  {
    if (*(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter))
    {
      uint64_t v12 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 80);
      swift_unknownObjectRetain();
      os_log_type_t v15 = (void *)v14(ObjectType, v12);
      swift_unknownObjectRelease();
      if (v15)
      {
        uint64_t v16 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationController);
        if (*(unsigned char *)(v4 + v11))
        {
          if (*(unsigned char *)(v4 + v11) != 1)
          {
LABEL_11:

            goto LABEL_12;
          }
          id v17 = v16;
          os_log_type_t v18 = sub_235A68C30();
          sub_235A65720(v18, 0xD000000000000032, 0x8000000235A6C300, 0xD000000000000031, 0x8000000235A6C340);
        }
        else
        {
          id v19 = v16;
          id v17 = objc_msgSend(v19, sel_popViewControllerAnimated_, 1);
        }
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  uint64_t v20 = (unsigned char *)(a1 + 16);
  swift_beginAccess();
  switch(*(unsigned char *)(a1 + 16))
  {
    case 1:
      uint64_t v32 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v31 = *(char **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for LanguageSelectionPresenter());
      swift_retain();
      uint64_t v28 = sub_235A5A0C8(v32, v31, a2, a3, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8ED970;
      break;
    case 2:
      uint64_t v34 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v33 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for VoiceTrainingPresenter());
      swift_retain();
      uint64_t v28 = (uint64_t)sub_235A51F1C(v34, v33, a2, a3, 0, 0, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8ED668;
      break;
    case 3:
      id v36 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v35 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for SuccessPresenter());
      swift_retain();
      uint64_t v28 = (uint64_t)sub_235A66D18(v36, v35, a2, a3, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8EE0E8;
      break;
    case 4:
      uint64_t v38 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v37 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for VoiceSelectionPresenter());
      swift_retain();
      uint64_t v28 = (uint64_t)sub_235A4F7D0(v38, v37, a2, a3, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8ED418;
      break;
    case 5:
      long long v40 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v39 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for EducationPresenter());
      swift_retain();
      uint64_t v28 = (uint64_t)sub_235A34974(v40, v39, a2, a3, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8EC400;
      break;
    case 6:
      id v42 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v41 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for DataSharingPresenter());
      swift_retain();
      uint64_t v28 = (uint64_t)sub_235A3EF08(v42, v41, a2, a3, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8ECAC8;
      break;
    default:
      uint64_t v22 = *(void **)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource);
      uint64_t v21 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_dataSource + 8);
      objc_allocWithZone((Class)type metadata accessor for IntroPresenter());
      swift_retain();
      id v23 = v22;
      uint64_t v24 = v11;
      id v25 = v23;
      id v26 = a2;
      long long v27 = v25;
      uint64_t v11 = v24;
      uint64_t v28 = (uint64_t)sub_235A44564(v27, v21, v26, a3, a1);
      *(void *)(v28 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate + 8) = &off_26E8EC4D8;
      swift_unknownObjectWeakAssign();
      long long v29 = (uint64_t *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter);
      long long v30 = &off_26E8ED130;
      break;
  }
  *long long v29 = v28;
  v29[1] = (uint64_t)v30;
  swift_unknownObjectRelease();
  sub_235A366C0();
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  v53[0] = 0xD000000000000014;
  v53[1] = 0x8000000235A6C2E0;
  sub_235A389E8();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  os_log_type_t v43 = sub_235A68C40();
  sub_235A65720(v43, 0xD000000000000023, 0x8000000235A6C2B0, 0xD000000000000014, 0x8000000235A6C2E0);
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter))
  {
    uint64_t v44 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter + 8);
    uint64_t v45 = swift_getObjectType();
    objc_super v46 = *(uint64_t (**)(uint64_t, uint64_t))(v44 + 80);
    swift_unknownObjectRetain();
    objc_super v47 = (void *)v46(v45, v44);
    swift_unknownObjectRelease();
    if (v47)
    {
      if (*(unsigned __int8 *)(v4 + v11) <= 1u) {
        objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_navigationController), sel_pushViewController_animated_, v47, 1);
      }
    }
  }
  uint64_t v48 = v4 + OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_delegate;
  if (MEMORY[0x237DECD00](v48))
  {
    uint64_t v49 = *(void *)(v48 + 8);
    uint64_t v50 = swift_getObjectType();
    LOBYTE(v53[0]) = *v20;
    (*(void (**)(void *, uint64_t, uint64_t))(v49 + 16))(v53, v50, v49);
    swift_unknownObjectRelease();
  }
  LOBYTE(v53[0]) = *v20;
  sub_235A465E0((char *)v53);
}

uint64_t SiriSetupCoordinator.ViewConfiguration.hidesNavigationBarActions.getter()
{
  return *v0;
}

uint64_t SiriSetupCoordinator.ViewConfiguration.hidesNavigationBarActions.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*SiriSetupCoordinator.ViewConfiguration.hidesNavigationBarActions.modify())()
{
  return nullsub_1;
}

uint64_t SiriSetupCoordinator.ViewConfiguration.displaysBackgroundOnly.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t SiriSetupCoordinator.ViewConfiguration.displaysBackgroundOnly.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*SiriSetupCoordinator.ViewConfiguration.displaysBackgroundOnly.modify())()
{
  return nullsub_1;
}

uint64_t SiriSetupCoordinator.ViewConfiguration.hash(into:)()
{
  return sub_235A68FB0();
}

BOOL static SiriSetupCoordinator.ViewConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

uint64_t SiriSetupCoordinator.ViewConfiguration.hashValue.getter()
{
  return sub_235A68FC0();
}

uint64_t sub_235A37BF4()
{
  return sub_235A68FC0();
}

uint64_t sub_235A37C54()
{
  return sub_235A68FB0();
}

uint64_t sub_235A37C94()
{
  return sub_235A68FC0();
}

BOOL sub_235A37CF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

uint64_t sub_235A37D18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t type metadata accessor for SiriSetupCoordinator()
{
  return self;
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

void sub_235A37DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8);
  if (v4)
  {
    os_log_type_t v5 = (void *)(*(void *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource)
                  + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguage);
    void *v5 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage);
    v5[1] = v4;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(self, sel_sharedPreferences);
    unint64_t v7 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setLanguageCode_, v7);
  }
  unint64_t v8 = *(void **)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource);
    os_log_type_t v10 = *(void **)(v9 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice);
    *(void *)(v9 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice) = v8;
    id v11 = v8;

    id v12 = objc_msgSend(self, sel_sharedPreferences);
    objc_msgSend(v12, sel_setOutputVoice_, v11);
  }
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled);
  if (v13)
  {
    BOOL v14 = v13 == 2;
    *(unsigned char *)(*(void *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource)
             + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled) = v14;
    id v15 = objc_msgSend(self, sel_sharedPreferences);
    objc_msgSend(v15, sel_setAssistantIsEnabled_, v14);
  }
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus + 8)) {
    goto LABEL_9;
  }
  *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus) = *(void *)(a1
                                                                                                  + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus);
  uint64_t v16 = *(void **)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_settingsQueue);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_235A388C4;
  *(void *)(v18 + 24) = v17;
  v24[4] = sub_235A388DC;
  v24[5] = v18;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 1107296256;
  v24[2] = sub_235A37D18;
  v24[3] = &block_descriptor_52;
  id v19 = _Block_copy(v24);
  uint64_t v20 = v16;
  swift_retain();
  swift_release();
  dispatch_sync(v20, v19);

  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v19)
  {
    __break(1u);
  }
  else
  {
LABEL_9:
    uint64_t v21 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_recognizeMyVoiceEnabled);
    if (v21) {
      sub_235A5EE20(v21 == 2);
    }
    uint64_t v22 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled);
    if (v22)
    {
      *(unsigned char *)(*(void *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource)
               + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_voiceTriggerEnabled) = v22 == 2;
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs), sel_setVoiceTriggerEnabled_);
    }
    uint64_t v23 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed);
    if (v23) {
      *(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup8Defaults_setupDismissed) = v23 == 2;
    }
  }
}

uint64_t sub_235A38180(uint64_t a1, uint64_t a2)
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

uint64_t sub_235A38278()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A382B0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 26, 7);
}

void sub_235A382E8()
{
  if (*(unsigned char *)(v0 + 25)) {
    __int16 v1 = 256;
  }
  else {
    __int16 v1 = 0;
  }
  sub_235A36610(*(void *)(v0 + 16), v1 | *(unsigned __int8 *)(v0 + 24));
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

unint64_t sub_235A38320()
{
  unint64_t result = qword_26882D3A0;
  if (!qword_26882D3A0)
  {
    sub_235A68A20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D3A0);
  }
  return result;
}

unint64_t sub_235A38378()
{
  unint64_t result = qword_26882D3A8;
  if (!qword_26882D3A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26882DC90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D3A8);
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

unint64_t sub_235A3841C()
{
  unint64_t result = qword_26882DC80;
  if (!qword_26882DC80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26882DC80);
  }
  return result;
}

unint64_t sub_235A38460()
{
  unint64_t result = qword_26882D3B0;
  if (!qword_26882D3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D3B0);
  }
  return result;
}

uint64_t method lookup function for SiriSetupCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriSetupCoordinator);
}

uint64_t dispatch thunk of SiriSetupCoordinator.__allocating_init(enrollmentMode:navigationController:delegate:assistantConfiguration:)()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of SiriSetupCoordinator.startEnrollment()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SiriSetupCoordinator.apply(config:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SiriSetupCoordinator.dismiss(from:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SiriSetupCoordinator.apply(viewConfiguration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriSetupCoordinator.ViewConfiguration(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriSetupCoordinator.ViewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x235A38750);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSetupCoordinator.ViewConfiguration()
{
  return &type metadata for SiriSetupCoordinator.ViewConfiguration;
}

void sub_235A38788()
{
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  sub_235A389E8();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_235A68920();
  __swift_project_value_buffer(v0, (uint64_t)qword_26882DE48);
  os_log_type_t v1 = sub_235A68C40();
  sub_235A65720(v1, 0x6F7266286B636162, 0xEB00000000293A6DLL, 0xD000000000000013, 0x8000000235A6C1F0);
  swift_bridgeObjectRelease();
  os_log_type_t v2 = sub_235A68C30();
  sub_235A65720(v2, 0xD000000000000010, 0x8000000235A6C210, 0xD000000000000023, 0x8000000235A6C230);
}

void sub_235A388C4()
{
  sub_235A5F3C8(v0);
}

uint64_t sub_235A388CC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235A388DC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235A38910@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 16);
  return result;
}

uint64_t sub_235A38954(char *a1)
{
  char v2 = *a1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = v2;
  return result;
}

uint64_t (*sub_235A38994())()
{
  return j__swift_endAccess;
}

uint64_t sub_235A389E8()
{
  sub_235A68DE0();
  sub_235A68B30();
  swift_beginAccess();
  sub_235A68E20();
  sub_235A68B30();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  uint64_t result = 0;
  if (*(void *)(v0 + 48))
  {
    swift_retain();
    sub_235A68DE0();
    uint64_t v2 = swift_bridgeObjectRelease();
    sub_235A389E8(v2);
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t static SetupPage.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
    return 1;
  }
  else {
    return sub_235A68F50();
  }
}

uint64_t sub_235A38BCC()
{
  swift_bridgeObjectRetain();
  sub_235A68B20();

  return swift_bridgeObjectRelease();
}

uint64_t SetupPage.deinit()
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v0 + 48) = 0;
  if (v1)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native()) {
        break;
      }
      uint64_t v2 = *(void *)(v1 + 48);
      swift_retain();
      swift_release();
      uint64_t v1 = v2;
    }
    while (v2);
  }
  swift_release();
  return v0;
}

uint64_t SetupPage.__deallocating_deinit()
{
  SetupPage.deinit();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_235A38CCC()
{
  return sub_235A68FC0();
}

uint64_t sub_235A38D28()
{
  return sub_235A389E8();
}

uint64_t sub_235A38D4C()
{
  return sub_235A68FC0();
}

uint64_t sub_235A38DAC()
{
  swift_bridgeObjectRetain();
  sub_235A68B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235A38E08()
{
  return sub_235A68FC0();
}

uint64_t sub_235A38E64(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 24) == *(void *)(*(void *)a2 + 24)
    && *(void *)(*(void *)a1 + 32) == *(void *)(*(void *)a2 + 32))
  {
    return 1;
  }
  else
  {
    return sub_235A68F50();
  }
}

BOOL static PageType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PageType.hash(into:)()
{
  return sub_235A68FA0();
}

uint64_t PageType.hashValue.getter()
{
  return sub_235A68FC0();
}

BOOL sub_235A38F18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235A38F30()
{
  return sub_235A68FA0();
}

unint64_t sub_235A38F64()
{
  unint64_t result = qword_26882D3B8;
  if (!qword_26882D3B8)
  {
    type metadata accessor for SetupPage();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D3B8);
  }
  return result;
}

uint64_t type metadata accessor for SetupPage()
{
  return self;
}

unint64_t sub_235A38FE0()
{
  unint64_t result = qword_26882D3C0;
  if (!qword_26882D3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D3C0);
  }
  return result;
}

uint64_t sub_235A39034@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_235A3907C(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 16) = v2;
  return result;
}

uint64_t method lookup function for SetupPage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetupPage);
}

uint64_t dispatch thunk of SetupPage.pageType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SetupPage.pageType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SetupPage.pageType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SetupPage.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SetupPage.hash(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SetupPage.hashValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PageType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PageType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x235A39328);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_235A39350(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_235A39358(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PageType()
{
  return &type metadata for PageType;
}

uint64_t sub_235A39370()
{
  return sub_235A68FC0();
}

uint64_t sub_235A393B8()
{
  return sub_235A68FC0();
}

uint64_t sub_235A393FC()
{
  uint64_t v97 = MEMORY[0x263F8EE78];
  if (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup12Configurator_enrollmentMode) - 1 >= 2)
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup12Configurator_enrollmentMode))
    {
      type metadata accessor for SetupPage();
      uint64_t v78 = swift_allocObject();
      id v79 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v80 = objc_msgSend(v79, sel_UUIDString);

      uint64_t v81 = sub_235A68B00();
      uint64_t v83 = v82;

      *(void *)(v78 + 24) = v81;
      *(void *)(v78 + 32) = v83;
      *(void *)(v78 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v78 + 16) = 5;
      *(unsigned char *)(v78 + 40) = 0;
      *(void *)(v78 + 48) = 0;
      swift_release();
      swift_weakAssign();
      uint64_t v84 = swift_retain();
      MEMORY[0x237DEBFF0](v84);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      uint64_t v85 = swift_allocObject();
      id v86 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v87 = objc_msgSend(v86, sel_UUIDString);

      uint64_t v88 = sub_235A68B00();
      uint64_t v90 = v89;

      *(void *)(v85 + 24) = v88;
      *(void *)(v85 + 32) = v90;
      *(void *)(v85 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v85 + 16) = 6;
      *(unsigned char *)(v85 + 40) = 1;
      *(void *)(v85 + 48) = 0;
      swift_release();
      swift_weakAssign();
      uint64_t v91 = swift_retain();
      MEMORY[0x237DEBFF0](v91);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      swift_release();
      swift_release();
    }
    else
    {
      type metadata accessor for SetupPage();
      uint64_t v28 = swift_allocObject();
      id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v30 = objc_msgSend(v29, sel_UUIDString);

      uint64_t v31 = sub_235A68B00();
      uint64_t v33 = v32;

      *(void *)(v28 + 24) = v31;
      *(void *)(v28 + 32) = v33;
      *(void *)(v28 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v28 + 16) = 4;
      *(unsigned char *)(v28 + 40) = 1;
      *(void *)(v28 + 48) = 0;
      swift_release();
      swift_weakAssign();
      uint64_t v34 = swift_allocObject();
      id v35 = objc_allocWithZone(MEMORY[0x263F08C38]);
      swift_retain();
      id v36 = objc_msgSend(v35, sel_init);
      id v37 = objc_msgSend(v36, sel_UUIDString);

      uint64_t v38 = sub_235A68B00();
      uint64_t v40 = v39;

      *(void *)(v34 + 24) = v38;
      *(void *)(v34 + 32) = v40;
      *(void *)(v34 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v34 + 16) = 1;
      *(unsigned char *)(v34 + 40) = 1;
      *(void *)(v34 + 48) = 0;
      swift_release();
      swift_weakAssign();
      swift_release();
      uint64_t v41 = swift_allocObject();
      id v42 = objc_allocWithZone(MEMORY[0x263F08C38]);
      swift_retain();
      id v43 = objc_msgSend(v42, sel_init);
      id v44 = objc_msgSend(v43, sel_UUIDString);

      uint64_t v45 = sub_235A68B00();
      uint64_t v47 = v46;

      *(void *)(v41 + 24) = v45;
      *(void *)(v41 + 32) = v47;
      *(void *)(v41 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v41 + 16) = 0;
      *(unsigned char *)(v41 + 40) = 0;
      *(void *)(v41 + 48) = 0;
      swift_release();
      swift_weakAssign();
      swift_release();
      uint64_t v48 = swift_retain();
      MEMORY[0x237DEBFF0](v48);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      uint64_t v49 = swift_retain();
      MEMORY[0x237DEBFF0](v49);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      uint64_t v50 = swift_retain();
      MEMORY[0x237DEBFF0](v50);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      uint64_t v51 = swift_allocObject();
      id v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v53 = objc_msgSend(v52, sel_UUIDString);

      uint64_t v54 = sub_235A68B00();
      uint64_t v56 = v55;

      *(void *)(v51 + 24) = v54;
      *(void *)(v51 + 32) = v56;
      *(void *)(v51 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v51 + 16) = 3;
      *(unsigned char *)(v51 + 40) = 0;
      *(void *)(v51 + 48) = 0;
      swift_release();
      swift_weakAssign();
      uint64_t v57 = swift_allocObject();
      id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v59 = objc_msgSend(v58, (SEL)&selRef_addTarget_action_forControlEvents_);

      uint64_t v60 = sub_235A68B00();
      uint64_t v62 = v61;

      *(void *)(v57 + 24) = v60;
      *(void *)(v57 + 32) = v62;
      *(void *)(v57 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v57 + 16) = 2;
      *(unsigned char *)(v57 + 40) = 1;
      *(void *)(v57 + 48) = v51;
      swift_release();
      swift_weakAssign();
      uint64_t v63 = swift_retain();
      MEMORY[0x237DEBFF0](v63);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      uint64_t v64 = swift_allocObject();
      id v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v66 = objc_msgSend(v65, sel_UUIDString);

      uint64_t v67 = sub_235A68B00();
      uint64_t v69 = v68;

      *(void *)(v64 + 24) = v67;
      *(void *)(v64 + 32) = v69;
      *(void *)(v64 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v64 + 16) = 5;
      *(unsigned char *)(v64 + 40) = 0;
      *(void *)(v64 + 48) = 0;
      swift_release();
      swift_weakAssign();
      uint64_t v70 = swift_retain();
      MEMORY[0x237DEBFF0](v70);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      uint64_t v71 = swift_allocObject();
      id v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v73 = objc_msgSend(v72, sel_UUIDString);

      uint64_t v74 = sub_235A68B00();
      uint64_t v76 = v75;

      *(void *)(v71 + 24) = v74;
      *(void *)(v71 + 32) = v76;
      *(void *)(v71 + 48) = 0;
      swift_weakInit();
      *(unsigned char *)(v71 + 16) = 6;
      *(unsigned char *)(v71 + 40) = 1;
      *(void *)(v71 + 48) = 0;
      swift_release();
      swift_weakAssign();
      uint64_t v77 = swift_retain();
      MEMORY[0x237DEBFF0](v77);
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_235A68BA0();
      }
      sub_235A68BB0();
      sub_235A68B90();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    type metadata accessor for SetupPage();
    uint64_t v1 = swift_allocObject();
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
    id v3 = objc_msgSend(v2, sel_UUIDString);

    uint64_t v4 = sub_235A68B00();
    uint64_t v6 = v5;

    *(void *)(v1 + 24) = v4;
    *(void *)(v1 + 32) = v6;
    *(void *)(v1 + 48) = 0;
    swift_weakInit();
    *(unsigned char *)(v1 + 16) = 0;
    *(unsigned char *)(v1 + 40) = 0;
    *(void *)(v1 + 48) = 0;
    swift_release();
    uint64_t v7 = swift_weakAssign();
    MEMORY[0x237DEBFF0](v7);
    if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_235A68BA0();
    }
    sub_235A68BB0();
    sub_235A68B90();
    uint64_t v8 = swift_allocObject();
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
    id v10 = objc_msgSend(v9, sel_UUIDString);

    uint64_t v11 = sub_235A68B00();
    uint64_t v13 = v12;

    *(void *)(v8 + 24) = v11;
    *(void *)(v8 + 32) = v13;
    *(void *)(v8 + 48) = 0;
    swift_weakInit();
    *(unsigned char *)(v8 + 16) = 3;
    *(unsigned char *)(v8 + 40) = 0;
    *(void *)(v8 + 48) = 0;
    swift_release();
    swift_weakAssign();
    uint64_t v14 = swift_allocObject();
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
    id v16 = objc_msgSend(v15, sel_UUIDString);

    uint64_t v17 = sub_235A68B00();
    uint64_t v19 = v18;

    *(void *)(v14 + 24) = v17;
    *(void *)(v14 + 32) = v19;
    *(void *)(v14 + 48) = 0;
    swift_weakInit();
    *(unsigned char *)(v14 + 16) = 2;
    *(unsigned char *)(v14 + 40) = 1;
    *(void *)(v14 + 48) = v8;
    swift_release();
    uint64_t v20 = swift_weakAssign();
    MEMORY[0x237DEBFF0](v20);
    if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_235A68BA0();
    }
    sub_235A68BB0();
    sub_235A68B90();
    uint64_t v21 = swift_allocObject();
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
    id v23 = objc_msgSend(v22, sel_UUIDString);

    uint64_t v24 = sub_235A68B00();
    uint64_t v26 = v25;

    *(void *)(v21 + 24) = v24;
    *(void *)(v21 + 32) = v26;
    *(void *)(v21 + 48) = 0;
    swift_weakInit();
    *(unsigned char *)(v21 + 16) = 6;
    *(unsigned char *)(v21 + 40) = 1;
    *(void *)(v21 + 48) = 0;
    swift_release();
    uint64_t v27 = swift_weakAssign();
    MEMORY[0x237DEBFF0](v27);
    if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_235A68BA0();
    }
    sub_235A68BB0();
    sub_235A68B90();
  }
  sub_235A68DE0();
  sub_235A68B30();
  sub_235A68E20();
  sub_235A68B30();
  uint64_t v92 = type metadata accessor for SetupPage();
  uint64_t v93 = swift_bridgeObjectRetain();
  MEMORY[0x237DEC020](v93, v92);
  sub_235A68B30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v94 = sub_235A68920();
  __swift_project_value_buffer(v94, (uint64_t)qword_26882DE48);
  os_log_type_t v95 = sub_235A68C40();
  sub_235A65720(v95, 0xD000000000000013, 0x8000000235A6C4A0, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  return v97;
}

id sub_235A3A1C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Configurator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Configurator()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SRSNavigationStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ViewStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x235A3A38CLL);
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

ValueMetadata *type metadata accessor for ViewStyle()
{
  return &type metadata for ViewStyle;
}

unint64_t sub_235A3A3C8()
{
  unint64_t result = qword_26882D3D8;
  if (!qword_26882D3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D3D8);
  }
  return result;
}

char *sub_235A3A424(char a1)
{
  id v3 = objc_allocWithZone(MEMORY[0x263F75438]);
  unsigned int v4 = v1;
  id v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 198.0, 198.0);
  *(void *)&v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView] = v5;
  type metadata accessor for CheckMarkView();
  *(void *)&v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_fitsToSuperView] = a1;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for OrbContainerView();
  unsigned int v6 = (char *)objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v7 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark;
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v8 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView;
  objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v6[v8], sel_setMode_, 3);
  objc_msgSend(v6, sel_addSubview_, *(void *)&v6[v8]);
  objc_msgSend(v6, sel_addSubview_, *(void *)&v6[v7]);

  return v6;
}

void sub_235A3A5E0()
{
  v27.receiver = v0;
  v27.super_class = (Class)type metadata accessor for OrbContainerView();
  objc_msgSendSuper2(&v27, sel_updateConstraints);
  if (v0[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_fitsToSuperView] == 1)
  {
    id v1 = objc_msgSend(v0, sel_superview);
    if (v1)
    {
      int v2 = v1;
      id v3 = objc_msgSend(v0, sel_heightAnchor);
      id v4 = objc_msgSend(v2, sel_heightAnchor);
      id v5 = objc_msgSend(v3, sel_constraintEqualToAnchor_, v4);

      objc_msgSend(v5, sel_setActive_, 1);
      id v6 = objc_msgSend(v0, sel_widthAnchor);
      id v7 = objc_msgSend(v2, sel_widthAnchor);
      id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

      objc_msgSend(v8, sel_setActive_, 1);
    }
  }
  uint64_t v9 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView;
  id v10 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView], sel_heightAnchor);
  id v11 = objc_msgSend(v10, sel_constraintEqualToConstant_, 198.0);

  objc_msgSend(v11, sel_setActive_, 1);
  id v12 = objc_msgSend(*(id *)&v0[v9], sel_widthAnchor);
  id v13 = objc_msgSend(v12, sel_constraintEqualToConstant_, 198.0);

  objc_msgSend(v13, sel_setActive_, 1);
  id v14 = objc_msgSend(*(id *)&v0[v9], sel_centerXAnchor);
  id v15 = objc_msgSend(v0, sel_centerXAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  objc_msgSend(v16, sel_setActive_, 1);
  id v17 = objc_msgSend(*(id *)&v0[v9], sel_centerYAnchor);
  id v18 = objc_msgSend(v0, sel_centerYAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

  objc_msgSend(v19, sel_setActive_, 1);
  uint64_t v20 = OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark;
  id v21 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark], sel_centerXAnchor);
  id v22 = objc_msgSend(*(id *)&v0[v9], sel_centerXAnchor);
  id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

  objc_msgSend(v23, sel_setActive_, 1);
  id v24 = objc_msgSend(*(id *)&v0[v20], sel_centerYAnchor);
  id v25 = objc_msgSend(*(id *)&v0[v9], sel_centerYAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  objc_msgSend(v26, sel_setActive_, 1);
}

id sub_235A3AA40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OrbContainerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OrbContainerView()
{
  return self;
}

void sub_235A3AAE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

char *sub_235A3AB70(_OWORD *a1)
{
  long long v2 = a1[9];
  long long v61 = a1[8];
  long long v62 = v2;
  long long v3 = a1[11];
  long long v63 = a1[10];
  long long v64 = v3;
  long long v4 = a1[5];
  long long v57 = a1[4];
  long long v58 = v4;
  long long v5 = a1[7];
  long long v59 = a1[6];
  long long v60 = v5;
  long long v6 = a1[1];
  v54[0] = *a1;
  v54[1] = v6;
  long long v7 = a1[3];
  long long v55 = a1[2];
  long long v56 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_orbView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection] = 0;
  uint64_t v8 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for VoiceOptionsView());
  id v10 = v1;
  *(void *)&v1[v8] = objc_msgSend(v9, sel_init);
  *(void *)&v10[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter] = 0;
  *(void *)&v10[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton] = 0;
  *(void *)&v10[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_primaryButton] = 0;

  id v11 = (void *)sub_235A68AF0();
  id v12 = objc_msgSend(self, sel_bundleWithIdentifier_, v11);

  id v13 = (void *)sub_235A68AF0();
  id v14 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v13, v12, 0);

  id v15 = (void *)sub_235A68AF0();
  if (*((void *)&v55 + 1))
  {
    swift_bridgeObjectRetain();
    id v16 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = 0;
  }
  id v17 = (objc_class *)type metadata accessor for VoiceSelectionWelcomeController();
  v53.receiver = v10;
  v53.super_class = v17;
  id v18 = (char *)objc_msgSendSuper2(&v53, sel_initWithTitle_detailText_icon_, v15, v16, v14);

  uint64_t v19 = v60;
  if ((void)v60)
  {
    uint64_t v20 = *((void *)&v59 + 1);
    v52[3] = v17;
    v52[0] = v18;
    objc_allocWithZone(MEMORY[0x263F824A8]);
    swift_bridgeObjectRetain();
    id v21 = v18;
    id v22 = sub_235A3C390(v20, v19, 0, v52, (uint64_t)sel_continueTapped);
    uint64_t v23 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton;
    id v24 = *(void **)&v21[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton];
    *(void *)&v21[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton] = v22;

    id v25 = objc_msgSend(v21, sel_navigationItem);
    id v26 = *(id *)&v21[v23];
    objc_msgSend(v25, sel_setRightBarButtonItem_, v26);

    objc_super v27 = *(void **)&v21[v23];
    if (v27) {
      objc_msgSend(v27, sel_setEnabled_, 0);
    }
    if ((void)v57) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v31 = v18;
    if ((void)v57)
    {
LABEL_8:
      swift_bridgeObjectRetain();
      sub_235A346CC((uint64_t)v54);
      id v28 = objc_msgSend(self, sel_linkButton);
      id v29 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setTitle_forState_, v29, 0);

      objc_msgSend(v28, sel_addTarget_action_forControlEvents_, v18, sel_chooseForMeTapped, 64);
      id v30 = objc_msgSend(v18, sel_buttonTray);
      objc_msgSend(v30, sel_addButton_, v28);

      goto LABEL_11;
    }
  }
  sub_235A346CC((uint64_t)v54);
LABEL_11:
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F75418]), sel_init);
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F75458]), sel_init);
  uint64_t v34 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView;
  id v35 = *(void **)&v18[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView];
  id v36 = objc_allocWithZone(MEMORY[0x263F75460]);
  id v37 = v18;
  id v38 = v33;
  id v39 = v35;
  id v40 = v32;
  uint64_t v41 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  id v42 = objc_msgSend(v36, sel_initWithDataManaging_view_delegate_voicePreviewing_recognitionLanguage_, v38, v39, v37, v40, v41);

  id v43 = *(void **)&v37[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter];
  *(void *)&v37[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter] = v42;

  objc_msgSend(v37, sel_setTableView_, *(void *)(*(void *)&v18[v34] + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView));
  unint64_t result = (char *)objc_msgSend(v37, sel_tableView);
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v45 = result;
  objc_msgSend(result, sel_setAlwaysBounceVertical_, 0);

  unint64_t result = (char *)objc_msgSend(v37, sel_tableView);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v46 = result;
  id v47 = objc_msgSend(result, sel_heightAnchor);

  unint64_t result = (char *)objc_msgSend(v37, sel_tableView);
  if (result)
  {
    uint64_t v48 = result;
    objc_msgSend(result, sel_sizeThatFits_, 1.79769313e308, 1.79769313e308);
    double v50 = v49;

    id v51 = objc_msgSend(v47, sel_constraintEqualToConstant_, v50);
    objc_msgSend(v51, sel_setActive_, 1);

    return v37;
  }
LABEL_17:
  __break(1u);
  return result;
}

void sub_235A3B13C()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection;
  if (*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection))
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceSelectionPresenter), sel_stopVoicePreview);
    if (MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate))
    {
      long long v2 = *(void **)(v0 + v1);
      id v3 = v2;
      sub_235A505E8(v2);

      swift_unknownObjectRelease();
    }
  }
}

id sub_235A3B3C4()
{
  return sub_235A3C280(type metadata accessor for VoiceSelectionWelcomeController);
}

uint64_t type metadata accessor for VoiceSelectionWelcomeController()
{
  return self;
}

uint64_t sub_235A3B594(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + *a4) = a3;
  swift_unknownObjectRetain();

  return swift_unknownObjectRelease();
}

id sub_235A3B5D8()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource;
  long long v2 = *(void **)&v0[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource];
  }
  else
  {
    long long v4 = v0;
    long long v5 = *(void **)&v0[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView];
    *(void *)(swift_allocObject() + 16) = v0;
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26882D560));
    id v6 = v5;
    long long v7 = v0;
    uint64_t v8 = (void *)sub_235A689B0();
    id v9 = *(void **)&v0[v1];
    *(void *)&v4[v1] = v8;
    id v3 = v8;

    long long v2 = 0;
  }
  id v10 = v2;
  return v3;
}

unint64_t sub_235A3B6AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_235A68960();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v34[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = (void *)sub_235A68AF0();
  id v11 = objc_msgSend(a1, sel_dequeueReusableCellWithIdentifier_, v10);

  if (!v11)
  {
    id v12 = objc_allocWithZone(MEMORY[0x263F82C80]);
    swift_bridgeObjectRetain();
    id v13 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v12, sel_initWithStyle_reuseIdentifier_, 0, v13);
  }
  sub_235A68940();
  id v14 = *(void **)(a4 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  if (!v14) {
    goto LABEL_17;
  }
  id v15 = objc_msgSend(v14, sel_voices);
  sub_235A348B8(0, &qword_26882D558);
  uint64_t v16 = sub_235A68B70();

  unint64_t result = sub_235A688E0();
  if ((v16 & 0xC000000000000001) != 0)
  {
    id v18 = (id)MEMORY[0x237DEC2A0](result, v16);
LABEL_8:
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v19, sel_localizedDisplayName);
    sub_235A68B00();

    sub_235A68950();
    v34[3] = v6;
    v34[4] = MEMORY[0x263F81F20];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v9, v6);
    MEMORY[0x237DEC0F0](v34);
    id v22 = objc_msgSend(v19, sel_voiceInfo);
    uint64_t v23 = *(void **)(a4 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice);
    if (v22)
    {
      id v24 = v22;
      if (v23)
      {
        sub_235A348B8(0, &qword_26882D568);
        id v25 = v23;
        id v26 = v24;
        char v27 = sub_235A68D40();

        if (v27) {
          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    else if (!v23)
    {
LABEL_13:
      uint64_t v28 = 3;
LABEL_16:
      objc_msgSend(v11, sel_setAccessoryType_, v28);
      id v29 = v11;
      objc_msgSend(v29, sel_setSemanticContentAttribute_, objc_msgSend(a1, sel_semanticContentAttribute));

LABEL_17:
      id v30 = self;
      id v31 = v11;
      id v32 = objc_msgSend(v30, sel_secondarySystemBackgroundColor);
      objc_msgSend(v31, sel_setBackgroundColor_, v32);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return (unint64_t)v31;
    }
    uint64_t v28 = 0;
    goto LABEL_16;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v18 = *(id *)(v16 + 8 * result + 32);
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

char *sub_235A3BA70()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView;
  id v2 = objc_allocWithZone(MEMORY[0x263F82C78]);
  id v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel] = 0;
  long long v4 = &v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier];
  strcpy(&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier], "voiceSection");
  v4[13] = 0;
  *((_WORD *)v4 + 7) = -5120;
  long long v5 = &v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_cellReuseIdentifier];
  *(void *)long long v5 = 0xD000000000000010;
  *((void *)v5 + 1) = 0x8000000235A6C860;
  *(void *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionViewModelProvider] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionEventHandler] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource] = 0;

  v22.receiver = v3;
  v22.super_class = (Class)type metadata accessor for VoiceOptionsView();
  uint64_t v6 = (char *)objc_msgSendSuper2(&v22, sel_init);
  uint64_t v7 = OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView;
  uint64_t v8 = *(void **)&v6[OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_tableView];
  id v9 = v6;
  objc_msgSend(v8, sel_setDelegate_, v9);
  id v10 = v8;
  id v11 = sub_235A3B5D8();
  objc_msgSend(v10, sel_setDataSource_, v11);

  id v12 = objc_msgSend(*(id *)&v6[v7], sel_layer);
  objc_msgSend(v12, sel_setCornerRadius_, 8.0);

  id v13 = *(void **)&v6[v7];
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setRowHeight_, *MEMORY[0x263F839B8]);
  id v14 = self;
  id v15 = v13;
  id v16 = objc_msgSend(v14, sel_systemBackgroundColor);
  objc_msgSend(v15, sel_setBackgroundColor_, v16);

  id v17 = *(void **)&v6[v7];
  sub_235A348B8(0, (unint64_t *)&unk_26882D570);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v19 = v17;
  swift_bridgeObjectRetain();
  id v20 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v20);

  return v9;
}

void sub_235A3BE3C()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionViewModelProvider);
  if (v1) {
    id v1 = objc_msgSend(v1, sel_voiceSelectionViewModel);
  }
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel) = v1;

  sub_235A3BEE0();
}

void sub_235A3BEE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D548);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A689A0();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
  uint64_t v6 = swift_allocObject();
  long long v39 = xmmword_235A6A830;
  *(_OWORD *)(v6 + 16) = xmmword_235A6A830;
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier + 8);
  uint64_t v36 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_sectionReuseIdentifier);
  *(void *)(v6 + 32) = v36;
  *(void *)(v6 + 40) = v7;
  uint64_t v34 = v7;
  swift_bridgeObjectRetain();
  id v37 = v5;
  uint64_t v38 = v2;
  sub_235A68990();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  if (!v8) {
    goto LABEL_12;
  }
  id v28 = v8;
  id v9 = objc_msgSend(v28, sel_voices);
  sub_235A348B8(0, &qword_26882D558);
  unint64_t v10 = sub_235A68B70();

  uint64_t v29 = v1;
  uint64_t v30 = v3;
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_4;
    }
LABEL_11:

    swift_bridgeObjectRelease();
    uint64_t v3 = v30;
LABEL_12:
    id v25 = sub_235A3B5D8();
    id v26 = v37;
    sub_235A689C0();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v26, v38);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_235A68E50();
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_11;
  }
LABEL_4:
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    unint64_t v31 = v10 & 0xC000000000000001;
    uint64_t v32 = v11;
    unint64_t v33 = v10;
    do
    {
      if (v31) {
        id v13 = (id)MEMORY[0x237DEC2A0](v12, v10);
      }
      else {
        id v13 = *(id *)(v10 + 8 * v12 + 32);
      }
      id v14 = v13;
      ++v12;
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = v39;
      id v16 = objc_msgSend(v14, sel_localizedDisplayName);
      uint64_t v17 = sub_235A68B00();
      uint64_t v19 = v18;

      *(void *)(v15 + 32) = v17;
      *(void *)(v15 + 40) = v19;
      uint64_t v40 = v36;
      uint64_t v41 = v34;
      swift_bridgeObjectRetain();
      sub_235A68970();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = v39;
      id v21 = objc_msgSend(v14, sel_localizedDisplayName);
      uint64_t v22 = sub_235A68B00();
      uint64_t v24 = v23;

      *(void *)(v20 + 32) = v22;
      *(void *)(v20 + 40) = v24;
      sub_235A68980();

      swift_bridgeObjectRelease();
      unint64_t v10 = v33;
    }
    while (v32 != v12);
    goto LABEL_11;
  }
  __break(1u);
}

id sub_235A3C268()
{
  return sub_235A3C280(type metadata accessor for VoiceOptionsView);
}

id sub_235A3C280(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for VoiceOptionsView()
{
  return self;
}

id sub_235A3C390(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (!a2)
  {
    unint64_t v10 = 0;
    uint64_t v11 = a4[3];
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  unint64_t v10 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  uint64_t v11 = a4[3];
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = __swift_project_boxed_opaque_existential_1(a4, v11);
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v15);
  uint64_t v16 = sub_235A68F40();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a4);
LABEL_6:
  id v17 = objc_msgSend(v6, sel_initWithTitle_style_target_action_, v10, a3, v16, a5);

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_235A3C518()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_235A3C550(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_235A3B6AC(a1, a2, a3, *(void *)(v3 + 16));
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

void sub_235A3C5BC(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection);
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_currentVoiceSelection) = a1;
  id v4 = a1;

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_voiceOptionsView);
  uint64_t v6 = *(void **)(v1 + v2);
  uint64_t v7 = *(void **)(v5 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice);
  *(void *)(v5 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice) = v6;
  id v8 = v6;

  if (*(void *)(v1 + v2))
  {
    id v9 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_continueButton);
    if (v9) {
      objc_msgSend(v9, sel_setEnabled_, 1);
    }
    unint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_primaryButton);
    if (v10)
    {
      objc_msgSend(v10, sel_setEnabled_, 1);
    }
  }
}

void *sub_235A3C68C()
{
  unint64_t result = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_viewModel);
  if (result)
  {
    id v2 = objc_msgSend(result, sel_voices);
    sub_235A348B8(0, &qword_26882D558);
    uint64_t v3 = sub_235A68B70();

    unint64_t v4 = sub_235A688E0();
    if ((v3 & 0xC000000000000001) == 0)
    {
      if ((v4 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v4 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v5 = *(id *)(v3 + 8 * v4 + 32);
LABEL_6:
        swift_bridgeObjectRelease();
        uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_voiceSelectionEventHandler);
        if (v6) {
          objc_msgSend(v6, sel_voiceSelectionView_receivedRequestToSelectVoice_, v0);
        }
        return (void *)MEMORY[0x270F9A828]();
      }
      __break(1u);
      return (void *)MEMORY[0x270F9A828]();
    }
    MEMORY[0x237DEC2A0](v4, v3);
    goto LABEL_6;
  }
  return result;
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

void sub_235A3C7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v53 = a3;
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  uint64_t v4 = sub_235A68A20();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  uint64_t v49 = v5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v47 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_235A68A70();
  uint64_t v7 = *(void *)(v52 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v39 = (char *)&v38 - v11;
  uint64_t v12 = sub_235A68CC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_235A68A50();
  uint64_t v44 = *(void *)(v16 - 8);
  uint64_t v45 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_235A68CA0();
  MEMORY[0x270FA5388](v19 - 8);
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  id v42 = objc_msgSend(ObjCClassFromMetadata, sel_sharedInstance);
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 0;
  sub_235A3841C();
  sub_235A68C90();
  sub_235A68A30();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F130], v12);
  id v21 = (void *)sub_235A68D10();
  sub_235A68A60();
  MEMORY[0x237DEBF50](v10, 5.0);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v40 = v7 + 8;
  v22(v10, v52);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v21;
  v23[3] = v20;
  uint64_t v24 = v43;
  v23[4] = v53;
  v23[5] = v24;
  long long v59 = sub_235A3D290;
  long long v60 = v23;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v56 = 1107296256;
  uint64_t v41 = &v57;
  long long v57 = sub_235A3667C;
  long long v58 = &block_descriptor_2;
  id v25 = _Block_copy(&aBlock);
  id v26 = v21;
  swift_retain();
  swift_retain();
  sub_235A68A30();
  uint64_t v54 = MEMORY[0x263F8EE78];
  sub_235A38320();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A38378();
  uint64_t v27 = v47;
  uint64_t v28 = v48;
  sub_235A68DB0();
  uint64_t v29 = v39;
  MEMORY[0x237DEC150](v39, v18, v27, v25);
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v18, v45);
  v22(v29, v52);
  swift_release();
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = v26;
  v30[3] = v20;
  v30[4] = v53;
  v30[5] = v24;
  unint64_t v31 = v42;
  uint64_t v32 = v50;
  v30[6] = v42;
  v30[7] = v32;
  v30[8] = v51;
  swift_bridgeObjectRetain();
  id v33 = v26;
  swift_retain();
  swift_retain();
  id v34 = v31;
  id v35 = objc_msgSend(ObjCClassFromMetadata, sel_sharedInstance);
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = sub_235A3D8D4;
  *(void *)(v36 + 24) = v30;
  long long v59 = sub_235A3DEA0;
  long long v60 = (void *)v36;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v56 = 1107296256;
  long long v57 = sub_235A3DEA8;
  long long v58 = &block_descriptor_12;
  id v37 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v35, sel_getConformingSharedUserIds_, v37);
  _Block_release(v37);

  swift_release();
  swift_release();
}

uint64_t sub_235A3CE1C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_235A3CE2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a4;
  uint64_t v26 = sub_235A68A50();
  uint64_t v13 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_235A68A20();
  uint64_t v16 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A68A10();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a5;
  v19[3] = a6;
  v19[4] = a7;
  v19[5] = a1;
  v19[6] = a2;
  v19[7] = a3;
  aBlock[4] = sub_235A3E388;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_36;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  id v21 = a1;
  swift_bridgeObjectRetain();
  sub_235A68A30();
  MEMORY[0x237DEC190](0, v15, v18, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v26);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v24);
  return swift_release();
}

uint64_t sub_235A3D088(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (unsigned char *)(a1 + 16);
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    swift_beginAccess();
    *uint64_t v11 = 1;
    return a2(a4, a5, a6);
  }
  return result;
}

void sub_235A3D12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D5F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235A6A830;
  *(void *)(inited + 32) = sub_235A68B00();
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000013;
  *(void *)(inited + 56) = 0x8000000235A6CB40;
  sub_235A3D2B4(inited);
  id v10 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v11 = (void *)sub_235A68AF0();
  uint64_t v12 = (void *)sub_235A68AC0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, -1, v12);

  sub_235A3CE2C(v13, 0, 0, a1, a2, a3, a4);
}

void sub_235A3D290()
{
  sub_235A3D12C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_235A3D2B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D5F8);
  uint64_t v2 = sub_235A68E80();
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
    sub_235A3E398(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_235A5D564(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_235A3E400(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_235A3D3E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D608);
  uint64_t v2 = (void *)sub_235A68E80();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_235A5D564(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

void sub_235A3D504(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 16))
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    uint64_t v34 = a7;
    uint64_t v35 = a8;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_235A68920();
    __swift_project_value_buffer(v15, (uint64_t)qword_26882DE48);
    os_log_type_t v16 = sub_235A68C40();
    sub_235A65720(v16, 0xD000000000000026, 0x8000000235A6CA30, 0xD000000000000028, 0x8000000235A6CA60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    long long v17 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = a2;
    v18[3] = a3;
    v18[4] = a4;
    v18[5] = a5;
    uint64_t v32 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_235A3E248;
    id v33 = v18;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    uint64_t v30 = sub_235A3DB50;
    unint64_t v31 = &block_descriptor_18;
    uint64_t v19 = _Block_copy(&aBlock);
    id v20 = a2;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(a6, sel_getSharedUserIdForiCloudAltDSID_completion_, v17, v19);
    goto LABEL_9;
  }
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_235A68920();
  __swift_project_value_buffer(v21, (uint64_t)qword_26882DE48);
  os_log_type_t v22 = sub_235A68C40();
  sub_235A65720(v22, 0xD000000000000026, 0x8000000235A6CA30, 0xD00000000000003ELL, 0x8000000235A6CAB0);
  id v23 = objc_msgSend(self, sel_sharedInstance);
  if (v23)
  {
    long long v17 = v23;
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = a2;
    v24[3] = a3;
    v24[4] = a4;
    v24[5] = a5;
    void v24[6] = a6;
    v24[7] = a7;
    v24[8] = a8;
    uint64_t v32 = sub_235A3E2A8;
    id v33 = v24;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    uint64_t v30 = sub_235A3DBE8;
    unint64_t v31 = &block_descriptor_24;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    id v25 = a2;
    swift_retain();
    swift_retain();
    id v26 = a6;
    swift_release();
    objc_msgSend(v17, sel_getSharedUserID_, v19);
LABEL_9:
    _Block_release(v19);

    return;
  }
  __break(1u);
}

void sub_235A3D8D4(uint64_t a1)
{
  sub_235A3D504(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

void sub_235A3D8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a2)
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_235A68920();
    __swift_project_value_buffer(v15, (uint64_t)qword_26882DE48);
    os_log_type_t v16 = sub_235A68C40();
    sub_235A65720(v16, 0xD000000000000026, 0x8000000235A6CA30, 0xD00000000000001BLL, 0x8000000235A6CB20);
    swift_bridgeObjectRelease();
    sub_235A3CE2C(0, a1, a2, (uint64_t)a6, a7, a8, a9);
  }
  else
  {
    swift_bridgeObjectRetain();
    long long v17 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = a6;
    v18[3] = a7;
    v18[4] = a8;
    v18[5] = a9;
    v21[4] = sub_235A3E248;
    v21[5] = v18;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 1107296256;
    v21[2] = sub_235A3DB50;
    v21[3] = &block_descriptor_30_0;
    uint64_t v19 = _Block_copy(v21);
    id v20 = a6;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(a10, sel_getSharedUserIdForiCloudAltDSID_completion_, v17, v19);
    _Block_release(v19);
  }
}

uint64_t sub_235A3DB50(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_235A68B00();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a2;
  v4(a2, v5, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235A3DBE8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_235A68B00();
    uint64_t v9 = v8;
    if (v5)
    {
LABEL_3:
      uint64_t v10 = sub_235A68B00();
      uint64_t v5 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  swift_retain();
  id v12 = a4;
  v6(v7, v9, v10, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235A3DCB8(uint64_t a1, void *a2, uint64_t (*a3)(void *))
{
  if (a2)
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v5 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D5E8);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_235A68920();
    __swift_project_value_buffer(v6, (uint64_t)qword_26882DE48);
    os_log_type_t v7 = sub_235A68C30();
    sub_235A65720(v7, 0xD00000000000001DLL, 0x8000000235A6C9E0, 0xD000000000000027, 0x8000000235A6CA00);
    swift_bridgeObjectRelease();
    return a3((void *)MEMORY[0x263F8EE78]);
  }
  if (!a1 || !*(void *)(a1 + 16)) {
    return a3((void *)MEMORY[0x263F8EE78]);
  }
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_235A3DF50(v9);
  swift_bridgeObjectRelease();
  a3(v10);

  return swift_release();
}

uint64_t sub_235A3DE68()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235A3DEA0(uint64_t a1, void *a2)
{
  return sub_235A3DCB8(a1, a2, *(uint64_t (**)(void *))(v2 + 16));
}

uint64_t sub_235A3DEA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D5E0);
    uint64_t v4 = sub_235A68AD0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_235A3DF50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_235A3E038((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_235A3E238();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_235A3E038(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    unint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_235A3E238()
{
  return swift_release();
}

uint64_t objectdestroy_5Tm()
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_235A3E2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_235A3D8E8(a1, a2, a3, a4, a5, *(void **)(v5 + 16), *(void *)(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40), *(void **)(v5 + 48));
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_235A3E32C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_235A3CE2C(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_235A3E338()
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_235A3E388()
{
  return sub_235A3D088(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_235A3E398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_235A3E400(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id LocalDataSourceWriter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t sub_235A3E4D4()
{
  uint64_t v1 = v0;
  strcpy((char *)v16, "Data Writer ");
  BYTE5(v16[1]) = 0;
  HIWORD(v16[1]) = -5120;
  swift_bridgeObjectRetain();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled))
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v2 = (id)AFBooleanGetName();
    if (v2)
    {
      uint64_t v3 = v2;
      sub_235A68B00();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8))
  {
    swift_bridgeObjectRetain();
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
  if (v4)
  {
    id v5 = v4;
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v5, sel_description);
    sub_235A68B00();

    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();

    swift_bridgeObjectRelease();
  }
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus + 8) & 1) == 0)
  {
    sub_235A68DE0();
    sub_235A68B30();
    type metadata accessor for AFSiriDataSharingOptInStatus(0);
    sub_235A68E20();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled))
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v7 = (id)AFBooleanGetName();
    if (v7)
    {
      uint64_t v8 = v7;
      sub_235A68B00();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_recognizeMyVoiceEnabled))
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v9 = (id)AFBooleanGetName();
    if (v9)
    {
      uint64_t v10 = v9;
      sub_235A68B00();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled))
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v11 = (id)AFBooleanGetName();
    if (v11)
    {
      int64_t v12 = v11;
      sub_235A68B00();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed))
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    id v13 = (id)AFBooleanGetName();
    if (v13)
    {
      int64_t v14 = v13;
      sub_235A68B00();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
  }
  return v16[0];
}

uint64_t sub_235A3EB00(uint64_t a1)
{
  uint64_t v3 = (unsigned char *)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled);
  swift_beginAccess();
  if (*v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled) = v4;
  id v5 = (void *)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage);
  swift_beginAccess();
  uint64_t v6 = v5[1];
  id v7 = (void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage);
  void *v7 = *v5;
  v7[1] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void **)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  id v9 = *v8;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice) = v9;
  id v11 = v9;

  int64_t v12 = (unsigned char *)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled);
  swift_beginAccess();
  if (*v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_recognizeMyVoiceEnabled) = v13;
  int64_t v14 = (unsigned char *)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled);
  swift_beginAccess();
  if (*v14) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled) = v15;
  unint64_t v16 = (unsigned char *)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled);
  swift_beginAccess();
  if (*v16) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 1;
  }
  *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled) = v17;
  unint64_t v18 = (void *)(a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus);
  uint64_t result = swift_beginAccess();
  uint64_t v20 = v1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
  *(void *)uint64_t v20 = *v18;
  *(unsigned char *)(v20 + 8) = 0;
  return result;
}

id LocalDataSourceWriter.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_recognizeMyVoiceEnabled] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled] = 0;
  id v2 = &v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus];
  *(void *)id v2 = 0;
  v2[8] = 1;
  *(void *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed] = 0;
  uint64_t v3 = (uint64_t *)&v0[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_id];
  id v4 = objc_allocWithZone(MEMORY[0x263F08C38]);
  id v5 = v0;
  id v6 = objc_msgSend(v4, sel_init);
  id v7 = objc_msgSend(v6, sel_UUIDString);

  uint64_t v8 = sub_235A68B00();
  uint64_t v10 = v9;

  uint64_t *v3 = v8;
  v3[1] = v10;

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for LocalDataSourceWriter();
  return objc_msgSendSuper2(&v12, sel_init);
}

id LocalDataSourceWriter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalDataSourceWriter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocalDataSourceWriter()
{
  return self;
}

uint64_t method lookup function for LocalDataSourceWriter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalDataSourceWriter);
}

unsigned char *sub_235A3EF08(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void (*v20)(_OWORD *__return_ptr, uint64_t, uint64_t);
  unsigned char *v21;
  long long *v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  char *v53;
  char *v54;
  char *v55;
  char **v56;
  void *v57;
  id v59;
  _OWORD v60[12];
  objc_super v61;
  _OWORD v62[12];
  _OWORD v63[12];
  _OWORD v64[13];

  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_optInRadioButtonSelection] = 0;
  id v11 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  objc_super v12 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSource];
  *(void *)objc_super v12 = a1;
  *((void *)v12 + 1) = a2;
  uint64_t v13 = &v5[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter];
  *(void *)uint64_t v13 = a3;
  *((void *)v13 + 1) = a4;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 64);
  unint64_t v16 = v5;
  id v17 = a1;
  long long v59 = a3;
  v16[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle] = v15(ObjectType, a2);
  unint64_t v18 = &v16[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel];
  *(void *)unint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0xD00000000000001ALL;
  *((void *)v18 + 3) = 0x8000000235A6CE40;
  *((void *)v18 + 16) = 0;
  *((_OWORD *)v18 + 6) = 0u;
  *((_OWORD *)v18 + 7) = 0u;
  *((_OWORD *)v18 + 4) = 0u;
  *((_OWORD *)v18 + 5) = 0u;
  *((_OWORD *)v18 + 2) = 0u;
  *((_OWORD *)v18 + 3) = 0u;
  v18[136] = 2;
  *((_WORD *)v18 + 84) = 0;
  *((void *)v18 + 18) = 0;
  *((void *)v18 + 19) = 0;
  *((void *)v18 + 20) = 0;
  *((void *)v18 + 22) = 0;
  *((void *)v18 + 23) = 0;
  *(void *)&v16[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_page] = a5;
  swift_retain();

  v61.receiver = v16;
  v61.super_class = (Class)type metadata accessor for DataSharingPresenter();
  id v19 = objc_msgSendSuper2(&v61, sel_init);
  uint64_t v20 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(a2 + 24);
  uint64_t v21 = v19;
  v20(v64, ObjectType, a2);
  sub_235A3F218((uint64_t)v62);
  os_log_type_t v22 = (long long *)&v21[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel];
  swift_beginAccess();
  id v23 = *v22;
  uint64_t v24 = v22[1];
  id v25 = v22[3];
  v63[2] = v22[2];
  v63[3] = v25;
  v63[0] = v23;
  v63[1] = v24;
  id v26 = v22[4];
  uint64_t v27 = v22[5];
  uint64_t v28 = v22[7];
  v63[6] = v22[6];
  v63[7] = v28;
  v63[4] = v26;
  v63[5] = v27;
  uint64_t v29 = v22[8];
  uint64_t v30 = v22[9];
  unint64_t v31 = v22[11];
  v63[10] = v22[10];
  v63[11] = v31;
  v63[8] = v29;
  v63[9] = v30;
  uint64_t v32 = v62[9];
  v22[8] = v62[8];
  v22[9] = v32;
  id v33 = v62[11];
  v22[10] = v62[10];
  v22[11] = v33;
  uint64_t v34 = v62[5];
  v22[4] = v62[4];
  v22[5] = v34;
  uint64_t v35 = v62[7];
  v22[6] = v62[6];
  v22[7] = v35;
  uint64_t v36 = v62[1];
  *os_log_type_t v22 = v62[0];
  v22[1] = v36;
  id v37 = v62[3];
  _OWORD v22[2] = v62[2];
  v22[3] = v37;
  sub_235A346CC((uint64_t)v63);
  uint64_t v38 = v22[3];
  uint64_t v40 = *v22;
  long long v39 = v22[1];
  LOBYTE(a5) = v21[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle];
  v64[2] = v22[2];
  v64[3] = v38;
  v64[0] = v40;
  v64[1] = v39;
  uint64_t v41 = v22[7];
  uint64_t v43 = v22[4];
  id v42 = v22[5];
  v64[6] = v22[6];
  v64[7] = v41;
  v64[4] = v43;
  v64[5] = v42;
  uint64_t v44 = v22[11];
  uint64_t v46 = v22[8];
  uint64_t v45 = v22[9];
  v64[10] = v22[10];
  v64[11] = v44;
  v64[8] = v46;
  v64[9] = v45;
  id v47 = v22[9];
  v60[8] = v22[8];
  v60[9] = v47;
  uint64_t v48 = v22[11];
  v60[10] = v22[10];
  v60[11] = v48;
  uint64_t v49 = v22[5];
  v60[4] = v22[4];
  v60[5] = v49;
  uint64_t v50 = v22[7];
  v60[6] = v22[6];
  v60[7] = v50;
  uint64_t v51 = v22[1];
  v60[0] = *v22;
  v60[1] = v51;
  uint64_t v52 = v22[3];
  v60[2] = v22[2];
  v60[3] = v52;
  sub_235A3557C((uint64_t)v64);
  uint64_t v53 = sub_235A3FC98(a5, v60);
  long long v55 = v54;

  swift_release();
  sub_235A346CC((uint64_t)v64);
  uint64_t v56 = (char **)&v21[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController];
  long long v57 = *(void **)&v21[OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController];
  *uint64_t v56 = v53;
  v56[1] = v55;

  return v21;
}

uint64_t sub_235A3F218@<X0>(uint64_t a1@<X8>)
{
  if (qword_26882D0F0 != -1) {
    swift_once();
  }
  char v2 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000012, 0x8000000235A6CE60, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v2);
  sub_235A35654();
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v2);
  uint64_t v26 = sub_235A68D90();
  uint64_t v27 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v4 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000026, 0x8000000235A6CE80, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v4);
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v4);
  uint64_t v24 = sub_235A68D90();
  uint64_t v25 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v6 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000022, 0x8000000235A6CEB0, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v6);
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v6);
  uint64_t v22 = sub_235A68D90();
  uint64_t v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v8 = byte_26882EE38;
  sub_235A4F2CC(0xD00000000000001ELL, 0x8000000235A6CEE0, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v8);
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v8);
  uint64_t v32 = sub_235A68D90();
  uint64_t v33 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v10 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000018, 0x8000000235A6CF00, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v10);
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v10);
  uint64_t v30 = sub_235A68D90();
  uint64_t v31 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v12 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000021, 0x8000000235A6CF20, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v12);
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v12);
  uint64_t v28 = sub_235A68D90();
  uint64_t v29 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v14 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000013, 0x8000000235A6CF50, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v14);
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v34 = sub_235A643F8(v14);
  uint64_t v15 = sub_235A68D90();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_235A6A830;
  *(void *)(v18 + 32) = v24;
  *(void *)(v18 + 40) = v25;
  sub_235A68DE0();
  sub_235A68B30();
  sub_235A68E20();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_235A68920();
  __swift_project_value_buffer(v19, (uint64_t)qword_26882DE48);
  os_log_type_t v20 = sub_235A68C40();
  sub_235A65720(v20, 0xD00000000000002BLL, 0x8000000235A6CF70, 0, 0xE000000000000000);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v26;
  *(void *)(a1 + 24) = v27;
  *(void *)(a1 + 32) = v15;
  *(void *)(a1 + 40) = v17;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v28;
  *(void *)(a1 + 64) = v29;
  *(void *)(a1 + 72) = v30;
  *(void *)(a1 + 80) = v31;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = v22;
  *(void *)(a1 + 112) = v23;
  *(void *)(a1 + 120) = v32;
  *(void *)(a1 + 128) = v33;
  *(unsigned char *)(a1 + 136) = 2;
  *(_DWORD *)(a1 + 137) = v34;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)((char *)&v34 + 3);
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 144) = 0;
  *(_WORD *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 170) = v35;
  *(_WORD *)(a1 + 174) = v36;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = 0;
  return result;
}

char *sub_235A3FC98(char a1, _OWORD *a2)
{
  long long v2 = a2[9];
  v39[8] = a2[8];
  v39[9] = v2;
  long long v3 = a2[11];
  v39[10] = a2[10];
  v39[11] = v3;
  long long v4 = a2[5];
  v39[4] = a2[4];
  v39[5] = v4;
  long long v5 = a2[7];
  v39[6] = a2[6];
  v39[7] = v5;
  long long v6 = a2[1];
  v39[0] = *a2;
  v39[1] = v6;
  long long v7 = a2[3];
  v39[2] = a2[2];
  v39[3] = v7;
  if (a1)
  {
    if (a1 == 1)
    {
      *(void *)&long long v26 = 0;
      *((void *)&v26 + 1) = 0xE000000000000000;
      sub_235A68DE0();
      sub_235A68B30();
      char v38 = 1;
      sub_235A68E20();
      sub_235A68B30();
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_235A68920();
      __swift_project_value_buffer(v8, (uint64_t)qword_26882DE48);
      os_log_type_t v9 = sub_235A68C30();
      sub_235A65720(v9, 0xD000000000000030, 0x8000000235A6BEA0, v26, *((unint64_t *)&v26 + 1));
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      long long v18 = a2[9];
      long long v34 = a2[8];
      long long v35 = v18;
      long long v19 = a2[11];
      long long v36 = a2[10];
      long long v37 = v19;
      long long v20 = a2[5];
      long long v30 = a2[4];
      long long v31 = v20;
      long long v21 = a2[7];
      long long v32 = a2[6];
      long long v33 = v21;
      long long v22 = a2[1];
      long long v26 = *a2;
      long long v27 = v22;
      long long v23 = a2[3];
      long long v28 = a2[2];
      long long v29 = v23;
      id v24 = objc_allocWithZone((Class)type metadata accessor for DataSharingProxCardController());
      sub_235A3557C((uint64_t)v39);
      char v10 = (char *)sub_235A64680(&v26);
      *(void *)&v10[OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_delegate + 8] = &off_26E8ECA98;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    long long v11 = a2[9];
    long long v34 = a2[8];
    long long v35 = v11;
    long long v12 = a2[11];
    long long v36 = a2[10];
    long long v37 = v12;
    long long v13 = a2[5];
    long long v30 = a2[4];
    long long v31 = v13;
    long long v14 = a2[7];
    long long v32 = a2[6];
    long long v33 = v14;
    long long v15 = a2[1];
    long long v26 = *a2;
    long long v27 = v15;
    long long v16 = a2[3];
    long long v28 = a2[2];
    long long v29 = v16;
    id v17 = objc_allocWithZone((Class)type metadata accessor for DataSharingWelcomeController());
    sub_235A3557C((uint64_t)v39);
    char v10 = (char *)sub_235A46978(&v26);
    *(void *)&v10[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate + 8] = &off_26E8ECA98;
    swift_unknownObjectWeakAssign();
  }
  return v10;
}

id sub_235A3FF4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSharingPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSharingPresenter()
{
  return self;
}

uint64_t sub_235A40060@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

uint64_t sub_235A40124(_OWORD *a1)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v6 = v3[11];
  v18[9] = v3[9];
  v18[10] = v5;
  v18[11] = v6;
  long long v7 = v3[5];
  v18[4] = v3[4];
  v18[5] = v7;
  long long v8 = v3[7];
  v18[6] = v3[6];
  v18[7] = v8;
  v18[8] = v4;
  long long v9 = v3[1];
  v18[0] = *v3;
  v18[1] = v9;
  long long v10 = v3[3];
  v18[2] = v3[2];
  v18[3] = v10;
  long long v11 = a1[9];
  v3[8] = a1[8];
  v3[9] = v11;
  long long v12 = a1[11];
  v3[10] = a1[10];
  v3[11] = v12;
  long long v13 = a1[5];
  v3[4] = a1[4];
  v3[5] = v13;
  long long v14 = a1[7];
  v3[6] = a1[6];
  v3[7] = v14;
  long long v15 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v15;
  long long v16 = a1[3];
  v3[2] = a1[2];
  v3[3] = v16;
  return sub_235A346CC((uint64_t)v18);
}

uint64_t (*sub_235A401E4())()
{
  return j__swift_endAccess;
}

void *sub_235A40240()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_presentingViewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A40278()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235A68920();
  __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
  os_log_type_t v2 = sub_235A68C40();
  sub_235A65720(v2, 0xD000000000000015, 0x8000000235A6CD80, 0xD000000000000015, 0x8000000235A6CDA0);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle) == 1) {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_optInRadioButtonSelection);
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter)
     + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
  *(void *)uint64_t v4 = v3;
  *(unsigned char *)(v4 + 8) = 0;
  uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
  if (result)
  {
    uint64_t v6 = swift_retain();
    sub_235A36DAC(v6);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_235A403BC()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235A68920();
  __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
  os_log_type_t v2 = sub_235A68C40();
  sub_235A65720(v2, 0xD000000000000017, 0x8000000235A6CD40, 0xD000000000000017, 0x8000000235A6CD60);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_viewStyle) == 1)
  {
    uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
    if (!result) {
      return result;
    }
    swift_retain();
    sub_235A38788();
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter)
       + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
    *(void *)uint64_t v4 = 2;
    *(unsigned char *)(v4 + 8) = 0;
    uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
    if (!result) {
      return result;
    }
    uint64_t v5 = swift_retain();
    sub_235A36DAC(v5);
  }
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_235A40524()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235A68920();
  __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
  os_log_type_t v2 = sub_235A68C40();
  sub_235A65720(v2, 0xD000000000000015, 0x8000000235A6BD70, 0xD000000000000015, 0x8000000235A6CE00);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_dataSourceWriter)
     + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus;
  *(void *)uint64_t v3 = 3;
  *(unsigned char *)(v3 + 8) = 0;
  uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup20DataSharingPresenter_delegate);
  if (result)
  {
    uint64_t v5 = swift_retain();
    sub_235A370C8(v5);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

char *sub_235A40644(char a1)
{
  v1[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified] = 0;
  id v3 = objc_allocWithZone((Class)type metadata accessor for OrbContainerView());
  uint64_t v4 = v1;
  *(void *)&v4[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView] = sub_235A3A424(0);
  v4[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbOverTitle] = a1;

  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for SiriSetupProxCardView();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v6 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView;
  uint64_t v7 = *(void *)&v5[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  long long v8 = v5;
  objc_msgSend(v8, sel_addSubview_, v7);
  long long v9 = *(void **)&v5[v6];
  long long v10 = v8;
  objc_msgSend(v9, sel_intrinsicContentSize);
  double v12 = v11;
  objc_msgSend(v10, sel_layoutMargins);
  if (a1) {
    double v14 = v12;
  }
  else {
    double v14 = -0.0;
  }
  objc_msgSend(v10, sel_setLayoutMargins_, v13 + v14);

  return v10;
}

void sub_235A407FC()
{
  uint64_t v1 = v0;
  v30.receiver = v0;
  v30.super_class = (Class)type metadata accessor for SiriSetupProxCardView();
  objc_msgSendSuper2(&v30, sel_updateConstraints);
  uint64_t v2 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified;
  if ((v0[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified] & 1) == 0)
  {
    if (v0[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbOverTitle] == 1)
    {
      id v3 = self;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26882D2F0);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_235A6ACC0;
      uint64_t v5 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView;
      id v6 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView], sel_topAnchor);
      id v7 = objc_msgSend(v1, sel_topAnchor);
      id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

      *(void *)(v4 + 32) = v8;
      id v9 = objc_msgSend(*(id *)&v1[v5], sel_centerXAnchor);
      id v10 = objc_msgSend(v1, sel_centerXAnchor);
      id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

      *(void *)(v4 + 40) = v11;
      id v12 = objc_msgSend(*(id *)&v1[v5], sel_heightAnchor);
      objc_msgSend(*(id *)&v1[v5], sel_intrinsicContentSize);
      id v14 = objc_msgSend(v12, sel_constraintEqualToConstant_, v13);

      *(void *)(v4 + 48) = v14;
      sub_235A68B90();
      sub_235A40CF0();
      long long v15 = (void *)sub_235A68B60();
      swift_bridgeObjectRelease();
      objc_msgSend(v3, sel_activateConstraints_, v15);
    }
    else
    {
      id v16 = objc_msgSend(v0, sel_titleView);
      if (!v16)
      {
LABEL_7:
        v1[v2] = 1;
        return;
      }
      long long v17 = v16;
      long long v18 = self;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26882D2F0);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_235A6ACC0;
      uint64_t v20 = OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView;
      id v21 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView], sel_topAnchor);
      id v22 = objc_msgSend(v17, sel_bottomAnchor);
      id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

      *(void *)(v19 + 32) = v23;
      id v24 = objc_msgSend(*(id *)&v1[v20], sel_centerXAnchor);
      id v25 = objc_msgSend(v1, sel_centerXAnchor);
      id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

      *(void *)(v19 + 40) = v26;
      id v27 = objc_msgSend(*(id *)&v1[v20], sel_heightAnchor);
      objc_msgSend(*(id *)&v1[v20], sel_intrinsicContentSize);
      id v29 = objc_msgSend(v27, sel_constraintEqualToConstant_, v28);

      *(void *)(v19 + 48) = v29;
      sub_235A68B90();
      sub_235A40CF0();
      long long v15 = (void *)sub_235A68B60();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_activateConstraints_, v15);
    }
    goto LABEL_7;
  }
}

id sub_235A40C88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSetupProxCardView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SiriSetupProxCardView()
{
  return self;
}

unint64_t sub_235A40CF0()
{
  unint64_t result = qword_26882D2F8;
  if (!qword_26882D2F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26882D2F8);
  }
  return result;
}

void sub_235A40D30()
{
  qword_26882D6B0 = 0x404F000000000000;
}

void sub_235A40D40()
{
  qword_26882D6B8 = 0x72616D6B63656863;
  unk_26882D6C0 = 0xE90000000000006BLL;
}

void sub_235A40D68()
{
  qword_26882D6C8 = 0x4045000000000000;
}

void sub_235A40D78()
{
  qword_26882D6D0 = 0x4040800000000000;
}

void sub_235A40DE4(char a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    id v6 = sub_235A41418();
  }
  else {
    id v6 = sub_235A416FC();
  }
  id v7 = v6;
  objc_msgSend(v3, sel_bounds);
  double v9 = v8;
  objc_msgSend(v7, sel_bounds);
  CGFloat v11 = v9 / v10;
  objc_msgSend(v3, sel_bounds);
  double v13 = v12;
  objc_msgSend(v7, sel_bounds);
  CGAffineTransformMakeScale(&v33, v11, v13 / v14);
  objc_msgSend(v7, sel_setAffineTransform_, &v33);
  id v15 = sub_235A41308();
  objc_msgSend(v3, sel_bounds);
  double v17 = v16;
  id v18 = sub_235A41308();
  objc_msgSend(v18, sel_bounds);
  double v20 = v19;

  CGFloat v21 = v17 / v20;
  objc_msgSend(v3, sel_bounds);
  double v23 = v22;
  id v24 = sub_235A41308();
  objc_msgSend(v24, sel_bounds);
  double v26 = v25;

  CGAffineTransformMakeScale(&v33, v21, v23 / v26);
  objc_msgSend(v15, sel_setAffineTransform_, &v33);

  id v27 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v27, sel_setMask_, v7);

  objc_msgSend(v3, sel_setAlpha_, 1.0);
  objc_msgSend(v3, sel_setHidden_, 0);
  double v28 = self;
  objc_msgSend(v28, sel_begin);
  objc_msgSend(v28, sel_setAnimationDuration_, 0.666666667);
  objc_msgSend(v28, sel_disableActions);
  id v29 = (void *)swift_allocObject();
  v29[2] = v3;
  v29[3] = a2;
  v29[4] = a3;
  *(void *)&v33.tx = sub_235A41A5C;
  *(void *)&v33.ty = v29;
  *(void *)&v33.a = MEMORY[0x263EF8330];
  *(void *)&v33.b = 1107296256;
  *(void *)&v33.c = sub_235A3667C;
  *(void *)&v33.d = &block_descriptor_3;
  objc_super v30 = _Block_copy(&v33);
  id v31 = v3;
  swift_retain();
  swift_release();
  objc_msgSend(v28, sel_setCompletionBlock_, v30);
  _Block_release(v30);
  id v32 = sub_235A41308();
  objc_msgSend(v32, sel_setPhase_, 1.0);

  objc_msgSend(v28, sel_commit);
}

void sub_235A410D8(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  double v17 = sub_235A41AB8;
  id v18 = (void *)v7;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  id v15 = sub_235A3667C;
  double v16 = &block_descriptor_14;
  double v8 = _Block_copy(&v13);
  id v9 = a1;
  swift_release();
  double v10 = (void *)swift_allocObject();
  void v10[2] = v9;
  v10[3] = a2;
  v10[4] = a3;
  double v17 = sub_235A41B10;
  id v18 = v10;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  id v15 = sub_235A484A8;
  double v16 = &block_descriptor_20;
  CGFloat v11 = _Block_copy(&v13);
  id v12 = v9;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_animateWithDuration_animations_completion_, v8, v11, 0.333333333);
  _Block_release(v11);
  _Block_release(v8);
}

void sub_235A41284(int a1, id a2, void (*a3)(id))
{
  a3(objc_msgSend(a2, sel_setHidden_, 1));
  id v3 = sub_235A41308();
  objc_msgSend(v3, sel_setPhase_, 0.0);
}

id sub_235A41308()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer;
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer];
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ColorLayer()), sel_init);
    objc_msgSend(v4, sel_setBounds_, 0.0, 0.0, 400.0, 400.0);
    objc_msgSend(v0, sel_bounds);
    double MidX = CGRectGetMidX(v10);
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v4, sel_setPosition_, MidX, CGRectGetMidY(v11));
    id v6 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v6, sel_addSublayer_, v4);

    uint64_t v7 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v3 = v4;

    objc_super v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_235A41418()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F157E8]), sel_init);
    if (qword_26882D0C0 != -1) {
      swift_once();
    }
    double v5 = *(double *)&qword_26882D6C8;
    if (qword_26882D0C8 != -1) {
      swift_once();
    }
    double v6 = *(double *)&qword_26882D6D0;
    if (qword_26882D0B8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(self, sel_systemImageNamed_, v7);

    if (v8)
    {
      uint64_t v9 = qword_26882D0B0;
      id v10 = v8;
      if (v9 != -1) {
        swift_once();
      }
      id v11 = objc_msgSend(self, sel_configurationWithPointSize_weight_, 7, *(double *)&qword_26882D6B0);
      id v12 = objc_msgSend(v10, sel_imageWithConfiguration_, v11);

      id v13 = v12;
      objc_msgSend(v13, sel_size);
      double v5 = v14;
      double v6 = v15;
      id v16 = objc_msgSend(v13, sel_CGImage);

      objc_msgSend(v4, sel_setContents_, v16);
    }
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v5;
    v22.size.height = v6;
    double MidX = CGRectGetMidX(v22);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v5;
    v23.size.height = v6;
    double MidY = CGRectGetMidY(v23);
    objc_msgSend(v4, sel_setBounds_, 0.0, 0.0, v5, v6);
    objc_msgSend(v4, sel_setPosition_, MidX, MidY);
    double v19 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    objc_super v2 = 0;
  }
  id v20 = v2;
  return v3;
}

id sub_235A416FC()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15880]), sel_init);
    objc_msgSend(v5, sel_setBounds_, 0.0, 0.0, 400.0, 400.0);
    objc_msgSend(v5, sel_setAnchorPoint_, 0.0, 0.0);
    CGMutablePathRef Mutable = CGPathCreateMutable();
    sub_235A68C60();
    sub_235A68C70();
    sub_235A68C60();
    sub_235A68C70();
    objc_msgSend(v5, sel_setPath_, Mutable, 0x3FF0000000000000, 0, 0, 0x3FF0000000000000, 0, 0);
    objc_msgSend(v5, sel_setFillColor_, 0);
    CGColorRef GenericRGB = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v5, sel_setStrokeColor_, GenericRGB);

    objc_msgSend(v5, sel_setLineWidth_, 36.0);
    id v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    objc_super v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_235A419A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CheckMarkView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CheckMarkView()
{
  return self;
}

void sub_235A41A5C()
{
  sub_235A410D8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_235A41A80()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_235A41AB8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 0.0);
}

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_235A41B10(int a1)
{
  sub_235A41284(a1, *(id *)(v1 + 16), *(void (**)(id))(v1 + 24));
}

id sub_235A41B2C(long long *a1)
{
  uint64_t v2 = v1;
  long long v3 = a1[9];
  long long v43 = a1[8];
  long long v44 = v3;
  long long v4 = a1[11];
  long long v45 = a1[10];
  long long v46 = v4;
  long long v5 = a1[5];
  long long v39 = a1[4];
  long long v40 = v5;
  long long v6 = a1[7];
  long long v41 = a1[6];
  long long v42 = v6;
  long long v7 = a1[1];
  long long v35 = *a1;
  long long v36 = v7;
  long long v8 = a1[3];
  long long v37 = a1[2];
  long long v38 = v8;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView] = 0;
  id v10 = objc_allocWithZone((Class)type metadata accessor for SiriSetupProxCardView());
  id v11 = v1;
  id v12 = sub_235A40644(1);
  id v13 = *(void **)&v12[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  double v14 = *(void **)&v1[v9];
  *(void *)&v2[v9] = v13;
  id v15 = v13;

  id v16 = &v11[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel];
  *((void *)v16 + 3) = &type metadata for ViewModel;
  *((void *)v16 + 4) = &off_26E8ECE80;
  double v17 = (_OWORD *)swift_allocObject();
  *(void *)id v16 = v17;
  long long v18 = v36;
  v17[1] = v35;
  v17[2] = v18;
  long long v19 = v38;
  v17[3] = v37;
  v17[4] = v19;
  long long v20 = v40;
  v17[5] = v39;
  v17[6] = v20;
  long long v21 = v42;
  v17[7] = v41;
  v17[8] = v21;
  long long v22 = v44;
  v17[9] = v43;
  v17[10] = v22;
  long long v23 = v46;
  v17[11] = v45;
  v17[12] = v23;
  sub_235A3557C((uint64_t)&v35);

  v34.receiver = v11;
  v34.super_class = (Class)type metadata accessor for VoiceTrainingProxController();
  id v24 = objc_msgSendSuper2(&v34, sel_initWithContentView_, v12);
  double v25 = (void *)sub_235A68AF0();
  objc_msgSend(v24, sel_setTitle_, v25);

  if ((void)v41)
  {
    id v26 = v24;
    swift_bridgeObjectRetain();
    id v27 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v28 = v24;
    id v27 = 0;
  }
  objc_msgSend(v24, sel_setBottomTrayTitle_, v27);

  if (*((void *)&v37 + 1))
  {
    id v29 = v24;
    swift_bridgeObjectRetain();
    objc_super v30 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v31 = v24;
    objc_super v30 = 0;
  }
  objc_msgSend(v24, sel_setSubtitle_, v30);

  objc_msgSend(v24, sel_setDismissalType_, 1);
  v33[8] = v43;
  v33[9] = v44;
  v33[10] = v45;
  v33[11] = v46;
  v33[4] = v39;
  v33[5] = v40;
  v33[6] = v41;
  v33[7] = v42;
  v33[0] = v35;
  v33[1] = v36;
  v33[2] = v37;
  v33[3] = v38;
  sub_235A41F90((uint64_t)v33);

  sub_235A346CC((uint64_t)&v35);
  return v24;
}

uint64_t sub_235A41DD8(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D708);
  MEMORY[0x270FA5388](v3 - 8);
  long long v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = (objc_class *)type metadata accessor for VoiceTrainingProxController();
  v14.receiver = v1;
  v14.super_class = v6;
  objc_msgSendSuper2(&v14, sel_viewDidAppear_, a1 & 1);
  uint64_t result = MEMORY[0x237DECD00](&v1[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate]);
  if (result)
  {
    long long v8 = (void *)result;
    uint64_t v9 = sub_235A68C10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
    sub_235A68BF0();
    id v10 = v8;
    uint64_t v11 = sub_235A68BE0();
    id v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x263F8F500];
    v12[2] = v11;
    v12[3] = v13;
    v12[4] = v10;
    sub_235A547EC((uint64_t)v5, (uint64_t)&unk_26882D710, (uint64_t)v12);
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

void sub_235A41F90(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v1;
    swift_bridgeObjectRetain();
    id v3 = v1;
    uint64_t v4 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    double v17 = sub_235A42D98;
    uint64_t v18 = v2;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 1107296256;
    id v15 = sub_235A6046C;
    id v16 = &block_descriptor_22;
    long long v5 = _Block_copy(&v13);
    id v6 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v4, 1, v5);

    _Block_release(v5);
    swift_release();
    id v7 = objc_msgSend(v3, sel_addAction_, v6);
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  id v9 = v1;
  id v10 = (void *)sub_235A68AF0();
  double v17 = sub_235A42D78;
  uint64_t v18 = v8;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  id v15 = sub_235A6046C;
  id v16 = &block_descriptor_4;
  uint64_t v11 = _Block_copy(&v13);
  id v12 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v10, 0, v11);

  _Block_release(v11);
  swift_release();
  objc_msgSend(v9, sel_setDismissButtonAction_, v12);
}

uint64_t sub_235A421D4(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x237DECD00](a2 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate);
  if (result)
  {
    sub_235A57E4C();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_235A4222C(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x237DECD00](a2 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate);
  if (result)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(result + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState)) {
      sub_235A5552C();
    }
    if (MEMORY[0x237DECD00](v3 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate))
    {
      uint64_t v4 = swift_retain();
      sub_235A370C8(v4);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_235A422F0(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (uint64_t)v2 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel;
  swift_beginAccess();
  sub_235A38180(v6, (uint64_t)&v46);
  uint64_t v7 = v47;
  uint64_t v8 = v48;
  __swift_project_boxed_opaque_existential_1(&v46, v47);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8);
  uint64_t v11 = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v12);
  if (v9 == (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 32))(v12, v13) && v11 == v14)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = sub_235A68F50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      *(void *)&long long v46 = 0;
      *((void *)&v46 + 1) = 0xE000000000000000;
      sub_235A68DE0();
      swift_bridgeObjectRelease();
      *(void *)&long long v46 = 0xD000000000000013;
      *((void *)&v46 + 1) = 0x8000000235A6D180;
      uint64_t v17 = a1[3];
      uint64_t v18 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
      sub_235A68B30();
      swift_bridgeObjectRelease();
      long long v19 = v46;
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_235A68920();
      __swift_project_value_buffer(v20, (uint64_t)qword_26882DE48);
      os_log_type_t v21 = sub_235A68C40();
      sub_235A65720(v21, 0xD000000000000013, 0x8000000235A6D160, v19, *((unint64_t *)&v19 + 1));
      swift_bridgeObjectRelease();
      uint64_t v22 = a1[3];
      uint64_t v23 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v22);
      uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 32))(v22, v23);
      sub_235A42814(v24, v25, a2 & 1);
      swift_bridgeObjectRelease();
    }
  }
  sub_235A38180(v6, (uint64_t)&v46);
  uint64_t v26 = v47;
  uint64_t v27 = v48;
  __swift_project_boxed_opaque_existential_1(&v46, v47);
  uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 152))(v26, v27);
  uint64_t v30 = v29;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
  uint64_t v31 = a1[3];
  uint64_t v32 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v31);
  uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 152))(v31, v32);
  if (!v30)
  {
    if (!v34) {
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (!v34)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v28 == v33 && v30 == v34)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  char v45 = sub_235A68F50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v45) {
    goto LABEL_23;
  }
LABEL_17:
  *(void *)&long long v46 = 0;
  *((void *)&v46 + 1) = 0xE000000000000000;
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  *(void *)&long long v46 = 0xD00000000000001ELL;
  *((void *)&v46 + 1) = 0x8000000235A6D1A0;
  uint64_t v35 = a1[3];
  uint64_t v36 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v35);
  (*(void (**)(uint64_t, uint64_t))(v36 + 152))(v35, v36);
  sub_235A68B30();
  swift_bridgeObjectRelease();
  long long v37 = v46;
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_235A68920();
  __swift_project_value_buffer(v38, (uint64_t)qword_26882DE48);
  os_log_type_t v39 = sub_235A68C40();
  sub_235A65720(v39, 0xD000000000000013, 0x8000000235A6D160, v37, *((unint64_t *)&v37 + 1));
  swift_bridgeObjectRelease();
  uint64_t v40 = a1[3];
  uint64_t v41 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v40);
  (*(void (**)(uint64_t, uint64_t))(v41 + 152))(v40, v41);
  if (v42)
  {
    long long v43 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v43 = 0;
  }
  objc_msgSend(v3, sel_setBottomTrayTitle_, v43);

LABEL_23:
  sub_235A38180((uint64_t)a1, (uint64_t)&v46);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v6);
  sub_235A42D28(&v46, v6);
  return swift_endAccess();
}

void sub_235A42814(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (uint64_t)v3 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_viewModel;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v8 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 40);
  swift_bridgeObjectRetain();
  v11(a1, a2, v9, v10);
  swift_endAccess();
  uint64_t v12 = (void *)sub_235A68AF0();
  objc_msgSend(v4, sel_setTitle_, v12);

  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15910]), sel_init);
  uint64_t v14 = *MEMORY[0x263F15EB8];
  id v15 = self;
  id v16 = v13;
  id v17 = objc_msgSend(v15, sel_functionWithName_, v14);
  objc_msgSend(v16, sel_setTimingFunction_, v17);

  double v18 = 0.2;
  if ((a3 & 1) == 0) {
    double v18 = 0.0;
  }
  objc_msgSend(v16, sel_setDuration_, v18);
  objc_msgSend(v16, sel_setType_, *MEMORY[0x263F16008]);
  id v19 = objc_msgSend(v4, sel_view);
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = objc_msgSend(v19, sel_semanticContentAttribute);

    uint64_t v22 = (id *)MEMORY[0x263F15FE8];
    if (v21 != (id)4) {
      uint64_t v22 = (id *)MEMORY[0x263F15FF0];
    }
    id v23 = *v22;
    objc_msgSend(v16, sel_setSubtype_, v23);

    id v24 = objc_msgSend(v4, sel_contentView);
    id v25 = objc_msgSend(v24, sel_layer);

    objc_msgSend(v25, sel_removeAllAnimations);
    id v26 = objc_msgSend(v4, sel_contentView);
    id v27 = objc_msgSend(v26, sel_layer);

    objc_msgSend(v27, sel_addAnimation_forKey_, v16, *MEMORY[0x263F15FD0]);
  }
  else
  {
    __break(1u);
  }
}

id sub_235A42B00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTrainingProxController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceTrainingProxController()
{
  return self;
}

uint64_t sub_235A42BB4(void *a1, char a2)
{
  return sub_235A422F0(a1, a2);
}

id sub_235A42BD8()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView);
  if (v1) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_setMode_, 1);
  }
  return result;
}

id sub_235A42C0C()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView);
  if (v1) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_animateToOffWithCompletion_, 0);
  }
  return result;
}

void sub_235A42C40(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(char **)(*v3 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView);
  if (v4)
  {
    uint64_t v8 = *(void **)&v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark];
    uint64_t v9 = v4;
    id v10 = v8;
    sub_235A40DE4(a1 & 1, a2, a3);
  }
}

id sub_235A42CF8()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_orbView);
  if (v1) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_setPowerLevel_);
  }
  return result;
}

uint64_t sub_235A42D28(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_235A42D40()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A42D78(uint64_t a1)
{
  return sub_235A4222C(a1, *(void *)(v1 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_235A42D98(uint64_t a1)
{
  return sub_235A421D4(a1, *(void *)(v1 + 16));
}

uint64_t sub_235A42DA0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_235A42DE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_235A42E94;
  return sub_235A57F60(a1, v4, v5, v6);
}

uint64_t sub_235A42E94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A42F88()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_235A43024()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_235A43054(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t sub_235A4308C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_235A430BC()
{
  return *(unsigned __int8 *)(v0 + 136);
}

uint64_t sub_235A430C4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235A43138()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235A431AC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235A43220()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__prelude;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D7E0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__title;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D7E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__subtitle, v2);
  uint64_t v6 = v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__primaryButtonTexts;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D7F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__secondaryButtonText, v2);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__linkText, v2);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__navigationTitle, v2);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__continueButtonText, v2);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__backButtonText, v2);
  uint64_t v8 = v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__loading;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D7F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__bulletItems;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__disclaimerText, v2);
  uint64_t v12 = v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__configuration;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D808);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v3(v0 + OBJC_IVAR____TtC9SiriSetup19ObservableViewModel__languageCode, v2);
  return v0;
}

uint64_t sub_235A434E4()
{
  sub_235A43220();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_235A4353C()
{
  return type metadata accessor for ObservableViewModel();
}

uint64_t type metadata accessor for ObservableViewModel()
{
  uint64_t result = qword_26882D788;
  if (!qword_26882D788) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_235A43590()
{
  sub_235A437B0(319, &qword_26882D798, &qword_26882D930);
  if (v0 <= 0x3F)
  {
    sub_235A43800(319, &qword_26882D7A0);
    if (v1 <= 0x3F)
    {
      sub_235A437B0(319, &qword_26882D7A8, &qword_26882D7B0);
      if (v2 <= 0x3F)
      {
        sub_235A437B0(319, &qword_26882D7B8, &qword_26882D7C0);
        if (v3 <= 0x3F)
        {
          sub_235A437B0(319, &qword_26882D7C8, &qword_26882D7D0);
          if (v4 <= 0x3F)
          {
            sub_235A43800(319, &qword_26882D7D8);
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_235A437B0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_235A68A00();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_235A43800(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_235A68A00();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for BulletItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BulletItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BulletItem(void *a1, void *a2)
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

void *assignWithCopy for BulletItem(void *a1, void *a2)
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

void *assignWithTake for BulletItem(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for BulletItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BulletItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BulletItem()
{
  return &type metadata for BulletItem;
}

uint64_t destroy for ViewModel()
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
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ViewModel(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  uint64_t v11 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v11;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(_WORD *)(a1 + 168) = *(_WORD *)(a2 + 168);
  uint64_t v12 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v12;
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ViewModel(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(unsigned char *)(a1 + 169) = *(unsigned char *)(a2 + 169);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy192_8(uint64_t a1, long long *a2)
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
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 128) = result;
  *(_OWORD *)(a1 + 144) = v9;
  return result;
}

uint64_t assignWithTake for ViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(unsigned char *)(a1 + 169) = *(unsigned char *)(a2 + 169);
  uint64_t v12 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 192)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 184) = 0;
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
      *(unsigned char *)(result + 192) = 1;
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
    *(unsigned char *)(result + 192) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewModel()
{
  return &type metadata for ViewModel;
}

uint64_t sub_235A44018@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ObservableViewModel();
  uint64_t result = sub_235A689D0();
  *a1 = result;
  return result;
}

uint64_t sub_235A44058()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235A440D0()
{
  return sub_235A689F0();
}

uint64_t sub_235A44150()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235A441C8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235A44240()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_235A4424C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_235A442CC()
{
  return sub_235A689F0();
}

double sub_235A44350@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_235A443D0()
{
  return sub_235A689F0();
}

uint64_t sub_235A44454@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235A689E0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235A444D8()
{
  return sub_235A689F0();
}

char *sub_235A44564(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v11 = &v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController];
  *uint64_t v11 = 0;
  v11[1] = 0;
  v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_checkboxCheckedMac] = 1;
  uint64_t v12 = &v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSource];
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v13 = &v5[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSourceWriter];
  *uint64_t v13 = a3;
  v13[1] = a4;
  uint64_t ObjectType = swift_getObjectType();
  id v15 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 64);
  id v16 = v5;
  id v17 = a1;
  id v18 = a3;
  v16[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewStyle] = v15(ObjectType, a2);
  *(void *)&v16[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_page] = a5;
  id v19 = (objc_class *)type metadata accessor for IntroPresenter();
  swift_retain();
  sub_235A447DC(a2, (uint64_t)v52);
  uint64_t v20 = &v16[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel];
  long long v21 = v52[9];
  v20[8] = v52[8];
  v20[9] = v21;
  long long v22 = v52[11];
  v20[10] = v52[10];
  v20[11] = v22;
  long long v23 = v52[5];
  v20[4] = v52[4];
  v20[5] = v23;
  long long v24 = v52[7];
  v20[6] = v52[6];
  v20[7] = v24;
  long long v25 = v52[1];
  *uint64_t v20 = v52[0];
  v20[1] = v25;
  long long v26 = v52[3];
  v20[2] = v52[2];
  v20[3] = v26;

  v51.receiver = v16;
  v51.super_class = v19;
  id v27 = (char *)objc_msgSendSuper2(&v51, sel_init);
  LOBYTE(v19) = v15(ObjectType, a2);
  uint64_t v28 = &v27[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel];
  swift_beginAccess();
  long long v29 = *(_OWORD *)v28;
  long long v30 = *((_OWORD *)v28 + 1);
  long long v31 = *((_OWORD *)v28 + 3);
  void v53[2] = *((_OWORD *)v28 + 2);
  v53[3] = v31;
  v53[0] = v29;
  v53[1] = v30;
  long long v32 = *((_OWORD *)v28 + 4);
  long long v33 = *((_OWORD *)v28 + 5);
  long long v34 = *((_OWORD *)v28 + 7);
  v53[6] = *((_OWORD *)v28 + 6);
  v53[7] = v34;
  v53[4] = v32;
  v53[5] = v33;
  long long v35 = *((_OWORD *)v28 + 8);
  long long v36 = *((_OWORD *)v28 + 9);
  long long v37 = *((_OWORD *)v28 + 11);
  v53[10] = *((_OWORD *)v28 + 10);
  v53[11] = v37;
  v53[8] = v35;
  v53[9] = v36;
  long long v38 = *((_OWORD *)v28 + 9);
  v50[8] = *((_OWORD *)v28 + 8);
  v50[9] = v38;
  long long v39 = *((_OWORD *)v28 + 11);
  v50[10] = *((_OWORD *)v28 + 10);
  v50[11] = v39;
  long long v40 = *((_OWORD *)v28 + 5);
  v50[4] = *((_OWORD *)v28 + 4);
  v50[5] = v40;
  long long v41 = *((_OWORD *)v28 + 7);
  v50[6] = *((_OWORD *)v28 + 6);
  v50[7] = v41;
  long long v42 = *((_OWORD *)v28 + 1);
  v50[0] = *(_OWORD *)v28;
  v50[1] = v42;
  long long v43 = *((_OWORD *)v28 + 3);
  v50[2] = *((_OWORD *)v28 + 2);
  v50[3] = v43;
  sub_235A3557C((uint64_t)v53);
  long long v44 = sub_235A45AC8((char)v19, v50);
  long long v46 = v45;

  swift_release();
  sub_235A346CC((uint64_t)v53);
  uint64_t v47 = (char **)&v27[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController];
  uint64_t v48 = *(void **)&v27[OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController];
  *uint64_t v47 = v44;
  v47[1] = v46;

  return v27;
}

uint64_t sub_235A447DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  char v74 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 40))(ObjectType, a1);
  uint64_t v69 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 192);
  char v79 = v69(ObjectType, a1);
  uint64_t v72 = ObjectType;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a1 + 24))(&v87, ObjectType, a1);
  unint64_t v4 = 0xE000000000000000;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  uint64_t v13 = 0;
  unint64_t v14 = 0xE000000000000000;
  switch((char)v87)
  {
    case 1:
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      char v21 = byte_26882EE38;
      sub_235A4F2CC(0x49545F4F52544E49, 0xEB00000000454C54, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v21);
      sub_235A35654();
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v21);
      uint64_t v22 = sub_235A68D90();
      unint64_t v83 = v23;
      uint64_t v85 = v22;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v24 = byte_26882EE38;
      sub_235A4F2CC(0x55535F4F52544E49, 0xEE00454C54495442, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v24);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v24);
      uint64_t v80 = sub_235A68D90();
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v27 = byte_26882EE38;
      unint64_t v77 = v26;
      if (v74) {
        uint64_t v28 = "INTRO_PRIMARY_USE_SIRI";
      }
      else {
        uint64_t v28 = "INTRO_PRIMARY_CONTINUE";
      }
      sub_235A4F2CC(0xD000000000000016, (unint64_t)(v28 - 32) | 0x8000000000000000, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v27);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v27);
      uint64_t v70 = sub_235A68D90();
      unint64_t v71 = v53;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v54 = byte_26882EE38;
      sub_235A4F2CC(0x45535F4F52544E49, 0xEF595241444E4F43, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v54);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v54);
      uint64_t v55 = sub_235A68D90();
      uint64_t v7 = v56;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v55;
      uint64_t v5 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      goto LABEL_30;
    case 2:
      long long v29 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 72);
      uint64_t v30 = v29(v72, a1);
      uint64_t v32 = v31;
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      uint64_t v85 = sub_235A4F48C(0xD000000000000010, 0x8000000235A6D4A0, 0, v30, v32, byte_26882EE38, 0xAu);
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      uint64_t v35 = v29(v72, a1);
      uint64_t v80 = sub_235A4F48C(0xD000000000000013, 0x8000000235A6D4C0, 0, v35, v36, byte_26882EE38, 0xAu);
      unint64_t v38 = v37;
      swift_bridgeObjectRelease();
      unint64_t v83 = v34;
      unint64_t v77 = v38;
      if (v74)
      {
        char v39 = byte_26882EE38;
        sub_235A4F2CC(0xD000000000000016, 0x8000000235A6D520, 0, byte_26882EE38, 0xAu);
        sub_235A643F8(v39);
        sub_235A35654();
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_235A643F8(v39);
        uint64_t v70 = sub_235A68D90();
        unint64_t v71 = v40;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v57 = v29(v72, a1);
        uint64_t v70 = sub_235A4F48C(0xD000000000000012, 0x8000000235A6D4E0, 0, v57, v58, byte_26882EE38, 0xAu);
        unint64_t v71 = v59;
      }
      swift_bridgeObjectRelease();
      char v60 = byte_26882EE38;
      sub_235A4F2CC(0xD000000000000014, 0x8000000235A6D500, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v60);
      sub_235A35654();
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v60);
      uint64_t v8 = sub_235A68D90();
      uint64_t v62 = v61;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v9 = v62;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
LABEL_30:
      unint64_t v14 = v83;
      uint64_t v13 = v85;
      unint64_t v12 = v77;
      uint64_t v11 = v80;
      goto LABEL_31;
    case 3:
      goto LABEL_32;
    default:
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      char v15 = byte_26882EE38;
      sub_235A4F2CC(0x49545F4F52544E49, 0xEB00000000454C54, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v15);
      sub_235A35654();
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v15);
      uint64_t v16 = sub_235A68D90();
      unint64_t v82 = v17;
      uint64_t v84 = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v18 = byte_26882EE38;
      if (v79)
      {
        uint64_t v19 = 0x55535F4F52544E49;
        uint64_t v20 = 0xEE00454C54495442;
      }
      else
      {
        uint64_t v19 = 0xD000000000000013;
        uint64_t v20 = 0x8000000235A6D560;
      }
      sub_235A4F2CC(v19, v20, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v18);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v18);
      uint64_t v41 = sub_235A68D90();
      unint64_t v78 = v42;
      uint64_t v81 = v41;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v43 = byte_26882EE38;
      sub_235A4F2CC(0xD000000000000016, 0x8000000235A6D540, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v43);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v43);
      uint64_t v70 = sub_235A68D90();
      unint64_t v71 = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v45 = byte_26882EE38;
      sub_235A4F2CC(0x45535F4F52544E49, 0xEF595241444E4F43, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v45);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v45);
      uint64_t v75 = sub_235A68D90();
      uint64_t v9 = v46;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = 0;
      uint64_t v13 = v84;
      if (v69(v72, a1))
      {
        uint64_t v5 = (void *)MEMORY[0x263F8EE78];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_235A6130C(0, v5[2] + 1, 1, v5);
        }
        unint64_t v48 = v5[2];
        unint64_t v47 = v5[3];
        if (v48 >= v47 >> 1) {
          uint64_t v5 = sub_235A6130C((void *)(v47 > 1), v48 + 1, 1, v5);
        }
        v5[2] = v48 + 1;
        uint64_t v49 = (char *)&v5[6 * v48];
        strcpy(v49 + 32, "quote.bubble");
        v49[45] = 0;
        *((_WORD *)v49 + 23) = -5120;
        *((void *)v49 + 6) = 0xD000000000000011;
        *((void *)v49 + 7) = 0x8000000235A6D580;
        *((void *)v49 + 8) = 0xD000000000000014;
        *((void *)v49 + 9) = 0x8000000235A6D5A0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_235A6130C(0, v5[2] + 1, 1, v5);
        }
        unint64_t v51 = v5[2];
        unint64_t v50 = v5[3];
        if (v51 >= v50 >> 1) {
          uint64_t v5 = sub_235A6130C((void *)(v50 > 1), v51 + 1, 1, v5);
        }
        v5[2] = v51 + 1;
        uint64_t v52 = &v5[6 * v51];
        void v52[4] = 0xD00000000000001DLL;
        v52[5] = 0x8000000235A6D5C0;
        v52[6] = 0xD000000000000011;
        v52[7] = 0x8000000235A6D5E0;
        v52[8] = 0xD000000000000014;
        v52[9] = 0x8000000235A6D600;
      }
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v11 = v81;
      unint64_t v14 = v82;
      uint64_t v8 = v75;
      unint64_t v12 = v78;
LABEL_31:
      uint64_t v10 = v70;
      unint64_t v4 = v71;
LABEL_32:
      uint64_t v86 = v13;
      uint64_t v76 = v8;
      uint64_t v63 = v6;
      unint64_t v64 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
      uint64_t v65 = swift_allocObject();
      *(_OWORD *)(v65 + 16) = xmmword_235A6A830;
      *(void *)(v65 + 32) = v10;
      *(void *)(v65 + 40) = v4;
      swift_bridgeObjectRetain();
      sub_235A68DE0();
      sub_235A68B30();
      sub_235A68E20();
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v66 = sub_235A68920();
      __swift_project_value_buffer(v66, (uint64_t)qword_26882DE48);
      os_log_type_t v67 = sub_235A68C40();
      sub_235A65720(v67, 0xD00000000000001CLL, 0x8000000235A6D460, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = v86;
      *(void *)(a2 + 24) = v14;
      *(void *)(a2 + 32) = v11;
      *(void *)(a2 + 40) = v64;
      *(void *)(a2 + 48) = v65;
      *(void *)(a2 + 56) = v76;
      *(void *)(a2 + 64) = v9;
      *(_OWORD *)(a2 + 72) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 104) = 0u;
      *(void *)(a2 + 120) = v63;
      *(void *)(a2 + 128) = v7;
      *(unsigned char *)(a2 + 136) = 2;
      *(_DWORD *)(a2 + 137) = 0;
      *(_DWORD *)(a2 + 140) = 0;
      *(void *)(a2 + 144) = v5;
      *(void *)(a2 + 152) = 0;
      *(void *)(a2 + 160) = 0;
      *(_WORD *)(a2 + 168) = 0;
      *(_DWORD *)(a2 + 170) = 0;
      *(_WORD *)(a2 + 174) = 0;
      *(void *)(a2 + 176) = 0;
      *(void *)(a2 + 184) = 0;
      return swift_bridgeObjectRelease();
  }
}

char *sub_235A45AC8(char a1, _OWORD *a2)
{
  long long v2 = a2[9];
  v38[8] = a2[8];
  v38[9] = v2;
  long long v3 = a2[11];
  v38[10] = a2[10];
  v38[11] = v3;
  long long v4 = a2[5];
  v38[4] = a2[4];
  v38[5] = v4;
  long long v5 = a2[7];
  v38[6] = a2[6];
  v38[7] = v5;
  long long v6 = a2[1];
  v38[0] = *a2;
  v38[1] = v6;
  long long v7 = a2[3];
  v38[2] = a2[2];
  v38[3] = v7;
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_235A68920();
      __swift_project_value_buffer(v8, (uint64_t)qword_26882DE48);
      os_log_type_t v9 = sub_235A68C30();
      sub_235A65720(v9, 0xD000000000000028, 0x8000000235A6D3E0, 0xD000000000000029, 0x8000000235A6D410);
      return 0;
    }
    else
    {
      long long v18 = a2[9];
      long long v34 = a2[8];
      long long v35 = v18;
      long long v19 = a2[11];
      long long v36 = a2[10];
      long long v37 = v19;
      long long v20 = a2[5];
      long long v30 = a2[4];
      long long v31 = v20;
      long long v21 = a2[7];
      long long v32 = a2[6];
      long long v33 = v21;
      long long v22 = a2[1];
      long long v26 = *a2;
      long long v27 = v22;
      long long v23 = a2[3];
      long long v28 = a2[2];
      long long v29 = v23;
      id v24 = objc_allocWithZone((Class)type metadata accessor for IntroProxCardController());
      sub_235A3557C((uint64_t)v38);
      uint64_t v10 = (char *)sub_235A63030(&v26);
      *(void *)&v10[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate + 8] = &off_26E8ED100;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    long long v11 = a2[9];
    long long v34 = a2[8];
    long long v35 = v11;
    long long v12 = a2[11];
    long long v36 = a2[10];
    long long v37 = v12;
    long long v13 = a2[5];
    long long v30 = a2[4];
    long long v31 = v13;
    long long v14 = a2[7];
    long long v32 = a2[6];
    long long v33 = v14;
    long long v15 = a2[1];
    long long v26 = *a2;
    long long v27 = v15;
    long long v16 = a2[3];
    long long v28 = a2[2];
    long long v29 = v16;
    id v17 = objc_allocWithZone((Class)type metadata accessor for IntroWelcomeController());
    sub_235A3557C((uint64_t)v38);
    uint64_t v10 = (char *)sub_235A4974C(&v26);
    *(void *)&v10[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate + 8] = &off_26E8ED100;
    swift_unknownObjectWeakAssign();
  }
  return v10;
}

id sub_235A45D00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntroPresenter()
{
  return self;
}

uint64_t sub_235A45E14@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

uint64_t sub_235A45ED8(_OWORD *a1)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v6 = v3[11];
  v18[9] = v3[9];
  v18[10] = v5;
  v18[11] = v6;
  long long v7 = v3[5];
  v18[4] = v3[4];
  v18[5] = v7;
  long long v8 = v3[7];
  v18[6] = v3[6];
  v18[7] = v8;
  v18[8] = v4;
  long long v9 = v3[1];
  v18[0] = *v3;
  v18[1] = v9;
  long long v10 = v3[3];
  v18[2] = v3[2];
  v18[3] = v10;
  long long v11 = a1[9];
  v3[8] = a1[8];
  v3[9] = v11;
  long long v12 = a1[11];
  v3[10] = a1[10];
  v3[11] = v12;
  long long v13 = a1[5];
  v3[4] = a1[4];
  v3[5] = v13;
  long long v14 = a1[7];
  v3[6] = a1[6];
  v3[7] = v14;
  long long v15 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v15;
  long long v16 = a1[3];
  v3[2] = a1[2];
  v3[3] = v16;
  return sub_235A346CC((uint64_t)v18);
}

uint64_t (*sub_235A45F98())()
{
  return j__swift_endAccess;
}

void *sub_235A45FF4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_presentingViewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A4602C()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_viewStyle) == 1
    && (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_checkboxCheckedMac) & 1) == 0)
  {
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_235A68920();
    __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
    os_log_type_t v6 = sub_235A68C40();
    sub_235A65720(v6, 0xD000000000000015, 0x8000000235A6CD80, 0xD00000000000003DLL, 0x8000000235A6D380);
    uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);
    if (result)
    {
      uint64_t v7 = swift_retain();
      sub_235A36F38(v7);
      goto LABEL_11;
    }
  }
  else
  {
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_235A68920();
    __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
    os_log_type_t v2 = sub_235A68C40();
    sub_235A65720(v2, 0xD000000000000015, 0x8000000235A6CD80, 0xD000000000000036, 0x8000000235A6D340);
    *(void *)(*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSourceWriter)
              + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled) = 2;
    uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);
    if (result)
    {
      uint64_t v4 = swift_retain();
      sub_235A36DAC(v4);
LABEL_11:
      swift_release();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_235A46228()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235A68920();
  __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
  os_log_type_t v2 = sub_235A68C40();
  sub_235A65720(v2, 0xD000000000000017, 0x8000000235A6CD40, 0xD000000000000014, 0x8000000235A6D3C0);
  *(void *)(*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_dataSourceWriter)
            + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed) = 2;
  uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate);
  if (result)
  {
    uint64_t v4 = swift_retain();
    sub_235A370C8(v4);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A46344()
{
  id result = objc_msgSend(self, sel_sharedAnalytics);
  qword_26882D850 = (uint64_t)result;
  return result;
}

uint64_t sub_235A46380()
{
  uint64_t v0 = sub_235A68890();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A68880();
  id v4 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v5 = (void *)sub_235A68870();
  id v6 = objc_msgSend(v4, sel_initWithNSUUID_, v5);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_26882D858 = (uint64_t)v6;
  return result;
}

void sub_235A46484(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupEvent), sel_init);
  if (v2)
  {
    id v5 = v2;
    id v3 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupEventMetadata), sel_init);
    if (v3)
    {
      id v4 = v3;
      if (qword_26882D0D8 != -1) {
        swift_once();
      }
      objc_msgSend(v4, sel_setSetupId_, qword_26882D858);
      objc_msgSend(v5, sel_setEventMetadata_, v4);
      objc_msgSend(v5, sel_setSiriSetupContext_, a1);
      objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, v5);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_235A465E0(char *a1)
{
  uint64_t v1 = *a1;
  id v2 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupContext), sel_init);
  if (v2)
  {
    id v6 = v2;
    id v3 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupStep), sel_init);
    if (v3)
    {
      id v4 = v3;
      objc_msgSend(v3, sel_setPage_, dword_235A6AF1C[v1]);
      objc_msgSend(v6, sel_setStep_, v4);
      sub_235A46484((uint64_t)v6);

      id v5 = v4;
    }
    else
    {
      id v5 = v6;
    }
  }
}

void sub_235A466AC()
{
  uint64_t v0 = sub_235A68890();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupContext), sel_init);
  if (v4)
  {
    id v13 = v4;
    id v5 = objc_msgSend(objc_allocWithZone((Class)SetupSchemaProvisionalSiriSetupStarted), sel_init);
    if (v5)
    {
      id v6 = v5;
      if (qword_26882D0D8 != -1) {
        swift_once();
      }
      sub_235A68880();
      id v7 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v8 = (void *)sub_235A68870();
      id v9 = objc_msgSend(v7, sel_initWithNSUUID_, v8);

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      long long v10 = (void *)qword_26882D858;
      qword_26882D858 = (uint64_t)v9;

      objc_msgSend(v6, sel_setExists_, 1);
      objc_msgSend(v13, sel_setStarted_, v6);
      sub_235A46484((uint64_t)v13);
    }
    else
    {
      id v11 = v13;
    }
  }
}

void sub_235A46890(uint64_t a1)
{
  if (qword_26882D0D0 != -1) {
    swift_once();
  }
  if (qword_26882D850) {
    id v2 = objc_msgSend((id)qword_26882D850, sel_newTurnBasedInstrumentationContext);
  }
  else {
    id v2 = 0;
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED78]), sel_init);
  objc_msgSend(v4, sel_setInvocationSource_, a1);
  id v3 = v4;
  if (v4)
  {
    if (v2)
    {
      objc_msgSend(v2, sel_emitInstrumentation_, v4);

      id v3 = v4;
    }
  }
  else
  {
    id v3 = v2;
  }
}

id sub_235A46978(_OWORD *a1)
{
  long long v2 = a1[9];
  long long v34 = a1[8];
  long long v35 = v2;
  long long v3 = a1[11];
  long long v36 = a1[10];
  long long v37 = v3;
  long long v4 = a1[5];
  long long v30 = a1[4];
  long long v31 = v4;
  long long v5 = a1[7];
  long long v32 = a1[6];
  long long v33 = v5;
  long long v6 = a1[1];
  v27[0] = *a1;
  v27[1] = v6;
  long long v7 = a1[3];
  long long v28 = a1[2];
  long long v29 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_orbView] = 0;
  uint64_t v8 = (void *)sub_235A68AF0();
  if (*((void *)&v28 + 1))
  {
    swift_bridgeObjectRetain();
    id v9 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  v26.receiver = v1;
  v26.super_class = (Class)type metadata accessor for DataSharingWelcomeController();
  id v10 = objc_msgSendSuper2(&v26, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 2);

  id v11 = self;
  id v12 = v10;
  id v13 = objc_msgSend(v11, sel_buttonWithType_, 1);
  id v14 = objc_msgSend(v13, sel_titleLabel);
  if (v14)
  {
    long long v15 = v14;
    objc_msgSend(v14, sel_setAdjustsFontSizeToFitWidth_, 1);
  }
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  if ((void)v31)
  {
    swift_bridgeObjectRetain();
    long long v16 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v16 = 0;
  }
  objc_msgSend(v13, sel_setTitle_forState_, v16, 0);

  objc_msgSend(v13, sel_addTarget_action_forControlEvents_, v12, sel_aboutDataSharingTapped, 64);
  id v17 = objc_msgSend(v12, sel_headerView);
  objc_msgSend(v17, sel_addAccessoryButton_, v13);

  if ((void)v29 && *(void *)(v29 + 16))
  {
    long long v18 = self;
    swift_bridgeObjectRetain();
    id v19 = objc_msgSend(v18, sel_boldButton);
    long long v20 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setTitle_forState_, v20, 0);

    objc_msgSend(v19, sel_addTarget_action_forControlEvents_, v12, sel_shareTapped, 64);
    id v21 = objc_msgSend(v12, sel_buttonTray);
    objc_msgSend(v21, sel_addButton_, v19);
  }
  if ((void)v30)
  {
    swift_bridgeObjectRetain();
    sub_235A346CC((uint64_t)v27);
    id v22 = objc_msgSend(self, sel_linkButton);
    long long v23 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_setTitle_forState_, v23, 0);

    objc_msgSend(v22, sel_addTarget_action_forControlEvents_, v12, sel_notNowTapped, 64);
    id v24 = objc_msgSend(v12, sel_buttonTray);
    objc_msgSend(v24, sel_addButton_, v22);
  }
  else
  {

    sub_235A346CC((uint64_t)v27);
  }
  return v12;
}

uint64_t sub_235A46E2C(char *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t result = MEMORY[0x237DECD00](&a1[OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate]);
  if (result)
  {
    long long v6 = a1;
    a3();

    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A46F0C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSharingWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSharingWelcomeController()
{
  return self;
}

char *sub_235A46FB0(_OWORD *a1)
{
  long long v2 = a1[9];
  long long v36 = a1[8];
  long long v37 = v2;
  long long v3 = a1[11];
  long long v38 = a1[10];
  long long v39 = v3;
  long long v4 = a1[5];
  long long v32 = a1[4];
  long long v33 = v4;
  long long v5 = a1[7];
  long long v34 = a1[6];
  long long v35 = v5;
  long long v6 = a1[1];
  v29[0] = *a1;
  v29[1] = v6;
  long long v7 = a1[3];
  long long v30 = a1[2];
  long long v31 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView] = 0;
  uint64_t v8 = (void *)sub_235A68AF0();
  if (*((void *)&v30 + 1))
  {
    swift_bridgeObjectRetain();
    id v9 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  v28.receiver = v1;
  v28.super_class = (Class)type metadata accessor for SuccessWelcomeController();
  id v10 = objc_msgSendSuper2(&v28, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 2);

  id v11 = objc_allocWithZone((Class)type metadata accessor for OrbContainerView());
  id v12 = (char *)v10;
  id v13 = sub_235A3A424(1);
  id v14 = objc_msgSend(v12, sel_headerView);
  id v15 = objc_msgSend(v14, sel_customIconContainerView);

  if (v15)
  {
    objc_msgSend(v15, sel_addSubview_, v13);
  }
  id v16 = objc_msgSend(v12, sel_headerView);
  id v17 = objc_msgSend(v16, sel_customIconContainerView);

  if (v17)
  {
    objc_msgSend(v17, sel_setClipsToBounds_, 0);
  }
  long long v18 = *(void **)&v12[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView];
  *(void *)&v12[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_orbView] = v13;
  long long v27 = v13;

  uint64_t v19 = v31;
  if ((void)v31) {
    swift_bridgeObjectRetain();
  }
  else {
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
  sub_235A346CC((uint64_t)v29);
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    id v21 = self;
    uint64_t v22 = v19 + 40;
    do
    {
      swift_bridgeObjectRetain();
      id v23 = objc_msgSend(v21, sel_boldButton, v27);
      id v24 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setTitle_forState_, v24, 0);

      objc_msgSend(v23, sel_addTarget_action_forControlEvents_, v12, sel_doneTapped, 64);
      id v25 = objc_msgSend(v12, sel_buttonTray);
      objc_msgSend(v25, sel_addButton_, v23);

      v22 += 16;
      --v20;
    }
    while (v20);
  }

  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_235A472BC()
{
  uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_delegate);
  if (result)
  {
    uint64_t v2 = result;
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_235A68920();
    __swift_project_value_buffer(v3, (uint64_t)qword_26882DE48);
    os_log_type_t v4 = sub_235A68C40();
    sub_235A65720(v4, 0xD000000000000015, 0x8000000235A6CD80, 0xD000000000000015, 0x8000000235A6D770);
    if (MEMORY[0x237DECD00](v2 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate))
    {
      uint64_t v5 = swift_retain();
      sub_235A36DAC(v5);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A47494()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuccessWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuccessWelcomeController()
{
  return self;
}

char *sub_235A47538(_OWORD *a1)
{
  long long v3 = a1[9];
  long long v40 = a1[8];
  long long v41 = v3;
  long long v4 = a1[11];
  long long v42 = a1[10];
  long long v43 = v4;
  long long v5 = a1[5];
  long long v36 = a1[4];
  long long v37 = v5;
  long long v6 = a1[7];
  long long v38 = a1[6];
  long long v39 = v6;
  long long v7 = a1[1];
  v33[0] = *a1;
  v33[1] = v7;
  long long v8 = a1[3];
  long long v34 = a1[2];
  long long v35 = v8;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView] = 0;
  id v9 = &v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel];
  long long v10 = a1[9];
  *((_OWORD *)v9 + 8) = a1[8];
  *((_OWORD *)v9 + 9) = v10;
  long long v11 = a1[11];
  *((_OWORD *)v9 + 10) = a1[10];
  *((_OWORD *)v9 + 11) = v11;
  long long v12 = a1[5];
  *((_OWORD *)v9 + 4) = a1[4];
  *((_OWORD *)v9 + 5) = v12;
  long long v13 = a1[7];
  *((_OWORD *)v9 + 6) = a1[6];
  *((_OWORD *)v9 + 7) = v13;
  long long v14 = a1[1];
  *(_OWORD *)id v9 = *a1;
  *((_OWORD *)v9 + 1) = v14;
  long long v15 = a1[3];
  *((_OWORD *)v9 + 2) = a1[2];
  *((_OWORD *)v9 + 3) = v15;
  sub_235A3557C((uint64_t)v33);
  id v16 = (void *)sub_235A68AF0();
  if (*((void *)&v34 + 1))
  {
    swift_bridgeObjectRetain();
    id v17 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v17 = 0;
  }
  v32.receiver = v1;
  v32.super_class = (Class)type metadata accessor for VoiceTrainingWelcomeController();
  id v18 = objc_msgSendSuper2(&v32, sel_initWithTitle_detailText_icon_contentLayout_, v16, v17, 0, 2);

  id v19 = objc_allocWithZone((Class)type metadata accessor for OrbContainerView());
  uint64_t v20 = (char *)v18;
  id v21 = sub_235A3A424(1);
  id v22 = objc_msgSend(v20, sel_headerView);
  id v23 = objc_msgSend(v22, sel_customIconContainerView);

  if (v23)
  {
    objc_msgSend(v23, sel_addSubview_, v21);
  }
  id v24 = objc_msgSend(v20, sel_headerView);
  id v25 = objc_msgSend(v24, sel_customIconContainerView);

  if (v25)
  {
    objc_msgSend(v25, sel_setClipsToBounds_, 0);
  }
  objc_super v26 = *(void **)&v20[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView];
  *(void *)&v20[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView] = v21;
  long long v27 = v21;

  id v28 = objc_msgSend(self, sel_linkButton);
  if ((void)v36)
  {
    swift_bridgeObjectRetain();
    long long v29 = (void *)sub_235A68AF0();
    sub_235A346CC((uint64_t)v33);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_235A346CC((uint64_t)v33);
    long long v29 = 0;
  }
  objc_msgSend(v28, sel_setTitle_forState_, v29, 0);

  objc_msgSend(v28, sel_addTarget_action_forControlEvents_, v20, sel_secondaryButtonTapped, 64);
  id v30 = objc_msgSend(v20, sel_buttonTray);
  objc_msgSend(v30, sel_addButton_, v28);

  return v20;
}

void sub_235A47850(void *a1, char a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel;
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel + 16);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel + 24);
  uint64_t v8 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  id v9 = *(void (**)(uint64_t, uint64_t))(v7 + 32);
  swift_bridgeObjectRetain();
  if (v6 == ((uint64_t (*)(uint64_t, uint64_t))v9)(v8, v7) && v5 == v10)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_235A68F50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_11;
    }
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    v9(v8, v7);
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_235A68920();
    __swift_project_value_buffer(v13, (uint64_t)qword_26882DE48);
    os_log_type_t v14 = sub_235A68C40();
    sub_235A65720(v14, 0xD000000000000013, 0x8000000235A6D160, 0xD000000000000013, 0x8000000235A6D180);
    swift_bridgeObjectRelease();
    uint64_t v15 = ((uint64_t (*)(uint64_t, uint64_t))v9)(v8, v7);
    sub_235A47F20(v15, v16, a2 & 1);
  }
  swift_bridgeObjectRelease();
LABEL_11:
  uint64_t v18 = *(void *)(v4 + 88);
  uint64_t v17 = *(void *)(v4 + 96);
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  id v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 152);
  swift_bridgeObjectRetain();
  uint64_t v22 = v21(v19, v20);
  if (!v17)
  {
    if (!v23) {
      return;
    }
    goto LABEL_20;
  }
  if (!v23)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    uint64_t v26 = a1[3];
    uint64_t v27 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v26);
    (*(void (**)(uint64_t, uint64_t))(v27 + 152))(v26, v27);
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_235A68920();
    __swift_project_value_buffer(v28, (uint64_t)qword_26882DE48);
    os_log_type_t v29 = sub_235A68C40();
    sub_235A65720(v29, 0xD000000000000013, 0x8000000235A6D160, 0xD00000000000001ELL, 0x8000000235A6D1A0);
    swift_bridgeObjectRelease();
    uint64_t v30 = a1[3];
    uint64_t v31 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v30);
    uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 152))(v30, v31);
    if (v33) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = 0;
    }
    if (v33) {
      unint64_t v35 = v33;
    }
    else {
      unint64_t v35 = 0xE000000000000000;
    }
    *(void *)(v4 + 88) = v34;
    *(void *)(v4 + 96) = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v36 = objc_msgSend(v38, sel_navigationItem);
    id v39 = (id)sub_235A68AF0();
    objc_msgSend(v36, sel_setTitle_, v39);
    swift_bridgeObjectRelease();

    return;
  }
  if (v18 != v22 || v17 != v23)
  {
    char v25 = sub_235A68F50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v25) {
      return;
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

uint64_t sub_235A47D00(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D708);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for VoiceTrainingWelcomeController();
  v14.receiver = v1;
  v14.super_class = v6;
  objc_msgSendSuper2(&v14, sel_viewDidAppear_, a1 & 1);
  uint64_t result = MEMORY[0x237DECD00](&v1[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate]);
  if (result)
  {
    uint64_t v8 = (void *)result;
    uint64_t v9 = sub_235A68C10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
    sub_235A68BF0();
    id v10 = v8;
    uint64_t v11 = sub_235A68BE0();
    char v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x263F8F500];
    v12[2] = v11;
    v12[3] = v13;
    v12[4] = v10;
    sub_235A547EC((uint64_t)v5, (uint64_t)&unk_26882D710, (uint64_t)v12);
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

void sub_235A47F20(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = &v3[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_viewModel];
  *((void *)v5 + 2) = a1;
  *((void *)v5 + 3) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_headerView);
  uint64_t v7 = (void *)sub_235A68AF0();
  objc_msgSend(v6, sel_setTitle_, v7);

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15910]), sel_init);
  uint64_t v9 = *MEMORY[0x263F15EB8];
  id v10 = self;
  id v11 = v8;
  id v12 = objc_msgSend(v10, sel_functionWithName_, v9);
  objc_msgSend(v11, sel_setTimingFunction_, v12);

  double v13 = 0.2;
  if ((a3 & 1) == 0) {
    double v13 = 0.0;
  }
  objc_msgSend(v11, sel_setDuration_, v13);
  objc_msgSend(v11, sel_setType_, *MEMORY[0x263F16008]);
  id v14 = objc_msgSend(v3, sel_view);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_semanticContentAttribute);

    uint64_t v17 = (id *)MEMORY[0x263F15FE8];
    if (v16 != (id)4) {
      uint64_t v17 = (id *)MEMORY[0x263F15FF0];
    }
    id v18 = *v17;
    objc_msgSend(v11, sel_setSubtype_, v18);

    id v19 = objc_msgSend(v3, sel_headerView);
    id v20 = objc_msgSend(v19, sel_layer);

    objc_msgSend(v20, sel_removeAllAnimations);
    id v21 = objc_msgSend(v3, sel_headerView);
    id v22 = objc_msgSend(v21, sel_layer);

    objc_msgSend(v22, sel_addAnimation_forKey_, v11, *MEMORY[0x263F15FD0]);
  }
  else
  {
    __break(1u);
  }
}

id sub_235A48210()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTrainingWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceTrainingWelcomeController()
{
  return self;
}

id sub_235A482F4()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView);
  if (v1) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_setMode_, 1);
  }
  return result;
}

id sub_235A48328()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView);
  if (v1) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_animateToOffWithCompletion_, 0);
  }
  return result;
}

void sub_235A4835C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(char **)(*v3 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView);
  if (v4)
  {
    id v8 = *(void **)&v4[OBJC_IVAR____TtC9SiriSetup16OrbContainerView_checkMark];
    uint64_t v9 = v4;
    id v10 = v8;
    sub_235A40DE4(a1 & 1, a2, a3);
  }
}

id sub_235A48414()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_orbView);
  if (v1) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9SiriSetup16OrbContainerView_orbView), sel_setPowerLevel_);
  }
  return result;
}

void sub_235A48444(void *a1, char a2)
{
}

uint64_t sub_235A48468()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_235A484A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_235A484FC(_OWORD *a1)
{
  long long v2 = a1[9];
  long long v30 = a1[8];
  long long v31 = v2;
  long long v3 = a1[11];
  long long v32 = a1[10];
  long long v33 = v3;
  long long v4 = a1[5];
  long long v26 = a1[4];
  long long v27 = v4;
  long long v5 = a1[7];
  long long v28 = a1[6];
  long long v29 = v5;
  long long v6 = a1[1];
  v23[0] = *a1;
  v23[1] = v6;
  long long v7 = a1[3];
  long long v24 = a1[2];
  long long v25 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_orbView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController] = 0;
  id v8 = (void *)sub_235A68AF0();
  if (*((void *)&v24 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  v22.receiver = v1;
  v22.super_class = (Class)type metadata accessor for EducationWelcomeController();
  id v10 = objc_msgSendSuper2(&v22, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 2);

  id v11 = v10;
  id v12 = objc_msgSend(v11, sel_headerView);
  objc_msgSend(v12, sel_setAlpha_, 0.0);

  id v13 = objc_msgSend(v11, sel_contentView);
  objc_msgSend(v13, sel_setAlpha_, 0.0);

  sub_235A48C34();
  uint64_t v14 = v25;
  if ((void)v25) {
    swift_bridgeObjectRetain();
  }
  else {
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  sub_235A346CC((uint64_t)v23);
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    id v16 = self;
    uint64_t v17 = v14 + 40;
    do
    {
      swift_bridgeObjectRetain();
      id v18 = objc_msgSend(v16, sel_boldButton);
      id v19 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_setTitle_forState_, v19, 0);

      objc_msgSend(v18, sel_addTarget_action_forControlEvents_, v11, sel_continueTapped, 64);
      id v20 = objc_msgSend(v11, sel_buttonTray);
      objc_msgSend(v20, sel_addButton_, v18);

      v17 += 16;
      --v15;
    }
    while (v15);
  }

  swift_bridgeObjectRelease();
  return v11;
}

void sub_235A487A8(char a1)
{
  v19.receiver = v1;
  v19.super_class = (Class)type metadata accessor for EducationWelcomeController();
  objc_msgSendSuper2(&v19, sel_viewDidAppear_, a1 & 1);
  long long v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  uint64_t v17 = sub_235A496AC;
  uint64_t v18 = v4;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_235A3667C;
  id v16 = &block_descriptor_5;
  long long v5 = _Block_copy(&v13);
  id v6 = v1;
  swift_release();
  objc_msgSend(v3, sel_animateWithDuration_delay_options_animations_completion_, 0, v5, 0, 0.4, 0.0);
  _Block_release(v5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v17 = sub_235A496E8;
  uint64_t v18 = v7;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_235A3667C;
  id v16 = &block_descriptor_23;
  id v8 = _Block_copy(&v13);
  id v9 = v6;
  swift_release();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v17 = sub_235A4970C;
  uint64_t v18 = v10;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_235A484A8;
  id v16 = &block_descriptor_29;
  id v11 = _Block_copy(&v13);
  id v12 = v9;
  swift_release();
  objc_msgSend(v3, sel_animateWithDuration_delay_options_animations_completion_, 0, v8, v11, 0.4, 0.3);
  _Block_release(v11);
  _Block_release(v8);
}

uint64_t sub_235A48A68()
{
  uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_delegate);
  if (result)
  {
    uint64_t v2 = result;
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_235A68920();
    __swift_project_value_buffer(v3, (uint64_t)qword_26882DE48);
    os_log_type_t v4 = sub_235A68C40();
    sub_235A65720(v4, 0xD000000000000015, 0x8000000235A6CD80, 0xD000000000000017, 0x8000000235A6D950);
    if (MEMORY[0x237DECD00](v2 + OBJC_IVAR____TtC9SiriSetup18EducationPresenter_delegate))
    {
      uint64_t v5 = swift_retain();
      sub_235A36DAC(v5);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_235A48BE0(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  objc_msgSend(v2, sel_setAlpha_, 1.0);
}

void sub_235A48C34()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_235A68850();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_currentTraitCollection);
  objc_msgSend(v6, sel_userInterfaceStyle);

  unint64_t v77 = 0xD00000000000001BLL;
  unint64_t v78 = 0x8000000235A6D890;
  sub_235A68B30();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v76 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v8 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  id v9 = (void *)sub_235A68AF0();
  id v10 = objc_msgSend(v76, sel_pathForResource_ofType_, v8, v9);

  if (v10)
  {
    sub_235A68B00();

    sub_235A68830();
    swift_bridgeObjectRelease();
    id v11 = objc_allocWithZone(MEMORY[0x263EFA800]);
    id v12 = (void *)sub_235A68840();
    id v13 = objc_msgSend(v11, sel_initWithURL_, v12);

    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA860]), sel_initWithPlayerItem_, v13);
    uint64_t v15 = OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player;
    id v16 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player];
    *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player] = v14;

    uint64_t v17 = *(void **)&v1[v15];
    if (v17)
    {
      id v18 = objc_allocWithZone(MEMORY[0x263EFA9C8]);
      id v19 = v17;
      id v20 = objc_msgSend(v18, sel_init);
      uint64_t v21 = OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController;
      objc_super v22 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController];
      *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerViewController] = v20;

      uint64_t v23 = *(void **)&v1[v21];
      if (v23)
      {
        id v24 = v23;
        objc_msgSend(v24, sel_setShowsPlaybackControls_, 0);
        objc_msgSend(v24, sel_setAllowsPictureInPicturePlayback_, 0);
        id v25 = objc_msgSend(v24, sel_view);
        if (v25)
        {
          long long v26 = v25;
          objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

          id v27 = objc_msgSend(v24, sel_view);
          if (v27)
          {
            long long v28 = v27;
            id v29 = objc_msgSend(self, sel_systemBackgroundColor);
            objc_msgSend(v28, sel_setBackgroundColor_, v29);

            id v30 = objc_msgSend(v1, sel_contentView);
            id v31 = objc_msgSend(v24, sel_view);
            if (v31)
            {
              long long v32 = v31;
              id v73 = v19;
              id v74 = v13;
              uint64_t v75 = v2;
              objc_msgSend(v30, sel_addSubview_, v31);

              __swift_instantiateConcreteTypeFromMangledName(&qword_26882D2F0);
              uint64_t v33 = swift_allocObject();
              *(_OWORD *)(v33 + 16) = xmmword_235A6B000;
              id v34 = objc_msgSend(v24, sel_view);
              if (v34)
              {
                unint64_t v35 = v34;
                id v36 = objc_msgSend(v34, sel_topAnchor);

                id v37 = objc_msgSend(v1, sel_contentView);
                id v38 = objc_msgSend(v37, sel_topAnchor);

                id v39 = objc_msgSend(v36, sel_constraintEqualToAnchor_constant_, v38, 60.0);
                *(void *)(v33 + 32) = v39;
                id v40 = objc_msgSend(v24, sel_view);
                if (v40)
                {
                  long long v41 = v40;
                  id v42 = objc_msgSend(v40, sel_centerXAnchor);

                  id v43 = objc_msgSend(v1, sel_contentView);
                  id v44 = objc_msgSend(v43, sel_centerXAnchor);

                  id v45 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v44);
                  *(void *)(v33 + 40) = v45;
                  id v46 = objc_msgSend(v24, sel_view);
                  if (v46)
                  {
                    unint64_t v47 = v46;
                    id v48 = objc_msgSend(v46, sel_heightAnchor);

                    id v49 = objc_msgSend(v48, sel_constraintEqualToConstant_, 332.67);
                    *(void *)(v33 + 48) = v49;
                    id v50 = objc_msgSend(v24, sel_view);
                    if (v50)
                    {
                      unint64_t v51 = v50;
                      uint64_t v52 = self;
                      id v53 = objc_msgSend(v51, sel_widthAnchor);

                      id v54 = objc_msgSend(v53, sel_constraintEqualToConstant_, 263.3);
                      *(void *)(v33 + 56) = v54;
                      unint64_t v77 = v33;
                      sub_235A68B90();
                      sub_235A40CF0();
                      uint64_t v55 = (void *)sub_235A68B60();
                      swift_bridgeObjectRelease();
                      objc_msgSend(v52, sel_activateConstraints_, v55);

                      uint64_t v56 = v73;
                      objc_msgSend(v24, sel_setPlayer_, v73);
                      uint64_t v57 = MEMORY[0x263F010C0];
                      unint64_t v58 = *MEMORY[0x263F010C0];
                      uint64_t v59 = *(void *)(MEMORY[0x263F010C0] + 16);
                      uint64_t v60 = *(void *)(MEMORY[0x263F010C0] + 24);
                      uint64_t v61 = *(void *)(MEMORY[0x263F010C0] + 40);
                      id v62 = objc_allocWithZone(MEMORY[0x263EFA840]);
                      unint64_t v77 = v58;
                      unint64_t v78 = *(void *)(v57 + 8);
                      uint64_t v79 = v59;
                      uint64_t v80 = v60;
                      uint64_t v81 = *(void *)(v57 + 32);
                      uint64_t v82 = v61;
                      uint64_t v63 = v74;
                      id v64 = objc_msgSend(v62, sel_initWithPlayer_templateItem_timeRange_, v56, v74, &v77);
                      uint64_t v65 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper];
                      *(void *)&v1[OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_playerLooper] = v64;

                      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v75);
                      return;
                    }
                    goto LABEL_30;
                  }
LABEL_29:
                  __break(1u);
LABEL_30:
                  __break(1u);
                  return;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_26;
      }
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v71 = sub_235A68920();
      __swift_project_value_buffer(v71, (uint64_t)qword_26882DE48);
      os_log_type_t v72 = sub_235A68C30();
      sub_235A65720(v72, 0xD000000000000012, 0x8000000235A6D8B0, 0xD000000000000026, 0x8000000235A6D920);
    }
    else
    {
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v69 = sub_235A68920();
      __swift_project_value_buffer(v69, (uint64_t)qword_26882DE48);
      os_log_type_t v70 = sub_235A68C30();
      sub_235A65720(v70, 0xD000000000000012, 0x8000000235A6D8B0, 0xD00000000000001DLL, 0x8000000235A6D900);
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v66 = sub_235A68920();
  __swift_project_value_buffer(v66, (uint64_t)qword_26882DE48);
  os_log_type_t v67 = sub_235A68C30();
  sub_235A65720(v67, 0xD000000000000012, 0x8000000235A6D8B0, 0xD000000000000023, 0x8000000235A6D8D0);
  id v68 = v76;
}

id sub_235A495A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EducationWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EducationWelcomeController()
{
  return self;
}

uint64_t sub_235A49674()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_235A496AC()
{
  sub_235A48BE0(*(void **)(v0 + 16), (SEL *)&selRef_headerView);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void sub_235A496E8()
{
  sub_235A48BE0(*(void **)(v0 + 16), (SEL *)&selRef_contentView);
}

id sub_235A4970C(double a1)
{
  id result = *(id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC9SiriSetup26EducationWelcomeController_player);
  if (result)
  {
    LODWORD(a1) = 1.0;
    return objc_msgSend(result, sel_playImmediatelyAtRate_, a1);
  }
  return result;
}

void *sub_235A4974C(_OWORD *a1)
{
  long long v3 = a1[9];
  long long v72 = a1[8];
  long long v73 = v3;
  long long v4 = a1[11];
  long long v74 = a1[10];
  long long v75 = v4;
  long long v5 = a1[5];
  long long v68 = a1[4];
  long long v69 = v5;
  long long v6 = a1[7];
  long long v70 = a1[6];
  long long v71 = v6;
  long long v7 = a1[1];
  v65[0] = *a1;
  v65[1] = v7;
  long long v8 = a1[3];
  long long v66 = a1[2];
  long long v67 = v8;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_orbView] = 0;
  v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading] = 0;
  id v9 = &v1[OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel];
  v9[3] = &type metadata for ViewModel;
  v9[4] = &off_26E8ECE80;
  id v10 = (_OWORD *)swift_allocObject();
  *id v9 = v10;
  long long v11 = a1[9];
  v10[9] = a1[8];
  v10[10] = v11;
  long long v12 = a1[11];
  v10[11] = a1[10];
  v10[12] = v12;
  long long v13 = a1[5];
  v10[5] = a1[4];
  v10[6] = v13;
  long long v14 = a1[7];
  v10[7] = a1[6];
  v10[8] = v14;
  long long v15 = a1[1];
  v10[1] = *a1;
  void v10[2] = v15;
  long long v16 = a1[3];
  v10[3] = a1[2];
  v10[4] = v16;
  sub_235A3557C((uint64_t)v65);
  uint64_t v17 = (void *)sub_235A68AF0();
  id v18 = objc_msgSend(self, sel_bundleWithIdentifier_, v17);

  id v19 = (void *)sub_235A68AF0();
  id v58 = self;
  id v20 = objc_msgSend(v58, sel_imageNamed_inBundle_withConfiguration_, v19, v18, 0);

  uint64_t v21 = (void *)sub_235A68AF0();
  if (*((void *)&v66 + 1))
  {
    swift_bridgeObjectRetain();
    objc_super v22 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v22 = 0;
  }
  v64.receiver = v1;
  v64.super_class = (Class)type metadata accessor for IntroWelcomeController();
  id v23 = objc_msgSendSuper2(&v64, sel_initWithTitle_detailText_icon_contentLayout_, v21, v22, v20, 2);

  uint64_t v24 = v73;
  uint64_t v55 = v20;
  uint64_t v56 = v23;
  if ((void)v73 && (uint64_t v25 = *(void *)(v73 + 16)) != 0)
  {
    id v57 = v23;
    swift_bridgeObjectRetain();
    long long v26 = (uint64_t *)(v24 + 72);
    do
    {
      uint64_t v27 = *(v26 - 3);
      uint64_t v28 = *(v26 - 2);
      uint64_t v30 = *(v26 - 1);
      uint64_t v29 = *v26;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v31 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      id v32 = objc_msgSend(v58, sel__systemImageNamed_, v31);

      if (v32)
      {
        uint64_t v61 = v32;
        uint64_t v62 = v25;
        uint64_t v33 = qword_26882D0F0;
        id v60 = v57;
        if (v33 != -1) {
          swift_once();
        }
        char v34 = byte_26882EE38;
        sub_235A4F2CC(v27, v28, 0, byte_26882EE38, 0xAu);
        sub_235A643F8(v34);
        unint64_t v35 = sub_235A35654();
        uint64_t v36 = MEMORY[0x263F8D310];
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_235A643F8(v34);
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v59 = (void *)sub_235A68AF0();
        swift_bridgeObjectRelease();
        char v37 = byte_26882EE38;
        sub_235A4F2CC(v30, v29, 0, byte_26882EE38, 0xAu);
        sub_235A643F8(v37);
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_235A643F8(v37);
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v38 = (void *)sub_235A68AF0();
        swift_bridgeObjectRelease();
        id v39 = objc_msgSend(self, sel_whiteColor, v36, v35, v35, v35);
        objc_msgSend(v60, sel_addBulletedListItemWithTitle_description_image_tintColor_, v59, v38, v61, v39);

        uint64_t v25 = v62;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v26 += 6;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v40 = v23;
  }
  if ((void)v67) {
    uint64_t v41 = v67;
  }
  else {
    uint64_t v41 = MEMORY[0x263F8EE78];
  }
  uint64_t v42 = *(void *)(v41 + 16);
  if (v42)
  {
    id v63 = self;
    swift_bridgeObjectRetain();
    uint64_t v43 = v41 + 40;
    do
    {
      swift_bridgeObjectRetain();
      id v44 = objc_msgSend(v63, sel_boldButton);
      id v45 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      objc_msgSend(v44, sel_setTitle_forState_, v45, 0);

      objc_msgSend(v44, (SEL)&off_264C67390 + 5, v56, sel_continueTapped, 64);
      id v46 = objc_msgSend(v56, (SEL)&selRef_setHasSiriEnabled_ + 3);
      objc_msgSend(v46, (SEL)&selRef_customIconContainerView, v44);

      v43 += 16;
      --v42;
    }
    while (v42);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  id v47 = objc_msgSend(self, sel_linkButton);
  if ((void)v68)
  {
    swift_bridgeObjectRetain();
    id v48 = (void *)sub_235A68AF0();
    sub_235A346CC((uint64_t)v65);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_235A346CC((uint64_t)v65);
    id v48 = 0;
  }
  objc_msgSend(v47, sel_setTitle_forState_, v48, 0);

  objc_msgSend(v47, sel_addTarget_action_forControlEvents_, v56, sel_skipTapped, 64);
  id v49 = objc_msgSend(v56, sel_buttonTray);
  objc_msgSend(v49, sel_addButton_, v47);

  id v50 = self;
  unint64_t v51 = (void *)sub_235A68AF0();
  id v52 = objc_msgSend(v50, sel_linkWithBundleIdentifier_, v51);

  id v53 = objc_msgSend(v56, sel_buttonTray);
  objc_msgSend(v53, sel_setPrivacyLinkController_, v52);

  *((unsigned char *)v56 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading) = 0;
  return v56;
}

void sub_235A4A048()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading))
  {
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_235A68920();
    __swift_project_value_buffer(v2, (uint64_t)qword_26882DE48);
    os_log_type_t v3 = sub_235A68C40();
    sub_235A65720(v3, 0xD000000000000010, 0x8000000235A6DA10, 0xD000000000000028, 0x8000000235A6D9E0);
  }
  else if (MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate))
  {
    sub_235A4602C();
    swift_unknownObjectRelease();
  }
  *(unsigned char *)(v0 + v1) = 1;
}

void sub_235A4A17C()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_isLoading))
  {
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_235A68920();
    __swift_project_value_buffer(v2, (uint64_t)qword_26882DE48);
    os_log_type_t v3 = sub_235A68C40();
    sub_235A65720(v3, 0x7070615470696B73, 0xEC00000029286465, 0xD000000000000028, 0x8000000235A6D9E0);
  }
  else if (MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_delegate))
  {
    sub_235A46228();
    swift_unknownObjectRelease();
  }
  *(unsigned char *)(v0 + v1) = 1;
}

void sub_235A4A2B0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F823E8]), sel_initWithActivityIndicatorStyle_, 100);
  objc_msgSend(v1, sel_startAnimating);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithCustomView_, v1);
  id v3 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v3, sel_setRightBarButtonItem_animated_, v2, 1);

  id v4 = objc_msgSend(v0, sel_buttonTray);
  objc_msgSend(v4, sel_showButtonsBusy);
}

id sub_235A4A404()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntroWelcomeController()
{
  return self;
}

uint64_t sub_235A4A4B8(void *a1)
{
  return sub_235A4A4DC(a1);
}

uint64_t sub_235A4A4DC(void *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9SiriSetup22IntroWelcomeController_viewModel;
  swift_beginAccess();
  sub_235A38180(v3, (uint64_t)&v13);
  uint64_t v4 = v14;
  uint64_t v5 = v15;
  __swift_project_boxed_opaque_existential_1(&v13, v14);
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 224))(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  char v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 224))(v7, v8);
  if (v6 == 2)
  {
    if (v9 == 2) {
      goto LABEL_8;
    }
  }
  else if (v9 != 2 && ((((v9 & 1) == 0) ^ v6) & 1) != 0)
  {
    goto LABEL_8;
  }
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v11 + 224))(v10, v11)) {
    sub_235A4A2B0();
  }
LABEL_8:
  sub_235A38180((uint64_t)a1, (uint64_t)&v13);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_235A42D28(&v13, v3);
  return swift_endAccess();
}

uint64_t sub_235A4A668()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_235A4A6F8(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x8000000235A6BB10;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x62616E4569726973;
      unint64_t v4 = 0xEB0000000064656CLL;
      break;
    case 2:
      unint64_t v3 = 0x676E614C69726973;
      unint64_t v4 = 0xEC00000065676175;
      break;
    case 3:
      unint64_t v4 = 0x8000000235A6BB30;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v3 = 0x63696F5669726973;
      unint64_t v4 = 0xE900000000000065;
      break;
    case 5:
      unint64_t v3 = 0xD000000000000017;
      uint64_t v5 = "recognizeMyVoiceEnabled";
      goto LABEL_10;
    case 6:
      unint64_t v3 = 0xD000000000000013;
      uint64_t v5 = "voiceTriggerEnabled";
      goto LABEL_10;
    case 7:
      unint64_t v3 = 0xD000000000000011;
      uint64_t v5 = "siriInCallEnabled";
      goto LABEL_10;
    case 8:
      unint64_t v3 = 0xD000000000000015;
      uint64_t v5 = "siriDataSharingStatus";
LABEL_10:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000016;
  unint64_t v7 = 0x8000000235A6BB10;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x62616E4569726973;
      unint64_t v7 = 0xEB0000000064656CLL;
      break;
    case 2:
      unint64_t v6 = 0x676E614C69726973;
      unint64_t v7 = 0xEC00000065676175;
      break;
    case 3:
      unint64_t v7 = 0x8000000235A6BB30;
      unint64_t v6 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v6 = 0x63696F5669726973;
      unint64_t v7 = 0xE900000000000065;
      break;
    case 5:
      unint64_t v6 = 0xD000000000000017;
      uint64_t v8 = "recognizeMyVoiceEnabled";
      goto LABEL_20;
    case 6:
      unint64_t v6 = 0xD000000000000013;
      uint64_t v8 = "voiceTriggerEnabled";
      goto LABEL_20;
    case 7:
      unint64_t v6 = 0xD000000000000011;
      uint64_t v8 = "siriInCallEnabled";
      goto LABEL_20;
    case 8:
      unint64_t v6 = 0xD000000000000015;
      uint64_t v8 = "siriDataSharingStatus";
LABEL_20:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_235A68F50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_235A4A990(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000001ALL;
  unint64_t v3 = 0x8000000235A6BBE0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000001ALL;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEB00000000796464;
      unint64_t v5 = 0x754220534F63616DLL;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xEB00000000747261;
      unint64_t v5 = 0x7453206B63697551;
      break;
    default:
      unint64_t v3 = 0xE900000000000079;
      unint64_t v5 = 0x6464754220534F69;
      break;
  }
  unint64_t v6 = 0x8000000235A6BBE0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000796464;
      unint64_t v2 = 0x754220534F63616DLL;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xEB00000000747261;
      if (v5 == 0x7453206B63697551) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xE900000000000079;
      if (v5 != 0x6464754220534F69) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_235A68F50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_235A4AB40()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_235A4AB88(char a1)
{
  unint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_235A4ABD4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_235A4AC30()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_235A4AC78(char a1)
{
  unint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_235A4ACC4())()
{
  return j__swift_endAccess;
}

uint64_t sub_235A4AD20()
{
  return sub_235A4AE08(&OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage);
}

uint64_t sub_235A4AD2C(uint64_t a1, uint64_t a2)
{
  return sub_235A4AE68(a1, a2, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage);
}

uint64_t (*sub_235A4AD38())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_235A4AD94(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  char v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  void *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235A4ADFC()
{
  return sub_235A4AE08(&OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId);
}

uint64_t sub_235A4AE08(void *a1)
{
  unint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_235A4AE5C(uint64_t a1, uint64_t a2)
{
  return sub_235A4AE68(a1, a2, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId);
}

uint64_t sub_235A4AE68(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_235A4AEC4())()
{
  return j_j__swift_endAccess;
}

void sub_235A4AF20(void **a1, void *a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  uint64_t v4 = *v3;
  unsigned char *v3 = v2;
  id v5 = v2;
}

void *sub_235A4AF84()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_235A4AFD4(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  uint64_t v4 = *v3;
  unsigned char *v3 = a1;
}

uint64_t (*sub_235A4B028())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_235A4B084()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_235A4B0CC(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_235A4B118())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_235A4B174()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_235A4B1BC(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_235A4B208())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_235A4B264()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_235A4B2AC(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_235A4B2F8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_235A4B354()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_235A4B39C(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_235A4B3E8())()
{
  return j_j__swift_endAccess;
}

id AssistantConfiguration.__allocating_init(hasVoiceProfileInCloud:siriEnabled:siriLanguage:siriSharedUserId:siriVoice:recognizeMyVoiceEnabled:voiceTriggerEnabled:siriInCallEnabled:siriDataSharingStatus:systemLanguage:)(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8, char a9, char a10, long long a11, uint64_t a12)
{
  id v19 = objc_allocWithZone(v12);
  id v20 = sub_235A4D3F0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, *((uint64_t *)&a11 + 1), a12);

  return v20;
}

id AssistantConfiguration.init(hasVoiceProfileInCloud:siriEnabled:siriLanguage:siriSharedUserId:siriVoice:recognizeMyVoiceEnabled:voiceTriggerEnabled:siriInCallEnabled:siriDataSharingStatus:systemLanguage:)(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8, char a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id v14 = sub_235A4D3F0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);

  return v14;
}

uint64_t sub_235A4B5CC()
{
  sub_235A68DE0();
  sub_235A68B30();
  swift_beginAccess();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  id v2 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D938);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_beginAccess();
  type metadata accessor for AFSiriDataSharingOptInStatus(0);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  return 0;
}

unint64_t sub_235A4B9F4(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x62616E4569726973;
      break;
    case 2:
      unint64_t result = 0x676E614C69726973;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x63696F5669726973;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_235A4BB1C(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x62616E4569726973;
      break;
    case 2:
      unint64_t result = 0x676E614C69726973;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x63696F5669726973;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_235A4BC44(char *a1, char *a2)
{
  return sub_235A4A6F8(*a1, *a2);
}

uint64_t sub_235A4BC50()
{
  return sub_235A68FC0();
}

uint64_t sub_235A4BC98()
{
  return sub_235A4BCA0();
}

uint64_t sub_235A4BCA0()
{
  sub_235A68B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235A4BDFC()
{
  sub_235A68B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235A4BEDC()
{
  return sub_235A68FC0();
}

uint64_t sub_235A4BF20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_235A4DA54();
  *a1 = result;
  return result;
}

unint64_t sub_235A4BF50@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_235A4B9F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_235A4BF7C()
{
  return sub_235A4BB1C(*v0);
}

uint64_t sub_235A4BF84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_235A4DA54();
  *a1 = result;
  return result;
}

uint64_t sub_235A4BFAC()
{
  return 0;
}

void sub_235A4BFB8(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_235A4BFC4(uint64_t a1)
{
  unint64_t v2 = sub_235A4D878();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_235A4C000(uint64_t a1)
{
  unint64_t v2 = sub_235A4D878();

  return MEMORY[0x270FA00B8](a1, v2);
}

id AssistantConfiguration.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AssistantConfiguration.init(from:)(a1);
}

id AssistantConfiguration.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D940);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v42 = (uint64_t *)v8;
  char v9 = &v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId];
  *(void *)char v9 = 0;
  *((void *)v9 + 1) = 0;
  id v40 = v9;
  id v38 = a1;
  id v39 = (void **)&v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice];
  *id v39 = 0;
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235A4D878();
  uint64_t v41 = v1;
  id v11 = v10;
  sub_235A68FD0();
  if (v2)
  {
    long long v12 = v41;
    long long v13 = v39;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v18 = *v13;

    type metadata accessor for AssistantConfiguration();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v37 = v5;
    char v48 = 0;
    char v14 = sub_235A68EB0();
    long long v16 = v39;
    uint64_t v15 = v40;
    uint64_t v17 = v41;
    v41[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud] = v14 & 1;
    char v48 = 1;
    v17[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled] = sub_235A68EB0() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    char v48 = 2;
    unint64_t v36 = sub_235A4D99C(&qword_26882D950);
    sub_235A68ED0();
    uint64_t v20 = v47;
    uint64_t v35 = v46;
    uint64_t v21 = v42;
    swift_beginAccess();
    *uint64_t v21 = v35;
    v21[1] = v20;
    swift_bridgeObjectRelease();
    LOBYTE(v46) = 3;
    sub_235A68ED0();
    uint64_t v22 = v44;
    unint64_t v23 = v45;
    uint64_t v34 = v4;
    swift_beginAccess();
    *(void *)uint64_t v15 = v22;
    *((void *)v15 + 1) = v23;
    swift_bridgeObjectRelease();
    char v49 = 4;
    sub_235A4D8F0();
    sub_235A68ED0();
    uint64_t v25 = v44;
    unint64_t v24 = v45;
    sub_235A348B8(0, (unint64_t *)&unk_26882D960);
    sub_235A348B8(0, &qword_26882D568);
    uint64_t v26 = sub_235A68C80();
    uint64_t v35 = v25;
    unint64_t v36 = v24;
    swift_beginAccess();
    uint64_t v27 = *v16;
    void *v16 = (void *)v26;

    char v49 = 5;
    v17[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled] = sub_235A68EB0() & 1;
    char v49 = 6;
    char v28 = sub_235A68EB0();
    uint64_t v29 = v35;
    v17[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled] = v28 & 1;
    char v49 = 7;
    v17[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled] = sub_235A68EB0() & 1;
    char v49 = 8;
    uint64_t v30 = sub_235A68EC0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v34);
    sub_235A4D944(v29, v36);
    id v31 = v41;
    *(void *)&v41[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus] = v30;

    id v32 = (objc_class *)type metadata accessor for AssistantConfiguration();
    v43.receiver = v31;
    v43.super_class = v32;
    id v11 = objc_msgSendSuper2(&v43, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  return v11;
}

uint64_t sub_235A4C698(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D970);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235A4D878();
  sub_235A68FE0();
  swift_beginAccess();
  char v31 = 0;
  sub_235A68EE0();
  if (!v2)
  {
    swift_beginAccess();
    char v30 = 1;
    sub_235A68EE0();
    char v9 = (long long *)(v3 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage);
    swift_beginAccess();
    long long v29 = *v9;
    LOBYTE(v28) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A4D99C(&qword_26882D978);
    sub_235A68F00();
    uint64_t v10 = (long long *)(v3 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId);
    swift_beginAccess();
    long long v28 = *v10;
    char v27 = 3;
    sub_235A68F00();
    swift_beginAccess();
    char v27 = 5;
    sub_235A68EE0();
    swift_beginAccess();
    char v26 = 6;
    sub_235A68EE0();
    swift_beginAccess();
    char v25 = 7;
    sub_235A68EE0();
    id v11 = (void **)(v3 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
    swift_beginAccess();
    long long v12 = *v11;
    if (!*v11)
    {
LABEL_6:
      swift_beginAccess();
      char v23 = 8;
      sub_235A68EF0();
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    long long v13 = self;
    v24[0] = 0;
    id v14 = v12;
    id v15 = objc_msgSend(v13, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v14, 0, v24);
    id v16 = v24[0];
    if (v15)
    {
      uint64_t v17 = (void *)sub_235A68860();
      id v19 = v18;

      v24[0] = v17;
      v24[1] = v19;
      char v23 = 4;
      sub_235A4DA00();
      sub_235A68F00();

      sub_235A4D944((uint64_t)v17, (unint64_t)v19);
      goto LABEL_6;
    }
    uint64_t v20 = v16;
    sub_235A68820();

    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t static AssistantConfiguration.supportsSecureCoding.getter()
{
  return byte_26882D8E0;
}

uint64_t static AssistantConfiguration.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26882D8E0 = a1;
  return result;
}

uint64_t (*static AssistantConfiguration.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess;
}

void sub_235A4CD3C(void *a1)
{
  uint64_t v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v4, v5);

  uint64_t v6 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v7, v8);

  uint64_t v9 = v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage;
  swift_beginAccess();
  if (*(void *)(v9 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  uint64_t v12 = v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId;
  swift_beginAccess();
  if (*(void *)(v12 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);
  swift_unknownObjectRelease();

  id v15 = (id *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  id v16 = *v15;
  uint64_t v17 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v16, v17);

  id v18 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled);
  swift_beginAccess();
  uint64_t v19 = *v18;
  uint64_t v20 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v19, v20);

  uint64_t v21 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled);
  swift_beginAccess();
  uint64_t v22 = *v21;
  char v23 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v22, v23);

  unint64_t v24 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled);
  swift_beginAccess();
  uint64_t v25 = *v24;
  char v26 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v25, v26);

  char v27 = (uint64_t *)(v1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus);
  swift_beginAccess();
  uint64_t v28 = *v27;
  long long v29 = (void *)sub_235A68AF0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v28, v29);
}

id AssistantConfiguration.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_235A4DAA0(a1);

  return v4;
}

id AssistantConfiguration.init(coder:)(void *a1)
{
  id v2 = sub_235A4DAA0(a1);

  return v2;
}

id AssistantConfiguration.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AssistantConfiguration.init()()
{
}

id AssistantConfiguration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssistantConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_235A4D378@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for AssistantConfiguration());
  id result = AssistantConfiguration.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_235A4D3CC(void *a1)
{
  return sub_235A4C698(a1);
}

id sub_235A4D3F0(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8, char a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v19 = &v13[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage];
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = &v13[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId];
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v21 = (void **)&v13[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice];
  *(void *)&v13[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice] = 0;
  v13[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud] = a1;
  v13[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled] = a2;
  swift_beginAccess();
  *uint64_t v19 = a3;
  v19[1] = a4;
  uint64_t v22 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *uint64_t v20 = a5;
  v20[1] = a6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  char v23 = *v21;
  *uint64_t v21 = a7;
  id v24 = a7;

  v22[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled] = a8;
  v22[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled] = a9;
  v22[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled] = a10;
  *(void *)&v22[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus] = a11;
  if (a13)
  {
    if (a4)
    {
      swift_bridgeObjectRelease();

LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    char v37 = 0;
    id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F285A0]), sel_init);
    char v26 = (void *)sub_235A68AF0();
    id v27 = objc_msgSend(v25, sel_allSiriLanguageCodesForSystemLanguageCode_isGoodFit_, v26, &v37);

    if (v27)
    {
      uint64_t v28 = (void *)sub_235A68B70();

      if (v28[2])
      {
        uint64_t v30 = v28[4];
        uint64_t v29 = v28[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *uint64_t v19 = v30;
        v19[1] = v29;
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        sub_235A68DE0();
        sub_235A68B30();
        sub_235A68B30();
        swift_bridgeObjectRelease();
        sub_235A68B30();
        sub_235A68B30();
        swift_bridgeObjectRelease();
        if (qword_26882D100 != -1) {
          swift_once();
        }
        uint64_t v31 = sub_235A68920();
        __swift_project_value_buffer(v31, (uint64_t)qword_26882DE48);
        os_log_type_t v32 = sub_235A68C40();
LABEL_15:
        sub_235A65720(v32, 0xD0000000000000B4, 0x8000000235A6DC10, 0, 0xE000000000000000);
        goto LABEL_16;
      }

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    sub_235A68DE0();
    sub_235A68B30();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_235A68920();
    __swift_project_value_buffer(v33, (uint64_t)qword_26882DE48);
    os_log_type_t v32 = sub_235A68C30();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();

LABEL_17:
  uint64_t v34 = (objc_class *)type metadata accessor for AssistantConfiguration();
  v38.receiver = v22;
  v38.super_class = v34;
  return objc_msgSendSuper2(&v38, sel_init);
}

unint64_t sub_235A4D878()
{
  unint64_t result = qword_26882D948;
  if (!qword_26882D948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D948);
  }
  return result;
}

uint64_t type metadata accessor for AssistantConfiguration()
{
  return self;
}

unint64_t sub_235A4D8F0()
{
  unint64_t result = qword_26882D958;
  if (!qword_26882D958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D958);
  }
  return result;
}

uint64_t sub_235A4D944(uint64_t a1, unint64_t a2)
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

uint64_t sub_235A4D99C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26882D930);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235A4DA00()
{
  unint64_t result = qword_26882D980;
  if (!qword_26882D980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D980);
  }
  return result;
}

uint64_t sub_235A4DA54()
{
  unint64_t v0 = sub_235A68EA0();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

id sub_235A4DAA0(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  id v4 = &v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId];
  *(void *)id v4 = 0;
  *((void *)v4 + 1) = 0;
  id v24 = (void **)&v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice];
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice] = 0;
  id v5 = v1;
  uint64_t v6 = (void *)sub_235A68AF0();
  id v30 = objc_msgSend(a1, sel_decodeIntegerForKey_, v6);

  uint64_t v7 = (void *)sub_235A68AF0();
  unsigned __int8 v28 = objc_msgSend(a1, sel_decodeBoolForKey_, v7);

  uint64_t v8 = (void *)sub_235A68AF0();
  unsigned __int8 v26 = objc_msgSend(a1, sel_decodeBoolForKey_, v8);

  uint64_t v9 = (void *)sub_235A68AF0();
  unsigned __int8 v29 = objc_msgSend(a1, sel_decodeBoolForKey_, v9);

  uint64_t v10 = (void *)sub_235A68AF0();
  unsigned __int8 v27 = objc_msgSend(a1, sel_decodeBoolForKey_, v10);

  id v11 = (void *)sub_235A68AF0();
  unsigned __int8 v25 = objc_msgSend(a1, sel_decodeBoolForKey_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DA08);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_235A6A830;
  uint64_t v13 = sub_235A348B8(0, (unint64_t *)&unk_26882DA10);
  *(void *)(v12 + 32) = v13;
  sub_235A68D30();
  swift_bridgeObjectRelease();
  if (v35)
  {
    int v14 = swift_dynamicCast();
    if (v14) {
      uint64_t v15 = v32;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v14) {
      uint64_t v16 = v33;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    sub_235A4EB70((uint64_t)v34);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_235A6A830;
  *(void *)(v17 + 32) = v13;
  sub_235A68D30();
  swift_bridgeObjectRelease();
  if (v35)
  {
    int v18 = swift_dynamicCast();
    if (v18) {
      uint64_t v19 = v32;
    }
    else {
      uint64_t v19 = 0;
    }
    if (v18) {
      uint64_t v20 = v33;
    }
    else {
      uint64_t v20 = 0;
    }
  }
  else
  {
    sub_235A4EB70((uint64_t)v34);
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  sub_235A348B8(0, &qword_26882D568);
  uint64_t v21 = sub_235A68D20();
  v5[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud] = v28;
  v5[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled] = v26;
  swift_beginAccess();
  *(void *)id v3 = v15;
  *((void *)v3 + 1) = v16;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)id v4 = v19;
  *((void *)v4 + 1) = v20;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v22 = *v24;
  *id v24 = (void *)v21;

  v5[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled] = v29;
  v5[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled] = v27;
  v5[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled] = v25;
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus] = v30;

  v31.receiver = v5;
  v31.super_class = (Class)type metadata accessor for AssistantConfiguration();
  return objc_msgSendSuper2(&v31, sel_init);
}

uint64_t sub_235A4DF08@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud, a2);
}

uint64_t sub_235A4DF14(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_hasVoiceProfileInCloud);
}

uint64_t sub_235A4DF20@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled, a2);
}

uint64_t sub_235A4DF2C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriEnabled);
}

uint64_t sub_235A4DF38@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_8Tm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage, a2);
}

uint64_t sub_235A4DF44(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_235A4AD94(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriLanguage);
}

uint64_t sub_235A4DF64@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_8Tm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId, a2);
}

uint64_t keypath_get_8Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  id v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235A4DFC4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_235A4AD94(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriSharedUserId);
}

id sub_235A4DFE4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriVoice);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t sub_235A4E04C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled, a2);
}

uint64_t sub_235A4E058(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_recognizeMyVoiceEnabled);
}

uint64_t sub_235A4E064@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled, a2);
}

uint64_t sub_235A4E070(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_voiceTriggerEnabled);
}

uint64_t sub_235A4E07C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  id v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_235A4E0D8(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriInCallEnabled);
}

uint64_t keypath_setTm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t sub_235A4E130@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_235A4E184(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR____TtC9SiriSetup22AssistantConfiguration_siriDataSharingStatus);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

uint64_t method lookup function for AssistantConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AssistantConfiguration);
}

uint64_t dispatch thunk of AssistantConfiguration.hasVoiceProfileInCloud.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AssistantConfiguration.hasVoiceProfileInCloud.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AssistantConfiguration.hasVoiceProfileInCloud.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriLanguage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriLanguage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriLanguage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriSharedUserId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriSharedUserId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriSharedUserId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriVoice.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriVoice.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriVoice.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AssistantConfiguration.recognizeMyVoiceEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AssistantConfiguration.recognizeMyVoiceEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AssistantConfiguration.recognizeMyVoiceEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AssistantConfiguration.voiceTriggerEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AssistantConfiguration.voiceTriggerEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AssistantConfiguration.voiceTriggerEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriInCallEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriInCallEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriInCallEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriDataSharingStatus.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriDataSharingStatus.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AssistantConfiguration.siriDataSharingStatus.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AssistantConfiguration.__allocating_init(hasVoiceProfileInCloud:siriEnabled:siriLanguage:siriSharedUserId:siriVoice:recognizeMyVoiceEnabled:voiceTriggerEnabled:siriInCallEnabled:siriDataSharingStatus:systemLanguage:)()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of AssistantConfiguration.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of AssistantConfiguration.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AssistantConfiguration.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AssistantConfiguration.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t getEnumTagSinglePayload for AssistantConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AssistantConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x235A4EA30);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssistantConfiguration.CodingKeys()
{
  return &type metadata for AssistantConfiguration.CodingKeys;
}

unint64_t sub_235A4EA6C()
{
  unint64_t result = qword_26882D9F0;
  if (!qword_26882D9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D9F0);
  }
  return result;
}

unint64_t sub_235A4EAC4()
{
  unint64_t result = qword_26882D9F8;
  if (!qword_26882D9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882D9F8);
  }
  return result;
}

unint64_t sub_235A4EB1C()
{
  unint64_t result = qword_26882DA00;
  if (!qword_26882DA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882DA00);
  }
  return result;
}

uint64_t sub_235A4EB70(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882DC70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of SiriSetupCoordinatorDelegate.trainingFinished(enrollmentResult:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SiriSetupCoordinatorDelegate.enrollmentContinued(nextPageType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SiriSetupCoordinatorDelegate.setupFlowCompleted(configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SiriSetupCoordinatorDelegate.dismissalRequested(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

id sub_235A4EC2C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)SRSVTPreferences), sel_init);
  qword_26882DA80 = (uint64_t)result;
  return result;
}

id sub_235A4EC60()
{
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result) {
    qword_26882EE30 = (uint64_t)result;
  }
  else {
    __break(1u);
  }
  return result;
}

void *sub_235A4ECA4(uint64_t a1, uint64_t a2, unsigned __int8 a3, unsigned __int8 a4)
{
  if (a4 == 10)
  {
    BOOL v7 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    if (a3 == 10)
    {
      BOOL v7 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_235A64524(a3);
      swift_bridgeObjectRetain();
      sub_235A68B30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_235A68B30();
      swift_bridgeObjectRelease();
      sub_235A64524(a4);
      swift_bridgeObjectRetain();
      sub_235A68B30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v7 = sub_235A611FC(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v9 = v7[2];
      unint64_t v10 = v7[3];
      unint64_t v11 = v9 + 1;
      if (v9 >= v10 >> 1)
      {
        char v23 = v7;
        unint64_t v24 = v7[2];
        unsigned __int8 v25 = sub_235A611FC((void *)(v10 > 1), v9 + 1, 1, v23);
        unint64_t v9 = v24;
        BOOL v7 = v25;
      }
      v7[2] = v11;
      uint64_t v12 = &v7[2 * v9];
      v12[4] = a1;
      v12[5] = a2;
    }
    swift_bridgeObjectRetain();
    sub_235A68B30();
    sub_235A64524(a4);
    swift_bridgeObjectRetain();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v7 = sub_235A611FC(0, v7[2] + 1, 1, v7);
    }
    unint64_t v14 = v7[2];
    unint64_t v13 = v7[3];
    if (v14 >= v13 >> 1) {
      BOOL v7 = sub_235A611FC((void *)(v13 > 1), v14 + 1, 1, v7);
    }
    v7[2] = v14 + 1;
    uint64_t v15 = &v7[2 * v14];
    v15[4] = a1;
    v15[5] = a2;
  }
  if (a3 != 10)
  {
    sub_235A64524(a3);
    swift_bridgeObjectRetain();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v7 = sub_235A611FC(0, v7[2] + 1, 1, v7);
    }
    unint64_t v17 = v7[2];
    unint64_t v16 = v7[3];
    if (v17 >= v16 >> 1) {
      BOOL v7 = sub_235A611FC((void *)(v16 > 1), v17 + 1, 1, v7);
    }
    v7[2] = v17 + 1;
    int v18 = &v7[2 * v17];
    v18[4] = a1;
    v18[5] = a2;
  }
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    BOOL v7 = sub_235A611FC(0, v7[2] + 1, 1, v7);
  }
  unint64_t v20 = v7[2];
  unint64_t v19 = v7[3];
  if (v20 >= v19 >> 1) {
    BOOL v7 = sub_235A611FC((void *)(v19 > 1), v20 + 1, 1, v7);
  }
  v7[2] = v20 + 1;
  uint64_t v21 = &v7[2 * v20];
  v21[4] = a1;
  v21[5] = a2;
  return v7;
}

uint64_t sub_235A4F020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_235A688C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = (void *)sub_235A68AF0();
  unint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleWithIdentifier_, v10);

  if (!v12) {
    id v12 = objc_msgSend(v11, sel_mainBundle);
  }
  id v13 = objc_msgSend(self, sel_currentLocale);
  sub_235A688B0();

  sub_235A688A0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (qword_26882D0E8 != -1) {
    swift_once();
  }
  id v14 = (id)qword_26882EE30;
  uint64_t v15 = (void *)sub_235A68AF0();
  id v16 = v12;
  unint64_t v17 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v14, sel_localizedStringForKey_gender_table_bundle_languageCode_, v15, a3, 0, v16, v17);

  if (!v18) {
    goto LABEL_9;
  }
  uint64_t v19 = sub_235A68B00();
  uint64_t v21 = v20;

  if (v19 == a1 && v21 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_9:

    return 0;
  }
  char v23 = sub_235A68F50();

  if ((v23 & 1) == 0) {
    return v19;
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_235A4F2CC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, unsigned __int8 a5)
{
  uint64_t v6 = a1;
  uint64_t v7 = sub_235A4ECA4(a1, a2, a4, a5);
  uint64_t v8 = v7[2];
  if (v8)
  {
    unint64_t v9 = v7 + 5;
    while (1)
    {
      uint64_t v10 = *(v9 - 1);
      uint64_t v11 = *v9;
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_235A4F020(v10, v11, a3);
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      if (v14) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    return v12;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    sub_235A68DE0();
    sub_235A68B30();
    sub_235A68B30();
    sub_235A68B30();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_235A68920();
    __swift_project_value_buffer(v15, (uint64_t)qword_26882DE48);
    os_log_type_t v16 = sub_235A68C30();
    sub_235A65720(v16, 0xD00000000000003BLL, 0x8000000235A6DD90, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return v6;
}

uint64_t sub_235A4F48C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, unsigned __int8 a7)
{
  sub_235A4F2CC(a1, a2, a3, a6, a7);
  if (a5)
  {
    if (qword_26882D0E0 != -1) {
      swift_once();
    }
    uint64_t v10 = (void *)qword_26882DA80;
    uint64_t v11 = (void *)sub_235A68AF0();
    id v12 = objc_msgSend(v10, sel_localizedTriggerPhraseForLanguageCode_, v11);

    sub_235A68B00();
    uint64_t v13 = (void *)qword_26882DA80;
    uint64_t v14 = (void *)sub_235A68AF0();
    id v15 = objc_msgSend(v13, sel_localizedCompactTriggerPhraseForLanguageCode_, v14);

    sub_235A68B00();
    sub_235A35654();
    sub_235A68D90();
    swift_bridgeObjectRelease();
    sub_235A68D90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_235A643F8(a6);
  sub_235A35654();
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a7 == 10) {
    char v16 = a6;
  }
  else {
    char v16 = a7;
  }
  sub_235A643F8(v16);
  uint64_t v17 = sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

char *sub_235A4F7D0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v10 = &v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSource];
  *(void *)uint64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  id v12 = &v5[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSourceWriter];
  *(void *)id v12 = a3;
  *((void *)v12 + 1) = a4;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 64);
  id v15 = v5;
  id v16 = a1;
  long long v71 = a3;
  uint64_t v74 = ObjectType;
  id v75 = v16;
  long long v72 = v15;
  v15[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewStyle] = v14(ObjectType, a2);
  if (qword_26882D0F0 != -1) {
    swift_once();
  }
  char v17 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000015, 0x8000000235A6DF30, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v17);
  strcpy((char *)v76, "%DEVICE_NAME%");
  unint64_t v18 = sub_235A35654();
  uint64_t v19 = MEMORY[0x263F8D310];
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v17);
  uint64_t v69 = sub_235A68D90();
  uint64_t v70 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v21 = byte_26882EE38;
  sub_235A4F2CC(0xD000000000000016, 0x8000000235A6DF50, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v21);
  strcpy((char *)v76, "%DEVICE_NAME%");
  uint64_t v22 = sub_235A68D90();
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&v80[0] = v22;
  *((void *)&v80[0] + 1) = v24;
  *(void *)&v76[0] = 0xD000000000000015;
  *((void *)&v76[0] + 1) = 0x8000000235A6BF00;
  unint64_t v77 = sub_235A643F8(v21);
  uint64_t v78 = v25;
  uint64_t v26 = sub_235A68D90();
  uint64_t v68 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 24))(&v86, ObjectType, a2);
  char v28 = byte_26882EE38;
  uint64_t v29 = sub_235A4F2CC(0xD000000000000014, 0x8000000235A6DF70, 0, byte_26882EE38, 0xAu);
  uint64_t v31 = v30;
  sub_235A643F8(v28);
  uint64_t v84 = v29;
  uint64_t v85 = v31;
  strcpy((char *)v80, "%DEVICE_NAME%");
  uint64_t v32 = sub_235A68D90();
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&v80[0] = v32;
  *((void *)&v80[0] + 1) = v34;
  *(void *)&v76[0] = 0xD000000000000015;
  *((void *)&v76[0] + 1) = 0x8000000235A6BF00;
  unint64_t v77 = sub_235A643F8(v28);
  uint64_t v78 = v35;
  uint64_t v36 = sub_235A68D90();
  uint64_t v38 = v37;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v39 = &v72[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel];
  *(_OWORD *)uint64_t v39 = 0u;
  *((void *)v39 + 2) = v69;
  *((void *)v39 + 3) = v70;
  *((void *)v39 + 4) = 0;
  *(_OWORD *)(v39 + 40) = 0u;
  *((void *)v39 + 7) = v26;
  *((void *)v39 + 8) = v68;
  *(_OWORD *)(v39 + 72) = 0u;
  *(_OWORD *)(v39 + 88) = 0u;
  *((void *)v39 + 13) = v36;
  *((void *)v39 + 14) = v38;
  *(_OWORD *)(v39 + 120) = 0u;
  v39[136] = 2;
  *(_DWORD *)(v39 + 137) = *(_DWORD *)v83;
  *((_DWORD *)v39 + 35) = *(_DWORD *)&v83[3];
  *((void *)v39 + 18) = 0;
  *((void *)v39 + 19) = 0;
  *((_WORD *)v39 + 84) = 0;
  *((void *)v39 + 20) = 0;
  *(_DWORD *)(v39 + 170) = v81;
  *((_WORD *)v39 + 87) = v82;
  *((void *)v39 + 22) = 0;
  *((void *)v39 + 23) = 0;
  *(void *)&v72[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_page] = a5;
  uint64_t v40 = *(void *)&v71[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8];
  if (v40)
  {
    uint64_t v41 = &v72[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_languageOption];
    *(void *)uint64_t v41 = *(void *)&v71[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage];
    *((void *)v41 + 1) = v40;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v42 = &OBJC_IVAR___SetupSchemaProvisionalSiriSetupContext__hasStarted;
    objc_super v43 = v75;
    uint64_t v44 = &OBJC_IVAR___SetupSchemaProvisionalSiriSetupContext__hasStarted;
  }
  else
  {
    unint64_t v45 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 72);
    swift_retain();
    objc_super v43 = v75;
    uint64_t v46 = v45(v74, a2);
    if (!v47) {
      uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 80))(v74, a2);
    }
    uint64_t v42 = &OBJC_IVAR___SetupSchemaProvisionalSiriSetupContext__hasStarted;
    uint64_t v44 = &OBJC_IVAR___SetupSchemaProvisionalSiriSetupContext__hasStarted;
    char v48 = (uint64_t *)&v72[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_languageOption];
    *char v48 = v46;
    v48[1] = v47;
  }

  v79.receiver = v72;
  v79.super_class = (Class)type metadata accessor for VoiceSelectionPresenter();
  char v49 = objc_msgSendSuper2(&v79, sel_init, v19, v18, v18, v18);
  id v50 = (long long *)&v49[OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel];
  char v51 = v49[*((void *)v44 + 342)];
  swift_beginAccess();
  long long v52 = *v50;
  long long v53 = v50[1];
  long long v54 = v50[3];
  v80[2] = v50[2];
  v80[3] = v54;
  v80[0] = v52;
  v80[1] = v53;
  long long v55 = v50[4];
  long long v56 = v50[5];
  long long v57 = v50[7];
  v80[6] = v50[6];
  v80[7] = v57;
  v80[4] = v55;
  v80[5] = v56;
  long long v58 = v50[8];
  long long v59 = v50[9];
  long long v60 = v50[11];
  v80[10] = v50[10];
  v80[11] = v60;
  v80[8] = v58;
  v80[9] = v59;
  v76[8] = v50[8];
  v76[9] = v50[9];
  v76[10] = v50[10];
  v76[11] = v50[11];
  v76[4] = v50[4];
  v76[5] = v50[5];
  v76[6] = v50[6];
  v76[7] = v50[7];
  v76[0] = *v50;
  v76[1] = v50[1];
  v76[2] = v50[2];
  v76[3] = v50[3];
  uint64_t v61 = v49;
  sub_235A3557C((uint64_t)v80);
  uint64_t v62 = sub_235A4FEFC(v51, v76);
  uint64_t v64 = v63;

  swift_release();
  sub_235A346CC((uint64_t)v80);
  uint64_t v65 = &v61[*((void *)v42 + 340)];
  long long v66 = *(void **)v65;
  *(void *)uint64_t v65 = v62;
  *((void *)v65 + 1) = v64;

  return v61;
}

char *sub_235A4FEFC(char a1, _OWORD *a2)
{
  long long v3 = a2[9];
  v52[8] = a2[8];
  v52[9] = v3;
  long long v4 = a2[11];
  v52[10] = a2[10];
  v52[11] = v4;
  long long v5 = a2[5];
  void v52[4] = a2[4];
  v52[5] = v5;
  long long v6 = a2[7];
  v52[6] = a2[6];
  v52[7] = v6;
  long long v7 = a2[1];
  v52[0] = *a2;
  v52[1] = v7;
  long long v8 = a2[3];
  v52[2] = a2[2];
  v52[3] = v8;
  if (a1)
  {
    if (a1 == 1)
    {
      *(void *)&long long v39 = 0;
      *((void *)&v39 + 1) = 0xE000000000000000;
      sub_235A68DE0();
      sub_235A68B30();
      char v51 = 1;
      sub_235A68E20();
      sub_235A68B30();
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_235A68920();
      __swift_project_value_buffer(v9, (uint64_t)qword_26882DE48);
      os_log_type_t v10 = sub_235A68C30();
      sub_235A65720(v10, 0xD000000000000030, 0x8000000235A6BEA0, v39, *((unint64_t *)&v39 + 1));
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      long long v18 = a2[9];
      long long v47 = a2[8];
      long long v48 = v18;
      long long v19 = a2[11];
      long long v49 = a2[10];
      long long v50 = v19;
      long long v20 = a2[5];
      long long v43 = a2[4];
      long long v44 = v20;
      long long v21 = a2[7];
      long long v45 = a2[6];
      long long v46 = v21;
      long long v22 = a2[1];
      long long v39 = *a2;
      long long v40 = v22;
      long long v23 = a2[3];
      long long v41 = a2[2];
      long long v42 = v23;
      id v24 = objc_allocWithZone((Class)type metadata accessor for VoiceSelectionProxCardController());
      sub_235A3557C((uint64_t)v52);
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_235A334B8(&v39);
      *(void *)&v11[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_delegate + 8] = &off_26E8ED400;
      swift_unknownObjectWeakAssign();
      uint64_t v25 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSource);
      uint64_t v26 = *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSource + 8);
      uint64_t ObjectType = swift_getObjectType();
      char v28 = *(uint64_t (**)(uint64_t, uint64_t))(v26 + 152);
      id v29 = v25;
      uint64_t v30 = (void *)v28(ObjectType, v26);

      uint64_t v31 = OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection;
      uint64_t v32 = *(void **)&v11[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection];
      *(void *)&v11[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_currentVoiceSelection] = v30;
      id v33 = v30;

      uint64_t v34 = *(void *)&v11[OBJC_IVAR____TtC9SiriSetup32VoiceSelectionProxCardController_voiceOptionsView];
      uint64_t v35 = *(void **)&v11[v31];
      uint64_t v36 = *(void **)(v34 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice);
      *(void *)(v34 + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView_selectedVoice) = v35;
      id v37 = v35;
    }
  }
  else
  {
    long long v12 = a2[9];
    long long v47 = a2[8];
    long long v48 = v12;
    long long v13 = a2[11];
    long long v49 = a2[10];
    long long v50 = v13;
    long long v14 = a2[5];
    long long v43 = a2[4];
    long long v44 = v14;
    long long v15 = a2[7];
    long long v45 = a2[6];
    long long v46 = v15;
    long long v16 = a2[1];
    long long v39 = *a2;
    long long v40 = v16;
    long long v17 = a2[3];
    long long v41 = a2[2];
    long long v42 = v17;
    objc_allocWithZone((Class)type metadata accessor for VoiceSelectionWelcomeController());
    sub_235A3557C((uint64_t)v52);
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_235A3AB70(&v39);
    *(void *)&v11[OBJC_IVAR____TtC9SiriSetup31VoiceSelectionWelcomeController_delegate + 8] = &off_26E8ED400;
    swift_unknownObjectWeakAssign();
  }
  return v11;
}

id sub_235A502A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceSelectionPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceSelectionPresenter()
{
  return self;
}

uint64_t sub_235A503D0@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

uint64_t sub_235A50494(_OWORD *a1)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v6 = v3[11];
  v18[9] = v3[9];
  v18[10] = v5;
  v18[11] = v6;
  long long v7 = v3[5];
  v18[4] = v3[4];
  v18[5] = v7;
  long long v8 = v3[7];
  v18[6] = v3[6];
  v18[7] = v8;
  v18[8] = v4;
  long long v9 = v3[1];
  v18[0] = *v3;
  v18[1] = v9;
  long long v10 = v3[3];
  v18[2] = v3[2];
  v18[3] = v10;
  long long v11 = a1[9];
  v3[8] = a1[8];
  v3[9] = v11;
  long long v12 = a1[11];
  v3[10] = a1[10];
  v3[11] = v12;
  long long v13 = a1[5];
  v3[4] = a1[4];
  v3[5] = v13;
  long long v14 = a1[7];
  v3[6] = a1[6];
  v3[7] = v14;
  long long v15 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v15;
  long long v16 = a1[3];
  v3[2] = a1[2];
  v3[3] = v16;
  return sub_235A346CC((uint64_t)v18);
}

uint64_t (*sub_235A50554())()
{
  return j__swift_endAccess;
}

void *sub_235A505B0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_presentingViewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A505E8(void *a1)
{
  uint64_t v2 = v1;
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  id v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D938);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_235A68920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
  os_log_type_t v6 = sub_235A68C40();
  sub_235A65720(v6, 0xD00000000000001BLL, 0x8000000235A6DEF0, 0xD000000000000016, 0x8000000235A6DF10);
  swift_bridgeObjectRelease();
  if (a1)
  {
    uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_dataSourceWriter);
    long long v8 = *(void **)(v7 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
    *(void *)(v7 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice) = a1;
    id v9 = v4;
  }
  uint64_t result = MEMORY[0x237DECD00](v2 + OBJC_IVAR____TtC9SiriSetup23VoiceSelectionPresenter_delegate);
  if (result)
  {
    uint64_t v11 = swift_retain();
    sub_235A36DAC(v11);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t SiriSetupEnrollmentResult.siriEnabled.getter()
{
  return *v0;
}

uint64_t SiriSetupEnrollmentResult.siriEnabled.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*SiriSetupEnrollmentResult.siriEnabled.modify())()
{
  return nullsub_1;
}

uint64_t getEnumTagSinglePayload for SiriSetupEnrollmentResult(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriSetupEnrollmentResult(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x235A50920);
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

ValueMetadata *type metadata accessor for SiriSetupEnrollmentResult()
{
  return &type metadata for SiriSetupEnrollmentResult;
}

uint64_t sub_235A50958()
{
  return sub_235A68FC0();
}

uint64_t sub_235A50A4C()
{
  return sub_235A68FC0();
}

SiriSetup::SiriSetupEnrollmentMode_optional __swiftcall SiriSetupEnrollmentMode.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_235A68EA0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

unint64_t SiriSetupEnrollmentMode.rawValue.getter()
{
  unint64_t result = 0xD00000000000001ALL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x754220534F63616DLL;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x7453206B63697551;
      break;
    default:
      unint64_t result = 0x6464754220534F69;
      break;
  }
  return result;
}

uint64_t sub_235A50C40(unsigned __int8 *a1, char *a2)
{
  return sub_235A4A990(*a1, *a2);
}

unint64_t sub_235A50C50()
{
  unint64_t result = qword_26882DAC8;
  if (!qword_26882DAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882DAC8);
  }
  return result;
}

uint64_t sub_235A50CA4()
{
  return sub_235A50958();
}

uint64_t sub_235A50CAC()
{
  return sub_235A4BDFC();
}

uint64_t sub_235A50CB4()
{
  return sub_235A50A4C();
}

SiriSetup::SiriSetupEnrollmentMode_optional sub_235A50CBC(Swift::String *a1)
{
  return SiriSetupEnrollmentMode.init(rawValue:)(*a1);
}

unint64_t sub_235A50CC8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SiriSetupEnrollmentMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriSetupEnrollmentMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriSetupEnrollmentMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x235A50E4CLL);
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

ValueMetadata *type metadata accessor for SiriSetupEnrollmentMode()
{
  return &type metadata for SiriSetupEnrollmentMode;
}

char *sub_235A50E84(long long *a1)
{
  long long v2 = a1[9];
  long long v29 = a1[8];
  long long v30 = v2;
  long long v3 = a1[11];
  long long v31 = a1[10];
  long long v32 = v3;
  long long v4 = a1[5];
  long long v25 = a1[4];
  long long v26 = v4;
  long long v5 = a1[7];
  long long v27 = a1[6];
  long long v28 = v5;
  long long v6 = a1[1];
  long long v21 = *a1;
  long long v22 = v6;
  long long v7 = a1[3];
  long long v23 = a1[2];
  long long v24 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView] = 0;
  id v8 = objc_allocWithZone((Class)type metadata accessor for SiriSetupProxCardView());
  id v9 = sub_235A40644(1);
  v20.receiver = v1;
  v20.super_class = (Class)type metadata accessor for SuccessProxCardController();
  long long v10 = (char *)objc_msgSendSuper2(&v20, sel_initWithContentView_, v9);
  uint64_t v11 = (void *)sub_235A68AF0();
  objc_msgSend(v10, sel_setTitle_, v11);

  if (*((void *)&v23 + 1))
  {
    long long v12 = v10;
    swift_bridgeObjectRetain();
    long long v13 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v14 = v10;
    long long v13 = 0;
  }
  objc_msgSend(v10, sel_setSubtitle_, v13);

  objc_msgSend(v10, sel_setDismissalType_, 1);
  long long v15 = *(void **)&v9[OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView];
  long long v16 = *(void **)&v10[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView];
  *(void *)&v10[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_orbView] = v15;
  id v17 = v15;

  v19[8] = v29;
  v19[9] = v30;
  v19[10] = v31;
  v19[11] = v32;
  v19[4] = v25;
  v19[5] = v26;
  v19[6] = v27;
  v19[7] = v28;
  v19[0] = v21;
  v19[1] = v22;
  v19[2] = v23;
  v19[3] = v24;
  sub_235A512B0((uint64_t)v19);

  sub_235A346CC((uint64_t)&v21);
  return v10;
}

void sub_235A51060(void *a1)
{
  long long v2 = v1;
  id v4 = objc_msgSend(v2, sel_actions);
  sub_235A51780();
  unint64_t v5 = sub_235A68B70();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_235A68E50();
    swift_bridgeObjectRelease();
    if (v14)
    {
LABEL_3:
      if ((v5 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x237DEC2A0](0, v5);
      }
      else
      {
        if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_21:
          swift_once();
LABEL_9:
          uint64_t v11 = sub_235A68920();
          __swift_project_value_buffer(v11, (uint64_t)qword_26882DE48);
          os_log_type_t v12 = sub_235A68C40();
          sub_235A65720(v12, 0xD000000000000015, 0x8000000235A6CD80, 0xD000000000000015, 0x8000000235A6D770);
          if (MEMORY[0x237DECD00](&v2[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate]))
          {
            uint64_t v13 = swift_retain();
            sub_235A36DAC(v13);
            swift_unknownObjectRelease();
            swift_release();
          }
          swift_unknownObjectRelease();
          return;
        }
        id v6 = *(id *)(v5 + 32);
      }
      long long v7 = v6;
      swift_bridgeObjectRelease();
      id v8 = a1;
      char v9 = sub_235A68D40();

      if ((v9 & 1) == 0) {
        return;
      }
      uint64_t v10 = MEMORY[0x237DECD00](&v2[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate]);
      if (!v10) {
        return;
      }
      long long v2 = (char *)v10;
      if (qword_26882D100 == -1) {
        goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
  else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }

  swift_bridgeObjectRelease();
}

void sub_235A512B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 && *(void *)(v2 + 16))
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    swift_bridgeObjectRetain();
    id v4 = v1;
    unint64_t v5 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    long long v18 = sub_235A5175C;
    uint64_t v19 = v3;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 1107296256;
    long long v16 = sub_235A6046C;
    id v17 = &block_descriptor_14_0;
    id v6 = _Block_copy(&v14);
    id v7 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v5, 0, v6);

    _Block_release(v6);
    swift_release();
    id v8 = objc_msgSend(v4, sel_addAction_, v7);
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v1;
  id v10 = v1;
  uint64_t v11 = (void *)sub_235A68AF0();
  long long v18 = sub_235A5173C;
  uint64_t v19 = v9;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  long long v16 = sub_235A6046C;
  id v17 = &block_descriptor_6;
  os_log_type_t v12 = _Block_copy(&v14);
  id v13 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v11, 0, v12);

  _Block_release(v12);
  swift_release();
  objc_msgSend(v10, sel_setDismissButtonAction_, v13);
}

uint64_t sub_235A514FC(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x237DECD00](a2 + OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate);
  if (result)
  {
    uint64_t v3 = result;
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_235A68920();
    __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
    os_log_type_t v5 = sub_235A68C40();
    sub_235A65720(v5, 0xD000000000000015, 0x8000000235A6BD70, 0xD000000000000014, 0x8000000235A6DFC0);
    if (MEMORY[0x237DECD00](v3 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate))
    {
      uint64_t v6 = swift_retain();
      sub_235A370C8(v6);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A51660()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuccessProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuccessProxCardController()
{
  return self;
}

uint64_t sub_235A51704()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A5173C(uint64_t a1)
{
  return sub_235A514FC(a1, *(void *)(v1 + 16));
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void sub_235A5175C(void *a1)
{
}

unint64_t sub_235A51780()
{
  unint64_t result = qword_26882D300;
  if (!qword_26882D300)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26882D300);
  }
  return result;
}

uint64_t sub_235A517CC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DCF0);
    uint64_t v2 = sub_235A68E80();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_235A3E400(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_235A3E400(v35, v36);
    sub_235A3E400(v36, &v32);
    uint64_t result = sub_235A68DD0();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_235A3E400(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_235A3E238();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_235A51B8C(_OWORD *a1)
{
  uint64_t v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[9];
  v37[8] = v3[8];
  v37[9] = v4;
  long long v5 = v3[11];
  v37[10] = v3[10];
  v37[11] = v5;
  long long v6 = v3[5];
  v37[4] = v3[4];
  v37[5] = v6;
  long long v7 = v3[7];
  v37[6] = v3[6];
  v37[7] = v7;
  long long v8 = v3[1];
  v37[0] = *v3;
  v37[1] = v8;
  long long v9 = v3[3];
  v37[2] = v3[2];
  v37[3] = v9;
  long long v10 = a1[9];
  v3[8] = a1[8];
  v3[9] = v10;
  long long v11 = a1[11];
  v3[10] = a1[10];
  v3[11] = v11;
  long long v12 = a1[5];
  v3[4] = a1[4];
  v3[5] = v12;
  long long v13 = a1[7];
  v3[6] = a1[6];
  v3[7] = v13;
  long long v14 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v14;
  long long v15 = a1[3];
  v3[2] = a1[2];
  v3[3] = v15;
  uint64_t result = sub_235A346CC((uint64_t)v37);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState))
  {
    uint64_t v17 = v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController;
    uint64_t v18 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController);
    if (v18)
    {
      uint64_t v19 = *(void *)(v17 + 8);
      uint64_t ObjectType = swift_getObjectType();
      v35[5] = v18;
      long long v21 = v3[9];
      v36[8] = v3[8];
      v36[9] = v21;
      long long v22 = v3[11];
      v36[10] = v3[10];
      v36[11] = v22;
      long long v23 = v3[5];
      v36[4] = v3[4];
      v36[5] = v23;
      long long v24 = v3[7];
      v36[6] = v3[6];
      v36[7] = v24;
      long long v25 = v3[1];
      v36[0] = *v3;
      v36[1] = v25;
      long long v26 = v3[3];
      _OWORD v36[2] = v3[2];
      v36[3] = v26;
      v35[3] = &type metadata for ViewModel;
      v35[4] = &off_26E8ECE80;
      uint64_t v27 = (_OWORD *)swift_allocObject();
      v35[0] = v27;
      long long v28 = v3[9];
      v27[9] = v3[8];
      v27[10] = v28;
      long long v29 = v3[11];
      v27[11] = v3[10];
      v27[12] = v29;
      long long v30 = v3[5];
      v27[5] = v3[4];
      v27[6] = v30;
      long long v31 = v3[7];
      v27[7] = v3[6];
      v27[8] = v31;
      long long v32 = v3[1];
      v27[1] = *v3;
      _OWORD v27[2] = v32;
      long long v33 = v3[3];
      v27[3] = v3[2];
      v27[4] = v33;
      uint64_t v34 = *(void (**)(void *, void, uint64_t, uint64_t))(v19 + 16);
      sub_235A3557C((uint64_t)v36);
      v34(v35, 0, ObjectType, v19);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    }
  }
  return result;
}

void (*sub_235A51D48(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x100uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel;
  v3[30] = v1;
  v3[31] = v4;
  swift_beginAccess();
  return sub_235A51DB4;
}

void sub_235A51DB4(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[30];
    if (*(unsigned char *)(v4 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState))
    {
      uint64_t v5 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController);
      if (v5)
      {
        long long v6 = (long long *)(v4 + v3[31]);
        uint64_t v7 = *(void *)(v4 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
        uint64_t ObjectType = swift_getObjectType();
        v3[29] = v5;
        long long v9 = *v6;
        long long v10 = v6[1];
        long long v11 = v6[3];
        *((_OWORD *)v3 + 2) = v6[2];
        *((_OWORD *)v3 + 3) = v11;
        *(_OWORD *)uint64_t v3 = v9;
        *((_OWORD *)v3 + 1) = v10;
        long long v12 = v6[4];
        long long v13 = v6[5];
        long long v14 = v6[7];
        *((_OWORD *)v3 + 6) = v6[6];
        *((_OWORD *)v3 + 7) = v14;
        *((_OWORD *)v3 + 4) = v12;
        *((_OWORD *)v3 + 5) = v13;
        long long v15 = v6[8];
        long long v16 = v6[9];
        long long v17 = v6[11];
        *((_OWORD *)v3 + 10) = v6[10];
        *((_OWORD *)v3 + 11) = v17;
        *((_OWORD *)v3 + 8) = v15;
        *((_OWORD *)v3 + 9) = v16;
        v3[27] = &type metadata for ViewModel;
        v3[28] = &off_26E8ECE80;
        uint64_t v18 = (_OWORD *)swift_allocObject();
        v3[24] = v18;
        long long v19 = v6[3];
        long long v21 = *v6;
        long long v20 = v6[1];
        v18[3] = v6[2];
        v18[4] = v19;
        v18[1] = v21;
        v18[2] = v20;
        long long v22 = v6[7];
        long long v24 = v6[4];
        long long v23 = v6[5];
        v18[7] = v6[6];
        v18[8] = v22;
        v18[5] = v24;
        v18[6] = v23;
        long long v25 = v6[11];
        long long v27 = v6[8];
        long long v26 = v6[9];
        v18[11] = v6[10];
        _OWORD v18[12] = v25;
        v18[9] = v27;
        v18[10] = v26;
        long long v28 = *(void (**)(void *, void, uint64_t, uint64_t))(v7 + 16);
        sub_235A3557C((uint64_t)v3);
        v28(v3 + 24, 0, ObjectType, v7);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)(v3 + 24));
      }
    }
  }

  free(v3);
}

char *sub_235A51F1C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  long long v8 = v7;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isExpressTraining] = 0;
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_preEnrollmentVoiceTriggerState] = 0;
  long long v14 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController];
  v14[1] = 0;
  v14[2] = 0;
  *long long v14 = 0;
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_AVVCRetryCount] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_badMicRetryCount] = 0;
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isCanceled] = 0;
  long long v15 = (void **)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager];
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager] = 0;
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator] = 0;
  v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_lastPlayedTryAgain] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_page] = a7;
  long long v16 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource];
  void *v16 = a1;
  v16[1] = a2;
  long long v17 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSourceWriter];
  *long long v17 = a3;
  v17[1] = a4;
  uint64_t v18 = &v8[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0xE000000000000000;
  *((_OWORD *)v18 + 2) = 0u;
  *((_OWORD *)v18 + 3) = 0u;
  *((_OWORD *)v18 + 4) = 0u;
  *((_OWORD *)v18 + 5) = 0u;
  *((_OWORD *)v18 + 6) = 0u;
  *((_OWORD *)v18 + 7) = 0u;
  *((void *)v18 + 16) = 0;
  v18[136] = 2;
  *((void *)v18 + 19) = 0;
  *((void *)v18 + 20) = 0;
  *((void *)v18 + 18) = 0;
  *((_WORD *)v18 + 84) = 0;
  *((void *)v18 + 22) = 0;
  *((void *)v18 + 23) = 0;
  uint64_t v19 = swift_getObjectType();
  long long v20 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 64);
  long long v21 = v8;
  swift_retain();
  id v22 = a1;
  id v23 = a3;
  v21[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewStyle] = v20(v19, a2);
  if (a6 && (self, (uint64_t v24 = swift_dynamicCastObjCClass()) != 0))
  {
    id v25 = (id)v24;
    id v26 = a6;
  }
  else
  {
    id v25 = objc_msgSend(objc_allocWithZone((Class)SRSVoiceProfileManager), sel_init);
  }
  swift_beginAccess();
  long long v27 = *v15;
  *long long v15 = v25;

  v42.receiver = v21;
  v42.super_class = ObjectType;
  long long v28 = objc_msgSendSuper2(&v42, sel_init);
  char v29 = v28[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewStyle];
  long long v30 = v28;
  long long v31 = sub_235A521F0(v29);
  long long v33 = v32;
  uint64_t v35 = v34;

  swift_release();
  uint64_t v36 = (char **)&v30[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController];
  id v37 = *(void **)&v30[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController];
  *uint64_t v36 = v31;
  v36[1] = v33;
  _OWORD v36[2] = v35;

  return v30;
}

char *sub_235A521F0(char a1)
{
  sub_235A527A4((uint64_t)&v47);
  sub_235A51B8C(&v47);
  if (a1)
  {
    if (a1 == 1)
    {
      return 0;
    }
    else
    {
      uint64_t v19 = (long long *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
      swift_beginAccess();
      long long v20 = v19[9];
      long long v21 = v19[7];
      long long v55 = v19[8];
      long long v56 = v20;
      long long v22 = v19[9];
      long long v23 = v19[11];
      long long v57 = v19[10];
      long long v58 = v23;
      long long v24 = v19[5];
      long long v25 = v19[3];
      long long v51 = v19[4];
      long long v52 = v24;
      long long v26 = v19[5];
      long long v27 = v19[7];
      long long v53 = v19[6];
      long long v54 = v27;
      long long v28 = v19[1];
      long long v47 = *v19;
      long long v48 = v28;
      long long v29 = v19[3];
      long long v31 = *v19;
      long long v30 = v19[1];
      long long v49 = v19[2];
      long long v50 = v29;
      long long v43 = v55;
      long long v44 = v22;
      long long v32 = v19[11];
      long long v45 = v57;
      long long v46 = v32;
      long long v39 = v51;
      long long v40 = v26;
      long long v41 = v53;
      long long v42 = v21;
      long long v35 = v31;
      long long v36 = v30;
      long long v37 = v49;
      long long v38 = v25;
      id v33 = objc_allocWithZone((Class)type metadata accessor for VoiceTrainingProxController());
      sub_235A3557C((uint64_t)&v47);
      uint64_t v3 = (char *)sub_235A41B2C(&v35);
      *(void *)&v3[OBJC_IVAR____TtC9SiriSetup27VoiceTrainingProxController_delegate + 8] = &off_26E8ED640;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    uint64_t v4 = (long long *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
    swift_beginAccess();
    long long v5 = v4[9];
    long long v6 = v4[7];
    long long v55 = v4[8];
    long long v56 = v5;
    long long v7 = v4[9];
    long long v8 = v4[11];
    long long v57 = v4[10];
    long long v58 = v8;
    long long v9 = v4[5];
    long long v10 = v4[3];
    long long v51 = v4[4];
    long long v52 = v9;
    long long v11 = v4[5];
    long long v12 = v4[7];
    long long v53 = v4[6];
    long long v54 = v12;
    long long v13 = v4[1];
    long long v47 = *v4;
    long long v48 = v13;
    long long v14 = v4[3];
    long long v16 = *v4;
    long long v15 = v4[1];
    long long v49 = v4[2];
    long long v50 = v14;
    long long v43 = v55;
    long long v44 = v7;
    long long v17 = v4[11];
    long long v45 = v57;
    long long v46 = v17;
    long long v39 = v51;
    long long v40 = v11;
    long long v41 = v53;
    long long v42 = v6;
    long long v35 = v16;
    long long v36 = v15;
    long long v37 = v49;
    long long v38 = v10;
    id v18 = objc_allocWithZone((Class)type metadata accessor for VoiceTrainingWelcomeController());
    sub_235A3557C((uint64_t)&v47);
    uint64_t v3 = sub_235A47538(&v35);
    *(void *)&v3[OBJC_IVAR____TtC9SiriSetup30VoiceTrainingWelcomeController_delegate + 8] = &off_26E8ED640;
    swift_unknownObjectWeakAssign();
  }
  return v3;
}

uint64_t sub_235A52414()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_235A52434, 0, 0);
}

uint64_t sub_235A52434()
{
  uint64_t v1 = *(void *)(v0 + 16) + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource;
  uint64_t v3 = *(void **)v1;
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t ObjectType = swift_getObjectType();
  long long v5 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v6 = v3;
  v5(ObjectType, v2);

  swift_bridgeObjectRetain();
  sub_235A68DE0();
  sub_235A68B30();
  long long v7 = *(void **)v1;
  uint64_t v8 = *(void *)(v1 + 8);
  uint64_t v9 = swift_getObjectType();
  long long v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  id v11 = v7;
  v10(v9, v8);

  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_bridgeObjectRetain();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v12 = *(void *)(v0 + 16);
  uint64_t v13 = sub_235A68920();
  __swift_project_value_buffer(v13, (uint64_t)qword_26882DE48);
  os_log_type_t v14 = sub_235A68C40();
  sub_235A65720(v14, 0xD000000000000015, 0x8000000235A6E610, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  uint64_t v15 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
  id v16 = *(id *)(v12 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
  if (v16)
  {
    id v17 = v16;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v18 = *(void **)v1;
    uint64_t v19 = *(void *)(v1 + 8);
    uint64_t v20 = swift_getObjectType();
    long long v21 = *(void (**)(uint64_t, uint64_t))(v19 + 72);
    id v22 = v18;
    v21(v20, v19);

    id v23 = objc_allocWithZone((Class)SRSVoiceTrainingManager);
    long long v24 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    long long v25 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v23, sel_initWithLanguageCode_withSharedUserId_, v24, v25);
  }
  long long v26 = *(void **)(v12 + v15);
  *(void *)(v12 + v15) = v16;

  long long v27 = *(void **)(v12 + v15);
  if (v27)
  {
    uint64_t v28 = *(void *)(v0 + 16);
    id v29 = v27;
    objc_msgSend(v29, sel_setDelegate_, v28);
  }
  swift_bridgeObjectRelease();
  long long v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

double sub_235A527A4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t ObjectType = swift_getObjectType();
  long long v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 72);
  id v8 = v4;
  uint64_t v9 = v7(ObjectType, v5);
  uint64_t v11 = v10;

  if (qword_26882D0F0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_235A4F48C(0xD000000000000012, 0x8000000235A6E400, 0, v9, v11, byte_26882EE38, 0xAu);
  uint64_t v30 = v13;
  uint64_t v31 = v12;
  swift_bridgeObjectRelease();
  os_log_type_t v14 = *(void **)v3;
  uint64_t v15 = *(void *)(v3 + 8);
  uint64_t v16 = swift_getObjectType();
  id v17 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 72);
  id v18 = v14;
  uint64_t v19 = v17(v16, v15);
  uint64_t v21 = v20;

  uint64_t v29 = sub_235A4F48C(0xD00000000000001FLL, 0x8000000235A6E630, 0, v19, v21, byte_26882EE38, 0xAu);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  char v24 = byte_26882EE38;
  sub_235A4F2CC(0x52545F4543494F56, 0xEF5F474E494E4941, 0, byte_26882EE38, 0xAu);
  sub_235A643F8(v24);
  sub_235A35654();
  sub_235A68D90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235A643F8(v24);
  uint64_t v25 = sub_235A68D90();
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v31;
  *(void *)(a1 + 24) = v30;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v29;
  *(void *)(a1 + 64) = v23;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v25;
  *(void *)(a1 + 96) = v27;
  double result = 0.0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(unsigned char *)(a1 + 136) = 2;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(_WORD *)(a1 + 168) = 0;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = 0;
  return result;
}

uint64_t sub_235A52B64(char a1)
{
  switch(a1)
  {
    case 2:
      uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
      uint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 72);
      id v17 = v13;
      uint64_t v7 = v16(ObjectType, v14);
      uint64_t v9 = v18;

      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      uint64_t v10 = 0xD000000000000012;
      char v11 = byte_26882EE38;
      uint64_t v12 = "TRAINING_TITLE_TWO";
      goto LABEL_20;
    case 3:
      uint64_t v19 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
      uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
      uint64_t v21 = swift_getObjectType();
      uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 72);
      id v23 = v19;
      uint64_t v7 = v22(v21, v20);
      uint64_t v9 = v24;

      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      uint64_t v25 = (unsigned char *)&unk_26882E000;
      uint64_t v10 = 0xD000000000000014;
      goto LABEL_19;
    case 4:
      uint64_t v26 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
      uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
      uint64_t v28 = swift_getObjectType();
      uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v27 + 72);
      id v30 = v26;
      uint64_t v7 = v29(v28, v27);
      uint64_t v9 = v31;

      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      char v11 = byte_26882EE38;
      uint64_t v32 = "TRAINING_TITLE_FOUR";
      goto LABEL_24;
    case 5:
      id v33 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
      uint64_t v34 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
      uint64_t v35 = swift_getObjectType();
      long long v36 = *(uint64_t (**)(uint64_t, uint64_t))(v34 + 72);
      id v37 = v33;
      uint64_t v7 = v36(v35, v34);
      uint64_t v9 = v38;

      uint64_t v39 = qword_26882D0F0;
      goto LABEL_21;
    case 6:
      int v40 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isExpressTraining);
      long long v41 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
      uint64_t v42 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
      uint64_t v43 = swift_getObjectType();
      long long v44 = *(uint64_t (**)(uint64_t, uint64_t))(v42 + 72);
      id v45 = v41;
      uint64_t v7 = v44(v43, v42);
      uint64_t v9 = v46;

      uint64_t v39 = qword_26882D0F0;
      if (v40 == 1)
      {
        if (qword_26882D0F0 != -1) {
          swift_once();
        }
        uint64_t v25 = &unk_26882E000;
        uint64_t v10 = 0xD000000000000014;
LABEL_19:
        char v11 = v25[3640];
        uint64_t v12 = "TRAINING_TITLE_THREE";
LABEL_20:
        unint64_t v47 = (unint64_t)(v12 - 32) | 0x8000000000000000;
      }
      else
      {
LABEL_21:
        if (v39 != -1) {
          swift_once();
        }
        char v11 = byte_26882EE38;
        uint64_t v32 = "TRAINING_TITLE_FIVE";
LABEL_24:
        unint64_t v47 = (unint64_t)(v32 - 32) | 0x8000000000000000;
        uint64_t v10 = 0xD000000000000013;
      }
      uint64_t v48 = sub_235A4F48C(v10, v47, 0, v7, v9, v11, 0xAu);
      swift_bridgeObjectRelease();
      return v48;
    default:
      uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
      uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
      uint64_t v4 = swift_getObjectType();
      uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 72);
      id v6 = v2;
      uint64_t v7 = v5(v4, v3);
      uint64_t v9 = v8;

      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      uint64_t v10 = 0xD000000000000012;
      char v11 = byte_26882EE38;
      uint64_t v12 = "TRAINING_TITLE_ONE";
      goto LABEL_20;
  }
}

uint64_t sub_235A52FD4(char a1)
{
  uint64_t v3 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isExpressTraining;
  sub_235A68B30();
  swift_bridgeObjectRelease();
  switch(a1)
  {
    case 4:
      swift_bridgeObjectRelease();
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      char v6 = byte_26882EE38;
      uint64_t v7 = "VOICE_TRAINING_NAV_TITLE_FOUR";
      goto LABEL_11;
    case 5:
      swift_bridgeObjectRelease();
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      char v6 = byte_26882EE38;
      uint64_t v7 = "VOICE_TRAINING_NAV_TITLE_FIVE";
LABEL_11:
      sub_235A4F2CC(0xD00000000000001DLL, (unint64_t)(v7 - 32) | 0x8000000000000000, 0, v6, 0xAu);
      sub_235A643F8(v6);
      sub_235A35654();
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v6);
      uint64_t v5 = sub_235A68D90();
      swift_bridgeObjectRelease();
      break;
    case 6:
      if (*(unsigned char *)(v1 + v3) == 1)
      {
        swift_bridgeObjectRetain();
        sub_235A68B30();
        swift_bridgeObjectRelease();
        if (qword_26882D0F0 != -1) {
          swift_once();
        }
        char v8 = byte_26882EE38;
        sub_235A4F2CC(0x52545F4543494F56, 0xEF5F474E494E4941, 0, byte_26882EE38, 0xAu);
        sub_235A643F8(v8);
        sub_235A35654();
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_235A643F8(v8);
        uint64_t v5 = sub_235A68D90();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        if (qword_26882D0F0 != -1) {
          swift_once();
        }
        char v9 = byte_26882EE38;
        sub_235A4F2CC(0xD00000000000001DLL, 0x8000000235A6E340, 0, byte_26882EE38, 0xAu);
        sub_235A643F8(v9);
        sub_235A35654();
        sub_235A68D90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_235A643F8(v9);
        uint64_t v5 = sub_235A68D90();
      }
      swift_bridgeObjectRelease();
      break;
    default:
      swift_bridgeObjectRetain();
      sub_235A68B30();
      swift_bridgeObjectRelease();
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      char v4 = byte_26882EE38;
      sub_235A4F2CC(0x52545F4543494F56, 0xEF5F474E494E4941, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v4);
      sub_235A35654();
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v4);
      uint64_t v5 = sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
  }
  swift_bridgeObjectRelease();
  return v5;
}

id sub_235A537A8()
{
  id v1 = objc_msgSend(self, sel_currentCoordinator);
  if (!v1) {
    id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6CF70]), sel_initWithDelegate_, v0);
  }
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
  *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator) = v1;

  id result = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
  if (result)
  {
    return objc_msgSend(result, sel_setupEnabled_, 1);
  }
  return result;
}

uint64_t sub_235A53854(char a1)
{
  *(void *)(v2 + 208) = v1;
  *(unsigned char *)(v2 + 138) = a1;
  return MEMORY[0x270FA2498](sub_235A53878, 0, 0);
}

uint64_t sub_235A53878()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isCanceled;
  *(void *)(v0 + 216) = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isCanceled;
  if ((*(unsigned char *)(v1 + v2) & 1) == 0)
  {
    if (*(unsigned char *)(v0 + 138))
    {
      uint64_t v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState);
      if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_lastPlayedTryAgain) != v3)
      {
        *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_lastPlayedTryAgain) = v3;
        char v4 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
        if (v4)
        {
          if (v3 >= 3) {
            uint64_t v3 = 3;
          }
          objc_msgSend(v4, sel_playSoundsEffect_, v3 - 2);
        }
      }
    }
    else
    {
      uint64_t v5 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState;
      *(unsigned char *)(v1 + v5) = sub_235A5B3E0(*(unsigned __int8 *)(v1+ OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isExpressTraining), *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState));
    }
    uint64_t v6 = *(void *)(v0 + 208);
    *(void *)(v0 + 144) = 0;
    *(void *)(v0 + 152) = 0xE000000000000000;
    uint64_t v7 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState;
    *(void *)(v0 + 224) = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState;
    *(unsigned char *)(v0 + 137) = *(unsigned char *)(v6 + v7);
    sub_235A68E20();
    sub_235A68B30();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v0 + 144);
    unint64_t v8 = *(void *)(v0 + 152);
    if (qword_26882D100 != -1) {
      swift_once();
    }
    char v10 = *(unsigned char *)(v0 + 138);
    uint64_t v11 = sub_235A68920();
    *(void *)(v0 + 232) = __swift_project_value_buffer(v11, (uint64_t)qword_26882DE48);
    os_log_type_t v12 = sub_235A68C40();
    sub_235A65720(v12, 0xD000000000000025, 0x8000000235A6E420, v9, v8);
    swift_bridgeObjectRelease();
    sub_235A54998(*(unsigned char *)(v6 + v7), v10);
    int v13 = *(unsigned __int8 *)(v6 + v7);
    if (v13 == 6)
    {
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 240) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_235A53F60;
      v14[2] = *(void *)(v0 + 208);
      uint64_t v15 = sub_235A54C54;
LABEL_14:
      return MEMORY[0x270FA2498](v15, 0, 0);
    }
    if ((*(unsigned char *)(v1 + v2) & 1) == 0)
    {
      uint64_t v16 = *(void *)(v0 + 208);
      uint64_t v17 = sub_235A52B64(*(unsigned char *)(v6 + v7));
      sub_235A58E74(v13, v17, v18);
      swift_bridgeObjectRelease();
      uint64_t v20 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController;
      *(void *)(v0 + 248) = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController;
      uint64_t v21 = (uint64_t *)(v16 + v20);
      uint64_t v22 = *v21;
      if (*v21)
      {
        uint64_t v23 = v21[2];
        uint64_t ObjectType = swift_getObjectType();
        *(void *)(v0 + 176) = v22;
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(ObjectType, v23);
      }
      uint64_t v25 = *(void *)(v0 + 208);
      uint64_t v26 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator;
      *(void *)(v0 + 256) = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator;
      uint64_t v27 = *(void **)(v25 + v26);
      if (v27)
      {
        LODWORD(v19) = 20.0;
        objc_msgSend(v27, sel_startAdvertisingForPHSSetupAfterDelay_maxInterval_, 0.0, v19);
        uint64_t v25 = *(void *)(v0 + 208);
      }
      uint64_t v28 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
      *(void *)(v0 + 264) = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
      uint64_t v29 = *(void **)(v25 + v28);
      if (v29)
      {
        objc_msgSend(v29, sel_startRMS);
        id v30 = *(void **)(v25 + v28);
        *(void *)(v0 + 272) = v30;
        if (v30)
        {
          uint64_t v31 = *(unsigned __int8 *)(v6 + v7);
          *(void *)(v0 + 16) = v0;
          *(void *)(v0 + 56) = v0 + 120;
          *(void *)(v0 + 24) = sub_235A54054;
          uint64_t v32 = swift_continuation_init();
          *(void *)(v0 + 80) = MEMORY[0x263EF8330];
          *(void *)(v0 + 88) = 0x40000000;
          *(void *)(v0 + 96) = sub_235A550EC;
          *(void *)(v0 + 104) = &block_descriptor_53;
          *(void *)(v0 + 112) = v32;
          objc_msgSend(v30, sel_trainUtterance_shouldUseASR_completion_, v31, 1, v0 + 80);
          return MEMORY[0x270FA23F0](v0 + 16);
        }
        uint64_t v25 = *(void *)(v0 + 208);
      }
      if ((*(unsigned char *)(v25 + *(void *)(v0 + 216)) & 1) == 0)
      {
        uint64_t v34 = *(void *)(v0 + 256);
        sub_235A68DE0();
        *(void *)(v0 + 160) = 0;
        *(void *)(v0 + 168) = 0xE000000000000000;
        sub_235A68B30();
        sub_235A68B30();
        swift_bridgeObjectRelease();
        sub_235A68B30();
        *(void *)(v0 + 184) = 3;
        type metadata accessor for SRSTrainingManagerSessionStatus(0);
        sub_235A68E20();
        sub_235A68B30();
        *(void *)(v0 + 192) = 0;
        sub_235A68F10();
        sub_235A68B30();
        swift_bridgeObjectRelease();
        uint64_t v35 = *(void *)(v0 + 160);
        unint64_t v36 = *(void *)(v0 + 168);
        os_log_type_t v37 = sub_235A68C40();
        sub_235A65720(v37, 0xD000000000000025, 0x8000000235A6E420, v35, v36);
        swift_bridgeObjectRelease();
        *(void *)(v25 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId) = 0;
        uint64_t v39 = *(void **)(v25 + v34);
        if (v39)
        {
          LODWORD(v38) = 0.5;
          objc_msgSend(v39, sel_endAdvertisingAfterDelay_, v38);
        }
        uint64_t v40 = *(void *)(v0 + 208);
        long long v41 = *(void **)(v40 + *(void *)(v0 + 264));
        if (v41)
        {
          objc_msgSend(v41, sel_stopRMS);
          uint64_t v40 = *(void *)(v0 + 208);
        }
        uint64_t v42 = (uint64_t *)(v40 + *(void *)(v0 + 248));
        uint64_t v43 = *v42;
        if (*v42)
        {
          uint64_t v44 = v42[2];
          uint64_t v45 = swift_getObjectType();
          *(void *)(v0 + 200) = v43;
          (*(void (**)(uint64_t, uint64_t))(v44 + 16))(v45, v44);
          uint64_t v40 = *(void *)(v0 + 208);
        }
        char v46 = *(unsigned char *)(v40 + *(void *)(v0 + 224));
        uint64_t v47 = sub_235A52B64(v46);
        uint64_t v49 = v48;
        *(void *)(v0 + 280) = v48;
        uint64_t v50 = swift_task_alloc();
        *(void *)(v0 + 288) = v50;
        *(void *)uint64_t v50 = v0;
        *(void *)(v50 + 8) = sub_235A5446C;
        uint64_t v51 = *(void *)(v0 + 208);
        *(void *)(v50 + 72) = v49;
        *(void *)(v50 + 80) = v51;
        *(unsigned char *)(v50 + 113) = v46;
        *(void *)(v50 + 56) = 3;
        *(void *)(v50 + 64) = v47;
        uint64_t v15 = sub_235A59038;
        goto LABEL_14;
      }
    }
  }
  id v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_235A53F60()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A54054()
{
  return MEMORY[0x270FA2498](sub_235A54134, 0, 0);
}

uint64_t sub_235A54134()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);

  uint64_t v3 = *(void *)(v0 + 208);
  if (*(unsigned char *)(v3 + *(void *)(v0 + 216)))
  {
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 256);
    sub_235A68DE0();
    *(void *)(v0 + 160) = 0;
    *(void *)(v0 + 168) = 0xE000000000000000;
    sub_235A68B30();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    *(void *)(v0 + 184) = v1;
    type metadata accessor for SRSTrainingManagerSessionStatus(0);
    sub_235A68E20();
    sub_235A68B30();
    *(void *)(v0 + 192) = v2;
    sub_235A68F10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v0 + 160);
    unint64_t v8 = *(void *)(v0 + 168);
    os_log_type_t v9 = sub_235A68C40();
    sub_235A65720(v9, 0xD000000000000025, 0x8000000235A6E420, v7, v8);
    swift_bridgeObjectRelease();
    *(void *)(v3 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId) = v2;
    uint64_t v11 = *(void **)(v3 + v6);
    if (v11)
    {
      LODWORD(v10) = 0.5;
      objc_msgSend(v11, sel_endAdvertisingAfterDelay_, v10);
    }
    uint64_t v12 = *(void *)(v0 + 208);
    int v13 = *(void **)(v12 + *(void *)(v0 + 264));
    if (v13)
    {
      objc_msgSend(v13, sel_stopRMS);
      uint64_t v12 = *(void *)(v0 + 208);
    }
    uint64_t v14 = (uint64_t *)(v12 + *(void *)(v0 + 248));
    uint64_t v15 = *v14;
    if (*v14)
    {
      uint64_t v16 = v14[2];
      uint64_t ObjectType = swift_getObjectType();
      *(void *)(v0 + 200) = v15;
      (*(void (**)(uint64_t, uint64_t))(v16 + 16))(ObjectType, v16);
      uint64_t v12 = *(void *)(v0 + 208);
    }
    char v18 = *(unsigned char *)(v12 + *(void *)(v0 + 224));
    uint64_t v19 = sub_235A52B64(v18);
    uint64_t v21 = v20;
    *(void *)(v0 + 280) = v20;
    uint64_t v22 = swift_task_alloc();
    *(void *)(v0 + 288) = v22;
    *(void *)uint64_t v22 = v0;
    *(void *)(v22 + 8) = sub_235A5446C;
    uint64_t v23 = *(void *)(v0 + 208);
    *(void *)(v22 + 72) = v21;
    *(void *)(v22 + 80) = v23;
    *(unsigned char *)(v22 + 113) = v18;
    *(void *)(v22 + 56) = v1;
    *(void *)(v22 + 64) = v19;
    return MEMORY[0x270FA2498](sub_235A59038, 0, 0);
  }
}

uint64_t sub_235A5446C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A5457C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  v5[2] = sub_235A68BF0();
  v5[3] = sub_235A68BE0();
  uint64_t v8 = swift_task_alloc();
  v5[4] = v8;
  *(void *)uint64_t v8 = v5;
  *(void *)(v8 + 8) = sub_235A54650;
  *(void *)(v8 + 208) = a4;
  *(unsigned char *)(v8 + 138) = a5;
  return MEMORY[0x270FA2498](sub_235A53878, 0, 0);
}

uint64_t sub_235A54650()
{
  swift_task_dealloc();
  uint64_t v1 = sub_235A68BC0();
  return MEMORY[0x270FA2498](sub_235A5478C, v1, v0);
}

uint64_t sub_235A5478C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_235A547EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_235A68C10();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235A68C00();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_235A58AC0(a1, &qword_26882D708);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235A68BC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_235A54998(char a1, char a2)
{
  uint64_t v5 = sub_235A68A20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_235A68A50();
  uint64_t v9 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A348B8(0, (unint64_t *)&qword_26882DC80);
  uint64_t v12 = (void *)sub_235A68CD0();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = v2;
  *(unsigned char *)(v13 + 32) = a2;
  aBlock[4] = sub_235A58C04;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_40;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v2;
  swift_release();
  sub_235A68A30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_235A38320();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A38378();
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_235A54C34()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_235A54C54, 0, 0);
}

uint64_t sub_235A54C54()
{
  void (*v7)(uint64_t *__return_ptr, uint64_t, uint64_t);
  id v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v14 = v0;
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235A68920();
  __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
  os_log_type_t v2 = sub_235A68C40();
  sub_235A65720(v2, 0xD000000000000013, 0x8000000235A6E480, 0xD000000000000018, 0x8000000235A6E4A0);
  if (qword_26882D0D0 != -1) {
    swift_once();
  }
  if (qword_26882D850) {
    objc_msgSend((id)qword_26882D850, sel_logEventWithType_context_, 3303, 0);
  }
  uint64_t v3 = *(void *)(v0 + 16) + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource;
  uint64_t v5 = *(void **)v3;
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 24);
  uint64_t v8 = v5;
  v7(&v13, ObjectType, v4);

  switch((char)v13)
  {
    case 2:
      swift_bridgeObjectRelease();
      uint64_t v9 = 45;
      break;
    default:
      uint64_t v10 = sub_235A68F50();
      swift_bridgeObjectRelease();
      if (v10) {
        uint64_t v9 = 45;
      }
      else {
        uint64_t v9 = 44;
      }
      break;
  }
  sub_235A46890(v9);
  sub_235A54998(6, 0);
  sub_235A564E0();
  sub_235A56564(1);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_235A54F24;
  return MEMORY[0x270FA1FF0](500000000);
}

uint64_t sub_235A54F24()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_235A59A90;
  }
  else
  {
    uint64_t v1 = sub_235A5503C;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_235A5503C()
{
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_235A56E50((void (*)(uint64_t))sub_235A59874, v1);
  swift_release_n();
  os_log_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_235A550EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 40);
  *(void *)uint64_t v4 = a2;
  *(void *)(v4 + 8) = a3;
  *(unsigned char *)(v4 + 16) = a4;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_235A55114(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = a2;
  uint64_t v5 = sub_235A68A20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_235A68A50();
  uint64_t v9 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A348B8(0, (unint64_t *)&qword_26882DC80);
  uint64_t v12 = (void *)sub_235A68CD0();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(unsigned char *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = v17;
  *(void *)(v14 + 40) = a3;
  aBlock[4] = sub_235A599E8;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_77;
  id v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_235A68A30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_235A38320();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A38378();
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v11, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

void sub_235A553E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D708);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x237DECD00](a1 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = sub_235A68C10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    sub_235A68BF0();
    id v11 = v9;
    uint64_t v12 = sub_235A68BE0();
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = MEMORY[0x263F8F500];
    *(void *)(v13 + 16) = v12;
    *(void *)(v13 + 24) = v14;
    *(void *)(v13 + 32) = v11;
    *(unsigned char *)(v13 + 40) = 0;
    sub_235A547EC((uint64_t)v7, a3, v13);
    swift_release();
  }
}

uint64_t sub_235A5552C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882D708);
  MEMORY[0x270FA5388](v0 - 8);
  os_log_type_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_235A68920();
  __swift_project_value_buffer(v3, (uint64_t)qword_26882DE48);
  os_log_type_t v4 = sub_235A68C40();
  sub_235A65720(v4, 0x6961725470696B73, 0xEE002928676E696ELL, 0xD000000000000016, 0x8000000235A6E1D0);
  sub_235A54998(6, 0);
  uint64_t v5 = sub_235A68C10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_235A68BF0();
  swift_retain();
  uint64_t v7 = sub_235A68BE0();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  swift_release();
  sub_235A547EC((uint64_t)v2, (uint64_t)&unk_26882DC48, (uint64_t)v8);
  return swift_release();
}

void sub_235A5570C(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x237DECD00](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = *(void **)(v8 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController);
    if (v10)
    {
      uint64_t v11 = *(void *)(v8 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 16);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v13;
      uint64_t v15 = a2 & 1;
      *(unsigned char *)(v14 + 24) = v15;
      *(void *)(v14 + 32) = a3;
      *(void *)(v14 + 40) = a4;
      uint64_t v16 = *(void (**)(uint64_t, void (*)(), uint64_t, uint64_t, uint64_t))(v11 + 24);
      id v17 = v10;
      swift_retain();
      swift_retain();
      v16(v15, sub_235A59A3C, v14, ObjectType, v11);

      swift_release();
      uint64_t v9 = v10;
      swift_release();
    }
  }
}

void sub_235A55864(uint64_t a1, char a2, void (*a3)(void))
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x237DECD00](v5);
  if (v6)
  {
    uint64_t v7 = (unsigned __int8 *)v6;
    if (a2)
    {
      uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
      if (v8) {
        objc_msgSend(v8, sel_playSoundsEffect_, v7[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState]);
      }
    }
    a3();
  }
}

uint64_t sub_235A558FC(char a1, uint64_t a2, char a3)
{
  if (a1 == 6)
  {
    os_log_type_t v4 = (long long *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
    swift_beginAccess();
    *((void *)v4 + 11) = 0;
    *((void *)v4 + 12) = 0;
    swift_bridgeObjectRelease();
    uint64_t v5 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState;
    if (*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState)
      && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v6 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t ObjectType = swift_getObjectType();
      long long v8 = v4[9];
      long long v190 = v4[8];
      long long v191 = v8;
      long long v9 = v4[11];
      long long v192 = v4[10];
      long long v193 = v9;
      long long v10 = v4[5];
      long long v186 = v4[4];
      long long v187 = v10;
      long long v11 = v4[7];
      long long v188 = v4[6];
      long long v189 = v11;
      long long v12 = v4[1];
      long long v182 = *v4;
      long long v183 = v12;
      long long v13 = v4[3];
      long long v184 = v4[2];
      long long v185 = v13;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      uint64_t v14 = (_OWORD *)swift_allocObject();
      v179[0] = v14;
      long long v15 = v4[9];
      v14[9] = v4[8];
      v14[10] = v15;
      long long v16 = v4[11];
      v14[11] = v4[10];
      v14[12] = v16;
      long long v17 = v4[5];
      v14[5] = v4[4];
      void v14[6] = v17;
      long long v18 = v4[7];
      v14[7] = v4[6];
      v14[8] = v18;
      long long v19 = v4[1];
      v14[1] = *v4;
      v14[2] = v19;
      long long v20 = v4[3];
      v14[3] = v4[2];
      v14[4] = v20;
      uint64_t v21 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 16);
      sub_235A3557C((uint64_t)&v182);
      v21(v179, 0, ObjectType, v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    long long *v4 = xmmword_235A6B420;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a2 + v5) && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v22 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v23 = swift_getObjectType();
      long long v24 = v4[9];
      long long v190 = v4[8];
      long long v191 = v24;
      long long v25 = v4[11];
      long long v192 = v4[10];
      long long v193 = v25;
      long long v26 = v4[5];
      long long v186 = v4[4];
      long long v187 = v26;
      long long v27 = v4[7];
      long long v188 = v4[6];
      long long v189 = v27;
      long long v28 = v4[1];
      long long v182 = *v4;
      long long v183 = v28;
      long long v29 = v4[3];
      long long v184 = v4[2];
      long long v185 = v29;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      id v30 = (_OWORD *)swift_allocObject();
      v179[0] = v30;
      long long v31 = v4[9];
      v30[9] = v4[8];
      v30[10] = v31;
      long long v32 = v4[11];
      v30[11] = v4[10];
      v30[12] = v32;
      long long v33 = v4[5];
      v30[5] = v4[4];
      v30[6] = v33;
      long long v34 = v4[7];
      v30[7] = v4[6];
      v30[8] = v34;
      long long v35 = v4[1];
      v30[1] = *v4;
      v30[2] = v35;
      long long v36 = v4[3];
      v30[3] = v4[2];
      v30[4] = v36;
      os_log_type_t v37 = *(void (**)(void *, void, uint64_t, uint64_t))(v22 + 16);
      sub_235A3557C((uint64_t)&v182);
      v37(v179, 0, v23, v22);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    *((void *)v4 + 2) = 0;
    *((void *)v4 + 3) = 0xE000000000000000;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a2 + v5) && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v38 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v39 = swift_getObjectType();
      long long v40 = v4[9];
      long long v190 = v4[8];
      long long v191 = v40;
      long long v41 = v4[11];
      long long v192 = v4[10];
      long long v193 = v41;
      long long v42 = v4[5];
      long long v186 = v4[4];
      long long v187 = v42;
      long long v43 = v4[7];
      long long v188 = v4[6];
      long long v189 = v43;
      long long v44 = v4[1];
      long long v182 = *v4;
      long long v183 = v44;
      long long v45 = v4[3];
      long long v184 = v4[2];
      long long v185 = v45;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      char v46 = (_OWORD *)swift_allocObject();
      v179[0] = v46;
      long long v47 = v4[9];
      v46[9] = v4[8];
      v46[10] = v47;
      long long v48 = v4[11];
      v46[11] = v4[10];
      v46[12] = v48;
      long long v49 = v4[5];
      v46[5] = v4[4];
      v46[6] = v49;
      long long v50 = v4[7];
      v46[7] = v4[6];
      v46[8] = v50;
      long long v51 = v4[1];
      v46[1] = *v4;
      v46[2] = v51;
      long long v52 = v4[3];
      v46[3] = v4[2];
      v46[4] = v52;
      uint64_t v53 = *(void (**)(void *, void, uint64_t, uint64_t))(v38 + 16);
      sub_235A3557C((uint64_t)&v182);
      v53(v179, 0, v39, v38);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    *((void *)v4 + 7) = 0;
    *((void *)v4 + 8) = 0;
    uint64_t result = swift_bridgeObjectRelease();
    if (*(unsigned char *)(a2 + v5) && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v55 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v56 = swift_getObjectType();
      long long v57 = v4[9];
      long long v190 = v4[8];
      long long v191 = v57;
      long long v58 = v4[11];
      long long v192 = v4[10];
      long long v193 = v58;
      long long v59 = v4[5];
      long long v186 = v4[4];
      long long v187 = v59;
      long long v60 = v4[7];
      long long v188 = v4[6];
      long long v189 = v60;
      long long v61 = v4[1];
      long long v182 = *v4;
      long long v183 = v61;
      long long v62 = v4[3];
      long long v184 = v4[2];
      long long v185 = v62;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      uint64_t v63 = (_OWORD *)swift_allocObject();
      v179[0] = v63;
      long long v64 = v4[9];
      v63[9] = v4[8];
      v63[10] = v64;
      long long v65 = v4[11];
      v63[11] = v4[10];
      v63[12] = v65;
      long long v66 = v4[5];
      v63[5] = v4[4];
      v63[6] = v66;
      long long v67 = v4[7];
      v63[7] = v4[6];
      v63[8] = v67;
      long long v68 = v4[1];
      v63[1] = *v4;
      v63[2] = v68;
      long long v69 = v4[3];
      v63[3] = v4[2];
      v63[4] = v69;
      uint64_t v70 = *(void (**)(void *, void, uint64_t, uint64_t))(v55 + 16);
      sub_235A3557C((uint64_t)&v182);
      v70(v179, 0, v56, v55);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
  }
  else
  {
    if (a3)
    {
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      uint64_t v72 = 0xD000000000000020;
      char v73 = byte_26882EE38;
      uint64_t v74 = "VOICE_TRAINING_PRELUDE_TRY_AGAIN";
    }
    else
    {
      if (qword_26882D0F0 != -1) {
        swift_once();
      }
      uint64_t v72 = 0xD00000000000001ALL;
      char v73 = byte_26882EE38;
      uint64_t v74 = "VOICE_TRAINING_PRELUDE_SAY";
    }
    sub_235A4F2CC(v72, (unint64_t)(v74 - 32) | 0x8000000000000000, 0, v73, 0xAu);
    sub_235A643F8(v73);
    strcpy((char *)v179, "%DEVICE_NAME%");
    sub_235A35654();
    uint64_t v75 = sub_235A68D90();
    uint64_t v77 = v76;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&long long v182 = v75;
    *((void *)&v182 + 1) = v77;
    v179[0] = 0xD000000000000015;
    v179[1] = 0x8000000235A6BF00;
    unint64_t v194 = sub_235A643F8(v73);
    uint64_t v195 = v78;
    uint64_t v79 = sub_235A68D90();
    uint64_t v81 = v80;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __int16 v82 = (long long *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
    swift_beginAccess();
    *(void *)__int16 v82 = v79;
    *((void *)v82 + 1) = v81;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState)
      && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v83 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v84 = swift_getObjectType();
      long long v85 = v82[9];
      long long v190 = v82[8];
      long long v191 = v85;
      long long v86 = v82[11];
      long long v192 = v82[10];
      long long v193 = v86;
      long long v87 = v82[5];
      long long v186 = v82[4];
      long long v187 = v87;
      long long v88 = v82[7];
      long long v188 = v82[6];
      long long v189 = v88;
      long long v89 = v82[1];
      long long v182 = *v82;
      long long v183 = v89;
      long long v90 = v82[3];
      long long v184 = v82[2];
      long long v185 = v90;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      uint64_t v91 = (_OWORD *)swift_allocObject();
      v179[0] = v91;
      long long v92 = v82[9];
      v91[9] = v82[8];
      v91[10] = v92;
      long long v93 = v82[11];
      v91[11] = v82[10];
      v91[12] = v93;
      long long v94 = v82[5];
      v91[5] = v82[4];
      v91[6] = v94;
      long long v95 = v82[7];
      v91[7] = v82[6];
      v91[8] = v95;
      long long v96 = v82[1];
      v91[1] = *v82;
      v91[2] = v96;
      long long v97 = v82[3];
      v91[3] = v82[2];
      v91[4] = v97;
      v98 = *(void (**)(void *, void, uint64_t, uint64_t))(v83 + 16);
      sub_235A3557C((uint64_t)&v182);
      v98(v179, 0, v84, v83);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    uint64_t v99 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState;
    uint64_t v100 = sub_235A52B64(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState));
    uint64_t v102 = v101;
    v103 = (long long *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
    swift_beginAccess();
    *((void *)v103 + 2) = v100;
    *((void *)v103 + 3) = v102;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a2 + v99) && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v104 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v178 = swift_getObjectType();
      long long v105 = v103[9];
      long long v190 = v103[8];
      long long v191 = v105;
      long long v106 = v103[11];
      long long v192 = v103[10];
      long long v193 = v106;
      long long v107 = v103[5];
      long long v186 = v103[4];
      long long v187 = v107;
      long long v108 = v103[7];
      long long v188 = v103[6];
      long long v189 = v108;
      long long v109 = v103[1];
      long long v182 = *v103;
      long long v183 = v109;
      long long v110 = v103[3];
      long long v184 = v103[2];
      long long v185 = v110;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      v111 = (_OWORD *)swift_allocObject();
      v179[0] = v111;
      long long v112 = v103[9];
      v111[9] = v103[8];
      v111[10] = v112;
      long long v113 = v103[11];
      v111[11] = v103[10];
      v111[12] = v113;
      long long v114 = v103[5];
      v111[5] = v103[4];
      v111[6] = v114;
      long long v115 = v103[7];
      v111[7] = v103[6];
      v111[8] = v115;
      long long v116 = v103[1];
      v111[1] = *v103;
      v111[2] = v116;
      long long v117 = v103[3];
      v111[3] = v103[2];
      v111[4] = v117;
      v118 = *(void (**)(void *, void, uint64_t, uint64_t))(v104 + 16);
      sub_235A3557C((uint64_t)&v182);
      v118(v179, 0, v178, v104);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    *((void *)v103 + 11) = sub_235A52FD4(a1);
    *((void *)v103 + 12) = v119;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a2 + v99) && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v120 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v121 = swift_getObjectType();
      long long v122 = v103[9];
      long long v190 = v103[8];
      long long v191 = v122;
      long long v123 = v103[11];
      long long v192 = v103[10];
      long long v193 = v123;
      long long v124 = v103[5];
      long long v186 = v103[4];
      long long v187 = v124;
      long long v125 = v103[7];
      long long v188 = v103[6];
      long long v189 = v125;
      long long v126 = v103[1];
      long long v182 = *v103;
      long long v183 = v126;
      long long v127 = v103[3];
      long long v184 = v103[2];
      long long v185 = v127;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      v128 = (_OWORD *)swift_allocObject();
      v179[0] = v128;
      long long v129 = v103[9];
      v128[9] = v103[8];
      v128[10] = v129;
      long long v130 = v103[11];
      v128[11] = v103[10];
      v128[12] = v130;
      long long v131 = v103[5];
      v128[5] = v103[4];
      v128[6] = v131;
      long long v132 = v103[7];
      v128[7] = v103[6];
      v128[8] = v132;
      long long v133 = v103[1];
      v128[1] = *v103;
      v128[2] = v133;
      long long v134 = v103[3];
      v128[3] = v103[2];
      v128[4] = v134;
      v135 = *(void (**)(void *, void, uint64_t, uint64_t))(v120 + 16);
      sub_235A3557C((uint64_t)&v182);
      v135(v179, 0, v121, v120);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
    v136 = *(void **)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource);
    uint64_t v137 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8);
    uint64_t v138 = swift_getObjectType();
    v139 = *(uint64_t (**)(uint64_t, uint64_t))(v137 + 72);
    id v140 = v136;
    uint64_t v141 = v139(v138, v137);
    uint64_t v143 = v142;

    *((void *)v103 + 22) = v141;
    *((void *)v103 + 23) = v143;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v144 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController;
    if (*(unsigned char *)(a2 + v99) && *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController))
    {
      uint64_t v145 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController + 8);
      uint64_t v146 = swift_getObjectType();
      long long v147 = v103[9];
      long long v190 = v103[8];
      long long v191 = v147;
      long long v148 = v103[11];
      long long v192 = v103[10];
      long long v193 = v148;
      long long v149 = v103[5];
      long long v186 = v103[4];
      long long v187 = v149;
      long long v150 = v103[7];
      long long v188 = v103[6];
      long long v189 = v150;
      long long v151 = v103[1];
      long long v182 = *v103;
      long long v183 = v151;
      long long v152 = v103[3];
      long long v184 = v103[2];
      long long v185 = v152;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      v153 = (_OWORD *)swift_allocObject();
      v179[0] = v153;
      long long v154 = v103[9];
      v153[9] = v103[8];
      v153[10] = v154;
      long long v155 = v103[11];
      v153[11] = v103[10];
      v153[12] = v155;
      long long v156 = v103[5];
      v153[5] = v103[4];
      v153[6] = v156;
      long long v157 = v103[7];
      v153[7] = v103[6];
      v153[8] = v157;
      long long v158 = v103[1];
      v153[1] = *v103;
      v153[2] = v158;
      long long v159 = v103[3];
      v153[3] = v103[2];
      v153[4] = v159;
      v160 = *(void (**)(void *, void, uint64_t, uint64_t))(v145 + 16);
      sub_235A3557C((uint64_t)&v182);
      v160(v179, 0, v146, v145);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
      uint64_t v144 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController;
    }
    v161 = (void *)(a2 + v144);
    if (*v161)
    {
      uint64_t v162 = v161[1];
      uint64_t v163 = swift_getObjectType();
      long long v164 = v103[9];
      long long v190 = v103[8];
      long long v191 = v164;
      long long v165 = v103[11];
      long long v192 = v103[10];
      long long v193 = v165;
      long long v166 = v103[5];
      long long v186 = v103[4];
      long long v187 = v166;
      long long v167 = v103[7];
      long long v188 = v103[6];
      long long v189 = v167;
      long long v168 = v103[1];
      long long v182 = *v103;
      long long v183 = v168;
      long long v169 = v103[3];
      long long v184 = v103[2];
      long long v185 = v169;
      v180 = &type metadata for ViewModel;
      v181 = &off_26E8ECE80;
      v170 = (_OWORD *)swift_allocObject();
      v179[0] = v170;
      long long v171 = v103[9];
      v170[9] = v103[8];
      v170[10] = v171;
      long long v172 = v103[11];
      v170[11] = v103[10];
      v170[12] = v172;
      long long v173 = v103[5];
      v170[5] = v103[4];
      v170[6] = v173;
      long long v174 = v103[7];
      v170[7] = v103[6];
      v170[8] = v174;
      long long v175 = v103[1];
      v170[1] = *v103;
      v170[2] = v175;
      long long v176 = v103[3];
      v170[3] = v103[2];
      v170[4] = v176;
      v177 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(v162 + 16);
      sub_235A3557C((uint64_t)&v182);
      v177(v179, 1, v163, v162);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    }
  }
  return result;
}

id sub_235A564E0()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator;
  id result = *(id *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_scdaCoordinator);
  if (result)
  {
    objc_msgSend(result, sel_endAdvertisingAfterDelay_, 0.0);
    id result = *(id *)(v0 + v1);
    if (result)
    {
      objc_msgSend(result, sel_stopListening_, 0);
      id result = *(id *)(v0 + v1);
      if (result)
      {
        return objc_msgSend(result, sel_setupEnabled_, 0);
      }
    }
  }
  return result;
}

void sub_235A56564(char a1)
{
  void (*v31)(_OWORD *__return_ptr, uint64_t, uint64_t);
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  long long v38;
  uint64_t v39;
  os_log_type_t v40;
  void **v41;
  void *v42;
  id v43;
  long long v44;
  uint64_t v45;
  long long v46;
  long long v47;
  uint64_t v48;
  _OWORD v49[2];
  long long v50;
  long long v51;

  os_log_type_t v2 = v1;
  os_log_type_t v4 = &OBJC_IVAR___SetupSchemaProvisionalSiriSetupContext__hasStarted;
  if ((a1 & 1) != 0 && (v1[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isExpressTraining] & 1) == 0)
  {
    long long v9 = *(void **)&v1[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager];
    if (v9 && (id v10 = objc_msgSend(v9, sel_voiceProfile)) != 0)
    {
      long long v11 = v10;
      id v12 = v10;
      long long v13 = (void *)sub_235A68AF0();
      id v14 = objc_msgSend(v12, sel_valueForKey_, v13);

      if (v14)
      {
        sub_235A68DA0();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v49, 0, sizeof(v49));
      }
      sub_235A58B64((uint64_t)v49, (uint64_t)&v50);
      if (*((void *)&v51 + 1))
      {
        sub_235A58A58((uint64_t)&v50, (uint64_t)v49);
        sub_235A58A58((uint64_t)v49, (uint64_t)&v47);
        if (v48)
        {
          sub_235A348B8(0, (unint64_t *)&unk_26882DA10);
          if (swift_dynamicCast())
          {
            long long v34 = (void *)v44;
LABEL_31:
            sub_235A348B8(0, (unint64_t *)&unk_26882DA10);
            long long v35 = (void *)sub_235A68D50();
            if (!v34)
            {
              sub_235A58AC0((uint64_t)v49, &qword_26882DC70);

LABEL_35:
              *(void *)&long long v47 = 0;
              *((void *)&v47 + 1) = 0xE000000000000000;
              sub_235A68DE0();
              char v46 = v47;
              sub_235A68B30();
              sub_235A58A58((uint64_t)&v50, (uint64_t)&v44);
              if (v45)
              {
                sub_235A3E400(&v44, &v47);
              }
              else
              {
                long long v48 = MEMORY[0x263F8D310];
                *(void *)&long long v47 = 7104878;
                *((void *)&v47 + 1) = 0xE300000000000000;
                sub_235A58AC0((uint64_t)&v44, &qword_26882DC70);
              }
              sub_235A68E20();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
              uint64_t v38 = v46;
              if (qword_26882D100 != -1) {
                swift_once();
              }
              uint64_t v39 = sub_235A68920();
              __swift_project_value_buffer(v39, (uint64_t)qword_26882DE48);
              long long v40 = sub_235A68C30();
              sub_235A65720(v40, 0xD00000000000001BLL, 0x8000000235A6E230, v38, *((unint64_t *)&v38 + 1));
              swift_bridgeObjectRelease();
              long long v41 = (void **)&v2[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager];
              swift_beginAccess();
              long long v42 = *v41;
              if (v42)
              {
                swift_endAccess();
                long long v43 = v42;
                objc_msgSend(v43, sel_markSATEnrollmentSuccessForVoiceProfile_, v12);

                sub_235A58AC0((uint64_t)&v50, &qword_26882DC70);
              }
              else
              {
                sub_235A58AC0((uint64_t)&v50, &qword_26882DC70);
                swift_endAccess();
              }
              goto LABEL_18;
            }
            long long v36 = v34;
            os_log_type_t v37 = sub_235A68D40();
            sub_235A58AC0((uint64_t)v49, &qword_26882DC70);

            if ((v37 & 1) == 0) {
              goto LABEL_35;
            }
LABEL_15:
            if (qword_26882D100 != -1) {
              swift_once();
            }
            uint64_t v15 = sub_235A68920();
            __swift_project_value_buffer(v15, (uint64_t)qword_26882DE48);
            os_log_type_t v16 = sub_235A68C30();
            sub_235A65720(v16, 0xD00000000000001BLL, 0x8000000235A6E230, 0xD000000000000032, 0x8000000235A6E250);
            sub_235A348B8(0, &qword_26882DC78);
            long long v17 = *(void **)&v2[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource];
            uint64_t v18 = *(void *)&v2[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8];
            uint64_t ObjectType = swift_getObjectType();
            long long v20 = *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8);
            id v21 = v17;
            uint64_t v22 = v20(ObjectType, v18);
            uint64_t v24 = v23;

            uint64_t v25 = swift_allocObject();
            *(void *)(v25 + 16) = v11;
            *(void *)(v25 + 24) = v2;
            id v26 = v11;
            long long v27 = v2;
            sub_235A3C7C8(v22, v24, (uint64_t)sub_235A58B5C, v25);
            swift_release();

            swift_bridgeObjectRelease();
            sub_235A58AC0((uint64_t)&v50, &qword_26882DC70);
            os_log_type_t v4 = &OBJC_IVAR___SetupSchemaProvisionalSiriSetupContext__hasStarted;
            goto LABEL_18;
          }
        }
        else
        {
          sub_235A58AC0((uint64_t)&v47, &qword_26882DC70);
        }
        long long v34 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      long long v11 = 0;
      long long v50 = 0u;
      long long v51 = 0u;
    }
    sub_235A58A58((uint64_t)&v50, (uint64_t)v49);
    sub_235A58AC0((uint64_t)v49, &qword_26882DC70);
    goto LABEL_15;
  }
  uint64_t v5 = (void **)&v1[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager];
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (v6)
  {
    id v7 = *(id *)&v2[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager];
    id v8 = v6;
    if (v7) {
      id v7 = objc_msgSend(v7, sel_voiceProfile);
    }
    objc_msgSend(v6, sel_deleteUserVoiceProfile_, v7);
  }
  if (a1) {
LABEL_18:
  }
    *(void *)(*(void *)&v2[*((void *)v4 + 349)]
              + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_recognizeMyVoiceEnabled) = 2;
  long long v28 = *(void **)&v2[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource];
  uint64_t v29 = *(void *)&v2[OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_dataSource + 8];
  uint64_t v30 = swift_getObjectType();
  long long v31 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v29 + 24);
  long long v32 = v28;
  v31(v49, v30, v29);

  if (LOBYTE(v49[0]) != 3)
  {
    long long v33 = 1;
    if (a1) {
      long long v33 = 2;
    }
    *(void *)(*(void *)&v2[*((void *)v4 + 349)]
              + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled) = v33;
  }
}

uint64_t sub_235A56BDC(uint64_t a1)
{
  uint64_t v2 = sub_235A68A20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_235A68A50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A348B8(0, (unint64_t *)&qword_26882DC80);
  id v10 = (void *)sub_235A68CD0();
  aBlock[4] = sub_235A5987C;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_60;
  long long v11 = _Block_copy(aBlock);
  swift_retain();
  sub_235A68A30();
  v13[1] = MEMORY[0x263F8EE78];
  sub_235A38320();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A38378();
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v9, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void sub_235A56E50(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingManager);
  if (v6)
  {
    objc_msgSend(v6, sel_cancelTrainingForSessionId_, *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingSessionId));
    uint64_t v7 = *(void **)(v2 + v5);
    if (v7)
    {
      objc_msgSend(v7, sel_stopRMS);
      uint64_t v8 = *(void **)(v2 + v5);
      if (v8)
      {
        if (a1)
        {
          v13[4] = a1;
          v13[5] = a2;
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 1107296256;
          void v13[2] = sub_235A3667C;
          v13[3] = &block_descriptor_7;
          long long v9 = _Block_copy(v13);
          id v10 = v8;
          sub_235A5894C((uint64_t)a1);
          swift_release();
        }
        else
        {
          id v12 = v8;
          long long v9 = 0;
        }
        objc_msgSend(v8, sel_cleanupWithCompletion_, v9);
        _Block_release(v9);
      }
    }
  }
  else if (a1)
  {
    uint64_t v11 = swift_retain();
    a1(v11);
    sub_235A58924((uint64_t)a1);
  }
}

uint64_t sub_235A56FB8()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_235A56FD8, 0, 0);
}

uint64_t sub_235A56FD8()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[2];
  uint64_t v2 = sub_235A68920();
  __swift_project_value_buffer(v2, (uint64_t)qword_26882DE48);
  os_log_type_t v3 = sub_235A68C40();
  sub_235A65720(v3, 0xD000000000000010, 0x8000000235A6E1F0, 0xD000000000000017, 0x8000000235A6E210);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isCanceled) = 1;
  sub_235A54998(6, 0);
  sub_235A564E0();
  sub_235A56564(0);
  uint64_t v4 = swift_task_alloc();
  v0[3] = v4;
  *(void *)(v4 + 16) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[4] = v5;
  void *v5 = v0;
  v5[1] = sub_235A57174;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_235A57174()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_235A5728C, 0, 0);
}

uint64_t sub_235A5728C()
{
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_235A56E50((void (*)(uint64_t))sub_235A588F4, v1);
  swift_release_n();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_235A5733C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882DC68);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_235A56E50((void (*)(uint64_t))sub_235A589F0, v6);
  return swift_release();
}

void sub_235A5747C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x237DECD00](v3);
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    if (MEMORY[0x237DECD00](v4 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate))
    {
      uint64_t v6 = swift_retain();
      a2(v6);

      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_235A57524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  sub_235A68BF0();
  v4[6] = sub_235A68BE0();
  uint64_t v6 = sub_235A68BC0();
  v4[7] = v6;
  v4[8] = v5;
  return MEMORY[0x270FA2498](sub_235A575BC, v6, v5);
}

uint64_t sub_235A575BC()
{
  uint64_t v1 = v0[5] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237DECD00](v1);
  v0[9] = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[10] = v4;
    void *v4 = v0;
    v4[1] = sub_235A576C8;
    v4[2] = v3;
    return MEMORY[0x270FA2498](sub_235A56FD8, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_235A576C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_235A577E8, v3, v2);
}

uint64_t sub_235A577E8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_release();
  uint64_t v2 = MEMORY[0x237DECD00](v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate);
  uint64_t v3 = *(void **)(v0 + 72);
  if (v2)
  {
    uint64_t v4 = swift_retain();
    sub_235A36F38(v4);
    swift_unknownObjectRelease();
    swift_release();
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_235A5789C()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedApplication);
  objc_msgSend(v1, sel_setIdleTimerDisabled_, 1);

  id v2 = objc_msgSend(v0, sel_sharedApplication);
  objc_msgSend(v2, sel_setIdleTimerDisabled_, 0);
}

id sub_235A5793C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  id v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D5E8);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_235A68920();
  __swift_project_value_buffer(v10, (uint64_t)qword_26882DE48);
  os_log_type_t v11 = sub_235A68C40();
  sub_235A65720(v11, 0xD00000000000001BLL, 0x8000000235A6E230, 0xD000000000000028, 0x8000000235A6E2C0);
  swift_bridgeObjectRelease();
  if (a4)
  {
    if (a3) {
      uint64_t v12 = sub_235A68AF0();
    }
    else {
      uint64_t v12 = 0;
    }
    long long v13 = (void *)sub_235A68AF0();
    objc_msgSend(a4, sel_setValue_forKey_, v12, v13);
    swift_unknownObjectRelease();
  }
  id v14 = (id *)(a5 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_voiceProfileManager);
  swift_beginAccess();
  id result = *v14;
  if (*v14) {
    return objc_msgSend(result, sel_markSATEnrollmentSuccessForVoiceProfile_, a4);
  }
  return result;
}

id sub_235A57B54()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VoiceTrainingPresenter()
{
  return self;
}

uint64_t sub_235A57C9C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

void (*sub_235A57D64(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_235A51D48(v2);
  return sub_235A57DBC;
}

void sub_235A57DBC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void *sub_235A57E04()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_viewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A57E4C()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_235A68920();
  __swift_project_value_buffer(v1, (uint64_t)qword_26882DE48);
  os_log_type_t v2 = sub_235A68C40();
  sub_235A65720(v2, 0xD000000000000017, 0x8000000235A6CD40, 0xD00000000000001ALL, 0x8000000235A6E1B0);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_trainingState)) {
    sub_235A5552C();
  }
  uint64_t result = MEMORY[0x237DECD00](v0 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_delegate);
  if (result)
  {
    uint64_t v4 = swift_retain();
    sub_235A36F38(v4);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_235A57F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = sub_235A68BF0();
  v4[4] = sub_235A68BE0();
  return MEMORY[0x270FA2498](sub_235A57FDC, 0, 0);
}

uint64_t sub_235A57FDC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_isCanceled) = 0;
  if (qword_26882D0D0 != -1) {
    swift_once();
  }
  if (qword_26882D850) {
    objc_msgSend((id)qword_26882D850, sel_logEventWithType_context_, 3302, 0);
  }
  sub_235A58C14();
  sub_235A537A8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_235A580F4;
  v1[2] = *(void *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_235A52434, 0, 0);
}

uint64_t sub_235A580F4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 48) = v3;
  *(void *)uint64_t v3 = v2;
  *(void *)(v3 + 8) = sub_235A58254;
  *(void *)(v3 + 208) = *(void *)(v1 + 16);
  *(unsigned char *)(v3 + 138) = 0;
  return MEMORY[0x270FA2498](sub_235A53878, 0, 0);
}

uint64_t sub_235A58254()
{
  swift_task_dealloc();
  uint64_t v1 = sub_235A68BC0();
  return MEMORY[0x270FA2498](sub_235A58390, v1, v0);
}

uint64_t sub_235A58390()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_235A5846C()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_235A584FC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A58534()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_235A58574(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_235A42E94;
  return sub_235A57524(a1, v4, v5, v6);
}

uint64_t sub_235A58628(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_235A58704;
  return v6(a1);
}

uint64_t sub_235A58704()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A587FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235A58834(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_235A42E94;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26882DC50 + dword_26882DC50);
  return v6(a1, v4);
}

uint64_t sub_235A588EC(uint64_t a1)
{
  return sub_235A5733C(a1);
}

void sub_235A588F4()
{
  sub_235A5747C(v0, (void (*)(uint64_t))sub_235A36F38);
}

uint64_t sub_235A58924(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_235A5894C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_235A5895C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882DC68);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_235A589F0()
{
  return sub_235A68BD0();
}

uint64_t sub_235A58A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882DC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235A58AC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235A58B1C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_235A58B5C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_235A5793C(a1, a2, a3, *(void **)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_235A58B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882DC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235A58BCC()
{
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_235A58C04()
{
  return sub_235A558FC(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_235A58C14()
{
  uint64_t v0 = sub_235A68A20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_235A68A50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A348B8(0, (unint64_t *)&qword_26882DC80);
  uint64_t v8 = (void *)sub_235A68CD0();
  aBlock[4] = sub_235A5789C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_89;
  uint64_t v9 = _Block_copy(aBlock);
  sub_235A68A30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_235A38320();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A38378();
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v7, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_235A58E74(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3305;
  switch(a1)
  {
    case 1:
      goto LABEL_6;
    case 2:
      uint64_t v3 = 3306;
      goto LABEL_6;
    case 3:
      uint64_t v3 = 3307;
      goto LABEL_6;
    case 4:
      uint64_t v3 = 3308;
      goto LABEL_6;
    case 5:
      uint64_t v3 = 3309;
LABEL_6:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26882DCE8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_235A6A830;
      *(void *)(inited + 32) = 0x7463757274736E69;
      *(void *)(inited + 40) = 0xEB000000006E6F69;
      *(void *)(inited + 48) = a2;
      *(void *)(inited + 56) = a3;
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_235A3D3E0(inited);
      if (qword_26882D0D0 != -1) {
        swift_once();
      }
      uint64_t v8 = (void *)qword_26882D850;
      if (qword_26882D850)
      {
        sub_235A517CC(v7);
        uint64_t v9 = (void *)sub_235A68AC0();
        swift_bridgeObjectRelease();
        objc_msgSend(v8, sel_logEventWithType_context_, v3, v9);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      break;
    default:
      return;
  }
}

uint64_t sub_235A59010(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = v4;
  *(unsigned char *)(v5 + 113) = a2;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a3;
  return MEMORY[0x270FA2498](sub_235A59038, 0, 0);
}

uint64_t sub_235A59038()
{
  char v1 = *(unsigned char *)(v0 + 113);
  uint64_t v2 = *(void *)(v0 + 56);
  sub_235A68DE0();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  sub_235A68B30();
  sub_235A5B118(v2);
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  *(unsigned char *)(v0 + 112) = v1;
  sub_235A68E20();
  sub_235A68B30();
  sub_235A68B30();
  uint64_t v3 = *(void *)(v0 + 16);
  unint64_t v4 = *(void *)(v0 + 24);
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = sub_235A68920();
  __swift_project_value_buffer(v6, (uint64_t)qword_26882DE48);
  os_log_type_t v7 = sub_235A68C40();
  sub_235A65720(v7, 0xD00000000000003FLL, 0x8000000235A6E4E0, v3, v4);
  swift_bridgeObjectRelease();
  switch(v5)
  {
    case 0:
      uint64_t v14 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      long long v15 = sub_235A598E4;
      goto LABEL_11;
    case 1:
      uint64_t v14 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      long long v15 = sub_235A598AC;
LABEL_11:
      sub_235A55114(1, (uint64_t)v15, v14);
      swift_release_n();
      goto LABEL_23;
    case 2:
    case 7:
      uint64_t v8 = swift_task_alloc();
      *(void *)(v0 + 88) = v8;
      *(void *)uint64_t v8 = v0;
      uint64_t v9 = sub_235A59598;
      goto LABEL_5;
    case 3:
      os_log_type_t v16 = sub_235A68C30();
      uint64_t v17 = 0xD000000000000057;
      long long v18 = "Unrecoverable recording error while training. Disabling VoiceTrigger and Skipping setup";
      goto LABEL_21;
    case 4:
      uint64_t v19 = *(void *)(v0 + 80);
      uint64_t v20 = *(void *)(v19 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_badMicRetryCount);
      BOOL v21 = __OFADD__(v20, 1);
      uint64_t v22 = v20 + 1;
      if (v21)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        JUMPOUT(0x235A59578);
      }
      *(void *)(v19 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_badMicRetryCount) = v22;
      if (v22 >= 2)
      {
        os_log_type_t v16 = sub_235A68C40();
        uint64_t v17 = 0xD00000000000001CLL;
        long long v18 = "Exceeded Bad mic retry count";
        goto LABEL_21;
      }
      uint64_t v8 = swift_task_alloc();
      *(void *)(v0 + 96) = v8;
      *(void *)uint64_t v8 = v0;
      uint64_t v9 = sub_235A5968C;
      goto LABEL_5;
    case 5:
      uint64_t v23 = *(void *)(v0 + 80);
      uint64_t v24 = *(void *)(v23 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_AVVCRetryCount);
      BOOL v21 = __OFADD__(v24, 1);
      uint64_t v25 = v24 + 1;
      if (v21) {
        goto LABEL_27;
      }
      *(void *)(v23 + OBJC_IVAR____TtC9SiriSetup22VoiceTrainingPresenter_AVVCRetryCount) = v25;
      if (v25 > 4)
      {
        os_log_type_t v16 = sub_235A68C40();
        uint64_t v17 = 0xD00000000000003ALL;
        long long v18 = "Unrecoverable AVVC not ready errors. Cancelling enrollment";
LABEL_21:
        sub_235A65720(v16, 0xD00000000000003FLL, 0x8000000235A6E4E0, v17, (unint64_t)(v18 - 32) | 0x8000000000000000);
LABEL_22:
        sub_235A5552C();
LABEL_23:
        long long v26 = *(uint64_t (**)(void))(v0 + 8);
        return v26();
      }
      else
      {
        uint64_t v8 = swift_task_alloc();
        *(void *)(v0 + 104) = v8;
        *(void *)uint64_t v8 = v0;
        uint64_t v9 = sub_235A59780;
LABEL_5:
        *(void *)(v8 + 8) = v9;
        *(void *)(v8 + 208) = *(void *)(v0 + 80);
        *(unsigned char *)(v8 + 138) = 1;
        return MEMORY[0x270FA2498](sub_235A53878, 0, 0);
      }
    case 6:
      goto LABEL_22;
    default:
      uint64_t v10 = *(void *)(v0 + 56);
      sub_235A68DE0();
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0xE000000000000000;
      sub_235A68B30();
      *(void *)(v0 + 48) = v10;
      type metadata accessor for SRSTrainingManagerSessionStatus(0);
      sub_235A68E20();
      uint64_t v11 = *(void *)(v0 + 32);
      unint64_t v12 = *(void *)(v0 + 40);
      os_log_type_t v13 = sub_235A68C30();
      sub_235A65720(v13, 0xD00000000000003FLL, 0x8000000235A6E4E0, v11, v12);
      swift_bridgeObjectRelease();
      goto LABEL_23;
  }
}

uint64_t sub_235A59598()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A5968C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A59780()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235A59874()
{
  return sub_235A56BDC(v0);
}

void sub_235A5987C()
{
  sub_235A5747C(v0, (void (*)(uint64_t))sub_235A36DAC);
}

void sub_235A598AC()
{
  sub_235A553E0(v0, (uint64_t)&unk_26E8ED908, (uint64_t)&unk_26882DCE0);
}

void sub_235A598E4()
{
  sub_235A553E0(v0, (uint64_t)&unk_26E8ED868, (uint64_t)&unk_26882DCD8);
}

uint64_t sub_235A59920(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_235A59AB4;
  return sub_235A5457C(a1, v4, v5, v6, v7);
}

void sub_235A599E8()
{
  sub_235A5570C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t objectdestroy_73Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_235A59A3C()
{
  sub_235A55864(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void (**)(void))(v0 + 32));
}

uint64_t objectdestroy_67Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

id sub_235A59AB8(_OWORD *a1)
{
  long long v3 = a1[9];
  long long v45 = a1[8];
  long long v46 = v3;
  long long v4 = a1[11];
  long long v47 = a1[10];
  long long v48 = v4;
  long long v5 = a1[5];
  long long v41 = a1[4];
  long long v42 = v5;
  long long v6 = a1[7];
  long long v43 = a1[6];
  long long v44 = v6;
  long long v7 = a1[1];
  v38[0] = *a1;
  v38[1] = v7;
  long long v8 = a1[3];
  long long v39 = a1[2];
  long long v40 = v8;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_orbView] = 0;
  uint64_t v9 = &v1[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel];
  long long v10 = a1[9];
  *((_OWORD *)v9 + 8) = a1[8];
  *((_OWORD *)v9 + 9) = v10;
  long long v11 = a1[11];
  *((_OWORD *)v9 + 10) = a1[10];
  *((_OWORD *)v9 + 11) = v11;
  long long v12 = a1[5];
  *((_OWORD *)v9 + 4) = a1[4];
  *((_OWORD *)v9 + 5) = v12;
  long long v13 = a1[7];
  *((_OWORD *)v9 + 6) = a1[6];
  *((_OWORD *)v9 + 7) = v13;
  long long v14 = a1[1];
  *(_OWORD *)uint64_t v9 = *a1;
  *((_OWORD *)v9 + 1) = v14;
  long long v15 = a1[3];
  *((_OWORD *)v9 + 2) = a1[2];
  *((_OWORD *)v9 + 3) = v15;
  sub_235A3557C((uint64_t)v38);
  os_log_type_t v16 = (void *)sub_235A68AF0();
  id v17 = objc_msgSend(self, sel_bundleWithIdentifier_, v16);

  long long v18 = (void *)sub_235A68AF0();
  id v19 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v18, v17, 0);

  uint64_t v20 = (void *)sub_235A68AF0();
  if (*((void *)&v39 + 1))
  {
    swift_bridgeObjectRetain();
    BOOL v21 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v21 = 0;
  }
  v37.receiver = v1;
  v37.super_class = (Class)type metadata accessor for LanguageSelectionWelcomeController();
  long long v36 = v19;
  id v22 = objc_msgSendSuper2(&v37, sel_initWithTitle_detailText_icon_contentLayout_, v20, v21, v19, 2);

  if ((void)v40) {
    uint64_t v23 = v40;
  }
  else {
    uint64_t v23 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  id v24 = v22;
  sub_235A346CC((uint64_t)v38);
  uint64_t v25 = *(void *)(v23 + 16);
  if (v25)
  {
    long long v26 = self;
    uint64_t v27 = v23 + 40;
    do
    {
      swift_bridgeObjectRetain();
      id v28 = objc_msgSend(v26, sel_boldButton);
      long long v29 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setTitle_forState_, v29, 0);

      objc_msgSend(v28, sel_addTarget_action_forControlEvents_, v24, sel_continueTappedWithSender_, 64);
      id v30 = objc_msgSend(v24, (SEL)&selRef_setHasSiriEnabled_ + 3);
      objc_msgSend(v30, sel_addButton_, v28);

      v27 += 16;
      --v25;
    }
    while (v25);
  }
  swift_bridgeObjectRelease();
  long long v31 = self;
  long long v32 = (void *)sub_235A68AF0();
  id v33 = objc_msgSend(v31, sel_linkWithBundleIdentifier_, v32);

  id v34 = objc_msgSend(v24, sel_buttonTray);
  objc_msgSend(v34, sel_setPrivacyLinkController_, v33);

  return v24;
}

uint64_t sub_235A59E64(void *a1)
{
  uint64_t result = MEMORY[0x237DECD00](v1 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate);
  if (result)
  {
    id v4 = objc_msgSend(a1, sel_currentTitle);
    if (v4)
    {
      long long v5 = v4;
      uint64_t v6 = sub_235A68B00();
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v8 = 0xE000000000000000;
    }
    sub_235A5AFAC(v6, v8);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A59FE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSelectionWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LanguageSelectionWelcomeController()
{
  return self;
}

uint64_t sub_235A5A0C8(void *a1, char *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v117 = a5;
  uint64_t v123 = sub_235A688C0();
  uint64_t v119 = *(void (***)(void, void))(v123 - 8);
  MEMORY[0x270FA5388](v123);
  long long v110 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  long long v11 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController];
  *(void *)long long v11 = 0;
  *((void *)v11 + 1) = 0;
  long long v122 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_languages];
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_languages] = MEMORY[0x263F8EE80];
  long long v12 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_dataSource];
  *(void *)long long v12 = a1;
  *((void *)v12 + 1) = a2;
  long long v13 = &v5[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_dataSourceWriter];
  *(void *)long long v13 = a3;
  *((void *)v13 + 1) = a4;
  uint64_t ObjectType = swift_getObjectType();
  long long v15 = (uint64_t (*)(uint64_t, char *))*((void *)a2 + 8);
  os_log_type_t v16 = v5;
  id v17 = a1;
  id v116 = a3;
  id v118 = v17;
  uint64_t v124 = ObjectType;
  char v18 = v15(ObjectType, a2);
  long long v115 = v16;
  v16[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewStyle] = v18;
  if (qword_26882D0F0 != -1) {
LABEL_32:
  }
    swift_once();
  char v19 = byte_26882EE38;
  uint64_t v20 = sub_235A4F2CC(0xD000000000000018, 0x8000000235A6E770, 0, byte_26882EE38, 0xAu);
  uint64_t v22 = v21;
  unint64_t v23 = sub_235A643F8(v19);
  *(void *)&v129[0] = v20;
  *((void *)&v129[0] + 1) = v22;
  strcpy((char *)v125, "%DEVICE_NAME%");
  HIWORD(v125[0]) = -4864;
  unint64_t v126 = v23;
  uint64_t v127 = v24;
  sub_235A35654();
  uint64_t v25 = sub_235A68D90();
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v28 = sub_235A643F8(v19);
  *(void *)&v129[0] = v25;
  *((void *)&v129[0] + 1) = v27;
  *(void *)&v125[0] = 0xD000000000000015;
  *((void *)&v125[0] + 1) = 0x8000000235A6BF00;
  unint64_t v126 = v28;
  uint64_t v127 = v29;
  uint64_t v113 = sub_235A68D90();
  uint64_t v114 = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v31 = byte_26882EE38;
  uint64_t v32 = sub_235A4F2CC(0xD00000000000001BLL, 0x8000000235A6E790, 0, byte_26882EE38, 0xAu);
  uint64_t v34 = v33;
  unint64_t v35 = sub_235A643F8(v31);
  *(void *)&v129[0] = v32;
  *((void *)&v129[0] + 1) = v34;
  strcpy((char *)v125, "%DEVICE_NAME%");
  HIWORD(v125[0]) = -4864;
  unint64_t v126 = v35;
  uint64_t v127 = v36;
  uint64_t v37 = sub_235A68D90();
  uint64_t v39 = v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v40 = sub_235A643F8(v31);
  *(void *)&v129[0] = v37;
  *((void *)&v129[0] + 1) = v39;
  *(void *)&v125[0] = 0xD000000000000015;
  *((void *)&v125[0] + 1) = 0x8000000235A6BF00;
  unint64_t v126 = v40;
  uint64_t v127 = v41;
  uint64_t v111 = sub_235A68D90();
  uint64_t v112 = v42;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v43 = v118;
  uint64_t v44 = v124;
  uint64_t v120 = (*((uint64_t (**)(uint64_t, char *))a2 + 9))(v124, a2);
  uint64_t v121 = v45;
  if (!v45)
  {
    id v46 = objc_msgSend(self, sel_currentLocale);
    long long v47 = v110;
    sub_235A688B0();

    uint64_t v120 = sub_235A688A0();
    uint64_t v121 = v48;
    ((void (**)(char *, uint64_t))v119)[1](v47, v123);
  }
  uint64_t v49 = (*((uint64_t (**)(uint64_t, char *))a2 + 4))(v44, a2);
  long long v50 = (void *)MEMORY[0x263F8EE78];
  if (v49) {
    long long v51 = (char *)v49;
  }
  else {
    long long v51 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v52 = *((void *)v51 + 2);
  long long v110 = v51;
  if (!v52)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v85 = v115;
    long long v86 = &v115[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel];
    *(void *)long long v86 = 0;
    *((void *)v86 + 1) = 0;
    uint64_t v87 = v114;
    *((void *)v86 + 2) = v113;
    *((void *)v86 + 3) = v87;
    uint64_t v88 = v112;
    *((void *)v86 + 4) = v111;
    *((void *)v86 + 5) = v88;
    *((void *)v86 + 6) = v50;
    *(_OWORD *)(v86 + 56) = 0u;
    *(_OWORD *)(v86 + 72) = 0u;
    *(_OWORD *)(v86 + 88) = 0u;
    *(_OWORD *)(v86 + 104) = 0u;
    *(_OWORD *)(v86 + 120) = 0u;
    v86[136] = 2;
    *((void *)v86 + 19) = 0;
    *((void *)v86 + 20) = 0;
    *((void *)v86 + 18) = 0;
    *((_WORD *)v86 + 84) = 0;
    *((void *)v86 + 22) = 0;
    *((void *)v86 + 23) = 0;
    *(void *)&v85[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_page] = v117;
    swift_retain();

    long long v89 = (objc_class *)type metadata accessor for LanguageSelectionPresenter();
    v128.receiver = v85;
    v128.super_class = v89;
    long long v90 = objc_msgSendSuper2(&v128, sel_init);
    uint64_t v91 = (long long *)&v90[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel];
    char v92 = v90[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewStyle];
    swift_beginAccess();
    long long v93 = *v91;
    long long v94 = v91[1];
    long long v95 = v91[3];
    v129[2] = v91[2];
    v129[3] = v95;
    v129[0] = v93;
    v129[1] = v94;
    long long v96 = v91[4];
    long long v97 = v91[5];
    long long v98 = v91[7];
    v129[6] = v91[6];
    v129[7] = v98;
    v129[4] = v96;
    v129[5] = v97;
    long long v99 = v91[8];
    long long v100 = v91[9];
    long long v101 = v91[11];
    v129[10] = v91[10];
    v129[11] = v101;
    v129[8] = v99;
    v129[9] = v100;
    v125[8] = v91[8];
    v125[9] = v91[9];
    v125[10] = v91[10];
    v125[11] = v91[11];
    v125[4] = v91[4];
    v125[5] = v91[5];
    v125[6] = v91[6];
    v125[7] = v91[7];
    v125[0] = *v91;
    v125[1] = v91[1];
    v125[2] = v91[2];
    v125[3] = v91[3];
    uint64_t v102 = v90;
    sub_235A3557C((uint64_t)v129);
    v103 = sub_235A5AA44(v92, v125);
    long long v105 = v104;

    swift_release();
    sub_235A346CC((uint64_t)v129);
    long long v106 = (char **)&v102[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController];
    long long v107 = *(void **)&v102[OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController];
    *long long v106 = v103;
    v106[1] = v105;

    return (uint64_t)v102;
  }
  uint64_t v119 = (void (**)(void, void))self;
  a2 = v51 + 40;
  while (1)
  {
    uint64_t v124 = v52;
    uint64_t v53 = *((void *)a2 - 1);
    uint64_t v54 = *(void *)a2;
    swift_bridgeObjectRetain();
    id v55 = objc_msgSend(v119, sel_sharedInstance);
    if (!v55) {
      break;
    }
    uint64_t v56 = v55;
    long long v57 = (void *)sub_235A68AF0();
    long long v58 = (void *)sub_235A68AF0();
    id v59 = objc_msgSend(v56, sel_localizedCompactNameForSiriLanguage_inDisplayLanguage_, v57, v58);

    if (v59)
    {
      uint64_t v123 = sub_235A68B00();
      uint64_t v61 = v60;

      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        long long v50 = sub_235A611FC(0, v50[2] + 1, 1, v50);
      }
      unint64_t v63 = v50[2];
      unint64_t v62 = v50[3];
      if (v63 >= v62 >> 1) {
        long long v50 = sub_235A611FC((void *)(v62 > 1), v63 + 1, 1, v50);
      }
      v50[2] = v63 + 1;
      long long v64 = v50;
      long long v65 = &v50[2 * v63];
      long long v66 = v122;
      uint64_t v67 = v123;
      v65[4] = v123;
      v65[5] = v61;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v125[0] = *(void *)v66;
      uint64_t v69 = *(void *)&v125[0];
      *(void *)long long v66 = 0x8000000000000000;
      unint64_t v71 = sub_235A5D564(v67, v61);
      uint64_t v72 = *(void *)(v69 + 16);
      BOOL v73 = (v70 & 1) == 0;
      uint64_t v74 = v72 + v73;
      if (__OFADD__(v72, v73))
      {
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      char v75 = v70;
      if (*(void *)(v69 + 24) >= v74)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v78 = *(void **)&v125[0];
          if ((v70 & 1) == 0) {
            goto LABEL_26;
          }
        }
        else
        {
          sub_235A5E230();
          uint64_t v78 = *(void **)&v125[0];
          if ((v75 & 1) == 0) {
            goto LABEL_26;
          }
        }
      }
      else
      {
        sub_235A5DB58(v74, isUniquelyReferenced_nonNull_native);
        unint64_t v76 = sub_235A5D564(v123, v61);
        if ((v75 & 1) != (v77 & 1)) {
          goto LABEL_34;
        }
        unint64_t v71 = v76;
        uint64_t v78 = *(void **)&v125[0];
        if ((v75 & 1) == 0)
        {
LABEL_26:
          v78[(v71 >> 6) + 8] |= 1 << v71;
          uint64_t v80 = (void *)(v78[6] + 16 * v71);
          *uint64_t v80 = v123;
          v80[1] = v61;
          uint64_t v81 = (void *)(v78[7] + 16 * v71);
          *uint64_t v81 = v53;
          v81[1] = v54;
          uint64_t v82 = v78[2];
          BOOL v83 = __OFADD__(v82, 1);
          uint64_t v84 = v82 + 1;
          if (v83) {
            goto LABEL_31;
          }
          v78[2] = v84;
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
      }
      uint64_t v79 = (void *)(v78[7] + 16 * v71);
      swift_bridgeObjectRelease();
      *uint64_t v79 = v53;
      v79[1] = v54;
LABEL_28:
      *(void *)long long v122 = v78;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      long long v43 = v118;
      long long v50 = v64;
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
LABEL_10:
    a2 += 16;
    uint64_t v52 = v124 - 1;
    if (v124 == 1) {
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_34:
  uint64_t result = sub_235A68F70();
  __break(1u);
  return result;
}

char *sub_235A5AA44(char a1, _OWORD *a2)
{
  long long v2 = a2[9];
  v22[8] = a2[8];
  v22[9] = v2;
  long long v3 = a2[11];
  v22[10] = a2[10];
  v22[11] = v3;
  long long v4 = a2[5];
  v22[4] = a2[4];
  v22[5] = v4;
  long long v5 = a2[7];
  v22[6] = a2[6];
  v22[7] = v5;
  long long v6 = a2[1];
  v22[0] = *a2;
  v22[1] = v6;
  long long v7 = a2[3];
  _OWORD v22[2] = a2[2];
  v22[3] = v7;
  if (a1)
  {
    *(void *)&v20[0] = 0;
    *((void *)&v20[0] + 1) = 0xE000000000000000;
    sub_235A68DE0();
    sub_235A68B30();
    char v21 = a1;
    sub_235A68E20();
    sub_235A68B30();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_235A68920();
    __swift_project_value_buffer(v9, (uint64_t)qword_26882DE48);
    os_log_type_t v10 = sub_235A68C30();
    sub_235A65720(v10, 0xD000000000000030, 0x8000000235A6BEA0, *(uint64_t *)&v20[0], *((unint64_t *)&v20[0] + 1));
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    long long v12 = a2[9];
    v20[8] = a2[8];
    v20[9] = v12;
    long long v13 = a2[11];
    v20[10] = a2[10];
    v20[11] = v13;
    long long v14 = a2[5];
    v20[4] = a2[4];
    v20[5] = v14;
    long long v15 = a2[7];
    v20[6] = a2[6];
    v20[7] = v15;
    long long v16 = a2[1];
    v20[0] = *a2;
    v20[1] = v16;
    long long v17 = a2[3];
    v20[2] = a2[2];
    v20[3] = v17;
    id v18 = objc_allocWithZone((Class)type metadata accessor for LanguageSelectionWelcomeController());
    sub_235A3557C((uint64_t)v22);
    long long v11 = (char *)sub_235A59AB8(v20);
    *(void *)&v11[OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate + 8] = &off_26E8ED960;
    swift_unknownObjectWeakAssign();
  }
  return v11;
}

id sub_235A5AC70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSelectionPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LanguageSelectionPresenter()
{
  return self;
}

uint64_t sub_235A5AD94@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

uint64_t sub_235A5AE58(_OWORD *a1)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v6 = v3[11];
  v18[9] = v3[9];
  v18[10] = v5;
  v18[11] = v6;
  long long v7 = v3[5];
  v18[4] = v3[4];
  v18[5] = v7;
  long long v8 = v3[7];
  v18[6] = v3[6];
  v18[7] = v8;
  v18[8] = v4;
  long long v9 = v3[1];
  v18[0] = *v3;
  v18[1] = v9;
  long long v10 = v3[3];
  v18[2] = v3[2];
  v18[3] = v10;
  long long v11 = a1[9];
  v3[8] = a1[8];
  v3[9] = v11;
  long long v12 = a1[11];
  v3[10] = a1[10];
  v3[11] = v12;
  long long v13 = a1[5];
  v3[4] = a1[4];
  v3[5] = v13;
  long long v14 = a1[7];
  v3[6] = a1[6];
  v3[7] = v14;
  long long v15 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v15;
  long long v16 = a1[3];
  v3[2] = a1[2];
  v3[3] = v16;
  return sub_235A346CC((uint64_t)v18);
}

uint64_t (*sub_235A5AF18())()
{
  return j__swift_endAccess;
}

void *sub_235A5AF74()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_presentingViewController);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A5AFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  long long v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_languages);
  swift_beginAccess();
  if (*(void *)(*v6 + 16))
  {
    swift_bridgeObjectRetain();
    sub_235A5D564(a1, a2);
    char v8 = v7;
    swift_bridgeObjectRelease();
    if (v8)
    {
      uint64_t v9 = *v6;
      uint64_t v10 = *(void *)(*v6 + 16);
      long long v11 = (char *)*(id *)(v3 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_dataSourceWriter);
      if (v10)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v12 = sub_235A5D564(a1, a2);
        if (v13)
        {
          long long v14 = (uint64_t *)(*(void *)(v9 + 56) + 16 * v12);
          uint64_t v10 = *v14;
          uint64_t v15 = v14[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v15 = 0;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v15 = 0;
      }
      long long v16 = &v11[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage];
      *(void *)long long v16 = v10;
      *((void *)v16 + 1) = v15;

      swift_bridgeObjectRelease();
    }
  }
  uint64_t result = MEMORY[0x237DECD00](v3 + OBJC_IVAR____TtC9SiriSetup26LanguageSelectionPresenter_delegate);
  if (result)
  {
    uint64_t v18 = swift_retain();
    sub_235A36DAC(v18);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

unint64_t sub_235A5B118(uint64_t a1)
{
  unint64_t v1 = 0xD000000000000012;
  switch(a1)
  {
    case 0:
      return v1;
    case 1:
      unint64_t v1 = 0xD00000000000001BLL;
      break;
    case 2:
      unint64_t v1 = 0x6E69616741797274;
      break;
    case 3:
      unint64_t v1 = 0x6E6964726F636572;
      break;
    case 4:
      unint64_t v1 = 0x63694D646162;
      break;
    case 5:
      unint64_t v1 = 0x52746F4E43565641;
      break;
    case 6:
      unint64_t v1 = 0x6C65636E6163;
      break;
    case 7:
      unint64_t v1 = 0x74756F656D6974;
      break;
    default:
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_235A68920();
      __swift_project_value_buffer(v2, (uint64_t)qword_26882DE48);
      os_log_type_t v3 = sub_235A68C30();
      sub_235A65720(v3, 0xD00000000000001ALL, 0x8000000235A6E7B0, 0x206E776F6E6B6E75, 0xEE00737574617473);
      unint64_t v1 = 0;
      break;
  }
  return v1;
}

unsigned char *storeEnumTagSinglePayload for TrainingState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x235A5B3A8);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainingState()
{
  return &type metadata for TrainingState;
}

uint64_t sub_235A5B3E0(int a1, int a2)
{
  if ((((a2 < 3u) | ~a1) & (a2 < 6u)) != 0) {
    return (a2 + 1);
  }
  else {
    return 6;
  }
}

unint64_t sub_235A5B408@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_235A5B498(*a1);
  *a2 = result;
  return result;
}

void sub_235A5B434(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_235A5B444()
{
  unint64_t result = qword_26882DD58;
  if (!qword_26882DD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882DD58);
  }
  return result;
}

unint64_t sub_235A5B498(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

void sub_235A5B4AC()
{
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_235A68920();
  __swift_project_value_buffer(v0, (uint64_t)qword_26882DE48);
  os_log_type_t v1 = sub_235A68C30();
  sub_235A65720(v1, 0xD000000000000013, 0x8000000235A6D160, 0xD00000000000006DLL, 0x8000000235A6E810);
}

void *sub_235A5B54C(uint64_t a1)
{
  uint64_t v8 = a1;
  uint64_t v7 = sub_235A68CC0();
  uint64_t v2 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A68CA0();
  MEMORY[0x270FA5388]();
  sub_235A68A50();
  MEMORY[0x270FA5388]();
  v1[3] = -1;
  v1[5] = 0;
  swift_unknownObjectWeakInit();
  v1[7] = MEMORY[0x263F8EE80];
  sub_235A3841C();
  sub_235A68A40();
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_235A5E998(&qword_26882DD70, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD78);
  sub_235A5E9E0(&qword_26882DD80, &qword_26882DD78);
  sub_235A68DB0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v7);
  v1[6] = sub_235A68D10();
  v1[2] = v8;
  return v1;
}

void sub_235A5B7C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void (*v57)(uint64_t *__return_ptr, uint64_t, uint64_t);
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  char *v65;
  char *v66;
  uint64_t v67;
  id v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t aBlock;
  unint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  uint64_t (*v83)();
  void *v84;
  uint64_t v85;

  uint64_t v6 = v5;
  unint64_t v76 = a5;
  char v77 = a4;
  uint64_t v10 = sub_235A68A20();
  BOOL v73 = *(void *)(v10 - 8);
  uint64_t v74 = v10;
  MEMORY[0x270FA5388](v10);
  unint64_t v71 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_235A68A50();
  char v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v69 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t aBlock = 0;
  uint64_t v80 = 0xE000000000000000;
  sub_235A68DE0();
  long long v85 = a1;
  swift_retain();
  char v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD68);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  long long v85 = a2;
  type metadata accessor for AFBoolean(0);
  sub_235A68E20();
  sub_235A68B30();
  long long v85 = a3;
  sub_235A68E20();
  uint64_t v13 = aBlock;
  unint64_t v14 = v80;
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_235A68920();
  __swift_project_value_buffer(v15, (uint64_t)qword_26882DE48);
  os_log_type_t v16 = sub_235A68C40();
  sub_235A65720(v16, 0xD000000000000044, 0x8000000235A6EA70, v13, v14);
  swift_bridgeObjectRelease();
  uint64_t v17 = v76;
  sub_235A5CE0C(a1, (uint64_t)v77, v76);
  uint64_t v18 = sub_235A5C788(a1, a2, a3);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t aBlock = a1;
    swift_retain();
    uint64_t aBlock = sub_235A68B10();
    uint64_t v80 = v20;
    sub_235A68B30();
    swift_retain();
    sub_235A389E8();
    swift_release();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    uint64_t v21 = aBlock;
    unint64_t v22 = v80;
    os_log_type_t v23 = sub_235A68C40();
    sub_235A65720(v23, 0xD000000000000044, 0x8000000235A6EA70, v21, v22);
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v19 + 40))
    {
      uint64_t aBlock = 0;
      uint64_t v80 = 0xE000000000000000;
      sub_235A68DE0();
      swift_bridgeObjectRelease();
      uint64_t aBlock = 0xD000000000000018;
      uint64_t v80 = 0x8000000235A6EB00;
      swift_retain();
      sub_235A389E8();
      swift_release();
      sub_235A68B30();
      swift_bridgeObjectRelease();
      sub_235A68B30();
      uint64_t v24 = aBlock;
      unint64_t v25 = v80;
      os_log_type_t v26 = sub_235A68C40();
      sub_235A65720(v26, 0xD000000000000044, 0x8000000235A6EA70, v24, v25);
      swift_bridgeObjectRelease();
      uint64_t v27 = MEMORY[0x237DECD00](v6 + 32);
      if (v27)
      {
        long long v28 = (char *)v27;
        os_log_type_t v29 = sub_235A68C40();
        sub_235A65720(v29, 0xD000000000000026, 0x8000000235A6EB20, 0, 0xE000000000000000);
        if (*(void *)&v28[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter])
        {
          uint64_t v30 = *(void *)&v28[OBJC_IVAR____TtC9SiriSetup20SiriSetupCoordinator_currentPresenter + 8];
          uint64_t ObjectType = swift_getObjectType();
          swift_unknownObjectRetain();
          sub_235A684CC(1, ObjectType, v30);

          swift_unknownObjectRelease();
        }
        else
        {
        }
      }
      uint64_t v39 = (void *)swift_allocObject();
      v39[2] = v6;
      v39[3] = v19;
      id v40 = v77;
      v39[4] = v77;
      v39[5] = v17;
      if (*(unsigned char *)(v19 + 40) == 1)
      {
        swift_beginAccess();
        switch(*(unsigned char *)(v19 + 16))
        {
          case 0:
            uint64_t v41 = swift_getObjectType();
            uint64_t v42 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 184);
            swift_retain_n();
            id v43 = v40;
            swift_retain_n();
            id v44 = v43;
            char v45 = v42(v41, v17);
            goto LABEL_19;
          case 1:
            uint64_t v48 = swift_getObjectType();
            uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 176);
            swift_retain_n();
            id v50 = v40;
            swift_retain_n();
            id v44 = v50;
            char v45 = v49(v48, v17);
LABEL_19:
            int v47 = v45 & 1;
            goto LABEL_20;
          case 2:
            uint64_t v51 = swift_getObjectType();
            uint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 48);
            swift_retain_n();
            id v53 = v40;
            swift_retain_n();
            id v54 = v53;
            if (v52(v51, v17))
            {
              os_log_type_t v55 = sub_235A68C40();
              sub_235A65720(v55, 0xD00000000000002FLL, 0x8000000235A6EB50, 0xD000000000000034, 0x8000000235A6EB80);
              sub_235A5C274(0, v6, v19, v54, v17);

              goto LABEL_22;
            }
            uint64_t v61 = *(void **)(v6 + 48);
            unint64_t v62 = (void *)swift_allocObject();
            v62[2] = v54;
            v62[3] = v17;
            v62[4] = sub_235A5E8B0;
            v62[5] = v39;
            BOOL v83 = sub_235A5E8FC;
            uint64_t v84 = v62;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v80 = 1107296256;
            uint64_t v81 = sub_235A3667C;
            uint64_t v82 = &block_descriptor_38;
            unint64_t v63 = _Block_copy(&aBlock);
            char v77 = v54;
            long long v64 = v61;
            swift_retain();
            long long v65 = v69;
            sub_235A68A30();
            uint64_t v78 = MEMORY[0x263F8EE78];
            sub_235A5E998((unint64_t *)&qword_26882D3A0, MEMORY[0x263F8F030]);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
            sub_235A5E9E0((unint64_t *)&qword_26882D3A8, (uint64_t *)&unk_26882DC90);
            long long v66 = v71;
            uint64_t v67 = v74;
            sub_235A68DB0();
            MEMORY[0x237DEC190](0, v65, v66, v63);
            _Block_release(v63);

            (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v67);
            (*(void (**)(char *, uint64_t))(v70 + 8))(v65, v72);
            long long v68 = v77;

            swift_release_n();
            swift_release_n();
            swift_release();
            break;
          case 4:
            uint64_t v56 = swift_getObjectType();
            long long v57 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v17 + 24);
            swift_retain_n();
            long long v58 = v40;
            swift_retain_n();
            id v44 = v58;
            v57(&aBlock, v56, v17);
            (*(void (**)(uint64_t *, uint64_t (*)(int), void *, uint64_t, uint64_t))(v17 + 168))(&aBlock, sub_235A5E8B0, v39, v56, v17);
            goto LABEL_21;
          case 6:
            swift_retain_n();
            id v59 = v40;
            swift_retain_n();
            uint64_t v60 = v59;
            sub_235A5CB44(v60, v17, (uint64_t)sub_235A5E8B0, (uint64_t)v39);

            goto LABEL_22;
          default:
            goto LABEL_17;
        }
      }
      else
      {
LABEL_17:
        swift_retain_n();
        id v46 = v40;
        swift_retain_n();
        id v44 = v46;
        int v47 = 1;
LABEL_20:
        sub_235A5C274(v47, v6, v19, v44, v17);
LABEL_21:

LABEL_22:
        swift_release_n();
        swift_release_n();
      }
    }
    else
    {
      uint64_t v35 = MEMORY[0x237DECD00](v6 + 32);
      if (v35)
      {
        uint64_t v36 = (void *)v35;
        id v37 = sub_235A5D098(v19);
        sub_235A372D8(v19, v37, v38);

        swift_release();
        return;
      }
    }
    swift_release();
  }
  else
  {
    uint64_t v32 = MEMORY[0x237DECD00](v6 + 32);
    if (v32)
    {
      uint64_t v33 = (void *)v32;
      os_log_type_t v34 = sub_235A68C40();
      sub_235A65720(v34, 0xD000000000000013, 0x8000000235A6EAE0, 0, 0xE000000000000000);
      sub_235A36910();
    }
  }
}

uint64_t sub_235A5C274(int a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v23 = a5;
  int v22 = a1;
  uint64_t v7 = sub_235A68A20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = sub_235A68A50();
  uint64_t v11 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_235A3841C();
  unint64_t v14 = (void *)sub_235A68CD0();
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = a3;
  *(unsigned char *)(v16 + 32) = v22;
  uint64_t v17 = v23;
  *(void *)(v16 + 40) = a4;
  *(void *)(v16 + 48) = v17;
  aBlock[4] = sub_235A5E988;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_47;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  id v19 = a4;
  swift_release();
  sub_235A68A30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_235A5E998((unint64_t *)&qword_26882D3A0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A5E9E0((unint64_t *)&qword_26882D3A8, (uint64_t *)&unk_26882DC90);
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v13, v10, v18);
  _Block_release(v18);

  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v24);
}

void sub_235A5C57C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = Strong;
    sub_235A68DE0();
    swift_retain();
    uint64_t v11 = sub_235A389E8();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    swift_release();
    sub_235A68B30();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_235A68920();
    __swift_project_value_buffer(v14, (uint64_t)qword_26882DE48);
    os_log_type_t v15 = sub_235A68C40();
    sub_235A65720(v15, 0xD000000000000044, 0x8000000235A6EA70, v11, v13);
    swift_bridgeObjectRelease();
    if (a3)
    {
      uint64_t v16 = MEMORY[0x237DECD00](v10 + 32);
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        id v18 = sub_235A5D098(a2);
        sub_235A372D8(a2, v18, v19);

        swift_release();
        return;
      }
    }
    else
    {
      sub_235A5B7C0(a2, 1, 0, a4, a5);
    }
    swift_release();
  }
}

uint64_t sub_235A5C788(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v4 = *(void *)(result + 48);
    BOOL v5 = v4 && a2 == 2;
    if (v5 && a3 == 1)
    {
      swift_retain();
      sub_235A68DE0();
      swift_bridgeObjectRelease();
      unint64_t v12 = 0xD000000000000023;
      unint64_t v13 = "Moving to required successor Page: ";
      goto LABEL_19;
    }
  }
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v9 = *(void *)(v3 + 16);
    if (!(v9 >> 62))
    {
      if (v8 < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_12;
      }
      return 0;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_235A68E50();
  unint64_t result = swift_bridgeObjectRelease();
  if (v8 >= v16) {
    return 0;
  }
LABEL_12:
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v11 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_27;
  }
  *(void *)(v3 + 24) = v11;
  uint64_t v3 = *(void *)(v3 + 16);
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v4 = MEMORY[0x237DEC2A0](v11, v3);
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v11 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v4 = *(void *)(v3 + 8 * v11 + 32);
    swift_retain();
LABEL_17:
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    unint64_t v12 = 0xD000000000000015;
    unint64_t v13 = "Moving to next page: ";
LABEL_19:
    uint64_t v17 = v12;
    unint64_t v18 = (unint64_t)(v13 - 32) | 0x8000000000000000;
    swift_retain();
    sub_235A389E8();
    swift_release();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_235A68920();
    __swift_project_value_buffer(v14, (uint64_t)qword_26882DE48);
    os_log_type_t v15 = sub_235A68C40();
    sub_235A65720(v15, 0xD00000000000004CLL, 0x8000000235A6E980, v17, v18);
    swift_bridgeObjectRelease();
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_235A5C9D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(BOOL))
{
  uint64_t ObjectType = swift_getObjectType();
  char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(ObjectType, a2);
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_235A68920();
  __swift_project_value_buffer(v7, (uint64_t)qword_26882DE48);
  os_log_type_t v8 = sub_235A68C40();
  sub_235A65720(v8, 0xD00000000000002FLL, 0x8000000235A6EB50, 0xD000000000000012, 0x8000000235A6EBC0);
  swift_bridgeObjectRelease();
  return a3((v6 & 1) == 0);
}

uint64_t sub_235A5CB44(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_235A68A20();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[0] = sub_235A68A50();
  uint64_t v13 = *(void *)(v22[0] - 8);
  MEMORY[0x270FA5388](v22[0]);
  os_log_type_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void **)(v4 + 48);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a1;
  v17[5] = a2;
  aBlock[4] = sub_235A5E5B4;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_8;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = v16;
  swift_retain();
  id v20 = a1;
  sub_235A68A30();
  v22[1] = MEMORY[0x263F8EE78];
  sub_235A5E998((unint64_t *)&qword_26882D3A0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A5E9E0((unint64_t *)&qword_26882D3A8, (uint64_t *)&unk_26882DC90);
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, void))(v13 + 8))(v15, v22[0]);
  return swift_release();
}

void sub_235A5CE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t v6 = *(void *)(v3 + 56);
    if (*(void *)(v6 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_235A5D4E0(a1);
      if (v8)
      {
        uint64_t v9 = *(void *)(v6 + 56) + 16 * v7;
        uint64_t v10 = *(void *)(v9 + 8);
        id v11 = *(id *)v9;
        swift_bridgeObjectRelease();
        sub_235A68DE0();
        sub_235A68B30();
        swift_getObjectType();
        swift_getWitnessTable();
        sub_235A68F30();
        sub_235A68B30();
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD68);
        sub_235A68B10();
        sub_235A68B30();
        swift_bridgeObjectRelease();
        if (qword_26882D100 != -1) {
          swift_once();
        }
        uint64_t v12 = sub_235A68920();
        __swift_project_value_buffer(v12, (uint64_t)qword_26882DE48);
        os_log_type_t v13 = sub_235A68C40();
        sub_235A65720(v13, 0xD000000000000031, 0x8000000235A6E920, 0, 0xE000000000000000);
        swift_bridgeObjectRelease();
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(id, uint64_t, uint64_t, uint64_t))(a3 + 200))(v11, v10, ObjectType, a3);
        swift_beginAccess();
        os_log_type_t v15 = (void *)sub_235A5D770(a1);
        swift_endAccess();
        swift_release();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
  }
}

id sub_235A5D098(uint64_t a1)
{
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v4 = (uint64_t *)(v1 + 56);
  if (Strong)
  {
    uint64_t v5 = Strong;
    swift_beginAccess();
    uint64_t v6 = *v4;
    if (*(void *)(*v4 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_235A5D4E0(v5);
      if (v8)
      {
        id v9 = *(id *)(*(void *)(v6 + 56) + 16 * v7);
        swift_release_n();
LABEL_8:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    id v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
    swift_beginAccess();
    swift_retain();
    id v9 = v13;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    sub_235A5E3EC((uint64_t)v9, v5, isUniquelyReferenced_nonNull_native, &v22);
    uint64_t *v4 = v22;
    swift_release();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
  else
  {
    swift_beginAccess();
    uint64_t v10 = *v4;
    if (*(void *)(*v4 + 16))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_235A5D4E0(a1);
      if (v12)
      {
        id v9 = *(id *)(*(void *)(v10 + 56) + 16 * v11);
        swift_release();
        goto LABEL_8;
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
    swift_beginAccess();
    swift_retain();
    id v9 = v15;
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    sub_235A5E3EC((uint64_t)v9, a1, v16, &v22);
    uint64_t *v4 = v22;
    swift_release();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_13:
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_235A68DE0();
  swift_getObjectType();
  uint64_t v22 = (uint64_t)v9;
  swift_getWitnessTable();
  sub_235A68F30();
  sub_235A68B30();
  sub_235A389E8();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  uint64_t v18 = v23;
  unint64_t v17 = v24;
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_235A68920();
  __swift_project_value_buffer(v19, (uint64_t)qword_26882DE48);
  os_log_type_t v20 = sub_235A68C40();
  sub_235A65720(v20, 0xD000000000000015, 0x8000000235A6E900, v18, v17);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_235A5D420()
{
  swift_bridgeObjectRelease();
  sub_235A3492C(v0 + 32);

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for SetupPageListHandler()
{
  return self;
}

void sub_235A5D494(void *a1, uint64_t a2)
{
  *(void *)(*(void *)v2 + 40) = a2;
  swift_unknownObjectWeakAssign();
}

unint64_t sub_235A5D4E0(uint64_t a1)
{
  sub_235A68F90();
  swift_bridgeObjectRetain();
  sub_235A68B20();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_235A68FC0();

  return sub_235A5D5DC(a1, v2);
}

unint64_t sub_235A5D564(uint64_t a1, uint64_t a2)
{
  sub_235A68F90();
  sub_235A68B20();
  uint64_t v4 = sub_235A68FC0();

  return sub_235A5D68C(a1, a2, v4);
}

unint64_t sub_235A5D5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v7 = ~v4;
    uint64_t v8 = *(void *)(v2 + 48);
    do
    {
      uint64_t v9 = *(void *)(v8 + 8 * v5);
      if (*(void *)(v9 + 24) == *(void *)(a1 + 24) && *(void *)(v9 + 32) == *(void *)(a1 + 32)) {
        break;
      }
      if (sub_235A68F50()) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v7;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_235A5D68C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_235A68F50() & 1) == 0)
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
      while (!v14 && (sub_235A68F50() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_235A5D770(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_235A5D4E0(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_235A5E070();
    uint64_t v7 = v10;
  }
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_235A5DE80(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_235A5D848(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD60);
  char v6 = a2;
  uint64_t v7 = sub_235A68E70();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v14 << 6);
      }
      else
      {
        int64_t v21 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v31) {
          goto LABEL_33;
        }
        unint64_t v22 = v32[v21];
        ++v14;
        if (!v22)
        {
          int64_t v14 = v21 + 1;
          if (v21 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v22 = v32[v14];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v31)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
                if (v30 >= 64) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v30;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v32[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v14 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v22 = v32[v14];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v14 << 6);
      }
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      long long v33 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
      if ((v6 & 1) == 0)
      {
        swift_retain();
        id v29 = (id)v33;
      }
      sub_235A68F90();
      swift_bridgeObjectRetain();
      sub_235A68B20();
      swift_bridgeObjectRelease();
      uint64_t result = sub_235A68FC0();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v17 == v25;
          if (v17 == v25) {
            unint64_t v17 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v17);
        }
        while (v27 == -1);
        unint64_t v18 = __clz(__rbit64(~v27)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v8 + 48) + 8 * v18) = v28;
      *(_OWORD *)(*(void *)(v8 + 56) + 16 * v18) = v33;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v8;
  return result;
}

uint64_t sub_235A5DB58(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D608);
  char v42 = a2;
  uint64_t v6 = sub_235A68E70();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    char v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_235A68F90();
    sub_235A68B20();
    uint64_t result = sub_235A68FC0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  char v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_235A5DE80(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_235A68DC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_235A68F90();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_235A68B20();
        swift_bridgeObjectRelease();
        uint64_t v9 = sub_235A68FC0();
        uint64_t result = swift_release();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (void *)(v11 + 8 * v3);
          int64_t v13 = (void *)(v11 + 8 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_235A5E070()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_235A68E60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v22 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v22;
    swift_retain();
    id result = (id)v22;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_235A5E230()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D608);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_235A68E60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_235A5E3EC(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  unint64_t v8 = (void *)*a4;
  unint64_t v10 = sub_235A5D4E0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = (void *)*a4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7] + 16 * v10;

      *(void *)uint64_t v17 = a1;
      *(void *)(v17 + 8) = &off_26E8EC9D0;
      return;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_235A5E070();
    goto LABEL_7;
  }
  sub_235A5D848(v13, a3 & 1);
  unint64_t v18 = sub_235A5D4E0(a2);
  if ((v14 & 1) != (v19 & 1))
  {
LABEL_15:
    type metadata accessor for SetupPage();
    sub_235A68F70();
    __break(1u);
    return;
  }
  unint64_t v10 = v18;
  uint64_t v16 = (void *)*a4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  sub_235A5E524(v10, a2, a1, v16);

  swift_retain();
}

unint64_t sub_235A5E524(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  uint64_t v4 = (void *)(a4[7] + 16 * result);
  void *v4 = a3;
  v4[1] = &off_26E8EC9D0;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_235A5E574()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_235A5E5B4()
{
  uint64_t v1 = *(uint64_t (**)(BOOL))(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t ObjectType = swift_getObjectType();
  BOOL v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 144))(ObjectType, v2) == 0;
  return v1(v4);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

void sub_235A5E638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_235A68DE0();
  sub_235A68B30();
  swift_getObjectType();
  swift_getWitnessTable();
  sub_235A68F30();
  sub_235A68B30();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD68);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_235A68920();
  __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
  os_log_type_t v5 = sub_235A68C40();
  sub_235A65720(v5, 0xD000000000000029, 0x8000000235A6EA20, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  BOOL v6 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocalDataSourceWriter()), sel_init);
  *(void *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled] = 1;
  *(void *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled] = 1;
  *(void *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled] = 1;
  *(void *)&v6[OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_setupDismissed] = 2;
  (*(void (**)(void))(a3 + 200))();
}

uint64_t sub_235A5E868()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_235A5E8B0(int a1)
{
  return sub_235A5C274(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_235A5E8BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_235A5E8FC()
{
  return sub_235A5C9D4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(BOOL))(v0 + 32));
}

uint64_t sub_235A5E908()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A5E940()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_235A5E988()
{
  sub_235A5C57C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_235A5E998(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_235A5E9E0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_235A5EA40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_235A68F50();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_235A68F50() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_235A5EB08()
{
  uint64_t v1 = OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode;
  switch(*(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode))
  {
    case 1:
    case 2:
    case 3:
      char v2 = sub_235A68F50();
      swift_bridgeObjectRelease();
      char v3 = 0;
      if (v2) {
        goto LABEL_5;
      }
      switch(*(unsigned char *)(v0 + v1))
      {
        case 1:
          goto LABEL_4;
        default:
          char v5 = sub_235A68F50();
          swift_bridgeObjectRelease();
          char v3 = v5 ^ 1;
          unsigned __int8 v4 = sub_235A5ECF8();
          if ((v4 & 1) == 0) {
            goto LABEL_8;
          }
          break;
      }
      break;
    default:
LABEL_4:
      swift_bridgeObjectRelease();
      char v3 = 0;
LABEL_5:
      unsigned __int8 v4 = sub_235A5ECF8();
      if ((v4 & 1) == 0)
      {
LABEL_8:
        if ((v3 & 1) == 0) {
          unsigned __int8 v4 = *(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_hasVoiceProfileInCloud);
        }
      }
      break;
  }
  return v4 & 1;
}

id sub_235A5ECF8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager);
  if (*(void *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_siriSharedUserId + 8))
  {
    id v2 = v1;
    swift_bridgeObjectRetain();
    char v3 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = v1;
    char v3 = 0;
  }
  id v5 = objc_msgSend(self, sel_sharedPreferences);
  id v6 = objc_msgSend(v5, sel_languageCode);

  if (v6)
  {
    sub_235A68B00();
  }
  uint64_t v7 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v1, sel_isSATEnrolledForSiriProfileId_languageCode_, v3, v7);

  return v8;
}

id sub_235A5EE20(char a1)
{
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  swift_bridgeObjectRetain();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_235A68920();
  __swift_project_value_buffer(v3, (uint64_t)qword_26882DE48);
  os_log_type_t v4 = sub_235A68C40();
  sub_235A65720(v4, 0xD000000000000017, 0x8000000235A6BB50, 0xD000000000000023, 0x8000000235A6EF10);
  swift_bridgeObjectRelease();
  *(unsigned char *)(*(void *)(v1 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource)
           + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled) = a1 & 1;
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup8Defaults_settings);

  return objc_msgSend(v5, sel_setRecognizeMyVoiceEnabled_);
}

uint64_t sub_235A5EFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (a1)
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    sub_235A68F80();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_235A68920();
    __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
    os_log_type_t v6 = sub_235A68C30();
    sub_235A65720(v6, 0xD000000000000022, 0x8000000235A6F080, 0xD00000000000001CLL, 0x8000000235A6F160);
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    sub_235A68DE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
    sub_235A68B10();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_235A68920();
    __swift_project_value_buffer(v11, (uint64_t)qword_26882DE48);
    os_log_type_t v12 = sub_235A68C40();
    sub_235A65720(v12, 0xD000000000000022, 0x8000000235A6F080, 0xD000000000000017, 0x8000000235A6F140);
    swift_bridgeObjectRelease();
    uint64_t v7 = a2;
    uint64_t v8 = a3;
  }
  return a4(v7, v8);
}

uint64_t sub_235A5F234(char a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  sub_235A68B30();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_235A68920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
  os_log_type_t v6 = sub_235A68C40();
  sub_235A65720(v6, 0xD000000000000028, 0x8000000235A6F110, 0xD00000000000001ELL, 0x8000000235A6F0F0);
  swift_bridgeObjectRelease();
  return a3(a1 & 1);
}

void sub_235A5F3C8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237DECD00](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus);
    id v5 = *(id *)(v2 + OBJC_IVAR____TtC9SiriSetup8Defaults_settings);
    os_log_type_t v6 = (void *)sub_235A68AF0();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v3;
    aBlock[4] = sub_235A62E9C;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235A5F760;
    aBlock[3] = &block_descriptor_93;
    uint64_t v8 = _Block_copy(aBlock);
    id v9 = v3;
    swift_release();
    objc_msgSend(v5, sel_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion_, v4, 0, 1, v6, v8);
    _Block_release(v8);
  }
}

void sub_235A5F534(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    sub_235A68DE0();
    sub_235A68B30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882DE08);
    sub_235A68E20();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_235A68920();
    __swift_project_value_buffer(v3, (uint64_t)qword_26882DE48);
    os_log_type_t v4 = sub_235A68C30();
    sub_235A65720(v4, 0xD000000000000015, 0x8000000235A6BBB0, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_235A68DE0();
    sub_235A68B30();
    type metadata accessor for AFSiriDataSharingOptInStatus(0);
    sub_235A68E20();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_235A68920();
    __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
    os_log_type_t v6 = sub_235A68C40();
    sub_235A65720(v6, 0xD000000000000015, 0x8000000235A6BBB0, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
  }
}

void sub_235A5F760(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_235A5F7CC(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x237DECD00](v4);
  os_log_type_t v6 = (void *)v5;
  if (v5)
  {
    id v7 = *(id *)(v5 + OBJC_IVAR____TtC9SiriSetup8Defaults_settings);

    aBlock[4] = sub_235A63000;
    aBlock[5] = a1;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235A5FB44;
    aBlock[3] = &block_descriptor_112;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_getSiriDataSharingOptInStatusWithCompletion_, v8);
    _Block_release(v8);
  }
  *a2 = v6 == 0;
}

void sub_235A5F8F4(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v4 = a1;
    sub_235A68DE0();
    sub_235A68B30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882DE08);
    sub_235A68E20();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_235A68920();
    __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
    os_log_type_t v6 = sub_235A68C30();
    sub_235A65720(v6, 0xD00000000000001CLL, 0x8000000235A6F1A0, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = a3 + 16;
    swift_beginAccess();
    id v9 = (char *)MEMORY[0x237DECD00](v8);
    if (v9)
    {
      *(void *)&v9[OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus] = a2;
    }
    sub_235A68DE0();
    sub_235A68B30();
    type metadata accessor for AFSiriDataSharingOptInStatus(0);
    sub_235A68E20();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_235A68920();
    __swift_project_value_buffer(v10, (uint64_t)qword_26882DE48);
    os_log_type_t v11 = sub_235A68C40();
    sub_235A65720(v11, 0xD00000000000001CLL, 0x8000000235A6F1A0, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
  }
}

void sub_235A5FB44(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  v5(a2, a3);
  swift_release();
}

void sub_235A5FBBC(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  switch(*a1)
  {
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v7 = sub_235A68F50();
      swift_bridgeObjectRelease();
      if (v7) {
LABEL_4:
      }
        uint64_t v8 = 2;
      else {
        uint64_t v8 = 1;
      }
      uint64_t v9 = sub_235A621D8();
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = MEMORY[0x263F8EE78];
      }
      uint64_t v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      sub_235A68DE0();
      sub_235A68B30();
      MEMORY[0x237DEC020](v10, MEMORY[0x263F8D310]);
      sub_235A68B30();
      swift_bridgeObjectRelease();
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_235A68920();
      __swift_project_value_buffer(v11, (uint64_t)qword_26882DE48);
      os_log_type_t v12 = sub_235A68C40();
      sub_235A65720(v12, 0xD000000000000028, 0x8000000235A6EE20, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      id v13 = *(id *)&v3[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementFlowConfigurationProvider];
      char v14 = (void *)sub_235A68B60();
      swift_bridgeObjectRelease();
      uint64_t v15 = (void *)swift_allocObject();
      v15[2] = v4;
      v15[3] = a2;
      v15[4] = a3;
      uint64_t v22 = sub_235A62DEC;
      int64_t v23 = v15;
      uint64_t v18 = MEMORY[0x263EF8330];
      unint64_t v19 = 1107296256;
      unint64_t v20 = sub_235A6046C;
      uint64_t v21 = &block_descriptor_9;
      uint64_t v16 = _Block_copy(&v18);
      id v17 = v4;
      swift_retain();
      swift_release();
      objc_msgSend(v13, sel_configurationForEnablementFlow_recognitionLanguageCodes_completion_, v8, v14, v16);
      _Block_release(v16);

      return;
  }
}

uint64_t sub_235A5FED8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_235A68A20();
  uint64_t v20 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_235A68A50();
  uint64_t v10 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  os_log_type_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A348B8(0, (unint64_t *)&qword_26882DC80);
  id v13 = (void *)sub_235A68CD0();
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a1;
  v15[4] = a3;
  v15[5] = a4;
  aBlock[4] = sub_235A62E90;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235A3667C;
  aBlock[3] = &block_descriptor_87;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a1;
  swift_retain();
  swift_release();
  sub_235A68A30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_235A5E998((unint64_t *)&qword_26882D3A0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26882DC90);
  sub_235A62EA4((unint64_t *)&qword_26882D3A8, (uint64_t *)&unk_26882DC90);
  sub_235A68DB0();
  MEMORY[0x237DEC190](0, v12, v9, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

void sub_235A601F8(uint64_t a1, void *a2, void (*a3)(id))
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x237DECD00](v5);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    id v8 = objc_msgSend(self, sel_sharedPreferences);
    id v9 = objc_msgSend(v8, sel_languageCode);

    if (v9)
    {
      sub_235A68B00();
    }
    else
    {
      sub_235A62584();
    }
    uint64_t v10 = *(void **)&v7[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementConfiguration];
    *(void *)&v7[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementConfiguration] = a2;
    id v11 = a2;

    sub_235A68DE0();
    sub_235A68B30();
    id v12 = objc_msgSend(v11, sel_description);
    sub_235A68B00();

    sub_235A68B30();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    sub_235A68B30();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_235A68920();
    __swift_project_value_buffer(v13, (uint64_t)qword_26882DE48);
    os_log_type_t v14 = sub_235A68C40();
    sub_235A65720(v14, 0xD000000000000028, 0x8000000235A6EE20, 0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v11, sel_requiresVoiceSelectionForRecognitionLanguage_, v15);

    a3(v16);
  }
}

void sub_235A6046C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_235A604D4()
{
  uint64_t v1 = sub_235A621D8();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs;
    uint64_t v4 = v2 - 1;
    uint64_t v5 = v1 + 40;
    do
    {
      uint64_t v6 = *(void **)(v0 + v3);
      swift_bridgeObjectRetain();
      id v7 = v6;
      id v8 = (void *)sub_235A68AF0();
      swift_bridgeObjectRelease();
      uint64_t v9 = (uint64_t)objc_msgSend(v7, sel_isCompactVoiceTriggerAvailableForLanguageCode_, v8);

      BOOL v11 = v4-- != 0;
      if (!v9) {
        break;
      }
      v5 += 16;
    }
    while (v11);
  }
  else
  {
    uint64_t v9 = 1;
  }
  swift_bridgeObjectRelease();
  return v9;
}

char *sub_235A605B4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v58 = sub_235A68CC0();
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  long long v57 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_235A68CA0();
  MEMORY[0x270FA5388](v54);
  os_log_type_t v55 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_235A68A50();
  MEMORY[0x270FA5388](v10 - 8);
  id v53 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *a1;
  uint64_t v13 = &v4[OBJC_IVAR____TtC9SiriSetup8Defaults_iCloudAltDSID];
  *uint64_t v13 = 0;
  v13[1] = 0;
  os_log_type_t v14 = &v4[OBJC_IVAR____TtC9SiriSetup8Defaults_siriSharedUserId];
  *os_log_type_t v14 = 0;
  v14[1] = 0;
  v4[OBJC_IVAR____TtC9SiriSetup8Defaults_hasVoiceProfileInCloud] = 0;
  uint64_t v15 = OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource;
  LOBYTE(aBlock) = 0;
  id v16 = objc_allocWithZone((Class)type metadata accessor for LocalDataSource());
  id v17 = v4;
  *(void *)&v4[v15] = sub_235A68278(0, 0, 0x53552D6E65, 0xE500000000000000, (char *)&aBlock, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          1);
  v17[OBJC_IVAR____TtC9SiriSetup8Defaults_setupDismissed] = 0;
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementConfiguration] = 0;
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus] = 0;
  v17[OBJC_IVAR____TtC9SiriSetup8Defaults_shouldShowIntro] = 1;
  uint64_t aBlock = 0;
  unint64_t v61 = 0xE000000000000000;
  sub_235A68DE0();
  sub_235A68B30();
  LOBYTE(v67) = v12;
  sub_235A68E20();
  sub_235A68B30();
  uint64_t v67 = a2;
  uint64_t v68 = a3;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  uint64_t v19 = aBlock;
  unint64_t v18 = v61;
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_235A68920();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26882DE48);
  os_log_type_t v22 = sub_235A68C40();
  uint64_t v59 = v21;
  sub_235A65720(v22, 0xD000000000000019, 0x8000000235A6F000, v19, v18);
  swift_bridgeObjectRelease();
  v17[OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode] = v12;
  *uint64_t v13 = a2;
  v13[1] = a3;
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F285E0]), sel_init);
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_settings] = v23;
  sub_235A348B8(0, (unint64_t *)&qword_26882DC80);
  sub_235A68A30();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_235A5E998(&qword_26882DD70, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DD78);
  sub_235A62EA4(&qword_26882DD80, &qword_26882DD78);
  sub_235A68DB0();
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v57, *MEMORY[0x263F8F130], v58);
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_settingsQueue] = sub_235A68D10();
  id v24 = objc_msgSend(objc_allocWithZone((Class)SRSVoiceProfileManager), sel_init);
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager] = v24;
  id v25 = objc_msgSend(objc_allocWithZone((Class)SRSVTPreferences), sel_init);
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs] = v25;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28500]), sel_init);
  *(void *)&v17[OBJC_IVAR____TtC9SiriSetup8Defaults_enablementFlowConfigurationProvider] = v26;

  int64_t v27 = (objc_class *)type metadata accessor for Defaults();
  v66.receiver = v17;
  v66.super_class = v27;
  unint64_t v28 = (char *)objc_msgSendSuper2(&v66, sel_init);
  BOOL v29 = *(void **)&v28[OBJC_IVAR____TtC9SiriSetup8Defaults_settingsQueue];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v30 = v28;
  id v31 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DE18);
  sub_235A68CE0();

  swift_release();
  uint64_t v32 = *(void **)&v30[OBJC_IVAR____TtC9SiriSetup8Defaults_voiceProfileManager];
  uint64_t v33 = self;
  id v34 = v32;
  id v35 = objc_msgSend(v33, sel_sharedPreferences);
  id v36 = objc_msgSend(v35, sel_languageCode);

  if (v36)
  {
    sub_235A68B00();
  }
  uint64_t v37 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  unsigned __int8 v38 = objc_msgSend(v34, sel_hasVoiceProfileIniCloudForLanguageCode_, v37);

  v30[OBJC_IVAR____TtC9SiriSetup8Defaults_hasVoiceProfileInCloud] = v38;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v30;
  int64_t v40 = v30;
  os_log_type_t v41 = sub_235A68C40();
  sub_235A65720(v41, 0xD000000000000022, 0x8000000235A6F080, 0xD000000000000029, 0x8000000235A6F0B0);
  uint64_t v42 = *(void *)&v40[OBJC_IVAR____TtC9SiriSetup8Defaults_iCloudAltDSID + 8];
  if (v42) {
    uint64_t v43 = *(void *)&v40[OBJC_IVAR____TtC9SiriSetup8Defaults_iCloudAltDSID];
  }
  else {
    uint64_t v43 = 0;
  }
  if (v42) {
    uint64_t v44 = *(void *)&v40[OBJC_IVAR____TtC9SiriSetup8Defaults_iCloudAltDSID + 8];
  }
  else {
    uint64_t v44 = 0xE000000000000000;
  }
  sub_235A348B8(0, &qword_26882DC78);
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_235A62F04;
  *(void *)(v45 + 24) = v39;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235A3C7C8(v43, v44, (uint64_t)sub_235A62F8C, v45);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = v40;
  int v47 = *(void **)&v40[OBJC_IVAR____TtC9SiriSetup8Defaults_settings];
  uint64_t v48 = (void *)swift_allocObject();
  v48[2] = v40;
  v48[3] = sub_235A62FCC;
  v48[4] = v46;
  long long v64 = sub_235A62FF4;
  long long v65 = v48;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v61 = 1107296256;
  unint64_t v62 = sub_235A484A8;
  unint64_t v63 = &block_descriptor_109;
  uint64_t v49 = _Block_copy(&aBlock);
  id v50 = v40;
  id v51 = v47;
  swift_retain();
  swift_release();
  objc_msgSend(v51, sel_fetchMultiUserVoiceIdentificationSetting_, v49);
  _Block_release(v49);
  swift_release();

  return v50;
}

id sub_235A60E9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Defaults();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Defaults()
{
  return self;
}

uint64_t sub_235A60FB8(uint64_t a1, uint64_t a2)
{
  return sub_235A60FD0(a1, a2, &OBJC_IVAR____TtC9SiriSetup8Defaults_iCloudAltDSID);
}

uint64_t sub_235A60FC4(uint64_t a1, uint64_t a2)
{
  return sub_235A60FD0(a1, a2, &OBJC_IVAR____TtC9SiriSetup8Defaults_siriSharedUserId);
}

uint64_t sub_235A60FD0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(v3 + *a3);
  swift_bridgeObjectRetain();
  return v4;
}

void sub_235A61008(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode);
}

uint64_t sub_235A61028()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_hasVoiceProfileInCloud);
}

uint64_t sub_235A61038()
{
  return 0x20100u >> (8 * *(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_enrollmentMode));
}

uint64_t sub_235A61058()
{
  id v0 = objc_msgSend(self, sel_sharedPreferences);
  id v1 = objc_msgSend(v0, sel_languageCode);

  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_235A68B00();

  return v2;
}

id sub_235A610EC()
{
  id v0 = objc_msgSend(self, sel_sharedPreferences);
  id v1 = objc_msgSend(v0, sel_assistantIsEnabled);

  return v1;
}

uint64_t sub_235A61144()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_setupDismissed);
}

uint64_t sub_235A61154()
{
  return *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_internalSiriDataSharingStatus);
}

id sub_235A61164()
{
  id v0 = objc_msgSend(self, sel_sharedPreferences);
  id v1 = objc_msgSend(v0, sel_outputVoice);

  return v1;
}

uint64_t sub_235A611C4()
{
  return sub_235A61A9C(v0, *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource));
}

uint64_t sub_235A611E0()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup8Defaults_shouldShowIntro);
}

void sub_235A611F4(uint64_t a1)
{
  sub_235A37DB4(a1, v1);
}

void *sub_235A611FC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_235A62398(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_235A6130C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26882DE10);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
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
    sub_235A6248C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235A61434(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled), *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled));
  uint64_t v6 = v5;
  uint64_t v7 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_voiceTriggerEnabled), *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_voiceTriggerEnabled));
  uint64_t v9 = v8;
  uint64_t v52 = v7;
  uint64_t v10 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled), *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled));
  uint64_t v12 = v11;
  uint64_t v53 = v10;
  uint64_t v54 = v10;
  uint64_t v55 = v11;
  uint64_t v56 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriInCallEnabled), *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriInCallEnabled));
  uint64_t v57 = v13;
  os_log_type_t v14 = *(void **)(a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice);
  uint64_t v15 = *(void **)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice);
  id v16 = v14;
  id v17 = v15;
  uint64_t v18 = sub_235A629CC(v15, v14);
  uint64_t v20 = v19;

  uint64_t v21 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguage);
  uint64_t v22 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguage + 8);
  uint64_t v23 = a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_languageCode;
  uint64_t v24 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_languageCode);
  uint64_t v25 = *(void *)(v23 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_235A62BC4(v21, v22, v24, v25);
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v58 = v26;
  uint64_t v59 = v28;
  if (!v6)
  {
    BOOL v29 = (void *)MEMORY[0x263F8EE78];
    uint64_t v32 = v53;
    if (!v9) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  BOOL v29 = sub_235A611FC(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v31 = v29[2];
  unint64_t v30 = v29[3];
  if (v31 >= v30 >> 1) {
    BOOL v29 = sub_235A611FC((void *)(v30 > 1), v31 + 1, 1, v29);
  }
  uint64_t v32 = v53;
  _OWORD v29[2] = v31 + 1;
  uint64_t v33 = &v29[2 * v31];
  v33[4] = v4;
  v33[5] = v6;
  if (v9)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v29 = sub_235A611FC(0, v29[2] + 1, 1, v29);
    }
    unint64_t v35 = v29[2];
    unint64_t v34 = v29[3];
    if (v35 >= v34 >> 1) {
      BOOL v29 = sub_235A611FC((void *)(v34 > 1), v35 + 1, 1, v29);
    }
    _OWORD v29[2] = v35 + 1;
    id v36 = &v29[2 * v35];
    v36[4] = v52;
    v36[5] = v9;
    uint64_t v32 = v54;
    uint64_t v12 = v55;
  }
LABEL_12:
  if (v12)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v29 = sub_235A611FC(0, v29[2] + 1, 1, v29);
    }
    unint64_t v38 = v29[2];
    unint64_t v37 = v29[3];
    if (v38 >= v37 >> 1) {
      BOOL v29 = sub_235A611FC((void *)(v37 > 1), v38 + 1, 1, v29);
    }
    _OWORD v29[2] = v38 + 1;
    uint64_t v39 = &v29[2 * v38];
    v39[4] = v32;
    v39[5] = v12;
  }
  if (v57)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v29 = sub_235A611FC(0, v29[2] + 1, 1, v29);
    }
    unint64_t v41 = v29[2];
    unint64_t v40 = v29[3];
    if (v41 >= v40 >> 1) {
      BOOL v29 = sub_235A611FC((void *)(v40 > 1), v41 + 1, 1, v29);
    }
    _OWORD v29[2] = v41 + 1;
    uint64_t v42 = &v29[2 * v41];
    v42[4] = v56;
    v42[5] = v57;
  }
  if (v20)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v29 = sub_235A611FC(0, v29[2] + 1, 1, v29);
    }
    unint64_t v44 = v29[2];
    unint64_t v43 = v29[3];
    if (v44 >= v43 >> 1) {
      BOOL v29 = sub_235A611FC((void *)(v43 > 1), v44 + 1, 1, v29);
    }
    _OWORD v29[2] = v44 + 1;
    uint64_t v45 = &v29[2 * v44];
    v45[4] = v18;
    v45[5] = v20;
  }
  if (v59)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v29 = sub_235A611FC(0, v29[2] + 1, 1, v29);
    }
    unint64_t v47 = v29[2];
    unint64_t v46 = v29[3];
    if (v47 >= v46 >> 1) {
      BOOL v29 = sub_235A611FC((void *)(v46 > 1), v47 + 1, 1, v29);
    }
    _OWORD v29[2] = v47 + 1;
    uint64_t v48 = &v29[2 * v47];
    v48[4] = v58;
    v48[5] = v59;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
  swift_arrayDestroy();
  if (v29[2])
  {
    sub_235A68DE0();
    sub_235A68B30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882DDF8);
    sub_235A62EA4(&qword_26882DE00, &qword_26882DDF8);
    sub_235A68AE0();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_235A68920();
    __swift_project_value_buffer(v49, (uint64_t)qword_26882DE48);
    os_log_type_t v50 = sub_235A68C30();
    sub_235A65720(v50, 0x6F28796669726576, 0xEE00293A72656874, 0, 0xE000000000000000);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_235A61A9C(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled);
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_sharedPreferences);
  int v7 = objc_msgSend(v6, sel_assistantIsEnabled);

  uint64_t v8 = sub_235A62844(v4, v7);
  uint64_t v10 = v9;
  uint64_t v58 = v8;
  uint64_t v11 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_voiceTriggerEnabled), (int)objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC9SiriSetup8Defaults_voiceTriggerPrefs), sel_voiceTriggerEnabled));
  uint64_t v13 = v12;
  uint64_t v59 = v11;
  uint64_t v14 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled), *(unsigned __int8 *)(*(void *)(a1 + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource)+ OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled));
  uint64_t v16 = v15;
  uint64_t v60 = v14;
  uint64_t v61 = v14;
  uint64_t v62 = v15;
  uint64_t v63 = sub_235A62844(*(unsigned char *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriInCallEnabled), 0);
  uint64_t v64 = v17;
  uint64_t v18 = *(void **)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice);
  id v19 = v18;
  id v20 = objc_msgSend(v5, (SEL)&selRef_sharedApplication + 7);
  id v21 = objc_msgSend(v20, sel_outputVoice);

  uint64_t v22 = sub_235A629CC(v18, v21);
  uint64_t v24 = v23;

  uint64_t v65 = v22;
  uint64_t v66 = v24;
  uint64_t v26 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguage);
  uint64_t v25 = *(void *)(a2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguage + 8);
  swift_bridgeObjectRetain();
  id v27 = objc_msgSend(v5, (SEL)&selRef_sharedApplication + 7);
  id v28 = objc_msgSend(v27, sel_languageCode);

  if (v28)
  {
    uint64_t v29 = sub_235A68B00();
    uint64_t v31 = v30;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v31 = 0;
  }
  uint64_t v32 = sub_235A62BC4(v26, v25, v29, v31);
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v67 = v32;
  uint64_t v35 = v60;
  if (!v10)
  {
    id v36 = (void *)MEMORY[0x263F8EE78];
    if (!v13) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  id v36 = sub_235A611FC(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v38 = v36[2];
  unint64_t v37 = v36[3];
  if (v38 >= v37 >> 1) {
    id v36 = sub_235A611FC((void *)(v37 > 1), v38 + 1, 1, v36);
  }
  _OWORD v36[2] = v38 + 1;
  uint64_t v39 = &v36[2 * v38];
  v39[4] = v58;
  v39[5] = v10;
  if (v13)
  {
LABEL_10:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v36 = sub_235A611FC(0, v36[2] + 1, 1, v36);
    }
    unint64_t v41 = v36[2];
    unint64_t v40 = v36[3];
    if (v41 >= v40 >> 1) {
      id v36 = sub_235A611FC((void *)(v40 > 1), v41 + 1, 1, v36);
    }
    _OWORD v36[2] = v41 + 1;
    uint64_t v42 = &v36[2 * v41];
    v42[4] = v59;
    v42[5] = v13;
    uint64_t v35 = v61;
    uint64_t v16 = v62;
  }
LABEL_15:
  if (v16)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v36 = sub_235A611FC(0, v36[2] + 1, 1, v36);
    }
    unint64_t v44 = v36[2];
    unint64_t v43 = v36[3];
    if (v44 >= v43 >> 1) {
      id v36 = sub_235A611FC((void *)(v43 > 1), v44 + 1, 1, v36);
    }
    _OWORD v36[2] = v44 + 1;
    uint64_t v45 = &v36[2 * v44];
    v45[4] = v35;
    v45[5] = v16;
  }
  if (v64)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v36 = sub_235A611FC(0, v36[2] + 1, 1, v36);
    }
    unint64_t v47 = v36[2];
    unint64_t v46 = v36[3];
    if (v47 >= v46 >> 1) {
      id v36 = sub_235A611FC((void *)(v46 > 1), v47 + 1, 1, v36);
    }
    _OWORD v36[2] = v47 + 1;
    uint64_t v48 = &v36[2 * v47];
    v48[4] = v63;
    v48[5] = v64;
  }
  if (v66)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v36 = sub_235A611FC(0, v36[2] + 1, 1, v36);
    }
    unint64_t v50 = v36[2];
    unint64_t v49 = v36[3];
    if (v50 >= v49 >> 1) {
      id v36 = sub_235A611FC((void *)(v49 > 1), v50 + 1, 1, v36);
    }
    _OWORD v36[2] = v50 + 1;
    id v51 = &v36[2 * v50];
    v51[4] = v65;
    v51[5] = v66;
  }
  if (v34)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v36 = sub_235A611FC(0, v36[2] + 1, 1, v36);
    }
    unint64_t v53 = v36[2];
    unint64_t v52 = v36[3];
    if (v53 >= v52 >> 1) {
      id v36 = sub_235A611FC((void *)(v52 > 1), v53 + 1, 1, v36);
    }
    _OWORD v36[2] = v53 + 1;
    uint64_t v54 = &v36[2 * v53];
    v54[4] = v67;
    v54[5] = v34;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
  swift_arrayDestroy();
  if (v36[2])
  {
    sub_235A68DE0();
    sub_235A68B30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882DDF8);
    sub_235A62EA4(&qword_26882DE00, &qword_26882DDF8);
    sub_235A68AE0();
    swift_bridgeObjectRelease();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_235A68920();
    __swift_project_value_buffer(v55, (uint64_t)qword_26882DE48);
    os_log_type_t v56 = sub_235A68C30();
    sub_235A65720(v56, 0x6F28796669726576, 0xEE00293A72656874, 0, 0xE000000000000000);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_235A621D8()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_235A688C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  HIBYTE(v10) = 0;
  id v4 = objc_msgSend(self, sel_sharedPreferences);
  id v5 = objc_msgSend(self, sel_currentLocale);
  sub_235A688B0();

  sub_235A688A0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v6 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_allSiriLanguageCodesForSystemLanguageCode_isGoodFit_, v6, (char *)&v10 + 7);

  if (!v7) {
    return 0;
  }
  uint64_t v8 = sub_235A68B70();

  return v8;
}

uint64_t sub_235A62398(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_235A68E90();
  __break(1u);
  return result;
}

uint64_t sub_235A6248C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_235A68E90();
  __break(1u);
  return result;
}

uint64_t sub_235A62584()
{
  id v0 = objc_msgSend(self, sel_sharedPreferences);
  id v1 = objc_msgSend(v0, sel_bestSupportedLanguageCodeForLanguageCode_, 0);

  if (v1)
  {
    uint64_t v2 = sub_235A68B00();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v4 = 0;
  }
  sub_235A68DE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
  sub_235A68B10();
  sub_235A68B30();
  swift_bridgeObjectRelease();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_235A68920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26882DE48);
  os_log_type_t v6 = sub_235A68C40();
  sub_235A65720(v6, 0xD000000000000019, 0x8000000235A6EDD0, 0xD00000000000002ELL, 0x8000000235A6EDF0);
  swift_bridgeObjectRelease();
  if (v4) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t sub_235A62720()
{
  uint64_t result = sub_235A621D8();
  if (result)
  {
    id v1 = (void *)result;
    if (*(void *)(result + 16) <= 1uLL)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      uint64_t v2 = self;
      id v3 = objc_msgSend(v2, sel_sharedPreferences);
      id v4 = objc_msgSend(v3, sel_languageCode);

      if (v4
        && (v4,
            id v5 = objc_msgSend(v2, sel_sharedPreferences),
            id v6 = objc_msgSend(v5, sel_languageCode),
            v5,
            v6))
      {
        uint64_t v7 = sub_235A68B00();
        uint64_t v9 = v8;

        char v10 = sub_235A5EA40(v7, v9, v1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0) {
          return 0;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_235A62844(char a1, int a2)
{
  if (a1 == 2) {
    return 0;
  }
  BOOL v4 = (a1 & 1) == 0;
  sub_235A68F60();
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  swift_unknownObjectRelease();
  uint64_t result = 0;
  if (!v5 && ((v4 ^ a2) & 1) == 0)
  {
    BYTE8(v6) = 0;
    sub_235A68DE0();
    sub_235A68B30();
    sub_235A68B30();
    sub_235A68E20();
    sub_235A68B30();
    *(void *)&long long v6 = a2 & 1;
    sub_235A68E20();
    return *(void *)((char *)&v6 + 1);
  }
  return result;
}

uint64_t sub_235A629CC(void *a1, void *a2)
{
  if (a1 == (void *)1) {
    return 0;
  }
  id v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D938);
  sub_235A68F60();
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  swift_unknownObjectRelease();
  if (v6) {
    goto LABEL_4;
  }
  if (a1)
  {
    if (a2)
    {
      sub_235A348B8(0, &qword_26882D568);
      sub_235A62DD8(a1);
      id v8 = a2;
      char v9 = sub_235A68D40();

      sub_235A62DC8(a1);
      if (v9)
      {
LABEL_4:
        uint64_t v7 = a1;
LABEL_5:
        sub_235A62DC8(v7);
        return 0;
      }
    }
  }
  else if (!a2)
  {
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  sub_235A68DE0();
  sub_235A68B30();
  sub_235A68B30();
  sub_235A68E20();
  sub_235A68B30();
  sub_235A68E20();
  sub_235A62DC8(a1);
  return 0;
}

uint64_t sub_235A62BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 1) {
    return 0;
  }
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D930);
  sub_235A68F60();
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  swift_unknownObjectRelease();
  if (v9) {
    goto LABEL_4;
  }
  if (a2)
  {
    if (a4 && (a1 == a3 && a2 == a4 || (sub_235A68F50() & 1) != 0))
    {
LABEL_4:
      uint64_t v10 = a1;
      uint64_t v11 = a2;
LABEL_5:
      sub_235A62DB4(v10, v11);
      return 0;
    }
  }
  else if (!a4)
  {
    uint64_t v10 = a1;
    uint64_t v11 = 0;
    goto LABEL_5;
  }
  sub_235A68DE0();
  sub_235A68B30();
  sub_235A68B30();
  sub_235A68E20();
  sub_235A68B30();
  sub_235A68E20();
  sub_235A62DB4(a1, a2);
  return 0;
}

uint64_t sub_235A62DB4(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_235A62DC8(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_235A62DD8(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_235A62DEC(void *a1)
{
  return sub_235A5FED8(a1, v1[2], v1[3], v1[4]);
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_235A62E10()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A62E48()
{
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_235A62E90()
{
  sub_235A601F8(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_235A62E9C(void *a1)
{
}

uint64_t sub_235A62EA4(unint64_t *a1, uint64_t *a2)
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

void sub_235A62EE8(BOOL *a1@<X8>)
{
  sub_235A5F7CC(v1, a1);
}

uint64_t sub_235A62F04(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(*(void *)(v2 + 16) + OBJC_IVAR____TtC9SiriSetup8Defaults_siriSharedUserId);
  void *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235A62F54()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235A62F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235A5EFE8(a1, a2, a3, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_235A62F94()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A62FCC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC9SiriSetup8Defaults_localDataSource)
           + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled) = result;
  return result;
}

uint64_t sub_235A62FF4(char a1)
{
  return sub_235A5F234(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

void sub_235A63000(void *a1, uint64_t a2)
{
  sub_235A5F8F4(a1, a2, v2);
}

id sub_235A63030(long long *a1)
{
  long long v2 = a1[9];
  long long v79 = a1[8];
  long long v80 = v2;
  long long v3 = a1[11];
  long long v81 = a1[10];
  long long v82 = v3;
  long long v4 = a1[5];
  long long v75 = a1[4];
  long long v76 = v4;
  long long v5 = a1[7];
  long long v77 = a1[6];
  long long v78 = v5;
  long long v6 = a1[1];
  long long v71 = *a1;
  long long v72 = v6;
  long long v7 = a1[3];
  long long v73 = a1[2];
  long long v74 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_orbView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62370]), sel_initWithCardStyle_, 0);
  v70.receiver = v1;
  v70.super_class = (Class)type metadata accessor for IntroProxCardController();
  id v9 = objc_msgSendSuper2(&v70, sel_initWithContentView_, v8);
  uint64_t v10 = (void *)sub_235A68AF0();
  objc_msgSend(v9, sel_setTitle_, v10);

  if (*((void *)&v73 + 1))
  {
    id v11 = v9;
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = v9;
    uint64_t v12 = 0;
  }
  objc_msgSend(v9, sel_setSubtitle_, v12);

  uint64_t v14 = (void *)sub_235A68AF0();
  id v15 = objc_msgSend(self, sel_bundleWithIdentifier_, v14);

  uint64_t v16 = (void *)sub_235A68AF0();
  id v17 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v16, v15, 0);

  uint64_t v66 = v17;
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v17);
  objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v18, sel_setContentMode_, 1);
  objc_msgSend(v8, sel_addSubview_, v18);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62398]), sel_initWithStyle_, 3);
  if ((void)v81)
  {
    swift_bridgeObjectRetain();
    id v20 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v20 = 0;
  }
  objc_msgSend(v19, sel_setText_, v20);

  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v19, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_addSubview_, v19);
  id v21 = objc_msgSend(v8, sel_mainContentGuide);
  id v68 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D2F0);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_235A6B700;
  id v67 = v8;
  id v23 = objc_msgSend(v18, sel_topAnchor);
  id v24 = objc_msgSend(v21, sel_topAnchor);
  id v25 = objc_msgSend(v23, sel_constraintGreaterThanOrEqualToAnchor_, v24);

  *(void *)(v22 + 32) = v25;
  id v26 = objc_msgSend(v18, sel_centerXAnchor);
  id v27 = objc_msgSend(v21, sel_centerXAnchor);
  id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

  *(void *)(v22 + 40) = v28;
  id v29 = objc_msgSend(v18, sel_heightAnchor);
  id v30 = objc_msgSend(v29, sel_constraintEqualToConstant_, 65.0);

  *(void *)(v22 + 48) = v30;
  id v31 = objc_msgSend(v19, sel_topAnchor);
  id v32 = objc_msgSend(v18, sel_bottomAnchor);
  id v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_constant_, v32, 30.0);

  *(void *)(v22 + 56) = v33;
  id v34 = objc_msgSend(v19, sel_leadingAnchor);
  id v35 = objc_msgSend(v21, sel_leadingAnchor);
  id v36 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v35);

  *(void *)(v22 + 64) = v36;
  id v37 = objc_msgSend(v19, sel_trailingAnchor);
  id v38 = objc_msgSend(v21, sel_trailingAnchor);
  id v39 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v38);

  *(void *)(v22 + 72) = v39;
  *(void *)&v69[0] = v22;
  sub_235A68B90();
  sub_235A348B8(0, (unint64_t *)&qword_26882D2F8);
  unint64_t v40 = (void *)sub_235A68B60();
  swift_bridgeObjectRelease();
  objc_msgSend(v68, sel_activateConstraints_, v40);

  if ((void)v76)
  {
    unint64_t v41 = self;
    swift_bridgeObjectRetain();
    id v42 = objc_msgSend(v41, sel_buttonWithType_, 1);
    objc_msgSend(v42, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    unint64_t v43 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v42, sel_setTitle_forState_, v43, 0);

    objc_msgSend(v42, sel_addTarget_action_forControlEvents_, v9, sel_tappedLink, 0x2000);
    objc_msgSend(v8, sel_addSubview_, v42);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_235A6B710;
    id v45 = objc_msgSend(v42, sel_topAnchor);
    id v46 = objc_msgSend(v19, sel_bottomAnchor);
    id v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_, v46);

    *(void *)(v44 + 32) = v47;
    id v48 = objc_msgSend(v42, sel_leadingAnchor);
    id v49 = objc_msgSend(v21, sel_leadingAnchor);
    id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

    *(void *)(v44 + 40) = v50;
    id v51 = objc_msgSend(v42, sel_trailingAnchor);
    id v52 = objc_msgSend(v21, sel_trailingAnchor);
    id v53 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v52);

    *(void *)(v44 + 48) = v53;
    id v54 = objc_msgSend(v42, sel_centerXAnchor);
    id v55 = objc_msgSend(v21, sel_centerXAnchor);
    id v56 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v55);

    *(void *)(v44 + 56) = v56;
    id v57 = objc_msgSend(v42, sel_bottomAnchor);
    id v58 = objc_msgSend(v21, sel_bottomAnchor);
    id v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v58);

    *(void *)(v44 + 64) = v59;
    *(void *)&v69[0] = v44;
    sub_235A68B90();
    uint64_t v60 = (void *)sub_235A68B60();
    swift_bridgeObjectRelease();
    objc_msgSend(v68, sel_activateConstraints_, v60);
  }
  else
  {
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_235A6B720;
    id v62 = objc_msgSend(v19, sel_bottomAnchor);
    id v63 = objc_msgSend(v21, sel_bottomAnchor);
    id v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v63, -5.0);

    *(void *)(v61 + 32) = v64;
    *(void *)&v69[0] = v61;
    sub_235A68B90();
    uint64_t v60 = (void *)sub_235A68B60();
    swift_bridgeObjectRelease();
    objc_msgSend(v68, sel_activateConstraints_, v60);
  }

  objc_msgSend(v9, sel_setDismissalType_, 1);
  v69[8] = v79;
  v69[9] = v80;
  v69[10] = v81;
  v69[11] = v82;
  v69[4] = v75;
  v69[5] = v76;
  v69[6] = v77;
  v69[7] = v78;
  v69[0] = v71;
  v69[1] = v72;
  v69[2] = v73;
  v69[3] = v74;
  sub_235A63B00((uint64_t)v69);

  sub_235A346CC((uint64_t)&v71);
  return v9;
}

void sub_235A63B00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  long long v4 = &off_264C67000;
  if (v2 && *(void *)(v2 + 16))
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v1;
    swift_bridgeObjectRetain();
    id v6 = v1;
    long long v7 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v27 = sub_235A643D8;
    uint64_t v28 = v5;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 1107296256;
    id v25 = sub_235A6046C;
    id v26 = &block_descriptor_23_0;
    id v8 = _Block_copy(&v23);
    id v9 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v7, 0, v8);

    uint64_t v10 = v8;
    long long v4 = &off_264C67000;
    _Block_release(v10);
    swift_release();
    id v11 = objc_msgSend(v6, sel_addAction_, v9);
  }
  if (v3)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    id v13 = v1;
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v27 = sub_235A643D0;
    uint64_t v28 = v12;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 1107296256;
    id v25 = sub_235A6046C;
    id v26 = &block_descriptor_17;
    id v15 = _Block_copy(&v23);
    id v16 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v14, 1, v15);

    _Block_release(v15);
    swift_release();
    id v17 = objc_msgSend(v13, (SEL)v4[297], v16);
  }
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v1;
  id v19 = v1;
  id v20 = (void *)sub_235A68AF0();
  id v27 = sub_235A643B0;
  uint64_t v28 = v18;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 1107296256;
  id v25 = sub_235A6046C;
  id v26 = &block_descriptor_10;
  id v21 = _Block_copy(&v23);
  id v22 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v20, 0, v21);

  _Block_release(v21);
  swift_release();
  objc_msgSend(v19, sel_setDismissButtonAction_, v22);
}

void sub_235A63E64(void *a1, char *a2)
{
  id v4 = objc_msgSend(a2, sel_actions);
  sub_235A348B8(0, (unint64_t *)&qword_26882D300);
  unint64_t v5 = sub_235A68B70();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_235A68E50();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x237DEC2A0](0, v5);
  }
  else
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(v5 + 32);
  }
  long long v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = a1;
  char v9 = sub_235A68D40();

  if ((v9 & 1) != 0 && MEMORY[0x237DECD00](&a2[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate]))
  {
    sub_235A4602C();
    swift_unknownObjectRelease();
  }
}

void sub_235A63FF8(void *a1, char *a2)
{
  id v4 = objc_msgSend(a2, sel_actions);
  sub_235A348B8(0, (unint64_t *)&qword_26882D300);
  unint64_t v5 = sub_235A68B70();

  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    if (MEMORY[0x237DECD00](&a2[OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate]))
    {
      sub_235A46228();
      swift_unknownObjectRelease();
    }
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_235A68E50();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_9;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x237DEC2A0](0, v5);
  }
  else
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(v5 + 32);
  }
  long long v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = a1;
  char v9 = sub_235A68D40();

  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
}

uint64_t sub_235A64170(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x237DECD00](a2 + OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate);
  if (result)
  {
    uint64_t v3 = result;
    if (qword_26882D100 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_235A68920();
    __swift_project_value_buffer(v4, (uint64_t)qword_26882DE48);
    os_log_type_t v5 = sub_235A68C40();
    sub_235A65720(v5, 0xD000000000000015, 0x8000000235A6BD70, 0xD000000000000012, 0x8000000235A6F280);
    if (MEMORY[0x237DECD00](v3 + OBJC_IVAR____TtC9SiriSetup14IntroPresenter_delegate))
    {
      uint64_t v6 = swift_retain();
      sub_235A370C8(v6);
      swift_unknownObjectRelease();
      swift_release();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A642D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntroProxCardController()
{
  return self;
}

uint64_t sub_235A64378()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A643B0(uint64_t a1)
{
  return sub_235A64170(a1, *(void *)(v1 + 16));
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

void sub_235A643D0(void *a1)
{
  sub_235A63FF8(a1, *(char **)(v1 + 16));
}

void sub_235A643D8(void *a1)
{
  sub_235A63E64(a1, *(char **)(v1 + 16));
}

unint64_t sub_235A643F8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 1684099177;
      break;
    case 2:
      unint64_t result = 1685016681;
      break;
    case 3:
      unint64_t result = 6512973;
      break;
    case 4:
      unint64_t result = 0x73646F50726941;
      break;
    case 5:
      unint64_t result = 0x615720656C707041;
      break;
    case 6:
      unint64_t result = 0x565420656C707041;
      break;
    case 7:
      unint64_t result = 0x646F50656D6F48;
      break;
    case 8:
      return result;
    case 9:
      unint64_t result = 0x656369766564;
      break;
    default:
      unint64_t result = 0x656E6F685069;
      break;
  }
  return result;
}

uint64_t sub_235A64524(unsigned __int8 a1)
{
  uint64_t v1 = a1;
  uint64_t result = 0;
  switch(v1)
  {
    case 1:
      uint64_t result = 0x444150495FLL;
      break;
    case 2:
      uint64_t result = 0x444F50495FLL;
      break;
    case 3:
      uint64_t result = 1128353119;
      break;
    case 4:
      uint64_t result = 0x53444F505249415FLL;
      break;
    case 5:
      uint64_t result = 0x48435441575FLL;
      break;
    case 6:
      uint64_t result = 0x5654454C5050415FLL;
      break;
    case 7:
      uint64_t result = 0x444F50454D4F485FLL;
      break;
    case 8:
      uint64_t result = 0x4E4F495349565FLL;
      break;
    case 9:
      return result;
    default:
      uint64_t result = 0x454E4F4850495FLL;
      break;
  }
  return result;
}

uint64_t sub_235A64640()
{
  uint64_t result = SRSGetDeviceClass();
  if ((result - 1) > 0xA) {
    char v1 = 9;
  }
  else {
    char v1 = byte_235A6B77E[(int)result - 1];
  }
  byte_26882EE38 = v1;
  return result;
}

id sub_235A64680(_OWORD *a1)
{
  long long v2 = a1[9];
  long long v100 = a1[8];
  long long v101 = v2;
  long long v3 = a1[11];
  long long v102 = a1[10];
  long long v103 = v3;
  long long v4 = a1[5];
  long long v96 = a1[4];
  long long v97 = v4;
  long long v5 = a1[7];
  long long v98 = a1[6];
  long long v99 = v5;
  long long v6 = a1[1];
  v93[0] = *a1;
  v93[1] = v6;
  long long v7 = a1[3];
  long long v94 = a1[2];
  long long v95 = v7;
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_orbView] = 0;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62370]), sel_init);
  v92.receiver = v1;
  v92.super_class = (Class)type metadata accessor for DataSharingProxCardController();
  id v9 = objc_msgSendSuper2(&v92, sel_initWithContentView_, v8);
  uint64_t v10 = (void *)sub_235A68AF0();
  objc_msgSend(v9, sel_setTitle_, v10);

  id v11 = (void *)sub_235A68AF0();
  id v12 = objc_msgSend(self, sel_bundleWithIdentifier_, v11);

  id v13 = (void *)sub_235A68AF0();
  id v14 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v13, v12, 0);

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v14);
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_setContentMode_, 1);
  objc_msgSend(v8, sel_addSubview_, v15);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F62398]), sel_initWithStyle_, 1);
  uint64_t v84 = v14;
  if (*((void *)&v94 + 1))
  {
    swift_bridgeObjectRetain();
    id v17 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v17 = 0;
  }
  objc_msgSend(v16, sel_setText_, v17, v9);

  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v16, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_addSubview_, v16);
  id v85 = v8;
  id v18 = objc_msgSend(v8, sel_mainContentGuide);
  id v19 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D2F0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_235A6B700;
  id v21 = objc_msgSend(v15, sel_topAnchor);
  id v22 = objc_msgSend(v18, sel_topAnchor);
  id v23 = objc_msgSend(v21, sel_constraintGreaterThanOrEqualToAnchor_constant_, v22, 25.0);

  *(void *)(v20 + 32) = v23;
  id v24 = objc_msgSend(v15, sel_centerXAnchor);
  id v25 = objc_msgSend(v18, sel_centerXAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(void *)(v20 + 40) = v26;
  id v27 = objc_msgSend(v15, sel_heightAnchor);
  id v28 = objc_msgSend(v27, sel_constraintEqualToConstant_, 75.0);

  *(void *)(v20 + 48) = v28;
  id v29 = objc_msgSend(v16, sel_topAnchor);
  id v30 = objc_msgSend(v15, sel_bottomAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, 45.0);

  *(void *)(v20 + 56) = v31;
  id v32 = objc_msgSend(v16, sel_leadingAnchor);
  id v33 = objc_msgSend(v18, sel_leadingAnchor);
  id v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

  *(void *)(v20 + 64) = v34;
  id v35 = objc_msgSend(v16, sel_trailingAnchor);
  id v36 = objc_msgSend(v18, sel_trailingAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v20 + 72) = v37;
  uint64_t aBlock = v20;
  sub_235A68B90();
  sub_235A40CF0();
  id v38 = (void *)sub_235A68B60();
  swift_bridgeObjectRelease();
  id v82 = v19;
  objc_msgSend(v19, sel_activateConstraints_, v38);

  BOOL v83 = v16;
  if ((void)v97)
  {
    id v39 = self;
    swift_bridgeObjectRetain();
    id v40 = objc_msgSend(v39, sel_buttonWithType_, 1);
    objc_msgSend(v40, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    unint64_t v41 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_setTitle_forState_, v41, 0);

    id v42 = v81;
    objc_msgSend(v40, sel_addTarget_action_forControlEvents_, v81, sel_tappedLink, 0x2000);
    objc_msgSend(v85, sel_addSubview_, v40);
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_235A6B710;
    id v44 = objc_msgSend(v40, sel_topAnchor);
    id v45 = objc_msgSend(v16, sel_bottomAnchor);
    id v46 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v45);

    *(void *)(v43 + 32) = v46;
    id v47 = objc_msgSend(v40, byte_264C6723A);
    id v48 = objc_msgSend(v18, byte_264C6723A);
    id v49 = objc_msgSend(v47, sel_constraintEqualToAnchor_, v48);

    *(void *)(v43 + 40) = v49;
    id v50 = objc_msgSend(v40, sel_trailingAnchor);
    id v51 = objc_msgSend(v18, sel_trailingAnchor);
    id v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v51);

    *(void *)(v43 + 48) = v52;
    id v53 = objc_msgSend(v40, sel_centerXAnchor);
    id v54 = objc_msgSend(v18, sel_centerXAnchor);
    id v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v54);

    *(void *)(v43 + 56) = v55;
    id v56 = objc_msgSend(v40, sel_bottomAnchor);
    id v57 = objc_msgSend(v18, sel_bottomAnchor);
    id v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v57);

    *(void *)(v43 + 64) = v58;
    uint64_t aBlock = v43;
    sub_235A68B90();
    id v59 = (void *)sub_235A68B60();
    swift_bridgeObjectRelease();
    objc_msgSend(v82, sel_activateConstraints_, v59);
  }
  else
  {
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_235A6B720;
    id v61 = objc_msgSend(v16, sel_bottomAnchor);
    id v62 = objc_msgSend(v18, sel_bottomAnchor);
    id v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v62, -5.0);

    *(void *)(v60 + 32) = v63;
    uint64_t aBlock = v60;
    sub_235A68B90();
    id v59 = (void *)sub_235A68B60();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_activateConstraints_, v59);
    id v42 = v81;
  }

  objc_msgSend(v42, sel_setDismissalType_, 1);
  if ((void)v95 && *(void *)(v95 + 16)) {
    swift_bridgeObjectRetain();
  }
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = v42;
  id v65 = v42;
  uint64_t v66 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  long long v90 = sub_235A65570;
  uint64_t v91 = v64;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v87 = 1107296256;
  uint64_t v88 = sub_235A6046C;
  long long v89 = &block_descriptor_11;
  id v67 = _Block_copy(&aBlock);
  id v68 = self;
  id v69 = objc_msgSend(v68, sel_actionWithTitle_style_handler_, v66, 0, v67);

  _Block_release(v67);
  swift_release();
  if ((void)v96) {
    swift_bridgeObjectRetain();
  }
  sub_235A346CC((uint64_t)v93);
  uint64_t v70 = swift_allocObject();
  *(void *)(v70 + 16) = v65;
  id v71 = v65;
  long long v72 = (void *)sub_235A68AF0();
  swift_bridgeObjectRelease();
  long long v90 = sub_235A655B8;
  uint64_t v91 = v70;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v87 = 1107296256;
  uint64_t v88 = sub_235A6046C;
  long long v89 = &block_descriptor_17_0;
  long long v73 = _Block_copy(&aBlock);
  id v74 = objc_msgSend(v68, sel_actionWithTitle_style_handler_, v72, 1, v73);

  _Block_release(v73);
  swift_release();

  uint64_t v75 = swift_allocObject();
  *(void *)(v75 + 16) = v71;
  id v76 = v71;
  long long v77 = (void *)sub_235A68AF0();
  long long v90 = sub_235A655E8;
  uint64_t v91 = v75;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v87 = 1107296256;
  uint64_t v88 = sub_235A6046C;
  long long v89 = &block_descriptor_23_1;
  long long v78 = _Block_copy(&aBlock);
  id v79 = objc_msgSend(v68, sel_actionWithTitle_style_handler_, v77, 0, v78);

  _Block_release(v78);
  swift_release();
  objc_msgSend(v76, sel_setDismissButtonAction_, v79);

  return v76;
}

uint64_t sub_235A65344(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t result = MEMORY[0x237DECD00](a2 + OBJC_IVAR____TtC9SiriSetup29DataSharingProxCardController_delegate);
  if (result)
  {
    a3();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_235A65494()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSharingProxCardController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DataSharingProxCardController()
{
  return self;
}

uint64_t sub_235A65538()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_235A65570(uint64_t a1)
{
  return sub_235A65344(a1, *(void *)(v1 + 16), (void (*)(void))sub_235A40278);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_235A655B8(uint64_t a1)
{
  return sub_235A65344(a1, *(void *)(v1 + 16), (void (*)(void))sub_235A403BC);
}

uint64_t sub_235A655E8(uint64_t a1)
{
  return sub_235A65344(a1, *(void *)(v1 + 16), (void (*)(void))sub_235A40524);
}

uint64_t sub_235A65630()
{
  sub_235A66034();
  uint64_t result = sub_235A68D60();
  qword_26882DE40 = result;
  return result;
}

uint64_t sub_235A65694()
{
  uint64_t v0 = sub_235A68920();
  __swift_allocate_value_buffer(v0, qword_26882DE48);
  __swift_project_value_buffer(v0, (uint64_t)qword_26882DE48);
  if (qword_26882D0F8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26882DE40;
  return sub_235A68930();
}

void sub_235A65720(os_log_type_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v13 = a2;
  unint64_t v14 = a3;
  if (!a5) {
    goto LABEL_6;
  }
  uint64_t v8 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v8 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    v12[0] = 32;
    v12[1] = 0xE100000000000000;
    swift_bridgeObjectRetain();
    sub_235A68B30();
    sub_235A68B30();
    swift_bridgeObjectRelease();
    uint64_t v6 = v13;
    unint64_t v5 = v14;
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  log = sub_235A68910();
  if (os_log_type_enabled(log, a1))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v12[0] = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    v12[2] = sub_235A6591C(v6, v5, v12);
    sub_235A68D70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235A2D000, log, a1, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DECC60](v10, -1, -1);
    MEMORY[0x237DECC60](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_235A6591C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_235A659F0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_235A65F74((uint64_t)v12, *a3);
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
      sub_235A65F74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_235A659F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235A68D80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_235A65BAC(a5, a6);
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
  uint64_t v8 = sub_235A68E10();
  if (!v8)
  {
    sub_235A68E30();
    __break(1u);
LABEL_17:
    uint64_t result = sub_235A68E90();
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

uint64_t sub_235A65BAC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_235A65C44(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_235A65E24(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_235A65E24(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235A65C44(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_235A65DBC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_235A68DF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_235A68E30();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_235A68B40();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_235A68E90();
    __break(1u);
LABEL_14:
    uint64_t result = sub_235A68E30();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_235A65DBC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882DE60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235A65E24(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26882DE60);
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
  uint64_t result = sub_235A68E90();
  __break(1u);
  return result;
}

uint64_t sub_235A65F74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

unint64_t sub_235A66034()
{
  unint64_t result = qword_26882DE68;
  if (!qword_26882DE68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26882DE68);
  }
  return result;
}

void sub_235A66074()
{
  qword_26882DE70 = 0x6573616870;
  *(void *)algn_26882DE78 = 0xE500000000000000;
}

id sub_235A66294(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor;
  unint64_t v4 = v1;
  *(void *)&v1[v3] = CGColorCreateGenericRGB(0.96875, 0.25390625, 0.36328125, 1.0);
  uint64_t v5 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor;
  *(void *)&v4[v5] = CGColorCreateGenericRGB(0.15625, 0.52734375, 0.9921875, 1.0);
  uint64_t v6 = OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor;
  *(void *)&v4[v6] = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for ColorLayer();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

void sub_235A664A8()
{
  objc_msgSend(v0, sel_bounds);
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  objc_msgSend(v0, sel_bounds);
  double v10 = v9;
  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v9 >= 9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  objc_msgSend(v0, sel_bounds);
  if ((~*(void *)&v11 & 0x7FF0000000000000) == 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v11 < 9.22337204e18)
  {
    size_t v12 = (uint64_t)v11;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    unint64_t v14 = CGBitmapContextCreate(0, (uint64_t)v10, v12, 8uLL, 0, DeviceRGB, 2u);

    if (v14)
    {
      v41.origin.x = v2;
      v41.origin.y = v4;
      v41.size.width = v6;
      v41.size.height = v8;
      CGContextClearRect(v14, v41);
    }
    CGFloat v39 = v4;
    id v15 = objc_msgSend(v0, sel_presentationLayer);
    double v16 = 0.0;
    double v17 = 0.0;
    if (v15)
    {
      id v18 = v15;
      objc_msgSend(v15, sel_phase);
      double v17 = v19;
    }
    CGFloat rect = v8;
    double v20 = (v17 + -0.57) / 0.4 * 12.0;
    if (v20 > -10.0)
    {
      double v16 = 1.0;
      if (v20 < 10.0) {
        double v16 = 1.0 / (exp(-v20) + 1.0);
      }
    }
    double v21 = (v17 + -0.4) / 0.8 * 12.0;
    double v22 = 0.0;
    double v23 = 0.0;
    if (v21 > -10.0)
    {
      double v23 = 1.0;
      if (v21 < 10.0) {
        double v23 = 1.0 / (exp(-v21) + 1.0);
      }
    }
    double v24 = (v17 + -0.6) / 0.3 * 12.0;
    if (v24 > -10.0)
    {
      double v22 = 1.0;
      if (v24 < 10.0) {
        double v22 = 1.0 / (exp(-v24) + 1.0);
      }
    }
    double v25 = (v17 + -0.35) / 0.6 * 12.0;
    double v26 = 0.0;
    double v27 = 0.0;
    if (v25 > -10.0)
    {
      double v27 = 1.0;
      if (v25 < 10.0) {
        double v27 = 1.0 / (exp(-v25) + 1.0);
      }
    }
    double v28 = (v17 + -0.3) / 0.4 * 12.0;
    if (v28 > -10.0)
    {
      double v26 = 1.0;
      if (v28 < 10.0) {
        double v26 = 1.0 / (exp(-v28) + 1.0);
      }
    }
    id v29 = objc_msgSend(self, sel_currentTraitCollection);
    id v30 = objc_msgSend(v29, sel_userInterfaceStyle);

    if (v30 == (id)1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v31 = sub_235A68F50();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0) {
        goto LABEL_30;
      }
    }
    double v16 = 0.0;
LABEL_30:
    if (v14)
    {
      CGContextSetFillColorWithColor(v14, *(CGColorRef *)&v0[OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerRedColor]);
      v42.origin.x = v2;
      v42.origin.y = v39;
      v42.size.width = v6 * v26;
      v42.size.height = rect;
      CGContextFillRect(v14, v42);
      CGContextSetFillColorWithColor(v14, *(CGColorRef *)&v0[OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBlueColor]);
      v43.origin.x = v2;
      v43.origin.y = v39;
      v43.size.width = v6 * v27;
      v43.size.height = rect;
      CGContextFillRect(v14, v43);
    }
    CGColorRef GenericRGB = CGColorCreateGenericRGB((1.0 - v22) * 0.37890625, (1.0 - v22) * 0.98828125, (1.0 - v22) * 0.67578125, 1.0);
    if (v14)
    {
      CGContextSetFillColorWithColor(v14, GenericRGB);
      v44.origin.y = v39;
      v44.origin.x = v2;
      v44.size.width = v6 * v23;
      v44.size.height = rect;
      CGContextFillRect(v14, v44);
    }
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(*(CGColorRef *)&v0[OBJC_IVAR____TtC9SiriSetup10ColorLayer_layerBackgroundColor], v16);
    if (CopyWithAlpha)
    {
      CGColorRef v34 = CopyWithAlpha;
      if (!v14)
      {

        goto LABEL_41;
      }
      CGContextSetFillColorWithColor(v14, CopyWithAlpha);
      id v35 = v14;
      objc_msgSend(v0, sel_bounds);
      CGContextFillRect(v35, v45);
    }
    else if (!v14)
    {
      goto LABEL_41;
    }
    CGImageRef Image = CGBitmapContextCreateImage(v14);
    if (Image)
    {
      CGImageRef v40 = Image;
      type metadata accessor for CGImage(0);
      uint64_t v37 = sub_235A68F40();

LABEL_42:
      objc_msgSend(v0, sel_setContents_, v37, *(void *)&rect);

      swift_unknownObjectRelease();
      return;
    }
LABEL_41:
    uint64_t v37 = 0;
    goto LABEL_42;
  }
LABEL_48:
  __break(1u);
}

id sub_235A66A40(uint64_t a1, uint64_t a2)
{
  if (qword_26882D108 != -1) {
    swift_once();
  }
  BOOL v5 = qword_26882DE70 == a1 && *(void *)algn_26882DE78 == a2;
  if (v5 || (sub_235A68F50() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    double v6 = (void *)sub_235A68AF0();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(self, sel_animationWithKeyPath_, v6);

    uint64_t v8 = *MEMORY[0x263F15EC8];
    double v9 = self;
    id v10 = v7;
    id v11 = objc_msgSend(v9, sel_functionWithName_, v8);
    objc_msgSend(v10, sel_setTimingFunction_, v11);

    objc_msgSend(v2, sel_phase);
    size_t v12 = (void *)sub_235A68900();
    objc_msgSend(v10, sel_setFromValue_, v12);
  }
  else
  {
    uint64_t v13 = (void *)sub_235A68AF0();
    v15.receiver = v2;
    v15.super_class = (Class)type metadata accessor for ColorLayer();
    id v10 = objc_msgSendSuper2(&v15, sel_actionForKey_, v13);
  }
  return v10;
}

id sub_235A66C64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ColorLayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ColorLayer()
{
  return self;
}

char *sub_235A66D18(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v11 = &v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  size_t v12 = &v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_dataSource];
  *(void *)size_t v12 = a1;
  *((void *)v12 + 1) = a2;
  uint64_t v13 = &v5[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_dataSourceWriter];
  *(void *)uint64_t v13 = a3;
  *((void *)v13 + 1) = a4;
  uint64_t ObjectType = swift_getObjectType();
  objc_super v15 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 64);
  double v16 = v5;
  id v17 = a1;
  id v18 = a3;
  v16[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewStyle] = v15(ObjectType, a2);
  *(void *)&v16[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_page] = a5;
  double v19 = (objc_class *)type metadata accessor for SuccessPresenter();
  swift_retain();
  sub_235A66F80(a2, (uint64_t)v52);
  double v20 = &v16[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel];
  long long v21 = v52[9];
  *((_OWORD *)v20 + 8) = v52[8];
  *((_OWORD *)v20 + 9) = v21;
  long long v22 = v52[11];
  *((_OWORD *)v20 + 10) = v52[10];
  *((_OWORD *)v20 + 11) = v22;
  long long v23 = v52[5];
  *((_OWORD *)v20 + 4) = v52[4];
  *((_OWORD *)v20 + 5) = v23;
  long long v24 = v52[7];
  *((_OWORD *)v20 + 6) = v52[6];
  *((_OWORD *)v20 + 7) = v24;
  long long v25 = v52[1];
  *(_OWORD *)double v20 = v52[0];
  *((_OWORD *)v20 + 1) = v25;
  long long v26 = v52[3];
  *((_OWORD *)v20 + 2) = v52[2];
  *((_OWORD *)v20 + 3) = v26;

  v51.receiver = v16;
  v51.super_class = v19;
  double v27 = (char *)objc_msgSendSuper2(&v51, sel_init);
  LOBYTE(v19) = v15(ObjectType, a2);
  double v28 = &v27[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel];
  swift_beginAccess();
  long long v29 = *(_OWORD *)v28;
  long long v30 = *((_OWORD *)v28 + 1);
  long long v31 = *((_OWORD *)v28 + 3);
  void v53[2] = *((_OWORD *)v28 + 2);
  v53[3] = v31;
  v53[0] = v29;
  v53[1] = v30;
  long long v32 = *((_OWORD *)v28 + 4);
  long long v33 = *((_OWORD *)v28 + 5);
  long long v34 = *((_OWORD *)v28 + 7);
  v53[6] = *((_OWORD *)v28 + 6);
  v53[7] = v34;
  v53[4] = v32;
  v53[5] = v33;
  long long v35 = *((_OWORD *)v28 + 8);
  long long v36 = *((_OWORD *)v28 + 9);
  long long v37 = *((_OWORD *)v28 + 11);
  v53[10] = *((_OWORD *)v28 + 10);
  v53[11] = v37;
  v53[8] = v35;
  v53[9] = v36;
  long long v38 = *((_OWORD *)v28 + 9);
  v50[8] = *((_OWORD *)v28 + 8);
  v50[9] = v38;
  long long v39 = *((_OWORD *)v28 + 11);
  v50[10] = *((_OWORD *)v28 + 10);
  v50[11] = v39;
  long long v40 = *((_OWORD *)v28 + 5);
  v50[4] = *((_OWORD *)v28 + 4);
  v50[5] = v40;
  long long v41 = *((_OWORD *)v28 + 7);
  v50[6] = *((_OWORD *)v28 + 6);
  v50[7] = v41;
  long long v42 = *((_OWORD *)v28 + 1);
  v50[0] = *(_OWORD *)v28;
  v50[1] = v42;
  long long v43 = *((_OWORD *)v28 + 3);
  v50[2] = *((_OWORD *)v28 + 2);
  v50[3] = v43;
  sub_235A3557C((uint64_t)v53);
  CGRect v44 = sub_235A67844((char)v19, v50);
  id v46 = v45;

  swift_release();
  sub_235A346CC((uint64_t)v53);
  id v47 = (char **)&v27[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController];
  id v48 = *(void **)&v27[OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController];
  *id v47 = v44;
  v47[1] = v46;

  return v27;
}

double sub_235A66F80@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 72);
  uint64_t v6 = v5(ObjectType, a1);
  uint64_t v8 = v7;
  if (qword_26882D0F0 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_235A4F48C(0x5F53534543435553, 0xED0000454C544954, 0, v6, v8, byte_26882EE38, 0xAu);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = v5(ObjectType, a1);
  uint64_t v13 = sub_235A4F48C(0xD000000000000010, 0x8000000235A6F680, 0, v11, v12, byte_26882EE38, 0xAu);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a1 + 24))(&v34, ObjectType, a1);
  unint64_t v16 = 0xE000000000000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  switch((char)v34)
  {
    case 1:
      char v22 = byte_26882EE38;
      sub_235A4F2CC(0xD000000000000018, 0x8000000235A6F6C0, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v22);
      sub_235A35654();
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v22);
      uint64_t v19 = sub_235A68D90();
      unint64_t v16 = v23;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v24 = byte_26882EE38;
      sub_235A4F2CC(0xD000000000000016, 0x8000000235A6F6E0, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v24);
      sub_235A68D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v24);
      uint64_t v17 = sub_235A68D90();
      uint64_t v18 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 2:
      char v26 = byte_26882EE38;
      sub_235A4F2CC(0xD000000000000018, 0x8000000235A6F6C0, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v26);
      sub_235A35654();
      sub_235A68D90();
      uint64_t v32 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v26);
      uint64_t v19 = sub_235A68D90();
      unint64_t v16 = v27;
      goto LABEL_7;
    case 3:
      break;
    default:
      char v20 = byte_26882EE38;
      sub_235A4F2CC(0xD000000000000014, 0x8000000235A6F700, 0, byte_26882EE38, 0xAu);
      sub_235A643F8(v20);
      sub_235A35654();
      sub_235A68D90();
      uint64_t v32 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235A643F8(v20);
      uint64_t v19 = sub_235A68D90();
      unint64_t v16 = v21;
LABEL_7:
      uint64_t v13 = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      break;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26882D550);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_235A6A830;
  *(void *)(v28 + 32) = v19;
  *(void *)(v28 + 40) = v16;
  sub_235A68DE0();
  sub_235A68B30();
  sub_235A68E20();
  if (qword_26882D100 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_235A68920();
  __swift_project_value_buffer(v29, (uint64_t)qword_26882DE48);
  os_log_type_t v30 = sub_235A68C40();
  sub_235A65720(v30, 0xD00000000000001CLL, 0x8000000235A6D460, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v33;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v28;
  double result = 0.0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(void *)(a2 + 120) = v17;
  *(void *)(a2 + 128) = v18;
  *(unsigned char *)(a2 + 136) = 2;
  *(_DWORD *)(a2 + 137) = 0;
  *(_DWORD *)(a2 + 140) = 0;
  *(void *)(a2 + 144) = 0;
  *(void *)(a2 + 152) = 0;
  *(_WORD *)(a2 + 168) = 0;
  *(void *)(a2 + 160) = 0;
  *(_DWORD *)(a2 + 170) = 0;
  *(_WORD *)(a2 + 174) = 0;
  *(void *)(a2 + 176) = 0;
  *(void *)(a2 + 184) = 0;
  return result;
}

char *sub_235A67844(char a1, _OWORD *a2)
{
  long long v2 = a2[9];
  v39[8] = a2[8];
  v39[9] = v2;
  long long v3 = a2[11];
  v39[10] = a2[10];
  v39[11] = v3;
  long long v4 = a2[5];
  v39[4] = a2[4];
  v39[5] = v4;
  long long v5 = a2[7];
  v39[6] = a2[6];
  v39[7] = v5;
  long long v6 = a2[1];
  v39[0] = *a2;
  v39[1] = v6;
  long long v7 = a2[3];
  v39[2] = a2[2];
  v39[3] = v7;
  if (a1)
  {
    if (a1 == 1)
    {
      *(void *)&long long v26 = 0;
      *((void *)&v26 + 1) = 0xE000000000000000;
      sub_235A68DE0();
      sub_235A68B30();
      char v38 = 1;
      sub_235A68E20();
      sub_235A68B30();
      if (qword_26882D100 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_235A68920();
      __swift_project_value_buffer(v8, (uint64_t)qword_26882DE48);
      os_log_type_t v9 = sub_235A68C30();
      sub_235A65720(v9, 0xD000000000000028, 0x8000000235A6D3E0, v26, *((unint64_t *)&v26 + 1));
      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      long long v18 = a2[9];
      long long v34 = a2[8];
      long long v35 = v18;
      long long v19 = a2[11];
      long long v36 = a2[10];
      long long v37 = v19;
      long long v20 = a2[5];
      long long v30 = a2[4];
      long long v31 = v20;
      long long v21 = a2[7];
      long long v32 = a2[6];
      long long v33 = v21;
      long long v22 = a2[1];
      long long v26 = *a2;
      long long v27 = v22;
      long long v23 = a2[3];
      long long v28 = a2[2];
      long long v29 = v23;
      id v24 = objc_allocWithZone((Class)type metadata accessor for SuccessProxCardController());
      sub_235A3557C((uint64_t)v39);
      uint64_t v10 = sub_235A50E84(&v26);
      *(void *)&v10[OBJC_IVAR____TtC9SiriSetup25SuccessProxCardController_delegate + 8] = &off_26E8EE0C8;
      swift_unknownObjectWeakAssign();
    }
  }
  else
  {
    long long v11 = a2[9];
    long long v34 = a2[8];
    long long v35 = v11;
    long long v12 = a2[11];
    long long v36 = a2[10];
    long long v37 = v12;
    long long v13 = a2[5];
    long long v30 = a2[4];
    long long v31 = v13;
    long long v14 = a2[7];
    long long v32 = a2[6];
    long long v33 = v14;
    long long v15 = a2[1];
    long long v26 = *a2;
    long long v27 = v15;
    long long v16 = a2[3];
    long long v28 = a2[2];
    long long v29 = v16;
    id v17 = objc_allocWithZone((Class)type metadata accessor for SuccessWelcomeController());
    sub_235A3557C((uint64_t)v39);
    uint64_t v10 = sub_235A46FB0(&v26);
    *(void *)&v10[OBJC_IVAR____TtC9SiriSetup24SuccessWelcomeController_delegate + 8] = &off_26E8EE0C8;
    swift_unknownObjectWeakAssign();
  }
  return v10;
}

id sub_235A67B08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuccessPresenter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuccessPresenter()
{
  return self;
}

uint64_t sub_235A67C1C@<X0>(_OWORD *a1@<X8>)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v30 = v3[9];
  long long v6 = v30;
  long long v31 = v5;
  long long v7 = v3[10];
  long long v32 = v3[11];
  long long v8 = v3[5];
  long long v10 = v3[3];
  long long v25 = v3[4];
  long long v9 = v25;
  long long v26 = v8;
  long long v11 = v3[5];
  long long v27 = v3[6];
  long long v12 = v3[6];
  long long v13 = v3[8];
  long long v28 = v3[7];
  long long v14 = v28;
  long long v29 = v13;
  long long v15 = v3[1];
  v22[0] = *v3;
  v22[1] = v15;
  long long v16 = v3[3];
  long long v18 = *v3;
  long long v17 = v3[1];
  long long v23 = v3[2];
  long long v19 = v23;
  long long v24 = v16;
  a1[8] = v4;
  a1[9] = v6;
  long long v20 = v3[11];
  a1[10] = v7;
  a1[11] = v20;
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v18;
  a1[1] = v17;
  a1[2] = v19;
  a1[3] = v10;
  return sub_235A3557C((uint64_t)v22);
}

uint64_t sub_235A67CE0(_OWORD *a1)
{
  long long v3 = (_OWORD *)(v1 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_viewModel);
  swift_beginAccess();
  long long v4 = v3[8];
  long long v5 = v3[10];
  long long v6 = v3[11];
  v18[9] = v3[9];
  v18[10] = v5;
  v18[11] = v6;
  long long v7 = v3[5];
  v18[4] = v3[4];
  v18[5] = v7;
  long long v8 = v3[7];
  v18[6] = v3[6];
  v18[7] = v8;
  v18[8] = v4;
  long long v9 = v3[1];
  v18[0] = *v3;
  v18[1] = v9;
  long long v10 = v3[3];
  v18[2] = v3[2];
  v18[3] = v10;
  long long v11 = a1[9];
  v3[8] = a1[8];
  v3[9] = v11;
  long long v12 = a1[11];
  v3[10] = a1[10];
  v3[11] = v12;
  long long v13 = a1[5];
  v3[4] = a1[4];
  v3[5] = v13;
  long long v14 = a1[7];
  v3[6] = a1[6];
  v3[7] = v14;
  long long v15 = a1[1];
  _OWORD *v3 = *a1;
  v3[1] = v15;
  long long v16 = a1[3];
  v3[2] = a1[2];
  v3[3] = v16;
  return sub_235A346CC((uint64_t)v18);
}

uint64_t (*sub_235A67DA0())()
{
  return j__swift_endAccess;
}

void *sub_235A67DFC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup16SuccessPresenter_presentingViewController);
  id v2 = v1;
  return v1;
}

void sub_235A67E34(uint64_t a1)
{
  long long v3 = (void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriLanguage + 8);
  if (v4)
  {
    long long v5 = (void *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_languageCode);
    void *v5 = *v3;
    v5[1] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  long long v6 = *(void **)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriVoice);
  if (v6)
  {
    long long v7 = *(void **)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice);
    *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice) = v6;
    id v8 = v6;
  }
  uint64_t v9 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriEnabled);
  if (v9) {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled) = v9 == 2;
  }
  if ((*(unsigned char *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus + 8) & 1) == 0) {
    *(void *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriDataSharingStatus) = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriDataSharingStatus);
  }
  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_voiceTriggerEnabled);
  if (v10) {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_voiceTriggerEnabled) = v10 == 2;
  }
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_recognizeMyVoiceEnabled);
  if (v11) {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled) = v11 == 2;
  }
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC9SiriSetup21LocalDataSourceWriter_siriInCallEnabled);
  if (v12) {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriInCallEnabled) = v12 == 2;
  }
}

id sub_235A67FBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocalDataSource()
{
  return self;
}

uint64_t sub_235A680C4(uint64_t a1, uint64_t a2)
{
  return sub_235A60FD0(a1, a2, &OBJC_IVAR____TtC9SiriSetup15LocalDataSource_iCloudAltDSID);
}

uint64_t sub_235A680D0(uint64_t a1, uint64_t a2)
{
  return sub_235A60FD0(a1, a2, &OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriSharedUserId);
}

void sub_235A680DC(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_enrollmentMode);
}

uint64_t sub_235A680F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_235A68100()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_canSkipVoiceTraining);
}

uint64_t sub_235A68110()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_isSATEnrolled);
}

uint64_t sub_235A68120()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_hasVoiceProfileInCloud);
}

uint64_t sub_235A68130()
{
  uint64_t result = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_overrideViewStyle);
  if (result == 3) {
    return 0x20100u >> (8 * *(unsigned char *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_enrollmentMode));
  }
  return result;
}

uint64_t sub_235A68164(uint64_t a1, uint64_t a2)
{
  return sub_235A60FD0(a1, a2, &OBJC_IVAR____TtC9SiriSetup15LocalDataSource_languageCode);
}

uint64_t sub_235A68170()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_bestSupportedLanguageCode);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_235A681AC()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled);
}

uint64_t sub_235A681BC()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_setupDismissed);
}

uint64_t sub_235A681CC()
{
  return *(void *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriDataSharingStatus);
}

void *sub_235A681DC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice);
  id v2 = v1;
  return v1;
}

uint64_t sub_235A6820C()
{
  return sub_235A61434(v0, v0);
}

uint64_t sub_235A68218(uint64_t a1, uint64_t (*a2)(void))
{
  return a2(*(unsigned __int8 *)(v2 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_requiresVoiceSelection));
}

uint64_t sub_235A6824C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_requiresLanguageSelection);
}

uint64_t sub_235A6825C()
{
  return 1;
}

uint64_t sub_235A68264()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9SiriSetup15LocalDataSource_showMultitriggerForSetup);
}

id sub_235A68278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, char a15, uint64_t a16, void *a17, char a18, char a19, char a20)
{
  char v23 = *a5;
  long long v24 = &v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_iCloudAltDSID];
  *long long v24 = 0;
  v24[1] = 0;
  long long v25 = &v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriSharedUserId];
  *long long v25 = 0;
  v25[1] = 0;
  uint64_t v26 = OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguageOptions;
  *(void *)&v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguageOptions] = 0;
  long long v27 = &v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_languageCode];
  *long long v27 = 0;
  v27[1] = 0;
  uint64_t v28 = OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice;
  *(void *)&v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriVoice] = 0;
  long long v29 = &v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriLanguage];
  *long long v29 = 0;
  v29[1] = 0;
  uint64_t v30 = OBJC_IVAR____TtC9SiriSetup15LocalDataSource_overrideViewStyle;
  v20[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_overrideViewStyle] = 3;
  *long long v27 = a1;
  v27[1] = a2;
  long long v31 = v20;
  swift_bridgeObjectRelease();
  long long v32 = &v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_bestSupportedLanguageCode];
  *long long v32 = a3;
  v32[1] = a4;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_enrollmentMode] = v23;
  *(void *)&v20[v26] = a6;
  swift_bridgeObjectRelease();
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_canSkipVoiceTraining] = a7;
  v20[v30] = a8;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_isSATEnrolled] = a9;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_hasVoiceProfileInCloud] = a10;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriEnabled] = a11;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_setupDismissed] = a12;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_recognizeMyVoiceEnabled] = a13;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_voiceTriggerEnabled] = a14;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriInCallEnabled] = a15;
  *(void *)&v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_siriDataSharingStatus] = a16;
  long long v33 = *(void **)&v20[v28];
  *(void *)&v20[v28] = a17;
  id v34 = a17;

  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_requiresVoiceSelection] = a18;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_requiresLanguageSelection] = a19;
  v31[OBJC_IVAR____TtC9SiriSetup15LocalDataSource_showMultitriggerForSetup] = a20;

  v39.receiver = v31;
  v39.super_class = (Class)type metadata accessor for LocalDataSource();
  return objc_msgSendSuper2(&v39, sel_init);
}

uint64_t sub_235A684CC(char a1, uint64_t a2, uint64_t a3)
{
  long long v6 = (void (*)(void *, void))(*(uint64_t (**)(void *))(a3 + 56))(v14);
  *(unsigned char *)(v7 + 136) = a1;
  v6(v14, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 80))(a2, a3);
  if (result)
  {
    uint64_t v10 = (void *)result;
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v14[5] = v10;
    long long v13 = *(void (**)(uint64_t, uint64_t))(a3 + 40);
    v14[3] = &type metadata for ViewModel;
    v14[4] = &off_26E8ECE80;
    v14[0] = swift_allocObject();
    v13(a2, a3);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, 1, ObjectType, v11);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  return result;
}

uint64_t sub_235A68600()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 208, 7);
}

unsigned char *storeEnumTagSinglePayload for SRSNavigationStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x235A6875CLL);
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

ValueMetadata *type metadata accessor for SRSNavigationStyle()
{
  return &type metadata for SRSNavigationStyle;
}

unint64_t sub_235A68798()
{
  unint64_t result = qword_26882DF78;
  if (!qword_26882DF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26882DF78);
  }
  return result;
}

uint64_t sub_235A687EC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_235A68820()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_235A68830()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_235A68840()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_235A68850()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_235A68860()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_235A68870()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_235A68880()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_235A68890()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_235A688A0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_235A688B0()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_235A688C0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_235A688D0()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_235A688E0()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_235A688F0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_235A68900()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_235A68910()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_235A68920()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_235A68930()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_235A68940()
{
  return MEMORY[0x270F81EA0]();
}

uint64_t sub_235A68950()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_235A68960()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_235A68970()
{
  return MEMORY[0x270F81F60]();
}

uint64_t sub_235A68980()
{
  return MEMORY[0x270F81F90]();
}

uint64_t sub_235A68990()
{
  return MEMORY[0x270F81FB0]();
}

uint64_t sub_235A689A0()
{
  return MEMORY[0x270F82058]();
}

uint64_t sub_235A689B0()
{
  return MEMORY[0x270F82138]();
}

uint64_t sub_235A689C0()
{
  return MEMORY[0x270F82150]();
}

uint64_t sub_235A689D0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_235A689E0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_235A689F0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_235A68A00()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_235A68A10()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_235A68A20()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_235A68A30()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_235A68A40()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_235A68A50()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_235A68A60()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_235A68A70()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_235A68A80()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_235A68A90()
{
  return MEMORY[0x270FA0B88]();
}

uint64_t sub_235A68AA0()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_235A68AB0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_235A68AC0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_235A68AD0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_235A68AE0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_235A68AF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_235A68B00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_235A68B10()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_235A68B20()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_235A68B30()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_235A68B40()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_235A68B50()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_235A68B60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_235A68B70()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_235A68B80()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_235A68B90()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_235A68BA0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_235A68BB0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_235A68BC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_235A68BD0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_235A68BE0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_235A68BF0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_235A68C00()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_235A68C10()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_235A68C30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_235A68C40()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_235A68C50()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_235A68C60()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_235A68C70()
{
  return MEMORY[0x270EE58D8]();
}

uint64_t sub_235A68C80()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_235A68C90()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_235A68CA0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_235A68CB0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_235A68CC0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_235A68CD0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_235A68CE0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_235A68CF0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_235A68D00()
{
  return MEMORY[0x270FA0DB0]();
}

uint64_t sub_235A68D10()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_235A68D20()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_235A68D30()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_235A68D40()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_235A68D50()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_235A68D60()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_235A68D70()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_235A68D80()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_235A68D90()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_235A68DA0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_235A68DB0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_235A68DC0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_235A68DD0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_235A68DE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_235A68DF0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_235A68E00()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_235A68E10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_235A68E20()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_235A68E30()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_235A68E40()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_235A68E50()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_235A68E60()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_235A68E70()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_235A68E80()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_235A68E90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_235A68EA0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_235A68EB0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_235A68EC0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_235A68ED0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_235A68EE0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_235A68EF0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_235A68F00()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_235A68F10()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_235A68F30()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_235A68F40()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_235A68F50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_235A68F60()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_235A68F70()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_235A68F80()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_235A68F90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_235A68FA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_235A68FB0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_235A68FC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_235A68FD0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_235A68FE0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AFBooleanGetName()
{
  return MEMORY[0x270F0EC48]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
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

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t SISchemaUUIDReadFrom()
{
  return MEMORY[0x270F662D0]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
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

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}