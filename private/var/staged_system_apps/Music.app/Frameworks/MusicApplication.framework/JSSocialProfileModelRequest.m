@interface JSSocialProfileModelRequest
- (_TtC16MusicApplication27JSSocialProfileModelRequest)init;
- (_TtC16MusicApplication27JSSocialProfileModelRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
@end

@implementation JSSocialProfileModelRequest

- (_TtC16MusicApplication27JSSocialProfileModelRequest)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_profile] = 0;
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_previousResponse] = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(JSSocialProfileModelRequest *)&v5 init];
}

- (_TtC16MusicApplication27JSSocialProfileModelRequest)initWithCoder:(id)a3
{
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_profile] = 0;
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_previousResponse] = 0;
  swift_deallocPartialClassInstance();
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_53F3FC((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  objc_super v5 = (void *)sub_AB8630();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
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
  id v13 = objc_allocWithZone((Class)type metadata accessor for JSSocialProfileModelRequestOperation());
  id v14 = sub_54017C(v6, (uint64_t)sub_540170, (uint64_t)v12);

  swift_release();
  return v14;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication27JSSocialProfileModelRequest_previousResponse];
}

@end