@interface ICCalculateGraphExpressionTextAttachment(UI)
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICCalculateGraphExpressionTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end