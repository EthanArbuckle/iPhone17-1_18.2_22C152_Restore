@interface UPResultRootNode
- (NSArray)directLeafNodes;
- (NSArray)intermediateNodes;
- (UPResultRootNode)initWithLabel:(id)a3 intermediateNodes:(id)a4 directLeafNodes:(id)a5;
- (id)_dictionaryRepresentation;
@end

@implementation UPResultRootNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directLeafNodes, 0);
  objc_storeStrong((id *)&self->_intermediateNodes, 0);
}

- (NSArray)directLeafNodes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)intermediateNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)_dictionaryRepresentation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = [(UPResultRootNode *)self directLeafNodes];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v5 = [(UPResultRootNode *)self directLeafNodes];
    v3 = (void *)[v4 initWithArray:v5 copyItems:0];

    if ([v3 count])
    {
      unint64_t v6 = 0;
      do
      {
        v7 = [v3 objectAtIndexedSubscript:v6];
        v8 = [v7 _dictionaryRepresentation];
        [v3 replaceObjectAtIndex:v6 withObject:v8];

        ++v6;
      }
      while ([v3 count] > v6);
    }
  }
  v14[0] = @"label";
  v9 = [(UPResultNode *)self label];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = @"directLeafNodes";
  v15[0] = v10;
  v11 = v3;
  if (!v3)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  if (v3)
  {
    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_11;
    }
  }

LABEL_11:
  return v12;
}

- (UPResultRootNode)initWithLabel:(id)a3 intermediateNodes:(id)a4 directLeafNodes:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UPResultRootNode;
  v11 = [(UPResultNode *)&v14 initWithLabel:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_intermediateNodes, a4);
    objc_storeStrong((id *)&v12->_directLeafNodes, a5);
  }

  return v12;
}

@end