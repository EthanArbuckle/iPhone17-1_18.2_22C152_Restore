@interface SMHandleFormatting
+ (id)canonicalIDSAddressForAddress:(id)a3;
@end

@implementation SMHandleFormatting

+ (id)canonicalIDSAddressForAddress:(id)a3
{
  id v3 = a3;
  if (IMSharedUtilitiesLibraryCore() && getIMChatCanonicalIDSIDsForAddressSymbolLoc())
  {
    id v4 = v3;
    IMChatCanonicalIDSIDsForAddressSymbolLoc = (void (*)(id))getIMChatCanonicalIDSIDsForAddressSymbolLoc();
    if (!IMChatCanonicalIDSIDsForAddressSymbolLoc)
    {
      dlerror();
      abort_report_np();
      return (id)IMSharedUtilitiesLibraryCore();
    }
    v6 = IMChatCanonicalIDSIDsForAddressSymbolLoc(v4);

    v7 = [v6 _stripFZIDPrefix];

    if (v7 && ([v7 isEqualToString:@"(null)"] & 1) == 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end