@interface PKWeatherEventViewHost
+ (id)createWithWeatherInformation:(id)a3;
- (PKWeatherEventViewHost)init;
@end

@implementation PKWeatherEventViewHost

+ (id)createWithWeatherInformation:(id)a3
{
  uint64_t v4 = type metadata accessor for WeatherEventView();
  uint64_t v6 = MEMORY[0x1F4188790](v4 - 8, v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v6, v9);
  v12 = (char *)&v17 - v11;
  *(uint64_t *)((char *)&v17 - v11) = (uint64_t)a3;
  v13 = (uint64_t *)((char *)&v17 + *(int *)(v10 + 28) - v11);
  uint64_t *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AC820);
  swift_storeEnumTagMultiPayload();
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94AB560));
  sub_19F908B90((uint64_t)v12, (uint64_t)v8);
  id v14 = a3;
  v15 = (void *)sub_1A03B1E78();
  sub_19F908BF4((uint64_t)v12);
  objc_msgSend(v15, sel_setUserInteractionEnabled_, 0);

  return v15;
}

- (PKWeatherEventViewHost)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WeatherEventViewHost();
  return [(PKWeatherEventViewHost *)&v3 init];
}

@end