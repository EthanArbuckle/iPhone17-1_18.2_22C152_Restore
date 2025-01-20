@interface UserInfoMergeHandler
- (id)commandsToMergeRecordWithServer:(id)a3;
@end

@implementation UserInfoMergeHandler

- (id)commandsToMergeRecordWithServer:(id)a3
{
  id v3 = a3;
  sub_1AFFC8E48();
  sub_1AFDEB8E8(v3);

  swift_release();
  sub_1AFD2D178(0, &qword_1E9AFAE48);
  v4 = (void *)sub_1AFFCB1B8();
  swift_bridgeObjectRelease();

  return v4;
}

@end