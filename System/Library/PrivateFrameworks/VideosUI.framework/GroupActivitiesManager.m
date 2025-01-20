@interface GroupActivitiesManager
- (BOOL)handleCommerceSharedWatchUrl:(id)a3;
- (BOOL)isEligibleForSession;
- (BOOL)isSessionActive;
- (BOOL)isSharedWatchIdValidForCurrentSession:(id)a3;
- (_TtC8VideosUI22GroupActivitiesManager)init;
- (id)itemProviderForActivityWithAdamId:(id)a3 previewMetadata:(id)a4 existingItemProvider:(id)a5;
- (id)itemProviderForActivityWithSharedWatchId:(id)a3 sharedWatchUrl:(id)a4 previewMetadata:(id)a5 existingItemProvider:(id)a6;
- (void)endSessionWithReason:(unint64_t)a3;
- (void)handleSharedPlayable:(VUIVideosPlayable *)a3 watchTogetherUrl:(NSURL *)a4 startupAction:(int64_t)a5 previewMetadata:(VUIGroupWatchActivityPreviewMetadata *)a6 completion:(id)a7;
- (void)leaveSession;
- (void)playerDidStart:(id)a3;
- (void)requestForegroundPresentation;
- (void)requestPermissionToStartCowatchingForPlayable:(id)a3 completion:(id)a4;
- (void)setIsSessionActive:(BOOL)a3;
- (void)startPlaybackFailed;
@end

@implementation GroupActivitiesManager

- (_TtC8VideosUI22GroupActivitiesManager)init
{
  sub_1E2CF22D4();
  return result;
}

- (BOOL)isSessionActive
{
  v2 = self;
  char v3 = sub_1E336B0E4();

  return v3 & 1;
}

- (void)setIsSessionActive:(BOOL)a3
{
  v4 = self;
  sub_1E336B1AC(a3);
}

- (void)requestForegroundPresentation
{
  v2 = self;
  sub_1E336C31C();
}

- (void).cxx_destruct
{
  sub_1E38774B8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v3();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF98020);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v4();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI22GroupActivitiesManager_previousState, &qword_1EADEFB28);
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI22GroupActivitiesManager_modifyingActivityIdentifier, (uint64_t *)&unk_1EBFAC9C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF84090);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v5();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI22GroupActivitiesManager_sharedPlayer);
}

- (BOOL)isEligibleForSession
{
  v2 = self;
  char v3 = sub_1E336F348();

  return v3 & 1;
}

- (BOOL)isSharedWatchIdValidForCurrentSession:(id)a3
{
  if (a3) {
    sub_1E387C928();
  }
  v4 = self;
  OUTLINED_FUNCTION_166();
  sub_1E336F3B0();
  char v6 = v5;

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)itemProviderForActivityWithSharedWatchId:(id)a3 sharedWatchUrl:(id)a4 previewMetadata:(id)a5 existingItemProvider:(id)a6
{
  OUTLINED_FUNCTION_18();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_32();
  sub_1E387C928();
  sub_1E3876088();
  id v13 = v9;
  id v14 = v7;
  id v15 = v11;
  OUTLINED_FUNCTION_177_4();
  sub_1E336F884();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_34_2();
  v16();
  OUTLINED_FUNCTION_11();
  return v17;
}

- (id)itemProviderForActivityWithAdamId:(id)a3 previewMetadata:(id)a4 existingItemProvider:(id)a5
{
  OUTLINED_FUNCTION_44_7();
  char v6 = v5;
  v8 = v7;
  v10 = v9;
  sub_1E387C928();
  uint64_t v12 = v11;
  id v13 = v8;
  id v14 = v6;
  id v15 = v10;
  uint64_t v16 = OUTLINED_FUNCTION_199_0();
  sub_1E336FBF8(v16, v12, v13, v6);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69();
  return v17;
}

- (void)handleSharedPlayable:(VUIVideosPlayable *)a3 watchTogetherUrl:(NSURL *)a4 startupAction:(int64_t)a5 previewMetadata:(VUIGroupWatchActivityPreviewMetadata *)a6 completion:(id)a7
{
  OUTLINED_FUNCTION_44_7();
  v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  id v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = _Block_copy(v17);
  v19 = (void *)swift_allocObject();
  v19[2] = v14;
  v19[3] = v12;
  v19[4] = v10;
  v19[5] = v8;
  v19[6] = v18;
  v19[7] = v16;
  id v20 = v14;
  id v21 = v12;
  id v22 = v8;
  id v23 = v16;
  OUTLINED_FUNCTION_69();
  sub_1E317843C(v24, v25);
}

- (BOOL)handleCommerceSharedWatchUrl:(id)a3
{
  OUTLINED_FUNCTION_128();
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_93_0();
  sub_1E3876088();
  id v5 = v3;
  OUTLINED_FUNCTION_199_0();
  sub_1E3372EB0();
  char v7 = v6;

  OUTLINED_FUNCTION_86_0();
  v8();
  return v7 & 1;
}

- (void)playerDidStart:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char v6 = (void *)OUTLINED_FUNCTION_8_8();
  sub_1E337518C(v6);
}

- (void)requestPermissionToStartCowatchingForPlayable:(id)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1E33753FC(a3, (uint64_t)v8, v6);
  _Block_release(v6);
}

- (void)startPlaybackFailed
{
  v2 = self;
  sub_1E3376394();
}

- (void)leaveSession
{
  v2 = self;
  sub_1E33763FC();
}

- (void)endSessionWithReason:(unint64_t)a3
{
  char v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E336BA54();
}

@end