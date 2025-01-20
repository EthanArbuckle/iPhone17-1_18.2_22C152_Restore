@interface ICASEndTableData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEndTableData)initWithEndingRowCount:(id)a3 endingColumnCount:(id)a4;
- (NSNumber)endingColumnCount;
- (NSNumber)endingRowCount;
- (id)toDict;
@end

@implementation ICASEndTableData

- (ICASEndTableData)initWithEndingRowCount:(id)a3 endingColumnCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASEndTableData;
  v9 = [(ICASEndTableData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endingRowCount, a3);
    objc_storeStrong((id *)&v10->_endingColumnCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"EndTableData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"endingRowCount";
  v3 = [(ICASEndTableData *)self endingRowCount];
  if (v3)
  {
    uint64_t v4 = [(ICASEndTableData *)self endingRowCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"endingColumnCount";
  v12[0] = v4;
  v6 = [(ICASEndTableData *)self endingColumnCount];
  if (v6)
  {
    uint64_t v7 = [(ICASEndTableData *)self endingColumnCount];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)endingRowCount
{
  return self->_endingRowCount;
}

- (NSNumber)endingColumnCount
{
  return self->_endingColumnCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingColumnCount, 0);
  objc_storeStrong((id *)&self->_endingRowCount, 0);
}

@end