@interface UIFontDescriptor(TelephonyUI)
+ (uint64_t)telephonyUIBodyShortEmphasizedFontDescriptor;
+ (uint64_t)telephonyUIBodyShortFontDescriptor;
+ (uint64_t)telephonyUIBodyShortItalicFontDescriptor;
+ (uint64_t)telephonyUIFootnoteShortFontDescriptor;
+ (uint64_t)telephonyUIPreferredFontDescriptorWithTextStyle:()TelephonyUI addingSymbolicTraits:;
+ (uint64_t)telephonyUISubheadlineShortEmphasizedFontDescriptor;
+ (uint64_t)telephonyUISubheadlineShortFontDescriptor;
+ (uint64_t)telephonyUISubheadlineShortSemiboldFontDescriptor;
@end

@implementation UIFontDescriptor(TelephonyUI)

+ (uint64_t)telephonyUISubheadlineShortEmphasizedFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:32770];
}

+ (uint64_t)telephonyUISubheadlineShortSemiboldFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000];
}

+ (uint64_t)telephonyUIPreferredFontDescriptorWithTextStyle:()TelephonyUI addingSymbolicTraits:
{
  return [a1 preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:0];
}

+ (uint64_t)telephonyUIBodyShortFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000];
}

+ (uint64_t)telephonyUISubheadlineShortFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000];
}

+ (uint64_t)telephonyUIBodyShortEmphasizedFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:32770];
}

+ (uint64_t)telephonyUIBodyShortItalicFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:32769];
}

+ (uint64_t)telephonyUIFootnoteShortFontDescriptor
{
  return [a1 telephonyUIPreferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:0x8000];
}

@end