@interface WBSReaderResources
+ (OpaqueJSScript)articleFinderScriptForContext:(OpaqueJSContext *)a3;
+ (OpaqueJSScript)sharedUINormalWorldScriptForContext:(OpaqueJSContext *)a3;
+ (OpaqueJSScript)sharedUIScriptForContext:(OpaqueJSContext *)a3;
+ (id)localizedStringsScriptURL;
+ (id)readerHTMLSourceURL;
@end

@implementation WBSReaderResources

+ (id)readerHTMLSourceURL
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariSharedBundle");
  uint64_t v3 = [v2 URLForResource:@"ReaderWithSummary" withExtension:@"html"];
  v4 = (void *)+[WBSReaderResources readerHTMLSourceURL]::readerSourcePathURL;
  +[WBSReaderResources readerHTMLSourceURL]::readerSourcePathURL = v3;

  v5 = (void *)+[WBSReaderResources readerHTMLSourceURL]::readerSourcePathURL;
  return v5;
}

+ (id)localizedStringsScriptURL
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariSharedBundle");
  uint64_t v3 = [v2 URLForResource:@"WBSLocalizedStrings" withExtension:@"js"];

  return v3;
}

+ (OpaqueJSScript)articleFinderScriptForContext:(OpaqueJSContext *)a3
{
    return (OpaqueJSScript *)+[WBSReaderResources articleFinderScriptForContext:]::articleFinderScript;
  JSContextGetGroup(a3);
  result = (OpaqueJSScript *)JSScriptCreateReferencingImmortalASCIIText();
  +[WBSReaderResources articleFinderScriptForContext:]::articleFinderScript = (uint64_t)result;
  return result;
}

+ (OpaqueJSScript)sharedUIScriptForContext:(OpaqueJSContext *)a3
{
  JSContextGetGroup(a3);
  result = (OpaqueJSScript *)JSScriptCreateReferencingImmortalASCIIText();
  +[WBSReaderResources sharedUIScriptForContext:]::sharedUIScript = (uint64_t)result;
  return result;
}

+ (OpaqueJSScript)sharedUINormalWorldScriptForContext:(OpaqueJSContext *)a3
{
    return (OpaqueJSScript *)+[WBSReaderResources sharedUINormalWorldScriptForContext:]::sharedUINormalWorldScript;
  JSContextGetGroup(a3);
  result = (OpaqueJSScript *)JSScriptCreateReferencingImmortalASCIIText();
  +[WBSReaderResources sharedUINormalWorldScriptForContext:]::sharedUINormalWorldScript = (uint64_t)result;
  return result;
}

@end