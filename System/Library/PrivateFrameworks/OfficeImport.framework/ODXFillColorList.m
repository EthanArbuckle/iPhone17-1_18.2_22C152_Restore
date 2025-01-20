@interface ODXFillColorList
+ (id)colorApplicationMethodMap;
+ (id)hueDirectionMap;
+ (void)readNode:(_xmlNode *)a3 list:(id)a4;
@end

@implementation ODXFillColorList

+ (void)readNode:(_xmlNode *)a3 list:(id)a4
{
  id v11 = a4;
  v6 = [a1 hueDirectionMap];
  objc_msgSend(v11, "setHueDirection:", objc_msgSend(v6, "readFromNode:ns:name:def:", a3, 0, "hueDir", 1));

  v7 = [a1 colorApplicationMethodMap];
  objc_msgSend(v11, "setMethod:", objc_msgSend(v7, "readFromNode:ns:name:def:", a3, 0, "meth", 2));

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = OCXFirstChild(a3);
  while (v9)
  {
    v10 = +[OAXColor readColorFromNode:v9];
    if (!v10) {
      [MEMORY[0x263EFF940] raise:@"ODXException" format:@"Could not read diagram color transform"];
    }
    [v8 addObject:v10];
    v9 = OCXNextSibling(v9);
  }
  [v11 setColors:v8];
}

+ (id)hueDirectionMap
{
  v2 = (void *)+[ODXFillColorList hueDirectionMap]::hueDirectionMap;
  if (!+[ODXFillColorList hueDirectionMap]::hueDirectionMap)
  {
    {
      +[ODXFillColorList hueDirectionMap]::hueDirectionDescriptions = 0;
      qword_268992250 = (uint64_t)"ccw";
      dword_268992258 = 1;
      qword_268992260 = (uint64_t)"cw";
      xmmword_268992268 = TCXmlEnumSentinel;
    }
    v3 = [[TCXmlEnumMap alloc] initWithDescriptions:&+[ODXFillColorList hueDirectionMap]::hueDirectionDescriptions];
    v4 = (void *)+[ODXFillColorList hueDirectionMap]::hueDirectionMap;
    +[ODXFillColorList hueDirectionMap]::hueDirectionMap = (uint64_t)v3;

    v2 = (void *)+[ODXFillColorList hueDirectionMap]::hueDirectionMap;
  }
  return v2;
}

+ (id)colorApplicationMethodMap
{
  v2 = (void *)+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap;
  if (!+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap)
  {
    {
      qword_268992290 = (uint64_t)"cycle";
      dword_268992298 = 1;
      qword_2689922A0 = (uint64_t)"repeat";
      dword_2689922A8 = 2;
      +[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodDescriptions = 0;
      qword_2689922B0 = (uint64_t)"span";
      xmmword_2689922B8 = TCXmlEnumSentinel;
    }
    v3 = [[TCXmlEnumMap alloc] initWithDescriptions:&+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodDescriptions];
    v4 = (void *)+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap;
    +[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap = (uint64_t)v3;

    v2 = (void *)+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap;
  }
  return v2;
}

@end