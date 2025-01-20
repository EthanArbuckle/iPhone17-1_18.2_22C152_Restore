@interface ICLinkTextAttachment(UI)
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICLinkTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end