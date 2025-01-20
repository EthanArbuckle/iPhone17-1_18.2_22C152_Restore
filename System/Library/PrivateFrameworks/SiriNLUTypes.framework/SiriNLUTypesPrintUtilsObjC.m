@interface SiriNLUTypesPrintUtilsObjC
+ (id)printableEntityCandidate:(id)a3;
+ (id)printableRequest:(id)a3;
+ (id)printableResponse:(id)a3;
+ (id)printableSpanMatchResponse:(id)a3;
+ (id)printableSpanMatchResponse:(id)a3 withUSOGraph:(BOOL)a4;
+ (id)printableSystemDialogAct:(id)a3;
+ (id)printableSystemDialogActGroup:(id)a3;
+ (id)printableTask:(id)a3;
+ (id)printableUserParse:(id)a3;
@end

@implementation SiriNLUTypesPrintUtilsObjC

+ (id)printableUserParse:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableUserParseWithUserParse:a3];
}

+ (id)printableSystemDialogAct:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableSystemDialogActWithSystemDialogAct:a3];
}

+ (id)printableSystemDialogActGroup:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableSystemDialogActGroupWithSystemDialogActGroup:a3];
}

+ (id)printableEntityCandidate:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableEntityCandidateWithEntityCandidate:a3];
}

+ (id)printableTask:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableTaskWithTask:a3];
}

+ (id)printableSpanMatchResponse:(id)a3 withUSOGraph:(BOOL)a4
{
  return +[SiriNLUTypesPrintUtils printableSpanMatchResponseWithSpanMatchResponse:a3 withUSOGraph:a4];
}

+ (id)printableSpanMatchResponse:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableSpanMatchResponseWithSpanMatchResponse:a3];
}

+ (id)printableResponse:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableResponseWithResponse:a3];
}

+ (id)printableRequest:(id)a3
{
  return +[SiriNLUTypesPrintUtils printableRequestWithRequest:a3];
}

@end