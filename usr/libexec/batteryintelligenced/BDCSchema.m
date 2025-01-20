@interface BDCSchema
+ (id)sharedBDCSchema;
- (BDCSchema)init;
- (id)bdcNameForColumnName:(id)a3 atVersion:(id)a4;
- (id)bdcStreamNameforKey:(id)a3 atVersion:(id)a4;
- (int)columnIndexForColumnName:(id)a3 atVersion:(id)a4;
- (int)maxColumnIndexForBDCStream:(id)a3 atVersion:(id)a4;
@end

@implementation BDCSchema

+ (id)sharedBDCSchema
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017B44;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_1000396F0 != -1) {
    dispatch_once(&qword_1000396F0, block);
  }
  v2 = (void *)qword_1000396E8;

  return v2;
}

- (BDCSchema)init
{
  v11.receiver = self;
  v11.super_class = (Class)BDCSchema;
  v2 = [(BDCSchema *)&v11 init];
  if (v2)
  {
    CFStringRef v22 = @"1.3";
    v20[0] = @"timestamp";
    v18[0] = @"StreamName";
    v18[1] = @"ColumnName";
    v19[0] = @"BDC_SBC";
    v19[1] = @"timestamp";
    v18[2] = @"ColumnIndexinCSV";
    v18[3] = @"DataType";
    v19[2] = &off_100033A78;
    v19[3] = &off_100033A90;
    v10 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    v21[0] = v10;
    v20[1] = @"uisoc";
    v16[0] = @"StreamName";
    v16[1] = @"ColumnName";
    v17[0] = @"BDC_SBC";
    v17[1] = @"CurrentCapacity";
    v16[2] = @"ColumnIndexinCSV";
    v16[3] = @"DataType";
    v17[2] = &off_100033AA8;
    v17[3] = &off_100033AC0;
    v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    v20[2] = @"temp";
    v21[1] = v3;
    v15[0] = @"BDC_SBC";
    v15[1] = @"Temperature";
    v14[0] = @"StreamName";
    v14[1] = @"ColumnName";
    v14[2] = @"ColumnIndexinCSV";
    v14[3] = @"DataType";
    v15[2] = &off_100033AD8;
    v15[3] = &off_100033AC0;
    v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
    v21[2] = v4;
    v20[3] = @"amperage";
    v12[0] = @"StreamName";
    v12[1] = @"ColumnName";
    v13[0] = @"BDC_SBC";
    v13[1] = @"Amperage";
    v12[2] = @"ColumnIndexinCSV";
    v12[3] = @"DataType";
    v13[2] = &off_100033AF0;
    v13[3] = &off_100033AC0;
    v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
    v20[4] = @"maxColumnIdx";
    v21[3] = v5;
    v21[4] = &off_100033B08;
    v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
    v23 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    versionSchemaMap = v2->_versionSchemaMap;
    v2->_versionSchemaMap = (NSDictionary *)v7;
  }
  return v2;
}

- (id)bdcStreamNameforKey:(id)a3 atVersion:(id)a4
{
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_versionSchemaMap;
  id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isEqualToString:", v5, (void)v14))
        {
          v12 = [(NSDictionary *)self->_versionSchemaMap objectForKeyedSubscript:v5];
          objc_super v11 = [v12 objectForKeyedSubscript:@"StreamName"];

          goto LABEL_11;
        }
      }
      id v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  objc_super v11 = 0;
LABEL_11:

  return v11;
}

- (int)maxColumnIndexForBDCStream:(id)a3 atVersion:(id)a4
{
  id v6 = a4;
  if ([a3 isEqual:@"BDC_SBC"]
    && ([(NSDictionary *)self->_versionSchemaMap objectForKeyedSubscript:v6],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    uint64_t v9 = [v7 objectForKeyedSubscript:@"maxColumnIdx"];
    int v10 = [v9 intValue];
  }
  else
  {
    int v10 = -1;
  }

  return v10;
}

- (int)columnIndexForColumnName:(id)a3 atVersion:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_versionSchemaMap objectForKeyedSubscript:a4];
  id v8 = v7;
  if (v7
    && ([v7 objectForKeyedSubscript:v6], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v10 = v9;
    objc_super v11 = [v9 objectForKeyedSubscript:@"ColumnIndexinCSV"];
    int v12 = [v11 intValue];
  }
  else
  {
    int v12 = -1;
  }

  return v12;
}

- (id)bdcNameForColumnName:(id)a3 atVersion:(id)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_versionSchemaMap objectForKeyedSubscript:a4];
  id v8 = v7;
  if (v7
    && ([v7 objectForKeyedSubscript:v6], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v10 = v9;
    objc_super v11 = [v9 objectForKeyedSubscript:@"ColumnName"];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end