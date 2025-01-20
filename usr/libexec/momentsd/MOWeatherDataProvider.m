@interface MOWeatherDataProvider
- (_TtC8momentsd21MOWeatherDataProvider)init;
- (void)fetchCurrentWeatherFor:(id)a3 completion:(id)a4;
- (void)fetchHourlyWeatherFor:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
@end

@implementation MOWeatherDataProvider

- (void)fetchCurrentWeatherFor:(id)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a3;
  v14[5] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned MOWeatherData?, @unowned NSError?) -> ();
  v14[6] = v12;
  id v15 = a3;
  v16 = self;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&closure #1 in MOWeatherDataProvider.fetchCurrentWeather(for:completion:)partial apply, (uint64_t)v14);

  swift_release();
  swift_release();
}

- (void)fetchHourlyWeatherFor:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v48 = a3;
  v49 = self;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = v10;
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v15 = __chkstk_darwin(v11, v14);
  v44 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15, v16);
  v19 = (char *)&v42 - v18;
  v43 = (char *)&v42 - v18;
  uint64_t v21 = __chkstk_darwin(v17, v20);
  v23 = (char *)&v42 - v22;
  __chkstk_darwin(v21, v24);
  v26 = (char *)&v42 - v25;
  v27 = _Block_copy(a6);
  v47 = v26;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  v46 = v23;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v27;
  uint64_t v29 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v10, 1, 1, v29);
  v30 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v30(v19, v26, v11);
  v31 = v44;
  v30(v44, v23, v11);
  uint64_t v32 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v33 = (v32 + 40) & ~v32;
  uint64_t v34 = (v13 + v32 + v33) & ~v32;
  v35 = (char *)swift_allocObject();
  *((void *)v35 + 2) = 0;
  *((void *)v35 + 3) = 0;
  v36 = v48;
  *((void *)v35 + 4) = v48;
  v37 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v37(&v35[v33], v43, v11);
  v37(&v35[v34], v31, v11);
  v38 = (void (**)(objc_class *, uint64_t))&v35[(v13 + v34 + 7) & 0xFFFFFFFFFFFFFFF8];
  *v38 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSArray?, @unowned NSError?) -> ();
  v38[1] = (void (*)(objc_class *, uint64_t))v28;
  id v39 = v36;
  v40 = v49;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v45, (uint64_t)&closure #1 in MOWeatherDataProvider.fetchHourlyWeather(for:startDate:endDate:completion:)partial apply, (uint64_t)v35);

  swift_release();
  swift_release();
  v41 = *(void (**)(char *, uint64_t))(v12 + 8);
  v41(v46, v11);
  v41(v47, v11);
}

- (_TtC8momentsd21MOWeatherDataProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOWeatherDataProvider();
  return [(MOWeatherDataProvider *)&v3 init];
}

@end