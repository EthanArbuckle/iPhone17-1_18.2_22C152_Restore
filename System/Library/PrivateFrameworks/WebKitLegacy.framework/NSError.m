@interface NSError
@end

@implementation NSError

void __46__NSError_WebKitExtras___registerWebKitErrors__block_invoke()
{
  uint64_t v0 = MEMORY[0x1E4E4B3F0]();
  v11 = (void *)MEMORY[0x1E4F1C9E8];
  v12 = (void *)v0;
  CFTypeRef v1 = WebLocalizedStringInternal("Content with specified MIME type can’t be shown");
  CFTypeRef v2 = WebLocalizedStringInternal("The URL can’t be shown");
  CFTypeRef v3 = WebLocalizedStringInternal("Frame load interrupted");
  CFTypeRef v4 = WebLocalizedStringInternal("Not allowed to use restricted network port");
  CFTypeRef v5 = WebLocalizedStringInternal("The URL was blocked by a content filter");
  CFTypeRef v6 = WebLocalizedStringInternal("The plug-in can’t be found");
  CFTypeRef v7 = WebLocalizedStringInternal("The plug-in can’t be loaded");
  CFTypeRef v8 = WebLocalizedStringInternal("Java is unavailable");
  CFTypeRef v9 = WebLocalizedStringInternal("Plug-in cancelled");
  CFTypeRef v10 = WebLocalizedStringInternal("Plug-in handled load");
  objc_msgSend(MEMORY[0x1E4F28C58], "_webkit_addErrorsWithCodesAndDescriptions:inDomain:", objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v1, &unk_1F3C9C810, v2, &unk_1F3C9C828, v3, &unk_1F3C9C840, v4, &unk_1F3C9C858, v5, &unk_1F3C9C870, v6, &unk_1F3C9C888, v7, &unk_1F3C9C8A0,
      v8,
      &unk_1F3C9C8B8,
      v9,
      &unk_1F3C9C8D0,
      v10,
      &unk_1F3C9C8E8,
      WebLocalizedStringInternal("The current location cannot be found."),
      &unk_1F3C9C900,
      0),
    WebKitErrorDomain);
}

@end