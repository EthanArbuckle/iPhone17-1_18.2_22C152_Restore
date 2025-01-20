@interface _CNVCardParsingSerialStrategy
- (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5;
@end

@implementation _CNVCardParsingSerialStrategy

- (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CNVCardParser alloc] initWithData:v9 options:v8];

  if (v10)
  {
    v11 = [(CNVCardParser *)v10 resultsWithFactory:v7];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

@end