@interface OISpotlightImporter
- (OISpotlightImporter)init;
- (id)searchableAttributesForOfficeFileAtURL:(id)a3 error:(id *)a4;
- (id)searchableAttributesForXMLOfficeFileOfType:(unint64_t)a3 atURL:(id)a4 error:(id *)a5;
- (id)sheetNamesFromWorkbookPart:(id)a3;
- (id)textContentForReader:(id)a3 withType:(unint64_t)a4;
- (id)textContentFromExcelReader:(id)a3;
- (id)textContentFromPowerPointReader:(id)a3;
- (id)textContentFromWordReader:(id)a3;
- (id)textFromElementsNamed:(const char *)a3 skippingElementsNamed:(const char *)a4 insertingNewlinesOnElementsNamed:(const char *)a5 tabulationsOnElementsNamed:(const char *)a6 inNamespaces:(const char *)a7 inPackagePart:(id)a8;
- (void)addPackagePropertiesFromReader:(id)a3 toSearchableAttributes:(id)a4;
@end

@implementation OISpotlightImporter

- (OISpotlightImporter)init
{
  if (-[OISpotlightImporter init]::once != -1) {
    dispatch_once(&-[OISpotlightImporter init]::once, &__block_literal_global_108);
  }
  v4.receiver = self;
  v4.super_class = (Class)OISpotlightImporter;
  return [(OISpotlightImporter *)&v4 init];
}

uint64_t __27__OISpotlightImporter_init__block_invoke()
{
  objc_opt_class();
  return objc_opt_class();
}

- (void)addPackagePropertiesFromReader:(id)a3 toSearchableAttributes:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 zipPackage];
  v8 = [v7 properties];
  v9 = [v8 creator];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [v8 creator];
    v32[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    [v6 setAuthorNames:v12];
  }
  v13 = [v8 description];
  BOOL v14 = [v13 length] == 0;

  if (!v14)
  {
    v15 = [v8 description];
    [v6 setContentDescription:v15];
  }
  v16 = [v8 keywords];
  BOOL v17 = [v16 length] == 0;

  if (!v17)
  {
    v18 = [v8 keywords];
    v31 = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    [v6 setKeywords:v19];
  }
  v20 = [v8 title];
  BOOL v21 = [v20 length] == 0;

  if (!v21)
  {
    v22 = [v8 title];
    [v6 setTitle:v22];
  }
  v23 = [v8 company];
  BOOL v24 = [v23 length] == 0;

  if (!v24)
  {
    v25 = [v8 company];
    v30 = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    [v6 setOrganizations:v26];
  }
  v27 = [v8 subject];
  BOOL v28 = [v27 length] == 0;

  if (!v28)
  {
    v29 = [v8 subject];
    [v6 setSubject:v29];
  }
}

- (id)textFromElementsNamed:(const char *)a3 skippingElementsNamed:(const char *)a4 insertingNewlinesOnElementsNamed:(const char *)a5 tabulationsOnElementsNamed:(const char *)a6 inNamespaces:(const char *)a7 inPackagePart:(id)a8
{
  id v13 = a8;
  id v14 = objc_alloc_init(MEMORY[0x263F089D8]);
  v15 = (xmlTextReader *)[v13 xmlReader];
  BOOL v16 = 0;
  while (xmlTextReaderRead(v15) == 1)
  {
    if (xmlTextReaderNodeType(v15) == 1)
    {
      BOOL v17 = xmlTextReaderConstLocalName(v15);
      if (xmlStrcmp(v17, (const xmlChar *)a3))
      {
        if (a4
          && !xmlStrcmp(v17, (const xmlChar *)a4)
          && isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
        {
          while (xmlTextReaderRead(v15) == 1
               && (xmlTextReaderNodeType(v15) != 15
                || xmlStrcmp(v17, (const xmlChar *)a4)
                || !isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7)))
            ;
        }
        else if (a5 == 0 {
               || !v16
        }
               || xmlStrcmp(v17, (const xmlChar *)a5)
               || !isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
        {
          if (a6 != 0 && v16)
          {
            BOOL v16 = 1;
            if (!xmlStrcmp(v17, (const xmlChar *)a6)
              && isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
            {
              [v14 appendString:@"\t"];
            }
          }
        }
        else
        {
          [v14 appendString:@"\n"];
          BOOL v16 = 0;
        }
      }
      else if (isCurrentTextReaderElementInNamespaces(v15, (const unsigned __int8 **)a7))
      {
        v18 = xmlTextReaderExpand(v15);
        Content = xmlNodeGetContent(v18);
        if (Content)
        {
          v20 = [NSString stringWithUTF8String:Content];
          [v14 appendString:v20];

          if (!a5) {
            [v14 appendString:@"\n"];
          }
          ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Content);
          BOOL v16 = a5 != 0;
        }
      }
    }
  }
  xmlFreeTextReader(v15);

  return v14;
}

- (id)textContentFromPowerPointReader:(id)a3
{
  v41[3] = *MEMORY[0x263EF8340];
  objc_super v4 = [a3 zipPackage];
  v22 = [v4 mainDocumentPart];
  id v5 = [v22 relationshipsByType:@"http://purl.oclc.org/ooxml/officeDocument/relationships/slide"];
  id v6 = v5;
  if (v5)
  {
    id v23 = v5;
  }
  else
  {
    id v23 = [v22 relationshipsByType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide"];
  }

  v41[0] = "http://schemas.openxmlformats.org/drawingml/2006/main";
  v41[1] = "http://purl.oclc.org/ooxml/drawingml/main";
  v41[2] = 0;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v23;
  uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v26)
  {
    char v7 = 0;
    uint64_t v25 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(obj);
        }
        v8 = [*(id *)(*((void *)&v35 + 1) + 8 * i) targetLocation];
        v29 = [v4 partForLocation:v8];

        v27 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:0 insertingNewlinesOnElementsNamed:"p" tabulationsOnElementsNamed:0 inNamespaces:v41 inPackagePart:v29];
        if ([v27 length])
        {
          if (v7) {
            [v30 addObject:@"\n"];
          }
          [v30 addObject:v27];
          char v7 = 1;
        }
        v9 = [v29 relationshipsByType:@"http://purl.oclc.org/ooxml/officeDocument/relationships/notesSlide"];
        uint64_t v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [v29 relationshipsByType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/notesSlide"];
        }
        v12 = v11;

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v13);
              }
              BOOL v17 = [*(id *)(*((void *)&v31 + 1) + 8 * j) targetLocation];
              v18 = [v4 partForLocation:v17];

              v19 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:"fld" insertingNewlinesOnElementsNamed:"p" tabulationsOnElementsNamed:0 inNamespaces:v41 inPackagePart:v18];
              if ([v19 length])
              {
                [v30 addObject:v19];
                char v7 = 1;
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v26);
  }

  v20 = [v30 componentsJoinedByString:@"\n"];

  return v20;
}

- (id)textContentFromWordReader:(id)a3
{
  v37[5] = *MEMORY[0x263EF8340];
  v37[0] = "http://purl.oclc.org/ooxml/wordprocessingml/main";
  v37[1] = "http://schemas.openxmlformats.org/wordprocessingml/2006/main";
  v37[2] = "http://schemas.microsoft.com/office/word/2012/wordml";
  v37[3] = "http://schemas.microsoft.com/office/word/2010/wordml";
  v37[4] = 0;
  uint64_t v26 = [a3 zipPackage];
  id v23 = [v26 mainDocumentPart];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [v23 relationshipsByType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/header"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = [*(id *)(*((void *)&v31 + 1) + 8 * i) targetLocation];
        v9 = [v26 partForLocation:v8];

        uint64_t v10 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:0 insertingNewlinesOnElementsNamed:"p" tabulationsOnElementsNamed:"tab" inNamespaces:v37 inPackagePart:v9];
        [v4 appendString:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v5);
  }

  id v11 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:0 insertingNewlinesOnElementsNamed:"p" tabulationsOnElementsNamed:"tab" inNamespaces:v37 inPackagePart:v23];
  [v4 appendString:v11];

  uint64_t v12 = [v23 firstPartWithRelationshipOfType:@"http://purl.oclc.org/ooxml/officeDocument/relationships/footnotes"];
  if (v12
    || ([v23 firstPartWithRelationshipOfType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/footnotes"], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v13 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:0 insertingNewlinesOnElementsNamed:"p" tabulationsOnElementsNamed:"tab" inNamespaces:v37 inPackagePart:v12];
    [v4 appendString:v13];
  }
  else
  {
    uint64_t v21 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_msgSend(v23, "relationshipsByType:", @"http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer", v21);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obja countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obja);
        }
        BOOL v17 = [*(id *)(*((void *)&v27 + 1) + 8 * j) targetLocation];
        v18 = [v26 partForLocation:v17];

        v19 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:0 insertingNewlinesOnElementsNamed:"p" tabulationsOnElementsNamed:"tab" inNamespaces:v37 inPackagePart:v18];
        [v4 appendString:v19];
      }
      uint64_t v14 = [obja countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v14);
  }

  return v4;
}

- (id)sheetNamesFromWorkbookPart:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = (xmlTextReader *)[v3 xmlReader];
  char v6 = 0;
  BOOL v16 = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
  BOOL v17 = "http://purl.oclc.org/ooxml/spreadsheetml/main";
  uint64_t v18 = 0;
  while (xmlTextReaderRead(v5) == 1)
  {
    if ((v6 & 1) != 0 && xmlTextReaderNodeType(v5) == 15)
    {
      char v7 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v7, (const xmlChar *)"sheets"))
      {
        if (isCurrentTextReaderElementInNamespaces(v5, &v16)) {
          break;
        }
      }
    }
    if (xmlTextReaderNodeType(v5) == 1)
    {
      v8 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v8, (const xmlChar *)"sheet"))
      {
        if (isCurrentTextReaderElementInNamespaces(v5, &v16))
        {
          xmlNodePtr v9 = xmlTextReaderExpand(v5);
          if (v9)
          {
            properties = v9->properties;
            char v6 = 1;
            if (properties)
            {
              while (1)
              {
                name = properties->name;
                if (name)
                {
                  if (xmlStrEqual(name, (const xmlChar *)"name")) {
                    break;
                  }
                }
                properties = properties->next;
                if (!properties) {
                  goto LABEL_17;
                }
              }
              id v12 = [NSString alloc];
              id v13 = objc_msgSend(v12, "tc_initWithValueOfXmlAttribute:", properties, v16, v17, v18, v19);
              [v4 addObject:v13];

LABEL_17:
              char v6 = 1;
            }
          }
        }
      }
    }
  }
  xmlFreeTextReader(v5);
  uint64_t v14 = objc_msgSend(v4, "componentsJoinedByString:", @"\n", v16, v17, v18, v19);

  return v14;
}

- (id)textContentFromExcelReader:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  v15[0] = "http://purl.oclc.org/ooxml/spreadsheetml/main";
  v15[1] = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
  v15[2] = "http://schemas.openxmlformats.org/spreadsheetml/2006/7/main";
  v15[3] = 0;
  id v4 = [a3 zipPackage];
  uint64_t v5 = [v4 mainDocumentPart];
  char v6 = [(OISpotlightImporter *)self sheetNamesFromWorkbookPart:v5];
  char v7 = [v5 firstPartWithRelationshipOfType:@"http://purl.oclc.org/ooxml/officeDocument/relationships/sharedStrings"];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 firstPartWithRelationshipOfType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/sharedStrings"];
  }
  uint64_t v10 = v9;

  id v11 = [(OISpotlightImporter *)self textFromElementsNamed:"t" skippingElementsNamed:0 insertingNewlinesOnElementsNamed:0 tabulationsOnElementsNamed:0 inNamespaces:v15 inPackagePart:v10];
  id v12 = [v6 stringByAppendingString:@"\n"];
  id v13 = [v12 stringByAppendingString:v11];

  return v13;
}

- (id)textContentForReader:(id)a3 withType:(unint64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 2uLL:
      uint64_t v8 = [(OISpotlightImporter *)self textContentFromWordReader:v7];
      goto LABEL_7;
    case 6uLL:
      uint64_t v8 = [(OISpotlightImporter *)self textContentFromPowerPointReader:v7];
      goto LABEL_7;
    case 4uLL:
      uint64_t v8 = [(OISpotlightImporter *)self textContentFromExcelReader:v7];
LABEL_7:
      id v9 = (void *)v8;
      goto LABEL_9;
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"OISpotlightImporter.mm" lineNumber:387 description:@"Unknown file type"];

  id v9 = 0;
LABEL_9:

  return v9;
}

- (id)searchableAttributesForXMLOfficeFileOfType:(unint64_t)a3 atURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [(OCDReader *)[OCXReader alloc] initWithCancelDelegate:0];
  id v9 = [v7 path];
  [(OCDReader *)v8 setFileName:v9];

  if ([(OCXReader *)v8 start])
  {
    id v10 = objc_alloc_init(MEMORY[0x263F02AE8]);
    [(OISpotlightImporter *)self addPackagePropertiesFromReader:v8 toSearchableAttributes:v10];
    id v11 = [(OISpotlightImporter *)self textContentForReader:v8 withType:a3];
    [v10 setTextContent:v11];

    id v12 = v10;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)searchableAttributesForOfficeFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 path];
  unint64_t v8 = +[CMFileManager getFileTypeFromPath:v7];

  if (v8 <= 6)
  {
    if (((1 << v8) & 0x2A) != 0)
    {
      uint64_t v9 = +[QLTop searchableAttributesForBinaryOfficeFileAtURL:v6 error:a4];
      goto LABEL_6;
    }
    if (((1 << v8) & 0x54) != 0)
    {
      uint64_t v9 = [(OISpotlightImporter *)self searchableAttributesForXMLOfficeFileOfType:v8 atURL:v6 error:a4];
LABEL_6:
      id v10 = (void *)v9;
      goto LABEL_7;
    }
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"OIErrorDomain" code:2 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_7:

  return v10;
}

@end