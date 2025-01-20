@interface IMMessagesBlastDoorInterfaceInternal
+ (BOOL)supportsFeature:(id)a3;
- (IMMessagesBlastDoorInterfaceInternal)init;
- (IMMessagesBlastDoorInterfaceInternal)initWithBlastDoorInstanceType:(id)a3;
- (id)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
- (id)defuseChatBotCSS:(id)a3 error:(id *)a4;
- (id)defuseLiteTextMessage:(id)a3 error:(id *)a4;
- (id)defuseRelayGroupMutationPayloadForData:(id)a3 error:(id *)a4;
- (id)defuseRelayReachabilityRequestPayloadForData:(id)a3 error:(id *)a4;
- (id)defuseRelayReachabilityResponsePayloadForData:(id)a3 error:(id *)a4;
- (id)defuseSMSDictionary:(id)a3 error:(id *)a4;
- (id)defuseSatelliteSMSTextMessageDictionary:(id)a3 error:(id *)a4;
- (id)defuseTopLevelDictionary:(id)a3 error:(id *)a4;
- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6;
- (id)generatePreviewforAttachmentWithfileURL:(id)a3 error:(id *)a4;
- (void)decontaminateTopLevelDictionary:(id)a3 resultHandler:(id)a4;
- (void)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 resultHandler:(id)a5;
- (void)defuseCollaborationClearNoticePayload:(id)a3 resultHandler:(id)a4;
- (void)defuseCollaborationNoticeActionDictionary:(id)a3 resultHandler:(id)a4;
- (void)defuseCollaborationNoticePayload:(id)a3 resultHandler:(id)a4;
- (void)defuseData:(id)a3 forPreviewType:(unsigned __int8)a4 resultHandler:(id)a5;
- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 resultHandler:(id)a6;
- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 processImageFields:(BOOL)a9 resultHandler:(id)aBlock;
- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 resultHandler:(id)aBlock;
- (void)defuseSMSDictionary:(id)a3 resultHandler:(id)a4;
- (void)defuseTopLevelDictionary:(id)a3 resultHandler:(id)a4;
- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10;
- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 frameInterval:(int64_t)a7 resultHandler:(id)a8;
- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7;
- (void)generatePreviewForEmojiImageWithFileURL:(id)a3 frameIndex:(int64_t)a4 maxPixelDimension:(float)a5 resultHandler:(id)a6;
- (void)generatePreviewForMultiFrameImageWithFileURL:(id)a3 destinationFileURL:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 maxFrameCount:(int64_t)a7 isSticker:(BOOL)a8 resultHandler:(id)a9;
- (void)generatePreviewforAnimatedImageWithfileURL:(id)a3 maxPixelDimension:(float)a4 index:(int64_t)a5 maxCount:(int64_t)a6 resultHandler:(id)a7;
- (void)generatePreviewforAttachmentWithfileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6;
- (void)generatePreviewforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generatePreviewforAudioMessageWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generateWorkoutPreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6;
- (void)getMetadataForEmojiImageWithFileURL:(id)a3 maxStrikeCount:(int64_t)a4 resultHandler:(id)a5;
- (void)getMetadataforAnimatedImageWithfileURL:(id)a3 maxCount:(int64_t)a4 resultHandler:(id)a5;
@end

@implementation IMMessagesBlastDoorInterfaceInternal

- (IMMessagesBlastDoorInterfaceInternal)initWithBlastDoorInstanceType:(id)a3
{
  id v3 = a3;
  v4 = (IMMessagesBlastDoorInterfaceInternal *)sub_1C51A3DCC(v3);

  return v4;
}

- (id)defuseTopLevelDictionary:(id)a3 error:(id *)a4
{
  return sub_1C51A1DF0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, sub_1C518D678);
}

- (void)defuseTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
}

- (void)decontaminateTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
}

- (id)defuseSMSDictionary:(id)a3 error:(id *)a4
{
  return sub_1C51A1DF0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1C51915BC);
}

- (void)defuseSMSDictionary:(id)a3 resultHandler:(id)a4
{
}

- (id)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = sub_1C51C5998();
  unint64_t v12 = v11;

  uint64_t v13 = sub_1C51C65B8();
  uint64_t v15 = v14;

  v16 = (void *)sub_1C5191BC4(v10, v12, v13, v15);
  swift_bridgeObjectRelease();

  sub_1C518D144(v10, v12);

  return v16;
}

- (void)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 resultHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v17 = self;
  uint64_t v11 = sub_1C51C5998();
  unint64_t v13 = v12;

  uint64_t v14 = sub_1C51C65B8();
  uint64_t v16 = v15;

  _Block_copy(v8);
  sub_1C51A6980(v11, v13, v14, v16, (uint64_t)v17, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  sub_1C518D144(v11, v13);
}

- (void)defuseData:(id)a3 forPreviewType:(unsigned __int8)a4 resultHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  unint64_t v13 = self;
  uint64_t v10 = sub_1C51C5998();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_1C51A6C74(v10, v12, a4, (uint64_t)v13, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_1C518D144(v10, v12);
}

+ (BOOL)supportsFeature:(id)a3
{
  uint64_t v3 = sub_1C51C65B8();
  char v5 = sub_1C51A70AC(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6 = sub_1C51C5928();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_1C51C58F8();
  _Block_copy(v10);
  unint64_t v11 = self;
  sub_1C51A88A0((uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6 = sub_1C51C5928();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_1C51C58F8();
  _Block_copy(v10);
  unint64_t v11 = self;
  sub_1C51A8DF0((uint64_t)v9, 1, (char *)v11, (void (*)(char *, uint64_t))v10, 0.0, 0.0);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)generatePreviewforAttachmentWithfileURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1C51C5928();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C58F8();
  id v9 = self;
  uint64_t v10 = (void *)sub_1C5193134((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v9 = sub_1C51C5928();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C58F8();
  unint64_t v13 = self;
  uint64_t v14 = (void *)sub_1C5195C38((uint64_t)v12, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v14;
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  uint64_t v10 = sub_1C51C5928();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_1C51C58F8();
  _Block_copy(v14);
  uint64_t v15 = self;
  sub_1C51A8DF0((uint64_t)v13, 0, (char *)v15, (void (*)(char *, uint64_t))v14, a4, a5);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  uint64_t v10 = sub_1C51C5928();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a7);
  sub_1C51C58F8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = self;
  sub_1C519ACF8(a4, (uint64_t)v13, (uint64_t)sub_1C51AD348, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 frameInterval:(int64_t)a7 resultHandler:(id)a8
{
  uint64_t v12 = sub_1C51C5928();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a8);
  sub_1C51C58F8();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  v18 = self;
  sub_1C519B3F8(a4, (uint64_t)v15, a7, (uint64_t)sub_1C51AD5D4, v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  uint64_t v22 = a8;
  HIDWORD(v21) = a7;
  uint64_t v14 = sub_1C51C5928();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a10);
  sub_1C51C58F8();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  v20 = self;
  sub_1C519B9C0((uint64_t)v17, a4, a5, a6, SHIDWORD(v21), v22, a9, (uint64_t)sub_1C51ACB38, v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)generateWorkoutPreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  uint64_t v9 = sub_1C51C5928();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  sub_1C51C58F8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  uint64_t v15 = self;
  sub_1C519C174(a4, (uint64_t)v12, (uint64_t)sub_1C51AD348, v14);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)generatePreviewforAudioMessageWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6 = sub_1C51C5928();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_1C51C58F8();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = self;
  sub_1C519C5D4((uint64_t)v9, (uint64_t)sub_1C51AD348, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 resultHandler:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_1C51C6568();
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  uint64_t v14 = sub_1C51C5998();
  unint64_t v16 = v15;

  uint64_t v17 = sub_1C51C65B8();
  uint64_t v19 = v18;

  _Block_copy(v9);
  sub_1C51AC214(v10, v14, v16, v17, v19, 0, 0xF000000000000000, 0, 0xF000000000000000, 0, 0xF000000000000000, 1u, (uint64_t)v13, (void (**)(void, void, void))v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();
  sub_1C518D144(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 resultHandler:(id)aBlock
{
  unint64_t v15 = _Block_copy(aBlock);
  uint64_t v39 = sub_1C51C6568();
  id v16 = a4;
  id v17 = a5;
  v38 = self;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v21 = sub_1C51C5998();
  unint64_t v36 = v22;
  uint64_t v37 = v21;

  uint64_t v23 = sub_1C51C65B8();
  uint64_t v35 = v24;

  if (v18)
  {
    uint64_t v25 = sub_1C51C5998();
    unint64_t v33 = v26;
    uint64_t v34 = v25;

    if (v19) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v32 = 0;
    unint64_t v28 = 0xF000000000000000;
    if (v20) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v33 = 0xF000000000000000;
  uint64_t v34 = 0;
  if (!v19) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v32 = sub_1C51C5998();
  unint64_t v28 = v27;

  if (v20)
  {
LABEL_4:
    uint64_t v29 = sub_1C51C5998();
    unint64_t v31 = v30;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v29 = 0;
  unint64_t v31 = 0xF000000000000000;
LABEL_8:
  _Block_copy(v15);
  sub_1C51AC214(v39, v37, v36, v23, v35, v34, v33, v32, v28, v29, v31, 1u, (uint64_t)v38, (void (**)(void, void, void))v15);
  _Block_release(v15);
  _Block_release(v15);
  sub_1C51ACB08(v29, v31);
  sub_1C51ACB08(v32, v28);
  sub_1C51ACB08(v34, v33);
  swift_bridgeObjectRelease();
  sub_1C518D144(v37, v36);

  swift_bridgeObjectRelease();
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 processImageFields:(BOOL)a9 resultHandler:(id)aBlock
{
  id v16 = _Block_copy(aBlock);
  uint64_t v42 = sub_1C51C6568();
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = v18;
  v41 = self;
  id v21 = a6;
  id v22 = a7;
  id v23 = v19;
  uint64_t v24 = sub_1C51C5998();
  unint64_t v39 = v25;
  uint64_t v40 = v24;

  uint64_t v35 = sub_1C51C65B8();
  uint64_t v38 = v26;

  if (v21)
  {
    uint64_t v27 = sub_1C51C5998();
    unint64_t v36 = v28;
    uint64_t v37 = v27;

    if (v22) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v34 = 0;
    unint64_t v30 = 0xF000000000000000;
    if (v23) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v36 = 0xF000000000000000;
  uint64_t v37 = 0;
  if (!v22) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v34 = sub_1C51C5998();
  unint64_t v30 = v29;

  if (v23)
  {
LABEL_4:
    uint64_t v31 = sub_1C51C5998();
    unint64_t v33 = v32;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v31 = 0;
  unint64_t v33 = 0xF000000000000000;
LABEL_8:
  _Block_copy(v16);
  sub_1C51AC214(v42, v40, v39, v35, v38, v37, v36, v34, v30, v31, v33, a9, (uint64_t)v41, (void (**)(void, void, void))v16);
  _Block_release(v16);
  _Block_release(v16);
  sub_1C51ACB08(v31, v33);
  sub_1C51ACB08(v34, v30);
  sub_1C51ACB08(v37, v36);
  swift_bridgeObjectRelease();
  sub_1C518D144(v40, v39);

  swift_bridgeObjectRelease();
}

- (void)getMetadataForEmojiImageWithFileURL:(id)a3 maxStrikeCount:(int64_t)a4 resultHandler:(id)a5
{
}

- (void)generatePreviewForEmojiImageWithFileURL:(id)a3 frameIndex:(int64_t)a4 maxPixelDimension:(float)a5 resultHandler:(id)a6
{
  uint64_t v10 = sub_1C51C5928();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  sub_1C51C58F8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = self;
  sub_1C519DB08(a5, (uint64_t)v13, a4, (uint64_t)sub_1C51AD348, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generatePreviewForMultiFrameImageWithFileURL:(id)a3 destinationFileURL:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 maxFrameCount:(int64_t)a7 isSticker:(BOOL)a8 resultHandler:(id)a9
{
  BOOL v10 = a8;
  uint64_t v15 = sub_1C51C5928();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  id v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  id v21 = (char *)&v26 - v20;
  id v22 = _Block_copy(a9);
  sub_1C51C58F8();
  sub_1C51C58F8();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v22;
  uint64_t v24 = self;
  sub_1C519DF7C((uint64_t)v21, (unint64_t)v19, a7, v10, (uint64_t)sub_1C51A8898, v23, a5, a6);

  swift_release();
  unint64_t v25 = *(void (**)(char *, uint64_t))(v16 + 8);
  v25(v19, v15);
  v25(v21, v15);
}

- (void)getMetadataforAnimatedImageWithfileURL:(id)a3 maxCount:(int64_t)a4 resultHandler:(id)a5
{
}

- (void)generatePreviewforAnimatedImageWithfileURL:(id)a3 maxPixelDimension:(float)a4 index:(int64_t)a5 maxCount:(int64_t)a6 resultHandler:(id)a7
{
  uint64_t v12 = sub_1C51C5928();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  sub_1C51C58F8();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = self;
  sub_1C51A03E8(a4, (uint64_t)v15, a5, a6, (uint64_t)sub_1C51AD348, v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)defuseCollaborationNoticePayload:(id)a3 resultHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v13 = self;
  uint64_t v8 = sub_1C51C5998();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_1C51C6168();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1C51AD348;
  *(void *)(v12 + 24) = v11;
  sub_1C51AD25C(&qword_1EA3D13A8, MEMORY[0x1E4F50888]);
  swift_retain();
  sub_1C51C5C08();
  swift_release();
  swift_release();
  sub_1C518D144(v8, v10);
}

- (void)defuseCollaborationNoticeActionDictionary:(id)a3 resultHandler:(id)a4
{
}

- (void)defuseCollaborationClearNoticePayload:(id)a3 resultHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v13 = self;
  uint64_t v8 = sub_1C51C5998();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_1C51C6228();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1C51AD348;
  *(void *)(v12 + 24) = v11;
  sub_1C51AD25C(&qword_1EA3D13B8, MEMORY[0x1E4F50948]);
  swift_retain();
  sub_1C51C5C08();
  swift_release();
  swift_release();
  sub_1C518D144(v8, v10);
}

- (id)defuseLiteTextMessage:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C51C5FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = sub_1C51C5998();
  unint64_t v14 = v13;

  sub_1C51AD25C((unint64_t *)&qword_1EA3D13C8, MEMORY[0x1E4F50770]);
  sub_1C51C5C18();
  uint64_t v15 = (void *)sub_1C51C5FB8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C518D144(v12, v14);

  return v15;
}

- (id)defuseSatelliteSMSTextMessageDictionary:(id)a3 error:(id *)a4
{
  return sub_1C51A1DF0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1C51A1AE4);
}

- (id)defuseChatBotCSS:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1C51C5928();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C58F8();
  unint64_t v9 = self;
  uint64_t v10 = sub_1C51A2028((uint64_t)v8);
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  unint64_t v13 = (void *)sub_1C51C5988();
  sub_1C518D144(v10, v12);

  return v13;
}

- (id)defuseRelayGroupMutationPayloadForData:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C51C6318();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  unint64_t v11 = self;
  uint64_t v12 = sub_1C51C5998();
  unint64_t v14 = v13;

  sub_1C51AD25C(&qword_1EA3D13E8, MEMORY[0x1E4F509B0]);
  sub_1C51C5C18();
  uint64_t v15 = (void *)sub_1C51C62F8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C518D144(v12, v14);

  return v15;
}

- (id)defuseRelayReachabilityRequestPayloadForData:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C51C6288();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  unint64_t v11 = self;
  uint64_t v12 = sub_1C51C5998();
  unint64_t v14 = v13;

  sub_1C51AD25C(&qword_1EA3D13F0, MEMORY[0x1E4F50970]);
  sub_1C51C5C18();
  uint64_t v15 = (void *)sub_1C51C6278();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C518D144(v12, v14);

  return v15;
}

- (id)defuseRelayReachabilityResponsePayloadForData:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C51C6338();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  unint64_t v11 = self;
  uint64_t v12 = sub_1C51C5998();
  unint64_t v14 = v13;

  sub_1C51AD25C(&qword_1EA3D13F8, MEMORY[0x1E4F509C0]);
  sub_1C51C5C18();
  uint64_t v15 = (void *)sub_1C51C6328();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C518D144(v12, v14);

  return v15;
}

- (IMMessagesBlastDoorInterfaceInternal)init
{
  result = (IMMessagesBlastDoorInterfaceInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_type);
}

@end