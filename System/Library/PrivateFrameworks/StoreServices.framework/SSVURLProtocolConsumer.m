@interface SSVURLProtocolConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SSVURLProtocolConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = 0;
    goto LABEL_13;
  }
  v8 = [a4 MIMEType];
  v9 = v8;
  BOOL v10 = v8 != 0;
  if (v8 && [v8 rangeOfString:@"application/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  id v17 = 0;
  v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v17];
  id v11 = v17;
  if (!v10)
  {
LABEL_6:
    if (!v12)
    {
      id v16 = 0;
      v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v16];
      id v13 = v16;

      id v11 = v13;
    }
  }
  if (a5 && !v12) {
    *a5 = v11;
  }
  id v14 = v12;

LABEL_13:
  return v14;
}

@end