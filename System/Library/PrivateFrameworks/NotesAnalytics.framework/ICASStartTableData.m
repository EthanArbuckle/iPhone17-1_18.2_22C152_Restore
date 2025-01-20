@interface ICASStartTableData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASStartTableData)initWithStartingRowCount:(id)a3 startingColumnCount:(id)a4;
- (NSNumber)startingColumnCount;
- (NSNumber)startingRowCount;
- (id)toDict;
@end

@implementation ICASStartTableData

- (ICASStartTableData)initWithStartingRowCount:(id)a3 startingColumnCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASStartTableData;
  v9 = [(ICASStartTableData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingRowCount, a3);
    objc_storeStrong((id *)&v10->_startingColumnCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"StartTableData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"startingRowCount";
  v3 = [(ICASStartTableData *)self startingRowCount];
  if (v3)
  {
    uint64_t v4 = [(ICASStartTableData *)self startingRowCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"startingColumnCount";
  v12[0] = v4;
  v6 = [(ICASStartTableData *)self startingColumnCount];
  if (v6)
  {
    uint64_t v7 = [(ICASStartTableData *)self startingColumnCount];
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

- (NSNumber)startingRowCount
{
  return self->_startingRowCount;
}

- (NSNumber)startingColumnCount
{
  return self->_startingColumnCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingColumnCount, 0);
  objc_storeStrong((id *)&self->_startingRowCount, 0);
}

@end