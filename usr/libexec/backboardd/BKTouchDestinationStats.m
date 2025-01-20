@interface BKTouchDestinationStats
- (BKTouchDestinationStats)init;
- (NSMutableIndexSet)pathIndexes;
- (NSMutableIndexSet)touchIdentifiers;
- (NSString)processDescription;
- (void)setPathIndexes:(id)a3;
- (void)setProcessDescription:(id)a3;
- (void)setTouchIdentifiers:(id)a3;
@end

@implementation BKTouchDestinationStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDescription, 0);
  objc_storeStrong((id *)&self->_touchIdentifiers, 0);

  objc_storeStrong((id *)&self->_pathIndexes, 0);
}

- (BKTouchDestinationStats)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKTouchDestinationStats;
  v2 = [(BKTouchDestinationStats *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    pathIndexes = v2->_pathIndexes;
    v2->_pathIndexes = v3;

    v5 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    touchIdentifiers = v2->_touchIdentifiers;
    v2->_touchIdentifiers = v5;
  }
  return v2;
}

- (NSMutableIndexSet)touchIdentifiers
{
  return self->_touchIdentifiers;
}

- (void)setProcessDescription:(id)a3
{
}

- (NSString)processDescription
{
  return self->_processDescription;
}

- (void)setTouchIdentifiers:(id)a3
{
}

- (void)setPathIndexes:(id)a3
{
}

- (NSMutableIndexSet)pathIndexes
{
  return self->_pathIndexes;
}

@end