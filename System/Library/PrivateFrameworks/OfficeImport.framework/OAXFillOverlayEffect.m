@interface OAXFillOverlayEffect
+ (id)blendModeEnumMap;
+ (id)readFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5;
@end

@implementation OAXFillOverlayEffect

+ (id)readFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(OADFillOverlayEffect);
  v11 = CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"blend");
  v12 = [a1 blendModeEnumMap];
  uint64_t v13 = [v12 valueForString:v11];

  [(OADFillOverlayEffect *)v10 setBlendMode:v13];
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    v15 = +[OAXFill readFillFromXmlNode:i packagePart:v8 drawingState:v9];
    if (v15)
    {
      [(OADFillOverlayEffect *)v10 setFill:v15];

      break;
    }
  }

  return v10;
}

+ (id)blendModeEnumMap
{
  v2 = (void *)+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap;
  if (!+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_8, 0, &dword_238A75000);
    }
    v3 = [[TCEnumerationMap alloc] initWithStructs:&+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumStructs count:5 caseSensitive:1];
    v4 = (void *)+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap;
    +[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap = (uint64_t)v3;

    v2 = (void *)+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap;
  }
  return v2;
}

@end