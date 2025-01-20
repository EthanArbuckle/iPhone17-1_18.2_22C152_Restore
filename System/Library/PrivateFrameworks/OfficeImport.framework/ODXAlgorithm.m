@interface ODXAlgorithm
+ (id)typeMap;
+ (void)readNode:(_xmlNode *)a3 toAlgorithm:(id)a4;
@end

@implementation ODXAlgorithm

+ (id)typeMap
{
  v2 = (void *)+[ODXAlgorithm typeMap]::typeMap;
  if (!+[ODXAlgorithm typeMap]::typeMap)
  {
    {
      qword_268992180 = (uint64_t)"unknown";
      dword_268992188 = 1;
      qword_268992190 = (uint64_t)"composite";
      dword_268992198 = 2;
      qword_2689921A0 = (uint64_t)"conn";
      dword_2689921A8 = 3;
      qword_2689921B0 = (uint64_t)"cycle";
      dword_2689921B8 = 4;
      qword_2689921C0 = (uint64_t)"hierChild";
      dword_2689921C8 = 5;
      qword_2689921D0 = (uint64_t)"hierRoot";
      dword_2689921D8 = 6;
      qword_2689921E0 = (uint64_t)"pyra";
      dword_2689921E8 = 7;
      qword_2689921F0 = (uint64_t)"lin";
      dword_2689921F8 = 8;
      qword_268992200 = (uint64_t)"sp";
      dword_268992208 = 9;
      qword_268992210 = (uint64_t)"tx";
      dword_268992218 = 10;
      +[ODXAlgorithm typeMap]::typeDescriptions = 0;
      qword_268992220 = (uint64_t)"snake";
      xmmword_268992228 = TCXmlEnumSentinel;
    }
    v3 = [[TCXmlEnumMap alloc] initWithDescriptions:&+[ODXAlgorithm typeMap]::typeDescriptions];
    v4 = (void *)+[ODXAlgorithm typeMap]::typeMap;
    +[ODXAlgorithm typeMap]::typeMap = (uint64_t)v3;

    v2 = (void *)+[ODXAlgorithm typeMap]::typeMap;
  }
  return v2;
}

+ (void)readNode:(_xmlNode *)a3 toAlgorithm:(id)a4
{
  id v7 = a4;
  v6 = [a1 typeMap];
  objc_msgSend(v7, "setType:", objc_msgSend(v6, "readFromNode:ns:name:", a3, 0, "type"));
}

@end