@interface TUISmartReplyResponse
- (NSError)error;
- (NSNumber)responseFromCache;
- (NSString)modelInfoString;
- (NSString)threadIdentifier;
- (NSString)userFeedbackInputString;
- (TCSmartRepliesResponse)srResponse;
- (_TtC11TextInputUI21TUISmartReplyResponse)init;
- (_TtC11TextInputUI21TUISmartReplyResponse)initWithSrResponse:(id)a3 threadIdentifier:(id)a4 type:(int64_t)a5 contentWarning:(int64_t)a6 error:(id)a7 modelInfoString:(id)a8 userFeedbackInputString:(id)a9 responseFromCache:(id)a10;
- (int64_t)contentWarning;
- (int64_t)type;
- (void)printValues;
- (void)setContentWarning:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setModelInfoString:(id)a3;
- (void)setResponseFromCache:(id)a3;
- (void)setSrResponse:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserFeedbackInputString:(id)a3;
@end

@implementation TUISmartReplyResponse

- (TCSmartRepliesResponse)srResponse
{
  return (TCSmartRepliesResponse *)sub_18D484E40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse);
}

- (void)setSrResponse:(id)a3
{
}

- (NSError)error
{
  return (NSError *)sub_18D484E40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error);
}

- (void)setError:(id)a3
{
}

- (NSString)threadIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18D50B3B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setThreadIdentifier:(id)a3
{
  uint64_t v4 = sub_18D50B3C8();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (int64_t)contentWarning
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning);
  swift_beginAccess();
  return *v2;
}

- (void)setContentWarning:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSString)modelInfoString
{
  return (NSString *)sub_18D484BF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

- (void)setModelInfoString:(id)a3
{
}

- (NSString)userFeedbackInputString
{
  return (NSString *)sub_18D484BF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

- (void)setUserFeedbackInputString:(id)a3
{
}

- (NSNumber)responseFromCache
{
  return (NSNumber *)sub_18D484E40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_responseFromCache);
}

- (void)setResponseFromCache:(id)a3
{
}

- (_TtC11TextInputUI21TUISmartReplyResponse)initWithSrResponse:(id)a3 threadIdentifier:(id)a4 type:(int64_t)a5 contentWarning:(int64_t)a6 error:(id)a7 modelInfoString:(id)a8 userFeedbackInputString:(id)a9 responseFromCache:(id)a10
{
  uint64_t v13 = (uint64_t)a9;
  uint64_t v14 = sub_18D50B3C8();
  uint64_t v27 = v15;
  uint64_t v28 = v14;
  if (!a8)
  {
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    id v19 = a10;
    if (a9) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    goto LABEL_6;
  }
  uint64_t v16 = sub_18D50B3C8();
  uint64_t v18 = v17;
  id v19 = a10;
  if (!a9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_18D50B3C8();
  uint64_t v21 = v20;
LABEL_6:
  id v22 = v19;
  id v23 = a7;
  id v24 = a3;
  v25 = (_TtC11TextInputUI21TUISmartReplyResponse *)sub_18D487EA0(a3, v28, v27, a5, a6, a7, v16, v18, v13, v21, v19);

  return v25;
}

- (void)printValues
{
  v2 = self;
  sub_18D4851A8();
}

- (_TtC11TextInputUI21TUISmartReplyResponse)init
{
  result = (_TtC11TextInputUI21TUISmartReplyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_responseFromCache);
}

@end