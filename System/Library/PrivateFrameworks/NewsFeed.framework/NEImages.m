@interface NEImages
+ (UIImage)actionSheetBlock;
+ (UIImage)actionSheetFollow;
+ (UIImage)actionSheetStopSuggesting;
+ (UIImage)actionSheetUnblock;
+ (UIImage)actionSheetUnfollow;
+ (UIImage)blockActivity;
+ (UIImage)followChannelActivity;
+ (UIImage)headphones;
+ (UIImage)reload;
+ (UIImage)saveActivity;
+ (UIImage)saveSelectedActivity;
+ (UIImage)shortcutTagActivity;
+ (UIImage)showLessActivity;
+ (UIImage)showLessSelectedActivity;
+ (UIImage)showMoreActivity;
+ (UIImage)showMoreSelectedActivity;
+ (UIImage)stopSuggesting;
+ (UIImage)unShortcutTagActivity;
+ (UIImage)unblockActivity;
+ (UIImage)unfollowChannelActivity;
+ (UIImage)unfollowChannelActivity2;
- (NEImages)init;
@end

@implementation NEImages

+ (UIImage)headphones
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB85E718, (void **)&qword_1EB85DE20);
}

+ (UIImage)stopSuggesting
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, qword_1EB86BDC8, (void **)&qword_1EB85E780);
}

+ (UIImage)followChannelActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB86AD70, (void **)&qword_1EB85DE50);
}

+ (UIImage)unfollowChannelActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA1949F8, (void **)&qword_1EB85DE58);
}

+ (UIImage)unfollowChannelActivity2
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194A00, (void **)&qword_1EA1AA280);
}

+ (UIImage)shortcutTagActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194A08, (void **)&qword_1EA1AA288);
}

+ (UIImage)unShortcutTagActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194A10, (void **)&qword_1EA1AA290);
}

+ (UIImage)blockActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB86AD68, (void **)&qword_1EB85DE28);
}

+ (UIImage)unblockActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194A20, (void **)&qword_1EA1AA298);
}

+ (UIImage)showMoreActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB85EEF8, (void **)&qword_1EB85C2B8);
}

+ (UIImage)showMoreSelectedActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB85EF10, (void **)&qword_1EB85C2C0);
}

+ (UIImage)showLessActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB85EEE8, (void **)&qword_1EB85DE38);
}

+ (UIImage)showLessSelectedActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB85EF00, (void **)&qword_1EB85DE60);
}

+ (UIImage)saveActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB87BD08, (void **)&qword_1EB870F38);
}

+ (UIImage)saveSelectedActivity
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194A30, (void **)&qword_1EA1AA2A0);
}

+ (UIImage)reload
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194A38, (void **)&qword_1EA1AA2A8);
}

+ (UIImage)actionSheetStopSuggesting
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB86BDE0, (void **)qword_1EB85E788);
}

+ (UIImage)actionSheetBlock
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EB86BDD8, (void **)&qword_1EB85DE30);
}

+ (UIImage)actionSheetUnblock
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194AD0, (void **)&qword_1EA1AA318);
}

+ (UIImage)actionSheetFollow
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194AD8, (void **)&qword_1EB85DE40);
}

+ (UIImage)actionSheetUnfollow
{
  return (UIImage *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA194AE0, (void **)&qword_1EB85DE48);
}

- (NEImages)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Images();
  return [(NEImages *)&v3 init];
}

@end