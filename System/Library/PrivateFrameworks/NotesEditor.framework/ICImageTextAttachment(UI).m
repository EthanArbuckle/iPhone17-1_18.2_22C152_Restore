@interface ICImageTextAttachment(UI)
- (double)attachmentSizeForTextContainer:()UI;
- (uint64_t)attachmentViewClassForTextContainer:()UI;
@end

@implementation ICImageTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

- (double)attachmentSizeForTextContainer:()UI
{
  id v4 = a3;
  v5 = [a1 attachment];
  [v5 intrinsicContentSize];
  objc_msgSend(a1, "attachmentSizeForImageInTextContainer:intrinsicImageSize:", v4);
  double v7 = v6;

  return v7;
}

@end