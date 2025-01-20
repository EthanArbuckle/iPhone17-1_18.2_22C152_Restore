@interface ICUnsupportedTextAttachmentWithFallbackPDF(UI)
- (id)attachmentSizeForTextContainer:()UI;
- (id)attachmentViewClassForTextContainer:()UI;
- (uint64_t)effectiveAttachmentViewSizeForTextContainer:()UI;
@end

@implementation ICUnsupportedTextAttachmentWithFallbackPDF(UI)

- (id)attachmentSizeForTextContainer:()UI
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_26C1D19E0;
  return objc_msgSendSuper2(&v2, sel_attachmentSizeForTextContainer_);
}

- (uint64_t)effectiveAttachmentViewSizeForTextContainer:()UI
{
  objc_super v2 = [a1 attachment];
  int v3 = [v2 preferredViewSize];

  if (v3 != 1)
  {
    v4 = [a1 attachment];
    if (![v4 hasFallbackPDF]) {
      LOWORD(v3) = 1;
    }
  }
  return (__int16)v3;
}

- (id)attachmentViewClassForTextContainer:()UI
{
  objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:");
  id v1 = (id)objc_opt_class();

  return v1;
}

@end