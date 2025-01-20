@interface JSUserSocialProfileCoordinator
- (JSValue)userProfile;
- (_TtC7MusicUI30JSUserSocialProfileCoordinator)init;
- (id)fetchIsCloudAndMediaAccountIdentical;
- (id)fetchUserSocialProfile;
@end

@implementation JSUserSocialProfileCoordinator

- (JSValue)userProfile
{
  v2 = self;
  v3 = (void *)sub_229A7E614();

  return (JSValue *)v3;
}

- (id)fetchUserSocialProfile
{
  v2 = self;
  v3 = (void *)sub_229A7E614();

  return v3;
}

- (id)fetchIsCloudAndMediaAccountIdentical
{
  v2 = self;
  v3 = (void *)sub_229A7E614();

  return v3;
}

- (_TtC7MusicUI30JSUserSocialProfileCoordinator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_userSocialProfileCoordinator));
  swift_release();
  swift_release();
  sub_2294868C0((uint64_t)self + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_pendingProfileFetch, &qword_2683251A8);
  sub_2294868C0((uint64_t)self + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_pendingProfileFetchResolution, &qword_26ADA7AF8);
  sub_2294868C0((uint64_t)self + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_pendingIsCloudAndMediaAccountIdenticalFetch, &qword_2683251A8);
}

@end