@interface WBSSQLiteRowEnumerator
- (WBSSQLiteRowEnumerator)initWithResultsOfStatement:(id)a3;
- (WBSSQLiteStatement)statement;
- (id)nextObject;
- (int)lastResultCode;
@end

@implementation WBSSQLiteRowEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_statement, 0);
}

- (id)nextObject
{
  int v3 = sqlite3_step([(WBSSQLiteStatement *)self->_statement handle]);
  v4 = 0;
  self->_lastResultCode = v3;
  if (v3 && v3 != 101)
  {
    if (v3 == 100)
    {
      row = self->_row;
      if (!row)
      {
        v6 = [[WBSSQLiteRow alloc] initWithCurrentRowOfEnumerator:self];
        v7 = self->_row;
        self->_row = v6;

        row = self->_row;
      }
      v4 = row;
    }
    else
    {
      v8 = [(WBSSQLiteStatement *)self->_statement database];
      objc_msgSend(v8, "reportErrorWithCode:statement:error:", self->_lastResultCode, -[WBSSQLiteStatement handle](self->_statement, "handle"), 0);

      v4 = 0;
    }
  }
  return v4;
}

- (WBSSQLiteStatement)statement
{
  return self->_statement;
}

- (WBSSQLiteRowEnumerator)initWithResultsOfStatement:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSQLiteRowEnumerator;
  v6 = [(WBSSQLiteRowEnumerator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statement, a3);
    v8 = v7;
  }

  return v7;
}

- (int)lastResultCode
{
  return self->_lastResultCode;
}

@end