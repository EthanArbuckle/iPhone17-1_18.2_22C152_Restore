@interface ODXLayoutVariablePropertySet
+ (id)directionMap;
+ (void)readNode:(_xmlNode *)a3 toSet:(id)a4 state:(id)a5;
@end

@implementation ODXLayoutVariablePropertySet

+ (id)directionMap
{
  v2 = (void *)+[ODXLayoutVariablePropertySet directionMap]::directionMap;
  if (!+[ODXLayoutVariablePropertySet directionMap]::directionMap)
  {
    {
      +[ODXLayoutVariablePropertySet directionMap]::directionDescriptions = 0;
      qword_268992490 = (uint64_t)"norm";
      dword_268992498 = 1;
      qword_2689924A0 = (uint64_t)"rev";
      xmmword_2689924A8 = TCXmlEnumSentinel;
    }
    v3 = [[TCXmlEnumMap alloc] initWithDescriptions:&+[ODXLayoutVariablePropertySet directionMap]::directionDescriptions];
    v4 = (void *)+[ODXLayoutVariablePropertySet directionMap]::directionMap;
    +[ODXLayoutVariablePropertySet directionMap]::directionMap = (uint64_t)v3;

    v2 = (void *)+[ODXLayoutVariablePropertySet directionMap]::directionMap;
  }
  return v2;
}

+ (void)readNode:(_xmlNode *)a3 toSet:(id)a4 state:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  v9 = [v8 ODXDiagramNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "dir");

  if (v10)
  {
    v11 = [a1 directionMap];
    objc_msgSend(v12, "setDirection:", objc_msgSend(v11, "readFromNode:ns:name:def:", v10, 0, "val", 0));
  }
}

@end