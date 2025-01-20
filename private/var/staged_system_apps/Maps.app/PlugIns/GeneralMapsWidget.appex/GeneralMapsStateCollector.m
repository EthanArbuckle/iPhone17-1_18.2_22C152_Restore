@interface GeneralMapsStateCollector
- (NSString)uniqueName;
- (_TtC17GeneralMapsWidget25GeneralMapsStateCollector)init;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
- (void)navigationServiceDidSynchronize:(id)a3;
@end

@implementation GeneralMapsStateCollector

- (NSString)uniqueName
{
  swift_getObjectType();
  sub_100002874(&qword_1000A8048);
  sub_100083880();
  NSString v2 = sub_100083850();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_100083A20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  if (qword_1000A7A00 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100082F00();
  sub_10001859C(v6, (uint64_t)qword_1000ACBA8);
  v7 = sub_100082EE0();
  os_log_type_t v8 = sub_100083920();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "GeneralMapsStateCollector: MSg invalidate sink", v9, 2u);
    swift_slowDealloc();
  }

  sub_100019138((uint64_t)v10, &qword_1000A7F40);
}

- (void)navigationServiceDidSynchronize:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100019B90();
}

- (_TtC17GeneralMapsWidget25GeneralMapsStateCollector)init
{
  result = (_TtC17GeneralMapsWidget25GeneralMapsStateCollector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_locationUpdater));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_suggestionsEngine));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_suggestionsNetworkRequester));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_transportModePredictor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_isolationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector_collectorGroup));
  sub_100018854(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state), *(void *)&self->locationUpdater[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void *)&self->suggestionsEngine[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void **)&self->suggestionsNetworkRequester[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void *)&self->transportModePredictor[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void *)&self->isolationQueue[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void *)&self->collectorGroup[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state], *(void **)&self->$__lazy_storage_$_state[OBJC_IVAR____TtC17GeneralMapsWidget25GeneralMapsStateCollector____lazy_storage___state]);
  swift_release();
  swift_release();

  swift_release();
}

@end