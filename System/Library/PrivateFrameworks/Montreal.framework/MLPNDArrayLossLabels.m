@interface MLPNDArrayLossLabels
- (MLPNDArrayLossLabels)init;
- (NSArray)labels;
- (NSMutableArray)largeReductionSumResult;
- (NSMutableArray)smallReductionSumResult;
- (void)setLabels:(id)a3;
- (void)setLargeReductionSumResult:(id)a3;
- (void)setSmallReductionSumResult:(id)a3;
@end

@implementation MLPNDArrayLossLabels

- (MLPNDArrayLossLabels)init
{
  v14.receiver = self;
  v14.super_class = (Class)MLPNDArrayLossLabels;
  v5 = [(MLPNDArrayLossLabels *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3, v4);
    largeReductionSumResult = v5->_largeReductionSumResult;
    v5->_largeReductionSumResult = (NSMutableArray *)v6;

    uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
    smallReductionSumResult = v5->_smallReductionSumResult;
    v5->_smallReductionSumResult = (NSMutableArray *)v11;
  }
  return v5;
}

- (NSMutableArray)largeReductionSumResult
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLargeReductionSumResult:(id)a3
{
}

- (NSMutableArray)smallReductionSumResult
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSmallReductionSumResult:(id)a3
{
}

- (NSArray)labels
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_smallReductionSumResult, 0);

  objc_storeStrong((id *)&self->_largeReductionSumResult, 0);
}

@end