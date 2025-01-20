@interface TUJoinConversationRequest
- (NSData)nph_messagesGroupPhotoData;
- (void)nph_logWithReason:(id)a3 indented:(BOOL)a4;
- (void)setNph_messagesGroupPhotoData:(id)a3;
@end

@implementation TUJoinConversationRequest

- (NSData)nph_messagesGroupPhotoData
{
  return (NSData *)objc_getAssociatedObject(self, "nph_messagesGroupPhotoData");
}

- (void)setNph_messagesGroupPhotoData:(id)a3
{
}

- (void)nph_logWithReason:(id)a3 indented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = &stru_100010A90;
  if (v4) {
    v7 = @"\t";
  }
  v8 = v7;
  v9 = sub_100001854();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138413058;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2112;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@%@ TUJoinConversationRequest %p: %@", (uint8_t *)&v10, 0x2Au);
  }
}

@end