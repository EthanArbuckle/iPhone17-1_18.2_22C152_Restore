@interface ICAttachmentModel(TextFinding)
- (uint64_t)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:;
@end

@implementation ICAttachmentModel(TextFinding)

- (uint64_t)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  uint64_t result = a9;
  if (a9) {
    return (*(uint64_t (**)(void))(a9 + 16))();
  }
  return result;
}

@end