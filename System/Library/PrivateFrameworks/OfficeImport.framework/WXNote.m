@interface WXNote
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 skipNextSib:(BOOL *)a5 state:(id)a6;
@end

@implementation WXNote

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 skipNextSib:(BOOL *)a5 state:(id)a6
{
  id v33 = a4;
  v9 = (OCXState *)a6;
  v10 = [(OCXState *)v9 WXMainNamespace];
  v11 = CXRequiredLongAttribute(a3, v10, (xmlChar *)"id");

  v32 = [(OCXState *)v9 packagePart];
  if (xmlStrEqual(a3->name, (const xmlChar *)"footnoteReference"))
  {
    v12 = (_xmlNode *)[(OCXState *)v9 xmlFootnoteWithID:v11];
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v32, v9, (objc_selector *)sel_OCXFootnotesRelationshipType);
  }
  else
  {
    v12 = (_xmlNode *)[(OCXState *)v9 xmlEndnoteWithID:v11];
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v32, v9, (objc_selector *)sel_OCXEndnotesRelationshipType);
  v13 = };
  v14 = [(OCXState *)v9 WXMainNamespace];
  int v15 = CXDefaultBoolAttribute(v12, v14, (xmlChar *)"suppressRef", 0);

  [v33 setAutomaticNumbering:v15 ^ 1u];
  v16 = [(OCXState *)v9 WXMainNamespace];
  int v17 = CXDefaultBoolAttribute(a3, v16, (xmlChar *)"customMarkFollows", 0);

  if (([v33 automaticNumbering] & v17) == 1) {
    [v33 setAutomaticNumbering:0];
  }
  if ([v33 automaticNumbering])
  {
    v18 = [v33 reference];
    +[WXCharacterRun readFromString:@"\x02" source:a3 to:v18];
  }
  v19 = [(OCXState *)v9 wxoavState];
  v31 = [v19 packagePart];
  [v19 setPackagePart:v13];
  v20 = [(OCXState *)v9 drawingState];
  v30 = [v20 packagePart];
  [v20 setPackagePart:v13];
  unsigned int v29 = [(OCXState *)v9 isNewSectionRequested];
  [(OCXState *)v9 setNewSectionRequested:0];
  v21 = [(OCXState *)v9 packagePart];
  [(OCXState *)v9 setPackagePart:v13];
  if (v17)
  {
    v22 = OCXNextSibling(a3);
    v23 = [v33 reference];
    [v23 setString:&stru_26EBF24D8];
    if (xmlStrEqual(v22->name, (const xmlChar *)"sym")) {
      +[WXSymbol readFrom:v22 to:v23 state:v9];
    }
    else {
      +[WXCharacterRun readFrom:v22 to:v23];
    }
    v24 = objc_msgSend(v23, "string", v13);
    if ([v24 length])
    {
    }
    else
    {
      v25 = [v23 properties];
      int v26 = [v25 isSymbolCharacterOverridden];

      if (!v26)
      {
LABEL_16:

        v13 = v28;
        goto LABEL_17;
      }
    }
    *a5 = 1;
    goto LABEL_16;
  }
LABEL_17:
  v27 = [v33 text];
  +[WXText readFrom:v12 baseStyle:0 to:v27 state:v9];

  [v19 setPackagePart:v31];
  [v20 setPackagePart:v30];
  [(OCXState *)v9 setPackagePart:v21];
  [(OCXState *)v9 setNewSectionRequested:v29];
}

@end