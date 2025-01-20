@interface ICMentionTextAttachment(UI)
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICMentionTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end