@interface JSSocialOnboardingFriendsModelRequest
+ (BOOL)requiresNetwork;
- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest)init;
- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
@end

@implementation JSSocialOnboardingFriendsModelRequest

- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest)init
{
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest_friends] = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest_shouldSortOnboardedFriends] = 0;
  self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest_shouldSortNonOnboardedFriends] = 0;
  *(void *)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest_previousResponse] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSSocialOnboardingFriendsModelRequest();
  return [(JSSocialOnboardingFriendsModelRequest *)&v3 init];
}

- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest)initWithCoder:(id)a3
{
  return (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest *)sub_370F54(a3);
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_37101C((uint64_t)a3, (uint64_t)v7);

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
  id v13 = objc_allocWithZone((Class)type metadata accessor for JSSocialOnboardingFriendsModelRequest.Operation());
  id v14 = sub_376478(v6, (uint64_t)sub_376590, (uint64_t)v12);

  swift_release();
  return v14;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_super v3 = *(void **)&self->MPModelRequest_opaque[OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4137JSSocialOnboardingFriendsModelRequest_previousResponse];
}

@end