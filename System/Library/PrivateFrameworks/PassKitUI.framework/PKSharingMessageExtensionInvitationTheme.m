@interface PKSharingMessageExtensionInvitationTheme
+ (id)captionTextColor;
+ (id)carKeyImageBackgroundColor;
+ (id)messageBubbleBackgroundColor;
+ (id)messageDefaultFont;
+ (id)messageTitleFont;
+ (id)primaryTextColor;
+ (id)subcaptionTextColor;
@end

@implementation PKSharingMessageExtensionInvitationTheme

+ (id)primaryTextColor
{
  return (id)[MEMORY[0x1E4FB1618] systemWhiteColor];
}

+ (id)captionTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

+ (id)subcaptionTextColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (id)carKeyImageBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.603921569 green:0.603921569 blue:0.658823529 alpha:1.0];
}

+ (id)messageBubbleBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
}

+ (id)messageTitleFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], (NSString *)*MEMORY[0x1E4FB2790], *MEMORY[0x1E4FB09E0]);
}

+ (id)messageDefaultFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

@end