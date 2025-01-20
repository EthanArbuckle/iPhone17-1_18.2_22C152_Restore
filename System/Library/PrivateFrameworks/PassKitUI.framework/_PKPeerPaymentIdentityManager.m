@interface _PKPeerPaymentIdentityManager
- (BOOL)_shareLastName;
- (BOOL)_shareProfilePicture;
- (BOOL)shareLastName;
- (BOOL)shareProfilePicture;
- (NSData)_profilePictureData;
- (NSData)profilePictureData;
- (NSString)firstName;
- (NSString)lastName;
- (PKPeerPaymentProfileAppearanceData)_appearanceData;
- (PKPeerPaymentProfileAppearanceData)appearanceData;
- (_PKPeerPaymentIdentityManager)init;
- (_PeerPaymentIdentityManagerDelegate)_delegate;
- (_PeerPaymentIdentityManagerDelegate)delegate;
- (void)commitUpdatesIfNeeded;
- (void)setAppearanceData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProfilePictureData:(id)a3;
- (void)setShareLastName:(BOOL)a3;
- (void)setShareProfilePicture:(BOOL)a3;
- (void)set_appearanceData:(id)a3;
- (void)set_delegate:(id)a3;
- (void)set_profilePictureData:(id)a3;
- (void)set_shareLastName:(BOOL)a3;
- (void)set_shareProfilePicture:(BOOL)a3;
@end

@implementation _PKPeerPaymentIdentityManager

- (NSString)firstName
{
  return (NSString *)sub_19F62E348();
}

- (NSString)lastName
{
  return (NSString *)sub_19F62E348();
}

- (NSData)_profilePictureData
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  unint64_t v3 = *(void *)&self->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_19F456368(*v2, v3);
    v4 = (void *)sub_1A03AED58();
    sub_19F4562FC(v5, v3);
  }

  return (NSData *)v4;
}

- (void)set_profilePictureData:(id)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    v4 = self;
    id v5 = v3;
    unint64_t v3 = (void *)sub_1A03AED68();
    unint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  v9 = (Class *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  unint64_t v11 = *(void *)&self->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData];
  void *v9 = v3;
  v9[1] = v7;
  sub_19F4562FC(v10, v11);
}

- (NSData)profilePictureData
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  unint64_t v3 = self;
  sub_1A03AF5D8();
  swift_release();
  uint64_t v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData);
  unint64_t v5 = *(void *)&v3->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData];
  sub_19F4562E8(v4, v5);

  if (v5 >> 60 == 15)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = (void *)sub_1A03AED58();
    sub_19F4562FC(v4, v5);
  }

  return (NSData *)v6;
}

- (void)setProfilePictureData:(id)a3
{
  if (a3)
  {
    unint64_t v5 = self;
    id v6 = a3;
    uint64_t v7 = sub_1A03AED68();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = self;
    uint64_t v7 = 0;
    unint64_t v9 = 0xF000000000000000;
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x1F4188790](KeyPath, v12);
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  sub_1A03AF5C8();
  sub_19F4562FC(v7, v9);

  swift_release();
}

- (BOOL)_shareLastName
{
  v2 = (BOOL *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__shareLastName;
  swift_beginAccess();
  return *v2;
}

- (void)set_shareLastName:(BOOL)a3
{
}

- (BOOL)shareLastName
{
  return sub_19F62F08C(self, (uint64_t)a2, (uint64_t)&unk_1A0415C80, &OBJC_IVAR____PKPeerPaymentIdentityManager__shareLastName);
}

- (void)setShareLastName:(BOOL)a3
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  uint64_t v4 = self;
  sub_1A03AF5C8();

  swift_release();
}

- (BOOL)_shareProfilePicture
{
  v2 = (BOOL *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__shareProfilePicture;
  swift_beginAccess();
  return *v2;
}

- (void)set_shareProfilePicture:(BOOL)a3
{
}

- (BOOL)shareProfilePicture
{
  return sub_19F62F08C(self, (uint64_t)a2, (uint64_t)&unk_1A0415CC8, &OBJC_IVAR____PKPeerPaymentIdentityManager__shareProfilePicture);
}

- (void)setShareProfilePicture:(BOOL)a3
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  uint64_t v4 = self;
  sub_1A03AF5C8();

  swift_release();
}

- (_PeerPaymentIdentityManagerDelegate)_delegate
{
  v2 = (char *)self + OBJC_IVAR____PKPeerPaymentIdentityManager__delegate;
  swift_beginAccess();
  unint64_t v3 = (void *)MEMORY[0x1A6224F80](v2);

  return (_PeerPaymentIdentityManagerDelegate *)v3;
}

- (void)set_delegate:(id)a3
{
}

- (_PeerPaymentIdentityManagerDelegate)delegate
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  unint64_t v3 = self;
  sub_1A03AF5D8();
  swift_release();
  uint64_t v4 = (char *)v3 + OBJC_IVAR____PKPeerPaymentIdentityManager__delegate;
  swift_beginAccess();
  unint64_t v5 = (void *)MEMORY[0x1A6224F80](v4);

  return (_PeerPaymentIdentityManagerDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1A03AF5C8();

  swift_release();
  swift_unknownObjectRelease();
}

- (PKPeerPaymentProfileAppearanceData)_appearanceData
{
  return (PKPeerPaymentProfileAppearanceData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData));
}

- (void)set_appearanceData:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData) = (Class)a3;
  id v3 = a3;
}

- (PKPeerPaymentProfileAppearanceData)appearanceData
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  id v3 = self;
  sub_1A03AF5D8();
  swift_release();
  id v4 = (PKPeerPaymentProfileAppearanceData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v3->super.isa
                                                                                     + OBJC_IVAR____PKPeerPaymentIdentityManager__appearanceData));

  return v4;
}

- (void)setAppearanceData:(id)a3
{
  swift_getKeyPath();
  sub_19F631C00((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  id v5 = a3;
  id v6 = self;
  sub_1A03AF5C8();

  swift_release();
}

- (_PKPeerPaymentIdentityManager)init
{
  return (_PKPeerPaymentIdentityManager *)PeerPaymentIdentityManager.init()();
}

- (void)commitUpdatesIfNeeded
{
  v2 = self;
  PeerPaymentIdentityManager.commitUpdatesIfNeeded()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19F4562FC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData), *(void *)&self->firstName[OBJC_IVAR____PKPeerPaymentIdentityManager__profilePictureData]);
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____PKPeerPaymentIdentityManager__delegate);

  id v3 = (char *)self + OBJC_IVAR____PKPeerPaymentIdentityManager___observationRegistrar;
  uint64_t v4 = sub_1A03AF618();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end