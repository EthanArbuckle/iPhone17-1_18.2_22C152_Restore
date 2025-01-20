@interface KPFDocumentFactory
+ (id)createDocumentWithKPFBundle:(id)a3 drmContext:(id)a4;
@end

@implementation KPFDocumentFactory

+ (id)createDocumentWithKPFBundle:(id)a3 drmContext:(id)a4
{
  id v6 = [a3 pathForResource:@"header" ofType:@"json"];
  id v7 = v6;
  if (v6 || (id v7 = [a3 pathForResource:@"kpf" ofType:@"json"]) != 0)
  {
    if (a4)
    {
LABEL_4:
      v8 = (NSData *)[a4 dataWithContentsOfFile:v7 error:0];
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = [a3 pathForResource:&stru_46D7E8 ofType:@"json"];
    if (a4) {
      goto LABEL_4;
    }
  }
  v8 = +[NSData dataWithContentsOfFile:v7];
LABEL_7:
  if (!v8)
  {
    id v9 = 0;
    if (v6) {
      goto LABEL_9;
    }
LABEL_11:
    v10 = [[KPFDocument alloc] initWithKPFBundle:a3 kpfDictionary:v9 drmContext:a4];
    v11 = v10;
    uint64_t v12 = 1;
    goto LABEL_12;
  }
  id v9 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:0];
  if (!v6) {
    goto LABEL_11;
  }
LABEL_9:
  v10 = [[KPFGingerDocument alloc] initWithKPFBundle:a3 kpfDictionary:v9 drmContext:a4];
  v11 = v10;
  uint64_t v12 = 0;
LABEL_12:
  [(KPFDocument *)v10 setIsLegacy:v12];
  return v11;
}

@end