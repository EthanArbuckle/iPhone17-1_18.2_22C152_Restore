@interface PFAITocConfigHtmlDocument
+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6;
+ (id)elementReaders;
@end

@implementation PFAITocConfigHtmlDocument

+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6
{
  if (![PFXCommonCssMimeType isEqualToString:a4]
    || !+[PFXStylesheet isMediaTypeSupportedInPaginated:a5])
  {
    return 1;
  }

  return +[PFXStylesheet readStylesheetFromEntry:a3 readerState:a6];
}

+ (id)elementReaders
{
  id result = (id)qword_573728;
  if (!qword_573728)
  {
    objc_sync_enter(a1);
    if (!qword_573728)
    {
      v4 = [[PFXElementReaderDictionary alloc] initWithFallThroughAllowed:1];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"html" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"head" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"style" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"link" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"meta" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"title" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"body" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"section" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"article" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"hgroup" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"nav" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"header" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"footer" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"b" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"strong" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"i" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"em" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"span" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"br" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"pre" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"a" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"small" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"cite" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"dfn" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"abbr" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"sup" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"sub" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"p" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"dl" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"div" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"blockquote" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"table" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"caption" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"colgroup" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"col" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"tbody" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"tfoot" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"thead" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"tr" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"td" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"th" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"address" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"figure" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"figcaption" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"aside" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"h1" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"h2" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"h3" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"h4" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"h5" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"h6" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"ol" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"ul" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"li" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"dt" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"dd" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"svg" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"a" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"image" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"path" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"rect" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"g" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"title" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"desc" elementNamespace:PFXCommonSvgNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"video" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"audio" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"img" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"math" elementNamespace:PFXCommonMathMLNS mappingClass:objc_opt_class()];
      [(PFXElementReaderDictionary *)v4 addEntryWithElementName:"object" elementNamespace:PFXCommonXhtmlNS[0] mappingClass:objc_opt_class()];
      __dmb(0xBu);
      qword_573728 = (uint64_t)v4;
    }
    objc_sync_exit(a1);
    return (id)qword_573728;
  }
  return result;
}

@end