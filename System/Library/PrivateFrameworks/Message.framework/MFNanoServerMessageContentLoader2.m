@interface MFNanoServerMessageContentLoader2
- (BOOL)highPriority;
- (MFNanoServerMessageContentLoader2)init;
- (MFNanoServerMessageContentLoader2)initWithMessageId:(id)a3 highPriority:(BOOL)a4 mailMessageLibrary:(id)a5 maximumImageWidth:(double)a6 workQueue:(id)a7 delegate:(id)a8;
- (NSString)messageId;
- (void)cancel;
- (void)setHighPriority:(BOOL)a3;
- (void)start;
@end

@implementation MFNanoServerMessageContentLoader2

- (void).cxx_destruct
{
}

- (NSString)messageId
{
  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.messageId.getter();

  id v6 = (id)sub_1A8A76538();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)highPriority
{
  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.highPriority.getter();

  return sub_1A8A74E98() & 1;
}

- (void)setHighPriority:(BOOL)a3
{
  swift_getObjectType();
  v4 = self;
  char v5 = sub_1A8A74EA8();
  MFNanoServerMessageContentLoader2.highPriority.setter(v5 & 1);
}

- (MFNanoServerMessageContentLoader2)initWithMessageId:(id)a3 highPriority:(BOOL)a4 mailMessageLibrary:(id)a5 maximumImageWidth:(double)a6 workQueue:(id)a7 delegate:(id)a8
{
  swift_getObjectType();
  id v8 = a3;
  id v9 = a5;
  id v10 = a7;
  swift_unknownObjectRetain();
  uint64_t v19 = sub_1A8A76558();
  uint64_t v14 = v11;
  char v12 = sub_1A8A74EA8();
  v21 = sub_1A8356048(v19, v14, v12 & 1, a5, a7, (uint64_t)a8, a6);

  return (MFNanoServerMessageContentLoader2 *)v21;
}

- (void)start
{
  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.start()();
}

- (void)cancel
{
  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.cancel()();
}

- (MFNanoServerMessageContentLoader2)init
{
  return (MFNanoServerMessageContentLoader2 *)MFNanoServerMessageContentLoader2.init()();
}

@end