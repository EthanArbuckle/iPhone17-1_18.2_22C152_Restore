@interface PFAIHeadLink
- (BOOL)mapStartElementWithState:(id)a3;
- (void)loadHintsFrom:(id)a3 contentState:(id)a4;
@end

@implementation PFAIHeadLink

- (void)loadHintsFrom:(id)a3 contentState:(id)a4
{
  if (a3)
  {
    CFDataRef v5 = (const __CFData *)objc_msgSend(objc_msgSend(a4, "archive"), "createDataWithName:error:", a3, 0);
    if (v5)
    {
      CFDataRef v6 = v5;
      CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
      CFPropertyListRef v7 = CFPropertyListCreateWithData(kCFAllocatorDefault, v5, 0, &format, 0);
      if (v7)
      {
        v8 = v7;
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 == CFDictionaryGetTypeID()) {
          v10 = v8;
        }
        else {
          v10 = 0;
        }
        objc_msgSend(objc_msgSend(a4, "currentDocOrientationState"), "setLineHints:", v10);
        CFRelease(v8);
      }
    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentXmlStackEntry];
  id v6 = [v5 valueForAttribute:"type"];
  id v7 = [v5 valueForAttribute:"href"];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = v7;
    if (([PFXCommonSvgMimeType isEqualToString:v6] & 1) != 0
      || [PFXCommonSvgImageMimeType isEqualToString:v6])
    {
      +[PFXSvgDefs readSvgDefinitionsFromEntry:v9 readerState:a3];
    }
    else if ([PFXCommonCssMimeType isEqualToString:v6])
    {
      id v11 = [v5 valueForAttribute:"media"];
      unsigned int v12 = +[PFXStylesheet isMediaTypeSupportedInFlow:v11];
      unsigned int v13 = +[PFXStylesheet isMediaTypeSupportedInPaginated:v11];
      if (v12)
      {
        [a3 setFlowAsCurrent];
        +[PFXStylesheet readStylesheetFromEntry:v9 readerState:a3];
      }
      if (v13)
      {
        [a3 setPaginatedAsCurrent];
        +[PFXStylesheet readStylesheetFromEntry:v9 readerState:a3];
      }
    }
    else if ([PFXCommonLineHintsMimeType isEqualToString:v6])
    {
      id v14 = [v5 valueForAttribute:"media"];
      unsigned int v15 = +[PFXStylesheet isMediaTypeSupportedInFlow:v14];
      unsigned int v16 = +[PFXStylesheet isMediaTypeSupportedInPaginated:v14];
      id v17 = [v5 valueForAttribute:"href"];
      if (v17)
      {
        id v18 = [a3 absoluteEntryForRelativeUri:v17];
        if (v18)
        {
          id v19 = v18;
          if (v15)
          {
            [a3 setFlowAsCurrent];
            [(PFAIHeadLink *)self loadHintsFrom:v19 contentState:a3];
          }
          if (v16)
          {
            [a3 setPaginatedAsCurrent];
            [(PFAIHeadLink *)self loadHintsFrom:v19 contentState:a3];
          }
        }
      }
    }
  }
  return 0;
}

@end