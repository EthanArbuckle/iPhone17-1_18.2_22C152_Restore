@interface UPResultNode
- (NSString)label;
- (UPResultNode)initWithLabel:(id)a3;
- (id)_dictionaryRepresentation;
@end

@implementation UPResultNode

- (void).cxx_destruct
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"label";
  v2 = [(UPResultNode *)self label];
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (UPResultNode)initWithLabel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UPResultNode;
  v6 = [(UPResultNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_label, a3);
  }

  return v7;
}

@end