@interface JSContainerDetailModelRequest
- (_TtC16MusicApplication29JSContainerDetailModelRequest)init;
- (_TtC16MusicApplication29JSContainerDetailModelRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (id)playbackIntentFor:(id)a3 itemKind:(id)a4 itemProperties:(id)a5;
- (id)playbackIntentWithStartItemIdentifiers:(id)a3;
- (id)requestForDetailFor:(id)a3 kind:(id)a4 requestedProperties:(id)a5;
@end

@implementation JSContainerDetailModelRequest

- (_TtC16MusicApplication29JSContainerDetailModelRequest)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_filterText];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_sortOption] = 13;
  swift_unknownObjectWeakInit();
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_containerDetailViewModel] = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_isCancelled] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(JSContainerDetailModelRequest *)&v6 init];
}

- (_TtC16MusicApplication29JSContainerDetailModelRequest)initWithCoder:(id)a3
{
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1C16F0((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_AB8630();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  objc_super v6 = self;
  v7 = JSViewModelRequestCoordinator.sharedCoordinator.unsafeMutableAddressor();
  uint64_t v8 = *v7;
  v9 = *(uint64_t (**)(uint64_t))(*(void *)*v7 + 144);
  uint64_t v10 = swift_retain();
  uint64_t v11 = v9(v10);
  v12 = (void *)swift_allocObject();
  v12[2] = v8;
  v12[3] = v11;
  v12[4] = sub_B6D6C;
  v12[5] = v5;
  id v13 = objc_allocWithZone((Class)type metadata accessor for JSContainerDetailModelRequestOperation());
  id v14 = sub_1CC100(v6, (uint64_t)sub_1CD350, (uint64_t)v12);

  swift_release();
  return v14;
}

- (id)playbackIntentWithStartItemIdentifiers:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  id v7 = sub_1C1A38(a3);

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  v3 = *(void **)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication29JSContainerDetailModelRequest_containerDetailViewModel];
}

- (id)playbackIntentFor:(id)a3 itemKind:(id)a4 itemProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  v12 = (uint64_t *)MPIdentifierSet.Purpose.Options.catalog.unsafeMutableAddressor();
  uint64_t v13 = MPModelObject.bestIdentifier(for:)(*v12, 1u);
  if (v14)
  {
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DC7B70);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_AEB050;
    *(void *)(v17 + 32) = v15;
    *(void *)(v17 + 40) = v16;
    id v18 = sub_1C1BE4(v17, 0);

    swift_bridgeObjectRelease();
  }
  else
  {

    id v18 = 0;
  }

  return v18;
}

- (id)requestForDetailFor:(id)a3 kind:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  id v12 = sub_23C464(v8, (uint64_t)v9, (uint64_t)v10);

  return v12;
}

@end