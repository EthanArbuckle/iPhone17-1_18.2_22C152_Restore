@interface CSVMapper
- (CGSize)pageSize;
- (CSVMapper)initWithRows:(id)a3 fileName:(id)a4 columnCount:(unint64_t)a5 archiver:(id)a6;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation CSVMapper

- (CSVMapper)initWithRows:(id)a3 fileName:(id)a4 columnCount:(unint64_t)a5 archiver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CSVMapper;
  v14 = [(CMMapper *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mRows, a3);
    objc_storeStrong((id *)&v15->super.mArchiver, a6);
    objc_storeStrong((id *)&v15->mFileName, a4);
    v15->mColumnCount = a5;
    objc_storeStrong((id *)&v15->mFileName, a4);
  }

  return v15;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v20 = a3;
  id v18 = a4;
  v6 = [(NSString *)self->mFileName lastPathComponent];
  v7 = [v6 stringByDeletingPathExtension];
  id v8 = +[CMXmlUtils copyHeadElementWithTitle:v7];

  [v20 addChild:v8];
  v9 = +[OIXMLElement elementWithType:17 stringValue:@"body\n{\nfont: 10px Verdana;\n}\ntable\n{\nborder-collapse: collapse;\n}\ntd\n{\nfont-family:Verdana,Arial;\nfont-size:10;\nborder: solid 1px;\npadding: 5px;\nwhite-space:nowrap;\nborder-color: #DDDDDD;\n}\n"];
  v10 = +[OIXMLAttribute attributeWithName:0x26EC11B98 stringValue:0x26EC18D18];
  [v9 addAttribute:v10];

  [v20 addChild:v9];
  v19 = +[OIXMLElement elementWithType:1];
  [v20 addChild:v19];
  id v11 = +[OIXMLElement elementWithType:18];
  id v21 = v8;
  v22 = v9;
  [v19 addChild:v11];
  while ([(NSMutableArray *)self->mRows count])
  {
    id v12 = [(NSMutableArray *)self->mRows objectAtIndex:0];
    id v13 = [[OIXMLElement alloc] initWithType:21 stringValue:0];
    [v11 addChild:v13];
    if (self->mColumnCount)
    {
      unint64_t v14 = 0;
      do
      {
        if (v14 >= [v12 count])
        {
          v15 = 0;
        }
        else
        {
          v15 = [v12 objectAtIndex:v14];
        }
        if (v15) {
          v16 = v15;
        }
        else {
          v16 = &stru_26EBF24D8;
        }
        objc_super v17 = +[OIXMLElement elementWithType:19 stringValue:v16];
        [(OIXMLElement *)v13 addChild:v17];

        ++v14;
      }
      while (v14 < self->mColumnCount);
    }
    [(NSMutableArray *)self->mRows removeObjectAtIndex:0];

    id v8 = v21;
    v9 = v22;
  }
}

- (CGSize)pageSize
{
  double width = self->mPageSize.width;
  double height = self->mPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mRows, 0);
}

@end