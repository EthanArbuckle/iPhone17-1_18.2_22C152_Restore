@interface PFXSvgDefs
+ (BOOL)readSvgDefinitionsFromEntry:(id)a3 readerState:(id)a4;
@end

@implementation PFXSvgDefs

+ (BOOL)readSvgDefinitionsFromEntry:(id)a3 readerState:(id)a4
{
  if (!qword_573438)
  {
    objc_sync_enter(a1);
    if (!qword_573438)
    {
      id v29 = objc_alloc((Class)NSDictionary);
      uint64_t v28 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      id v13 = [v29 initWithObjectsAndKeys:v28, @"linearGradient", v7, @"radialGradient", v8, @"stop", v9, @"pattern", v10, @"image", v11, @"marker", v12, @"path", objc_opt_class(), @"clipPath", 0];
      __dmb(0xBu);
      qword_573438 = (uint64_t)v13;
    }
    objc_sync_exit(a1);
  }
  id v14 = [a4 absoluteEntryForRelativeUri:a3];
  v15 = -[PFXSvgDefsDocument initWithReaderState:entryPath:definitionMap:]([PFXSvgDefsDocument alloc], "initWithReaderState:entryPath:definitionMap:", a4, v14, [a4 svgDefinitionCache]);
  id v16 = objc_msgSend(objc_msgSend(a4, "archive"), "decryptEntryWithName:error:", v14, 0);
  if (!v16) {
    return (char)v16;
  }
  id v16 = [v16 xmlReader];
  if (!v16) {
    return (char)v16;
  }
  v17 = (xmlTextReader *)v16;
  int v18 = xmlTextReaderRead((xmlTextReaderPtr)v16);
  if (v18 != 1) {
    goto LABEL_20;
  }
  do
  {
    int v19 = xmlTextReaderNodeType(v17);
    if (v19 == 15)
    {
      if (![(PFXSvgDefsDocument *)v15 innermostElement]) {
        goto LABEL_16;
      }
LABEL_15:
      [v15 innermostElement].end;
      [(PFXSvgDefsDocument *)v15 popElement];
      goto LABEL_16;
    }
    if (v19 == 1)
    {
      v20 = +[NSString stringWithXmlString:xmlTextReaderConstLocalName(v17)];
      v21 = (objc_class *)[(id)qword_573438 objectForKey:v20];
      if (v21)
      {
        id v22 = [[v21 alloc] initWithDocument:v15 name:v20];
        for (int i = xmlTextReaderMoveToFirstAttribute(v17); i == 1; int i = xmlTextReaderMoveToNextAttribute(v17))
        {
          v24 = xmlTextReaderConstLocalName(v17);
          v25 = [[PFXString alloc] initWithXmlString:xmlTextReaderConstValue(v17)];
          [v22 setAttribute:v24 withValue:v25];
        }
        xmlTextReaderMoveToElement(v17);
        [(PFXSvgDefsDocument *)v15 pushElement:v22];

        [v22 start];
        if (xmlTextReaderIsEmptyElement(v17)) {
          goto LABEL_15;
        }
      }
    }
LABEL_16:
    int v26 = xmlTextReaderRead(v17);
  }
  while (v26 == 1);
  int v18 = v26;
LABEL_20:
  xmlFreeTextReader(v17);
  LOBYTE(v16) = v18 >= 0;
  return (char)v16;
}

@end