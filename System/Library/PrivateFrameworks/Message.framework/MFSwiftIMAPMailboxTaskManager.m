@interface MFSwiftIMAPMailboxTaskManager
- (BOOL)canFetchMessageIDs;
- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5;
- (BOOL)fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6;
- (MFMailMessageLibrary)library;
- (MFSwiftIMAPMailboxTaskManager)init;
- (MFSwiftIMAPMailboxTaskManager)initWithMailbox:(id)a3 taskManager:(id)a4;
- (id)downloadSearchResults:(id)a3;
- (id)fetchDataForMessage:(id)a3 didDownload:(BOOL *)a4;
- (id)fetchDataForMessage:(id)a3 partial:(BOOL *)a4;
- (id)fetchHeadersForMessage:(id)a3;
- (id)messageIdRollCall:(id)a3;
- (id)replayAction:(id)a3;
- (id)searchWithCriterion:(id)a3 limit:(unsigned int)a4;
- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4;
- (int64_t)fetchNumMessages:(int64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5;
- (void)close;
- (void)compact;
- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4;
- (void)growFetchWindow;
- (void)handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5;
- (void)reselectMailbox;
- (void)setLibrary:(id)a3;
- (void)updateServerUnreadCountClosingConnection:(BOOL)a3;
@end

@implementation MFSwiftIMAPMailboxTaskManager

- (MFMailMessageLibrary)library
{
  v2 = self;
  id v5 = sub_1A81511A4();

  return (MFMailMessageLibrary *)v5;
}

- (void)setLibrary:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A815125C(a3);
}

- (MFSwiftIMAPMailboxTaskManager)initWithMailbox:(id)a3 taskManager:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (MFSwiftIMAPMailboxTaskManager *)sub_1A8151320(a3, a4);
}

- (MFSwiftIMAPMailboxTaskManager)init
{
  return (MFSwiftIMAPMailboxTaskManager *)sub_1A815148C();
}

- (void).cxx_destruct
{
}

- (BOOL)canFetchMessageIDs
{
  v2 = self;
  sub_1A81516C8();

  return sub_1A8A74E98() & 1;
}

- (void)close
{
  v2 = self;
  sub_1A81516E4();
}

- (void)compact
{
  v2 = self;
  sub_1A81516E4();
}

- (void)growFetchWindow
{
  v2 = self;
  sub_1A81516E4();
}

- (void)reselectMailbox
{
  v2 = self;
  sub_1A81516E4();
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_1A8A76F28();
  int64_t v10 = sub_1A81517F8();
  swift_bridgeObjectRelease();

  return v10;
}

- (int64_t)fetchNumMessages:(int64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  id v6 = a4;
  v7 = self;
  sub_1A8A76558();
  int64_t v11 = sub_1A81518AC();
  swift_bridgeObjectRelease();

  return v11;
}

- (id)fetchDataForMessage:(id)a3 partial:(BOOL *)a4
{
  id v5 = a3;
  id v6 = self;
  uint64_t v13 = sub_1A8151978(a3, a4);
  unint64_t v15 = v7;

  if ((v15 & 0xF000000000000000) == 0xF000000000000000)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_1A8A74A48();
    sub_1A80F42A8(v13, v15);
    id v10 = (id)v9;
  }
  return v10;
}

- (id)fetchHeadersForMessage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v11 = sub_1A8151BBC(a3);
  unint64_t v13 = v6;

  if ((v13 & 0xF000000000000000) == 0xF000000000000000)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1A8A74A48();
    sub_1A80F42A8(v11, v13);
    id v9 = (id)v8;
  }
  return v9;
}

- (BOOL)fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  id v9 = self;
  sub_1A8152088(a3, a4.location, a4.length, (uint64_t)a5, a6);

  return sub_1A8A74E98() & 1;
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v12 = _Block_copy(a5);
  id v8 = self;
  uint64_t v13 = sub_1A8A76558();
  uint64_t v15 = v9;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  sub_1A81527D0(v13, v15, a4, (uint64_t)sub_1A81529A0, v14);
  swift_release();
  swift_bridgeObjectRelease();

  return sub_1A8A74E98() & 1;
}

- (id)fetchDataForMessage:(id)a3 didDownload:(BOOL *)a4
{
  id v5 = a3;
  id v6 = self;
  uint64_t v13 = sub_1A8152DDC(a3, a4);
  unint64_t v15 = v7;

  if ((v15 & 0xF000000000000000) == 0xF000000000000000)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_1A8A74A48();
    sub_1A80F42A8(v13, v15);
    id v10 = (id)v9;
  }
  return v10;
}

- (id)searchWithCriterion:(id)a3 limit:(unsigned int)a4
{
  id v5 = a3;
  id v6 = self;
  id v10 = sub_1A8153014(a3);

  return v10;
}

- (id)downloadSearchResults:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v9 = sub_1A81531E8(a3);

  return v9;
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  id v4 = self;
  sub_1A8A74EA8();
  sub_1A815352C();
}

- (void)handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = self;
  sub_1A8152A00();
  sub_1A8A76C68();
  sub_1A8A76018();
  sub_1A8A76018();
  sub_1A81535B8();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateServerUnreadCountClosingConnection:(BOOL)a3
{
  v3 = self;
  sub_1A8A74EA8();
  sub_1A81536F0();
}

- (id)replayAction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v9 = (id)sub_1A8153768();

  return v9;
}

- (id)messageIdRollCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A8A76F28();
  sub_1A815383C();
  swift_bridgeObjectRelease();

  id v9 = (void *)sub_1A8A76F18();
  swift_bridgeObjectRelease();
  return v9;
}

@end