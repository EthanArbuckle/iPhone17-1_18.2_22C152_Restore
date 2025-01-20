@interface PKPaymentPreference(PKPaymentPreferenceViewController)
- (uint64_t)supportsInlineEditing;
@end

@implementation PKPaymentPreference(PKPaymentPreferenceViewController)

- (uint64_t)supportsInlineEditing
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v2 = [a1 contactKey];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F1AF10]] ^ 1;

  return v3;
}

@end