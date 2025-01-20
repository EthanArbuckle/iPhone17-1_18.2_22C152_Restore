@interface MTPlaybackPositionController
- (MTPlaybackPositionController)init;
- (void)updatePlaybackPositionWithEpisodeStoreId:(int64_t)a3 completed:(BOOL)a4 position:(double)a5 account:(id)a6 completion:(id)a7;
@end

@implementation MTPlaybackPositionController

- (void)updatePlaybackPositionWithEpisodeStoreId:(int64_t)a3 completed:(BOOL)a4 position:(double)a5 account:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7694A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1ACE843F0;
  if (a3 < 0)
  {
    sub_1ACE77488();
    __break(1u);
  }
  else
  {
    unint64_t v15 = inited;
    *(void *)(inited + 32) = a3;
    id v16 = a6;
    v17 = self;
    sub_1ACACC0EC(v15, v9, a6, (uint64_t)sub_1ACA3A598, v13, a5);
    swift_setDeallocating();

    swift_release();
  }
}

- (MTPlaybackPositionController)init
{
  uint64_t v3 = OBJC_IVAR___MTPlaybackPositionController_requestController;
  id v4 = objc_allocWithZone((Class)type metadata accessor for MediaRequestController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PlaybackPositionController();
  return [(MTPlaybackPositionController *)&v7 init];
}

- (void).cxx_destruct
{
}

@end