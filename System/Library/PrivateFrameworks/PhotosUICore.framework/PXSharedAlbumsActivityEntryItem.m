@interface PXSharedAlbumsActivityEntryItem
- (BOOL)isFromMe;
- (BOOL)isPlaceholder;
- (NSArray)contributorDisplayNames;
- (NSDate)date;
- (NSString)albumId;
- (NSString)albumName;
- (NSString)contributorDisplayName;
- (NSString)message;
- (NSString)relatedCommentUUID;
- (PXSharedAlbumsActivityEntryAvatarConfiguration)avatarInfo;
- (PXSharedAlbumsActivityEntryItem)init;
- (id)assets;
- (int64_t)type;
@end

@implementation PXSharedAlbumsActivityEntryItem

- (NSDate)date
{
  v2 = (void *)sub_1AB23069C();
  return (NSDate *)v2;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_type);
}

- (BOOL)isFromMe
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_isFromMe);
}

- (NSArray)contributorDisplayNames
{
}

- (NSString)albumName
{
}

- (NSString)albumId
{
}

- (NSString)message
{
  return (NSString *)sub_1A9E8A564((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXSharedAlbumsActivityEntryItem_message);
}

- (BOOL)isPlaceholder
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_isPlaceholder);
}

- (NSString)relatedCommentUUID
{
  return (NSString *)sub_1A9E8A564((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXSharedAlbumsActivityEntryItem_relatedCommentUUID);
}

- (id)assets
{
  v2 = self;
  sub_1AA6A4E80();
}

- (NSString)contributorDisplayName
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_activityEntry);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_contributorDisplayName);
  sub_1AB23A76C();

  v5 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (PXSharedAlbumsActivityEntryAvatarConfiguration)avatarInfo
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_activityEntry), sel_avatarConfiguration);
  return (PXSharedAlbumsActivityEntryAvatarConfiguration *)v2;
}

- (PXSharedAlbumsActivityEntryItem)init
{
  result = (PXSharedAlbumsActivityEntryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_date;
  uint64_t v4 = sub_1AB23075C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end