@interface TUITextCompositionClientWrapper
+ (BOOL)isGMAvailableForMailReply;
+ (BOOL)isGMAvailableForMailReplyLongFormBasic;
+ (BOOL)isGMAvailableForMessagesReply;
+ (BOOL)isGMAvailableWithUseCase:(id)a3;
- (_TtC11TextInputUI31TUITextCompositionClientWrapper)init;
- (unint64_t)generateRequestToken;
- (void)cancelRequestWithToken:(unint64_t)a3;
- (void)requestSmartRepliesWithInputContextHistory:(id)a3 shortForm:(BOOL)a4 clientID:(id)a5 threadIdentifier:(id)a6 candidateString:(id)a7 options:(id)a8 completion:(id)aBlock;
@end

@implementation TUITextCompositionClientWrapper

- (_TtC11TextInputUI31TUITextCompositionClientWrapper)init
{
  id v3 = objc_allocWithZone((Class)sub_18D50B108());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC11TextInputUI31TUITextCompositionClientWrapper_textCompositionClient) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TUITextCompositionClientWrapper();
  return [(TUITextCompositionClientWrapper *)&v7 init];
}

- (unint64_t)generateRequestToken
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4FAE1E0]);
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  id v6 = objc_msgSend(v5, sel_nextToken);

  return (unint64_t)v6;
}

+ (BOOL)isGMAvailableWithUseCase:(id)a3
{
  uint64_t v3 = sub_18D50B3C8();
  char v5 = _s11TextInputUI31TUITextCompositionClientWrapperC13isGMAvailable7useCaseSbSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (BOOL)isGMAvailableForMessagesReply
{
  return sub_18D486130((uint64_t)a1, (uint64_t)a2, 0xD00000000000001DLL, 0x800000018D5163D0);
}

+ (BOOL)isGMAvailableForMailReply
{
  return sub_18D486130((uint64_t)a1, (uint64_t)a2, 0xD000000000000019, 0x800000018D5163F0);
}

+ (BOOL)isGMAvailableForMailReplyLongFormBasic
{
  return sub_18D486130((uint64_t)a1, (uint64_t)a2, 0xD000000000000026, 0x800000018D516410);
}

- (void)requestSmartRepliesWithInputContextHistory:(id)a3 shortForm:(BOOL)a4 clientID:(id)a5 threadIdentifier:(id)a6 candidateString:(id)a7 options:(id)a8 completion:(id)aBlock
{
  BOOL v25 = a4;
  v11 = _Block_copy(aBlock);
  uint64_t v24 = sub_18D50B3C8();
  uint64_t v13 = v12;
  uint64_t v14 = sub_18D50B3C8();
  uint64_t v16 = v15;
  uint64_t v17 = sub_18D50B3C8();
  uint64_t v19 = v18;
  uint64_t v20 = sub_18D50B378();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v11;
  id v22 = a3;
  v23 = self;
  TUITextCompositionClientWrapper.requestSmartReplies(inputContextHistory:shortForm:clientID:threadIdentifier:candidateString:options:completion:)(v22, v25, v24, v13, v14, v16, v17, v19, v20, (uint64_t)sub_18D488BD0, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)cancelRequestWithToken:(unint64_t)a3
{
  uint64_t v4 = self;
  TUITextCompositionClientWrapper.cancelRequest(token:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11TextInputUI31TUITextCompositionClientWrapper_textCompositionClient));
}

@end