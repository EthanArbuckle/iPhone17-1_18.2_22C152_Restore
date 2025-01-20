@interface ICLockedTextAttachment(UI)
- (double)attachmentSizeForTextContainer:()UI;
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICLockedTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  return 327.0;
}

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end