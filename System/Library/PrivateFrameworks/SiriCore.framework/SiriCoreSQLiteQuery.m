@interface SiriCoreSQLiteQuery
- (NSArray)parameters;
- (NSString)string;
- (SiriCoreSQLiteQuery)initWithString:(id)a3 statement:(id)a4 parameters:(id)a5 recordBuilder:(id)a6 options:(unint64_t)a7;
- (SiriCoreSQLiteRecordBuilder)recordBuilder;
- (SiriCoreSQLiteStatement)statement;
- (id)description;
- (unint64_t)options;
@end

@implementation SiriCoreSQLiteQuery

- (unint64_t)options
{
  return self->_options;
}

- (SiriCoreSQLiteQuery)initWithString:(id)a3 statement:(id)a4 parameters:(id)a5 recordBuilder:(id)a6 options:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SiriCoreSQLiteQuery;
  v16 = [(SiriCoreSQLiteQuery *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    string = v16->_string;
    v16->_string = (NSString *)v17;

    objc_storeStrong((id *)&v16->_statement, a4);
    uint64_t v19 = [v14 copy];
    parameters = v16->_parameters;
    v16->_parameters = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_recordBuilder, a6);
    v16->_options = a7;
  }

  return v16;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBuilder, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_statement, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

- (SiriCoreSQLiteStatement)statement
{
  return self->_statement;
}

- (SiriCoreSQLiteRecordBuilder)recordBuilder
{
  return self->_recordBuilder;
}

- (NSString)string
{
  return self->_string;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SiriCoreSQLiteQuery;
  v4 = [(SiriCoreSQLiteQuery *)&v15 description];
  string = self->_string;
  parameters = self->_parameters;
  unint64_t options = self->_options;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = v8;
  if ((options & 2) != 0)
  {
    [v8 addObject:@"includesColumnNameTuple"];
    if ((options & 4) == 0)
    {
LABEL_3:
      if ((options & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((options & 4) == 0)
  {
    goto LABEL_3;
  }
  [v9 addObject:@"includesColumnValueTuples"];
  if ((options & 8) == 0)
  {
LABEL_4:
    if ((options & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v9 addObject:@"includesColumnValuesMap"];
  if ((options & 0x10) == 0)
  {
LABEL_5:
    if ((options & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v9 addObject:@"includesRowValueTuples"];
  if ((options & 0x20) == 0)
  {
LABEL_6:
    if ((options & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  [v9 addObject:@"includesRowValueMaps"];
  if ((options & 0x40) != 0) {
LABEL_7:
  }
    [v9 addObject:@"includesRecords"];
LABEL_8:
  if ([v9 count])
  {
    v10 = NSString;
    v11 = [v9 componentsJoinedByString:@"|"];
    id v12 = [v10 stringWithFormat:@"(%@)", v11];
  }
  else
  {
    id v12 = @"0";
  }

  id v13 = [v3 stringWithFormat:@"%@ {string = %@, parameters = %@, options = %@}", v4, string, parameters, v12];

  return v13;
}

@end