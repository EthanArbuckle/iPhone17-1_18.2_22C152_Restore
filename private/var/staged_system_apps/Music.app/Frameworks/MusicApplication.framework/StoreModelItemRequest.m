@interface StoreModelItemRequest
+ (BOOL)requiresNetwork;
+ (BOOL)supportsSecureCoding;
- (_TtC16MusicApplication21StoreModelItemRequest)init;
- (_TtC16MusicApplication21StoreModelItemRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StoreModelItemRequest

- (_TtC16MusicApplication21StoreModelItemRequest)init
{
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_model] = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_preventStoreItemMetadataCaching] = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoreModelItemRequest();
  return [(StoreModelItemRequest *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC16MusicApplication21StoreModelItemRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC16MusicApplication21StoreModelItemRequest *)sub_D8D80((uint64_t)v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StoreModelItemRequest();
  id v4 = a3;
  v5 = (char *)v8.receiver;
  [(StoreModelItemRequest *)&v8 encodeWithCoder:v4];
  id v6 = *(id *)&v5[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_model];
  NSString v7 = sub_AB64D0();
  [v4 encodeObject:v6 forKey:v7];
}

- (id)copyWithZone:(void *)a3
{
  id v4 = self;
  sub_D6E10((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_AB8630();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

+ (BOOL)requiresNetwork
{
  return 1;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  NSString v7 = JSViewModelRequestCoordinator.sharedCoordinator.unsafeMutableAddressor();
  uint64_t v8 = *v7;
  v9 = *(uint64_t (**)(uint64_t))(*(void *)*v7 + 144);
  uint64_t v10 = swift_retain();
  id result = (id)v9(v10);
  int v12 = v6->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplication21StoreModelItemRequest_preventStoreItemMetadataCaching];
  if (v12 == 2)
  {
    __break(1u);
  }
  else
  {
    id v13 = result;
    char v14 = v12 & 1;
    v15 = (void *)swift_allocObject();
    v15[2] = v8;
    v15[3] = v13;
    v15[4] = sub_B6D6C;
    v15[5] = v5;
    id v16 = objc_allocWithZone((Class)type metadata accessor for StoreModelItemRequestOperation());
    id v17 = sub_D8E58(v6, v14, (uint64_t)sub_D8D74, (uint64_t)v15);

    swift_release();
    return v17;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end