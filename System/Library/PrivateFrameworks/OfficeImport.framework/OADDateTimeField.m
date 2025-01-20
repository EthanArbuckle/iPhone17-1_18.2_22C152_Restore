@interface OADDateTimeField
- (BOOL)isEmpty;
- (BOOL)isSimilarToTextRun:(id)a3;
- (OADDateTimeField)init;
- (int)format;
- (void)setFormat:(int)a3;
@end

@implementation OADDateTimeField

- (OADDateTimeField)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADDateTimeField;
  result = [(OADTextField *)&v3 init];
  if (result) {
    result->_format = -1;
  }
  return result;
}

- (BOOL)isEmpty
{
  if ([(OADDateTimeField *)self format] != -1) {
    return 0;
  }
  v4 = [(OADTextField *)self text];
  BOOL v3 = [v4 length] == 0;

  return v3;
}

- (void)setFormat:(int)a3
{
  self->_format = a3;
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADDateTimeField;
  if ([(OADTextRun *)&v8 isSimilarToTextRun:v4])
  {
    int v5 = [(OADDateTimeField *)self format];
    BOOL v6 = v5 == [v4 format];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int)format
{
  return self->_format;
}

@end