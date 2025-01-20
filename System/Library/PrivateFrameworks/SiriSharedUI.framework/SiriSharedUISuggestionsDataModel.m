@interface SiriSharedUISuggestionsDataModel
- (void)keyBoardWillHideWithNotification:(id)a3;
- (void)keyBoardWillShowWithNotification:(id)a3;
@end

@implementation SiriSharedUISuggestionsDataModel

- (void)keyBoardWillShowWithNotification:(id)a3
{
  uint64_t v3 = sub_20CA81C08();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20CA81BF8();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[15] = 1;
  swift_retain();
  sub_20CA82318();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)keyBoardWillHideWithNotification:(id)a3
{
  uint64_t v3 = sub_20CA81C08();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20CA81BF8();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[15] = 0;
  swift_retain();
  sub_20CA82318();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

@end