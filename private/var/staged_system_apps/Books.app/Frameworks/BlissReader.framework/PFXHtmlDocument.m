@interface PFXHtmlDocument
+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6;
+ (BOOL)readProcessingInstructionFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (BOOL)readWithState:(id)a3;
+ (Class)textReaderClass;
@end

@implementation PFXHtmlDocument

+ (BOOL)readWithState:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___PFXHtmlDocument;
  return [super readWithState:a3];
}

+ (BOOL)readProcessingInstructionFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  v7 = xmlTextReaderConstLocalName(a3);
  if (!xmlStrEqual(v7, (const xmlChar *)xmlStylesheetPI)) {
    return 1;
  }
  v8 = +[NSString stringWithXmlString:xmlTextReaderConstValue(a3)];
  id v9 = +[PFXUtilities valueOfTypeAttributeInProcessingInstruction:v8];
  id v10 = +[PFXUtilities valueOfHrefAttributeInProcessingInstruction:v8];
  if (!v10) {
    return 1;
  }
  id v11 = v10;
  id v12 = +[PFXUtilities valueOfMediaAttributeInProcessingInstruction:v8];

  return [a1 handleStylesheetAt:v11 ofType:v9 withMediaType:v12 readerState:a4];
}

+ (Class)textReaderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)handleStylesheetAt:(id)a3 ofType:(id)a4 withMediaType:(id)a5 readerState:(id)a6
{
  if (![PFXCommonCssMimeType isEqualToString:a4]
    || !+[PFXStylesheet isMediaTypeSupportedInAll:a5])
  {
    return 1;
  }

  return +[PFXStylesheet readStylesheetFromEntry:a3 readerState:a6];
}

@end