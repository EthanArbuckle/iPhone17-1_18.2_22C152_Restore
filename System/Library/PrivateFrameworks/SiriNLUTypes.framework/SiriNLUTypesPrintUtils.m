@interface SiriNLUTypesPrintUtils
+ (id)printableEntityCandidateWithEntityCandidate:(id)a3;
+ (id)printableRequestWithRequest:(id)a3;
+ (id)printableResponseWithResponse:(id)a3;
+ (id)printableSpanMatchResponseWithSpanMatchResponse:(id)a3;
+ (id)printableSpanMatchResponseWithSpanMatchResponse:(id)a3 withUSOGraph:(BOOL)a4;
+ (id)printableSystemDialogActGroupWithSystemDialogActGroup:(id)a3;
+ (id)printableSystemDialogActWithSystemDialogAct:(id)a3;
+ (id)printableTaskWithTask:(id)a3;
+ (id)printableUserParseWithUserParse:(id)a3;
- (_TtC12SiriNLUTypes22SiriNLUTypesPrintUtils)init;
@end

@implementation SiriNLUTypesPrintUtils

+ (id)printableSpanMatchResponseWithSpanMatchResponse:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableSpanMatchResponse(spanMatchResponse:));
}

+ (id)printableSpanMatchResponseWithSpanMatchResponse:(id)a3 withUSOGraph:(BOOL)a4
{
  id v5 = a3;
  static SiriNLUTypesPrintUtils.printableSpanMatchResponse(spanMatchResponse:withUSOGraph:)((uint64_t)v5, a4);

  v6 = (void *)sub_1C8C12498();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)printableResponseWithResponse:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableResponse(response:));
}

+ (id)printableRequestWithRequest:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableRequest(request:));
}

+ (id)printableTaskWithTask:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableTask(task:));
}

+ (id)printableEntityCandidateWithEntityCandidate:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableEntityCandidate(entityCandidate:));
}

+ (id)printableSystemDialogActGroupWithSystemDialogActGroup:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableSystemDialogActGroup(systemDialogActGroup:));
}

+ (id)printableSystemDialogActWithSystemDialogAct:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableSystemDialogAct(systemDialogAct:));
}

+ (id)printableUserParseWithUserParse:(id)a3
{
  return sub_1C8A74448((uint64_t)a1, (uint64_t)a2, a3, static SiriNLUTypesPrintUtils.printableUserParse(userParse:));
}

- (_TtC12SiriNLUTypes22SiriNLUTypesPrintUtils)init
{
  return (_TtC12SiriNLUTypes22SiriNLUTypesPrintUtils *)SiriNLUTypesPrintUtils.init()();
}

@end