@interface IMMessagesBlastDoorInterface
+ (BOOL)supportsFeature:(id)a3;
- (IMMessagesBlastDoorInterface)init;
- (IMMessagesBlastDoorInterface)initWithBlastDoorInstanceType:(id)a3;
- (IMMessagesBlastDoorInterfaceInternal)interface;
- (id)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
- (id)defuseChatBotCSS:(id)a3 error:(id *)a4;
- (id)defuseLiteTextMessage:(id)a3 error:(id *)a4;
- (id)defuseRelayGroupMutationPayload:(id)a3 error:(id *)a4;
- (id)defuseRelayReachabilityRequestPayload:(id)a3 error:(id *)a4;
- (id)defuseRelayReachabilityResponsePayload:(id)a3 error:(id *)a4;
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
- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 processImageFields:(BOOL)a9 resultHandler:(id)a10;
- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 resultHandler:(id)a9;
- (void)defuseSMSDictionary:(id)a3 resultHandler:(id)a4;
- (void)defuseTopLevelDictionary:(id)a3 resultHandler:(id)a4;
- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10;
- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 frameInterval:(int)a7 resultHandler:(id)a8;
- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7;
- (void)generatePreviewForEmojiImageWithFileURL:(id)a3 frameIndex:(int64_t)a4 maxPixelDimension:(double)a5 resultHandler:(id)a6;
- (void)generatePreviewForMultiFrameImageWithFileURL:(id)a3 destinationFileURL:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 maxFrameCount:(int64_t)a7 isSticker:(BOOL)a8 resultHandler:(id)a9;
- (void)generatePreviewforAnimatedImageWithfileURL:(id)a3 maxPixelDimension:(float)a4 index:(int64_t)a5 maxCount:(int64_t)a6 resultHandler:(id)a7;
- (void)generatePreviewforAttachmentWithfileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6;
- (void)generatePreviewforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generatePreviewforAudioMessageWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generateWorkoutPreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6;
- (void)getMetadataForEmojiImageWithFileURL:(id)a3 maxStrikeCount:(int64_t)a4 resultHandler:(id)a5;
- (void)getMetadataforAnimatedImageWithfileURL:(id)a3 maxCount:(int64_t)a4 resultHandler:(id)a5;
- (void)setInterface:(id)a3;
@end

@implementation IMMessagesBlastDoorInterface

- (IMMessagesBlastDoorInterface)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)IMMessagesBlastDoorInterface;
  v2 = [(IMMessagesBlastDoorInterface *)&v7 init];
  if (v2)
  {
    v3 = [IMMessagesBlastDoorInterfaceInternal alloc];
    uint64_t v4 = [(IMMessagesBlastDoorInterfaceInternal *)v3 initWithBlastDoorInstanceType:*MEMORY[0x1E4F50A40]];
    interface = v2->_interface;
    v2->_interface = (IMMessagesBlastDoorInterfaceInternal *)v4;
  }
  return v2;
}

- (IMMessagesBlastDoorInterface)initWithBlastDoorInstanceType:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMessagesBlastDoorInterface;
  v5 = [(IMMessagesBlastDoorInterface *)&v9 init];
  if (v5)
  {
    v6 = [[IMMessagesBlastDoorInterfaceInternal alloc] initWithBlastDoorInstanceType:v4];
    interface = v5->_interface;
    v5->_interface = v6;
  }
  return v5;
}

+ (BOOL)supportsFeature:(id)a3
{
  return +[IMMessagesBlastDoorInterfaceInternal supportsFeature:a3];
}

- (id)defuseTopLevelDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(IMMessagesBlastDoorInterface *)self interface];
  uint64_t v8 = [v7 defuseTopLevelDictionary:v6 error:a4];

  return v8;
}

- (void)defuseTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IMMessagesBlastDoorInterface *)self interface];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__IMMessagesBlastDoorInterface_defuseTopLevelDictionary_resultHandler___block_invoke;
  v10[3] = &unk_1E650E950;
  id v11 = v6;
  id v9 = v6;
  [v8 defuseTopLevelDictionary:v7 resultHandler:v10];
}

uint64_t __71__IMMessagesBlastDoorInterface_defuseTopLevelDictionary_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)decontaminateTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IMMessagesBlastDoorInterface *)self interface];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__IMMessagesBlastDoorInterface_decontaminateTopLevelDictionary_resultHandler___block_invoke;
  v10[3] = &unk_1E650E950;
  id v11 = v6;
  id v9 = v6;
  [v8 decontaminateTopLevelDictionary:v7 resultHandler:v10];
}

uint64_t __78__IMMessagesBlastDoorInterface_decontaminateTopLevelDictionary_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)defuseSMSDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  uint64_t v8 = [v7 defuseSMSDictionary:v6 error:a4];

  return v8;
}

- (void)defuseSMSDictionary:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 defuseSMSDictionary:v7 resultHandler:v6];
}

- (id)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(IMMessagesBlastDoorInterface *)self interface];
  id v11 = [v10 defuseBalloonPluginPayload:v9 withIdentifier:v8 error:a5];

  return v11;
}

- (void)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IMMessagesBlastDoorInterface *)self interface];
  [v11 defuseBalloonPluginPayload:v10 withIdentifier:v9 resultHandler:v8];
}

- (void)defuseData:(id)a3 forPreviewType:(unsigned __int8)a4 resultHandler:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(IMMessagesBlastDoorInterface *)self interface];
  [v10 defuseData:v9 forPreviewType:v5 resultHandler:v8];
}

- (id)generatePreviewforAttachmentWithfileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 generatePreviewforAttachmentWithfileURL:v6 error:a4];

  return v8;
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 generatePreviewforAttachmentWithfileURL:v7 resultHandler:v6];
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  v14 = [v11 generateImagePreviewForFileURL:v10 maxPixelDimension:a6 scale:v12 error:v13];

  return v14;
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v14 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  [v14 generatePreviewforAttachmentWithfileURL:v11 maxPixelDimension:v10 scale:v12 resultHandler:v13];
}

- (void)generatePreviewForMultiFrameImageWithFileURL:(id)a3 destinationFileURL:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 maxFrameCount:(int64_t)a7 isSticker:(BOOL)a8 resultHandler:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  id v21 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v19 = a5;
  *(float *)&double v20 = a6;
  [v21 generatePreviewForMultiFrameImageWithFileURL:v18 destinationFileURL:v17 maxPixelDimension:a7 scale:v9 maxFrameCount:v16 isSticker:v19 resultHandler:v20];
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v13 = a7;
  id v14 = a3;
  id v17 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a6;
  objc_msgSend(v17, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", v14, v13, v15, width, height, v16);
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 frameInterval:(int)a7 resultHandler:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  id v15 = a8;
  id v16 = a3;
  id v19 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v17 = a4;
  *(float *)&double v18 = a6;
  objc_msgSend(v19, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:frameInterval:resultHandler:", v16, a7, v15, v17, width, height, v18);
}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  BOOL v11 = a7;
  id v17 = a10;
  id v18 = a3;
  id v20 = [(IMMessagesBlastDoorInterface *)self interface];
  LOBYTE(v19) = a9;
  [v20 generateMovieFramesForAttachmentWithFileURL:v18 targetPixelWidth:a4 targetPixelHeight:a5 frameLimit:a6 uniformSampling:v11 framesPerSync:a8 appliesPreferredTrackTransform:v19 resultHandler:v17];
}

- (void)generateWorkoutPreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v14 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  [v14 generateWorkoutPreviewForAttachmentWithFileURL:v11 maxPixelDimension:v10 scale:v12 resultHandler:v13];
}

- (void)generatePreviewforAudioMessageWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 generatePreviewforAudioMessageWithfileURL:v7 resultHandler:v6];
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 resultHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(IMMessagesBlastDoorInterface *)self interface];
  [v14 defuseNicknameDictionary:v13 withKey:v12 recordTag:v11 resultHandler:v10];
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 resultHandler:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(IMMessagesBlastDoorInterface *)self interface];
  [v23 defuseNicknameDictionary:v22 withKey:v21 recordTag:v20 wallpaperDataTag:v19 wallpaperLowResDataTag:v18 wallpaperMetadataTag:v17 resultHandler:v16];
}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 processImageFields:(BOOL)a9 resultHandler:(id)a10
{
  id v17 = a10;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v25 = [(IMMessagesBlastDoorInterface *)self interface];
  LOBYTE(v24) = a9;
  [v25 defuseNicknameDictionary:v23 withKey:v22 recordTag:v21 wallpaperDataTag:v20 wallpaperLowResDataTag:v19 wallpaperMetadataTag:v18 processImageFields:v24 resultHandler:v17];
}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 generateMetadataforAttachmentWithfileURL:v7 resultHandler:v6];
}

- (void)getMetadataForEmojiImageWithFileURL:(id)a3 maxStrikeCount:(int64_t)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(IMMessagesBlastDoorInterface *)self interface];
  [v10 getMetadataForEmojiImageWithFileURL:v9 maxStrikeCount:a4 resultHandler:v8];
}

- (void)generatePreviewForEmojiImageWithFileURL:(id)a3 frameIndex:(int64_t)a4 maxPixelDimension:(double)a5 resultHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v13 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v12 = a5;
  [v13 generatePreviewForEmojiImageWithFileURL:v11 frameIndex:a4 maxPixelDimension:v10 resultHandler:v12];
}

- (void)getMetadataforAnimatedImageWithfileURL:(id)a3 maxCount:(int64_t)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(IMMessagesBlastDoorInterface *)self interface];
  [v10 getMetadataforAnimatedImageWithfileURL:v9 maxCount:a4 resultHandler:v8];
}

- (void)generatePreviewforAnimatedImageWithfileURL:(id)a3 maxPixelDimension:(float)a4 index:(int64_t)a5 maxCount:(int64_t)a6 resultHandler:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v15 = [(IMMessagesBlastDoorInterface *)self interface];
  *(float *)&double v14 = a4;
  [v15 generatePreviewforAnimatedImageWithfileURL:v13 maxPixelDimension:a5 index:a6 maxCount:v12 resultHandler:v14];
}

- (void)defuseCollaborationNoticePayload:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 defuseCollaborationNoticePayload:v7 resultHandler:v6];
}

- (void)defuseCollaborationNoticeActionDictionary:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 defuseCollaborationNoticeActionDictionary:v7 resultHandler:v6];
}

- (void)defuseCollaborationClearNoticePayload:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMessagesBlastDoorInterface *)self interface];
  [v8 defuseCollaborationClearNoticePayload:v7 resultHandler:v6];
}

- (id)defuseLiteTextMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 defuseLiteTextMessage:v6 error:a4];

  return v8;
}

- (id)defuseSatelliteSMSTextMessageDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 defuseSatelliteSMSTextMessageDictionary:v6 error:a4];

  return v8;
}

- (id)defuseChatBotCSS:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 defuseChatBotCSS:v6 error:a4];

  return v8;
}

- (id)defuseRelayGroupMutationPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 defuseRelayGroupMutationPayloadForData:v6 error:a4];

  return v8;
}

- (id)defuseRelayReachabilityRequestPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 defuseRelayReachabilityRequestPayloadForData:v6 error:a4];

  return v8;
}

- (id)defuseRelayReachabilityResponsePayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IMMessagesBlastDoorInterface *)self interface];
  id v8 = [v7 defuseRelayReachabilityResponsePayloadForData:v6 error:a4];

  return v8;
}

- (IMMessagesBlastDoorInterfaceInternal)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end