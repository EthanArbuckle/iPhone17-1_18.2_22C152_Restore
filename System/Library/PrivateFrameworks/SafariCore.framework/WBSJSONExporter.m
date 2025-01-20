@interface WBSJSONExporter
+ (NSString)dataType;
+ (unint64_t)schemaVersion;
- (WBSJSONExporter)initWithFileHandle:(id)a3 error:(id *)a4;
- (WBSJSONExporter)initWithJSONWriter:(id)a3 error:(id *)a4;
- (WBSJSONExporter)initWithURL:(id)a3 error:(id *)a4;
- (WBSJSONWriter)jsonWriter;
- (void)finishWithCompletionHandler:(id)a3;
@end

@implementation WBSJSONExporter

- (WBSJSONExporter)initWithURL:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", a3, 1537, 416, a4);
  if (v6)
  {
    self = [(WBSJSONExporter *)self initWithFileHandle:v6 error:a4];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WBSJSONExporter)initWithFileHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[WBSJSONWriter alloc] initWithFileHandle:v6 options:11];

  v8 = [(WBSJSONExporter *)self initWithJSONWriter:v7 error:a4];
  return v8;
}

- (WBSJSONExporter)initWithJSONWriter:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSJSONExporter;
  v8 = [(WBSJSONExporter *)&v16 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v8->_jsonWriter, a3);
  if (![v7 beginObjectWithError:a4]) {
    goto LABEL_5;
  }
  v10 = [(id)objc_opt_class() dataType];
  uint64_t v11 = [(id)objc_opt_class() schemaVersion];
  v12 = WBSCreateExportMetadataDictionary(v10, v11);
  int v13 = [v7 addEntry:v12 forKey:@"metadata" error:a4];

  if (v13) {
    v14 = v9;
  }
  else {
LABEL_5:
  }
    v14 = 0;

  return v14;
}

+ (NSString)dataType
{
  return 0;
}

+ (unint64_t)schemaVersion
{
  return 0;
}

- (void)finishWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v5 = [(WBSJSONExporter *)self jsonWriter];
  id v7 = 0;
  [v5 finishEncodingWithError:&v7];
  id v6 = v7;

  if (v4) {
    v4[2](v4, v6);
  }
}

- (WBSJSONWriter)jsonWriter
{
  return self->_jsonWriter;
}

- (void).cxx_destruct
{
}

@end