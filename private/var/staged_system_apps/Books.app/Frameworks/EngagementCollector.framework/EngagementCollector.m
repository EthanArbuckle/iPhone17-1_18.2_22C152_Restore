unint64_t PropertyType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

BOOL sub_4F34(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_4F48()
{
  Swift::UInt v1 = *v0;
  sub_386D0();
  sub_386E0(v1);
  return sub_386F0();
}

void sub_4F90()
{
  sub_386E0(*v0);
}

Swift::Int sub_4FBC()
{
  Swift::UInt v1 = *v0;
  sub_386D0();
  sub_386E0(v1);
  return sub_386F0();
}

uint64_t *sub_5000@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_501C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t BasePropertyConfiguration.eventName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_eventName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BasePropertyConfiguration.recordType.getter()
{
  return *(void *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_recordType);
}

uint64_t BasePropertyConfiguration.ageToExpire.getter()
{
  return *(void *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire);
}

uint64_t BasePropertyConfiguration.countLimit.getter()
{
  return *(void *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_countLimit);
}

uint64_t BasePropertyConfiguration.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BasePropertyConfiguration.shouldBeCached.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached);
}

uint64_t BasePropertyConfiguration.shouldBeSynced.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced);
}

id BasePropertyConfiguration.__allocating_init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  v18 = objc_allocWithZone(v9);
  v19 = &v18[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  void *v19 = a1;
  v19[1] = a2;
  *(void *)&v18[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = a3;
  v20 = &v18[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  void *v20 = a4;
  v20[1] = a5;
  *(void *)&v18[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a7;
  *(void *)&v18[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a6;
  v18[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a8;
  v18[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a9;
  v22.receiver = v18;
  v22.super_class = v9;
  return [super init];
}

id BasePropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  v10 = &v9[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  void *v10 = a1;
  v10[1] = a2;
  *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = a3;
  v11 = &v9[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  void *v11 = a4;
  v11[1] = a5;
  *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a7;
  *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a6;
  v9[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a8;
  v9[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a9;
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

uint64_t type metadata accessor for BasePropertyConfiguration()
{
  return self;
}

uint64_t sub_5398(uint64_t a1)
{
  sub_5500(a1, (uint64_t)v10);
  if (!v11)
  {
    sub_55AC((uint64_t)v10);
    goto LABEL_20;
  }
  type metadata accessor for BasePropertyConfiguration();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_20:
    char v7 = 0;
    return v7 & 1;
  }
  BOOL v2 = *(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_eventName) == *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_eventName]
    && *(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8) == *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_eventName
                                                                                               + 8];
  if (!v2 && (sub_38620() & 1) == 0
    || *(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_recordType) != *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_recordType]
    || *(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire) != *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire]
    || *(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_countLimit) != *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_countLimit])
  {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_identifier + 8);
  uint64_t v4 = *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_identifier + 8];
  if (v3)
  {
    if (v4
      && (*(void *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_identifier) == *(void *)&v9[OBJC_IVAR___BMBasePropertyConfiguration_identifier]
       && v3 == v4
       || (sub_38620() & 1) != 0))
    {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if (v4)
  {
LABEL_19:

    goto LABEL_20;
  }
LABEL_16:
  char v5 = *(unsigned char *)(v1 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced);
  char v6 = v9[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced];

  char v7 = v5 ^ v6 ^ 1;
  return v7 & 1;
}

uint64_t sub_5500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_466E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_5568(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_55AC(uint64_t a1)
{
  uint64_t v2 = sub_5568(&qword_466E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_5684()
{
  return v0;
}

id BaseDonor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void BasePropertyConfiguration.init()()
{
}

id BasePropertyConfiguration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  [super dealloc];
}

id CounterPropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v11 = objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  void *v12 = a1;
  v12[1] = a2;
  *(void *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 0;
  objc_super v13 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *objc_super v13 = 0;
  v13[1] = 0;
  *(void *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

id CounterPropertyConfiguration.init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  char v6 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *char v6 = a1;
  v6[1] = a2;
  *(void *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 0;
  char v7 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *char v7 = 0;
  v7[1] = 0;
  *(void *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

void CounterPropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
}

id StatePropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v11 = objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  void *v12 = a1;
  v12[1] = a2;
  *(void *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 1;
  objc_super v13 = &v11[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *objc_super v13 = 0;
  v13[1] = 0;
  *(void *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&v11[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v11[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

id StatePropertyConfiguration.init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  char v6 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  *char v6 = a1;
  v6[1] = a2;
  *(void *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 1;
  char v7 = &v5[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  *char v7 = 0;
  v7[1] = 0;
  *(void *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&v5[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a3;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a4;
  v5[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

void StatePropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
}

id CollectionPropertyConfiguration.__allocating_init(eventName:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char a8)
{
  v17 = objc_allocWithZone(v8);
  v18 = &v17[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  void *v18 = a1;
  v18[1] = a2;
  *(void *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 2;
  v19 = &v17[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  void *v19 = a3;
  v19[1] = a4;
  *(void *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a6;
  *(void *)&v17[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a5;
  v17[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a7;
  v17[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a8;
  v21.receiver = v17;
  v21.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

id CollectionPropertyConfiguration.init(eventName:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, char a8)
{
  objc_super v9 = &v8[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  void *v9 = a1;
  v9[1] = a2;
  *(void *)&v8[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = 2;
  v10 = &v8[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
  void *v10 = a3;
  v10[1] = a4;
  *(void *)&v8[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = a6;
  *(void *)&v8[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = a5;
  v8[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = a7;
  v8[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = a8;
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for BasePropertyConfiguration();
  return [super init];
}

void CollectionPropertyConfiguration.init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
}

void sub_5C84()
{
}

id _s19EngagementCollector31CollectionPropertyConfigurationCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

unint64_t sub_5CEC()
{
  unint64_t result = qword_466E8;
  if (!qword_466E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_466E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PropertyType()
{
  return &type metadata for PropertyType;
}

uint64_t method lookup function for BasePropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for BasePropertyConfiguration);
}

uint64_t dispatch thunk of BasePropertyConfiguration.__allocating_init(eventName:recordType:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of BasePropertyConfiguration.toBaseConfiguration()()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))();
}

uint64_t type metadata accessor for CounterPropertyConfiguration()
{
  return self;
}

uint64_t method lookup function for CounterPropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CounterPropertyConfiguration);
}

uint64_t dispatch thunk of CounterPropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t type metadata accessor for StatePropertyConfiguration()
{
  return self;
}

uint64_t method lookup function for StatePropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for StatePropertyConfiguration);
}

uint64_t dispatch thunk of StatePropertyConfiguration.__allocating_init(eventName:ageToExpire:shouldBeCached:shouldBeSynced:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t type metadata accessor for CollectionPropertyConfiguration()
{
  return self;
}

uint64_t method lookup function for CollectionPropertyConfiguration(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CollectionPropertyConfiguration);
}

uint64_t dispatch thunk of CollectionPropertyConfiguration.__allocating_init(eventName:identifier:ageToExpire:countLimit:shouldBeCached:shouldBeSynced:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_46850)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_46850);
    }
  }
}

BOOL static PropertyError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void PropertyError.hash(into:)()
{
  sub_386E0(*v0);
}

Swift::Int PropertyError.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  sub_386D0();
  sub_386E0(v1);
  return sub_386F0();
}

Swift::Int sub_5F8C()
{
  Swift::UInt v1 = *v0;
  sub_386D0();
  sub_386E0(v1);
  return sub_386F0();
}

uint64_t sub_5FE0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [*a1 createdAt];
  if (v3)
  {
    uint64_t v4 = v3;
    sub_37F00();

    uint64_t v5 = sub_37F20();
    char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_37F20();
    char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

void sub_60A8(uint64_t a1, void **a2)
{
  sub_5568(&qword_46AD0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_F2BC(a1, (uint64_t)v5, &qword_46AD0);
  char v6 = *a2;
  uint64_t v7 = sub_37F20();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = sub_37EC0().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  [v6 setCreatedAt:isa];
}

void sub_61DC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 data];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_37EB0();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_6244(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  if (*(void *)(a1 + 8) >> 60 == 15) {
    Class isa = 0;
  }
  else {
    Class isa = sub_37EA0().super.isa;
  }
  Class v4 = isa;
  [v2 setData:];
}

void sub_62BC(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_380C0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_6320(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    NSString v7 = sub_380A0();
  }
  else {
    NSString v7 = 0;
  }
  id v8 = v7;
  [v6 *a5];
}

id CDCloudSyncVersions.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id CDProperty.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CDProperty();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for CDProperty()
{
  return self;
}

id CDProperty.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDProperty();
  return [super dealloc];
}

uint64_t sub_64FC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CDProperty();
  uint64_t result = sub_384A0();
  *a1 = result;
  return result;
}

uint64_t CDProperty.SpecialPlistKeys.init(rawValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_40D80;
  v8._object = a2;
  Swift::Int v6 = sub_385F0(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t CDProperty.SpecialPlistKeys.rawValue.getter()
{
  return 0x44497465737361;
}

uint64_t static CDMutableCloudSyncVersions.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Int sub_65B4()
{
  return sub_386F0();
}

uint64_t sub_6608()
{
  return sub_38100();
}

Swift::Int sub_6620()
{
  return sub_386F0();
}

uint64_t sub_6670@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  id v3 = (void *)a1[1];
  v4._rawValue = &off_40DB8;
  v7._object = v3;
  Swift::Int v5 = sub_385F0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_66C4(void *a1@<X8>)
{
  *a1 = 0x44497465737361;
  a1[1] = 0xE700000000000000;
}

uint64_t static CDProperty.fetchState(_:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_75F0(a1, a2, a3, a4, a5, (void (*)(uint64_t, void, uint64_t, uint64_t))sub_66F8);
}

void sub_66F8(unint64_t a1, char a2, void (*a3)(unint64_t *))
{
  if (a2)
  {
    unint64_t v20 = a1;
    long long v21 = 0u;
    long long v22 = 0u;
    __int16 v23 = 256;
    swift_errorRetain();
    a3(&v20);
    sub_F3B4(a1, 1);
    return;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_38590()) {
      goto LABEL_4;
    }
LABEL_21:
    sub_F3B4(a1, 0);
    sub_C414();
    uint64_t v17 = swift_allocError();
    unsigned char *v18 = 1;
    unint64_t v20 = v17;
    long long v21 = 0u;
    long long v22 = 0u;
    __int16 v23 = 256;
    a3(&v20);
    swift_errorRelease();
    return;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_21;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v6 = (id)sub_384C0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(a1 + 32);
  }
  id v19 = v6;
  sub_F3B4(a1, 0);
  uint64_t v7 = sub_8990();
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v19 identifier];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_380C0();
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v13 = 0;
    }
    unint64_t v16 = sub_8C88(v8);
    swift_bridgeObjectRelease();
    unint64_t v20 = v11;
    *(void *)&long long v21 = v13;
    long long v22 = 0uLL;
    *((void *)&v21 + 1) = v16;
    __int16 v23 = 1;
    a3(&v20);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_C414();
    uint64_t v14 = swift_allocError();
    *objc_super v15 = 0;
    unint64_t v20 = v14;
    long long v21 = 0u;
    long long v22 = 0u;
    __int16 v23 = 256;
    a3(&v20);
    swift_errorRelease();
  }
}

uint64_t static CDProperty.fetchCollectionValues(_:assetIDs:sortByCreatedAt:limit:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, void (*a7)(char *, void), uint64_t a8)
{
  sub_5568(&qword_468C0);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_39610;
  *(void *)(v16 + 32) = 7955819;
  *(void *)(v16 + 40) = 0xE300000000000000;
  *(void *)(v16 + 88) = &type metadata for String;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = a1;
  *(void *)(v16 + 72) = a2;
  swift_retain_n();
  swift_bridgeObjectRetain();
  NSString v17 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v19 = [self predicateWithFormat:v17 argumentArray:isa];

  sub_992C(v19, 0, 0, a3, a4, a5, a6, a7, a8);
  return swift_release_n();
}

uint64_t sub_6B30(unint64_t a1, char a2, void (*a3)(char *, void), uint64_t a4)
{
  if ((a2 & 1) == 0)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_38590();
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_4:
        if (v7 < 1) {
          __break(1u);
        }
        uint64_t v45 = a4;
        v46 = a3;
        uint64_t v8 = 0;
        id v9 = (char *)&_swiftEmptyArrayStorage;
        uint64_t v47 = v7;
        do
        {
          if ((a1 & 0xC000000000000001) != 0) {
            id v10 = (id)sub_384C0();
          }
          else {
            id v10 = *(id *)(a1 + 8 * v8 + 32);
          }
          uint64_t v11 = v10;
          id v12 = [v10 data:v45, v46];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = sub_37EB0();
            unint64_t v16 = v15;

            NSString v17 = self;
            Class isa = sub_37EA0().super.isa;
            v49[0] = 0;
            id v19 = [v17 JSONObjectWithData:isa options:0 error:v49];

            if (v19)
            {
              id v20 = v49[0];
              sub_38440();
              swift_unknownObjectRelease();
              sub_5568(&qword_46980);
              if (swift_dynamicCast())
              {
                sub_F3D4(v14, v16);
                id v21 = [v11 identifier];
                if (v21)
                {
                  long long v22 = v21;
                  uint64_t v23 = sub_380C0();
                  uint64_t v25 = v24;
                }
                else
                {
                  uint64_t v23 = 0;
                  uint64_t v25 = 0;
                }
                id v35 = [v11 assetID];
                if (v35)
                {
                  v36 = v35;
                  uint64_t v37 = sub_380C0();
                  uint64_t v39 = v38;
                }
                else
                {
                  uint64_t v37 = 0;
                  uint64_t v39 = 0;
                }
                unint64_t v40 = sub_8C88(v48);

                swift_bridgeObjectRelease();
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  id v9 = sub_28E00(0, *((void *)v9 + 2) + 1, 1, v9);
                }
                unint64_t v42 = *((void *)v9 + 2);
                unint64_t v41 = *((void *)v9 + 3);
                if (v42 >= v41 >> 1) {
                  id v9 = sub_28E00((char *)(v41 > 1), v42 + 1, 1, v9);
                }
                *((void *)v9 + 2) = v42 + 1;
                v43 = &v9[48 * v42];
                *((void *)v43 + 4) = v23;
                *((void *)v43 + 5) = v25;
                *((void *)v43 + 6) = v37;
                *((void *)v43 + 7) = v39;
                *((void *)v43 + 8) = v40;
                v43[72] = 2;
                uint64_t v7 = v47;
              }
              else
              {
                if (qword_466A0 != -1) {
                  swift_once();
                }
                uint64_t v31 = sub_37F50();
                sub_C3DC(v31, (uint64_t)qword_47A80);
                v32 = sub_37F30();
                os_log_type_t v33 = sub_38270();
                if (os_log_type_enabled(v32, v33))
                {
                  v34 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v34 = 0;
                  _os_log_impl(&dword_0, v32, v33, "Tried to convert a Property to a StatePropertyValue but data can't be deserialized to a valid state value", v34, 2u);
                  swift_slowDealloc();
                }
                sub_F3D4(v14, v16);
              }
            }
            else
            {
              id v30 = v49[0];
              sub_37E30();

              swift_willThrow();
              sub_F3D4(v14, v16);
              swift_errorRelease();
            }
          }
          else
          {
            if (qword_466A0 != -1) {
              swift_once();
            }
            uint64_t v26 = sub_37F50();
            sub_C3DC(v26, (uint64_t)qword_47A80);
            v27 = sub_37F30();
            os_log_type_t v28 = sub_38270();
            if (os_log_type_enabled(v27, v28))
            {
              v29 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_0, v27, v28, "Tried to convert a Property to a StatePropertyValue without data", v29, 2u);
              swift_slowDealloc();
            }
          }
          ++v8;
        }
        while (v7 != v8);
        sub_F3B4(a1, 0);
        v46(v9, 0);
        return swift_bridgeObjectRelease();
      }
    }
    sub_F3B4(a1, 0);
    a3((char *)&_swiftEmptyArrayStorage, 0);
    return swift_bridgeObjectRelease();
  }
  swift_errorRetain();
  a3((char *)a1, 1);

  return sub_F3B4(a1, 1);
}

uint64_t sub_70A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_8990();
  if (result)
  {
    uint64_t v4 = result;
    id v5 = [v1 identifier];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = sub_380C0();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    id v14 = [v1 assetID];
    if (v14)
    {
      unint64_t v15 = v14;
      uint64_t v10 = sub_380C0();
      uint64_t v11 = v16;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    unint64_t v12 = sub_8C88(v4);
    uint64_t result = swift_bridgeObjectRelease();
    char v13 = 2;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    char v13 = -1;
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v12;
  *(unsigned char *)(a1 + 40) = v13;
  return result;
}

uint64_t static CDProperty.fetchCollectionValue(_:identifier:assetIDs:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5568(&qword_468C0);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_39610;
  *(void *)(v16 + 32) = 7955819;
  *(void *)(v16 + 40) = 0xE300000000000000;
  *(void *)(v16 + 88) = &type metadata for String;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = a1;
  *(void *)(v16 + 72) = a2;
  swift_retain_n();
  swift_bridgeObjectRetain();
  NSString v17 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v19 = [self predicateWithFormat:v17 argumentArray:isa];

  sub_A13C(v19, a3, a4, a5, 0, 1, a6, a7, a8, (void (*)(uint64_t, void, uint64_t, uint64_t))sub_7328);
  return swift_release_n();
}

uint64_t sub_7328(unint64_t a1, char a2, void (*a3)(unint64_t *))
{
  if ((a2 & 1) == 0)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_38590();
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      uint64_t result = swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v7 = (id)sub_384C0();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
            return result;
          }
          id v7 = *(id *)(a1 + 32);
        }
        uint64_t v8 = v7;
        sub_F3B4(a1, 0);
        uint64_t v9 = sub_8990();
        if (v9)
        {
          uint64_t v10 = v9;
          id v11 = [v8 identifier];
          if (v11)
          {
            unint64_t v12 = v11;
            uint64_t v13 = sub_380C0();
            uint64_t v15 = v14;
          }
          else
          {
            uint64_t v13 = 0;
            uint64_t v15 = 0;
          }
          unint64_t v18 = sub_8C88(v10);
          swift_bridgeObjectRelease();
          unint64_t v21 = v13;
          *(void *)&long long v22 = v15;
          long long v23 = 0uLL;
          *((void *)&v22 + 1) = v18;
          __int16 v24 = 1;
          a3(&v21);
          swift_bridgeObjectRelease();

          return swift_bridgeObjectRelease();
        }
        sub_C414();
        uint64_t v16 = swift_allocError();
        unsigned char *v17 = 0;
        unint64_t v21 = v16;
        long long v22 = 0u;
        long long v23 = 0u;
        __int16 v24 = 256;
        a3(&v21);

        goto LABEL_20;
      }
    }
    sub_F3B4(a1, 0);
    sub_C414();
    uint64_t v19 = swift_allocError();
    unsigned char *v20 = 1;
    unint64_t v21 = v19;
    long long v22 = 0u;
    long long v23 = 0u;
    __int16 v24 = 256;
    a3(&v21);
LABEL_20:
    return swift_errorRelease();
  }
  unint64_t v21 = a1;
  long long v22 = 0u;
  long long v23 = 0u;
  __int16 v24 = 256;
  swift_errorRetain();
  a3(&v21);

  return sub_F3B4(a1, 1);
}

uint64_t static CDProperty.fetchCounter(_:context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_75F0(a1, a2, a3, a4, a5, (void (*)(uint64_t, void, uint64_t, uint64_t))sub_774C);
}

uint64_t sub_75F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, void, uint64_t, uint64_t))
{
  sub_5568(&qword_468C0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_39610;
  *(void *)(v12 + 32) = 7955819;
  *(void *)(v12 + 40) = 0xE300000000000000;
  *(void *)(v12 + 88) = &type metadata for String;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = a1;
  *(void *)(v12 + 72) = a2;
  swift_retain_n();
  swift_bridgeObjectRetain();
  NSString v13 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v15 = [self predicateWithFormat:v13 argumentArray:isa];

  sub_A13C(v15, 0, 0, 0, 0, 1, a3, a4, a5, a6);
  return swift_release_n();
}

void sub_774C(unint64_t a1, char a2, void (*a3)(id *))
{
  if (a2)
  {
    id v10 = (id)a1;
    long long v11 = 0u;
    long long v12 = 0u;
    __int16 v13 = 256;
    swift_errorRetain();
    a3(&v10);
    sub_F3B4(a1, 1);
    return;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_38590()) {
      goto LABEL_4;
    }
LABEL_14:
    sub_F3B4(a1, 0);
    sub_C414();
    uint64_t v7 = swift_allocError();
    unsigned char *v8 = 1;
    id v10 = (id)v7;
    long long v11 = 0u;
    long long v12 = 0u;
    __int16 v13 = 256;
    a3(&v10);
    swift_errorRelease();
    return;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_14;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v6 = (id)sub_384C0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(a1 + 32);
  }
  id v9 = v6;
  sub_F3B4(a1, 0);
  id v10 = [v9 count];
  long long v11 = 0u;
  long long v12 = 0u;
  __int16 v13 = 0;
  a3(&v10);
}

uint64_t CDProperty.toValue(recordType:completion:)(uint64_t a1, void (*a2)(uint64_t *))
{
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      uint64_t v4 = sub_8990();
      if (v4)
      {
        uint64_t v5 = v4;
        id v6 = [v2 identifier];
        if (v6)
        {
          uint64_t v7 = v6;
          id v8 = (id)sub_380C0();
          uint64_t v10 = v9;
        }
        else
        {
          id v8 = 0;
          uint64_t v10 = 0;
        }
        unint64_t v12 = sub_8C88(v5);
        swift_bridgeObjectRelease();
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        unsigned __int8 v11 = 1;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    if (a1)
    {
      uint64_t result = sub_38650();
      __break(1u);
      return result;
    }
    id v8 = [v2 count];
    uint64_t v10 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    unsigned __int8 v11 = 0;
LABEL_17:
    uint64_t v28 = (uint64_t)v8;
    *(void *)&long long v29 = v10;
    *((void *)&v29 + 1) = v12;
    *(void *)&long long v30 = v13;
    *((void *)&v30 + 1) = v14;
    __int16 v31 = v11;
    a2(&v28);
    return sub_C468((uint64_t)v8, v10, v12, v13, v14, v11);
  }
  sub_70A8((uint64_t)v25);
  sub_C374((uint64_t)v25, (uint64_t)v26);
  unsigned __int8 v11 = v27;
  if (v27 != 255)
  {
    id v8 = (id)v26[0];
    uint64_t v10 = v26[1];
    unint64_t v12 = v26[2];
    uint64_t v13 = v26[3];
    uint64_t v14 = v26[4];
    goto LABEL_17;
  }
LABEL_10:
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_37F50();
  sub_C3DC(v15, (uint64_t)qword_47A80);
  uint64_t v16 = sub_37F30();
  os_log_type_t v17 = sub_38270();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v18 = 138412290;
    sub_C414();
    swift_allocError();
    unsigned char *v20 = 1;
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v28 = v21;
    sub_38420();
    void *v19 = v21;
    _os_log_impl(&dword_0, v16, v17, "Could not fetch. %@", v18, 0xCu);
    sub_5568(&qword_46CE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_C414();
  uint64_t v22 = swift_allocError();
  *long long v23 = 1;
  uint64_t v28 = v22;
  long long v29 = 0u;
  long long v30 = 0u;
  __int16 v31 = 256;
  a2(&v28);
  return swift_errorRelease();
}

id sub_7C64(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    id v8 = a1;
  }
  else
  {
    uint64_t v10 = self;
    NSString v11 = sub_380A0();
    id v12 = [v10 entityForName:v11 inManagedObjectContext:a5];

    if (!v12) {
      return 0;
    }
    id v8 = [objc_allocWithZone((Class)type metadata accessor for CDProperty()) initWithEntity:v12 insertIntoManagedObjectContext:a5];
  }
  id v13 = a1;
  Class isa = sub_37EC0().super.isa;
  [v8 setCreatedAt:isa];

  id v15 = [a2 eventName];
  [v8 setKey:v15];

  sub_F320(a4, (uint64_t)&v42);
  if (v47)
  {
    if (v47 == 1)
    {
      uint64_t v16 = v43;
      uint64_t v17 = v44;
      uint64_t v18 = *(void *)(v44 + 16);
      swift_bridgeObjectRetain();
      if (v18
        && (unint64_t v19 = sub_1A978(0x44497465737361, 0xE700000000000000), (v20 & 1) != 0)
        && (sub_F498(*(void *)(v17 + 56) + 32 * v19, (uint64_t)v40),
            sub_5568(&qword_46970),
            (swift_dynamicCast() & 1) != 0))
      {
        NSString v21 = sub_380A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v21 = 0;
      }
      [v8 setAssetID:v21];

      uint64_t v24 = sub_E39C(a4);
      if (v25 >> 60 == 15)
      {
        Class v26 = 0;
      }
      else
      {
        uint64_t v27 = v24;
        unint64_t v28 = v25;
        Class v26 = sub_37EA0().super.isa;
        sub_F3C0(v27, v28);
      }
      [v8 setData:v26];

      if (v16) {
        goto LABEL_33;
      }
LABEL_31:
      NSString v38 = [a2 identifier];
      if (!v38)
      {
LABEL_34:
        [v8 setIdentifier:v38];

        return v8;
      }
      sub_380C0();

LABEL_33:
      NSString v38 = sub_380A0();
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    uint64_t v22 = v43;
    if (v45)
    {
      v40[4] = v44;
      uint64_t v41 = v45;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v29 = v46;
      uint64_t v30 = *(void *)(v46 + 16);
      swift_bridgeObjectRetain();
      if (!v30
        || (unint64_t v31 = sub_1A978(0x44497465737361, 0xE700000000000000), (v32 & 1) == 0)
        || (sub_F498(*(void *)(v29 + 56) + 32 * v31, (uint64_t)v40),
            sub_5568(&qword_46970),
            (swift_dynamicCast() & 1) == 0)
        || !v41)
      {
        swift_bridgeObjectRetain();
        NSString v23 = 0;
LABEL_27:
        [v8 setAssetID:v23];

        uint64_t v33 = sub_E39C(a4);
        if (v34 >> 60 == 15)
        {
          Class v35 = 0;
        }
        else
        {
          uint64_t v36 = v33;
          unint64_t v37 = v34;
          Class v35 = sub_37EA0().super.isa;
          sub_F3C0(v36, v37);
        }
        [v8 setData:v35];

        if (v22) {
          goto LABEL_33;
        }
        goto LABEL_31;
      }
    }
    swift_bridgeObjectRetain();
    NSString v23 = sub_380A0();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  [v8 setCount:v42];
  return v8;
}

uint64_t sub_8084(unint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t), uint64_t a8)
{
  v93[1] = a8;
  v94 = a7;
  uint64_t v103 = a6;
  v97 = a4;
  uint64_t v95 = a3;
  uint64_t v11 = sub_37F20();
  id v12 = *(void (***)(char *, uint64_t))(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5568(&qword_46950);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v105 = (uint64_t)v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = v14;
  uint64_t v98 = v11;
  uint64_t v99 = v16;
  v100 = v12;
  v101 = v18;
  if (a2)
  {
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_37F50();
    sub_C3DC(v58, (uint64_t)qword_47A80);
    v59 = sub_37F30();
    os_log_type_t v60 = sub_38260();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_0, v59, v60, "No existing record, creating new one", v61, 2u);
      uint64_t v14 = v106;
      swift_slowDealloc();
    }
  }
  else
  {
    if (a1 >> 62) {
      goto LABEL_49;
    }
    uint64_t v19 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    for (; v19; uint64_t v19 = sub_38590())
    {
      uint64_t v96 = a5;
      unint64_t v104 = a1 & 0xC000000000000001;
      char v20 = &_swiftEmptyDictionarySingleton;
      a5 = 4;
      unint64_t v102 = a1;
      uint64_t v21 = v19;
      while (1)
      {
        uint64_t v24 = v20;
        uint64_t v14 = (char *)(a5 - 4);
        id v25 = v104 ? (id)sub_384C0() : *(id *)(a1 + 8 * a5);
        Class v26 = v25;
        uint64_t v27 = a5 - 3;
        if (__OFADD__(v14, 1)) {
          break;
        }
        id v28 = [v25 identifier];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v14 = (char *)sub_380C0();
          a1 = v30;

          id v31 = v26;
          char v32 = v24;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v108[0] = v32;
          unint64_t v35 = sub_1A978((uint64_t)v14, a1);
          uint64_t v36 = v32[2];
          BOOL v37 = (v34 & 1) == 0;
          uint64_t v38 = v36 + v37;
          if (__OFADD__(v36, v37)) {
            goto LABEL_45;
          }
          uint64_t v11 = v34;
          if (v32[3] >= v38)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              char v20 = (void *)v108[0];
              if ((v34 & 1) == 0) {
                goto LABEL_26;
              }
            }
            else
            {
              sub_1C4DC();
              char v20 = (void *)v108[0];
              if ((v11 & 1) == 0) {
                goto LABEL_26;
              }
            }
          }
          else
          {
            sub_1B100(v38, isUniquelyReferenced_nonNull_native);
            unint64_t v39 = sub_1A978((uint64_t)v14, a1);
            if ((v11 & 1) != (v40 & 1)) {
              goto LABEL_79;
            }
            unint64_t v35 = v39;
            char v20 = (void *)v108[0];
            if ((v11 & 1) == 0)
            {
LABEL_26:
              v20[(v35 >> 6) + 8] |= 1 << v35;
              v52 = (char **)(v20[6] + 16 * v35);
              *v52 = v14;
              v52[1] = (char *)a1;
              *(void *)(v20[7] + 8 * v35) = v31;
              uint64_t v53 = v20[2];
              BOOL v54 = __OFADD__(v53, 1);
              uint64_t v55 = v53 + 1;
              if (v54) {
                goto LABEL_46;
              }
              goto LABEL_33;
            }
          }
        }
        else
        {
          id v41 = [v26 key];
          if (!v41)
          {

            uint64_t v14 = v106;
            char v20 = v24;
            goto LABEL_7;
          }
          uint64_t v42 = v41;
          uint64_t v14 = (char *)sub_380C0();
          a1 = v43;

          id v31 = v26;
          uint64_t v44 = v24;
          char v45 = swift_isUniquelyReferenced_nonNull_native();
          v108[0] = v44;
          unint64_t v35 = sub_1A978((uint64_t)v14, a1);
          uint64_t v47 = v44[2];
          BOOL v48 = (v46 & 1) == 0;
          uint64_t v49 = v47 + v48;
          if (__OFADD__(v47, v48)) {
            goto LABEL_47;
          }
          uint64_t v11 = v46;
          if (v44[3] >= v49)
          {
            if (v45)
            {
              char v20 = (void *)v108[0];
              if ((v46 & 1) == 0) {
                goto LABEL_32;
              }
            }
            else
            {
              sub_1C4DC();
              char v20 = (void *)v108[0];
              if ((v11 & 1) == 0) {
                goto LABEL_32;
              }
            }
          }
          else
          {
            sub_1B100(v49, v45);
            unint64_t v50 = sub_1A978((uint64_t)v14, a1);
            if ((v11 & 1) != (v51 & 1))
            {
LABEL_79:
              uint64_t result = sub_38660();
              __break(1u);
              return result;
            }
            unint64_t v35 = v50;
            char v20 = (void *)v108[0];
            if ((v11 & 1) == 0)
            {
LABEL_32:
              v20[(v35 >> 6) + 8] |= 1 << v35;
              v56 = (char **)(v20[6] + 16 * v35);
              *v56 = v14;
              v56[1] = (char *)a1;
              *(void *)(v20[7] + 8 * v35) = v31;
              uint64_t v57 = v20[2];
              BOOL v54 = __OFADD__(v57, 1);
              uint64_t v55 = v57 + 1;
              if (v54) {
                goto LABEL_48;
              }
LABEL_33:
              v20[2] = v55;
              swift_bridgeObjectRetain();
              goto LABEL_6;
            }
          }
        }
        uint64_t v22 = v20;
        uint64_t v23 = v20[7];

        *(void *)(v23 + 8 * v35) = v31;
        char v20 = v22;
LABEL_6:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v11 = v98;
        uint64_t v14 = v106;
        a1 = v102;
        uint64_t v19 = v21;
LABEL_7:
        ++a5;
        if (v27 == v19)
        {
          sub_F3B4(a1, 0);
          a5 = v96;
          goto LABEL_52;
        }
      }
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      swift_bridgeObjectRetain();
    }
    sub_F3B4(a1, 0);
  }
  char v20 = &_swiftEmptyDictionarySingleton;
LABEL_52:
  uint64_t v62 = *(void *)(v95 + 16);
  v63 = v97;
  if (!v62)
  {
    swift_bridgeObjectRelease();
    return v94(0, 0);
  }
  unint64_t v104 = (unint64_t)v20;
  uint64_t v64 = v105 + *(int *)(v99 + 48);
  uint64_t v65 = v95 + ((*((unsigned __int8 *)v101 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v101 + 80));
  v66 = v101[9];
  v101 = (void (**)(char *, uint64_t, uint64_t))(v100 + 4);
  unint64_t v102 = (unint64_t)v66;
  ++v100;
  swift_bridgeObjectRetain();
  uint64_t v99 = 0;
  do
  {
    uint64_t v67 = v105;
    sub_F2BC(v65, v105, &qword_46950);
    sub_F320(v64, (uint64_t)v107);
    (*v101)(v14, v67, v11);
    if ([v63 recordType] == (char *)&dword_0 + 2)
    {
      sub_F320((uint64_t)v107, (uint64_t)v108);
      if (v109 == 2)
      {
        uint64_t v68 = v108[1];
        uint64_t v96 = v108[0];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v69 = v68;
        swift_bridgeObjectRelease();
        uint64_t v11 = v98;
        v63 = v97;
        swift_bridgeObjectRelease();
        if (v69)
        {
          unint64_t v70 = v104;
          if (*(void *)(v104 + 16))
          {
            unint64_t v71 = sub_1A978(v96, v69);
            uint64_t v14 = v106;
            if (v72)
            {
              v73 = *(void **)(*(void *)(v70 + 56) + 8 * v71);
              id v74 = v73;
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
              v73 = 0;
            }
            goto LABEL_71;
          }
LABEL_69:
          swift_bridgeObjectRelease();
          v73 = 0;
          goto LABEL_70;
        }
      }
    }
    id v75 = [v63 identifier];
    if (v75)
    {
      v76 = v75;
      uint64_t v77 = sub_380C0();
      uint64_t v79 = v78;

      unint64_t v80 = v104;
      if (!*(void *)(v104 + 16)) {
        goto LABEL_69;
      }
      uint64_t v81 = v77;
    }
    else
    {
      id v82 = [v63 eventName];
      uint64_t v83 = sub_380C0();
      uint64_t v79 = v84;

      unint64_t v80 = v104;
      if (!*(void *)(v104 + 16)) {
        goto LABEL_69;
      }
      uint64_t v81 = v83;
    }
    unint64_t v85 = sub_1A978(v81, v79);
    if ((v86 & 1) == 0) {
      goto LABEL_69;
    }
    v73 = *(void **)(*(void *)(v80 + 56) + 8 * v85);
    id v87 = v73;
    swift_bridgeObjectRelease();
LABEL_70:
    uint64_t v14 = v106;
LABEL_71:
    v88 = (void *)((uint64_t (*)(void *, void *, char *, unsigned char *))a5)(v73, v63, v14, v107);
    sub_F37C((uint64_t)v107);

    if (v88)
    {
    }
    else
    {
      sub_C414();
      uint64_t v89 = swift_allocError();
      unsigned char *v90 = 0;
      swift_errorRelease();

      uint64_t v99 = v89;
    }
    (*v100)(v14, v11);
    v65 += v102;
    --v62;
  }
  while (v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v91 = v99;
  if (v99)
  {
    swift_errorRetain();
    v94(v91, 1);
    swift_errorRelease();
    return swift_errorRelease();
  }
  return v94(0, 0);
}

uint64_t sub_8990()
{
  id v1 = [v0 data];
  if (v1)
  {
    objc_super v2 = v1;
    uint64_t v3 = sub_37EB0();
    unint64_t v5 = v4;

    id v6 = self;
    Class isa = sub_37EA0().super.isa;
    v21[0] = 0;
    id v8 = [v6 JSONObjectWithData:isa options:0 error:v21];

    if (v8)
    {
      id v9 = v21[0];
      sub_38440();
      swift_unknownObjectRelease();
      sub_5568(&qword_46980);
      if (swift_dynamicCast())
      {
        sub_F3D4(v3, v5);
        return v20;
      }
      if (qword_466A0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_37F50();
      sub_C3DC(v16, (uint64_t)qword_47A80);
      uint64_t v17 = sub_37F30();
      os_log_type_t v18 = sub_38270();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_0, v17, v18, "Tried to convert a Property to a StatePropertyValue but data can't be deserialized to a valid state value", v19, 2u);
        swift_slowDealloc();
      }
      sub_F3D4(v3, v5);
    }
    else
    {
      id v15 = v21[0];
      sub_37E30();

      swift_willThrow();
      sub_F3D4(v3, v5);
      swift_errorRelease();
    }
  }
  else
  {
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_37F50();
    sub_C3DC(v11, (uint64_t)qword_47A80);
    id v12 = sub_37F30();
    os_log_type_t v13 = sub_38270();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "Tried to convert a Property to a StatePropertyValue without data", v14, 2u);
      swift_slowDealloc();
    }
  }
  return 0;
}

unint64_t sub_8C88(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_5568(&qword_46C90);
    objc_super v2 = (void *)sub_385D0();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  id v6 = v47;
  uint64_t v7 = v45;
  id v8 = &v41;
  id v9 = &v43;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v36 = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = v36 + 1;
  if (__OFADD__(v36, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v34) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v19);
  int64_t v21 = v36 + 1;
  if (!v20)
  {
    int64_t v21 = v36 + 2;
    if (v36 + 2 >= v34) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = v36 + 3;
      if (v36 + 3 >= v34) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v36 + 4;
        if (v36 + 4 >= v34) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = v36 + 5;
          if (v36 + 5 < v34)
          {
            unint64_t v20 = *(void *)(v35 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v36 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v34) {
                break;
              }
              unint64_t v20 = *(void *)(v35 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_C9E0();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v36 = v21;
  uint64_t v37 = (v20 - 1) & v20;
  for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v36 << 6))
  {
    uint64_t v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    sub_F498(*(void *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(void *)&long long v46 = v25;
    *((void *)&v46 + 1) = v24;
    v44[2] = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    uint64_t v39 = v25;
    uint64_t v40 = v24;
    sub_F488(v7, &v38);
    swift_bridgeObjectRetain();
    sub_5568(&qword_46970);
    swift_dynamicCast();
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    sub_F488(v8, v9);
    sub_F488(v9, v44);
    sub_F488(v44, &v42);
    unint64_t result = sub_1A978(v27, v26);
    unint64_t v28 = result;
    if (v29)
    {
      uint64_t v11 = v9;
      id v12 = v8;
      uint64_t v13 = v1;
      uint64_t v14 = v7;
      id v15 = v6;
      uint64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v16 = v27;
      v16[1] = v26;
      id v6 = v15;
      uint64_t v7 = v14;
      uint64_t v1 = v13;
      id v8 = v12;
      id v9 = v11;
      uint64_t v17 = (_OWORD *)(v2[7] + 32 * v28);
      sub_F4F4((uint64_t)v17);
      unint64_t result = (unint64_t)sub_F488(&v42, v17);
      unint64_t v5 = v37;
      if (!v37) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v30 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v30 = v27;
    v30[1] = v26;
    unint64_t result = (unint64_t)sub_F488(&v42, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_34;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
    if (!v37) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v37 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_9034(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_5568(&qword_46910);
    objc_super v2 = (void *)sub_385D0();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 8);
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_F498(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_F488(v38, v37);
    sub_5568(&qword_46970);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_F488(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_F488(v36, v37);
    sub_F488(v37, &v33);
    uint64_t result = sub_38470(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_F488(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_C9E0();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_942C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_5568(&qword_46910);
    objc_super v2 = (void *)sub_385D0();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 8);
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    uint64_t v19 = *(void **)(*(void *)(a1 + 56) + 8 * v12);
    *(void *)&v37[0] = *v17;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    v19;
    swift_dynamicCast();
    sub_F100(0, &qword_46918);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_F488(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_F488(v36, v37);
    sub_F488(v37, &v33);
    uint64_t result = sub_38470(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_F488(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_C9E0();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

double sub_97F0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1A978(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C4BC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_F488((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_358CC(v8, v11);
    *uint64_t v4 = v11;
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

void sub_98F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_992C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, void (*a8)(char *, void), uint64_t a9)
{
  id v15 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v16 = sub_380A0();
  id v17 = [v15 initWithEntityName:v16];

  [v17 setPredicate:a1];
  if (a3)
  {
    sub_5568(&qword_468C0);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_39610;
    *(void *)(v18 + 32) = 0x696669746E656469;
    *(void *)(v18 + 40) = 0xEA00000000007265;
    *(void *)(v18 + 88) = &type metadata for String;
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = a2;
    *(void *)(v18 + 72) = a3;
    swift_bridgeObjectRetain();
    NSString v19 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v21 = [self predicateWithFormat:v19 argumentArray:isa];
  }
  else
  {
    id v22 = a1;
  }
  sub_38150();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_381A0();
  }
  sub_381B0();
  sub_38190();
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_5568(&qword_46960);
    sub_F278(&qword_46968, &qword_46960);
    if (sub_38230())
    {
      sub_5568(&qword_468C0);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_39610;
      *(void *)(v24 + 32) = 0x44497465737361;
      *(void *)(v24 + 40) = 0xE700000000000000;
      *(void *)(v24 + 88) = v23;
      *(void *)(v24 + 56) = &type metadata for String;
      *(void *)(v24 + 64) = a4;
      NSString v25 = sub_380A0();
      Class v26 = sub_38160().super.isa;
      swift_bridgeObjectRelease();
      id v27 = [self predicateWithFormat:v25 argumentArray:v26];

      sub_38150();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_381A0();
      }
      sub_381B0();
      sub_38190();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_F100(0, &qword_46938);
  swift_bridgeObjectRetain();
  Class v28 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v29 = [self andPredicateWithSubpredicates:v28];

  [v17 setPredicate:v29];
  if (a5)
  {
    sub_5568(&qword_46920);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_39620;
    id v31 = objc_allocWithZone((Class)NSSortDescriptor);
    NSString v32 = sub_380A0();
    id v33 = [v31 initWithKey:v32 ascending:1];

    *(void *)(v30 + 32) = v33;
    sub_38190();
    sub_F100(0, &qword_46928);
    Class v34 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    [v17 setSortDescriptors:v34];
  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v17 setFetchLimit:a6];
  }
  type metadata accessor for CDProperty();
  unint64_t v35 = sub_383C0();
  swift_bridgeObjectRelease();
  sub_6B30(v35, 0, a8, a9);
  swift_bridgeObjectRelease();
}

void sub_A13C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, void, uint64_t, uint64_t))
{
  id v16 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v17 = sub_380A0();
  id v18 = [v16 initWithEntityName:v17];

  [v18 setPredicate:a1];
  if (a3)
  {
    sub_5568(&qword_468C0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_39610;
    *(void *)(v19 + 32) = 0x696669746E656469;
    *(void *)(v19 + 40) = 0xEA00000000007265;
    *(void *)(v19 + 88) = &type metadata for String;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 64) = a2;
    *(void *)(v19 + 72) = a3;
    swift_bridgeObjectRetain();
    NSString v20 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v22 = [self predicateWithFormat:v20 argumentArray:isa];
  }
  else
  {
    id v23 = a1;
  }
  sub_38150();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_381A0();
  }
  sub_381B0();
  sub_38190();
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_5568(&qword_46960);
    sub_F278(&qword_46968, &qword_46960);
    if (sub_38230())
    {
      sub_5568(&qword_468C0);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_39610;
      *(void *)(v25 + 32) = 0x44497465737361;
      *(void *)(v25 + 40) = 0xE700000000000000;
      *(void *)(v25 + 88) = v24;
      *(void *)(v25 + 56) = &type metadata for String;
      *(void *)(v25 + 64) = a4;
      NSString v26 = sub_380A0();
      Class v27 = sub_38160().super.isa;
      swift_bridgeObjectRelease();
      id v28 = [self predicateWithFormat:v26 argumentArray:v27];

      sub_38150();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_381A0();
      }
      sub_381B0();
      sub_38190();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_F100(0, &qword_46938);
  swift_bridgeObjectRetain();
  Class v29 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v30 = [self andPredicateWithSubpredicates:v29];

  [v18 setPredicate:v30];
  if (a5)
  {
    sub_5568(&qword_46920);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_39620;
    id v32 = objc_allocWithZone((Class)NSSortDescriptor);
    NSString v33 = sub_380A0();
    id v34 = [v32 initWithKey:v33 ascending:1];

    *(void *)(v31 + 32) = v34;
    sub_38190();
    sub_F100(0, &qword_46928);
    Class v35 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    [v18 setSortDescriptors:v35];
  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v18 setFetchLimit:a6];
  }
  type metadata accessor for CDProperty();
  uint64_t v36 = sub_383C0();
  swift_bridgeObjectRelease();
  a10(v36, 0, a8, a9);
  swift_bridgeObjectRelease();
}

void sub_A984(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_A9BC(void *a1, unint64_t a2, uint64_t a3)
{
  if (a2 >> 62) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_38590())
  {
    uint64_t v6 = 4;
    uint64_t v33 = v5;
    while (1)
    {
      id v7 = (a2 & 0xC000000000000001) != 0 ? (id)sub_384C0() : *(id *)(a2 + 8 * v6);
      unint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 key];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_380C0();
        uint64_t v14 = v13;

        if (*(void *)(a3 + 16) && (unint64_t v15 = sub_1A978(v12, v14), (v16 & 1) != 0))
        {
          uint64_t v17 = *(void *)(*(void *)(a3 + 56) + 8 * v15);
          swift_unknownObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v18 = sub_8990();
          if (v18)
          {
            uint64_t v19 = v18;
            id v20 = [v8 identifier];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = sub_380C0();
              uint64_t v36 = v23;
              uint64_t v37 = v22;
            }
            else
            {
              uint64_t v36 = 0;
              uint64_t v37 = 0;
            }
            id v24 = [v8 assetID];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = sub_380C0();
              uint64_t v34 = v27;
              uint64_t v35 = v26;
            }
            else
            {
              uint64_t v34 = 0;
              uint64_t v35 = 0;
            }
            unint64_t v28 = sub_8C88(v19);
            swift_bridgeObjectRelease();
            swift_unknownObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              a1 = sub_28F24(0, a1[2] + 1, 1, a1);
            }
            unint64_t v30 = a1[2];
            unint64_t v29 = a1[3];
            if (v30 >= v29 >> 1) {
              a1 = sub_28F24((void *)(v29 > 1), v30 + 1, 1, a1);
            }
            a1[2] = v30 + 1;
            uint64_t v31 = &a1[7 * v30];
            v31[4] = v17;
            v31[5] = v37;
            v31[6] = v36;
            v31[7] = v35;
            v31[8] = v34;
            v31[9] = v28;
            *((unsigned char *)v31 + 80) = 2;
          }

          swift_unknownObjectRelease();
          uint64_t v5 = v33;
        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
      else
      {
      }
      ++v6;
      if (v9 == v5) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
  }
LABEL_29:
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_AC60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, void (*a8)(void *, void), uint64_t a9, uint64_t a10)
{
  id v16 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v17 = sub_380A0();
  id v18 = [v16 initWithEntityName:v17];

  id v40 = v18;
  [v18 setPredicate:a1];
  if (a3)
  {
    sub_5568(&qword_468C0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_39610;
    *(void *)(v19 + 32) = 0x696669746E656469;
    *(void *)(v19 + 40) = 0xEA00000000007265;
    *(void *)(v19 + 88) = &type metadata for String;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 64) = a2;
    *(void *)(v19 + 72) = a3;
    swift_bridgeObjectRetain();
    NSString v20 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v22 = [self predicateWithFormat:v20 argumentArray:isa];
  }
  else
  {
    id v23 = a1;
  }
  sub_38150();
  if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_381A0();
  }
  sub_381B0();
  sub_38190();
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_5568(&qword_46960);
    sub_F278(&qword_46968, &qword_46960);
    if (sub_38230())
    {
      sub_5568(&qword_468C0);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_39610;
      *(void *)(v25 + 32) = 0x44497465737361;
      *(void *)(v25 + 40) = 0xE700000000000000;
      *(void *)(v25 + 88) = v24;
      *(void *)(v25 + 56) = &type metadata for String;
      *(void *)(v25 + 64) = a4;
      NSString v26 = sub_380A0();
      Class v27 = sub_38160().super.isa;
      swift_bridgeObjectRelease();
      id v28 = [self predicateWithFormat:v26 argumentArray:v27];

      sub_38150();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_381A0();
      }
      sub_381B0();
      sub_38190();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_F100(0, &qword_46938);
  swift_bridgeObjectRetain();
  Class v29 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v30 = [self andPredicateWithSubpredicates:v29];

  [v18 setPredicate:v30];
  if (a5)
  {
    sub_5568(&qword_46920);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_39620;
    id v32 = objc_allocWithZone((Class)NSSortDescriptor);
    NSString v33 = sub_380A0();
    id v34 = [v32 initWithKey:v33 ascending:1];

    *(void *)(v31 + 32) = v34;
    sub_38190();
    sub_F100(0, &qword_46928);
    Class v35 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    [v18 setSortDescriptors:v35];
  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v18 setFetchLimit:a6];
  }
  type metadata accessor for CDProperty();
  unint64_t v36 = sub_383C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_A9BC(_swiftEmptyArrayStorage, v36, a10);
  swift_bridgeObjectRelease();
  a8(v37, 0);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s19EngagementCollector10CDPropertyC21fetchCollectionValues22propertyConfigurations8assetIDs15sortByCreatedAt5limit7context10completionySayAA21PropertyConfiguration_pG_ShySSGSgSbSiSo22NSManagedObjectContextCys6ResultOySayAaK_p_AA0R5ValueOtGs5Error_pGctFZ_0(unint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(void *, void), uint64_t a7)
{
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_38590();
    if (v8) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v30 = swift_bridgeObjectRetain();
    uint64_t v31 = sub_1D178(v30);
    swift_bridgeObjectRelease();
    sub_5568(&qword_468C0);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_39610;
    *(void *)(v32 + 56) = &type metadata for String;
    *(void *)(v32 + 32) = 7955819;
    *(void *)(v32 + 40) = 0xE300000000000000;
    *(void *)(v32 + 88) = sub_5568(&qword_46948);
    *(void *)(v32 + 64) = v31;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain();
    NSString v33 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v35 = [self predicateWithFormat:v33 argumentArray:isa];

    sub_AC60(v35, 0, 0, a2, a3 & 1, a4, a5, a6, a7, (uint64_t)_swiftEmptyDictionarySingleton);
    swift_release();

    swift_release_n();
    return swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_26;
  }
LABEL_3:
  unint64_t v44 = v7 & 0xC000000000000001;
  uint64_t v9 = 4;
  unint64_t v43 = v7;
  while (1)
  {
    uint64_t v10 = v9 - 4;
    if (v44)
    {
      uint64_t v11 = (void *)sub_384C0();
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v10, 1)) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v11 = (void *)swift_unknownObjectRetain();
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v10, 1))
      {
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    uint64_t v13 = v11;
    id v14 = [v11 eventName];
    uint64_t v15 = sub_380C0();
    uint64_t v17 = v16;

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v7 = sub_1A978(v15, v17);
    uint64_t v20 = _swiftEmptyDictionarySingleton[2];
    BOOL v21 = (v19 & 1) == 0;
    uint64_t v22 = v20 + v21;
    if (__OFADD__(v20, v21)) {
      goto LABEL_23;
    }
    char v23 = v19;
    if (_swiftEmptyDictionarySingleton[3] < v22) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v19) {
        goto LABEL_4;
      }
    }
    else
    {
      sub_1C31C();
      if (v23)
      {
LABEL_4:
        *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v7) = v13;
        swift_unknownObjectRelease();
        goto LABEL_5;
      }
    }
LABEL_18:
    _swiftEmptyDictionarySingleton[(v7 >> 6) + 8] |= 1 << v7;
    NSString v26 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v7);
    *NSString v26 = v15;
    v26[1] = v17;
    *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v7) = v13;
    uint64_t v27 = _swiftEmptyDictionarySingleton[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_24;
    }
    _swiftEmptyDictionarySingleton[2] = v29;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v9;
    unint64_t v7 = v43;
    if (v12 == v8) {
      goto LABEL_26;
    }
  }
  sub_1AE0C(v22, isUniquelyReferenced_nonNull_native);
  unint64_t v24 = sub_1A978(v15, v17);
  if ((v23 & 1) == (v25 & 1))
  {
    unint64_t v7 = v24;
    if (v23) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  uint64_t result = sub_38660();
  __break(1u);
  return result;
}

void _s19EngagementCollector10CDPropertyC14fetchObjectIDs9startDate03endH010eventNames7context10completiony10Foundation0H0VSg_AMSaySSGSgSo09NSManagedE7ContextCys6ResultOySaySo0oE2IDCGs5Error_pGctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void), uint64_t a6)
{
  uint64_t v53 = a6;
  BOOL v54 = a5;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v50 = a2;
  sub_5568(&qword_46AD0);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = sub_37F20();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v49 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v48 - v16;
  id v18 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v19 = sub_380A0();
  id v55 = [v18 initWithEntityName:v19];

  unint64_t v57 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_F2BC(a1, (uint64_t)v11, &qword_46AD0);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v20(v11, 1, v12) == 1)
  {
    sub_F42C((uint64_t)v11, &qword_46AD0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v11, v12);
    sub_5568(&qword_468C0);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_39610;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 32) = 0x4164657461657263;
    *(void *)(v21 + 40) = 0xE900000000000074;
    *(void *)(v21 + 88) = v12;
    uint64_t v22 = sub_F13C((uint64_t *)(v21 + 64));
    (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(v22, v17, v12);
    NSString v23 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v25 = [self predicateWithFormat:v23 argumentArray:isa];

    sub_38150();
    if (*(void *)((char *)&dword_10 + (v57 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v57 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  sub_F2BC(v50, (uint64_t)v9, &qword_46AD0);
  if (v20(v9, 1, v12) == 1)
  {
    sub_F42C((uint64_t)v9, &qword_46AD0);
    NSString v26 = v55;
    uint64_t v27 = v51;
    BOOL v28 = objc_msgSend_setType_;
    if (!v51) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  uint64_t v29 = v49;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v49, v9, v12);
  sub_5568(&qword_468C0);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_39610;
  *(void *)(v30 + 56) = &type metadata for String;
  *(void *)(v30 + 32) = 0x4164657461657263;
  *(void *)(v30 + 40) = 0xE900000000000074;
  *(void *)(v30 + 88) = v12;
  uint64_t v31 = sub_F13C((uint64_t *)(v30 + 64));
  (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(v31, v29, v12);
  NSString v32 = sub_380A0();
  Class v33 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v34 = [self predicateWithFormat:v32 argumentArray:v33];

  sub_38150();
  NSString v26 = v55;
  if (*(void *)((char *)&dword_10 + (v57 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v57 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_381A0();
  sub_381B0();
  sub_38190();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v29, v12);
  uint64_t v27 = v51;
  BOOL v28 = objc_msgSend_setType_;
  if (v51)
  {
LABEL_12:
    sub_5568(&qword_468C0);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = *((_OWORD *)v28 + 97);
    *(void *)(v35 + 56) = &type metadata for String;
    *(void *)(v35 + 32) = 7955819;
    *(void *)(v35 + 40) = 0xE300000000000000;
    *(void *)(v35 + 88) = sub_5568(&qword_46948);
    *(void *)(v35 + 64) = v27;
    swift_bridgeObjectRetain();
    NSString v36 = sub_380A0();
    Class v37 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v38 = [self predicateWithFormat:v36 argumentArray:v37];

    sub_38150();
    if (*(void *)((char *)&dword_10 + (v57 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v57 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
  }
LABEL_15:
  sub_F100(0, &qword_46938);
  swift_bridgeObjectRetain();
  Class v39 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v40 = [self andPredicateWithSubpredicates:v39];

  [v26 setPredicate:v40];
  id v41 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v42 = sub_380A0();
  id v43 = [v41 initWithKey:v42 ascending:1];

  sub_5568(&qword_46920);
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_39620;
  *(void *)(v44 + 32) = v43;
  uint64_t v56 = v44;
  sub_38190();
  sub_F100(0, &qword_46928);
  id v45 = v43;
  Class v46 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  [v26 setSortDescriptors:v46];

  [v26 setResultType:1];
  sub_F100(0, &qword_46940);
  uint64_t v47 = sub_383C0();
  swift_bridgeObjectRelease();
  v54(v47, 0);
  swift_bridgeObjectRelease();
}

uint64_t sub_C374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_468C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C3DC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_C414()
{
  unint64_t result = qword_468D0;
  if (!qword_468D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_468D0);
  }
  return result;
}

uint64_t sub_C468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 != 1)
  {
    if (a6 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

unint64_t sub_C4E0()
{
  unint64_t result = qword_468D8;
  if (!qword_468D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_468D8);
  }
  return result;
}

void *sub_C534()
{
  return &protocol witness table for ObjectIdentifier;
}

unint64_t sub_C544()
{
  unint64_t result = qword_468E0;
  if (!qword_468E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_468E0);
  }
  return result;
}

const char *sub_C598()
{
  return "count";
}

id sub_C5A4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 count];
  *a2 = result;
  return result;
}

id sub_C5D8(void *a1, id *a2)
{
  return [*a2 setCount:*a1];
}

const char *sub_C5EC()
{
  return "createdAt";
}

const char *sub_C600()
{
  return "data";
}

const char *sub_C614()
{
  return "identifier";
}

void sub_C620(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_C640(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

const char *sub_C660()
{
  return "key";
}

void sub_C66C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_C68C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

const char *sub_C6AC()
{
  return "assetID";
}

void sub_C6B8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_C6D8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

unsigned char *initializeBufferWithCopyOfBuffer for PropertyError(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PropertyError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PropertyError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0xC864);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_C88C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_C894(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PropertyError()
{
  return &type metadata for PropertyError;
}

uint64_t getEnumTagSinglePayload for CDProperty.SpecialPlistKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CDProperty.SpecialPlistKeys(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0xC9A0);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C9C8()
{
  return 0;
}

ValueMetadata *type metadata accessor for CDProperty.SpecialPlistKeys()
{
  return &type metadata for CDProperty.SpecialPlistKeys;
}

uint64_t sub_C9E0()
{
  return swift_release();
}

void sub_C9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void (*a7)(uint64_t, uint64_t *, uint64_t), uint64_t a8, uint64_t a9, uint64_t a10)
{
  v61 = a7;
  uint64_t v62 = a8;
  v59 = a5;
  uint64_t v60 = a6;
  uint64_t v57 = a3;
  uint64_t v58 = a4;
  uint64_t v56 = a2;
  uint64_t v11 = sub_5568(&qword_46AD0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v53 - v15;
  uint64_t v17 = sub_37F20();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  BOOL v54 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v53 - v21;
  id v23 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v24 = sub_380A0();
  id v63 = [v23 initWithEntityName:v24];

  unint64_t v65 = (unint64_t)_swiftEmptyArrayStorage;
  sub_F2BC(a1, (uint64_t)v16, &qword_46AD0);
  id v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v55(v16, 1, v17) == 1)
  {
    sub_F42C((uint64_t)v16, &qword_46AD0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v22, v16, v17);
    sub_5568(&qword_468C0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_39610;
    *(void *)(v25 + 56) = &type metadata for String;
    *(void *)(v25 + 32) = 0x4164657461657263;
    *(void *)(v25 + 40) = 0xE900000000000074;
    *(void *)(v25 + 88) = v17;
    NSString v26 = sub_F13C((uint64_t *)(v25 + 64));
    (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 16))(v26, v22, v17);
    NSString v27 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v29 = [self predicateWithFormat:v27 argumentArray:isa];

    sub_38150();
    if (*(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v65 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  }
  sub_F2BC(v56, (uint64_t)v14, &qword_46AD0);
  unsigned int v30 = v55(v14, 1, v17);
  uint64_t v31 = v63;
  if (v30 == 1)
  {
    sub_F42C((uint64_t)v14, &qword_46AD0);
    uint64_t v32 = v57;
    p_attr = (char **)(&stru_44FF8 + 8);
  }
  else
  {
    id v34 = v54;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v54, v14, v17);
    sub_5568(&qword_468C0);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_39610;
    *(void *)(v35 + 56) = &type metadata for String;
    *(void *)(v35 + 32) = 0x4164657461657263;
    *(void *)(v35 + 40) = 0xE900000000000074;
    *(void *)(v35 + 88) = v17;
    NSString v36 = sub_F13C((uint64_t *)(v35 + 64));
    (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 16))(v36, v34, v17);
    NSString v37 = sub_380A0();
    Class v38 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    p_attr = &stru_44FF8.attr;
    id v39 = [self predicateWithFormat:v37 argumentArray:v38];

    sub_38150();
    if (*(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v65 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v34, v17);
    uint64_t v32 = v57;
    uint64_t v31 = v63;
  }
  uint64_t v57 = a10;
  if (v32)
  {
    sub_5568(&qword_468C0);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_39610;
    *(void *)(v40 + 56) = &type metadata for String;
    *(void *)(v40 + 32) = 7955819;
    *(void *)(v40 + 40) = 0xE300000000000000;
    *(void *)(v40 + 88) = sub_5568(&qword_46948);
    *(void *)(v40 + 64) = v32;
    swift_bridgeObjectRetain();
    NSString v41 = sub_380A0();
    Class v42 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v43 = [self p_attr[167] v41, v42];

    sub_38150();
    if (*(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v65 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
  }
  sub_F100(0, &qword_46938);
  swift_bridgeObjectRetain();
  Class v44 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v45 = [self andPredicateWithSubpredicates:v44];

  [v31 setPredicate:v45];
  id v46 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v47 = sub_380A0();
  id v48 = [v46 initWithKey:v47 ascending:1];

  sub_5568(&qword_46920);
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_39620;
  *(void *)(v49 + 32) = v48;
  uint64_t v64 = v49;
  sub_38190();
  sub_F100(0, &qword_46928);
  id v50 = v48;
  Class v51 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  [v31 setSortDescriptors:v51];

  [v31 setResultType:1];
  sub_F100(0, &qword_46940);
  unint64_t v52 = sub_383C0();
  swift_bridgeObjectRelease();
  sub_27DB0(v52, 0, v59, v60, v61, v62, a9, v57);
  swift_bridgeObjectRelease();
}

void sub_D50C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t), uint64_t a13)
{
  id v19 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v20 = sub_380A0();
  id v21 = [v19 initWithEntityName:v20];

  [v21 setPredicate:a1];
  if (a3)
  {
    sub_5568(&qword_468C0);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_39610;
    *(void *)(v22 + 32) = 0x696669746E656469;
    *(void *)(v22 + 40) = 0xEA00000000007265;
    *(void *)(v22 + 88) = &type metadata for String;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = a2;
    *(void *)(v22 + 72) = a3;
    swift_bridgeObjectRetain();
    NSString v23 = sub_380A0();
    Class isa = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    id v25 = [self predicateWithFormat:v23 argumentArray:isa];
  }
  else
  {
    id v26 = a1;
  }
  sub_38150();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_381A0();
  }
  sub_381B0();
  sub_38190();
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_5568(&qword_46960);
    sub_F278(&qword_46968, &qword_46960);
    if (sub_38230())
    {
      sub_5568(&qword_468C0);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_39610;
      *(void *)(v28 + 32) = 0x44497465737361;
      *(void *)(v28 + 40) = 0xE700000000000000;
      *(void *)(v28 + 88) = v27;
      *(void *)(v28 + 56) = &type metadata for String;
      *(void *)(v28 + 64) = a4;
      NSString v29 = sub_380A0();
      Class v30 = sub_38160().super.isa;
      swift_bridgeObjectRelease();
      id v31 = [self predicateWithFormat:v29 argumentArray:v30];

      sub_38150();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_381A0();
      }
      sub_381B0();
      sub_38190();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_F100(0, &qword_46938);
  swift_bridgeObjectRetain();
  Class v32 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v33 = [self andPredicateWithSubpredicates:v32];

  [v21 setPredicate:v33];
  if (a5)
  {
    sub_5568(&qword_46920);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_39620;
    id v35 = objc_allocWithZone((Class)NSSortDescriptor);
    NSString v36 = sub_380A0();
    id v37 = [v35 initWithKey:v36 ascending:1];

    *(void *)(v34 + 32) = v37;
    sub_38190();
    sub_F100(0, &qword_46928);
    Class v38 = sub_38160().super.isa;
    swift_bridgeObjectRelease();
    [v21 setSortDescriptors:v38];
  }
  if (a6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v21 setFetchLimit:a6];
  }
  type metadata accessor for CDProperty();
  unint64_t v39 = sub_383C0();
  swift_bridgeObjectRelease();
  sub_8084(v39, 0, a8, a9, a10, a11, a12, a13);
  swift_bridgeObjectRelease();
}

uint64_t sub_DD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t), uint64_t a12)
{
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v18 = sub_5568(&qword_46948);
  sub_F278(&qword_46958, &qword_46948);
  char v19 = sub_38230();
  sub_5568(&qword_468C0);
  if (v19)
  {
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_39630;
    *(void *)(v20 + 32) = 7955819;
    *(void *)(v20 + 40) = 0xE300000000000000;
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = a1;
    *(void *)(v20 + 72) = a2;
    *(void *)(v20 + 88) = &type metadata for String;
    *(void *)(v20 + 96) = 0x696669746E656469;
    *(void *)(v20 + 104) = 0xEA00000000007265;
    *(void *)(v20 + 152) = v18;
    *(void *)(v20 + 120) = &type metadata for String;
    *(void *)(v20 + 128) = a3;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_39610;
    *(void *)(v23 + 32) = 7955819;
    *(void *)(v23 + 40) = 0xE300000000000000;
    *(void *)(v23 + 88) = &type metadata for String;
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = a1;
    *(void *)(v23 + 72) = a2;
  }
  swift_bridgeObjectRetain();
  NSString v21 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v24 = [self predicateWithFormat:v21 argumentArray:isa];

  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_D50C(v24, 0, 0, a4, 0, a5, a6, a7, a8, a9, a10, a11, a12);

  swift_bridgeObjectRelease_n();
  swift_unknownObjectRelease_n();
  swift_release_n();
  return swift_release_n();
}

uint64_t sub_E050(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v13;
  *(void *)(v13 + 16) = a3;
  uint64_t v15 = *(void *)(a1 + 16);
  if (!v15)
  {
    swift_unknownObjectRetain();
    id v34 = a3;
    NSString v21 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v33 = (uint64_t)a3;
    goto LABEL_19;
  }
  uint64_t v40 = v13;
  id v43 = v12;
  uint64_t v16 = sub_5568(&qword_46950);
  unint64_t v17 = a1
      + ((*(unsigned __int8 *)(*(void *)(v16 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80));
  uint64_t v18 = a1;
  uint64_t v19 = *(void *)(*(void *)(v16 - 8) + 72);
  swift_unknownObjectRetain_n();
  uint64_t v41 = (uint64_t)a3;
  id v20 = a3;
  uint64_t v42 = v18;
  swift_bridgeObjectRetain();
  NSString v21 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    unint64_t v22 = v17 + *(int *)(v16 + 48);
    uint64_t v23 = *(void *)v22;
    uint64_t v24 = *(void *)(v22 + 8);
    int v25 = *(unsigned __int8 *)(v22 + 40);
    if ([(id)swift_unknownObjectRetain() recordType] == (char *)&dword_0 + 2 && v25 == 2)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      if (!v24) {
        goto LABEL_4;
      }
    }
    else
    {
      id v27 = [a2 identifier];
      if (!v27)
      {
        swift_unknownObjectRelease();
        goto LABEL_4;
      }
      uint64_t v28 = v27;
      uint64_t v23 = sub_380C0();
      uint64_t v24 = v29;
      swift_unknownObjectRelease();
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      NSString v21 = sub_28F38(0, *((void *)v21 + 2) + 1, 1, v21);
    }
    unint64_t v31 = *((void *)v21 + 2);
    unint64_t v30 = *((void *)v21 + 3);
    if (v31 >= v30 >> 1) {
      NSString v21 = sub_28F38((char *)(v30 > 1), v31 + 1, 1, v21);
    }
    *((void *)v21 + 2) = v31 + 1;
    Class v32 = &v21[16 * v31];
    *((void *)v32 + 4) = v23;
    *((void *)v32 + 5) = v24;
LABEL_4:
    v17 += v19;
    --v15;
  }
  while (v15);
  swift_unknownObjectRelease();
  a1 = v42;
  swift_bridgeObjectRelease();
  uint64_t v12 = v43;
  uint64_t v14 = v40;
  uint64_t v33 = v41;
LABEL_19:
  swift_unknownObjectRelease();
  id v35 = [a2 eventName];
  uint64_t v36 = sub_380C0();
  uint64_t v38 = v37;

  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_DD68(v36, v38, (uint64_t)v21, 0, 0, v33, a1, a2, (uint64_t)sub_F228, v14, (uint64_t (*)(uint64_t, uint64_t))sub_F1E0, (uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release_n();
  return swift_release_n();
}

uint64_t sub_E39C(uint64_t a1)
{
  sub_F320(a1, (uint64_t)v18);
  uint64_t v1 = v19;
  if (v19)
  {
    uint64_t v16 = swift_bridgeObjectRetain();
    sub_97F0(0x44497465737361, 0xE700000000000000, v17);
    sub_F42C((uint64_t)v17, &qword_46978);
    sub_9034(v16);
    swift_bridgeObjectRelease();
    id v2 = objc_allocWithZone((Class)NSDictionary);
    Class isa = sub_38060().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 initWithDictionary:isa];

    uint64_t v5 = self;
    *(void *)&v17[0] = 0;
    id v6 = [v5 dataWithJSONObject:v4 options:1 error:v17];
    id v7 = *(id *)&v17[0];
    if (v6)
    {
      uint64_t v1 = sub_37EB0();
    }
    else
    {
      int v8 = v7;
      sub_37E30();

      swift_willThrow();
      if (qword_466A0 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_37F50();
      sub_C3DC(v9, (uint64_t)qword_47A80);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v10 = sub_37F30();
      os_log_type_t v11 = sub_38270();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(void *)&v17[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 136315138;
        swift_getErrorValue();
        uint64_t v13 = sub_38670();
        sub_2E85C(v13, v14, (uint64_t *)v17);
        sub_38420();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v10, v11, "Could not convert StatePropertyValue to a valid JSON data object: %s", v12, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      return 0;
    }
  }
  return v1;
}

uint64_t sub_E6F8(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v5 = sub_380A0();
  id v6 = [v4 initWithEntityName:v5];

  sub_5568(&qword_468C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_39610;
  *(void *)(v7 + 32) = 7955819;
  *(void *)(v7 + 40) = 0xE300000000000000;
  *(void *)(v7 + 88) = &type metadata for String;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = a1;
  *(void *)(v7 + 72) = a2;
  swift_bridgeObjectRetain();
  NSString v8 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [self predicateWithFormat:v8 argumentArray:isa];

  [v6 setPredicate:v10];
  id v11 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v12 = sub_380A0();
  id v13 = [v11 initWithKey:v12 ascending:1];

  sub_5568(&qword_46920);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_39620;
  *(void *)(v14 + 32) = v13;
  sub_38190();
  sub_F100(0, &qword_46928);
  id v15 = v13;
  Class v16 = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  [v6 setSortDescriptors:v16];

  type metadata accessor for CDProperty();
  uint64_t v17 = sub_383C0();

  return v17;
}

uint64_t sub_EC44(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v5 = sub_380A0();
  id v6 = [v4 initWithEntityName:v5];

  sub_5568(&qword_468C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_39610;
  *(void *)(v7 + 32) = 7955819;
  *(void *)(v7 + 40) = 0xE300000000000000;
  *(void *)(v7 + 88) = &type metadata for String;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = a1;
  *(void *)(v7 + 72) = a2;
  swift_bridgeObjectRetain();
  NSString v8 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [self predicateWithFormat:v8 argumentArray:isa];

  [v6 setPredicate:v10];
  type metadata accessor for CDProperty();
  uint64_t v11 = sub_383B0();

  return v11;
}

uint64_t sub_F100(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_F13C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_F1A0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_F1E0(uint64_t a1, char a2)
{
  return sub_26D10(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(uint64_t, uint64_t))(v2 + 24));
}

uint64_t sub_F1F0()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_F228(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_7C64(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_F230(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_F278(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_F230(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_F2BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5568(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_F320(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_F37C(uint64_t a1)
{
  return a1;
}

uint64_t sub_F3B4(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_F3C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_F3D4(a1, a2);
  }
  return a1;
}

uint64_t sub_F3D4(uint64_t a1, unint64_t a2)
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

uint64_t sub_F42C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5568(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_F488(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_F498(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_F4F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id BMPropertyValue.__allocating_init(with:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_C374(a1, (uint64_t)v6);
  if (v6[40] == 255)
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    sub_F320((uint64_t)v6, (uint64_t)v7);
    sub_F320((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
    v5.receiver = v3;
    v5.super_class = v1;
    return [super init];
  }
}

id BMPropertyValue.init(with:)(uint64_t a1)
{
  sub_C374(a1, (uint64_t)v4);
  if (v4[40] == 255)
  {
    type metadata accessor for BMPropertyValue();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    sub_F320((uint64_t)v4, (uint64_t)v5);
    sub_F320((uint64_t)v5, (uint64_t)v1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
    v3.receiver = v1;
    v3.super_class = (Class)type metadata accessor for BMPropertyValue();
    return [super init];
  }
}

uint64_t type metadata accessor for BMPropertyValue()
{
  return self;
}

void BMPropertyValue.init()()
{
}

id BMPropertyValue.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMPropertyValue();
  [super dealloc];
}

uint64_t PropertyValue.description.getter()
{
  sub_F320(v0, (uint64_t)v11);
  uint64_t v2 = v11[0];
  uint64_t v1 = (void *)v11[1];
  sub_F320(v0, (uint64_t)v17);
  if (!v18)
  {
    uint64_t v4 = (void *)0xE700000000000000;
    uint64_t v3 = 0x7265746E756F63;
    goto LABEL_13;
  }
  if (v18 == 1) {
    uint64_t v3 = 0x6574617473;
  }
  else {
    uint64_t v3 = 0x697463656C6C6F63;
  }
  if (v18 == 1) {
    uint64_t v4 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v4 = (void *)0xEA00000000006E6FLL;
  }
  if (!v1)
  {
LABEL_13:
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
    sub_38480(37);
    uint64_t v9 = v12;
    unint64_t v10 = v13;
    v24._object = (void *)0x800000000003AFD0;
    v24._countAndFlagsBits = 0xD000000000000015;
    sub_38120(v24);
    v25._countAndFlagsBits = v3;
    v25._object = v4;
    sub_38120(v25);
    swift_bridgeObjectRelease();
    v26._countAndFlagsBits = 0x6C6156776172202CLL;
    v26._object = (void *)0xEC000000203A6575;
    sub_38120(v26);
    sub_F320(v0, (uint64_t)&v12);
    if (v16)
    {
      if (v16 != 1) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v5 = v14;
      goto LABEL_16;
    }
LABEL_17:
    NSString v8 = &type metadata for Int;
    v7[0] = v12;
    goto LABEL_18;
  }
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_38480(53);
  uint64_t v9 = v12;
  unint64_t v10 = v13;
  v19._object = (void *)0x800000000003AFD0;
  v19._countAndFlagsBits = 0xD000000000000015;
  sub_38120(v19);
  v20._countAndFlagsBits = v3;
  v20._object = v4;
  sub_38120(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 0x69746E656469202CLL;
  v21._object = (void *)0xEE00203A72656966;
  sub_38120(v21);
  v22._countAndFlagsBits = v2;
  v22._object = v1;
  sub_38120(v22);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 0x6C6156776172202CLL;
  v23._object = (void *)0xEC000000203A6575;
  sub_38120(v23);
  sub_F320(v0, (uint64_t)&v12);
  if (!v16) {
    goto LABEL_17;
  }
  if (v16 == 1) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v5 = v15;
LABEL_16:
  NSString v8 = (void *)sub_5568(&qword_46990);
  v7[0] = v5;
  swift_bridgeObjectRetain();
LABEL_18:
  sub_38550();
  sub_F4F4((uint64_t)v7);
  return v9;
}

uint64_t PropertyValue.rawValue.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_F320(v1, (uint64_t)v6);
  if (v7)
  {
    if (v7 == 1) {
      uint64_t v4 = v6[2];
    }
    else {
      uint64_t v4 = v6[4];
    }
    a1[3] = sub_5568(&qword_46990);
    *a1 = v4;
    return swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = v6[0];
    a1[3] = &type metadata for Int;
    *a1 = v5;
  }
  return result;
}

uint64_t PropertyValue.assetID.getter()
{
  sub_F320(v0, (uint64_t)v3);
  if (v4 < 2u) {
    return 0;
  }
  uint64_t v1 = v3[2];
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_FABC()
{
  sub_F320(v0, (uint64_t)&v2);
  return PropertyValue.description.getter();
}

uint64_t method lookup function for BMPropertyValue(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for BMPropertyValue);
}

uint64_t dispatch thunk of BMPropertyValue.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  unsigned __int8 v4 = *(uint64_t (**)(_OWORD *))(v1 + 88);
  long long v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  uint64_t v8 = v2;
  char v9 = v3;
  return v4(v7);
}

uint64_t initializeBufferWithCopyOfBuffer for PropertyValue(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_FB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 != 1)
  {
    if (a6 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t destroy for PropertyValue(uint64_t a1)
{
  return sub_C468(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for PropertyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_FB8C(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for PropertyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_FB8C(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_C468(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 initializeWithTake for PropertyValue(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PropertyValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_C468(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for PropertyValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PropertyValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_FE1C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_FE24(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PropertyValue()
{
  return &type metadata for PropertyValue;
}

id sub_FE94()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDConfiguration();
  return [super dealloc];
}

uint64_t type metadata accessor for CDConfiguration()
{
  return self;
}

uint64_t sub_FEEC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CDConfiguration();
  uint64_t result = sub_384A0();
  *a1 = result;
  return result;
}

unint64_t sub_FF2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_5568(&qword_469F0);
  uint64_t v2 = sub_385D0();
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
    sub_11978(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1A978(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_F488(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_10058(void *a1, char a2, uint64_t a3, void *a4, void (*a5)(id, void))
{
  if (a2)
  {
    uint64_t v9 = self;
    NSString v10 = sub_380A0();
    id v11 = [v9 entityForName:v10 inManagedObjectContext:a3];

    if (!v11)
    {
      __break(1u);
      return;
    }
    id v7 = [objc_allocWithZone((Class)type metadata accessor for CDConfiguration()) initWithEntity:v11 insertIntoManagedObjectContext:a3];
  }
  else
  {
    id v7 = a1;
  }
  id v12 = [a4 eventName];
  [v7 setPropertyName:v12];

  [v7 setAgeToExpire:[a4 ageToExpire]];
  [v7 setCountLimit:[a4 countLimit]];
  [v7 setRecordType:[a4 recordType]];
  [v7 setShouldBeSynced:[a4 shouldBeSynced]];
  id v13 = v7;
  a5(v7, 0);
}

id sub_10230()
{
  uint64_t v1 = v0;
  id v2 = [v0 propertyName];
  if (v2)
  {
    unsigned int v3 = v2;
    uint64_t v4 = sub_380C0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = [v1 ageToExpire];
  id v8 = [v1 countLimit];
  id v9 = [v1 recordType];
  unsigned __int8 v10 = [v1 shouldBeSynced];
  if (v6)
  {
    if ((unint64_t)v9 < 3)
    {
      unsigned __int8 v11 = v10;
      id v12 = (objc_class *)type metadata accessor for BasePropertyConfiguration();
      id v13 = objc_allocWithZone(v12);
      uint64_t v14 = (uint64_t *)&v13[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
      *uint64_t v14 = v4;
      v14[1] = v6;
      *(void *)&v13[OBJC_IVAR___BMBasePropertyConfiguration_recordType] = v9;
      uint64_t v15 = &v13[OBJC_IVAR___BMBasePropertyConfiguration_identifier];
      *uint64_t v15 = 0;
      v15[1] = 0;
      *(void *)&v13[OBJC_IVAR___BMBasePropertyConfiguration_countLimit] = v8;
      *(void *)&v13[OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire] = v7;
      v13[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached] = 0;
      v13[OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced] = v11;
      v17.receiver = v13;
      v17.super_class = v12;
      return [super init];
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_103B4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_38590();
    swift_bridgeObjectRelease();
  }

  return sub_384D0();
}

void sub_10430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(id, void))
{
  id v10 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v11 = sub_380A0();
  id v29 = [v10 initWithEntityName:v11];

  sub_5568(&qword_468C0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_39610;
  strcpy((char *)(v12 + 32), "propertyName");
  *(unsigned char *)(v12 + 45) = 0;
  *(_WORD *)(v12 + 46) = -5120;
  *(void *)(v12 + 88) = &type metadata for String;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = a1;
  *(void *)(v12 + 72) = a2;
  swift_bridgeObjectRetain();
  NSString v13 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v15 = [self predicateWithFormat:v13 argumentArray:isa];

  [v29 setPredicate:v15];
  [v29 setFetchLimit:1];
  type metadata accessor for CDConfiguration();
  unint64_t v16 = sub_383C0();
  unint64_t v17 = v16;
  if (!(v16 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    sub_5568(&qword_469E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_398C0;
    *(void *)(inited + 32) = 0xD000000000000014;
    *(void *)(inited + 40) = 0x800000000003B0B0;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD000000000000017;
    *(void *)(inited + 56) = 0x800000000003B0D0;
    sub_FF2C(inited);
    id v23 = objc_allocWithZone((Class)NSError);
    NSString v24 = sub_380A0();
    Class v25 = sub_38060().super.isa;
    swift_bridgeObjectRelease();
    id v26 = [v23 initWithDomain:v24 code:1002 userInfo:v25];

    id v27 = v26;
    sub_10058(v26, 1, a4, a5, a6);

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_38590();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v17 & 0xC000000000000001) != 0)
  {
    id v18 = (id)sub_384C0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v18 = *(id *)(v17 + 32);
  }
  Swift::String v19 = v18;
  swift_bridgeObjectRelease();
  id v20 = v19;
  sub_10058(v19, 0, a4, a5, a6);
}

void sub_10AE0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(id, uint64_t))
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_380A0();
  id v9 = [v7 initWithEntityName:v8];

  sub_5568(&qword_468C0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_39610;
  strcpy((char *)(v10 + 32), "propertyName");
  *(unsigned char *)(v10 + 45) = 0;
  *(_WORD *)(v10 + 46) = -5120;
  *(void *)(v10 + 88) = &type metadata for String;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = a1;
  *(void *)(v10 + 72) = a2;
  swift_bridgeObjectRetain();
  NSString v11 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [self predicateWithFormat:v11 argumentArray:isa];

  [v9 setPredicate:v13];
  [v9 setFetchLimit:1];
  type metadata accessor for CDConfiguration();
  unint64_t v14 = sub_383C0();
  unint64_t v15 = v14;
  if (!(v14 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    sub_5568(&qword_469E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_398C0;
    *(void *)(inited + 32) = 0xD000000000000014;
    *(void *)(inited + 40) = 0x800000000003B0B0;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD000000000000017;
    *(void *)(inited + 56) = 0x800000000003B0D0;
    sub_FF2C(inited);
    id v21 = objc_allocWithZone((Class)NSError);
    NSString v22 = sub_380A0();
    Class v23 = sub_38060().super.isa;
    swift_bridgeObjectRelease();
    id v24 = [v21 initWithDomain:v22 code:1002 userInfo:v23];

    id v25 = v24;
    a4(v24, 1);

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_38590();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v16 = (id)sub_384C0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v16 = *(id *)(v15 + 32);
  }
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  id v18 = v17;
  id v26 = sub_10230();
  a4(v26, 0);
}

void sub_11178(uint64_t a1, void (*a2)(unint64_t, uint64_t))
{
  id v3 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v4 = sub_380A0();
  id v6 = [v3 initWithEntityName:v4];

  type metadata accessor for CDConfiguration();
  unint64_t v5 = sub_383C0();
  sub_2C5F0(v5, 0, a2);
  swift_bridgeObjectRelease();
}

void sub_11558(uint64_t a1, void (*a2)(void))
{
  id v3 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v4 = sub_380A0();
  id v5 = [v3 initWithEntityName:v4];

  type metadata accessor for CDConfiguration();
  sub_383C0();
  a2();
  swift_bridgeObjectRelease();
}

unint64_t sub_11938()
{
  unint64_t result = qword_46930;
  if (!qword_46930)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_46930);
  }
  return result;
}

uint64_t sub_11978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_469F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_119E0(unint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v5 = sub_380A0();
  id v6 = [v4 initWithEntityName:v5];

  uint64_t v7 = type metadata accessor for CDConfiguration();
  unint64_t v8 = sub_383C0();
  unint64_t v18 = v8;
  v106 = (objc_class *)v7;
  id v102 = v6;
  unint64_t v104 = a1;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_38590();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
  }
  id v20 = (objc_class *)v7;
  char v109 = a2;
  if (v19)
  {
    if (v19 < 1)
    {
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      sub_385E0();
      __break(1u);
LABEL_116:
      uint64_t result = sub_38660();
      __break(1u);
      return result;
    }
    uint64_t v21 = 0;
    NSString v22 = &_swiftEmptyDictionarySingleton;
    uint64_t v107 = v19;
    while (1)
    {
      id v23 = (v18 & 0xC000000000000001) != 0 ? (id)sub_384C0() : *(id *)(v18 + 8 * v21 + 32);
      id v24 = v23;
      id v25 = [v23 propertyName];
      if (v25) {
        break;
      }

LABEL_10:
      if (v19 == ++v21) {
        goto LABEL_38;
      }
    }
    id v26 = v25;
    uint64_t v27 = sub_380C0();
    id v29 = v28;

    if (v22[2])
    {
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_1A978(v27, (uint64_t)v29);
      unint64_t v31 = &_swiftEmptyArrayStorage;
      if (v32)
      {
        unint64_t v31 = *(void **)(v22[7] + 8 * v30);
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v31 = &_swiftEmptyArrayStorage;
    }
    unint64_t v112 = (unint64_t)v31;
    id v33 = v24;
    sub_38150();
    if (*(void *)((char *)&dword_10 + (v112 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (v112 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
    unint64_t v34 = v112;
    uint64_t v35 = (uint64_t)v22;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v111 = (void *)v35;
    unint64_t v38 = sub_1A978(v27, (uint64_t)v29);
    uint64_t v39 = *(void *)(v35 + 16);
    BOOL v40 = (v37 & 1) == 0;
    uint64_t v41 = v39 + v40;
    if (__OFADD__(v39, v40)) {
      goto LABEL_105;
    }
    char v42 = v37;
    if (*(void *)(v35 + 24) < v41)
    {
      sub_1B410(v41, isUniquelyReferenced_nonNull_native);
      unint64_t v43 = sub_1A978(v27, (uint64_t)v29);
      if ((v42 & 1) != (v44 & 1)) {
        goto LABEL_116;
      }
      unint64_t v38 = v43;
      NSString v22 = v111;
      if ((v42 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_29:
      uint64_t v45 = v22[7];
      swift_bridgeObjectRelease();
      *(void *)(v45 + 8 * v38) = v112;
LABEL_33:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v20 = v106;
      uint64_t v19 = v107;
      goto LABEL_10;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      NSString v22 = v111;
      if (v37) {
        goto LABEL_29;
      }
    }
    else
    {
      sub_1C690();
      NSString v22 = v111;
      if (v42) {
        goto LABEL_29;
      }
    }
LABEL_31:
    v22[(v38 >> 6) + 8] |= 1 << v38;
    id v46 = (uint64_t *)(v22[6] + 16 * v38);
    *id v46 = v27;
    v46[1] = (uint64_t)v29;
    *(void *)(v22[7] + 8 * v38) = v34;
    uint64_t v47 = v22[2];
    BOOL v48 = __OFADD__(v47, 1);
    uint64_t v49 = v47 + 1;
    if (v48) {
      goto LABEL_106;
    }
    v22[2] = v49;
    swift_bridgeObjectRetain();
    goto LABEL_33;
  }
  NSString v22 = &_swiftEmptyDictionarySingleton;
LABEL_38:
  uint64_t v103 = v22;
  swift_bridgeObjectRelease();
  if (v104 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_38590();
  }
  else
  {
    uint64_t v51 = *(void *)((char *)&dword_10 + (v104 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  unint64_t v52 = v109;
  uint64_t v53 = v102;
  if (!v51)
  {
LABEL_102:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v54 = 0;
  unint64_t v55 = v104 & 0xC000000000000001;
  p_base_prots = (__objc2_prot_list **)(&BMInternalManagerConfiguration__classData + 40);
  p_attr = (char **)(&stru_44FF8 + 8);
  uint64_t v100 = v51;
  while (1)
  {
    if (v55)
    {
      uint64_t v58 = (void *)sub_384C0();
      BOOL v48 = __OFADD__(v54, 1);
      unint64_t v59 = v54 + 1;
      if (v48) {
        goto LABEL_109;
      }
    }
    else
    {
      if (v54 >= *(void *)((char *)&dword_10 + (v104 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_113;
      }
      uint64_t v58 = (void *)swift_unknownObjectRetain();
      BOOL v48 = __OFADD__(v54, 1);
      unint64_t v59 = v54 + 1;
      if (v48)
      {
LABEL_109:
        __break(1u);
LABEL_110:
        __break(1u);
        goto LABEL_111;
      }
    }
    unint64_t v101 = v59;
    id v105 = v58;
    id v60 = [v58 eventName];
    uint64_t v61 = sub_380C0();
    uint64_t v63 = v62;

    if (v103[2])
    {
      unint64_t v64 = sub_1A978(v61, v63);
      unint64_t v65 = (unint64_t)&_swiftEmptyArrayStorage;
      if (v66)
      {
        unint64_t v65 = *(void *)(v103[7] + 8 * v64);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      unint64_t v65 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease();
    unint64_t v112 = v65;
    uint64_t v67 = v105;
    if (v65 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v99 = sub_38590();
      swift_bridgeObjectRelease();
      if (v99) {
        goto LABEL_58;
      }
    }
    else if (*(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8)))
    {
      goto LABEL_58;
    }
    uint64_t v68 = self;
    NSString v69 = sub_380A0();
    id v70 = [v68 entityForName:v69 inManagedObjectContext:v52];

    if (!v70) {
      goto LABEL_114;
    }
    id v71 = [objc_allocWithZone(v20) initWithEntity:v70 insertIntoManagedObjectContext:v52];
    id v72 = [v105 eventName];
    [v71 setPropertyName:v72];

    [v71 setRecordType:[v105 recordType]];
    id v73 = v71;
    sub_38150();
    if (*(void *)((char *)&dword_10 + (v112 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (v112 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();

    unint64_t v65 = v112;
    uint64_t v67 = v105;
LABEL_58:
    unint64_t v74 = v65 >> 62;
    if (v65 >> 62)
    {
      swift_bridgeObjectRetain();
      id v29 = (char *)sub_38590();
      if (!v29)
      {
LABEL_96:
        swift_bridgeObjectRelease();
        uint64_t v79 = v65 & 0xFFFFFFFFFFFFFF8;
        if (!v74) {
          goto LABEL_70;
        }
        goto LABEL_97;
      }
    }
    else
    {
      id v29 = *(char **)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (!v29) {
        goto LABEL_96;
      }
    }
    if ((v65 & 0xC000000000000001) != 0)
    {
      id v75 = (char *)sub_384C0();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_112;
      }
      id v75 = (char *)*(id *)(v65 + 32);
    }
    id v29 = v75;
    swift_bridgeObjectRelease();
    id v76 = [v67 ageToExpire];
    if (v76 != [v29 ageToExpire]) {
      [v29 setAgeToExpire:[v105 ageToExpire]];
    }
    id v77 = [v105 countLimit];
    if (v77 != [v29 countLimit]) {
      objc_msgSend(v29, "setCountLimit:", objc_msgSend(v105, "countLimit"));
    }
    unsigned int v78 = [v105 shouldBeSynced];
    if (v78 != [v29 shouldBeSynced]) {
      [v29 setShouldBeSynced:[v105 shouldBeSynced]];
    }

    uint64_t v79 = v65 & 0xFFFFFFFFFFFFFF8;
    if (!v74)
    {
LABEL_70:
      uint64_t v80 = *(void *)(v79 + 16);
      goto LABEL_71;
    }
LABEL_97:
    id v29 = (char *)((v65 & 0x8000000000000000) != 0 ? v65 : v79);
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_38590();
    swift_bridgeObjectRelease();
LABEL_71:
    id v20 = v106;
    if (v80 < 1) {
      goto LABEL_110;
    }
    if (v80 != 1) {
      break;
    }
LABEL_91:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v55 = v104 & 0xC000000000000001;
    unint64_t v54 = v101;
    uint64_t v53 = v102;
    if (v101 == v100) {
      goto LABEL_102;
    }
  }
  uint64_t v81 = -v80;
  uint64_t v82 = v80;
  uint64_t v108 = v80;
  while (v80 >= v82)
  {
    unint64_t v83 = v112;
    if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
      || (v83 & 0x8000000000000000) != 0
      || (v83 & 0x4000000000000000) != 0)
    {
      unint64_t v83 = sub_103B4(v83);
      unint64_t v112 = v83;
    }
    id v29 = (char *)(v82 - 1);
    uint64_t v84 = v83 & 0xFFFFFFFFFFFFFF8;
    uint64_t v85 = *(void *)(v84 + 16);
    if (v82 - 1 >= v85) {
      goto LABEL_104;
    }
    if (v81 + v85 < 0) {
      goto LABEL_115;
    }
    uint64_t v86 = v85 - 1;
    uint64_t v87 = v84 + 8 * v82;
    v88 = *(void **)(v87 + 24);
    memmove((void *)(v87 + 24), (const void *)(v87 + 32), 8 * (v81 + v85));
    *(void *)(v84 + 16) = v86;
    sub_38190();
    if (p_base_prots[212] != (__objc2_prot_list *)-1) {
      swift_once();
    }
    uint64_t v89 = sub_37F50();
    sub_C3DC(v89, (uint64_t)qword_47A80);
    id v90 = v88;
    uint64_t v91 = sub_37F30();
    os_log_type_t v92 = sub_38270();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = swift_slowAlloc();
      v111 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v93 = 136315138;
      id v94 = [v90 propertyName];
      if (v94)
      {
        uint64_t v95 = v94;
        uint64_t v96 = sub_380C0();
        unint64_t v98 = v97;
      }
      else
      {
        unint64_t v98 = 0xE300000000000000;
        uint64_t v96 = 7104878;
      }
      *(void *)(v93 + 4) = sub_2E85C(v96, v98, (uint64_t *)&v111);

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v91, v92, "Found erroneous duplicated stored configuration %s.  Deleting", (uint8_t *)v93, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v80 = v108;
      unint64_t v52 = v109;
      p_base_prots = &BMInternalManagerConfiguration__classData.base_prots;
      p_attr = &stru_44FF8.attr;
    }
    else
    {
    }
    [v52 p_attr[205]:v90];

    ++v81;
    uint64_t v82 = (uint64_t)v29;
    if (v29 == (unsigned char *)&dword_0 + 1)
    {
      id v20 = v106;
      goto LABEL_91;
    }
  }
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
  swift_once();
  uint64_t v9 = sub_37F50();
  sub_C3DC(v9, (uint64_t)qword_47A80);
  uint64_t v10 = v29;
  NSString v11 = sub_37F30();
  os_log_type_t v12 = sub_38270();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v110 = swift_slowAlloc();
    *(_DWORD *)id v13 = 136315138;
    id v14 = [v10 localizedDescription];
    uint64_t v15 = sub_380C0();
    unint64_t v17 = v16;

    sub_2E85C(v15, v17, &v110);
    sub_38420();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "Could not fetch. %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_errorRelease();
  return (uint64_t)v10;
}

uint64_t sub_12698()
{
  uint64_t v0 = sub_37F50();
  sub_1271C(v0, qword_47A80);
  sub_C3DC(v0, (uint64_t)qword_47A80);
  return sub_37F40();
}

uint64_t *sub_1271C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t static Context.submitEvent.getter()
{
  return 0x764574696D627573;
}

unint64_t static Context.updateLocalStorage.getter()
{
  return 0xD000000000000012;
}

uint64_t static Context.syncViaCloudKit.getter()
{
  return 0x43616956636E7973;
}

uint64_t ManagerConfiguration.localStorageDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory;
  uint64_t v4 = sub_37E90();
  NSString v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t ManagerConfiguration.shouldRunUpdatesOnSchedule.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule);
}

uint64_t ManagerConfiguration.shouldPurgeOutdatedData.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData);
}

id ManagerConfiguration.__allocating_init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)(uint64_t a1, char a2, char a3)
{
  uint64_t v7 = objc_allocWithZone(v3);
  unint64_t v8 = &v7[OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory];
  uint64_t v9 = sub_37E90();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  v7[OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule] = a2;
  v7[OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData] = a3;
  v13.receiver = v7;
  v13.super_class = v3;
  id v11 = [super init];
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v11;
}

id ManagerConfiguration.init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)(uint64_t a1, char a2, char a3)
{
  uint64_t v7 = &v3[OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory];
  uint64_t v8 = sub_37E90();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  v3[OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule] = a2;
  v3[OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData] = a3;
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for ManagerConfiguration();
  id v10 = [super init];
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v10;
}

uint64_t type metadata accessor for ManagerConfiguration()
{
  uint64_t result = qword_46B10;
  if (!qword_46B10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_12C8C()
{
  sub_38480(110);
  v6._countAndFlagsBits = 0xD00000000000002FLL;
  v6._object = (void *)0x800000000003B190;
  sub_38120(v6);
  sub_37E90();
  sub_1FB7C(&qword_46A00, (void (*)(uint64_t))&type metadata accessor for URL);
  v7._countAndFlagsBits = sub_38600();
  sub_38120(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0xD00000000000001ELL;
  v8._object = (void *)0x800000000003B1C0;
  sub_38120(v8);
  if (*(unsigned char *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule)) {
    v1._countAndFlagsBits = 1702195828;
  }
  else {
    v1._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule)) {
    id v2 = (void *)0xE400000000000000;
  }
  else {
    id v2 = (void *)0xE500000000000000;
  }
  v1._object = v2;
  sub_38120(v1);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x800000000003B1E0;
  v9._countAndFlagsBits = 0xD00000000000001BLL;
  sub_38120(v9);
  if (*(unsigned char *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData)) {
    v3._countAndFlagsBits = 1702195828;
  }
  else {
    v3._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR___BMInternalManagerConfiguration_shouldPurgeOutdatedData)) {
    uint64_t v4 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v4 = (void *)0xE500000000000000;
  }
  v3._object = v4;
  sub_38120(v3);
  swift_bridgeObjectRelease();
  return 0;
}

void ManagerConfiguration.init()()
{
}

id ManagerConfiguration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagerConfiguration();
  return [super dealloc];
}

uint64_t Manager.collector.getter()
{
  return swift_retain();
}

void *Manager.configuration.getter()
{
  Swift::String v1 = *(void **)(v0 + OBJC_IVAR___BMInternalManager_configuration);
  id v2 = v1;
  return v1;
}

unsigned char *Manager.__allocating_init(configuration:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return Manager.init(configuration:)(a1);
}

unsigned char *Manager.init(configuration:)(void *a1)
{
  uint64_t v36 = a1;
  uint64_t v2 = sub_37E90();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  __chkstk_darwin(v2);
  id v33 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_38320();
  uint64_t v4 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  Swift::String v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_382D0();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_37FE0();
  __chkstk_darwin(v8 - 8);
  v1[OBJC_IVAR___BMInternalManager_shouldScheduleUpdates] = 0;
  unint64_t v30 = v1;
  uint64_t v31 = OBJC_IVAR___BMInternalManager_managerQueue;
  v29[1] = sub_13568();
  Swift::String v9 = v1;
  sub_37FD0();
  unint64_t v38 = &_swiftEmptyArrayStorage;
  sub_1FB7C((unint64_t *)&qword_46A30, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_5568(&qword_46E90);
  sub_F278(&qword_46A40, &qword_46E90);
  sub_38450();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v32);
  *(void *)&v30[v31] = sub_38340();
  *(void *)&v9[OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem] = 0;
  type metadata accessor for Collector();
  id v10 = (void *)swift_allocObject();
  v10[2] = 0xD000000000000010;
  v10[3] = 0x800000000003B250;
  v10[4] = &_swiftEmptyArrayStorage;
  *(void *)&v9[OBJC_IVAR___BMInternalManager_collector] = v10;
  uint64_t v11 = v35;
  objc_super v12 = v36;
  *(void *)&v9[OBJC_IVAR___BMInternalManager_configuration] = v36;
  objc_super v13 = v12;
  uint64_t v14 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, (uint64_t)v12 + OBJC_IVAR___BMInternalManagerConfiguration_localStorageDirectory, v11);
  type metadata accessor for LocalStorage();
  swift_allocObject();
  id v15 = v13;
  *(void *)&v9[OBJC_IVAR___BMInternalManager_localStorage] = sub_31824(v14);

  unint64_t v16 = (objc_class *)type metadata accessor for Manager();
  v37.receiver = v9;
  v37.super_class = v16;
  id v17 = [super init];
  unint64_t v18 = self;
  uint64_t v19 = v17;
  id v20 = [v18 defaultCenter];
  [v20 addObserver:v19 selector:"onDidReceiveAppDidBackground:" name:UIApplicationWillResignActiveNotification object:0];

  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_37F50();
  sub_C3DC(v21, (uint64_t)qword_47A80);
  NSString v22 = v15;
  id v23 = sub_37F30();
  os_log_type_t v24 = sub_38250();
  if (os_log_type_enabled(v23, v24))
  {
    id v25 = (uint8_t *)swift_slowAlloc();
    id v26 = (void *)swift_slowAlloc();
    *(_DWORD *)id v25 = 138412290;
    unint64_t v38 = v22;
    uint64_t v27 = v22;
    sub_38420();
    *id v26 = v36;

    _os_log_impl(&dword_0, v23, v24, "Manager initiated with configuration %@", v25, 0xCu);
    sub_5568(&qword_46CE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v23 = v22;
  }

  if (*((unsigned char *)&v22->isa + OBJC_IVAR___BMInternalManagerConfiguration_shouldRunUpdatesOnSchedule) == 1)
  {
    v19[OBJC_IVAR___BMInternalManager_shouldScheduleUpdates] = 1;
    sub_15F4C();
  }

  return v19;
}

unint64_t sub_13568()
{
  unint64_t result = qword_46E80;
  if (!qword_46E80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_46E80);
  }
  return result;
}

id Manager.__deallocating_deinit()
{
  if (*(void *)&v0[OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem])
  {
    swift_retain();
    sub_38030();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Manager();
  return [super dealloc];
}

uint64_t sub_13724()
{
  uint64_t v1 = sub_37FA0();
  uint64_t v18 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_37FE0();
  uint64_t v4 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  Swift::String v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_37FB0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_13568();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchQoS.QoSClass.background(_:), v7);
  uint64_t v11 = (void *)sub_38350();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v0;
  aBlock[4] = sub_1FB4C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_297B8;
  aBlock[3] = &unk_41398;
  objc_super v13 = _Block_copy(aBlock);
  id v14 = v0;
  sub_37FD0();
  uint64_t v19 = &_swiftEmptyArrayStorage;
  sub_1FB7C(&qword_46B50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5568(&qword_46B58);
  sub_F278(&qword_46B60, &qword_46B58);
  sub_38450();
  sub_38330();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  return swift_release();
}

void sub_13AB4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_37F50();
    sub_C3DC(v1, (uint64_t)qword_47A80);
    oslog = sub_37F30();
    os_log_type_t v2 = sub_38270();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 136315138;
      sub_209B4();
      uint64_t v4 = sub_38670();
      sub_2E85C(v4, v5, &v13);
      sub_38420();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, oslog, v2, "Error from completion: %s", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
LABEL_10:
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    uint64_t v6 = *(void *)a1;
    uint64_t v7 = qword_466A0;
    swift_bridgeObjectRetain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_37F50();
    sub_C3DC(v8, (uint64_t)qword_47A80);
    swift_bridgeObjectRetain();
    oslog = sub_37F30();
    os_log_type_t v9 = sub_38270();
    if (os_log_type_enabled(oslog, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v10 = 134217984;
      uint64_t v11 = *(void *)(v6 + 16);
      sub_209A8(v6, 0);
      uint64_t v13 = v11;
      sub_38420();
      sub_209A8(v6, 0);
      _os_log_impl(&dword_0, oslog, v9, "received properties for submit: %ld", v10, 0xCu);
      goto LABEL_10;
    }
    sub_209A8(v6, 0);
    sub_209A8(v6, 0);
  }
}

uint64_t sub_13EE4()
{
  return swift_retain();
}

uint64_t sub_13EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_32E28(a1, a2, a3, a4);
}

uint64_t sub_13F20(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  sub_1EA1C(a1, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  uint64_t v10 = v9;
  sub_1EA60((uint64_t)a1, (uint64_t)v13);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  sub_1EB04(v13, v11 + 32);
  swift_retain();
  sub_32E28(v8, v10, (uint64_t)sub_1EB1C, v11);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1401C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  unint64_t v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1EB68, (uint64_t)v5);
  swift_release();

  return swift_release();
}

uint64_t sub_140E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_37F20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = v9;
  *((void *)v11 + 3) = a2;
  *((void *)v11 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1EC48, (uint64_t)v11);
  swift_release();
  return swift_release();
}

uint64_t sub_14284(void *a1, uint64_t a2)
{
  swift_getObjectType();

  return sub_1DCFC(a1, a2, v2);
}

void Manager.init()()
{
}

void Manager.register(donor:)(void *a1)
{
  sub_2CF44(a1);
  if (!v2)
  {
    [a1 addDonorObserver:v1];
    sub_1439C(a1);
  }
}

void sub_1439C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_5568(&qword_46A60);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 eventConfigurations];
  type metadata accessor for BasePropertyConfiguration();
  unint64_t v8 = sub_38170();

  uint64_t v21 = &_swiftEmptyArrayStorage;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_38590();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v12 = &_swiftEmptyArrayStorage;
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
  if (!v9) {
    goto LABEL_14;
  }
LABEL_3:
  if (v9 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((v8 & 0xC000000000000001) != 0) {
      id v11 = (id)sub_384C0();
    }
    else {
      id v11 = *(id *)(v8 + 8 * i + 32);
    }
    if (*((unsigned char *)v11 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached) == 1)
    {
      sub_38500();
      sub_38530();
      sub_38540();
      sub_38510();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = v21;
LABEL_15:
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_37F50();
  sub_C3DC(v13, (uint64_t)qword_47A80);
  id v14 = sub_37F30();
  os_log_type_t v15 = sub_38280();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v20 = sub_2E85C(0xD000000000000021, 0x800000000003B4D0, (uint64_t *)&v21);
    sub_38420();
    _os_log_impl(&dword_0, v14, v15, "Manager - %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v17 = sub_38220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v2;
  v18[5] = v12;
  id v19 = v2;
  sub_14E68((uint64_t)v6, (uint64_t)&unk_46CA0, (uint64_t)v18);
  swift_release();
}

void *Manager.donor(type:)(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_1ED4C(v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_147BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 56) = a4;
  *(void *)(v5 + 64) = a5;
  return _swift_task_switch(sub_147DC, 0, 0);
}

uint64_t sub_147DC()
{
  if (v0[8] >> 62)
  {
    swift_bridgeObjectRetain();
    sub_5568(&qword_46C28);
    uint64_t v1 = sub_38580();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_38630();
    uint64_t v1 = v0[8];
  }
  v0[9] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_148E4;
  return sub_2B970(v1);
}

uint64_t sub_148E4(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 88) = a1;
  *(unsigned char *)(v3 + 96) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_14A08, 0, 0);
}

uint64_t sub_14A08()
{
  uint64_t v12 = v0;
  if (*(unsigned char *)(v0 + 96))
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_37F50();
    sub_C3DC(v1, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v2 = sub_37F30();
    os_log_type_t v3 = sub_38270();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = *(void *)(v0 + 88);
    if (v4)
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_getErrorValue();
      uint64_t v7 = sub_38670();
      *(void *)(v0 + 48) = sub_2E85C(v7, v8, &v11);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_20A74(v5, 1);
      sub_20A74(v5, 1);
      _os_log_impl(&dword_0, v2, v3, "Error storing cached updated configurations %s", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_20A74(v5, 1);
      sub_20A74(v5, 1);
    }
    else
    {
      sub_20A74(*(void *)(v0 + 88), 1);
      sub_20A74(v5, 1);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

void *sub_14C64(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1D358(0, v1, 0);
    os_log_type_t v3 = (char *)(a1 + 80);
    do
    {
      uint64_t v4 = *((void *)v3 - 5);
      uint64_t v5 = *((void *)v3 - 4);
      uint64_t v6 = *((void *)v3 - 3);
      uint64_t v7 = *((void *)v3 - 2);
      uint64_t v8 = *((void *)v3 - 1);
      char v9 = *v3;
      int64_t v16 = v1;
      id v10 = *((id *)v3 - 6);
      sub_FB8C(v4, v5, v6, v7, v8, v9);
      id v11 = v10;
      sub_FB8C(v4, v5, v6, v7, v8, v9);
      sub_5568(&qword_46C00);
      sub_5568(&qword_46C08);
      swift_dynamicCast();

      sub_C468(v4, v5, v6, v7, v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_1D358(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_1D358(v12 > 1, v13 + 1, 1);
      }
      v3 += 56;
      _swiftEmptyArrayStorage[2] = v13 + 1;
      id v14 = &_swiftEmptyArrayStorage[7 * v13];
      v14[4] = v17;
      v14[5] = v18;
      v14[6] = v19;
      v14[7] = v20;
      v14[8] = v21;
      v14[9] = v22;
      *((unsigned char *)v14 + 80) = v23;
      --v1;
    }
    while (v16 != 1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_14E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_38220();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_38210();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_F42C(a1, &qword_46A60);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_381C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void Manager.propertyDidChange(_:propertyConfiguration:)(void *a1, void *a2)
{
  if (*((unsigned char *)a2 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached) == 1)
  {
    NSString v4 = sub_380A0();
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    *(void *)(v6 + 24) = a2;
    v9[4] = sub_1EF70;
    v9[5] = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_152F0;
    v9[3] = &unk_411C0;
    uint64_t v7 = _Block_copy(v9);
    id v8 = a2;
    swift_release();
    [a1 donateWithConfiguration:v8 context:v4 donationCompleteBlock:v7];
    _Block_release(v7);
  }
}

void sub_15164(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    if (a1)
    {
      uint64_t v7 = a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue;
      uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue);
      uint64_t v9 = *(void *)(v7 + 8);
      uint64_t v10 = *(void *)(v7 + 16);
      uint64_t v11 = *(void *)(v7 + 24);
      uint64_t v12 = *(void *)(v7 + 32);
      char v13 = *(unsigned char *)(v7 + 40);
      sub_5568((uint64_t *)&unk_46C70);
      id v14 = (int *)(sub_5568(&qword_46950) - 8);
      uint64_t v18 = a3;
      unint64_t v15 = (*(unsigned __int8 *)(*(void *)v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v14 + 80);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_398C0;
      unint64_t v17 = v16 + v15 + v14[14];
      sub_FB8C(v8, v9, v10, v11, v12, v13);
      sub_37F10();
      *(void *)unint64_t v17 = v8;
      *(void *)(v17 + 8) = v9;
      *(void *)(v17 + 16) = v10;
      *(void *)(v17 + 24) = v11;
      *(void *)(v17 + 32) = v12;
      *(unsigned char *)(v17 + 40) = v13;
      sub_1D984(v18, v16, (uint64_t)v6);

      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
}

void sub_152F0(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t Manager.updateLocalStorage(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_5568(&qword_46A60);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR___BMInternalManager_collector);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = v9;
  swift_beginAccess();
  uint64_t v11 = *(void *)(v8 + 32);
  if (v11 < 0 || (v11 & 0x4000000000000000) != 0)
  {
    swift_retain();
    swift_retain();
    unint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v12 = (uint64_t)sub_1D260(v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  uint64_t v13 = sub_38220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  id v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v12;
  v14[5] = 0xD000000000000012;
  v14[6] = 0x800000000003B170;
  v14[7] = sub_1EFD0;
  v14[8] = v10;
  swift_retain();
  sub_14E68((uint64_t)v7, (uint64_t)&unk_46A68, (uint64_t)v14);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_155F4(uint64_t a1, void (*a2)(void))
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (qword_466A0 != -1) {
      goto LABEL_36;
    }
    goto LABEL_3;
  }
  uint64_t v9 = qword_466A0;
  uint64_t v43 = *(void *)a1;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_37F50();
  sub_C3DC(v10, (uint64_t)qword_47A80);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_37F30();
  os_log_type_t v12 = sub_38260();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    v44[0] = *(void *)(v43 + 16);
    sub_38420();
    sub_209A8(v43, 0);
    _os_log_impl(&dword_0, v11, v12, "Received properties for local storage: %ld", v13, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    sub_209A8(v43, 0);
  }

  uint64_t v40 = v43 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(v43 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v43 + 64);
  swift_beginAccess();
  int64_t v17 = 0;
  int64_t v18 = (unint64_t)(v14 + 63) >> 6;
  int64_t v37 = v18;
  while (1)
  {
    if (v16)
    {
      unint64_t v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_30;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v18) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v40 + 8 * v21);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v18) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v40 + 8 * v17);
      if (!v22)
      {
        int64_t v17 = v21 + 2;
        if (v21 + 2 >= v18) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v40 + 8 * v17);
        if (!v22) {
          break;
        }
      }
    }
LABEL_29:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_30:
    os_log_type_t v24 = *(void **)(*(void *)(v43 + 48) + 8 * v20);
    if (*((unsigned char *)v24 + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeCached))
    {
      uint64_t v25 = *(void *)(v43 + 56) + 48 * v20;
      uint64_t v26 = *(void *)v25;
      uint64_t v27 = *(void *)(v25 + 8);
      uint64_t v28 = *(void *)(v25 + 16);
      uint64_t v29 = *(void *)(v25 + 24);
      uint64_t v41 = *(void *)(v25 + 32);
      int64_t v42 = v17;
      char v30 = *(unsigned char *)(v25 + 40);
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      int64_t v17 = v42;
      if (Strong)
      {
        uint64_t v39 = (void *)Strong;
        sub_5568((uint64_t *)&unk_46C70);
        uint64_t v32 = (int *)(sub_5568(&qword_46950) - 8);
        unint64_t v33 = (*(unsigned __int8 *)(*(void *)v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v32 + 80);
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_398C0;
        unint64_t v35 = v34 + v33 + v32[14];
        id v38 = v24;
        sub_FB8C(v26, v27, v28, v29, v41, v30);
        sub_37F10();
        *(void *)unint64_t v35 = v26;
        *(void *)(v35 + 8) = v27;
        *(void *)(v35 + 16) = v28;
        *(void *)(v35 + 24) = v29;
        *(void *)(v35 + 32) = v41;
        *(unsigned char *)(v35 + 40) = v30;
        sub_FB8C(v26, v27, v28, v29, v41, v30);
        sub_1D984(v38, v34, (uint64_t)v39);
        sub_C468(v26, v27, v28, v29, v41, v30);

        int64_t v18 = v37;
        swift_bridgeObjectRelease();
        int64_t v17 = v42;
      }
    }
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_33:
    swift_release();
    return ((uint64_t (*)(void, void))a2)(0, 0);
  }
  unint64_t v22 = *(void *)(v40 + 8 * v23);
  if (v22)
  {
    int64_t v17 = v23;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v17 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v17 >= v18) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v40 + 8 * v17);
    ++v23;
    if (v22) {
      goto LABEL_29;
    }
  }
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_3:
  uint64_t v2 = sub_37F50();
  sub_C3DC(v2, (uint64_t)qword_47A80);
  os_log_type_t v3 = sub_37F30();
  os_log_type_t v4 = sub_38270();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_209B4();
    uint64_t v6 = sub_38670();
    sub_2E85C(v6, v7, v44);
    sub_38420();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v3, v4, "Error from completion: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_209B4();
  swift_allocError();
  a2();
  return swift_errorRelease();
}

void sub_15BB8(uint64_t a1, char a2, void *a3)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_37F50();
    sub_C3DC(v5, (uint64_t)qword_47A80);
    sub_20A68(a1, 1);
    swift_unknownObjectRetain();
    sub_20A68(a1, 1);
    swift_unknownObjectRetain();
    oslog = sub_37F30();
    os_log_type_t v6 = sub_38270();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315394;
      id v8 = [a3 eventName];
      uint64_t v9 = sub_380C0();
      unint64_t v11 = v10;

      sub_2E85C(v9, v11, &v15);
      sub_38420();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v12 = sub_38670();
      sub_2E85C(v12, v13, &v15);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_20A74(a1, 1);
      sub_20A74(a1, 1);
      _os_log_impl(&dword_0, oslog, v6, "Property values for %s could not get saved: %s", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_20A74(a1, 1);
    }
    else
    {
      sub_20A74(a1, 1);
      swift_unknownObjectRelease_n();
      sub_20A74(a1, 1);
      sub_20A74(a1, 1);
    }
  }
}

Swift::Void __swiftcall Manager.forcePurgeLocalStorage()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  os_log_type_t v3 = (void *)swift_allocObject();
  v3[2] = v1;
  void v3[3] = sub_1F0BC;
  v3[4] = v2;
  swift_retain_n();
  swift_retain();
  sub_32984((uint64_t)sub_1F0CC, (uint64_t)v3);
  swift_release_n();
  swift_release();
  sub_336FC();
}

uint64_t sub_15F4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_38010();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  os_log_type_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_37FA0();
  uint64_t result = __chkstk_darwin(v9);
  if (*(unsigned char *)(v0 + OBJC_IVAR___BMInternalManager_shouldScheduleUpdates) == 1)
  {
    uint64_t v11 = swift_allocObject();
    uint64_t v20 = v2;
    uint64_t v12 = v11;
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_20D10;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_297B8;
    aBlock[3] = &unk_419D8;
    _Block_copy(aBlock);
    uint64_t v19 = v3;
    int64_t v21 = &_swiftEmptyArrayStorage;
    sub_1FB7C(&qword_46B50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    swift_retain();
    sub_5568(&qword_46B58);
    sub_F278(&qword_46B60, &qword_46B58);
    sub_38450();
    sub_38040();
    swift_allocObject();
    uint64_t v13 = v19;
    uint64_t v14 = sub_38020();
    uint64_t v15 = v20;
    swift_release();
    swift_release();
    uint64_t v16 = OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem;
    *(void *)(v1 + OBJC_IVAR___BMInternalManager_scheduledUpdateWorkItem) = v14;
    uint64_t result = swift_release();
    if (*(void *)(v1 + v16))
    {
      swift_retain();
      sub_38000();
      sub_38050();
      int64_t v17 = *(void (**)(char *, uint64_t))(v13 + 8);
      v17(v6, v15);
      sub_382E0();
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v17)(v8, v15);
    }
  }
  return result;
}

uint64_t sub_16288()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    Manager.updateLocalStorage(completion:)((uint64_t)sub_20D18, v2);

    return swift_release_n();
  }
  return result;
}

void sub_1632C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_15F4C();
  }
}

uint64_t Manager.getAllConfigurations(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = v5;
  void v7[3] = sub_1F0D8;
  v7[4] = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_20D7C, (uint64_t)v7);
  swift_release();

  return swift_release();
}

uint64_t Manager.getAllConfigurations()()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_16474, 0, 0);
}

uint64_t sub_16474()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[4] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  uint64_t v4 = sub_5568(&qword_46A78);
  *uint64_t v3 = v0;
  v3[1] = sub_16578;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD000000000000016, 0x800000000003B2B0, sub_1F0E0, v2, v4);
}

uint64_t sub_16578()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_16690, 0, 0);
}

uint64_t sub_16690()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_166A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568((uint64_t *)&unk_46C30);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v9 = *(void *)(a2 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_2086C;
  *(void *)(v10 + 24) = v8;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = sub_1F0D8;
  v11[4] = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_20D7C, (uint64_t)v11);
  swift_release();
  swift_release();
  return swift_release();
}

char *Manager.getProperties(config:assetIDs:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getObjectType();

  return sub_1E59C(a1, a2, a3, a4, v4);
}

uint64_t sub_168E0(uint64_t a1, uint64_t (*a2)(void *))
{
  sub_1FE30(a1, (uint64_t)v12, &qword_46B90);
  uint64_t v4 = v12[0];
  uint64_t v5 = v12[1];
  uint64_t v6 = v12[2];
  uint64_t v7 = v12[3];
  uint64_t v8 = v12[4];
  char v9 = v13;
  sub_1FE30(a1, (uint64_t)v14, &qword_46B90);
  if (v14[41]) {
    return a2(_swiftEmptyArrayStorage);
  }
  sub_F320((uint64_t)v14, (uint64_t)v15);
  sub_5568(&qword_46B98);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_398C0;
  sub_F320((uint64_t)v15, v11 + 32);
  sub_FB8C(v4, v5, v6, v7, v8, v9);
  a2((void *)v11);
  return swift_bridgeObjectRelease();
}

uint64_t Manager.getProperties(config:assetIDs:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  void v3[3] = a1;
  return _swift_task_switch(sub_16A14, 0, 0);
}

uint64_t sub_16A14()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  uint64_t v6 = sub_5568(&qword_46A88);
  *uint64_t v5 = v0;
  v5[1] = sub_16B28;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD00000000000001FLL, 0x800000000003B2D0, sub_1F0E8, v4, v6);
}

uint64_t sub_16B28()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_16690, 0, 0);
}

uint64_t sub_16C40(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_5568((uint64_t *)&unk_46B80);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  swift_getObjectType();
  sub_1E59C(a3, a4, (uint64_t)sub_20698, v12, a2);
  return swift_release();
}

uint64_t sub_16DA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_381E0();
}

uint64_t Manager.getProperties(configs:assetIDs:sortByCreatedAt:limit:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 40) = a4;
  *(void *)(v5 + 48) = v4;
  *(unsigned char *)(v5 + 80) = a3;
  *(void *)(v5 + 24) = a1;
  *(void *)(v5 + 32) = a2;
  return _swift_task_switch(sub_16E18, 0, 0);
}

uint64_t sub_16E18()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v3 = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_33:
    uint64_t v12 = &_swiftEmptyDictionarySingleton;
LABEL_34:
    *(void *)(v44 + 56) = v12;
    uint64_t v35 = *(void *)(v44 + 40);
    uint64_t v34 = *(void *)(v44 + 48);
    char v36 = *(unsigned char *)(v44 + 80);
    uint64_t v37 = *(void *)(v44 + 32);
    swift_bridgeObjectRelease();
    uint64_t v38 = *(void *)(v34 + OBJC_IVAR___BMInternalManager_localStorage);
    uint64_t v39 = sub_5568(&qword_46A98);
    uint64_t v40 = swift_task_alloc();
    *(void *)(v44 + 64) = v40;
    *(void *)(v40 + 16) = v12;
    *(void *)(v40 + 24) = v38;
    *(void *)(v40 + 32) = v37;
    *(unsigned char *)(v40 + 40) = v36;
    *(void *)(v40 + 48) = v35;
    uint64_t v41 = sub_5568(&qword_46AB0);
    int64_t v42 = (void *)swift_task_alloc();
    *(void *)(v44 + 72) = v42;
    *int64_t v42 = v44;
    v42[1] = sub_17240;
    uint64_t v8 = &unk_46AA8;
    uint64_t v3 = v44 + 16;
    uint64_t v4 = v39;
    uint64_t v5 = v41;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = v40;
    uint64_t v10 = v39;
    return withTaskGroup<A, B>(of:returning:isolation:body:)(v3, v4, v5, v6, v7, v8, v9, v10);
  }
LABEL_32:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_38590();
  uint64_t v2 = v3;
  if (!v3) {
    goto LABEL_33;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return withTaskGroup<A, B>(of:returning:isolation:body:)(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = 0;
  unint64_t v45 = v1 & 0xC000000000000001;
  uint64_t v12 = &_swiftEmptyDictionarySingleton;
  uint64_t v43 = *(void *)(v44 + 24) + 32;
  while (1)
  {
    if (v45)
    {
      uint64_t v14 = (void *)sub_384C0();
    }
    else
    {
      uint64_t v14 = *(void **)(v43 + 8 * v11);
      swift_unknownObjectRetain();
    }
    id v15 = [v14 recordType:v43];
    if (v12[2] && (unint64_t v16 = sub_1A9F0((Swift::UInt)v15), (v17 & 1) != 0))
    {
      unint64_t v46 = *(void *)(v12[7] + 8 * v16);
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v46 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    id v18 = [v14 toBaseConfiguration];
    sub_38150();
    if (*(void *)((char *)&dword_10 + (v46 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v46 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_381A0();
    sub_381B0();
    sub_38190();
    id v19 = [v14 recordType];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    BOOL v48 = v12;
    unint64_t v1 = (unint64_t)v12;
    unint64_t v22 = sub_1A9F0((Swift::UInt)v19);
    uint64_t v23 = v12[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    char v26 = v21;
    if (v12[3] < v25) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v21) {
        goto LABEL_5;
      }
    }
    else
    {
      unint64_t v1 = (unint64_t)&v48;
      sub_1C848();
      uint64_t v12 = v48;
      if (v26)
      {
LABEL_5:
        uint64_t v13 = v12[7];
        swift_bridgeObjectRelease();
        *(void *)(v13 + 8 * v22) = v46;
        goto LABEL_6;
      }
    }
LABEL_23:
    v12[(v22 >> 6) + 8] |= 1 << v22;
    uint64_t v29 = 8 * v22;
    *(void *)(v12[6] + v29) = v19;
    *(void *)(v12[7] + v29) = v46;
    uint64_t v30 = v12[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_31;
    }
    v12[2] = v32;
LABEL_6:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    if (v2 == ++v11) {
      goto LABEL_34;
    }
  }
  sub_1B728(v25, isUniquelyReferenced_nonNull_native);
  uint64_t v12 = v48;
  unint64_t v1 = (unint64_t)v48;
  unint64_t v27 = sub_1A9F0((Swift::UInt)v19);
  if ((v26 & 1) == (v28 & 1))
  {
    unint64_t v22 = v27;
    if (v26) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
  return sub_38660();
}

uint64_t sub_17240()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return _swift_task_switch(sub_16690, 0, 0);
}

uint64_t sub_17374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 328) = a6;
  *(void *)(v7 + 232) = a5;
  *(void *)(v7 + 240) = a7;
  *(void *)(v7 + 216) = a3;
  *(void *)(v7 + 224) = a4;
  *(void *)(v7 + 200) = a1;
  *(void *)(v7 + 208) = a2;
  sub_5568(&qword_46A60);
  *(void *)(v7 + 248) = swift_task_alloc();
  *(void *)(v7 + 256) = swift_task_alloc();
  *(void *)(v7 + 264) = swift_task_alloc();
  *(void *)(v7 + 272) = swift_task_alloc();
  *(void *)(v7 + 280) = swift_task_alloc();
  *(void *)(v7 + 288) = swift_task_alloc();
  uint64_t v8 = sub_5568(&qword_46BA8);
  *(void *)(v7 + 296) = v8;
  *(void *)(v7 + 304) = *(void *)(v8 - 8);
  *(void *)(v7 + 312) = swift_task_alloc();
  return _swift_task_switch(sub_174B4, 0, 0);
}

uint64_t sub_174B4()
{
  uint64_t v84 = (void *)(v0 + 80);
  uint64_t v85 = (void *)(v0 + 48);
  char v78 = *(unsigned char *)(v0 + 328);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v79 = v1 + 64;
  id v77 = (void *)(v0 + 16);
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & v2;
  int64_t v80 = (unint64_t)(63 - v4) >> 6;
  uint64_t v81 = *(void *)(v0 + 216);
  uint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v10 = v5;
  int64_t v11 = 0;
  uint64_t v92 = v0;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_22:
    uint64_t v17 = 8 * v13;
    uint64_t v18 = *(void *)(*(void *)(v81 + 48) + 8 * v13);
    unint64_t v19 = *(void *)(*(void *)(v81 + 56) + v17);
    unint64_t v93 = v19;
    if (v18)
    {
      if (v18 == 1)
      {
        unint64_t v83 = v10;
        if (v19 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v6 = sub_38590();
          uint64_t v52 = v6;
          if (v6)
          {
LABEL_46:
            if (v52 < 1) {
              goto LABEL_74;
            }
            int64_t v82 = v11;
            uint64_t v53 = 0;
            unint64_t v87 = v19 & 0xC000000000000001;
            uint64_t v89 = v52;
            do
            {
              uint64_t v91 = v53;
              if (v87) {
                id v55 = (id)sub_384C0();
              }
              else {
                id v55 = *(id *)(v19 + 8 * v53 + 32);
              }
              uint64_t v56 = v55;
              uint64_t v58 = *(void *)(v0 + 264);
              uint64_t v57 = *(void *)(v0 + 272);
              uint64_t v59 = *(void *)(v0 + 224);
              uint64_t v60 = sub_38220();
              uint64_t v61 = *(void *)(v60 - 8);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v57, 1, 1, v60);
              uint64_t v62 = (void *)swift_allocObject();
              v62[2] = 0;
              v62[3] = 0;
              v62[4] = v59;
              v62[5] = v56;
              sub_F2BC(v57, v58, &qword_46A60);
              LODWORD(v57) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v58, 1, v60);
              swift_retain();
              id v63 = v56;
              uint64_t v64 = *(void *)(v0 + 264);
              if (v57 == 1)
              {
                sub_F42C(*(void *)(v0 + 264), &qword_46A60);
              }
              else
              {
                sub_38210();
                (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v64, v60);
              }
              uint64_t v0 = v92;
              if (v62[2])
              {
                swift_getObjectType();
                swift_unknownObjectRetain();
                uint64_t v65 = sub_381C0();
                uint64_t v67 = v66;
                swift_unknownObjectRelease();
              }
              else
              {
                uint64_t v65 = 0;
                uint64_t v67 = 0;
              }
              uint64_t v68 = **(void **)(v92 + 208);
              uint64_t v69 = swift_allocObject();
              *(void *)(v69 + 16) = &unk_46BD8;
              *(void *)(v69 + 24) = v62;
              sub_5568(&qword_46A98);
              id v70 = (void *)(v67 | v65);
              if (v67 | v65)
              {
                id v70 = v84;
                *uint64_t v84 = 0;
                v84[1] = 0;
                *(void *)(v92 + 96) = v65;
                *(void *)(v92 + 104) = v67;
              }
              unint64_t v19 = v93;
              uint64_t v53 = v91 + 1;
              uint64_t v54 = *(void *)(v92 + 272);
              *(void *)(v92 + 112) = 1;
              *(void *)(v92 + 120) = v70;
              *(void *)(v92 + 128) = v68;
              swift_task_create();

              swift_release();
              sub_F42C(v54, &qword_46A60);
            }
            while (v89 != v91 + 1);
            goto LABEL_4;
          }
        }
        else
        {
          uint64_t v52 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8));
          uint64_t v6 = swift_bridgeObjectRetain();
          if (v52) {
            goto LABEL_46;
          }
        }
        goto LABEL_68;
      }
      if (v18 == 2)
      {
        int64_t v82 = v11;
        unint64_t v83 = v10;
        uint64_t v20 = *(void *)(*(void *)(v81 + 56) + v17);
        uint64_t v22 = *(void *)(v0 + 248);
        uint64_t v21 = *(void *)(v0 + 256);
        uint64_t v23 = *(void *)(v0 + 232);
        uint64_t v94 = *(void *)(v0 + 240);
        uint64_t v24 = *(void *)(v0 + 224);
        uint64_t v25 = sub_38220();
        uint64_t v26 = *(void *)(v25 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v21, 1, 1, v25);
        uint64_t v27 = swift_allocObject();
        *(void *)(v27 + 16) = 0;
        char v28 = (void *)(v27 + 16);
        *(void *)(v27 + 24) = 0;
        *(void *)(v27 + 32) = v24;
        *(void *)(v27 + 40) = v20;
        *(void *)(v27 + 48) = v23;
        *(unsigned char *)(v27 + 56) = v78;
        *(void *)(v27 + 64) = v94;
        sub_F2BC(v21, v22, &qword_46A60);
        LODWORD(v22) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v22, 1, v25);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v29 = *(void *)(v0 + 248);
        if (v22 == 1)
        {
          sub_F42C(*(void *)(v0 + 248), &qword_46A60);
          if (!*v28) {
            goto LABEL_61;
          }
        }
        else
        {
          sub_38210();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v29, v25);
          if (!*v28)
          {
LABEL_61:
            uint64_t v30 = 0;
            uint64_t v32 = 0;
            goto LABEL_62;
          }
        }
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v30 = sub_381C0();
        uint64_t v32 = v31;
        swift_unknownObjectRelease();
LABEL_62:
        uint64_t v71 = **(void **)(v0 + 208);
        uint64_t v72 = swift_allocObject();
        *(void *)(v72 + 16) = &unk_46BB8;
        *(void *)(v72 + 24) = v27;
        sub_5568(&qword_46A98);
        id v73 = (void *)(v32 | v30);
        if (v32 | v30)
        {
          id v73 = v77;
          *id v77 = 0;
          v77[1] = 0;
          *(void *)(v0 + 32) = v30;
          *(void *)(v0 + 40) = v32;
        }
        uint64_t v74 = *(void *)(v0 + 256);
        *(void *)(v0 + 136) = 1;
        *(void *)(v0 + 144) = v73;
        *(void *)(v0 + 152) = v71;
        swift_task_create();
        swift_release();
        uint64_t v6 = sub_F42C(v74, &qword_46A60);
LABEL_5:
        int64_t v11 = v82;
        unint64_t v10 = v83;
      }
    }
    else
    {
      unint64_t v83 = v10;
      if (v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_38590();
        uint64_t v33 = v6;
        if (v6)
        {
LABEL_30:
          if (v33 < 1) {
            goto LABEL_73;
          }
          int64_t v82 = v11;
          uint64_t v34 = 0;
          unint64_t v86 = v19 & 0xC000000000000001;
          uint64_t v88 = v33;
          do
          {
            uint64_t v90 = v34;
            if (v86) {
              id v36 = (id)sub_384C0();
            }
            else {
              id v36 = *(id *)(v19 + 8 * v34 + 32);
            }
            uint64_t v37 = v36;
            uint64_t v39 = *(void *)(v0 + 280);
            uint64_t v38 = *(void *)(v0 + 288);
            uint64_t v40 = *(void *)(v0 + 224);
            uint64_t v41 = sub_38220();
            uint64_t v42 = *(void *)(v41 - 8);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v38, 1, 1, v41);
            uint64_t v43 = (void *)swift_allocObject();
            v43[2] = 0;
            v43[3] = 0;
            v43[4] = v40;
            v43[5] = v37;
            sub_F2BC(v38, v39, &qword_46A60);
            LODWORD(v38) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v39, 1, v41);
            swift_retain();
            id v44 = v37;
            uint64_t v45 = *(void *)(v0 + 280);
            if (v38 == 1)
            {
              sub_F42C(*(void *)(v0 + 280), &qword_46A60);
            }
            else
            {
              sub_38210();
              (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v45, v41);
            }
            uint64_t v0 = v92;
            if (v43[2])
            {
              swift_getObjectType();
              swift_unknownObjectRetain();
              uint64_t v46 = sub_381C0();
              uint64_t v48 = v47;
              swift_unknownObjectRelease();
            }
            else
            {
              uint64_t v46 = 0;
              uint64_t v48 = 0;
            }
            uint64_t v49 = **(void **)(v92 + 208);
            uint64_t v50 = swift_allocObject();
            *(void *)(v50 + 16) = &unk_46BF0;
            *(void *)(v50 + 24) = v43;
            sub_5568(&qword_46A98);
            uint64_t v51 = (void *)(v48 | v46);
            if (v48 | v46)
            {
              uint64_t v51 = v85;
              *uint64_t v85 = 0;
              v85[1] = 0;
              *(void *)(v92 + 64) = v46;
              *(void *)(v92 + 72) = v48;
            }
            unint64_t v19 = v93;
            uint64_t v34 = v90 + 1;
            uint64_t v35 = *(void *)(v92 + 288);
            *(void *)(v92 + 160) = 1;
            *(void *)(v92 + 168) = v51;
            *(void *)(v92 + 176) = v49;
            swift_task_create();

            swift_release();
            sub_F42C(v35, &qword_46A60);
          }
          while (v88 != v90 + 1);
LABEL_4:
          uint64_t v6 = swift_bridgeObjectRelease();
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v33 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8));
        uint64_t v6 = swift_bridgeObjectRetain();
        if (v33) {
          goto LABEL_30;
        }
      }
LABEL_68:
      uint64_t v6 = swift_bridgeObjectRelease();
      unint64_t v10 = v83;
    }
  }
  int64_t v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    return TaskGroup.Iterator.next(isolation:)(v6, v7, v8, v9);
  }
  if (v14 >= v80) {
    goto LABEL_69;
  }
  unint64_t v15 = *(void *)(v79 + 8 * v14);
  ++v11;
  if (v15) {
    goto LABEL_21;
  }
  int64_t v11 = v14 + 1;
  if (v14 + 1 >= v80) {
    goto LABEL_69;
  }
  unint64_t v15 = *(void *)(v79 + 8 * v11);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v11 = v14 + 2;
  if (v14 + 2 >= v80) {
    goto LABEL_69;
  }
  unint64_t v15 = *(void *)(v79 + 8 * v11);
  if (v15)
  {
LABEL_21:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_22;
  }
  int64_t v16 = v14 + 3;
  if (v16 < v80)
  {
    unint64_t v15 = *(void *)(v79 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v11 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_75;
        }
        if (v11 >= v80) {
          goto LABEL_69;
        }
        unint64_t v15 = *(void *)(v79 + 8 * v11);
        ++v16;
        if (v15) {
          goto LABEL_21;
        }
      }
    }
    int64_t v11 = v16;
    goto LABEL_21;
  }
LABEL_69:
  swift_release();
  *(void *)(v0 + 184) = _swiftEmptyArrayStorage;
  sub_5568(&qword_46A98);
  sub_381F0();
  id v75 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v75;
  *id v75 = v0;
  v75[1] = sub_17F48;
  uint64_t v9 = *(void *)(v0 + 296);
  uint64_t v6 = v0 + 192;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  return TaskGroup.Iterator.next(isolation:)(v6, v7, v8, v9);
}

uint64_t sub_17F48()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_18044, 0, 0);
}

uint64_t sub_18044()
{
  uint64_t v1 = v0[24];
  if (v1)
  {
    sub_2387C(v1);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[40] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_17F48;
    uint64_t v3 = v0[37];
    return TaskGroup.Iterator.next(isolation:)(v0 + 24, 0, 0, v3);
  }
  else
  {
    uint64_t v4 = (void *)v0[25];
    (*(void (**)(void, void))(v0[38] + 8))(v0[39], v0[37]);
    unint64_t v5 = sub_14C64(v0[23]);
    swift_bridgeObjectRelease();
    *uint64_t v4 = v5;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_181E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return _swift_task_switch(sub_18208, 0, 0);
}

uint64_t sub_18208()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  uint64_t v3 = sub_5568(&qword_46A98);
  *uint64_t v2 = v0;
  v2[1] = sub_20D30;
  uint64_t v4 = *(void *)(v0 + 16);
  return withCheckedContinuation<A>(isolation:function:_:)(v4, 0, 0, 0xD000000000000036, 0x800000000003B490, sub_203DC, v1, v3);
}

uint64_t sub_18300(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_5568(&qword_46C18);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v10 = *(void *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  uint64_t v9 = *(void *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v12 + ((v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  unint64_t v13 = (void *)swift_allocObject();
  long long v13[2] = v10;
  v13[3] = v9;
  v13[4] = a2;
  v13[5] = sub_203E8;
  v13[6] = v12;
  int64_t v14 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1FDFC, (uint64_t)v13);
  swift_release();
  return swift_release();
}

uint64_t sub_184C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return _swift_task_switch(sub_184EC, 0, 0);
}

uint64_t sub_184EC()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  uint64_t v3 = sub_5568(&qword_46A98);
  *uint64_t v2 = v0;
  v2[1] = sub_185E4;
  uint64_t v4 = *(void *)(v0 + 16);
  return withCheckedContinuation<A>(isolation:function:_:)(v4, 0, 0, 0xD000000000000036, 0x800000000003B490, sub_20438, v1, v3);
}

uint64_t sub_185E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_186F4(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_5568(&qword_46C18);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v10 = *(void *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName];
  uint64_t v9 = *(void *)&a3[OBJC_IVAR___BMBasePropertyConfiguration_eventName + 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v12 + ((v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  unint64_t v13 = (void *)swift_allocObject();
  long long v13[2] = v10;
  v13[3] = v9;
  v13[4] = a2;
  v13[5] = sub_203E8;
  v13[6] = v12;
  int64_t v14 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1FE18, (uint64_t)v13);
  swift_release();
  return swift_release();
}

uint64_t sub_188BC(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1FE30(a1, (uint64_t)v8, &qword_46B90);
  if (v8[41])
  {
    v9[0] = _swiftEmptyArrayStorage;
  }
  else
  {
    sub_F320((uint64_t)v8, (uint64_t)v9);
    sub_5568(&qword_46C20);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_398C0;
    *(void *)(v5 + 32) = a3;
    sub_F320((uint64_t)v9, v5 + 40);
    sub_203F0(a1);
    id v6 = a3;
  }
  sub_5568(&qword_46C18);
  return sub_381E0();
}

uint64_t sub_1899C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 48) = a8;
  *(unsigned char *)(v8 + 72) = a7;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 16) = a1;
  return _swift_task_switch(sub_189C8, 0, 0);
}

uint64_t sub_189C8()
{
  char v1 = *(unsigned char *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v4 + 32) = v3;
  *(unsigned char *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  uint64_t v6 = sub_5568(&qword_46A98);
  *uint64_t v5 = v0;
  v5[1] = sub_18ADC;
  uint64_t v7 = *(void *)(v0 + 16);
  return withCheckedContinuation<A>(isolation:function:_:)(v7, 0, 0, 0xD000000000000036, 0x800000000003B490, sub_20584, v4, v6);
}

uint64_t sub_18ADC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_18BEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v20 = a6;
  uint64_t v11 = sub_5568(&qword_46C18);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  swift_bridgeObjectRetain();
  if (a3 >> 62)
  {
    sub_5568(&qword_46C28);
    uint64_t v18 = sub_38580();
    swift_bridgeObjectRelease();
    a3 = v18;
  }
  else
  {
    sub_38630();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  *(unsigned char *)(v16 + 32) = a5 & 1;
  *(void *)(v16 + 40) = v20;
  *(void *)(v16 + 48) = a2;
  *(void *)(v16 + 56) = sub_205A4;
  *(void *)(v16 + 64) = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_32984((uint64_t)sub_20678, v16);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_18E14(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    int64_t v3 = *(void *)(a1 + 16);
    if (v3)
    {
      sub_1D388(0, v3, 0);
      uint64_t v4 = (char *)(a1 + 80);
      do
      {
        uint64_t v5 = (void *)*((void *)v4 - 6);
        uint64_t v6 = *((void *)v4 - 4);
        uint64_t v7 = *((void *)v4 - 3);
        uint64_t v8 = *((void *)v4 - 2);
        uint64_t v9 = *((void *)v4 - 1);
        char v10 = *v4;
        uint64_t v17 = *((void *)v4 - 5);
        sub_FB8C(v17, v6, v7, v8, v9, *v4);
        id v11 = [v5 toBaseConfiguration];
        unint64_t v13 = _swiftEmptyArrayStorage[2];
        unint64_t v12 = _swiftEmptyArrayStorage[3];
        if (v13 >= v12 >> 1)
        {
          id v16 = v11;
          sub_1D388(v12 > 1, v13 + 1, 1);
          id v11 = v16;
        }
        v4 += 56;
        _swiftEmptyArrayStorage[2] = v13 + 1;
        unint64_t v14 = (char *)&_swiftEmptyArrayStorage[7 * v13];
        *((void *)v14 + 4) = v11;
        *((void *)v14 + 5) = v17;
        *((void *)v14 + 6) = v6;
        *((void *)v14 + 7) = v7;
        *((void *)v14 + 8) = v8;
        *((void *)v14 + 9) = v9;
        v14[80] = v10;
        --v3;
      }
      while (v3);
    }
  }
  sub_5568(&qword_46C18);
  return sub_381E0();
}

uint64_t Manager.getProperties(propertyName:assetIDs:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void *)(v5 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v13 = (void *)swift_allocObject();
  long long v13[2] = v12;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a3;
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = v11;
  v14[5] = sub_1F1D4;
  v14[6] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1F1DC, (uint64_t)v14);
  swift_release();
  swift_release();

  return swift_release();
}

void sub_190BC(void *a1, char a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = (void *)Strong;
    if (a2)
    {
      sub_5568((uint64_t *)&unk_46CD0);
      swift_willThrowTypedImpl();
    }
    else if (a1)
    {
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = a4;
      *(void *)(v13 + 24) = a5;
      sub_1FD84(a1, 0);
      sub_1FD84(a1, 0);
      swift_retain();
      sub_1E284(a1, a6, (uint64_t)sub_1FD5C, v13, (uint64_t)v12);
      swift_release();

      sub_1FD90(a1, 0);
      sub_1FD90(a1, 0);
      return;
    }
    ((void (*)(void))a4)(0);
  }
  else
  {
    a4();
  }
}

uint64_t Manager.getProperties(propertyName:assetIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return _swift_task_switch(sub_19224, 0, 0);
}

uint64_t sub_19224()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v7;
  *(void *)(v3 + 40) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  uint64_t v5 = sub_5568(&qword_46A88);
  *uint64_t v4 = v0;
  v4[1] = sub_19344;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000025, 0x800000000003B2F0, sub_1F1F4, v3, v5);
}

uint64_t sub_19344()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_16690, 0, 0);
}

uint64_t sub_1945C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_5568((uint64_t *)&unk_46B80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  uint64_t v15 = *(void *)(a2 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = (void *)swift_allocObject();
  _OWORD v17[2] = v16;
  v17[3] = sub_1FC88;
  v17[4] = v14;
  v17[5] = a5;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = v15;
  v18[5] = sub_1F1D4;
  v18[6] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1F1DC, (uint64_t)v18);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_19690()
{
  return sub_381E0();
}

uint64_t Manager.getProperties(propertyNames:assetIDs:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  void v3[3] = a1;
  return _swift_task_switch(sub_1970C, 0, 0);
}

uint64_t sub_1970C()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = swift_task_alloc();
  v0[6] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  uint64_t v4 = sub_5568(&qword_46A78);
  *uint64_t v3 = v0;
  v3[1] = sub_19810;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD000000000000016, 0x800000000003B2B0, sub_20D24, v2, v4);
}

uint64_t sub_19810()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_19928, 0, 0);
}

uint64_t sub_19928()
{
  unint64_t v1 = v0[2];
  uint64_t v2 = (void *)v0[3];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1F200(v1, v2);
  v0[8] = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = swift_task_alloc();
  v0[9] = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_19A18;
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = v5;
  *(unsigned char *)(v4 + 80) = 0;
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 32) = v6;
  return _swift_task_switch(sub_16E18, 0, 0);
}

uint64_t sub_19A18(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t Manager.getEarliestTimestamp(propertyNames:assetIDs:earliestTimestampComparator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[13] = a5;
  v6[14] = v5;
  v6[11] = a3;
  v6[12] = a4;
  v6[9] = a1;
  v6[10] = a2;
  sub_5568(&qword_46AD0);
  v6[15] = swift_task_alloc();
  return _swift_task_switch(sub_19BCC, 0, 0);
}

uint64_t sub_19BCC()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = swift_task_alloc();
  v0[16] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[17] = v3;
  uint64_t v4 = sub_5568(&qword_46A78);
  *uint64_t v3 = v0;
  v3[1] = sub_19CD0;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 8, 0, 0, 0xD000000000000016, 0x800000000003B2B0, sub_20D24, v2, v4);
}

uint64_t sub_19CD0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_19DE8, 0, 0);
}

uint64_t sub_19DE8()
{
  uint64_t v1 = v0[10];
  unint64_t v2 = v0[8];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1F438(v2, v1);
  v0[18] = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = swift_task_alloc();
  v0[19] = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_19EE8;
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[11];
  *(void *)(v4 + 40) = 20;
  *(void *)(v4 + 48) = v5;
  *(unsigned char *)(v4 + 80) = 1;
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 32) = v6;
  return _swift_task_switch(sub_16E18, 0, 0);
}

uint64_t sub_19EE8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 160) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1A008, 0, 0);
}

uint64_t sub_1A008()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[9];
  uint64_t v3 = sub_37F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    uint64_t v5 = v0[20] + 40;
    do
    {
      uint64_t v6 = v0[15];
      long long v7 = (void (*)(void *, uint64_t))v0[12];
      uint64_t v8 = v0[9];
      sub_F320(v5, (uint64_t)(v0 + 2));
      swift_unknownObjectRetain();
      sub_1F5D4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_FB8C);
      v7(v0 + 2, v8);
      swift_unknownObjectRelease();
      sub_1F5D4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_C468);
      sub_F42C(v8, &qword_46AD0);
      sub_1FE30(v6, v8, &qword_46AD0);
      v5 += 56;
      --v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1A198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_386D0();
    sub_38100();
    Swift::Int v6 = sub_386F0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_38620() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_38620() & 1) != 0) {
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

uint64_t Manager.enumerate(startDate:endDate:closure:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v28 = a3;
  uint64_t v10 = sub_5568(&qword_46AD0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10 - 8);
  uint64_t v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v17 = *(void *)(v6 + OBJC_IVAR___BMInternalManager_localStorage);
  sub_F2BC(a1, (uint64_t)&v27 - v15, &qword_46AD0);
  sub_F2BC(a2, (uint64_t)v14, &qword_46AD0);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = (v18 + 24) & ~v18;
  uint64_t v20 = (v12 + v18 + v19) & ~v18;
  unint64_t v21 = (v12 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v17;
  sub_1FE30((uint64_t)v16, v22 + v19, &qword_46AD0);
  sub_1FE30((uint64_t)v14, v22 + v20, &qword_46AD0);
  uint64_t v23 = (void *)(v22 + v21);
  *uint64_t v23 = v28;
  v23[1] = a4;
  uint64_t v24 = (void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v25 = v30;
  *uint64_t v24 = v29;
  v24[1] = v25;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1F7C0, v22);
  return swift_release();
}

uint64_t Manager.fetchCounts(_:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_1A4CC, 0, 0);
}

uint64_t sub_1A4CC()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v0[4] + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  uint64_t v5 = sub_5568(&qword_46AE0);
  *uint64_t v4 = v0;
  v4[1] = sub_1A5E4;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0x756F436863746566, 0xEF293A5F2873746ELL, sub_1F878, v3, v5);
}

uint64_t sub_1A5E4()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1A71C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1A700;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1A700()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_1A71C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for Manager()
{
  return self;
}

uint64_t sub_1A7A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1A880;
  return v6(a1);
}

uint64_t sub_1A880()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1A978(uint64_t a1, uint64_t a2)
{
  sub_386D0();
  sub_38100();
  Swift::Int v4 = sub_386F0();

  return sub_1AAE4(a1, a2, v4);
}

unint64_t sub_1A9F0(Swift::UInt a1)
{
  sub_386D0();
  sub_386E0(a1);
  Swift::Int v2 = sub_386F0();

  return sub_1ABC8(a1, v2);
}

unint64_t sub_1AA5C(uint64_t a1)
{
  uint64_t v2 = sub_386C0();

  return sub_1AC64(a1, v2);
}

unint64_t sub_1AAA0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_38400(*(void *)(v2 + 40));

  return sub_1AD00(a1, v4);
}

unint64_t sub_1AAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_38620() & 1) == 0)
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
      while (!v14 && (sub_38620() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1ABC8(uint64_t a1, uint64_t a2)
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

unint64_t sub_1AC64(uint64_t a1, uint64_t a2)
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

unint64_t sub_1AD00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for BasePropertyConfiguration();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_38410();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_38410();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_1AE0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46B78);
  char v37 = a2;
  uint64_t v6 = sub_385C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v36 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_386D0();
    sub_38100();
    uint64_t result = sub_386F0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B100(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46C88);
  char v38 = a2;
  uint64_t v6 = sub_385C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    BOOL v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_386D0();
    sub_38100();
    uint64_t result = sub_386F0();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B410(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46CA8);
  char v36 = a2;
  uint64_t v6 = sub_385C0();
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
    uint64_t v22 = (void *)(v5 + 64);
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
      swift_bridgeObjectRetain();
    }
    sub_386D0();
    sub_38100();
    uint64_t result = sub_386F0();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B728(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46BA0);
  uint64_t result = sub_385C0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      Swift::UInt v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_386D0();
      sub_386E0(v28);
      uint64_t result = sub_386F0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BA04(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46B70);
  char v37 = a2;
  uint64_t v6 = sub_385C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_386D0();
    sub_38100();
    uint64_t result = sub_386F0();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
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
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BD10(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46B68);
  uint64_t result = sub_385C0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    uint64_t v33 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_34;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_34;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v33;
                goto LABEL_41;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v9 = -1 << v32;
              }
              uint64_t v3 = v33;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_43;
                }
                if (v8 >= v13) {
                  goto LABEL_34;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(v5 + 56) + v22;
      if (a2) {
        sub_1FC20(v24, (uint64_t)v34);
      }
      else {
        sub_1FBC4(v24, (uint64_t)v34);
      }
      uint64_t result = sub_386C0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      uint64_t result = sub_1FC20((uint64_t)v34, *(void *)(v7 + 56) + v16);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BFDC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_5568(&qword_46C68);
  char v43 = a2;
  uint64_t v6 = sub_385C0();
  uint64_t v44 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = (void *)(v5 + 64);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = v6 + 64;
  uint64_t result = swift_retain();
  uint64_t v12 = v44;
  int64_t v13 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v9)
    {
      unint64_t v19 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
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
    if (v21 >= v40) {
      break;
    }
    uint64_t v22 = v41;
    unint64_t v23 = v41[v21];
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v23 = v41[v13];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = v41[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v23 = v41[v13];
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
    unint64_t v9 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
    uint64_t v30 = *(void *)(v5 + 56) + 48 * v20;
    uint64_t v31 = *(void *)v30;
    uint64_t v32 = *(void *)(v30 + 8);
    uint64_t v33 = *(void *)(v30 + 16);
    uint64_t v34 = *(void *)(v30 + 24);
    uint64_t v35 = *(void *)(v30 + 32);
    char v36 = *(unsigned char *)(v30 + 40);
    if ((v43 & 1) == 0)
    {
      id v37 = v29;
      sub_FB8C(v31, v32, v33, v34, v35, v36);
      uint64_t v12 = v44;
    }
    uint64_t result = sub_38400(*(void *)(v12 + 40));
    uint64_t v12 = v44;
    uint64_t v14 = -1 << *(unsigned char *)(v44 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v10 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v10 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v10 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v10 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(void *)(*(void *)(v44 + 48) + 8 * v17) = v29;
    uint64_t v18 = *(void *)(v44 + 56) + 48 * v17;
    *(void *)uint64_t v18 = v31;
    *(void *)(v18 + 8) = v32;
    *(void *)(v18 + 16) = v33;
    *(void *)(v18 + 24) = v34;
    *(void *)(v18 + 32) = v35;
    *(unsigned char *)(v18 + 40) = v36;
    ++*(void *)(v44 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v22 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v22, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v44;
  return result;
}

void *sub_1C31C()
{
  uint64_t v1 = v0;
  sub_5568(&qword_46B78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_385B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1C4BC()
{
  return sub_1CF88(&qword_46C90, (void (*)(unsigned char *, uint64_t))sub_F488);
}

id sub_1C4DC()
{
  uint64_t v1 = v0;
  sub_5568(&qword_46C88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_385B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void *sub_1C690()
{
  uint64_t v1 = v0;
  sub_5568(&qword_46CA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_385B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_1C848()
{
  uint64_t v1 = v0;
  sub_5568(&qword_46BA0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_385B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C9EC()
{
  uint64_t v1 = v0;
  sub_5568(&qword_46B70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_385B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CB9C()
{
  uint64_t v1 = v0;
  sub_5568(&qword_46B68);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_385B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    sub_1FBC4(*(void *)(v2 + 56) + 8 * v15, (uint64_t)v21);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = (void *)sub_1FC20((uint64_t)v21, *(void *)(v4 + 56) + v16);
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CD5C()
{
  sub_5568(&qword_46C68);
  uint64_t v28 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_385B0();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v28 = v3;
    return result;
  }
  id result = (void *)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5) {
    id result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  }
  uint64_t v30 = v1 + 64;
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v29 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v29) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v30 + 8 * v25);
    ++v7;
    if (!v26)
    {
      int64_t v7 = v25 + 1;
      if (v25 + 1 >= v29) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v30 + 8 * v7);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v10 = (v26 - 1) & v26;
    unint64_t v12 = __clz(__rbit64(v26)) + (v7 << 6);
LABEL_12:
    uint64_t v13 = 8 * v12;
    unint64_t v14 = *(void **)(*(void *)(v1 + 48) + 8 * v12);
    uint64_t v15 = 48 * v12;
    uint64_t v16 = *(void *)(v1 + 56) + v15;
    uint64_t v17 = *(void *)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = *(void *)(v16 + 16);
    uint64_t v20 = *(void *)(v16 + 24);
    uint64_t v21 = *(void *)(v16 + 32);
    char v22 = *(unsigned char *)(v16 + 40);
    *(void *)(*(void *)(v3 + 48) + v13) = v14;
    uint64_t v23 = *(void *)(v3 + 56) + v15;
    *(void *)uint64_t v23 = v17;
    *(void *)(v23 + 8) = v18;
    *(void *)(v23 + 16) = v19;
    *(void *)(v23 + 24) = v20;
    *(void *)(v23 + 32) = v21;
    *(unsigned char *)(v23 + 40) = v22;
    id v24 = v14;
    id result = (void *)sub_FB8C(v17, v18, v19, v20, v21, v22);
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v29) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v30 + 8 * v27);
  if (v26)
  {
    int64_t v7 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v7 >= v29) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v30 + 8 * v7);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CF68()
{
  return sub_1CF88(&qword_469F0, (void (*)(unsigned char *, uint64_t))sub_F488);
}

void *sub_1CF88(uint64_t *a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = v2;
  sub_5568(a1);
  uint64_t v5 = *v2;
  uint64_t v6 = sub_385B0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v4 = v7;
    return result;
  }
  int64_t v27 = v4;
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = 32 * v17;
    sub_F498(*(void *)(v5 + 56) + 32 * v17, (uint64_t)v29);
    uint64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v23 = v20;
    v23[1] = v21;
    a2(v29, *(void *)(v7 + 56) + v22);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v4 = v27;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1D178(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_5568(&qword_46CB8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  void v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1D784((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_C9E0();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_1D260(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_5568(&qword_46920);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      void v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1D55C((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_38590();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_1D358(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3B8(a1, a2, a3, (void *)*v3, &qword_46C10, &qword_46C08);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1D388(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D3B8(a1, a2, a3, (void *)*v3, &qword_46C20, &qword_46C00);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1D3B8(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  if (v12)
  {
    sub_5568(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    long long v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 56);
  }
  else
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
  }
  int64_t v15 = v13 + 4;
  unint64_t v16 = a4 + 4;
  size_t v17 = 7 * v11;
  if (a1)
  {
    if (v13 != a4 || v15 >= &v16[v17]) {
      memmove(v13 + 4, a4 + 4, v17 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= &v15[v17] || v15 >= &v16[v17])
  {
    sub_5568(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

uint64_t sub_1D55C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_38590();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
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
    uint64_t v10 = sub_38590();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_F278(&qword_46C50, &qword_46C48);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_5568(&qword_46C48);
          uint64_t v12 = sub_2EEB4(v16, i, a3);
          uint64_t v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
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
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_5568(&qword_46C40);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

uint64_t sub_1D784(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    *uint64_t v5 = a4;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_1D984(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_37F50();
  sub_C3DC(v6, (uint64_t)qword_47A80);
  id v7 = a1;
  swift_bridgeObjectRetain_n();
  id v8 = v7;
  unint64_t v9 = sub_37F30();
  os_log_type_t v10 = sub_38260();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t type = v10;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    id v12 = [v8 eventName];
    uint64_t v13 = sub_380C0();
    uint64_t v30 = a3;
    unint64_t v15 = v14;

    sub_2E85C(v13, v15, &v31);
    sub_38420();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_5568(&qword_46950);
    uint64_t v16 = sub_38180();
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    sub_1ECB0(500, v16, v18, v19);
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_380F0();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v23 = v20;
    a3 = v30;
    sub_2E85C(v23, v22, &v31);
    sub_38420();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, type, "-- Storing Values for %s: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = *(void *)(a3 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v8;
  int64_t v26 = (void *)swift_allocObject();
  v26[2] = v24;
  v26[3] = v8;
  v26[4] = sub_20A40;
  void v26[5] = v25;
  v26[6] = a2;
  swift_unknownObjectRetain();
  id v27 = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_20A50, (uint64_t)v26);
  swift_release();
  return swift_release();
}

uint64_t sub_1DCFC(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_37F50();
  sub_C3DC(v6, (uint64_t)qword_47A80);
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v7 = sub_37F30();
  os_log_type_t v8 = sub_38260();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t type = v8;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    id v10 = [a1 eventName];
    uint64_t v11 = sub_380C0();
    uint64_t v27 = a3;
    unint64_t v13 = v12;

    sub_2E85C(v11, v13, &v28);
    sub_38420();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_5568(&qword_46950);
    uint64_t v14 = sub_38180();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    sub_1ECB0(500, v14, v16, v17);
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_380F0();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = v18;
    a3 = v27;
    sub_2E85C(v21, v20, &v28);
    sub_38420();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v7, type, "-- Storing Values for %s: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease_n();
  }
  uint64_t v22 = *(void *)(a3 + OBJC_IVAR___BMInternalManager_localStorage);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a1;
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v22;
  v24[3] = a1;
  v24[4] = sub_20D2C;
  v24[5] = v23;
  v24[6] = a2;
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_20A50, (uint64_t)v24);
  swift_release();
  return swift_release();
}

uint64_t sub_1E074(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1E154;
  return v5(v2 + 16);
}

uint64_t sub_1E154()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

char *sub_1E284(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ([a1 recordType] == (char *)&dword_0 + 1)
  {
    uint64_t v10 = *(void *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    id v11 = [a1 eventName];
    uint64_t v12 = sub_380C0();
    uint64_t v14 = v13;

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a3;
    *(void *)(v15 + 24) = a4;
    unint64_t v16 = (void *)swift_allocObject();
    v16[2] = v12;
    v16[3] = v14;
    v16[4] = v10;
    v16[5] = sub_20D80;
    v16[6] = v15;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    unint64_t v17 = sub_1FE18;
LABEL_7:
    int64_t v26 = v17;
    uint64_t v27 = (uint64_t)v16;
    goto LABEL_8;
  }
  if (![a1 recordType])
  {
    uint64_t v28 = *(void *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    id v29 = [a1 eventName];
    uint64_t v30 = sub_380C0();
    uint64_t v32 = v31;

    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = a3;
    *(void *)(v33 + 24) = a4;
    unint64_t v16 = (void *)swift_allocObject();
    v16[2] = v30;
    v16[3] = v32;
    v16[4] = v28;
    v16[5] = sub_1FDDC;
    v16[6] = v33;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    unint64_t v17 = sub_1FDFC;
    goto LABEL_7;
  }
  uint64_t result = (char *)[a1 recordType];
  if (result != (unsigned char *)&dword_0 + 2) {
    return result;
  }
  uint64_t v19 = *(void *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
  id v20 = [a1 eventName];
  uint64_t v21 = sub_380C0();
  uint64_t v23 = v22;

  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a3;
  *(void *)(v24 + 24) = a4;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v21;
  *(void *)(v25 + 24) = v23;
  *(void *)(v25 + 32) = a2;
  *(unsigned char *)(v25 + 40) = 0;
  *(void *)(v25 + 48) = 0;
  *(void *)(v25 + 56) = v19;
  *(void *)(v25 + 64) = sub_1F0D8;
  *(void *)(v25 + 72) = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  int64_t v26 = sub_1FDA0;
  uint64_t v27 = v25;
LABEL_8:
  sub_32984((uint64_t)v26, v27);
  swift_bridgeObjectRelease();
  swift_release();

  return (char *)swift_release();
}

char *sub_1E59C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ([a1 recordType] == (char *)&dword_0 + 1)
  {
    uint64_t v10 = *(void *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    id v11 = [a1 eventName];
    uint64_t v12 = sub_380C0();
    uint64_t v14 = v13;

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a3;
    *(void *)(v15 + 24) = a4;
    unint64_t v16 = (void *)swift_allocObject();
    v16[2] = v12;
    v16[3] = v14;
    v16[4] = v10;
    v16[5] = sub_20D80;
    v16[6] = v15;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    unint64_t v17 = sub_1FE18;
LABEL_7:
    int64_t v26 = v17;
    uint64_t v27 = (uint64_t)v16;
    goto LABEL_8;
  }
  if (![a1 recordType])
  {
    uint64_t v28 = *(void *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
    id v29 = [a1 eventName];
    uint64_t v30 = sub_380C0();
    uint64_t v32 = v31;

    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = a3;
    *(void *)(v33 + 24) = a4;
    unint64_t v16 = (void *)swift_allocObject();
    v16[2] = v30;
    v16[3] = v32;
    v16[4] = v28;
    v16[5] = sub_20D80;
    v16[6] = v33;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    unint64_t v17 = sub_1FDFC;
    goto LABEL_7;
  }
  uint64_t result = (char *)[a1 recordType];
  if (result != (unsigned char *)&dword_0 + 2) {
    return result;
  }
  uint64_t v19 = *(void *)(a5 + OBJC_IVAR___BMInternalManager_localStorage);
  id v20 = [a1 eventName];
  uint64_t v21 = sub_380C0();
  uint64_t v23 = v22;

  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a3;
  *(void *)(v24 + 24) = a4;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v21;
  *(void *)(v25 + 24) = v23;
  *(void *)(v25 + 32) = a2;
  *(unsigned char *)(v25 + 40) = 0;
  *(void *)(v25 + 48) = 0;
  *(void *)(v25 + 56) = v19;
  *(void *)(v25 + 64) = sub_1F0D8;
  *(void *)(v25 + 72) = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  int64_t v26 = sub_1FDA0;
  uint64_t v27 = v25;
LABEL_8:
  sub_32984((uint64_t)v26, v27);
  swift_bridgeObjectRelease();
  swift_release();

  return (char *)swift_release();
}

uint64_t sub_1E8B4()
{
  uint64_t v1 = sub_5568(&qword_46A60);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR___BMInternalManager_collector);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 32);
  if (v5 < 0 || (v5 & 0x4000000000000000) != 0)
  {
    unint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t)sub_1D260(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = sub_38220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = v6;
  *(_OWORD *)(v8 + 40) = xmmword_39940;
  *(void *)(v8 + 56) = sub_13AB4;
  *(void *)(v8 + 64) = 0;
  sub_14E68((uint64_t)v3, (uint64_t)&unk_46CB0, v8);
  return swift_release();
}

void *sub_1EA1C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1EA60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1EAC4()
{
  swift_release();
  sub_F4F4(v0 + 32);

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1EB04(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_1EB1C(void *a1, char a2)
{
  sub_33E18(a1, a2 & 1, *(void (**)(void *, uint64_t))(v2 + 16), *(void *)(v2 + 24), (void *)(v2 + 32));
}

uint64_t sub_1EB2C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1EB68()
{
  sub_34584(*(void *)(v0 + 16), *(void (**)(uint64_t *))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1EB74()
{
  uint64_t v1 = sub_37F20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1EC48()
{
  sub_37F20();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void (**)(void))(v0 + 24);

  sub_34E44(v1, v2);
}

uint64_t sub_1ECB0(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
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
    uint64_t v9 = sub_38110();
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
  return String.subscript.getter(a1, a2, a3, a4);
}

void *sub_1ED4C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_38590();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          char v10 = (void *)sub_384C0();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          char v10 = (void *)swift_unknownObjectRetain();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = [v10 type];
        uint64_t v16 = sub_380C0();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_38620();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }
        swift_unknownObjectRelease();
        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1EEF8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1EF30()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1EF70(uint64_t a1)
{
  sub_15164(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1EF78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1EF88()
{
  return swift_release();
}

uint64_t sub_1EF90()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1EFD0(uint64_t a1)
{
  return sub_155F4(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_1EFE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_20D28;
  return sub_2D394(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_1F0BC(unint64_t a1, char a2)
{
}

uint64_t sub_1F0CC()
{
  return sub_2C508(*(void *)(v0 + 16), *(void (**)(unint64_t, uint64_t))(v0 + 24));
}

uint64_t sub_1F0E0(uint64_t a1)
{
  return sub_166A8(a1, *(void *)(v1 + 16));
}

uint64_t sub_1F0E8(uint64_t a1)
{
  return sub_16C40(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1F0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = *(void *)(v2 + 32);
  char v9 = *(unsigned char *)(v2 + 40);
  uint64_t v10 = *(void *)(v2 + 48);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_20D28;
  return sub_17374(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_1F1DC()
{
  return sub_20BC8((uint64_t (*)(void, void, void, void, void))sub_2CA4C);
}

uint64_t sub_1F1F4(uint64_t a1)
{
  return sub_1945C(a1, v1[2], v1[3], v1[4], v1[5]);
}

void *sub_1F200(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v23 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v21 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v22 = v3 & 0xC000000000000001;
      uint64_t v19 = v4;
      char v20 = (void **)(v3 + 32);
      uint64_t v18 = a2 + 7;
      while (1)
      {
        if (v22)
        {
          uint64_t v6 = (void *)sub_384C0();
          BOOL v7 = __OFADD__(v5++, 1);
          if (v7)
          {
LABEL_29:
            __break(1u);
            return v23;
          }
        }
        else
        {
          if (v5 >= *(void *)(v21 + 16))
          {
            __break(1u);
            goto LABEL_32;
          }
          uint64_t v6 = v20[v5];
          swift_unknownObjectRetain();
          BOOL v7 = __OFADD__(v5++, 1);
          if (v7) {
            goto LABEL_29;
          }
        }
        id v8 = [v6 eventName];
        uint64_t v9 = sub_380C0();
        unint64_t v3 = (unint64_t)v10;

        uint64_t v11 = (void *)a2[2];
        if (v11) {
          break;
        }
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
LABEL_5:
        if (v5 == v4) {
          return v23;
        }
      }
      uint64_t v12 = a2;
      BOOL v13 = a2[4] == v9 && a2[5] == v3;
      if (v13 || (sub_38620() & 1) != 0) {
        break;
      }
      if (v11 == (void *)((char *)&dword_0 + 1))
      {
LABEL_26:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      uint64_t v14 = v18;
      uint64_t v15 = 1;
      while (1)
      {
        a2 = (void *)(v15 + 1);
        if (__OFADD__(v15, 1)) {
          break;
        }
        BOOL v16 = *(v14 - 1) == v9 && *v14 == v3;
        if (v16 || (sub_38620() & 1) != 0) {
          goto LABEL_15;
        }
        v14 += 2;
        ++v15;
        if (a2 == v11) {
          goto LABEL_26;
        }
      }
LABEL_32:
      __break(1u);
LABEL_33:
      uint64_t v4 = sub_38590();
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }
LABEL_15:
    swift_bridgeObjectRelease();
    sub_38500();
    sub_38530();
    sub_38540();
    unint64_t v3 = (unint64_t)&v23;
    sub_38510();
LABEL_16:
    uint64_t v4 = v19;
    a2 = v12;
    goto LABEL_5;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_1F438(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_16:
    uint64_t v3 = sub_38590();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (v3)
    {
LABEL_3:
      unint64_t v4 = 0;
      unint64_t v14 = v2 & 0xC000000000000001;
      uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if (v14)
        {
          uint64_t v6 = (void *)sub_384C0();
          unint64_t v7 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
LABEL_13:
            __break(1u);
            return _swiftEmptyArrayStorage;
          }
        }
        else
        {
          if (v4 >= *(void *)(v5 + 16))
          {
            __break(1u);
            goto LABEL_16;
          }
          uint64_t v6 = *(void **)(v2 + 8 * v4 + 32);
          swift_unknownObjectRetain();
          unint64_t v7 = v4 + 1;
          if (__OFADD__(v4, 1)) {
            goto LABEL_13;
          }
        }
        unint64_t v8 = v2;
        id v9 = [v6 eventName];
        uint64_t v10 = sub_380C0();
        uint64_t v12 = v11;

        LOBYTE(v9) = sub_1A198(v10, v12, a2);
        swift_bridgeObjectRelease();
        if (v9)
        {
          sub_38500();
          sub_38530();
          sub_38540();
          sub_38510();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        unint64_t v2 = v8;
        ++v4;
        if (v7 == v3) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1F5D4(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1F614()
{
  uint64_t v1 = *(void *)(sub_5568(&qword_46AD0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = (v4 + v2 + v3) & ~v2;
  swift_release();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_37F20();
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  if (!v9(v0 + v5, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v5, v7);
  }
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

void sub_1F7C0()
{
  uint64_t v1 = *(void *)(sub_5568(&qword_46AD0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = (v4 + v2 + v3) & ~v2;
  unint64_t v6 = (v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = v0 + v5;
  uint64_t v9 = *(void *)(v0 + v6);
  uint64_t v10 = *(void *)(v0 + v6 + 8);
  uint64_t v11 = (uint64_t *)(v0 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];

  sub_34154(v7, v0 + v3, v8, v9, v10, v12, v13);
}

uint64_t sub_1F878(uint64_t a1)
{
  return sub_27530(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

ValueMetadata *type metadata accessor for Context()
{
  return &type metadata for Context;
}

uint64_t sub_1F890()
{
  return type metadata accessor for ManagerConfiguration();
}

uint64_t sub_1F898()
{
  uint64_t result = sub_37E90();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ManagerConfiguration(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for ManagerConfiguration);
}

uint64_t dispatch thunk of ManagerConfiguration.__allocating_init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for Manager(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for Manager);
}

uint64_t dispatch thunk of Manager.__allocating_init(configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of static Manager.destroyPersistentStore(directory:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of Manager.submit(event:)()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of Manager.unitTestOnlyLocalStorage.getter()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of Manager.cloudSyncVersions(dataType:completion:)()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.updateCloudVersion(cloudSyncVersions:completion:)()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.getLastCloudSyncTimestamp(completion:)()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.reloff + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.setLastCloudSyncTimestamp(_:completion:)()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of Manager.restoreFromSync(configuration:properties:)()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t sub_1FB14()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1FB4C()
{
}

uint64_t sub_1FB7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1FBC4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1FC20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1FC7C()
{
  return sub_207E0((uint64_t *)&unk_46B80);
}

uint64_t sub_1FC88()
{
  sub_5568((uint64_t *)&unk_46B80);

  return sub_19690();
}

uint64_t sub_1FD00()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1FD48(void *a1, char a2)
{
  sub_190BC(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_1FD5C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_1FD84(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_1FD90(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

uint64_t sub_1FDA4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1FDDC(uint64_t a1)
{
  return sub_168E0(a1, *(uint64_t (**)(void *))(v1 + 16));
}

uint64_t sub_1FDFC()
{
  return sub_20BC8(sub_26F74);
}

uint64_t sub_1FE18()
{
  return sub_20BC8(sub_27114);
}

uint64_t sub_1FE30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5568(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1FE94()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1FEE4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 48);
  char v5 = *(unsigned char *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v7;
  *(void *)uint64_t v7 = v2;
  *(void *)(v7 + 8) = sub_20D28;
  *(unsigned char *)(v7 + 72) = v5;
  *(void *)(v7 + 40) = v4;
  *(void *)(v7 + 48) = v6;
  *(_OWORD *)(v7 + 24) = v8;
  *(void *)(v7 + 16) = a1;
  return _swift_task_switch(sub_189C8, 0, 0);
}

uint64_t sub_1FFBC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_20D28;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_46BC0 + dword_46BC0);
  return v6(a1, v4);
}

uint64_t sub_20078(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_20D28;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_184EC, 0, 0);
}

uint64_t sub_2012C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_201E4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_46BC0 + dword_46BC0);
  return v6(a1, v4);
}

uint64_t sub_201E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_202DC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_20324(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_20D28;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_18208, 0, 0);
}

uint64_t sub_203DC(uint64_t a1)
{
  return sub_18300(a1, *(void *)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_203F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2042C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  if (a7) {
    return swift_errorRetain();
  }
  else {
    return sub_FB8C(a1, a2, a3, a4, a5, a6);
  }
}

uint64_t sub_20438(uint64_t a1)
{
  return sub_186F4(a1, *(void *)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_20444()
{
  uint64_t v1 = sub_5568(&qword_46C18);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_204EC(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_5568(&qword_46C18) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_188BC(a1, v1 + v4, *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_20584(uint64_t a1)
{
  return sub_18BEC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_20598()
{
  return sub_207E0(&qword_46C18);
}

uint64_t sub_205A4(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  sub_5568(&qword_46C18);

  return sub_18E14(a1, v3);
}

uint64_t sub_20628()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

void sub_20678()
{
  sub_27468(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void (**)(void *, void))(v0 + 56), *(void *)(v0 + 64));
}

uint64_t sub_2068C()
{
  return sub_207E0((uint64_t *)&unk_46B80);
}

uint64_t sub_20698(uint64_t a1)
{
  return sub_206A4(a1, (uint64_t *)&unk_46B80);
}

uint64_t sub_206A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(sub_5568(a2) - 8);
  return sub_16DA8(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_2071C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_2076C()
{
  return sub_272B4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void (**)(char *, void))(v0 + 64), *(void *)(v0 + 72));
}

uint64_t sub_2078C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_207D4()
{
  return sub_207E0((uint64_t *)&unk_46C30);
}

uint64_t sub_207E0(uint64_t *a1)
{
  uint64_t v2 = sub_5568(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_2086C(uint64_t a1)
{
  return sub_206A4(a1, (uint64_t *)&unk_46C30);
}

uint64_t sub_20878()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_208B0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_208F0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_20D28;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_46C58 + dword_46C58);
  return v6(a1, v4);
}

uint64_t sub_209A8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_209B4()
{
  unint64_t result = qword_46C80;
  if (!qword_46C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46C80);
  }
  return result;
}

uint64_t sub_20A08()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_20A40(uint64_t a1, char a2)
{
  sub_15BB8(a1, a2 & 1, *(void **)(v2 + 16));
}

uint64_t sub_20A50()
{
  return sub_20BC8((uint64_t (*)(void, void, void, void, void))sub_26A08);
}

uint64_t sub_20A68(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_20A74(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_20A80()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_20AC8()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_20D28;
  *(_OWORD *)(v2 + 56) = v3;
  return _swift_task_switch(sub_147DC, 0, 0);
}

uint64_t sub_20B78()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_20BC8(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_20BE4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_20C34(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_201E4;
  return sub_2D394(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_20D10()
{
  return sub_16288();
}

void sub_20D18()
{
}

void sub_20D84(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 dataType];
  uint64_t v4 = sub_380C0();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

void sub_20DDC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 rawHistoryToken];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_37EB0();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_20E44(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8) >> 60 == 15) {
    Class isa = 0;
  }
  else {
    Class isa = sub_37EA0().super.isa;
  }
  Class v4 = isa;
  [v2 setRawHistoryToken:];
}

uint64_t type metadata accessor for CDMutableCloudSyncVersions()
{
  return self;
}

uint64_t sub_20F6C()
{
  id v1 = [v0 rawHistoryToken];
  if (!v1) {
    return (uint64_t)v1;
  }
  uint64_t v2 = sub_37EB0();
  unint64_t v4 = v3;

  sub_F100(0, &qword_46CC0);
  sub_F100(0, &qword_46CC8);
  uint64_t result = sub_38290();
  id v1 = (id)result;
  if (result)
  {
    sub_F3D4(v2, v4);
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

void sub_21274(void *a1)
{
  uint64_t v2 = v1;
  if (!a1)
  {
LABEL_10:
    v11.super.Class isa = 0;
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
    goto LABEL_11;
  }
  unint64_t v4 = self;
  id v22 = 0;
  uint64_t v5 = a1;
  id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];
  id v7 = v22;
  if (!v6)
  {
    uint64_t v12 = v7;
    uint64_t v13 = (void *)sub_37E30();

    swift_willThrow();
    id v22 = v13;
    sub_5568((uint64_t *)&unk_46CD0);
    sub_F100(0, (unint64_t *)&qword_46930);
    swift_dynamicCast();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_37F50();
    sub_C3DC(v14, (uint64_t)qword_47A80);
    uint64_t v15 = v21;
    BOOL v16 = sub_37F30();
    os_log_type_t v17 = sub_38270();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      char v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      uint64_t v19 = v15;
      sub_38420();
      void *v20 = v15;

      _os_log_impl(&dword_0, v16, v17, "Failed to create rawHistoryToken from data error: %@", v18, 0xCu);
      sub_5568(&qword_46CE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      uint64_t v15 = v5;
    }
    else
    {

      uint64_t v19 = v15;
      BOOL v16 = v5;
    }

    swift_errorRelease();
    goto LABEL_10;
  }
  uint64_t v8 = sub_37EB0();
  unint64_t v10 = v9;

  sub_22C30(v8, v10);
  v11.super.Class isa = sub_37EA0().super.isa;
  sub_F3D4(v8, v10);
LABEL_11:
  [v2 setRawHistoryToken:v11.super.isa];

  sub_F3C0(v8, v10);
}

void (*sub_21594(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_20F6C();
  return sub_215DC;
}

void sub_215DC(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    sub_21274(v2);
  }
  else
  {
    sub_21274(*a1);
  }
}

id CDCloudSyncVersions.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CDCloudSyncVersions();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id CDCloudSyncVersions.__deallocating_deinit()
{
  return sub_22888(type metadata accessor for CDCloudSyncVersions);
}

uint64_t sub_21718()
{
  id v1 = [*v0 dataType];
  uint64_t v2 = sub_380C0();

  return v2;
}

uint64_t sub_21770()
{
  return sub_20F6C();
}

id sub_21794()
{
  return [*v0 historyTokenOffset];
}

id sub_217A4()
{
  return [*v0 cloudVersion];
}

id sub_217B4()
{
  return [*v0 localVersion];
}

id sub_217C4()
{
  return [*v0 syncVersion];
}

uint64_t sub_217D4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess();
  *unint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21840()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21898(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_218F8())()
{
  return j_j__swift_endAccess;
}

void sub_21954(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

void *sub_219B8()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_21A08(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_21A5C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21AB8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21B00(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_21B4C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21BA8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21BF0(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_21C3C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21C98()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21CE0(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_21D2C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21D88()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21DD0(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_21E1C())()
{
  return j__swift_endAccess;
}

uint64_t sub_21EE4()
{
  uint64_t v1 = v0;
  sub_38480(103);
  v9._countAndFlagsBits = 0x6570795461746164;
  v9._object = (void *)0xEA0000000000203ALL;
  sub_38120(v9);
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess();
  uint64_t v3 = *v2;
  unint64_t v4 = (void *)v2[1];
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v3;
  v10._object = v4;
  sub_38120(v10);
  swift_bridgeObjectRelease();
  v11._object = (void *)0x800000000003B520;
  v11._countAndFlagsBits = 0xD000000000000010;
  sub_38120(v11);
  swift_beginAccess();
  v12._countAndFlagsBits = sub_38600();
  sub_38120(v12);
  swift_bridgeObjectRelease();
  v13._object = (void *)0x800000000003B540;
  v13._countAndFlagsBits = 0xD000000000000010;
  sub_38120(v13);
  swift_beginAccess();
  v14._countAndFlagsBits = sub_38600();
  sub_38120(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0x6556636E7973202CLL;
  v15._object = (void *)0xEF203A6E6F697372;
  sub_38120(v15);
  swift_beginAccess();
  v16._countAndFlagsBits = sub_38600();
  sub_38120(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0x79726F7473696820;
  v17._object = (void *)0xEE003A6E656B6F54;
  sub_38120(v17);
  id v5 = (id *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  id v6 = *v5;
  sub_5568(&qword_46D18);
  v18._countAndFlagsBits = sub_380E0();
  sub_38120(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 0xD000000000000014;
  v19._object = (void *)0x800000000003B560;
  sub_38120(v19);
  swift_beginAccess();
  v20._countAndFlagsBits = sub_38600();
  sub_38120(v20);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_380D0();
  swift_bridgeObjectRelease();
  return v7;
}

void sub_22208(void *a1)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v3 = sub_380A0();
  swift_bridgeObjectRelease();
  NSString v4 = sub_380A0();
  [a1 encodeObject:v3 forKey:v4];

  id v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
  swift_beginAccess();
  uint64_t v6 = *v5;
  NSString v7 = sub_380A0();
  [a1 encodeInt64:v6 forKey:v7];

  uint64_t v8 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
  swift_beginAccess();
  uint64_t v9 = *v8;
  NSString v10 = sub_380A0();
  [a1 encodeInt64:v9 forKey:v10];

  Swift::String v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
  swift_beginAccess();
  uint64_t v12 = *v11;
  NSString v13 = sub_380A0();
  [a1 encodeInt64:v12 forKey:v13];

  Swift::String v14 = (id *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  id v15 = *v14;
  NSString v16 = sub_380A0();
  [a1 encodeObject:v15 forKey:v16];

  Swift::String v17 = (uint64_t *)(v1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset);
  swift_beginAccess();
  uint64_t v18 = *v17;
  NSString v19 = sub_380A0();
  [a1 encodeInt64:v18 forKey:v19];
}

uint64_t CDMutableCloudSyncVersions.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CDMutableCloudSyncVersions.init(coder:)(a1);
}

uint64_t CDMutableCloudSyncVersions.init(coder:)(void *a1)
{
  id v3 = (void **)&v1[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken];
  *(void *)&v1[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken] = 0;
  sub_F100(0, &qword_46D20);
  NSString v4 = v1;
  uint64_t v5 = sub_383F0();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    sub_380B0();
  }
  NSString v7 = *v3;

  type metadata accessor for CDMutableCloudSyncVersions();
  swift_deallocPartialClassInstance();
  return 0;
}

void CDMutableCloudSyncVersions.init()()
{
}

id CDMutableCloudSyncVersions.__deallocating_deinit()
{
  return sub_22888(type metadata accessor for CDMutableCloudSyncVersions);
}

id sub_22888(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_22910()
{
  uint64_t v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_2296C()
{
  uint64_t v1 = (void **)(*v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

uint64_t sub_229C0()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_22A0C()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_22A58()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_22AA4()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion;
  swift_beginAccess();
  return *(void *)v1;
}

id sub_22AF0(void *a1, char *a2)
{
  id v3 = (void **)&a2[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken];
  *(void *)&a2[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken] = 0;
  NSString v4 = a2;
  id v5 = [a1 dataType];
  uint64_t v6 = sub_380C0();
  uint64_t v8 = v7;

  uint64_t v9 = (uint64_t *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType];
  uint64_t *v9 = v6;
  v9[1] = v8;
  id v10 = [a1 cloudVersion];
  *(void *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion] = v10;
  id v11 = [a1 localVersion];
  *(void *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion] = v11;
  id v12 = [a1 syncVersion];
  *(void *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion] = v12;
  uint64_t v13 = sub_20F6C();
  swift_beginAccess();
  Swift::String v14 = *v3;
  *id v3 = (void *)v13;

  id v15 = [a1 historyTokenOffset];
  *(void *)&v4[OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset] = v15;

  v17.receiver = v4;
  v17.super_class = (Class)type metadata accessor for CDMutableCloudSyncVersions();
  return [super init];
}

uint64_t sub_22C30(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for CDCloudSyncVersions()
{
  return self;
}

const char *sub_22CAC()
{
  return "dataType";
}

void sub_22CBC(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  NSString v3 = sub_380A0();
  [v2 setDataType:v3];
}

const char *sub_22D20()
{
  return "rawHistoryToken";
}

const char *sub_22D34()
{
  return "historyTokenOffset";
}

id sub_22D40@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 historyTokenOffset];
  *a2 = result;
  return result;
}

id sub_22D74(void *a1, id *a2)
{
  return [*a2 setHistoryTokenOffset:*a1];
}

const char *sub_22D88()
{
  return "cloudVersion";
}

id sub_22D94@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 cloudVersion];
  *a2 = result;
  return result;
}

id sub_22DC8(void *a1, id *a2)
{
  return [*a2 setCloudVersion:*a1];
}

const char *sub_22DDC()
{
  return "localVersion";
}

id sub_22DE8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 localVersion];
  *a2 = result;
  return result;
}

id sub_22E1C(void *a1, id *a2)
{
  return [*a2 setLocalVersion:*a1];
}

const char *sub_22E30()
{
  return "syncVersion";
}

id sub_22E3C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 syncVersion];
  *a2 = result;
  return result;
}

id sub_22E70(void *a1, id *a2)
{
  return [*a2 setSyncVersion:*a1];
}

uint64_t sub_22E84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20F6C();
  *a1 = result;
  return result;
}

void sub_22EB0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_21274(v1);
}

uint64_t sub_22EE0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  NSString v3 = (void *)(*a1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_dataType);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id sub_22F3C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  NSString v3 = (void **)(*a1 + OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyToken);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t sub_22FA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_22FF8(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset, a2);
}

uint64_t sub_22FB0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_23054(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_historyTokenOffset);
}

uint64_t sub_22FBC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_22FF8(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion, a2);
}

uint64_t sub_22FC8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_23054(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_cloudVersion);
}

uint64_t sub_22FD4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_22FF8(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion, a2);
}

uint64_t sub_22FE0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_23054(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_localVersion);
}

uint64_t sub_22FEC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_22FF8(a1, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion, a2);
}

uint64_t sub_22FF8@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_23048(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_23054(a1, a2, a3, a4, &OBJC_IVAR____TtC19EngagementCollector26CDMutableCloudSyncVersions_syncVersion);
}

uint64_t sub_23054(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.historyToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.historyTokenOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.cloudVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.localVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of CDCloudSyncVersionsProtocol.syncVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t method lookup function for CDCloudSyncVersions(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CDCloudSyncVersions);
}

uint64_t dispatch thunk of CDCloudSyncVersions.historyToken.getter()
{
  return (*(uint64_t (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDCloudSyncVersions.historyToken.setter()
{
  return (*(uint64_t (**)(void))((char *)&stru_20.nsects + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDCloudSyncVersions.historyToken.modify()
{
  return (*(uint64_t (**)(void))&stru_68.sectname[swift_isaMask & *v0])();
}

uint64_t method lookup function for CDMutableCloudSyncVersions(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CDMutableCloudSyncVersions);
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.dataType.getter()
{
  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 8])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.dataType.setter()
{
  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.dataType.modify()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyToken.getter()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyToken.setter()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyToken.modify()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyTokenOffset.getter()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyTokenOffset.setter()
{
  return (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.historyTokenOffset.modify()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.cloudVersion.getter()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.cloudVersion.setter()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) + 8])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.cloudVersion.modify()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.localVersion.getter()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.localVersion.setter()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.localVersion.modify()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.reloff + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.syncVersion.getter()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.syncVersion.setter()
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.syncVersion.modify()
{
  return (*(uint64_t (**)(void))&stru_108.sectname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.encode(with:)()
{
  return (*(uint64_t (**)(void))&stru_108.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of CDMutableCloudSyncVersions.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

Swift::Void __swiftcall LocalStorage.purgeAllIfNeeded()()
{
  uint64_t v1 = sub_37F20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v12 - v6;
  sub_24F78((uint64_t)&v12 - v6);
  sub_37EE0();
  char v8 = sub_37ED0();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  v9(v7, v1);
  if (v8)
  {
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    id v11 = (void *)swift_allocObject();
    v11[2] = v0;
    v11[3] = sub_25204;
    v11[4] = v10;
    swift_retain_n();
    swift_retain();
    sub_32984((uint64_t)sub_1F0CC, (uint64_t)v11);
    swift_release_n();
    swift_release();
  }
}

Swift::Void __swiftcall LocalStorage.forcePurgeAll()()
{
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  uint64_t v2 = (void *)swift_allocObject();
  v2[2] = v0;
  v2[3] = sub_1F0BC;
  v2[4] = v1;
  swift_retain_n();
  swift_retain();
  sub_32984((uint64_t)sub_20D7C, (uint64_t)v2);
  swift_release_n();

  swift_release();
}

uint64_t sub_2387C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native)
  {
    int64_t v8 = v3[3] >> 1;
    if (v8 >= v5)
    {
      unint64_t v9 = *(void *)(a1 + 16);
      if (v9) {
        goto LABEL_5;
      }
LABEL_18:
      if (!v2) {
        goto LABEL_19;
      }
      goto LABEL_21;
    }
  }
  if (v4 <= v5) {
    int64_t v16 = v4 + v2;
  }
  else {
    int64_t v16 = v4;
  }
  uint64_t v3 = sub_29048(isUniquelyReferenced_nonNull_native, v16, 1, v3);
  int64_t v8 = v3[3] >> 1;
  unint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v10 = v3[2];
  if (v8 - v10 < (uint64_t)v9)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v11 = (unint64_t)&v3[7 * v10 + 4];
  if (a1 + 32 < v11 + 56 * v9 && v11 < a1 + 32 + 56 * v9) {
    goto LABEL_24;
  }
  sub_5568(&qword_46C00);
  swift_arrayInitWithCopy();
  if (v9 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v13 = v3[2];
  BOOL v14 = __OFADD__(v13, v9);
  uint64_t v15 = v13 + v9;
  if (!v14)
  {
    v3[2] = v15;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

uint64_t sub_239FC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v8 = a4 >> 1;
  uint64_t v9 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
  uint64_t v11 = v10 + v9;
  if (!__OFADD__(v10, v9)) {
    goto LABEL_4;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_38590();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_384D0();
  swift_bridgeObjectRelease();
  *int64_t v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
  if (v8 == v5)
  {
    while (v9 > 0)
    {
      __break(1u);
LABEL_11:
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_38590();
      swift_bridgeObjectRelease();
      uint64_t v11 = v14 + v9;
      if (__OFADD__(v14, v9)) {
        goto LABEL_14;
      }
LABEL_4:
      unint64_t v7 = *v4;
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *int64_t v4 = v7;
      if (!isUniquelyReferenced_nonNull_bridgeObject) {
        goto LABEL_15;
      }
      if ((v7 & 0x8000000000000000) != 0) {
        goto LABEL_15;
      }
      if ((v7 & 0x4000000000000000) != 0) {
        goto LABEL_15;
      }
      uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
      if (v11 > *(void *)((char *)&dword_18 + (v7 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_15;
      }
      if (v8 != v5) {
        goto LABEL_18;
      }
    }
    goto LABEL_25;
  }
LABEL_18:
  uint64_t v15 = *(void *)(v13 + 16);
  if ((*(void *)(v13 + 24) >> 1) - v15 < v9)
  {
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    uint64_t result = sub_385E0();
    __break(1u);
    return result;
  }
  if (v9 < 0) {
    goto LABEL_30;
  }
  unint64_t v16 = v13 + 8 * v15 + 32;
  unint64_t v17 = v6 + 8 * v5;
  if (v17 < v16 + 8 * v9 && v16 < v17 + 8 * v9) {
    goto LABEL_30;
  }
  type metadata accessor for CDProperty();
  swift_arrayInitWithCopy();
  if (v9)
  {
    uint64_t v18 = *(void *)((char *)&dword_10 + (*v4 & 0xFFFFFFFFFFFFFF8));
    BOOL v19 = __OFADD__(v18, v9);
    uint64_t v20 = v18 + v9;
    if (!v19)
    {
      *(void *)((char *)&dword_10 + (*v4 & 0xFFFFFFFFFFFFFF8)) = v20;
      goto LABEL_25;
    }
    goto LABEL_29;
  }
LABEL_25:
  swift_unknownObjectRelease();

  return sub_38190();
}

void sub_23C8C(unint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_38590();
      if (v3) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return;
        }
        swift_beginAccess();
        for (uint64_t i = 0; i != v3; ++i)
        {
          if ((a1 & 0xC000000000000001) != 0)
          {
            uint64_t v5 = (void *)sub_384C0();
          }
          else
          {
            uint64_t v5 = *(void **)(a1 + 8 * i + 32);
            swift_unknownObjectRetain();
          }
          uint64_t Strong = swift_weakLoadStrong();
          if (Strong)
          {
            uint64_t v7 = Strong;
            swift_getObjectType();
            sub_25C98(v5, v7);
            swift_unknownObjectRelease();
            swift_release();
          }
          else
          {
            swift_unknownObjectRelease();
          }
        }
      }
    }
    sub_F3B4(a1, 0);
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_26668();
      swift_release();
    }
    return;
  }
  swift_errorRetain();
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_37F50();
  sub_C3DC(v8, (uint64_t)qword_47A80);
  swift_errorRetain();
  swift_errorRetain();
  oslog = sub_37F30();
  os_log_type_t v9 = sub_38270();
  if (os_log_type_enabled(oslog, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    v14[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_38670();
    sub_2E85C(v11, v12, v14);
    sub_38420();
    swift_bridgeObjectRelease();
    sub_F3B4(a1, 1);
    sub_F3B4(a1, 1);
    _os_log_impl(&dword_0, oslog, v9, "Something wrong happened while fetching all configuration: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    sub_F3B4(a1, 1);
  }
  else
  {
    sub_F3B4(a1, 1);
    sub_F3B4(a1, 1);
    swift_errorRelease();
  }
}

void sub_23FD4(unint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_38590();
      if (v3) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 >= 1)
        {
          swift_beginAccess();
          for (uint64_t i = 0; i != v3; ++i)
          {
            if ((a1 & 0xC000000000000001) != 0)
            {
              uint64_t v5 = (void *)sub_384C0();
            }
            else
            {
              uint64_t v5 = *(void **)(a1 + 8 * i + 32);
              swift_unknownObjectRetain();
            }
            if (swift_weakLoadStrong())
            {
              sub_24310(v5);
              swift_unknownObjectRelease();
              swift_release();
            }
            else
            {
              swift_unknownObjectRelease();
            }
          }
          uint64_t v11 = a1;
          char v12 = 0;
          goto LABEL_18;
        }
        __break(1u);
        return;
      }
    }
    sub_F3B4(a1, 0);
    return;
  }
  swift_errorRetain();
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_37F50();
  sub_C3DC(v6, (uint64_t)qword_47A80);
  swift_errorRetain();
  swift_errorRetain();
  oslog = sub_37F30();
  os_log_type_t v7 = sub_38270();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v14[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_38670();
    uint64_t v14[3] = sub_2E85C(v9, v10, v14);
    sub_38420();
    swift_bridgeObjectRelease();
    sub_F3B4(a1, 1);
    sub_F3B4(a1, 1);
    _os_log_impl(&dword_0, oslog, v7, "Something wrong happened while fetching all configuration: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v11 = a1;
    char v12 = 1;
LABEL_18:
    sub_F3B4(v11, v12);
    return;
  }
  sub_F3B4(a1, 1);
  sub_F3B4(a1, 1);
  swift_errorRelease();
}

void sub_24310(void *a1)
{
  unint64_t v2 = a1;
  id v3 = [a1 eventName];
  uint64_t v4 = sub_380C0();
  uint64_t v6 = v5;

  os_log_type_t v7 = (os_unfair_lock_s *)(*(void *)(v1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v7);
  sub_26858(&v31);
  os_unfair_lock_unlock(v7);
  id v8 = v31;
  unint64_t v9 = sub_E6F8(v4, v6);
  swift_bridgeObjectRelease();

  if (v9)
  {
    if (v9 >> 62) {
      goto LABEL_18;
    }
    uint64_t v10 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    for (uint64_t i = v2; v10; uint64_t i = v2)
    {
      uint64_t v11 = 4;
      while (1)
      {
        id v12 = (v9 & 0xC000000000000001) != 0 ? (id)sub_384C0() : *(id *)(v9 + 8 * v11);
        uint64_t v13 = v12;
        unint64_t v2 = (void *)(v11 - 3);
        if (__OFADD__(v11 - 4, 1)) {
          break;
        }
        __chkstk_darwin(v12);
        os_unfair_lock_lock(v7);
        sub_26858(&v31);
        os_unfair_lock_unlock(v7);
        id v14 = v31;
        [v31 deleteObject:v13];

        ++v11;
        if (v2 == (void *)v10) {
          goto LABEL_10;
        }
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain_n();
      uint64_t v10 = sub_38590();
      swift_bridgeObjectRelease();
    }
LABEL_10:
    uint64_t v15 = swift_bridgeObjectRelease_n();
    __chkstk_darwin(v15);
    os_unfair_lock_lock(v7);
    sub_26858(&v31);
    os_unfair_lock_unlock(v7);
    id v16 = v31;
    id v31 = 0;
    unsigned __int8 v17 = [v16 save:&v31];

    id v18 = v31;
    if ((v17 & 1) == 0)
    {
      BOOL v19 = v18;
      sub_37E30();

      swift_willThrow();
      if (qword_466A0 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_37F50();
      sub_C3DC(v20, (uint64_t)qword_47A80);
      swift_unknownObjectRetain();
      swift_errorRetain();
      swift_unknownObjectRetain();
      swift_errorRetain();
      uint64_t v21 = sub_37F30();
      os_log_type_t v22 = sub_38270();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc();
        id v31 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 136315394;
        id v24 = [i eventName];
        uint64_t v25 = sub_380C0();
        unint64_t v27 = v26;

        sub_2E85C(v25, v27, (uint64_t *)&v31);
        sub_38420();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v28 = sub_38670();
        sub_2E85C(v28, v29, (uint64_t *)&v31);
        sub_38420();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v21, v22, "Something wrong happened while deleting properties from the local storage %s: %s", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_unknownObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
  }
}

Swift::Void __swiftcall LocalStorage.purge(propertyName:)(Swift::String propertyName)
{
  object = propertyName._object;
  uint64_t countAndFlagsBits = propertyName._countAndFlagsBits;
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v4;
  v5[3] = countAndFlagsBits;
  v5[4] = object;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = countAndFlagsBits;
  v6[3] = object;
  v6[4] = v1;
  void v6[5] = sub_252A8;
  v6[6] = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_25300, (uint64_t)v6);
  swift_release();
  swift_release();

  swift_release();
}

void sub_24920(void *a1, char a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_37F50();
    sub_C3DC(v9, (uint64_t)qword_47A80);
    sub_1FD84(a1, 1);
    swift_bridgeObjectRetain();
    sub_1FD84(a1, 1);
    swift_bridgeObjectRetain();
    oslog = sub_37F30();
    os_log_type_t v10 = sub_38270();
    if (os_log_type_enabled(oslog, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      v15[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_2E85C(a4, a5, v15);
      sub_38420();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v12 = sub_38670();
      uint64_t v16 = sub_2E85C(v12, v13, v15);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_1FD90(a1, 1);
      sub_1FD90(a1, 1);
      _os_log_impl(&dword_0, oslog, v10, "No configuration found to purge %s: %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_1FD90(a1, 1);
    }
    else
    {
      sub_1FD90(a1, 1);
      swift_bridgeObjectRelease_n();
      sub_1FD90(a1, 1);
      sub_1FD90(a1, 1);
    }
  }
  else if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      sub_25310(a1, Strong);
      sub_1FD90(a1, 0);
      swift_release();
    }
  }
}

uint64_t sub_24C08(id *a1)
{
  uint64_t v2 = sub_5568(&qword_46AD0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37F20();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v17 - v10;
  id v12 = [*a1 createdAt];
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  unint64_t v13 = v12;
  sub_37F00();

  id v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_F42C((uint64_t)v4, &qword_46AD0);
    char v15 = 0;
    return v15 & 1;
  }
  v14(v11, v4, v5);
  sub_26610();
  char v15 = sub_38090() ^ 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v15 & 1;
}

uint64_t sub_24E5C(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)sub_384C0() : *(id *)(a3 + 8 * v7 + 32);
      uint64_t v9 = v8;
      id v13 = v8;
      char v10 = a1(&v13);

      if (v3 || (v10 & 1) != 0) {
        break;
      }
      uint64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = sub_38590();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v11 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

uint64_t sub_24F78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_5568(&qword_46AD0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self standardUserDefaults];
  NSString v6 = sub_380A0();
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    sub_38440();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_267D4((uint64_t)v13, (uint64_t)v14);
  if (v15)
  {
    uint64_t v8 = sub_37F20();
    int v9 = swift_dynamicCast();
    uint64_t v10 = *(void *)(v8 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v4, v9 ^ 1u, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v8) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v4, v8);
    }
  }
  else
  {
    sub_F42C((uint64_t)v14, &qword_466E0);
    uint64_t v12 = sub_37F20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  }
  sub_F42C((uint64_t)v4, &qword_46AD0);
  return sub_37EF0();
}

uint64_t sub_251CC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_25204(unint64_t a1, char a2)
{
}

uint64_t sub_25210()
{
  return sub_25258((void (*)(void))&_swift_release);
}

uint64_t sub_25228()
{
  return sub_25258((void (*)(void))&_swift_release);
}

uint64_t sub_25240()
{
  return sub_25258((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_25258(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 32));

  return _swift_deallocObject(v1, 40, 7);
}

void sub_252A8(void *a1, char a2)
{
  sub_24920(a1, a2 & 1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_252B8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_25300()
{
  return sub_2CA4C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(id, uint64_t))(v0 + 40));
}

void sub_25310(void *a1, uint64_t a2)
{
  uint64_t v83 = a2;
  uint64_t v3 = sub_37F20();
  uint64_t v80 = *(void *)(v3 - 8);
  uint64_t v81 = v3;
  __chkstk_darwin(v3);
  int64_t v82 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [a1 ageToExpire];
  NSString v6 = (char **)[a1 countLimit];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL || v6 != (char **)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t p_attr = (uint64_t)v6;
    id v9 = [a1 eventName];
    uint64_t v10 = sub_380C0();
    uint64_t v12 = v11;

    __chkstk_darwin(v13);
    *(&v76 - 2) = (uint64_t)sub_25C60;
    *(&v76 - 1) = v14;
    uint64_t v16 = v15 + 4;
    os_unfair_lock_lock(v15 + 4);
    sub_25C7C(&v85);
    os_unfair_lock_unlock(v16);
    unsigned __int8 v17 = (void *)v85;
    unint64_t v18 = sub_E6F8(v10, v12);
    swift_bridgeObjectRelease();

    if (v18)
    {
      unint64_t v85 = (unint64_t)_swiftEmptyArrayStorage;
      BOOL v19 = (uint64_t *)(v18 >> 62);
      if (v18 >> 62) {
        goto LABEL_58;
      }
      uint64_t v20 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
      while (p_attr >= v20)
      {
LABEL_24:
        if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          if (__OFSUB__(0, v5)) {
            goto LABEL_65;
          }
          uint64_t v34 = v82;
          uint64_t v35 = sub_37EE0();
          __chkstk_darwin(v35);
          *(&v76 - 2) = (uint64_t)v34;
          uint64_t v36 = sub_24E5C(sub_265F0, (uint64_t)(&v76 - 4), v18);
          if (v37) {
            uint64_t v38 = v20;
          }
          else {
            uint64_t v38 = v36;
          }
          if (v38 > 0 && v20 >= v38)
          {
            if (v19)
            {
              int64_t v40 = v19;
              swift_bridgeObjectRetain();
              uint64_t v41 = sub_38590();
              swift_bridgeObjectRelease();
              if (v41 < 0) {
                goto LABEL_71;
              }
              swift_bridgeObjectRetain();
              uint64_t v39 = sub_38590();
              swift_bridgeObjectRelease();
              BOOL v19 = v40;
            }
            else
            {
              uint64_t v39 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
            }
            if (v39 < v38) {
              goto LABEL_70;
            }
            if ((v18 & 0xC000000000000001) == 0) {
              goto LABEL_42;
            }
            type metadata accessor for CDProperty();
            Swift::Int v42 = 0;
            do
            {
              Swift::Int v43 = v42 + 1;
              sub_384B0(v42);
              Swift::Int v42 = v43;
            }
            while (v38 != v43);
            if (v19)
            {
              uint64_t v44 = a1;
              swift_bridgeObjectRetain();
              BOOL v19 = (uint64_t *)sub_385A0();
              uint64_t v46 = v48;
              uint64_t v45 = v49;
              unint64_t v47 = v50;
              swift_bridgeObjectRelease_n();
            }
            else
            {
LABEL_42:
              uint64_t v44 = a1;
              uint64_t v45 = 0;
              BOOL v19 = (uint64_t *)(v18 & 0xFFFFFFFFFFFFFF8);
              uint64_t v46 = (v18 & 0xFFFFFFFFFFFFFF8) + 32;
              unint64_t v47 = (2 * v38) | 1;
            }
            sub_239FC((uint64_t)v19, v46, v45, v47);
            a1 = v44;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v80 + 8))(v34, v81);
        }
        id v79 = a1;
        unint64_t v51 = v85;
        if (v85 >> 62)
        {
          swift_bridgeObjectRetain_n();
          a1 = (void *)sub_38590();
          uint64_t v52 = swift_bridgeObjectRelease();
          int64_t v82 = (char *)v51;
          if (!a1)
          {
LABEL_51:
            swift_bridgeObjectRelease_n();
            uint64_t v58 = swift_bridgeObjectRelease();
            __chkstk_darwin(v58);
            uint64_t v59 = v83;
            *(&v76 - 2) = (uint64_t)sub_25C60;
            *(&v76 - 1) = v59;
            os_unfair_lock_lock(v16);
            sub_26858(v84);
            os_unfair_lock_unlock(v16);
            id v60 = v84[0];
            v84[0] = 0;
            unsigned int v61 = [v60 save:v84];

            id v62 = v84[0];
            if (v61) {
              return;
            }
            id v63 = v62;
            sub_37E30();

            swift_willThrow();
            if (qword_466A0 == -1)
            {
LABEL_53:
              uint64_t v64 = sub_37F50();
              sub_C3DC(v64, (uint64_t)qword_47A80);
              id v65 = v79;
              swift_errorRetain();
              id v66 = v65;
              swift_errorRetain();
              uint64_t v67 = sub_37F30();
              os_log_type_t v68 = sub_38270();
              if (os_log_type_enabled(v67, v68))
              {
                uint64_t v69 = swift_slowAlloc();
                unint64_t v85 = swift_slowAlloc();
                *(_DWORD *)uint64_t v69 = 136315394;
                id v70 = [v66 eventName];
                uint64_t v71 = sub_380C0();
                unint64_t v73 = v72;

                v84[0] = (id)sub_2E85C(v71, v73, (uint64_t *)&v85);
                sub_38420();

                swift_bridgeObjectRelease();
                *(_WORD *)(v69 + 12) = 2080;
                swift_getErrorValue();
                uint64_t v74 = sub_38670();
                v84[0] = (id)sub_2E85C(v74, v75, (uint64_t *)&v85);
                sub_38420();
                swift_bridgeObjectRelease();
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl(&dword_0, v67, v68, "Something wrong happened while deleting properties from the local storage %s: %s", (uint8_t *)v69, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                swift_errorRelease();
              }
              else
              {
                swift_errorRelease();

                swift_errorRelease();
                swift_errorRelease();
              }
              return;
            }
LABEL_68:
            swift_once();
            goto LABEL_53;
          }
        }
        else
        {
          a1 = *(void **)((char *)&dword_10 + (v85 & 0xFFFFFFFFFFFFFF8));
          uint64_t v52 = swift_bridgeObjectRetain_n();
          int64_t v82 = (char *)v51;
          if (!a1) {
            goto LABEL_51;
          }
        }
        unint64_t v18 = 0;
        id v5 = (id)(v51 + 32);
        uint64_t p_attr = (uint64_t)&stru_44FF8.attr;
        while (1)
        {
          uint64_t v53 = (void *)(v18 + 1);
          if (__OFADD__(v18, 1)) {
            break;
          }
          BOOL v19 = &v76;
          __chkstk_darwin(v52);
          uint64_t v54 = v83;
          *(&v76 - 2) = (uint64_t)sub_25C60;
          *(&v76 - 1) = v54;
          id v56 = v55;
          os_unfair_lock_lock(v16);
          sub_26858(v84);
          os_unfair_lock_unlock(v16);
          id v57 = v84[0];
          [v84[0] deleteObject:v56];

          ++v18;
          if (v53 == a1) {
            goto LABEL_51;
          }
        }
        __break(1u);
LABEL_58:
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_38590();
        swift_bridgeObjectRelease();
      }
      unint64_t v21 = p_attr - 1;
      if (__OFSUB__(p_attr, 1))
      {
        __break(1u);
      }
      else if ((v21 & 0x8000000000000000) == 0)
      {
        uint64_t v22 = p_attr;
        if (!__OFADD__(v21, 1))
        {
          if (v19)
          {
            swift_bridgeObjectRetain();
            if (sub_38590() < 0)
            {
              __break(1u);
LABEL_70:
              __break(1u);
LABEL_71:
              __break(1u);
            }
            swift_bridgeObjectRetain();
            uint64_t v23 = sub_38590();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v23 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain();
          }
          if (v23 >= p_attr)
          {
            uint64_t v78 = v20;
            if ((p_attr & 0x8000000000000000) == 0)
            {
              id v77 = v19;
              if ((v18 & 0xC000000000000001) == 0) {
                goto LABEL_21;
              }
              type metadata accessor for CDProperty();
              Swift::Int v24 = 0;
              do
              {
                uint64_t v25 = (char **)(v24 + 1);
                sub_384B0(v24);
                Swift::Int v24 = (Swift::Int)v25;
              }
              while ((char **)p_attr != v25);
              if (v19)
              {
                unint64_t v26 = a1;
                swift_bridgeObjectRetain();
                uint64_t v28 = sub_385A0();
                uint64_t v29 = v31;
                uint64_t v27 = v32;
                unint64_t v30 = v33;
                swift_bridgeObjectRelease_n();
              }
              else
              {
LABEL_21:
                unint64_t v26 = a1;
                uint64_t v27 = 0;
                uint64_t v28 = v18 & 0xFFFFFFFFFFFFFF8;
                uint64_t v29 = (v18 & 0xFFFFFFFFFFFFFF8) + 32;
                unint64_t v30 = (2 * v22) | 1;
              }
              sub_239FC(v28, v29, v27, v30);
              a1 = v26;
              BOOL v19 = v77;
              uint64_t v20 = v78;
              goto LABEL_24;
            }
            goto LABEL_67;
          }
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      __break(1u);
      goto LABEL_64;
    }
  }
}

id sub_25C60@<X0>(void *a1@<X8>)
{
  return sub_2FC68(a1);
}

void *sub_25C7C@<X0>(void *a1@<X8>)
{
  return sub_35C68(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

void sub_25C98(void *a1, uint64_t a2)
{
  uint64_t v82 = a2;
  uint64_t v3 = sub_37F20();
  uint64_t v79 = *(void *)(v3 - 8);
  uint64_t v80 = v3;
  __chkstk_darwin(v3);
  uint64_t v81 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [a1 ageToExpire];
  NSString v6 = (char **)[a1 countLimit];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL || v6 != (char **)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t p_attr = (uint64_t)v6;
    id v9 = [a1 eventName];
    uint64_t v10 = sub_380C0();
    uint64_t v12 = v11;

    __chkstk_darwin(v13);
    *(&v75 - 2) = (uint64_t)sub_25C60;
    *(&v75 - 1) = v14;
    uint64_t v16 = v15 + 4;
    os_unfair_lock_lock(v15 + 4);
    sub_26858(&v84);
    os_unfair_lock_unlock(v16);
    unsigned __int8 v17 = (void *)v84;
    unint64_t v18 = sub_E6F8(v10, v12);
    swift_bridgeObjectRelease();

    if (v18)
    {
      unint64_t v84 = (unint64_t)&_swiftEmptyArrayStorage;
      BOOL v19 = (uint64_t *)(v18 >> 62);
      if (v18 >> 62) {
        goto LABEL_58;
      }
      uint64_t v20 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
      while (p_attr >= v20)
      {
LABEL_24:
        if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          if (__OFSUB__(0, v5)) {
            goto LABEL_65;
          }
          uint64_t v34 = v81;
          uint64_t v35 = sub_37EE0();
          __chkstk_darwin(v35);
          *(&v75 - 2) = (uint64_t)v34;
          uint64_t v36 = sub_24E5C(sub_2683C, (uint64_t)(&v75 - 4), v18);
          if (v37) {
            uint64_t v38 = v20;
          }
          else {
            uint64_t v38 = v36;
          }
          if (v38 > 0 && v20 >= v38)
          {
            if (v19)
            {
              int64_t v40 = v19;
              swift_bridgeObjectRetain();
              uint64_t v41 = sub_38590();
              swift_bridgeObjectRelease();
              if (v41 < 0) {
                goto LABEL_71;
              }
              swift_bridgeObjectRetain();
              uint64_t v39 = sub_38590();
              swift_bridgeObjectRelease();
              BOOL v19 = v40;
            }
            else
            {
              uint64_t v39 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
            }
            if (v39 < v38) {
              goto LABEL_70;
            }
            if ((v18 & 0xC000000000000001) == 0) {
              goto LABEL_42;
            }
            type metadata accessor for CDProperty();
            Swift::Int v42 = 0;
            do
            {
              Swift::Int v43 = v42 + 1;
              sub_384B0(v42);
              Swift::Int v42 = v43;
            }
            while (v38 != v43);
            if (v19)
            {
              uint64_t v44 = a1;
              swift_bridgeObjectRetain();
              BOOL v19 = (uint64_t *)sub_385A0();
              uint64_t v46 = v48;
              uint64_t v45 = v49;
              unint64_t v47 = v50;
              swift_bridgeObjectRelease_n();
            }
            else
            {
LABEL_42:
              uint64_t v44 = a1;
              uint64_t v45 = 0;
              BOOL v19 = (uint64_t *)(v18 & 0xFFFFFFFFFFFFFF8);
              uint64_t v46 = (v18 & 0xFFFFFFFFFFFFFF8) + 32;
              unint64_t v47 = (2 * v38) | 1;
            }
            sub_239FC((uint64_t)v19, v46, v45, v47);
            a1 = v44;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v79 + 8))(v34, v80);
        }
        uint64_t v78 = a1;
        unint64_t v51 = v84;
        if (v84 >> 62)
        {
          swift_bridgeObjectRetain_n();
          a1 = (void *)sub_38590();
          uint64_t v52 = swift_bridgeObjectRelease();
          uint64_t v81 = (char *)v51;
          if (!a1)
          {
LABEL_51:
            swift_bridgeObjectRelease_n();
            uint64_t v58 = swift_bridgeObjectRelease();
            __chkstk_darwin(v58);
            uint64_t v59 = v82;
            *(&v75 - 2) = (uint64_t)sub_25C60;
            *(&v75 - 1) = v59;
            os_unfair_lock_lock(v16);
            sub_26858(v83);
            os_unfair_lock_unlock(v16);
            id v60 = v83[0];
            v83[0] = 0;
            unsigned int v61 = [v60 save:v83];

            id v62 = v83[0];
            if (v61) {
              return;
            }
            id v63 = v62;
            sub_37E30();

            swift_willThrow();
            if (qword_466A0 == -1)
            {
LABEL_53:
              uint64_t v64 = sub_37F50();
              sub_C3DC(v64, (uint64_t)qword_47A80);
              id v65 = v78;
              swift_unknownObjectRetain();
              swift_errorRetain();
              swift_unknownObjectRetain();
              swift_errorRetain();
              id v66 = sub_37F30();
              os_log_type_t v67 = sub_38270();
              if (os_log_type_enabled(v66, v67))
              {
                uint64_t v68 = swift_slowAlloc();
                unint64_t v84 = swift_slowAlloc();
                *(_DWORD *)uint64_t v68 = 136315394;
                id v69 = [v65 eventName];
                uint64_t v70 = sub_380C0();
                unint64_t v72 = v71;

                v83[0] = (id)sub_2E85C(v70, v72, (uint64_t *)&v84);
                sub_38420();
                swift_unknownObjectRelease_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v68 + 12) = 2080;
                swift_getErrorValue();
                uint64_t v73 = sub_38670();
                v83[0] = (id)sub_2E85C(v73, v74, (uint64_t *)&v84);
                sub_38420();
                swift_bridgeObjectRelease();
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl(&dword_0, v66, v67, "Something wrong happened while deleting properties from the local storage %s: %s", (uint8_t *)v68, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                swift_errorRelease();
              }
              else
              {
                swift_errorRelease();
                swift_unknownObjectRelease_n();
                swift_errorRelease();
                swift_errorRelease();
              }
              return;
            }
LABEL_68:
            swift_once();
            goto LABEL_53;
          }
        }
        else
        {
          a1 = *(void **)((char *)&dword_10 + (v84 & 0xFFFFFFFFFFFFFF8));
          uint64_t v52 = swift_bridgeObjectRetain_n();
          uint64_t v81 = (char *)v51;
          if (!a1) {
            goto LABEL_51;
          }
        }
        unint64_t v18 = 0;
        id v5 = (id)(v51 + 32);
        uint64_t p_attr = (uint64_t)&stru_44FF8.attr;
        while (1)
        {
          uint64_t v53 = (void *)(v18 + 1);
          if (__OFADD__(v18, 1)) {
            break;
          }
          BOOL v19 = &v75;
          __chkstk_darwin(v52);
          uint64_t v54 = v82;
          *(&v75 - 2) = (uint64_t)sub_25C60;
          *(&v75 - 1) = v54;
          id v56 = v55;
          os_unfair_lock_lock(v16);
          sub_26858(v83);
          os_unfair_lock_unlock(v16);
          id v57 = v83[0];
          [v83[0] deleteObject:v56];

          ++v18;
          if (v53 == a1) {
            goto LABEL_51;
          }
        }
        __break(1u);
LABEL_58:
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_38590();
        swift_bridgeObjectRelease();
      }
      unint64_t v21 = p_attr - 1;
      if (__OFSUB__(p_attr, 1))
      {
        __break(1u);
      }
      else if ((v21 & 0x8000000000000000) == 0)
      {
        uint64_t v22 = p_attr;
        if (!__OFADD__(v21, 1))
        {
          if (v19)
          {
            swift_bridgeObjectRetain();
            if (sub_38590() < 0)
            {
              __break(1u);
LABEL_70:
              __break(1u);
LABEL_71:
              __break(1u);
            }
            swift_bridgeObjectRetain();
            uint64_t v23 = sub_38590();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v23 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain();
          }
          if (v23 >= p_attr)
          {
            uint64_t v77 = v20;
            if ((p_attr & 0x8000000000000000) == 0)
            {
              uint64_t v76 = v19;
              if ((v18 & 0xC000000000000001) == 0) {
                goto LABEL_21;
              }
              type metadata accessor for CDProperty();
              Swift::Int v24 = 0;
              do
              {
                uint64_t v25 = (char **)(v24 + 1);
                sub_384B0(v24);
                Swift::Int v24 = (Swift::Int)v25;
              }
              while ((char **)p_attr != v25);
              if (v19)
              {
                unint64_t v26 = a1;
                swift_bridgeObjectRetain();
                uint64_t v28 = sub_385A0();
                uint64_t v29 = v31;
                uint64_t v27 = v32;
                unint64_t v30 = v33;
                swift_bridgeObjectRelease_n();
              }
              else
              {
LABEL_21:
                unint64_t v26 = a1;
                uint64_t v27 = 0;
                uint64_t v28 = v18 & 0xFFFFFFFFFFFFFF8;
                uint64_t v29 = (v18 & 0xFFFFFFFFFFFFFF8) + 32;
                unint64_t v30 = (2 * v22) | 1;
              }
              sub_239FC(v28, v29, v27, v30);
              a1 = v26;
              BOOL v19 = v76;
              uint64_t v20 = v77;
              goto LABEL_24;
            }
            goto LABEL_67;
          }
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      __break(1u);
      goto LABEL_64;
    }
  }
}

uint64_t sub_265F0(id *a1)
{
  return sub_24C08(a1) & 1;
}

unint64_t sub_26610()
{
  unint64_t result = qword_46E40;
  if (!qword_46E40)
  {
    sub_37F20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46E40);
  }
  return result;
}

void sub_26668()
{
  uint64_t v0 = sub_37F20();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = self;
  id v5 = [v4 standardUserDefaults];
  sub_37F10();
  Class isa = sub_37EC0().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  NSString v7 = sub_380A0();
  [v5 setObject:isa forKey:v7];

  id v8 = [v4 standardUserDefaults];
  [v8 synchronize];
}

uint64_t sub_267D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_466E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2683C(id *a1)
{
  return sub_265F0(a1) & 1;
}

void *sub_26858@<X0>(void *a1@<X8>)
{
  return sub_25C7C(a1);
}

char *sub_26870(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_38590())
  {
    uint64_t v3 = (char *)_swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)sub_384C0() : *(id *)(a1 + 8 * v4);
      NSString v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 propertyName];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = sub_380C0();
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_28F38(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        unint64_t v14 = *((void *)v3 + 2);
        unint64_t v13 = *((void *)v3 + 3);
        if (v14 >= v13 >> 1) {
          uint64_t v3 = sub_28F38((char *)(v13 > 1), v14 + 1, 1, v3);
        }
        *((void *)v3 + 2) = v14 + 1;
        uint64_t v15 = &v3[16 * v14];
        *((void *)v15 + 4) = v10;
        *((void *)v15 + 5) = v12;
      }
      else
      {
      }
      ++v4;
      if (v7 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_26A08(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = a2;
  uint64_t v11 = *(os_unfair_lock_s **)(a1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock);
  v10[6] = a1;
  uint64_t v12 = v11 + 4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  os_unfair_lock_lock(v12);
  sub_26858(&v21);
  os_unfair_lock_unlock(v12);
  unint64_t v13 = v21;
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = a1;
  uint64_t v14[3] = sub_295E8;
  uint64_t v14[4] = v10;
  swift_retain();
  swift_retain();
  id v15 = [a2 eventName];
  uint64_t v16 = sub_380C0();
  uint64_t v18 = v17;

  swift_unknownObjectRetain();
  id v19 = v13;
  swift_retain();
  sub_10430(v16, v18, (uint64_t)v19, (uint64_t)v19, a2, (void (*)(id, void))sub_2963C);
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return swift_release_n();
}

void sub_26BC4(uint64_t a1, char a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  if (a2)
  {
    swift_errorRetain();
    a3(a1, 1);
    sub_20A74(a1, 1);
  }
  else
  {
    __chkstk_darwin(a1);
    unint64_t v13 = v12 + 4;
    os_unfair_lock_lock(v12 + 4);
    sub_26858(&v16);
    os_unfair_lock_unlock(v13);
    unint64_t v14 = v16;
    swift_retain();
    swift_retain();
    sub_E050(a5, a6, v14, a7, (uint64_t)a3, a4);
  }
}

uint64_t sub_26D10(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_37F50();
    sub_C3DC(v7, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    id v8 = sub_37F30();
    os_log_type_t v9 = sub_38270();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_getErrorValue();
      uint64_t v11 = sub_38670();
      sub_2E85C(v11, v12, &v13);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_20A74(a1, 1);
      sub_20A74(a1, 1);
      _os_log_impl(&dword_0, v8, v9, "Error while inserting property objects to Core Data: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_20A74(a1, 1);
      sub_20A74(a1, 1);
    }

    swift_errorRetain();
    a4(a1, 1);
    sub_20A74(a1, 1);
    return sub_20A74(a1, 1);
  }
  else
  {
    sub_5568(&qword_46E50);
    sub_2964C();
    sub_37F70();
    return ((uint64_t (*)(void, void))a4)(0, 0);
  }
}

uint64_t sub_26F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v9 = (os_unfair_lock_s *)(*(void *)(a3 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v9);
  sub_26858(&v16);
  os_unfair_lock_unlock(v9);
  uint64_t v10 = v16;
  sub_5568(&qword_468C0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_39610;
  *(void *)(v11 + 32) = 7955819;
  *(void *)(v11 + 40) = 0xE300000000000000;
  *(void *)(v11 + 88) = &type metadata for String;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = a1;
  *(void *)(v11 + 72) = a2;
  swift_retain_n();
  swift_bridgeObjectRetain();
  NSString v12 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [self predicateWithFormat:v12 argumentArray:isa];

  sub_A984(v14, 0, 0, 0, 0, 1, (uint64_t)v10, a4, a5);
  return swift_release_n();
}

uint64_t sub_27114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v9 = (os_unfair_lock_s *)(*(void *)(a3 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v9);
  sub_26858(&v16);
  os_unfair_lock_unlock(v9);
  uint64_t v10 = v16;
  sub_5568(&qword_468C0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_39610;
  *(void *)(v11 + 32) = 7955819;
  *(void *)(v11 + 40) = 0xE300000000000000;
  *(void *)(v11 + 88) = &type metadata for String;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = a1;
  *(void *)(v11 + 72) = a2;
  swift_retain_n();
  swift_bridgeObjectRetain();
  NSString v12 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [self predicateWithFormat:v12 argumentArray:isa];

  sub_98F4(v14, 0, 0, 0, 0, 1, (uint64_t)v10, a4, a5);
  return swift_release_n();
}

uint64_t sub_272B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, void (*a7)(char *, void), uint64_t a8)
{
  id v15 = (os_unfair_lock_s *)(*(void *)(a6 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v15);
  sub_26858(&v22);
  os_unfair_lock_unlock(v15);
  uint64_t v16 = v22;
  sub_5568(&qword_468C0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_39610;
  *(void *)(v17 + 32) = 7955819;
  *(void *)(v17 + 40) = 0xE300000000000000;
  *(void *)(v17 + 88) = &type metadata for String;
  *(void *)(v17 + 56) = &type metadata for String;
  *(void *)(v17 + 64) = a1;
  *(void *)(v17 + 72) = a2;
  swift_retain_n();
  swift_bridgeObjectRetain();
  NSString v18 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [self predicateWithFormat:v18 argumentArray:isa];

  sub_992C(v20, 0, 0, a3, a4, a5, (uint64_t)v16, a7, a8);
  return swift_release_n();
}

void sub_27468(unint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(void *, void), uint64_t a7)
{
  uint64_t v13 = (os_unfair_lock_s *)(*(void *)(a5 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v13);
  sub_26858(&v15);
  os_unfair_lock_unlock(v13);
  id v14 = v15;
  _s19EngagementCollector10CDPropertyC21fetchCollectionValues22propertyConfigurations8assetIDs15sortByCreatedAt5limit7context10completionySayAA21PropertyConfiguration_pG_ShySSGSgSbSiSo22NSManagedObjectContextCys6ResultOySayAaK_p_AA0R5ValueOtGs5Error_pGctFZ_0(a1, a2, a3, a4, (uint64_t)v15, a6, a7);
}

uint64_t sub_27530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5568(&qword_46E48);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_32984((uint64_t)sub_279D8, v10);
  return swift_release();
}

uint64_t sub_27688(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    id v5 = _swiftEmptyDictionarySingleton;
LABEL_18:
    unint64_t v26 = v5;
    sub_5568(&qword_46E48);
    return sub_381E0();
  }
  Swift::Int v24 = (os_unfair_lock_s *)(*(void *)(a2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = (uint64_t *)(v3 + 40);
  id v5 = _swiftEmptyDictionarySingleton;
  while (1)
  {
    uint64_t v25 = v2;
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    __chkstk_darwin(v3);
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v24);
    sub_25C7C(&v26);
    os_unfair_lock_unlock(v24);
    uint64_t v8 = v26;
    uint64_t v9 = sub_EC44(v7, v6);

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = v5;
    unint64_t v12 = sub_1A978(v7, v6);
    uint64_t v13 = v5[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v16 = v11;
    if (v5[3] >= v15)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        id v5 = v26;
        if (v11) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_1C9EC();
        id v5 = v26;
        if (v16) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_1BA04(v15, isUniquelyReferenced_nonNull_native);
      unint64_t v17 = sub_1A978(v7, v6);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_21;
      }
      unint64_t v12 = v17;
      id v5 = v26;
      if (v16)
      {
LABEL_3:
        *(void *)(v5[7] + 8 * v12) = v9;
        goto LABEL_4;
      }
    }
    v5[(v12 >> 6) + 8] |= 1 << v12;
    id v19 = (uint64_t *)(v5[6] + 16 * v12);
    uint64_t *v19 = v7;
    v19[1] = v6;
    *(void *)(v5[7] + 8 * v12) = v9;
    uint64_t v20 = v5[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_20;
    }
    v5[2] = v22;
    swift_bridgeObjectRetain();
LABEL_4:
    v4 += 2;
    swift_bridgeObjectRelease();
    uint64_t v3 = swift_bridgeObjectRelease();
    uint64_t v2 = v25 - 1;
    if (v25 == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_38660();
  __break(1u);
  return result;
}

uint64_t sub_27900()
{
  uint64_t v1 = sub_5568(&qword_46E48);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_279D8()
{
  sub_5568(&qword_46E48);
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);

  return sub_27688(v1, v2);
}

uint64_t sub_27A40(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t, uint64_t *, uint64_t), void *a5, uint64_t a6, uint64_t a7)
{
  char v11 = (os_unfair_lock_s *)(*(void *)(v7 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v11);
  sub_26858(&v48);
  os_unfair_lock_unlock(v11);
  uint64_t v38 = v48;
  if (a3 >> 62) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  uint64_t v43 = (uint64_t)a5;
  uint64_t v44 = a7;
  if (!v12)
  {
LABEL_28:
    a5 = _swiftEmptyDictionarySingleton;
LABEL_29:
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_26870(a3);
    id v36 = v38;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_C9E8(a1, a2, (uint64_t)v35, (uint64_t)v36, v36, (uint64_t)a5, a4, v43, a6, v44);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_release();
    return swift_release();
  }
LABEL_3:
  if (v12 >= 1)
  {
    uint64_t v13 = 0;
    unint64_t v14 = a3 & 0xC000000000000001;
    a5 = _swiftEmptyDictionarySingleton;
    uint64_t v46 = v12;
    unint64_t v47 = a3;
    unint64_t v45 = a3 & 0xC000000000000001;
    while (1)
    {
      if (v14) {
        id v15 = (id)sub_384C0();
      }
      else {
        id v15 = *(id *)(a3 + 8 * v13 + 32);
      }
      char v16 = v15;
      id v17 = [v15 propertyName];
      if (v17)
      {
        char v18 = v17;
        a7 = sub_380C0();
        uint64_t v20 = v19;

        id v21 = sub_10230();
        if (v21)
        {
          id v22 = v21;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v48 = a5;
          a3 = sub_1A978(a7, v20);
          uint64_t v25 = a5[2];
          BOOL v26 = (v24 & 1) == 0;
          uint64_t v27 = v25 + v26;
          if (__OFADD__(v25, v26))
          {
            __break(1u);
LABEL_26:
            __break(1u);
LABEL_27:
            swift_bridgeObjectRetain();
            uint64_t v12 = sub_38590();
            uint64_t v43 = (uint64_t)a5;
            uint64_t v44 = a7;
            if (!v12) {
              goto LABEL_28;
            }
            goto LABEL_3;
          }
          char v28 = v24;
          if (a5[3] >= v27)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              a5 = v48;
              if ((v24 & 1) == 0) {
                goto LABEL_22;
              }
            }
            else
            {
              sub_1C31C();
              a5 = v48;
              if ((v28 & 1) == 0) {
                goto LABEL_22;
              }
            }
          }
          else
          {
            sub_1AE0C(v27, isUniquelyReferenced_nonNull_native);
            unint64_t v29 = sub_1A978(a7, v20);
            if ((v28 & 1) != (v30 & 1)) {
              goto LABEL_31;
            }
            a3 = v29;
            a5 = v48;
            if ((v28 & 1) == 0)
            {
LABEL_22:
              a5[(a3 >> 6) + 8] |= 1 << a3;
              uint64_t v31 = (uint64_t *)(a5[6] + 16 * a3);
              *uint64_t v31 = a7;
              v31[1] = v20;
              *(void *)(a5[7] + 8 * a3) = v22;
              uint64_t v32 = a5[2];
              BOOL v33 = __OFADD__(v32, 1);
              uint64_t v34 = v32 + 1;
              if (v33) {
                goto LABEL_26;
              }
              a5[2] = v34;
              swift_bridgeObjectRetain();
              goto LABEL_24;
            }
          }
          *(void *)(a5[7] + 8 * a3) = v22;
          swift_unknownObjectRelease();
LABEL_24:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v12 = v46;
          a3 = v47;
          unint64_t v14 = v45;
          goto LABEL_7;
        }
        swift_bridgeObjectRelease();
      }

LABEL_7:
      if (v12 == ++v13) {
        goto LABEL_29;
      }
    }
  }
  __break(1u);
LABEL_31:
  uint64_t result = sub_38660();
  __break(1u);
  return result;
}

uint64_t sub_27DB0(unint64_t a1, char a2, void *a3, uint64_t a4, void (*a5)(uint64_t, uint64_t *, uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v124 = a8;
  uint64_t v119 = a6;
  v118 = a5;
  id v131 = a3;
  uint64_t v12 = sub_5568(&qword_46AD0);
  __chkstk_darwin(v12 - 8);
  v123 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_37F20();
  uint64_t v14 = *(void *)(v126 - 8);
  uint64_t v15 = __chkstk_darwin(v126);
  v122 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  v121 = (char *)&v107 - v18;
  __chkstk_darwin(v17);
  v120 = (char *)&v107 - v19;
  if ((a2 & 1) == 0)
  {
    if (a1 >> 62)
    {
LABEL_66:
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_38590();
      if (v20) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v20 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v20)
      {
LABEL_4:
        v114 = (uint64_t (*)(uint64_t))a7;
        unint64_t v130 = a1 & 0xC000000000000001;
        v116 = (void (**)(char *, char *, uint64_t))(v14 + 32);
        v117 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
        v115 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
        unint64_t v112 = (void (**)(char *, char *, uint64_t))(v14 + 16);
        uint64_t v108 = v136;
        v113 = (void (**)(char *, uint64_t))(v14 + 8);
        a7 = 4;
        *(void *)&long long v21 = 138412290;
        long long v127 = v21;
        uint64_t v128 = a4;
        uint64_t v129 = v20;
        while (1)
        {
          uint64_t v14 = a7 - 4;
          if (v130) {
            id v22 = (id)sub_384C0();
          }
          else {
            id v22 = *(id *)(a1 + 8 * a7);
          }
          uint64_t v23 = v22;
          uint64_t v24 = a7 - 3;
          if (__OFADD__(v14, 1))
          {
            __break(1u);
            goto LABEL_66;
          }
          id v132 = 0;
          id v25 = [v131 existingObjectWithID:v22 error:&v132];
          id v26 = v132;
          if (!v25)
          {
            id v99 = v132;
            sub_F3B4(a1, 0);
            sub_37E30();

            swift_willThrow();
            if (qword_466A0 != -1) {
              swift_once();
            }
            uint64_t v100 = sub_37F50();
            sub_C3DC(v100, (uint64_t)qword_47A80);
            unint64_t v101 = sub_37F30();
            os_log_type_t v102 = sub_38270();
            BOOL v103 = os_log_type_enabled(v101, v102);
            a7 = (uint64_t)v114;
            if (v103)
            {
              unint64_t v104 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v104 = 0;
              _os_log_impl(&dword_0, v101, v102, "Error while querying properties from Core Data", v104, 2u);
              swift_slowDealloc();
            }
            swift_errorRelease();

            return ((uint64_t (*)(uint64_t))a7)(v98);
          }
          uint64_t v27 = v25;
          type metadata accessor for CDProperty();
          char v28 = (void *)swift_dynamicCastClass();
          id v29 = v26;
          if (!v28)
          {

            goto LABEL_30;
          }
          id v30 = [v28 key];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = sub_380C0();
            uint64_t v34 = v33;

            if (!*(void *)(a4 + 16)) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v32 = 0;
            uint64_t v34 = 0xE000000000000000;
            if (!*(void *)(a4 + 16)) {
              goto LABEL_26;
            }
          }
          unint64_t v35 = sub_1A978(v32, v34);
          if ((v36 & 1) == 0)
          {
LABEL_26:

            swift_bridgeObjectRelease();
            goto LABEL_29;
          }
          id v125 = *(id *)(*(void *)(a4 + 56) + 8 * v35);
          swift_unknownObjectRetain();
          swift_bridgeObjectRelease();
          id v37 = [v28 createdAt];
          if (!v37)
          {
            uint64_t v41 = (uint64_t)v123;
            (*v117)(v123, 1, 1, v126);
LABEL_28:
            swift_unknownObjectRelease();

            sub_2937C(v41);
LABEL_29:
            uint64_t v20 = v129;
LABEL_30:
            if (qword_466A0 != -1) {
              swift_once();
            }
            uint64_t v55 = sub_37F50();
            sub_C3DC(v55, (uint64_t)qword_47A80);
            id v56 = v23;
            id v57 = sub_37F30();
            os_log_type_t v58 = sub_38270();
            if (os_log_type_enabled(v57, v58))
            {
              uint64_t v59 = swift_slowAlloc();
              id v60 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v59 = v127;
              *(void *)(v59 + 4) = v56;
              *id v60 = v56;
              _os_log_impl(&dword_0, v57, v58, "Cast failed or bad data querying property with objectID %@", (uint8_t *)v59, 0xCu);
              sub_5568(&qword_46CE0);
              swift_arrayDestroy();
              swift_slowDealloc();
              a4 = v128;
              swift_slowDealloc();
            }
            else
            {
            }
            goto LABEL_6;
          }
          uint64_t v38 = v37;
          uint64_t v39 = v121;
          sub_37F00();

          int64_t v40 = *v116;
          uint64_t v41 = (uint64_t)v123;
          Swift::Int v42 = v39;
          uint64_t v43 = v126;
          (*v116)(v123, v42, v126);
          (*v117)((char *)v41, 0, 1, v43);
          if ((*v115)(v41, 1, v43) == 1) {
            goto LABEL_28;
          }
          uint64_t v44 = v120;
          uint64_t v45 = v126;
          v40(v120, (char *)v41, v126);
          uint64_t v46 = (uint64_t)v125;
          unint64_t v47 = (char *)[v125 recordType];
          (*v112)(v122, v44, v45);
          if (v47 == (unsigned char *)&dword_0 + 2)
          {
            swift_unknownObjectRetain();
            swift_retain();
            uint64_t v61 = sub_8990();
            uint64_t v49 = (uint64_t)v122;
            if (!v61)
            {
LABEL_39:
              if (qword_466A0 != -1) {
                swift_once();
              }
              uint64_t v72 = sub_37F50();
              sub_C3DC(v72, (uint64_t)qword_47A80);
              uint64_t v73 = sub_37F30();
              os_log_type_t v74 = sub_38270();
              if (os_log_type_enabled(v73, v74))
              {
                uint64_t v75 = swift_slowAlloc();
                uint64_t v76 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v75 = v127;
                sub_C414();
                swift_allocError();
                *uint64_t v77 = 1;
                uint64_t v78 = _swift_stdlib_bridgeErrorToNSError();
                *(void *)(v75 + 4) = v78;
                void *v76 = v78;
                _os_log_impl(&dword_0, v73, v74, "Could not fetch. %@", (uint8_t *)v75, 0xCu);
                sub_5568(&qword_46CE0);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }

              sub_C414();
              uint64_t v79 = swift_allocError();
              *uint64_t v80 = 1;
              uint64_t v135 = v79;
              uint64_t v81 = v108;
              *uint64_t v108 = 0u;
              v81[1] = 0u;
              *((unsigned char *)v81 + 32) = 0;
              v136[33] = 1;
              sub_28BBC((uint64_t)&v135, v118, v119, (uint64_t)v125, v49);
              swift_errorRelease();
              goto LABEL_53;
            }
            uint64_t v62 = v61;
            id v63 = [v28 identifier];
            if (v63)
            {
              uint64_t v64 = v63;
              uint64_t v110 = (void *)sub_380C0();
              uint64_t v66 = v65;
            }
            else
            {
              uint64_t v110 = 0;
              uint64_t v66 = 0;
            }
            id v68 = [v28 assetID];
            unint64_t v111 = a1;
            if (v68)
            {
              uint64_t v82 = sub_380C0();
              uint64_t v69 = v83;

              id v68 = (id)v82;
            }
            else
            {
              uint64_t v69 = 0;
            }
            uint64_t v54 = v66;
            uint64_t v70 = (void *)sub_8C88(v62);
            swift_bridgeObjectRelease();
            char v71 = 2;
          }
          else
          {
            if (v47 != (unsigned char *)&dword_0 + 1)
            {
              unint64_t v111 = a1;
              if (v47)
              {
                (*v113)(v122, v126);
                id v132 = v47;
                uint64_t result = sub_38650();
                __break(1u);
                return result;
              }
              swift_unknownObjectRetain();
              swift_retain();
              id v67 = [v28 count];
              uint64_t v54 = 0;
              id v68 = 0;
              uint64_t v69 = 0;
              uint64_t v70 = 0;
              char v71 = 0;
              goto LABEL_52;
            }
            swift_unknownObjectRetain();
            swift_retain();
            uint64_t v48 = sub_8990();
            uint64_t v49 = (uint64_t)v122;
            if (!v48) {
              goto LABEL_39;
            }
            uint64_t v50 = v48;
            id v51 = [v28 identifier];
            unint64_t v111 = a1;
            if (v51)
            {
              uint64_t v52 = v51;
              uint64_t v110 = (void *)sub_380C0();
              uint64_t v54 = v53;
            }
            else
            {
              uint64_t v110 = 0;
              uint64_t v54 = 0;
            }
            id v68 = (id)sub_8C88(v50);
            swift_bridgeObjectRelease();
            uint64_t v69 = 0;
            uint64_t v70 = 0;
            char v71 = 1;
          }
          uint64_t v46 = (uint64_t)v125;
          id v67 = v110;
LABEL_52:
          uint64_t v109 = (uint64_t)v68;
          uint64_t v110 = (void *)v69;
          id v125 = v70;
          v133[0] = v67;
          v133[1] = v54;
          v133[2] = v68;
          v133[3] = v69;
          v133[4] = v70;
          char v134 = v71;
          uint64_t v84 = v54;
          uint64_t v85 = (uint64_t)v67;
          uint64_t v49 = (uint64_t)v122;
          char v86 = v71;
          v118(v46, v133, (uint64_t)v122);
          sub_C468(v85, v84, v109, (uint64_t)v110, (uint64_t)v125, v86);
          a1 = v111;
LABEL_53:
          swift_unknownObjectRelease();
          swift_release();

          unint64_t v87 = *v113;
          uint64_t v88 = v49;
          uint64_t v89 = v126;
          (*v113)((char *)v88, v126);

          swift_unknownObjectRelease();
          v87(v120, v89);
          a4 = v128;
          uint64_t v20 = v129;
LABEL_6:
          ++a7;
          if (v24 == v20)
          {
            uint64_t v105 = sub_F3B4(a1, 0);
            return v114(v105);
          }
        }
      }
    }
    uint64_t v96 = a1;
    char v97 = 0;
    goto LABEL_68;
  }
  swift_errorRetain();
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v90 = sub_37F50();
  sub_C3DC(v90, (uint64_t)qword_47A80);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v91 = sub_37F30();
  os_log_type_t v92 = sub_38270();
  if (os_log_type_enabled(v91, v92))
  {
    unint64_t v93 = (uint8_t *)swift_slowAlloc();
    uint64_t v135 = swift_slowAlloc();
    *(_DWORD *)unint64_t v93 = 136315138;
    swift_getErrorValue();
    uint64_t v94 = sub_38670();
    v133[0] = sub_2E85C(v94, v95, &v135);
    sub_38420();
    swift_bridgeObjectRelease();
    sub_F3B4(a1, 1);
    sub_F3B4(a1, 1);
    _os_log_impl(&dword_0, v91, v92, "Error while querying properties from Core Data: %s", v93, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v96 = a1;
    char v97 = 1;
LABEL_68:
    uint64_t v98 = sub_F3B4(v96, v97);
    return ((uint64_t (*)(uint64_t))a7)(v98);
  }
  sub_F3B4(a1, 1);
  sub_F3B4(a1, 1);
  swift_errorRelease();

  return ((uint64_t (*)(void))a7)(v98);
}

void sub_28BBC(uint64_t a1, void (*a2)(uint64_t, uint64_t *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_293DC(a1, (uint64_t)v15);
  sub_293DC(a1, (uint64_t)v16);
  if (v17)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_37F50();
    sub_C3DC(v9, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = sub_37F30();
    os_log_type_t v11 = sub_38270();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_getErrorValue();
      uint64_t v13 = sub_38670();
      sub_2E85C(v13, v14, v18);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_29444(a1);
      sub_29444(a1);
      _os_log_impl(&dword_0, v10, v11, "Error while querying properties from Core Data: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_29444(a1);
    }
    else
    {
      sub_29444(a1);
      sub_29444(a1);
      swift_errorRelease();
    }
  }
  else
  {
    sub_F320((uint64_t)v16, (uint64_t)v18);
    a2(a4, v18, a5);
  }
}

char *sub_28E00(char *result, int64_t a2, char a3, char *a4)
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
      sub_5568(&qword_46B98);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[48 * v8 + 32]) {
          memmove(v12, a4 + 32, 48 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_29190(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_28F24(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_2905C(a1, a2, a3, a4, &qword_46C10, &qword_46C08);
}

char *sub_28F38(char *result, int64_t a2, char a3, char *a4)
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
      sub_5568(&qword_46CB8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_29288(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_29048(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_2905C(a1, a2, a3, a4, &qword_46C20, &qword_46C00);
}

void *sub_2905C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_5568(a5);
      uint64_t v13 = (void *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      _OWORD v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 56);
      uint64_t v15 = v13 + 4;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[7 * v11 + 4]) {
          memmove(v15, a4 + 4, 56 * v11);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = _swiftEmptyArrayStorage;
      uint64_t v15 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2948C(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_29190(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

uint64_t sub_29288(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

uint64_t sub_2937C(uint64_t a1)
{
  uint64_t v2 = sub_5568(&qword_46AD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_293DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_46B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_29444(uint64_t a1)
{
  return a1;
}

uint64_t sub_29480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  if (a7) {
    return swift_errorRelease();
  }
  else {
    return sub_C468(a1, a2, a3, a4, a5, a6);
  }
}

uint64_t sub_2948C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 56 * a1 + 32;
    unint64_t v7 = a3 + 56 * v5;
    if (v6 >= v7 || v6 + 56 * v5 <= a3)
    {
      sub_5568(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

uint64_t sub_29598()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_295E8(uint64_t a1, char a2)
{
  sub_26BC4(a1, a2 & 1, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_295FC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_2963C(void *a1, char a2)
{
  sub_2C2A4(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

unint64_t sub_2964C()
{
  unint64_t result = qword_46E58;
  if (!qword_46E58)
  {
    sub_F230(&qword_46E50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46E58);
  }
  return result;
}

uint64_t sub_296A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 8))
  {
    sub_2B6C4(a1);
    unint64_t v5 = sub_1AA5C(a2);
    char v7 = v6;
    if (v6)
    {
      unint64_t v8 = v5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v10 = *v2;
      uint64_t v13 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1CB9C();
        uint64_t v10 = v13;
      }
      sub_1FC20(*(void *)(v10 + 56) + 8 * v8, (uint64_t)&v15);
      sub_358D0(v8, v10);
      *uint64_t v3 = v10;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
    }
    BOOL v16 = (v7 & 1) == 0;
    return sub_2B6C4((uint64_t)&v15);
  }
  else
  {
    sub_1FC20(a1, (uint64_t)&v15);
    char v11 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_2B724((uint64_t)&v15, a2, v11);
    *uint64_t v2 = v14;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_297B8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_29878()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2993C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2999C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_29A08())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_29AE8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_29BA4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_29BF8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_29C64())()
{
  return j__swift_endAccess;
}

id BaseDonor.__allocating_init(type:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return BaseDonor.init(type:)(a1, a2);
}

id BaseDonor.init(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v3 = sub_382D0();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_38320();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_37FE0();
  __chkstk_darwin(v8 - 8);
  *(void *)&v2[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations] = _swiftEmptyDictionarySingleton;
  uint64_t v16 = OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue;
  sub_13568();
  unint64_t v9 = v2;
  sub_37FC0();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v4);
  uint64_t v20 = _swiftEmptyArrayStorage;
  sub_2A6F0((unint64_t *)&qword_46A30, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_5568(&qword_46E90);
  sub_2A738(&qword_46A40, &qword_46E90);
  sub_38450();
  uint64_t v10 = sub_38340();
  uint64_t v11 = v17;
  *(void *)&v2[v16] = v10;
  uint64_t v12 = &v9[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type];
  uint64_t v13 = v18;
  *(void *)uint64_t v12 = v11;
  *((void *)v12 + 1) = v13;
  *(void *)&v9[OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations] = _swiftEmptyArrayStorage;

  uint64_t v14 = (objc_class *)type metadata accessor for BaseDonor();
  v19.receiver = v9;
  v19.super_class = v14;
  return [super init];
}

uint64_t type metadata accessor for BaseDonor()
{
  return self;
}

void sub_2A008()
{
}

uint64_t sub_2A0EC(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_37FA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_37FE0();
  uint64_t v10 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(void *)(v3 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v13;
  uint64_t v14[3] = a1;
  uint64_t v14[4] = a2;
  aBlock[4] = sub_2A6CC;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_297B8;
  aBlock[3] = &unk_41CD0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  id v16 = a2;
  sub_37FD0();
  uint64_t v20 = _swiftEmptyArrayStorage;
  sub_2A6F0(&qword_46B50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5568(&qword_46B58);
  sub_2A738(&qword_46B60, &qword_46B58);
  sub_38450();
  sub_38330();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v19);
  swift_release();
  return swift_release();
}

uint64_t sub_2A3E4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_2A41C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v20 = (void *)Strong;
  uint64_t v6 = (uint64_t *)(Strong + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v21 = v7 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v7 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v12 << 6);
LABEL_8:
      uint64_t v15 = *(void *)(v7 + 56);
      uint64_t v22 = *(void *)(*(void *)(v7 + 48) + 8 * v14);
      sub_1FBC4(v15 + 8 * v14, (uint64_t)&v23);
      goto LABEL_27;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v16 < v11)
    {
      unint64_t v17 = *(void *)(v21 + 8 * v16);
      if (v17) {
        goto LABEL_12;
      }
      int64_t v18 = v12 + 2;
      ++v12;
      if (v16 + 1 < v11)
      {
        unint64_t v17 = *(void *)(v21 + 8 * v18);
        if (v17) {
          goto LABEL_15;
        }
        int64_t v12 = v16 + 1;
        if (v16 + 2 < v11)
        {
          unint64_t v17 = *(void *)(v21 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_12;
          }
          int64_t v18 = v16 + 3;
          int64_t v12 = v16 + 2;
          if (v16 + 3 < v11) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v10 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
LABEL_27:
    sub_2B8D0((uint64_t)&v22, (uint64_t)&v24);
    if (!v24)
    {
      swift_release();

      return;
    }
    sub_1FC20((uint64_t)&v25, (uint64_t)&v22);
    uint64_t v19 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v19)
    {
      [v19 propertyDidChange:a2 propertyConfiguration:a3];
      swift_unknownObjectRelease();
    }
    sub_2B938((uint64_t)&v22);
  }
  unint64_t v17 = *(void *)(v21 + 8 * v18);
  if (v17)
  {
LABEL_15:
    int64_t v16 = v18;
LABEL_12:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v12 = v16;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v11)
    {
      int64_t v12 = v11 - 1;
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v21 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_12;
    }
  }
LABEL_33:
  __break(1u);
}

uint64_t sub_2A684()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_2A6CC()
{
  sub_2A41C(v0[2], v0[3], v0[4]);
}

uint64_t sub_2A6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2A6E8()
{
  return swift_release();
}

uint64_t sub_2A6F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2A738(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_F230(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void BaseDonor.init()()
{
}

id BaseDonor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseDonor();
  return [super dealloc];
}

uint64_t BaseDonor.add(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_37FA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_37FE0();
  uint64_t v8 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = a1;
  aBlock[4] = sub_2ACD4;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_297B8;
  aBlock[3] = &unk_41D20;
  unint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  sub_37FD0();
  unint64_t v17 = _swiftEmptyArrayStorage;
  sub_2A6F0(&qword_46B50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5568(&qword_46B58);
  sub_2A738(&qword_46B60, &qword_46B58);
  sub_38450();
  sub_38330();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);
  swift_release();
  return swift_release();
}

void sub_2ABF0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_unknownObjectWeakInit();
    v5[8] = 0;
    swift_beginAccess();
    sub_296A8((uint64_t)v5, a2);
    swift_endAccess();
  }
}

uint64_t sub_2AC94()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_2ACD4()
{
  sub_2ABF0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t BaseDonor.remove(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_37FA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_37FE0();
  uint64_t v8 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_accessQueue);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_2B0B0;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_297B8;
  aBlock[3] = &unk_41D70;
  unint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_37FD0();
  unint64_t v17 = _swiftEmptyArrayStorage;
  sub_2A6F0(&qword_46B50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5568(&qword_46B58);
  sub_2A738(&qword_46B60, &qword_46B58);
  sub_38450();
  sub_38330();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);
  swift_release();
  return swift_release();
}

void sub_2AFE0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_beginAccess();
    sub_2B0B8(a2, (uint64_t)v5);
    sub_2B6C4((uint64_t)v5);
    swift_endAccess();
  }
}

uint64_t sub_2B078()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_2B0B0()
{
  sub_2AFE0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_2B0B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  unint64_t result = sub_1AA5C(a1);
  char v7 = v6;
  if (v6)
  {
    unint64_t v8 = result;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v2;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1CB9C();
      uint64_t v10 = v11;
    }
    sub_1FC20(*(void *)(v10 + 56) + 8 * v8, a2);
    sub_358D0(v8, v10);
    *uint64_t v3 = v10;
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)a2 = 0;
  }
  *(unsigned char *)(a2 + 8) = (v7 & 1) == 0;
  return result;
}

void sub_2B188(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

uint64_t BaseDonor.isObserved(by:)(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_observations;
  uint64_t result = swift_beginAccess();
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(*(void *)v3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(*(void *)v3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v12 = v11 | (v5 << 6);
LABEL_5:
    if (*(void *)(*(void *)(*(void *)v3 + 48) + 8 * v12) == a1) {
      return 1;
    }
  }
  int64_t v13 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v13 >= v10) {
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v13);
  ++v5;
  if (v14) {
    goto LABEL_24;
  }
  int64_t v5 = v13 + 1;
  if (v13 + 1 >= v10) {
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v5);
  if (v14) {
    goto LABEL_24;
  }
  int64_t v5 = v13 + 2;
  if (v13 + 2 >= v10) {
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v5);
  if (v14) {
    goto LABEL_24;
  }
  int64_t v5 = v13 + 3;
  if (v13 + 3 >= v10) {
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v5);
  if (v14) {
    goto LABEL_24;
  }
  int64_t v5 = v13 + 4;
  if (v13 + 4 >= v10) {
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v5);
  if (v14)
  {
LABEL_24:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
    goto LABEL_5;
  }
  int64_t v15 = v13 + 5;
  if (v15 >= v10) {
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      return 0;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2B37C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_type);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2B3D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC19EngagementCollector9BaseDonor_eventConfigurations);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for BaseDonor(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for BaseDonor);
}

uint64_t dispatch thunk of BaseDonor.type.getter()
{
  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t dispatch thunk of BaseDonor.type.setter()
{
  return (*(uint64_t (**)(void))&stru_68.segname[swift_isaMask & *v0])();
}

uint64_t dispatch thunk of BaseDonor.type.modify()
{
  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 8])();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.getter()
{
  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v0) + 16])();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.setter()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.modify()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of BaseDonor.__allocating_init(type:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of BaseDonor.donate(with:context:donationComplete:)()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t dispatch thunk of BaseDonor.propertyDidChange(_:propertyConfiguration:)()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[swift_isaMask & *v0])();
}

uint64_t initializeWithCopy for BaseDonor.Observation()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t assignWithCopy for BaseDonor.Observation()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t initializeWithTake for BaseDonor.Observation()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t assignWithTake for BaseDonor.Observation()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t getEnumTagSinglePayload for BaseDonor.Observation(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BaseDonor.Observation(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BaseDonor.Observation()
{
  return &type metadata for BaseDonor.Observation;
}

uint64_t sub_2B6C4(uint64_t a1)
{
  uint64_t v2 = sub_5568(&qword_46EC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2B724(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1AA5C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1CB9C();
      goto LABEL_7;
    }
    sub_1BD10(v13, a3 & 1);
    unint64_t v19 = sub_1AA5C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_38660();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 8 * v10;
    return sub_2B8C0(a1, v17);
  }
LABEL_13:

  return sub_2B854(v10, a2, a1, v16);
}

uint64_t sub_2B854(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_1FC20(a3, a4[7] + 8 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_2B8C0(uint64_t a1, uint64_t a2)
{
  return _swift_unknownObjectWeakTakeAssign(a2, a1);
}

uint64_t sub_2B8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_46EC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2B938(uint64_t a1)
{
  return a1;
}

uint64_t sub_2B970(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_2B990, 0, 0);
}

uint64_t sub_2B990()
{
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37F50();
  sub_C3DC(v1, (uint64_t)qword_47A80);
  uint64_t v2 = sub_37F30();
  os_log_type_t v3 = sub_38250();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    swift_slowDealloc();
  }
  int8x16_t v8 = v0[1];

  int64_t v5 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v5;
  v5[1] = vextq_s8(v8, v8, 8uLL);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2BB44;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_2BB44()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2BC84;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2BC60;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2BC60()
{
  return (*(uint64_t (**)(void, BOOL))(v0 + 8))(0, *(void *)(v0 + 48) != 0);
}

uint64_t sub_2BC84()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_task_dealloc();
  BOOL v2 = *(void *)(v0 + 48) != 0;
  os_log_type_t v3 = *(uint64_t (**)(uint64_t, BOOL))(v0 + 8);
  return v3(v1, v2);
}

uint64_t LocalStorage.fetchAllConfigurations(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1F0CC, (uint64_t)v5);

  return swift_release();
}

uint64_t LocalStorage.fetchConfiguration(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = v4;
  v9[5] = a3;
  void v9[6] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_25300, (uint64_t)v9);

  return swift_release();
}

uint64_t sub_2BE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_5568(&qword_46ED8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_32984((uint64_t)sub_2CC34, v10);
  return swift_release();
}

uint64_t sub_2BF84(unint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = (os_unfair_lock_s *)(*(void *)(a2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v3);
  sub_26858(&v16);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = v16;
  uint64_t v5 = (void *)sub_119E0(a1, v16);

  if (v5)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_37F50();
    sub_C3DC(v7, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = sub_37F30();
    os_log_type_t v9 = sub_38270();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_getErrorValue();
      uint64_t v11 = sub_38670();
      sub_2E85C(v11, v12, (uint64_t *)&v16);
      sub_38420();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v8, v9, "Error while batch-updating configurations in Core data: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v16 = v5;
    sub_5568(&qword_46ED8);
    sub_381D0();
    return swift_errorRelease();
  }
  else
  {
    __chkstk_darwin(v6);
    os_unfair_lock_lock(v3);
    sub_26858(&v16);
    os_unfair_lock_unlock(v3);
    uint64_t v13 = v16;
    unsigned __int8 v14 = [v16 hasChanges];

    if (v14)
    {
      sub_5568(&qword_46E50);
      sub_2964C();
      sub_37F70();
    }
    sub_5568(&qword_46ED8);
    return sub_381E0();
  }
}

void sub_2C2A4(void *a1, char a2, uint64_t a3, void (*a4)(void *, uint64_t))
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_37F50();
    sub_C3DC(v6, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = sub_37F30();
    os_log_type_t v8 = sub_38270();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v9 = 136315138;
      swift_getErrorValue();
      uint64_t v10 = sub_38670();
      sub_2E85C(v10, v11, &v12);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_1FD90(a1, 1);
      sub_1FD90(a1, 1);
      _os_log_impl(&dword_0, v7, v8, "Error while inserting configuration object to Core Data: %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_1FD90(a1, 1);
      sub_1FD90(a1, 1);
    }

    swift_errorRetain();
    a4(a1, 1);
    sub_1FD90(a1, 1);
    sub_1FD90(a1, 1);
  }
  else
  {
    sub_5568(&qword_46E50);
    sub_2964C();
    sub_37F70();
    a4(0, 0);
  }
}

uint64_t sub_2C508(uint64_t a1, void (*a2)(unint64_t, uint64_t))
{
  os_log_type_t v3 = (os_unfair_lock_s *)(*(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v3);
  sub_26858(&v6);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = v6;
  swift_retain();
  sub_11178((uint64_t)v4, a2);

  return swift_release();
}

uint64_t sub_2C5B0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2C5F0(unint64_t a1, char a2, void (*a3)(unint64_t, uint64_t))
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_37F50();
    sub_C3DC(v11, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = sub_37F30();
    os_log_type_t v13 = sub_38270();
    if (os_log_type_enabled(v12, v13))
    {
      unsigned __int8 v14 = (uint8_t *)swift_slowAlloc();
      unint64_t v23 = swift_slowAlloc();
      *(_DWORD *)unsigned __int8 v14 = 136315138;
      swift_getErrorValue();
      uint64_t v15 = sub_38670();
      sub_2E85C(v15, v16, (uint64_t *)&v23);
      sub_38420();
      swift_bridgeObjectRelease();
      sub_F3B4(a1, 1);
      sub_F3B4(a1, 1);
      _os_log_impl(&dword_0, v12, v13, "Error while fetching all configurations from Core data: %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_F3B4(a1, 1);
      sub_F3B4(a1, 1);
    }

    swift_errorRetain();
    a3(a1, 1);
    sub_F3B4(a1, 1);
    return sub_F3B4(a1, 1);
  }
  else
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_38590();
      sub_F3B4(a1, 0);
    }
    else
    {
      uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    }
    unint64_t v6 = (unint64_t)&_swiftEmptyArrayStorage;
    if (v5)
    {
      unint64_t v23 = (unint64_t)&_swiftEmptyArrayStorage;
      uint64_t result = sub_38520();
      if (v5 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v8 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v9 = (id)sub_384C0();
        }
        else {
          id v9 = *(id *)(a1 + 8 * v8 + 32);
        }
        uint64_t v10 = v9;
        ++v8;
        sub_10230();

        sub_38500();
        sub_38530();
        sub_38540();
        sub_38510();
      }
      while (v5 != v8);
      uint64_t v17 = (void *)v23;
    }
    else
    {
      uint64_t v17 = &_swiftEmptyArrayStorage;
    }
    unint64_t v23 = (unint64_t)&_swiftEmptyArrayStorage;
    uint64_t v18 = v17[2];
    if (v18)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v18; ++i)
      {
        char v20 = (void *)v17[i + 4];
        if (v20)
        {
          id v21 = v20;
          sub_38150();
          if (*(void *)((char *)&dword_10 + (v23 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                         + (v23 & 0xFFFFFFFFFFFFFF8)) >> 1)
            sub_381A0();
          sub_381B0();
          sub_38190();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v6 = v23;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (v6 >> 62)
    {
      sub_5568(&qword_46C28);
      uint64_t v22 = sub_38580();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      sub_38630();
      swift_bridgeObjectRelease();
      uint64_t v22 = v6;
    }
    a3(v22, 0);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2CA4C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(id, uint64_t))
{
  uint64_t v7 = (os_unfair_lock_s *)(*(void *)(a3 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v7);
  sub_25C7C(&v10);
  os_unfair_lock_unlock(v7);
  uint64_t v8 = v10;
  swift_retain();
  sub_10AE0(a1, a2, (uint64_t)v8, a4);

  return swift_release();
}

uint64_t sub_2CB0C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_2CB54(uint64_t a1)
{
  return sub_2BE2C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2CB5C()
{
  uint64_t v1 = sub_5568(&qword_46ED8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_2CC34()
{
  sub_5568(&qword_46ED8);
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);

  return sub_2BF84(v1, v2);
}

void CollectorError.hash(into:)()
{
}

Swift::Int CollectorError.hashValue.getter()
{
  return sub_386F0();
}

Swift::Int sub_2CD08()
{
  return sub_386F0();
}

uint64_t sub_2CD48()
{
  FunctionReplacement = (uint64_t (*)(void))swift_getFunctionReplacement();
  if (FunctionReplacement)
  {
    return FunctionReplacement();
  }
  else
  {
    swift_beginAccess();
    uint64_t v3 = *(void *)(v0 + 16);
    swift_bridgeObjectRetain();
    return v3;
  }
}

uint64_t sub_2CDDC(uint64_t a1, uint64_t a2)
{
  FunctionReplacement = (uint64_t (*)(uint64_t, uint64_t))swift_getFunctionReplacement();
  if (FunctionReplacement)
  {
    return FunctionReplacement(a1, a2);
  }
  else
  {
    swift_beginAccess();
    *(void *)(v2 + 16) = a1;
    *(void *)(v2 + 24) = a2;
    return swift_bridgeObjectRelease();
  }
}

uint64_t (*sub_2CE88(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = sub_2CD48();
  a1[1] = v3;
  return sub_2CED0;
}

uint64_t sub_2CED0(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if ((a2 & 1) == 0) {
    return sub_2CDDC(*a1, v2);
  }
  swift_bridgeObjectRetain();
  sub_2CDDC(v3, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2CF44(void *a1)
{
  uint64_t v3 = v1;
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_37F50();
  sub_C3DC(v5, (uint64_t)qword_47A80);
  swift_unknownObjectRetain_n();
  uint64_t v6 = sub_37F30();
  os_log_type_t v7 = sub_38260();
  if (os_log_type_enabled(v6, v7))
  {
    v16[4] = v2;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v16[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = [a1 type];
    uint64_t v10 = sub_380C0();
    unint64_t v12 = v11;

    sub_2E85C(v10, v12, v16);
    sub_38420();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "Collector registering new donor: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  swift_beginAccess();
  swift_unknownObjectRetain();
  unint64_t v13 = swift_bridgeObjectRetain();
  char v14 = sub_2F228(v13, a1);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v14)
  {
    sub_209B4();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    swift_beginAccess();
    swift_unknownObjectRetain();
    sub_38150();
    if (*(void *)((char *)&dword_10 + (*(void *)(v3 + 32) & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)(v3 + 32) & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_381A0();
    }
    sub_381B0();
    sub_38190();
    return swift_endAccess();
  }
}

uint64_t sub_2D21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_5568(&qword_46A60);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v4 + 32);
  if (v12 < 0 || (v12 & 0x4000000000000000) != 0)
  {
    unint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v13 = (uint64_t)sub_1D260(v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v14 = sub_38220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  void v15[2] = 0;
  uint64_t v15[3] = 0;
  v15[4] = v13;
  v15[5] = a1;
  void v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_14E68((uint64_t)v11, (uint64_t)&unk_46A68, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_2D394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return _swift_task_switch(sub_2D3BC, 0, 0);
}

uint64_t sub_2D3BC()
{
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37F50();
  sub_C3DC(v1, (uint64_t)qword_47A80);
  uint64_t v2 = sub_37F30();
  os_log_type_t v3 = sub_38260();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Start collecting data", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void *)(v0 + 32);
  long long v10 = *(_OWORD *)(v0 + 16);
  long long v11 = *(_OWORD *)(v0 + 40);

  uint64_t v6 = sub_5568(&qword_47008);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 56) = v7;
  *(_OWORD *)(v7 + 16) = v10;
  *(void *)(v7 + 32) = v5;
  *(_OWORD *)(v7 + 40) = v11;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v8;
  void *v8 = v0;
  v8[1] = sub_2D588;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v8, v6, (char *)&type metadata for () + 8, 0, 0, &unk_47018, v7, v6);
}

uint64_t sub_2D588()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_2D6A0, 0, 0);
}

uint64_t sub_2D6A0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2D6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[21] = a6;
  v7[22] = a7;
  v7[19] = a4;
  v7[20] = a5;
  v7[17] = a2;
  v7[18] = a3;
  sub_5568(&qword_46A60);
  v7[23] = swift_task_alloc();
  v7[24] = swift_task_alloc();
  uint64_t v8 = sub_5568(&qword_47020);
  v7[25] = v8;
  v7[26] = *(void *)(v8 - 8);
  v7[27] = swift_task_alloc();
  return _swift_task_switch(sub_2D7C0, 0, 0);
}

uint64_t sub_2D7C0()
{
  uint64_t v54 = v0;
  unint64_t v1 = *(void *)(v0 + 144);
  if (v1 >> 62) {
    goto LABEL_39;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v44 = v1 & 0xC000000000000001;
      uint64_t v41 = *(void *)(v52 + 144) + 32;
      uint64_t v42 = v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v43 = v2;
      while (1)
      {
        if (v44)
        {
          unint64_t v4 = v3;
          uint64_t v5 = (void *)sub_384C0();
          BOOL v6 = __OFADD__(v4, 1);
          unint64_t v1 = v4 + 1;
          if (v6) {
            goto LABEL_36;
          }
        }
        else
        {
          if (v3 >= *(void *)(v42 + 16)) {
            goto LABEL_38;
          }
          uint64_t v5 = *(void **)(v41 + 8 * v3);
          unint64_t v7 = v3;
          swift_unknownObjectRetain();
          BOOL v6 = __OFADD__(v7, 1);
          unint64_t v1 = v7 + 1;
          if (v6)
          {
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
        }
        unint64_t v45 = v1;
        unint64_t v1 = [v5 eventConfigurations:v41];
        type metadata accessor for BasePropertyConfiguration();
        uint64_t v8 = sub_38170();

        if ((unint64_t)v8 >> 62) {
          break;
        }
        uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
        uint64_t v10 = (void *)v52;
        if (v9) {
          goto LABEL_13;
        }
LABEL_4:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        unint64_t v3 = v45;
        if (v45 == v43) {
          goto LABEL_40;
        }
      }
      if (v8 < 0) {
        unint64_t v1 = v8;
      }
      else {
        unint64_t v1 = v8 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_38590();
      swift_bridgeObjectRelease();
      uint64_t v10 = (void *)v52;
      if (!v9) {
        goto LABEL_4;
      }
LABEL_13:
      if (v9 >= 1) {
        break;
      }
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_38590();
      if (!v2) {
        goto LABEL_40;
      }
    }
    uint64_t v11 = 0;
    uint64_t v47 = v8;
    unint64_t v48 = v8 & 0xC000000000000001;
    uint64_t v49 = v5;
    uint64_t v46 = v9;
    while (1)
    {
      if (v48) {
        id v13 = (id)sub_384C0();
      }
      else {
        id v13 = *(id *)(v8 + 8 * v11 + 32);
      }
      uint64_t v50 = v11;
      id v51 = v13;
      if (qword_466A0 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_37F50();
      sub_C3DC(v14, (uint64_t)qword_47A80);
      swift_unknownObjectRetain_n();
      uint64_t v15 = sub_37F30();
      os_log_type_t v16 = sub_38260();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136315138;
        id v18 = [v5 type];
        uint64_t v19 = sub_380C0();
        unint64_t v21 = v20;

        *(void *)(v17 + 4) = sub_2E85C(v19, v21, &v53);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease_n();
        _os_log_impl(&dword_0, v15, v16, "Getting data from donor: %s", (uint8_t *)v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_unknownObjectRelease_n();
      }

      uint64_t v23 = v10[23];
      uint64_t v22 = v10[24];
      uint64_t v24 = v10[20];
      uint64_t v25 = *(void *)(v52 + 152);
      uint64_t v26 = sub_38220();
      uint64_t v27 = *(void *)(v26 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v22, 1, 1, v26);
      char v28 = (void *)swift_allocObject();
      v28[2] = 0;
      id v29 = v28 + 2;
      v28[3] = 0;
      v28[4] = v5;
      v28[5] = v51;
      v28[6] = v25;
      uint64_t v10 = (void *)v52;
      v28[7] = v24;
      sub_2F910(v22, v23);
      LODWORD(v23) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v23, 1, v26);
      swift_unknownObjectRetain();
      id v30 = v51;
      swift_bridgeObjectRetain();
      uint64_t v31 = *(void *)(v52 + 184);
      if (v23 == 1)
      {
        sub_2F978(*(void *)(v52 + 184));
        if (!*v29) {
          goto LABEL_28;
        }
      }
      else
      {
        sub_38210();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v31, v26);
        if (!*v29)
        {
LABEL_28:
          uint64_t v32 = 0;
          uint64_t v34 = 0;
          goto LABEL_29;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v32 = sub_381C0();
      uint64_t v34 = v33;
      swift_unknownObjectRelease();
LABEL_29:
      uint64_t v35 = **(void **)(v52 + 136);
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = &unk_47038;
      *(void *)(v36 + 24) = v28;
      sub_5568(&qword_47008);
      uint64_t v37 = v34 | v32;
      if (v34 | v32)
      {
        uint64_t v37 = v52 + 72;
        *(void *)(v52 + 72) = 0;
        *(void *)(v52 + 80) = 0;
        *(void *)(v52 + 88) = v32;
        *(void *)(v52 + 96) = v34;
      }
      uint64_t v8 = v47;
      ++v11;
      uint64_t v12 = *(void *)(v52 + 192);
      *(void *)(v52 + 104) = 1;
      *(void *)(v52 + 112) = v37;
      *(void *)(v52 + 120) = v35;
      unint64_t v1 = swift_task_create();

      swift_release();
      sub_2F978(v12);
      uint64_t v5 = v49;
      if (v46 == v50 + 1) {
        goto LABEL_4;
      }
    }
  }
LABEL_40:
  swift_bridgeObjectRelease();
  sub_5568(&qword_47008);
  sub_381F0();
  *(void *)(v52 + 232) = _swiftEmptyDictionarySingleton;
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v52 + 224) = v38;
  *uint64_t v38 = v52;
  v38[1] = sub_2DE54;
  uint64_t v39 = *(void *)(v52 + 200);
  return TaskGroup.Iterator.next(isolation:)(v52 + 16, 0, 0, v39);
}

uint64_t sub_2DE54()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_2DF50, 0, 0);
}

uint64_t sub_2DF50()
{
  uint64_t v35 = v0;
  uint64_t v2 = *(void **)(v0 + 16);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(v0 + 64);
    if (v3 == 255)
    {

      goto LABEL_21;
    }
    unint64_t v4 = *(void **)(v0 + 40);
    uint64_t v31 = *(void *)(v0 + 24);
    uint64_t v32 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 232);
    id v8 = v2;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v0 + 128) = v7;
    unint64_t v10 = sub_1AAA0((uint64_t)v8);
    uint64_t v14 = *(void *)(v7 + 16);
    BOOL v15 = (v11 & 1) == 0;
    BOOL v16 = __OFADD__(v14, v15);
    uint64_t v17 = v14 + v15;
    if (v16)
    {
      __break(1u);
    }
    else
    {
      char v1 = v11;
      id v30 = v4;
      unint64_t v4 = (void *)(v0 + 128);
      if (*(void *)(*(void *)(v0 + 232) + 24) < v17)
      {
        sub_1BFDC(v17, isUniquelyReferenced_nonNull_native);
        unint64_t v10 = sub_1AAA0((uint64_t)v8);
        if ((v1 & 1) != (v11 & 1))
        {
          type metadata accessor for BasePropertyConfiguration();
          return sub_38660();
        }
LABEL_14:
        uint64_t v22 = (void *)*v4;
        if (v1)
        {
LABEL_15:
          uint64_t v23 = v22[7] + 48 * v10;
          sub_C468(*(void *)v23, *(void *)(v23 + 8), *(void *)(v23 + 16), *(void *)(v23 + 24), *(void *)(v23 + 32), *(unsigned char *)(v23 + 40));
          *(void *)uint64_t v23 = v31;
          *(void *)(v23 + 8) = v32;
          *(void *)(v23 + 16) = v30;
          *(void *)(v23 + 24) = v5;
          *(void *)(v23 + 32) = v6;
          *(unsigned char *)(v23 + 40) = v3;
LABEL_20:
          swift_bridgeObjectRelease();

          *(void *)(v0 + 232) = v22;
LABEL_21:
          id v29 = (void *)swift_task_alloc();
          *(void *)(v0 + 224) = v29;
          void *v29 = v0;
          v29[1] = sub_2DE54;
          uint64_t v13 = *(void *)(v0 + 200);
          unint64_t v10 = v0 + 16;
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          return TaskGroup.Iterator.next(isolation:)(v10, v11, v12, v13);
        }
LABEL_18:
        v22[(v10 >> 6) + 8] |= 1 << v10;
        *(void *)(v22[6] + 8 * v10) = v8;
        uint64_t v25 = v22[7] + 48 * v10;
        *(void *)uint64_t v25 = v31;
        *(void *)(v25 + 8) = v32;
        *(void *)(v25 + 16) = v30;
        *(void *)(v25 + 24) = v5;
        *(void *)(v25 + 32) = v6;
        *(unsigned char *)(v25 + 40) = v3;
        uint64_t v26 = v22[2];
        BOOL v16 = __OFADD__(v26, 1);
        uint64_t v27 = v26 + 1;
        if (v16)
        {
          __break(1u);
          return TaskGroup.Iterator.next(isolation:)(v10, v11, v12, v13);
        }
        v22[2] = v27;
        id v28 = v8;
        goto LABEL_20;
      }
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_14;
      }
    }
    unint64_t v24 = v10;
    sub_1CD5C();
    unint64_t v10 = v24;
    uint64_t v22 = (void *)*v4;
    if (v1) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v19 = *(void *)(v0 + 232);
  unint64_t v20 = *(void (**)(uint64_t *))(v0 + 168);
  (*(void (**)(void, void))(*(void *)(v0 + 208) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
  uint64_t v33 = v19;
  char v34 = 0;
  v20(&v33);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_2E27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[11] = a6;
  v7[12] = a7;
  v7[9] = a4;
  v7[10] = a5;
  v7[8] = a1;
  return _swift_task_switch(sub_2E2A4, 0, 0);
}

uint64_t sub_2E2A4()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 72);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v4;
  uint64_t v5 = sub_5568(&qword_468C8);
  *unint64_t v4 = v0;
  v4[1] = sub_2E3B0;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000016, 0x800000000003BB30, sub_2FAC8, v3, v5);
}

uint64_t sub_2E3B0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_2E4C8, 0, 0);
}

uint64_t sub_2E4C8()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  char v4 = *(unsigned char *)(v0 + 56);
  long long v5 = *(_OWORD *)(v0 + 16);
  long long v6 = *(_OWORD *)(v0 + 32);
  *(void *)uint64_t v2 = v1;
  *(_OWORD *)(v2 + 8) = v5;
  *(_OWORD *)(v2 + 24) = v6;
  *(void *)(v2 + 40) = v3;
  *(unsigned char *)(v2 + 48) = v4;
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  id v7 = v1;
  return v9();
}

void sub_2E554(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, NSString a5)
{
  uint64_t v9 = sub_5568((uint64_t *)&unk_47050);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  if (a5) {
    a5 = sub_380A0();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_2FB68;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_152F0;
  aBlock[3] = &unk_41FF0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  [a2 donateWithConfiguration:a3 context:a5 donationCompleteBlock:v14];
  _Block_release(v14);
}

uint64_t sub_2E730(uint64_t a1)
{
  if (a1) {
    sub_FB8C(*(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue), *(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 8), *(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 16), *(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 24), *(void *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 32), *(unsigned char *)(a1 + OBJC_IVAR____TtC19EngagementCollector15BMPropertyValue_propertyValue + 40));
  }
  sub_5568((uint64_t *)&unk_47050);
  return sub_381E0();
}

uint64_t Collector.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Collector.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_2E85C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2E930(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_F498((uint64_t)v12, *a3);
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
      sub_F498((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_F4F4((uint64_t)v12);
  return v7;
}

uint64_t sub_2E930(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_38430();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2EAEC(a5, a6);
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
  uint64_t v8 = sub_384E0();
  if (!v8)
  {
    sub_38560();
    __break(1u);
LABEL_17:
    uint64_t result = sub_385E0();
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

uint64_t sub_2EAEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_2EB84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2ED64(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2ED64(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_2EB84(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2ECFC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_38490();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_38560();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_38130();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_385E0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_38560();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_2ECFC(uint64_t a1, uint64_t a2)
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
  sub_5568(&qword_47000);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2ED64(char a1, int64_t a2, char a3, char *a4)
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
    sub_5568(&qword_47000);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_385E0();
  __break(1u);
  return result;
}

void (*sub_2EEB4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2EF64(v6, a2, a3);
  return sub_2EF1C;
}

void sub_2EF1C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_2EF64(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_384C0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    *unint64_t v3 = v4;
    return sub_2EFE4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2EFE4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_2EFEC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 72) = a1;
  size_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 80) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_2F0CC;
  return v5(v2 + 16);
}

uint64_t sub_2F0CC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v1 + 56);
  char v5 = *(unsigned char *)(v1 + 64);
  long long v6 = *(_OWORD *)(v1 + 24);
  long long v7 = *(_OWORD *)(v1 + 40);
  *(void *)uint64_t v2 = *(void *)(v1 + 16);
  *(_OWORD *)(v2 + 8) = v6;
  *(_OWORD *)(v2 + 24) = v7;
  *(void *)(v2 + 40) = v4;
  *(unsigned char *)(v2 + 48) = v5;
  int64_t v8 = *(uint64_t (**)(void))(v3 + 8);
  return v8();
}

uint64_t sub_2F228(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_38590();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      unint64_t v19 = v2;
      unint64_t v20 = v2 & 0xC000000000000001;
      uint64_t v4 = 4;
      while (1)
      {
        uint64_t v5 = v4 - 4;
        if (v20)
        {
          long long v6 = (void *)sub_384C0();
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          long long v6 = (void *)swift_unknownObjectRetain();
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        id v8 = [v6 type];
        uint64_t v9 = sub_380C0();
        uint64_t v11 = v10;

        id v12 = [a2 type];
        uint64_t v13 = sub_380C0();
        uint64_t v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          char v17 = 1;
          goto LABEL_21;
        }
        char v17 = sub_38620();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {
          ++v4;
          unint64_t v2 = v19;
          if (v7 != v3) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
  char v17 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  return v17 & 1;
}

uint64_t sub_2F3F0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

unint64_t sub_2F444()
{
  unint64_t result = qword_46F10;
  if (!qword_46F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46F10);
  }
  return result;
}

uint64_t sub_2F498@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2F4E4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 104);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

unsigned char *storeEnumTagSinglePayload for CollectorError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2F5E8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CollectorError()
{
  return &type metadata for CollectorError;
}

uint64_t type metadata accessor for Collector()
{
  return self;
}

uint64_t method lookup function for Collector(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for Collector);
}

uint64_t dispatch thunk of Collector.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of Collector.name.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of Collector.name.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of Collector.register(donor:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of Collector.collect(_:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t sub_2F724(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_20D28;
  return sub_2D6B4(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_2F7FC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_2F84C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_20D28;
  *(void *)(v6 + 88) = v4;
  *(void *)(v6 + 96) = v5;
  *(_OWORD *)(v6 + 72) = v7;
  *(void *)(v6 + 64) = a1;
  return _swift_task_switch(sub_2E2A4, 0, 0);
}

uint64_t sub_2F910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_46A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2F978(uint64_t a1)
{
  uint64_t v2 = sub_5568(&qword_46A60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2F9D8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2FA10(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_201E4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_47030 + dword_47030);
  return v6(a1, v4);
}

void sub_2FAC8(uint64_t a1)
{
  sub_2E554(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(NSString *)(v1 + 40));
}

uint64_t sub_2FAD4()
{
  uint64_t v1 = sub_5568((uint64_t *)&unk_47050);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_2FB68(uint64_t a1)
{
  sub_5568((uint64_t *)&unk_47050);

  return sub_2E730(a1);
}

uint64_t sub_2FBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2FBEC()
{
  return swift_release();
}

uint64_t sub_2FBF4()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v1);
  sub_35CAC(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

id sub_2FC68@<X0>(void *a1@<X8>)
{
  id result = sub_2FCD4();
  *a1 = result;
  return result;
}

id sub_2FCA4@<X0>(void *a1@<X8>)
{
  id result = sub_2FCD4();
  *a1 = result;
  return result;
}

id sub_2FCD4()
{
  uint64_t v1 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    id v5 = sub_2FE5C();
    id v6 = [v5 persistentStoreCoordinator];

    [v4 setPersistentStoreCoordinator:v6];
    [v4 setMergePolicy:NSErrorMergePolicy];
    [v4 setAutomaticallyMergesChangesFromParent:1];
    NSString v7 = sub_380A0();
    [v4 setName:v7];

    uint64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_2FDFC()
{
  uint64_t v1 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model);
  }
  else
  {
    id v4 = (void *)sub_367F8();
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2FE5C()
{
  uint64_t v1 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer);
  }
  else
  {
    id v4 = sub_36B70();
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_2FEC0(void *a1)
{
  id v1 = [a1 container];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 newBackgroundContext];
    __chkstk_darwin(v3);
    sub_383A0();
  }
}

void sub_2FFB4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v77 = a6;
  uint64_t v74 = a5;
  uint64_t v82 = a3;
  uint64_t v81 = sub_37E90();
  uint64_t v78 = *(uint64_t **)(v81 - 8);
  __chkstk_darwin(v81);
  Class v11 = (Class)((char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v12 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v13 = sub_380A0();
  id v14 = [v12 initWithEntityName:v13];

  sub_F100(0, &qword_46938);
  uint64_t v15 = (void *)sub_38240();
  [v14 setPredicate:v15];

  sub_F100(0, &qword_47270);
  id v79 = v14;
  unint64_t v16 = sub_383C0();
  if (!v6)
  {
    unint64_t v17 = v16;
    uint64_t v86 = a2;
    unint64_t v76 = 0;
    unint64_t v30 = v16 >> 62;
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_38590();
      uint64_t v19 = v82;
      if (v31) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      uint64_t v19 = v82;
      if (v31)
      {
LABEL_8:
        unint64_t v72 = v30;
        uint64_t v75 = a1;
        uint64_t v73 = 0;
        unint64_t v85 = v17 & 0xC000000000000001;
        uint64_t v18 = 4;
        unint64_t v20 = &qword_466E0;
        uint64_t v83 = (char *)&type metadata for Any + 8;
        uint64_t v70 = v11;
        uint64_t v71 = a4;
        uint64_t v84 = v31;
        unint64_t v80 = v17;
        while (1)
        {
          if (v85) {
            id v33 = (id)sub_384C0();
          }
          else {
            id v33 = *(id *)(v17 + 8 * v18);
          }
          char v34 = v33;
          uint64_t v35 = v18 - 3;
          if (__OFADD__(v18 - 4, 1))
          {
            __break(1u);
            goto LABEL_44;
          }
          uint64_t v36 = v20;
          NSString v37 = sub_380A0();
          id v38 = [v34 valueForKey:v37];

          if (v38)
          {
            sub_38440();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v89, 0, sizeof(v89));
          }
          unint64_t v20 = v36;
          sub_1FE30((uint64_t)v89, (uint64_t)&v90, v36);
          if (!*((void *)&v91 + 1)) {
            break;
          }
          if ((swift_dynamicCast() & 1) == 0)
          {

            goto LABEL_10;
          }
          uint64_t v40 = v87;
          unint64_t v39 = v88;
          uint64_t v41 = self;
          Class isa = sub_37EA0().super.isa;
          *(void *)&long long v90 = 0;
          Class v11 = (Class)[v41 JSONObjectWithData:isa options:0 error:&v90];

          if (!v11)
          {
            id v59 = (id)v90;
            swift_bridgeObjectRelease_n();
            sub_37E30();

            swift_willThrow();
            sub_F3D4(v40, v39);

            unint64_t v17 = 0;
            a1 = v75;
            Class v11 = v70;
            goto LABEL_3;
          }
          id v43 = (id)v90;
          sub_38440();
          swift_unknownObjectRelease();
          sub_5568(&qword_46980);
          if (swift_dynamicCast())
          {
            uint64_t v44 = *(void *)&v89[0];
            if (*(void *)(*(void *)&v89[0] + 16)
              && (unint64_t v45 = sub_1A978(0x44497465737361, 0xE700000000000000), (v46 & 1) != 0)
              && (sub_F498(*(void *)(v44 + 56) + 32 * v45, (uint64_t)&v90), (swift_dynamicCast() & 1) != 0))
            {
              uint64_t v69 = (uint64_t)sub_380A0();
              swift_bridgeObjectRelease();
              id v68 = sub_380A0();
              uint64_t v47 = v69;
              [v34 setValue:v69 forKey:v68];

              swift_bridgeObjectRetain();
              uint64_t v69 = sub_1A978(0x44497465737361, 0xE700000000000000);
              LOBYTE(v47) = v48;
              swift_bridgeObjectRelease();
              if (v47)
              {
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                *(void *)&v89[0] = v44;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  sub_1CF68();
                  uint64_t v44 = *(void *)&v89[0];
                }
                unint64_t v50 = v69;
                swift_bridgeObjectRelease();
                sub_F488((_OWORD *)(*(void *)(v44 + 56) + 32 * v50), &v90);
                sub_35A90(v50, v44);
                swift_bridgeObjectRelease();
              }
              else
              {
                long long v90 = 0u;
                long long v91 = 0u;
              }
              sub_F42C((uint64_t)&v90, v36);
              Class v11 = sub_38060().super.isa;
              swift_bridgeObjectRelease();
              *(void *)&long long v90 = 0;
              id v51 = [v41 dataWithJSONObject:v11 options:1 error:&v90];

              id v52 = (id)v90;
              if (v51)
              {
                uint64_t v69 = sub_37EB0();
                Class v11 = v53;

                Class v54 = sub_37EA0().super.isa;
                NSString v55 = sub_380A0();
                [v34 setValue:v54 forKey:v55];
                sub_F3D4(v40, v39);
                sub_F3D4(v69, (unint64_t)v11);

                if (__OFADD__(v73++, 1)) {
                  __break(1u);
                }
              }
              else
              {
                id v57 = v52;
                sub_37E30();

                swift_willThrow();
                sub_F3D4(v40, v39);
                swift_errorRelease();
                unint64_t v76 = 0;
              }
            }
            else
            {

              sub_F3D4(v40, v39);
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            sub_F3D4(v40, v39);
          }
          unint64_t v17 = v80;
          uint64_t v19 = v82;
          uint64_t v32 = v84;
          unint64_t v20 = v36;
LABEL_11:
          ++v18;
          if (v35 == v32)
          {
            swift_bridgeObjectRelease();
            a1 = v75;
            unint64_t v30 = v72;
            uint64_t v58 = v73;
            goto LABEL_47;
          }
        }

        sub_F42C((uint64_t)&v90, v36);
LABEL_10:
        uint64_t v32 = v84;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v58 = 0;
LABEL_47:
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v60 = sub_37F50();
    sub_C3DC(v60, (uint64_t)qword_47A80);
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_37F30();
    os_log_type_t v62 = sub_38270();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = swift_slowAlloc();
      *(_DWORD *)uint64_t v63 = 134218240;
      *(void *)&long long v90 = v58;
      sub_38420();
      *(_WORD *)(v63 + 12) = 2048;
      if (v30)
      {
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_38590();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v64 = *(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8));
      }
      swift_bridgeObjectRelease();
      *(void *)&long long v90 = v64;
      sub_38420();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v61, v62, "Completed migrating assetID of %ld of %ld records", (uint8_t *)v63, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_55;
  }
  unint64_t v17 = 0;
LABEL_3:
  uint64_t v18 = (uint64_t)a1;
  uint64_t v19 = v81;
  unint64_t v20 = v78;
  if (qword_466A0 != -1) {
LABEL_44:
  }
    swift_once();
  uint64_t v21 = sub_37F50();
  sub_C3DC(v21, (uint64_t)qword_47A80);
  ((void (*)(Class, uint64_t, uint64_t))v20[2])(v11, v77, v19);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v22 = sub_37F30();
  Class v23 = v11;
  os_log_type_t v24 = sub_38270();
  if (os_log_type_enabled(v22, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v86 = swift_slowAlloc();
    *(void *)&long long v90 = v86;
    *(_DWORD *)uint64_t v25 = 136446466;
    uint64_t v75 = (void *)v18;
    uint64_t v26 = sub_37E80();
    *(void *)&v89[0] = sub_2E85C(v26, v27, (uint64_t *)&v90);
    unint64_t v76 = v17;
    sub_38420();
    swift_bridgeObjectRelease();
    ((void (*)(Class, uint64_t))v20[1])(v23, v81);
    *(_WORD *)(v25 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v28 = sub_38670();
    *(void *)&v89[0] = sub_2E85C(v28, v29, (uint64_t *)&v90);
    a1 = v75;
    sub_38420();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v22, v24, "Error migrating %{public}s: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    ((void (*)(Class, uint64_t))v20[1])(v23, v19);
    swift_errorRelease();
    swift_errorRelease();

    a1 = (void *)v18;
  }
LABEL_55:
  if ([a1 hasChanges])
  {
    *(void *)&long long v90 = 0;
    if ([a1 save:&v90])
    {
      id v65 = (id)v90;
    }
    else
    {
      id v66 = (id)v90;
      sub_37E30();

      swift_willThrow();
    }
  }
}

Swift::Int sub_30BB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v67 = a4;
  uint64_t v10 = sub_382C0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v66 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_37E90();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v51 - v17;
  __chkstk_darwin(v16);
  uint64_t v22 = (char *)&v51 - v21;
  if (!a2) {
    return sub_38370();
  }
  id v58 = a5;
  uint64_t v59 = v11;
  uint64_t v60 = v10;
  uint64_t v56 = v20;
  uint64_t v61 = v19;
  os_log_type_t v62 = a6;
  swift_errorRetain();
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_37F50();
  uint64_t v24 = sub_C3DC(v23, (uint64_t)qword_47A80);
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v65 = a3;
  v64(v22, a3, v13);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v55 = v24;
  uint64_t v25 = sub_37F30();
  os_log_type_t v26 = sub_38270();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v57 = v14;
  uint64_t v63 = v14 + 16;
  if (v27)
  {
    uint64_t v28 = swift_slowAlloc();
    Class v54 = v18;
    uint64_t v29 = v28;
    uint64_t v52 = swift_slowAlloc();
    aBlock[0] = v52;
    *(_DWORD *)uint64_t v29 = 136446466;
    uint64_t v30 = sub_37E80();
    uint64_t v68 = sub_2E85C(v30, v31, aBlock);
    sub_38420();
    swift_bridgeObjectRelease();
    uint64_t v53 = *(void (**)(char *, uint64_t))(v14 + 8);
    v53(v22, v13);
    *(_WORD *)(v29 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v32 = sub_38670();
    uint64_t v68 = sub_2E85C(v32, v33, aBlock);
    sub_38420();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v25, v26, "Error adding LocalStorage persistent store at %{public}s: %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v18 = v54;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v53 = *(void (**)(char *, uint64_t))(v14 + 8);
    v53(v22, v13);
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v35 = v13;
  id v36 = [v67 persistentStoreCoordinator];
  id v37 = v58;
  id v38 = [v58 type];
  sub_380C0();

  unint64_t v39 = v66;
  sub_382B0();
  id v40 = [v37 options];
  sub_F100(0, &qword_46918);
  uint64_t v41 = sub_38070();

  sub_942C(v41);
  swift_bridgeObjectRelease();
  uint64_t v42 = v65;
  id v58 = v36;
  sub_383E0();
  id v43 = v64;
  (*(void (**)(char *, uint64_t))(v59 + 8))(v39, v60);
  swift_bridgeObjectRelease();
  uint64_t v44 = v57;
  v43(v18, v42, v35);
  unint64_t v45 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  unint64_t v46 = (v61 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v47 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v44 + 32))(v47 + v45, v18, v35);
  char v48 = v62;
  *(void *)(v47 + v46) = v62;
  aBlock[4] = (uint64_t)sub_377B8;
  aBlock[5] = v47;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_31798;
  aBlock[3] = (uint64_t)&unk_421A8;
  uint64_t v49 = _Block_copy(aBlock);
  id v50 = v48;
  swift_release();
  [v67 loadPersistentStoresWithCompletionHandler:v49];
  _Block_release(v49);

  return swift_errorRelease();
}

Swift::Int sub_31488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_37E90();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_37F50();
    sub_C3DC(v11, (uint64_t)qword_47A80);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = sub_37F30();
    os_log_type_t v13 = sub_38270();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      v20[0] = swift_slowAlloc();
      uint64_t v22 = v20[0];
      *(_DWORD *)uint64_t v14 = 136446466;
      uint64_t v15 = sub_37E80();
      uint64_t v21 = sub_2E85C(v15, v16, &v22);
      v20[1] = a4;
      sub_38420();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      *(_WORD *)(v14 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v17 = sub_38670();
      uint64_t v21 = sub_2E85C(v17, v18, &v22);
      sub_38420();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v12, v13, "Still unable to load LocalStorage persistent store at %{public}s: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  return sub_38370();
}

void sub_31798(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_31824(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v40 = a1;
  uint64_t v3 = sub_5568(&qword_47298);
  __chkstk_darwin(v3 - 8);
  uint64_t v35 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_38310();
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  __chkstk_darwin(v5);
  unint64_t v33 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5568(&qword_472A0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  uint64_t v39 = v8;
  __chkstk_darwin(v7);
  char v34 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_38320();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_382D0();
  __chkstk_darwin(v13);
  uint64_t v14 = sub_37FE0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock;
  sub_5568(&qword_472A8);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  *(void *)(v2 + v15) = v16;
  uint64_t v17 = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSignalPublisher;
  sub_5568(&qword_46E50);
  swift_allocObject();
  *(void *)(v2 + v17) = sub_37F60();
  *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSubscription) = 0;
  v30[0] = OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveQueue;
  v30[1] = sub_F100(0, (unint64_t *)&qword_46E80);
  sub_37FD0();
  uint64_t v42 = &_swiftEmptyArrayStorage;
  sub_37BB8();
  sub_5568(&qword_46E90);
  sub_F278(&qword_46A40, &qword_46E90);
  sub_38450();
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v12, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v32);
  *(void *)(v2 + v30[0]) = sub_38340();
  *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_context) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_model) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer) = 0;
  uint64_t v18 = v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_persistentDirectoryURL;
  uint64_t v19 = sub_37E90();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v40, v19);
  sub_326C4();
  uint64_t v42 = *(void **)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSignalPublisher);
  swift_retain();
  uint64_t v21 = v33;
  sub_38300();
  id v41 = *(id *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveQueue);
  id v22 = v41;
  uint64_t v23 = sub_382F0();
  uint64_t v24 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v35, 1, 1, v23);
  sub_F278(&qword_472B0, &qword_46E50);
  sub_37C10();
  id v25 = v22;
  os_log_type_t v26 = v34;
  sub_37F80();
  sub_F42C(v24, &qword_47298);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v37);
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_F278(&qword_472C0, &qword_472A0);
  uint64_t v27 = v38;
  uint64_t v28 = sub_37F90();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v40, v19);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v27);
  *(void *)(v2 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_saveSubscription) = v28;
  swift_release();
  return v2;
}

void sub_31E88()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    __chkstk_darwin(Strong);
    uint64_t v2 = v1 + 4;
    os_unfair_lock_lock(v1 + 4);
    sub_35CAC(aBlock);
    os_unfair_lock_unlock(v2);
    uint64_t v3 = (void *)aBlock[0];
    swift_release();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_37CFC;
    *(void *)(v5 + 24) = v4;
    aBlock[4] = sub_37D2C;
    aBlock[5] = v5;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_3269C;
    aBlock[3] = &unk_42310;
    uint64_t v6 = _Block_copy(aBlock);
    id v7 = v3;
    swift_retain();
    swift_release();
    [v7 performBlockAndWait:v6];

    _Block_release(v6);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v6 & 1) == 0) {
      return;
    }
    __break(1u);
  }
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_37F50();
  sub_C3DC(v8, (uint64_t)qword_47A80);
  uint64_t v9 = sub_37F30();
  os_log_type_t v10 = sub_38250();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "No context available", v11, 2u);
    swift_slowDealloc();
  }
}

void sub_32138(void *a1)
{
  id v25 = 0;
  unsigned int v1 = [a1 save:&v25];
  id v2 = v25;
  if (v1)
  {
    id v3 = v2;
  }
  else
  {
    id v4 = v25;
    uint64_t v5 = (void *)sub_37E30();

    swift_willThrow();
    id v25 = v5;
    swift_errorRetain();
    sub_5568((uint64_t *)&unk_46CD0);
    sub_F100(0, (unint64_t *)&qword_46930);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      if (qword_466A0 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_37F50();
      sub_C3DC(v6, (uint64_t)qword_47A80);
      id v7 = v23;
      uint64_t v8 = sub_37F30();
      os_log_type_t v9 = sub_38270();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc();
        id v22 = (void *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 138412546;
        id v11 = v7;
        sub_38420();
        *id v22 = v7;

        *(_WORD *)(v10 + 12) = 2080;
        id v12 = [v11 userInfo];
        sub_38070();

        uint64_t v13 = sub_38080();
        unint64_t v15 = v14;
        swift_bridgeObjectRelease();
        sub_2E85C(v13, v15, &v24);
        sub_38420();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v8, v9, "Could not save. %@, %s", (uint8_t *)v10, 0x16u);
        sub_5568(&qword_46CE0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      if (qword_466A0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_37F50();
      sub_C3DC(v16, (uint64_t)qword_47A80);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v17 = sub_37F30();
      os_log_type_t v18 = sub_38270();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        id v25 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315138;
        swift_getErrorValue();
        uint64_t v20 = sub_38670();
        sub_2E85C(v20, v21, (uint64_t *)&v25);
        sub_38420();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v17, v18, "Could not save. %s", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
  }
}

uint64_t sub_3269C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_326C4()
{
  id v0 = [self defaultManager];
  sub_37E40((NSURL *)OBJC_IVAR____TtC19EngagementCollector12LocalStorage_persistentDirectoryURL);
  id v2 = v1;
  id v13 = 0;
  unsigned int v3 = [v0 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v13];

  id v4 = v13;
  if (v3)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = v13;
    sub_37E30();

    swift_willThrow();
    if (qword_466A0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_37F50();
    sub_C3DC(v7, (uint64_t)qword_47A80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = sub_37F30();
    os_log_type_t v9 = sub_38250();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      id v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412290;
      swift_errorRetain();
      id v12 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v13 = v12;
      sub_38420();
      void *v11 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v8, v9, "Failed to create directory error: %@", v10, 0xCu);
      sub_5568(&qword_46CE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_32984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 24) = 1;
  id v5 = [self backgroundTaskDelegate];
  if (v5)
  {
    NSString v6 = sub_380A0();
    id v22 = sub_35CD4;
    uint64_t v23 = v4;
    aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_297B8;
    unint64_t v21 = &unk_42040;
    uint64_t v7 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v8 = [v5 ec_beginBackgroundTaskWithName:v6 expirationHandler:v7];
    _Block_release(v7);
    swift_unknownObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = swift_beginAccess();
  *(void *)(v4 + 16) = v8;
  *(unsigned char *)(v4 + 24) = v5 == 0;
  __chkstk_darwin(v9);
  id v11 = v10 + 4;
  os_unfair_lock_lock(v10 + 4);
  sub_35CAC(&aBlock);
  os_unfair_lock_unlock(v11);
  id v12 = aBlock;
  id v13 = (void *)swift_allocObject();
  _OWORD v13[2] = a1;
  v13[3] = a2;
  v13[4] = v4 + 16;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_35D2C;
  *(void *)(v14 + 24) = v13;
  id v22 = sub_35D48;
  uint64_t v23 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_3269C;
  unint64_t v21 = &unk_420B8;
  unint64_t v15 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  [v12 performBlockAndWait:v15];

  _Block_release(v15);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_32CB8(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a1 + 24) & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    id v4 = [self backgroundTaskDelegate];
    if (v4)
    {
      [v4 ec_endBackgroundTask:v3];
      swift_unknownObjectRelease();
    }
    uint64_t result = swift_beginAccess();
    *(void *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 24) = 1;
  }
  return result;
}

uint64_t sub_32D6C(void (*a1)(void), uint64_t a2, uint64_t *a3)
{
  a1();
  uint64_t result = swift_beginAccess();
  if ((a3[1] & 1) == 0)
  {
    uint64_t v5 = *a3;
    id v6 = [self backgroundTaskDelegate];
    if (v6)
    {
      [v6 ec_endBackgroundTask:v5];
      swift_unknownObjectRelease();
    }
    uint64_t result = swift_beginAccess();
    *a3 = 0;
    *((unsigned char *)a3 + 8) = 1;
  }
  return result;
}

uint64_t sub_32E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(v4 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v9);
  sub_35CAC(aBlock);
  os_unfair_lock_unlock(v9);
  uint64_t v10 = (void *)aBlock[0];
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  id v12 = (void *)swift_allocObject();
  v12[2] = v11;
  uint64_t v12[3] = a3;
  v12[4] = a4;
  void v12[5] = a1;
  v12[6] = a2;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_37B98;
  *(void *)(v13 + 24) = v12;
  aBlock[4] = sub_37D2C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3269C;
  aBlock[3] = &unk_42298;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v10 performBlockAndWait:v14];

  _Block_release(v14);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a2) {
    __break(1u);
  }
  return result;
}

void sub_33020(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  if (!swift_weakLoadStrong())
  {
    sub_C414();
    swift_allocError();
    unsigned char *v18 = 1;
    a2();
LABEL_14:
    swift_errorRelease();
    return;
  }
  uint64_t v37 = type metadata accessor for CDCloudSyncVersions();
  sub_5568(&qword_47280);
  sub_380E0();
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  swift_bridgeObjectRetain();
  NSString v8 = sub_380A0();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithEntityName:v8];

  [v9 setReturnsObjectsAsFaults:0];
  [v9 setFetchLimit:1];
  sub_5568(&qword_468C0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_398C0;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 32) = a4;
  *(void *)(v10 + 40) = a5;
  swift_bridgeObjectRetain();
  NSString v11 = sub_380A0();
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [self predicateWithFormat:v11 argumentArray:isa];

  [v9 setPredicate:v13];
  __chkstk_darwin(v14);
  uint64_t v16 = v15 + 4;
  os_unfair_lock_lock(v15 + 4);
  sub_35CAC(&v37);
  os_unfair_lock_unlock(v16);
  uint64_t v17 = (void *)v37;
  unint64_t v19 = sub_383C0();

  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_38590();
    swift_bridgeObjectRelease();
    if (v35) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  if (!*(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_17:
    swift_bridgeObjectRelease();
    NSString v23 = sub_380A0();
    uint64_t v24 = swift_bridgeObjectRelease();
    __chkstk_darwin(v24);
    os_log_type_t v26 = v25 + 4;
    os_unfair_lock_lock(v25 + 4);
    sub_35CAC(&v37);
    uint64_t v27 = self;
    os_unfair_lock_unlock(v26);
    uint64_t v28 = (void *)v37;
    id v29 = [v27 insertNewObjectForEntityForName:v23 inManagedObjectContext:v37];

    uint64_t v30 = swift_dynamicCastClass();
    if (v30)
    {
      id v22 = (id)v30;
      id v31 = v29;
      NSString v32 = sub_380A0();
      [v22 setDataType:v32];

      goto LABEL_12;
    }

    sub_C414();
    swift_allocError();
    unsigned char *v34 = 1;
    a2();
    swift_release();

    goto LABEL_14;
  }
LABEL_6:
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v20 = (id)sub_384C0();
    goto LABEL_9;
  }
  if (*(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8)))
  {
    id v20 = *(id *)(v19 + 32);
LABEL_9:
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v22 = v21;
LABEL_12:
    id v33 = v22;
    ((void (*)(id, void))a2)(v22, 0);

    swift_release();
    return;
  }
  __break(1u);
  os_unfair_lock_unlock((os_unfair_lock_t)v19);
  __break(1u);
}

void sub_336FC()
{
  unsigned int v1 = (os_unfair_lock_s *)(*(void *)(v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock) + 16);
  os_unfair_lock_lock(v1);
  sub_35CAC(aBlock);
  os_unfair_lock_unlock(v1);
  id v2 = (void *)aBlock[0];
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_37B48;
  aBlock[5] = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_297B8;
  aBlock[3] = &unk_42220;
  uint64_t v4 = _Block_copy(aBlock);
  swift_release();
  [v2 performBlock:v4];
  _Block_release(v4);
}

void sub_3382C()
{
  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    return;
  }
  id v39 = (id)type metadata accessor for CDCloudSyncVersions();
  sub_5568(&qword_47280);
  sub_380E0();
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_380A0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithEntityName:v1];

  __chkstk_darwin(v3);
  uint64_t v5 = v4 + 4;
  os_unfair_lock_lock(v4 + 4);
  sub_35CAC(&v39);
  os_unfair_lock_unlock(v5);
  id v6 = v39;
  unint64_t v17 = sub_383C0();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_38590();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = *(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  uint64_t v37 = v2;
  if (v18)
  {
    uint64_t v16 = 4;
    while (1)
    {
      id v19 = (v17 & 0xC000000000000001) != 0 ? (id)sub_384C0() : *(id *)(v17 + 8 * v16);
      id v20 = v19;
      id v7 = (void *)(v16 - 3);
      if (__OFADD__(v16 - 4, 1)) {
        break;
      }
      __chkstk_darwin(v19);
      id v22 = v21 + 4;
      os_unfair_lock_lock(v21 + 4);
      sub_35CAC(&v39);
      os_unfair_lock_unlock(v22);
      id v23 = v39;
      [v39 deleteObject:v20];

      ++v16;
      if (v7 == (void *)v18) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    uint64_t v24 = swift_bridgeObjectRelease_n();
    __chkstk_darwin(v24);
    os_log_type_t v26 = v25 + 4;
    os_unfair_lock_lock(v25 + 4);
    sub_35CAC(&v39);
    os_unfair_lock_unlock(v26);
    id v27 = v39;
    unsigned __int8 v28 = [v39 hasChanges];

    if ((v28 & 1) == 0)
    {
      swift_release();

      return;
    }
    __chkstk_darwin(v29);
    id v31 = v30 + 4;
    os_unfair_lock_lock(v30 + 4);
    sub_35CAC(&v39);
    os_unfair_lock_unlock(v31);
    id v32 = v39;
    id v39 = 0;
    unsigned int v33 = [v32 save:&v39];

    id v34 = v39;
    uint64_t v16 = (uint64_t)v37;
    if (v33)
    {
      swift_release();

      return;
    }
    uint64_t v35 = v34;
    uint64_t v36 = (void *)sub_37E30();

    swift_willThrow();
    id v39 = v36;
    sub_5568((uint64_t *)&unk_46CD0);
    sub_F100(0, (unint64_t *)&qword_46930);
    swift_dynamicCast();
    id v7 = v38;
    if (qword_466A0 == -1) {
      goto LABEL_4;
    }
  }
  swift_once();
LABEL_4:
  uint64_t v8 = sub_37F50();
  sub_C3DC(v8, (uint64_t)qword_47A80);
  id v9 = v7;
  uint64_t v10 = sub_37F30();
  os_log_type_t v11 = sub_38270();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = v16;
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)id v13 = 138412290;
    unint64_t v15 = v9;
    sub_38420();
    *uint64_t v14 = v9;

    uint64_t v16 = v12;
    _os_log_impl(&dword_0, v10, v11, "Failed to delete cloudSyncVersions error: %@", v13, 0xCu);
    sub_5568(&qword_46CE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v10 = v9;
  }

  swift_release();
  swift_errorRelease();
}

void sub_33E18(void *a1, char a2, void (*a3)(void *, uint64_t), uint64_t a4, void *a5)
{
  if (a2)
  {
    a3(a1, 1);
  }
  else
  {
    uint64_t v8 = a5[3];
    uint64_t v9 = a5[4];
    sub_1EA1C(a5, v8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 32);
    id v11 = a1;
    [v11 setCloudVersion:v10(v8, v9)];
    uint64_t v12 = a5[3];
    uint64_t v13 = a5[4];
    sub_1EA1C(a5, v12);
    uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
    sub_21274(v14);
    uint64_t v15 = a5[3];
    uint64_t v16 = a5[4];
    sub_1EA1C(a5, v15);
    [v11 setHistoryTokenOffset:((uint64_t (*)(uint64_t, uint64_t))(v16 + 24))(v15, v16)];
    a3(a1, 0);
    sub_1FD90(a1, 0);
  }
}

uint64_t sub_33F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = a3;
  uint64_t v27 = a5;
  uint64_t v11 = sub_5568(&qword_46AD0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11 - 8);
  uint64_t v15 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v26 - v16;
  sub_35D70(a1, (uint64_t)&v26 - v16);
  sub_35D70(a2, (uint64_t)v15);
  uint64_t v18 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = (v18 + 24) & ~v18;
  uint64_t v20 = (v13 + v18 + v19) & ~v18;
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v6;
  sub_1FE30((uint64_t)v17, v22 + v19, &qword_46AD0);
  sub_1FE30((uint64_t)v15, v22 + v20, &qword_46AD0);
  id v23 = (void *)(v22 + v21);
  *id v23 = v26;
  v23[1] = a4;
  uint64_t v24 = (void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v24 = v27;
  v24[1] = a6;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_32984((uint64_t)sub_1F7C0, v22);
  return swift_release();
}

void sub_34154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v31 = a6;
  uint64_t v32 = a7;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v10 = sub_5568(&qword_46AD0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10 - 8);
  uint64_t v14 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v29 - v15;
  unint64_t v17 = *(os_unfair_lock_s **)(a1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_accessLock);
  unsigned int v33 = sub_37D14;
  uint64_t v34 = a1;
  uint64_t v18 = v17 + 4;
  os_unfair_lock_lock(v17 + 4);
  sub_35CAC(&v35);
  os_unfair_lock_unlock(v18);
  uint64_t v19 = v35;
  sub_35D70(a2, (uint64_t)v16);
  sub_35D70(a3, (uint64_t)v14);
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = (v20 + 24) & ~v20;
  uint64_t v22 = (v12 + v20 + v21) & ~v20;
  unint64_t v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  sub_1FE30((uint64_t)v16, v24 + v21, &qword_46AD0);
  sub_1FE30((uint64_t)v14, v24 + v22, &qword_46AD0);
  id v25 = (void *)(v24 + v23);
  uint64_t v26 = v30;
  *id v25 = v29;
  v25[1] = v26;
  uint64_t v27 = (void *)(v24 + ((v23 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v28 = v32;
  void *v27 = v31;
  v27[1] = v28;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_11558((uint64_t)v19, (void (*)(void))sub_37A38);
  swift_release();
}

uint64_t sub_3436C(unint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t *, uint64_t), void *a7, void (*a8)(void), uint64_t a9)
{
  if ((a2 & 1) == 0) {
    return sub_27A40(a4, a5, a1, a6, a7, (uint64_t)a8, a9);
  }
  swift_errorRetain();
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_37F50();
  sub_C3DC(v12, (uint64_t)qword_47A80);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v13 = sub_37F30();
  os_log_type_t v14 = sub_38270();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412290;
    swift_errorRetain();
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    sub_38420();
    *uint64_t v16 = v17;
    sub_F3B4(a1, 1);
    sub_F3B4(a1, 1);
    _os_log_impl(&dword_0, v13, v14, "Failed to fetch configurations error: %@", v15, 0xCu);
    sub_5568(&qword_46CE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_F3B4(a1, 1);
    sub_F3B4(a1, 1);
  }

  a8();
  return sub_F3B4(a1, 1);
}

void sub_34584(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  id v67 = a2;
  uint64_t v4 = sub_37F20();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5568(&qword_46AD0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  id v66 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v68 = (char *)&v55 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v57 = (char *)&v55 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v55 - v15;
  uint64_t v17 = sub_5568(&qword_47290);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (uint64_t *)((char *)&v55 - v21);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_C414();
    uint64_t v33 = swift_allocError();
    unsigned char *v34 = 1;
    *uint64_t v22 = v33;
    swift_storeEnumTagMultiPayload();
    v67(v22);
    uint64_t v35 = &qword_47290;
    uint64_t v36 = (uint64_t)v22;
LABEL_22:
    sub_F42C(v36, v35);
    return;
  }
  uint64_t v24 = Strong;
  id v58 = v22;
  uint64_t v59 = v17;
  uint64_t v64 = (uint64_t *)v20;
  uint64_t v56 = v7;
  uint64_t v62 = a3;
  uint64_t v69 = type metadata accessor for CDCloudSyncHistory();
  sub_5568(&qword_47288);
  sub_380E0();
  id v25 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v26 = sub_380A0();
  swift_bridgeObjectRelease();
  id v27 = [v25 initWithEntityName:v26];

  [v27 setReturnsObjectsAsFaults:0];
  [v27 setFetchLimit:1];
  uint64_t v60 = v5;
  uint64_t v61 = v4;
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v65 = v16;
  uint64_t v29 = v28(v16, 1, 1, v4);
  __chkstk_darwin(v29);
  *(&v55 - 2) = (uint64_t)sub_37D14;
  *(&v55 - 1) = v24;
  uint64_t v31 = v30 + 4;
  os_unfair_lock_lock(v30 + 4);
  sub_35CAC(&v69);
  os_unfair_lock_unlock(v31);
  uint64_t v32 = (void *)v69;
  id v63 = v27;
  unint64_t v37 = sub_383C0();

  uint64_t v38 = (uint64_t)v66;
  if (v37 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_38590();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = *(void *)((char *)&dword_10 + (v37 & 0xFFFFFFFFFFFFFF8));
  }
  id v41 = v64;
  uint64_t v40 = (uint64_t)v65;
  uint64_t v42 = v68;
  if (!v39)
  {
    swift_bridgeObjectRelease();
    sub_F42C(v40, &qword_46AD0);
    uint64_t v47 = (uint64_t)v57;
    uint64_t v48 = v61;
    v28(v57, 1, 1, v61);
    goto LABEL_15;
  }
  if ((v37 & 0xC000000000000001) != 0)
  {
    id v43 = (id)sub_384C0();
    goto LABEL_10;
  }
  if (*(void *)((char *)&dword_10 + (v37 & 0xFFFFFFFFFFFFFF8)))
  {
    id v43 = *(id *)(v37 + 32);
LABEL_10:
    uint64_t v44 = v43;
    swift_bridgeObjectRelease();
    id v45 = [v44 lastSyncTimestamp];

    if (v45)
    {
      sub_37F00();

      uint64_t v46 = 0;
    }
    else
    {
      uint64_t v46 = 1;
    }
    uint64_t v49 = (uint64_t)v42;
    uint64_t v48 = v61;
    sub_F42C(v40, &qword_46AD0);
    v28((char *)v49, v46, 1, v48);
    uint64_t v47 = (uint64_t)v57;
    sub_1FE30(v49, (uint64_t)v57, &qword_46AD0);
LABEL_15:
    sub_1FE30(v47, v40, &qword_46AD0);
    uint64_t v68 = 0;
    uint64_t v50 = v60;
    uint64_t v51 = (uint64_t)v58;
    sub_35D70(v40, v38);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v38, 1, v48) == 1)
    {
      sub_F42C(v38, &qword_46AD0);
      if (v68)
      {
        uint64_t v52 = (uint64_t)v68;
      }
      else
      {
        sub_C414();
        uint64_t v52 = swift_allocError();
        uint64_t v68 = 0;
        *Class v54 = 1;
      }
      *id v41 = v52;
      swift_storeEnumTagMultiPayload();
      swift_errorRetain();
      v67(v41);
      swift_release();

      swift_errorRelease();
      sub_F42C((uint64_t)v41, &qword_47290);
    }
    else
    {
      uint64_t v53 = v56;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v56, v38, v48);
      (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v51, v53, v48);
      swift_storeEnumTagMultiPayload();
      v67((uint64_t *)v51);
      swift_release();

      swift_errorRelease();
      sub_F42C(v51, &qword_47290);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v48);
    }
    uint64_t v35 = &qword_46AD0;
    uint64_t v36 = v40;
    goto LABEL_22;
  }
  __break(1u);
}

void sub_34E44(uint64_t a1, void (*a2)(void))
{
  swift_beginAccess();
  if (!swift_weakLoadStrong())
  {
    sub_C414();
    swift_allocError();
    unsigned char *v9 = 1;
    a2();
    swift_errorRelease();
    return;
  }
  id v48 = (id)type metadata accessor for CDCloudSyncHistory();
  sub_5568(&qword_47288);
  sub_380E0();
  id v3 = objc_allocWithZone((Class)NSFetchRequest);
  swift_bridgeObjectRetain();
  NSString v4 = sub_380A0();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithEntityName:v4];

  [v5 setReturnsObjectsAsFaults:0];
  __chkstk_darwin([v5 setFetchLimit:1]);
  id v7 = v6 + 4;
  os_unfair_lock_lock(v6 + 4);
  sub_35CAC(&v48);
  os_unfair_lock_unlock(v7);
  id v8 = v48;
  unint64_t v10 = sub_383C0();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_38590();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_6;
    }
  }
  else if (*(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_6:
    if ((v10 & 0xC000000000000001) != 0)
    {
      id v11 = (id)sub_384C0();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8))) {
        __break(1u);
      }
      id v11 = *(id *)(v10 + 32);
    }
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  id v45 = v5;
  swift_bridgeObjectRelease();
  NSString v13 = sub_380A0();
  uint64_t v14 = swift_bridgeObjectRelease();
  __chkstk_darwin(v14);
  uint64_t v16 = v15 + 4;
  os_unfair_lock_lock(v15 + 4);
  sub_35CAC(&v48);
  uint64_t v17 = self;
  os_unfair_lock_unlock(v16);
  id v18 = v48;
  Class isa = (Class)[v17 insertNewObjectForEntityForName:v13 inManagedObjectContext:v48];

  uint64_t v20 = swift_dynamicCastClass();
  if (!v20)
  {
    id v21 = 0;
    id v5 = v45;
    goto LABEL_14;
  }
  uint64_t v12 = (void *)v20;
  id v5 = v45;
LABEL_12:
  id v21 = v12;
  Class isa = sub_37EC0().super.isa;
  [v21 setLastSyncTimestamp:isa];

LABEL_14:
  __chkstk_darwin(v22);
  uint64_t v24 = v23 + 4;
  os_unfair_lock_lock(v23 + 4);
  sub_35CAC(&v48);
  os_unfair_lock_unlock(v24);
  id v25 = v48;
  unsigned int v26 = [v48 hasChanges];

  if (!v26) {
    goto LABEL_16;
  }
  __chkstk_darwin(v27);
  uint64_t v29 = v28 + 4;
  os_unfair_lock_lock(v28 + 4);
  sub_35CAC(&v48);
  os_unfair_lock_unlock(v29);
  id v30 = v48;
  id v48 = 0;
  unsigned int v31 = [v30 save:&v48];

  id v32 = v48;
  if (!v31)
  {
    uint64_t v33 = v32;
    uint64_t v34 = (void *)sub_37E30();

    swift_willThrow();
    id v48 = v34;
    sub_5568((uint64_t *)&unk_46CD0);
    sub_F100(0, (unint64_t *)&qword_46930);
    swift_dynamicCast();
    uint64_t v35 = qword_466A0;
    id v36 = v47;
    if (v35 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_37F50();
    sub_C3DC(v37, (uint64_t)qword_47A80);
    uint64_t v38 = v36;
    uint64_t v39 = sub_37F30();
    os_log_type_t v40 = sub_38250();
    if (os_log_type_enabled(v39, v40))
    {
      id v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = (void *)swift_slowAlloc();
      *(_DWORD *)id v41 = 138412290;
      uint64_t v42 = v38;
      sub_38420();
      *uint64_t v46 = v38;

      _os_log_impl(&dword_0, v39, v40, "Failed to save cloudSyncHistory error: %@", v41, 0xCu);
      sub_5568(&qword_46CE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v42 = v38;
      uint64_t v39 = v38;
    }

    swift_errorRelease();
    id v43 = v38;
    ((void (*)(NSObject *, uint64_t))a2)(v38, 1);

    swift_release();
  }
  else
  {
LABEL_16:
    ((void (*)(void, void))a2)(0, 0);

    swift_release();
  }
}

void sub_35758(void *a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer);
  *(void *)(v1 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage____lazy_storage___l_persistentContainer) = a1;
  id v2 = a1;
}

uint64_t LocalStorage.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19EngagementCollector12LocalStorage_persistentDirectoryURL;
  uint64_t v2 = sub_37E90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();

  return v0;
}

uint64_t LocalStorage.__deallocating_deinit()
{
  LocalStorage.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

unint64_t sub_358D0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_38460();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_386C0();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t result = v15 + 8 * v3;
        if (v3 < (uint64_t)v6 || result >= v15 + 8 * v6 + 8)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          BOOL v16 = v3 == v6;
          int64_t v3 = v6;
          if (v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
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

unint64_t sub_35A90(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_38460();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_386D0();
        swift_bridgeObjectRetain();
        sub_38100();
        Swift::Int v10 = sub_386F0();
        uint64_t result = swift_bridgeObjectRelease();
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
          NSString v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *NSString v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          BOOL v16 = (_OWORD *)(v15 + 32 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *BOOL v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
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

void *sub_35C68@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X1>, void *a2@<X8>)
{
  uint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

void *sub_35CAC@<X0>(void *a1@<X8>)
{
  return sub_37C80(a1);
}

uint64_t sub_35CC4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_35CD4()
{
  return sub_32CB8(v0);
}

uint64_t sub_35CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_35CEC()
{
  return swift_release();
}

uint64_t sub_35CF4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_35D2C()
{
  return sub_32D6C(*(void (**)(void))(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_35D38()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_35D48()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_35D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5568(&qword_46AD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_35DDC()
{
  return type metadata accessor for LocalStorage();
}

uint64_t type metadata accessor for LocalStorage()
{
  uint64_t result = qword_470C8;
  if (!qword_470C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_35E30()
{
  uint64_t result = sub_37E90();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for LocalStorage(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for LocalStorage);
}

uint64_t dispatch thunk of LocalStorage.context.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of LocalStorage.performOnContext(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of LocalStorage.enumerate(startDate:endDate:closure:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of LocalStorage.unitTestOnlyReplacePersistentContainer(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

void sub_35FAC()
{
  uint64_t v0 = sub_382C0();
  uint64_t v43 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v41 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_5568(&qword_47278);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37E90();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  long long v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v41 - v11;
  __chkstk_darwin(v10);
  uint64_t v44 = (char *)&v41 - v13;
  char v46 = 0;
  id v14 = [self defaultManager];
  sub_37E70(0);
  NSString v15 = sub_380A0();
  swift_bridgeObjectRelease();
  unsigned int v16 = [v14 fileExistsAtPath:v15 isDirectory:&v46];

  if (!v16) {
    return;
  }
  NSString v17 = sub_380A0();
  id v18 = [self bundleWithIdentifier:v17];

  if (v18)
  {
    uint64_t v19 = v18;
    NSString v20 = sub_380A0();
    NSString v21 = sub_380A0();
    id v42 = v19;
    id v22 = [v19 URLForResource:v20 withExtension:v21];

    if (v22)
    {
      sub_37E60();

      uint64_t v23 = v45;
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
      v24(v5, v12, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v5, 1, v6) != 1)
      {
        id v25 = v44;
        v24(v44, v5, v6);
        id v26 = objc_allocWithZone((Class)NSManagedObjectModel);
        sub_37E40(v27);
        uint64_t v29 = v28;
        id v30 = [v26 initWithContentsOfURL:v28];

        if (v30)
        {
          id v31 = objc_allocWithZone((Class)NSPersistentContainer);
          id v32 = v30;
          NSString v33 = sub_380A0();
          id v34 = [v31 initWithName:v33 managedObjectModel:v32];

          id v35 = [v34 persistentStoreCoordinator];
          sub_37E50();
          sub_382A0();
          sub_383E0();

          (*(void (**)(char *, uint64_t))(v43 + 8))(v2, v0);
          os_log_type_t v40 = *(void (**)(char *, uint64_t))(v45 + 8);
          v40(v9, v6);
          v40(v44, v6);
          return;
        }
        (*(void (**)(char *, uint64_t))(v45 + 8))(v25, v6);

        goto LABEL_9;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v5, 1, 1, v6);
    }

    sub_F42C((uint64_t)v5, &qword_47278);
  }
LABEL_9:
  if (qword_466A0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_37F50();
  sub_C3DC(v36, (uint64_t)qword_47A80);
  uint64_t v37 = sub_37F30();
  os_log_type_t v38 = sub_38270();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_0, v37, v38, "Failed to destroy persistent store", v39, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_367F8()
{
  uint64_t v0 = sub_5568(&qword_47278);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_37E90();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  long long v9 = (char *)&v22 - v8;
  NSString v10 = sub_380A0();
  id v11 = [self bundleWithIdentifier:v10];

  if (!v11) {
    goto LABEL_8;
  }
  NSString v12 = sub_380A0();
  NSString v13 = sub_380A0();
  id v14 = [v11 URLForResource:v12 withExtension:v13];

  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_7;
  }
  sub_37E60();

  NSString v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v15(v2, v7, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_7:

    sub_F42C((uint64_t)v2, &qword_47278);
    goto LABEL_8;
  }
  v15(v9, v2, v3);
  id v16 = objc_allocWithZone((Class)NSManagedObjectModel);
  sub_37E40(v17);
  uint64_t v19 = v18;
  id v20 = [v16 initWithContentsOfURL:v18];

  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);

    return (uint64_t)v20;
  }
LABEL_8:
  uint64_t result = sub_38570();
  __break(1u);
  return result;
}

id sub_36B70()
{
  uint64_t v0 = sub_38010();
  uint64_t v75 = *(void *)(v0 - 8);
  uint64_t v76 = v0;
  __chkstk_darwin(v0);
  uint64_t v74 = (char *)&v64 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_37E90();
  uint64_t v80 = *(void *)(v70 - 8);
  uint64_t v78 = *(void *)(v80 + 64);
  uint64_t v2 = __chkstk_darwin(v70);
  uint64_t v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v64 - v5;
  id v7 = sub_2FDFC();
  sub_37E50();
  id v8 = objc_allocWithZone((Class)NSPersistentContainer);
  id v9 = v7;
  NSString v10 = sub_380A0();
  id v11 = [v8 initWithName:v10 managedObjectModel:v9];

  id v73 = v9;
  id v12 = objc_allocWithZone((Class)NSPersistentStoreDescription);
  sub_37E40(v13);
  NSString v15 = v14;
  id v16 = [v12 initWithURL:v14];

  [v16 setShouldMigrateStoreAutomatically:1];
  [v16 setShouldInferMappingModelAutomatically:1];
  [v16 setReadOnly:0];
  id v77 = (id)sub_5568(&qword_46920);
  uint64_t v17 = swift_allocObject();
  long long v66 = xmmword_39620;
  *(_OWORD *)(v17 + 16) = xmmword_39620;
  *(void *)(v17 + 32) = v16;
  aBlock[0] = v17;
  sub_38190();
  sub_F100(0, &qword_47250);
  id v71 = v16;
  Class isa = sub_38160().super.isa;
  swift_bridgeObjectRelease();
  id v72 = v11;
  [v11 setPersistentStoreDescriptions:isa];

  NSString v19 = sub_380A0();
  id v20 = [self bundleWithIdentifier:v19];

  id v21 = objc_allocWithZone((Class)NSManagedObjectModelReference);
  id v22 = v20;
  NSString v23 = sub_380A0();
  NSString v24 = sub_380A0();
  id v25 = [v21 initWithName:v23 inBundle:v22 versionChecksum:v24];

  id v26 = objc_allocWithZone((Class)NSManagedObjectModelReference);
  id v27 = v22;
  NSString v28 = sub_380A0();
  NSString v29 = sub_380A0();
  id v30 = [v26 initWithName:v28 inBundle:v27 versionChecksum:v29];

  id v69 = v27;
  sub_F100(0, &qword_47258);
  id v31 = v25;
  v32.super.Class isa = (Class)v30;
  Class v67 = v32.super.isa;
  id v68 = v31;
  v33.super.Class isa = (Class)v31;
  id v34 = sub_38380(v33, v32).super.super.isa;
  NSString v35 = sub_380A0();
  [(objc_class *)v34 setLabel:v35];

  uint64_t v36 = v80;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
  id v79 = v6;
  uint64_t v38 = v70;
  v37(v4, v6, v70);
  uint64_t v39 = *(unsigned __int8 *)(v36 + 80);
  uint64_t v65 = ~v39;
  os_log_type_t v40 = (char *)swift_allocObject();
  *((void *)v40 + 2) = 1635017060;
  *((void *)v40 + 3) = 0xE400000000000000;
  *((void *)v40 + 4) = 0x44497465737361;
  *((void *)v40 + 5) = 0xE700000000000000;
  uint64_t v41 = v4;
  id v42 = v4;
  uint64_t v43 = v38;
  uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
  v64(&v40[(v39 + 48) & ~v39], v42, v38);
  sub_38390();
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v66;
  id v77 = v34;
  *(void *)(v44 + 32) = v34;
  aBlock[0] = v44;
  sub_38190();
  uint64_t v45 = (void *)aBlock[0];
  if (aBlock[0] >> 62)
  {
    sub_F100(0, &qword_47260);
    id v63 = v77;
    swift_bridgeObjectRetain();
    uint64_t v47 = (void *)sub_38580();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v46 = v77;
    swift_bridgeObjectRetain();
    sub_38630();
    sub_F100(0, &qword_47260);
    uint64_t v47 = v45;
  }
  swift_bridgeObjectRelease();
  sub_F100(0, &qword_47268);
  v48._rawValue = v47;
  *(NSStagedMigrationManager *)&long long v66 = sub_383D0(v48);
  id v49 = v71;
  [v71 setOption:(void)v66 forKey:NSPersistentStoreStagedMigrationManagerOptionKey];
  dispatch_semaphore_t v50 = dispatch_semaphore_create(0);
  uint64_t v51 = v43;
  v37(v41, v79, v43);
  uint64_t v52 = (v39 + 16) & v65;
  unint64_t v53 = (v78 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v54 = (v53 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v55 = swift_allocObject();
  v64((char *)(v55 + v52), v41, v43);
  uint64_t v56 = v72;
  *(void *)(v55 + v53) = v72;
  *(void *)(v55 + v54) = v49;
  *(void *)(v55 + ((v54 + 15) & 0xFFFFFFFFFFFFFFF8)) = v50;
  aBlock[4] = sub_37650;
  aBlock[5] = v55;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_31798;
  aBlock[3] = &unk_42158;
  uint64_t v57 = _Block_copy(aBlock);
  id v58 = v49;
  id v59 = v56;
  uint64_t v60 = v50;
  swift_release();
  [v59 loadPersistentStoresWithCompletionHandler:v57];
  _Block_release(v57);
  uint64_t v61 = v74;
  sub_37FF0();
  sub_38360();

  (*(void (**)(char *, uint64_t))(v75 + 8))(v61, v76);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v79, v51);
  return v59;
}

uint64_t sub_3742C()
{
  uint64_t v1 = sub_37E90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_37500(void *a1)
{
}

uint64_t sub_37584()
{
  uint64_t v1 = sub_37E90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v8 + 8, v5);
}

Swift::Int sub_37650(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_37E90() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  id v9 = *(void **)(v2 + v7);
  NSString v10 = *(void **)(v2 + v8);
  id v11 = *(void **)(v2 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_30BB4(a1, a2, v2 + v6, v9, v10, v11);
}

uint64_t sub_37714()
{
  uint64_t v1 = sub_37E90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

Swift::Int sub_377B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_37E90() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_31488(a1, a2, v2 + v6, v7);
}

void sub_37864()
{
  sub_2FFB4(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_3788C()
{
  uint64_t v1 = *(void *)(sub_5568(&qword_46AD0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = (v4 + v2 + v3) & ~v2;
  swift_release();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_37F20();
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  if (!v9(v0 + v5, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v5, v7);
  }
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_37A38(unint64_t a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = *(void *)(sub_5568(&qword_46AD0) - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = (v8 + v6 + v7) & ~v6;
  return sub_3436C(a1, v4, *(void *)(v2 + 16), v2 + v7, v2 + v9, *(void (**)(uint64_t, uint64_t *, uint64_t))(v2 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(void))(v2 + ((((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v2 + ((((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_37B10()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_37B48()
{
}

uint64_t sub_37B50()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_37B98()
{
  sub_33020(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_37BA8()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_37BB8()
{
  unint64_t result = qword_46A30;
  if (!qword_46A30)
  {
    sub_382D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46A30);
  }
  return result;
}

unint64_t sub_37C10()
{
  unint64_t result = qword_472B8;
  if (!qword_472B8)
  {
    sub_F100(255, (unint64_t *)&qword_46E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_472B8);
  }
  return result;
}

void sub_37C78()
{
}

void *sub_37C80@<X0>(void *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_37CC4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_37CFC()
{
  sub_32138(*(void **)(v0 + 16));
}

uint64_t sub_37D04()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_37D14@<X0>(void *a1@<X8>)
{
  return sub_2FCA4(a1);
}

id sub_37DB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDCloudSyncHistory();
  return [super dealloc];
}

uint64_t type metadata accessor for CDCloudSyncHistory()
{
  return self;
}

uint64_t sub_37E10()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_37E20()
{
  return type metadata accessor for Notification();
}

uint64_t sub_37E30()
{
  return _convertNSErrorToError(_:)();
}

void sub_37E40(NSURL *retstr@<X8>)
{
}

uint64_t sub_37E50()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_37E60()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_37E70(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_37E80()
{
  return URL.path.getter();
}

uint64_t sub_37E90()
{
  return type metadata accessor for URL();
}

NSData sub_37EA0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_37EB0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_37EC0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_37ED0()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_37EE0()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_37EF0()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_37F00()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_37F10()
{
  return Date.init()();
}

uint64_t sub_37F20()
{
  return type metadata accessor for Date();
}

uint64_t sub_37F30()
{
  return Logger.logObject.getter();
}

uint64_t sub_37F40()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_37F50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_37F60()
{
  return PassthroughSubject.init()();
}

uint64_t sub_37F70()
{
  return Subject<>.send()();
}

uint64_t sub_37F80()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t sub_37F90()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_37FA0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_37FB0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_37FC0()
{
  return static DispatchQoS.background.getter();
}

uint64_t sub_37FD0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_37FE0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_37FF0()
{
  return static DispatchTime.distantFuture.getter();
}

uint64_t sub_38000()
{
  return static DispatchTime.now()();
}

uint64_t sub_38010()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_38020()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_38030()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_38040()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_38050()
{
  return + infix(_:_:)();
}

NSDictionary sub_38060()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_38070()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_38080()
{
  return Dictionary.description.getter();
}

uint64_t sub_38090()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString sub_380A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_380B0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_380C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_380D0()
{
  return String.init(format:_:)();
}

uint64_t sub_380E0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_380F0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_38100()
{
  return String.hash(into:)();
}

uint64_t sub_38110()
{
  return String.index(_:offsetBy:limitedBy:)();
}

void sub_38120(Swift::String a1)
{
}

Swift::Int sub_38130()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_38150()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_38160()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_38170()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_38180()
{
  return Array.description.getter();
}

uint64_t sub_38190()
{
  return specialized Array._endMutation()();
}

uint64_t sub_381A0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_381B0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_381C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_381D0()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_381E0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_381F0()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t sub_38210()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_38220()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_38230()
{
  return Collection.isNotEmpty.getter();
}

uint64_t sub_38240()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_38250()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_38260()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_38270()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_38280()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_38290()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_382A0()
{
  return static NSPersistentStore.StoreType.sqlite.getter();
}

uint64_t sub_382B0()
{
  return NSPersistentStore.StoreType.init(rawValue:)();
}

uint64_t sub_382C0()
{
  return type metadata accessor for NSPersistentStore.StoreType();
}

uint64_t sub_382D0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_382E0()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_382F0()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_38300()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t sub_38310()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
}

uint64_t sub_38320()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_38330()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_38340()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_38350()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_38360()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_38370()
{
  return OS_dispatch_semaphore.signal()();
}

NSCustomMigrationStage sub_38380(NSManagedObjectModelReference migratingFrom, NSManagedObjectModelReference to)
{
  return NSCustomMigrationStage.init(migratingFrom:to:)(migratingFrom, to);
}

uint64_t sub_38390()
{
  return NSCustomMigrationStage.didMigrateHandler.setter();
}

uint64_t sub_383A0()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t sub_383B0()
{
  return NSManagedObjectContext.count<A>(for:)();
}

uint64_t sub_383C0()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

NSStagedMigrationManager sub_383D0(Swift::OpaquePointer a1)
{
  return NSStagedMigrationManager.init(_:)(a1);
}

uint64_t sub_383E0()
{
  return NSPersistentStoreCoordinator.destroyPersistentStore(at:type:options:)();
}

uint64_t sub_383F0()
{
  return NSCoder.decodeObject<A>(of:forKey:)();
}

Swift::Int sub_38400(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_38410()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_38420()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_38430()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_38440()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_38450()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_38460()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_38470(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

void sub_38480(Swift::Int a1)
{
}

uint64_t sub_38490()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_384A0()
{
  return Identifiable<>.id.getter();
}

void sub_384B0(Swift::Int a1)
{
}

uint64_t sub_384C0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_384D0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_384E0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_38500()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_38510()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_38520()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_38530()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_38540()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_38550()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_38560()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_38570()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_38580()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_38590()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_385A0()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_385B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_385C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_385D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_385E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_385F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_38600()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_38620()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_38630()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_38650()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_38660()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_38670()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_38680()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_38690()
{
  return Error._code.getter();
}

uint64_t sub_386A0()
{
  return Error._domain.getter();
}

uint64_t sub_386B0()
{
  return Error._userInfo.getter();
}

uint64_t sub_386C0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_386D0()
{
  return Hasher.init(_seed:)();
}

void sub_386E0(Swift::UInt a1)
{
}

Swift::Int sub_386F0()
{
  return Hasher._finalize()();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getFunctionReplacement()
{
  return _swift_getFunctionReplacement();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

id objc_msgSend_addDonorObserver_(void *a1, const char *a2, ...)
{
  return [a1 addDonorObserver:];
}

id objc_msgSend_donateWithConfiguration_context_donationCompleteBlock_(void *a1, const char *a2, ...)
{
  return [a1 donateWithConfiguration:context:donationCompleteBlock:];
}

id objc_msgSend_donor(void *a1, const char *a2, ...)
{
  return _[a1 donor];
}

id objc_msgSend_eventConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 eventConfigurations];
}

id objc_msgSend_initWithDirectory_shouldRunUpdatesOnSchedule_shouldPurgeOutdatedData_(void *a1, const char *a2, ...)
{
  return [a1 initWithDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_isObservedBy_(void *a1, const char *a2, ...)
{
  return [a1 isObservedBy:];
}

id objc_msgSend_propertyDidChange_propertyConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 propertyDidChange:propertyConfiguration:];
}

id objc_msgSend_removeDonorObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeDonorObserver];
}

id objc_msgSend_setDonor_(void *a1, const char *a2, ...)
{
  return [a1 setDonor:];
}

id objc_msgSend_setEventConfigurations_(void *a1, const char *a2, ...)
{
  return [a1 setEventConfigurations:];
}

id objc_msgSend_setManagerConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setManagerConfiguration:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}