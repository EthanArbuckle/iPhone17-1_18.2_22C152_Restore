@interface NSMutableAttributedString(PKUIUtilities)
- (void)pk_addLinkURL:()PKUIUtilities toRange:withColor:isUnderlined:;
@end

@implementation NSMutableAttributedString(PKUIUtilities)

- (void)pk_addLinkURL:()PKUIUtilities toRange:withColor:isUnderlined:
{
  id v15 = a3;
  id v12 = a6;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL && a5 && a4 + a5 <= (unint64_t)[a1 length])
  {
    if (v12) {
      objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v12, a4, a5);
    }
    objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], v15, a4, a5);
    uint64_t v13 = *MEMORY[0x1E4FB0808];
    v14 = [NSNumber numberWithBool:a7];
    objc_msgSend(a1, "addAttribute:value:range:", v13, v14, a4, a5);
  }
}

@end