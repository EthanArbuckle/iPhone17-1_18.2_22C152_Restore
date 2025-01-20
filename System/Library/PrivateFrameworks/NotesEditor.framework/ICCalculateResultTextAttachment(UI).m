@interface ICCalculateResultTextAttachment(UI)
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICCalculateResultTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end