@interface ICHashtagTextAttachment(UI)
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICHashtagTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end