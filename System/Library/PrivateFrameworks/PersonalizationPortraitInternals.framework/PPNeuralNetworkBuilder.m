@interface PPNeuralNetworkBuilder
- (PPNeuralNetworkBuilder)initWithInputSize:(unint64_t)a3;
- (id)serialize;
- (void)addHiddenLayer:(unint64_t)a3 weights:(const float *)a4 bias:(const float *)a5 activation:(unsigned __int8)a6 skip:(BOOL)a7;
- (void)addOutputLayer:(unint64_t)a3 weights:(const float *)a4 bias:(const float *)a5 activation:(unsigned __int8)a6 softmax:(BOOL)a7;
@end

@implementation PPNeuralNetworkBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightsAndBiases, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

- (id)serialize
{
  if (!self->_haveOutputLayer)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PPNeuralNetwork.m", 247, @"Invalid parameter not satisfying: %@", @"_haveOutputLayer" object file lineNumber description];
  }
  if (self->_done)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PPNeuralNetwork.m", 248, @"Invalid parameter not satisfying: %@", @"!_done" object file lineNumber description];
  }
  v4 = objc_opt_new();
  int nlayers = self->_nlayers;
  [v4 appendBytes:&nlayers length:4];
  [v4 appendData:self->_descriptors];
  if (self->_nlayers)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      v8 = [(NSMutableArray *)self->_weightsAndBiases objectAtIndexedSubscript:v7];
      int v9 = offsetFromAppendingData(v4, v8);

      v10 = [(NSMutableArray *)self->_weightsAndBiases objectAtIndexedSubscript:v7 + 1];
      int v11 = offsetFromAppendingData(v4, v10);

      uint64_t v12 = [v4 mutableBytes] + v5;
      *(_DWORD *)(v12 + 12) = v9;
      *(_DWORD *)(v12 + 16) = v11;
      ++v6;
      v5 += 20;
      v7 += 2;
    }
    while (v6 < self->_nlayers);
  }
  self->_done = 1;
  return v4;
}

- (void)addOutputLayer:(unint64_t)a3 weights:(const float *)a4 bias:(const float *)a5 activation:(unsigned __int8)a6 softmax:(BOOL)a7
{
  unsigned int v11 = a3;
  if (self->_haveOutputLayer)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PPNeuralNetwork.m", 217, @"Invalid parameter not satisfying: %@", @"!_haveOutputLayer" object file lineNumber description];
  }
  if (self->_done)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PPNeuralNetwork.m", 218, @"Invalid parameter not satisfying: %@", @"!_done" object file lineNumber description];
  }
  int prevSize = self->_prevSize;
  unsigned int v23 = v11;
  int v24 = 0;
  int v25 = 0;
  unsigned __int8 v26 = a6;
  char v27 = 0;
  BOOL v28 = a7;
  char v29 = 0;
  [(NSMutableData *)self->_descriptors appendBytes:&prevSize length:20];
  weightsAndBiases = self->_weightsAndBiases;
  id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v16 = (void *)[v15 initWithBytes:a4 length:4 * v23 * prevSize];
  [(NSMutableArray *)weightsAndBiases addObject:v16];

  v17 = self->_weightsAndBiases;
  id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v19 = (void *)[v18 initWithBytes:a5 length:4 * v23];
  [(NSMutableArray *)v17 addObject:v19];

  ++self->_nlayers;
  self->_haveOutputLayer = 1;
}

- (void)addHiddenLayer:(unint64_t)a3 weights:(const float *)a4 bias:(const float *)a5 activation:(unsigned __int8)a6 skip:(BOOL)a7
{
  BOOL v7 = a7;
  if (self->_done)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PPNeuralNetwork.m", 198, @"Invalid parameter not satisfying: %@", @"!_done" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  else if (a3)
  {
    goto LABEL_3;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PPNeuralNetwork.m", 199, @"Invalid parameter not satisfying: %@", @"outputSize > 0" object file lineNumber description];

LABEL_3:
  unint64_t prevSize = self->_prevSize;
  int v23 = prevSize;
  unsigned int v24 = a3;
  int v25 = 0;
  int v26 = 0;
  unsigned __int8 v27 = a6;
  BOOL v28 = v7;
  __int16 v29 = 0;
  if (!v7) {
    unint64_t prevSize = 0;
  }
  self->_unint64_t prevSize = prevSize + a3;
  [(NSMutableData *)self->_descriptors appendBytes:&v23 length:20];
  weightsAndBiases = self->_weightsAndBiases;
  id v16 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v17 = (void *)[v16 initWithBytes:a4 length:4 * v24 * v23];
  [(NSMutableArray *)weightsAndBiases addObject:v17];

  id v18 = self->_weightsAndBiases;
  id v19 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v20 = (void *)[v19 initWithBytes:a5 length:4 * v24];
  [(NSMutableArray *)v18 addObject:v20];

  ++self->_nlayers;
}

- (PPNeuralNetworkBuilder)initWithInputSize:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PPNeuralNetworkBuilder;
  v4 = [(PPNeuralNetworkBuilder *)&v11 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t prevSize = a3;
    v4->_int nlayers = 0;
    uint64_t v6 = objc_opt_new();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSMutableData *)v6;

    uint64_t v8 = objc_opt_new();
    weightsAndBiases = v5->_weightsAndBiases;
    v5->_weightsAndBiases = (NSMutableArray *)v8;

    *(_WORD *)&v5->_haveOutputLayer = 0;
  }
  return v5;
}

@end