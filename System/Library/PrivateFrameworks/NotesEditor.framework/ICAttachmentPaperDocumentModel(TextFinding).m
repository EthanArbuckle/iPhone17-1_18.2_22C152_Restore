@interface ICAttachmentPaperDocumentModel(TextFinding)
- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:;
@end

@implementation ICAttachmentPaperDocumentModel(TextFinding)

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  id v20 = [a1 attachment];
  LOBYTE(v19) = a8;
  +[ICPDFTextFindingResult resultsInAttachment:v20 matchingString:v18 textView:v17 ignoreCase:a5 wholeWords:a6 startsWith:a7 usePattern:v19 completion:v16];
}

@end