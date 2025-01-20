@interface calibrationInput
- (MLMultiArray)document_embedding;
- (MLMultiArray)query_embedding;
- (NSSet)featureNames;
- (calibrationInput)initWithQuery_embedding:(id)a3 document_embedding:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setDocument_embedding:(id)a3;
- (void)setQuery_embedding:(id)a3;
@end

@implementation calibrationInput

- (calibrationInput)initWithQuery_embedding:(id)a3 document_embedding:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)calibrationInput;
  v9 = [(calibrationInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query_embedding, a3);
    objc_storeStrong((id *)&v10->_document_embedding, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F18643B8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"query_embedding"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(calibrationInput *)self query_embedding];
LABEL_5:
    id v7 = (void *)v6;
    id v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"document_embedding"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(calibrationInput *)self document_embedding];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (MLMultiArray)query_embedding
{
  return self->_query_embedding;
}

- (void)setQuery_embedding:(id)a3
{
}

- (MLMultiArray)document_embedding
{
  return self->_document_embedding;
}

- (void)setDocument_embedding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document_embedding, 0);
  objc_storeStrong((id *)&self->_query_embedding, 0);
}

@end