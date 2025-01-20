@interface UPResultLeafNode
- (NSString)semanticValue;
- (NSString)text;
- (UPResultLeafNode)initWithLabel:(id)a3 andText:(id)a4 andSemanticValue:(id)a5;
- (id)_dictionaryRepresentation;
@end

@implementation UPResultLeafNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)semanticValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"label";
  v3 = [(UPResultNode *)self label];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"text";
  v5 = [(UPResultLeafNode *)self text];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"semanticValue";
  v7 = [(UPResultLeafNode *)self semanticValue];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (UPResultLeafNode)initWithLabel:(id)a3 andText:(id)a4 andSemanticValue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UPResultLeafNode;
  v11 = [(UPResultNode *)&v14 initWithLabel:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a4);
    objc_storeStrong((id *)&v12->_semanticValue, a5);
  }

  return v12;
}

@end