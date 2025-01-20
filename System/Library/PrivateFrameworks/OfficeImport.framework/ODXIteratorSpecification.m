@interface ODXIteratorSpecification
+ (id)axisTypeMap;
+ (id)elementTypeMap;
+ (void)readFromNode:(_xmlNode *)a3 toSpecification:(id)a4 state:(id)a5;
@end

@implementation ODXIteratorSpecification

+ (id)axisTypeMap
{
  v2 = (void *)+[ODXIteratorSpecification axisTypeMap]::axisTypeMap;
  if (!+[ODXIteratorSpecification axisTypeMap]::axisTypeMap)
  {
    {
      qword_2689922E0 = (uint64_t)"self";
      dword_2689922E8 = 1;
      qword_2689922F0 = (uint64_t)"ch";
      dword_2689922F8 = 2;
      qword_268992300 = (uint64_t)"des";
      dword_268992308 = 3;
      qword_268992310 = (uint64_t)"desOrSelf";
      dword_268992318 = 4;
      qword_268992320 = (uint64_t)"par";
      dword_268992328 = 5;
      qword_268992330 = (uint64_t)"ancst";
      dword_268992338 = 6;
      qword_268992340 = (uint64_t)"ancstOrSelf";
      dword_268992348 = 7;
      qword_268992350 = (uint64_t)"followSib";
      dword_268992358 = 8;
      qword_268992360 = (uint64_t)"precedSib";
      dword_268992368 = 9;
      qword_268992370 = (uint64_t)"follow";
      dword_268992378 = 10;
      qword_268992380 = (uint64_t)"preced";
      dword_268992388 = 11;
      qword_268992390 = (uint64_t)"root";
      dword_268992398 = 12;
      +[ODXIteratorSpecification axisTypeMap]::axisTypeDescriptions = 0;
      qword_2689923A0 = (uint64_t)"none";
      xmmword_2689923A8 = TCXmlEnumSentinel;
    }
    v3 = [[TCXmlEnumMap alloc] initWithDescriptions:&+[ODXIteratorSpecification axisTypeMap]::axisTypeDescriptions];
    v4 = (void *)+[ODXIteratorSpecification axisTypeMap]::axisTypeMap;
    +[ODXIteratorSpecification axisTypeMap]::axisTypeMap = (uint64_t)v3;

    v2 = (void *)+[ODXIteratorSpecification axisTypeMap]::axisTypeMap;
  }
  return v2;
}

+ (id)elementTypeMap
{
  v2 = (void *)+[ODXIteratorSpecification elementTypeMap]::elementTypeMap;
  if (!+[ODXIteratorSpecification elementTypeMap]::elementTypeMap)
  {
    {
      qword_2689923D0 = (uint64_t)"all";
      dword_2689923D8 = 1;
      qword_2689923E0 = (uint64_t)"doc";
      dword_2689923E8 = 2;
      qword_2689923F0 = (uint64_t)"node";
      dword_2689923F8 = 3;
      qword_268992400 = (uint64_t)"norm";
      dword_268992408 = 4;
      qword_268992410 = (uint64_t)"nonNorm";
      dword_268992418 = 5;
      qword_268992420 = (uint64_t)"asst";
      dword_268992428 = 6;
      qword_268992430 = (uint64_t)"nonAsst";
      dword_268992438 = 7;
      qword_268992440 = (uint64_t)"parTrans";
      dword_268992448 = 8;
      qword_268992450 = (uint64_t)"pres";
      dword_268992458 = 9;
      +[ODXIteratorSpecification elementTypeMap]::elementTypeDescriptions = 0;
      qword_268992460 = (uint64_t)"sibTrans";
      xmmword_268992468 = TCXmlEnumSentinel;
    }
    v3 = [[TCXmlEnumMap alloc] initWithDescriptions:&+[ODXIteratorSpecification elementTypeMap]::elementTypeDescriptions];
    v4 = (void *)+[ODXIteratorSpecification elementTypeMap]::elementTypeMap;
    +[ODXIteratorSpecification elementTypeMap]::elementTypeMap = (uint64_t)v3;

    v2 = (void *)+[ODXIteratorSpecification elementTypeMap]::elementTypeMap;
  }
  return v2;
}

+ (void)readFromNode:(_xmlNode *)a3 toSpecification:(id)a4 state:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  v9 = [a1 axisTypeMap];
  uint64_t v10 = [v9 readFromNode:a3 ns:0 name:"axis" def:12];

  if (v10 != 12)
  {
    v11 = objc_alloc_init(ODDIteratorAttributes);
    [v16 addAttributes:v11];
    [(ODDIteratorAttributes *)v11 setAxis:v10];
    v12 = [a1 elementTypeMap];
    -[ODDIteratorAttributes setPointType:](v11, "setPointType:", [v12 readFromNode:a3 ns:0 name:"ptType" def:0]);

    [(ODDIteratorAttributes *)v11 setHideLastTransition:OCXReadBool(a3, 0, (xmlChar *)"hideLastTrans", 1)];
    v13 = [v8 ODXDiagramNamespace];
    [(ODDIteratorAttributes *)v11 setStart:CXDefaultLongAttribute(a3, v13, (xmlChar *)"st", 1)];

    v14 = [v8 ODXDiagramNamespace];
    [(ODDIteratorAttributes *)v11 setCount:CXDefaultUnsignedLongAttribute(a3, v14, (xmlChar *)"cnt", 0)];

    v15 = [v8 ODXDiagramNamespace];
    [(ODDIteratorAttributes *)v11 setStep:CXDefaultLongAttribute(a3, v15, (xmlChar *)"step", 1)];
  }
}

@end