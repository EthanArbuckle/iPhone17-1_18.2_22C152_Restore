@interface SacCellularFreqInfoSet
- (NSMutableArray)mCellularHoppingFreq;
- (NSMutableArray)mCellularNeighborFreqList;
- (NSMutableArray)mCellularPccFreq;
- (NSMutableArray)mCellularRPLMNFreqList;
- (NSMutableArray)mCellularSccFreqList;
- (NSMutableArray)mCellularSearchFreqList;
- (SacCellularFreqInfoSet)init;
- (void)dealloc;
- (void)removeAllFreq;
- (void)setMCellularHoppingFreq:(id)a3;
- (void)setMCellularNeighborFreqList:(id)a3;
- (void)setMCellularPccFreq:(id)a3;
- (void)setMCellularRPLMNFreqList:(id)a3;
- (void)setMCellularSccFreqList:(id)a3;
- (void)setMCellularSearchFreqList:(id)a3;
@end

@implementation SacCellularFreqInfoSet

- (NSMutableArray)mCellularSccFreqList
{
  return self->_mCellularSccFreqList;
}

- (NSMutableArray)mCellularPccFreq
{
  return self->_mCellularPccFreq;
}

- (NSMutableArray)mCellularHoppingFreq
{
  return self->_mCellularHoppingFreq;
}

- (NSMutableArray)mCellularSearchFreqList
{
  return self->_mCellularSearchFreqList;
}

- (NSMutableArray)mCellularRPLMNFreqList
{
  return self->_mCellularRPLMNFreqList;
}

- (NSMutableArray)mCellularNeighborFreqList
{
  return self->_mCellularNeighborFreqList;
}

- (SacCellularFreqInfoSet)init
{
  v16.receiver = self;
  v16.super_class = (Class)SacCellularFreqInfoSet;
  v2 = [(SacCellularFreqInfoSet *)&v16 init];
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularPccFreq = v2->_mCellularPccFreq;
  v2->_mCellularPccFreq = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularSccFreqList = v2->_mCellularSccFreqList;
  v2->_mCellularSccFreqList = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularHoppingFreq = v2->_mCellularHoppingFreq;
  v2->_mCellularHoppingFreq = v7;

  v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularNeighborFreqList = v2->_mCellularNeighborFreqList;
  v2->_mCellularNeighborFreqList = v9;

  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularSearchFreqList = v2->_mCellularSearchFreqList;
  v2->_mCellularSearchFreqList = v11;

  v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mCellularRPLMNFreqList = v2->_mCellularRPLMNFreqList;
  v2->_mCellularRPLMNFreqList = v13;

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SacCellularFreqInfoSet;
  [(SacCellularFreqInfoSet *)&v2 dealloc];
}

- (void)removeAllFreq
{
  [(NSMutableArray *)self->_mCellularPccFreq removeAllObjects];
  [(NSMutableArray *)self->_mCellularSccFreqList removeAllObjects];
  [(NSMutableArray *)self->_mCellularNeighborFreqList removeAllObjects];
  [(NSMutableArray *)self->_mCellularSearchFreqList removeAllObjects];
  mCellularRPLMNFreqList = self->_mCellularRPLMNFreqList;

  [(NSMutableArray *)mCellularRPLMNFreqList removeAllObjects];
}

- (void)setMCellularPccFreq:(id)a3
{
}

- (void)setMCellularSccFreqList:(id)a3
{
}

- (void)setMCellularHoppingFreq:(id)a3
{
}

- (void)setMCellularNeighborFreqList:(id)a3
{
}

- (void)setMCellularSearchFreqList:(id)a3
{
}

- (void)setMCellularRPLMNFreqList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mCellularRPLMNFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularSearchFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularNeighborFreqList, 0);
  objc_storeStrong((id *)&self->_mCellularHoppingFreq, 0);
  objc_storeStrong((id *)&self->_mCellularSccFreqList, 0);

  objc_storeStrong((id *)&self->_mCellularPccFreq, 0);
}

@end