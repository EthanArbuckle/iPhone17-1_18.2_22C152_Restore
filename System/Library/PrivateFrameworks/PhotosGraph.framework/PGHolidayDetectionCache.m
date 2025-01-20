@interface PGHolidayDetectionCache
- (NSArray)holidayDateNodes;
- (NSArray)negativelyClassifiedMomentNodes;
- (NSArray)positivelyClassifiedMomentNodes;
- (PGHolidayDetectionCache)init;
- (void)addHolidayWithDateNode:(id)a3;
- (void)addNegativelyClassifiedMomentNode:(id)a3;
- (void)addPositivelyClassifiedMomentNode:(id)a3;
@end

@implementation PGHolidayDetectionCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativelyClassifiedMomentNodes, 0);
  objc_storeStrong((id *)&self->_positivelyClassifiedMomentNodes, 0);
  objc_storeStrong((id *)&self->_holidayDateNodes, 0);
}

- (NSArray)negativelyClassifiedMomentNodes
{
  return &self->_negativelyClassifiedMomentNodes->super;
}

- (NSArray)positivelyClassifiedMomentNodes
{
  return &self->_positivelyClassifiedMomentNodes->super;
}

- (NSArray)holidayDateNodes
{
  return &self->_holidayDateNodes->super;
}

- (void)addNegativelyClassifiedMomentNode:(id)a3
{
}

- (void)addPositivelyClassifiedMomentNode:(id)a3
{
}

- (void)addHolidayWithDateNode:(id)a3
{
}

- (PGHolidayDetectionCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)PGHolidayDetectionCache;
  v2 = [(PGHolidayDetectionCache *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    holidayDateNodes = v2->_holidayDateNodes;
    v2->_holidayDateNodes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    positivelyClassifiedMomentNodes = v2->_positivelyClassifiedMomentNodes;
    v2->_positivelyClassifiedMomentNodes = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    negativelyClassifiedMomentNodes = v2->_negativelyClassifiedMomentNodes;
    v2->_negativelyClassifiedMomentNodes = v7;
  }
  return v2;
}

@end