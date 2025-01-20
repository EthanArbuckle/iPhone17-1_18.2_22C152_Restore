@interface BKMediaOverlayElement
+ (id)newMediaOverlayElement:(id)a3 withParserInfo:(__CFDictionary *)a4;
+ (int)parseSMIL:(id)a3 contentSubpath:(id)a4 bookBasePath:(id)a5 bookDatabaseKey:(id)a6 managedObjectContext:(id)a7;
@end

@implementation BKMediaOverlayElement

+ (id)newMediaOverlayElement:(id)a3 withParserInfo:(__CFDictionary *)a4
{
  id v5 = a3;
  v7 = ITEpubMediaOverlayParser::audioStartForElement(a4, v6);
  v9 = ITEpubMediaOverlayParser::audioEndForElement(a4, v8);
  [v7 doubleValue];
  double v11 = v10;
  [v9 doubleValue];
  if (v11 <= v12)
  {
    id v13 = [v5 newByClass:objc_opt_class()];
    [v13 setAudioHref:ITEpubMediaOverlayParser::audioHrefForElement(a4, v14)];
    [v13 setAudioStart:v7];
    [v13 setAudioEnd:v9];
    [v13 setIndentationLevel:ITEpubMediaOverlayParser::indentationLevelForElement(a4, v15)];
    [v13 setCategory:ITEpubMediaOverlayParser::categoryForElement(a4, v16)];
    [v13 setElementId:ITEpubMediaOverlayParser::textElementIdForElement(a4, v17)];
    [v13 setDocumentHref:ITEpubMediaOverlayParser::textHrefForElement(a4, v18)];
    [v13 setSequenceSource:ITEpubMediaOverlayParser::sequenceSourceForElement(a4, v19)];
    v20 = [v13 indentationLevel];

    if (!v20)
    {
      id v21 = [objc_alloc((Class)NSNumber) initWithInt:0];
      [v13 setIndentationLevel:v21];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (int)parseSMIL:(id)a3 contentSubpath:(id)a4 bookBasePath:(id)a5 bookDatabaseKey:(id)a6 managedObjectContext:(id)a7
{
  a3;
  id v11 = a4;
  id v12 = a5;
  a6;
  a7;
  operator new();
}

@end