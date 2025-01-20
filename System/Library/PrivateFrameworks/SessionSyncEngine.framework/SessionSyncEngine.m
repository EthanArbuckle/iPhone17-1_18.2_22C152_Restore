uint64_t default argument 3 of SyncEngine.init(syncService:metadataStore:keybag:retryTimer:)()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  type metadata accessor for ExponentialBackoffRetryTimer();
  v0 = swift_allocObject();
  *(void *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(void *)(v0 + 32) = 3;
  return v0;
}

uint64_t dispatch thunk of SyncEngineRetryTimer.start(queue:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SyncEngineRetryTimer.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncEngineRetryTimer.reset()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:dataFor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:didFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:didDelete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SyncEngineDataSource.recordIDs(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:resolveConflictBetween:and:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of SyncEngineDataSource.purgeRecords(for:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.localDeviceIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.pairedDevice.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.addRecordIDs(toSave:toDelete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.set(dataSource:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.set(syncEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.validate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.sync()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1EBC5E908)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EBC5E908);
    }
  }
}

BOOL sub_1C7B39A70(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_1C7B39A84(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_1C7B39A90()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  BOOL v3 = __OFSUB__(v1, v2);
  unint64_t v4 = v1 - v2;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v0[3];
    BOOL v6 = v4 > 0x40;
    if (v4 >= 0x40) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = 1 << v4;
    }
    if (v6) {
      unint64_t v7 = 0;
    }
    if (is_mul_ok(v5, v7)) {
      return v5 * v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t ExponentialBackoffRetryTimer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(_OWORD *)(v0 + 32) = xmmword_1C7B7BEA0;
  return v0;
}

uint64_t ExponentialBackoffRetryTimer.init()()
{
  *(void *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(void *)(v0 + 32) = 3;
  return v0;
}

void *ExponentialBackoffRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_allocObject();
  v4[5] = 0;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  BOOL v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *BOOL v6 = 0;
  v4[6] = v5;
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a1;
  return v4;
}

void *ExponentialBackoffRetryTimer.init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  v2[5] = 0;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  BOOL v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *BOOL v6 = 0;
  v2[6] = v5;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t ExponentialBackoffRetryTimer.deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t ExponentialBackoffRetryTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ExponentialBackoffRetryTimer()
{
  return self;
}

uint64_t dispatch thunk of MetadataStoring.unknownRecordIDs(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MetadataStoring.recordIDs(minus:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MetadataStoring.modifiedRecordIDs(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of MetadataStoring.deletedRecordIDs(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of MetadataStoring.set(lastModifiedDate:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of MetadataStoring.set(deletedDate:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of MetadataStoring.set(syncDate:for:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 56))();
}

uint64_t dispatch thunk of MetadataStoring.set(syncDate:forRecordsMatching:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of MetadataStoring.recordMetadata(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of MetadataStoring.purge()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of MetadataStoring.update(metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of MetadataStoring.hasMetadata(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of MetadataStoring.garbageCollect()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of MetadataStoring.isValid(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of MetadataStoring.remove(pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of MetadataStoring.forget(recordID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of MetadataStoring.hasPerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 136))();
}

uint64_t dispatch thunk of MetadataStoring.setPerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t PairedDevice.PairedDeviceClass.description.getter()
{
  uint64_t result = 0x64696C61766E69;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656E6F6870;
      break;
    case 2:
      uint64_t result = 6513005;
      break;
    case 3:
      uint64_t result = 0x6863746177;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static PairedDevice.PairedDeviceClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PairedDevice.PairedDeviceClass.hash(into:)()
{
  return sub_1C7B7B660();
}

uint64_t PairedDevice.PairedDeviceClass.hashValue.getter()
{
  return sub_1C7B7B680();
}

BOOL sub_1C7B39F9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C7B39FB0()
{
  return sub_1C7B7B680();
}

uint64_t sub_1C7B39FF8()
{
  return sub_1C7B7B660();
}

uint64_t sub_1C7B3A024()
{
  return sub_1C7B7B680();
}

uint64_t sub_1C7B3A068()
{
  uint64_t result = 0x64696C61766E69;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656E6F6870;
      break;
    case 2:
      uint64_t result = 6513005;
      break;
    case 3:
      uint64_t result = 0x6863746177;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t PairedDevice.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void PairedDevice.deviceClass.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

void PairedDevice.protocolVersion.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

SessionSyncEngine::PairedDevice __swiftcall PairedDevice.init(identifier:deviceClass:protocolVersion:)(Swift::String identifier, SessionSyncEngine::PairedDevice::PairedDeviceClass deviceClass, SessionSyncEngine::SyncProtocolVersion protocolVersion)
{
  char v4 = *(unsigned char *)deviceClass;
  char v5 = *(unsigned char *)protocolVersion;
  *(Swift::String *)uint64_t v3 = identifier;
  *(unsigned char *)(v3 + 16) = v4;
  *(unsigned char *)(v3 + 17) = v5;
  result.identifier = identifier;
  result.deviceClass = deviceClass;
  return result;
}

uint64_t PairedDevice.description.getter()
{
  return 0;
}

uint64_t _s17SessionSyncEngine12PairedDeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 17);
  int v4 = *(unsigned __int8 *)(a2 + 16);
  int v5 = *(unsigned __int8 *)(a2 + 17);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    if (v2 != v4) {
      return 0;
    }
    return v3 ^ v5 ^ 1u;
  }
  char v7 = sub_1C7B7B5E0();
  uint64_t result = 0;
  if ((v7 & 1) != 0 && v2 == v4) {
    return v3 ^ v5 ^ 1u;
  }
  return result;
}

unint64_t sub_1C7B3A30C()
{
  unint64_t result = qword_1EA4F91F0;
  if (!qword_1EA4F91F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F91F0);
  }
  return result;
}

uint64_t destroy for PairedDevice()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s17SessionSyncEngine12PairedDeviceVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PairedDevice(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PairedDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PairedDevice(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairedDevice(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PairedDevice()
{
  return &type metadata for PairedDevice;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PairedDevice.PairedDeviceClass(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PairedDevice.PairedDeviceClass(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x1C7B3A66CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_1C7B3A694(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C7B3A6A0(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PairedDevice.PairedDeviceClass()
{
  return &type metadata for PairedDevice.PairedDeviceClass;
}

uint64_t Message.init(messageType:version:encodedBody:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(unsigned char *)a6 = *a3;
  *(void *)(a6 + 8) = result;
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_1C7B3A6CC()
{
  uint64_t v1 = 0x546567617373656DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x426465646F636E65;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t sub_1C7B3A738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B3B480(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B3A760()
{
  return 0;
}

void sub_1C7B3A76C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C7B3A778(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3AA4C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B3A7B4(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3AA4C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Message.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F91F8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v16 = *((void *)v1 + 2);
  uint64_t v17 = v9;
  uint64_t v10 = *((void *)v1 + 3);
  uint64_t v14 = *((void *)v1 + 4);
  uint64_t v15 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3AA4C();
  sub_1C7B7B6A0();
  LOBYTE(v18) = v8;
  char v20 = 0;
  sub_1C7B3AAA0();
  sub_1C7B7B5C0();
  if (!v2)
  {
    uint64_t v12 = v14;
    uint64_t v11 = v15;
    LOBYTE(v18) = 1;
    sub_1C7B7B5A0();
    uint64_t v18 = v11;
    uint64_t v19 = v12;
    char v20 = 2;
    sub_1C7B3AAF4();
    sub_1C7B7B5C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C7B3AA4C()
{
  unint64_t result = qword_1EA4F9200;
  if (!qword_1EA4F9200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9200);
  }
  return result;
}

unint64_t sub_1C7B3AAA0()
{
  unint64_t result = qword_1EA4F9208;
  if (!qword_1EA4F9208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9208);
  }
  return result;
}

unint64_t sub_1C7B3AAF4()
{
  unint64_t result = qword_1EA4F9210;
  if (!qword_1EA4F9210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9210);
  }
  return result;
}

uint64_t Message.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9218);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3AA4C();
  sub_1C7B7B690();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v21 = 0;
  sub_1C7B3AE20();
  sub_1C7B7B570();
  int v9 = v18;
  LOBYTE(v18) = 1;
  uint64_t v10 = sub_1C7B7B550();
  uint64_t v12 = v11;
  uint64_t v17 = v10;
  int v20 = v9;
  char v21 = 2;
  sub_1C7B3AE74();
  swift_bridgeObjectRetain();
  sub_1C7B7B570();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v18;
  unint64_t v14 = v19;
  swift_bridgeObjectRetain();
  sub_1C7B3AEC8(v13, v14);
  swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v20;
  *(void *)(a2 + 8) = v17;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_1C7B3AF20(v13, v14);
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

unint64_t sub_1C7B3AE20()
{
  unint64_t result = qword_1EA4F9220;
  if (!qword_1EA4F9220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9220);
  }
  return result;
}

unint64_t sub_1C7B3AE74()
{
  unint64_t result = qword_1EA4F9228;
  if (!qword_1EA4F9228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9228);
  }
  return result;
}

uint64_t sub_1C7B3AEC8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7B3AF20(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C7B3AF78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Message.init(from:)(a1, a2);
}

uint64_t sub_1C7B3AF90(void *a1)
{
  return Message.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for Message(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Message(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 24);
  unint64_t v3 = *(void *)(a1 + 32);

  return sub_1C7B3AF20(v2, v3);
}

uint64_t initializeWithCopy for Message(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_1C7B3AEC8(v4, v5);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for Message(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  unint64_t v4 = *(void *)(a2 + 32);
  sub_1C7B3AEC8(v5, v4);
  uint64_t v6 = *(void *)(a1 + 24);
  unint64_t v7 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v4;
  sub_1C7B3AF20(v6, v7);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Message(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_1C7B3AF20(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Message(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Message(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Message()
{
  return &type metadata for Message;
}

uint64_t getEnumTagSinglePayload for Message.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Message.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x1C7B3B340);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Message.CodingKeys()
{
  return &type metadata for Message.CodingKeys;
}

unint64_t sub_1C7B3B37C()
{
  unint64_t result = qword_1EA4F9230;
  if (!qword_1EA4F9230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9230);
  }
  return result;
}

unint64_t sub_1C7B3B3D4()
{
  unint64_t result = qword_1EA4F9238;
  if (!qword_1EA4F9238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9238);
  }
  return result;
}

unint64_t sub_1C7B3B42C()
{
  unint64_t result = qword_1EA4F9240;
  if (!qword_1EA4F9240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9240);
  }
  return result;
}

uint64_t sub_1C7B3B480(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x426465646F636E65 && a2 == 0xEB0000000079646FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t static Keybag.shared.getter@<X0>(uint64_t *a1@<X8>)
{
  if (qword_1EBC5E6F0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1EBC5DC48;
  a1[3] = _s14descr1F223A629O9IOSKeybagCMa();
  a1[4] = (uint64_t)&off_1F223B4D8;
  *a1 = v2;

  return swift_retain();
}

void sub_1C7B3B68C()
{
  _s14descr1F223A629O9IOSKeybagCMa();
  swift_allocObject();
  sub_1C7B581C0();
  qword_1EBC5DC48 = v0;
}

ValueMetadata *type metadata accessor for Keybag()
{
  return &type metadata for Keybag;
}

uint64_t RecordID.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RecordID.zone.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RecordID.description.getter()
{
  sub_1C7B7B450();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "identifier: ");
  swift_bridgeObjectRetain();
  sub_1C7B7B220();
  swift_bridgeObjectRelease();
  sub_1C7B7B220();
  swift_bridgeObjectRetain();
  sub_1C7B7B220();
  swift_bridgeObjectRelease();
  return v1[0];
}

SessionSyncEngine::RecordID __swiftcall RecordID.init(identifier:zone:)(Swift::String identifier, Swift::String zone)
{
  *uint64_t v2 = identifier;
  v2[1] = zone;
  result.zone = zone;
  result.identifier = identifier;
  return result;
}

uint64_t RecordID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C7B3B8B0()
{
  if (*v0) {
    return 1701736314;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_1C7B3B8E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B3F254(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C7B3B910(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1C7B3B91C(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3D81C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B3B958(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3D81C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t RecordID.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9248);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  char v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  v10[1] = *(void *)(v1 + 24);
  v10[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3D81C();
  sub_1C7B7B6A0();
  char v12 = 0;
  uint64_t v8 = v10[3];
  sub_1C7B7B5A0();
  if (!v8)
  {
    char v11 = 1;
    sub_1C7B7B5A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t RecordID.hashValue.getter()
{
  return sub_1C7B7B680();
}

uint64_t RecordID.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9258);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3D81C();
  sub_1C7B7B690();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v20 = 0;
  uint64_t v9 = sub_1C7B7B550();
  uint64_t v11 = v10;
  char v19 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1C7B7B550();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v18;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C7B3BD98@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return RecordID.init(from:)(a1, a2);
}

uint64_t sub_1C7B3BDB0(void *a1)
{
  return RecordID.encode(to:)(a1);
}

uint64_t sub_1C7B3BDC8()
{
  return sub_1C7B7B680();
}

uint64_t sub_1C7B3BE50()
{
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C7B3BED4()
{
  return sub_1C7B7B680();
}

uint64_t RecordMetadata.recordID.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t RecordMetadata.lastModified.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RecordMetadata(0) + 20);
  uint64_t v4 = sub_1C7B7AFF0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t RecordMetadata.isDeleted.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for RecordMetadata(0) + 24));
}

uint64_t RecordMetadata.description.getter()
{
  return 0;
}

uint64_t RecordMetadata.init(recordID:lastModified:isDeleted:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  uint64_t v9 = type metadata accessor for RecordMetadata(0);
  uint64_t v10 = a4 + *(int *)(v9 + 20);
  uint64_t v11 = sub_1C7B7AFF0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a2, v11);
  *(unsigned char *)(a4 + *(int *)(v9 + 24)) = a3;
  return result;
}

uint64_t RecordMetadata.hash(into:)()
{
  return sub_1C7B7B670();
}

uint64_t sub_1C7B3C478()
{
  uint64_t v1 = 0x69646F4D7473616CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x6574656C65447369;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x444964726F636572;
  }
}

uint64_t sub_1C7B3C4E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B3F344(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B3C508(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3D8D8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B3C544(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3D8D8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t RecordMetadata.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9268);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3D8D8();
  sub_1C7B7B6A0();
  uint64_t v9 = *((void *)v3 + 2);
  uint64_t v10 = *((void *)v3 + 3);
  long long v13 = *v3;
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  v12[15] = 0;
  sub_1C7B3D92C();
  sub_1C7B7B5C0();
  if (!v2)
  {
    type metadata accessor for RecordMetadata(0);
    LOBYTE(v13) = 1;
    sub_1C7B7AFF0();
    sub_1C7B3D890(&qword_1EA4F9280, MEMORY[0x1E4F27928]);
    sub_1C7B7B5C0();
    LOBYTE(v13) = 2;
    sub_1C7B7B5B0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t RecordMetadata.hashValue.getter()
{
  return sub_1C7B7B680();
}

uint64_t RecordMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = sub_1C7B7AFF0();
  uint64_t v21 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9288);
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for RecordMetadata(0);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  v24 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1C7B3D8D8();
  sub_1C7B7B690();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  uint64_t v14 = v22;
  char v28 = 0;
  sub_1C7B3D980();
  sub_1C7B7B570();
  uint64_t v15 = v26;
  uint64_t v16 = v27;
  *(_OWORD *)uint64_t v12 = v25;
  *((void *)v12 + 2) = v15;
  *((void *)v12 + 3) = v16;
  LOBYTE(v25) = 1;
  sub_1C7B3D890(&qword_1EA4F9298, MEMORY[0x1E4F27928]);
  sub_1C7B7B570();
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v12[*(int *)(v10 + 20)], v6, v4);
  LOBYTE(v25) = 2;
  uint64_t v17 = sub_1C7B7B560();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v23);
  v12[*(int *)(v10 + 24)] = v17 & 1;
  sub_1C7B3DAE4((uint64_t)v12, v20, type metadata accessor for RecordMetadata);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return sub_1C7B3DB4C((uint64_t)v12, type metadata accessor for RecordMetadata);
}

uint64_t sub_1C7B3CC88@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RecordMetadata.init(from:)(a1, a2);
}

uint64_t sub_1C7B3CCA0(void *a1)
{
  return RecordMetadata.encode(to:)(a1);
}

uint64_t sub_1C7B3CCC0()
{
  return sub_1C7B7B670();
}

uint64_t sub_1C7B3CDCC()
{
  return sub_1C7B7B680();
}

uint64_t Record.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C7B3DAE4(v1, a1, type metadata accessor for RecordMetadata);
}

uint64_t Record.data.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for Record(0) + 20);
  uint64_t v2 = *(void *)v1;
  sub_1C7B3AEC8(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t Record.init(metadata:data:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_1C7B3DA2C(a1, a4);
  uint64_t result = type metadata accessor for Record(0);
  uint64_t v8 = (void *)(a4 + *(int *)(result + 20));
  *uint64_t v8 = a2;
  v8[1] = a3;
  return result;
}

BOOL sub_1C7B3CFB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C7B3CFC8()
{
  if (*v0) {
    return 1635017060;
  }
  else {
    return 0x617461646174656DLL;
  }
}

uint64_t sub_1C7B3CFFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B3F4C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B3D024(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3DA90();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B3D060(uint64_t a1)
{
  unint64_t v2 = sub_1C7B3DA90();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Record.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F92A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3DA90();
  sub_1C7B7B6A0();
  LOBYTE(v11) = 0;
  type metadata accessor for RecordMetadata(0);
  sub_1C7B3D890(&qword_1EA4F92B0, (void (*)(uint64_t))type metadata accessor for RecordMetadata);
  sub_1C7B7B5C0();
  if (!v2)
  {
    long long v11 = *(_OWORD *)(v3 + *(int *)(type metadata accessor for Record(0) + 20));
    v10[15] = 1;
    sub_1C7B3AAF4();
    sub_1C7B7B5C0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Record.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  type metadata accessor for RecordMetadata(0);
  MEMORY[0x1F4188790]();
  uint64_t v18 = (uint64_t)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F92B8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Record(0);
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B3DA90();
  sub_1C7B7B690();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v16;
  LOBYTE(v19) = 0;
  sub_1C7B3D890(&qword_1EA4F92C0, (void (*)(uint64_t))type metadata accessor for RecordMetadata);
  uint64_t v13 = v17;
  sub_1C7B7B570();
  sub_1C7B3DA2C(v18, v11);
  char v20 = 1;
  sub_1C7B3AE74();
  sub_1C7B7B570();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
  *(_OWORD *)(v11 + *(int *)(v8 + 20)) = v19;
  sub_1C7B3DAE4(v11, v15, type metadata accessor for Record);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1C7B3DB4C(v11, type metadata accessor for Record);
}

uint64_t sub_1C7B3D56C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Record.init(from:)(a1, a2);
}

uint64_t sub_1C7B3D584(void *a1)
{
  return Record.encode(to:)(a1);
}

uint64_t _s17SessionSyncEngine14RecordMetadataV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  BOOL v8 = *a1 == *a2 && a1[1] == a2[1];
  if (v8 || (char v9 = sub_1C7B7B5E0(), v10 = 0, (v9 & 1) != 0))
  {
    BOOL v11 = v4 == v6 && v5 == v7;
    if (v11 || (v12 = sub_1C7B7B5E0(), char v10 = 0, (v12 & 1) != 0))
    {
      uint64_t v13 = type metadata accessor for RecordMetadata(0);
      if (sub_1C7B7AFC0()) {
        char v10 = *((unsigned char *)a1 + *(int *)(v13 + 24)) ^ *((unsigned char *)a2 + *(int *)(v13 + 24)) ^ 1;
      }
      else {
        char v10 = 0;
      }
    }
  }
  return v10 & 1;
}

uint64_t _s17SessionSyncEngine6RecordV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  BOOL v8 = *a1 == *a2 && a1[1] == a2[1];
  if (!v8 && (sub_1C7B7B5E0() & 1) == 0) {
    return 0;
  }
  BOOL v9 = v4 == v6 && v5 == v7;
  if (!v9 && (sub_1C7B7B5E0() & 1) == 0) {
    return 0;
  }
  uint64_t v10 = type metadata accessor for RecordMetadata(0);
  if ((sub_1C7B7AFC0() & 1) == 0
    || *((unsigned __int8 *)a1 + *(int *)(v10 + 24)) != *((unsigned __int8 *)a2 + *(int *)(v10 + 24)))
  {
    return 0;
  }
  uint64_t v12 = *(int *)(type metadata accessor for Record(0) + 20);
  uint64_t v13 = *(void *)((char *)a1 + v12);
  unint64_t v14 = *(void *)((char *)a1 + v12 + 8);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = *v15;
  unint64_t v17 = v15[1];

  return sub_1C7B769C8(v13, v14, v16, v17);
}

uint64_t _s17SessionSyncEngine8RecordIDV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_1C7B7B5E0(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_1C7B7B5E0();
    }
  }
  return result;
}

unint64_t sub_1C7B3D81C()
{
  unint64_t result = qword_1EA4F9250;
  if (!qword_1EA4F9250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9250);
  }
  return result;
}

uint64_t type metadata accessor for RecordMetadata(uint64_t a1)
{
  return sub_1C7B3D9F4(a1, qword_1EBC5E3C0);
}

uint64_t sub_1C7B3D890(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C7B3D8D8()
{
  unint64_t result = qword_1EA4F9270;
  if (!qword_1EA4F9270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9270);
  }
  return result;
}

unint64_t sub_1C7B3D92C()
{
  unint64_t result = qword_1EA4F9278;
  if (!qword_1EA4F9278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9278);
  }
  return result;
}

unint64_t sub_1C7B3D980()
{
  unint64_t result = qword_1EA4F9290;
  if (!qword_1EA4F9290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9290);
  }
  return result;
}

uint64_t type metadata accessor for Record(uint64_t a1)
{
  return sub_1C7B3D9F4(a1, (uint64_t *)&unk_1EA4F92D0);
}

uint64_t sub_1C7B3D9F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C7B3DA2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C7B3DA90()
{
  unint64_t result = qword_1EA4F92A8;
  if (!qword_1EA4F92A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F92A8);
  }
  return result;
}

uint64_t sub_1C7B3DAE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7B3DB4C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1C7B3DBB0()
{
  unint64_t result = qword_1EBC5E818;
  if (!qword_1EBC5E818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC5E818);
  }
  return result;
}

uint64_t sub_1C7B3DC04()
{
  return sub_1C7B3D890(&qword_1EA4F92C8, (void (*)(uint64_t))type metadata accessor for RecordMetadata);
}

uint64_t destroy for RecordID()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RecordID(void *a1, void *a2)
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

void *assignWithCopy for RecordID(void *a1, void *a2)
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

void *assignWithTake for RecordID(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for RecordID(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RecordID(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RecordID()
{
  return &type metadata for RecordID;
}

void *initializeBufferWithCopyOfBuffer for RecordMetadata(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    BOOL v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1C7B7AFF0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t destroy for RecordMetadata(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1C7B7AFF0();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for RecordMetadata(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1C7B7AFF0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithCopy for RecordMetadata(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C7B7AFF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *initializeWithTake for RecordMetadata(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1C7B7AFF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for RecordMetadata(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1C7B7AFF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C7B3E2A8);
}

uint64_t sub_1C7B3E2A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1C7B7AFF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for RecordMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C7B3E36C);
}

uint64_t sub_1C7B3E36C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C7B7AFF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1C7B3E414()
{
  uint64_t result = sub_1C7B7AFF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Record(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = type metadata accessor for RecordMetadata(0);
    uint64_t v10 = *(int *)(v9 + 20);
    uint64_t v21 = (char *)v4 + v10;
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_1C7B7AFF0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v21, v11, v12);
    *((unsigned char *)v4 + *(int *)(v9 + 24)) = *((unsigned char *)a2 + *(int *)(v9 + 24));
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = (void *)((char *)v4 + v14);
    uint64_t v16 = (void *)((char *)a2 + v14);
    uint64_t v17 = *v16;
    unint64_t v18 = v16[1];
    sub_1C7B3AEC8(*v16, v18);
    *uint64_t v15 = v17;
    v15[1] = v18;
  }
  return v4;
}

uint64_t destroy for Record(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for RecordMetadata(0) + 20);
  uint64_t v5 = sub_1C7B7AFF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];

  return sub_1C7B3AF20(v7, v8);
}

void *initializeWithCopy for Record(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = type metadata accessor for RecordMetadata(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1C7B7AFF0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *((unsigned char *)a1 + *(int *)(v7 + 24)) = *((unsigned char *)a2 + *(int *)(v7 + 24));
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = *v15;
  unint64_t v17 = v15[1];
  sub_1C7B3AEC8(*v15, v17);
  *uint64_t v14 = v16;
  v14[1] = v17;
  return a1;
}

void *assignWithCopy for Record(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for RecordMetadata(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1C7B7AFF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *((unsigned char *)a1 + *(int *)(v6 + 24)) = *((unsigned char *)a2 + *(int *)(v6 + 24));
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_1C7B3AEC8(*v13, v15);
  uint64_t v16 = *v12;
  unint64_t v17 = v12[1];
  *uint64_t v12 = v14;
  v12[1] = v15;
  sub_1C7B3AF20(v16, v17);
  return a1;
}

_OWORD *initializeWithTake for Record(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = type metadata accessor for RecordMetadata(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1C7B7AFF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *((unsigned char *)a1 + *(int *)(v7 + 24)) = *((unsigned char *)a2 + *(int *)(v7 + 24));
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for Record(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for RecordMetadata(0);
  uint64_t v9 = *(int *)(v8 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1C7B7AFF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *((unsigned char *)a1 + *(int *)(v8 + 24)) = *((unsigned char *)a2 + *(int *)(v8 + 24));
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = *(void *)((char *)a1 + v13);
  unint64_t v15 = *(void *)((char *)a1 + v13 + 8);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  sub_1C7B3AF20(v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for Record(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C7B3EA38);
}

uint64_t sub_1C7B3EA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for RecordMetadata(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
    if (((4 * v10) & 0xC) != 0) {
      return 16 - ((4 * v10) & 0xC | (v10 >> 2));
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for Record(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C7B3EB20);
}

uint64_t sub_1C7B3EB20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for RecordMetadata(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    uint64_t v11 = (void *)(a1 + *(int *)(a4 + 20));
    *uint64_t v11 = 0;
    v11[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_1C7B3EBEC()
{
  uint64_t result = type metadata accessor for RecordMetadata(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *sub_1C7B3EC88(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Record.CodingKeys()
{
  return &type metadata for Record.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for RecordMetadata.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7B3ED70);
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

ValueMetadata *type metadata accessor for RecordMetadata.CodingKeys()
{
  return &type metadata for RecordMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SyncProtocolVersion(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s17SessionSyncEngine6RecordV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7B3EF04);
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

ValueMetadata *type metadata accessor for RecordID.CodingKeys()
{
  return &type metadata for RecordID.CodingKeys;
}

unint64_t sub_1C7B3EF40()
{
  unint64_t result = qword_1EA4F92E0;
  if (!qword_1EA4F92E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F92E0);
  }
  return result;
}

unint64_t sub_1C7B3EF98()
{
  unint64_t result = qword_1EA4F92E8;
  if (!qword_1EA4F92E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F92E8);
  }
  return result;
}

unint64_t sub_1C7B3EFF0()
{
  unint64_t result = qword_1EA4F92F0;
  if (!qword_1EA4F92F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F92F0);
  }
  return result;
}

unint64_t sub_1C7B3F048()
{
  unint64_t result = qword_1EA4F92F8;
  if (!qword_1EA4F92F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F92F8);
  }
  return result;
}

unint64_t sub_1C7B3F0A0()
{
  unint64_t result = qword_1EA4F9300;
  if (!qword_1EA4F9300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9300);
  }
  return result;
}

unint64_t sub_1C7B3F0F8()
{
  unint64_t result = qword_1EA4F9308;
  if (!qword_1EA4F9308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9308);
  }
  return result;
}

unint64_t sub_1C7B3F150()
{
  unint64_t result = qword_1EA4F9310;
  if (!qword_1EA4F9310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9310);
  }
  return result;
}

unint64_t sub_1C7B3F1A8()
{
  unint64_t result = qword_1EA4F9318;
  if (!qword_1EA4F9318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9318);
  }
  return result;
}

unint64_t sub_1C7B3F200()
{
  unint64_t result = qword_1EA4F9320;
  if (!qword_1EA4F9320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9320);
  }
  return result;
}

uint64_t sub_1C7B3F254(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736314 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C7B3F344(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x444964726F636572 && a2 == 0xE800000000000000;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69646F4D7473616CLL && a2 == 0xEC00000064656966 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574656C65447369 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1C7B3F4C0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t SyncState.rawValue.getter()
{
  return *(void *)v0;
}

SessionSyncEngine::SyncState __swiftcall SyncState.init(rawValue:)(SessionSyncEngine::SyncState rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static SyncState.supportedDevice.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static SyncState.preferenceEnabled.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void sub_1C7B3F5DC()
{
  uint64_t v0 = unk_1F223A740;
  if ((unk_1F223A740 & ~qword_1F223A738) == 0) {
    uint64_t v0 = 0;
  }
  qword_1EBC5DCD0 = v0 | qword_1F223A738;
}

uint64_t sub_1C7B3F600@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t static SyncState.active.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EBC5DCD8 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = qword_1EBC5DCD0;
  return result;
}

uint64_t SyncState.description.getter()
{
  uint64_t v1 = *v0;
  if (*v0) {
    sub_1C7B7B220();
  }
  if ((v1 & 2) != 0) {
    sub_1C7B7B220();
  }
  return 0;
}

void *sub_1C7B3F73C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C7B3F74C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1C7B3F754@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1C7B3F768@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1C7B3F77C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1C7B3F790(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1C7B3F7C0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1C7B3F7EC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1C7B3F810(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1C7B3F824(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1C7B3F838(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1C7B3F84C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1C7B3F860(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1C7B3F874(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1C7B3F888(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1C7B3F89C()
{
  return *v0 == 0;
}

uint64_t sub_1C7B3F8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1C7B3F8C4(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1C7B3F8D8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1C7B3F8E8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1C7B3F8F4(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1C7B3F90C()
{
  unint64_t result = qword_1EA4F9328;
  if (!qword_1EA4F9328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9328);
  }
  return result;
}

unint64_t sub_1C7B3F964()
{
  unint64_t result = qword_1EA4F9330;
  if (!qword_1EA4F9330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9330);
  }
  return result;
}

unint64_t sub_1C7B3F9BC()
{
  unint64_t result = qword_1EA4F9338;
  if (!qword_1EA4F9338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9338);
  }
  return result;
}

unint64_t sub_1C7B3FA14()
{
  unint64_t result = qword_1EA4F9340;
  if (!qword_1EA4F9340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9340);
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncState()
{
  return &type metadata for SyncState;
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didReceiveMessage:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:shouldAcceptIncomingMessage:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didSendWithRequestIdentifier:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didUpdatePairedDevice:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of SyncServicing.add(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SyncServicing.resume()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncServicing.send(message:destinations:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t MetadataStore.__allocating_init(persistentStore:)(uint64_t a1)
{
  sub_1C7B3FB7C(a1, (uint64_t)v4);
  type metadata accessor for MetadataStore();
  uint64_t v2 = swift_allocObject();
  MetadataStore.init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(10, (uint64_t)v4, 120.0, 60.0);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t sub_1C7B3FB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t MetadataStore.__allocating_init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = swift_allocObject();
  MetadataStore.init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(a1, a2, a3, a4);
  return v8;
}

uint64_t type metadata accessor for MetadataStore()
{
  return self;
}

uint64_t MetadataStore.init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(double *)(v4 + 16) = a3;
  uint64_t v6 = MEMORY[0x1E4FBC868];
  uint64_t v7 = MEMORY[0x1E4FBC870];
  *(void *)(v4 + 48) = MEMORY[0x1E4FBC868];
  *(void *)(v4 + 56) = v7;
  *(double *)(v4 + 24) = a4;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = v6;
  sub_1C7B4E608(a2, (uint64_t)v11, &qword_1EBC5DC40);
  uint64_t v8 = v12;
  if (v12)
  {
    uint64_t v9 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    sub_1C7B4E5AC((uint64_t)v11, &qword_1EBC5DC40);
  }
  sub_1C7B3FDF0();
  sub_1C7B404F0();
  sub_1C7B4E5AC(a2, &qword_1EBC5DC40);
  return v4;
}

Swift::Void __swiftcall MetadataStore.garbageCollect()()
{
  sub_1C7B3FDF0();

  sub_1C7B404F0();
}

uint64_t MetadataStore.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MetadataStore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_1C7B3FDF0()
{
  unint64_t v1 = sub_1C7B465E0();
  uint64_t v2 = (uint64_t *)sub_1C7B467A4();
  uint64_t v45 = v0;
  uint64_t v3 = sub_1C7B46A3C();
  if (qword_1EBC5E820 != -1) {
LABEL_38:
  }
    swift_once();
  uint64_t v4 = sub_1C7B7B090();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC5DC50);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_1C7B7B080();
  os_log_type_t v6 = sub_1C7B7B2D0();
  uint64_t v46 = v1;
  v48 = v2;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v51[0] = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C7B7B2A0();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v12 = v9;
    uint64_t v2 = v48;
    sub_1C7B47DE8(v12, v11, v51);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v5, v6, "Removing obsolete device identifiers: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v8, -1, -1);
    MEMORY[0x1C87BC480](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_1C7B7B080();
  os_log_type_t v14 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v51[0] = v16;
    *(_DWORD *)unint64_t v15 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1C7B7B2A0();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_1C7B47DE8(v17, v19, v51);
    uint64_t v2 = v48;
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v13, v14, "Removing bloated device identifiers: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v16, -1, -1);
    MEMORY[0x1C87BC480](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  char v20 = sub_1C7B7B080();
  os_log_type_t v21 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v51[0] = v23;
    *(_DWORD *)uint64_t v22 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_1C7B7B2A0();
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    sub_1C7B47DE8(v24, v26, v51);
    uint64_t v2 = v48;
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v20, v21, "Removing unsynced device identifiers: %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v23, -1, -1);
    MEMORY[0x1C87BC480](v22, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v27 = sub_1C7B589D0((uint64_t)v2, v46);
  uint64_t v3 = sub_1C7B589D0(v3, v27);
  int64_t v28 = 0;
  uint64_t v47 = v3 + 56;
  uint64_t v29 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v1 = v30 & *(void *)(v3 + 56);
  uint64_t v2 = (uint64_t *)(v45 + 48);
  int64_t v49 = (unint64_t)(v29 + 63) >> 6;
  while (1)
  {
    if (v1)
    {
      unint64_t v31 = __clz(__rbit64(v1));
      v1 &= v1 - 1;
      unint64_t v32 = v31 | (v28 << 6);
      goto LABEL_32;
    }
    int64_t v33 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v33 >= v49) {
      return swift_release();
    }
    unint64_t v34 = *(void *)(v47 + 8 * v33);
    ++v28;
    if (!v34)
    {
      int64_t v28 = v33 + 1;
      if (v33 + 1 >= v49) {
        return swift_release();
      }
      unint64_t v34 = *(void *)(v47 + 8 * v28);
      if (!v34)
      {
        int64_t v28 = v33 + 2;
        if (v33 + 2 >= v49) {
          return swift_release();
        }
        unint64_t v34 = *(void *)(v47 + 8 * v28);
        if (!v34) {
          break;
        }
      }
    }
LABEL_31:
    unint64_t v1 = (v34 - 1) & v34;
    unint64_t v32 = __clz(__rbit64(v34)) + (v28 << 6);
LABEL_32:
    v36 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v32);
    uint64_t v38 = *v36;
    uint64_t v37 = v36[1];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_1C7B49014(v38, v37);
    char v41 = v40;
    swift_bridgeObjectRelease();
    if (v41)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v43 = *v2;
      uint64_t v50 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1C7B4C278(&qword_1EA4F9360);
        uint64_t v43 = v50;
      }
      swift_bridgeObjectRelease();
      sub_1C7B4AA7C(v39, v43);
      *uint64_t v2 = v43;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    swift_beginAccess();
    sub_1C7B48DC4(v38, v37);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  int64_t v35 = v33 + 3;
  if (v35 < v49)
  {
    unint64_t v34 = *(void *)(v47 + 8 * v35);
    if (!v34)
    {
      while (1)
      {
        int64_t v28 = v35 + 1;
        if (__OFADD__(v35, 1)) {
          goto LABEL_37;
        }
        if (v28 >= v49) {
          return swift_release();
        }
        unint64_t v34 = *(void *)(v47 + 8 * v28);
        ++v35;
        if (v34) {
          goto LABEL_31;
        }
      }
    }
    int64_t v28 = v35;
    goto LABEL_31;
  }
  return swift_release();
}

uint64_t sub_1C7B404F0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v1 - 8);
  v68 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E810);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  os_log_type_t v6 = (unint64_t *)((char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (uint64_t *)((char *)&v61 - v7);
  uint64_t v75 = MEMORY[0x1E4FBC870];
  uint64_t v67 = v0 + 40;
  swift_beginAccess();
  uint64_t v69 = v0;
  uint64_t v9 = *(void *)(v0 + 40);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v64 = v9 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  unint64_t v14 = (unint64_t)(v11 + 63) >> 6;
  unint64_t v61 = v14 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v16 = 0;
  int64_t v65 = v14;
  uint64_t v66 = result;
  uint64_t v62 = result + 104;
  unint64_t v63 = v14 - 5;
  uint64_t v17 = &qword_1EBC5E808;
  while (1)
  {
    if (v13)
    {
      unint64_t v18 = __clz(__rbit64(v13));
      uint64_t v19 = (v13 - 1) & v13;
      unint64_t v20 = v18 | (v16 << 6);
      goto LABEL_8;
    }
    int64_t v28 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v28 >= v65)
    {
      unint64_t v30 = v16;
    }
    else
    {
      unint64_t v29 = *(void *)(v64 + 8 * v28);
      if (v29) {
        goto LABEL_12;
      }
      unint64_t v30 = v16 + 1;
      if ((uint64_t)(v16 + 2) < v65)
      {
        unint64_t v29 = *(void *)(v64 + 8 * (v16 + 2));
        if (v29)
        {
          int64_t v28 = v16 + 2;
          goto LABEL_12;
        }
        unint64_t v30 = v16 + 2;
        if ((uint64_t)(v16 + 3) < v65)
        {
          unint64_t v29 = *(void *)(v64 + 8 * (v16 + 3));
          if (v29)
          {
            int64_t v28 = v16 + 3;
LABEL_12:
            uint64_t v19 = (v29 - 1) & v29;
            unint64_t v20 = __clz(__rbit64(v29)) + (v28 << 6);
            unint64_t v16 = v28;
LABEL_8:
            uint64_t v21 = *(void *)(v66 + 56);
            uint64_t v22 = (void *)(*(void *)(v66 + 48) + 32 * v20);
            uint64_t v23 = v22[1];
            uint64_t v24 = v22[2];
            uint64_t v25 = v22[3];
            *os_log_type_t v6 = *v22;
            v6[1] = v23;
            v6[2] = v24;
            v6[3] = v25;
            uint64_t v26 = v21 + *(void *)(*(void *)(type metadata accessor for RecordMetadata(0) - 8) + 72) * v20;
            uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(v17);
            sub_1C7B4E270(v26, (uint64_t)v6 + *(int *)(v27 + 48));
            (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v6, 0, 1, v27);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_15;
          }
          int64_t v28 = v16 + 4;
          unint64_t v30 = v16 + 3;
          if ((uint64_t)(v16 + 4) < v65)
          {
            unint64_t v29 = *(void *)(v64 + 8 * v28);
            if (v29) {
              goto LABEL_12;
            }
            while (v63 != v16)
            {
              unint64_t v29 = *(void *)(v62 + 8 * v16++);
              if (v29)
              {
                int64_t v28 = v16 + 4;
                goto LABEL_12;
              }
            }
            unint64_t v30 = v61;
          }
        }
      }
    }
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(v17);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v6, 1, 1, v31);
    uint64_t v19 = 0;
    unint64_t v16 = v30;
LABEL_15:
    sub_1C7B4E66C((uint64_t)v6, (uint64_t)v8, &qword_1EBC5E810);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(v17);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v8, 1, v32) == 1)
    {
      uint64_t result = swift_release();
      int64_t v42 = 0;
      uint64_t v43 = v75;
      uint64_t v44 = *(void *)(v75 + 56);
      unint64_t v70 = v75 + 56;
      uint64_t v45 = 1 << *(unsigned char *)(v75 + 32);
      uint64_t v46 = -1;
      if (v45 < 64) {
        uint64_t v46 = ~(-1 << v45);
      }
      unint64_t v47 = v46 & v44;
      int64_t v48 = (unint64_t)(v45 + 63) >> 6;
      while (1)
      {
        if (v47)
        {
          unint64_t v49 = __clz(__rbit64(v47));
          v47 &= v47 - 1;
          unint64_t v50 = v49 | (v42 << 6);
        }
        else
        {
          int64_t v58 = v42 + 1;
          if (__OFADD__(v42, 1))
          {
            __break(1u);
            goto LABEL_53;
          }
          if (v58 >= v48) {
            return swift_release();
          }
          unint64_t v59 = *(void *)(v70 + 8 * v58);
          ++v42;
          if (!v59)
          {
            int64_t v42 = v58 + 1;
            if (v58 + 1 >= v48) {
              return swift_release();
            }
            unint64_t v59 = *(void *)(v70 + 8 * v42);
            if (!v59)
            {
              int64_t v42 = v58 + 2;
              if (v58 + 2 >= v48) {
                return swift_release();
              }
              unint64_t v59 = *(void *)(v70 + 8 * v42);
              if (!v59)
              {
                int64_t v60 = v58 + 3;
                if (v60 >= v48) {
                  return swift_release();
                }
                unint64_t v59 = *(void *)(v70 + 8 * v60);
                if (!v59)
                {
                  while (1)
                  {
                    int64_t v42 = v60 + 1;
                    if (__OFADD__(v60, 1)) {
                      goto LABEL_54;
                    }
                    if (v42 >= v48) {
                      return swift_release();
                    }
                    unint64_t v59 = *(void *)(v70 + 8 * v42);
                    ++v60;
                    if (v59) {
                      goto LABEL_50;
                    }
                  }
                }
                int64_t v42 = v60;
              }
            }
          }
LABEL_50:
          unint64_t v47 = (v59 - 1) & v59;
          unint64_t v50 = __clz(__rbit64(v59)) + (v42 << 6);
        }
        v51 = (uint64_t *)(*(void *)(v43 + 48) + 32 * v50);
        uint64_t v53 = v51[1];
        uint64_t v55 = v51[2];
        uint64_t v54 = v51[3];
        uint64_t v71 = *v51;
        uint64_t v52 = v71;
        uint64_t v72 = v53;
        uint64_t v73 = v55;
        uint64_t v74 = v54;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C7B44FF0(&v71);
        uint64_t v56 = type metadata accessor for RecordMetadata(0);
        uint64_t v57 = (uint64_t)v68;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v68, 1, 1, v56);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C7B42524(v57, v52, v53, v55, v54);
        swift_endAccess();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
    }
    unint64_t v70 = v19;
    int64_t v33 = v6;
    unint64_t v34 = v16;
    int64_t v35 = v17;
    uint64_t v36 = *v8;
    uint64_t v37 = v8[1];
    uint64_t v38 = v8[2];
    uint64_t v39 = v8[3];
    uint64_t v40 = (uint64_t)v8 + *(int *)(v32 + 48);
    char v41 = *(unsigned char *)(v40 + *(int *)(type metadata accessor for RecordMetadata(0) + 24));
    sub_1C7B4E2D4(v40);
    if (v41 & 1) != 0 && (uint64_t v71 = v36, v72 = v37, v73 = v38, v74 = v39, (sub_1C7B474C4(&v71)))
    {
      sub_1C7B48670(&v71, v36, v37, v38, v39);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = v35;
    unint64_t v16 = v34;
    os_log_type_t v6 = v33;
    unint64_t v13 = v70;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t MetadataStore.unknownRecordIDs(in:)(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  if (v2)
  {
    unint64_t v4 = 0;
    uint64_t v5 = a1 + 56;
    uint64_t v22 = -(uint64_t)v2;
    uint64_t v21 = MEMORY[0x1E4FBC860];
    unint64_t v20 = v2;
    uint64_t v19 = a1 + 56;
    do
    {
      if (v4 <= v2) {
        unint64_t v6 = v2;
      }
      else {
        unint64_t v6 = v4;
      }
      uint64_t v7 = -(uint64_t)v6;
      uint64_t v8 = (uint64_t *)(v5 + 32 * v4++);
      while (1)
      {
        if (v7 + v4 == 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v10 = *(v8 - 3);
        uint64_t v9 = *(v8 - 2);
        uint64_t v12 = *(v8 - 1);
        uint64_t v11 = *v8;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v13 = swift_bridgeObjectRetain();
        char v14 = sub_1C7B4D174(v13, v10, v9, v12, v11);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0) {
          break;
        }
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        ++v4;
        v8 += 4;
        if (v22 + v4 == 1) {
          goto LABEL_18;
        }
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v15 = v21;
      if ((result & 1) == 0)
      {
        uint64_t result = sub_1C7B4C964(0, *(void *)(v21 + 16) + 1, 1);
        uint64_t v15 = v21;
      }
      unint64_t v2 = v20;
      unint64_t v17 = *(void *)(v15 + 16);
      unint64_t v16 = *(void *)(v15 + 24);
      if (v17 >= v16 >> 1)
      {
        uint64_t result = sub_1C7B4C964(v16 > 1, v17 + 1, 1);
        unint64_t v2 = v20;
        uint64_t v15 = v21;
      }
      *(void *)(v15 + 16) = v17 + 1;
      uint64_t v21 = v15;
      unint64_t v18 = (void *)(v15 + 32 * v17);
      v18[4] = v10;
      v18[5] = v9;
      v18[6] = v12;
      v18[7] = v11;
      uint64_t v5 = v19;
    }
    while (v22 + v4);
  }
  else
  {
    uint64_t v21 = MEMORY[0x1E4FBC860];
  }
LABEL_18:
  swift_bridgeObjectRelease();
  swift_release();
  return v21;
}

uint64_t sub_1C7B40D5C(uint64_t (*a1)(uint64_t), char a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
  uint64_t v7 = MEMORY[0x1F4188790](v37);
  uint64_t v36 = (uint64_t)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (uint64_t *)((char *)&v33 - v9);
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v34 = a3 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v35 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v39 = a3;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = 0;
  while (v14)
  {
    uint64_t v41 = v4;
    unint64_t v17 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    int64_t v40 = v16;
    unint64_t v18 = v17 | (v16 << 6);
LABEL_19:
    uint64_t v23 = *(void *)(v39 + 56);
    uint64_t v24 = (uint64_t *)(*(void *)(v39 + 48) + 32 * v18);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    uint64_t v28 = v24[2];
    uint64_t v27 = v24[3];
    uint64_t v29 = type metadata accessor for RecordMetadata(0);
    sub_1C7B4E270(v23 + *(void *)(*(void *)(v29 - 8) + 72) * v18, (uint64_t)v10 + *(int *)(v37 + 48));
    *uint64_t v10 = v25;
    v10[1] = v26;
    v10[2] = v28;
    v10[3] = v27;
    uint64_t v30 = v36;
    sub_1C7B4E66C((uint64_t)v10, v36, &qword_1EBC5E808);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = v41;
    char v32 = v38(v30);
    uint64_t v4 = v31;
    uint64_t result = sub_1C7B4E5AC(v30, &qword_1EBC5E808);
    if (v31) {
      goto LABEL_28;
    }
    int64_t v16 = v40;
    if (v32)
    {
      a2 = 1;
LABEL_28:
      swift_release();
      return a2 & 1;
    }
  }
  BOOL v19 = __OFADD__(v16, 1);
  int64_t v20 = v16 + 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v20 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v20);
  if (v21)
  {
LABEL_18:
    uint64_t v41 = v4;
    unint64_t v14 = (v21 - 1) & v21;
    int64_t v40 = v20;
    unint64_t v18 = __clz(__rbit64(v21)) + (v20 << 6);
    goto LABEL_19;
  }
  int64_t v22 = v20 + 1;
  if (v20 + 1 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v20 + 2;
  if (v20 + 2 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v20 + 3;
  if (v20 + 3 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v20 + 4;
  if (v20 + 4 >= v35)
  {
LABEL_27:
    a2 = 0;
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21)
  {
LABEL_17:
    int64_t v20 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v20 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v20 >= v35) {
      goto LABEL_27;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v20);
    ++v22;
    if (v21) {
      goto LABEL_18;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C7B41048(uint64_t (*a1)(uint64_t), char a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9368);
  uint64_t v7 = MEMORY[0x1F4188790](v37);
  uint64_t v36 = (uint64_t)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v34 = a3 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v35 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v39 = a3;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = 0;
  while (v14)
  {
    uint64_t v41 = v4;
    unint64_t v17 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    int64_t v40 = v16;
    unint64_t v18 = v17 | (v16 << 6);
LABEL_19:
    uint64_t v23 = *(void *)(v39 + 56);
    uint64_t v24 = (uint64_t *)(*(void *)(v39 + 48) + 32 * v18);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    uint64_t v28 = v24[2];
    uint64_t v27 = v24[3];
    uint64_t v29 = sub_1C7B7AFF0();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(&v10[*(int *)(v37 + 48)], v23 + *(void *)(*(void *)(v29 - 8) + 72) * v18, v29);
    *(void *)uint64_t v10 = v25;
    *((void *)v10 + 1) = v26;
    *((void *)v10 + 2) = v28;
    *((void *)v10 + 3) = v27;
    uint64_t v30 = v36;
    sub_1C7B4E66C((uint64_t)v10, v36, &qword_1EA4F9368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = v41;
    char v32 = v38(v30);
    uint64_t v4 = v31;
    uint64_t result = sub_1C7B4E5AC(v30, &qword_1EA4F9368);
    if (v31) {
      goto LABEL_28;
    }
    int64_t v16 = v40;
    if (v32)
    {
      a2 = 1;
LABEL_28:
      swift_release();
      return a2 & 1;
    }
  }
  BOOL v19 = __OFADD__(v16, 1);
  int64_t v20 = v16 + 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v20 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v20);
  if (v21)
  {
LABEL_18:
    uint64_t v41 = v4;
    unint64_t v14 = (v21 - 1) & v21;
    int64_t v40 = v20;
    unint64_t v18 = __clz(__rbit64(v21)) + (v20 << 6);
    goto LABEL_19;
  }
  int64_t v22 = v20 + 1;
  if (v20 + 1 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v20 + 2;
  if (v20 + 2 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v20 + 3;
  if (v20 + 3 >= v35) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v20 + 4;
  if (v20 + 4 >= v35)
  {
LABEL_27:
    a2 = 0;
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v22);
  if (v21)
  {
LABEL_17:
    int64_t v20 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v20 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v20 >= v35) {
      goto LABEL_27;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v20);
    ++v22;
    if (v21) {
      goto LABEL_18;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t MetadataStore.recordIDs(minus:)(uint64_t a1)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1C7B4D878(v2, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1C7B413E0(v3);
  swift_release();
  return v4;
}

uint64_t sub_1C7B413E0(uint64_t a1)
{
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
  uint64_t v3 = MEMORY[0x1F4188790](v62);
  int64_t v58 = (uint64_t *)((char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v57 = (uint64_t *)((char *)&v49 - v6);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v56 = (uint64_t *)((char *)&v49 - v8);
  MEMORY[0x1F4188790](v7);
  uint64_t v55 = (uint64_t *)((char *)&v49 - v9);
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = MEMORY[0x1E4FBC860];
  if (!v10) {
    return v11;
  }
  uint64_t v49 = v1;
  uint64_t v63 = MEMORY[0x1E4FBC860];
  sub_1C7B4C964(0, v10, 0);
  uint64_t result = sub_1C7B767AC(a1);
  uint64_t v14 = result;
  uint64_t v15 = 0;
  uint64_t v16 = a1 + 64;
  uint64_t v50 = a1 + 80;
  int64_t v51 = v10;
  uint64_t v53 = a1 + 64;
  uint64_t v54 = a1;
  uint64_t v52 = v13;
  while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v19 = (unint64_t)v14 >> 6;
    if ((*(void *)(v16 + 8 * ((unint64_t)v14 >> 6)) & (1 << v14)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v13) {
      goto LABEL_26;
    }
    uint64_t v59 = v15;
    uint64_t v60 = 1 << v14;
    int64_t v20 = v55;
    uint64_t v21 = (uint64_t)v55 + *(int *)(v62 + 48);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = (uint64_t *)(v22 + 32 * v14);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    uint64_t v28 = v24[2];
    uint64_t v27 = v24[3];
    *uint64_t v55 = *v24;
    v20[1] = v25;
    v20[2] = v28;
    v20[3] = v27;
    uint64_t v29 = type metadata accessor for RecordMetadata(0);
    sub_1C7B4E270(v23 + *(void *)(*(void *)(v29 - 8) + 72) * v14, v21);
    uint64_t v30 = v56;
    *uint64_t v56 = v26;
    v30[1] = v25;
    v30[2] = v28;
    v30[3] = v27;
    uint64_t v31 = v62;
    sub_1C7B4E270(v21, (uint64_t)v30 + *(int *)(v62 + 48));
    char v32 = v57;
    sub_1C7B4E66C((uint64_t)v30, (uint64_t)v57, &qword_1EBC5E808);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_1C7B4E5AC((uint64_t)v20, &qword_1EBC5E808);
    uint64_t v33 = *(int *)(v31 + 48);
    uint64_t v34 = v58;
    uint64_t v35 = (uint64_t)v58 + v33;
    uint64_t v36 = (uint64_t)v32 + v33;
    uint64_t v38 = *v32;
    uint64_t v37 = v32[1];
    uint64_t v39 = v32[2];
    uint64_t v40 = v32[3];
    *int64_t v58 = *v32;
    v34[1] = v37;
    uint64_t v61 = v39;
    v34[2] = v39;
    v34[3] = v40;
    sub_1C7B4E270(v36, v35);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7B4E2D4(v35);
    sub_1C7B4E5AC((uint64_t)v32, &qword_1EBC5E808);
    uint64_t v11 = v63;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_1C7B4C964(0, *(void *)(v11 + 16) + 1, 1);
      uint64_t v11 = v63;
    }
    unint64_t v42 = *(void *)(v11 + 16);
    unint64_t v41 = *(void *)(v11 + 24);
    if (v42 >= v41 >> 1)
    {
      uint64_t result = sub_1C7B4C964(v41 > 1, v42 + 1, 1);
      uint64_t v11 = v63;
    }
    *(void *)(v11 + 16) = v42 + 1;
    uint64_t v43 = (void *)(v11 + 32 * v42);
    v43[4] = v38;
    v43[5] = v37;
    v43[6] = v61;
    v43[7] = v40;
    a1 = v54;
    int64_t v17 = 1 << *(unsigned char *)(v54 + 32);
    if (v14 >= v17) {
      goto LABEL_27;
    }
    uint64_t v16 = v53;
    uint64_t v44 = *(void *)(v53 + 8 * v19);
    if ((v44 & v60) == 0) {
      goto LABEL_28;
    }
    LODWORD(v13) = v52;
    if (*(_DWORD *)(v54 + 36) != v52) {
      goto LABEL_29;
    }
    unint64_t v45 = v44 & (-2 << (v14 & 0x3F));
    if (v45)
    {
      int64_t v17 = __clz(__rbit64(v45)) | v14 & 0xFFFFFFFFFFFFFFC0;
      int64_t v18 = v51;
    }
    else
    {
      unint64_t v46 = v19 + 1;
      unint64_t v47 = (unint64_t)(v17 + 63) >> 6;
      int64_t v18 = v51;
      if (v19 + 1 < v47)
      {
        unint64_t v48 = *(void *)(v53 + 8 * v46);
        if (v48)
        {
LABEL_22:
          int64_t v17 = __clz(__rbit64(v48)) + (v46 << 6);
        }
        else
        {
          while (v47 - 2 != v19)
          {
            unint64_t v48 = *(void *)(v50 + 8 * v19++);
            if (v48)
            {
              unint64_t v46 = v19 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    uint64_t v15 = v59 + 1;
    uint64_t v14 = v17;
    if (v59 + 1 == v18) {
      return v11;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t MetadataStore.modifiedRecordIDs(for:)(uint64_t a1, uint64_t a2)
{
  return sub_1C7B41D1C(a1, a2, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C7B4DA34);
}

uint64_t sub_1C7B417F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v8 - 8);
  unint64_t v45 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1C7B7AFF0();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x1F4188790](v46);
  uint64_t v43 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for RecordMetadata(0);
  uint64_t v14 = *(void *)(v48 - 8);
  MEMORY[0x1F4188790](v48);
  uint64_t v47 = (uint64_t)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a1;
  uint64_t v16 = a1[1];
  uint64_t v18 = a1[2];
  uint64_t v19 = a1[3];
  swift_beginAccess();
  uint64_t v20 = *(void *)(v3 + 48);
  if (!*(void *)(v20 + 16)) {
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_1C7B49014(a2, a3);
  if (v22)
  {
    uint64_t v23 = *(void *)(*(void *)(v20 + 56) + 8 * v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v24 = *(void *)(v4 + 40);
    if (*(void *)(v24 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v25 = v17;
      uint64_t v26 = v16;
      uint64_t v27 = v18;
      unint64_t v28 = sub_1C7B48F54(v25, v16, v18, v19);
      if (v29)
      {
        sub_1C7B4E270(*(void *)(v24 + 56) + *(void *)(v14 + 72) * v28, (uint64_t)v13);
        uint64_t v30 = 0;
      }
      else
      {
        uint64_t v30 = 1;
      }
      uint64_t v31 = v48;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, v30, 1, v48);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v31) != 1)
      {
        uint64_t v36 = v47;
        sub_1C7B3DA2C((uint64_t)v13, v47);
        if (*(void *)(v23 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v37 = sub_1C7B48F54(v25, v26, v27, v19);
          uint64_t v38 = v45;
          uint64_t v39 = v46;
          uint64_t v40 = v44;
          if (v41)
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(v45, *(void *)(v23 + 56) + *(void *)(v44 + 72) * v37, v46);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v38, 0, 1, v39);
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v45, 1, 1, v46);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v40 = v44;
          uint64_t v38 = v45;
          uint64_t v39 = v46;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v45, 1, 1, v46);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39) != 1)
        {
          unint64_t v42 = v43;
          (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v43, v38, v39);
          char v34 = sub_1C7B7AF80();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v39);
          sub_1C7B4E2D4(v36);
          return v34 & 1;
        }
        sub_1C7B4E2D4(v36);
        char v32 = &qword_1EBC5DC08;
        uint64_t v33 = (uint64_t)v38;
        goto LABEL_11;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, 1, 1, v48);
    }
    swift_bridgeObjectRelease();
    char v32 = &qword_1EBC5E400;
    uint64_t v33 = (uint64_t)v13;
LABEL_11:
    sub_1C7B4E5AC(v33, v32);
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_12:
  char v34 = 0;
  return v34 & 1;
}

uint64_t MetadataStore.deletedRecordIDs(for:)(uint64_t a1, uint64_t a2)
{
  return sub_1C7B41D1C(a1, a2, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C7B4DD10);
}

uint64_t sub_1C7B41D1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1C7B4DFEC(v7, v3, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1C7B413E0(v8);
  swift_release();
  return v9;
}

uint64_t MetadataStore.set(lastModifiedDate:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for RecordMetadata(0);
  uint64_t v72 = *(void *)(v5 - 8);
  uint64_t v73 = v5;
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v80 = (uint64_t)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v64 - v8;
  uint64_t v10 = sub_1C7B7AFF0();
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v11);
  uint64_t v17 = (char *)v64 - v16;
  uint64_t v18 = *(void *)(a2 + 16);
  if (v18)
  {
    v78 = (uint64_t *)(v2 + 40);
    v79 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v69 = (void (**)(char *, uint64_t))(v15 + 8);
    swift_bridgeObjectRetain();
    v64[0] = a2;
    uint64_t v19 = (uint64_t *)(a2 + 56);
    *(void *)&long long v20 = 136446722;
    long long v65 = v20;
    v64[1] = MEMORY[0x1E4FBC840] + 8;
    uint64_t v83 = v10;
    uint64_t v74 = v13;
    v68 = v17;
    unint64_t v70 = (uint64_t *)v9;
    uint64_t v71 = a1;
    while (1)
    {
      uint64_t v75 = v18;
      uint64_t v21 = *(v19 - 3);
      uint64_t v22 = *(v19 - 2);
      uint64_t v23 = *v19;
      uint64_t v81 = *(v19 - 1);
      uint64_t v82 = v21;
      uint64_t v24 = qword_1EBC5E820;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v24 != -1) {
        swift_once();
      }
      v76 = v19;
      uint64_t v25 = sub_1C7B7B090();
      __swift_project_value_buffer(v25, (uint64_t)qword_1EBC5DC50);
      uint64_t v26 = *v79;
      (*v79)(v17, a1, v10);
      v77 = v26;
      v26(v13, a1, v10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v27 = sub_1C7B7B080();
      os_log_type_t v28 = sub_1C7B7B2D0();
      int v29 = v28;
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v30 = swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        v84 = (void *)v67;
        v85[0] = 0;
        *(_DWORD *)uint64_t v30 = v65;
        v85[1] = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        int v66 = v29;
        sub_1C7B7B450();
        swift_bridgeObjectRelease();
        strcpy((char *)v85, "identifier: ");
        BYTE5(v85[1]) = 0;
        HIWORD(v85[1]) = -5120;
        swift_bridgeObjectRetain();
        uint64_t v31 = v82;
        sub_1C7B7B220();
        swift_bridgeObjectRelease();
        sub_1C7B7B220();
        swift_bridgeObjectRetain();
        uint64_t v32 = v81;
        sub_1C7B7B220();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(void *)(v30 + 4) = sub_1C7B47DE8(v85[0], v85[1], (uint64_t *)&v84);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2082;
        sub_1C7B4E394();
        uint64_t v33 = sub_1C7B7B5D0();
        *(void *)(v30 + 14) = sub_1C7B47DE8(v33, v34, (uint64_t *)&v84);
        swift_bridgeObjectRelease();
        uint64_t v35 = *v69;
        (*v69)(v17, v83);
        *(_WORD *)(v30 + 22) = 2050;
        uint64_t v36 = v74;
        sub_1C7B7AFB0();
        *(void *)(v30 + 24) = v37;
        v35(v36, v83);
        _os_log_impl(&dword_1C7B37000, v27, (os_log_type_t)v66, "Updating lastModifiedDate for record %{public}s to %{public}s (%{public}f)", (uint8_t *)v30, 0x20u);
        uint64_t v38 = v67;
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v38, -1, -1);
        MEMORY[0x1C87BC480](v30, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        uint64_t v39 = *v69;
        (*v69)(v17, v10);
        v39(v13, v10);

        uint64_t v32 = v81;
        uint64_t v31 = v82;
      }
      uint64_t v40 = v23;
      uint64_t v41 = v73;
      unint64_t v42 = v70;
      uint64_t v43 = v71;
      ((void (*)(char *))v77)((char *)v70 + *(int *)(v73 + 20));
      *unint64_t v42 = v31;
      v42[1] = v22;
      v42[2] = v32;
      v42[3] = v40;
      *((unsigned char *)v42 + *(int *)(v41 + 24)) = 0;
      uint64_t v44 = v78;
      swift_beginAccess();
      sub_1C7B4E270((uint64_t)v42, v80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v84 = (void *)*v44;
      uint64_t v46 = (uint64_t)v84;
      *uint64_t v44 = 0x8000000000000000;
      uint64_t v47 = v40;
      unint64_t v49 = sub_1C7B48F54(v31, v22, v32, v40);
      uint64_t v50 = *(void *)(v46 + 16);
      BOOL v51 = (v48 & 1) == 0;
      uint64_t v52 = v50 + v51;
      if (__OFADD__(v50, v51)) {
        break;
      }
      char v53 = v48;
      if (*(void *)(v46 + 24) >= v52)
      {
        uint64_t v56 = v76;
        a1 = v43;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_1C7B4BB24();
        }
        uint64_t v17 = v68;
      }
      else
      {
        sub_1C7B49500(v52, isUniquelyReferenced_nonNull_native);
        unint64_t v54 = sub_1C7B48F54(v31, v22, v32, v47);
        if ((v53 & 1) != (v55 & 1)) {
          goto LABEL_24;
        }
        unint64_t v49 = v54;
        uint64_t v17 = v68;
        uint64_t v56 = v76;
        a1 = v43;
      }
      uint64_t v57 = v47;
      int64_t v58 = v84;
      if (v53)
      {
        sub_1C7B4E330(v80, v84[7] + *(void *)(v72 + 72) * v49);
      }
      else
      {
        v84[(v49 >> 6) + 8] |= 1 << v49;
        uint64_t v59 = (uint64_t *)(v58[6] + 32 * v49);
        *uint64_t v59 = v82;
        v59[1] = v22;
        uint64_t v60 = v80;
        v59[2] = v81;
        v59[3] = v57;
        sub_1C7B3DA2C(v60, v58[7] + *(void *)(v72 + 72) * v49);
        uint64_t v61 = v58[2];
        BOOL v62 = __OFADD__(v61, 1);
        uint64_t v63 = v61 + 1;
        if (v62) {
          goto LABEL_23;
        }
        v58[2] = v63;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      uint64_t v19 = v56 + 4;
      uint64_t *v78 = (uint64_t)v58;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_1C7B4E2D4((uint64_t)v42);
      uint64_t v13 = v74;
      uint64_t v18 = v75 - 1;
      uint64_t v10 = v83;
      if (v75 == 1) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    uint64_t result = sub_1C7B7B600();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B42524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for RecordMetadata(0);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 48))(a1, 1) == 1)
  {
    sub_1C7B4E5AC(a1, &qword_1EBC5E400);
    sub_1C7B48898(a2, a3, a4, a5, (uint64_t)v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1C7B4E5AC((uint64_t)v14, &qword_1EBC5E400);
  }
  else
  {
    sub_1C7B3DA2C(a1, (uint64_t)v17);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v6;
    *uint64_t v6 = 0x8000000000000000;
    sub_1C7B4AC54((uint64_t)v17, a2, a3, a4, a5, isUniquelyReferenced_nonNull_native);
    *uint64_t v6 = v22;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C7B42710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C7B7AFF0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_1C7B4E5AC(a1, &qword_1EBC5DC08);
    sub_1C7B48A60(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1C7B4E5AC((uint64_t)v10, &qword_1EBC5DC08);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_1C7B4AF38((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t MetadataStore.set(deletedDate:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v63 = a1;
  uint64_t v4 = type metadata accessor for RecordMetadata(0);
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  BOOL v62 = (void *)((char *)v51 - v8);
  uint64_t v9 = sub_1C7B7AFF0();
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a2 + 16);
  if (!v14) {
    return result;
  }
  uint64_t v60 = (uint64_t *)(v2 + 40);
  uint64_t v61 = (void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  unint64_t v54 = (void (**)(char *, uint64_t))(v11 + 8);
  swift_bridgeObjectRetain();
  v51[0] = a2;
  uint64_t v15 = (uint64_t *)(a2 + 56);
  *(void *)&long long v16 = 136446466;
  long long v52 = v16;
  v51[1] = MEMORY[0x1E4FBC840] + 8;
  uint64_t v64 = v9;
  char v53 = v13;
  char v55 = v7;
  while (1)
  {
    uint64_t v58 = v14;
    uint64_t v17 = *(v15 - 2);
    uint64_t v65 = *(v15 - 3);
    uint64_t v19 = *(v15 - 1);
    uint64_t v18 = *v15;
    uint64_t v20 = qword_1EBC5E820;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v20 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C7B7B090();
    __swift_project_value_buffer(v21, (uint64_t)qword_1EBC5DC50);
    uint64_t v59 = *v61;
    v59(v13, v63, v9);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v22 = v13;
    uint64_t v23 = sub_1C7B7B080();
    os_log_type_t v24 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      int v66 = (void *)v26;
      v67[0] = 0;
      *(_DWORD *)uint64_t v25 = v52;
      v67[1] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7B7B450();
      swift_bridgeObjectRelease();
      strcpy((char *)v67, "identifier: ");
      BYTE5(v67[1]) = 0;
      HIWORD(v67[1]) = -5120;
      swift_bridgeObjectRetain();
      sub_1C7B7B220();
      swift_bridgeObjectRelease();
      sub_1C7B7B220();
      swift_bridgeObjectRetain();
      sub_1C7B7B220();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(void *)(v25 + 4) = sub_1C7B47DE8(v67[0], v67[1], (uint64_t *)&v66);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2082;
      sub_1C7B4E394();
      uint64_t v27 = sub_1C7B7B5D0();
      *(void *)(v25 + 14) = sub_1C7B47DE8(v27, v28, (uint64_t *)&v66);
      swift_bridgeObjectRelease();
      (*v54)(v22, v64);
      _os_log_impl(&dword_1C7B37000, v23, v24, "Updating deletedDate for record %{public}s to %{public}s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      uint64_t v29 = v26;
      uint64_t v9 = v64;
      MEMORY[0x1C87BC480](v29, -1, -1);
      MEMORY[0x1C87BC480](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*v54)(v22, v9);
    }

    uint64_t v30 = v57;
    uint64_t v31 = v62;
    v59((char *)v62 + *(int *)(v57 + 20), v63, v9);
    uint64_t v32 = v65;
    *uint64_t v31 = v65;
    v31[1] = v17;
    v31[2] = v19;
    v31[3] = v18;
    *((unsigned char *)v31 + *(int *)(v30 + 24)) = 1;
    uint64_t v33 = v60;
    swift_beginAccess();
    uint64_t v34 = (uint64_t)v55;
    sub_1C7B4E270((uint64_t)v31, (uint64_t)v55);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int v66 = (void *)*v33;
    uint64_t v36 = (uint64_t)v66;
    *uint64_t v33 = 0x8000000000000000;
    unint64_t v38 = sub_1C7B48F54(v32, v17, v19, v18);
    uint64_t v39 = *(void *)(v36 + 16);
    BOOL v40 = (v37 & 1) == 0;
    uint64_t v41 = v39 + v40;
    if (__OFADD__(v39, v40)) {
      break;
    }
    char v42 = v37;
    if (*(void *)(v36 + 24) >= v41)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v45 = v65;
        uint64_t v46 = v66;
        if (v37) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_1C7B4BB24();
        uint64_t v45 = v65;
        uint64_t v46 = v66;
        if (v42) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_1C7B49500(v41, isUniquelyReferenced_nonNull_native);
      unint64_t v43 = sub_1C7B48F54(v65, v17, v19, v18);
      if ((v42 & 1) != (v44 & 1)) {
        goto LABEL_25;
      }
      unint64_t v38 = v43;
      uint64_t v45 = v65;
      uint64_t v46 = v66;
      if (v42)
      {
LABEL_3:
        sub_1C7B4E330(v34, v46[7] + *(void *)(v56 + 72) * v38);
        goto LABEL_4;
      }
    }
    v46[(v38 >> 6) + 8] |= 1 << v38;
    uint64_t v47 = (uint64_t *)(v46[6] + 32 * v38);
    *uint64_t v47 = v45;
    v47[1] = v17;
    v47[2] = v19;
    v47[3] = v18;
    sub_1C7B3DA2C(v34, v46[7] + *(void *)(v56 + 72) * v38);
    uint64_t v48 = v46[2];
    BOOL v49 = __OFADD__(v48, 1);
    uint64_t v50 = v48 + 1;
    if (v49) {
      goto LABEL_24;
    }
    v46[2] = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_4:
    v15 += 4;
    *uint64_t v60 = (uint64_t)v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1C7B4E2D4((uint64_t)v62);
    uint64_t v14 = v58 - 1;
    uint64_t v9 = v64;
    uint64_t v13 = v53;
    if (v58 == 1) {
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  uint64_t result = sub_1C7B7B600();
  __break(1u);
  return result;
}

uint64_t MetadataStore.set(syncDate:for:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_1C7B7AFF0();
  uint64_t v68 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v74 = (char *)v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v13);
  uint64_t v73 = *(char **)(a2 + 16);
  if (!v73) {
    return result;
  }
  uint64_t v75 = (char *)v60 - v17;
  swift_beginAccess();
  uint64_t v18 = *(void *)(v4 + 48);
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v63 = v5;
  uint64_t v62 = a4;
  uint64_t v61 = a3;
  int v66 = v15;
  v60[0] = v5 + 48;
  if (v19)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_1C7B49014(a3, a4);
    if (v21)
    {
      unint64_t v22 = *(void *)(*(void *)(v18 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v22 = sub_1C7B4364C(MEMORY[0x1E4FBC860]);
LABEL_7:
  v77 = (char **)(v68 + 56);
  uint64_t v71 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
  uint64_t v72 = (void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16);
  unint64_t v70 = (void (**)(char *, uint64_t, uint64_t))(v68 + 32);
  uint64_t v64 = v68 + 40;
  swift_bridgeObjectRetain();
  uint64_t v23 = 0;
  v60[1] = a2;
  os_log_type_t v24 = (uint64_t *)(a2 + 56);
  uint64_t v25 = (uint64_t)v75;
  uint64_t v69 = a1;
  uint64_t v65 = v10;
  while (!__OFADD__(v23, 1))
  {
    unint64_t v29 = v22;
    v78 = v23 + 1;
    uint64_t v31 = *(v24 - 3);
    uint64_t v30 = *(v24 - 2);
    uint64_t v32 = *(v24 - 1);
    uint64_t v33 = *v24;
    (*v72)(v25, a1, v10);
    v76 = *v77;
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v76)(v25, 0, 1, v10);
    if ((*v71)(v25, 1, v10) == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7B4E5AC(v25, &qword_1EBC5DC08);
      swift_bridgeObjectRetain();
      uint64_t v34 = v31;
      unint64_t v22 = v29;
      unint64_t v35 = sub_1C7B48F54(v34, v30, v32, v33);
      char v37 = v36;
      swift_bridgeObjectRelease();
      if (v37)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v80 = (void *)v29;
        unint64_t v28 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v76;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1C7B4B830();
          unint64_t v22 = (unint64_t)v80;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v27 = (uint64_t)v66;
        (*(void (**)(char *, unint64_t, uint64_t))(v68 + 32))(v66, *(void *)(v22 + 56) + *(void *)(v68 + 72) * v35, v10);
        sub_1C7B4A604(v35, v22, MEMORY[0x1E4F27928]);
        swift_bridgeObjectRelease();
        uint64_t v26 = 0;
      }
      else
      {
        uint64_t v26 = 1;
        uint64_t v27 = (uint64_t)v66;
        unint64_t v28 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v76;
      }
      v28(v27, v26, 1, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C7B4E5AC(v27, &qword_1EBC5DC08);
      uint64_t v25 = (uint64_t)v75;
      a1 = v69;
    }
    else
    {
      v76 = v23;
      uint64_t v67 = *v70;
      v67(v74, v25, v10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v39 = (void *)v29;
      int v40 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v80 = v39;
      unint64_t v42 = sub_1C7B48F54(v31, v30, v32, v33);
      uint64_t v43 = v39[2];
      BOOL v44 = (v41 & 1) == 0;
      uint64_t v45 = v43 + v44;
      if (__OFADD__(v43, v44)) {
        goto LABEL_32;
      }
      char v46 = v41;
      if (v39[3] >= v45)
      {
        if ((v40 & 1) == 0) {
          sub_1C7B4B830();
        }
        uint64_t v47 = v31;
      }
      else
      {
        sub_1C7B490D0(v45, v40);
        uint64_t v47 = v31;
        unint64_t v48 = sub_1C7B48F54(v31, v30, v32, v33);
        if ((v46 & 1) != (v49 & 1)) {
          goto LABEL_34;
        }
        unint64_t v42 = v48;
      }
      uint64_t v23 = v76;
      uint64_t v50 = v80;
      if (v46)
      {
        unint64_t v51 = v80[7] + *(void *)(v68 + 72) * v42;
        uint64_t v10 = v65;
        (*(void (**)(unint64_t, char *, uint64_t))(v68 + 40))(v51, v74, v65);
      }
      else
      {
        v80[(v42 >> 6) + 8] |= 1 << v42;
        long long v52 = (uint64_t *)(v50[6] + 32 * v42);
        *long long v52 = v47;
        v52[1] = v30;
        v52[2] = v32;
        v52[3] = v33;
        unint64_t v53 = v50[7] + *(void *)(v68 + 72) * v42;
        uint64_t v10 = v65;
        v67((char *)v53, (uint64_t)v74, v65);
        uint64_t v54 = v50[2];
        BOOL v55 = __OFADD__(v54, 1);
        uint64_t v56 = v54 + 1;
        if (v55) {
          goto LABEL_33;
        }
        v50[2] = v56;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      unint64_t v22 = (unint64_t)v80;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = v69;
      uint64_t v25 = (uint64_t)v75;
    }
    v24 += 4;
    ++v23;
    if (v78 == v73)
    {
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v57 = v62;
      swift_bridgeObjectRetain();
      uint64_t v58 = v63;
      char v59 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v79 = *(void *)(v58 + 48);
      *(void *)(v58 + 48) = 0x8000000000000000;
      sub_1C7B4B0C4(v22, v61, v57, v59, &qword_1EA4F9360);
      *(void *)(v58 + 48) = v79;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_1C7B3FDF0();
      return sub_1C7B404F0();
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  uint64_t result = sub_1C7B7B600();
  __break(1u);
  return result;
}

unint64_t sub_1C7B4364C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9378);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9370);
  uint64_t v6 = sub_1C7B7B510();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v27 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v9 = v6 + 64;
  uint64_t v10 = *(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v11 = a1 + ((v10 + 32) & ~v10);
  uint64_t v26 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1C7B4E608(v11, (uint64_t)v5, &qword_1EA4F9378);
    uint64_t v12 = *v5;
    uint64_t v13 = v5[1];
    uint64_t v15 = v5[2];
    uint64_t v14 = v5[3];
    unint64_t result = sub_1C7B48F54(*v5, v13, v15, v14);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 32 * result);
    *uint64_t v19 = v12;
    v19[1] = v13;
    v19[2] = v15;
    v19[3] = v14;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_1C7B7AFF0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v27, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v11 += v26;
    if (!--v8)
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

uint64_t MetadataStore.set(syncDate:forRecordsMatching:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v112 = a1;
  uint64_t v9 = sub_1C7B7AFF0();
  uint64_t v106 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v110 = (char *)v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v111 = (char *)v103 - v15;
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9348);
  MEMORY[0x1F4188790](v127);
  char v17 = (char *)v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  uint64_t v19 = MEMORY[0x1F4188790](v18 - 8);
  v131 = (void *)((char *)v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  BOOL v23 = (char *)v103 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v134 = (uint64_t)v103 - v24;
  uint64_t v25 = type metadata accessor for RecordMetadata(0);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v120 = (void *)((char *)v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = MEMORY[0x1F4188790](v27);
  uint64_t v31 = (void *)((char *)v103 - v30);
  uint64_t v126 = *(void *)(a2 + 16);
  if (!v126) {
    return result;
  }
  uint64_t v128 = result;
  v129 = v23;
  swift_beginAccess();
  uint64_t v32 = *(void *)(v5 + 48);
  uint64_t v33 = *(void *)(v32 + 16);
  uint64_t v117 = v9;
  v104 = v14;
  if (!v33) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_1C7B49014(a3, a4);
  if ((v35 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    unint64_t v114 = sub_1C7B4364C(MEMORY[0x1E4FBC860]);
    goto LABEL_7;
  }
  unint64_t v114 = *(void *)(*(void *)(v32 + 56) + 8 * v34);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_7:
  v103[1] = v5;
  uint64_t v36 = a2 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
  v103[0] = a2;
  swift_bridgeObjectRetain();
  v125 = (uint64_t *)(v5 + 40);
  swift_beginAccess();
  uint64_t v37 = 0;
  uint64_t v130 = *(void *)(v26 + 72);
  v109 = (void (**)(char *, uint64_t, uint64_t))(v106 + 16);
  v113 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56);
  v108 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v106 + 48);
  v107 = (void (**)(char *, uint64_t, uint64_t))(v106 + 32);
  v103[2] = v106 + 40;
  v123 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
  v124 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
  v121 = v31;
  unint64_t v122 = (v26 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  unint64_t v38 = v131;
  v133 = v17;
  while (!__OFADD__(v37, 1))
  {
    uint64_t v132 = v37 + 1;
    sub_1C7B4E270(v36, (uint64_t)v31);
    uint64_t v43 = *v125;
    if (*(void *)(*v125 + 16))
    {
      uint64_t v45 = v31[2];
      uint64_t v44 = v31[3];
      uint64_t v47 = *v31;
      uint64_t v46 = v31[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v48 = sub_1C7B48F54(v47, v46, v45, v44);
      if (v49)
      {
        uint64_t v50 = v134;
        sub_1C7B4E270(*(void *)(v43 + 56) + v48 * v130, v134);
        unint64_t v51 = *v124;
        uint64_t v52 = v50;
        uint64_t v53 = 0;
      }
      else
      {
        unint64_t v51 = *v124;
        uint64_t v50 = v134;
        uint64_t v52 = v134;
        uint64_t v53 = 1;
      }
      uint64_t v55 = v128;
      v51(v52, v53, 1, v128);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v54 = v50;
      swift_bridgeObjectRelease();
      unint64_t v38 = v131;
    }
    else
    {
      unint64_t v51 = *v124;
      uint64_t v54 = v134;
      uint64_t v55 = v128;
      (*v124)(v134, 1, 1, v128);
    }
    uint64_t v56 = (uint64_t)v129;
    sub_1C7B4E270((uint64_t)v31, (uint64_t)v129);
    v51(v56, 0, 1, v55);
    uint64_t v57 = v56;
    uint64_t v58 = (uint64_t)v133;
    uint64_t v59 = (uint64_t)&v133[*(int *)(v127 + 48)];
    sub_1C7B4E608(v57, (uint64_t)v133, &qword_1EBC5E400);
    sub_1C7B4E608(v54, v59, &qword_1EBC5E400);
    uint64_t v60 = *v123;
    if ((*v123)(v58, 1, v55) == 1)
    {
      sub_1C7B4E5AC(v57, &qword_1EBC5E400);
      if (v60(v59, 1, v55) == 1)
      {
        sub_1C7B4E5AC((uint64_t)v133, &qword_1EBC5E400);
        uint64_t v31 = v121;
        goto LABEL_22;
      }
      goto LABEL_9;
    }
    sub_1C7B4E608(v58, (uint64_t)v38, &qword_1EBC5E400);
    if (v60(v59, 1, v55) == 1)
    {
      sub_1C7B4E5AC(v57, &qword_1EBC5E400);
      sub_1C7B4E2D4((uint64_t)v38);
LABEL_9:
      uint64_t v39 = (uint64_t)v133;
      int v40 = &qword_1EA4F9348;
      goto LABEL_10;
    }
    uint64_t v75 = v120;
    sub_1C7B3DA2C(v59, (uint64_t)v120);
    uint64_t v76 = *v38;
    uint64_t v77 = v38[1];
    uint64_t v78 = v38[2];
    uint64_t v79 = v38[3];
    uint64_t v80 = v75[2];
    uint64_t v81 = v75[3];
    if (v76 == *v75 && v77 == v75[1] || (sub_1C7B7B5E0())
      && (v78 == v80 && v79 == v81 || (sub_1C7B7B5E0() & 1) != 0)
      && (sub_1C7B7AFC0() & 1) != 0)
    {
      uint64_t v82 = *(int *)(v128 + 24);
      unint64_t v38 = v131;
      int v83 = *((unsigned __int8 *)v131 + v82);
      int v84 = *((unsigned __int8 *)v120 + v82);
      sub_1C7B4E2D4((uint64_t)v120);
      sub_1C7B4E5AC((uint64_t)v129, &qword_1EBC5E400);
      sub_1C7B4E2D4((uint64_t)v38);
      sub_1C7B4E5AC((uint64_t)v133, &qword_1EBC5E400);
      uint64_t v31 = v121;
      if (v83 != v84) {
        goto LABEL_51;
      }
LABEL_22:
      uint64_t v61 = v31[1];
      uint64_t v115 = *v31;
      uint64_t v62 = v31[3];
      uint64_t v116 = v31[2];
      uint64_t v63 = (uint64_t)v111;
      uint64_t v64 = v117;
      (*v109)(v111, v112, v117);
      uint64_t v65 = *v113;
      (*v113)(v63, 0, 1, v64);
      int v66 = (*v108)(v63, 1, v64);
      uint64_t v119 = v61;
      uint64_t v118 = v62;
      if (v66 == 1)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C7B4E5AC(v63, &qword_1EBC5DC08);
        uint64_t v67 = v114;
        swift_bridgeObjectRetain();
        unint64_t v68 = sub_1C7B48F54(v115, v61, v116, v62);
        char v70 = v69;
        swift_bridgeObjectRelease();
        if (v70)
        {
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v135 = (void *)v67;
          if (!isUniquelyReferenced_nonNull_native)
          {
            sub_1C7B4B830();
            uint64_t v67 = (uint64_t)v135;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v72 = (uint64_t)v104;
          uint64_t v73 = v117;
          (*(void (**)(char *, unint64_t, uint64_t))(v106 + 32))(v104, *(void *)(v67 + 56) + *(void *)(v106 + 72) * v68, v117);
          unint64_t v114 = v67;
          sub_1C7B4A604(v68, v67, MEMORY[0x1E4F27928]);
          swift_bridgeObjectRelease();
          uint64_t v74 = 0;
        }
        else
        {
          uint64_t v74 = 1;
          uint64_t v73 = v117;
          uint64_t v72 = (uint64_t)v104;
        }
        v65(v72, v74, 1, v73);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C7B4E5AC(v72, &qword_1EBC5DC08);
        goto LABEL_50;
      }
      uint64_t v85 = v62;
      v105 = *v107;
      v105(v110, v63, v64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v86 = v114;
      int v87 = swift_isUniquelyReferenced_nonNull_native();
      v135 = (void *)v86;
      uint64_t v88 = v115;
      uint64_t v89 = v116;
      unint64_t v91 = sub_1C7B48F54(v115, v61, v116, v85);
      uint64_t v92 = *(void *)(v86 + 16);
      BOOL v93 = (v90 & 1) == 0;
      uint64_t v94 = v92 + v93;
      if (__OFADD__(v92, v93)) {
        goto LABEL_57;
      }
      char v95 = v90;
      if (*(void *)(v86 + 24) >= v94)
      {
        if (v87)
        {
          v98 = v135;
          if ((v90 & 1) == 0) {
            goto LABEL_42;
          }
        }
        else
        {
          sub_1C7B4B830();
          v98 = v135;
          if ((v95 & 1) == 0) {
            goto LABEL_42;
          }
        }
      }
      else
      {
        sub_1C7B490D0(v94, v87);
        unint64_t v96 = sub_1C7B48F54(v88, v119, v89, v118);
        if ((v95 & 1) != (v97 & 1)) {
          goto LABEL_59;
        }
        unint64_t v91 = v96;
        v98 = v135;
        if ((v95 & 1) == 0)
        {
LABEL_42:
          v98[(v91 >> 6) + 8] |= 1 << v91;
          v99 = (uint64_t *)(v98[6] + 32 * v91);
          uint64_t *v99 = v88;
          v99[1] = v119;
          v99[2] = v89;
          v99[3] = v118;
          v105((char *)(v98[7] + *(void *)(v106 + 72) * v91), (uint64_t)v110, v117);
          uint64_t v100 = v98[2];
          BOOL v101 = __OFADD__(v100, 1);
          uint64_t v102 = v100 + 1;
          if (v101) {
            goto LABEL_58;
          }
          v98[2] = v102;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_49;
        }
      }
      (*(void (**)(unint64_t, char *, uint64_t))(v106 + 40))(v98[7] + *(void *)(v106 + 72) * v91, v110, v117);
LABEL_49:
      unint64_t v114 = (unint64_t)v135;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_50:
      unint64_t v38 = v131;
LABEL_51:
      uint64_t v41 = v134;
      goto LABEL_11;
    }
    sub_1C7B4E2D4((uint64_t)v120);
    sub_1C7B4E5AC((uint64_t)v129, &qword_1EBC5E400);
    unint64_t v38 = v131;
    sub_1C7B4E2D4((uint64_t)v131);
    uint64_t v39 = (uint64_t)v133;
    int v40 = &qword_1EBC5E400;
LABEL_10:
    sub_1C7B4E5AC(v39, v40);
    uint64_t v41 = v134;
    uint64_t v31 = v121;
LABEL_11:
    uint64_t v42 = v132;
    sub_1C7B4E5AC(v41, &qword_1EBC5E400);
    sub_1C7B4E2D4((uint64_t)v31);
    ++v37;
    v36 += v130;
    if (v42 == v126)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C7B3FDF0();
      return sub_1C7B404F0();
    }
  }
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  uint64_t result = sub_1C7B7B600();
  __break(1u);
  return result;
}

uint64_t MetadataStore.recordMetadata(for:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v6 = a1[3];
  swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 40);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1C7B48F54(v5, v4, v7, v6);
    if (v10)
    {
      unint64_t v11 = v9;
      uint64_t v12 = *(void *)(v8 + 56);
      uint64_t v13 = type metadata accessor for RecordMetadata(0);
      uint64_t v14 = *(void *)(v13 - 8);
      sub_1C7B4E270(v12 + *(void *)(v14 + 72) * v11, a2);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
    }
    else
    {
      uint64_t v17 = type metadata accessor for RecordMetadata(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a2, 1, 1, v17);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = type metadata accessor for RecordMetadata(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
}

Swift::Void __swiftcall MetadataStore.purge()()
{
  uint64_t v1 = v0;
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C7B7B090();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC5DC50);
  uint64_t v3 = sub_1C7B7B080();
  os_log_type_t v4 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C7B37000, v3, v4, "Purging metadata store records", v5, 2u);
    MEMORY[0x1C87BC480](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1E4FBC868];
  v1[5] = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[6] = v6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[7] = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MetadataStore.update(metadata:)(Swift::OpaquePointer metadata)
{
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9348);
  MEMORY[0x1F4188790](v93);
  os_log_type_t v4 = (char *)v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v88 = (uint64_t)v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  char v10 = (char *)v84 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)v84 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)v84 - v14;
  uint64_t v16 = type metadata accessor for RecordMetadata(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  unint64_t v86 = (void *)((char *)v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)v84 - v21;
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  uint64_t v25 = (void *)((char *)v84 - v24);
  uint64_t v26 = *((void *)metadata._rawValue + 2);
  if (v26)
  {
    uint64_t v99 = v23;
    char v95 = v13;
    uint64_t v89 = (uint64_t *)v10;
    uint64_t v87 = v1;
    uint64_t v27 = (char *)metadata._rawValue
        + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    v84[0] = metadata._rawValue;
    swift_bridgeObjectRetain();
    char v97 = (uint64_t *)(v1 + 40);
    swift_beginAccess();
    uint64_t v28 = (uint64_t)v27;
    uint64_t v94 = *(void *)(v17 + 72);
    char v90 = (unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    unint64_t v91 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    *(void *)&long long v29 = 136446210;
    long long v85 = v29;
    v84[1] = MEMORY[0x1E4FBC840] + 8;
    uint64_t v30 = &qword_1EBC5E400;
    uint64_t v102 = v4;
    v98 = v15;
    uint64_t v92 = v22;
    while (1)
    {
      uint64_t v100 = v28;
      sub_1C7B4E270(v28, (uint64_t)v25);
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v31 = sub_1C7B7B090();
      __swift_project_value_buffer(v31, (uint64_t)qword_1EBC5DC50);
      sub_1C7B4E270((uint64_t)v25, (uint64_t)v22);
      uint64_t v32 = sub_1C7B7B080();
      os_log_type_t v33 = sub_1C7B7B2D0();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        v103[0] = v35;
        *(_DWORD *)uint64_t v34 = v85;
        uint64_t v36 = RecordMetadata.description.getter();
        *(void *)(v34 + 4) = sub_1C7B47DE8(v36, v37, v103);
        swift_bridgeObjectRelease();
        sub_1C7B4E2D4((uint64_t)v22);
        _os_log_impl(&dword_1C7B37000, v32, v33, "Updating record metadata: %{public}s", (uint8_t *)v34, 0xCu);
        swift_arrayDestroy();
        uint64_t v38 = v35;
        os_log_type_t v4 = v102;
        MEMORY[0x1C87BC480](v38, -1, -1);
        uint64_t v39 = v34;
        uint64_t v15 = v98;
        MEMORY[0x1C87BC480](v39, -1, -1);
      }
      else
      {
        sub_1C7B4E2D4((uint64_t)v22);
      }

      uint64_t v40 = *v97;
      uint64_t v41 = *(void *)(*v97 + 16);
      uint64_t v101 = v26;
      if (v41)
      {
        uint64_t v43 = v25[2];
        uint64_t v42 = v25[3];
        uint64_t v45 = *v25;
        uint64_t v44 = v25[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v46 = sub_1C7B48F54(v45, v44, v43, v42);
        if (v47)
        {
          uint64_t v15 = v98;
          sub_1C7B4E270(*(void *)(v40 + 56) + v46 * v94, (uint64_t)v98);
          unint64_t v48 = *v91;
          unint64_t v49 = (unint64_t)v91 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
          uint64_t v50 = (uint64_t)v15;
          uint64_t v51 = 0;
        }
        else
        {
          unint64_t v48 = *v91;
          unint64_t v49 = (unint64_t)v91 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
          uint64_t v15 = v98;
          uint64_t v50 = (uint64_t)v98;
          uint64_t v51 = 1;
        }
        uint64_t v53 = v99;
        v48((char *)v50, v51, 1, v99);
        swift_bridgeObjectRelease();
        unint64_t v52 = v49;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        os_log_type_t v4 = v102;
      }
      else
      {
        unint64_t v48 = *v91;
        unint64_t v52 = (unint64_t)v91 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        uint64_t v53 = v99;
        (*v91)(v15, 1, 1, v99);
      }
      uint64_t v54 = v90;
      uint64_t v55 = (uint64_t)v95;
      sub_1C7B4E270((uint64_t)v25, (uint64_t)v95);
      uint64_t v56 = v48;
      unint64_t v96 = v52;
      v48((char *)v55, 0, 1, v53);
      uint64_t v57 = (uint64_t)&v4[*(int *)(v93 + 48)];
      sub_1C7B4E608((uint64_t)v15, (uint64_t)v4, v30);
      sub_1C7B4E608(v55, v57, v30);
      uint64_t v58 = v30;
      uint64_t v59 = *v54;
      if ((*v54)(v4, 1, v53) == 1)
      {
        sub_1C7B4E5AC(v55, v58);
        unsigned int v60 = v59((char *)v57, 1, v53);
        uint64_t v61 = &qword_1EA4F9348;
        uint64_t v22 = v92;
        uint64_t v30 = v58;
        if (v60 != 1) {
          goto LABEL_31;
        }
        os_log_type_t v4 = v102;
        sub_1C7B4E5AC((uint64_t)v102, v58);
      }
      else
      {
        uint64_t v62 = v89;
        sub_1C7B4E608((uint64_t)v4, (uint64_t)v89, v58);
        unsigned int v63 = v59((char *)v57, 1, v53);
        uint64_t v61 = &qword_1EA4F9348;
        uint64_t v22 = v92;
        uint64_t v30 = v58;
        if (v63 == 1) {
          goto LABEL_30;
        }
        uint64_t v64 = v86;
        sub_1C7B3DA2C(v57, (uint64_t)v86);
        uint64_t v65 = *v62;
        uint64_t v66 = v62[1];
        uint64_t v67 = v62[2];
        uint64_t v68 = v62[3];
        uint64_t v69 = *v64;
        uint64_t v70 = v64[1];
        uint64_t v71 = v64[2];
        uint64_t v72 = v64[3];
        if ((v65 != v69 || v66 != v70) && (sub_1C7B7B5E0() & 1) == 0
          || (v67 != v71 || v68 != v72) && (sub_1C7B7B5E0() & 1) == 0
          || (sub_1C7B7AFC0() & 1) == 0)
        {
          sub_1C7B4E2D4((uint64_t)v86);
          uint64_t v61 = v58;
          uint64_t v62 = v89;
LABEL_30:
          sub_1C7B4E5AC((uint64_t)v95, v58);
          sub_1C7B4E2D4((uint64_t)v62);
LABEL_31:
          sub_1C7B4E5AC((uint64_t)v102, v61);
LABEL_32:
          uint64_t v78 = v25[1];
          uint64_t v79 = v25[2];
          uint64_t v80 = v25[3];
          v103[0] = *v25;
          uint64_t v77 = v103[0];
          v103[1] = v78;
          v103[2] = v79;
          void v103[3] = v80;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C7B44FF0(v103);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v81 = v88;
          sub_1C7B4E270((uint64_t)v25, v88);
          v56((char *)v81, 0, 1, v99);
          swift_beginAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v82 = v79;
          uint64_t v15 = v98;
          uint64_t v83 = v80;
          os_log_type_t v4 = v102;
          sub_1C7B42524(v81, v77, v78, v82, v83);
          swift_endAccess();
          goto LABEL_4;
        }
        uint64_t v73 = *(int *)(v99 + 24);
        uint64_t v74 = (uint64_t)v89;
        int v75 = *((unsigned __int8 *)v89 + v73);
        int v76 = *((unsigned __int8 *)v86 + v73);
        sub_1C7B4E2D4((uint64_t)v86);
        sub_1C7B4E5AC((uint64_t)v95, v58);
        sub_1C7B4E2D4(v74);
        os_log_type_t v4 = v102;
        sub_1C7B4E5AC((uint64_t)v102, v58);
        uint64_t v15 = v98;
        if (v75 != v76) {
          goto LABEL_32;
        }
      }
LABEL_4:
      sub_1C7B4E5AC((uint64_t)v15, v30);
      sub_1C7B4E2D4((uint64_t)v25);
      uint64_t v28 = v100 + v94;
      uint64_t v26 = v101 - 1;
      if (v101 == 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

uint64_t sub_1C7B44FF0(uint64_t *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = (uint64_t *)(v1 + 48);
  uint64_t v59 = a1[2];
  uint64_t v60 = v6;
  uint64_t v63 = a1[3];
  uint64_t v64 = v7;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v1 + 48);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v57 = v9 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v58 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v61 = v9;
  swift_bridgeObjectRetain();
  int64_t v14 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      goto LABEL_21;
    }
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      goto LABEL_46;
    }
    if (v17 >= v58) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v57 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v58) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v57 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v58) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v57 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_21:
    uint64_t v20 = (uint64_t *)(*(void *)(v61 + 48) + 16 * v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v61 + 56) + 8 * v16);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v24 = v64;
    swift_bridgeObjectRetain();
    uint64_t v25 = v63;
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_1C7B48F54(v60, v24, v59, v25);
    LOBYTE(v24) = v27;
    swift_bridgeObjectRelease();
    if (v24)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v66 = v23;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C7B4B830();
        uint64_t v23 = v66;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v29 = *(void *)(v23 + 56);
      uint64_t v30 = sub_1C7B7AFF0();
      uint64_t v31 = *(void *)(v30 - 8);
      uint64_t v32 = v29 + *(void *)(v31 + 72) * v26;
      uint64_t v5 = i;
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(i, v32, v30);
      sub_1C7B4A604(v26, v23, MEMORY[0x1E4F27928]);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v5, 0, 1, v30);
    }
    else
    {
      uint64_t v33 = sub_1C7B7AFF0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v5, 1, 1, v33);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C7B4E5AC((uint64_t)v5, &qword_1EBC5DC08);
    if (*(void *)(v23 + 16))
    {
      swift_beginAccess();
      char v34 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v65 = (void *)*v8;
      uint64_t v35 = v65;
      *uint64_t v8 = 0x8000000000000000;
      unint64_t v37 = sub_1C7B49014(v21, v22);
      uint64_t v38 = v35[2];
      BOOL v39 = (v36 & 1) == 0;
      uint64_t v40 = v38 + v39;
      if (__OFADD__(v38, v39))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      char v41 = v36;
      if (v35[3] < v40)
      {
        sub_1C7B49FD8(v40, v34, &qword_1EA4F9360);
        unint64_t v42 = sub_1C7B49014(v21, v22);
        if ((v41 & 1) != (v43 & 1)) {
          goto LABEL_49;
        }
        unint64_t v37 = v42;
        uint64_t v44 = v65;
        if ((v41 & 1) == 0) {
          goto LABEL_40;
        }
LABEL_38:
        uint64_t v50 = v44[7];
        swift_bridgeObjectRelease();
        *(void *)(v50 + 8 * v37) = v23;
LABEL_42:
        *uint64_t v8 = (uint64_t)v44;
        goto LABEL_43;
      }
      if (v34)
      {
        uint64_t v44 = v65;
        if (v36) {
          goto LABEL_38;
        }
      }
      else
      {
        sub_1C7B4C278(&qword_1EA4F9360);
        uint64_t v44 = v65;
        if (v41) {
          goto LABEL_38;
        }
      }
LABEL_40:
      v44[(v37 >> 6) + 8] |= 1 << v37;
      uint64_t v51 = (uint64_t *)(v44[6] + 16 * v37);
      uint64_t *v51 = v21;
      v51[1] = v22;
      *(void *)(v44[7] + 8 * v37) = v23;
      uint64_t v52 = v44[2];
      BOOL v53 = __OFADD__(v52, 1);
      uint64_t v54 = v52 + 1;
      if (v53) {
        goto LABEL_47;
      }
      v44[2] = v54;
      swift_bridgeObjectRetain();
      goto LABEL_42;
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    unint64_t v45 = sub_1C7B49014(v21, v22);
    char v47 = v46;
    swift_bridgeObjectRelease();
    if ((v47 & 1) == 0) {
      goto LABEL_4;
    }
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = *v8;
    uint64_t v65 = (void *)*v8;
    *uint64_t v8 = 0x8000000000000000;
    if ((v48 & 1) == 0)
    {
      sub_1C7B4C278(&qword_1EA4F9360);
      uint64_t v49 = (uint64_t)v65;
    }
    swift_bridgeObjectRelease();
    sub_1C7B4AA7C(v45, v49);
    *uint64_t v8 = v49;
    swift_bridgeObjectRelease();
LABEL_43:
    swift_bridgeObjectRelease();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v58) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v57 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v58) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v57 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t result = sub_1C7B7B600();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall MetadataStore.hasMetadata(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 48) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7B49014(countAndFlagsBits, (uint64_t)object);
    char v5 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t MetadataStore.isValid(at:)(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  v7[2] = a1;
  swift_bridgeObjectRetain();
  char v4 = sub_1C7B40D5C(sub_1C7B4E3EC, (char)v7, v3);
  swift_bridgeObjectRelease();
  if (v4) {
    char v5 = 0;
  }
  else {
    char v5 = sub_1C7B45704(a1);
  }
  return v5 & 1;
}

uint64_t sub_1C7B45704(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = v3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v3 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v4 + 8 * v10);
    if (!v16)
    {
      int64_t v17 = v10 + 1;
      if (v10 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v10 + 2;
        if (v10 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v4 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v10 + 3;
          if (v10 + 3 >= v8)
          {
LABEL_23:
            uint64_t v18 = 1;
            goto LABEL_24;
          }
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (!v16)
          {
            while (1)
            {
              int64_t v10 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_26;
              }
              if (v10 >= v8) {
                goto LABEL_23;
              }
              unint64_t v16 = *(void *)(v4 + 8 * v10);
              ++v17;
              if (v16) {
                goto LABEL_17;
              }
            }
          }
        }
      }
      int64_t v10 = v17;
    }
LABEL_17:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = *(void *)(*(void *)(v3 + 56) + 8 * v12);
    MEMORY[0x1F4188790](result);
    v19[2] = a1;
    swift_bridgeObjectRetain();
    char v14 = sub_1C7B41048((uint64_t (*)(uint64_t))sub_1C7B4E558, (char)v19, v13);
    uint64_t result = swift_bridgeObjectRelease();
    if (v14)
    {
      uint64_t v18 = 0;
LABEL_24:
      swift_release();
      return v18;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

Swift::Void __swiftcall MetadataStore.remove(pairedDeviceIdentifier:)(Swift::String pairedDeviceIdentifier)
{
  object = pairedDeviceIdentifier._object;
  uint64_t countAndFlagsBits = pairedDeviceIdentifier._countAndFlagsBits;
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C7B7B090();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBC5DC50);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_1C7B7B080();
  os_log_type_t v5 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v8[0] = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_bridgeObjectRetain();
    sub_1C7B47DE8(countAndFlagsBits, (unint64_t)object, v8);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C7B37000, v4, v5, "Removing paired device identifier: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v7, -1, -1);
    MEMORY[0x1C87BC480](v6, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  sub_1C7B48DC4(countAndFlagsBits, (uint64_t)object);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C7B48C14(countAndFlagsBits, (uint64_t)object, &qword_1EA4F9360);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

Swift::Bool __swiftcall MetadataStore.hasPerformedInitialSync(for:)(Swift::String a1)
{
  uint64_t object = (uint64_t)a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  LOBYTE(object) = sub_1C7B45B8C(countAndFlagsBits, object, v4);
  swift_bridgeObjectRelease();
  return object & 1;
}

uint64_t sub_1C7B45B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1C7B7B650();
    sub_1C7B7B210();
    uint64_t v6 = sub_1C7B7B680();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1C7B7B5E0() & 1) != 0) {
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
          if (v17 || (sub_1C7B7B5E0() & 1) != 0) {
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

Swift::Void __swiftcall MetadataStore.setPerformedInitialSync(for:)(Swift::String a1)
{
  uint64_t object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  char v5 = sub_1C7B45B8C(countAndFlagsBits, (uint64_t)object, v4);
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C7B7B090();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EBC5DC50);
    swift_bridgeObjectRetain_n();
    uint64_t v7 = sub_1C7B7B080();
    os_log_type_t v8 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v11[0] = v10;
      *(_DWORD *)uint64_t v9 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_1C7B47DE8(countAndFlagsBits, (unint64_t)object, v11);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C7B37000, v7, v8, "Adding paired device identifier: %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v10, -1, -1);
      MEMORY[0x1C87BC480](v9, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1C7B484C0(&v12, countAndFlagsBits, (uint64_t)object);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall MetadataStore.forget(recordID:)(SessionSyncEngine::RecordID recordID)
{
  uint64_t countAndFlagsBits = (uint64_t *)recordID.identifier._countAndFlagsBits;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *countAndFlagsBits;
  uint64_t v6 = countAndFlagsBits[1];
  uint64_t v8 = countAndFlagsBits[2];
  uint64_t v7 = countAndFlagsBits[3];
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = v8;
  v10[3] = v7;
  sub_1C7B44FF0(v10);
  uint64_t v9 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C7B42524((uint64_t)v4, v5, v6, v8, v7);
  swift_endAccess();
}

uint64_t sub_1C7B4601C()
{
  swift_retain();
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_1C7B4D368(v0);
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_1C7B46084(uint64_t a1)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1C7B4D878(v2, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1C7B413E0(v3);
  swift_release();
  return v4;
}

uint64_t sub_1C7B4611C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1C7B4614C(a1, a2, a3, a4, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C7B4DA34);
}

uint64_t sub_1C7B46134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1C7B4614C(a1, a2, a3, a4, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C7B4DD10);
}

uint64_t sub_1C7B4614C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = *v5;
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_1C7B4DFEC(v10, v9, a1, a2, a5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1C7B413E0(v11);
  swift_release();
  return v12;
}

uint64_t sub_1C7B46210(uint64_t a1, uint64_t a2)
{
  return MetadataStore.set(lastModifiedDate:for:)(a1, a2);
}

uint64_t sub_1C7B46234(uint64_t a1, uint64_t a2)
{
  return MetadataStore.set(deletedDate:for:)(a1, a2);
}

uint64_t sub_1C7B46258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MetadataStore.set(syncDate:for:pairedDeviceIdentifier:)(a1, a2, a3, a4);
}

uint64_t sub_1C7B4627C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MetadataStore.set(syncDate:forRecordsMatching:pairedDeviceIdentifier:)(a1, a2, a3, a4);
}

uint64_t sub_1C7B462A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return MetadataStore.recordMetadata(for:)(a1, a2);
}

void sub_1C7B462C4()
{
}

void sub_1C7B462E8(Swift::OpaquePointer a1)
{
}

BOOL sub_1C7B4630C(uint64_t a1, uint64_t a2)
{
  return MetadataStore.hasMetadata(for:)(*(Swift::String *)&a1);
}

uint64_t sub_1C7B46334()
{
  return sub_1C7B404F0();
}

uint64_t sub_1C7B4635C(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  v8[2] = a1;
  swift_bridgeObjectRetain();
  char v5 = sub_1C7B40D5C(sub_1C7B4E6D0, (char)v8, v4);
  swift_bridgeObjectRelease();
  if (v5) {
    char v6 = 0;
  }
  else {
    char v6 = sub_1C7B45704(a1);
  }
  return v6 & 1;
}

void sub_1C7B463FC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1C7B46420(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v8;
  uint64_t v11[3] = v7;
  sub_1C7B44FF0(v11);
  uint64_t v9 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C7B42524((uint64_t)v4, v5, v6, v8, v7);
  return swift_endAccess();
}

uint64_t sub_1C7B46544(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 56);
  swift_bridgeObjectRetain();
  LOBYTE(a2) = sub_1C7B45B8C(a1, a2, v6);
  swift_bridgeObjectRelease();
  return a2 & 1;
}

void sub_1C7B465BC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1C7B465E0()
{
  uint64_t v18 = MEMORY[0x1E4FBC870];
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = v1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (v5) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v11 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v11 < v6)
    {
      unint64_t v12 = *(void *)(v2 + 8 * v11);
      ++v8;
      if (v12) {
        goto LABEL_20;
      }
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v6) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (v12) {
        goto LABEL_20;
      }
      int64_t v8 = v11 + 2;
      if (v11 + 2 >= v6) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (v12)
      {
LABEL_20:
        unint64_t v5 = (v12 - 1) & v12;
        for (unint64_t i = __clz(__rbit64(v12)) + (v8 << 6); ; unint64_t i = v9 | (v8 << 6))
        {
          uint64_t v14 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
          uint64_t v16 = *v14;
          uint64_t v15 = v14[1];
          swift_bridgeObjectRetain();
          if (sub_1C7B46D48(v16, v15))
          {
            sub_1C7B484C0(&v17, v16, v15);
            uint64_t result = swift_bridgeObjectRelease();
            if (!v5) {
              goto LABEL_7;
            }
          }
          else
          {
            uint64_t result = swift_bridgeObjectRelease();
            if (!v5) {
              goto LABEL_7;
            }
          }
LABEL_6:
          unint64_t v9 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v13 = v11 + 3;
      if (v13 < v6)
      {
        unint64_t v12 = *(void *)(v2 + 8 * v13);
        if (v12)
        {
          int64_t v8 = v13;
          goto LABEL_20;
        }
        while (1)
        {
          int64_t v8 = v13 + 1;
          if (__OFADD__(v13, 1)) {
            goto LABEL_26;
          }
          if (v8 >= v6) {
            break;
          }
          unint64_t v12 = *(void *)(v2 + 8 * v8);
          ++v13;
          if (v12) {
            goto LABEL_20;
          }
        }
      }
    }
LABEL_24:
    swift_release();
    return v18;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1C7B467A4()
{
  uint64_t v30 = MEMORY[0x1E4FBC870];
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = v1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 56);
  int64_t v6 = (uint64_t *)(v0 + 48);
  uint64_t v28 = v0;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  uint64_t result = swift_beginAccess();
  int64_t v8 = 0;
  int64_t v9 = (unint64_t)(v3 + 63) >> 6;
  unint64_t v26 = (uint64_t *)(v0 + 48);
  uint64_t v27 = v1 + 56;
  int64_t v25 = v9;
  while (v5)
  {
    unint64_t v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v11 = v10 | (v8 << 6);
LABEL_18:
    uint64_t v15 = *v6;
    if (*(void *)(*v6 + 16))
    {
      uint64_t v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_1C7B49014(v18, v17);
      if (v20)
      {
        uint64_t v21 = v1;
        uint64_t v22 = *(void *)(*(void *)(v15 + 56) + 8 * v19);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v23 = *(void *)(v28 + 40);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_1C7B4CC7C(0, v23, v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        if (*(void *)(v28 + 32) < v24) {
          sub_1C7B484C0(&v29, v18, v17);
        }
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v1 = v21;
        int64_t v6 = v26;
        uint64_t v2 = v27;
        int64_t v9 = v25;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        uint64_t result = swift_bridgeObjectRelease();
      }
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v8 >= v9) {
    goto LABEL_27;
  }
  unint64_t v13 = *(void *)(v2 + 8 * v8);
  if (v13)
  {
LABEL_17:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
    goto LABEL_18;
  }
  int64_t v14 = v8 + 1;
  if (v8 + 1 >= v9) {
    goto LABEL_27;
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v8 + 2;
  if (v8 + 2 >= v9) {
    goto LABEL_27;
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v8 + 3;
  if (v8 + 3 >= v9)
  {
LABEL_27:
    swift_release();
    return v30;
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
LABEL_16:
    int64_t v8 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v9) {
      goto LABEL_27;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1C7B46A3C()
{
  uint64_t v30 = MEMORY[0x1E4FBC870];
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v27 = v1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(v1 + 32);
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  else {
    uint64_t v3 = -1;
  }
  unint64_t v4 = v3 & *(void *)(v1 + 64);
  unint64_t v5 = (uint64_t *)(v0 + 56);
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  int64_t v7 = 0;
  int64_t v28 = (unint64_t)(v2 + 63) >> 6;
  if (v4) {
    goto LABEL_21;
  }
LABEL_7:
  int64_t v8 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v8 < v28)
    {
      unint64_t v9 = *(void *)(v27 + 8 * v8);
      ++v7;
      if (v9) {
        goto LABEL_20;
      }
      int64_t v7 = v8 + 1;
      if (v8 + 1 >= v28) {
        goto LABEL_42;
      }
      unint64_t v9 = *(void *)(v27 + 8 * v7);
      if (v9) {
        goto LABEL_20;
      }
      int64_t v7 = v8 + 2;
      if (v8 + 2 >= v28) {
        goto LABEL_42;
      }
      unint64_t v9 = *(void *)(v27 + 8 * v7);
      if (v9)
      {
LABEL_20:
        unint64_t v4 = (v9 - 1) & v9;
        for (unint64_t i = __clz(__rbit64(v9)) + (v7 << 6); ; unint64_t i = v12 | (v7 << 6))
        {
          unint64_t v13 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
          uint64_t v15 = *v13;
          uint64_t v14 = v13[1];
          uint64_t v16 = *v5;
          if (*(void *)(*v5 + 16))
          {
            sub_1C7B7B650();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1C7B7B210();
            uint64_t v17 = sub_1C7B7B680();
            uint64_t v18 = -1 << *(unsigned char *)(v16 + 32);
            unint64_t v19 = v17 & ~v18;
            if ((*(void *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
            {
              uint64_t v20 = v1;
              uint64_t v21 = *(void *)(v16 + 48);
              uint64_t v22 = (void *)(v21 + 16 * v19);
              BOOL v23 = *v22 == v15 && v22[1] == v14;
              if (v23 || (sub_1C7B7B5E0() & 1) != 0)
              {
LABEL_6:
                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease();
                uint64_t v1 = v20;
                unint64_t v5 = (uint64_t *)(v0 + 56);
                if (!v4) {
                  goto LABEL_7;
                }
                goto LABEL_21;
              }
              uint64_t v24 = ~v18;
              while (1)
              {
                unint64_t v19 = (v19 + 1) & v24;
                if (((*(void *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
                  break;
                }
                int64_t v25 = (void *)(v21 + 16 * v19);
                BOOL v26 = *v25 == v15 && v25[1] == v14;
                if (v26 || (sub_1C7B7B5E0() & 1) != 0) {
                  goto LABEL_6;
                }
              }
              swift_bridgeObjectRelease();
              uint64_t v1 = v20;
              unint64_t v5 = (uint64_t *)(v0 + 56);
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRetain();
          }
          sub_1C7B484C0(&v29, v15, v14);
          uint64_t result = swift_bridgeObjectRelease();
          if (!v4) {
            goto LABEL_7;
          }
LABEL_21:
          unint64_t v12 = __clz(__rbit64(v4));
          v4 &= v4 - 1;
        }
      }
      int64_t v10 = v8 + 3;
      if (v10 < v28)
      {
        unint64_t v9 = *(void *)(v27 + 8 * v10);
        if (v9)
        {
          int64_t v7 = v10;
          goto LABEL_20;
        }
        while (1)
        {
          int64_t v7 = v10 + 1;
          if (__OFADD__(v10, 1)) {
            goto LABEL_44;
          }
          if (v7 >= v28) {
            break;
          }
          unint64_t v9 = *(void *)(v27 + 8 * v7);
          ++v10;
          if (v9) {
            goto LABEL_20;
          }
        }
      }
    }
LABEL_42:
    swift_release();
    return v30;
  }
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_1C7B46D48(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1C7B7AFF0();
  uint64_t v62 = *(void *)(v5 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v67 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v66 = (char *)&v57 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v9 - 8);
  unint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for RecordMetadata(0);
  uint64_t v70 = *(void *)(v65 - 8);
  MEMORY[0x1F4188790](v65);
  uint64_t v77 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E810);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (unint64_t *)((char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (uint64_t *)((char *)&v57 - v17);
  swift_beginAccess();
  uint64_t v68 = v2;
  uint64_t v19 = *(void *)(v2 + 48);
  if (*(void *)(v19 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_1C7B49014(a1, a2);
    if (v21)
    {
      uint64_t v74 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v22 = v68;
      swift_beginAccess();
      uint64_t v23 = *(void *)(v22 + 40);
      uint64_t v24 = *(void *)(v23 + 64);
      uint64_t v60 = v23 + 64;
      uint64_t v25 = 1 << *(unsigned char *)(v23 + 32);
      uint64_t v26 = -1;
      if (v25 < 64) {
        uint64_t v26 = ~(-1 << v25);
      }
      unint64_t v27 = v26 & v24;
      unint64_t v28 = (unint64_t)(v25 + 63) >> 6;
      uint64_t v73 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56);
      uint64_t v61 = v62 + 16;
      uint64_t v72 = (uint64_t (**)(char *, uint64_t, uint64_t))(v62 + 48);
      uint64_t v64 = (void (**)(char *, uint64_t))(v62 + 8);
      unint64_t v57 = v28 - 1;
      uint64_t result = swift_bridgeObjectRetain();
      unint64_t v30 = 0;
      int64_t v63 = v28;
      unint64_t v59 = v28 - 5;
      uint64_t v69 = result;
      uint64_t v58 = result + 104;
      while (!v27)
      {
        int64_t v39 = v30 + 1;
        if (__OFADD__(v30, 1))
        {
          __break(1u);
          return result;
        }
        if (v39 >= v63)
        {
          unint64_t v41 = v30;
        }
        else
        {
          unint64_t v40 = *(void *)(v60 + 8 * v39);
          if (v40) {
            goto LABEL_13;
          }
          unint64_t v41 = v30 + 1;
          if ((uint64_t)(v30 + 2) < v63)
          {
            unint64_t v40 = *(void *)(v60 + 8 * (v30 + 2));
            if (v40)
            {
              int64_t v39 = v30 + 2;
              goto LABEL_13;
            }
            unint64_t v41 = v30 + 2;
            if ((uint64_t)(v30 + 3) < v63)
            {
              unint64_t v40 = *(void *)(v60 + 8 * (v30 + 3));
              if (v40)
              {
                int64_t v39 = v30 + 3;
LABEL_13:
                uint64_t v76 = (v40 - 1) & v40;
                unint64_t v31 = __clz(__rbit64(v40)) + (v39 << 6);
                unint64_t v30 = v39;
LABEL_9:
                uint64_t v32 = *(void *)(v69 + 56);
                uint64_t v33 = (void *)(*(void *)(v69 + 48) + 32 * v31);
                uint64_t v34 = v33[1];
                uint64_t v35 = v33[2];
                uint64_t v36 = v33[3];
                *uint64_t v16 = *v33;
                v16[1] = v34;
                v16[2] = v35;
                v16[3] = v36;
                uint64_t v37 = v32 + *(void *)(v70 + 72) * v31;
                uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
                sub_1C7B4E270(v37, (uint64_t)v16 + *(int *)(v38 + 48));
                (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v16, 0, 1, v38);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                goto LABEL_16;
              }
              int64_t v39 = v30 + 4;
              unint64_t v41 = v30 + 3;
              if ((uint64_t)(v30 + 4) < v63)
              {
                unint64_t v40 = *(void *)(v60 + 8 * v39);
                if (v40) {
                  goto LABEL_13;
                }
                while (v59 != v30)
                {
                  unint64_t v40 = *(void *)(v58 + 8 * v30++);
                  if (v40)
                  {
                    int64_t v39 = v30 + 4;
                    goto LABEL_13;
                  }
                }
                unint64_t v41 = v57;
              }
            }
          }
        }
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v16, 1, 1, v42);
        uint64_t v76 = 0;
        unint64_t v30 = v41;
LABEL_16:
        sub_1C7B4E66C((uint64_t)v16, (uint64_t)v18, &qword_1EBC5E810);
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v18, 1, v43) == 1)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return 0;
        }
        unint64_t v75 = v30;
        uint64_t v44 = *v18;
        uint64_t v45 = v18[1];
        uint64_t v47 = v18[2];
        uint64_t v46 = v18[3];
        sub_1C7B3DA2C((uint64_t)v18 + *(int *)(v43 + 48), v77);
        uint64_t v48 = v74;
        if (*(void *)(v74 + 16) && (unint64_t v49 = sub_1C7B48F54(v44, v45, v47, v46), (v50 & 1) != 0))
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v11, *(void *)(v48 + 56) + *(void *)(v62 + 72) * v49, v5);
          uint64_t v51 = 0;
        }
        else
        {
          uint64_t v51 = 1;
        }
        (*v73)(v11, v51, 1, v5);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v52 = (*v72)(v11, 1, v5);
        sub_1C7B4E5AC((uint64_t)v11, &qword_1EBC5DC08);
        if (v52 == 1)
        {
          BOOL v53 = v66;
          uint64_t v54 = v77;
          sub_1C7B7AF70();
          uint64_t v55 = v67;
          sub_1C7B7AFD0();
          int v71 = sub_1C7B7AF90();
          uint64_t v56 = *v64;
          (*v64)(v55, v5);
          v56(v53, v5);
          uint64_t result = sub_1C7B4E2D4(v54);
          unint64_t v30 = v75;
          unint64_t v27 = v76;
          if (v71)
          {
            swift_bridgeObjectRelease();
            swift_release();
            return 1;
          }
        }
        else
        {
          uint64_t result = sub_1C7B4E2D4(v77);
          unint64_t v30 = v75;
          unint64_t v27 = v76;
        }
      }
      uint64_t v76 = (v27 - 1) & v27;
      unint64_t v31 = __clz(__rbit64(v27)) | (v30 << 6);
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_1C7B474C4(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v64 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C7B7AFF0();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v58 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unint64_t v57 = (char *)&v53 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for RecordMetadata(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v56 = (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *a1;
  uint64_t v17 = a1[1];
  uint64_t v19 = a1[2];
  uint64_t v18 = a1[3];
  swift_beginAccess();
  uint64_t v20 = v2[5];
  if (!*(void *)(v20 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_7:
    sub_1C7B4E5AC((uint64_t)v12, &qword_1EBC5E400);
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v55 = v16;
  uint64_t v62 = v18;
  unint64_t v21 = sub_1C7B48F54(v16, v17, v19, v18);
  if (v22)
  {
    sub_1C7B4E270(*(void *)(v20 + 56) + *(void *)(v14 + 72) * v21, (uint64_t)v12);
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = 1;
  }
  uint64_t v24 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v23, 1, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    goto LABEL_7;
  }
  sub_1C7B3DA2C((uint64_t)v12, v56);
  sub_1C7B7AFD0();
  sub_1C7B7AF70();
  if ((sub_1C7B7AF80() & 1) == 0)
  {
    uint64_t v25 = 0;
LABEL_42:
    int v52 = *(void (**)(char *, uint64_t))(v61 + 8);
    v52(v58, v6);
    v52(v57, v6);
    sub_1C7B4E2D4(v56);
    return v25;
  }
  uint64_t v54 = v19;
  swift_beginAccess();
  uint64_t v26 = v2[7];
  uint64_t v27 = v26 + 56;
  uint64_t v28 = 1 << *(unsigned char *)(v26 + 32);
  uint64_t v29 = -1;
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  unint64_t v30 = v29 & *(void *)(v26 + 56);
  unint64_t v31 = v2 + 6;
  uint64_t v63 = v26;
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  uint64_t v33 = 0;
  uint64_t v64 = (char *)((unint64_t)(v28 + 63) >> 6);
  uint64_t v53 = v61 + 16;
  unint64_t v59 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56);
  uint64_t v60 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
  while (v30)
  {
    unint64_t v34 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    unint64_t v35 = v34 | (v33 << 6);
LABEL_29:
    uint64_t v39 = *v31;
    if (*(void *)(*v31 + 16))
    {
      uint64_t v40 = v6;
      unint64_t v41 = (uint64_t *)(*(void *)(v63 + 48) + 16 * v35);
      uint64_t v42 = *v41;
      uint64_t v43 = v41[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v44 = sub_1C7B49014(v42, v43);
      if (v45)
      {
        uint64_t v46 = *(void *)(*(void *)(v39 + 56) + 8 * v44);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v46 + 16))
        {
          swift_bridgeObjectRetain();
          uint64_t v47 = v62;
          swift_bridgeObjectRetain();
          unint64_t v48 = sub_1C7B48F54(v55, v17, v54, v47);
          uint64_t v6 = v40;
          if (v49)
          {
            uint64_t v50 = v61;
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v61 + 16))(v24, *(void *)(v46 + 56) + *(void *)(v61 + 72) * v48, v6);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v24, 0, 1, v6);
          }
          else
          {
            (*v59)(v24, 1, 1, v40);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v6 = v40;
          (*v59)(v24, 1, 1, v40);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v51 = (*v60)(v24, 1, v6);
        uint64_t result = sub_1C7B4E5AC(v24, &qword_1EBC5DC08);
        if (v51 == 1)
        {
          uint64_t v25 = 0;
LABEL_41:
          swift_release();
          goto LABEL_42;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v6 = v40;
      }
    }
  }
  uint64_t v36 = v33 + 1;
  if (__OFADD__(v33, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v36 >= (uint64_t)v64) {
    goto LABEL_40;
  }
  unint64_t v37 = *(void *)(v27 + 8 * v36);
  ++v33;
  if (v37) {
    goto LABEL_28;
  }
  uint64_t v33 = v36 + 1;
  if (v36 + 1 >= (uint64_t)v64) {
    goto LABEL_40;
  }
  unint64_t v37 = *(void *)(v27 + 8 * v33);
  if (v37) {
    goto LABEL_28;
  }
  uint64_t v33 = v36 + 2;
  if (v36 + 2 >= (uint64_t)v64) {
    goto LABEL_40;
  }
  unint64_t v37 = *(void *)(v27 + 8 * v33);
  if (v37)
  {
LABEL_28:
    unint64_t v30 = (v37 - 1) & v37;
    unint64_t v35 = __clz(__rbit64(v37)) + (v33 << 6);
    goto LABEL_29;
  }
  uint64_t v38 = v36 + 3;
  if (v38 >= (uint64_t)v64)
  {
LABEL_40:
    uint64_t v25 = 1;
    goto LABEL_41;
  }
  unint64_t v37 = *(void *)(v27 + 8 * v38);
  if (v37)
  {
    uint64_t v33 = v38;
    goto LABEL_28;
  }
  while (1)
  {
    uint64_t v33 = v38 + 1;
    if (__OFADD__(v38, 1)) {
      break;
    }
    if (v33 >= (uint64_t)v64) {
      goto LABEL_40;
    }
    unint64_t v37 = *(void *)(v27 + 8 * v33);
    ++v38;
    if (v37) {
      goto LABEL_28;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1C7B47B70(uint64_t a1)
{
  uint64_t v2 = sub_1C7B7AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(int *)(v7 + 56);
  uint64_t v11 = (uint64_t)&v9[v10];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)a1;
  *((void *)v9 + 2) = v13;
  *((void *)v9 + 3) = v14;
  sub_1C7B4E270(v12, v11);
  uint64_t v15 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11 + *(int *)(v15 + 20), v2);
  sub_1C7B4E2D4(v11);
  char v16 = sub_1C7B7AF80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v16 & 1;
}

uint64_t sub_1C7B47CFC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_1C7B47D38(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1C7B47D48(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C7B47D70(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1C7B47DE8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1C7B7B3A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C7B47DE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C7B47EBC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C7B4E4F8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C7B4E4F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C7B47EBC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C7B7B3B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C7B48078(a5, a6);
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
  uint64_t v8 = sub_1C7B7B4A0();
  if (!v8)
  {
    sub_1C7B7B4C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C7B7B520();
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

uint64_t sub_1C7B48078(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C7B48110(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C7B482F0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C7B482F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C7B48110(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C7B48288(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C7B7B460();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C7B7B4C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C7B7B230();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C7B7B520();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C7B7B4C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C7B48288(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC98);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C7B482F0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

uint64_t sub_1C7B48440(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C7B48468(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_1C7B7B3A0();
  *a1 = v5;
  return result;
}

uint64_t sub_1C7B484C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1C7B7B650();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  uint64_t v8 = sub_1C7B7B680();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C7B7B5E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1C7B7B5E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C7B4C5E0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1C7B48670(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *v5;
  sub_1C7B7B650();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1C7B7B680();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v14 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v15 = ~v12;
    uint64_t v16 = *(void *)(v10 + 48);
    while (1)
    {
      uint64_t v17 = (void *)(v16 + 32 * v13);
      uint64_t v18 = v17[2];
      uint64_t v19 = v17[3];
      BOOL v20 = *v17 == a2 && v17[1] == a3;
      if (v20 || (sub_1C7B7B5E0() & 1) != 0)
      {
        BOOL v21 = v18 == a4 && v19 == a5;
        if (v21 || (sub_1C7B7B5E0() & 1) != 0) {
          break;
        }
      }
      unint64_t v13 = (v13 + 1) & v15;
      if (((*(void *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v22 = (uint64_t *)(*(void *)(*v28 + 48) + 32 * v13);
    uint64_t v23 = v22[1];
    uint64_t v24 = v22[2];
    uint64_t v25 = v22[3];
    *a1 = *v22;
    a1[1] = v23;
    a1[2] = v24;
    a1[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v28;
    *uint64_t v28 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7B4C77C(a2, a3, a4, a5, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v28 = v30;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    uint64_t result = 1;
    a1[2] = a4;
    a1[3] = a5;
  }
  return result;
}

uint64_t sub_1C7B48898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v6 = v5;
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_1C7B48F54(a1, a2, a3, a4);
  LOBYTE(a4) = v13;
  swift_bridgeObjectRelease();
  if (a4)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v6;
    uint64_t v25 = *v6;
    *unint64_t v6 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C7B4BB24();
      uint64_t v15 = v25;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v15 + 56);
    uint64_t v17 = type metadata accessor for RecordMetadata(0);
    uint64_t v24 = *(void *)(v17 - 8);
    sub_1C7B3DA2C(v16 + *(void *)(v24 + 72) * v12, a5);
    sub_1C7B4A604(v12, v15, type metadata accessor for RecordMetadata);
    *unint64_t v6 = v15;
    swift_bridgeObjectRelease();
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56);
    uint64_t v19 = a5;
    uint64_t v20 = 0;
    uint64_t v21 = v17;
  }
  else
  {
    uint64_t v22 = type metadata accessor for RecordMetadata(0);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
    uint64_t v21 = v22;
    uint64_t v19 = a5;
    uint64_t v20 = 1;
  }

  return v18(v19, v20, 1, v21);
}

uint64_t sub_1C7B48A60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C7B49014(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C7B4BFA8();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_1C7B7AFF0();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_1C7B4A868(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_1C7B7AFF0();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_1C7B48C08(uint64_t a1, uint64_t a2)
{
  return sub_1C7B48C14(a1, a2, &qword_1EA4F9358);
}

uint64_t sub_1C7B48C14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1C7B49014(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C7B4C278(a3);
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_1C7B4AA7C(v8, v11);
  *uint64_t v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1C7B48CF4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1C7B49014(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C7B4C428();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1C7B4AA7C(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C7B48DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1C7B7B650();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  uint64_t v6 = sub_1C7B7B680();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1C7B7B5E0() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1C7B7B5E0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C7B727EC();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_1C7B7423C(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1C7B48F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C7B7B650();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_1C7B7B680();

  return sub_1C7B4B584(a1, a2, a3, a4, v8);
}

unint64_t sub_1C7B49014(uint64_t a1, uint64_t a2)
{
  sub_1C7B7B650();
  sub_1C7B7B210();
  uint64_t v4 = sub_1C7B7B680();

  return sub_1C7B4B684(a1, a2, v4);
}

unint64_t sub_1C7B4908C(uint64_t a1)
{
  uint64_t v2 = sub_1C7B7B3F0();

  return sub_1C7B4B768(a1, v2);
}

uint64_t sub_1C7B490D0(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v50 = sub_1C7B7AFF0();
  uint64_t v5 = *(void *)(v50 - 8);
  MEMORY[0x1F4188790](v50);
  char v49 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9370);
  int v47 = a2;
  uint64_t v8 = sub_1C7B7B500();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v43 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  unint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v10 + 63) >> 6;
  unint64_t v44 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  unint64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  uint64_t v45 = v5;
  for (i = v7; ; uint64_t v7 = i)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v42) {
      break;
    }
    uint64_t v22 = v43;
    unint64_t v23 = v43[v21];
    ++v16;
    if (!v23)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v23 = v43[v16];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v42)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v41;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v43[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v16 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v42) {
              goto LABEL_34;
            }
            unint64_t v23 = v43[v16];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v24;
      }
    }
LABEL_21:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v7 + 56);
    uint64_t v26 = (uint64_t *)(*(void *)(v7 + 48) + 32 * v20);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = v26[2];
    uint64_t v30 = v26[3];
    uint64_t v31 = *(void *)(v5 + 72);
    uint64_t v32 = v25 + v31 * v20;
    if (v47)
    {
      (*v48)(v49, v32, v50);
    }
    else
    {
      (*v44)(v49, v32, v50);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1C7B7B650();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C7B7B680();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v39 = *(void *)(v14 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v17 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v9 + 48) + 32 * v17);
    *uint64_t v18 = v27;
    v18[1] = v28;
    void v18[2] = v29;
    v18[3] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v9 + 56) + v31 * v17, v49, v50);
    ++*(void *)(v9 + 16);
    uint64_t v5 = v45;
  }
  swift_release();
  unint64_t v3 = v41;
  uint64_t v22 = v43;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v9;
  return result;
}

uint64_t sub_1C7B49500(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for RecordMetadata(0);
  uint64_t v44 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v46 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC10);
  int v45 = a2;
  uint64_t v8 = sub_1C7B7B500();
  uint64_t v9 = v8;
  if (*(void *)(v7 + 16))
  {
    uint64_t v40 = v2;
    uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
    uint64_t v11 = *(void *)(v7 + 64);
    int64_t v42 = (void *)(v7 + 64);
    if (v10 < 64) {
      uint64_t v12 = ~(-1 << v10);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & v11;
    int64_t v41 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = v8 + 64;
    uint64_t result = swift_retain();
    int64_t v16 = 0;
    for (i = v7; ; uint64_t v7 = i)
    {
      if (v13)
      {
        unint64_t v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v20 = v19 | (v16 << 6);
      }
      else
      {
        int64_t v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41) {
          goto LABEL_34;
        }
        unint64_t v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          int64_t v16 = v21 + 1;
          if (v21 + 1 >= v41) {
            goto LABEL_34;
          }
          unint64_t v22 = v42[v16];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v40;
              if (v45)
              {
                uint64_t v39 = 1 << *(unsigned char *)(v7 + 32);
                if (v39 >= 64) {
                  bzero(v42, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v42 = -1 << v39;
                }
                *(void *)(v7 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v16 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v16 >= v41) {
                  goto LABEL_34;
                }
                unint64_t v22 = v42[v16];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v16 = v23;
          }
        }
LABEL_21:
        unint64_t v13 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      uint64_t v24 = *(void *)(v7 + 56);
      uint64_t v25 = (uint64_t *)(*(void *)(v7 + 48) + 32 * v20);
      uint64_t v27 = *v25;
      uint64_t v26 = v25[1];
      uint64_t v29 = v25[2];
      uint64_t v28 = v25[3];
      uint64_t v30 = *(void *)(v44 + 72);
      uint64_t v31 = v24 + v30 * v20;
      if (v45)
      {
        sub_1C7B3DA2C(v31, v46);
      }
      else
      {
        sub_1C7B4E270(v31, v46);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_1C7B7B650();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1C7B7B680();
      uint64_t v32 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v33 = result & ~v32;
      unint64_t v34 = v33 >> 6;
      if (((-1 << v33) & ~*(void *)(v14 + 8 * (v33 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v33) & ~*(void *)(v14 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v38 = *(void *)(v14 + 8 * v34);
        }
        while (v38 == -1);
        unint64_t v17 = __clz(__rbit64(~v38)) + (v34 << 6);
      }
      *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = (void *)(*(void *)(v9 + 48) + 32 * v17);
      *uint64_t v18 = v27;
      v18[1] = v26;
      void v18[2] = v29;
      v18[3] = v28;
      uint64_t result = sub_1C7B3DA2C(v46, *(void *)(v9 + 56) + v30 * v17);
      ++*(void *)(v9 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v9;
  return result;
}

uint64_t sub_1C7B498D8(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9350);
  uint64_t v6 = sub_1C7B7B500();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_1C7B4E4E8((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1C7B4E438(v25, (uint64_t)&v38);
      sub_1C7B4E4F8(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_1C7B7B3F0();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_1C7B4E4E8(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_1C7B49BF0(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v49 = sub_1C7B7AFF0();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  unint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9750);
  int v47 = a2;
  uint64_t v8 = sub_1C7B7B500();
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
  int64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  int v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  int64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
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
          unint64_t v3 = v42;
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
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
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
    sub_1C7B7B650();
    sub_1C7B7B210();
    uint64_t result = sub_1C7B7B680();
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
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *unint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  unint64_t v3 = v42;
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
  *unint64_t v3 = v9;
  return result;
}

uint64_t sub_1C7B49FD8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_1C7B7B500();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1C7B7B650();
    sub_1C7B7B210();
    uint64_t result = sub_1C7B7B680();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1C7B4A2EC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E8C8);
  char v36 = a2;
  uint64_t v6 = sub_1C7B7B500();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1C7B7B650();
    sub_1C7B7B210();
    uint64_t result = sub_1C7B7B680();
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
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
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
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_1C7B4A604(unint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v8 = ~v6;
    uint64_t result = sub_1C7B7B3E0();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v9 = (result + 1) & v8;
      while (1)
      {
        sub_1C7B7B650();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        swift_bridgeObjectRelease();
        uint64_t v10 = sub_1C7B7B680();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v8;
        if (v4 >= (uint64_t)v9) {
          break;
        }
        if (v11 < v9) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v12 = *(void *)(a2 + 48);
        int64_t v13 = (_OWORD *)(v12 + 32 * v4);
        uint64_t v14 = (_OWORD *)(v12 + 32 * v7);
        if (v4 != v7 || v13 >= v14 + 2)
        {
          long long v15 = v14[1];
          *int64_t v13 = *v14;
          v13[1] = v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(a3(0) - 8) + 72);
        int64_t v18 = v17 * v4;
        uint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v8;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v11 < v9) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v11) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    int64_t v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    int64_t v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C7B4A868(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C7B7B3E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_1C7B7B650();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        uint64_t v9 = sub_1C7B7B680();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        int64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_1C7B7AFF0() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C7B4AA7C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C7B7B3E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1C7B7B650();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        uint64_t v9 = sub_1C7B7B680();
        uint64_t result = swift_bridgeObjectRelease();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *int64_t v17 = v19 & v18;
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

uint64_t sub_1C7B4AC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v14 = (void *)*v6;
  unint64_t v16 = sub_1C7B48F54(a2, a3, a4, a5);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 < v19 || (a6 & 1) == 0)
  {
    if (v21 >= v19 && (a6 & 1) == 0)
    {
      sub_1C7B4BB24();
      goto LABEL_7;
    }
    sub_1C7B49500(v19, a6 & 1);
    unint64_t v26 = sub_1C7B48F54(a2, a3, a4, a5);
    if ((v20 & 1) == (v27 & 1))
    {
      unint64_t v16 = v26;
      uint64_t v22 = *v7;
      if (v20) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1C7B7B600();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v22 = *v7;
  if (v20)
  {
LABEL_8:
    uint64_t v23 = v22[7];
    uint64_t v24 = v23 + *(void *)(*(void *)(type metadata accessor for RecordMetadata(0) - 8) + 72) * v16;
    return sub_1C7B4E330(a1, v24);
  }
LABEL_13:
  sub_1C7B4B3BC(v16, a2, a3, a4, a5, a1, v22);
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

_OWORD *sub_1C7B4ADEC(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1C7B4908C(a2);
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
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1C7B4BDC0();
      goto LABEL_7;
    }
    sub_1C7B498D8(v13, a3 & 1);
    unint64_t v19 = sub_1C7B4908C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1C7B4E438(a2, (uint64_t)v21);
      return sub_1C7B4B458(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1C7B7B600();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);

  return sub_1C7B4E4E8(a1, v17);
}

uint64_t sub_1C7B4AF38(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1C7B49014(a2, a3);
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
      sub_1C7B4BFA8();
      goto LABEL_7;
    }
    sub_1C7B49BF0(v15, a4 & 1);
    unint64_t v26 = sub_1C7B49014(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      BOOL v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1C7B7B600();
    __break(1u);
    return result;
  }
LABEL_7:
  BOOL v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_1C7B7AFF0();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_1C7B4B4D4(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1C7B4B0B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1C7B4B0C4(a1, a2, a3, a4, &qword_1EA4F9358);
}

uint64_t sub_1C7B4B0C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1C7B49014(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_1C7B4C278(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1C7B49FD8(v17, a4 & 1, a5);
  unint64_t v23 = sub_1C7B49014(a2, a3);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1C7B7B600();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a2;
  v25[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v26 = v20[2];
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v28;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1C7B4B24C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1C7B49014(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1C7B4C428();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1C7B4A2EC(v15, a4 & 1);
  unint64_t v21 = sub_1C7B49014(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1C7B7B600();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1C7B4B3BC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = (void *)(a7[6] + 32 * a1);
  *uint64_t v10 = a2;
  v10[1] = a3;
  v10[2] = a4;
  v10[3] = a5;
  uint64_t v11 = a7[7];
  uint64_t v12 = type metadata accessor for RecordMetadata(0);
  uint64_t result = sub_1C7B3DA2C(a6, v11 + *(void *)(*(void *)(v12 - 8) + 72) * a1);
  uint64_t v14 = a7[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a7[2] = v16;
  }
  return result;
}

_OWORD *sub_1C7B4B458(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1C7B4E4E8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

uint64_t sub_1C7B4B4D4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1C7B7AFF0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_1C7B4B584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = a5 & ~v7;
  if ((*(void *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = *(void *)(v5 + 48);
    do
    {
      BOOL v15 = (void *)(v14 + 32 * v8);
      uint64_t v16 = v15[2];
      uint64_t v17 = v15[3];
      BOOL v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_1C7B7B5E0() & 1) != 0)
      {
        BOOL v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_1C7B7B5E0() & 1) != 0) {
          break;
        }
      }
      unint64_t v8 = (v8 + 1) & v13;
    }
    while (((*(void *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_1C7B4B684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C7B7B5E0() & 1) == 0)
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
      while (!v14 && (sub_1C7B7B5E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C7B4B768(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1C7B4E438(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1C87BBC10](v9, a1);
      sub_1C7B4E494((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1C7B4B830()
{
  uint64_t v41 = sub_1C7B7AFF0();
  uint64_t v43 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v40 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9370);
  uint64_t v35 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7B7B4F0();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v44 = v3;
  if (!v4)
  {
    uint64_t result = swift_release();
    uint64_t v33 = v44;
    uint64_t v32 = v35;
LABEL_25:
    *uint64_t v32 = v33;
    return result;
  }
  uint64_t v5 = v3;
  uint64_t v6 = (char *)(v3 + 64);
  char v7 = (char *)(v2 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  uint64_t v36 = v2 + 64;
  if (v5 != v2 || v6 >= &v7[8 * v8])
  {
    memmove(v6, v7, 8 * v8);
    uint64_t v5 = v44;
  }
  int64_t v9 = 0;
  *(void *)(v5 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v42 = v2;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  uint64_t v39 = v43 + 16;
  int64_t v37 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v38 = v43 + 32;
  uint64_t v13 = v43;
  BOOL v14 = v40;
  uint64_t v15 = v41;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v45 = v9;
      unint64_t v17 = v16 | (v9 << 6);
      uint64_t result = v42;
      goto LABEL_9;
    }
    int64_t v28 = v9 + 1;
    uint64_t result = v42;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v28 >= v37) {
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v36 + 8 * v28);
    int64_t v30 = v9 + 1;
    if (!v29)
    {
      int64_t v30 = v28 + 1;
      if (v28 + 1 >= v37) {
        goto LABEL_23;
      }
      unint64_t v29 = *(void *)(v36 + 8 * v30);
      if (!v29) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v29 - 1) & v29;
    int64_t v45 = v30;
    unint64_t v17 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_9:
    uint64_t v19 = 32 * v17;
    uint64_t v20 = (uint64_t *)(*(void *)(result + 48) + 32 * v17);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = v20[2];
    uint64_t v24 = v20[3];
    unint64_t v25 = *(void *)(v13 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v14, *(void *)(result + 56) + v25, v15);
    uint64_t v26 = v44;
    BOOL v27 = (void *)(*(void *)(v44 + 48) + v19);
    *BOOL v27 = v21;
    v27[1] = v22;
    v27[2] = v23;
    v27[3] = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v26 + 56) + v25, v14, v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v9 = v45;
  }
  int64_t v31 = v28 + 2;
  if (v31 >= v37)
  {
LABEL_23:
    uint64_t result = swift_release();
    uint64_t v32 = v35;
    uint64_t v33 = v44;
    goto LABEL_25;
  }
  unint64_t v29 = *(void *)(v36 + 8 * v31);
  if (v29)
  {
    int64_t v30 = v31;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v30 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v30 >= v37) {
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v36 + 8 * v30);
    ++v31;
    if (v29) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1C7B4BB24()
{
  uint64_t v1 = type metadata accessor for RecordMetadata(0);
  uint64_t v34 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC10);
  int64_t v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_1C7B7B4F0();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v35 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v29 = v35;
    int64_t v28 = v31;
LABEL_25:
    *int64_t v28 = v29;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v35;
  }
  uint64_t v32 = v4 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  int64_t v33 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v25 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v33) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v10;
    if (!v26)
    {
      int64_t v10 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_23;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v10);
      if (!v26) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v10 << 6);
LABEL_9:
    uint64_t v16 = 32 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 32 * v15);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v21 = v17[2];
    uint64_t v20 = v17[3];
    unint64_t v22 = *(void *)(v34 + 72) * v15;
    sub_1C7B4E270(*(void *)(v4 + 56) + v22, (uint64_t)v3);
    uint64_t v23 = v35;
    uint64_t v24 = (void *)(*(void *)(v35 + 48) + v16);
    void *v24 = v18;
    v24[1] = v19;
    v24[2] = v21;
    v24[3] = v20;
    sub_1C7B3DA2C((uint64_t)v3, *(void *)(v23 + 56) + v22);
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    int64_t v28 = v31;
    uint64_t v29 = v35;
    goto LABEL_25;
  }
  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    int64_t v10 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v10 >= v33) {
      goto LABEL_23;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v10);
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1C7B4BDC0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9350);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7B7B4F0();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_1C7B4E438(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1C7B4E4F8(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_1C7B4E4E8(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C7B4BFA8()
{
  uint64_t v35 = sub_1C7B7AFF0();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9750);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_1C7B7B4F0();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    int64_t v27 = v30;
LABEL_25:
    *int64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    int64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *int64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    int64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1C7B4C26C()
{
  return sub_1C7B4C278(&qword_1EA4F9358);
}

void *sub_1C7B4C278(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1C7B7B4F0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C7B4C428()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E8C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7B7B4F0();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1C7B4C5E0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1C7B737B4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1C7B727EC();
      goto LABEL_22;
    }
    sub_1C7B72DC8();
  }
  uint64_t v11 = *v4;
  sub_1C7B7B650();
  sub_1C7B7B210();
  uint64_t result = sub_1C7B7B680();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1C7B7B5E0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1C7B7B5F0();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1C7B7B5E0();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
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

uint64_t sub_1C7B4C77C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v11 = result;
  unint64_t v12 = *(void *)(*v6 + 16);
  unint64_t v13 = *(void *)(*v6 + 24);
  if (v13 > v12 && (a6 & 1) != 0) {
    goto LABEL_22;
  }
  if (a6)
  {
    sub_1C7B73A94();
  }
  else
  {
    if (v13 > v12)
    {
      uint64_t result = (uint64_t)sub_1C7B729A0();
      goto LABEL_22;
    }
    sub_1C7B73078();
  }
  uint64_t v14 = *v6;
  sub_1C7B7B650();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1C7B7B680();
  uint64_t v15 = -1 << *(unsigned char *)(v14 + 32);
  a5 = result & ~v15;
  uint64_t v16 = v14 + 56;
  if ((*(void *)(v14 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5))
  {
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v14 + 48);
    while (1)
    {
      uint64_t v19 = (void *)(v18 + 32 * a5);
      uint64_t v20 = v19[2];
      uint64_t v21 = v19[3];
      BOOL v22 = *v19 == v11 && v19[1] == a2;
      if (v22 || (uint64_t result = sub_1C7B7B5E0(), (result & 1) != 0))
      {
        if (v20 == a3 && v21 == a4) {
          break;
        }
        uint64_t result = sub_1C7B7B5E0();
        if (result) {
          break;
        }
      }
      a5 = (a5 + 1) & v17;
      if (((*(void *)(v16 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5) & 1) == 0) {
        goto LABEL_22;
      }
    }
    uint64_t result = sub_1C7B7B5F0();
    __break(1u);
  }
LABEL_22:
  uint64_t v24 = *v29;
  *(void *)(*v29 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  int64_t v25 = (uint64_t *)(*(void *)(v24 + 48) + 32 * a5);
  *int64_t v25 = v11;
  v25[1] = a2;
  _OWORD v25[2] = a3;
  v25[3] = a4;
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27) {
    __break(1u);
  }
  else {
    *(void *)(v24 + 16) = v28;
  }
  return result;
}

uint64_t sub_1C7B4C964(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7B4C9A4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1C7B4C984(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1C7B4CB10(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1C7B4C9A4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9380);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

uint64_t sub_1C7B4CB10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9490);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

uint64_t sub_1C7B4CC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v59 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v58 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E808);
  uint64_t v7 = MEMORY[0x1F4188790](v57);
  uint64_t v56 = (_OWORD *)((char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v63 = (uint64_t)&v53 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (uint64_t *)((char *)&v53 - v11);
  uint64_t v13 = *(void *)(a2 + 64);
  uint64_t v54 = a2 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v55 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v60 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v18 = 0;
  while (v16)
  {
    uint64_t v61 = (v16 - 1) & v16;
    int64_t v62 = v18;
    unint64_t v19 = __clz(__rbit64(v16)) | (v18 << 6);
LABEL_23:
    uint64_t v24 = *(void *)(v60 + 56);
    int64_t v25 = (uint64_t *)(*(void *)(v60 + 48) + 32 * v19);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    uint64_t v29 = v25[2];
    uint64_t v28 = v25[3];
    uint64_t v30 = v24 + *(void *)(*(void *)(type metadata accessor for RecordMetadata(0) - 8) + 72) * v19;
    uint64_t v31 = v57;
    sub_1C7B4E270(v30, (uint64_t)v12 + *(int *)(v57 + 48));
    *uint64_t v12 = v27;
    v12[1] = v26;
    v12[2] = v29;
    uint64_t v12[3] = v28;
    uint64_t v32 = v63;
    sub_1C7B4E66C((uint64_t)v12, v63, &qword_1EBC5E808);
    uint64_t v33 = *(int *)(v31 + 48);
    uint64_t v34 = v56;
    uint64_t v35 = (uint64_t *)((char *)v56 + v33);
    uint64_t v36 = v32 + v33;
    uint64_t v37 = *(void *)(v32 + 16);
    uint64_t v38 = *(void *)(v32 + 24);
    *uint64_t v56 = *(_OWORD *)v32;
    *((void *)v34 + 2) = v37;
    *((void *)v34 + 3) = v38;
    sub_1C7B4E270(v36, (uint64_t)v35);
    uint64_t v39 = *v35;
    uint64_t v40 = v35[1];
    uint64_t v42 = v35[2];
    uint64_t v41 = v35[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C7B4E2D4((uint64_t)v35);
    if (*(void *)(a3 + 16) && (unint64_t v43 = sub_1C7B48F54(v39, v40, v42, v41), (v44 & 1) != 0))
    {
      unint64_t v45 = v43;
      uint64_t v46 = *(void *)(a3 + 56);
      uint64_t v47 = sub_1C7B7AFF0();
      uint64_t v48 = *(void *)(v47 - 8);
      uint64_t v49 = v48;
      uint64_t v50 = v46 + *(void *)(v48 + 72) * v45;
      uint64_t v51 = (uint64_t)v58;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v58, v50, v47);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v49 + 56))(v51, 0, 1, v47);
    }
    else
    {
      uint64_t v47 = sub_1C7B7AFF0();
      uint64_t v51 = (uint64_t)v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v58, 1, 1, v47);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C7B7AFF0();
    int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 48))(v51, 1, v47);
    sub_1C7B4E5AC(v51, &qword_1EBC5DC08);
    if (v52 == 1)
    {
      if (__OFADD__(v59, 1))
      {
        __break(1u);
LABEL_31:
        swift_release();
        return v59;
      }
      ++v59;
    }
    unint64_t v16 = v61;
    int64_t v18 = v62;
    uint64_t result = sub_1C7B4E5AC(v63, &qword_1EBC5E808);
  }
  int64_t v20 = v18 + 1;
  if (__OFADD__(v18, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v20 >= v55) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v54 + 8 * v20);
  int64_t v22 = v18 + 1;
  if (v21) {
    goto LABEL_22;
  }
  int64_t v22 = v18 + 2;
  if (v18 + 2 >= v55) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v54 + 8 * v22);
  if (v21) {
    goto LABEL_22;
  }
  int64_t v22 = v18 + 3;
  if (v18 + 3 >= v55) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v54 + 8 * v22);
  if (v21) {
    goto LABEL_22;
  }
  int64_t v22 = v18 + 4;
  if (v18 + 4 >= v55) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v54 + 8 * v22);
  if (v21)
  {
LABEL_22:
    uint64_t v61 = (v21 - 1) & v21;
    int64_t v62 = v22;
    unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    goto LABEL_23;
  }
  uint64_t v23 = v18 + 5;
  if (v18 + 5 >= v55) {
    goto LABEL_31;
  }
  unint64_t v21 = *(void *)(v54 + 8 * v23);
  if (v21)
  {
    int64_t v22 = v18 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v22 >= v55) {
      goto LABEL_31;
    }
    unint64_t v21 = *(void *)(v54 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1C7B4D174(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = result;
  int64_t v10 = 0;
  uint64_t v11 = 1 << *(unsigned char *)(result + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(result + 64);
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  while (v13)
  {
    unint64_t v14 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v15 = v14 | (v10 << 6);
LABEL_22:
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 32 * v15);
    uint64_t v20 = v19[2];
    uint64_t v21 = v19[3];
    if (*v19 != a2 || v19[1] != a3)
    {
      uint64_t result = sub_1C7B7B5E0();
      if ((result & 1) == 0) {
        continue;
      }
    }
    if (v20 != a4 || v21 != a5)
    {
      uint64_t result = sub_1C7B7B5E0();
      if ((result & 1) == 0) {
        continue;
      }
    }
    return 1;
  }
  int64_t v16 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v16 >= v25) {
    return 0;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v16);
  ++v10;
  if (v17) {
    goto LABEL_21;
  }
  int64_t v10 = v16 + 1;
  if (v16 + 1 >= v25) {
    return 0;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v10);
  if (v17) {
    goto LABEL_21;
  }
  int64_t v10 = v16 + 2;
  if (v16 + 2 >= v25) {
    return 0;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v10);
  if (v17) {
    goto LABEL_21;
  }
  int64_t v10 = v16 + 3;
  if (v16 + 3 >= v25) {
    return 0;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v10);
  if (v17)
  {
LABEL_21:
    unint64_t v13 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v10 << 6);
    goto LABEL_22;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v25) {
    return 0;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v18);
  if (v17)
  {
    int64_t v10 = v18;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v10 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v10 >= v25) {
      return 0;
    }
    unint64_t v17 = *(void *)(v24 + 8 * v10);
    ++v18;
    if (v17) {
      goto LABEL_21;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1C7B4D368(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = swift_beginAccess();
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v4 = 0;
  uint64_t v5 = a1 + 56;
  uint64_t v22 = -(uint64_t)v2;
  uint64_t v6 = MEMORY[0x1E4FBC860];
  unint64_t v7 = v2;
  uint64_t v19 = v5;
  unint64_t v20 = v2;
  do
  {
    uint64_t v21 = v6;
    if (v4 <= v7) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = v4;
    }
    uint64_t v23 = -(uint64_t)v8;
    for (uint64_t i = (uint64_t *)(v5 + 32 * v4++); ; i += 4)
    {
      if (v23 + v4 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v11 = *(i - 3);
      uint64_t v10 = *(i - 2);
      uint64_t v13 = *(i - 1);
      uint64_t v12 = *i;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v14 = swift_bridgeObjectRetain();
      char v15 = sub_1C7B4D174(v14, v11, v10, v13, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      ++v4;
      if (v22 + v4 == 1) {
        return v21;
      }
    }
    uint64_t v6 = v21;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_1C7B4C964(0, *(void *)(v21 + 16) + 1, 1);
      uint64_t v6 = v21;
    }
    uint64_t v5 = v19;
    unint64_t v7 = v20;
    unint64_t v17 = *(void *)(v6 + 16);
    unint64_t v16 = *(void *)(v6 + 24);
    if (v17 >= v16 >> 1)
    {
      uint64_t result = sub_1C7B4C964(v16 > 1, v17 + 1, 1);
      uint64_t v5 = v19;
      unint64_t v7 = v20;
      uint64_t v6 = v21;
    }
    *(void *)(v6 + 16) = v17 + 1;
    int64_t v18 = (void *)(v6 + 32 * v17);
    v18[4] = v11;
    v18[5] = v10;
    v18[6] = v13;
    v18[7] = v12;
  }
  while (v22 + v4);
  return v6;
}

uint64_t sub_1C7B4D55C(unint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v36 = a1;
  uint64_t v6 = type metadata accessor for RecordMetadata(0);
  uint64_t v43 = *(void *)(v6 - 8);
  uint64_t v44 = v6;
  uint64_t result = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = 0;
  unint64_t v45 = a3;
  uint64_t v13 = a3[8];
  uint64_t v12 = a3 + 8;
  uint64_t v11 = v13;
  uint64_t v14 = 1 << *((unsigned char *)v12 - 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v11;
  uint64_t v40 = v12;
  int64_t v41 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v39 = a4;
  uint64_t v37 = 0;
  uint64_t v38 = (uint64_t *)(a4 + 56);
  uint64_t v42 = v9;
  while (1)
  {
    if (v16)
    {
      uint64_t v46 = (v16 - 1) & v16;
      int64_t v47 = v10;
      unint64_t v17 = __clz(__rbit64(v16)) | (v10 << 6);
      goto LABEL_21;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v18 >= v41) {
      return sub_1C7B74798(v36, v35, v37, v45);
    }
    unint64_t v19 = v40[v18];
    int64_t v20 = v10 + 1;
    if (!v19)
    {
      int64_t v20 = v10 + 2;
      if (v10 + 2 >= v41) {
        return sub_1C7B74798(v36, v35, v37, v45);
      }
      unint64_t v19 = v40[v20];
      if (!v19)
      {
        int64_t v20 = v10 + 3;
        if (v10 + 3 >= v41) {
          return sub_1C7B74798(v36, v35, v37, v45);
        }
        unint64_t v19 = v40[v20];
        if (!v19) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v46 = (v19 - 1) & v19;
    int64_t v47 = v20;
    unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
LABEL_21:
    uint64_t v22 = (uint64_t *)(v45[6] + 32 * v17);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    uint64_t v26 = v22[2];
    uint64_t v25 = v22[3];
    sub_1C7B4E270(v45[7] + *(void *)(v43 + 72) * v17, (uint64_t)v9);
    if (v9[*(int *)(v44 + 24)]) {
      goto LABEL_4;
    }
    uint64_t v27 = *(void *)(v39 + 16);
    if (v27)
    {
      uint64_t v28 = v38;
      while (1)
      {
        uint64_t v30 = *(v28 - 1);
        uint64_t v29 = *v28;
        BOOL v31 = *(v28 - 3) == v23 && *(v28 - 2) == v24;
        if (v31 || (sub_1C7B7B5E0() & 1) != 0)
        {
          BOOL v32 = v30 == v26 && v29 == v25;
          if (v32 || (sub_1C7B7B5E0() & 1) != 0) {
            break;
          }
        }
        v28 += 4;
        if (!--v27) {
          goto LABEL_36;
        }
      }
LABEL_4:
      uint64_t v9 = v42;
      uint64_t result = sub_1C7B4E2D4((uint64_t)v42);
      int64_t v10 = v47;
      unint64_t v16 = v46;
    }
    else
    {
LABEL_36:
      uint64_t v9 = v42;
      uint64_t result = sub_1C7B4E2D4((uint64_t)v42);
      *(unint64_t *)((char *)v36 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      BOOL v33 = __OFADD__(v37++, 1);
      int64_t v10 = v47;
      unint64_t v16 = v46;
      if (v33)
      {
        __break(1u);
        return sub_1C7B74798(v36, v35, v37, v45);
      }
    }
  }
  uint64_t v21 = v10 + 4;
  if (v10 + 4 >= v41) {
    return sub_1C7B74798(v36, v35, v37, v45);
  }
  unint64_t v19 = v40[v21];
  if (v19)
  {
    int64_t v20 = v10 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v20 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v20 >= v41) {
      return sub_1C7B74798(v36, v35, v37, v45);
    }
    unint64_t v19 = v40[v20];
    ++v21;
    if (v19) {
      goto LABEL_20;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C7B4D878(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C7B4D55C((void *)((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, (void *)a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1C7B4D55C((unint64_t *)v11, v7, (void *)a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x1C87BC480](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_1C7B4DA34(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a2;
  uint64_t v30 = a5;
  uint64_t v31 = a6;
  uint64_t v28 = a1;
  uint64_t v7 = type metadata accessor for RecordMetadata(0);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = 0;
  int64_t v11 = 0;
  uint64_t v37 = (void *)a3;
  uint64_t v12 = *(void *)(a3 + 64);
  uint64_t v32 = a3 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  int64_t v33 = (unint64_t)(v13 + 63) >> 6;
  while (v15)
  {
    unint64_t v16 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v17 = v16 | (v11 << 6);
LABEL_18:
    uint64_t v21 = (uint64_t *)(v37[6] + 32 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    uint64_t v25 = v21[3];
    sub_1C7B4E270(v37[7] + *(void *)(v34 + 72) * v17, (uint64_t)v10);
    if (v10[*(int *)(v35 + 24)] == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7B4E2D4((uint64_t)v10);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      v36[0] = v22;
      v36[1] = v23;
      v36[2] = v24;
      v36[3] = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v26 = sub_1C7B417F0(v36, v30, v31);
      sub_1C7B4E2D4((uint64_t)v10);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {
        *(unint64_t *)((char *)v28 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        BOOL v18 = __OFADD__(v29++, 1);
        if (v18) {
          goto LABEL_30;
        }
      }
    }
  }
  BOOL v18 = __OFADD__(v11++, 1);
  if (v18)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v11);
  if (v19)
  {
LABEL_17:
    unint64_t v15 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v11 << 6);
    goto LABEL_18;
  }
  int64_t v20 = v11 + 1;
  if (v11 + 1 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19) {
    goto LABEL_16;
  }
  int64_t v20 = v11 + 2;
  if (v11 + 2 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19) {
    goto LABEL_16;
  }
  int64_t v20 = v11 + 3;
  if (v11 + 3 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19)
  {
LABEL_16:
    int64_t v11 = v20;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v33) {
      return sub_1C7B74798(v28, v27, v29, v37);
    }
    unint64_t v19 = *(void *)(v32 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_17;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C7B4DD10(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a2;
  uint64_t v30 = a5;
  uint64_t v31 = a6;
  uint64_t v28 = a1;
  uint64_t v7 = type metadata accessor for RecordMetadata(0);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = 0;
  int64_t v11 = 0;
  uint64_t v37 = (void *)a3;
  uint64_t v12 = *(void *)(a3 + 64);
  uint64_t v32 = a3 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  int64_t v33 = (unint64_t)(v13 + 63) >> 6;
  while (v15)
  {
    unint64_t v16 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v17 = v16 | (v11 << 6);
LABEL_18:
    uint64_t v21 = (uint64_t *)(v37[6] + 32 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    uint64_t v25 = v21[3];
    sub_1C7B4E270(v37[7] + *(void *)(v34 + 72) * v17, (uint64_t)v10);
    if (v10[*(int *)(v35 + 24)] == 1)
    {
      v36[0] = v22;
      v36[1] = v23;
      v36[2] = v24;
      v36[3] = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v26 = sub_1C7B417F0(v36, v30, v31);
      sub_1C7B4E2D4((uint64_t)v10);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {
        *(unint64_t *)((char *)v28 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        BOOL v18 = __OFADD__(v29++, 1);
        if (v18) {
          goto LABEL_30;
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7B4E2D4((uint64_t)v10);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  BOOL v18 = __OFADD__(v11++, 1);
  if (v18)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v11);
  if (v19)
  {
LABEL_17:
    unint64_t v15 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v11 << 6);
    goto LABEL_18;
  }
  int64_t v20 = v11 + 1;
  if (v11 + 1 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19) {
    goto LABEL_16;
  }
  int64_t v20 = v11 + 2;
  if (v11 + 2 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19) {
    goto LABEL_16;
  }
  int64_t v20 = v11 + 3;
  if (v11 + 3 >= v33) {
    return sub_1C7B74798(v28, v27, v29, v37);
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19)
  {
LABEL_16:
    int64_t v11 = v20;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v33) {
      return sub_1C7B74798(v28, v27, v29, v37);
    }
    unint64_t v19 = *(void *)(v32 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_17;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C7B4DFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  v19[1] = *MEMORY[0x1E4F143B8];
  char v11 = *(unsigned char *)(a1 + 32);
  unsigned int v12 = v11 & 0x3F;
  unint64_t v13 = (unint64_t)((1 << v11) + 63) >> 6;
  size_t v14 = 8 * v13;
  swift_retain_n();
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v12 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    v19[0] = v19;
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v19 - ((v14 + 15) & 0x3FFFFFFFFFFFFFF0), v14);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v16 = a5((char *)v19 - ((v14 + 15) & 0x3FFFFFFFFFFFFFF0), v13, a1, a2, a3, a4);
    swift_release();
    swift_bridgeObjectRelease();
    if (v5) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    unint64_t v17 = (void *)swift_slowAlloc();
    bzero(v17, v14);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v16 = a5((char *)v17, v13, a1, a2, a3, a4);
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x1C87BC480](v17, -1, -1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v16;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1C7B4E270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C7B4E2D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C7B4E330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C7B4E394()
{
  unint64_t result = qword_1EBC5DC00;
  if (!qword_1EBC5DC00)
  {
    sub_1C7B7AFF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC5DC00);
  }
  return result;
}

uint64_t sub_1C7B4E3EC(uint64_t a1)
{
  return sub_1C7B47B70(a1) & 1;
}

uint64_t method lookup function for MetadataStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MetadataStore);
}

uint64_t dispatch thunk of MetadataStore.__allocating_init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_1C7B4E438(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C7B4E494(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1C7B4E4E8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C7B4E4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C7B4E558()
{
  return sub_1C7B7AF80() & 1;
}

uint64_t sub_1C7B4E5AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C7B4E608(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7B4E66C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7B4E6D0(uint64_t a1)
{
  return sub_1C7B4E3EC(a1) & 1;
}

uint64_t sub_1C7B4E6EC()
{
  return 1;
}

uint64_t sub_1C7B4E6F4()
{
  return sub_1C7B7B680();
}

uint64_t sub_1C7B4E738()
{
  return sub_1C7B7B660();
}

uint64_t sub_1C7B4E760()
{
  return sub_1C7B7B680();
}

id sub_1C7B4E7B0(char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v92 = a2;
  v98[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C7B7B160();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  size_t v8 = (uint64_t *)((char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v9 = *a1;
  uint64_t v10 = *((void *)a1 + 1);
  char v11 = (void *)*((void *)a1 + 2);
  uint64_t v12 = *((void *)a1 + 3);
  uint64_t v13 = *((void *)a1 + 4);
  size_t v14 = *(void **)(v3 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_queue);
  *size_t v8 = v14;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FBCBF0], v5);
  id v15 = v14;
  LOBYTE(v14) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v14 & 1) == 0)
  {
    __break(1u);
    swift_once();
    uint64_t v18 = sub_1C7B7B090();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EBC5DC50);
    id v19 = v11;
    id v20 = v11;
    uint64_t v21 = sub_1C7B7B080();
    os_log_type_t v22 = sub_1C7B7B2C0();
    if (!os_log_type_enabled(v21, v22))
    {
      swift_release();

      return v11;
    }
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v98[0] = v24;
    *(_DWORD *)uint64_t v23 = 136446210;
    *(void *)&long long v96 = v11;
    id v25 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9470);
    uint64_t v26 = sub_1C7B7B1F0();
    *(void *)&long long v96 = sub_1C7B47DE8(v26, v27, v98);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C7B37000, v21, v22, "Failed to encode message: %{public}s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v24, -1, -1);
    MEMORY[0x1C87BC480](v23, -1, -1);

LABEL_32:
    swift_release();
    return v11;
  }
  sub_1C7B7AF30();
  swift_allocObject();
  sub_1C7B7AF20();
  LOBYTE(v98[0]) = v9;
  v98[1] = v10;
  v98[2] = (uint64_t)v11;
  v98[3] = v12;
  v98[4] = v13;
  sub_1C7B53828();
  uint64_t v16 = sub_1C7B7AF10();
  unint64_t v93 = v17;
  uint64_t v28 = v16;
  *(void *)&long long v96 = 0x6567617373656DLL;
  *((void *)&v96 + 1) = 0xE700000000000000;
  unint64_t v29 = v17;
  sub_1C7B3AEC8(v16, v17);
  sub_1C7B7B410();
  uint64_t v97 = MEMORY[0x1E4F277C0];
  *(void *)&long long v96 = v28;
  *((void *)&v96 + 1) = v29;
  sub_1C7B4E4E8(&v96, v95);
  uint64_t v30 = MEMORY[0x1E4FBC868];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v94 = v30;
  sub_1C7B4ADEC(v95, (uint64_t)v98, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_1C7B4E494((uint64_t)v98);
  uint64_t v32 = *(void **)(v3 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService);
  id result = objc_msgSend(v32, sel_devices);
  if (result)
  {
    uint64_t v34 = result;
    sub_1C7B537EC(0, &qword_1EBC5DC90);
    unint64_t v35 = sub_1C7B7B260();

    uint64_t v36 = v92;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_1C7B52668(v35, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = sub_1C7B5284C((uint64_t)v37);
    swift_bridgeObjectRelease();
    if (*(void *)(v38 + 16))
    {
      uint64_t v91 = v28;
      uint64_t v39 = (void *)sub_1C7B7B190();
      swift_bridgeObjectRelease();
      sub_1C7B4F45C(v38);
      swift_bridgeObjectRelease();
      uint64_t v40 = (void *)sub_1C7B7B290();
      swift_bridgeObjectRelease();
      int64_t v41 = (void *)sub_1C7B7B190();
      v98[0] = 0;
      *(void *)&long long v96 = 0;
      unsigned int v42 = objc_msgSend(v32, sel_sendMessage_toDestinations_priority_options_identifier_error_, v39, v40, 300, v41, v98, &v96);

      uint64_t v43 = (void *)v98[0];
      if (!v42)
      {
        id v68 = (id)v96;
        id v69 = v43;
        char v11 = (void *)sub_1C7B7AF40();

        swift_willThrow();
        if (qword_1EBC5E820 != -1) {
          swift_once();
        }
        uint64_t v70 = sub_1C7B7B090();
        __swift_project_value_buffer(v70, (uint64_t)qword_1EBC5DC50);
        id v71 = v11;
        id v72 = v11;
        uint64_t v73 = sub_1C7B7B080();
        os_log_type_t v74 = sub_1C7B7B2C0();
        if (os_log_type_enabled(v73, v74))
        {
          unint64_t v75 = (uint8_t *)swift_slowAlloc();
          uint64_t v76 = swift_slowAlloc();
          v98[0] = v76;
          *(_DWORD *)unint64_t v75 = 136446210;
          *(void *)&long long v96 = v11;
          id v77 = v11;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9470);
          uint64_t v78 = sub_1C7B7B1F0();
          *(void *)&long long v96 = sub_1C7B47DE8(v78, v79, v98);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_1C7B37000, v73, v74, "Failed to send message: %{public}s", v75, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v76, -1, -1);
          MEMORY[0x1C87BC480](v75, -1, -1);
          sub_1C7B3AF20(v91, v93);

          swift_release();
        }
        else
        {
          sub_1C7B3AF20(v91, v93);
          swift_release();
        }
        return v11;
      }
      uint64_t v44 = qword_1EBC5E820;
      id v45 = (id)v96;
      if (v43)
      {
        id v46 = v43;
        if (v44 != -1) {
          swift_once();
        }
        uint64_t v47 = sub_1C7B7B090();
        __swift_project_value_buffer(v47, (uint64_t)qword_1EBC5DC50);
        swift_bridgeObjectRetain_n();
        id v48 = v46;
        uint64_t v49 = sub_1C7B7B080();
        os_log_type_t v50 = sub_1C7B7B2D0();
        int v51 = v50;
        char v90 = v49;
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v52 = swift_slowAlloc();
          uint64_t v53 = (void *)swift_slowAlloc();
          uint64_t v89 = swift_slowAlloc();
          v98[0] = v89;
          *(_DWORD *)uint64_t v52 = 138543618;
          int v88 = v51;
          *(void *)&long long v96 = v48;
          id v54 = v48;
          sub_1C7B7B3A0();
          *uint64_t v53 = v43;

          *(_WORD *)(v52 + 12) = 2082;
          swift_bridgeObjectRetain();
          uint64_t v55 = sub_1C7B7B2A0();
          unint64_t v57 = v56;
          swift_bridgeObjectRelease();
          *(void *)&long long v96 = sub_1C7B47DE8(v55, v57, v98);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          uint64_t v58 = v90;
          _os_log_impl(&dword_1C7B37000, v90, (os_log_type_t)v88, "Sent message %{public}@ to %{public}s", (uint8_t *)v52, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9480);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v53, -1, -1);
          uint64_t v59 = v89;
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v59, -1, -1);
          MEMORY[0x1C87BC480](v52, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        char v11 = (void *)sub_1C7B7B1E0();
        sub_1C7B3AF20(v91, v93);

        swift_release();
        return v11;
      }
      if (v44 != -1) {
        swift_once();
      }
      uint64_t v81 = sub_1C7B7B090();
      __swift_project_value_buffer(v81, (uint64_t)qword_1EBC5DC50);
      uint64_t v82 = sub_1C7B7B080();
      os_log_type_t v83 = sub_1C7B7B2C0();
      BOOL v84 = os_log_type_enabled(v82, v83);
      uint64_t v85 = v91;
      if (v84)
      {
        unint64_t v86 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v86 = 0;
        _os_log_impl(&dword_1C7B37000, v82, v83, "Failed to retrieve identifier for message", v86, 2u);
        MEMORY[0x1C87BC480](v86, -1, -1);
      }

      sub_1C7B5387C();
      char v11 = (void *)swift_allocError();
      uint64_t v80 = v85;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v60 = sub_1C7B7B090();
      __swift_project_value_buffer(v60, (uint64_t)qword_1EBC5DC50);
      swift_bridgeObjectRetain_n();
      uint64_t v61 = sub_1C7B7B080();
      os_log_type_t v62 = sub_1C7B7B2C0();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v91 = v28;
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        v98[0] = v64;
        *(_DWORD *)uint64_t v63 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_1C7B7B2A0();
        unint64_t v67 = v66;
        swift_bridgeObjectRelease();
        *(void *)&long long v96 = sub_1C7B47DE8(v65, v67, v98);
        sub_1C7B7B3A0();
        swift_bridgeObjectRelease_n();
        uint64_t v28 = v91;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C7B37000, v61, v62, "Unable to find matching IDS identifier for destinations: %{public}s", v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v64, -1, -1);
        MEMORY[0x1C87BC480](v63, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_1C7B5387C();
      char v11 = (void *)swift_allocError();
      uint64_t v80 = v28;
    }
    sub_1C7B3AF20(v80, v93);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C7B4F45C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9488);
    uint64_t v2 = sub_1C7B7B440();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC870];
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = v2 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t result = sub_1C7B7B3F0();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v2 + 48) + 40 * v11;
    *(_OWORD *)uint64_t v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(void *)(v12 + 32) = v26;
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_1C7B538D0();
    return v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1C7B4F750(uint64_t *a1@<X8>)
{
  id v45 = a1;
  uint64_t v2 = sub_1C7B7B090();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBC5E820 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBC5DC50);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    int64_t v7 = (char *)(id)v1;
    uint64_t v8 = sub_1C7B7B080();
    os_log_type_t v9 = sub_1C7B7B2D0();
    unint64_t v10 = 0x1EA4F9000uLL;
    unint64_t v11 = 0x1E653B000uLL;
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v47[0] = v44;
      *(_DWORD *)uint64_t v12 = 136446210;
      id v13 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService], sel_devices);
      if (!v13) {
        goto LABEL_38;
      }
      uint64_t v14 = v13;
      v43[1] = v12 + 4;
      uint64_t v15 = sub_1C7B537EC(0, &qword_1EBC5DC90);
      uint64_t v16 = sub_1C7B7B260();

      uint64_t v17 = MEMORY[0x1C87BBA80](v16, v15);
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      uint64_t v46 = sub_1C7B47DE8(v17, v19, v47);
      sub_1C7B7B3A0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v8, v9, "Finding active paired device in devices: %{public}s", v12, 0xCu);
      uint64_t v20 = v44;
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v20, -1, -1);
      MEMORY[0x1C87BC480](v12, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      unint64_t v11 = 0x1E653B000;
      unint64_t v10 = 0x1EA4F9000;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    id v21 = [*(id *)&v7[*(void *)(v10 + 968)] *(SEL *)(v11 + 2344)];
    if (!v21) {
      break;
    }
    BOOL v22 = v21;
    sub_1C7B537EC(0, &qword_1EBC5DC90);
    unint64_t v1 = sub_1C7B7B260();

    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_1C7B7B4E0();
      if (!v2)
      {
LABEL_36:
        swift_bridgeObjectRelease_n();
        unsigned int v42 = v45;
        *id v45 = 0;
        v42[1] = 0;
        *((_WORD *)v42 + 8) = 0;
        return;
      }
    }
    else
    {
      uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v2) {
        goto LABEL_36;
      }
    }
    uint64_t v3 = 4;
    uint64_t v5 = (char *)0x1E653B000;
    while (1)
    {
      id v23 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C87BBC80](v3 - 4, v1) : *(id *)(v1 + 8 * v3);
      long long v24 = v23;
      uint64_t v25 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v23, sel_isLocallyPaired) && objc_msgSend(v24, sel_isActive))
      {
        uint64_t v26 = (char *)objc_msgSend(v24, sel_deviceType);
        if ((unint64_t)(v26 - 2) < 3)
        {
          objc_msgSend(v24, sel_operatingSystemVersion);
          if (v47[0] >= 16) {
            goto LABEL_21;
          }
        }
        else if (v26 == (char *)6)
        {
          objc_msgSend(v24, sel_operatingSystemVersion);
          if (v47[0] >= 8)
          {
LABEL_21:
            swift_bridgeObjectRelease_n();
            id v27 = v24;
            id v28 = objc_msgSend(v27, sel_uniqueIDOverride);
            if (!v28) {
              goto LABEL_39;
            }
            unint64_t v29 = v28;
            uint64_t v30 = sub_1C7B7B1D0();
            uint64_t v32 = v31;

            id v33 = objc_msgSend(v27, sel_deviceType);
            if ((unint64_t)v33 >= 7) {
              unsigned __int8 v34 = 0;
            }
            else {
              unsigned __int8 v34 = 0x3000101010200uLL >> (8 * v33);
            }
            unint64_t v35 = (char *)objc_msgSend(v27, sel_deviceType);
            if ((unint64_t)(v35 - 2) >= 3)
            {
              if (v35 == (char *)6)
              {
                objc_msgSend(v27, sel_operatingSystemVersion);
                uint64_t v39 = v47[0];

                __int16 v37 = v34;
                if (v39 <= 7) {
                  goto LABEL_30;
                }
LABEL_27:
                __int16 v38 = 256;
              }
              else
              {

                __int16 v38 = 0;
                __int16 v37 = v34;
              }
            }
            else
            {
              objc_msgSend(v27, sel_operatingSystemVersion);
              uint64_t v36 = v47[0];

              __int16 v37 = v34;
              if (v36 >= 16) {
                goto LABEL_27;
              }
LABEL_30:
              __int16 v38 = 0;
            }
            __int16 v40 = v38 | v37;
            int64_t v41 = v45;
            *id v45 = v30;
            v41[1] = v32;
            *((_WORD *)v41 + 8) = v40;
            return;
          }
        }
      }

      ++v3;
      if (v25 == v2) {
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
  __break(1u);
LABEL_38:

  __break(1u);
LABEL_39:
  __break(1u);
}

id sub_1C7B4FD20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDSServiceWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C7B4FF68()
{
  sub_1C7B53710(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_1C7B4FFA0(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  char v9 = *a3;
  uint64_t v10 = *((void *)a3 + 1);
  uint64_t v11 = *((void *)a3 + 2);
  uint64_t v13 = *((void *)a3 + 3);
  uint64_t v12 = *((void *)a3 + 4);
  uint64_t result = MEMORY[0x1C87BC500](v5 + 16);
  if (result)
  {
    uint64_t v17 = a5;
    uint64_t v15 = *(void *)(v5 + 24);
    uint64_t ObjectType = swift_getObjectType();
    v19[0] = v9;
    uint64_t v20 = v10;
    uint64_t v21 = v11;
    uint64_t v22 = v13;
    uint64_t v23 = v12;
    (*(void (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(a1, a2, v19, a4, v17, ObjectType, v15);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C7B50060(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  char v9 = *a3;
  uint64_t v10 = *((void *)a3 + 1);
  uint64_t v11 = *((void *)a3 + 2);
  uint64_t v13 = *((void *)a3 + 3);
  uint64_t v12 = *((void *)a3 + 4);
  if (MEMORY[0x1C87BC500](v5 + 16))
  {
    uint64_t v18 = a5;
    uint64_t v14 = *(void *)(v5 + 24);
    uint64_t ObjectType = swift_getObjectType();
    v20[0] = v9;
    uint64_t v21 = v10;
    uint64_t v22 = v11;
    uint64_t v23 = v13;
    uint64_t v24 = v12;
    char v16 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(a1, a2, v20, a4, v18, ObjectType, v14);
    swift_unknownObjectRelease();
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t sub_1C7B50130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = MEMORY[0x1C87BC500](v5 + 16);
  if (result)
  {
    uint64_t v12 = *(void *)(v5 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24))(a1, a2, a3, a4, a5, ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C7B501F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  __int16 v8 = *((_WORD *)a3 + 8);
  uint64_t result = MEMORY[0x1C87BC500](v3 + 16);
  if (result)
  {
    uint64_t v10 = *(void *)(v3 + 24);
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v6;
    v12[1] = v7;
    __int16 v13 = v8;
    (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t))(v10 + 32))(a1, a2, v12, ObjectType, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

char *IDSSyncService.__allocating_init(service:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return IDSSyncService.init(service:)(a1, a2);
}

char *IDSSyncService.init(service:)(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v20 = sub_1C7B7B300();
  uint64_t v3 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  id v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C7B7B2E0();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_1C7B7B130();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v19 = OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue;
  v18[1] = sub_1C7B537EC(0, (unint64_t *)&qword_1EBC5E8C0);
  __int16 v8 = v2;
  sub_1C7B7B120();
  uint64_t v24 = MEMORY[0x1E4FBC860];
  sub_1C7B52384((unint64_t *)&qword_1EBC5E890, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC5E870);
  sub_1C7B523CC((unint64_t *)&unk_1EBC5E880, (uint64_t *)&unk_1EBC5E870);
  sub_1C7B7B3D0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC68], v20);
  char v9 = (void *)sub_1C7B7B330();
  *(void *)(v18[2] + v19) = v9;
  *(void *)&v8[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates] = MEMORY[0x1E4FBC860];
  uint64_t v10 = &v8[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice];
  *((_WORD *)v10 + 8) = 0;
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  *(_DWORD *)&v8[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken] = -1;
  id v11 = objc_allocWithZone((Class)type metadata accessor for IDSServiceWrapper());
  id v12 = v9;
  sub_1C7B52208(v21, v22, v12);
  uint64_t v14 = v13;

  *(void *)&v8[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper] = v14;
  uint64_t v15 = (objc_class *)type metadata accessor for IDSSyncService();
  v23.receiver = v8;
  v23.super_class = v15;
  char v16 = (char *)objc_msgSendSuper2(&v23, sel_init);
  *(void *)(*(void *)&v16[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper]
            + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate
            + 8) = &off_1F223ADC0;
  swift_unknownObjectWeakAssign();
  return v16;
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

uint64_t type metadata accessor for IDSServiceWrapper()
{
  return self;
}

id IDSSyncService.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  objc_super v2 = (int *)&v0[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken];
  swift_beginAccess();
  notify_cancel(*v2);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for IDSSyncService();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id IDSSyncService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void IDSSyncService.init()()
{
}

void sub_1C7B508BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 8);
  int v5 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 16);
  char v6 = *(unsigned char *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 17);
  __int16 v7 = *(_WORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 16);
  swift_bridgeObjectRetain();
  sub_1C7B4F750(&v37);
  uint64_t v8 = v37;
  uint64_t v9 = v38;
  __int16 v10 = v39;
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v33 = v8;
  uint64_t v11 = sub_1C7B7B090();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EBC5DC50);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v12 = sub_1C7B7B080();
  os_log_type_t type = sub_1C7B7B2D0();
  uint64_t v32 = v3;
  if (!os_log_type_enabled(v12, type))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    if (v4) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v19 = v33;
    if (!v9) {
      return;
    }
    goto LABEL_14;
  }
  char v30 = v6;
  uint64_t v13 = swift_slowAlloc();
  uint64_t v29 = swift_slowAlloc();
  v35[0] = v29;
  *(_DWORD *)uint64_t v13 = 136446466;
  uint64_t v37 = v3;
  uint64_t v38 = v4;
  __int16 v39 = v7;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EBC5E1F0);
  uint64_t v14 = sub_1C7B7B1F0();
  uint64_t v37 = sub_1C7B47DE8(v14, v15, v35);
  sub_1C7B7B3A0();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v13 + 12) = 2082;
  uint64_t v37 = v33;
  uint64_t v38 = v9;
  __int16 v39 = v10;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1C7B7B1F0();
  uint64_t v37 = sub_1C7B47DE8(v16, v17, v35);
  sub_1C7B7B3A0();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C7B37000, v12, type, "Updating paired device from %{public}s to %{public}s", (uint8_t *)v13, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v29, -1, -1);
  uint64_t v18 = v13;
  char v6 = v30;
  MEMORY[0x1C87BC480](v18, -1, -1);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v19 = v33;
  if (!v9 || (v32 != v33 || v4 != v9) && (sub_1C7B7B5E0() & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  if (v5 != v10 || ((v10 & 0x100) == 0) == (v6 & 1))
  {
LABEL_15:
    *(void *)uint64_t v2 = v19;
    *(void *)(v2 + 8) = v9;
    *(_WORD *)(v2 + 16) = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v20 = v1 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates;
    swift_beginAccess();
    uint64_t v21 = *(void *)(*(void *)v20 + 16);
    if (v21)
    {
      uint64_t v34 = v9;
      uint64_t v22 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
      uint64_t v23 = v19;
      uint64_t v24 = v1;
      __int16 v25 = v10;
      do
      {
        uint64_t v26 = *v22;
        uint64_t ObjectType = swift_getObjectType();
        v35[0] = v23;
        v35[1] = v34;
        __int16 v36 = v25;
        id v28 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t *, uint64_t, uint64_t))(v26 + 32);
        swift_unknownObjectRetain();
        v28(v24, &protocol witness table for IDSSyncService, v35, ObjectType, v26);
        swift_unknownObjectRelease();
        v22 += 2;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_1C7B50CB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1C7B50D84()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E4F79EA0], 0);

  id v3 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E4F79EB8], 0);

  id v4 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E4F79E88], 0);

  id v5 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E4F79E90], 0);

  sub_1C7B7B1D0();
  char v6 = *(NSObject **)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12[4] = sub_1C7B53D04;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  void v12[2] = sub_1C7B510F4;
  uint64_t v12[3] = &block_descriptor_59;
  uint64_t v8 = _Block_copy(v12);
  swift_release();
  uint64_t v9 = sub_1C7B7B200();
  swift_bridgeObjectRelease();
  __int16 v10 = (int *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken);
  swift_beginAccess();
  notify_register_dispatch((const char *)(v9 + 32), v10, v6, v8);
  swift_endAccess();
  _Block_release(v8);
  return swift_release();
}

void sub_1C7B50FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1C87BC500](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1C7B7B090();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EBC5DC50);
    char v6 = sub_1C7B7B080();
    os_log_type_t v7 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1C7B37000, v6, v7, "Paired watch updated, will check for pairing change", v8, 2u);
      MEMORY[0x1C87BC480](v8, -1, -1);
    }

    sub_1C7B508BC();
  }
}

uint64_t sub_1C7B510F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

Swift::Void __swiftcall IDSSyncService.resume()()
{
}

void sub_1C7B51170()
{
  uint64_t v1 = sub_1C7B7B160();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  id v4 = (uint64_t *)((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  *id v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    objc_msgSend(*(id *)(*(void *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper)+ OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService), sel_addDelegate_queue_, *(void *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper), *(void *)(*(void *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper)+ OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_queue));
    sub_1C7B50D84();
    sub_1C7B508BC();
  }
  else
  {
    __break(1u);
  }
}

uint64_t IDSSyncService.send(message:destinations:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v9 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  v14[1] = v9;
  uint64_t v15 = *(void *)(a1 + 32);
  sub_1C7B7B060();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v4;
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 40) = v11;
  *(void *)(v10 + 56) = *(void *)(a1 + 32);
  *(void *)(v10 + 64) = a2;
  *(void *)(v10 + 72) = a3;
  *(void *)(v10 + 80) = a4;
  id v12 = v4;
  sub_1C7B52424((uint64_t)v14);
  swift_bridgeObjectRetain();
  sub_1C7B52468(a3);
  sub_1C7B7B050();
  sub_1C7B7B040();
  return swift_release();
}

uint64_t sub_1C7B513D0(void (*a1)(void), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, void (*a6)(id, uint64_t, uint64_t))
{
  swift_retain();
  sub_1C7B52468((uint64_t)a6);
  id v10 = sub_1C7B4E7B0(a4, a5);
  uint64_t v12 = v11;
  uint64_t v14 = v13 & 1;
  if (a6)
  {
    swift_retain();
    a6(v10, v12, v14);
    sub_1C7B53CBC((uint64_t)a6);
  }
  a1();
  sub_1C7B53CAC(v10, v12, v14);
  sub_1C7B53CBC((uint64_t)a6);

  return swift_release();
}

uint64_t IDSSyncService.add(delegate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(NSObject **)&v2[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue];
  id v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1C7B524B8;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_1C7B524D4;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  void v12[2] = sub_1C7B51770;
  uint64_t v12[3] = &block_descriptor_12;
  uint64_t v8 = _Block_copy(v12);
  long long v9 = v2;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B51630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for IDSSyncService.WeakDelegate();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v5 + 24) = a3;
  swift_unknownObjectWeakAssign();
  id v6 = (void **)(a1 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates);
  swift_beginAccess();
  uint64_t v7 = *v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *id v6 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_1C7B51D20(0, v7[2] + 1, 1, v7);
    *id v6 = v7;
  }
  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = sub_1C7B51D20((void *)(v9 > 1), v10 + 1, 1, v7);
    *id v6 = v7;
  }
  v7[2] = v10 + 1;
  uint64_t v11 = &v7[2 * v10];
  uint64_t v11[4] = v5;
  v11[5] = &off_1F223ADD8;
  return swift_endAccess();
}

uint64_t sub_1C7B51748(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C7B51770(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1C7B517A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v9 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  v14[1] = v9;
  uint64_t v15 = *(void *)(a1 + 32);
  sub_1C7B7B060();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v4;
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 40) = v11;
  *(void *)(v10 + 56) = *(void *)(a1 + 32);
  *(void *)(v10 + 64) = a2;
  *(void *)(v10 + 72) = a3;
  *(void *)(v10 + 80) = a4;
  id v12 = v4;
  sub_1C7B52424((uint64_t)v14);
  swift_bridgeObjectRetain();
  sub_1C7B52468(a3);
  sub_1C7B7B050();
  sub_1C7B7B040();
  return swift_release();
}

uint64_t sub_1C7B518B8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1C7B7B160();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (uint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v11 = *a1;
  uint64_t v12 = *((void *)a1 + 1);
  uint64_t v13 = *((void *)a1 + 2);
  uint64_t v40 = *((void *)a1 + 3);
  uint64_t v41 = v12;
  uint64_t v38 = *((void *)a1 + 4);
  uint64_t v39 = v13;
  uint64_t v14 = *(void **)(v3 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  *uint64_t v10 = v14;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCBF0], v7);
  id v15 = v14;
  LOBYTE(v14) = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if (v14)
  {
    unint64_t v17 = (uint64_t *)(v3 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates);
    swift_beginAccess();
    uint64_t result = *v17;
    uint64_t v18 = *(void *)(*v17 + 16);
    if (v18)
    {
      uint64_t v36 = a3;
      uint64_t v37 = v3;
      uint64_t v35 = swift_bridgeObjectRetain();
      uint64_t v19 = (uint64_t *)(v35 + 40);
      uint64_t v21 = v40;
      uint64_t v20 = v41;
      uint64_t v23 = v38;
      uint64_t v22 = v39;
      do
      {
        uint64_t v42 = v18;
        uint64_t v24 = *v19;
        uint64_t ObjectType = swift_getObjectType();
        v43[0] = v11;
        uint64_t v44 = v20;
        uint64_t v45 = v22;
        uint64_t v46 = v21;
        uint64_t v47 = v23;
        uint64_t v26 = *(uint64_t (**)(uint64_t, _UNKNOWN **, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16);
        swift_unknownObjectRetain();
        uint64_t v27 = v37;
        uint64_t v28 = a2;
        uint64_t v29 = a2;
        uint64_t v30 = v36;
        if (v26(v37, &protocol witness table for IDSSyncService, v43, v28, v36, ObjectType, v24))
        {
          v43[0] = v11;
          uint64_t v23 = v38;
          uint64_t v22 = v39;
          uint64_t v44 = v41;
          uint64_t v45 = v39;
          uint64_t v46 = v40;
          uint64_t v47 = v38;
          (*(void (**)(uint64_t, _UNKNOWN **, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8))(v27, &protocol witness table for IDSSyncService, v43, v29, v30, ObjectType, v24);
          swift_unknownObjectRelease();
          a2 = v29;
          uint64_t v21 = v40;
          uint64_t v20 = v41;
        }
        else
        {
          if (qword_1EBC5E820 != -1) {
            swift_once();
          }
          uint64_t v31 = sub_1C7B7B090();
          __swift_project_value_buffer(v31, (uint64_t)qword_1EBC5DC50);
          uint64_t v32 = sub_1C7B7B080();
          os_log_type_t v33 = sub_1C7B7B2D0();
          a2 = v29;
          if (os_log_type_enabled(v32, v33))
          {
            uint64_t v34 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v34 = 0;
            _os_log_impl(&dword_1C7B37000, v32, v33, "Discarding message because delegate rejected it", v34, 2u);
            MEMORY[0x1C87BC480](v34, -1, -1);
            swift_unknownObjectRelease();
          }
          else
          {

            swift_unknownObjectRelease();
          }
          uint64_t v21 = v40;
          uint64_t v20 = v41;
          uint64_t v23 = v38;
          uint64_t v22 = v39;
        }
        v19 += 2;
        uint64_t v18 = v42 - 1;
      }
      while (v42 != 1);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_1C7B51C10(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9490);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_1C7B52574(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1C7B51D20(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E8D0);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_1C7B53950(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C7B51E30(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C7B51E78(a1, a2, a3, a4, (uint64_t *)&unk_1EA4F94A0, type metadata accessor for Record, type metadata accessor for Record);
}

uint64_t sub_1C7B51E54(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C7B51E78(a1, a2, a3, a4, (uint64_t *)&unk_1EA4F9780, type metadata accessor for RecordMetadata, type metadata accessor for RecordMetadata);
}

uint64_t sub_1C7B51E78(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_1C7B7B4C0();
    __break(1u);
    return result;
  }
  void v18[2] = v13;
  void v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C7B53B50(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_1C7B520F8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9380);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C7B53A5C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_1C7B52208(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v5 = objc_allocWithZone(MEMORY[0x1E4F6AB90]);
  unint64_t v6 = v3;
  uint64_t v7 = (void *)sub_1C7B7B1C0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_initWithService_, v7);

  if (v8)
  {
    *(void *)&v6[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService] = v8;
    *(void *)&v6[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_queue] = a3;
    id v9 = a3;

    v10.receiver = v6;
    v10.super_class = (Class)type metadata accessor for IDSServiceWrapper();
    objc_msgSendSuper2(&v10, sel_init);
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for IDSSyncService()
{
  return self;
}

uint64_t sub_1C7B52310()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C7B52348()
{
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

uint64_t sub_1C7B52384(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C7B523CC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C7B52424(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  unint64_t v3 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain();
  sub_1C7B3AEC8(v2, v3);
  return a1;
}

uint64_t sub_1C7B52468(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1C7B52478()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C7B524B8()
{
  return sub_1C7B51630(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C7B524C4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7B524D4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C7B524FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_1C7B52510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t method lookup function for IDSSyncService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IDSSyncService);
}

uint64_t dispatch thunk of IDSSyncService.__allocating_init(service:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t type metadata accessor for IDSSyncService.WeakDelegate()
{
  return self;
}

uint64_t sub_1C7B52574(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

void *sub_1C7B52668(unint64_t a1, uint64_t a2)
{
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_20:
    uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
LABEL_21:
    swift_bridgeObjectRelease();
    return v4;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1C7B7B4E0();
  if (!v3) {
    goto LABEL_20;
  }
LABEL_3:
  uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v5 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x1C87BBC80](v5 - 4, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v5);
    }
    uint64_t v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    uint64_t result = objc_msgSend(v6, sel_uniqueIDOverride);
    if (!result) {
      break;
    }
    objc_super v10 = result;
    uint64_t v11 = sub_1C7B7B1D0();
    uint64_t v13 = v12;

    LOBYTE(v10) = sub_1C7B45B8C(v11, v13, a2);
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0 && (uint64_t v14 = IDSCopyIDForDevice()) != 0)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = sub_1C7B7B1D0();
      uint64_t v18 = v17;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_1C7B51C10(0, v4[2] + 1, 1, v4);
      }
      unint64_t v20 = v4[2];
      unint64_t v19 = v4[3];
      if (v20 >= v19 >> 1) {
        uint64_t v4 = sub_1C7B51C10((void *)(v19 > 1), v20 + 1, 1, v4);
      }
      v4[2] = v20 + 1;
      uint64_t v21 = &v4[2 * v20];
      v21[4] = v16;
      v21[5] = v18;
    }
    else
    {
    }
    ++v5;
    if (v8 == v3) {
      goto LABEL_21;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C7B5284C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1C7B7B2B0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1C7B484C0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_1C7B528E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    __break(1u);
LABEL_44:
    __break(1u);
    return;
  }
  if (a4) {
    uint64_t v8 = (void *)sub_1C7B7B1C0();
  }
  else {
    uint64_t v8 = 0;
  }
  id v39 = objc_msgSend(a1, sel_deviceForFromID_, v8);

  if (v39)
  {
    id v9 = objc_msgSend(v39, sel_uniqueIDOverride);
    if (v9)
    {
      objc_super v10 = v9;
      uint64_t v11 = sub_1C7B7B1D0();
      uint64_t v13 = v12;

      if (MEMORY[0x1C87BC500](v4 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate))
      {
        if (a2)
        {
          sub_1C7B7B410();
          if (*(void *)(a2 + 16) && (unint64_t v14 = sub_1C7B4908C((uint64_t)&v40), (v15 & 1) != 0))
          {
            sub_1C7B4E4F8(*(void *)(a2 + 56) + 32 * v14, (uint64_t)&v44);
          }
          else
          {
            long long v44 = 0u;
            long long v45 = 0u;
          }
          sub_1C7B4E494((uint64_t)&v40);
          if (*((void *)&v45 + 1))
          {
            if (swift_dynamicCast())
            {
              sub_1C7B7AF00();
              swift_allocObject();
              sub_1C7B7AEF0();
              sub_1C7B53798();
              sub_1C7B7AEE0();
              uint64_t v37 = v42;
              unint64_t v38 = v43;
              sub_1C7B518B8((char *)&v40, v11, v13);
              swift_release();
              sub_1C7B3AF20(0x6567617373656DLL, 0xE700000000000000);
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();

              sub_1C7B3AF20(v37, v38);
              return;
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            sub_1C7B53738((uint64_t)&v44);
          }
          if (qword_1EBC5E820 != -1) {
            swift_once();
          }
          uint64_t v34 = sub_1C7B7B090();
          __swift_project_value_buffer(v34, (uint64_t)qword_1EBC5DC50);
          uint64_t v24 = sub_1C7B7B080();
          os_log_type_t v35 = sub_1C7B7B2C0();
          if (!os_log_type_enabled(v24, v35))
          {

            swift_unknownObjectRelease();
            goto LABEL_42;
          }
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v36 = 0;
          _os_log_impl(&dword_1C7B37000, v24, v35, "Message has no payload", v36, 2u);
          MEMORY[0x1C87BC480](v36, -1, -1);
          swift_unknownObjectRelease();
LABEL_40:

LABEL_42:
          return;
        }
        goto LABEL_44;
      }
      swift_bridgeObjectRelease();
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_1C7B7B090();
      __swift_project_value_buffer(v30, (uint64_t)qword_1EBC5DC50);
      uint64_t v31 = sub_1C7B7B080();
      os_log_type_t v32 = sub_1C7B7B2C0();
      if (os_log_type_enabled(v31, v32))
      {
        os_log_type_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v33 = 0;
        _os_log_impl(&dword_1C7B37000, v31, v32, "Delegate is not configured; ignoring incoming message", v33, 2u);
        MEMORY[0x1C87BC480](v33, -1, -1);
      }
    }
    else
    {
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_1C7B7B090();
      __swift_project_value_buffer(v23, (uint64_t)qword_1EBC5DC50);
      swift_bridgeObjectRetain_n();
      uint64_t v24 = sub_1C7B7B080();
      os_log_type_t v25 = sub_1C7B7B2C0();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        *(void *)&long long v44 = v27;
        *(_DWORD *)uint64_t v26 = 136446210;
        uint64_t v41 = a4;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9448);
        uint64_t v28 = sub_1C7B7B1F0();
        uint64_t v40 = sub_1C7B47DE8(v28, v29, (uint64_t *)&v44);
        sub_1C7B7B3A0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C7B37000, v24, v25, "Received message from device with no uniqueIDOverride: %{public}s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v27, -1, -1);
        MEMORY[0x1C87BC480](v26, -1, -1);
        goto LABEL_40;
      }

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C7B7B090();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EBC5DC50);
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_1C7B7B080();
    os_log_type_t v18 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(void *)&long long v44 = v20;
      *(_DWORD *)unint64_t v19 = 136446210;
      uint64_t v41 = a4;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9448);
      uint64_t v21 = sub_1C7B7B1F0();
      uint64_t v40 = sub_1C7B47DE8(v21, v22, (uint64_t *)&v44);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v17, v18, "Received message from unknown device: %{public}s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v20, -1, -1);
      MEMORY[0x1C87BC480](v19, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1C7B53110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1C7B7B160();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  objc_super v10 = (uint64_t *)((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)(v3 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  *objc_super v10 = v11;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCBF0], v7);
  id v12 = v11;
  LOBYTE(v11) = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if (v11)
  {
    unint64_t v14 = (uint64_t *)(v3 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates);
    swift_beginAccess();
    uint64_t result = *v14;
    uint64_t v15 = *(void *)(*v14 + 16);
    if (v15)
    {
      uint64_t v23 = swift_bridgeObjectRetain();
      uint64_t v24 = a1;
      uint64_t v16 = (uint64_t *)(v23 + 40);
      uint64_t v17 = a3;
      uint64_t v18 = a2;
      do
      {
        uint64_t v19 = *v16;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v21 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 24);
        swift_unknownObjectRetain();
        v21(v3, &protocol witness table for IDSSyncService, v24, v18, v17, ObjectType, v19);
        swift_unknownObjectRelease();
        v16 += 2;
        --v15;
      }
      while (v15);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C7B532EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MEMORY[0x1C87BC500](v3 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate))
  {
    if (a2)
    {
      sub_1C7B53110(a1, a2, a3);
      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1C7B7B090();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EBC5DC50);
    oslog = sub_1C7B7B080();
    os_log_type_t v8 = sub_1C7B7B2C0();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C7B37000, oslog, v8, "Delegate is not configured; ignoring successful message send", v9, 2u);
      MEMORY[0x1C87BC480](v9, -1, -1);
    }
  }
}

uint64_t sub_1C7B53450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C7B7B100();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C7B7B130();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(void *)&v3[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C7B50CB8;
  aBlock[3] = a3;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = v3;
  sub_1C7B7B110();
  v18[1] = MEMORY[0x1E4FBC860];
  sub_1C7B52384((unint64_t *)&unk_1EBC5E850, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC5DC80);
  sub_1C7B523CC((unint64_t *)&unk_1EBC5E860, (uint64_t *)&unk_1EBC5DC80);
  sub_1C7B7B3D0();
  MEMORY[0x1C87BBB30](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_1C7B536EC()
{
}

uint64_t sub_1C7B53710(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C7B53738(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C7B53798()
{
  unint64_t result = qword_1EA4F9458;
  if (!qword_1EA4F9458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9458);
  }
  return result;
}

uint64_t sub_1C7B537EC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1C7B53828()
{
  unint64_t result = qword_1EA4F9468;
  if (!qword_1EA4F9468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9468);
  }
  return result;
}

unint64_t sub_1C7B5387C()
{
  unint64_t result = qword_1EA4F9478;
  if (!qword_1EA4F9478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9478);
  }
  return result;
}

uint64_t sub_1C7B538D0()
{
  return swift_release();
}

uint64_t objectdestroy_2Tm()
{
  swift_bridgeObjectRelease();
  sub_1C7B3AF20(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1C7B5393C(void (*a1)(void), uint64_t a2)
{
  return sub_1C7B513D0(a1, a2, *(void *)(v2 + 16), (char *)(v2 + 24), *(void *)(v2 + 64), *(void (**)(id, uint64_t, uint64_t))(v2 + 72));
}

uint64_t sub_1C7B53950(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DCC8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

uint64_t sub_1C7B53A5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

uint64_t sub_1C7B53B50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

void sub_1C7B53CAC(void *a1, uint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C7B53CBC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1C7B53CCC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C7B53D04(uint64_t a1)
{
  sub_1C7B50FE0(a1, v1);
}

uint64_t getEnumTagSinglePayload for IDSServiceWrapper.SyncError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for IDSServiceWrapper.SyncError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C7B53DFCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C7B53E24()
{
  return 0;
}

ValueMetadata *type metadata accessor for IDSServiceWrapper.SyncError()
{
  return &type metadata for IDSServiceWrapper.SyncError;
}

unint64_t sub_1C7B53E40()
{
  unint64_t result = qword_1EA4F94B0;
  if (!qword_1EA4F94B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F94B0);
  }
  return result;
}

uint64_t SyncMessage.AckAction.description.getter()
{
  if (*v0) {
    return 0x6563616C706572;
  }
  else {
    return 0x657461647075;
  }
}

BOOL static SyncMessage.AckAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SyncMessage.AckAction.hash(into:)()
{
  return sub_1C7B7B660();
}

uint64_t sub_1C7B53F2C()
{
  if (*v0) {
    return 0x6563616C706572;
  }
  else {
    return 0x657461647075;
  }
}

uint64_t sub_1C7B53F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B57CA0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B53F8C(uint64_t a1)
{
  unint64_t v2 = sub_1C7B543B0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B53FC8(uint64_t a1)
{
  unint64_t v2 = sub_1C7B543B0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54004()
{
  return 0;
}

void sub_1C7B54010(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C7B5401C(uint64_t a1)
{
  unint64_t v2 = sub_1C7B54404();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54058(uint64_t a1)
{
  unint64_t v2 = sub_1C7B54404();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54094(uint64_t a1)
{
  unint64_t v2 = sub_1C7B54458();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B540D0(uint64_t a1)
{
  unint64_t v2 = sub_1C7B54458();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SyncMessage.AckAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F94C0);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F94C8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F94D0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B543B0();
  sub_1C7B7B6A0();
  unint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_1C7B54404();
    uint64_t v14 = v18;
    sub_1C7B7B590();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_1C7B54458();
    sub_1C7B7B590();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_1C7B543B0()
{
  unint64_t result = qword_1EA4F94D8;
  if (!qword_1EA4F94D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F94D8);
  }
  return result;
}

unint64_t sub_1C7B54404()
{
  unint64_t result = qword_1EA4F94E0;
  if (!qword_1EA4F94E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F94E0);
  }
  return result;
}

unint64_t sub_1C7B54458()
{
  unint64_t result = qword_1EA4F94E8;
  if (!qword_1EA4F94E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F94E8);
  }
  return result;
}

uint64_t SyncMessage.AckAction.hashValue.getter()
{
  return sub_1C7B7B680();
}

uint64_t SyncMessage.AckAction.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F94F0);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F94F8);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9500);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B543B0();
  uint64_t v11 = v32;
  sub_1C7B7B690();
  if (v11) {
    goto LABEL_6;
  }
  os_log_type_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_1C7B7B580();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_1C7B7B490();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9508);
    *char v22 = &type metadata for SyncMessage.AckAction;
    sub_1C7B7B540();
    sub_1C7B7B480();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x1E4FBBA70], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_1C7B54404();
    uint64_t v18 = v14;
    sub_1C7B7B530();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_1C7B54458();
    sub_1C7B7B530();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_1C7B5494C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SyncMessage.AckAction.init(from:)(a1, a2);
}

uint64_t sub_1C7B54964(void *a1)
{
  return SyncMessage.AckAction.encode(to:)(a1);
}

uint64_t sub_1C7B5497C()
{
  if (*v0) {
    return 0x617461646174656DLL;
  }
  else {
    return 0x6E6F69746361;
  }
}

uint64_t sub_1C7B549B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B57D8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B549DC(uint64_t a1)
{
  unint64_t v2 = sub_1C7B55780();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54A18(uint64_t a1)
{
  unint64_t v2 = sub_1C7B55780();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54A54()
{
  uint64_t result = 0x657461647075;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6563616C706572;
      break;
    case 2:
      uint64_t result = 7037793;
      break;
    case 3:
      uint64_t result = 0x6B636F6C6E75;
      break;
    case 4:
      uint64_t result = 0x636E79736572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C7B54AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B57E78(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C7B54B0C(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1C7B54B18(uint64_t a1)
{
  unint64_t v2 = sub_1C7B55684();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54B54(uint64_t a1)
{
  unint64_t v2 = sub_1C7B55684();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54B90(uint64_t a1)
{
  unint64_t v2 = sub_1C7B55828();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54BCC(uint64_t a1)
{
  unint64_t v2 = sub_1C7B55828();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54C08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1C7B54C38(uint64_t a1)
{
  unint64_t v2 = sub_1C7B556D8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54C74(uint64_t a1)
{
  unint64_t v2 = sub_1C7B556D8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54CB0(uint64_t a1)
{
  unint64_t v2 = sub_1C7B5572C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54CEC(uint64_t a1)
{
  unint64_t v2 = sub_1C7B5572C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C7B54D28()
{
  if (*v0) {
    return 0x4D646574656C6564;
  }
  else {
    return 0x6465696669646F6DLL;
  }
}

uint64_t sub_1C7B54D7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C7B58070(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C7B54DA4(uint64_t a1)
{
  unint64_t v2 = sub_1C7B5587C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B54DE0(uint64_t a1)
{
  unint64_t v2 = sub_1C7B5587C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SyncMessage.MessageType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9510);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x1F4188790](v3);
  os_log_type_t v35 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9518);
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  MEMORY[0x1F4188790](v5);
  os_log_type_t v32 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9520);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  MEMORY[0x1F4188790](v7);
  unint64_t v43 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9528);
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v42 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v40 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9530);
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9538);
  uint64_t v48 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  char v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *v1;
  uint64_t v46 = v1[1];
  uint64_t v18 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B55684();
  sub_1C7B7B6A0();
  switch(v18)
  {
    case 1:
      LOBYTE(v49) = 1;
      sub_1C7B55828();
      char v22 = v40;
      sub_1C7B7B590();
      uint64_t v49 = v17;
      char v50 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9580);
      sub_1C7B56640(&qword_1EA4F9588, &qword_1EA4F9590);
      uint64_t v23 = v42;
      uint64_t v24 = v47;
      sub_1C7B7B5C0();
      if (!v24)
      {
        uint64_t v49 = v46;
        char v50 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9568);
        sub_1C7B565AC(&qword_1EA4F9570, &qword_1EA4F92B0);
        sub_1C7B7B5C0();
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v23);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v16, v14);
      break;
    case 2:
      LOBYTE(v49) = 2;
      sub_1C7B55780();
      uint64_t v25 = v43;
      sub_1C7B7B590();
      LOBYTE(v49) = v17 & 1;
      char v50 = 0;
      sub_1C7B557D4();
      uint64_t v26 = v45;
      uint64_t v27 = v47;
      sub_1C7B7B5C0();
      if (!v27)
      {
        uint64_t v49 = v46;
        char v50 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9568);
        sub_1C7B565AC(&qword_1EA4F9570, &qword_1EA4F92B0);
        sub_1C7B7B5C0();
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v26);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v16, v14);
      break;
    case 3:
      uint64_t v28 = (uint64_t (**)(char *, uint64_t))(v48 + 8);
      if (v17 | v46)
      {
        LOBYTE(v49) = 4;
        sub_1C7B556D8();
        uint64_t v29 = v35;
        sub_1C7B7B590();
        uint64_t v31 = v36;
        uint64_t v30 = v37;
      }
      else
      {
        LOBYTE(v49) = 3;
        sub_1C7B5572C();
        uint64_t v29 = v32;
        sub_1C7B7B590();
        uint64_t v31 = v33;
        uint64_t v30 = v34;
      }
      (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v30);
      uint64_t result = (*v28)(v16, v14);
      break;
    default:
      LOBYTE(v49) = 0;
      sub_1C7B5587C();
      sub_1C7B7B590();
      uint64_t v49 = v17;
      char v50 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9580);
      sub_1C7B56640(&qword_1EA4F9588, &qword_1EA4F9590);
      uint64_t v19 = v39;
      uint64_t v20 = v47;
      sub_1C7B7B5C0();
      if (!v20)
      {
        uint64_t v49 = v46;
        char v50 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9568);
        sub_1C7B565AC(&qword_1EA4F9570, &qword_1EA4F92B0);
        sub_1C7B7B5C0();
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v19);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v16, v14);
      break;
  }
  return result;
}

unint64_t sub_1C7B55684()
{
  unint64_t result = qword_1EA4F9540;
  if (!qword_1EA4F9540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9540);
  }
  return result;
}

unint64_t sub_1C7B556D8()
{
  unint64_t result = qword_1EA4F9548;
  if (!qword_1EA4F9548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9548);
  }
  return result;
}

unint64_t sub_1C7B5572C()
{
  unint64_t result = qword_1EA4F9550;
  if (!qword_1EA4F9550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9550);
  }
  return result;
}

unint64_t sub_1C7B55780()
{
  unint64_t result = qword_1EA4F9558;
  if (!qword_1EA4F9558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9558);
  }
  return result;
}

unint64_t sub_1C7B557D4()
{
  unint64_t result = qword_1EA4F9560;
  if (!qword_1EA4F9560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9560);
  }
  return result;
}

unint64_t sub_1C7B55828()
{
  unint64_t result = qword_1EA4F9578;
  if (!qword_1EA4F9578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9578);
  }
  return result;
}

unint64_t sub_1C7B5587C()
{
  unint64_t result = qword_1EA4F9598;
  if (!qword_1EA4F9598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9598);
  }
  return result;
}

uint64_t SyncMessage.MessageType.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95A0);
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v61 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95A8);
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v58 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95B0);
  uint64_t v55 = *(void *)(v60 - 8);
  MEMORY[0x1F4188790](v60);
  uint64_t v59 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95B8);
  uint64_t v56 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95C0);
  uint64_t v54 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95C8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  os_log_type_t v62 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_1C7B55684();
  uint64_t v17 = v63;
  sub_1C7B7B690();
  if (v17) {
    goto LABEL_16;
  }
  uint64_t v47 = v9;
  uint64_t v48 = 0;
  uint64_t v18 = v60;
  uint64_t v19 = v61;
  uint64_t v63 = v13;
  uint64_t v20 = sub_1C7B7B580();
  if (*(void *)(v20 + 16) != 1)
  {
    uint64_t v23 = v15;
    uint64_t v24 = sub_1C7B7B490();
    swift_allocError();
    uint64_t v25 = v12;
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9508);
    *uint64_t v27 = &type metadata for SyncMessage.MessageType;
    sub_1C7B7B540();
    sub_1C7B7B480();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v27, *MEMORY[0x1E4FBBA70], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v23, v25);
LABEL_16:
    uint64_t v44 = (uint64_t)v62;
    return __swift_destroy_boxed_opaque_existential_1(v44);
  }
  switch(*(unsigned char *)(v20 + 32))
  {
    case 1:
      LOBYTE(v66) = 1;
      sub_1C7B55828();
      uint64_t v28 = v8;
      uint64_t v29 = v48;
      sub_1C7B7B530();
      if (v29) {
        goto LABEL_15;
      }
      uint64_t v30 = v12;
      uint64_t v31 = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9580);
      LOBYTE(v64) = 0;
      sub_1C7B56640(&qword_1EA4F95E0, &qword_1EA4F95E8);
      uint64_t v32 = v52;
      sub_1C7B7B570();
      uint64_t v38 = v66;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9568);
      char v65 = 1;
      sub_1C7B565AC(&qword_1EA4F95D8, &qword_1EA4F92C0);
      sub_1C7B7B570();
      uint64_t v39 = v63;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v28, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v30);
      uint64_t v43 = v64;
      char v42 = 1;
      uint64_t v44 = (uint64_t)v62;
      uint64_t v45 = v57;
      goto LABEL_20;
    case 2:
      LOBYTE(v66) = 2;
      sub_1C7B55780();
      uint64_t v33 = v48;
      sub_1C7B7B530();
      if (!v33)
      {
        LOBYTE(v66) = 0;
        sub_1C7B56558();
        sub_1C7B7B570();
        uint64_t v61 = (char *)v12;
        uint64_t v40 = v64;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9568);
        char v65 = 1;
        sub_1C7B565AC(&qword_1EA4F95D8, &qword_1EA4F92C0);
        sub_1C7B7B570();
        uint64_t v41 = v63;
        (*(void (**)(void, uint64_t))(v55 + 8))(0, v18);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *))(v41 + 8))(v15, v61);
        uint64_t v43 = v66;
        char v42 = 2;
        uint64_t v44 = (uint64_t)v62;
        uint64_t v45 = v57;
        uint64_t v38 = v40;
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v12);
      uint64_t v44 = (uint64_t)v62;
      return __swift_destroy_boxed_opaque_existential_1(v44);
    case 3:
      LOBYTE(v66) = 3;
      sub_1C7B5572C();
      uint64_t v34 = v58;
      uint64_t v35 = v48;
      sub_1C7B7B530();
      if (v35) {
        goto LABEL_15;
      }
      (*(void (**)(char *, uint64_t))(v49 + 8))(v34, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v12);
      uint64_t v38 = 0;
      uint64_t v43 = 0;
      char v42 = 3;
      goto LABEL_19;
    case 4:
      LOBYTE(v66) = 4;
      sub_1C7B556D8();
      uint64_t v36 = v48;
      sub_1C7B7B530();
      if (v36) {
        goto LABEL_15;
      }
      (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v53);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v12);
      uint64_t v43 = 0;
      char v42 = 3;
      uint64_t v38 = 1;
LABEL_19:
      uint64_t v44 = (uint64_t)v62;
      uint64_t v45 = v57;
      goto LABEL_20;
    default:
      LOBYTE(v66) = 0;
      sub_1C7B5587C();
      uint64_t v21 = v48;
      sub_1C7B7B530();
      if (v21)
      {
LABEL_15:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v12);
        goto LABEL_16;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9580);
      LOBYTE(v64) = 0;
      sub_1C7B56640(&qword_1EA4F95E0, &qword_1EA4F95E8);
      uint64_t v22 = v47;
      sub_1C7B7B570();
      uint64_t v38 = v66;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9568);
      char v65 = 1;
      sub_1C7B565AC(&qword_1EA4F95D8, &qword_1EA4F92C0);
      sub_1C7B7B570();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v22);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v12);
      char v42 = 0;
      uint64_t v43 = v64;
      uint64_t v44 = (uint64_t)v62;
      uint64_t v45 = v57;
LABEL_20:
      *(void *)uint64_t v45 = v38;
      *(void *)(v45 + 8) = v43;
      *(unsigned char *)(v45 + 16) = v42;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v44);
}

unint64_t sub_1C7B56558()
{
  unint64_t result = qword_1EA4F95D0;
  if (!qword_1EA4F95D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F95D0);
  }
  return result;
}

uint64_t sub_1C7B565AC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA4F9568);
    sub_1C7B566D4(a2, (void (*)(uint64_t))type metadata accessor for RecordMetadata);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C7B56640(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA4F9580);
    sub_1C7B566D4(a2, (void (*)(uint64_t))type metadata accessor for Record);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C7B566D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C7B5671C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMessage.MessageType.init(from:)(a1, a2);
}

uint64_t sub_1C7B56734(void *a1)
{
  return SyncMessage.MessageType.encode(to:)(a1);
}

uint64_t SyncMessage.messageType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_1C7B56760(v2, v3, v4);
}

uint64_t sub_1C7B56760(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

__n128 SyncMessage.init(messageType:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2 = a1[1].n128_u8[0];
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  return result;
}

uint64_t sub_1C7B567CC()
{
  return 0x546567617373656DLL;
}

uint64_t sub_1C7B567EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1C7B7B5E0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C7B5689C(uint64_t a1)
{
  unint64_t v2 = sub_1C7B56A70();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C7B568D8(uint64_t a1)
{
  unint64_t v2 = sub_1C7B56A70();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SyncMessage.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F95F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  HIDWORD(v10) = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B56A70();
  sub_1C7B7B6A0();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  char v13 = BYTE4(v10);
  sub_1C7B56AC4();
  sub_1C7B7B5C0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1C7B56A70()
{
  unint64_t result = qword_1EA4F95F8;
  if (!qword_1EA4F95F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F95F8);
  }
  return result;
}

unint64_t sub_1C7B56AC4()
{
  unint64_t result = qword_1EA4F9600;
  if (!qword_1EA4F9600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9600);
  }
  return result;
}

uint64_t SyncMessage.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9608);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C7B56A70();
  sub_1C7B7B690();
  if (!v2)
  {
    sub_1C7B56C8C();
    sub_1C7B7B570();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v9 = v12;
    *(_OWORD *)a2 = v11;
    *(unsigned char *)(a2 + 16) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1C7B56C8C()
{
  unint64_t result = qword_1EA4F9610;
  if (!qword_1EA4F9610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9610);
  }
  return result;
}

unint64_t sub_1C7B56CE4()
{
  unint64_t result = qword_1EA4F9618;
  if (!qword_1EA4F9618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9618);
  }
  return result;
}

uint64_t sub_1C7B56D38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMessage.init(from:)(a1, a2);
}

uint64_t sub_1C7B56D50(void *a1)
{
  return SyncMessage.encode(to:)(a1);
}

uint64_t sub_1C7B56D6C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage()
{
  return &type metadata for SyncMessage;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction()
{
  return &type metadata for SyncMessage.AckAction;
}

uint64_t destroy for SyncMessage.MessageType(uint64_t a1)
{
  return sub_1C7B56D6C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1C7B56760(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1C7B56760(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1C7B56D6C(v6, v7, v8);
  return a1;
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1C7B56D6C(v4, v5, v6);
  return a1;
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1C7B56F94(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1C7B56FAC(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType()
{
  return &type metadata for SyncMessage.MessageType;
}

unsigned char *storeEnumTagSinglePayload for SyncMessage.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1C7B57070);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage.CodingKeys()
{
  return &type metadata for SyncMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SyncMessage.MessageType.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SyncMessage.MessageType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x1C7B57204);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.CodingKeys()
{
  return &type metadata for SyncMessage.MessageType.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.UpdateCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.UpdateCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.ReplaceCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.ReplaceCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.AckCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.AckCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.UnlockCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.UnlockCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.ResyncCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.ResyncCodingKeys;
}

unsigned char *_s17SessionSyncEngine11SyncMessageV9AckActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7B57358);
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

ValueMetadata *type metadata accessor for SyncMessage.AckAction.CodingKeys()
{
  return &type metadata for SyncMessage.AckAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction.UpdateCodingKeys()
{
  return &type metadata for SyncMessage.AckAction.UpdateCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction.ReplaceCodingKeys()
{
  return &type metadata for SyncMessage.AckAction.ReplaceCodingKeys;
}

unint64_t sub_1C7B573B4()
{
  unint64_t result = qword_1EA4F9620;
  if (!qword_1EA4F9620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9620);
  }
  return result;
}

unint64_t sub_1C7B5740C()
{
  unint64_t result = qword_1EA4F9628;
  if (!qword_1EA4F9628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9628);
  }
  return result;
}

unint64_t sub_1C7B57464()
{
  unint64_t result = qword_1EA4F9630;
  if (!qword_1EA4F9630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9630);
  }
  return result;
}

unint64_t sub_1C7B574BC()
{
  unint64_t result = qword_1EA4F9638;
  if (!qword_1EA4F9638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9638);
  }
  return result;
}

unint64_t sub_1C7B57514()
{
  unint64_t result = qword_1EA4F9640;
  if (!qword_1EA4F9640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9640);
  }
  return result;
}

unint64_t sub_1C7B5756C()
{
  unint64_t result = qword_1EA4F9648;
  if (!qword_1EA4F9648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9648);
  }
  return result;
}

unint64_t sub_1C7B575C4()
{
  unint64_t result = qword_1EA4F9650;
  if (!qword_1EA4F9650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9650);
  }
  return result;
}

unint64_t sub_1C7B5761C()
{
  unint64_t result = qword_1EA4F9658;
  if (!qword_1EA4F9658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9658);
  }
  return result;
}

unint64_t sub_1C7B57674()
{
  unint64_t result = qword_1EA4F9660;
  if (!qword_1EA4F9660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9660);
  }
  return result;
}

unint64_t sub_1C7B576CC()
{
  unint64_t result = qword_1EA4F9668;
  if (!qword_1EA4F9668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9668);
  }
  return result;
}

unint64_t sub_1C7B57724()
{
  unint64_t result = qword_1EA4F9670;
  if (!qword_1EA4F9670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9670);
  }
  return result;
}

unint64_t sub_1C7B5777C()
{
  unint64_t result = qword_1EA4F9678;
  if (!qword_1EA4F9678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9678);
  }
  return result;
}

unint64_t sub_1C7B577D4()
{
  unint64_t result = qword_1EA4F9680;
  if (!qword_1EA4F9680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9680);
  }
  return result;
}

unint64_t sub_1C7B5782C()
{
  unint64_t result = qword_1EA4F9688;
  if (!qword_1EA4F9688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9688);
  }
  return result;
}

unint64_t sub_1C7B57884()
{
  unint64_t result = qword_1EA4F9690;
  if (!qword_1EA4F9690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9690);
  }
  return result;
}

unint64_t sub_1C7B578DC()
{
  unint64_t result = qword_1EA4F9698;
  if (!qword_1EA4F9698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9698);
  }
  return result;
}

unint64_t sub_1C7B57934()
{
  unint64_t result = qword_1EA4F96A0;
  if (!qword_1EA4F96A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96A0);
  }
  return result;
}

unint64_t sub_1C7B5798C()
{
  unint64_t result = qword_1EA4F96A8;
  if (!qword_1EA4F96A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96A8);
  }
  return result;
}

unint64_t sub_1C7B579E4()
{
  unint64_t result = qword_1EA4F96B0;
  if (!qword_1EA4F96B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96B0);
  }
  return result;
}

unint64_t sub_1C7B57A3C()
{
  unint64_t result = qword_1EA4F96B8;
  if (!qword_1EA4F96B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96B8);
  }
  return result;
}

unint64_t sub_1C7B57A94()
{
  unint64_t result = qword_1EA4F96C0;
  if (!qword_1EA4F96C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96C0);
  }
  return result;
}

unint64_t sub_1C7B57AEC()
{
  unint64_t result = qword_1EA4F96C8;
  if (!qword_1EA4F96C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96C8);
  }
  return result;
}

unint64_t sub_1C7B57B44()
{
  unint64_t result = qword_1EA4F96D0;
  if (!qword_1EA4F96D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96D0);
  }
  return result;
}

unint64_t sub_1C7B57B9C()
{
  unint64_t result = qword_1EA4F96D8;
  if (!qword_1EA4F96D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96D8);
  }
  return result;
}

unint64_t sub_1C7B57BF4()
{
  unint64_t result = qword_1EA4F96E0;
  if (!qword_1EA4F96E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96E0);
  }
  return result;
}

unint64_t sub_1C7B57C4C()
{
  unint64_t result = qword_1EA4F96E8;
  if (!qword_1EA4F96E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F96E8);
  }
  return result;
}

uint64_t sub_1C7B57CA0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x657461647075 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563616C706572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C7B57D8C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C7B57E78(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x657461647075 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563616C706572 && a2 == 0xE700000000000000 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7037793 && a2 == 0xE300000000000000 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B636F6C6E75 && a2 == 0xE600000000000000 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x636E79736572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1C7B58070(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465696669646F6DLL && a2 == 0xEF7364726F636552;
  if (v2 || (sub_1C7B7B5E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4D646574656C6564 && a2 == 0xEF61746164617465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C7B7B5E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void sub_1C7B581C0()
{
  uint64_t v1 = v0;
  uint64_t v9 = sub_1C7B7B300();
  uint64_t v2 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  unsigned int v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C7B7B2E0();
  MEMORY[0x1F4188790]();
  sub_1C7B7B130();
  MEMORY[0x1F4188790]();
  sub_1C7B5889C();
  sub_1C7B7B120();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1C7B588DC();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC5E870);
  sub_1C7B58934((unint64_t *)&unk_1EBC5E880, (uint64_t *)&unk_1EBC5E870);
  sub_1C7B7B3D0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCC68], v9);
  *(void *)(v0 + 16) = sub_1C7B7B330();
  LOBYTE(aBlock[0]) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC5DC70);
  swift_allocObject();
  *(void *)(v0 + 24) = sub_1C7B7B0B0();
  *(unsigned char *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 32) = MKBDeviceUnlockedSinceBoot() == 1;
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_1C7B589B0;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C7B58710;
  aBlock[3] = &block_descriptor_0;
  char v6 = _Block_copy(aBlock);
  swift_release();
  uint64_t v7 = MKBEventsRegister();
  _Block_release(v6);
  if (v7) {
    *(void *)(v1 + 40) = v7;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_1C7B584E4()
{
  MKBEventsUnregister();

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t _s14descr1F223A629O9IOSKeybagCMa()
{
  return self;
}

uint64_t sub_1C7B58550(int a1)
{
  uint64_t v2 = sub_1C7B7B160();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void **)(result + 16);
    *uint64_t v5 = v8;
    uint64_t v9 = *MEMORY[0x1E4FBCBF0];
    uint64_t v10 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 104);
    v10(v5, v9, v2);
    id v11 = v8;
    LOBYTE(v8) = sub_1C7B7B180();
    char v12 = *(uint64_t (**)(void *, uint64_t))(v3 + 8);
    uint64_t result = v12(v5, v2);
    if (v8)
    {
      if (a1) {
        return swift_release();
      }
      char v13 = *(void **)(v7 + 16);
      *uint64_t v5 = v13;
      v10(v5, v9, v2);
      id v14 = v13;
      LOBYTE(v13) = sub_1C7B7B180();
      uint64_t result = v12(v5, v2);
      if (v13)
      {
        *(unsigned char *)(v7 + 32) = 1;
        v15[7] = 1;
        sub_1C7B7B0A0();
        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1C7B58710(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

BOOL sub_1C7B58788()
{
  return MKBGetDeviceLockState() - 1 < 2;
}

uint64_t sub_1C7B587B0()
{
  sub_1C7B7B310();
  return v1;
}

uint64_t sub_1C7B58810()
{
  return sub_1C7B7B0C0();
}

void sub_1C7B58890(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

unint64_t sub_1C7B5889C()
{
  unint64_t result = qword_1EBC5E8C0;
  if (!qword_1EBC5E8C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBC5E8C0);
  }
  return result;
}

unint64_t sub_1C7B588DC()
{
  unint64_t result = qword_1EBC5E890;
  if (!qword_1EBC5E890)
  {
    sub_1C7B7B2E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC5E890);
  }
  return result;
}

uint64_t sub_1C7B58934(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C7B58978()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C7B589B0(int a1)
{
  return sub_1C7B58550(a1);
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

uint64_t sub_1C7B589D0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    id v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1C7B484C0(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C7B58B50(uint64_t a1, uint64_t a2)
{
  uint64_t v73 = type metadata accessor for RecordMetadata(0);
  uint64_t v64 = *(void *)(v73 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v73);
  uint64_t v6 = (char **)((char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v60 = (char *)&v60 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  id v72 = (char **)((char *)&v60 - v10);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (uint64_t)&v60 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v63 = (uint64_t)&v60 - v14;
  int64_t v15 = 0;
  uint64_t v65 = a1;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v61 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  int64_t v62 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      uint64_t v67 = (v19 - 1) & v19;
      int64_t v68 = v15;
      unint64_t v20 = __clz(__rbit64(v19)) | (v15 << 6);
    }
    else
    {
      int64_t v21 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_66;
      }
      if (v21 >= v62)
      {
LABEL_64:
        swift_release();
        return a2;
      }
      unint64_t v22 = *(void *)(v61 + 8 * v21);
      int64_t v23 = v15 + 1;
      if (!v22)
      {
        int64_t v23 = v15 + 2;
        if (v15 + 2 >= v62) {
          goto LABEL_64;
        }
        unint64_t v22 = *(void *)(v61 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v15 + 3;
          if (v15 + 3 >= v62) {
            goto LABEL_64;
          }
          unint64_t v22 = *(void *)(v61 + 8 * v23);
          if (!v22)
          {
            int64_t v23 = v15 + 4;
            if (v15 + 4 >= v62) {
              goto LABEL_64;
            }
            unint64_t v22 = *(void *)(v61 + 8 * v23);
            if (!v22)
            {
              uint64_t v24 = v15 + 5;
              if (v15 + 5 >= v62) {
                goto LABEL_64;
              }
              unint64_t v22 = *(void *)(v61 + 8 * v24);
              if (!v22)
              {
                while (1)
                {
                  int64_t v23 = v24 + 1;
                  if (__OFADD__(v24, 1)) {
                    break;
                  }
                  if (v23 >= v62) {
                    goto LABEL_64;
                  }
                  unint64_t v22 = *(void *)(v61 + 8 * v23);
                  ++v24;
                  if (v22) {
                    goto LABEL_23;
                  }
                }
LABEL_67:
                __break(1u);
                goto LABEL_68;
              }
              int64_t v23 = v15 + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v67 = (v22 - 1) & v22;
      int64_t v68 = v23;
      unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    }
    uint64_t v25 = *(void *)(v65 + 48);
    uint64_t v74 = *(void *)(v64 + 72);
    uint64_t v26 = v63;
    sub_1C7B780B8(v25 + v74 * v20, v63, type metadata accessor for RecordMetadata);
    sub_1C7B78D9C(v26, v13, type metadata accessor for RecordMetadata);
    sub_1C7B7B650();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v27 = v73;
    uint64_t v28 = (char *)(v13 + *(int *)(v73 + 20));
    uint64_t v29 = sub_1C7B7AFF0();
    uint64_t v30 = sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
    id v71 = v28;
    uint64_t v69 = v29;
    uint64_t v66 = v30;
    sub_1C7B7B1B0();
    uint64_t v70 = (char *)*(int *)(v27 + 24);
    sub_1C7B7B670();
    uint64_t v31 = sub_1C7B7B680();
    uint64_t v32 = (void *)a2;
    uint64_t v33 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v34 = v31 & ~v33;
    if ((*(void *)(a2 + 56 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34))
    {
      uint64_t v35 = ~v33;
      while (1)
      {
        sub_1C7B780B8(v32[6] + v34 * v74, (uint64_t)v6, type metadata accessor for RecordMetadata);
        uint64_t v36 = v6[2];
        uint64_t v37 = v6[3];
        uint64_t v38 = *(void *)(v13 + 16);
        uint64_t v39 = *(void *)(v13 + 24);
        BOOL v40 = *v6 == *(void *)v13 && v6[1] == *(void *)(v13 + 8);
        if (v40 || (sub_1C7B7B5E0() & 1) != 0)
        {
          BOOL v41 = v36 == v38 && v37 == v39;
          if (v41 || (sub_1C7B7B5E0())
            && (sub_1C7B7AFC0() & 1) != 0
            && *((unsigned __int8 *)v6 + *(int *)(v73 + 24)) == v70[v13])
          {
            break;
          }
        }
        sub_1C7B78120((uint64_t)v6, type metadata accessor for RecordMetadata);
        unint64_t v34 = (v34 + 1) & v35;
        uint64_t v32 = (void *)a2;
        if (((*(void *)(a2 + 56 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
          goto LABEL_40;
        }
      }
      sub_1C7B78120((uint64_t)v6, type metadata accessor for RecordMetadata);
      goto LABEL_5;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1C7B780B8(v13, (uint64_t)v72, type metadata accessor for RecordMetadata);
    unint64_t v75 = v32;
    if (v32[3] <= v32[2]) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_1C7B72B64();
    }
LABEL_62:
    a2 = (uint64_t)v75;
    *(void *)((char *)v75 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v34;
    sub_1C7B78D9C((uint64_t)v72, *(void *)(a2 + 48) + v34 * v74, type metadata accessor for RecordMetadata);
    uint64_t v56 = *(void *)(a2 + 16);
    BOOL v57 = __OFADD__(v56, 1);
    uint64_t v58 = v56 + 1;
    if (v57)
    {
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    *(void *)(a2 + 16) = v58;
LABEL_5:
    swift_bridgeObjectRelease();
    sub_1C7B78120(v13, type metadata accessor for RecordMetadata);
    unint64_t v19 = v67;
    int64_t v15 = v68;
  }
  a2 = (uint64_t)v60;
  if (isUniquelyReferenced_nonNull_native) {
    sub_1C7B73DD0();
  }
  else {
    sub_1C7B73380();
  }
  uint64_t v43 = v75;
  sub_1C7B7B650();
  uint64_t v44 = v72;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v45 = v73;
  uint64_t v70 = (char *)v44 + *(int *)(v73 + 20);
  sub_1C7B7B1B0();
  uint64_t v69 = *(int *)(v45 + 24);
  sub_1C7B7B670();
  uint64_t v46 = sub_1C7B7B680();
  uint64_t v47 = -1 << *((unsigned char *)v43 + 32);
  unint64_t v34 = v46 & ~v47;
  id v71 = (char *)v43;
  uint64_t v48 = v43 + 7;
  if (((*(void *)((char *)v43 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v34) & 1) == 0) {
    goto LABEL_62;
  }
  uint64_t v49 = ~v47;
  while (1)
  {
    sub_1C7B780B8(*((void *)v71 + 6) + v34 * v74, a2, type metadata accessor for RecordMetadata);
    uint64_t v50 = *(void *)(a2 + 16);
    uint64_t v51 = *(void *)(a2 + 24);
    uint64_t v52 = v72[2];
    uint64_t v53 = v72[3];
    BOOL v54 = *(void *)a2 == *v72 && *(void *)(a2 + 8) == v72[1];
    if (v54 || (sub_1C7B7B5E0() & 1) != 0)
    {
      BOOL v55 = v50 == v52 && v51 == v53;
      if (v55 || (sub_1C7B7B5E0())
        && (sub_1C7B7AFC0() & 1) != 0
        && *(unsigned __int8 *)(a2 + *(int *)(v73 + 24)) == *((unsigned __int8 *)v72 + v69))
      {
        break;
      }
    }
    sub_1C7B78120(a2, type metadata accessor for RecordMetadata);
    unint64_t v34 = (v34 + 1) & v49;
    if (((*(void *)((char *)v48 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
      goto LABEL_62;
    }
  }
LABEL_68:
  sub_1C7B78120(a2, type metadata accessor for RecordMetadata);
  uint64_t result = sub_1C7B7B5F0();
  __break(1u);
  return result;
}

BOOL static SyncEngine.Role.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SyncEngine.Role.hash(into:)()
{
  return sub_1C7B7B660();
}

uint64_t SyncEngine.Role.hashValue.getter()
{
  return sub_1C7B7B680();
}

uint64_t sub_1C7B59440(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  if (!MEMORY[0x1C87BC500](v2 + 16)) {
    return 0;
  }
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  v12[0] = v4;
  v12[1] = v5;
  void v12[2] = v6;
  uint64_t v12[3] = v7;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v8 + 8))(a1, v12, ObjectType, v8);
  swift_unknownObjectRelease();
  return v10;
}

uint64_t sub_1C7B594F4(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1C87BC500](v2 + 16);
  if (result)
  {
    uint64_t v6 = *(void *)(v2 + 24);
    uint64_t ObjectType = swift_getObjectType();
    char v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, ObjectType, v6);
    swift_unknownObjectRelease();
    return v8 & 1;
  }
  return result;
}

uint64_t sub_1C7B59578(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t result = MEMORY[0x1C87BC500](v2 + 16);
  if (result)
  {
    uint64_t v9 = *(void *)(v2 + 24);
    uint64_t ObjectType = swift_getObjectType();
    v11[0] = v4;
    v11[1] = v5;
    v11[2] = v6;
    uint64_t v11[3] = v7;
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v9 + 24))(a1, v11, ObjectType, v9);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C7B59610(uint64_t a1)
{
  if (!MEMORY[0x1C87BC500](v1 + 16)) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, ObjectType, v3);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_1C7B59690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MEMORY[0x1C87BC500](v3 + 16))
  {
    uint64_t v7 = *(void *)(v3 + 24);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, a3, ObjectType, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v10 = a2 + *(int *)(type metadata accessor for Record(0) + 20);
    uint64_t v9 = *(void *)v10;
    sub_1C7B3AEC8(*(void *)v10, *(void *)(v10 + 8));
  }
  return v9;
}

uint64_t sub_1C7B59744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x1C87BC500](v3 + 16);
  if (result)
  {
    uint64_t v8 = *(void *)(v3 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, a2, a3, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C7B597E8()
{
  return sub_1C7B7B310();
}

void sub_1C7B59840(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 248);
}

uint64_t sub_1C7B5984C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_1C7B79030;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_1C7B52468(v1);
  return sub_1C7B59A84((uint64_t)v4, v3);
}

uint64_t (*sub_1C7B598DC())()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  if (!v2) {
    return 0;
  }
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return sub_1C7B59A5C;
}

uint64_t sub_1C7B5998C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 272);
  uint64_t v4 = *(void *)(a1 + 280);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C7B790E0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C7B52468(v3);
}

uint64_t sub_1C7B59A08@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_1C7B5998C(v1, a1);
}

uint64_t sub_1C7B59A24()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7B59A5C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C7B59A84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + 120);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C7B59C08;
  *(void *)(v8 + 24) = v7;
  void v11[4] = sub_1C7B59C60;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C7B51770;
  uint64_t v11[3] = &block_descriptor_1;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  sub_1C7B52468(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C7B53CBC(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B59C08()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v2 + 272);
  *(void *)(v2 + 272) = v1;
  *(void *)(v2 + 280) = v3;
  sub_1C7B52468(v1);

  return sub_1C7B53CBC(v4);
}

uint64_t sub_1C7B59C50()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7B59C60()
{
  return sub_1C7B51748(*(uint64_t (**)(void))(v0 + 16));
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

void (*sub_1C7B59C80(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = v3[3];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1C7B79030;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *uint64_t v3 = v7;
  v3[1] = v6;
  return sub_1C7B59D6C;
}

void sub_1C7B59D6C(uint64_t **a1, char a2)
{
}

uint64_t sub_1C7B59DAC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_1C7B59F84;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_1C7B52468(v1);
  return sub_1C7B59F88((uint64_t)v4, v3);
}

uint64_t (*sub_1C7B59E3C())(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F8);
  sub_1C7B7B310();
  if (!v2) {
    return 0;
  }
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return sub_1C7B59F84;
}

uint64_t sub_1C7B59EEC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 256);
  uint64_t v4 = *(void *)(a1 + 264);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C7B78FFC;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = v5;
  return sub_1C7B52468(v3);
}

uint64_t sub_1C7B59F68@<X0>(void *a1@<X8>)
{
  return sub_1C7B59EEC(v1, a1);
}

uint64_t sub_1C7B59F88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + 120);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C7B5A10C;
  *(void *)(v8 + 24) = v7;
  void v11[4] = sub_1C7B79034;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C7B51770;
  uint64_t v11[3] = &block_descriptor_24;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  sub_1C7B52468(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C7B53CBC(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B5A10C()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v2 + 256);
  *(void *)(v2 + 256) = v1;
  *(void *)(v2 + 264) = v3;
  sub_1C7B52468(v1);

  return sub_1C7B53CBC(v4);
}

uint64_t sub_1C7B5A154()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void (*sub_1C7B5A164(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F8);
  sub_1C7B7B310();
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = v3[3];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1C7B59F84;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *uint64_t v3 = v7;
  v3[1] = v6;
  return sub_1C7B5A250;
}

void sub_1C7B5A250(uint64_t **a1, char a2)
{
}

void sub_1C7B5A290(uint64_t **a1, char a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v8 = **a1;
  uint64_t v7 = (*a1)[1];
  if (a2)
  {
    a4(**a1, v7);
    a3(v8, v7);
    a5(*v6, v6[1]);
  }
  else
  {
    a3(**a1, v7);
  }

  free(v6);
}

uint64_t sub_1C7B5A328(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_1C7B79030;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_1C7B52468(v1);
  return sub_1C7B5A500((uint64_t)v4, v3);
}

uint64_t (*sub_1C7B5A3B8())()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  if (!v2) {
    return 0;
  }
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return sub_1C7B79030;
}

uint64_t sub_1C7B5A468@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 288);
  uint64_t v4 = *(void *)(a1 + 296);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C7B790E0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C7B52468(v3);
}

uint64_t sub_1C7B5A4E4@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_1C7B5A468(v1, a1);
}

uint64_t sub_1C7B5A500(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + 120);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C7B5A684;
  *(void *)(v8 + 24) = v7;
  void v11[4] = sub_1C7B79034;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C7B51770;
  uint64_t v11[3] = &block_descriptor_43;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  sub_1C7B52468(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C7B53CBC(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B5A684()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v2 + 288);
  *(void *)(v2 + 288) = v1;
  *(void *)(v2 + 296) = v3;
  sub_1C7B52468(v1);

  return sub_1C7B53CBC(v4);
}

uint64_t sub_1C7B5A6CC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void (*sub_1C7B5A6DC(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = v3[3];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1C7B79030;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *uint64_t v3 = v7;
  v3[1] = v6;
  return sub_1C7B5A7C8;
}

void sub_1C7B5A7C8(uint64_t **a1, char a2)
{
}

uint64_t sub_1C7B5A808(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_1C7B79030;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_1C7B52468(v1);
  return sub_1C7B5A9E0((uint64_t)v4, v3);
}

uint64_t (*sub_1C7B5A898())()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  if (!v2) {
    return 0;
  }
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return sub_1C7B79030;
}

uint64_t sub_1C7B5A948@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 304);
  uint64_t v4 = *(void *)(a1 + 312);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C7B790E0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C7B52468(v3);
}

uint64_t sub_1C7B5A9C4@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_1C7B5A948(v1, a1);
}

uint64_t sub_1C7B5A9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + 120);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C7B5AB64;
  *(void *)(v8 + 24) = v7;
  void v11[4] = sub_1C7B79034;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C7B51770;
  uint64_t v11[3] = &block_descriptor_63;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  sub_1C7B52468(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C7B53CBC(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B5AB64()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v2 + 304);
  *(void *)(v2 + 304) = v1;
  *(void *)(v2 + 312) = v3;
  sub_1C7B52468(v1);

  return sub_1C7B53CBC(v4);
}

uint64_t sub_1C7B5ABAC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void (*sub_1C7B5ABBC(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = v3[3];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1C7B79030;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *uint64_t v3 = v7;
  v3[1] = v6;
  return sub_1C7B5ACA8;
}

void sub_1C7B5ACA8(uint64_t **a1, char a2)
{
}

double sub_1C7B5ACE8@<D0>(uint64_t *a1@<X3>, _OWORD *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_1C7B7B310();
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_1C7B5AD4C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    long long v4 = sub_1C7B79030;
  }
  else
  {
    long long v4 = 0;
    uint64_t v3 = 0;
  }
  sub_1C7B52468(v1);
  return sub_1C7B5AF24((uint64_t)v4, v3);
}

uint64_t (*sub_1C7B5ADDC())()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  if (!v2) {
    return 0;
  }
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return sub_1C7B79030;
}

uint64_t sub_1C7B5AE8C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 320);
  uint64_t v4 = *(void *)(a1 + 328);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C7B524D4;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C7B52468(v3);
}

uint64_t sub_1C7B5AF08@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_1C7B5AE8C(v1, a1);
}

uint64_t sub_1C7B5AF24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(NSObject **)(v3 + 120);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1C7B5B0F0;
  *(void *)(v8 + 24) = v7;
  void v11[4] = sub_1C7B79034;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1C7B51770;
  uint64_t v11[3] = &block_descriptor_83;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  sub_1C7B52468(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C7B53CBC(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

uint64_t objectdestroy_2Tm_0()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C7B5B0F0()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v2 + 320);
  *(void *)(v2 + 320) = v1;
  *(void *)(v2 + 328) = v3;
  sub_1C7B52468(v1);

  return sub_1C7B53CBC(v4);
}

uint64_t sub_1C7B5B138()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void (*sub_1C7B5B148(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F96F0);
  sub_1C7B7B310();
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = v3[3];
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1C7B79030;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *uint64_t v3 = v7;
  v3[1] = v6;
  return sub_1C7B5B234;
}

void sub_1C7B5B234(uint64_t **a1, char a2)
{
}

uint64_t sub_1C7B5B274()
{
  sub_1C7B7B310();
  return v1;
}

void sub_1C7B5B2D4(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)(v1 + 184) + 16);
}

uint64_t sub_1C7B5B2E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(*a1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  uint64_t v6 = *(void *)(v3 + 224);
  uint64_t v5 = *(void *)(v3 + 232);
  LOWORD(v3) = *(_WORD *)(v3 + 240);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
  uint64_t result = swift_release();
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v5;
  *(_WORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1C7B5B358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void *)(v1 + 232);
  __int16 v5 = *(_WORD *)(v1 + 240);
  *(void *)a1 = *(void *)(v1 + 224);
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = v5;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);

  return swift_release();
}

uint64_t sub_1C7B5B3C8(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  __int16 v4 = *((_WORD *)a1 + 8);
  __int16 v5 = *(os_unfair_lock_s **)(*(void *)(v1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v5);
  *(void *)(v1 + 224) = v3;
  *(void *)(v1 + 232) = v2;
  *(_WORD *)(v1 + 240) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v5);
  swift_bridgeObjectRelease();

  return swift_release();
}

void *SyncEngine.__allocating_init(syncService:metadataStore:keybag:retryTimer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1C7B3FB7C(a3, (uint64_t)v17);
  sub_1C7B3FB7C(a4, (uint64_t)v16);
  unsigned __int8 v15 = 0;
  if (qword_1EBC5DCD8 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1EBC5DCD0;
  type metadata accessor for SyncEngine();
  swift_allocObject();
  uint64_t v12 = sub_1C7B76F1C(a1, a2, (uint64_t)v17, (uint64_t)v16, a5, a6, &v15, &v14, 86400, 0, 0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v12;
}

void *SyncEngine.__allocating_init(syncService:metadataStore:keybag:retryTimer:role:syncState:inflightExpirationTime:localDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  swift_allocObject();
  unint64_t v19 = sub_1C7B76F1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v19;
}

uint64_t type metadata accessor for SyncEngine()
{
  return self;
}

void *SyncEngine.init(syncService:metadataStore:keybag:retryTimer:role:syncState:inflightExpirationTime:localDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11 = sub_1C7B76F1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_1C7B5B6C4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1);
  sub_1C7B7B060();
  swift_retain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

Swift::Void __swiftcall SyncEngine.validate()()
{
}

uint64_t SyncEngine.deinit()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C7B53CBC(*(void *)(v0 + 256));
  sub_1C7B53CBC(*(void *)(v0 + 272));
  sub_1C7B53CBC(*(void *)(v0 + 288));
  sub_1C7B53CBC(*(void *)(v0 + 304));
  sub_1C7B53CBC(*(void *)(v0 + 320));
  return v0;
}

uint64_t SyncEngine.__deallocating_deinit()
{
  SyncEngine.deinit();

  return swift_deallocClassInstance();
}

Swift::Void __swiftcall SyncEngine.setHasPaired(with:)(Swift::String with)
{
  uint64_t object = with._object;
  uint64_t countAndFlagsBits = with._countAndFlagsBits;
  uint64_t v4 = v1[8];
  uint64_t v5 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v4);
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 144))(countAndFlagsBits, object, v4, v5);
}

uint64_t SyncEngine.localDeviceIdentifier.getter()
{
  if (*(void *)(v0 + 208))
  {
    uint64_t v1 = *(void *)(v0 + 200);
  }
  else
  {
    uint64_t v2 = IDSCopyLocalDeviceUniqueID();
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v1 = sub_1C7B7B1D0();
    }
    else
    {
      uint64_t v1 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall SyncEngine.addRecordIDs(toSave:toDelete:)(Swift::OpaquePointer toSave, Swift::OpaquePointer toDelete)
{
  sub_1C7B7B060();
  uint64_t v5 = (Swift::OpaquePointer *)swift_allocObject();
  v5[2]._rawValue = v2;
  v5[3]._rawValue = toSave._rawValue;
  v5[4]._rawValue = toDelete._rawValue;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  swift_release();
}

uint64_t sub_1C7B5BA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1C7B7AFF0();
  uint64_t v60 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (id *)((char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *(void **)(v3 + 120);
  *uint64_t v12 = v13;
  uint64_t v14 = *(void (**)(void))(v10 + 104);
  unsigned int v57 = *MEMORY[0x1E4FBCBF0];
  uint64_t v56 = (void (*)(void *, void, uint64_t))v14;
  v14(v12);
  id v54 = v13;
  uint64_t v15 = sub_1C7B7B180();
  uint64_t v16 = *(void (**)(void *, uint64_t))(v10 + 8);
  uint64_t v58 = v9;
  BOOL v55 = v16;
  v16(v12, v9);
  if (v15)
  {
    uint64_t v59 = v6;
    sub_1C7B7AFD0();
    uint64_t v17 = a1;
    uint64_t v18 = v8;
    uint64_t v20 = *(void *)(v3 + 64);
    uint64_t v19 = *(void *)(v3 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 40), v20);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 48))(v18, a2, v20, v19);
    uint64_t v21 = *(void *)(v3 + 64);
    uint64_t v22 = *(void *)(v3 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 40), v21);
    int64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 40);
    uint64_t v61 = v18;
    v23(v18, v17, v21, v22);
    uint64_t v15 = *(void *)(v3 + 248);
    if (qword_1EBC5DCD8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v24 = v61;
  if ((qword_1EBC5DCD0 & ~v15) == 0)
  {
    uint64_t v25 = v54;
    *uint64_t v12 = v54;
    uint64_t v26 = v58;
    v56(v12, v57, v58);
    id v27 = v25;
    LOBYTE(v25) = sub_1C7B7B180();
    v55(v12, v26);
    if (v25)
    {
      uint64_t v28 = *(void *)(v3 + 136);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v28 + 24))(ObjectType, v28);
      uint64_t v30 = *(os_unfair_lock_s **)(*(void *)(v3 + 216) + 16);
      swift_retain();
      os_unfair_lock_lock(v30);
      uint64_t v31 = *(void *)(v3 + 224);
      unint64_t v32 = *(void *)(v3 + 232);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v30);
      swift_release();
      if (v32) {
        uint64_t v33 = v31;
      }
      else {
        uint64_t v33 = 0;
      }
      unint64_t v34 = *(os_unfair_lock_s **)(*(void *)(v3 + 216) + 16);
      swift_retain();
      os_unfair_lock_lock(v34);
      uint64_t v35 = *(void *)(v3 + 232);
      char v36 = *(unsigned char *)(v3 + 241);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v34);
      swift_release();
      if (v35)
      {
        swift_bridgeObjectRelease();
        char v37 = v36 & 1;
      }
      else
      {
        char v37 = 2;
      }
      uint64_t v49 = v59;
      LOBYTE(v63) = v37;
      sub_1C7B60DCC(v33, v32, (unsigned __int8 *)&v63);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v24, v49);
    }
    __break(1u);
    goto LABEL_25;
  }
  if (qword_1EBC5E820 != -1) {
LABEL_25:
  }
    swift_once();
  uint64_t v38 = sub_1C7B7B090();
  __swift_project_value_buffer(v38, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v39 = sub_1C7B7B080();
  os_log_type_t v40 = sub_1C7B7B2D0();
  BOOL v41 = os_log_type_enabled(v39, v40);
  uint64_t v42 = v59;
  if (v41)
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v63 = v44;
    *(_DWORD *)uint64_t v43 = 136380675;
    if (*(void *)(v3 + 208))
    {
      unint64_t v45 = *(void *)(v3 + 200);
      unint64_t v46 = *(void *)(v3 + 208);
    }
    else
    {
      uint64_t v51 = IDSCopyLocalDeviceUniqueID();
      if (v51)
      {
        uint64_t v52 = (void *)v51;
        unint64_t v45 = sub_1C7B7B1D0();
        unint64_t v46 = v53;
      }
      else
      {
        unint64_t v46 = 0x80000001C7B80E00;
        unint64_t v45 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_1C7B47DE8(v45, v46, &v63);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v39, v40, "(%{private}s) Not syncing altered records as the sync engine is disabled", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v44, -1, -1);
    MEMORY[0x1C87BC480](v43, -1, -1);

    uint64_t v48 = v61;
    uint64_t v47 = *(uint64_t (**)(char *, uint64_t))(v60 + 8);
  }
  else
  {
    swift_release_n();

    uint64_t v47 = *(uint64_t (**)(char *, uint64_t))(v60 + 8);
    uint64_t v48 = v24;
  }
  return v47(v48, v42);
}

uint64_t SyncEngine.set(dataSource:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C7B7B060();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = a3;
  v9[6] = a4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

uint64_t sub_1C7B5C0D4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v40 = a2;
  uint64_t v9 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (uint64_t *)((char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *(void **)(v4 + 120);
  *uint64_t v12 = v13;
  uint64_t v14 = *(void (**)(void))(v10 + 104);
  unsigned int v43 = *MEMORY[0x1E4FBCBF0];
  uint64_t v42 = v14;
  v14(v12);
  id v41 = v13;
  LOBYTE(v13) = sub_1C7B7B180();
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t))(v10 + 8);
  uint64_t result = v15(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  if (!a1)
  {
LABEL_7:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1C7B48CF4((uint64_t)a3, a4);
    swift_endAccess();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  uint64_t v44 = a3;
  a3 = (void *)(v5 + 144);
  swift_beginAccess();
  uint64_t v17 = *(void *)(v5 + 144);
  uint64_t v18 = a1;
  uint64_t v19 = *(void *)(v17 + 16);
  uint64_t v45 = v18;
  swift_unknownObjectRetain();
  if (v19)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_1C7B49014((uint64_t)v44, a4);
    if (v21)
    {
      uint64_t v22 = *(void *)(*(void *)(v17 + 56) + 8 * v20);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = MEMORY[0x1C87BC500](v22 + 16);
      swift_release();
      if (v23)
      {
        swift_unknownObjectRelease();
        sub_1C7B7B4D0();
        __break(1u);
        goto LABEL_7;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  type metadata accessor for SyncEngine.WeakSource();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v24 + 24) = v40;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v46 = *a3;
  *a3 = 0x8000000000000000;
  sub_1C7B4B24C(v24, (uint64_t)v44, a4, isUniquelyReferenced_nonNull_native);
  *a3 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  id v27 = v41;
  uint64_t v26 = (void (*)(void *, void, uint64_t))v42;
  *uint64_t v12 = v41;
  v26(v12, v43, v9);
  id v28 = v27;
  LOBYTE(v27) = sub_1C7B7B180();
  uint64_t result = v15(v12, v9);
  if ((v27 & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v29 = *(void *)(v5 + 136);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v29 + 24))(ObjectType, v29);
  uint64_t v31 = *(os_unfair_lock_s **)(*(void *)(v5 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v31);
  uint64_t v32 = *(void *)(v5 + 224);
  unint64_t v33 = *(void *)(v5 + 232);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v31);
  swift_release();
  if (v33) {
    uint64_t v34 = v32;
  }
  else {
    uint64_t v34 = 0;
  }
  uint64_t v35 = *(os_unfair_lock_s **)(*(void *)(v5 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v35);
  uint64_t v36 = *(void *)(v5 + 232);
  char v37 = *(unsigned char *)(v5 + 241);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v35);
  swift_release();
  if (v36)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v38 = v37 & 1;
  }
  else
  {
    unsigned __int8 v38 = 2;
  }
  v47[0] = v38;
  sub_1C7B60DCC(v34, v33, v47);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall SyncEngine.set(syncEnabled:)(Swift::Bool syncEnabled)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(NSObject **)(v2 + 120);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(unsigned char *)(v5 + 24) = syncEnabled;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1C7B77620;
  *(void *)(v6 + 24) = v5;
  v8[4] = sub_1C7B79034;
  void v8[5] = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1C7B51770;
  uint64_t v8[3] = &block_descriptor_106;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v4) {
    __break(1u);
  }
}

void sub_1C7B5C680(int a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (uint64_t *)((char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v3 + 120);
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v7, *MEMORY[0x1E4FBCBF0], v5);
  id v9 = v8;
  LOBYTE(v8) = sub_1C7B7B180();
  uint64_t v11 = *(void (**)(void *, uint64_t))(v10 + 8);
  LOBYTE(v10) = v10 + 8;
  v11(v7, v5);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_42:
    swift_once();
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v3 + 248);
  if (v12) {
    LODWORD(v10) = 0;
  }
  else {
    LODWORD(v10) = *(unsigned __int8 *)(v3 + 16);
  }
  uint64_t v2 = &unk_1EBC5E000;
  if (v10 != 1) {
    goto LABEL_17;
  }
  if (qword_1EBC5E820 != -1) {
    goto LABEL_42;
  }
LABEL_7:
  uint64_t v13 = sub_1C7B7B090();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v14 = sub_1C7B7B080();
  os_log_type_t v15 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v51 = v17;
    *(_DWORD *)uint64_t v16 = 136381187;
    unint64_t v18 = *(void *)(v3 + 208);
    int v49 = a1;
    if (v18)
    {
      unint64_t v19 = *(void *)(v3 + 200);
      unint64_t v20 = v18;
    }
    else
    {
      uint64_t v21 = IDSCopyLocalDeviceUniqueID();
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        unint64_t v19 = sub_1C7B7B1D0();
        unint64_t v20 = v23;
      }
      else
      {
        unint64_t v19 = 0xD000000000000017;
        unint64_t v20 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_1C7B47DE8(v19, v20, &v51);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 1026;
    LODWORD(v50) = 0;
    sub_1C7B7B3A0();
    *(_WORD *)(v16 + 18) = 1026;
    LODWORD(v50) = 1;
    sub_1C7B7B3A0();
    _os_log_impl(&dword_1C7B37000, v14, v15, "(%{private}s) Sync engine supported state has changed from %{BOOL,public}d to %{BOOL,public}d", (uint8_t *)v16, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v17, -1, -1);
    MEMORY[0x1C87BC480](v16, -1, -1);

    a1 = v49;
    uint64_t v2 = &unk_1EBC5E000;
    unint64_t v12 = *(void *)(v3 + 248);
    if ((v12 & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {

    swift_release_n();
    unint64_t v12 = *(void *)(v3 + 248);
    if ((v12 & 1) == 0)
    {
LABEL_16:
      v12 |= 1uLL;
      *(void *)(v3 + 248) = v12;
    }
  }
LABEL_17:
  if (((v12 >> 1) & 1) == (a1 & 1))
  {
    if ((v10 & 1) == 0) {
      return;
    }
    goto LABEL_35;
  }
  if (v2[260] != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1C7B7B090();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v25 = sub_1C7B7B080();
  os_log_type_t v26 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = v12 & 2;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v51 = v29;
    *(_DWORD *)uint64_t v28 = 136381187;
    unint64_t v30 = *(void *)(v3 + 208);
    int v49 = a1;
    if (v30)
    {
      unint64_t v31 = *(void *)(v3 + 200);
      unint64_t v32 = v30;
    }
    else
    {
      uint64_t v35 = IDSCopyLocalDeviceUniqueID();
      if (v35)
      {
        uint64_t v36 = (void *)v35;
        unint64_t v31 = sub_1C7B7B1D0();
        unint64_t v32 = v37;
      }
      else
      {
        unint64_t v31 = 0xD000000000000017;
        unint64_t v32 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_1C7B47DE8(v31, v32, &v51);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 1026;
    LODWORD(v50) = v27 >> 1;
    sub_1C7B7B3A0();
    *(_WORD *)(v28 + 18) = 1026;
    char v38 = v49;
    LODWORD(v50) = v49 & 1;
    sub_1C7B7B3A0();
    _os_log_impl(&dword_1C7B37000, v25, v26, "(%{private}s) Sync engine enabled state has changed from %{BOOL,public}d to %{BOOL,public}d", (uint8_t *)v28, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v29, -1, -1);
    MEMORY[0x1C87BC480](v28, -1, -1);

    uint64_t v33 = *(void *)(v3 + 248);
    if (v38) {
      goto LABEL_32;
    }
LABEL_26:
    if ((v33 & 2) == 0) {
      goto LABEL_35;
    }
    unint64_t v34 = v33 & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_34;
  }

  swift_release_n();
  uint64_t v33 = *(void *)(v3 + 248);
  if ((a1 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_32:
  if ((v33 & 2) != 0) {
    goto LABEL_35;
  }
  unint64_t v34 = v33 | 2;
LABEL_34:
  *(void *)(v3 + 248) = v34;
LABEL_35:
  sub_1C7B5CCFC();
  uint64_t v39 = *(os_unfair_lock_s **)(*(void *)(v3 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v39);
  uint64_t v41 = *(void *)(v3 + 224);
  unint64_t v40 = *(void *)(v3 + 232);
  __int16 v42 = *(_WORD *)(v3 + 240);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v39);
  swift_release();
  if (v40)
  {
    char v43 = HIBYTE(v42) & 1;
    uint64_t v44 = *(void *)(v3 + 64);
    uint64_t v45 = *(void *)(v3 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v3 + 40), v44);
    uint64_t v46 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v45 + 136);
    swift_bridgeObjectRetain();
    char v47 = v46(v41, v40, v44, v45);
    swift_bridgeObjectRelease();
    LOBYTE(v51) = v43;
    swift_bridgeObjectRetain();
    if (v47) {
      sub_1C7B60DCC(v41, v40, (unsigned __int8 *)&v51);
    }
    else {
      sub_1C7B693D0(v41, v40, (char *)&v51);
    }
    swift_bridgeObjectRelease_n();
  }
}

void sub_1C7B5CCFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C7B7AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C7B7B160();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (uint64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void **)(v1 + 120);
  *id v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCBF0], v6);
  id v11 = v10;
  LOBYTE(v10) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  sub_1C7B69B00();
  sub_1C7B69E2C();
  uint64_t v6 = *(void *)(v1 + 248);
  if (qword_1EBC5DCD8 != -1) {
LABEL_26:
  }
    swift_once();
  if ((qword_1EBC5DCD0 & ~v6) == 0)
  {
    unint64_t v12 = *(os_unfair_lock_s **)(*(void *)(v1 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v12);
    uint64_t v13 = *(void *)(v1 + 232);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v12);
    swift_bridgeObjectRelease();
    swift_release();
    if (v13)
    {
      uint64_t v14 = *(void *)(v1 + 104);
      uint64_t v15 = *(void *)(v1 + 112);
      __swift_project_boxed_opaque_existential_1((void *)(v1 + 80), v14);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15))
      {
        uint64_t v16 = *(void *)(v1 + 64);
        uint64_t v17 = *(void *)(v1 + 72);
        __swift_project_boxed_opaque_existential_1((void *)(v1 + 40), v16);
        sub_1C7B7AFD0();
        char v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 112))(v5, v16, v17);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        if ((v18 & 1) == 0)
        {
          if (qword_1EBC5E820 != -1) {
            swift_once();
          }
          uint64_t v19 = sub_1C7B7B090();
          __swift_project_value_buffer(v19, (uint64_t)qword_1EBC5DC50);
          swift_retain_n();
          unint64_t v20 = sub_1C7B7B080();
          os_log_type_t v21 = sub_1C7B7B2D0();
          if (os_log_type_enabled(v20, v21))
          {
            uint64_t v22 = (uint8_t *)swift_slowAlloc();
            uint64_t v23 = swift_slowAlloc();
            uint64_t v40 = v23;
            *(_DWORD *)uint64_t v22 = 136380675;
            if (*(void *)(v1 + 208))
            {
              unint64_t v24 = *(void *)(v1 + 200);
              unint64_t v25 = *(void *)(v1 + 208);
            }
            else
            {
              uint64_t v26 = IDSCopyLocalDeviceUniqueID();
              if (v26)
              {
                unint64_t v27 = (void *)v26;
                unint64_t v24 = sub_1C7B7B1D0();
                unint64_t v25 = v28;
              }
              else
              {
                unint64_t v25 = 0x80000001C7B80E00;
                unint64_t v24 = 0xD000000000000017;
              }
            }
            swift_bridgeObjectRetain();
            uint64_t v39 = sub_1C7B47DE8(v24, v25, &v40);
            sub_1C7B7B3A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C7B37000, v20, v21, "(%{private}s) Metadata store is invalid; purging and syncing",
              v22,
              0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C87BC480](v23, -1, -1);
            MEMORY[0x1C87BC480](v22, -1, -1);
          }
          else
          {

            swift_release_n();
          }
          uint64_t v29 = *(void *)(v1 + 64);
          uint64_t v30 = *(void *)(v1 + 72);
          __swift_project_boxed_opaque_existential_1((void *)(v1 + 40), v29);
          (*(void (**)(uint64_t, uint64_t))(v30 + 80))(v29, v30);
          unint64_t v31 = *(os_unfair_lock_s **)(*(void *)(v1 + 216) + 16);
          swift_retain();
          os_unfair_lock_lock(v31);
          uint64_t v33 = *(void *)(v1 + 224);
          unint64_t v32 = *(void *)(v1 + 232);
          swift_bridgeObjectRetain();
          os_unfair_lock_unlock(v31);
          swift_release();
          if (v32) {
            uint64_t v34 = v33;
          }
          else {
            uint64_t v34 = 0;
          }
          uint64_t v35 = *(os_unfair_lock_s **)(*(void *)(v1 + 216) + 16);
          swift_retain();
          os_unfair_lock_lock(v35);
          uint64_t v36 = *(void *)(v1 + 232);
          char v37 = *(unsigned char *)(v1 + 241);
          swift_bridgeObjectRetain();
          os_unfair_lock_unlock(v35);
          swift_release();
          if (v36)
          {
            swift_bridgeObjectRelease();
            char v38 = v37 & 1;
          }
          else
          {
            char v38 = 2;
          }
          LOBYTE(v40) = v38;
          sub_1C7B60DCC(v34, v32, (unsigned __int8 *)&v40);
          swift_bridgeObjectRelease();
        }
      }
    }
  }
}

Swift::Void __swiftcall SyncEngine.sync()()
{
}

uint64_t sub_1C7B5D270()
{
  sub_1C7B7B060();
  swift_retain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

uint64_t sub_1C7B5D2F4()
{
  uint64_t v1 = sub_1C7B7B160();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (uint64_t *)((char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + 120);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    uint64_t v8 = *(os_unfair_lock_s **)(*(void *)(v0 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v8);
    uint64_t v10 = *(void *)(v0 + 224);
    unint64_t v9 = *(void *)(v0 + 232);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v8);
    swift_release();
    id v11 = *(os_unfair_lock_s **)(*(void *)(v0 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v11);
    uint64_t v12 = *(void *)(v0 + 232);
    char v13 = *(unsigned char *)(v0 + 241);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v11);
    swift_release();
    if (v12)
    {
      swift_bridgeObjectRelease();
      unsigned __int8 v14 = v13 & 1;
    }
    else
    {
      unsigned __int8 v14 = 2;
    }
    if (v9) {
      uint64_t v15 = v10;
    }
    else {
      uint64_t v15 = 0;
    }
    unsigned __int8 v17 = v14;
    sub_1C7B60DCC(v15, v9, &v17);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B5D4AC()
{
  if (*(void *)(*(void *)v0 + 208))
  {
    uint64_t v1 = *(void *)(*(void *)v0 + 200);
  }
  else
  {
    uint64_t v2 = IDSCopyLocalDeviceUniqueID();
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v1 = sub_1C7B7B1D0();
    }
    else
    {
      uint64_t v1 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C7B5D530@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(*v1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  uint64_t v5 = *(void *)(v3 + 232);
  __int16 v6 = *(_WORD *)(v3 + 240);
  *(void *)a1 = *(void *)(v3 + 224);
  *(void *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 16) = v6;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);

  return swift_release();
}

uint64_t sub_1C7B5D5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1C7B7B060();
  __int16 v6 = (void *)swift_allocObject();
  v6[2] = v5;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

uint64_t sub_1C7B5D678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  sub_1C7B7B060();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a1;
  uint64_t v10[4] = a2;
  v10[5] = a3;
  v10[6] = a4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

void sub_1C7B5D760(Swift::Bool a1)
{
}

uint64_t sub_1C7B5D784()
{
  return sub_1C7B5D7E0();
}

uint64_t sub_1C7B5D7B4()
{
  return sub_1C7B5D7E0();
}

uint64_t sub_1C7B5D7E0()
{
  sub_1C7B7B060();
  swift_retain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

uint64_t sub_1C7B5D864()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1);
  sub_1C7B7B060();
  swift_retain();
  sub_1C7B7B050();
  sub_1C7B7B040();

  return swift_release();
}

uint64_t SyncEngine.syncService(_:didReceiveMessage:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  long long v12 = *(_OWORD *)(a3 + 16);
  v20[0] = *(_OWORD *)a3;
  v20[1] = v12;
  uint64_t v21 = *(void *)(a3 + 32);
  char v13 = *(NSObject **)(v5 + 120);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v6;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  long long v15 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v14 + 40) = *(_OWORD *)a3;
  *(_OWORD *)(v14 + 56) = v15;
  *(void *)(v14 + 72) = *(void *)(a3 + 32);
  *(void *)(v14 + 80) = a4;
  *(void *)(v14 + 88) = a5;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1C7B776F0;
  *(void *)(v16 + 24) = v14;
  v19[4] = sub_1C7B79034;
  void v19[5] = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  void v19[2] = sub_1C7B51770;
  v19[3] = &block_descriptor_116;
  unsigned __int8 v17 = _Block_copy(v19);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1C7B52424((uint64_t)v20);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v13, v17);
  _Block_release(v17);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v13) {
    __break(1u);
  }
  return result;
}

uint64_t SyncEngine.syncService(_:shouldAcceptIncomingMessage:from:)()
{
  sub_1C7B7B310();
  return v1;
}

uint64_t SyncEngine._queue_syncService(_:shouldAcceptIncomingMessage:from:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v79 = a4;
  unint64_t v80 = a5;
  uint64_t v9 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  long long v12 = (uint64_t *)((char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v13 = *(unsigned __int8 *)a3;
  unint64_t v14 = a3[1];
  uint64_t v15 = a3[2];
  unint64_t v16 = a3[4];
  uint64_t v78 = a3[3];
  unsigned __int8 v17 = *(void **)(v6 + 120);
  *long long v12 = v17;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FBCBF0], v9);
  id v18 = v17;
  LOBYTE(v17) = sub_1C7B7B180();
  unint64_t v20 = *(void (**)(void *, uint64_t))(v10 + 8);
  unint64_t v19 = v10 + 8;
  v20(v12, v9);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    goto LABEL_63;
  }
  if (*(void *)(v6 + 24) != a1) {
    return 0;
  }
  if (v14 == 0x69676E45636E7953 && v15 == 0xEA0000000000656ELL
    || (v22 = sub_1C7B7B5E0(), uint64_t result = 0, (v22 & 1) != 0))
  {
    uint64_t v23 = *(os_unfair_lock_s **)(*(void *)(v6 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v23);
    uint64_t v9 = *(void *)(v6 + 224);
    unint64_t v14 = *(void *)(v6 + 232);
    unint64_t v19 = *(unsigned __int16 *)(v6 + 240);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v23);
    swift_release();
    if (!v14) {
      return 0;
    }
    uint64_t v24 = *(void *)(v6 + 104);
    uint64_t v25 = *(void *)(v6 + 112);
    __swift_project_boxed_opaque_existential_1((void *)(v6 + 80), v24);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(v24, v25) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_1C7B7B090();
      __swift_project_value_buffer(v26, (uint64_t)qword_1EBC5DC50);
      swift_retain_n();
      unint64_t v27 = sub_1C7B7B080();
      os_log_type_t v28 = sub_1C7B7B2C0();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        uint64_t v81 = v30;
        *(_DWORD *)uint64_t v29 = 136380675;
        if (*(void *)(v6 + 208))
        {
          unint64_t v31 = *(void *)(v6 + 200);
          unint64_t v32 = *(void *)(v6 + 208);
        }
        else
        {
          uint64_t v51 = IDSCopyLocalDeviceUniqueID();
          if (v51)
          {
            uint64_t v52 = (void *)v51;
            unint64_t v31 = sub_1C7B7B1D0();
            unint64_t v32 = v53;
          }
          else
          {
            unint64_t v31 = 0xD000000000000017;
            unint64_t v32 = 0x80000001C7B80E00;
          }
        }
        swift_bridgeObjectRetain();
        unint64_t v83 = sub_1C7B47DE8(v31, v32, &v81);
        sub_1C7B7B3A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C7B37000, v27, v28, "(%{private}s) Rejecting incoming message because keybag is locked", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v30, -1, -1);
        MEMORY[0x1C87BC480](v29, -1, -1);

        return 0;
      }

LABEL_29:
      swift_release_n();
      return 0;
    }
    a1 = *(void *)(v6 + 248);
    if (qword_1EBC5DCD8 == -1)
    {
LABEL_11:
      if ((qword_1EBC5DCD0 & ~a1) != 0)
      {
        swift_bridgeObjectRelease();
        if (qword_1EBC5E820 != -1) {
          swift_once();
        }
        uint64_t v33 = sub_1C7B7B090();
        __swift_project_value_buffer(v33, (uint64_t)qword_1EBC5DC50);
        swift_retain_n();
        uint64_t v34 = sub_1C7B7B080();
        os_log_type_t v35 = sub_1C7B7B2C0();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = swift_slowAlloc();
          uint64_t v37 = swift_slowAlloc();
          unint64_t v83 = v37;
          *(_DWORD *)uint64_t v36 = 136380931;
          if (*(void *)(v6 + 208))
          {
            unint64_t v38 = *(void *)(v6 + 200);
            unint64_t v39 = *(void *)(v6 + 208);
          }
          else
          {
            uint64_t v62 = IDSCopyLocalDeviceUniqueID();
            if (v62)
            {
              uint64_t v63 = (void *)v62;
              unint64_t v38 = sub_1C7B7B1D0();
              unint64_t v39 = v64;
            }
            else
            {
              unint64_t v39 = 0x80000001C7B80E00;
              unint64_t v38 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v81 = sub_1C7B47DE8(v38, v39, (uint64_t *)&v83);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 12) = 2082;
          uint64_t v68 = *(void *)(v6 + 248);
          uint64_t v81 = 0;
          unint64_t v82 = 0xE000000000000000;
          if (v68) {
            sub_1C7B7B220();
          }
          if ((v68 & 2) != 0) {
            sub_1C7B7B220();
          }
          uint64_t v81 = sub_1C7B47DE8(v81, v82, (uint64_t *)&v83);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C7B37000, v34, v35, "(%{private}s) Rejecting incoming message because the sync engine is disabled: %{public}s", (uint8_t *)v36, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v37, -1, -1);
          MEMORY[0x1C87BC480](v36, -1, -1);

          return 0;
        }
      }
      else
      {
        if (v9 == v79 && v14 == v80 || (sub_1C7B7B5E0() & 1) != 0)
        {
          if (v13)
          {
            swift_bridgeObjectRelease();
            return 1;
          }
          unint64_t v80 = v19;
          if (qword_1EBC5E820 != -1) {
            swift_once();
          }
          uint64_t v40 = sub_1C7B7B090();
          __swift_project_value_buffer(v40, (uint64_t)qword_1EBC5DC50);
          swift_retain();
          swift_bridgeObjectRetain();
          uint64_t v41 = v78;
          unint64_t v42 = v16;
          sub_1C7B3AEC8(v78, v16);
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          sub_1C7B3AEC8(v41, v16);
          char v43 = sub_1C7B7B080();
          int v44 = sub_1C7B7B2C0();
          uint64_t v45 = v43;
          if (os_log_type_enabled(v43, (os_log_type_t)v44))
          {
            uint64_t v46 = swift_slowAlloc();
            uint64_t v47 = swift_slowAlloc();
            uint64_t v81 = v47;
            *(_DWORD *)uint64_t v46 = 136381187;
            unint64_t v48 = *(void *)(v6 + 208);
            LODWORD(v79) = v44;
            uint64_t v77 = v47;
            if (v48)
            {
              unint64_t v49 = *(void *)(v6 + 200);
              unint64_t v50 = v48;
            }
            else
            {
              uint64_t v65 = IDSCopyLocalDeviceUniqueID();
              if (v65)
              {
                uint64_t v66 = (void *)v65;
                unint64_t v49 = sub_1C7B7B1D0();
                unint64_t v50 = v67;
              }
              else
              {
                unint64_t v49 = 0xD000000000000017;
                unint64_t v50 = 0x80000001C7B80E00;
              }
            }
            swift_bridgeObjectRetain();
            unint64_t v83 = sub_1C7B47DE8(v49, v50, &v81);
            sub_1C7B7B3A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v46 + 12) = 2050;
            swift_bridgeObjectRelease();
            uint64_t v72 = v78;
            sub_1C7B3AF20(v78, v42);
            unint64_t v83 = 0;
            sub_1C7B7B3A0();
            swift_bridgeObjectRelease();
            sub_1C7B3AF20(v72, v42);
            *(_WORD *)(v46 + 22) = 2050;
            swift_bridgeObjectRelease();
            unint64_t v83 = (v80 >> 8) & 1;
            sub_1C7B7B3A0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C7B37000, v45, (os_log_type_t)v79, "(%{private}s) Rejecting message; version number not supported: versionNumber=%{public}ld; currentVersionNu"
              "mber=%{public}ld",
              (uint8_t *)v46,
              0x20u);
            uint64_t v73 = v77;
            swift_arrayDestroy();
            MEMORY[0x1C87BC480](v73, -1, -1);
            MEMORY[0x1C87BC480](v46, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1C7B3AF20(v41, v42);
            swift_bridgeObjectRelease();
            swift_release_n();
            sub_1C7B3AF20(v41, v42);

            swift_bridgeObjectRelease();
          }
          return 0;
        }
        if (qword_1EBC5E820 != -1) {
          swift_once();
        }
        uint64_t v54 = sub_1C7B7B090();
        __swift_project_value_buffer(v54, (uint64_t)qword_1EBC5DC50);
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        BOOL v55 = sub_1C7B7B080();
        os_log_type_t v56 = sub_1C7B7B2C0();
        if (os_log_type_enabled(v55, v56))
        {
          uint64_t v57 = swift_slowAlloc();
          uint64_t v58 = swift_slowAlloc();
          uint64_t v81 = v58;
          *(_DWORD *)uint64_t v57 = 136381187;
          unint64_t v59 = *(void *)(v6 + 208);
          uint64_t v78 = v58;
          if (v59)
          {
            unint64_t v60 = *(void *)(v6 + 200);
            unint64_t v61 = v59;
          }
          else
          {
            uint64_t v69 = IDSCopyLocalDeviceUniqueID();
            if (v69)
            {
              uint64_t v70 = (void *)v69;
              unint64_t v60 = sub_1C7B7B1D0();
              unint64_t v61 = v71;
            }
            else
            {
              unint64_t v60 = 0xD000000000000017;
              unint64_t v61 = 0x80000001C7B80E00;
            }
          }
          swift_bridgeObjectRetain();
          unint64_t v83 = sub_1C7B47DE8(v60, v61, &v81);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v57 + 12) = 2082;
          unint64_t v74 = v80;
          swift_bridgeObjectRetain();
          unint64_t v83 = sub_1C7B47DE8(v79, v74, &v81);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v57 + 22) = 2082;
          swift_bridgeObjectRetain();
          unint64_t v83 = sub_1C7B47DE8(v9, v14, &v81);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C7B37000, v55, v56, "(%{private}s) Rejecting message; not from active device: deviceIdentifier=%{public}s; pairedDevice=%{public}s",
            (uint8_t *)v57,
            0x20u);
          uint64_t v75 = v78;
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v75, -1, -1);
          MEMORY[0x1C87BC480](v57, -1, -1);

          return 0;
        }

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      goto LABEL_29;
    }
LABEL_63:
    swift_once();
    goto LABEL_11;
  }
  return result;
}

uint64_t SyncEngine.syncService(_:didSendWithRequestIdentifier:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  long long v12 = *(NSObject **)(v5 + 120);
  int v13 = (void *)swift_allocObject();
  void v13[2] = v6;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_1C7B777B4;
  *(void *)(v14 + 24) = v13;
  v18[4] = sub_1C7B79034;
  v18[5] = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 1107296256;
  void v18[2] = sub_1C7B51770;
  void v18[3] = &block_descriptor_126;
  uint64_t v15 = _Block_copy(v18);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v16 = a5;
  swift_retain();
  swift_release();
  dispatch_sync(v12, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v12) {
    __break(1u);
  }
  return result;
}

void sub_1C7B5E8C8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  unint64_t v113 = a4;
  id v114 = a5;
  uint64_t v112 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v7 - 8);
  v111 = (char *)&v108 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  long long v12 = (uint64_t *)((char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v13 = (void *)v5[15];
  *long long v12 = v13;
  uint64_t v14 = *MEMORY[0x1E4FBCBF0];
  uint64_t v15 = *(void **)(v10 + 104);
  ((void (*)(void *, uint64_t, uint64_t))v15)(v12, v14, v9);
  id v110 = v13;
  LOBYTE(v13) = sub_1C7B7B180();
  id v16 = *(void (**)(void *, uint64_t))(v10 + 8);
  v16(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_76:
    swift_once();
LABEL_4:
    uint64_t v17 = sub_1C7B7B090();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    id v18 = sub_1C7B7B080();
    os_log_type_t v19 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v117[0] = v21;
      *(_DWORD *)uint64_t v20 = 136380675;
      if (v15[26])
      {
        unint64_t v22 = v15[25];
        unint64_t v23 = v15[26];
      }
      else
      {
        uint64_t v39 = IDSCopyLocalDeviceUniqueID();
        if (v39)
        {
          uint64_t v40 = (void *)v39;
          unint64_t v22 = sub_1C7B7B1D0();
          unint64_t v23 = v41;
        }
        else
        {
          unint64_t v22 = 0xD000000000000017;
          unint64_t v23 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      v115[0] = sub_1C7B47DE8(v22, v23, v117);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v53 = v19;
      uint64_t v54 = "(%{private}s) Ignoring message send callback as it is from an unknown sync service";
LABEL_45:
      uint64_t v68 = v18;
      uint64_t v69 = (uint8_t *)v20;
      uint32_t v70 = 12;
LABEL_46:
      _os_log_impl(&dword_1C7B37000, v68, v53, v54, v69, v70);
      swift_arrayDestroy();
      uint64_t v71 = v21;
LABEL_47:
      MEMORY[0x1C87BC480](v71, -1, -1);
      uint64_t v72 = v20;
LABEL_48:
      MEMORY[0x1C87BC480](v72, -1, -1);
      goto LABEL_49;
    }
    goto LABEL_21;
  }
  if (v5[3] != a1)
  {
    uint64_t v15 = v5;
    if (qword_1EBC5E820 == -1) {
      goto LABEL_4;
    }
    goto LABEL_76;
  }
  v109 = v5;
  uint64_t v24 = v5[31];
  if (qword_1EBC5DCD8 != -1) {
    swift_once();
  }
  id v25 = v114;
  if ((qword_1EBC5DCD0 & ~v24) != 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1C7B7B090();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EBC5DC50);
    os_log_type_t v35 = v109;
    swift_retain_n();
    id v18 = sub_1C7B7B080();
    os_log_type_t v36 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v18, v36))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v117[0] = v21;
      *(_DWORD *)uint64_t v20 = 136380675;
      if (v35[26])
      {
        unint64_t v37 = v35[25];
        unint64_t v38 = v35[26];
      }
      else
      {
        uint64_t v55 = IDSCopyLocalDeviceUniqueID();
        if (v55)
        {
          os_log_type_t v56 = (void *)v55;
          unint64_t v37 = sub_1C7B7B1D0();
          unint64_t v38 = v57;
        }
        else
        {
          unint64_t v37 = 0xD000000000000017;
          unint64_t v38 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      v115[0] = sub_1C7B47DE8(v37, v38, v117);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v53 = v36;
      uint64_t v54 = "(%{private}s) Ignoring message send callback as the sync engine is disabled";
      goto LABEL_45;
    }
    goto LABEL_21;
  }
  if (!v114)
  {
    unint64_t v42 = v109;
    char v43 = v109 + 21;
    swift_beginAccess();
    uint64_t v44 = v42[21];
    if (*(void *)(v44 + 16))
    {
      uint64_t v45 = v113;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v46 = sub_1C7B49014(v112, v45);
      if (v47)
      {
        id v114 = v43;
        uint64_t v48 = *(void *)(*(void *)(v44 + 56) + 8 * v46);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v49 = v109[23];
        unint64_t v50 = *(void *)(v48 + 16);
        unint64_t v51 = *(void *)(v49 + 16);
        uint64_t v108 = v48;
        if (v50 <= v51 >> 3)
        {
          v115[0] = v49;
          swift_bridgeObjectRetain();
          sub_1C7B74F3C(v48);
          uint64_t v52 = v115[0];
        }
        else
        {
          swift_bridgeObjectRetain();
          uint64_t v52 = sub_1C7B755C4(v48, v49);
        }
        v109[23] = v52;
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t v73 = v113;
        swift_bridgeObjectRetain();
        sub_1C7B48C08(v112, v73);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v74 = sub_1C7B7AFF0();
        uint64_t v75 = (uint64_t)v111;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v111, 1, 1, v74);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_1C7B42710(v75, v112, v73);
        swift_endAccess();
        uint64_t v76 = v110;
        *long long v12 = v110;
        ((void (*)(void *, uint64_t, uint64_t))v15)(v12, v14, v9);
        id v77 = v76;
        LOBYTE(v76) = sub_1C7B7B180();
        v16(v12, v9);
        if (v76)
        {
          uint64_t v78 = v109;
          sub_1C7B69E2C();
          sub_1C7B701E8();
          uint64_t v15 = v78;
          uint64_t v75 = v108;
          if (qword_1EBC5E820 == -1) {
            goto LABEL_53;
          }
        }
        else
        {
          __break(1u);
        }
        swift_once();
LABEL_53:
        uint64_t v79 = sub_1C7B7B090();
        __swift_project_value_buffer(v79, (uint64_t)qword_1EBC5DC50);
        swift_retain_n();
        swift_bridgeObjectRetain();
        unint64_t v80 = sub_1C7B7B080();
        os_log_type_t v81 = sub_1C7B7B2D0();
        if (os_log_type_enabled(v80, v81))
        {
          uint64_t v82 = swift_slowAlloc();
          unint64_t v83 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v82 = 136381187;
          unint64_t v84 = v15[26];
          id v114 = v83;
          v115[0] = (uint64_t)v83;
          if (v84)
          {
            unint64_t v85 = v15[25];
            unint64_t v86 = v84;
          }
          else
          {
            uint64_t v94 = IDSCopyLocalDeviceUniqueID();
            if (v94)
            {
              char v95 = (void *)v94;
              unint64_t v85 = sub_1C7B7B1D0();
              unint64_t v86 = v96;
            }
            else
            {
              unint64_t v85 = 0xD000000000000017;
              unint64_t v86 = 0x80000001C7B80E00;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v116 = sub_1C7B47DE8(v85, v86, v115);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v82 + 12) = 2050;
          uint64_t v98 = *(void *)(v75 + 16);
          swift_bridgeObjectRelease();
          uint64_t v116 = v98;
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v82 + 22) = 2050;
          uint64_t v99 = *(void *)(v109[23] + 16);
          swift_release();
          uint64_t v116 = v99;
          uint64_t v15 = v109;
          sub_1C7B7B3A0();
          swift_release();
          _os_log_impl(&dword_1C7B37000, v80, v81, "(%{private}s) Removed %{public}ld records; %{public}ld remaining",
            (uint8_t *)v82,
            0x20u);
          id v100 = v114;
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v100, -1, -1);
          MEMORY[0x1C87BC480](v82, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
        }
        swift_retain_n();
        id v18 = sub_1C7B7B080();
        os_log_type_t v101 = sub_1C7B7B2D0();
        if (os_log_type_enabled(v18, v101))
        {
          uint64_t v20 = swift_slowAlloc();
          uint64_t v21 = swift_slowAlloc();
          v115[0] = v21;
          *(_DWORD *)uint64_t v20 = 136380931;
          if (v15[26])
          {
            unint64_t v102 = v15[25];
            unint64_t v103 = v15[26];
          }
          else
          {
            uint64_t v104 = IDSCopyLocalDeviceUniqueID();
            if (v104)
            {
              v105 = (void *)v104;
              unint64_t v102 = sub_1C7B7B1D0();
              unint64_t v103 = v106;
            }
            else
            {
              unint64_t v102 = 0xD000000000000017;
              unint64_t v103 = 0x80000001C7B80E00;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v116 = sub_1C7B47DE8(v102, v103, v115);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v20 + 12) = 2050;
          uint64_t v107 = *(void *)(v15[21] + 16);
          swift_release();
          uint64_t v116 = v107;
          sub_1C7B7B3A0();
          swift_release();
          os_log_type_t v53 = v101;
          uint64_t v54 = "(%{private}s) %{public}ld outstanding request identifiers";
          uint64_t v68 = v18;
          uint64_t v69 = (uint8_t *)v20;
          uint32_t v70 = 22;
          goto LABEL_46;
        }
LABEL_21:

        goto LABEL_22;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_1C7B7B090();
    __swift_project_value_buffer(v61, (uint64_t)qword_1EBC5DC50);
    unint64_t v62 = v113;
    swift_bridgeObjectRetain_n();
    uint64_t v63 = v109;
    swift_retain_n();
    id v18 = sub_1C7B7B080();
    os_log_type_t v64 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v18, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      id v114 = (id)swift_slowAlloc();
      v115[0] = (uint64_t)v114;
      *(_DWORD *)uint64_t v65 = 136380931;
      if (v63[26])
      {
        unint64_t v66 = v63[25];
        unint64_t v67 = v63[26];
      }
      else
      {
        uint64_t v87 = IDSCopyLocalDeviceUniqueID();
        if (v87)
        {
          int v88 = (void *)v87;
          unint64_t v66 = sub_1C7B7B1D0();
          unint64_t v67 = v89;
        }
        else
        {
          unint64_t v66 = 0xD000000000000017;
          unint64_t v67 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v116 = sub_1C7B47DE8(v66, v67, v115);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v116 = sub_1C7B47DE8(v112, v62, v115);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C7B37000, v18, v64, "(%{private}s) Ignoring message send callback as we have no metadata for the request identifier: %{public}s", (uint8_t *)v65, 0x16u);
      id v97 = v114;
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v97, -1, -1);
      uint64_t v72 = v65;
      goto LABEL_48;
    }

    swift_bridgeObjectRelease_n();
LABEL_22:
    swift_release_n();
    return;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1C7B7B090();
  __swift_project_value_buffer(v26, (uint64_t)qword_1EBC5DC50);
  unint64_t v27 = v109;
  swift_retain();
  id v28 = v25;
  swift_retain();
  id v29 = v25;
  id v18 = sub_1C7B7B080();
  os_log_type_t v30 = sub_1C7B7B2C0();
  if (os_log_type_enabled(v18, v30))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v117[0] = v31;
    *(_DWORD *)uint64_t v20 = 136380931;
    if (v27[26])
    {
      unint64_t v32 = v27[25];
      unint64_t v33 = v27[26];
    }
    else
    {
      uint64_t v58 = IDSCopyLocalDeviceUniqueID();
      if (v58)
      {
        unint64_t v59 = (void *)v58;
        unint64_t v32 = sub_1C7B7B1D0();
        unint64_t v33 = v60;
      }
      else
      {
        unint64_t v32 = 0xD000000000000017;
        unint64_t v33 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    v115[0] = sub_1C7B47DE8(v32, v33, v117);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    id v90 = v114;
    v115[0] = (uint64_t)v114;
    id v91 = v114;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9768);
    uint64_t v92 = sub_1C7B7B1F0();
    v115[0] = sub_1C7B47DE8(v92, v93, v117);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C7B37000, v18, v30, "(%{private}s) Error in didSendWithRequestIdentifier sending record modifications: %{public}s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    uint64_t v71 = v31;
    goto LABEL_47;
  }
  swift_release_n();

LABEL_49:
}

uint64_t SyncEngine.syncService(_:didUpdatePairedDevice:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *a3;
  uint64_t v7 = a3[1];
  __int16 v9 = *((_WORD *)a3 + 8);
  uint64_t v10 = *(NSObject **)(v3 + 120);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = a1;
  *(void *)(v11 + 32) = a2;
  *(void *)(v11 + 40) = v8;
  *(void *)(v11 + 48) = v7;
  *(_WORD *)(v11 + 56) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1C7B777FC;
  *(void *)(v12 + 24) = v11;
  v15[4] = sub_1C7B79034;
  v15[5] = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1C7B51770;
  v15[3] = &block_descriptor_136;
  int v13 = _Block_copy(v15);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_release();
  dispatch_sync(v10, v13);
  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v10) {
    __break(1u);
  }
  return result;
}

void sub_1C7B5F920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_1C7B7B160();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (uint64_t *)((char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void *)a3;
  uint64_t v12 = *(void *)(a3 + 8);
  __int16 v13 = *(_WORD *)(a3 + 16);
  uint64_t v14 = (void *)v4[15];
  *uint64_t v10 = v14;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCBF0], v7);
  id v15 = v14;
  LOBYTE(v14) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  if (v4[3] == a1)
  {
    uint64_t v23 = v4[31];
    if (qword_1EBC5DCD8 != -1) {
      swift_once();
    }
    if ((qword_1EBC5DCD0 & ~v23) == 0)
    {
      v36[0] = v11;
      v36[1] = v12;
      __int16 v37 = v13;
      sub_1C7B5FE4C((uint64_t)v36);
      return;
    }
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1C7B7B090();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v17 = sub_1C7B7B080();
    os_log_type_t v25 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v17, v25))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v36[0] = v20;
      *(_DWORD *)os_log_type_t v19 = 136380675;
      if (v4[26])
      {
        unint64_t v26 = v4[25];
        unint64_t v27 = v4[26];
      }
      else
      {
        uint64_t v33 = IDSCopyLocalDeviceUniqueID();
        if (v33)
        {
          uint64_t v34 = (void *)v33;
          unint64_t v26 = sub_1C7B7B1D0();
          unint64_t v27 = v35;
        }
        else
        {
          unint64_t v26 = 0xD000000000000017;
          unint64_t v27 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_1C7B47DE8(v26, v27, v36);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v31 = v25;
      unint64_t v32 = "(%{private}s) Ignoring message send callback as the sync engine is disabled";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  if (qword_1EBC5E820 != -1) {
    goto LABEL_27;
  }
LABEL_4:
  uint64_t v16 = sub_1C7B7B090();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v17 = sub_1C7B7B080();
  os_log_type_t v18 = sub_1C7B7B2C0();
  if (!os_log_type_enabled(v17, v18)) {
    goto LABEL_16;
  }
  os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
  uint64_t v20 = swift_slowAlloc();
  v36[0] = v20;
  *(_DWORD *)os_log_type_t v19 = 136380675;
  if (v4[26])
  {
    unint64_t v21 = v4[25];
    unint64_t v22 = v4[26];
  }
  else
  {
    uint64_t v28 = IDSCopyLocalDeviceUniqueID();
    if (v28)
    {
      id v29 = (void *)v28;
      unint64_t v21 = sub_1C7B7B1D0();
      unint64_t v22 = v30;
    }
    else
    {
      unint64_t v21 = 0xD000000000000017;
      unint64_t v22 = 0x80000001C7B80E00;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_1C7B47DE8(v21, v22, v36);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  os_log_type_t v31 = v18;
  unint64_t v32 = "(%{private}s) Ignoring message send callback as it is from an unknown sync service";
LABEL_25:
  _os_log_impl(&dword_1C7B37000, v17, v31, v32, v19, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v20, -1, -1);
  MEMORY[0x1C87BC480](v19, -1, -1);
}

uint64_t sub_1C7B5FDC0()
{
  sub_1C7B7B310();
  return v1;
}

void sub_1C7B5FE4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_1C7B7B160();
  uint64_t v5 = *(v4 - 1);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  int v10 = *(unsigned __int8 *)(a1 + 16);
  LODWORD(v61) = *(unsigned __int8 *)(a1 + 17);
  int v68 = *(unsigned __int16 *)(a1 + 16);
  uint64_t v14 = *(void **)(v2 + 120);
  *uint64_t v7 = v14;
  unsigned int v11 = *MEMORY[0x1E4FBCBF0];
  uint64_t v12 = v5 + 104;
  uint64_t v13 = *MEMORY[0x1E4FBCBF0];
  unint64_t v67 = *(void (**)(void *, uint64_t, void *))(v5 + 104);
  v67(v7, v13, v4);
  id v65 = v14;
  LODWORD(v14) = sub_1C7B7B180();
  unint64_t v66 = *(void (**)(void *, void *))(v5 + 8);
  v66(v7, v4);
  if (v14)
  {
    unsigned int v64 = v11;
    uint64_t v62 = v5 + 104;
    uint64_t v63 = v4;
    uint64_t v69 = v8;
    id v15 = *(os_unfair_lock_s **)(*(void *)(v2 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v15);
    uint64_t v16 = *(void *)(v2 + 224);
    uint64_t v14 = *(void **)(v2 + 232);
    __int16 v17 = *(_WORD *)(v2 + 240);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v15);
    swift_release();
    uint64_t v4 = &unk_1EBC5E000;
    if (v9)
    {
      if (v14)
      {
        uint64_t v12 = v69;
        if (v69 == v16 && (void *)v9 == v14 || (sub_1C7B7B5E0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          if (v10 == v17 && ((((v17 & 0x100) == 0) ^ v61) & 1) != 0)
          {
            LODWORD(v14) = 0;
            goto LABEL_29;
          }
          goto LABEL_15;
        }
LABEL_14:
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_1EBC5E820 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_1C7B7B090();
        __swift_project_value_buffer(v18, (uint64_t)qword_1EBC5DC50);
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        os_log_type_t v19 = sub_1C7B7B080();
        int v20 = sub_1C7B7B2D0();
        if (os_log_type_enabled(v19, (os_log_type_t)v20))
        {
          uint64_t v21 = swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          uint64_t v73 = v59;
          *(_DWORD *)uint64_t v21 = 136381187;
          unint64_t v22 = *(void *)(v2 + 208);
          os_log_t v61 = v19;
          int v60 = v20;
          if (v22)
          {
            unint64_t v23 = *(void *)(v2 + 200);
            unint64_t v24 = v22;
          }
          else
          {
            uint64_t v25 = IDSCopyLocalDeviceUniqueID();
            if (v25)
            {
              unint64_t v26 = (void *)v25;
              unint64_t v23 = sub_1C7B7B1D0();
              unint64_t v24 = v27;
            }
            else
            {
              unint64_t v23 = 0xD000000000000017;
              unint64_t v24 = 0x80000001C7B80E00;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v70 = sub_1C7B47DE8(v23, v24, &v73);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v21 + 12) = 2082;
          uint64_t v58 = v21 + 14;
          uint64_t v28 = *(os_unfair_lock_s **)(*(void *)(v2 + 216) + 16);
          swift_retain();
          os_unfair_lock_lock(v28);
          uint64_t v29 = *(void *)(v2 + 224);
          unint64_t v30 = *(void *)(v2 + 232);
          __int16 v31 = *(_WORD *)(v2 + 240);
          swift_bridgeObjectRetain();
          os_unfair_lock_unlock(v28);
          swift_release();
          uint64_t v70 = v29;
          unint64_t v71 = v30;
          __int16 v72 = v31;
          __swift_instantiateConcreteTypeFromMangledName(qword_1EBC5E1F0);
          uint64_t v32 = sub_1C7B7B1F0();
          uint64_t v70 = sub_1C7B47DE8(v32, v33, &v73);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v21 + 22) = 2082;
          uint64_t v12 = v69;
          uint64_t v70 = v69;
          unint64_t v71 = v9;
          __int16 v72 = v68;
          swift_bridgeObjectRetain();
          uint64_t v34 = sub_1C7B7B1F0();
          uint64_t v70 = sub_1C7B47DE8(v34, v35, &v73);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          os_log_t v36 = v61;
          _os_log_impl(&dword_1C7B37000, v61, (os_log_type_t)v60, "(%{private}s) Paired device changed from %{public}s to %{public}s ", (uint8_t *)v21, 0x20u);
          uint64_t v37 = v59;
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v37, -1, -1);
          MEMORY[0x1C87BC480](v21, -1, -1);

          uint64_t v4 = &unk_1EBC5E000;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
        }
        uint64_t v38 = v64;
        uint64_t v39 = v65;
        *uint64_t v7 = v65;
        uint64_t v40 = v63;
        v67(v7, v38, v63);
        id v41 = v39;
        LOBYTE(v39) = sub_1C7B7B180();
        v66(v7, v40);
        if ((v39 & 1) == 0)
        {
          __break(1u);
LABEL_49:
          swift_once();
          goto LABEL_36;
        }
        uint64_t v42 = *(void *)(v2 + 136);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v42 + 24))(ObjectType, v42);
        uint64_t v44 = *(os_unfair_lock_s **)(*(void *)(v2 + 216) + 16);
        swift_bridgeObjectRetain();
        swift_retain();
        os_unfair_lock_lock(v44);
        *(void *)(v2 + 224) = v12;
        *(void *)(v2 + 232) = v9;
        *(_WORD *)(v2 + 240) = v68;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        os_unfair_lock_unlock(v44);
        swift_bridgeObjectRelease();
        swift_release();
        LODWORD(v14) = 1;
LABEL_29:
        uint64_t v8 = *(void *)(v2 + 248);
        if (qword_1EBC5DCD8 == -1) {
          goto LABEL_30;
        }
        goto LABEL_47;
      }
      swift_bridgeObjectRetain();
    }
    else if (!v14)
    {
      uint64_t v12 = v69;
      goto LABEL_29;
    }
    uint64_t v12 = v69;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  __break(1u);
LABEL_47:
  swift_once();
LABEL_30:
  if ((qword_1EBC5DCD0 & ~v8) == 0)
  {
    if (v14)
    {
      sub_1C7B5CCFC();
      if (v9)
      {
        char v45 = BYTE1(v68) & 1;
        uint64_t v46 = *(void *)(v2 + 64);
        uint64_t v47 = *(void *)(v2 + 72);
        __swift_project_boxed_opaque_existential_1((void *)(v2 + 40), v46);
        if ((*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v47 + 136))(v12, v9, v46, v47))
        {
          LOBYTE(v70) = v45;
          sub_1C7B60DCC(v12, v9, (unsigned __int8 *)&v70);
        }
        else
        {
          LOBYTE(v70) = v45;
          sub_1C7B693D0(v12, v9, (char *)&v70);
        }
      }
    }
    return;
  }
  if (v4[260] != -1) {
    goto LABEL_49;
  }
LABEL_36:
  uint64_t v48 = sub_1C7B7B090();
  __swift_project_value_buffer(v48, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v49 = sub_1C7B7B080();
  os_log_type_t v50 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v49, v50))
  {
    unint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v70 = v52;
    *(_DWORD *)unint64_t v51 = 136380675;
    if (*(void *)(v2 + 208))
    {
      unint64_t v53 = *(void *)(v2 + 200);
      unint64_t v54 = *(void *)(v2 + 208);
    }
    else
    {
      uint64_t v55 = IDSCopyLocalDeviceUniqueID();
      if (v55)
      {
        os_log_type_t v56 = (void *)v55;
        unint64_t v53 = sub_1C7B7B1D0();
        unint64_t v54 = v57;
      }
      else
      {
        unint64_t v53 = 0xD000000000000017;
        unint64_t v54 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v73 = sub_1C7B47DE8(v53, v54, &v70);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v49, v50, "(%{private}s) Ignoring paired device/enabled channge as the sync engine is not available", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v52, -1, -1);
    MEMORY[0x1C87BC480](v51, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

void sub_1C7B606C4(char *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1C7B7B160();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unsigned int v11 = (uint64_t *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v12 = *a1;
  uint64_t v13 = (void *)v4[15];
  *unsigned int v11 = v13;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  id v14 = v13;
  uint64_t v15 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v15)
  {
    uint64_t v15 = v4[31];
    if (qword_1EBC5DCD8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  if ((qword_1EBC5DCD0 & ~v15) != 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C7B7B090();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    __int16 v17 = sub_1C7B7B080();
    os_log_type_t v18 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v17, v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(void *)&long long v28 = v20;
      *(_DWORD *)os_log_type_t v19 = 136380675;
      if (v4[26])
      {
        unint64_t v21 = v4[25];
        unint64_t v22 = v4[26];
      }
      else
      {
        uint64_t v24 = IDSCopyLocalDeviceUniqueID();
        if (v24)
        {
          uint64_t v25 = (void *)v24;
          unint64_t v21 = sub_1C7B7B1D0();
          unint64_t v22 = v26;
        }
        else
        {
          unint64_t v21 = 0xD000000000000017;
          unint64_t v22 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_1C7B47DE8(v21, v22, (uint64_t *)&v28);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v17, v18, "(%{private}s) Will not handle message because sync is inactive", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v20, -1, -1);
      MEMORY[0x1C87BC480](v19, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    sub_1C7B7AF00();
    swift_allocObject();
    sub_1C7B7AEF0();
    sub_1C7B78E48();
    sub_1C7B7AEE0();
    long long v23 = v28;
    switch(v29)
    {
      case 1:
        LOBYTE(v30) = v12;
        sub_1C7B56760(v28, *((uint64_t *)&v28 + 1), 1u);
        sub_1C7B62858((uint64_t)&v28, v23, *((uint64_t *)&v23 + 1), a2, a3, (unsigned __int8 *)&v30);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        sub_1C7B56D6C(v23, *((uint64_t *)&v23 + 1), 1u);
        break;
      case 2:
        char v29 = 2;
        LOBYTE(v30) = v28 & 1;
        HIBYTE(v27) = v12;
        sub_1C7B56760(v28, *((uint64_t *)&v28 + 1), 2u);
        sub_1C7B61A84((unint64_t)&v28, (unsigned __int8 *)&v30, *((uint64_t *)&v23 + 1), a2, a3, (unsigned __int8 *)&v27 + 7);
        swift_release();
        sub_1C7B56D6C(v23, *((uint64_t *)&v23 + 1), 2u);
        sub_1C7B56D6C(v23, *((uint64_t *)&v23 + 1), 2u);
        break;
      case 3:
        LOBYTE(v30) = v12;
        if (v28 == 0) {
          sub_1C7B621C8((uint64_t)&v28, a2, a3, (unsigned __int8 *)&v30);
        }
        else {
          sub_1C7B62510((uint64_t)&v28, a2, a3, (unsigned __int8 *)&v30);
        }
        swift_release();
        sub_1C7B56D6C(v23, *((uint64_t *)&v23 + 1), 3u);
        break;
      default:
        LOBYTE(v30) = v12;
        sub_1C7B56760(v28, *((uint64_t *)&v28 + 1), 0);
        sub_1C7B63094((uint64_t)&v28, v23, *((uint64_t *)&v23 + 1), a2, a3, (char *)&v30);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        sub_1C7B56D6C(v23, *((uint64_t *)&v23 + 1), 0);
        break;
    }
  }
}

void sub_1C7B60DCC(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1C7B7AFF0();
  uint64_t v94 = *(void *)(v8 - 8);
  uint64_t v95 = v8;
  MEMORY[0x1F4188790](v8);
  unint64_t v93 = &v89[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_1C7B7B160();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = &v89[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  LODWORD(v14) = *a3;
  uint64_t v15 = (void *)v4[15];
  *uint64_t v13 = v15;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4FBCBF0], v10);
  id v16 = v15;
  uint64_t v17 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v17 & 1) == 0)
  {
LABEL_73:
    __break(1u);
LABEL_74:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v18 = v4[13];
  uint64_t v19 = v4[14];
  __swift_project_boxed_opaque_existential_1(v4 + 10, v18);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1C7B7B090();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    unint64_t v21 = sub_1C7B7B080();
    os_log_type_t v28 = sub_1C7B7B2D0();
    if (!os_log_type_enabled(v21, v28)) {
      goto LABEL_26;
    }
    long long v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v98[0] = v24;
    *(_DWORD *)long long v23 = 136380675;
    if (v4[26])
    {
      unint64_t v29 = v4[25];
      unint64_t v30 = v4[26];
    }
    else
    {
      uint64_t v39 = IDSCopyLocalDeviceUniqueID();
      if (v39)
      {
        uint64_t v40 = (void *)v39;
        unint64_t v29 = sub_1C7B7B1D0();
        unint64_t v30 = v41;
      }
      else
      {
        unint64_t v29 = 0xD000000000000017;
        unint64_t v30 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_1C7B47DE8(v29, v30, v98);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_type_t v81 = v28;
    uint64_t v82 = "(%{private}s) Will not sync because keybag is locked";
    goto LABEL_71;
  }
  uint64_t v17 = v4[31];
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_74;
  }
LABEL_4:
  if ((qword_1EBC5DCD0 & ~v17) != 0)
  {
    if (qword_1EBC5E820 != -1) {
      goto LABEL_76;
    }
    goto LABEL_18;
  }
  if (!a2)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_1C7B7B090();
    __swift_project_value_buffer(v35, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    unint64_t v21 = sub_1C7B7B080();
    os_log_type_t v36 = sub_1C7B7B2D0();
    if (!os_log_type_enabled(v21, v36)) {
      goto LABEL_26;
    }
    long long v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v98[0] = v24;
    *(_DWORD *)long long v23 = 136380675;
    if (v4[26])
    {
      unint64_t v37 = v4[25];
      unint64_t v38 = v4[26];
    }
    else
    {
      uint64_t v83 = IDSCopyLocalDeviceUniqueID();
      if (v83)
      {
        unint64_t v84 = (void *)v83;
        unint64_t v37 = sub_1C7B7B1D0();
        unint64_t v38 = v85;
      }
      else
      {
        unint64_t v37 = 0xD000000000000017;
        unint64_t v38 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_1C7B47DE8(v37, v38, v98);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_type_t v81 = v36;
    uint64_t v82 = "(%{private}s) Will not sync because pairedDeviceIdentifier is nil";
LABEL_71:
    _os_log_impl(&dword_1C7B37000, v21, v81, v82, v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v24, -1, -1);
    MEMORY[0x1C87BC480](v23, -1, -1);

    return;
  }
  if (v14 == 2)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1C7B7B090();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    unint64_t v21 = sub_1C7B7B080();
    os_log_type_t v22 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v21, v22))
    {
      long long v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v98[0] = v24;
      *(_DWORD *)long long v23 = 136380675;
      if (v4[26])
      {
        unint64_t v25 = v4[25];
        unint64_t v26 = v4[26];
      }
      else
      {
        uint64_t v86 = IDSCopyLocalDeviceUniqueID();
        if (v86)
        {
          uint64_t v87 = (void *)v86;
          unint64_t v25 = sub_1C7B7B1D0();
          unint64_t v26 = v88;
        }
        else
        {
          unint64_t v25 = 0xD000000000000017;
          unint64_t v26 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v99 = sub_1C7B47DE8(v25, v26, v98);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v81 = v22;
      uint64_t v82 = "(%{private}s) Will not sync because version is nil";
      goto LABEL_71;
    }
    goto LABEL_26;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v91 = a1;
  unint64_t v92 = a2;
  int v90 = v14 & 1;
  uint64_t v42 = sub_1C7B7B090();
  __swift_project_value_buffer(v42, (uint64_t)qword_1EBC5DC50);
  uint64_t v17 = sub_1C7B7B080();
  os_log_type_t v43 = sub_1C7B7B2D0();
  if (os_log_type_enabled((os_log_t)v17, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_1C7B37000, (os_log_t)v17, v43, "Performing sync for all data sources", v44, 2u);
    MEMORY[0x1C87BC480](v44, -1, -1);
  }

  uint64_t v100 = MEMORY[0x1E4FBC860];
  swift_beginAccess();
  uint64_t v45 = v4[18];
  uint64_t v46 = *(void *)(v45 + 64);
  unint64_t v96 = (void *)(v45 + 64);
  uint64_t v47 = 1 << *(unsigned char *)(v45 + 32);
  uint64_t v48 = -1;
  if (v47 < 64) {
    uint64_t v48 = ~(-1 << v47);
  }
  a2 = v48 & v46;
  uint64_t v97 = (unint64_t)(v47 + 63) >> 6;
  swift_bridgeObjectRetain();
  a1 = 0;
  while (1)
  {
    if (a2)
    {
      unint64_t v50 = __clz(__rbit64(a2));
      a2 &= a2 - 1;
      unint64_t v51 = v50 | (a1 << 6);
      goto LABEL_54;
    }
    uint64_t v52 = a1 + 1;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
      goto LABEL_73;
    }
    if (v52 >= v97) {
      goto LABEL_56;
    }
    unint64_t v53 = v96[v52];
    ++a1;
    if (!v53)
    {
      a1 = v52 + 1;
      if (v52 + 1 >= v97) {
        goto LABEL_56;
      }
      unint64_t v53 = v96[a1];
      if (!v53)
      {
        a1 = v52 + 2;
        if (v52 + 2 >= v97) {
          goto LABEL_56;
        }
        unint64_t v53 = v96[a1];
        if (!v53) {
          break;
        }
      }
    }
LABEL_53:
    a2 = (v53 - 1) & v53;
    unint64_t v51 = __clz(__rbit64(v53)) + (a1 << 6);
LABEL_54:
    uint64_t v55 = *(void *)(*(void *)(v45 + 56) + 8 * v51);
    v98[3] = type metadata accessor for SyncEngine();
    v98[4] = (uint64_t)&protocol witness table for SyncEngine;
    v98[0] = (uint64_t)v4;
    if (MEMORY[0x1C87BC500](v55 + 16))
    {
      uint64_t v14 = *(void *)(v55 + 24);
      uint64_t ObjectType = swift_getObjectType();
      unint64_t v57 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v14 + 32);
      swift_retain_n();
      swift_retain();
      uint64_t v49 = v57(v98, ObjectType, v14);
      swift_unknownObjectRelease();
    }
    else
    {
      swift_retain_n();
      swift_retain();
      uint64_t v49 = MEMORY[0x1E4FBC860];
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
    swift_release();
    uint64_t v17 = (uint64_t)&v100;
    sub_1C7B6A148(v49);
    swift_release();
  }
  uint64_t v54 = v52 + 3;
  if (v54 >= v97)
  {
LABEL_56:
    swift_release();
    uint64_t v58 = v4[8];
    uint64_t v59 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v58);
    uint64_t v97 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v59 + 24))(v91, v92, v58, v59);
    uint64_t v60 = v4[8];
    uint64_t v61 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v60);
    uint64_t v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 8);
    uint64_t v63 = swift_bridgeObjectRetain();
    uint64_t v64 = v62(v63, v60, v61);
    swift_bridgeObjectRelease();
    uint64_t v65 = v4[8];
    uint64_t v66 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v65);
    unint64_t v67 = v93;
    sub_1C7B7AFD0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v66 + 40))(v67, v64, v65, v66);
    uint64_t v68 = v95;
    unint64_t v96 = *(void **)(v94 + 8);
    ((void (*)(unsigned char *, uint64_t))v96)(v67, v95);
    v98[0] = v64;
    sub_1C7B6A148(v97);
    uint64_t v97 = v98[0];
    uint64_t v69 = v4[8];
    uint64_t v70 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v69);
    uint64_t v71 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v70 + 32))(v91, v92, v69, v70);
    uint64_t v73 = v4[8];
    uint64_t v72 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v73);
    uint64_t v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v100, v73, v72);
    swift_bridgeObjectRelease();
    uint64_t v75 = v4[8];
    uint64_t v76 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v75);
    sub_1C7B7AFD0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v76 + 48))(v67, v74, v75, v76);
    ((void (*)(unsigned char *, uint64_t))v96)(v67, v68);
    v98[0] = v71;
    sub_1C7B6A148(v74);
    unint64_t v77 = v98[0];
    LOBYTE(v98[0]) = v90;
    sub_1C7B6A29C(v97, v77, v91, v92, (unsigned __int8 *)v98);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v53 = v96[v54];
  if (v53)
  {
    a1 = v54;
    goto LABEL_53;
  }
  while (1)
  {
    a1 = v54 + 1;
    if (__OFADD__(v54, 1)) {
      break;
    }
    if (a1 >= v97) {
      goto LABEL_56;
    }
    unint64_t v53 = v96[a1];
    ++v54;
    if (v53) {
      goto LABEL_53;
    }
  }
  __break(1u);
LABEL_76:
  swift_once();
LABEL_18:
  uint64_t v31 = sub_1C7B7B090();
  __swift_project_value_buffer(v31, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  unint64_t v21 = sub_1C7B7B080();
  os_log_type_t v32 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v21, v32))
  {
    long long v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v98[0] = v24;
    *(_DWORD *)long long v23 = 136380675;
    if (v4[26])
    {
      unint64_t v33 = v4[25];
      unint64_t v34 = v4[26];
    }
    else
    {
      uint64_t v78 = IDSCopyLocalDeviceUniqueID();
      if (v78)
      {
        uint64_t v79 = (void *)v78;
        unint64_t v33 = sub_1C7B7B1D0();
        unint64_t v34 = v80;
      }
      else
      {
        unint64_t v33 = 0xD000000000000017;
        unint64_t v34 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v99 = sub_1C7B47DE8(v33, v34, v98);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_type_t v81 = v32;
    uint64_t v82 = "(%{private}s) Will not sync because sync is inactive";
    goto LABEL_71;
  }
LABEL_26:

  swift_release_n();
}

uint64_t sub_1C7B61A84(unint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  uint64_t v7 = v6;
  uint64_t v69 = a4;
  uint64_t v70 = a3;
  uint64_t v11 = sub_1C7B7AFF0();
  uint64_t v66 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v67 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C7B7B160();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  id v16 = (void *)((char *)v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void *)a1;
  uint64_t v64 = *(void *)(a1 + 8);
  uint64_t v65 = v17;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 16);
  int v19 = *a2;
  int v20 = *a6;
  unint64_t v21 = *(void **)(v7 + 120);
  *id v16 = v21;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E4FBCBF0], v13);
  id v22 = v21;
  LOBYTE(v21) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if (v21)
  {
    int v63 = v20;
    uint64_t v68 = a5;
    if (qword_1EBC5E820 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v23 = sub_1C7B7B090();
  uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  unint64_t v25 = sub_1C7B7B080();
  os_log_type_t v26 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v62 = v11;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v71[0] = v28;
    *(_DWORD *)uint64_t v27 = 136380931;
    unint64_t v29 = *(void *)(v7 + 208);
    int v61 = a1;
    v60[1] = v24;
    if (v29)
    {
      unint64_t v30 = *(void *)(v7 + 200);
      unint64_t v31 = v29;
    }
    else
    {
      uint64_t v32 = IDSCopyLocalDeviceUniqueID();
      if (v32)
      {
        unint64_t v33 = (void *)v32;
        unint64_t v30 = sub_1C7B7B1D0();
        unint64_t v31 = v34;
      }
      else
      {
        unint64_t v30 = 0xD000000000000017;
        unint64_t v31 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v73 = sub_1C7B47DE8(v30, v31, v71);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2082;
    if (v19) {
      uint64_t v35 = 0x6563616C706572;
    }
    else {
      uint64_t v35 = 0x657461647075;
    }
    if (v19) {
      a1 = 0xE700000000000000;
    }
    else {
      a1 = 0xE600000000000000;
    }
    uint64_t v73 = sub_1C7B47DE8(v35, a1, v71);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v25, v26, "(%{private}s) Received ack message for action %{public}s", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v28, -1, -1);
    MEMORY[0x1C87BC480](v27, -1, -1);

    uint64_t v11 = v62;
    LOBYTE(a1) = v61;
  }
  else
  {

    swift_release_n();
  }
  os_log_type_t v36 = *(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t))(v7 + 256);
  uint64_t v37 = v68;
  uint64_t v38 = v69;
  if (v36)
  {
    v71[0] = v65;
    v71[1] = v64;
    char v72 = a1;
    LOBYTE(v73) = v19;
    swift_retain();
    v36(v71, &v73, v70, v38, v37);
    sub_1C7B53CBC((uint64_t)v36);
  }
  if (v19)
  {
    swift_retain_n();
    uint64_t v39 = sub_1C7B7B080();
    os_log_type_t v40 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = v11;
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v71[0] = v43;
      *(_DWORD *)uint64_t v42 = 136380675;
      if (*(void *)(v7 + 208))
      {
        unint64_t v44 = *(void *)(v7 + 200);
        unint64_t v45 = *(void *)(v7 + 208);
      }
      else
      {
        uint64_t v46 = IDSCopyLocalDeviceUniqueID();
        if (v46)
        {
          uint64_t v47 = (void *)v46;
          unint64_t v44 = sub_1C7B7B1D0();
          unint64_t v45 = v48;
        }
        else
        {
          unint64_t v44 = 0xD000000000000017;
          unint64_t v45 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v73 = sub_1C7B47DE8(v44, v45, v71);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v39, v40, "(%{private}s) Paired device has performed an initial sync", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v43, -1, -1);
      MEMORY[0x1C87BC480](v42, -1, -1);

      uint64_t v11 = v41;
      uint64_t v37 = v68;
      uint64_t v38 = v69;
    }
    else
    {

      swift_release_n();
    }
    uint64_t v49 = *(void *)(v7 + 64);
    uint64_t v50 = *(void *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), v49);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 144))(v38, v37, v49, v50);
  }
  unint64_t v51 = v67;
  sub_1C7B7AFD0();
  char v52 = *(unsigned char *)(v7 + 16);
  uint64_t v53 = *(void *)(v7 + 64);
  uint64_t v54 = *(void *)(v7 + 72);
  __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), v53);
  if (v52)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 64))(v51, v70, v38, v37, v53, v54);
    uint64_t v55 = *(void *)(v7 + 64);
    uint64_t v56 = *(void *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), v55);
    if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 136))(v38, v37, v55, v56) & 1) == 0)
    {
      LOBYTE(v71[0]) = v63;
      sub_1C7B693D0(v38, v37, (char *)v71);
    }
  }
  else if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 136))(v38, v37, v53, v54))
  {
    uint64_t v57 = *(void *)(v7 + 64);
    uint64_t v58 = *(void *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), v57);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 64))(v51, v70, v38, v37, v57, v58);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v51, v11);
}

void sub_1C7B621C8(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (uint64_t *)((char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v13) = *a4;
  uint64_t v14 = (void *)v5[15];
  *uint64_t v12 = v14;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FBCBF0], v9);
  id v15 = v14;
  LOBYTE(v14) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  if (v14)
  {
    if (qword_1EBC5E820 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v16 = sub_1C7B7B090();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v17 = sub_1C7B7B080();
  os_log_type_t v18 = sub_1C7B7B2D0();
  if (!os_log_type_enabled(v17, v18))
  {

    swift_release_n();
    uint64_t v24 = (void (*)(uint64_t))v5[34];
    if (!v24) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v19 = (uint8_t *)swift_slowAlloc();
  uint64_t v20 = swift_slowAlloc();
  uint64_t v32 = v20;
  *(_DWORD *)int v19 = 136380675;
  unint64_t v21 = v5[26];
  uint64_t v30 = a2;
  HIDWORD(v29) = v13;
  unint64_t v22 = a3;
  if (v21)
  {
    unint64_t v13 = v5[25];
    unint64_t v23 = v21;
  }
  else
  {
    uint64_t v25 = IDSCopyLocalDeviceUniqueID();
    if (v25)
    {
      os_log_type_t v26 = (void *)v25;
      unint64_t v13 = sub_1C7B7B1D0();
      unint64_t v23 = v27;
    }
    else
    {
      unint64_t v23 = 0x80000001C7B80E00;
      unint64_t v13 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_1C7B47DE8(v13, v23, &v32);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C7B37000, v17, v18, "(%{private}s) Received unlock message", v19, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v20, -1, -1);
  MEMORY[0x1C87BC480](v19, -1, -1);

  a3 = v22;
  a2 = v30;
  LOBYTE(v13) = BYTE4(v29);
  uint64_t v24 = (void (*)(uint64_t))v5[34];
  if (v24)
  {
LABEL_12:
    uint64_t v28 = swift_retain();
    v24(v28);
    sub_1C7B53CBC((uint64_t)v24);
  }
LABEL_13:
  sub_1C7B69B00();
  sub_1C7B69E2C();
  LOBYTE(v32) = v13;
  sub_1C7B60DCC(a2, a3, (unsigned __int8 *)&v32);
}

void sub_1C7B62510(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = sub_1C7B7B160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v13) = *a4;
  uint64_t v14 = (void *)v5[15];
  *uint64_t v12 = v14;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4FBCBF0], v9);
  id v15 = v14;
  LOBYTE(v14) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  if (v14)
  {
    if (qword_1EBC5E820 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v16 = sub_1C7B7B090();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v17 = sub_1C7B7B080();
  os_log_type_t v18 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v17, v18))
  {
    int v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = v20;
    *(_DWORD *)int v19 = 136380675;
    unint64_t v21 = v5[26];
    unint64_t v29 = a3;
    HIDWORD(v28) = v13;
    if (v21)
    {
      unint64_t v13 = v5[25];
      unint64_t v22 = v21;
    }
    else
    {
      uint64_t v23 = IDSCopyLocalDeviceUniqueID();
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        unint64_t v13 = sub_1C7B7B1D0();
        unint64_t v22 = v25;
      }
      else
      {
        unint64_t v22 = 0x80000001C7B80E00;
        unint64_t v13 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_1C7B47DE8(v13, v22, &v31);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v17, v18, "(%{private}s) Received resync message", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v20, -1, -1);
    MEMORY[0x1C87BC480](v19, -1, -1);

    a3 = v29;
    LOBYTE(v13) = BYTE4(v28);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v26 = v5[8];
  uint64_t v27 = v5[9];
  __swift_project_boxed_opaque_existential_1(v5 + 5, v26);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v27 + 120))(a2, a3, v26, v27);
  sub_1C7B69B00();
  sub_1C7B69E2C();
  LOBYTE(v31) = v13;
  sub_1C7B60DCC(a2, a3, (unsigned __int8 *)&v31);
}

void sub_1C7B62858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  uint64_t v7 = v6;
  uint64_t v71 = a4;
  uint64_t v72 = a5;
  uint64_t v11 = sub_1C7B7B160();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (uint64_t *)((char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v68 = *a6;
  id v15 = *(void **)(v7 + 120);
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCBF0], v11);
  id v16 = v15;
  LOBYTE(v15) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0) {
    goto LABEL_57;
  }
  uint64_t v66 = a2;
  uint64_t v67 = a3;
  if (qword_1EBC5E820 != -1) {
LABEL_58:
  }
    swift_once();
  uint64_t v17 = sub_1C7B7B090();
  __swift_project_value_buffer(v17, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  os_log_type_t v18 = sub_1C7B7B080();
  os_log_type_t v19 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    v74[0] = v21;
    *(_DWORD *)uint64_t v20 = 136380675;
    if (*(void *)(v7 + 208))
    {
      unint64_t v22 = *(void *)(v7 + 200);
      unint64_t v23 = *(void *)(v7 + 208);
    }
    else
    {
      uint64_t v24 = IDSCopyLocalDeviceUniqueID();
      if (v24)
      {
        unint64_t v25 = (void *)v24;
        unint64_t v22 = sub_1C7B7B1D0();
        unint64_t v23 = v26;
      }
      else
      {
        unint64_t v22 = 0xD000000000000017;
        unint64_t v23 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_1C7B47DE8(v22, v23, v74);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v18, v19, "(%{private}s) Received replace message", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v21, -1, -1);
    MEMORY[0x1C87BC480](v20, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v27 = *(void *)(v7 + 248);
  if (qword_1EBC5DCD8 != -1) {
    swift_once();
  }
  if ((qword_1EBC5DCD0 & ~v27) != 0)
  {
    swift_retain_n();
    uint64_t v43 = sub_1C7B7B080();
    os_log_type_t v44 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v43, v44))
    {
      unint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      v74[0] = v46;
      *(_DWORD *)unint64_t v45 = 136380675;
      if (*(void *)(v7 + 208))
      {
        unint64_t v47 = *(void *)(v7 + 200);
        unint64_t v48 = *(void *)(v7 + 208);
      }
      else
      {
        uint64_t v58 = IDSCopyLocalDeviceUniqueID();
        if (v58)
        {
          uint64_t v59 = (void *)v58;
          unint64_t v47 = sub_1C7B7B1D0();
          unint64_t v48 = v60;
        }
        else
        {
          unint64_t v47 = 0xD000000000000017;
          unint64_t v48 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_1C7B47DE8(v47, v48, v74);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v64 = v44;
      uint64_t v65 = "(%{private}s) Will not handle message because sync is inactive";
      goto LABEL_54;
    }
LABEL_44:

    swift_release_n();
    return;
  }
  if (*(unsigned char *)(v7 + 16) == 1)
  {
    swift_beginAccess();
    uint64_t v28 = *(void *)(v7 + 144);
    uint64_t v29 = *(void *)(v28 + 64);
    uint64_t v69 = v28 + 64;
    uint64_t v30 = 1 << *(unsigned char *)(v28 + 32);
    uint64_t v31 = -1;
    if (v30 < 64) {
      uint64_t v31 = ~(-1 << v30);
    }
    unint64_t v32 = v31 & v29;
    int64_t v70 = (unint64_t)(v30 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v33 = 0;
    while (1)
    {
      if (v32)
      {
        unint64_t v34 = __clz(__rbit64(v32));
        v32 &= v32 - 1;
        unint64_t v35 = v34 | (v33 << 6);
      }
      else
      {
        int64_t v36 = v33 + 1;
        if (__OFADD__(v33, 1))
        {
          __break(1u);
          goto LABEL_56;
        }
        if (v36 >= v70) {
          goto LABEL_45;
        }
        unint64_t v37 = *(void *)(v69 + 8 * v36);
        ++v33;
        if (!v37)
        {
          int64_t v33 = v36 + 1;
          if (v36 + 1 >= v70) {
            goto LABEL_45;
          }
          unint64_t v37 = *(void *)(v69 + 8 * v33);
          if (!v37)
          {
            int64_t v33 = v36 + 2;
            if (v36 + 2 >= v70) {
              goto LABEL_45;
            }
            unint64_t v37 = *(void *)(v69 + 8 * v33);
            if (!v37)
            {
              int64_t v38 = v36 + 3;
              if (v38 >= v70)
              {
LABEL_45:
                swift_release();
                uint64_t v52 = *(void *)(v7 + 64);
                uint64_t v53 = *(void *)(v7 + 72);
                __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), v52);
                (*(void (**)(uint64_t, uint64_t))(v53 + 80))(v52, v53);
                uint64_t v54 = *(void *)(v7 + 64);
                uint64_t v55 = *(void *)(v7 + 72);
                __swift_project_boxed_opaque_existential_1((void *)(v7 + 40), v54);
                uint64_t v57 = v71;
                uint64_t v56 = v72;
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 144))(v71, v72, v54, v55);
                LOBYTE(v74[0]) = v68;
                unsigned __int8 v73 = 1;
                sub_1C7B635A8(v66, v67, v57, v56, (unsigned __int8 *)v74, &v73);
                return;
              }
              unint64_t v37 = *(void *)(v69 + 8 * v38);
              if (!v37)
              {
                while (1)
                {
                  int64_t v33 = v38 + 1;
                  if (__OFADD__(v38, 1)) {
                    break;
                  }
                  if (v33 >= v70) {
                    goto LABEL_45;
                  }
                  unint64_t v37 = *(void *)(v69 + 8 * v33);
                  ++v38;
                  if (v37) {
                    goto LABEL_35;
                  }
                }
LABEL_56:
                __break(1u);
LABEL_57:
                __break(1u);
                goto LABEL_58;
              }
              int64_t v33 = v38;
            }
          }
        }
LABEL_35:
        unint64_t v32 = (v37 - 1) & v37;
        unint64_t v35 = __clz(__rbit64(v37)) + (v33 << 6);
      }
      uint64_t v39 = *(void *)(*(void *)(v28 + 56) + 8 * v35);
      v74[3] = type metadata accessor for SyncEngine();
      v74[4] = (uint64_t)&protocol witness table for SyncEngine;
      v74[0] = v7;
      if (MEMORY[0x1C87BC500](v39 + 16))
      {
        uint64_t v40 = *(void *)(v39 + 24);
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v42 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 48);
        swift_retain_n();
        swift_retain();
        v42(v74, v71, v72, ObjectType, v40);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_retain_n();
        swift_retain();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
      swift_release();
      swift_release();
    }
  }
  swift_retain_n();
  uint64_t v43 = sub_1C7B7B080();
  os_log_type_t v49 = sub_1C7B7B2C0();
  if (!os_log_type_enabled(v43, v49)) {
    goto LABEL_44;
  }
  unint64_t v45 = (uint8_t *)swift_slowAlloc();
  uint64_t v46 = swift_slowAlloc();
  v74[0] = v46;
  *(_DWORD *)unint64_t v45 = 136380675;
  if (*(void *)(v7 + 208))
  {
    unint64_t v50 = *(void *)(v7 + 200);
    unint64_t v51 = *(void *)(v7 + 208);
  }
  else
  {
    uint64_t v61 = IDSCopyLocalDeviceUniqueID();
    if (v61)
    {
      uint64_t v62 = (void *)v61;
      unint64_t v50 = sub_1C7B7B1D0();
      unint64_t v51 = v63;
    }
    else
    {
      unint64_t v50 = 0xD000000000000017;
      unint64_t v51 = 0x80000001C7B80E00;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v75 = sub_1C7B47DE8(v50, v51, v74);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  os_log_type_t v64 = v49;
  uint64_t v65 = "(%{private}s) Paired device should never send a replace message";
LABEL_54:
  _os_log_impl(&dword_1C7B37000, v43, v64, v65, v45, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v46, -1, -1);
  MEMORY[0x1C87BC480](v45, -1, -1);
}

void sub_1C7B63094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  uint64_t v7 = v6;
  uint64_t v13 = sub_1C7B7B160();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  id v16 = (uint64_t *)((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v17 = *a6;
  os_log_type_t v18 = (void *)v7[15];
  *id v16 = v18;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E4FBCBF0], v13);
  id v19 = v18;
  uint64_t v20 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if (v20)
  {
    uint64_t v20 = v7[31];
    if (qword_1EBC5DCD8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  if ((qword_1EBC5DCD0 & ~v20) != 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_1C7B7B090();
    __swift_project_value_buffer(v28, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v29 = sub_1C7B7B080();
    os_log_type_t v30 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v46 = v32;
      *(_DWORD *)uint64_t v31 = 136380675;
      if (v7[26])
      {
        unint64_t v33 = v7[25];
        unint64_t v34 = v7[26];
      }
      else
      {
        uint64_t v38 = IDSCopyLocalDeviceUniqueID();
        if (v38)
        {
          uint64_t v39 = (void *)v38;
          unint64_t v33 = sub_1C7B7B1D0();
          unint64_t v34 = v40;
        }
        else
        {
          unint64_t v33 = 0xD000000000000017;
          unint64_t v34 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_1C7B47DE8(v33, v34, &v46);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v29, v30, "(%{private}s) Will not handle message because sync is inactive", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v32, -1, -1);
      MEMORY[0x1C87BC480](v31, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    uint64_t v44 = a2;
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C7B7B090();
    __swift_project_value_buffer(v21, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    unint64_t v22 = sub_1C7B7B080();
    os_log_type_t v23 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v41 = a3;
      uint64_t v42 = a4;
      uint64_t v43 = a5;
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v46 = v25;
      *(_DWORD *)uint64_t v24 = 136380675;
      if (v7[26])
      {
        unint64_t v26 = v7[25];
        unint64_t v27 = v7[26];
      }
      else
      {
        uint64_t v35 = IDSCopyLocalDeviceUniqueID();
        if (v35)
        {
          int64_t v36 = (void *)v35;
          unint64_t v26 = sub_1C7B7B1D0();
          unint64_t v27 = v37;
        }
        else
        {
          unint64_t v26 = 0xD000000000000017;
          unint64_t v27 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_1C7B47DE8(v26, v27, &v46);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v22, v23, "(%{private}s) Received update message", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v25, -1, -1);
      MEMORY[0x1C87BC480](v24, -1, -1);

      a4 = v42;
      a5 = v43;
      a3 = v41;
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v46) = v17;
    LOBYTE(v45) = 0;
    sub_1C7B635A8(v44, a3, a4, a5, (unsigned __int8 *)&v46, (unsigned __int8 *)&v45);
  }
}

void sub_1C7B635A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  uint64_t v628 = a4;
  uint64_t v627 = a3;
  uint64_t v585 = a2;
  uint64_t v586 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9778);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v569 = (uint64_t)&v555 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v630 = type metadata accessor for RecordMetadata(0);
  v619 = *(void **)(v630 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v630);
  v624 = (char *)&v555 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v632 = (char *)&v555 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v616 = (char *)&v555 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v611 = (uint64_t)&v555 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v610 = (uint64_t)&v555 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v618 = (char *)&v555 - v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v623 = (char *)&v555 - v24;
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  uint64_t v576 = (uint64_t)&v555 - v26;
  MEMORY[0x1F4188790](v25);
  uint64_t v575 = (uint64_t)&v555 - v27;
  uint64_t v636 = sub_1C7B7B090();
  uint64_t v28 = *(void *)(v636 - 8);
  uint64_t v29 = MEMORY[0x1F4188790](v636);
  v592 = (char *)&v555 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  v591 = (char *)&v555 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  uint64_t v33 = MEMORY[0x1F4188790](v32 - 8);
  uint64_t v578 = (uint64_t)&v555 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  uint64_t v596 = (uint64_t)&v555 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  v564 = (char *)&v555 - v38;
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  v571 = (uint64_t *)((char *)&v555 - v40);
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  v570 = (uint64_t *)((char *)&v555 - v42);
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  uint64_t v574 = (uint64_t)&v555 - v44;
  uint64_t v45 = MEMORY[0x1F4188790](v43);
  uint64_t v577 = (uint64_t)&v555 - v46;
  uint64_t v47 = MEMORY[0x1F4188790](v45);
  uint64_t v595 = (uint64_t)&v555 - v48;
  uint64_t v49 = MEMORY[0x1F4188790](v47);
  uint64_t v597 = (uint64_t)&v555 - v50;
  uint64_t v51 = MEMORY[0x1F4188790](v49);
  uint64_t v604 = (uint64_t)&v555 - v52;
  uint64_t v53 = MEMORY[0x1F4188790](v51);
  uint64_t v614 = (uint64_t)&v555 - v54;
  MEMORY[0x1F4188790](v53);
  v631 = (uint64_t *)((char *)&v555 - v55);
  uint64_t v568 = type metadata accessor for Record(0);
  uint64_t v56 = *(void *)(v568 - 8);
  uint64_t v57 = MEMORY[0x1F4188790](v568);
  uint64_t v626 = (uint64_t)&v555 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = MEMORY[0x1F4188790](v57);
  v594 = (char *)&v555 - v60;
  uint64_t v61 = MEMORY[0x1F4188790](v59);
  uint64_t v584 = (uint64_t)&v555 - v62;
  uint64_t v63 = MEMORY[0x1F4188790](v61);
  v587 = (char *)&v555 - v64;
  uint64_t v65 = MEMORY[0x1F4188790](v63);
  uint64_t v567 = (uint64_t)&v555 - v66;
  uint64_t v67 = MEMORY[0x1F4188790](v65);
  uint64_t v566 = (uint64_t)&v555 - v68;
  uint64_t v69 = MEMORY[0x1F4188790](v67);
  uint64_t v565 = (uint64_t)&v555 - v70;
  uint64_t v71 = MEMORY[0x1F4188790](v69);
  uint64_t v572 = (uint64_t)&v555 - v72;
  uint64_t v73 = MEMORY[0x1F4188790](v71);
  uint64_t v573 = (uint64_t)&v555 - v74;
  uint64_t v75 = MEMORY[0x1F4188790](v73);
  v593 = (char *)&v555 - v76;
  uint64_t v77 = MEMORY[0x1F4188790](v75);
  v615 = (char *)&v555 - v78;
  uint64_t v79 = MEMORY[0x1F4188790](v77);
  v617 = (char *)&v555 - v80;
  uint64_t v81 = MEMORY[0x1F4188790](v79);
  uint64_t v599 = (uint64_t)&v555 - v82;
  uint64_t v83 = MEMORY[0x1F4188790](v81);
  uint64_t v598 = (uint64_t)&v555 - v84;
  uint64_t v85 = MEMORY[0x1F4188790](v83);
  v613 = (uint64_t *)((char *)&v555 - v86);
  MEMORY[0x1F4188790](v85);
  *(void *)&long long v635 = (char *)&v555 - v87;
  uint64_t v612 = sub_1C7B7AFF0();
  uint64_t v88 = *(void *)(v612 - 8);
  uint64_t v89 = MEMORY[0x1F4188790](v612);
  unint64_t v609 = (unint64_t)&v555 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = MEMORY[0x1F4188790](v89);
  v625 = (char *)&v555 - v92;
  MEMORY[0x1F4188790](v91);
  v629 = (char *)&v555 - v93;
  uint64_t v94 = sub_1C7B7B160();
  uint64_t v95 = *(void *)(v94 - 8);
  MEMORY[0x1F4188790](v94);
  uint64_t v97 = (uint64_t *)((char *)&v555 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v581 = *a5;
  int v98 = *a6;
  uint64_t v99 = *(void **)(v6 + 120);
  *uint64_t v97 = v99;
  (*(void (**)(void *, void, uint64_t))(v95 + 104))(v97, *MEMORY[0x1E4FBCBF0], v94);
  id v100 = v99;
  LOBYTE(v99) = sub_1C7B7B180();
  unint64_t v102 = *(void (**)(void *, uint64_t))(v95 + 8);
  os_log_type_t v101 = (void *)(v95 + 8);
  v102(v97, v94);
  if ((v99 & 1) == 0)
  {
    __break(1u);
LABEL_209:
    swift_once();
LABEL_200:
    __swift_project_value_buffer(v94, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    v545 = sub_1C7B7B080();
    os_log_type_t v546 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v545, v546))
    {
      v547 = (uint8_t *)swift_slowAlloc();
      v548 = v101;
      uint64_t v549 = swift_slowAlloc();
      v641[0] = v549;
      *(_DWORD *)v547 = 136380675;
      if (v548[26])
      {
        unint64_t v550 = v548[25];
        unint64_t v551 = v548[26];
      }
      else
      {
        uint64_t v552 = IDSCopyLocalDeviceUniqueID();
        if (v552)
        {
          v553 = (void *)v552;
          unint64_t v550 = sub_1C7B7B1D0();
          unint64_t v551 = v554;
        }
        else
        {
          unint64_t v550 = 0xD000000000000017;
          unint64_t v551 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v639 = sub_1C7B47DE8(v550, v551, v641);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v545, v546, "(%{private}s) Ignoring update from paired device that we have never synced with", v547, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v549, -1, -1);
      MEMORY[0x1C87BC480](v547, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    return;
  }
  char v103 = *(unsigned char *)(v6 + 16);
  os_log_type_t v101 = (void *)v6;
  v638 = (void *)v6;
  if ((v103 & 1) == 0)
  {
    uint64_t v104 = *(void *)(v6 + 64);
    uint64_t v105 = *(void *)(v6 + 72);
    __swift_project_boxed_opaque_existential_1((void *)(v6 + 40), v104);
    if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 136))(v627, v628, v104, v105) & 1) == 0)
    {
      uint64_t v94 = v636;
      if (qword_1EBC5E820 == -1) {
        goto LABEL_200;
      }
      goto LABEL_209;
    }
  }
  int v579 = v98;
  sub_1C7B7AFD0();
  unint64_t v106 = v609;
  sub_1C7B7AFD0();
  sub_1C7B7AF70();
  uint64_t v107 = *(void (**)(unint64_t, uint64_t))(v88 + 8);
  uint64_t v608 = v88 + 8;
  v607 = v107;
  v107(v106, v612);
  uint64_t v108 = &unk_1C7B7D000;
  if (*(void *)(v586 + 16))
  {
    uint64_t v109 = *(void *)(v586 + 16);
    v621 = v101 + 5;
    unint64_t v561 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v110 = v586 + v561;
    swift_bridgeObjectRetain();
    v606 = v101 + 18;
    swift_beginAccess();
    *(void *)&long long v620 = v619 + 6;
    v605 = (void (**)(unint64_t, uint64_t, uint64_t))(v88 + 16);
    v589 = (void (**)(char *, uint64_t, uint64_t))(v28 + 16);
    v588 = (void (**)(char *, uint64_t))(v28 + 8);
    v603 = v640;
    v563 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56);
    v562 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48);
    uint64_t v622 = *(void *)(v56 + 72);
    *(void *)&long long v111 = 136381187;
    long long v602 = v111;
    unint64_t v580 = (unint64_t)"Validating sync engine";
    uint64_t v590 = MEMORY[0x1E4FBC840] + 8;
    *((void *)&v111 + 1) = 2;
    long long v583 = xmmword_1C7B7D800;
    uint64_t v112 = v110;
    *(void *)&long long v111 = 136380931;
    long long v601 = v111;
    uint64_t v113 = MEMORY[0x1E4FBC860];
    uint64_t v114 = v626;
    uint64_t v115 = (uint64_t *)v635;
    uint64_t v116 = v109;
    while (1)
    {
      sub_1C7B780B8(v112, (uint64_t)v115, type metadata accessor for Record);
      if ((sub_1C7B7AF90() & 1) == 0)
      {
        if (qword_1EBC5E820 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
        sub_1C7B780B8((uint64_t)v115, v114, type metadata accessor for Record);
        swift_retain_n();
        v131 = sub_1C7B7B080();
        uint64_t v132 = (uint64_t)v115;
        os_log_type_t v133 = sub_1C7B7B2C0();
        if (os_log_type_enabled(v131, v133))
        {
          uint64_t v633 = v112;
          uint64_t v634 = v116;
          uint64_t v637 = v113;
          uint64_t v134 = swift_slowAlloc();
          uint64_t v135 = swift_slowAlloc();
          uint64_t v639 = v135;
          *(_DWORD *)uint64_t v134 = v601;
          if (v101[26])
          {
            unint64_t v136 = v101[25];
            unint64_t v137 = v101[26];
          }
          else
          {
            uint64_t v187 = IDSCopyLocalDeviceUniqueID();
            if (v187)
            {
              v188 = (void *)v187;
              unint64_t v136 = sub_1C7B7B1D0();
              unint64_t v137 = v189;
            }
            else
            {
              unint64_t v137 = v580 | 0x8000000000000000;
              unint64_t v136 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          *(void *)(v134 + 4) = sub_1C7B47DE8(v136, v137, &v639);
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v134 + 12) = 2082;
          uint64_t v114 = v626;
          v641[0] = 0;
          v641[1] = 0xE000000000000000;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C7B7B450();
          swift_bridgeObjectRelease();
          strcpy((char *)v641, "identifier: ");
          BYTE5(v641[1]) = 0;
          HIWORD(v641[1]) = -5120;
          swift_bridgeObjectRetain();
          sub_1C7B7B220();
          swift_bridgeObjectRelease();
          sub_1C7B7B220();
          swift_bridgeObjectRetain();
          sub_1C7B7B220();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          *(void *)(v134 + 14) = sub_1C7B47DE8(v641[0], v641[1], &v639);
          swift_bridgeObjectRelease();
          sub_1C7B78120(v114, type metadata accessor for Record);
          _os_log_impl(&dword_1C7B37000, v131, v133, "(%{private}s) Detected record from the future; dropping record %{public}s",
            (uint8_t *)v134,
            0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v135, -1, -1);
          MEMORY[0x1C87BC480](v134, -1, -1);

          uint64_t v115 = (uint64_t *)v635;
          sub_1C7B78120(v635, type metadata accessor for Record);
          os_log_type_t v101 = v638;
          uint64_t v113 = v637;
          uint64_t v116 = v634;
          uint64_t v112 = v633;
        }
        else
        {

          sub_1C7B78120(v114, type metadata accessor for Record);
          swift_release_n();
          sub_1C7B78120(v132, type metadata accessor for Record);
          uint64_t v115 = (uint64_t *)v132;
        }
        goto LABEL_7;
      }
      uint64_t v633 = v112;
      uint64_t v634 = v116;
      uint64_t v637 = v113;
      uint64_t v117 = v101[8];
      uint64_t v118 = v101[9];
      __swift_project_boxed_opaque_existential_1(v621, v117);
      uint64_t v119 = v115[1];
      uint64_t v120 = v115[2];
      uint64_t v121 = v115[3];
      v641[0] = *v115;
      v641[1] = v119;
      uint64_t v642 = v120;
      uint64_t v643 = v121;
      uint64_t v122 = (uint64_t)v115;
      v123 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v118 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v124 = v631;
      v123(v641, v117, v118);
      uint64_t v125 = v630;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v126 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v620;
      LODWORD(v117) = (*(uint64_t (**)(void *, uint64_t, uint64_t))v620)(v124, 1, v125);
      uint64_t v127 = v614;
      sub_1C7B78E9C((uint64_t)v124, v614);
      uint64_t v128 = v613;
      sub_1C7B780B8(v122, (uint64_t)v613, type metadata accessor for Record);
      if (v117 == 1)
      {
        sub_1C7B78120((uint64_t)v128, type metadata accessor for Record);
        sub_1C7B4E5AC(v127, &qword_1EBC5E400);
        v129 = v638;
        uint64_t v114 = v626;
        uint64_t v130 = (uint64_t)v617;
      }
      else
      {
        uint64_t v138 = v604;
        sub_1C7B78E9C(v127, v604);
        int v139 = v126(v138, 1, v125);
        uint64_t v130 = (uint64_t)v617;
        if (v139 == 1)
        {
          __break(1u);
LABEL_211:
          __break(1u);
LABEL_212:
          __break(1u);
LABEL_213:
          __break(1u);
LABEL_214:
          __break(1u);
LABEL_215:
          __break(1u);
LABEL_216:
          __break(1u);
LABEL_217:
          __break(1u);
          return;
        }
        v140 = *v605;
        unint64_t v141 = v609;
        uint64_t v142 = v612;
        (*v605)(v609, v138 + *(int *)(v125 + 20), v612);
        sub_1C7B78120(v138, type metadata accessor for RecordMetadata);
        char v143 = sub_1C7B7AF90();
        v607(v141, v142);
        sub_1C7B78120((uint64_t)v128, type metadata accessor for Record);
        sub_1C7B4E5AC(v127, &qword_1EBC5E400);
        v129 = v638;
        uint64_t v114 = v626;
        if ((v143 & 1) == 0)
        {
          uint64_t v161 = v597;
          sub_1C7B78E9C((uint64_t)v631, v597);
          if (v126(v161, 1, v125) == 1) {
            goto LABEL_211;
          }
          unint64_t v162 = v609;
          uint64_t v163 = v612;
          v140(v609, v161 + *(int *)(v125 + 20), v612);
          sub_1C7B78120(v161, type metadata accessor for RecordMetadata);
          char v164 = sub_1C7B7AF80();
          v607(v162, v163);
          if ((v164 & 1) == 0)
          {
            v190 = v592;
            uint64_t v191 = v596;
            uint64_t v192 = (uint64_t)v594;
            if (qword_1EBC5E820 != -1) {
              swift_once();
            }
            uint64_t v193 = v636;
            uint64_t v194 = __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
            (*v589)(v190, v194, v193);
            sub_1C7B780B8(v635, v192, type metadata accessor for Record);
            sub_1C7B78E9C((uint64_t)v631, v191);
            swift_retain_n();
            v195 = sub_1C7B7B080();
            os_log_type_t v196 = sub_1C7B7B2C0();
            if (os_log_type_enabled(v195, v196))
            {
              uint64_t v197 = swift_slowAlloc();
              uint64_t v198 = swift_slowAlloc();
              v641[0] = v198;
              *(_DWORD *)uint64_t v197 = v602;
              v199 = v129;
              unint64_t v200 = v129[26];
              uint64_t v600 = v198;
              if (v200)
              {
                unint64_t v201 = v199[25];
                unint64_t v202 = v200;
              }
              else
              {
                uint64_t v225 = IDSCopyLocalDeviceUniqueID();
                if (v225)
                {
                  v226 = (void *)v225;
                  unint64_t v201 = sub_1C7B7B1D0();
                  unint64_t v202 = v227;
                }
                else
                {
                  unint64_t v202 = v580 | 0x8000000000000000;
                  unint64_t v201 = 0xD000000000000017;
                }
              }
              swift_bridgeObjectRetain();
              uint64_t v639 = sub_1C7B47DE8(v201, v202, v641);
              sub_1C7B7B3A0();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v197 + 12) = 2082;
              uint64_t v312 = (uint64_t)v594;
              uint64_t v313 = RecordMetadata.description.getter();
              uint64_t v639 = sub_1C7B47DE8(v313, v314, v641);
              sub_1C7B7B3A0();
              swift_bridgeObjectRelease();
              sub_1C7B78120(v312, type metadata accessor for Record);
              *(_WORD *)(v197 + 22) = 2082;
              uint64_t v315 = v596;
              uint64_t v316 = v578;
              sub_1C7B78E9C(v596, v578);
              if (v126(v316, 1, v630) == 1) {
                goto LABEL_213;
              }
              uint64_t v317 = v576;
              sub_1C7B78D9C(v316, v576, type metadata accessor for RecordMetadata);
              uint64_t v318 = RecordMetadata.description.getter();
              unint64_t v320 = v319;
              sub_1C7B78120(v317, type metadata accessor for RecordMetadata);
              uint64_t v639 = sub_1C7B47DE8(v318, v320, v641);
              sub_1C7B7B3A0();
              swift_bridgeObjectRelease();
              sub_1C7B4E5AC(v315, &qword_1EBC5E400);
              _os_log_impl(&dword_1C7B37000, v195, v196, "(%{private}s) Incoming modified record %{public}s has an identical lastModified date to the existing record %{public}s", (uint8_t *)v197, 0x20u);
              uint64_t v321 = v600;
              swift_arrayDestroy();
              MEMORY[0x1C87BC480](v321, -1, -1);
              MEMORY[0x1C87BC480](v197, -1, -1);

              (*v588)(v592, v636);
              uint64_t v114 = v626;
            }
            else
            {
              swift_release_n();
              sub_1C7B78120(v192, type metadata accessor for Record);
              sub_1C7B4E5AC(v191, &qword_1EBC5E400);

              (*v588)(v190, v193);
            }
LABEL_126:
            uint64_t v115 = (uint64_t *)v635;
            goto LABEL_127;
          }
          v165 = v591;
          uint64_t v166 = (uint64_t)v593;
          if (qword_1EBC5E820 != -1) {
            swift_once();
          }
          uint64_t v167 = v636;
          uint64_t v168 = __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
          v169 = *v589;
          uint64_t v600 = v168;
          ((void (*)(char *))v169)(v165);
          sub_1C7B780B8(v635, v166, type metadata accessor for Record);
          uint64_t v170 = v595;
          sub_1C7B78E9C((uint64_t)v631, v595);
          swift_retain_n();
          v171 = sub_1C7B7B080();
          os_log_type_t v172 = sub_1C7B7B2C0();
          if (os_log_type_enabled(v171, v172))
          {
            uint64_t v173 = swift_slowAlloc();
            uint64_t v174 = swift_slowAlloc();
            v641[0] = v174;
            *(_DWORD *)uint64_t v173 = v602;
            v175 = v129;
            unint64_t v176 = v129[26];
            uint64_t v582 = v174;
            if (v176)
            {
              unint64_t v177 = v175[25];
              unint64_t v178 = v176;
            }
            else
            {
              uint64_t v222 = IDSCopyLocalDeviceUniqueID();
              if (v222)
              {
                v223 = (void *)v222;
                unint64_t v177 = sub_1C7B7B1D0();
                unint64_t v178 = v224;
              }
              else
              {
                unint64_t v178 = v580 | 0x8000000000000000;
                unint64_t v177 = 0xD000000000000017;
              }
            }
            swift_bridgeObjectRetain();
            uint64_t v639 = sub_1C7B47DE8(v177, v178, v641);
            sub_1C7B7B3A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v173 + 12) = 2082;
            uint64_t v260 = (uint64_t)v593;
            uint64_t v261 = RecordMetadata.description.getter();
            uint64_t v639 = sub_1C7B47DE8(v261, v262, v641);
            sub_1C7B7B3A0();
            swift_bridgeObjectRelease();
            sub_1C7B78120(v260, type metadata accessor for Record);
            *(_WORD *)(v173 + 22) = 2082;
            uint64_t v263 = v595;
            uint64_t v264 = v577;
            sub_1C7B78E9C(v595, v577);
            if (v126(v264, 1, v630) == 1) {
              goto LABEL_212;
            }
            uint64_t v265 = v575;
            sub_1C7B78D9C(v264, v575, type metadata accessor for RecordMetadata);
            uint64_t v266 = RecordMetadata.description.getter();
            unint64_t v268 = v267;
            sub_1C7B78120(v265, type metadata accessor for RecordMetadata);
            uint64_t v639 = sub_1C7B47DE8(v266, v268, v641);
            sub_1C7B7B3A0();
            swift_bridgeObjectRelease();
            sub_1C7B4E5AC(v263, &qword_1EBC5E400);
            _os_log_impl(&dword_1C7B37000, v171, v172, "(%{private}s) Incoming modified record %{public}s has an older lastModified date than the existing record %{public}s", (uint8_t *)v173, 0x20u);
            uint64_t v269 = v582;
            swift_arrayDestroy();
            MEMORY[0x1C87BC480](v269, -1, -1);
            MEMORY[0x1C87BC480](v173, -1, -1);

            (*v588)(v591, v636);
            v129 = v638;
            uint64_t v114 = v626;
          }
          else
          {
            swift_release_n();
            sub_1C7B78120(v166, type metadata accessor for Record);
            sub_1C7B4E5AC(v170, &qword_1EBC5E400);

            (*v588)(v165, v167);
          }
          uint64_t v270 = *v606;
          uint64_t v271 = v630;
          uint64_t v272 = (uint64_t)v587;
          if (*(void *)(*v606 + 16))
          {
            uint64_t v273 = *(void *)(v635 + 16);
            uint64_t v274 = *(void *)(v635 + 24);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v275 = sub_1C7B49014(v273, v274);
            if (v276)
            {
              uint64_t v582 = *(void *)(*(void *)(v270 + 56) + 8 * v275);
              swift_retain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v277 = v574;
              sub_1C7B78E9C((uint64_t)v631, v574);
              if (v126(v277, 1, v271) == 1) {
                goto LABEL_214;
              }
              int v278 = *(unsigned __int8 *)(v277 + *(int *)(v271 + 24));
              sub_1C7B78120(v277, type metadata accessor for RecordMetadata);
              if (v278 == 1)
              {
                uint64_t v279 = v573;
                sub_1C7B780B8(v635, v573, type metadata accessor for Record);
                swift_retain_n();
                v280 = sub_1C7B7B080();
                os_log_type_t v281 = sub_1C7B7B2D0();
                if (os_log_type_enabled(v280, v281))
                {
                  uint64_t v282 = swift_slowAlloc();
                  uint64_t v283 = swift_slowAlloc();
                  v641[0] = v283;
                  *(_DWORD *)uint64_t v282 = v601;
                  v284 = v129;
                  unint64_t v285 = v129[26];
                  uint64_t v600 = v283;
                  if (v285)
                  {
                    unint64_t v286 = v284[25];
                    unint64_t v287 = v285;
                  }
                  else
                  {
                    uint64_t v347 = IDSCopyLocalDeviceUniqueID();
                    if (v347)
                    {
                      v348 = (void *)v347;
                      unint64_t v286 = sub_1C7B7B1D0();
                      unint64_t v287 = v349;
                    }
                    else
                    {
                      unint64_t v287 = v580 | 0x8000000000000000;
                      unint64_t v286 = 0xD000000000000017;
                    }
                  }
                  swift_bridgeObjectRetain();
                  uint64_t v639 = sub_1C7B47DE8(v286, v287, v641);
                  sub_1C7B7B3A0();
                  swift_release_n();
                  swift_bridgeObjectRelease();
                  *(_WORD *)(v282 + 12) = 2082;
                  uint64_t v383 = v573;
                  uint64_t v384 = RecordMetadata.description.getter();
                  uint64_t v639 = sub_1C7B47DE8(v384, v385, v641);
                  sub_1C7B7B3A0();
                  swift_bridgeObjectRelease();
                  sub_1C7B78120(v383, type metadata accessor for Record);
                  _os_log_impl(&dword_1C7B37000, v280, v281, "(%{private}s) Resyncing local deletion for modified record %{public}s", (uint8_t *)v282, 0x16u);
                  uint64_t v386 = v600;
                  swift_arrayDestroy();
                  MEMORY[0x1C87BC480](v386, -1, -1);
                  MEMORY[0x1C87BC480](v282, -1, -1);

                  uint64_t v114 = v626;
                }
                else
                {
                  swift_release_n();
                  sub_1C7B78120(v279, type metadata accessor for Record);
                }
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9380);
                uint64_t v387 = swift_allocObject();
                *(_OWORD *)(v387 + 16) = v583;
                v388 = v570;
                sub_1C7B78E9C((uint64_t)v631, (uint64_t)v570);
                if (v126((uint64_t)v388, 1, v630) == 1) {
                  goto LABEL_216;
                }
                uint64_t v390 = *v388;
                uint64_t v389 = v388[1];
                uint64_t v392 = v388[2];
                uint64_t v391 = v388[3];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_1C7B78120((uint64_t)v388, type metadata accessor for RecordMetadata);
                *(void *)(v387 + 32) = v390;
                *(void *)(v387 + 40) = v389;
                *(void *)(v387 + 48) = v392;
                *(void *)(v387 + 56) = v391;
                sub_1C7B5BA4C(MEMORY[0x1E4FBC860], v387);
                swift_bridgeObjectRelease();
                swift_release();
              }
              else
              {
                uint64_t v560 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9380);
                uint64_t inited = swift_initStackObject();
                *(_OWORD *)(inited + 16) = v583;
                v299 = v571;
                sub_1C7B78E9C((uint64_t)v631, (uint64_t)v571);
                if (v126((uint64_t)v299, 1, v271) == 1) {
                  goto LABEL_215;
                }
                uint64_t v300 = (uint64_t)v299;
                uint64_t v302 = *v299;
                uint64_t v301 = v299[1];
                uint64_t v304 = *(void *)(v300 + 16);
                uint64_t v303 = *(void *)(v300 + 24);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_1C7B78120(v300, type metadata accessor for RecordMetadata);
                *(void *)(inited + 32) = v302;
                *(void *)(inited + 40) = v301;
                *(void *)(inited + 48) = v304;
                *(void *)(inited + 56) = v303;
                v305 = v638;
                uint64_t v306 = sub_1C7B6804C(inited);
                swift_setDeallocating();
                swift_arrayDestroy();
                if (*(void *)(v306 + 16))
                {
                  uint64_t v307 = v569;
                  sub_1C7B780B8(v306 + v561, v569, type metadata accessor for Record);
                  uint64_t v308 = 0;
                }
                else
                {
                  uint64_t v308 = 1;
                  uint64_t v307 = v569;
                }
                uint64_t v322 = v568;
                uint64_t v323 = v572;
                (*v563)(v307, v308, 1, v568);
                swift_bridgeObjectRelease();
                if ((*v562)(v307, 1, v322) == 1)
                {
                  sub_1C7B4E5AC(v307, &qword_1EA4F9778);
                  uint64_t v324 = v567;
                  sub_1C7B780B8(v635, v567, type metadata accessor for Record);
                  swift_retain_n();
                  v325 = sub_1C7B7B080();
                  os_log_type_t v326 = sub_1C7B7B2D0();
                  if (os_log_type_enabled(v325, v326))
                  {
                    uint64_t v327 = swift_slowAlloc();
                    uint64_t v328 = swift_slowAlloc();
                    v641[0] = v328;
                    *(_DWORD *)uint64_t v327 = v601;
                    v329 = v305;
                    unint64_t v330 = v305[26];
                    if (v330)
                    {
                      unint64_t v331 = v329[25];
                      unint64_t v332 = v330;
                    }
                    else
                    {
                      uint64_t v380 = IDSCopyLocalDeviceUniqueID();
                      if (v380)
                      {
                        v381 = (void *)v380;
                        unint64_t v331 = sub_1C7B7B1D0();
                        unint64_t v332 = v382;
                      }
                      else
                      {
                        unint64_t v332 = v580 | 0x8000000000000000;
                        unint64_t v331 = 0xD000000000000017;
                      }
                      v329 = v638;
                      uint64_t v324 = v567;
                    }
                    swift_bridgeObjectRetain();
                    uint64_t v639 = sub_1C7B47DE8(v331, v332, v641);
                    sub_1C7B7B3A0();
                    swift_release_n();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v327 + 12) = 2082;
                    uint64_t v402 = RecordMetadata.description.getter();
                    uint64_t v639 = sub_1C7B47DE8(v402, v403, v641);
                    sub_1C7B7B3A0();
                    swift_bridgeObjectRelease();
                    sub_1C7B78120(v324, type metadata accessor for Record);
                    _os_log_impl(&dword_1C7B37000, v325, v326, "(%{private}s) Resolved conflict to remote record because local record is missing; updating local r"
                      "ecord %{public}s",
                      (uint8_t *)v327,
                      0x16u);
                    swift_arrayDestroy();
                    MEMORY[0x1C87BC480](v328, -1, -1);
                    MEMORY[0x1C87BC480](v327, -1, -1);

                    v305 = v329;
                    uint64_t v114 = v626;
                  }
                  else
                  {
                    swift_release_n();
                    sub_1C7B78120(v324, type metadata accessor for Record);
                  }
                  uint64_t v404 = v582;
                  uint64_t v643 = type metadata accessor for SyncEngine();
                  v644 = &protocol witness table for SyncEngine;
                  v641[0] = (uint64_t)v305;
                  uint64_t v405 = MEMORY[0x1C87BC500](v404 + 16);
                  v406 = (void *)v635;
                  if (v405)
                  {
                    uint64_t v407 = *(void *)(v404 + 24);
                    uint64_t ObjectType = swift_getObjectType();
                    v409 = *(uint64_t (**)(uint64_t *, void *, uint64_t, uint64_t))(v407 + 16);
                    swift_retain_n();
                    char v410 = v409(v641, v406, ObjectType, v407);
                    v305 = v638;
                    LOBYTE(v407) = v410;
                    swift_unknownObjectRelease();
                    __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
                    swift_release();
                    if (v407)
                    {
                      uint64_t v411 = v305[8];
                      uint64_t v412 = v305[9];
                      v413 = v621;
                      __swift_project_boxed_opaque_existential_1(v621, v411);
                      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9780);
                      v414 = v305;
                      unint64_t v415 = (*((unsigned __int8 *)v619 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v619 + 80);
                      uint64_t v416 = swift_allocObject();
                      *(_OWORD *)(v416 + 16) = v583;
                      sub_1C7B780B8((uint64_t)v406, v416 + v415, type metadata accessor for RecordMetadata);
                      (*(void (**)(uint64_t, uint64_t, uint64_t))(v412 + 88))(v416, v411, v412);
                      swift_bridgeObjectRelease();
                      uint64_t v417 = v414[8];
                      uint64_t v418 = v414[9];
                      __swift_project_boxed_opaque_existential_1(v413, v417);
                      uint64_t v419 = swift_allocObject();
                      *(_OWORD *)(v419 + 16) = v583;
                      uint64_t v420 = v406[1];
                      uint64_t v421 = v406[2];
                      uint64_t v422 = v406[3];
                      *(void *)(v419 + 32) = *v406;
                      *(void *)(v419 + 40) = v420;
                      *(void *)(v419 + 48) = v421;
                      *(void *)(v419 + 56) = v422;
                      v423 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v418 + 56);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      v423(v629, v419, v627, v628, v417, v418);
                      uint64_t v115 = (uint64_t *)v635;
LABEL_144:
                      swift_bridgeObjectRelease();
                      swift_release();
                      goto LABEL_127;
                    }
                  }
                  else
                  {
                    swift_retain_n();
                    __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
                    swift_release();
                  }
                  uint64_t v424 = v305[8];
                  uint64_t v425 = v305[9];
                  __swift_project_boxed_opaque_existential_1(v621, v424);
                  uint64_t v426 = v406[1];
                  uint64_t v427 = v406[2];
                  uint64_t v428 = v406[3];
                  v641[0] = *v406;
                  v641[1] = v426;
                  uint64_t v642 = v427;
                  uint64_t v643 = v428;
                  v429 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v425 + 128);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  v429(v641, v424, v425);
                  uint64_t v115 = (uint64_t *)v635;
                  swift_bridgeObjectRelease();
                  goto LABEL_144;
                }
                sub_1C7B78D9C(v307, v323, type metadata accessor for Record);
                uint64_t v643 = type metadata accessor for SyncEngine();
                v644 = &protocol witness table for SyncEngine;
                uint64_t v557 = v643;
                v641[0] = (uint64_t)v305;
                uint64_t v333 = v582;
                uint64_t v556 = v582 + 16;
                if (MEMORY[0x1C87BC500]())
                {
                  uint64_t v334 = *(void *)(v333 + 24);
                  uint64_t v335 = swift_getObjectType();
                  v559 = *(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t, uint64_t))(v334 + 40);
                  swift_retain_n();
                  uint64_t v336 = v559(v641, v635, v323, v335, v334);
                  v305 = v638;
                  v337 = (uint64_t (*)(uint64_t *, void, uint64_t, uint64_t, uint64_t))v336;
                  unint64_t v339 = v338;
                  swift_unknownObjectRelease();
                }
                else
                {
                  uint64_t v350 = v635 + *(int *)(v322 + 20);
                  v337 = *(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t, uint64_t))v350;
                  unint64_t v339 = *(void *)(v350 + 8);
                  swift_retain_n();
                  sub_1C7B3AEC8((uint64_t)v337, v339);
                }
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
                swift_release();
                uint64_t v351 = *(int *)(v322 + 20);
                uint64_t v352 = v635;
                v353 = (uint64_t *)(v635 + v351);
                uint64_t v354 = *v353;
                unint64_t v355 = v353[1];
                sub_1C7B3AEC8(*v353, v355);
                v559 = v337;
                unint64_t v558 = v339;
                char v356 = sub_1C7B769C8((uint64_t)v337, v339, v354, v355);
                sub_1C7B3AF20(v354, v355);
                if (v356)
                {
                  uint64_t v357 = v352;
                  uint64_t v358 = v566;
                  sub_1C7B780B8(v357, v566, type metadata accessor for Record);
                  swift_retain_n();
                  v359 = sub_1C7B7B080();
                  os_log_type_t v360 = sub_1C7B7B2D0();
                  BOOL v361 = os_log_type_enabled(v359, v360);
                  uint64_t v362 = v582;
                  if (v361)
                  {
                    uint64_t v363 = swift_slowAlloc();
                    uint64_t v364 = swift_slowAlloc();
                    v641[0] = v364;
                    *(_DWORD *)uint64_t v363 = v601;
                    v365 = v305;
                    unint64_t v366 = v305[26];
                    if (v366)
                    {
                      unint64_t v367 = v365[25];
                      unint64_t v368 = v366;
                    }
                    else
                    {
                      uint64_t v396 = IDSCopyLocalDeviceUniqueID();
                      if (v396)
                      {
                        v397 = (void *)v396;
                        unint64_t v367 = sub_1C7B7B1D0();
                        unint64_t v368 = v398;
                      }
                      else
                      {
                        unint64_t v368 = v580 | 0x8000000000000000;
                        unint64_t v367 = 0xD000000000000017;
                      }
                      v365 = v638;
                      uint64_t v358 = v566;
                    }
                    swift_bridgeObjectRetain();
                    uint64_t v639 = sub_1C7B47DE8(v367, v368, v641);
                    sub_1C7B7B3A0();
                    swift_release_n();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v363 + 12) = 2082;
                    uint64_t v430 = RecordMetadata.description.getter();
                    uint64_t v639 = sub_1C7B47DE8(v430, v431, v641);
                    sub_1C7B7B3A0();
                    swift_bridgeObjectRelease();
                    sub_1C7B78120(v358, type metadata accessor for Record);
                    _os_log_impl(&dword_1C7B37000, v359, v360, "(%{private}s) Resolved conflict to remote record; updating local record %{public}s",
                      (uint8_t *)v363,
                      0x16u);
                    swift_arrayDestroy();
                    MEMORY[0x1C87BC480](v364, -1, -1);
                    MEMORY[0x1C87BC480](v363, -1, -1);

                    v305 = v365;
                    uint64_t v114 = v626;
                    uint64_t v362 = v582;
                  }
                  else
                  {
                    swift_release_n();
                    sub_1C7B78120(v358, type metadata accessor for Record);
                  }
                  uint64_t v643 = v557;
                  v644 = &protocol witness table for SyncEngine;
                  v641[0] = (uint64_t)v305;
                  uint64_t v432 = MEMORY[0x1C87BC500](v556);
                  v433 = (void *)v635;
                  if (v432)
                  {
                    uint64_t v434 = *(void *)(v362 + 24);
                    uint64_t v435 = swift_getObjectType();
                    v436 = *(uint64_t (**)(uint64_t *, void *, uint64_t, uint64_t))(v434 + 16);
                    swift_retain_n();
                    char v437 = v436(v641, v433, v435, v434);
                    v305 = v638;
                    LOBYTE(v434) = v437;
                    swift_unknownObjectRelease();
                    __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
                    swift_release();
                    if (v434)
                    {
                      uint64_t v438 = v305[8];
                      uint64_t v439 = v305[9];
                      v440 = v621;
                      __swift_project_boxed_opaque_existential_1(v621, v438);
                      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9780);
                      v441 = v305;
                      unint64_t v442 = (*((unsigned __int8 *)v619 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v619 + 80);
                      uint64_t v443 = swift_allocObject();
                      *(_OWORD *)(v443 + 16) = v583;
                      sub_1C7B780B8((uint64_t)v433, v443 + v442, type metadata accessor for RecordMetadata);
                      (*(void (**)(uint64_t, uint64_t, uint64_t))(v439 + 88))(v443, v438, v439);
                      swift_bridgeObjectRelease();
                      uint64_t v444 = v441[8];
                      uint64_t v445 = v441[9];
                      __swift_project_boxed_opaque_existential_1(v440, v444);
                      uint64_t v446 = swift_allocObject();
                      *(_OWORD *)(v446 + 16) = v583;
                      uint64_t v447 = v433[1];
                      uint64_t v448 = v433[2];
                      uint64_t v449 = v433[3];
                      *(void *)(v446 + 32) = *v433;
                      *(void *)(v446 + 40) = v447;
                      *(void *)(v446 + 48) = v448;
                      *(void *)(v446 + 56) = v449;
                      v450 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v445 + 56);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      v450(v629, v446, v627, v628, v444, v445);
                      uint64_t v115 = (uint64_t *)v635;
                      swift_release();
                      sub_1C7B3AF20((uint64_t)v559, v558);
LABEL_153:
                      swift_bridgeObjectRelease();
                      sub_1C7B78120(v572, type metadata accessor for Record);
                      goto LABEL_127;
                    }
                  }
                  else
                  {
                    swift_retain_n();
                    __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
                    swift_release();
                  }
                  uint64_t v451 = v305[8];
                  uint64_t v452 = v305[9];
                  __swift_project_boxed_opaque_existential_1(v621, v451);
                  uint64_t v453 = v433[1];
                  uint64_t v454 = v433[2];
                  uint64_t v455 = v433[3];
                  v641[0] = *v433;
                  v641[1] = v453;
                  uint64_t v642 = v454;
                  uint64_t v643 = v455;
                  v456 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v452 + 128);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  v456(v641, v451, v452);
                  uint64_t v115 = (uint64_t *)v635;
                  swift_release();
                  sub_1C7B3AF20((uint64_t)v559, v558);
                  swift_bridgeObjectRelease();
                  goto LABEL_153;
                }
                uint64_t v369 = v352;
                uint64_t v370 = v565;
                sub_1C7B780B8(v369, v565, type metadata accessor for Record);
                swift_retain_n();
                v371 = sub_1C7B7B080();
                os_log_type_t v372 = sub_1C7B7B2D0();
                if (os_log_type_enabled(v371, v372))
                {
                  uint64_t v373 = swift_slowAlloc();
                  uint64_t v374 = swift_slowAlloc();
                  v641[0] = v374;
                  *(_DWORD *)uint64_t v373 = v601;
                  v375 = v305;
                  unint64_t v376 = v305[26];
                  uint64_t v600 = v374;
                  if (v376)
                  {
                    unint64_t v377 = v375[25];
                    unint64_t v378 = v376;
                  }
                  else
                  {
                    uint64_t v399 = IDSCopyLocalDeviceUniqueID();
                    if (v399)
                    {
                      v400 = (void *)v399;
                      unint64_t v377 = sub_1C7B7B1D0();
                      unint64_t v378 = v401;
                    }
                    else
                    {
                      unint64_t v378 = v580 | 0x8000000000000000;
                      unint64_t v377 = 0xD000000000000017;
                    }
                    uint64_t v370 = v565;
                  }
                  swift_bridgeObjectRetain();
                  uint64_t v639 = sub_1C7B47DE8(v377, v378, v641);
                  sub_1C7B7B3A0();
                  swift_release_n();
                  swift_bridgeObjectRelease();
                  *(_WORD *)(v373 + 12) = 2082;
                  uint64_t v457 = RecordMetadata.description.getter();
                  uint64_t v639 = sub_1C7B47DE8(v457, v458, v641);
                  sub_1C7B7B3A0();
                  swift_bridgeObjectRelease();
                  sub_1C7B78120(v370, type metadata accessor for Record);
                  _os_log_impl(&dword_1C7B37000, v371, v372, "(%{private}s) Resolved conflict to local record; resyncing modified record %{public}s",
                    (uint8_t *)v373,
                    0x16u);
                  uint64_t v459 = v600;
                  swift_arrayDestroy();
                  MEMORY[0x1C87BC480](v459, -1, -1);
                  MEMORY[0x1C87BC480](v373, -1, -1);

                  v379 = (uint64_t *)v564;
                  uint64_t v114 = v626;
                }
                else
                {
                  swift_release_n();
                  sub_1C7B78120(v370, type metadata accessor for Record);

                  v379 = (uint64_t *)v564;
                }
                uint64_t v460 = swift_allocObject();
                *(_OWORD *)(v460 + 16) = v583;
                sub_1C7B78E9C((uint64_t)v631, (uint64_t)v379);
                if (v126((uint64_t)v379, 1, v630) == 1) {
                  goto LABEL_217;
                }
                uint64_t v462 = *v379;
                uint64_t v461 = v379[1];
                uint64_t v464 = v379[2];
                uint64_t v463 = v379[3];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                sub_1C7B78120((uint64_t)v379, type metadata accessor for RecordMetadata);
                *(void *)(v460 + 32) = v462;
                *(void *)(v460 + 40) = v461;
                *(void *)(v460 + 48) = v464;
                *(void *)(v460 + 56) = v463;
                sub_1C7B5BA4C(v460, MEMORY[0x1E4FBC860]);
                swift_bridgeObjectRelease();
                swift_release();
                sub_1C7B3AF20((uint64_t)v559, v558);
                sub_1C7B78120(v572, type metadata accessor for Record);
              }
              goto LABEL_126;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          uint64_t v288 = v635;
          sub_1C7B780B8(v635, v272, type metadata accessor for Record);
          uint64_t v289 = v584;
          sub_1C7B780B8(v288, v584, type metadata accessor for Record);
          swift_retain_n();
          v290 = sub_1C7B7B080();
          uint64_t v291 = v272;
          os_log_type_t v292 = sub_1C7B7B2C0();
          if (!os_log_type_enabled(v290, v292))
          {
            swift_release_n();
            sub_1C7B78120(v291, type metadata accessor for Record);
            sub_1C7B78120(v289, type metadata accessor for Record);

            goto LABEL_59;
          }
          uint64_t v293 = swift_slowAlloc();
          uint64_t v294 = swift_slowAlloc();
          v641[0] = v294;
          *(_DWORD *)uint64_t v293 = v602;
          v183 = v129;
          unint64_t v295 = v129[26];
          uint64_t v600 = v294;
          if (v295)
          {
            unint64_t v296 = v183[25];
            unint64_t v297 = v295;
          }
          else
          {
            uint64_t v309 = IDSCopyLocalDeviceUniqueID();
            if (v309)
            {
              v310 = (void *)v309;
              unint64_t v296 = sub_1C7B7B1D0();
              unint64_t v297 = v311;
            }
            else
            {
              unint64_t v297 = v580 | 0x8000000000000000;
              unint64_t v296 = 0xD000000000000017;
            }
            v183 = v638;
          }
          swift_bridgeObjectRetain();
          uint64_t v639 = sub_1C7B47DE8(v296, v297, v641);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v293 + 12) = 2082;
          uint64_t v340 = (uint64_t)v587;
          uint64_t v341 = RecordMetadata.description.getter();
          uint64_t v639 = sub_1C7B47DE8(v341, v342, v641);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease();
          sub_1C7B78120(v340, type metadata accessor for Record);
          *(_WORD *)(v293 + 22) = 2082;
          uint64_t v343 = v584;
          uint64_t v344 = *(void *)(v584 + 16);
          unint64_t v345 = *(void *)(v584 + 24);
          swift_bridgeObjectRetain();
          uint64_t v639 = sub_1C7B47DE8(v344, v345, v641);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease();
          sub_1C7B78120(v343, type metadata accessor for Record);
          _os_log_impl(&dword_1C7B37000, v290, v292, "(%{private}s) Could not find data source for incoming modified record %{public}s for zone %{public}s", (uint8_t *)v293, 0x20u);
          uint64_t v346 = v600;
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v346, -1, -1);
          MEMORY[0x1C87BC480](v293, -1, -1);

          goto LABEL_58;
        }
      }
      uint64_t v144 = *v606;
      uint64_t v145 = (uint64_t)v615;
      uint64_t v146 = v635;
      if (*(void *)(*v606 + 16))
      {
        uint64_t v147 = *(void *)(v635 + 16);
        uint64_t v148 = *(void *)(v635 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v149 = sub_1C7B49014(v147, v148);
        if (v150)
        {
          uint64_t v600 = *(void *)(*(void *)(v144 + 56) + 8 * v149);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_1EBC5E820 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
          uint64_t v151 = v598;
          sub_1C7B780B8(v146, v598, type metadata accessor for Record);
          uint64_t v152 = v599;
          sub_1C7B780B8(v146, v599, type metadata accessor for Record);
          swift_retain_n();
          v153 = sub_1C7B7B080();
          os_log_type_t v154 = sub_1C7B7B2D0();
          if (os_log_type_enabled(v153, v154))
          {
            uint64_t v155 = swift_slowAlloc();
            uint64_t v156 = swift_slowAlloc();
            v641[0] = v156;
            *(_DWORD *)uint64_t v155 = v602;
            v157 = v129;
            unint64_t v158 = v129[26];
            uint64_t v582 = v156;
            if (v158)
            {
              unint64_t v159 = v157[25];
              unint64_t v160 = v158;
            }
            else
            {
              uint64_t v206 = IDSCopyLocalDeviceUniqueID();
              if (v206)
              {
                v207 = (void *)v206;
                unint64_t v159 = sub_1C7B7B1D0();
                unint64_t v160 = v208;
              }
              else
              {
                unint64_t v160 = v580 | 0x8000000000000000;
                unint64_t v159 = 0xD000000000000017;
              }
              v157 = v638;
              uint64_t v151 = v598;
            }
            swift_bridgeObjectRetain();
            uint64_t v639 = sub_1C7B47DE8(v159, v160, v641);
            sub_1C7B7B3A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v155 + 12) = 2082;
            uint64_t v228 = RecordMetadata.description.getter();
            uint64_t v639 = sub_1C7B47DE8(v228, v229, v641);
            sub_1C7B7B3A0();
            swift_bridgeObjectRelease();
            sub_1C7B78120(v151, type metadata accessor for Record);
            *(_WORD *)(v155 + 22) = 2082;
            uint64_t v230 = v599;
            uint64_t v231 = *(void *)(v599 + 16);
            unint64_t v232 = *(void *)(v599 + 24);
            swift_bridgeObjectRetain();
            uint64_t v639 = sub_1C7B47DE8(v231, v232, v641);
            sub_1C7B7B3A0();
            swift_bridgeObjectRelease();
            sub_1C7B78120(v230, type metadata accessor for Record);
            _os_log_impl(&dword_1C7B37000, v153, v154, "(%{private}s) Sending modified record %{public}s to data source for zone %{public}s", (uint8_t *)v155, 0x20u);
            uint64_t v233 = v582;
            swift_arrayDestroy();
            MEMORY[0x1C87BC480](v233, -1, -1);
            MEMORY[0x1C87BC480](v155, -1, -1);

            v129 = v157;
          }
          else
          {
            swift_release_n();
            sub_1C7B78120(v151, type metadata accessor for Record);
            sub_1C7B78120(v152, type metadata accessor for Record);
          }
          uint64_t v643 = type metadata accessor for SyncEngine();
          v644 = &protocol witness table for SyncEngine;
          v641[0] = (uint64_t)v129;
          uint64_t v234 = v600;
          uint64_t v235 = MEMORY[0x1C87BC500](v600 + 16);
          v236 = (void *)v635;
          if (v235)
          {
            uint64_t v237 = *(void *)(v234 + 24);
            uint64_t v238 = swift_getObjectType();
            v239 = *(uint64_t (**)(uint64_t *, void *, uint64_t, uint64_t))(v237 + 16);
            swift_retain_n();
            char v240 = v239(v641, v236, v238, v237);
            v129 = v638;
            LOBYTE(v237) = v240;
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
            swift_release();
            if (v237)
            {
              uint64_t v241 = v129[8];
              uint64_t v242 = v129[9];
              v243 = v621;
              __swift_project_boxed_opaque_existential_1(v621, v241);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9780);
              v244 = v129;
              unint64_t v245 = (*((unsigned __int8 *)v619 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v619 + 80);
              uint64_t v246 = swift_allocObject();
              *(_OWORD *)(v246 + 16) = v583;
              sub_1C7B780B8((uint64_t)v236, v246 + v245, type metadata accessor for RecordMetadata);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v242 + 88))(v246, v241, v242);
              swift_bridgeObjectRelease();
              uint64_t v247 = v244[8];
              uint64_t v248 = v244[9];
              __swift_project_boxed_opaque_existential_1(v243, v247);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9380);
              uint64_t v249 = swift_allocObject();
              *(_OWORD *)(v249 + 16) = v583;
              uint64_t v250 = v236[1];
              uint64_t v251 = v236[2];
              uint64_t v252 = v236[3];
              *(void *)(v249 + 32) = *v236;
              *(void *)(v249 + 40) = v250;
              *(void *)(v249 + 48) = v251;
              *(void *)(v249 + 56) = v252;
              v253 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v248 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v253(v629, v249, v627, v628, v247, v248);
              uint64_t v115 = (uint64_t *)v635;
LABEL_72:
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v114 = v626;
              goto LABEL_127;
            }
          }
          else
          {
            swift_retain_n();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
            swift_release();
          }
          uint64_t v254 = v129[8];
          uint64_t v255 = v129[9];
          __swift_project_boxed_opaque_existential_1(v621, v254);
          uint64_t v256 = v236[1];
          uint64_t v257 = v236[2];
          uint64_t v258 = v236[3];
          v641[0] = *v236;
          v641[1] = v256;
          uint64_t v642 = v257;
          uint64_t v643 = v258;
          v259 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v255 + 128);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v259(v641, v254, v255);
          uint64_t v115 = (uint64_t *)v635;
          swift_bridgeObjectRelease();
          goto LABEL_72;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
      sub_1C7B780B8(v146, v130, type metadata accessor for Record);
      sub_1C7B780B8(v146, v145, type metadata accessor for Record);
      swift_retain_n();
      v179 = sub_1C7B7B080();
      os_log_type_t v180 = sub_1C7B7B2C0();
      if (os_log_type_enabled(v179, v180))
      {
        uint64_t v181 = swift_slowAlloc();
        uint64_t v182 = swift_slowAlloc();
        v641[0] = v182;
        *(_DWORD *)uint64_t v181 = v602;
        v183 = v129;
        unint64_t v184 = v129[26];
        uint64_t v600 = v182;
        if (v184)
        {
          unint64_t v185 = v183[25];
          unint64_t v186 = v184;
        }
        else
        {
          uint64_t v203 = IDSCopyLocalDeviceUniqueID();
          if (v203)
          {
            v204 = (void *)v203;
            unint64_t v185 = sub_1C7B7B1D0();
            unint64_t v186 = v205;
          }
          else
          {
            unint64_t v186 = v580 | 0x8000000000000000;
            unint64_t v185 = 0xD000000000000017;
          }
          v183 = v638;
          uint64_t v130 = (uint64_t)v617;
        }
        swift_bridgeObjectRetain();
        uint64_t v639 = sub_1C7B47DE8(v185, v186, v641);
        sub_1C7B7B3A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v181 + 12) = 2082;
        uint64_t v209 = RecordMetadata.description.getter();
        uint64_t v639 = sub_1C7B47DE8(v209, v210, v641);
        sub_1C7B7B3A0();
        swift_bridgeObjectRelease();
        sub_1C7B78120(v130, type metadata accessor for Record);
        *(_WORD *)(v181 + 22) = 2082;
        uint64_t v211 = (uint64_t)v615;
        uint64_t v212 = *((void *)v615 + 2);
        unint64_t v213 = *((void *)v615 + 3);
        swift_bridgeObjectRetain();
        uint64_t v639 = sub_1C7B47DE8(v212, v213, v641);
        sub_1C7B7B3A0();
        swift_bridgeObjectRelease();
        sub_1C7B78120(v211, type metadata accessor for Record);
        _os_log_impl(&dword_1C7B37000, v179, v180, "(%{private}s) Could not find data source for incoming modified record %{public}s for zone %{public}s", (uint8_t *)v181, 0x20u);
        uint64_t v214 = v600;
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v214, -1, -1);
        MEMORY[0x1C87BC480](v181, -1, -1);

LABEL_58:
        v129 = v183;
        uint64_t v114 = v626;
        goto LABEL_59;
      }
      swift_release_n();
      sub_1C7B78120(v130, type metadata accessor for Record);
      sub_1C7B78120(v145, type metadata accessor for Record);

LABEL_59:
      uint64_t v215 = v129[8];
      uint64_t v216 = v129[9];
      __swift_project_boxed_opaque_existential_1(v621, v215);
      v217 = (uint64_t *)v635;
      uint64_t v218 = *(void *)(v635 + 8);
      uint64_t v219 = *(void *)(v635 + 16);
      uint64_t v220 = *(void *)(v635 + 24);
      v641[0] = *(void *)v635;
      v641[1] = v218;
      uint64_t v642 = v219;
      uint64_t v643 = v220;
      v221 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v216 + 128);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v221(v641, v215, v216);
      uint64_t v115 = v217;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_127:
      sub_1C7B780B8((uint64_t)v115, (uint64_t)v623, type metadata accessor for RecordMetadata);
      uint64_t v113 = v637;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v116 = v634;
      uint64_t v112 = v633;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v113 = sub_1C7B51E54(0, *(void *)(v113 + 16) + 1, 1, v113);
      }
      os_log_type_t v101 = v638;
      unint64_t v395 = *(void *)(v113 + 16);
      unint64_t v394 = *(void *)(v113 + 24);
      if (v395 >= v394 >> 1) {
        uint64_t v113 = sub_1C7B51E54(v394 > 1, v395 + 1, 1, v113);
      }
      *(void *)(v113 + 16) = v395 + 1;
      sub_1C7B78D9C((uint64_t)v623, v113+ ((*((unsigned __int8 *)v619 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v619 + 80))+ v619[9] * v395, type metadata accessor for RecordMetadata);
      sub_1C7B78120((uint64_t)v115, type metadata accessor for Record);
      sub_1C7B4E5AC((uint64_t)v631, &qword_1EBC5E400);
LABEL_7:
      v112 += v622;
      if (!--v116)
      {
        swift_bridgeObjectRelease();
        uint64_t v108 = (_OWORD *)&unk_1C7B7D000;
        goto LABEL_161;
      }
    }
  }
  uint64_t v113 = MEMORY[0x1E4FBC860];
LABEL_161:
  v465 = v618;
  uint64_t v466 = *(void *)(v585 + 16);
  if (!v466) {
    goto LABEL_198;
  }
  v631 = v101 + 5;
  v467 = v619;
  uint64_t v468 = *((unsigned __int8 *)v619 + 80);
  uint64_t v469 = (v468 + 32) & ~v468;
  v470 = v108;
  uint64_t v471 = v585 + v469;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  uint64_t v626 = v467[9];
  v623 = (char *)(v626 + v469);
  uint64_t v622 = v468 | 7;
  v613 = &v641[1];
  v619 = v640;
  long long v635 = v470[128];
  *((void *)&v472 + 1) = *((void *)&v635 + 1);
  *(void *)&long long v472 = 136381187;
  long long v620 = v472;
  unint64_t v609 = (unint64_t)"Validating sync engine";
  v617 = (char *)(MEMORY[0x1E4FBC840] + 8);
  uint64_t v473 = (uint64_t)v616;
  uint64_t v630 = v469;
  do
  {
    uint64_t v634 = v466;
    uint64_t v637 = v113;
    uint64_t v633 = v471;
    sub_1C7B780B8(v471, (uint64_t)v465, type metadata accessor for RecordMetadata);
    uint64_t v474 = v101[8];
    uint64_t v475 = v101[9];
    v476 = v631;
    __swift_project_boxed_opaque_existential_1(v631, v474);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9780);
    uint64_t v477 = swift_allocObject();
    *(_OWORD *)(v477 + 16) = v635;
    sub_1C7B780B8((uint64_t)v465, v477 + v469, type metadata accessor for RecordMetadata);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v475 + 88))(v477, v474, v475);
    swift_bridgeObjectRelease();
    uint64_t v478 = v638[8];
    uint64_t v479 = v638[9];
    __swift_project_boxed_opaque_existential_1(v476, v478);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9380);
    uint64_t v480 = swift_allocObject();
    *(_OWORD *)(v480 + 16) = v635;
    uint64_t v481 = v465[1];
    uint64_t v483 = v465[2];
    uint64_t v482 = v465[3];
    uint64_t v484 = (uint64_t)v465;
    *(void *)(v480 + 32) = *v465;
    *(void *)(v480 + 40) = v481;
    *(void *)(v480 + 48) = v483;
    *(void *)(v480 + 56) = v482;
    v485 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v479 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v486 = v479;
    os_log_type_t v101 = v638;
    v485(v629, v480, v627, v628, v478, v486);
    swift_bridgeObjectRelease();
    uint64_t v487 = v101[18];
    uint64_t v488 = (uint64_t)v632;
    if (*(void *)(v487 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v489 = sub_1C7B49014(v483, v482);
      if (v490)
      {
        uint64_t v491 = *(void *)(*(void *)(v487 + 56) + 8 * v489);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_1EBC5E820 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
        uint64_t v492 = v610;
        sub_1C7B780B8(v484, v610, type metadata accessor for RecordMetadata);
        uint64_t v493 = v611;
        sub_1C7B780B8(v484, v611, type metadata accessor for RecordMetadata);
        swift_retain_n();
        v494 = sub_1C7B7B080();
        int v495 = sub_1C7B7B2D0();
        if (os_log_type_enabled(v494, (os_log_type_t)v495))
        {
          uint64_t v496 = swift_slowAlloc();
          uint64_t v497 = swift_slowAlloc();
          uint64_t v639 = v497;
          *(_DWORD *)uint64_t v496 = v620;
          unint64_t v498 = v101[26];
          LODWORD(v621) = v495;
          v615 = (char *)v497;
          if (v498)
          {
            unint64_t v499 = v101[25];
            unint64_t v500 = v498;
          }
          else
          {
            uint64_t v515 = IDSCopyLocalDeviceUniqueID();
            if (v515)
            {
              v516 = (void *)v515;
              unint64_t v499 = sub_1C7B7B1D0();
              unint64_t v500 = v517;
            }
            else
            {
              unint64_t v500 = v609 | 0x8000000000000000;
              unint64_t v499 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          v641[0] = sub_1C7B47DE8(v499, v500, &v639);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v496 + 12) = 2082;
          uint64_t v614 = v496 + 14;
          uint64_t v526 = v610;
          v641[0] = 0;
          v641[1] = 0xE000000000000000;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C7B7B450();
          swift_bridgeObjectRelease();
          strcpy((char *)v641, "identifier: ");
          BYTE5(v641[1]) = 0;
          HIWORD(v641[1]) = -5120;
          swift_bridgeObjectRetain();
          sub_1C7B7B220();
          swift_bridgeObjectRelease();
          sub_1C7B7B220();
          swift_bridgeObjectRetain();
          sub_1C7B7B220();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v641[0] = sub_1C7B47DE8(v641[0], v641[1], &v639);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease();
          sub_1C7B78120(v526, type metadata accessor for RecordMetadata);
          *(_WORD *)(v496 + 22) = 2082;
          uint64_t v527 = v611;
          uint64_t v528 = *(void *)(v611 + 16);
          unint64_t v529 = *(void *)(v611 + 24);
          swift_bridgeObjectRetain();
          v641[0] = sub_1C7B47DE8(v528, v529, &v639);
          sub_1C7B7B3A0();
          swift_bridgeObjectRelease();
          sub_1C7B78120(v527, type metadata accessor for RecordMetadata);
          _os_log_impl(&dword_1C7B37000, v494, (os_log_type_t)v621, "(%{private}s) Sending deleted recordID %{public}s to data source for zone %{public}s", (uint8_t *)v496, 0x20u);
          v530 = v615;
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v530, -1, -1);
          MEMORY[0x1C87BC480](v496, -1, -1);

          os_log_type_t v101 = v638;
          v511 = (uint64_t *)v618;
          uint64_t v473 = (uint64_t)v616;
        }
        else
        {
          swift_release_n();
          sub_1C7B78120(v492, type metadata accessor for RecordMetadata);
          sub_1C7B78120(v493, type metadata accessor for RecordMetadata);

          v511 = (uint64_t *)v484;
        }
        uint64_t v532 = *v511;
        uint64_t v531 = v511[1];
        uint64_t v534 = v511[2];
        uint64_t v533 = v511[3];
        v535 = v511;
        uint64_t v643 = type metadata accessor for SyncEngine();
        v644 = &protocol witness table for SyncEngine;
        v641[0] = (uint64_t)v101;
        if (MEMORY[0x1C87BC500](v491 + 16))
        {
          uint64_t v536 = *(void *)(v491 + 24);
          uint64_t v537 = swift_getObjectType();
          uint64_t v639 = v532;
          v640[0] = v531;
          v640[1] = v534;
          v640[2] = v533;
          v538 = *(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(v536 + 24);
          swift_retain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v539 = v537;
          os_log_type_t v101 = v638;
          v538(v641, &v639, v539, v536);
          swift_unknownObjectRelease();
        }
        else
        {
          swift_retain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        uint64_t v509 = v634;
        uint64_t v510 = v633;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v641);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v113 = v637;
        v465 = v535;
        uint64_t v469 = v630;
        goto LABEL_191;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v636, (uint64_t)qword_1EBC5DC50);
    v465 = (void *)v484;
    sub_1C7B780B8(v484, v473, type metadata accessor for RecordMetadata);
    sub_1C7B780B8(v484, v488, type metadata accessor for RecordMetadata);
    swift_retain_n();
    v501 = sub_1C7B7B080();
    os_log_type_t v502 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v501, v502))
    {
      uint64_t v503 = swift_slowAlloc();
      v504 = (void *)swift_slowAlloc();
      v641[0] = (uint64_t)v504;
      *(_DWORD *)uint64_t v503 = v620;
      unint64_t v505 = v101[26];
      v621 = v504;
      if (v505)
      {
        v506 = v101;
        unint64_t v507 = v101[25];
        unint64_t v508 = v505;
      }
      else
      {
        uint64_t v512 = IDSCopyLocalDeviceUniqueID();
        if (v512)
        {
          v513 = (void *)v512;
          unint64_t v507 = sub_1C7B7B1D0();
          unint64_t v508 = v514;
        }
        else
        {
          unint64_t v508 = v609 | 0x8000000000000000;
          unint64_t v507 = 0xD000000000000017;
        }
        v506 = v638;
      }
      swift_bridgeObjectRetain();
      uint64_t v639 = sub_1C7B47DE8(v507, v508, v641);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v503 + 12) = 2082;
      uint64_t v518 = RecordMetadata.description.getter();
      uint64_t v639 = sub_1C7B47DE8(v518, v519, v641);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();
      sub_1C7B78120(v473, type metadata accessor for RecordMetadata);
      *(_WORD *)(v503 + 22) = 2082;
      v520 = v632;
      uint64_t v521 = *((void *)v632 + 2);
      unint64_t v522 = *((void *)v632 + 3);
      swift_bridgeObjectRetain();
      uint64_t v639 = sub_1C7B47DE8(v521, v522, v641);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();
      uint64_t v523 = (uint64_t)v520;
      uint64_t v473 = (uint64_t)v616;
      sub_1C7B78120(v523, type metadata accessor for RecordMetadata);
      _os_log_impl(&dword_1C7B37000, v501, v502, "(%{private}s) Could not find data source for incoming deleted metadata %{public}s for zone %{public}s", (uint8_t *)v503, 0x20u);
      v524 = v621;
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v524, -1, -1);
      MEMORY[0x1C87BC480](v503, -1, -1);

      os_log_type_t v101 = v506;
      uint64_t v525 = (uint64_t)v624;
      v465 = v618;
      uint64_t v113 = v637;
      uint64_t v509 = v634;
      uint64_t v469 = v630;
      uint64_t v510 = v633;
      goto LABEL_192;
    }
    swift_release_n();
    sub_1C7B78120(v473, type metadata accessor for RecordMetadata);
    sub_1C7B78120(v488, type metadata accessor for RecordMetadata);

    uint64_t v113 = v637;
    uint64_t v509 = v634;
    uint64_t v469 = v630;
    uint64_t v510 = v633;
LABEL_191:
    uint64_t v525 = (uint64_t)v624;
LABEL_192:
    sub_1C7B780B8((uint64_t)v465, v525, type metadata accessor for RecordMetadata);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v113 = sub_1C7B51E54(0, *(void *)(v113 + 16) + 1, 1, v113);
    }
    unint64_t v541 = *(void *)(v113 + 16);
    unint64_t v540 = *(void *)(v113 + 24);
    if (v541 >= v540 >> 1) {
      uint64_t v113 = sub_1C7B51E54(v540 > 1, v541 + 1, 1, v113);
    }
    *(void *)(v113 + 16) = v541 + 1;
    uint64_t v542 = v626;
    sub_1C7B78D9C(v525, v113 + v469 + v541 * v626, type metadata accessor for RecordMetadata);
    sub_1C7B78120((uint64_t)v465, type metadata accessor for RecordMetadata);
    uint64_t v471 = v510 + v542;
    uint64_t v466 = v509 - 1;
  }
  while (v466);
  swift_bridgeObjectRelease();
LABEL_198:
  LOBYTE(v641[0]) = v579;
  LOBYTE(v639) = v581;
  sub_1C7B68A44((unsigned __int8 *)v641, v113, v627, v628, (char *)&v639);
  swift_bridgeObjectRelease();
  uint64_t v543 = v612;
  v544 = (void (*)(char *, uint64_t))v607;
  v607((unint64_t)v625, v612);
  v544(v629, v543);
}

uint64_t sub_1C7B6804C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v62 = type metadata accessor for Record(0);
  uint64_t v61 = *(void *)(v62 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v62);
  uint64_t v64 = (uint64_t)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v63 = (uint64_t)&v59 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v75 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for RecordMetadata(0);
  uint64_t v9 = *(void *)(v74 - 8);
  MEMORY[0x1F4188790](v74);
  uint64_t v76 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C7B7B160();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (uint64_t *)((char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = (void *)v2[15];
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCBF0], v11);
  id v16 = v15;
  LOBYTE(v15) = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if (v15)
  {
    uint64_t v18 = *(void *)(a1 + 16);
    if (v18)
    {
      uint64_t v73 = v2 + 5;
      swift_bridgeObjectRetain();
      uint64_t v71 = v2 + 18;
      swift_beginAccess();
      uint64_t v72 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      unint64_t v65 = MEMORY[0x1E4FBC860];
      uint64_t v59 = a1;
      uint64_t v19 = (uint64_t *)(a1 + 56);
      *(void *)&long long v20 = 136380931;
      long long v67 = v20;
      unint64_t v60 = (unint64_t)"Validating sync engine";
      uint64_t v66 = MEMORY[0x1E4FBC840] + 8;
      uint64_t v68 = v2;
      while (1)
      {
        uint64_t v79 = v18;
        uint64_t v22 = *(v19 - 3);
        uint64_t v21 = *(v19 - 2);
        uint64_t v24 = *(v19 - 1);
        uint64_t v23 = *v19;
        uint64_t v25 = v2[8];
        uint64_t v26 = v2[9];
        uint64_t v27 = v2;
        __swift_project_boxed_opaque_existential_1(v73, v25);
        uint64_t v77 = v22;
        uint64_t v78 = v24;
        v81[0] = v22;
        v81[1] = v21;
        v81[2] = v24;
        uint64_t v82 = v23;
        uint64_t v28 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v26 + 72);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v29 = (uint64_t)v75;
        v28(v81, v25, v26);
        if ((*v72)(v29, 1, v74) != 1) {
          break;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C7B4E5AC(v29, &qword_1EBC5E400);
        uint64_t v2 = v27;
LABEL_5:
        v19 += 4;
        uint64_t v18 = v79 - 1;
        if (v79 == 1)
        {
          swift_bridgeObjectRelease();
          return v65;
        }
      }
      sub_1C7B78D9C(v29, v76, type metadata accessor for RecordMetadata);
      uint64_t v30 = *v71;
      if (*(void *)(*v71 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v31 = sub_1C7B49014(v78, v23);
        uint64_t v2 = v27;
        if (v32)
        {
          uint64_t v33 = *(void *)(*(void *)(v30 + 56) + 8 * v31);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v82 = type metadata accessor for SyncEngine();
          uint64_t v83 = &protocol witness table for SyncEngine;
          v81[0] = (uint64_t)v2;
          if (MEMORY[0x1C87BC500](v33 + 16))
          {
            uint64_t v34 = *(void *)(v33 + 24);
            uint64_t ObjectType = swift_getObjectType();
            v80[0] = v77;
            v80[1] = v21;
            v80[2] = v78;
            v80[3] = v23;
            uint64_t v36 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(v34 + 8);
            swift_retain_n();
            swift_retain();
            uint64_t v37 = v36(v81, v80, ObjectType, v34);
            uint64_t v2 = v68;
            uint64_t v38 = v37;
            unint64_t v40 = v39;
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
            swift_release();
            swift_release();
            if (v40 >> 60 != 15)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v41 = v63;
              sub_1C7B780B8(v76, v63, type metadata accessor for RecordMetadata);
              uint64_t v42 = (uint64_t *)(v41 + *(int *)(v62 + 20));
              *uint64_t v42 = v38;
              v42[1] = v40;
              sub_1C7B780B8(v41, v64, type metadata accessor for Record);
              sub_1C7B3AEC8(v38, v40);
              unint64_t v43 = v65;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v43 = sub_1C7B51E30(0, *(void *)(v43 + 16) + 1, 1, v43);
              }
              unint64_t v45 = *(void *)(v43 + 16);
              unint64_t v44 = *(void *)(v43 + 24);
              if (v45 >= v44 >> 1) {
                unint64_t v43 = sub_1C7B51E30(v44 > 1, v45 + 1, 1, v43);
              }
              *(void *)(v43 + 16) = v45 + 1;
              unint64_t v46 = (*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
              unint64_t v65 = v43;
              sub_1C7B78D9C(v64, v43 + v46 + *(void *)(v61 + 72) * v45, type metadata accessor for Record);
              sub_1C7B78E04(v38, v40);
              swift_release();
              sub_1C7B78120(v63, type metadata accessor for Record);
LABEL_25:
              sub_1C7B78120(v76, type metadata accessor for RecordMetadata);
              goto LABEL_5;
            }
          }
          else
          {
            swift_retain();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        uint64_t v2 = v27;
      }
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_1C7B7B090();
      __swift_project_value_buffer(v47, (uint64_t)qword_1EBC5DC50);
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_1C7B7B080();
      int v49 = sub_1C7B7B2D0();
      if (os_log_type_enabled(v48, (os_log_type_t)v49))
      {
        int v70 = v49;
        uint64_t v50 = v2;
        uint64_t v51 = swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        v80[0] = v69;
        *(_DWORD *)uint64_t v51 = v67;
        unint64_t v52 = v2[26];
        if (v52)
        {
          unint64_t v53 = v2[25];
          unint64_t v54 = v52;
        }
        else
        {
          uint64_t v55 = IDSCopyLocalDeviceUniqueID();
          if (v55)
          {
            uint64_t v56 = (void *)v55;
            unint64_t v53 = sub_1C7B7B1D0();
            unint64_t v54 = v57;
          }
          else
          {
            unint64_t v54 = v60 | 0x8000000000000000;
            unint64_t v53 = 0xD000000000000017;
          }
          uint64_t v50 = v68;
        }
        swift_bridgeObjectRetain();
        *(void *)(v51 + 4) = sub_1C7B47DE8(v53, v54, v80);
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v51 + 12) = 2082;
        v81[0] = 0;
        v81[1] = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C7B7B450();
        swift_bridgeObjectRelease();
        strcpy((char *)v81, "identifier: ");
        BYTE5(v81[1]) = 0;
        HIWORD(v81[1]) = -5120;
        swift_bridgeObjectRetain();
        sub_1C7B7B220();
        swift_bridgeObjectRelease();
        sub_1C7B7B220();
        swift_bridgeObjectRetain();
        sub_1C7B7B220();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(void *)(v51 + 14) = sub_1C7B47DE8(v81[0], v81[1], v80);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C7B37000, v48, (os_log_type_t)v70, "(%{private}s) Data source failed to provide data for %{public}s", (uint8_t *)v51, 0x16u);
        uint64_t v58 = v69;
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v58, -1, -1);
        MEMORY[0x1C87BC480](v51, -1, -1);
        swift_release();

        sub_1C7B78120(v76, type metadata accessor for RecordMetadata);
        uint64_t v2 = v50;
        goto LABEL_5;
      }
      swift_release();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      goto LABEL_25;
    }
    return MEMORY[0x1E4FBC860];
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C7B68A44(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v6 = v5;
  uint64_t v72 = a3;
  uint64_t v11 = sub_1C7B7B160();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (uint64_t *)((char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *a1;
  char v16 = *a5;
  uint64_t v17 = (void *)v6[15];
  *uint64_t v14 = v17;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCBF0], v11);
  id v18 = v17;
  uint64_t v19 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v19 & 1) == 0)
  {
    __break(1u);
LABEL_43:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v20 = v6[13];
  uint64_t v21 = v6[14];
  __swift_project_boxed_opaque_existential_1(v6 + 10, v20);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1C7B7B090();
    __swift_project_value_buffer(v31, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    char v32 = sub_1C7B7B080();
    os_log_type_t v33 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v76 = v35;
      *(_DWORD *)uint64_t v34 = 136380675;
      if (v6[26])
      {
        unint64_t v36 = v6[25];
        unint64_t v37 = v6[26];
      }
      else
      {
        uint64_t v42 = IDSCopyLocalDeviceUniqueID();
        if (v42)
        {
          unint64_t v43 = (void *)v42;
          unint64_t v36 = sub_1C7B7B1D0();
          unint64_t v37 = v44;
        }
        else
        {
          unint64_t v36 = 0xD000000000000017;
          unint64_t v37 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      v73[0] = sub_1C7B47DE8(v36, v37, &v76);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v51 = v33;
      unint64_t v52 = "(%{private}s) Will not send ack message because keybag is locked";
      goto LABEL_41;
    }
LABEL_38:

    swift_release_n();
    return;
  }
  uint64_t v19 = v6[31];
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_43;
  }
LABEL_4:
  if ((qword_1EBC5DCD0 & ~v19) != 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_1C7B7B090();
    __swift_project_value_buffer(v38, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    char v32 = sub_1C7B7B080();
    os_log_type_t v39 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v32, v39))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v76 = v35;
      *(_DWORD *)uint64_t v34 = 136380675;
      if (v6[26])
      {
        unint64_t v40 = v6[25];
        unint64_t v41 = v6[26];
      }
      else
      {
        uint64_t v48 = IDSCopyLocalDeviceUniqueID();
        if (v48)
        {
          int v49 = (void *)v48;
          unint64_t v40 = sub_1C7B7B1D0();
          unint64_t v41 = v50;
        }
        else
        {
          unint64_t v40 = 0xD000000000000017;
          unint64_t v41 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      v73[0] = sub_1C7B47DE8(v40, v41, &v76);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v51 = v39;
      unint64_t v52 = "(%{private}s) Will not send ack message because sync is inactive";
LABEL_41:
      _os_log_impl(&dword_1C7B37000, v32, v51, v52, v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v35, -1, -1);
      MEMORY[0x1C87BC480](v34, -1, -1);

      return;
    }
    goto LABEL_38;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_1C7B7B090();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v24 = sub_1C7B7B080();
  int v25 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v24, (os_log_type_t)v25))
  {
    uint64_t v71 = a4;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v76 = v27;
    *(_DWORD *)uint64_t v26 = 136381187;
    unint64_t v28 = v6[26];
    uint64_t v70 = v23;
    int v69 = v25;
    uint64_t v68 = v27;
    if (v28)
    {
      unint64_t v29 = v6[25];
      unint64_t v30 = v28;
    }
    else
    {
      uint64_t v45 = IDSCopyLocalDeviceUniqueID();
      if (v45)
      {
        unint64_t v46 = (void *)v45;
        unint64_t v29 = sub_1C7B7B1D0();
        unint64_t v30 = v47;
      }
      else
      {
        unint64_t v29 = 0xD000000000000017;
        unint64_t v30 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    v73[0] = sub_1C7B47DE8(v29, v30, &v76);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2082;
    if (v15) {
      uint64_t v53 = 0x6563616C706572;
    }
    else {
      uint64_t v53 = 0x657461647075;
    }
    if (v15) {
      unint64_t v54 = 0xE700000000000000;
    }
    else {
      unint64_t v54 = 0xE600000000000000;
    }
    v73[0] = sub_1C7B47DE8(v53, v54, &v76);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 22) = 2048;
    uint64_t v55 = *(void *)(a2 + 16);
    swift_bridgeObjectRelease();
    v73[0] = v55;
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v24, (os_log_type_t)v69, "(%{private}s) Sending ack message for action %{public}s with %ld metadata items", (uint8_t *)v26, 0x20u);
    uint64_t v56 = v68;
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v56, -1, -1);
    MEMORY[0x1C87BC480](v26, -1, -1);

    a4 = v71;
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  char v75 = v16;
  v73[0] = v15;
  v73[1] = a2;
  char v74 = 2;
  swift_bridgeObjectRetain();
  sub_1C7B6E01C(&v75, (uint64_t)v73, (uint64_t)&v76);
  swift_bridgeObjectRelease();
  char v57 = v76;
  uint64_t v58 = v77;
  uint64_t v59 = v78;
  uint64_t v60 = v79;
  unint64_t v61 = v80;
  uint64_t v62 = v6[4];
  uint64_t ObjectType = swift_getObjectType();
  LOBYTE(v76) = v57;
  uint64_t v77 = v58;
  uint64_t v78 = v59;
  uint64_t v79 = v60;
  unint64_t v80 = v61;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9490);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C7B7D800;
  *(void *)(inited + 32) = v72;
  *(void *)(inited + 40) = a4;
  swift_bridgeObjectRetain();
  uint64_t v65 = sub_1C7B5284C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v66 = *(void (**)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), void *, uint64_t, uint64_t))(v62 + 24);
  swift_retain();
  v66(&v76, v65, sub_1C7B78F04, v6, ObjectType, v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C7B3AF20(v60, v61);
}

void sub_1C7B693D0(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1C7B7B160();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (uint64_t *)((char *)&ObjectType - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v12 = *a3;
  uint64_t v13 = (void *)v4[15];
  *uint64_t v11 = v13;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  id v14 = v13;
  uint64_t v15 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v15 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v16 = v4[13];
  uint64_t v17 = v4[14];
  __swift_project_boxed_opaque_existential_1(v4 + 10, v16);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1C7B7B090();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v19 = sub_1C7B7B080();
    os_log_type_t v20 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v50 = v22;
      *(_DWORD *)uint64_t v21 = 136380675;
      if (v4[26])
      {
        unint64_t v23 = v4[25];
        unint64_t v24 = v4[26];
      }
      else
      {
        uint64_t v38 = IDSCopyLocalDeviceUniqueID();
        if (v38)
        {
          os_log_type_t v39 = (void *)v38;
          unint64_t v23 = sub_1C7B7B1D0();
          unint64_t v24 = v40;
        }
        else
        {
          unint64_t v23 = 0xD000000000000017;
          unint64_t v24 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      *(void *)&long long v47 = sub_1C7B47DE8(v23, v24, &v50);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v44 = v20;
      uint64_t v45 = "(%{private}s) Will not send resync message because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  uint64_t v15 = v4[31];
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_27;
  }
LABEL_4:
  if ((qword_1EBC5DCD0 & ~v15) == 0)
  {
    char v49 = v12;
    long long v47 = xmmword_1C7B7D810;
    char v48 = 3;
    sub_1C7B6E01C(&v49, (uint64_t)&v47, (uint64_t)&v50);
    char v29 = v50;
    uint64_t v31 = v51;
    uint64_t v30 = v52;
    uint64_t v32 = v53;
    unint64_t v33 = v54;
    uint64_t v34 = v4[4];
    uint64_t ObjectType = swift_getObjectType();
    LOBYTE(v50) = v29;
    uint64_t v51 = v31;
    uint64_t v52 = v30;
    uint64_t v53 = v32;
    unint64_t v54 = v33;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9490);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C7B7D800;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1C7B5284C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    unint64_t v37 = *(void (**)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), void *, uint64_t, uint64_t))(v34 + 24);
    swift_retain();
    v37(&v50, v36, sub_1C7B78E18, v4, ObjectType, v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C7B3AF20(v32, v33);
    return;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C7B7B090();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v19 = sub_1C7B7B080();
  os_log_type_t v26 = sub_1C7B7B2D0();
  if (!os_log_type_enabled(v19, v26)) {
    goto LABEL_16;
  }
  uint64_t v21 = (uint8_t *)swift_slowAlloc();
  uint64_t v22 = swift_slowAlloc();
  uint64_t v50 = v22;
  *(_DWORD *)uint64_t v21 = 136380675;
  if (v4[26])
  {
    unint64_t v27 = v4[25];
    unint64_t v28 = v4[26];
  }
  else
  {
    uint64_t v41 = IDSCopyLocalDeviceUniqueID();
    if (v41)
    {
      uint64_t v42 = (void *)v41;
      unint64_t v27 = sub_1C7B7B1D0();
      unint64_t v28 = v43;
    }
    else
    {
      unint64_t v27 = 0xD000000000000017;
      unint64_t v28 = 0x80000001C7B80E00;
    }
  }
  swift_bridgeObjectRetain();
  *(void *)&long long v47 = sub_1C7B47DE8(v27, v28, &v50);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  os_log_type_t v44 = v26;
  uint64_t v45 = "(%{private}s) Will not send resync message because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C7B37000, v19, v44, v45, v21, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v22, -1, -1);
  MEMORY[0x1C87BC480](v21, -1, -1);
}

uint64_t sub_1C7B69B00()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C7B7B160();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8);
  uint64_t v6 = (void *)v1[15];
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCBF0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    if (qword_1EBC5E820 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v8 = sub_1C7B7B090();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v9 = sub_1C7B7B080();
  os_log_type_t v10 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v21[0] = v12;
    *(_DWORD *)uint64_t v11 = 136380675;
    if (v1[26])
    {
      unint64_t v13 = v1[25];
      unint64_t v14 = v1[26];
    }
    else
    {
      uint64_t v15 = IDSCopyLocalDeviceUniqueID();
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        unint64_t v13 = sub_1C7B7B1D0();
        unint64_t v14 = v17;
      }
      else
      {
        unint64_t v14 = 0x80000001C7B80E00;
        unint64_t v13 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1C7B47DE8(v13, v14, v21);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v9, v10, "(%{private}s) Removing all inflight metadata", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v12, -1, -1);
    MEMORY[0x1C87BC480](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  v1[23] = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x1E4FBC868];
  v1[21] = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[22] = v18;
  return swift_bridgeObjectRelease();
}

void sub_1C7B69E2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C7B7B160();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (void *)v1[15];
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCBF0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_4;
  }
  if (!v1[19]) {
    return;
  }
  if (qword_1EBC5E820 != -1) {
    goto LABEL_16;
  }
LABEL_4:
  uint64_t v8 = sub_1C7B7B090();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v9 = sub_1C7B7B080();
  os_log_type_t v10 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136380675;
    if (v1[26])
    {
      unint64_t v13 = v1[25];
      unint64_t v14 = v1[26];
    }
    else
    {
      uint64_t v15 = IDSCopyLocalDeviceUniqueID();
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        unint64_t v13 = sub_1C7B7B1D0();
        unint64_t v14 = v17;
      }
      else
      {
        unint64_t v14 = 0x80000001C7B80E00;
        unint64_t v13 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1C7B47DE8(v13, v14, &v19);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v9, v10, "(%{private}s) Cancelling expiration timer", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v12, -1, -1);
    MEMORY[0x1C87BC480](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  if (v1[19])
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C7B7B370();
    swift_unknownObjectRelease();
    v1[19] = 0;
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C7B6A148(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_1C7B520F8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[4 * v8 + 4];
  if (a1 + 32 < v9 + 32 * v2 && v9 < a1 + 32 + 32 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1C7B7B520();
  __break(1u);
  return result;
}

void sub_1C7B6A29C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5)
{
  uint64_t v6 = v5;
  uint64_t v314 = a4;
  uint64_t v313 = a3;
  unint64_t v316 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v9 - 8);
  unint64_t v11 = (unint64_t)v298 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C7B7B020();
  uint64_t v312 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  int64_t v14 = (void *)((char *)v298 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v323 = (char *)v298 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v342 = type metadata accessor for RecordMetadata(0);
  uint64_t v329 = *(void *)(v342 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v342);
  uint64_t v339 = (uint64_t)v298 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  unint64_t v334 = (unint64_t)v298 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  unint64_t v332 = (void *)((char *)v298 - v22);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v337 = (void *)((char *)v298 - v24);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  uint64_t v320 = (uint64_t)v298 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v335 = (void *)((char *)v298 - v28);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  unint64_t v333 = (unint64_t)v298 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  unint64_t v33 = (void *)((char *)v298 - v32);
  uint64_t v34 = MEMORY[0x1F4188790](v31);
  uint64_t v340 = (void *)((char *)v298 - v35);
  uint64_t v36 = MEMORY[0x1F4188790](v34);
  unint64_t v338 = (void *)((char *)v298 - v37);
  MEMORY[0x1F4188790](v36);
  uint64_t ObjectType = (uint64_t)v298 - v38;
  uint64_t v39 = type metadata accessor for Record(0);
  uint64_t v324 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39 - 8);
  uint64_t v322 = (uint64_t)v298 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v41 = sub_1C7B7B160();
  uint64_t v42 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  os_log_type_t v44 = (void *)((char *)v298 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v315 = *a5;
  uint64_t v45 = (void *)v6[15];
  *os_log_type_t v44 = v45;
  unint64_t v46 = *(void (**)(void))(v42 + 104);
  unsigned int v309 = *MEMORY[0x1E4FBCBF0];
  uint64_t v310 = v42 + 104;
  uint64_t v308 = (void (*)(void *, void, unint64_t))v46;
  v46(v44);
  id v306 = v45;
  unint64_t v47 = sub_1C7B7B180();
  char v49 = *(void (**)(void *, unint64_t))(v42 + 8);
  uint64_t v48 = v42 + 8;
  unint64_t v311 = v44;
  uint64_t v307 = v49;
  v49(v44, v41);
  if ((v47 & 1) == 0) {
    goto LABEL_226;
  }
  uint64_t v304 = v14;
  uint64_t v305 = v48;
  uint64_t v50 = v6[13];
  uint64_t v51 = v6[14];
  __swift_project_boxed_opaque_existential_1(v6 + 10, v50);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v51 + 16))(v50, v51) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_1C7B7B090();
    __swift_project_value_buffer(v61, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v62 = sub_1C7B7B080();
    os_log_type_t v63 = sub_1C7B7B2D0();
    if (!os_log_type_enabled(v62, v63)) {
      goto LABEL_207;
    }
    uint64_t v64 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    v348[0] = v65;
    *(_DWORD *)uint64_t v64 = 136380675;
    if (v6[26])
    {
      unint64_t v66 = v6[25];
      unint64_t v67 = v6[26];
    }
    else
    {
      uint64_t v73 = IDSCopyLocalDeviceUniqueID();
      if (v73)
      {
        char v74 = (void *)v73;
        unint64_t v66 = sub_1C7B7B1D0();
        unint64_t v67 = v75;
      }
      else
      {
        unint64_t v66 = 0xD000000000000017;
        unint64_t v67 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v346 = (void *)sub_1C7B47DE8(v66, v67, v348);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_type_t v82 = v63;
    uint64_t v83 = "(%{private}s) Will not send records because keybag is locked";
    goto LABEL_176;
  }
  unint64_t v47 = v6[31];
  int64_t v14 = v6;
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_227;
  }
  while (1)
  {
    if ((qword_1EBC5DCD0 & ~v47) != 0)
    {
      if (qword_1EBC5E820 != -1) {
        swift_once();
      }
      uint64_t v68 = sub_1C7B7B090();
      __swift_project_value_buffer(v68, (uint64_t)qword_1EBC5DC50);
      swift_retain_n();
      uint64_t v62 = sub_1C7B7B080();
      os_log_type_t v69 = sub_1C7B7B2D0();
      if (!os_log_type_enabled(v62, v69)) {
        goto LABEL_207;
      }
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = v14;
      uint64_t v65 = swift_slowAlloc();
      v348[0] = v65;
      *(_DWORD *)uint64_t v64 = 136380675;
      if (v70[26])
      {
        unint64_t v71 = v70[25];
        unint64_t v72 = v70[26];
      }
      else
      {
        uint64_t v79 = IDSCopyLocalDeviceUniqueID();
        if (v79)
        {
          unint64_t v80 = (void *)v79;
          unint64_t v71 = sub_1C7B7B1D0();
          unint64_t v72 = v81;
        }
        else
        {
          unint64_t v71 = 0xD000000000000017;
          unint64_t v72 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v346 = (void *)sub_1C7B47DE8(v71, v72, v348);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v82 = v69;
      uint64_t v83 = "(%{private}s) Will not send records because sync is inactive";
LABEL_176:
      _os_log_impl(&dword_1C7B37000, v62, v82, v83, v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v65, -1, -1);
      MEMORY[0x1C87BC480](v64, -1, -1);

      return;
    }
    uint64_t v52 = a1;
    unint64_t v299 = v41;
    uint64_t v300 = v12;
    unint64_t v301 = v11;
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    unint64_t v41 = 0xD000000000000017;
    uint64_t v53 = sub_1C7B7B090();
    uint64_t v54 = __swift_project_value_buffer(v53, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v317 = v54;
    uint64_t v55 = sub_1C7B7B080();
    int v56 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v55, (os_log_type_t)v56))
    {
      a1 = swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      v348[0] = v57;
      *(_DWORD *)a1 = 136381187;
      unint64_t v58 = v14[26];
      LODWORD(v336) = v56;
      uint64_t v331 = v57;
      if (v58)
      {
        uint64_t v12 = (uint64_t)v14;
        unint64_t v59 = v14[25];
        unint64_t v60 = v58;
      }
      else
      {
        uint64_t v12 = (uint64_t)v14;
        uint64_t v76 = IDSCopyLocalDeviceUniqueID();
        if (v76)
        {
          uint64_t v77 = (void *)v76;
          unint64_t v59 = sub_1C7B7B1D0();
          unint64_t v60 = v78;
        }
        else
        {
          unint64_t v60 = 0x80000001C7B80E00;
          unint64_t v59 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v346 = (void *)sub_1C7B47DE8(v59, v60, v348);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(a1 + 12) = 2050;
      uint64_t v84 = *(void *)(v52 + 16);
      swift_bridgeObjectRelease();
      uint64_t v346 = (void *)v84;
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(a1 + 22) = 2050;
      unint64_t v11 = v316;
      uint64_t v85 = *(void *)(v316 + 16);
      swift_bridgeObjectRelease();
      uint64_t v346 = (void *)v85;
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v55, (os_log_type_t)v336, "(%{private}s) Sending %{public}ld modified records and %{public}ld deleted records", (uint8_t *)a1, 0x20u);
      uint64_t v86 = v331;
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v86, -1, -1);
      MEMORY[0x1C87BC480](a1, -1, -1);

      unint64_t v41 = 0xD000000000000017;
      int64_t v14 = (void *)v12;
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v87 = swift_allocObject();
    uint64_t v303 = v87;
    *(void *)(v87 + 16) = MEMORY[0x1E4FBC870];
    unint64_t v330 = (uint64_t *)(v87 + 16);
    uint64_t v88 = sub_1C7B6804C(v52);
    uint64_t v89 = sub_1C7B6D648(v88);
    swift_bridgeObjectRelease();
    uint64_t v90 = *(void *)(v89 + 16);
    uint64_t v328 = v14;
    uint64_t v321 = v89;
    *(void *)&long long v319 = v90;
    if (!v90) {
      break;
    }
    uint64_t v318 = v89 + ((*(unsigned __int8 *)(v324 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v324 + 80));
    swift_bridgeObjectRetain();
    unint64_t v47 = 0;
    while (v47 < *(void *)(v321 + 16))
    {
      uint64_t v94 = *(void *)(v324 + 72);
      uint64_t v327 = (void *)v47;
      uint64_t v95 = v322;
      sub_1C7B780B8(v318 + v94 * v47, v322, type metadata accessor for Record);
      uint64_t v96 = ObjectType;
      sub_1C7B780B8(v95, ObjectType, type metadata accessor for RecordMetadata);
      sub_1C7B78120(v95, type metadata accessor for Record);
      a1 = *v330;
      sub_1C7B7B650();
      unint64_t v41 = *(void *)(v96 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      uint64_t v97 = v342;
      uint64_t v98 = v96 + *(int *)(v342 + 20);
      int64_t v14 = (void *)sub_1C7B7AFF0();
      uint64_t v99 = sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
      uint64_t v336 = (char *)v98;
      os_log_type_t v326 = v14;
      v325 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v99;
      sub_1C7B7B1B0();
      uint64_t v331 = *(int *)(v97 + 24);
      sub_1C7B7B670();
      uint64_t v100 = sub_1C7B7B680();
      uint64_t v101 = -1 << *(unsigned char *)(a1 + 32);
      unint64_t v11 = v100 & ~v101;
      if ((*(void *)(a1 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v102 = ~v101;
        uint64_t v12 = *(void *)(v329 + 72);
        while (1)
        {
          sub_1C7B780B8(*(void *)(a1 + 48) + v12 * v11, (uint64_t)v33, type metadata accessor for RecordMetadata);
          uint64_t v103 = v33[2];
          int64_t v14 = (void *)v33[3];
          uint64_t v104 = *(void *)(ObjectType + 16);
          unint64_t v41 = *(void *)(ObjectType + 24);
          BOOL v105 = *v33 == *(void *)ObjectType && v33[1] == *(void *)(ObjectType + 8);
          if (v105 || (sub_1C7B7B5E0() & 1) != 0)
          {
            BOOL v106 = v103 == v104 && v14 == (void *)v41;
            if (v106 || (sub_1C7B7B5E0())
              && (sub_1C7B7AFC0() & 1) != 0
              && *((unsigned __int8 *)v33 + *(int *)(v342 + 24)) == *(unsigned __int8 *)(ObjectType + v331))
            {
              break;
            }
          }
          sub_1C7B78120((uint64_t)v33, type metadata accessor for RecordMetadata);
          unint64_t v11 = (v11 + 1) & v102;
          if (((*(void *)(a1 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            goto LABEL_55;
          }
        }
        sub_1C7B78120((uint64_t)v33, type metadata accessor for RecordMetadata);
      }
      else
      {
LABEL_55:
        swift_bridgeObjectRelease();
        uint64_t v107 = v330;
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_1C7B780B8(ObjectType, (uint64_t)v338, type metadata accessor for RecordMetadata);
        uint64_t v346 = (void *)*v107;
        uint64_t v109 = (uint64_t)v346;
        *uint64_t v107 = 0x8000000000000000;
        if (*(void *)(v109 + 24) > *(void *)(v109 + 16))
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_1C7B72B64();
          }
        }
        else
        {
          uint64_t v110 = v340;
          if (isUniquelyReferenced_nonNull_native) {
            sub_1C7B73DD0();
          }
          else {
            sub_1C7B73380();
          }
          unint64_t v41 = (unint64_t)v346;
          sub_1C7B7B650();
          long long v111 = v338;
          int64_t v14 = (void *)v338[2];
          a1 = v338[3];
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          sub_1C7B7B210();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1C7B7B210();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          uint64_t v112 = v342;
          uint64_t v336 = (char *)v111 + *(int *)(v342 + 20);
          sub_1C7B7B1B0();
          uint64_t v331 = *(int *)(v112 + 24);
          sub_1C7B7B670();
          uint64_t v113 = sub_1C7B7B680();
          uint64_t v114 = -1 << *(unsigned char *)(v41 + 32);
          unint64_t v11 = v113 & ~v114;
          if ((*(void *)(v41 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
          {
            uint64_t v115 = ~v114;
            uint64_t v12 = *(void *)(v329 + 72);
            while (1)
            {
              sub_1C7B780B8(*(void *)(v41 + 48) + v12 * v11, (uint64_t)v110, type metadata accessor for RecordMetadata);
              uint64_t v116 = *v110;
              uint64_t v117 = v110[1];
              uint64_t v118 = (void *)v110[2];
              a1 = v110[3];
              int64_t v14 = (void *)v338[2];
              uint64_t v119 = v338[3];
              BOOL v120 = v116 == *v338 && v117 == v338[1];
              if (v120 || (sub_1C7B7B5E0() & 1) != 0)
              {
                BOOL v121 = v118 == v14 && a1 == v119;
                if (v121 || (sub_1C7B7B5E0())
                  && (sub_1C7B7AFC0() & 1) != 0
                  && *((unsigned __int8 *)v340 + *(int *)(v342 + 24)) == *((unsigned __int8 *)v338 + v331))
                {
                  break;
                }
              }
              uint64_t v110 = v340;
              sub_1C7B78120((uint64_t)v340, type metadata accessor for RecordMetadata);
              unint64_t v11 = (v11 + 1) & v115;
              if (((*(void *)(v41 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
                goto LABEL_35;
              }
            }
LABEL_229:
            uint64_t v297 = (uint64_t)v340;
            goto LABEL_230;
          }
        }
LABEL_35:
        unint64_t v47 = (unint64_t)v346;
        *(void *)((char *)v346 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v11;
        sub_1C7B78D9C((uint64_t)v338, *(void *)(v47 + 48) + *(void *)(v329 + 72) * v11, type metadata accessor for RecordMetadata);
        uint64_t v91 = *(void *)(v47 + 16);
        BOOL v92 = __OFADD__(v91, 1);
        uint64_t v93 = v91 + 1;
        if (v92) {
          goto LABEL_224;
        }
        *(void *)(v47 + 16) = v93;
        *unint64_t v330 = v47;
      }
      swift_bridgeObjectRelease();
      unint64_t v47 = (unint64_t)v327 + 1;
      sub_1C7B78120(ObjectType, type metadata accessor for RecordMetadata);
      int64_t v14 = v328;
      unint64_t v41 = 0xD000000000000017;
      if (v47 == (void)v319)
      {
        swift_bridgeObjectRelease();
        goto LABEL_76;
      }
    }
    __break(1u);
LABEL_224:
    __break(1u);
LABEL_225:
    __break(1u);
LABEL_226:
    __break(1u);
LABEL_227:
    swift_once();
  }
LABEL_76:
  unint64_t v347 = MEMORY[0x1E4FBC860];
  uint64_t v331 = *(void *)(v316 + 16);
  if (!v331)
  {
LABEL_162:
    unint64_t v205 = v347;
    if (*(void *)(*v330 + 16))
    {
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v206 = sub_1C7B7B080();
      v207 = v14;
      os_log_type_t v208 = sub_1C7B7B2D0();
      if (os_log_type_enabled(v206, v208))
      {
        uint64_t v209 = swift_slowAlloc();
        uint64_t v210 = swift_slowAlloc();
        v348[0] = v210;
        *(_DWORD *)uint64_t v209 = 136381187;
        if (v207[26])
        {
          unint64_t v211 = v207[25];
          unint64_t v212 = v207[26];
        }
        else
        {
          uint64_t v218 = IDSCopyLocalDeviceUniqueID();
          if (v218)
          {
            uint64_t v219 = (void *)v218;
            unint64_t v211 = sub_1C7B7B1D0();
            unint64_t v212 = v220;
          }
          else
          {
            unint64_t v212 = 0x80000001C7B80E00;
            unint64_t v211 = 0xD000000000000017;
          }
        }
        swift_bridgeObjectRetain();
        uint64_t v346 = (void *)sub_1C7B47DE8(v211, v212, v348);
        sub_1C7B7B3A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v209 + 12) = 2050;
        uint64_t v224 = *(void *)(v321 + 16);
        swift_bridgeObjectRelease();
        uint64_t v346 = (void *)v224;
        sub_1C7B7B3A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v209 + 22) = 2050;
        uint64_t v225 = *(void *)(v205 + 16);
        swift_bridgeObjectRelease();
        uint64_t v346 = (void *)v225;
        sub_1C7B7B3A0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C7B37000, v206, v208, "(%{private}s) Syncing %{public}ld modifications and %{public}ld deletions", (uint8_t *)v209, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v210, -1, -1);
        MEMORY[0x1C87BC480](v209, -1, -1);

        v207 = v328;
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      if ((v207[2] & 1) == 0)
      {
        uint64_t v227 = v207[8];
        uint64_t v228 = v207[9];
        __swift_project_boxed_opaque_existential_1(v207 + 5, v227);
        LOBYTE(v228) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v228 + 136))(v313, v314, v227, v228);
        swift_retain_n();
        unint64_t v229 = sub_1C7B7B080();
        os_log_type_t v230 = sub_1C7B7B2D0();
        BOOL v231 = os_log_type_enabled(v229, v230);
        if ((v228 & 1) == 0)
        {
          if (v231)
          {
            v236 = (uint8_t *)swift_slowAlloc();
            uint64_t v237 = swift_slowAlloc();
            v348[0] = v237;
            *(_DWORD *)v236 = 136380675;
            if (v207[26])
            {
              unint64_t v238 = v207[25];
              unint64_t v239 = v207[26];
            }
            else
            {
              uint64_t v243 = IDSCopyLocalDeviceUniqueID();
              if (v243)
              {
                v244 = (void *)v243;
                unint64_t v238 = sub_1C7B7B1D0();
                unint64_t v239 = v245;
              }
              else
              {
                unint64_t v239 = 0x80000001C7B80E00;
                unint64_t v238 = 0xD000000000000017;
              }
            }
            swift_bridgeObjectRetain();
            uint64_t v346 = (void *)sub_1C7B47DE8(v238, v239, v348);
            sub_1C7B7B3A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C7B37000, v229, v230, "(%{private}s) Paired device has never synced; sending as replace",
              v236,
              0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C87BC480](v237, -1, -1);
            MEMORY[0x1C87BC480](v236, -1, -1);
          }
          else
          {

            swift_release_n();
          }
          unsigned __int8 v226 = 1;
          goto LABEL_203;
        }
        if (v231)
        {
          unint64_t v232 = (uint8_t *)swift_slowAlloc();
          uint64_t v233 = swift_slowAlloc();
          v348[0] = v233;
          *(_DWORD *)unint64_t v232 = 136380675;
          if (v207[26])
          {
            unint64_t v234 = v207[25];
            unint64_t v235 = v207[26];
          }
          else
          {
            uint64_t v240 = IDSCopyLocalDeviceUniqueID();
            if (v240)
            {
              uint64_t v241 = (void *)v240;
              unint64_t v234 = sub_1C7B7B1D0();
              unint64_t v235 = v242;
            }
            else
            {
              unint64_t v235 = 0x80000001C7B80E00;
              unint64_t v234 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v346 = (void *)sub_1C7B47DE8(v234, v235, v348);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C7B37000, v229, v230, "(%{private}s) Paired device has synced before; sending as update",
            v232,
            0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v233, -1, -1);
          MEMORY[0x1C87BC480](v232, -1, -1);

          unsigned __int8 v226 = 0;
          goto LABEL_203;
        }

        swift_release_n();
      }
      unsigned __int8 v226 = 0;
LABEL_203:
      char v246 = v315;
      swift_beginAccess();
      uint64_t v247 = v347;
      LOBYTE(v345) = v246;
      uint64_t v248 = v321;
      v343[0] = v321;
      v343[1] = v347;
      unsigned __int8 v344 = v226;
      sub_1C7B6E01C((char *)&v345, (uint64_t)v343, (uint64_t)v348);
      sub_1C7B56D6C(v248, v247, v226);
      LODWORD(v249) = LOBYTE(v348[0]);
      uint64_t v250 = v349;
      uint64_t v251 = v351;
      uint64_t ObjectType = v348[1];
      uint64_t v342 = v350;
      uint64_t v252 = v304;
      sub_1C7B7B010();
      v253 = (void *)sub_1C7B7B000();
      uint64_t v255 = v254;
      (*(void (**)(void *, uint64_t))(v312 + 8))(v252, v300);
      uint64_t v256 = *v330;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v257 = swift_isUniquelyReferenced_nonNull_native();
      v343[0] = v207[21];
      v207[21] = 0x8000000000000000;
      sub_1C7B4B0B8(v256, (uint64_t)v253, v255, v257);
      v207[21] = v343[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_bridgeObjectRetain();
      uint64_t v258 = v301;
      sub_1C7B7AFD0();
      uint64_t v259 = sub_1C7B7AFF0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v259 - 8) + 56))(v258, 0, 1, v259);
      swift_beginAccess();
      sub_1C7B42710(v258, (uint64_t)v253, v255);
      swift_endAccess();
      uint64_t v260 = v207[23];
      swift_bridgeObjectRetain();
      uint64_t v261 = swift_bridgeObjectRetain();
      v207[23] = sub_1C7B58B50(v261, v260);
      swift_bridgeObjectRelease();
      unint64_t v262 = v311;
      uint64_t v263 = v306;
      *unint64_t v311 = v306;
      unint64_t v264 = v299;
      v308(v262, v309, v299);
      id v265 = v263;
      LOBYTE(v263) = sub_1C7B7B180();
      v307(v262, v264);
      if (v263)
      {
        sub_1C7B69E2C();
        sub_1C7B701E8();
        swift_retain_n();
        swift_retain_n();
        uint64_t v266 = sub_1C7B7B080();
        os_log_type_t v267 = sub_1C7B7B2D0();
        BOOL v268 = os_log_type_enabled(v266, v267);
        uint64_t v340 = (uint64_t *)v251;
        uint64_t v339 = v250;
        unint64_t v338 = v253;
        LODWORD(v337) = v249;
        if (v268)
        {
          uint64_t v269 = swift_slowAlloc();
          uint64_t v270 = swift_slowAlloc();
          v348[0] = v270;
          *(_DWORD *)uint64_t v269 = 136381187;
          if (v207[26])
          {
            unint64_t v271 = v207[25];
            unint64_t v272 = v207[26];
          }
          else
          {
            uint64_t v275 = IDSCopyLocalDeviceUniqueID();
            if (v275)
            {
              char v276 = (void *)v275;
              unint64_t v271 = sub_1C7B7B1D0();
              unint64_t v272 = v277;
            }
            else
            {
              unint64_t v272 = 0x80000001C7B80E00;
              unint64_t v271 = 0xD000000000000017;
            }
            v207 = v328;
          }
          swift_bridgeObjectRetain();
          v343[0] = sub_1C7B47DE8(v271, v272, v348);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v269 + 12) = 2050;
          swift_beginAccess();
          uint64_t v278 = *(void *)(*(void *)(v303 + 16) + 16);
          swift_release();
          uint64_t v345 = v278;
          sub_1C7B7B3A0();
          swift_release();
          *(_WORD *)(v269 + 22) = 2050;
          uint64_t v279 = *(void *)(v207[23] + 16);
          swift_release();
          uint64_t v345 = v279;
          sub_1C7B7B3A0();
          swift_release();
          _os_log_impl(&dword_1C7B37000, v266, v267, "(%{private}s) Added %{public}ld inflight records; %{public}ld remaining",
            (uint8_t *)v269,
            0x20u);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v270, -1, -1);
          MEMORY[0x1C87BC480](v269, -1, -1);

          uint64_t v273 = v207;
          uint64_t v274 = v342;
          LOBYTE(v249) = (_BYTE)v337;
        }
        else
        {

          swift_release_n();
          swift_release_n();
          uint64_t v273 = v207;
          uint64_t v274 = v342;
        }
        swift_retain_n();
        v280 = sub_1C7B7B080();
        os_log_type_t v281 = sub_1C7B7B2D0();
        if (os_log_type_enabled(v280, v281))
        {
          uint64_t v282 = swift_slowAlloc();
          uint64_t v283 = swift_slowAlloc();
          v348[0] = v283;
          *(_DWORD *)uint64_t v282 = 136380931;
          if (v273[26])
          {
            unint64_t v284 = v273[25];
            unint64_t v249 = v273[26];
          }
          else
          {
            uint64_t v285 = IDSCopyLocalDeviceUniqueID();
            if (v285)
            {
              unint64_t v286 = (void *)v285;
              unint64_t v284 = sub_1C7B7B1D0();
              unint64_t v249 = v287;

              uint64_t v273 = v328;
            }
            else
            {
              unint64_t v249 = 0x80000001C7B80E00;
              uint64_t v273 = v328;
              unint64_t v284 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v345 = sub_1C7B47DE8(v284, v249, v348);
          sub_1C7B7B3A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v282 + 12) = 2050;
          uint64_t v288 = *(void *)(v273[21] + 16);
          swift_release();
          uint64_t v345 = v288;
          sub_1C7B7B3A0();
          swift_release();
          _os_log_impl(&dword_1C7B37000, v280, v281, "(%{private}s) %{public}ld outstanding request identifiers", (uint8_t *)v282, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C87BC480](v283, -1, -1);
          MEMORY[0x1C87BC480](v282, -1, -1);

          uint64_t v274 = v342;
          LOBYTE(v249) = (_BYTE)v337;
        }
        else
        {

          swift_release_n();
        }
        uint64_t v289 = ObjectType;
        uint64_t v290 = v273[4];
        uint64_t ObjectType = swift_getObjectType();
        LOBYTE(v348[0]) = v249;
        v348[1] = v289;
        uint64_t v349 = v339;
        unint64_t v291 = (unint64_t)v340;
        uint64_t v350 = v274;
        uint64_t v351 = (uint64_t)v340;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9490);
        uint64_t v292 = swift_allocObject();
        *(_OWORD *)(v292 + 16) = xmmword_1C7B7D800;
        *(void *)(v292 + 32) = v313;
        *(void *)(v292 + 40) = v314;
        swift_bridgeObjectRetain();
        uint64_t v293 = sub_1C7B5284C(v292);
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();
        uint64_t v294 = (void *)swift_allocObject();
        unint64_t v295 = v338;
        v294[2] = v273;
        v294[3] = v295;
        v294[4] = v255;
        v294[5] = v303;
        unint64_t v296 = *(void (**)(uint64_t *, uint64_t, uint64_t (*)(void *, uint64_t, char), void *, uint64_t, uint64_t))(v290 + 24);
        swift_retain();
        swift_retain();
        v296(v348, v293, sub_1C7B781C8, v294, ObjectType, v290);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        sub_1C7B3AF20(v342, v291);
        swift_release();
        return;
      }
      __break(1u);
      goto LABEL_229;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain_n();
    uint64_t v62 = sub_1C7B7B080();
    os_log_type_t v213 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v62, v213))
    {
      uint64_t v214 = (uint8_t *)swift_slowAlloc();
      uint64_t v215 = v14;
      uint64_t v216 = swift_slowAlloc();
      v348[0] = v216;
      *(_DWORD *)uint64_t v214 = 136380675;
      if (v215[26])
      {
        unint64_t v41 = v215[25];
        unint64_t v217 = v215[26];
      }
      else
      {
        uint64_t v221 = IDSCopyLocalDeviceUniqueID();
        if (v221)
        {
          uint64_t v222 = (void *)v221;
          unint64_t v41 = sub_1C7B7B1D0();
          unint64_t v217 = v223;
        }
        else
        {
          unint64_t v217 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v346 = (void *)sub_1C7B47DE8(v41, v217, v348);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v62, v213, "(%{private}s) Update message is empty; will not send", v214, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v216, -1, -1);
      MEMORY[0x1C87BC480](v214, -1, -1);
      swift_release();

      return;
    }
    swift_release();
LABEL_207:

    swift_release_n();
    return;
  }
  uint64_t v327 = v14 + 5;
  os_log_type_t v326 = (void *)(v316 + 32);
  v325 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v329 + 48);
  v298[1] = &v348[1];
  swift_bridgeObjectRetain();
  uint64_t v122 = 0;
  *(void *)&long long v123 = 136380931;
  long long v319 = v123;
  unint64_t v302 = (unint64_t)"Validating sync engine";
  uint64_t v318 = MEMORY[0x1E4FBC840] + 8;
  while (1)
  {
    v124 = &v326[4 * v122];
    uint64_t v125 = *v124;
    uint64_t v126 = v124[1];
    uint64_t v127 = (void *)v124[2];
    uint64_t v128 = v124[3];
    uint64_t v129 = v14[8];
    uint64_t v130 = v14[9];
    __swift_project_boxed_opaque_existential_1(v327, v129);
    uint64_t v336 = (char *)v125;
    v348[0] = v125;
    v348[1] = v126;
    unint64_t v338 = v127;
    uint64_t v349 = (uint64_t)v127;
    uint64_t v350 = v128;
    v131 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v130 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v132 = (uint64_t)v323;
    v131(v348, v129, v130);
    if ((*v325)(v132, 1, v342) == 1)
    {
      sub_1C7B4E5AC(v132, &qword_1EBC5E400);
      int64_t v14 = v328;
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      os_log_type_t v133 = sub_1C7B7B080();
      os_log_type_t v134 = sub_1C7B7B2D0();
      if (os_log_type_enabled(v133, v134))
      {
        uint64_t v340 = (uint64_t *)v122;
        uint64_t v135 = swift_slowAlloc();
        uint64_t v136 = swift_slowAlloc();
        uint64_t v346 = (void *)v136;
        *(_DWORD *)uint64_t v135 = v319;
        unint64_t v137 = v14[26];
        uint64_t ObjectType = v136;
        if (v137)
        {
          uint64_t v138 = v14;
          unint64_t v139 = v14[25];
          unint64_t v140 = v137;
        }
        else
        {
          uint64_t v138 = v14;
          uint64_t v197 = IDSCopyLocalDeviceUniqueID();
          if (v197)
          {
            uint64_t v198 = (void *)v197;
            unint64_t v139 = sub_1C7B7B1D0();
            unint64_t v140 = v199;
          }
          else
          {
            unint64_t v140 = v302 | 0x8000000000000000;
            unint64_t v139 = 0xD000000000000017;
          }
          unint64_t v41 = 0xD000000000000017;
        }
        swift_bridgeObjectRetain();
        *(void *)(v135 + 4) = sub_1C7B47DE8(v139, v140, (uint64_t *)&v346);
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v135 + 12) = 2082;
        v348[0] = 0;
        v348[1] = 0xE000000000000000;
        sub_1C7B7B450();
        swift_bridgeObjectRelease();
        strcpy((char *)v348, "identifier: ");
        BYTE5(v348[1]) = 0;
        HIWORD(v348[1]) = -5120;
        swift_bridgeObjectRetain();
        sub_1C7B7B220();
        swift_bridgeObjectRelease();
        sub_1C7B7B220();
        swift_bridgeObjectRetain();
        sub_1C7B7B220();
        swift_bridgeObjectRelease();
        *(void *)(v135 + 14) = sub_1C7B47DE8(v348[0], v348[1], (uint64_t *)&v346);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C7B37000, v133, v134, "(%{private}s) Metadata store does not contain an entry for deleted record %{public}s", (uint8_t *)v135, 0x16u);
        uint64_t v200 = ObjectType;
        swift_arrayDestroy();
        MEMORY[0x1C87BC480](v200, -1, -1);
        MEMORY[0x1C87BC480](v135, -1, -1);

        uint64_t v122 = (uint64_t)v340;
        int64_t v14 = v138;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      goto LABEL_79;
    }
    uint64_t v324 = v128;
    uint64_t v340 = (uint64_t *)v122;
    unint64_t v41 = v333;
    sub_1C7B78D9C(v132, v333, type metadata accessor for RecordMetadata);
    uint64_t v141 = v328[23];
    if (!*(void *)(v141 + 16)) {
      break;
    }
    uint64_t v322 = v126;
    sub_1C7B7B650();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v142 = v342;
    sub_1C7B7AFF0();
    sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
    sub_1C7B7B1B0();
    uint64_t ObjectType = *(int *)(v142 + 24);
    sub_1C7B7B670();
    uint64_t v143 = sub_1C7B7B680();
    uint64_t v144 = -1 << *(unsigned char *)(v141 + 32);
    unint64_t v145 = v143 & ~v144;
    uint64_t v146 = v335;
    if (((*(void *)(v141 + 56 + ((v145 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v145) & 1) == 0)
    {
LABEL_103:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_105;
    }
    uint64_t v147 = ~v144;
    uint64_t v148 = *(void *)(v329 + 72);
    while (1)
    {
      sub_1C7B780B8(*(void *)(v141 + 48) + v148 * v145, (uint64_t)v146, type metadata accessor for RecordMetadata);
      uint64_t v149 = *v146;
      uint64_t v150 = v146[1];
      uint64_t v151 = v146[2];
      uint64_t v152 = v146[3];
      uint64_t v153 = *(void *)v41;
      uint64_t v154 = *(void *)(v41 + 8);
      uint64_t v155 = *(void *)(v41 + 16);
      uint64_t v156 = *(void *)(v41 + 24);
      BOOL v157 = v149 == v153 && v150 == v154;
      if (v157 || (sub_1C7B7B5E0() & 1) != 0)
      {
        BOOL v158 = v151 == v155 && v152 == v156;
        if (v158 || (sub_1C7B7B5E0())
          && (sub_1C7B7AFC0() & 1) != 0
          && *((unsigned __int8 *)v335 + *(int *)(v342 + 24)) == *(unsigned __int8 *)(v333 + ObjectType))
        {
          break;
        }
      }
      uint64_t v146 = v335;
      sub_1C7B78120((uint64_t)v335, type metadata accessor for RecordMetadata);
      unint64_t v145 = (v145 + 1) & v147;
      unint64_t v41 = v333;
      if (((*(void *)(v141 + 56 + ((v145 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v145) & 1) == 0) {
        goto LABEL_103;
      }
    }
    sub_1C7B78120((uint64_t)v335, type metadata accessor for RecordMetadata);
    swift_bridgeObjectRelease();
    int64_t v14 = v328;
    swift_retain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v159 = sub_1C7B7B080();
    int v160 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v159, (os_log_type_t)v160))
    {
      uint64_t v161 = swift_slowAlloc();
      uint64_t v162 = swift_slowAlloc();
      uint64_t v346 = (void *)v162;
      *(_DWORD *)uint64_t v161 = v319;
      unint64_t v163 = v14[26];
      LODWORD(ObjectType) = v160;
      v298[0] = v162;
      if (v163)
      {
        char v164 = v14;
        unint64_t v165 = v14[25];
        unint64_t v166 = v163;
      }
      else
      {
        char v164 = v14;
        uint64_t v201 = IDSCopyLocalDeviceUniqueID();
        if (v201)
        {
          unint64_t v202 = (void *)v201;
          unint64_t v165 = sub_1C7B7B1D0();
          unint64_t v166 = v203;
        }
        else
        {
          unint64_t v166 = v302 | 0x8000000000000000;
          unint64_t v165 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v348[0] = sub_1C7B47DE8(v165, v166, (uint64_t *)&v346);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v161 + 12) = 2082;
      v348[0] = 0;
      v348[1] = 0xE000000000000000;
      sub_1C7B7B450();
      swift_bridgeObjectRelease();
      strcpy((char *)v348, "identifier: ");
      BYTE5(v348[1]) = 0;
      HIWORD(v348[1]) = -5120;
      swift_bridgeObjectRetain();
      sub_1C7B7B220();
      swift_bridgeObjectRelease();
      sub_1C7B7B220();
      swift_bridgeObjectRetain();
      sub_1C7B7B220();
      swift_bridgeObjectRelease();
      v348[0] = sub_1C7B47DE8(v348[0], v348[1], (uint64_t *)&v346);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v159, (os_log_type_t)ObjectType, "(%{private}s) Metadata for deleted record %{public}s is already syncing", (uint8_t *)v161, 0x16u);
      uint64_t v204 = v298[0];
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v204, -1, -1);
      MEMORY[0x1C87BC480](v161, -1, -1);

      sub_1C7B78120(v333, type metadata accessor for RecordMetadata);
      unint64_t v41 = 0xD000000000000017;
      uint64_t v122 = (uint64_t)v340;
      int64_t v14 = v164;
      goto LABEL_79;
    }
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    sub_1C7B78120(v333, type metadata accessor for RecordMetadata);
LABEL_150:
    unint64_t v41 = 0xD000000000000017;
    uint64_t v122 = (uint64_t)v340;
LABEL_79:
    if (++v122 == v331)
    {
      swift_bridgeObjectRelease();
      goto LABEL_162;
    }
  }
  swift_bridgeObjectRelease();
LABEL_105:
  swift_bridgeObjectRelease();
  sub_1C7B780B8(v41, v320, type metadata accessor for RecordMetadata);
  unint64_t v167 = v347;
  char v168 = swift_isUniquelyReferenced_nonNull_native();
  a1 = v339;
  if ((v168 & 1) == 0) {
    unint64_t v167 = sub_1C7B51E54(0, *(void *)(v167 + 16) + 1, 1, v167);
  }
  unint64_t v170 = *(void *)(v167 + 16);
  unint64_t v169 = *(void *)(v167 + 24);
  if (v170 >= v169 >> 1) {
    unint64_t v167 = sub_1C7B51E54(v169 > 1, v170 + 1, 1, v167);
  }
  *(void *)(v167 + 16) = v170 + 1;
  uint64_t v171 = *(void *)(v329 + 72);
  sub_1C7B78D9C(v320, v167 + ((*(unsigned __int8 *)(v329 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v329 + 80)) + v171 * v170, type metadata accessor for RecordMetadata);
  unint64_t v347 = v167;
  sub_1C7B780B8(v41, (uint64_t)v337, type metadata accessor for RecordMetadata);
  uint64_t v12 = *v330;
  sub_1C7B7B650();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v172 = v342;
  int64_t v14 = (void *)sub_1C7B7AFF0();
  uint64_t v173 = sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
  unint64_t v338 = v14;
  uint64_t v336 = (char *)v173;
  sub_1C7B7B1B0();
  uint64_t ObjectType = *(int *)(v172 + 24);
  sub_1C7B7B670();
  uint64_t v174 = sub_1C7B7B680();
  uint64_t v175 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v176 = v174 & ~v175;
  unint64_t v11 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((v176 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v176))
  {
    uint64_t v177 = ~v175;
    while (1)
    {
      sub_1C7B780B8(*(void *)(v12 + 48) + v176 * v171, a1, type metadata accessor for RecordMetadata);
      uint64_t v178 = *(void *)a1;
      uint64_t v179 = *(void *)(a1 + 8);
      uint64_t v180 = *(void *)(a1 + 16);
      int64_t v14 = *(void **)(a1 + 24);
      uint64_t v181 = v337[2];
      unint64_t v41 = v337[3];
      BOOL v182 = v178 == *v337 && v179 == v337[1];
      if (v182 || (sub_1C7B7B5E0() & 1) != 0)
      {
        BOOL v183 = v180 == v181 && v14 == (void *)v41;
        if (v183 || (sub_1C7B7B5E0())
          && (sub_1C7B7AFC0() & 1) != 0
          && *(unsigned __int8 *)(v339 + *(int *)(v342 + 24)) == *((unsigned __int8 *)v337 + ObjectType))
        {
          break;
        }
      }
      a1 = v339;
      sub_1C7B78120(v339, type metadata accessor for RecordMetadata);
      unint64_t v176 = (v176 + 1) & v177;
      if (((*(void *)(v11 + ((v176 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v176) & 1) == 0) {
        goto LABEL_125;
      }
    }
    sub_1C7B78120(v339, type metadata accessor for RecordMetadata);
LABEL_149:
    swift_bridgeObjectRelease();
    sub_1C7B78120((uint64_t)v337, type metadata accessor for RecordMetadata);
    sub_1C7B78120(v333, type metadata accessor for RecordMetadata);
    int64_t v14 = v328;
    goto LABEL_150;
  }
LABEL_125:
  swift_bridgeObjectRelease();
  unint64_t v184 = v330;
  unint64_t v47 = swift_isUniquelyReferenced_nonNull_native();
  sub_1C7B780B8((uint64_t)v337, (uint64_t)v332, type metadata accessor for RecordMetadata);
  uint64_t v346 = (void *)*v184;
  uint64_t v185 = (uint64_t)v346;
  *unint64_t v184 = 0x8000000000000000;
  if (*(void *)(v185 + 24) > *(void *)(v185 + 16))
  {
    if ((v47 & 1) == 0)
    {
      unint64_t v47 = (unint64_t)&v346;
      sub_1C7B72B64();
    }
    goto LABEL_147;
  }
  if (v47) {
    sub_1C7B73DD0();
  }
  else {
    sub_1C7B73380();
  }
  a1 = (uint64_t)v346;
  sub_1C7B7B650();
  unint64_t v11 = (unint64_t)v332;
  int64_t v14 = (void *)v332[2];
  uint64_t v12 = v332[3];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C7B7B210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v186 = v342;
  sub_1C7B7B1B0();
  uint64_t ObjectType = *(int *)(v186 + 24);
  unint64_t v47 = (unint64_t)v348;
  sub_1C7B7B670();
  uint64_t v187 = sub_1C7B7B680();
  uint64_t v188 = -1 << *(unsigned char *)(a1 + 32);
  unint64_t v176 = v187 & ~v188;
  unint64_t v41 = a1 + 56;
  if (((*(void *)(a1 + 56 + ((v176 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v176) & 1) == 0)
  {
LABEL_147:
    unint64_t v33 = v346;
    *(void *)((char *)v346 + ((v176 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v176;
    sub_1C7B78D9C((uint64_t)v332, v33[6] + v176 * v171, type metadata accessor for RecordMetadata);
    uint64_t v195 = v33[2];
    BOOL v92 = __OFADD__(v195, 1);
    uint64_t v196 = v195 + 1;
    if (v92) {
      goto LABEL_225;
    }
    v33[2] = v196;
    *unint64_t v330 = (uint64_t)v33;
    goto LABEL_149;
  }
  uint64_t v12 = ~v188;
  unint64_t v47 = v334;
  while (1)
  {
    sub_1C7B780B8(*(void *)(a1 + 48) + v176 * v171, v47, type metadata accessor for RecordMetadata);
    uint64_t v189 = *(void *)v47;
    uint64_t v190 = *(void *)(v47 + 8);
    uint64_t v191 = *(void **)(v47 + 16);
    uint64_t v192 = *(void *)(v47 + 24);
    int64_t v14 = (void *)v332[2];
    unint64_t v11 = v332[3];
    BOOL v193 = v189 == *v332 && v190 == v332[1];
    if (v193 || (sub_1C7B7B5E0() & 1) != 0)
    {
      BOOL v194 = v191 == v14 && v192 == v11;
      if (v194 || (sub_1C7B7B5E0())
        && (sub_1C7B7AFC0() & 1) != 0
        && *(unsigned __int8 *)(v334 + *(int *)(v342 + 24)) == *((unsigned __int8 *)v332 + ObjectType))
      {
        break;
      }
    }
    unint64_t v47 = v334;
    sub_1C7B78120(v334, type metadata accessor for RecordMetadata);
    unint64_t v176 = (v176 + 1) & v12;
    if (((*(void *)(v41 + ((v176 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v176) & 1) == 0) {
      goto LABEL_147;
    }
  }
  uint64_t v297 = v334;
LABEL_230:
  sub_1C7B78120(v297, type metadata accessor for RecordMetadata);
  sub_1C7B7B5F0();
  __break(1u);
}

uint64_t sub_1C7B6D648(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v79 = type metadata accessor for RecordMetadata(0);
  uint64_t v68 = *(void *)(v79 - 8);
  MEMORY[0x1F4188790](v79);
  int64_t v5 = (uint64_t *)((char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for Record(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v67 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  unint64_t v71 = (char *)&v59 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (uint64_t *)((char *)&v59 - v12);
  uint64_t v14 = sub_1C7B7B160();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (uint64_t *)((char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = (void *)v2[15];
  *uint64_t v17 = v18;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E4FBCBF0], v14);
  id v19 = v18;
  LOBYTE(v18) = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  if (v18)
  {
    uint64_t v74 = *(void *)(a1 + 16);
    if (v74)
    {
      unint64_t v72 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v73 = a1 + v72;
      uint64_t v21 = *(void *)(v7 + 72);
      unint64_t v66 = &v82[1];
      uint64_t v61 = a1;
      swift_bridgeObjectRetain();
      uint64_t v22 = 0;
      unint64_t v23 = MEMORY[0x1E4FBC860];
      *(void *)&long long v24 = 136380931;
      long long v63 = v24;
      unint64_t v60 = (unint64_t)"Validating sync engine";
      uint64_t v62 = MEMORY[0x1E4FBC840] + 8;
      uint64_t v25 = (uint64_t)v71;
      uint64_t v70 = v2;
      uint64_t v69 = v21;
      unint64_t v80 = v13;
      while (1)
      {
        sub_1C7B780B8(v73 + v21 * v22, (uint64_t)v13, type metadata accessor for Record);
        uint64_t v26 = v2[23];
        if (*(void *)(v26 + 16))
        {
          uint64_t v75 = v22;
          unint64_t v76 = v23;
          sub_1C7B7B650();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          sub_1C7B7B210();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1C7B7B210();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          uint64_t v27 = v79;
          uint64_t v28 = (char *)v13 + *(int *)(v79 + 20);
          sub_1C7B7AFF0();
          sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
          unint64_t v78 = v28;
          sub_1C7B7B1B0();
          uint64_t v77 = *(int *)(v27 + 24);
          sub_1C7B7B670();
          uint64_t v29 = sub_1C7B7B680();
          uint64_t v30 = -1 << *(unsigned char *)(v26 + 32);
          unint64_t v31 = v29 & ~v30;
          uint64_t v32 = v26 + 56;
          if ((*(void *)(v26 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31))
          {
            uint64_t v33 = ~v30;
            uint64_t v34 = *(void *)(v68 + 72);
            while (1)
            {
              uint64_t v35 = v26;
              sub_1C7B780B8(*(void *)(v26 + 48) + v34 * v31, (uint64_t)v5, type metadata accessor for RecordMetadata);
              uint64_t v36 = v5[2];
              uint64_t v37 = v5[3];
              uint64_t v38 = v80[2];
              uint64_t v39 = v80[3];
              BOOL v40 = *v5 == *v80 && v5[1] == v80[1];
              if (v40 || (sub_1C7B7B5E0() & 1) != 0)
              {
                BOOL v41 = v36 == v38 && v37 == v39;
                if (v41 || (sub_1C7B7B5E0())
                  && (sub_1C7B7AFC0() & 1) != 0
                  && *((unsigned __int8 *)v5 + *(int *)(v79 + 24)) == *((unsigned __int8 *)v80 + v77))
                {
                  break;
                }
              }
              sub_1C7B78120((uint64_t)v5, type metadata accessor for RecordMetadata);
              unint64_t v31 = (v31 + 1) & v33;
              uint64_t v26 = v35;
              if (((*(void *)(v32 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0) {
                goto LABEL_25;
              }
            }
            sub_1C7B78120((uint64_t)v5, type metadata accessor for RecordMetadata);
            swift_bridgeObjectRelease();
            if (qword_1EBC5E820 != -1) {
              swift_once();
            }
            uint64_t v42 = sub_1C7B7B090();
            __swift_project_value_buffer(v42, (uint64_t)qword_1EBC5DC50);
            uint64_t v13 = v80;
            uint64_t v43 = v67;
            sub_1C7B780B8((uint64_t)v80, v67, type metadata accessor for Record);
            uint64_t v2 = v70;
            swift_retain_n();
            os_log_type_t v44 = sub_1C7B7B080();
            int v45 = sub_1C7B7B2D0();
            if (os_log_type_enabled(v44, (os_log_type_t)v45))
            {
              uint64_t v46 = swift_slowAlloc();
              uint64_t v47 = swift_slowAlloc();
              uint64_t v81 = v47;
              *(_DWORD *)uint64_t v46 = v63;
              unint64_t v48 = v2[26];
              LODWORD(v78) = v45;
              uint64_t v77 = v47;
              if (v48)
              {
                unint64_t v49 = v2[25];
                unint64_t v50 = v48;
              }
              else
              {
                uint64_t v54 = IDSCopyLocalDeviceUniqueID();
                if (v54)
                {
                  uint64_t v55 = (void *)v54;
                  unint64_t v49 = sub_1C7B7B1D0();
                  unint64_t v50 = v56;
                }
                else
                {
                  unint64_t v50 = v60 | 0x8000000000000000;
                  unint64_t v49 = 0xD000000000000017;
                }
              }
              swift_bridgeObjectRetain();
              v82[0] = sub_1C7B47DE8(v49, v50, &v81);
              sub_1C7B7B3A0();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v46 + 12) = 2082;
              uint64_t v65 = v46 + 14;
              uint64_t v57 = v67;
              uint64_t v64 = *(void *)(v67 + 16);
              v82[0] = 0;
              v82[1] = 0xE000000000000000;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_1C7B7B450();
              swift_bridgeObjectRelease();
              strcpy((char *)v82, "identifier: ");
              BYTE5(v82[1]) = 0;
              HIWORD(v82[1]) = -5120;
              swift_bridgeObjectRetain();
              sub_1C7B7B220();
              swift_bridgeObjectRelease();
              sub_1C7B7B220();
              swift_bridgeObjectRetain();
              sub_1C7B7B220();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              v82[0] = sub_1C7B47DE8(v82[0], v82[1], &v81);
              sub_1C7B7B3A0();
              swift_bridgeObjectRelease();
              sub_1C7B78120(v57, type metadata accessor for Record);
              _os_log_impl(&dword_1C7B37000, v44, (os_log_type_t)v78, "(%{private}s) Metadata for record %{public}s is already syncing", (uint8_t *)v46, 0x16u);
              uint64_t v58 = v77;
              swift_arrayDestroy();
              MEMORY[0x1C87BC480](v58, -1, -1);
              MEMORY[0x1C87BC480](v46, -1, -1);

              uint64_t v53 = (uint64_t)v13;
            }
            else
            {

              sub_1C7B78120(v43, type metadata accessor for Record);
              swift_release_n();
              uint64_t v53 = (uint64_t)v13;
            }
            sub_1C7B78120(v53, type metadata accessor for Record);
            uint64_t v25 = (uint64_t)v71;
            uint64_t v21 = v69;
            uint64_t v22 = v75;
            unint64_t v23 = v76;
            goto LABEL_31;
          }
LABEL_25:
          swift_bridgeObjectRelease();
          uint64_t v2 = v70;
          uint64_t v25 = (uint64_t)v71;
          uint64_t v21 = v69;
          uint64_t v22 = v75;
          unint64_t v23 = v76;
          uint64_t v13 = v80;
        }
        sub_1C7B780B8((uint64_t)v13, v25, type metadata accessor for Record);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v23 = sub_1C7B51E30(0, *(void *)(v23 + 16) + 1, 1, v23);
        }
        unint64_t v52 = *(void *)(v23 + 16);
        unint64_t v51 = *(void *)(v23 + 24);
        if (v52 >= v51 >> 1) {
          unint64_t v23 = sub_1C7B51E30(v51 > 1, v52 + 1, 1, v23);
        }
        *(void *)(v23 + 16) = v52 + 1;
        sub_1C7B78D9C(v25, v23 + v72 + v52 * v21, type metadata accessor for Record);
        sub_1C7B78120((uint64_t)v13, type metadata accessor for Record);
LABEL_31:
        if (++v22 == v74)
        {
          swift_bridgeObjectRelease();
          return v23;
        }
      }
    }
    return MEMORY[0x1E4FBC860];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C7B6E01C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  char v7 = *a1;
  uint64_t v8 = *(void *)a2;
  uint64_t v9 = *(void *)(a2 + 8);
  char v10 = *(unsigned char *)(a2 + 16);
  sub_1C7B7AF30();
  swift_allocObject();
  sub_1C7B7AF20();
  v33[0] = v8;
  v33[1] = v9;
  char v34 = v10;
  sub_1C7B78D48();
  uint64_t v11 = sub_1C7B7AF10();
  if (v4)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1C7B7B090();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EBC5DC50);
    swift_retain();
    id v14 = v4;
    swift_retain();
    id v15 = v4;
    uint64_t v16 = sub_1C7B7B080();
    os_log_type_t v17 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v33[0] = v19;
      *(_DWORD *)uint64_t v18 = 136380931;
      os_log_type_t v32 = v17;
      uint64_t v31 = v19;
      if (*(void *)(v5 + 208))
      {
        unint64_t v20 = *(void *)(v5 + 200);
        unint64_t v21 = *(void *)(v5 + 208);
      }
      else
      {
        uint64_t v25 = IDSCopyLocalDeviceUniqueID();
        if (v25)
        {
          uint64_t v26 = (void *)v25;
          unint64_t v20 = sub_1C7B7B1D0();
          unint64_t v21 = v27;
        }
        else
        {
          unint64_t v21 = 0x80000001C7B80E00;
          unint64_t v20 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_1C7B47DE8(v20, v21, v33);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2082;
      uint64_t v35 = (uint64_t)v4;
      id v28 = v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9470);
      uint64_t v29 = sub_1C7B7B1F0();
      uint64_t v35 = sub_1C7B47DE8(v29, v30, v33);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C7B37000, v16, v32, "(%{private}s) Failed to encode message: %{public}s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v31, -1, -1);
      MEMORY[0x1C87BC480](v18, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    swift_willThrow();
    return swift_release();
  }
  else
  {
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    uint64_t result = swift_release();
    *(unsigned char *)a3 = v7;
    *(void *)(a3 + 8) = 0x69676E45636E7953;
    *(void *)(a3 + 16) = 0xEA0000000000656ELL;
    *(void *)(a3 + 24) = v22;
    *(void *)(a3 + 32) = v23;
  }
  return result;
}

uint64_t sub_1C7B6E364(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a7 + 16;
  id v14 = *(NSObject **)(a4 + 120);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  *(void *)(v15 + 32) = a6;
  *(void *)(v15 + 40) = a1;
  *(void *)(v15 + 48) = a2;
  a3 &= 1u;
  *(unsigned char *)(v15 + 56) = a3;
  *(void *)(v15 + 64) = v13;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1C7B78224;
  *(void *)(v16 + 24) = v15;
  v19[4] = sub_1C7B79034;
  void v19[5] = v16;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1107296256;
  void v19[2] = sub_1C7B51770;
  v19[3] = &block_descriptor_267;
  os_log_type_t v17 = _Block_copy(v19);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C7B7824C(a1, a2, a3);
  swift_retain();
  swift_release();
  dispatch_sync(v14, v17);
  _Block_release(v17);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v14) {
    __break(1u);
  }
  return result;
}

void sub_1C7B6E50C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6, uint64_t *a7)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C7B48C08(a2, a3);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_1C7B7AFF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C7B42710((uint64_t)v16, a2, a3);
  swift_endAccess();
  if (a6)
  {
    id v18 = a4;
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1C7B7B090();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EBC5DC50);
    sub_1C7B7824C(a4, a5, 1);
    swift_retain();
    sub_1C7B7824C(a4, a5, 1);
    swift_retain();
    unint64_t v20 = sub_1C7B7B080();
    os_log_type_t v21 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v41[0] = v23;
      *(_DWORD *)uint64_t v22 = 136380931;
      unint64_t v24 = a1[26];
      uint64_t v38 = v23;
      uint64_t v39 = a7;
      if (v24)
      {
        unint64_t v25 = a1[25];
        unint64_t v26 = v24;
      }
      else
      {
        uint64_t v27 = IDSCopyLocalDeviceUniqueID();
        if (v27)
        {
          id v28 = (void *)v27;
          unint64_t v25 = sub_1C7B7B1D0();
          unint64_t v26 = v29;
        }
        else
        {
          unint64_t v26 = 0x80000001C7B80E00;
          unint64_t v25 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_1C7B47DE8(v25, v26, v41);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v40 = (uint64_t)a4;
      id v30 = a4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9470);
      uint64_t v31 = sub_1C7B7B1F0();
      uint64_t v40 = sub_1C7B47DE8(v31, v32, v41);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();
      sub_1C7B53CAC(a4, a5, 1);
      sub_1C7B53CAC(a4, a5, 1);
      _os_log_impl(&dword_1C7B37000, v20, v21, "(%{private}s) Error sending record modifications: %s", (uint8_t *)v22, 0x16u);
      uint64_t v33 = v38;
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v33, -1, -1);
      MEMORY[0x1C87BC480](v22, -1, -1);

      a7 = v39;
    }
    else
    {
      swift_release_n();
      sub_1C7B53CAC(a4, a5, 1);
      sub_1C7B53CAC(a4, a5, 1);
    }
    uint64_t v34 = a1[23];
    swift_beginAccess();
    uint64_t v35 = *a7;
    if (*(void *)(v35 + 16) <= *(void *)(v34 + 16) >> 3)
    {
      uint64_t v40 = v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C7B74F3C(v35);
      swift_bridgeObjectRelease();
      uint64_t v37 = v40;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v36 = swift_bridgeObjectRetain();
      uint64_t v37 = sub_1C7B755C4(v36, v34);
      swift_bridgeObjectRelease();
    }
    a1[23] = v37;
    swift_bridgeObjectRelease();
    sub_1C7B6E9A0();
    sub_1C7B53CAC(a4, a5, 1);
  }
}

void sub_1C7B6E9A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C7B7B160();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (void *)v1[15];
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCBF0], v2);
  id v7 = v6;
  char v8 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v9 = v1[13];
  uint64_t v10 = v1[14];
  __swift_project_boxed_opaque_existential_1(v1 + 10, v9);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1C7B7B090();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v15 = sub_1C7B7B080();
    os_log_type_t v16 = sub_1C7B7B2C0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v34 = v18;
      *(_DWORD *)uint64_t v17 = 136380675;
      if (v1[26])
      {
        unint64_t v19 = v1[25];
        unint64_t v20 = v1[26];
      }
      else
      {
        uint64_t v25 = IDSCopyLocalDeviceUniqueID();
        if (v25)
        {
          unint64_t v26 = (void *)v25;
          unint64_t v19 = sub_1C7B7B1D0();
          unint64_t v20 = v27;
        }
        else
        {
          unint64_t v19 = 0xD000000000000017;
          unint64_t v20 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_1C7B47DE8(v19, v20, &v34);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v31 = v16;
      unint64_t v32 = "(%{private}s) Will not set retry timer because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  uint64_t v2 = v1[31];
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_27;
  }
LABEL_4:
  if ((qword_1EBC5DCD0 & ~v2) == 0)
  {
    uint64_t v11 = v1[17];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = *(void (**)(id, uint64_t (*)(char), void *, uint64_t, uint64_t))(v11 + 8);
    swift_retain();
    v13(v7, sub_1C7B7825C, v1, ObjectType, v11);
    swift_release();
    return;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C7B7B090();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v15 = sub_1C7B7B080();
  os_log_type_t v22 = sub_1C7B7B2C0();
  if (!os_log_type_enabled(v15, v22)) {
    goto LABEL_16;
  }
  uint64_t v17 = (uint8_t *)swift_slowAlloc();
  uint64_t v18 = swift_slowAlloc();
  uint64_t v34 = v18;
  *(_DWORD *)uint64_t v17 = 136380675;
  if (v1[26])
  {
    unint64_t v23 = v1[25];
    unint64_t v24 = v1[26];
  }
  else
  {
    uint64_t v28 = IDSCopyLocalDeviceUniqueID();
    if (v28)
    {
      unint64_t v29 = (void *)v28;
      unint64_t v23 = sub_1C7B7B1D0();
      unint64_t v24 = v30;
    }
    else
    {
      unint64_t v23 = 0xD000000000000017;
      unint64_t v24 = 0x80000001C7B80E00;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_1C7B47DE8(v23, v24, &v34);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  os_log_type_t v31 = v22;
  unint64_t v32 = "(%{private}s) Will not set retry timer because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C7B37000, v15, v31, v32, v17, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v18, -1, -1);
  MEMORY[0x1C87BC480](v17, -1, -1);
}

uint64_t sub_1C7B6EE9C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC08);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v107 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9740);
  uint64_t v6 = MEMORY[0x1F4188790](v121);
  BOOL v120 = (uint64_t *)((char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v119 = (uint64_t *)((char *)&v106 - v9);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v118 = (uint64_t **)((char *)&v106 - v11);
  MEMORY[0x1F4188790](v10);
  uint64_t v117 = (char *)&v106 - v12;
  uint64_t v13 = (void *)sub_1C7B7AFF0();
  uint64_t v123 = *(v13 - 1);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (uint64_t **)((char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_1C7B7B160();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  unint64_t v19 = (uint64_t **)((char *)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = *(void **)(v2 + 120);
  *unint64_t v19 = v20;
  (*(void (**)(void *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E4FBCBF0], v16);
  id v21 = v20;
  LOBYTE(v20) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v17 + 8))(v19, v16);
  if ((v20 & 1) == 0) {
    goto LABEL_67;
  }
  if (qword_1EBC5E820 != -1) {
LABEL_68:
  }
    swift_once();
  uint64_t v22 = sub_1C7B7B090();
  __swift_project_value_buffer(v22, (uint64_t)qword_1EBC5DC50);
  uint64_t v23 = v123;
  unint64_t v24 = *(void **)(v123 + 16);
  uint64_t v116 = v123 + 16;
  uint64_t v115 = v24;
  ((void (*)(uint64_t **, uint64_t *, void *))v24)(v15, a1, v13);
  swift_retain_n();
  uint64_t v25 = sub_1C7B7B080();
  uint64_t v26 = v2;
  os_log_type_t v27 = sub_1C7B7B2D0();
  BOOL v28 = os_log_type_enabled(v25, v27);
  uint64_t v108 = v2;
  v124 = v13;
  if (v28)
  {
    uint64_t v127 = (uint64_t)a1;
    uint64_t v2 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v131[0] = v29;
    *(_DWORD *)uint64_t v2 = 136380931;
    unint64_t v30 = *(void *)(v26 + 208);
    uint64_t v126 = v29;
    if (v30)
    {
      unint64_t v31 = *(void *)(v26 + 200);
      unint64_t v32 = v30;
    }
    else
    {
      uint64_t v34 = IDSCopyLocalDeviceUniqueID();
      if (v34)
      {
        uint64_t v35 = (void *)v34;
        unint64_t v31 = sub_1C7B7B1D0();
        unint64_t v32 = v36;
      }
      else
      {
        unint64_t v32 = 0x80000001C7B80E00;
        unint64_t v31 = 0xD000000000000017;
      }
      uint64_t v26 = v108;
    }
    swift_bridgeObjectRetain();
    uint64_t v130 = sub_1C7B47DE8(v31, v32, v131);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 12) = 2082;
    sub_1C7B78264((unint64_t *)&qword_1EBC5DC00, MEMORY[0x1E4F27928]);
    uint64_t v13 = v124;
    uint64_t v37 = sub_1C7B7B5D0();
    uint64_t v130 = sub_1C7B47DE8(v37, v38, v131);
    sub_1C7B7B3A0();
    swift_bridgeObjectRelease();
    uint64_t v114 = *(void (**)(uint64_t **, void *))(v123 + 8);
    v114(v15, v13);
    _os_log_impl(&dword_1C7B37000, v25, v27, "(%{private}s) Removing all inflight metadata before %{public}s", (uint8_t *)v2, 0x16u);
    uint64_t v39 = v126;
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v39, -1, -1);
    MEMORY[0x1C87BC480](v2, -1, -1);

    uint64_t v33 = v26;
    a1 = (uint64_t *)v127;
  }
  else
  {
    swift_release_n();
    uint64_t v114 = *(void (**)(uint64_t **, void *))(v23 + 8);
    v114(v15, v13);

    uint64_t v33 = v2;
  }
  BOOL v106 = (uint64_t *)(v33 + 176);
  uint64_t v40 = swift_beginAccess();
  MEMORY[0x1F4188790](v40);
  uint64_t v15 = &v106 - 4;
  *(&v106 - 2) = (uint64_t *)v33;
  *(&v106 - 1) = a1;
  uint64_t v41 = swift_bridgeObjectRetain();
  uint64_t v42 = sub_1C7B78BD0(v41, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1C7B782B4, (uint64_t)(&v106 - 4));
  swift_bridgeObjectRelease();
  int64_t v43 = *(void *)(v42 + 16);
  if (v43)
  {
    uint64_t v130 = MEMORY[0x1E4FBC860];
    sub_1C7B4C984(0, v43, 0);
    uint64_t v44 = sub_1C7B767B0(v42);
    uint64_t v46 = v123;
    if (v44 < 0 || v44 >= 1 << *(unsigned char *)(v42 + 32)) {
      goto LABEL_66;
    }
    uint64_t v47 = 0;
    uint64_t v48 = v42 + 64;
    uint64_t v112 = v123 + 8;
    uint64_t v122 = (uint64_t **)(v42 + 80);
    uint64_t v2 = 1;
    uint64_t v113 = v42;
    int64_t v109 = v43;
    uint64_t v110 = v45;
    uint64_t v111 = v42 + 64;
    while (1)
    {
      unint64_t v49 = (unint64_t)v44 >> 6;
      if ((*(void *)(v48 + 8 * ((unint64_t)v44 >> 6)) & (1 << v44)) == 0)
      {
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      if (*(_DWORD *)(v42 + 36) != v45) {
        goto LABEL_62;
      }
      uint64_t v125 = v47;
      uint64_t v126 = 1 << v44;
      uint64_t v50 = v121;
      unint64_t v51 = v117;
      unint64_t v52 = &v117[*(int *)(v121 + 48)];
      uint64_t v53 = *(void *)(v42 + 56);
      uint64_t v54 = (uint64_t *)(*(void *)(v42 + 48) + 16 * v44);
      uint64_t v56 = *v54;
      uint64_t v55 = v54[1];
      uint64_t v57 = *(void *)(v46 + 72);
      uint64_t v127 = v44;
      uint64_t v58 = v13;
      uint64_t v59 = v13;
      uint64_t v13 = v115;
      ((void (*)(char *, uint64_t, void *))v115)(v52, v53 + v57 * v44, v58);
      void *v51 = v56;
      v51[1] = v55;
      unint64_t v60 = v118;
      *uint64_t v118 = v56;
      v60[1] = v55;
      ((void (*)(char *, char *, void *))v13)((char *)v60 + *(int *)(v50 + 48), v52, v59);
      uint64_t v61 = (uint64_t)v60;
      uint64_t v62 = v119;
      sub_1C7B4E66C(v61, (uint64_t)v119, (uint64_t *)&unk_1EA4F9740);
      swift_bridgeObjectRetain_n();
      sub_1C7B4E5AC((uint64_t)v51, (uint64_t *)&unk_1EA4F9740);
      uint64_t v63 = *(int *)(v50 + 48);
      uint64_t v64 = v120;
      uint64_t v65 = (uint64_t **)((char *)v120 + v63);
      uint64_t v67 = (uint64_t *)*v62;
      unint64_t v66 = (uint64_t *)v62[1];
      uint64_t *v120 = *v62;
      v64[1] = (uint64_t)v66;
      ((void (*)(char *, char *, void *))v13)((char *)v64 + v63, (char *)v62 + v63, v59);
      swift_bridgeObjectRetain();
      v114(v65, v59);
      sub_1C7B4E5AC((uint64_t)v62, (uint64_t *)&unk_1EA4F9740);
      uint64_t v15 = (uint64_t **)v130;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C7B4C984(0, (int64_t)v15[2] + 1, 1);
        uint64_t v15 = (uint64_t **)v130;
      }
      uint64_t v2 = 1;
      unint64_t v69 = (unint64_t)v15[2];
      unint64_t v68 = (unint64_t)v15[3];
      a1 = (uint64_t *)(v69 + 1);
      if (v69 >= v68 >> 1)
      {
        sub_1C7B4C984(v68 > 1, v69 + 1, 1);
        uint64_t v15 = (uint64_t **)v130;
      }
      v15[2] = a1;
      uint64_t v70 = &v15[2 * v69];
      v70[4] = v67;
      v70[5] = v66;
      uint64_t v42 = v113;
      uint64_t v71 = 1 << *(unsigned char *)(v113 + 32);
      if (v127 >= v71) {
        goto LABEL_63;
      }
      uint64_t v48 = v111;
      uint64_t v72 = *(void *)(v111 + 8 * v49);
      if ((v72 & v126) == 0) {
        goto LABEL_64;
      }
      LODWORD(v45) = v110;
      if (*(_DWORD *)(v113 + 36) != v110) {
        goto LABEL_65;
      }
      unint64_t v73 = v72 & (-2 << (v127 & 0x3F));
      if (v73)
      {
        uint64_t v44 = __clz(__rbit64(v73)) | v127 & 0xFFFFFFFFFFFFFFC0;
        uint64_t v13 = v124;
        int64_t v74 = v109;
        goto LABEL_34;
      }
      unint64_t v75 = v49 + 1;
      unint64_t v76 = (unint64_t)(v71 + 63) >> 6;
      uint64_t v13 = v124;
      int64_t v74 = v109;
      if (v49 + 1 < v76)
      {
        unint64_t v77 = *(void *)(v111 + 8 * v75);
        if (v77)
        {
LABEL_32:
          uint64_t v44 = __clz(__rbit64(v77)) + (v75 << 6);
          goto LABEL_34;
        }
        while (v76 - 2 != v49)
        {
          unint64_t v77 = (unint64_t)v122[v49++];
          if (v77)
          {
            unint64_t v75 = v49 + 1;
            goto LABEL_32;
          }
        }
      }
      uint64_t v44 = 1 << *(unsigned char *)(v113 + 32);
LABEL_34:
      uint64_t v47 = v125 + 1;
      uint64_t v46 = v123;
      if (v125 + 1 == v74)
      {
        swift_release();
        uint64_t v33 = v108;
        goto LABEL_40;
      }
      if (v44 < 0 || v44 >= v71) {
        goto LABEL_66;
      }
    }
  }
  swift_release();
  uint64_t v15 = (uint64_t **)MEMORY[0x1E4FBC860];
LABEL_40:
  uint64_t v122 = v15;
  unint64_t v78 = v15[2];
  if (v78)
  {
    uint64_t v79 = (uint64_t *)(v33 + 168);
    swift_beginAccess();
    uint64_t v125 = v123 + 32;
    uint64_t v126 = v123 + 56;
    unint64_t v80 = (uint64_t *)(v122 + 5);
    uint64_t v81 = v108;
    do
    {
      uint64_t v82 = *v79;
      if (*(void *)(*v79 + 16))
      {
        uint64_t v84 = *(v80 - 1);
        uint64_t v83 = *v80;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v85 = sub_1C7B49014(v84, v83);
        if (v86)
        {
          uint64_t v87 = *(void *)(*(void *)(v82 + 56) + 8 * v85);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v88 = sub_1C7B49014(v84, v83);
          char v90 = v89;
          swift_bridgeObjectRelease();
          uint64_t v127 = v87;
          if (v90)
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v92 = *v79;
            uint64_t v128 = *v79;
            *uint64_t v79 = 0x8000000000000000;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_1C7B4C26C();
              uint64_t v92 = v128;
            }
            swift_bridgeObjectRelease();
            sub_1C7B4AA78(v88, v92);
            *uint64_t v79 = v92;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          swift_endAccess();
          uint64_t v93 = v106;
          swift_beginAccess();
          swift_bridgeObjectRetain();
          unint64_t v94 = sub_1C7B49014(v84, v83);
          char v96 = v95;
          swift_bridgeObjectRelease();
          if (v96)
          {
            int v97 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v98 = *v93;
            uint64_t v128 = *v93;
            *uint64_t v93 = 0x8000000000000000;
            if (!v97)
            {
              sub_1C7B4BFA8();
              uint64_t v98 = v128;
            }
            swift_bridgeObjectRelease();
            uint64_t v99 = v124;
            uint64_t v100 = (uint64_t)v107;
            (*(void (**)(char *, unint64_t, void *))(v123 + 32))(v107, *(void *)(v98 + 56) + *(void *)(v123 + 72) * v94, v124);
            sub_1C7B4A868(v94, v98);
            *uint64_t v93 = v98;
            swift_bridgeObjectRelease();
            uint64_t v101 = 0;
          }
          else
          {
            uint64_t v101 = 1;
            uint64_t v100 = (uint64_t)v107;
            uint64_t v99 = v124;
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t, void *))v126)(v100, v101, 1, v99);
          swift_bridgeObjectRelease();
          sub_1C7B4E5AC(v100, &qword_1EBC5DC08);
          swift_endAccess();
          uint64_t v102 = *(void *)(v81 + 184);
          uint64_t v103 = v127;
          if (*(void *)(v127 + 16) <= *(void *)(v102 + 16) >> 3)
          {
            uint64_t v129 = *(void *)(v81 + 184);
            swift_bridgeObjectRetain();
            sub_1C7B74F3C(v103);
            swift_bridgeObjectRelease();
            uint64_t v104 = v129;
          }
          else
          {
            swift_bridgeObjectRetain();
            uint64_t v104 = sub_1C7B755C4(v103, v102);
            swift_bridgeObjectRelease();
          }
          *(void *)(v81 + 184) = v104;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      v80 += 2;
      unint64_t v78 = (uint64_t *)((char *)v78 - 1);
    }
    while (v78);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C7B6FB28()
{
  uint64_t v0 = sub_1C7B7AFF0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C7B7AF70();
  char v4 = sub_1C7B7AF90();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_1C7B6FC1C@<X0>(uint64_t a1@<X8>)
{
  v49[1] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9758);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v49 - v6;
  uint64_t v8 = sub_1C7B7AFF0();
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v57 = (char *)v49 - v12;
  uint64_t v13 = sub_1C7B7B160();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (void *)((char *)v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void **)(v1 + 120);
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E4FBCBF0], v13);
  id v18 = v17;
  char v19 = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if ((v19 & 1) == 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_1C7B7AF60();
  swift_beginAccess();
  uint64_t v21 = *(void *)(v1 + 176);
  uint64_t v22 = *(void *)(v21 + 64);
  uint64_t v50 = v21 + 64;
  uint64_t v23 = 1 << *(unsigned char *)(v21 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & v22;
  uint64_t v26 = v56;
  uint64_t v53 = v56 + 16;
  os_log_type_t v27 = (uint64_t (**)(char *, char *, uint64_t))(v56 + 32);
  BOOL v28 = (uint64_t (**)(char *, uint64_t))(v56 + 8);
  int64_t v51 = (unint64_t)(v23 + 63) >> 6;
  v49[0] = v51 - 1;
  uint64_t v55 = v21;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v58 = 0;
  uint64_t v54 = v1;
  unint64_t v52 = v28;
  if (!v25) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v29 = __clz(__rbit64(v25));
  v25 &= v25 - 1;
  unint64_t v30 = v29 | (v58 << 6);
  while (2)
  {
    uint64_t v31 = *(void *)(v55 + 56);
    unint64_t v32 = (void *)(*(void *)(v55 + 48) + 16 * v30);
    uint64_t v33 = v32[1];
    *(void *)uint64_t v5 = *v32;
    *((void *)v5 + 1) = v33;
    uint64_t v34 = v31 + *(void *)(v26 + 72) * v30;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9740);
    uint64_t v36 = v26;
    uint64_t v37 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(&v5[*(int *)(v35 + 48)], v34, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v5, 0, 1, v37);
    swift_bridgeObjectRetain();
    BOOL v28 = v52;
    while (1)
    {
      sub_1C7B4E66C((uint64_t)v5, (uint64_t)v7, &qword_1EA4F9758);
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9740);
      int v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48))(v7, 1, v42);
      uint64_t v44 = v57;
      if (v43 == 1)
      {
        swift_release();
        sub_1C7B7AF70();
        return (*v28)(v44, v8);
      }
      swift_bridgeObjectRelease();
      uint64_t v45 = &v7[*(int *)(v42 + 48)];
      uint64_t v46 = *v27;
      (*v27)(v11, v45, v8);
      char v47 = sub_1C7B7AF90();
      uint64_t v48 = *v28;
      if (v47)
      {
        v48(v44, v8);
        uint64_t result = v46(v44, v11, v8);
        uint64_t v26 = v56;
        if (v25) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t result = v48(v11, v8);
        uint64_t v26 = v56;
        if (v25) {
          goto LABEL_7;
        }
      }
LABEL_9:
      int64_t v38 = v58 + 1;
      if (__OFADD__(v58, 1))
      {
        __break(1u);
        goto LABEL_33;
      }
      if (v38 < v51)
      {
        unint64_t v39 = *(void *)(v50 + 8 * v38);
        if (v39) {
          goto LABEL_12;
        }
        int64_t v40 = v58 + 2;
        ++v58;
        if (v38 + 1 < v51)
        {
          unint64_t v39 = *(void *)(v50 + 8 * v40);
          if (v39) {
            goto LABEL_15;
          }
          int64_t v58 = v38 + 1;
          if (v38 + 2 < v51)
          {
            unint64_t v39 = *(void *)(v50 + 8 * (v38 + 2));
            if (v39)
            {
              v38 += 2;
              goto LABEL_12;
            }
            int64_t v40 = v38 + 3;
            int64_t v58 = v38 + 2;
            if (v38 + 3 < v51) {
              break;
            }
          }
        }
      }
LABEL_26:
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9740);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v5, 1, 1, v41);
      unint64_t v25 = 0;
    }
    unint64_t v39 = *(void *)(v50 + 8 * v40);
    if (v39)
    {
LABEL_15:
      int64_t v38 = v40;
LABEL_12:
      unint64_t v25 = (v39 - 1) & v39;
      unint64_t v30 = __clz(__rbit64(v39)) + (v38 << 6);
      int64_t v58 = v38;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v38 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      break;
    }
    if (v38 >= v51)
    {
      int64_t v58 = v49[0];
      goto LABEL_26;
    }
    unint64_t v39 = *(void *)(v50 + 8 * v38);
    ++v40;
    if (v39) {
      goto LABEL_12;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

void sub_1C7B701E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1C7B7B100();
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v87 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_1C7B7B130();
  uint64_t v86 = *(void *)(v88 - 8);
  MEMORY[0x1F4188790](v88);
  unint64_t v85 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C7B7B0F0();
  uint64_t v84 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v83 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v77 - v8;
  uint64_t v93 = sub_1C7B7B150();
  uint64_t v96 = *(void *)(v93 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v93);
  uint64_t v12 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  unint64_t v94 = (char *)&v77 - v13;
  uint64_t v14 = sub_1C7B7B340();
  uint64_t v92 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_1C7B7AFF0();
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  uint64_t v95 = (uint64_t)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C7B7B160();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (Class *)((char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  Class isa = v1[15].isa;
  *uint64_t v21 = isa;
  (*(void (**)(Class *, void, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E4FBCBF0], v18);
  uint64_t v91 = isa;
  LOBYTE(isa) = sub_1C7B7B180();
  (*(void (**)(Class *, uint64_t))(v19 + 8))(v21, v18);
  if ((isa & 1) == 0)
  {
    __break(1u);
LABEL_51:
    swift_once();
LABEL_13:
    uint64_t v34 = sub_1C7B7B090();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v35 = sub_1C7B7B080();
    os_log_type_t v36 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      aBlock[0] = v38;
      *(_DWORD *)uint64_t v37 = 136380675;
      if (v1[26].isa)
      {
        unint64_t v39 = (unint64_t)v1[25].isa;
        unint64_t v40 = (unint64_t)v1[26].isa;
      }
      else
      {
        uint64_t v49 = IDSCopyLocalDeviceUniqueID();
        if (v49)
        {
          uint64_t v50 = (void *)v49;
          unint64_t v39 = sub_1C7B7B1D0();
          unint64_t v40 = v51;
        }
        else
        {
          unint64_t v39 = 0xD000000000000017;
          unint64_t v40 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_1C7B47DE8(v39, v40, aBlock);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v61 = v36;
      uint64_t v62 = "(%{private}s) No inflight metadata; will not start expiration timer";
      goto LABEL_49;
    }
    goto LABEL_26;
  }
  if (!*((void *)v1[23].isa + 2))
  {
    if (qword_1EBC5E820 == -1) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
  uint64_t v23 = (uint64_t)v1[13].isa;
  Class v24 = v1[14].isa;
  __swift_project_boxed_opaque_existential_1(&v1[10].isa, v23);
  if (((*((uint64_t (**)(uint64_t, Class))v24 + 2))(v23, v24) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_1C7B7B090();
    __swift_project_value_buffer(v41, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v35 = sub_1C7B7B080();
    os_log_type_t v42 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v35, v42))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      aBlock[0] = v38;
      *(_DWORD *)uint64_t v37 = 136380675;
      if (v1[26].isa)
      {
        unint64_t v43 = (unint64_t)v1[25].isa;
        unint64_t v44 = (unint64_t)v1[26].isa;
      }
      else
      {
        uint64_t v52 = IDSCopyLocalDeviceUniqueID();
        if (v52)
        {
          uint64_t v53 = (void *)v52;
          unint64_t v43 = sub_1C7B7B1D0();
          unint64_t v44 = v54;
        }
        else
        {
          unint64_t v43 = 0xD000000000000017;
          unint64_t v44 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_1C7B47DE8(v43, v44, aBlock);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v61 = v42;
      uint64_t v62 = "(%{private}s) Will not set expiration timer because keybag is locked";
      goto LABEL_49;
    }
LABEL_26:

    swift_release_n();
    return;
  }
  Class v25 = v1[31].isa;
  if (qword_1EBC5DCD8 != -1) {
    swift_once();
  }
  if ((qword_1EBC5DCD0 & ~(unint64_t)v25) != 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_1C7B7B090();
    __swift_project_value_buffer(v45, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v35 = sub_1C7B7B080();
    os_log_type_t v46 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v35, v46))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      aBlock[0] = v38;
      *(_DWORD *)uint64_t v37 = 136380675;
      if (v1[26].isa)
      {
        unint64_t v47 = (unint64_t)v1[25].isa;
        unint64_t v48 = (unint64_t)v1[26].isa;
      }
      else
      {
        uint64_t v58 = IDSCopyLocalDeviceUniqueID();
        if (v58)
        {
          uint64_t v59 = (void *)v58;
          unint64_t v47 = sub_1C7B7B1D0();
          unint64_t v48 = v60;
        }
        else
        {
          unint64_t v47 = 0xD000000000000017;
          unint64_t v48 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_1C7B47DE8(v47, v48, aBlock);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v61 = v46;
      uint64_t v62 = "(%{private}s) Will not set expiration timer because sync is inactive";
LABEL_49:
      _os_log_impl(&dword_1C7B37000, v35, v61, v62, v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v38, -1, -1);
      MEMORY[0x1C87BC480](v37, -1, -1);

      return;
    }
    goto LABEL_26;
  }
  sub_1C7B6FC1C(v95);
  sub_1C7B7AFA0();
  double v27 = v26;
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1C7B7B090();
  __swift_project_value_buffer(v28, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  unint64_t v29 = sub_1C7B7B080();
  int v30 = sub_1C7B7B2D0();
  unint64_t v80 = v29;
  if (os_log_type_enabled(v29, (os_log_type_t)v30))
  {
    int v79 = v30;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    aBlock[0] = v78;
    *(_DWORD *)uint64_t v31 = 136380931;
    unint64_t v32 = (unint64_t)v1[26].isa;
    if (v32)
    {
      uint64_t v77 = (uint64_t)v1[25].isa;
      unint64_t v33 = v32;
    }
    else
    {
      uint64_t v55 = IDSCopyLocalDeviceUniqueID();
      if (v55)
      {
        uint64_t v56 = (void *)v55;
        uint64_t v77 = sub_1C7B7B1D0();
        unint64_t v33 = v57;
      }
      else
      {
        uint64_t v77 = 0xD000000000000017;
        unint64_t v33 = 0x80000001C7B80E00;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v98 = sub_1C7B47DE8(v77, v33, aBlock);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2048;
    uint64_t v98 = *(void *)&v27;
    sub_1C7B7B3A0();
    uint64_t v63 = v80;
    _os_log_impl(&dword_1C7B37000, v80, (os_log_type_t)v79, "(%{private}s) Expiration timer will fire in %fs", (uint8_t *)v31, 0x16u);
    uint64_t v64 = v78;
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v64, -1, -1);
    MEMORY[0x1C87BC480](v31, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  unint64_t v80 = v1;
  sub_1C7B537EC(0, (unint64_t *)&qword_1EA4F9718);
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1C7B78264((unint64_t *)&qword_1EA4F9720, MEMORY[0x1E4FBCC70]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9728);
  sub_1C7B58934((unint64_t *)&qword_1EA4F9730, &qword_1EA4F9728);
  sub_1C7B7B3D0();
  uint64_t v65 = sub_1C7B7B350();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v16, v14);
  sub_1C7B7B140();
  if ((~*(void *)&v27 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v66 = v96;
  uint64_t v67 = v94;
  if (v27 <= -9.22337204e18)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (v27 < 9.22337204e18)
  {
    *(void *)uint64_t v9 = (uint64_t)v27;
    LODWORD(v91) = *MEMORY[0x1E4FBCAE8];
    uint64_t v68 = v84;
    unint64_t v69 = *(void (**)(char *))(v84 + 104);
    v69(v9);
    MEMORY[0x1C87BB980](v12, v9);
    uint64_t v70 = *(void (**)(char *, uint64_t))(v68 + 8);
    v70(v9, v5);
    uint64_t v84 = *(void *)(v66 + 8);
    uint64_t v96 = v66 + 8;
    ((void (*)(char *, uint64_t))v84)(v12, v93);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v92 = ObjectType;
    *(void *)uint64_t v9 = 10;
    ((void (*)(char *, void, uint64_t))v69)(v9, v91, v5);
    uint64_t v72 = v83;
    ((void (*)(char *, void, uint64_t))v69)(v83, *MEMORY[0x1E4FBCAD0], v5);
    MEMORY[0x1C87BBBA0](v67, v72, v9, ObjectType);
    v70(v72, v5);
    v70(v9, v5);
    unint64_t v73 = v80;
    aBlock[4] = (uint64_t)sub_1C7B782AC;
    aBlock[5] = (uint64_t)v80;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C7B50CB8;
    aBlock[3] = (uint64_t)&block_descriptor_270;
    int64_t v74 = _Block_copy(aBlock);
    swift_retain();
    unint64_t v75 = v85;
    sub_1C7B7B110();
    unint64_t v76 = v87;
    sub_1C7B7156C();
    sub_1C7B7B360();
    _Block_release(v74);
    (*(void (**)(char *, uint64_t))(v89 + 8))(v76, v90);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v75, v88);
    swift_release();
    v73[19].Class isa = (Class)v65;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    if (v73[19].isa)
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1C7B7B380();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      ((void (*)(char *, uint64_t))v84)(v94, v93);
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v95, v82);
      return;
    }
    goto LABEL_55;
  }
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
}

uint64_t sub_1C7B7114C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FBCAD0];
  uint64_t v3 = sub_1C7B7B0F0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_1C7B711C0(void *a1)
{
  uint64_t v2 = sub_1C7B7AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1C7B7B160();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (uint64_t *)((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (void *)a1[15];
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCBF0], v6);
  id v11 = v10;
  LOBYTE(v10) = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    if (qword_1EBC5E820 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v12 = sub_1C7B7B090();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v13 = sub_1C7B7B080();
  os_log_type_t v14 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v29 = v16;
    *(_DWORD *)uint64_t v15 = 136380675;
    unint64_t v17 = a1[26];
    uint64_t v26 = v3;
    uint64_t v27 = v2;
    if (v17)
    {
      unint64_t v18 = a1[25];
      unint64_t v19 = v17;
    }
    else
    {
      uint64_t v20 = IDSCopyLocalDeviceUniqueID();
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        unint64_t v18 = sub_1C7B7B1D0();
        unint64_t v19 = v22;
      }
      else
      {
        unint64_t v19 = 0x80000001C7B80E00;
        unint64_t v18 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_1C7B47DE8(v18, v19, &v29);
    sub_1C7B7B3A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C7B37000, v13, v14, "(%{private}s) Expiration timer fired", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C87BC480](v16, -1, -1);
    MEMORY[0x1C87BC480](v15, -1, -1);

    uint64_t v3 = v26;
    uint64_t v2 = v27;
  }
  else
  {

    swift_release_n();
  }
  sub_1C7B69E2C();
  sub_1C7B7AFD0();
  sub_1C7B6EE9C(v5);
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  Class v24 = (void (*)(uint64_t))a1[36];
  if (v24)
  {
    uint64_t v25 = swift_retain();
    v24(v25);
    return sub_1C7B53CBC((uint64_t)v24);
  }
  return result;
}

uint64_t sub_1C7B7156C()
{
  return sub_1C7B7B3D0();
}

uint64_t sub_1C7B71648(char a1, uint64_t a2)
{
  uint64_t v4 = sub_1C7B7B160();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(a2 + 120);
  *uint64_t v7 = v8;
  unsigned int v9 = *MEMORY[0x1E4FBCBF0];
  uint64_t v10 = *MEMORY[0x1E4FBCBF0];
  uint64_t v29 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 104);
  v29(v7, v10, v4);
  id v11 = v8;
  LOBYTE(v8) = sub_1C7B7B180();
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t))(v5 + 8);
  uint64_t result = v12(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  unsigned int v28 = v9;
  char v14 = a1;
  uint64_t v15 = *(void (**)(uint64_t))(a2 + 304);
  if (v15)
  {
    uint64_t v16 = swift_retain();
    v15(v16);
    sub_1C7B53CBC((uint64_t)v15);
  }
  unint64_t v17 = *(void (**)(uint64_t))(a2 + 320);
  if (v17 && (v14 & 1) != 0)
  {
    uint64_t v18 = swift_retain();
    v17(v18);
    sub_1C7B53CBC((uint64_t)v17);
  }
  *uint64_t v7 = v11;
  v29(v7, v28, v4);
  id v19 = v11;
  char v20 = sub_1C7B7B180();
  uint64_t result = v12(v7, v4);
  if ((v20 & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v21 = *(void *)(a2 + 136);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(ObjectType, v21);
  uint64_t v23 = *(os_unfair_lock_s **)(*(void *)(a2 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v23);
  uint64_t v24 = *(void *)(a2 + 224);
  uint64_t v25 = *(void *)(a2 + 232);
  __int16 v26 = *(_WORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v23);
  uint64_t result = swift_release();
  if (v25)
  {
    char v30 = HIBYTE(v26) & 1;
    swift_bridgeObjectRetain();
    sub_1C7B60DCC(v24, v25, &v30);
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

void sub_1C7B718B0(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1C7B7B160();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)((char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 48);
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  char v10 = *((unsigned char *)a1 + 17);
  id v11 = (void *)v2[15];
  *uint64_t v7 = v11;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCBF0], v4);
  id v12 = v11;
  uint64_t v13 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v14 = v2[13];
  uint64_t v15 = v2[14];
  __swift_project_boxed_opaque_existential_1(v2 + 10, v14);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1C7B7B090();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    unint64_t v17 = sub_1C7B7B080();
    os_log_type_t v18 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v48 = v20;
      *(_DWORD *)id v19 = 136380675;
      if (v2[26])
      {
        unint64_t v21 = v2[25];
        unint64_t v22 = v2[26];
      }
      else
      {
        uint64_t v36 = IDSCopyLocalDeviceUniqueID();
        if (v36)
        {
          uint64_t v37 = (void *)v36;
          unint64_t v21 = sub_1C7B7B1D0();
          unint64_t v22 = v38;
        }
        else
        {
          unint64_t v21 = 0xD000000000000017;
          unint64_t v22 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      v45[0] = sub_1C7B47DE8(v21, v22, &v48);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v42 = v18;
      unint64_t v43 = "(%{private}s) Will not send unlock message because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  uint64_t v13 = v2[31];
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_27;
  }
LABEL_4:
  if ((qword_1EBC5DCD0 & ~v13) == 0)
  {
    char v47 = v10;
    v45[0] = 0;
    v45[1] = 0;
    char v46 = 3;
    sub_1C7B6E01C(&v47, (uint64_t)v45, (uint64_t)&v48);
    char v27 = v48;
    uint64_t v29 = v49;
    uint64_t v28 = v50;
    uint64_t v30 = v51;
    unint64_t v31 = v52;
    uint64_t v32 = v2[4];
    uint64_t ObjectType = swift_getObjectType();
    LOBYTE(v48) = v27;
    uint64_t v49 = v29;
    uint64_t v50 = v28;
    uint64_t v51 = v30;
    unint64_t v52 = v31;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9490);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C7B7D800;
    *(void *)(inited + 32) = v9;
    *(void *)(inited + 40) = v8;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_1C7B5284C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t v35 = *(void (**)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), void *, uint64_t, uint64_t))(v32 + 24);
    swift_retain();
    v35(&v48, v34, sub_1C7B78FCC, v2, ObjectType, v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C7B3AF20(v30, v31);
    return;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_1C7B7B090();
  __swift_project_value_buffer(v23, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  unint64_t v17 = sub_1C7B7B080();
  os_log_type_t v24 = sub_1C7B7B2D0();
  if (!os_log_type_enabled(v17, v24)) {
    goto LABEL_16;
  }
  id v19 = (uint8_t *)swift_slowAlloc();
  uint64_t v20 = swift_slowAlloc();
  uint64_t v48 = v20;
  *(_DWORD *)id v19 = 136380675;
  if (v2[26])
  {
    unint64_t v25 = v2[25];
    unint64_t v26 = v2[26];
  }
  else
  {
    uint64_t v39 = IDSCopyLocalDeviceUniqueID();
    if (v39)
    {
      unint64_t v40 = (void *)v39;
      unint64_t v25 = sub_1C7B7B1D0();
      unint64_t v26 = v41;
    }
    else
    {
      unint64_t v25 = 0xD000000000000017;
      unint64_t v26 = 0x80000001C7B80E00;
    }
  }
  swift_bridgeObjectRetain();
  v45[0] = sub_1C7B47DE8(v25, v26, &v48);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  os_log_type_t v42 = v24;
  unint64_t v43 = "(%{private}s) Will not send unlock message because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C7B37000, v17, v42, v43, v19, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v20, -1, -1);
  MEMORY[0x1C87BC480](v19, -1, -1);
}

void sub_1C7B71FD4(void *a1, uint64_t a2, char a3, uint64_t a4, const char *a5, const char *a6)
{
  if (a3)
  {
    id v18 = a1;
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1C7B7B090();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EBC5DC50);
    sub_1C7B7824C(a1, a2, 1);
    swift_retain();
    sub_1C7B7824C(a1, a2, 1);
    swift_retain();
    oslog = sub_1C7B7B080();
    os_log_type_t v20 = sub_1C7B7B2C0();
    if (os_log_type_enabled(oslog, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v36 = v22;
      *(_DWORD *)uint64_t v21 = 136380931;
      uint64_t v34 = a5;
      if (*(void *)(a4 + 208))
      {
        unint64_t v23 = *(void *)(a4 + 200);
        unint64_t v24 = *(void *)(a4 + 208);
      }
      else
      {
        uint64_t v28 = IDSCopyLocalDeviceUniqueID();
        if (v28)
        {
          uint64_t v29 = (void *)v28;
          unint64_t v23 = sub_1C7B7B1D0();
          unint64_t v24 = v30;
        }
        else
        {
          unint64_t v23 = 0xD000000000000017;
          unint64_t v24 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      sub_1C7B47DE8(v23, v24, &v36);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      id v31 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9470);
      uint64_t v32 = sub_1C7B7B1F0();
      sub_1C7B47DE8(v32, v33, &v36);
      sub_1C7B7B3A0();
      swift_bridgeObjectRelease();
      sub_1C7B53CAC(a1, a2, 1);
      sub_1C7B53CAC(a1, a2, 1);
      _os_log_impl(&dword_1C7B37000, oslog, v20, v34, (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v22, -1, -1);
      MEMORY[0x1C87BC480](v21, -1, -1);

      sub_1C7B53CAC(a1, a2, 1);
    }
    else
    {
      sub_1C7B53CAC(a1, a2, 1);
      swift_release_n();
      sub_1C7B53CAC(a1, a2, 1);
      sub_1C7B53CAC(a1, a2, 1);
    }
  }
  else
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1C7B7B090();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v9 = sub_1C7B7B080();
    os_log_type_t v10 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v36 = v12;
      *(_DWORD *)id v11 = 136380675;
      if (*(void *)(a4 + 208))
      {
        unint64_t v13 = *(void *)(a4 + 200);
        unint64_t v14 = *(void *)(a4 + 208);
      }
      else
      {
        uint64_t v25 = IDSCopyLocalDeviceUniqueID();
        if (v25)
        {
          unint64_t v26 = (void *)v25;
          unint64_t v13 = sub_1C7B7B1D0();
          unint64_t v14 = v27;
        }
        else
        {
          unint64_t v13 = 0xD000000000000017;
          unint64_t v14 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      sub_1C7B47DE8(v13, v14, &v36);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C7B37000, v9, v10, a6, v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C87BC480](v12, -1, -1);
      MEMORY[0x1C87BC480](v11, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

uint64_t sub_1C7B724A4@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1C7B3AEC8(a2, a3);
      os_log_type_t v10 = (char *)sub_1C7B7AEB0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1C7B7AED0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1C7B7AEC0();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1C7B72708);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1C7B3AF20(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      unint64_t v17 = (char *)sub_1C7B7AEB0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1C7B7AED0();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1C7B7AEC0();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

void *sub_1C7B72718(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_1C7B7B520();
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

uint64_t sub_1C7B727BC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_1C7B727EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9790);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7B7B420();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

void *sub_1C7B729A0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F97A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C7B7B420();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    uint64_t v21[3] = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C7B72B64()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RecordMetadata(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9708);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1C7B7B420();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_1C7B780B8(*(void *)(v6 + 48) + v19, (uint64_t)v5, type metadata accessor for RecordMetadata);
    uint64_t result = (void *)sub_1C7B78D9C((uint64_t)v5, *(void *)(v8 + 48) + v19, type metadata accessor for RecordMetadata);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16) {
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1C7B72DC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9790);
  uint64_t v3 = sub_1C7B7B430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1C7B7B650();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    uint64_t result = sub_1C7B7B680();
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
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
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

uint64_t sub_1C7B73078()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F97A0);
  uint64_t v3 = sub_1C7B7B430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v30 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v30 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v30 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    int64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    sub_1C7B7B650();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C7B7B680();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    void v12[2] = v21;
    uint64_t v12[3] = v22;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v30 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C7B73380()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RecordMetadata(0);
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9708);
  uint64_t v6 = sub_1C7B7B430();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  int64_t v31 = v0;
  uint64_t v32 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v33) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v32 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v32 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v33) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v32 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v5 + 48);
    uint64_t v22 = *(void *)(v35 + 72);
    sub_1C7B780B8(v21 + v22 * v17, (uint64_t)v4, type metadata accessor for RecordMetadata);
    sub_1C7B7B650();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_1C7B7AFF0();
    sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
    sub_1C7B7B1B0();
    sub_1C7B7B670();
    uint64_t result = sub_1C7B7B680();
    uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_1C7B78D9C((uint64_t)v4, *(void *)(v7 + 48) + v15 * v22, type metadata accessor for RecordMetadata);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v31;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v33) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v32 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C7B737B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9790);
  uint64_t v3 = sub_1C7B7B430();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
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
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1C7B7B650();
      sub_1C7B7B210();
      uint64_t result = sub_1C7B7B680();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1C7B73A94()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F97A0);
  uint64_t v3 = sub_1C7B7B430();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v33 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v32 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      uint64_t v22 = v19[2];
      uint64_t v23 = v19[3];
      sub_1C7B7B650();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1C7B7B680();
      uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
      *unint64_t v12 = v20;
      v12[1] = v21;
      void v12[2] = v22;
      uint64_t v12[3] = v23;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1C7B73DD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RecordMetadata(0);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9708);
  uint64_t v6 = sub_1C7B7B430();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v34 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v32 = v0;
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_33;
        }
        unint64_t v19 = v34[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v19 = v34[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v33) {
              goto LABEL_33;
            }
            unint64_t v19 = v34[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v33)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v32;
                uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
                if (v30 > 63) {
                  bzero(v34, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v30;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v34[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v33) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v34[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v5 + 48);
      uint64_t v22 = *(void *)(v36 + 72);
      sub_1C7B78D9C(v21 + v22 * v17, (uint64_t)v4, type metadata accessor for RecordMetadata);
      sub_1C7B7B650();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C7B7B210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_1C7B7AFF0();
      sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
      sub_1C7B7B1B0();
      sub_1C7B7B670();
      uint64_t result = sub_1C7B7B680();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_1C7B78D9C((uint64_t)v4, *(void *)(v7 + 48) + v15 * v22, type metadata accessor for RecordMetadata);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

unint64_t sub_1C7B7423C(unint64_t result)
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
    uint64_t v8 = sub_1C7B7B3E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1C7B7B650();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        uint64_t v10 = sub_1C7B7B680();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          int64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *unint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
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
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1C7B74404(int64_t a1)
{
  uint64_t v29 = type metadata accessor for RecordMetadata(0);
  uint64_t v3 = *(void *)(v29 - 8);
  uint64_t result = MEMORY[0x1F4188790](v29);
  unint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    unint64_t v25 = v1;
    uint64_t v11 = ~v9;
    swift_retain();
    uint64_t v12 = sub_1C7B7B3E0();
    uint64_t v13 = v7;
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v14 = (v12 + 1) & v11;
      uint64_t v15 = *(void *)(v3 + 72);
      uint64_t v27 = v13;
      uint64_t v28 = v8;
      uint64_t v26 = v15;
      do
      {
        int64_t v30 = a1;
        int64_t v16 = v15 * v10;
        sub_1C7B780B8(*(void *)(v13 + 48) + v15 * v10, (uint64_t)v6, type metadata accessor for RecordMetadata);
        sub_1C7B7B650();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        sub_1C7B7AFF0();
        sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
        sub_1C7B7B1B0();
        sub_1C7B7B670();
        uint64_t v17 = sub_1C7B7B680();
        a1 = v30;
        sub_1C7B78120((uint64_t)v6, type metadata accessor for RecordMetadata);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v14)
        {
          if (v18 < v14)
          {
            uint64_t v13 = v27;
            uint64_t v8 = v28;
            uint64_t v15 = v26;
            goto LABEL_6;
          }
          uint64_t v13 = v27;
          uint64_t v8 = v28;
          uint64_t v15 = v26;
          if (a1 < (uint64_t)v18) {
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v13 = v27;
          uint64_t v8 = v28;
          uint64_t v15 = v26;
          if (v18 < v14 && a1 < (uint64_t)v18) {
            goto LABEL_6;
          }
        }
        int64_t v19 = v15 * a1;
        if (v15 * a1 < v16 || *(void *)(v13 + 48) + v15 * a1 >= (unint64_t)(*(void *)(v13 + 48) + v16 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v19 == v16) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v25;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v20 = *v1;
  uint64_t v21 = *(void *)(*v1 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v20 + 16) = v23;
    ++*(_DWORD *)(v20 + 36);
  }
  return result;
}

uint64_t sub_1C7B74798(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for RecordMetadata(0);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v46 = (uint64_t)&v41 - v11;
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v45 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC10);
  uint64_t result = sub_1C7B7B510();
  uint64_t v13 = result;
  os_log_type_t v42 = a1;
  uint64_t v43 = a2;
  if (a2 < 1) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = *a1;
  }
  uint64_t v15 = 0;
  uint64_t v16 = result + 64;
  uint64_t v17 = v45;
  unint64_t v44 = a4;
  while (1)
  {
    if (v14)
    {
      uint64_t v48 = (v14 - 1) & v14;
      uint64_t v49 = v15;
      unint64_t v18 = __clz(__rbit64(v14)) | (v15 << 6);
    }
    else
    {
      uint64_t v19 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_40;
      }
      if (v19 >= v43) {
        return v13;
      }
      unint64_t v20 = v42[v19];
      uint64_t v21 = v15 + 1;
      if (!v20)
      {
        uint64_t v21 = v15 + 2;
        if (v15 + 2 >= v43) {
          return v13;
        }
        unint64_t v20 = v42[v21];
        if (!v20)
        {
          uint64_t v21 = v15 + 3;
          if (v15 + 3 >= v43) {
            return v13;
          }
          unint64_t v20 = v42[v21];
          if (!v20)
          {
            uint64_t v22 = v15 + 4;
            if (v15 + 4 >= v43) {
              return v13;
            }
            unint64_t v20 = v42[v22];
            if (!v20)
            {
              while (1)
              {
                uint64_t v21 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v21 >= v43) {
                  return v13;
                }
                unint64_t v20 = v42[v21];
                ++v22;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v21 = v15 + 4;
          }
        }
      }
LABEL_24:
      uint64_t v48 = (v20 - 1) & v20;
      uint64_t v49 = v21;
      unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
    }
    uint64_t v23 = a4[7];
    uint64_t v24 = (uint64_t *)(a4[6] + 32 * v18);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    uint64_t v27 = v24[2];
    uint64_t v28 = v24[3];
    uint64_t v29 = v46;
    uint64_t v30 = *(void *)(v47 + 72);
    sub_1C7B780B8(v23 + v30 * v18, v46, type metadata accessor for RecordMetadata);
    sub_1C7B78D9C(v29, v17, type metadata accessor for RecordMetadata);
    sub_1C7B7B650();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1C7B7B680();
    uint64_t v31 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v34 = __clz(__rbit64((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v17 = v45;
    }
    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v31) >> 6;
      uint64_t v17 = v45;
      do
      {
        if (++v33 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v37 = v33 == v36;
        if (v33 == v36) {
          unint64_t v33 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v16 + 8 * v33);
      }
      while (v38 == -1);
      unint64_t v34 = __clz(__rbit64(~v38)) + (v33 << 6);
    }
    *(void *)(v16 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
    uint64_t v39 = (void *)(*(void *)(v13 + 48) + 32 * v34);
    *uint64_t v39 = v26;
    v39[1] = v25;
    v39[2] = v27;
    v39[3] = v28;
    uint64_t result = sub_1C7B78D9C(v17, *(void *)(v13 + 56) + v34 * v30, type metadata accessor for RecordMetadata);
    ++*(void *)(v13 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v44;
    unint64_t v14 = v48;
    uint64_t v15 = v49;
    if (!a3) {
      return v13;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C7B74B80(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_1C7B7AFF0();
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  unint64_t v52 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v49 = (char *)&v43 - v12;
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v48 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9750);
  uint64_t result = sub_1C7B7B510();
  uint64_t v14 = result;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0;
  uint64_t v46 = v50 + 32;
  uint64_t v47 = v50 + 16;
  uint64_t v17 = result + 64;
  uint64_t v18 = v48;
  uint64_t v45 = a4;
  while (1)
  {
    if (v15)
    {
      unint64_t v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v51 = v16;
      unint64_t v20 = v19 | (v16 << 6);
    }
    else
    {
      uint64_t v21 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_40;
      }
      if (v21 >= v44) {
        return v14;
      }
      unint64_t v22 = v43[v21];
      uint64_t v23 = v16 + 1;
      if (!v22)
      {
        uint64_t v23 = v16 + 2;
        if (v16 + 2 >= v44) {
          return v14;
        }
        unint64_t v22 = v43[v23];
        if (!v22)
        {
          uint64_t v23 = v16 + 3;
          if (v16 + 3 >= v44) {
            return v14;
          }
          unint64_t v22 = v43[v23];
          if (!v22)
          {
            uint64_t v24 = v16 + 4;
            if (v16 + 4 >= v44) {
              return v14;
            }
            unint64_t v22 = v43[v24];
            if (!v22)
            {
              while (1)
              {
                uint64_t v23 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v23 >= v44) {
                  return v14;
                }
                unint64_t v22 = v43[v23];
                ++v24;
                if (v22) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v23 = v16 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v15 = (v22 - 1) & v22;
      uint64_t v51 = v23;
      unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    }
    uint64_t v25 = a4[7];
    uint64_t v26 = (uint64_t *)(a4[6] + 16 * v20);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = v49;
    uint64_t v30 = v50;
    uint64_t v31 = *(void *)(v50 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v49, v25 + v31 * v20, v18);
    unint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v52, v29, v18);
    sub_1C7B7B650();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    uint64_t result = sub_1C7B7B680();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v36 = __clz(__rbit64((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v18 = v48;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v33) >> 6;
      uint64_t v18 = v48;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v39 = v35 == v38;
        if (v35 == v38) {
          unint64_t v35 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      unint64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(void *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    uint64_t v41 = (void *)(*(void *)(v14 + 48) + 16 * v36);
    *uint64_t v41 = v27;
    v41[1] = v28;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(void *)(v14 + 56) + v36 * v31, v52, v18);
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v45;
    uint64_t v16 = v51;
    if (!a3) {
      return v14;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C7B74F3C(uint64_t a1)
{
  int64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = type metadata accessor for RecordMetadata(0);
  uint64_t v7 = *(void *)(v59 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v59);
  uint64_t v10 = (uint64_t *)((char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (uint64_t *)((char *)&v46 - v12);
  uint64_t result = MEMORY[0x1F4188790](v11);
  uint64_t v54 = (uint64_t)&v46 - v15;
  if (!*(void *)(*v2 + 16)) {
    return result;
  }
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v47 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  int64_t v48 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v49 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  uint64_t v51 = v6;
  unint64_t v52 = v2;
  uint64_t v53 = a1;
  uint64_t v50 = v7;
  while (1)
  {
    if (v19)
    {
      uint64_t v55 = (v19 - 1) & v19;
      int64_t v56 = v20;
      unint64_t v22 = __clz(__rbit64(v19)) | (v20 << 6);
      goto LABEL_26;
    }
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v23 >= v48) {
      return swift_release();
    }
    unint64_t v24 = *(void *)(v47 + 8 * v23);
    int64_t v25 = v20 + 1;
    if (!v24)
    {
      int64_t v25 = v20 + 2;
      if (v20 + 2 >= v48) {
        return swift_release();
      }
      unint64_t v24 = *(void *)(v47 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v20 + 3;
        if (v20 + 3 >= v48) {
          return swift_release();
        }
        unint64_t v24 = *(void *)(v47 + 8 * v25);
        if (!v24)
        {
          int64_t v25 = v20 + 4;
          if (v20 + 4 >= v48) {
            return swift_release();
          }
          unint64_t v24 = *(void *)(v47 + 8 * v25);
          if (!v24) {
            break;
          }
        }
      }
    }
LABEL_25:
    uint64_t v55 = (v24 - 1) & v24;
    int64_t v56 = v25;
    unint64_t v22 = __clz(__rbit64(v24)) + (v25 << 6);
LABEL_26:
    uint64_t v27 = *(void *)(a1 + 48);
    uint64_t v60 = *(void *)(v7 + 72);
    uint64_t v28 = v54;
    sub_1C7B780B8(v27 + v60 * v22, v54, type metadata accessor for RecordMetadata);
    sub_1C7B78D9C(v28, (uint64_t)v13, type metadata accessor for RecordMetadata);
    uint64_t v29 = *v2;
    sub_1C7B7B650();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v30 = v59;
    uint64_t v31 = (char *)v13 + *(int *)(v59 + 20);
    sub_1C7B7AFF0();
    sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
    uint64_t v58 = v31;
    sub_1C7B7B1B0();
    uint64_t v57 = *(int *)(v30 + 24);
    sub_1C7B7B670();
    uint64_t v32 = sub_1C7B7B680();
    uint64_t v33 = -1 << *(unsigned char *)(v29 + 32);
    unint64_t v34 = v32 & ~v33;
    uint64_t v61 = v29;
    uint64_t v35 = v29 + 56;
    if ((*(void *)(v29 + 56 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34))
    {
      uint64_t v36 = ~v33;
      while (1)
      {
        unint64_t v37 = v34 * v60;
        sub_1C7B780B8(*(void *)(v61 + 48) + v34 * v60, (uint64_t)v10, type metadata accessor for RecordMetadata);
        uint64_t v38 = v10[2];
        uint64_t v39 = v10[3];
        uint64_t v40 = v13[2];
        uint64_t v41 = v13[3];
        BOOL v42 = *v10 == *v13 && v10[1] == v13[1];
        if (v42 || (sub_1C7B7B5E0() & 1) != 0)
        {
          BOOL v43 = v38 == v40 && v39 == v41;
          if (v43 || (sub_1C7B7B5E0())
            && (sub_1C7B7AFC0() & 1) != 0
            && *((unsigned __int8 *)v10 + *(int *)(v59 + 24)) == *((unsigned __int8 *)v13 + v57))
          {
            break;
          }
        }
        sub_1C7B78120((uint64_t)v10, type metadata accessor for RecordMetadata);
        unint64_t v34 = (v34 + 1) & v36;
        if (((*(void *)(v35 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
          goto LABEL_6;
        }
      }
      sub_1C7B78120((uint64_t)v10, type metadata accessor for RecordMetadata);
      swift_bridgeObjectRelease();
      int64_t v2 = v52;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v45 = *v2;
      uint64_t v62 = *v2;
      *int64_t v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C7B72B64();
        uint64_t v45 = v62;
      }
      uint64_t v21 = (uint64_t)v51;
      sub_1C7B78D9C(*(void *)(v45 + 48) + v37, (uint64_t)v51, type metadata accessor for RecordMetadata);
      sub_1C7B74404(v34);
      *int64_t v2 = v62;
      swift_bridgeObjectRelease();
      (*v49)(v21, 0, 1, v59);
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v21 = (uint64_t)v51;
      (*v49)((uint64_t)v51, 1, 1, v59);
      int64_t v2 = v52;
    }
    sub_1C7B4E5AC(v21, &qword_1EBC5E400);
    uint64_t result = sub_1C7B78120((uint64_t)v13, type metadata accessor for RecordMetadata);
    a1 = v53;
    uint64_t v7 = v50;
    unint64_t v19 = v55;
    int64_t v20 = v56;
  }
  uint64_t v26 = v20 + 5;
  if (v20 + 5 >= v48) {
    return swift_release();
  }
  unint64_t v24 = *(void *)(v47 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v20 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v48) {
      return swift_release();
    }
    unint64_t v24 = *(void *)(v47 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_1C7B755C4(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for RecordMetadata(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char **)((char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v14 = (char **)((char *)&v56 - v13);
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
  uint64_t v63 = v11;
  uint64_t v15 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = ~v15;
  uint64_t v18 = a1 + 56;
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v19 = -v15;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v17;
  uint64_t v65 = a1;
  uint64_t v66 = a1 + 56;
  uint64_t v67 = v16;
  int64_t v68 = 0;
  unint64_t v69 = v20 & v17;
  uint64_t v59 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v60 = v12;
  uint64_t v58 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v64 = (char *)(a2 + 56);
  swift_bridgeObjectRetain();
  int64_t v22 = 0;
  int64_t v56 = v6;
  uint64_t v57 = a2;
  while (1)
  {
    uint64_t v62 = (char *)v22;
    if (v21)
    {
      uint64_t v23 = (v21 - 1) & v21;
      unint64_t v24 = __clz(__rbit64(v21)) | (v22 << 6);
      int64_t v25 = v22;
LABEL_9:
      sub_1C7B780B8(*(void *)(a1 + 48) + *(void *)(v60 + 72) * v24, (uint64_t)v6, type metadata accessor for RecordMetadata);
      uint64_t v26 = 0;
      goto LABEL_29;
    }
    int64_t v25 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      __break(1u);
    }
    int64_t v27 = (unint64_t)(v16 + 64) >> 6;
    if (v25 >= v27)
    {
LABEL_28:
      uint64_t v23 = 0;
      uint64_t v26 = 1;
      int64_t v25 = v22;
      goto LABEL_29;
    }
    unint64_t v28 = *(void *)(v18 + 8 * v25);
    if (v28) {
      goto LABEL_13;
    }
    v22 += 2;
    if (v25 + 1 >= v27) {
      goto LABEL_46;
    }
    unint64_t v28 = *(void *)(v18 + 8 * v22);
    if (v28) {
      goto LABEL_16;
    }
    if (v25 + 2 >= v27) {
      goto LABEL_28;
    }
    unint64_t v28 = *(void *)(v18 + 8 * (v25 + 2));
    if (v28)
    {
      v25 += 2;
      goto LABEL_13;
    }
    int64_t v22 = v25 + 3;
    if (v25 + 3 < v27)
    {
      unint64_t v28 = *(void *)(v18 + 8 * v22);
      if (v28)
      {
LABEL_16:
        int64_t v25 = v22;
LABEL_13:
        uint64_t v23 = (v28 - 1) & v28;
        unint64_t v24 = __clz(__rbit64(v28)) + (v25 << 6);
        goto LABEL_9;
      }
      v25 += 4;
      if (v25 >= v27) {
        goto LABEL_28;
      }
      unint64_t v28 = *(void *)(v18 + 8 * v25);
      if (v28) {
        goto LABEL_13;
      }
      int64_t v25 = v27 - 1;
      uint64_t v29 = v62 + 6;
      while ((char *)v27 != v29)
      {
        unint64_t v28 = *(void *)(v18 + 8 * (void)v29++);
        if (v28)
        {
          int64_t v25 = (int64_t)(v29 - 1);
          goto LABEL_13;
        }
      }
LABEL_46:
      uint64_t v23 = 0;
      uint64_t v26 = 1;
      goto LABEL_29;
    }
    uint64_t v23 = 0;
    uint64_t v26 = 1;
    v25 += 2;
LABEL_29:
    uint64_t v30 = a1;
    uint64_t v31 = v63;
    (*v59)(v6, v26, 1, v63);
    uint64_t v65 = v30;
    uint64_t v66 = v18;
    uint64_t v67 = v16;
    int64_t v68 = v25;
    unint64_t v69 = v23;
    if ((*v58)(v6, 1, v31) == 1)
    {
      sub_1C7B538D0();
      sub_1C7B4E5AC((uint64_t)v6, &qword_1EBC5E400);
      return v57;
    }
    sub_1C7B78D9C((uint64_t)v6, (uint64_t)v14, type metadata accessor for RecordMetadata);
    uint64_t v32 = v57;
    sub_1C7B7B650();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v33 = (char *)v14 + *(int *)(v31 + 20);
    sub_1C7B7AFF0();
    sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
    uint64_t v62 = v33;
    sub_1C7B7B1B0();
    uint64_t v61 = *(int *)(v31 + 24);
    sub_1C7B7B670();
    uint64_t v34 = sub_1C7B7B680();
    uint64_t v35 = -1 << *(unsigned char *)(v32 + 32);
    unint64_t v36 = v34 & ~v35;
    if ((*(void *)&v64[(v36 >> 3) & 0xFFFFFFFFFFFFFF8] >> v36)) {
      break;
    }
LABEL_6:
    sub_1C7B78120((uint64_t)v14, type metadata accessor for RecordMetadata);
    int64_t v22 = v68;
    unint64_t v21 = v69;
    a1 = v65;
    uint64_t v18 = v66;
    uint64_t v16 = v67;
    unint64_t v6 = v56;
  }
  uint64_t v37 = v32;
  uint64_t v38 = ~v35;
  uint64_t v39 = *(void *)(v60 + 72);
  while (1)
  {
    sub_1C7B780B8(*(void *)(v37 + 48) + v39 * v36, (uint64_t)v10, type metadata accessor for RecordMetadata);
    uint64_t v40 = v10[2];
    uint64_t v41 = v10[3];
    uint64_t v43 = v14[2];
    uint64_t v42 = v14[3];
    BOOL v44 = *v10 == *v14 && v10[1] == v14[1];
    if (v44 || (sub_1C7B7B5E0() & 1) != 0)
    {
      BOOL v45 = v40 == v43 && v41 == v42;
      if (v45 || (sub_1C7B7B5E0())
        && (sub_1C7B7AFC0() & 1) != 0
        && *((unsigned __int8 *)v10 + *(int *)(v63 + 24)) == *((unsigned __int8 *)v14 + v61))
      {
        break;
      }
    }
    sub_1C7B78120((uint64_t)v10, type metadata accessor for RecordMetadata);
    unint64_t v36 = (v36 + 1) & v38;
    if (((*(void *)&v64[(v36 >> 3) & 0xFFFFFFFFFFFFFF8] >> v36) & 1) == 0) {
      goto LABEL_6;
    }
  }
  sub_1C7B78120((uint64_t)v10, type metadata accessor for RecordMetadata);
  uint64_t isStackAllocationSafe = sub_1C7B78120((uint64_t)v14, type metadata accessor for RecordMetadata);
  uint64_t v47 = v37;
  char v48 = *(unsigned char *)(v37 + 32);
  unint64_t v49 = (unint64_t)((1 << v48) + 63) >> 6;
  size_t v50 = 8 * v49;
  if ((v48 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    memcpy((char *)&v56 - ((v50 + 15) & 0x3FFFFFFFFFFFFFF0), v64, v50);
    uint64_t v51 = sub_1C7B75D74((unint64_t *)((char *)&v56 - ((v50 + 15) & 0x3FFFFFFFFFFFFFF0)), v49, v47, v36, &v65);
    swift_release();
    sub_1C7B538D0();
    return v51;
  }
  else
  {
    uint64_t v53 = v47;
    uint64_t v54 = (void *)swift_slowAlloc();
    memcpy(v54, v64, v50);
    uint64_t v55 = sub_1C7B75D74((unint64_t *)v54, v49, v53, v36, &v65);
    swift_release();
    sub_1C7B538D0();
    MEMORY[0x1C87BC480](v54, -1, -1);
    return v55;
  }
}

uint64_t sub_1C7B75D74(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v55 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for RecordMetadata(0);
  uint64_t v12 = MEMORY[0x1F4188790](v65);
  uint64_t v14 = (uint64_t *)((char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (uint64_t *)((char *)&v54 - v16);
  uint64_t v18 = *(void *)(a3 + 16);
  uint64_t v19 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v20 = *(unint64_t *)((char *)a1 + v19) & ((-1 << a4) - 1);
  uint64_t v57 = a1;
  uint64_t v58 = v11;
  *(unint64_t *)((char *)a1 + v19) = v20;
  uint64_t v21 = v18 - 1;
  uint64_t v61 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v62 = v22;
  uint64_t v59 = a5;
  uint64_t v60 = (unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  uint64_t v67 = a3;
  uint64_t v66 = a3 + 56;
  while (2)
  {
    uint64_t v56 = v21;
    do
    {
      while (1)
      {
        uint64_t v23 = *a5;
        uint64_t v24 = a5[1];
        int64_t v25 = (char *)a5[2];
        int64_t v26 = a5[3];
        unint64_t v27 = a5[4];
        uint64_t v64 = v25;
        if (v27)
        {
          uint64_t v28 = (v27 - 1) & v27;
          unint64_t v29 = __clz(__rbit64(v27)) | (v26 << 6);
LABEL_6:
          sub_1C7B780B8(*(void *)(v23 + 48) + *(void *)(v62 + 72) * v29, (uint64_t)v11, type metadata accessor for RecordMetadata);
          uint64_t v30 = 0;
          goto LABEL_7;
        }
        int64_t v48 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          goto LABEL_53;
        }
        int64_t v49 = (unint64_t)(v25 + 64) >> 6;
        if (v48 >= v49)
        {
          uint64_t v28 = 0;
          uint64_t v30 = 1;
          goto LABEL_7;
        }
        unint64_t v50 = *(void *)(v24 + 8 * v48);
        if (v50) {
          goto LABEL_28;
        }
        int64_t v51 = v26 + 2;
        if (v26 + 2 >= v49) {
          goto LABEL_44;
        }
        unint64_t v50 = *(void *)(v24 + 8 * v51);
        if (v50) {
          goto LABEL_32;
        }
        if (v26 + 3 >= v49) {
          goto LABEL_45;
        }
        unint64_t v50 = *(void *)(v24 + 8 * (v26 + 3));
        if (v50)
        {
          int64_t v48 = v26 + 3;
          goto LABEL_28;
        }
        int64_t v51 = v26 + 4;
        if (v26 + 4 < v49)
        {
          unint64_t v50 = *(void *)(v24 + 8 * v51);
          if (v50)
          {
LABEL_32:
            int64_t v48 = v51;
LABEL_28:
            uint64_t v28 = (v50 - 1) & v50;
            unint64_t v29 = __clz(__rbit64(v50)) + (v48 << 6);
            int64_t v26 = v48;
            goto LABEL_6;
          }
          int64_t v48 = v26 + 5;
          if (v26 + 5 < v49)
          {
            unint64_t v50 = *(void *)(v24 + 8 * v48);
            if (v50) {
              goto LABEL_28;
            }
            int64_t v48 = v49 - 1;
            int64_t v52 = v26 + 6;
            while (v49 != v52)
            {
              unint64_t v50 = *(void *)(v24 + 8 * v52++);
              if (v50)
              {
                int64_t v48 = v52 - 1;
                goto LABEL_28;
              }
            }
LABEL_44:
            uint64_t v28 = 0;
            uint64_t v30 = 1;
            int64_t v26 = v48;
            goto LABEL_7;
          }
LABEL_45:
          uint64_t v28 = 0;
          uint64_t v30 = 1;
          int64_t v26 = v51;
          goto LABEL_7;
        }
        uint64_t v28 = 0;
        uint64_t v30 = 1;
        v26 += 3;
LABEL_7:
        uint64_t v31 = v65;
        (*v61)(v11, v30, 1, v65);
        *a5 = v23;
        a5[1] = v24;
        a5[2] = v64;
        a5[3] = v26;
        a5[4] = v28;
        if ((*v60)(v11, 1, v31) == 1)
        {
          sub_1C7B4E5AC((uint64_t)v11, &qword_1EBC5E400);
          uint64_t v53 = v67;
          swift_retain();
          return sub_1C7B763AC(v57, v55, v56, v53);
        }
        sub_1C7B78D9C((uint64_t)v11, (uint64_t)v17, type metadata accessor for RecordMetadata);
        uint64_t v32 = v67;
        sub_1C7B7B650();
        uint64_t v33 = v31;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C7B7B210();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v34 = (char *)v17 + *(int *)(v31 + 20);
        sub_1C7B7AFF0();
        sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
        uint64_t v64 = v34;
        sub_1C7B7B1B0();
        uint64_t v63 = *(int *)(v33 + 24);
        sub_1C7B7B670();
        uint64_t v35 = sub_1C7B7B680();
        uint64_t v36 = -1 << *(unsigned char *)(v32 + 32);
        unint64_t v37 = v35 & ~v36;
        if ((*(void *)(v66 + ((v37 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v37)) {
          break;
        }
LABEL_3:
        uint64_t result = sub_1C7B78120((uint64_t)v17, type metadata accessor for RecordMetadata);
        uint64_t v11 = v58;
        a5 = v59;
      }
      uint64_t v38 = ~v36;
      uint64_t v39 = *(void *)(v62 + 72);
      while (1)
      {
        sub_1C7B780B8(*(void *)(v67 + 48) + v39 * v37, (uint64_t)v14, type metadata accessor for RecordMetadata);
        uint64_t v40 = v14[2];
        uint64_t v41 = v14[3];
        uint64_t v43 = v17[2];
        uint64_t v42 = v17[3];
        BOOL v44 = *v14 == *v17 && v14[1] == v17[1];
        if (v44 || (sub_1C7B7B5E0() & 1) != 0)
        {
          BOOL v45 = v40 == v43 && v41 == v42;
          if (v45 || (sub_1C7B7B5E0())
            && (sub_1C7B7AFC0() & 1) != 0
            && *((unsigned __int8 *)v14 + *(int *)(v65 + 24)) == *((unsigned __int8 *)v17 + v63))
          {
            break;
          }
        }
        sub_1C7B78120((uint64_t)v14, type metadata accessor for RecordMetadata);
        unint64_t v37 = (v37 + 1) & v38;
        if (((*(void *)(v66 + ((v37 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v37) & 1) == 0) {
          goto LABEL_3;
        }
      }
      sub_1C7B78120((uint64_t)v14, type metadata accessor for RecordMetadata);
      uint64_t result = sub_1C7B78120((uint64_t)v17, type metadata accessor for RecordMetadata);
      uint64_t v46 = (v37 >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v11 = v58;
      uint64_t v47 = *(unint64_t *)((char *)v57 + v46);
      *(unint64_t *)((char *)v57 + v46) = v47 & ~(1 << v37);
      BOOL v44 = (v47 & (1 << v37)) == 0;
      a5 = v59;
    }
    while (v44);
    uint64_t v21 = v56 - 1;
    if (__OFSUB__(v56, 1))
    {
LABEL_53:
      __break(1u);
      return result;
    }
    if (v56 != 1) {
      continue;
    }
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1C7B763AC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for RecordMetadata(0);
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA4F9708);
  uint64_t result = sub_1C7B7B440();
  uint64_t v11 = result;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *a1;
  }
  uint64_t v14 = 0;
  uint64_t v15 = result + 56;
  uint64_t v36 = a4;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      uint64_t v39 = v14;
      unint64_t v17 = v16 | (v14 << 6);
    }
    else
    {
      uint64_t v18 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v18 >= v35)
      {
LABEL_37:
        swift_release();
        return v11;
      }
      unint64_t v19 = v34[v18];
      uint64_t v20 = v14 + 1;
      if (!v19)
      {
        uint64_t v20 = v14 + 2;
        if (v14 + 2 >= v35) {
          goto LABEL_37;
        }
        unint64_t v19 = v34[v20];
        if (!v19)
        {
          uint64_t v20 = v14 + 3;
          if (v14 + 3 >= v35) {
            goto LABEL_37;
          }
          unint64_t v19 = v34[v20];
          if (!v19)
          {
            uint64_t v21 = v14 + 4;
            if (v14 + 4 >= v35) {
              goto LABEL_37;
            }
            unint64_t v19 = v34[v21];
            if (!v19)
            {
              while (1)
              {
                uint64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_41;
                }
                if (v20 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v19 = v34[v20];
                ++v21;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v20 = v14 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v13 = (v19 - 1) & v19;
      uint64_t v39 = v20;
      unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
    }
    uint64_t v22 = *(void *)(a4 + 48);
    uint64_t v23 = *(void *)(v37 + 72);
    sub_1C7B780B8(v22 + v23 * v17, (uint64_t)v10, type metadata accessor for RecordMetadata);
    sub_1C7B7B650();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C7B7B210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_1C7B7AFF0();
    sub_1C7B78264(&qword_1EA4F9260, MEMORY[0x1E4F27928]);
    sub_1C7B7B1B0();
    sub_1C7B7B670();
    uint64_t result = sub_1C7B7B680();
    uint64_t v24 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v15 + 8 * v26);
      }
      while (v31 == -1);
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(void *)(v15 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t result = sub_1C7B78D9C((uint64_t)v10, *(void *)(v11 + 48) + v27 * v23, type metadata accessor for RecordMetadata);
    ++*(void *)(v11 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v36;
    uint64_t v14 = v39;
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C7B767B0(uint64_t a1)
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

uint64_t sub_1C7B76838(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1C7B724A4((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1C7B76910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1C7B7AEB0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1C7B7AED0();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1C7B7AEC0();
  sub_1C7B724A4(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1C7B769C8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1C7B76C30);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1C7B3AEC8(a3, a4);
                  sub_1C7B3AEC8(a1, a2);
                  char v17 = sub_1C7B76910((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1C7B3AF20(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1C7B3AEC8(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1C7B76910(v21, v22, v20, a3, a4);
                  sub_1C7B3AF20(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1C7B3AEC8(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1C7B3AEC8(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_1C7B76838(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_1C7B3AF20(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

void sub_1C7B76C60(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((*a1 & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1C7B7B090();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EBC5DC50);
    uint64_t v3 = sub_1C7B7B080();
    os_log_type_t v4 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1C7B37000, v3, v4, "Sync engine is disabled because of unsupported device", v5, 2u);
      MEMORY[0x1C87BC480](v5, -1, -1);
    }
  }
  if ((v1 & 2) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1C7B7B090();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EBC5DC50);
    char v7 = sub_1C7B7B080();
    os_log_type_t v8 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C7B37000, v7, v8, "Sync engine is disabled because of preference", v9, 2u);
      MEMORY[0x1C87BC480](v9, -1, -1);
    }
  }
  if (qword_1EBC5DCD8 != -1) {
    swift_once();
  }
  if ((qword_1EBC5DCD0 & ~v1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1C7B7B090();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EBC5DC50);
    oslog = sub_1C7B7B080();
    os_log_type_t v11 = sub_1C7B7B2D0();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1C7B37000, oslog, v11, "Sync engine is enabled", v12, 2u);
      MEMORY[0x1C87BC480](v12, -1, -1);
    }
  }
}

void *sub_1C7B76F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = v11;
  uint64_t v66 = a4;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  uint64_t v54 = a1;
  uint64_t v60 = a11;
  uint64_t v61 = a6;
  uint64_t v58 = a10;
  uint64_t v59 = a5;
  uint64_t v57 = a9;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC5E8A0);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v62 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5DC68);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v64 = v17;
  uint64_t v65 = v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v63 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_1C7B7B300();
  uint64_t v20 = *(void *)(v50 - 8);
  MEMORY[0x1F4188790](v50);
  uint64_t v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1C7B7B2E0();
  MEMORY[0x1F4188790](v23);
  uint64_t v24 = sub_1C7B7B130();
  MEMORY[0x1F4188790](v24 - 8);
  int v51 = *a7;
  uint64_t v53 = *a8;
  uint64_t v52 = sub_1C7B537EC(0, (unint64_t *)&qword_1EBC5E8C0);
  sub_1C7B7B120();
  uint64_t v68 = MEMORY[0x1E4FBC860];
  sub_1C7B78264((unint64_t *)&qword_1EBC5E890, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC5E870);
  sub_1C7B58934((unint64_t *)&unk_1EBC5E880, (uint64_t *)&unk_1EBC5E870);
  sub_1C7B7B3D0();
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, *MEMORY[0x1E4FBCC68], v50);
  v11[15] = sub_1C7B7B330();
  uint64_t v25 = MEMORY[0x1E4FBC868];
  v11[18] = MEMORY[0x1E4FBC868];
  v11[19] = 0;
  v11[21] = v25;
  v11[22] = v25;
  v11[23] = MEMORY[0x1E4FBC870];
  type metadata accessor for UnfairLock();
  v11[25] = 0;
  v11[26] = 0;
  v11[24] = 0;
  uint64_t v26 = swift_allocObject();
  unint64_t v27 = (_DWORD *)swift_slowAlloc();
  *(void *)(v26 + 16) = v27;
  *unint64_t v27 = 0;
  v12[28] = 0;
  v12[29] = 0;
  v12[27] = v26;
  *((_WORD *)v12 + 120) = 0;
  *((_OWORD *)v12 + 16) = 0u;
  *((_OWORD *)v12 + 17) = 0u;
  *((_OWORD *)v12 + 18) = 0u;
  *((_OWORD *)v12 + 19) = 0u;
  *((_OWORD *)v12 + 20) = 0u;
  uint64_t v28 = v55;
  uint64_t v12[3] = v54;
  void v12[4] = v28;
  uint64_t v29 = v56;
  sub_1C7B3FB7C(v56, (uint64_t)(v12 + 5));
  uint64_t v30 = v66;
  sub_1C7B3FB7C(v66, (uint64_t)(v12 + 10));
  uint64_t v31 = v61;
  unsigned char v12[16] = v59;
  v12[17] = v31;
  *((unsigned char *)v12 + 16) = v51;
  v12[20] = v57;
  uint64_t v32 = v60;
  v12[25] = v58;
  v12[26] = v32;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = v53;
  v12[31] = v53;
  uint64_t v34 = (void *)v30;
  uint64_t v35 = *(void *)(v30 + 24);
  uint64_t v36 = v34[4];
  __swift_project_boxed_opaque_existential_1(v34, v35);
  uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 24))(v35, v36);
  id v67 = (id)v12[15];
  id v38 = v67;
  uint64_t v68 = v37;
  uint64_t v39 = sub_1C7B7B2F0();
  uint64_t v40 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v62, 1, 1, v39);
  id v41 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E840);
  sub_1C7B58934(&qword_1EBC5E838, &qword_1EBC5E840);
  sub_1C7B78F34();
  uint64_t v42 = v63;
  sub_1C7B7B0D0();
  sub_1C7B4E5AC(v40, (uint64_t *)&unk_1EBC5E8A0);

  swift_release();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = sub_1C7B78F9C;
  *(void *)(v43 + 24) = v12;
  sub_1C7B58934((unint64_t *)&unk_1EBC5E828, &qword_1EBC5DC68);
  swift_retain();
  uint64_t v44 = v64;
  uint64_t v45 = sub_1C7B7B0E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v42, v44);
  v12[24] = v45;
  swift_release();
  uint64_t v68 = v33;
  sub_1C7B76C60(&v68);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v47 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v28 + 8);
  uint64_t v48 = swift_retain();
  v47(v48, &protocol witness table for SyncEngine, ObjectType, v28);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v29);
  __swift_destroy_boxed_opaque_existential_1(v66);
  return v12;
}

uint64_t sub_1C7B77598(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C7B775DC()
{
  return objectdestroy_95Tm(56);
}

uint64_t sub_1C7B775E8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 25, 7);
}

void sub_1C7B77620()
{
  sub_1C7B5C680(*(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_1C7B7764C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7B7765C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = sub_1C7B5D2F4();
  return a1(v2);
}

uint64_t sub_1C7B77698()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C7B3AF20(*(void *)(v0 + 64), *(void *)(v0 + 72));
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 96, 7);
}

void sub_1C7B776F0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  unint64_t v2 = *(void *)(v0 + 88);
  long long v3 = *(_OWORD *)(v0 + 56);
  v4[0] = *(_OWORD *)(v0 + 40);
  v4[1] = v3;
  uint64_t v5 = *(void *)(v0 + 72);
  sub_1C7B78424((char *)v4, v1, v2);
}

uint64_t sub_1C7B7773C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7B7774C@<X0>(uint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_1C7B77EF8(a1, a2);
}

uint64_t sub_1C7B77764()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_1C7B777B4()
{
  sub_1C7B5E8C8(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void **)(v0 + 56));
}

uint64_t sub_1C7B777E4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C7B777F4()
{
  return objectdestroy_95Tm(58);
}

void sub_1C7B777FC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  __int16 v3 = *(_WORD *)(v0 + 56);
  long long v4 = *(_OWORD *)(v0 + 40);
  __int16 v5 = v3;
  sub_1C7B5F920(v1, v2, (uint64_t)&v4);
}

uint64_t sub_1C7B77844()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1C7B77858()
{
  unint64_t result = qword_1EA4F9700;
  if (!qword_1EA4F9700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9700);
  }
  return result;
}

double sub_1C7B778AC@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C7B5ACE8(&qword_1EA4F96F0, a1);
}

double sub_1C7B778E4@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C7B5ACE8(&qword_1EA4F96F8, a1);
}

double sub_1C7B7791C@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C7B5ACE8(&qword_1EA4F96F0, a1);
}

double sub_1C7B77954@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C7B5ACE8(&qword_1EA4F96F0, a1);
}

double sub_1C7B7798C@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C7B5ACE8(&qword_1EA4F96F0, a1);
}

uint64_t sub_1C7B779C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  __int16 v2 = *(_WORD *)(a1 + 16);
  v4[0] = *(void *)a1;
  v4[1] = v1;
  __int16 v5 = v2;
  swift_bridgeObjectRetain();
  return sub_1C7B5B3C8(v4);
}

uint64_t method lookup function for SyncEngine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SyncEngine);
}

uint64_t dispatch thunk of SyncEngine.syncState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveUnlockMessage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveUnlockMessage.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveUnlockMessage.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveAckMessage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveAckMessage.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveAckMessage.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of SyncEngine.didFireMetadataExpirationTimer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of SyncEngine.didFireMetadataExpirationTimer.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of SyncEngine.didFireMetadataExpirationTimer.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of SyncEngine.didFireRetryTimer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of SyncEngine.didFireRetryTimer.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of SyncEngine.didFireRetryTimer.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of SyncEngine.didExhaustRetryTimer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of SyncEngine.didExhaustRetryTimer.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of SyncEngine.didExhaustRetryTimer.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of SyncEngine.inflightMetadataCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of SyncEngine.pairedDevice.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of SyncEngine.__allocating_init(syncService:metadataStore:keybag:retryTimer:role:syncState:inflightExpirationTime:localDeviceIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 800))();
}

uint64_t dispatch thunk of SyncEngine.start()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 808))();
}

unsigned char *storeEnumTagSinglePayload for SyncEngine.Role(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7B77E5CLL);
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

ValueMetadata *type metadata accessor for SyncEngine.Role()
{
  return &type metadata for SyncEngine.Role;
}

uint64_t type metadata accessor for SyncEngine.WeakSource()
{
  return self;
}

uint64_t sub_1C7B77EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, void *))(v5 + 16);
  v8[1] = a5;
  uint64_t v9 = a3;
  v8[0] = a4;
  return v6(a1, a2, &v9, v8);
}

uint64_t sub_1C7B77EF8@<X0>(uint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t result = SyncEngine._queue_syncService(_:shouldAcceptIncomingMessage:from:)(*(void *)(v2 + 24), a1, *(void **)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C7B77F44()
{
  return objectdestroy_95Tm(56);
}

uint64_t objectdestroy_95Tm(uint64_t a1)
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v1, a1, 7);
}

uint64_t sub_1C7B77FA0(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = sub_1C7B5C0D4(*(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48));
  return a1(v3);
}

uint64_t objectdestroy_92Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C7B78038(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = sub_1C7B5BA4C(*(void *)(v1 + 24), *(void *)(v1 + 32));
  return a1(v3);
}

uint64_t sub_1C7B78080()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C7B780B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7B78120(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C7B78180()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C7B781C8(void *a1, uint64_t a2, char a3)
{
  return sub_1C7B6E364(a1, a2, a3 & 1, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_1C7B781D8()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C7B53CAC(*(void **)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  return MEMORY[0x1F4186498](v0, 72, 7);
}

void sub_1C7B78224()
{
  sub_1C7B6E50C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56), *(uint64_t **)(v0 + 64));
}

uint64_t sub_1C7B7823C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1C7B7824C(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C7B7825C(char a1)
{
  return sub_1C7B71648(a1, v1);
}

uint64_t sub_1C7B78264(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C7B782AC()
{
  return sub_1C7B711C0(v0);
}

uint64_t sub_1C7B782B4()
{
  return sub_1C7B6FB28();
}

uint64_t sub_1C7B782BC()
{
  uint64_t v1 = sub_1C7B7B160();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  unsigned int v4 = (uint64_t *)((char *)&v13[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + 120);
  *unsigned int v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_1C7B7B180();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    os_log_type_t v8 = *(os_unfair_lock_s **)(*(void *)(v0 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v8);
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v9 = *(void *)(v0 + 232);
    __int16 v11 = *(_WORD *)(v0 + 240);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v8);
    uint64_t result = swift_release();
    if (v9)
    {
      v13[0] = v10;
      v13[1] = v9;
      __int16 v14 = v11 & 0x1FF;
      sub_1C7B718B0(v13);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C7B78424(char *a1, uint64_t a2, unint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v41 = a2;
  unint64_t v42 = a3;
  uint64_t v6 = sub_1C7B7B160();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (uint64_t *)((char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v10 = *a1;
  uint64_t v11 = *((void *)a1 + 1);
  uint64_t v12 = *((void *)a1 + 2);
  uint64_t v14 = *((void *)a1 + 3);
  uint64_t v13 = *((void *)a1 + 4);
  uint64_t v15 = (void *)v4[15];
  *uint64_t v9 = v15;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCBF0], v6);
  id v16 = v15;
  uint64_t v17 = sub_1C7B7B180();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if ((v17 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v18 = v4[13];
  uint64_t v19 = v4[14];
  __swift_project_boxed_opaque_existential_1(v4 + 10, v18);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19) & 1) == 0)
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1C7B7B090();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EBC5DC50);
    swift_retain_n();
    uint64_t v23 = sub_1C7B7B080();
    os_log_type_t v24 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      v43[0] = v26;
      *(_DWORD *)uint64_t v25 = 136380675;
      if (v4[26])
      {
        unint64_t v27 = v4[25];
        unint64_t v28 = v4[26];
      }
      else
      {
        uint64_t v33 = IDSCopyLocalDeviceUniqueID();
        if (v33)
        {
          uint64_t v34 = (void *)v33;
          unint64_t v27 = sub_1C7B7B1D0();
          unint64_t v28 = v35;
        }
        else
        {
          unint64_t v27 = 0xD000000000000017;
          unint64_t v28 = 0x80000001C7B80E00;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_1C7B47DE8(v27, v28, v43);
      sub_1C7B7B3A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v39 = v24;
      uint64_t v40 = "(%{private}s) Will not handle message because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  uint64_t v17 = v4[31];
  if (qword_1EBC5DCD8 != -1) {
    goto LABEL_27;
  }
LABEL_4:
  if ((qword_1EBC5DCD0 & ~v17) == 0)
  {
    LOBYTE(v43[0]) = v10;
    v43[1] = v11;
    void v43[2] = v12;
    v43[3] = v14;
    v43[4] = v13;
    uint64_t v21 = v41;
    unint64_t v20 = v42;
    sub_1C7B606C4((char *)v43, v41, v42);
    LOBYTE(v43[0]) = v10;
    sub_1C7B60DCC(v21, v20, (unsigned __int8 *)v43);
    return;
  }
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1C7B7B090();
  __swift_project_value_buffer(v29, (uint64_t)qword_1EBC5DC50);
  swift_retain_n();
  uint64_t v23 = sub_1C7B7B080();
  os_log_type_t v30 = sub_1C7B7B2C0();
  if (!os_log_type_enabled(v23, v30)) {
    goto LABEL_16;
  }
  uint64_t v25 = (uint8_t *)swift_slowAlloc();
  uint64_t v26 = swift_slowAlloc();
  v43[0] = v26;
  *(_DWORD *)uint64_t v25 = 136380675;
  if (v4[26])
  {
    unint64_t v31 = v4[25];
    unint64_t v32 = v4[26];
  }
  else
  {
    uint64_t v36 = IDSCopyLocalDeviceUniqueID();
    if (v36)
    {
      uint64_t v37 = (void *)v36;
      unint64_t v31 = sub_1C7B7B1D0();
      unint64_t v32 = v38;
    }
    else
    {
      unint64_t v31 = 0xD000000000000017;
      unint64_t v32 = 0x80000001C7B80E00;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_1C7B47DE8(v31, v32, v43);
  sub_1C7B7B3A0();
  swift_release_n();
  swift_bridgeObjectRelease();
  os_log_type_t v39 = v30;
  uint64_t v40 = "(%{private}s) Will not handle message because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C7B37000, v23, v39, v40, v25, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C87BC480](v26, -1, -1);
  MEMORY[0x1C87BC480](v25, -1, -1);
}

uint64_t sub_1C7B78910(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v25 = a2;
  unint64_t v32 = a4;
  uint64_t v26 = a1;
  uint64_t v5 = sub_1C7B7AFF0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = 0;
  uint64_t v33 = (void *)a3;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v27 = 0;
  uint64_t v28 = a3 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  uint64_t v31 = v6 + 16;
  int64_t v29 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v30 = v6 + 8;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v29) {
      return sub_1C7B74B80(v26, v25, v27, v33);
    }
    unint64_t v21 = *(void *)(v28 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v29) {
        return sub_1C7B74B80(v26, v25, v27, v33);
      }
      unint64_t v21 = *(void *)(v28 + 8 * v10);
      if (!v21)
      {
        int64_t v10 = v20 + 2;
        if (v20 + 2 >= v29) {
          return sub_1C7B74B80(v26, v25, v27, v33);
        }
        unint64_t v21 = *(void *)(v28 + 8 * v10);
        if (!v21) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_5:
    uint64_t v17 = (uint64_t *)(v33[6] + 16 * v16);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v33[7] + *(void *)(v6 + 72) * v16, v5);
    swift_bridgeObjectRetain();
    LOBYTE(v18) = v32(v18, v19, v9);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t result = swift_bridgeObjectRelease();
    if (v18)
    {
      *(unint64_t *)((char *)v26 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v27++, 1))
      {
        __break(1u);
        return sub_1C7B74B80(v26, v25, v27, v33);
      }
    }
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v29) {
    return sub_1C7B74B80(v26, v25, v27, v33);
  }
  unint64_t v21 = *(void *)(v28 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v29) {
      return sub_1C7B74B80(v26, v25, v27, v33);
    }
    unint64_t v21 = *(void *)(v28 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1C7B78BD0(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x1E4F143B8];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_1C7B78910((void *)((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_1C7B78910((unint64_t *)v11, v8, v6, a2);
    MEMORY[0x1C87BC480](v11, -1, -1);
  }
  return a3;
}

unint64_t sub_1C7B78D48()
{
  unint64_t result = qword_1EA4F9760;
  if (!qword_1EA4F9760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9760);
  }
  return result;
}

uint64_t sub_1C7B78D9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C7B78E04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C7B3AF20(a1, a2);
  }
  return a1;
}

void sub_1C7B78E18(void *a1, uint64_t a2, char a3)
{
  sub_1C7B71FD4(a1, a2, a3 & 1, v3, "(%{private}s) Failed to send resync message: %{public}s", "(%{private}s) Sent resync message");
}

unint64_t sub_1C7B78E48()
{
  unint64_t result = qword_1EA4F9770;
  if (!qword_1EA4F9770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9770);
  }
  return result;
}

uint64_t sub_1C7B78E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC5E400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C7B78F04(void *a1, uint64_t a2, char a3)
{
  sub_1C7B71FD4(a1, a2, a3 & 1, v3, "(%{private}s) Failed to send ack message: %{public}s", "(%{private}s) Sent ack message");
}

unint64_t sub_1C7B78F34()
{
  unint64_t result = qword_1EBC5E8B0;
  if (!qword_1EBC5E8B0)
  {
    sub_1C7B537EC(255, (unint64_t *)&qword_1EBC5E8C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC5E8B0);
  }
  return result;
}

uint64_t sub_1C7B78FA0(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

void sub_1C7B78FCC(void *a1, uint64_t a2, char a3)
{
  sub_1C7B71FD4(a1, a2, a3 & 1, v3, "(%{private}s) Failed to send unlock message: %{public}s", "(%{private}s) Sent unlock message");
}

uint64_t sub_1C7B78FFC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void, void))(v4 + 16))(a1, a2, *a3, *a4, a4[1]);
}

uint64_t dispatch thunk of KeybagStateProviding.isLocked.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeybagStateProviding.hasUnlockedSinceBoot.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of KeybagStateProviding.firstUnlockPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1C7B79128()
{
  return *(void *)(v0 + 24);
}

uint64_t LinearRetryTimer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(_OWORD *)(v0 + 32) = xmmword_1C7B7BEA0;
  return v0;
}

uint64_t LinearRetryTimer.init()()
{
  *(void *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(void *)(v0 + 32) = 3;
  return v0;
}

void *LinearRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  v4[5] = 0;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = 0;
  v4[6] = v5;
  uint64_t v4[2] = a1;
  v4[3] = a2;
  v4[4] = a1;
  return v4;
}

void *LinearRetryTimer.init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  v2[5] = 0;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = 0;
  v2[6] = v5;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t LinearRetryTimer.deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t LinearRetryTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LinearRetryTimer()
{
  return self;
}

uint64_t SyncProtocolVersion.rawValue.getter()
{
  return *v0;
}

uint64_t static SyncProtocolVersion.< infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  return *a2 & ~*a1 & 1;
}

SessionSyncEngine::SyncProtocolVersion_optional __swiftcall SyncProtocolVersion.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (SessionSyncEngine::SyncProtocolVersion_optional)rawValue;
}

unint64_t sub_1C7B793C4()
{
  unint64_t result = qword_1EA4F97B0;
  if (!qword_1EA4F97B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F97B0);
  }
  return result;
}

void *sub_1C7B79418@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_1C7B79438(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1C7B79444()
{
  return sub_1C7B7B250();
}

uint64_t sub_1C7B794A4()
{
  return sub_1C7B7B240();
}

uint64_t sub_1C7B794F4(unsigned char *a1, unsigned char *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t sub_1C7B79508(unsigned char *a1, unsigned char *a2)
{
  return *a2 & 1 | ((*a1 & 1) == 0);
}

uint64_t sub_1C7B7951C(unsigned char *a1, unsigned char *a2)
{
  return *a1 & 1 | ((*a2 & 1) == 0);
}

uint64_t sub_1C7B79530(unsigned char *a1, unsigned char *a2)
{
  return *a1 & ~*a2 & 1;
}

unsigned char *storeEnumTagSinglePayload for SyncProtocolVersion(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C7B79610);
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

ValueMetadata *type metadata accessor for SyncProtocolVersion()
{
  return &type metadata for SyncProtocolVersion;
}

unint64_t sub_1C7B79648()
{
  unint64_t result = qword_1EA4F97B8;
  if (!qword_1EA4F97B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F97B8);
  }
  return result;
}

uint64_t sub_1C7B7969C()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t _s14descr1F223A629O10TestKeybagCMa()
{
  return self;
}

uint64_t sub_1C7B796F8()
{
  return *(unsigned __int8 *)(*(void *)v0 + 16);
}

uint64_t sub_1C7B79704()
{
  return *(unsigned __int8 *)(*(void *)v0 + 17);
}

uint64_t sub_1C7B79710()
{
  return sub_1C7B7B0C0();
}

unint64_t sub_1C7B79764()
{
  unint64_t result = qword_1EBC5E848;
  if (!qword_1EBC5E848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EBC5DC70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC5E848);
  }
  return result;
}

uint64_t dispatch thunk of MetadataPersisting.recordMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MetadataPersisting.pairedDeviceIdentifiers.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MetadataPersisting.recordIDSyncDatesByPairedDeviceIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MetadataPersisting.purge()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MetadataPersisting.update(metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of MetadataPersisting.removeMetadata(recordID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of MetadataPersisting.setPerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of MetadataPersisting.removePerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of MetadataPersisting.removeRecordIDSyncDates(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of MetadataPersisting.removeRecordIDSyncDates(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of MetadataPersisting.set(syncDate:recordID:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t CustomizableRetryTimer.init()()
{
  *(void *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  char v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *char v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(void *)(v0 + 32) = 3;
  return v0;
}

void *CustomizableRetryTimer.init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  v2[5] = 0;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  unsigned int v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *unsigned int v6 = 0;
  v2[6] = v5;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t CustomizableRetryTimer.deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1C7B79998(void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3)
{
  char v7 = *(os_unfair_lock_s **)(*(void *)(v3 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v7);
  sub_1C7B79B9C(a1, a2, a3);
  os_unfair_lock_unlock(v7);

  return swift_release();
}

uint64_t sub_1C7B79A14()
{
  uint64_t v1 = v0;
  char v2 = *(os_unfair_lock_s **)(*(void *)(v0 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(void *)(v0 + 48) + 16));
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C7B7B090();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBC5DC50);
  unsigned int v4 = sub_1C7B7B080();
  os_log_type_t v5 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v4, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl(&dword_1C7B37000, v4, v5, "Resetting retry timer", v6, 2u);
    MEMORY[0x1C87BC480](v6, -1, -1);
  }

  *(void *)(v1 + 32) = *(void *)(v1 + 16);
  os_unfair_lock_unlock(v2);

  return swift_release();
}

uint64_t sub_1C7B79B40()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)(v0 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  sub_1C7B7A4F4();
  os_unfair_lock_unlock(v1);

  return swift_release();
}

void sub_1C7B79B9C(void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3)
{
  os_log_type_t v5 = v3;
  uint64_t v65 = a3;
  uint64_t v62 = a2;
  unint64_t v69 = a1;
  uint64_t v6 = sub_1C7B7B100();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v67 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1C7B7B130();
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x1F4188790](v68);
  uint64_t v64 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_1C7B7B0F0();
  uint64_t v61 = *(void *)(v59 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v59);
  uint64_t v60 = (uint64_t)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (uint64_t *)((char *)&v55 - v12);
  uint64_t v14 = sub_1C7B7B150();
  os_log_t v71 = *(os_log_t *)(v14 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v63 = (char *)&v55 - v18;
  uint64_t v19 = sub_1C7B7B340();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  int64_t v22 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v5[6] + 16));
  if ((uint64_t)v5[4] >= 1)
  {
    uint64_t v70 = v14;
    uint64_t v23 = (*(uint64_t (**)(void))(*v5 + 232))();
    uint64_t v24 = v5[4];
    BOOL v25 = __OFSUB__(v24, 1);
    uint64_t v26 = v24 - 1;
    if (v25)
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = v23;
      uint64_t v58 = v6;
      v5[4] = v26;
      if (qword_1EBC5E820 == -1)
      {
LABEL_4:
        uint64_t v27 = sub_1C7B7B090();
        __swift_project_value_buffer(v27, (uint64_t)qword_1EBC5DC50);
        uint64_t v28 = sub_1C7B7B080();
        os_log_type_t v29 = sub_1C7B7B2D0();
        BOOL v30 = os_log_type_enabled(v28, v29);
        uint64_t v57 = v7;
        if (v30)
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 134349056;
          aBlock[0] = v4;
          sub_1C7B7B3A0();
          _os_log_impl(&dword_1C7B37000, v28, v29, "Retry timer will fire in %{public}llus", v31, 0xCu);
          MEMORY[0x1C87BC480](v31, -1, -1);
        }

        sub_1C7B7AAE4();
        aBlock[0] = MEMORY[0x1E4FBC860];
        sub_1C7B7AB24();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4F9728);
        sub_1C7B7AB7C();
        sub_1C7B7B3D0();
        uint64_t v32 = sub_1C7B7B350();
        (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
        sub_1C7B7B140();
        if ((v4 & 0x8000000000000000) == 0)
        {
          *uint64_t v13 = v4;
          uint64_t v33 = *MEMORY[0x1E4FBCAE8];
          uint64_t v34 = v61;
          uint64_t v35 = v59;
          uint64_t v36 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v61 + 104);
          v36(v13, v33, v59);
          uint64_t v56 = v5;
          uint64_t v37 = v32;
          unint64_t v38 = v63;
          MEMORY[0x1C87BB980](v17, v13);
          os_log_type_t v39 = *(void (**)(uint64_t *, uint64_t))(v34 + 8);
          v39(v13, v35);
          Class isa = v71[1].isa;
          ++v71;
          unint64_t v69 = (void (*)(char *, uint64_t))isa;
          ((void (*)(char *, uint64_t))isa)(v17, v70);
          uint64_t ObjectType = swift_getObjectType();
          *uint64_t v13 = 10;
          v36(v13, v33, v35);
          unint64_t v42 = v38;
          uint64_t v43 = v37;
          uint64_t v44 = v60;
          sub_1C7B7114C(v60);
          MEMORY[0x1C87BBBA0](v42, v44, v13, ObjectType);
          v39((uint64_t *)v44, v35);
          v39(v13, v35);
          uint64_t v45 = (void *)swift_allocObject();
          uint64_t v46 = v56;
          uint64_t v47 = v62;
          void v45[2] = v56;
          v45[3] = v47;
          v45[4] = v65;
          aBlock[4] = sub_1C7B7AC18;
          aBlock[5] = v45;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1C7B50CB8;
          aBlock[3] = &block_descriptor_2;
          uint64_t v48 = _Block_copy(aBlock);
          swift_retain();
          swift_retain();
          int64_t v49 = v64;
          sub_1C7B71568();
          uint64_t v50 = v67;
          sub_1C7B7156C();
          sub_1C7B7B360();
          _Block_release(v48);
          (*(void (**)(char *, uint64_t))(v57 + 8))(v50, v58);
          (*(void (**)(char *, uint64_t))(v66 + 8))(v49, v68);
          swift_release();
          v46[5] = v43;
          swift_unknownObjectRetain();
          swift_unknownObjectRelease();
          if (v46[5])
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            sub_1C7B7B380();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            v69(v42, v70);
          }
          else
          {
            v69(v42, v70);
            swift_unknownObjectRelease();
          }
          return;
        }
        __break(1u);
        goto LABEL_19;
      }
    }
    swift_once();
    goto LABEL_4;
  }
  if (qword_1EBC5E820 != -1) {
LABEL_19:
  }
    swift_once();
  uint64_t v51 = sub_1C7B7B090();
  __swift_project_value_buffer(v51, (uint64_t)qword_1EBC5DC50);
  os_log_t v71 = (os_log_t)sub_1C7B7B080();
  os_log_type_t v52 = sub_1C7B7B2C0();
  if (os_log_type_enabled(v71, v52))
  {
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v53 = 0;
    _os_log_impl(&dword_1C7B37000, v71, v52, "Exhausted retry attempts; will not try again", v53, 2u);
    MEMORY[0x1C87BC480](v53, -1, -1);
  }
  os_log_t v54 = v71;
}

void sub_1C7B7A404()
{
  uint64_t v1 = v0;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(void *)(v0 + 48) + 16));
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C7B7B090();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EBC5DC50);
  uint64_t v3 = sub_1C7B7B080();
  os_log_type_t v4 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_1C7B37000, v3, v4, "Resetting retry timer", v5, 2u);
    MEMORY[0x1C87BC480](v5, -1, -1);
  }

  *(void *)(v1 + 32) = *(void *)(v1 + 16);
}

void sub_1C7B7A4F4()
{
  uint64_t v1 = v0;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(void *)(v0 + 48) + 16));
  if (*(void *)(v0 + 40))
  {
    if (qword_1EBC5E820 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1C7B7B090();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EBC5DC50);
    uint64_t v3 = sub_1C7B7B080();
    os_log_type_t v4 = sub_1C7B7B2D0();
    if (os_log_type_enabled(v3, v4))
    {
      os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v5 = 0;
      _os_log_impl(&dword_1C7B37000, v3, v4, "Cancelling retry timer", v5, 2u);
      MEMORY[0x1C87BC480](v5, -1, -1);
    }

    if (*(void *)(v1 + 40))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1C7B7B370();
      swift_unknownObjectRelease();
    }
    *(void *)(v1 + 40) = 0;
    swift_unknownObjectRelease();
  }
}

uint64_t CustomizableRetryTimer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = 0;
  *(void *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C7B7BDF0;
  *(_OWORD *)(v0 + 32) = xmmword_1C7B7BEA0;
  return v0;
}

void *CustomizableRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = (void *)swift_allocObject();
  v4[5] = 0;
  type metadata accessor for UnfairLock();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = 0;
  v4[6] = v5;
  uint64_t v4[2] = a1;
  v4[3] = a2;
  v4[4] = a1;
  return v4;
}

uint64_t sub_1C7B7A738(uint64_t a1, uint64_t (*a2)(BOOL))
{
  os_log_type_t v4 = *(os_unfair_lock_s **)(*(void *)(a1 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_1C7B7A7BC(a1, &v6);
  os_unfair_lock_unlock(v4);
  swift_release();
  return a2(v6);
}

void sub_1C7B7A7BC(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (__OFSUB__(*(void *)(a1 + 16), v3))
  {
    __break(1u);
  }
  else if (qword_1EBC5E820 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v4 = sub_1C7B7B090();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC5DC50);
  uint64_t v5 = sub_1C7B7B080();
  os_log_type_t v6 = sub_1C7B7B2D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134349056;
    sub_1C7B7B3A0();
    _os_log_impl(&dword_1C7B37000, v5, v6, "Retry timer fired (attempt #%{public}ld)", v7, 0xCu);
    MEMORY[0x1C87BC480](v7, -1, -1);
  }

  sub_1C7B7A4F4();
  *a2 = v3 == 0;
}

uint64_t CustomizableRetryTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_1C7B7A94C(uint64_t a1, uint64_t a2)
{
  return sub_1C7B7A97C(a1, a2, sub_1C7B7A4F4);
}

uint64_t sub_1C7B7A964(uint64_t a1, uint64_t a2)
{
  return sub_1C7B7A97C(a1, a2, sub_1C7B7A404);
}

uint64_t sub_1C7B7A97C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = *(os_unfair_lock_s **)(*(void *)(v3 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v5);
  a3();
  os_unfair_lock_unlock(v5);

  return swift_release();
}

uint64_t sub_1C7B7A9E0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t type metadata accessor for CustomizableRetryTimer()
{
  return self;
}

uint64_t method lookup function for CustomizableRetryTimer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CustomizableRetryTimer);
}

uint64_t dispatch thunk of CustomizableRetryTimer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.start(queue:handler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.secondsUntilNextFireTime()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

unint64_t sub_1C7B7AAE4()
{
  unint64_t result = qword_1EA4F9718;
  if (!qword_1EA4F9718)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA4F9718);
  }
  return result;
}

unint64_t sub_1C7B7AB24()
{
  unint64_t result = qword_1EA4F9720;
  if (!qword_1EA4F9720)
  {
    sub_1C7B7B340();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9720);
  }
  return result;
}

unint64_t sub_1C7B7AB7C()
{
  unint64_t result = qword_1EA4F9730;
  if (!qword_1EA4F9730)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA4F9728);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4F9730);
  }
  return result;
}

uint64_t sub_1C7B7ABD8()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C7B7AC18()
{
  return sub_1C7B7A738(*(void *)(v0 + 16), *(uint64_t (**)(BOOL))(v0 + 24));
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

uint64_t sub_1C7B7AC3C()
{
  MEMORY[0x1C87BC480](*(void *)(v0 + 16), -1, -1);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnfairLock()
{
  return self;
}

uint64_t sub_1C7B7ACA0()
{
  uint64_t v0 = sub_1C7B7B030();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C7B7B090();
  __swift_allocate_value_buffer(v4, qword_1EBC5DC50);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC5DC50);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F17F78], v0);
  return sub_1C7B7B070();
}

uint64_t static Logger.syncEngine.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBC5E820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C7B7B090();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBC5DC50);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
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

uint64_t sub_1C7B7AEB0()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C7B7AEC0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C7B7AED0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C7B7AEE0()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1C7B7AEF0()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1C7B7AF00()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1C7B7AF10()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1C7B7AF20()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1C7B7AF30()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1C7B7AF40()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C7B7AF50()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1C7B7AF60()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1C7B7AF70()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C7B7AF80()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1C7B7AF90()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C7B7AFA0()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1C7B7AFB0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1C7B7AFC0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1C7B7AFD0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1C7B7AFE0()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1C7B7AFF0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C7B7B000()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C7B7B010()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C7B7B020()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C7B7B030()
{
  return MEMORY[0x1F40D3790]();
}

uint64_t sub_1C7B7B040()
{
  return MEMORY[0x1F414AA18]();
}

uint64_t sub_1C7B7B050()
{
  return MEMORY[0x1F414AA20]();
}

uint64_t sub_1C7B7B060()
{
  return MEMORY[0x1F414AA28]();
}

uint64_t sub_1C7B7B070()
{
  return MEMORY[0x1F40D39A0]();
}

uint64_t sub_1C7B7B080()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C7B7B090()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C7B7B0A0()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1C7B7B0B0()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1C7B7B0C0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1C7B7B0D0()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1C7B7B0E0()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1C7B7B0F0()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C7B7B100()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C7B7B110()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C7B7B120()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C7B7B130()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C7B7B140()
{
  return MEMORY[0x1F4186E70]();
}

uint64_t sub_1C7B7B150()
{
  return MEMORY[0x1F4186E80]();
}

uint64_t sub_1C7B7B160()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1C7B7B170()
{
  return MEMORY[0x1F4186F20]();
}

uint64_t sub_1C7B7B180()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1C7B7B190()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C7B7B1A0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C7B7B1B0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C7B7B1C0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C7B7B1D0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C7B7B1E0()
{
  return MEMORY[0x1F40E62E8]();
}

uint64_t sub_1C7B7B1F0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C7B7B200()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C7B7B210()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C7B7B220()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C7B7B230()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C7B7B240()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C7B7B250()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C7B7B260()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C7B7B270()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C7B7B280()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C7B7B290()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C7B7B2A0()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1C7B7B2B0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C7B7B2C0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C7B7B2D0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C7B7B2E0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C7B7B2F0()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1C7B7B300()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C7B7B310()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1C7B7B320()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C7B7B330()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C7B7B340()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1C7B7B350()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1C7B7B360()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1C7B7B370()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1C7B7B380()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1C7B7B390()
{
  return MEMORY[0x1F41872B8]();
}

uint64_t sub_1C7B7B3A0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C7B7B3B0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C7B7B3D0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C7B7B3E0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C7B7B3F0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1C7B7B400()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1C7B7B410()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1C7B7B420()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C7B7B430()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C7B7B440()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C7B7B450()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C7B7B460()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C7B7B470()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C7B7B480()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C7B7B490()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C7B7B4A0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C7B7B4B0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C7B7B4C0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C7B7B4D0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C7B7B4E0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C7B7B4F0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C7B7B500()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C7B7B510()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C7B7B520()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C7B7B530()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C7B7B540()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C7B7B550()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C7B7B560()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C7B7B570()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C7B7B580()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C7B7B590()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C7B7B5A0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C7B7B5B0()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C7B7B5C0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C7B7B5D0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C7B7B5E0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C7B7B5F0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C7B7B600()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C7B7B610()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C7B7B620()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C7B7B630()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C7B7B640()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C7B7B650()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C7B7B660()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C7B7B670()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C7B7B680()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C7B7B690()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C7B7B6A0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1F4122BD0]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1F4122C08]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x1F412F960]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x1F412F968]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}