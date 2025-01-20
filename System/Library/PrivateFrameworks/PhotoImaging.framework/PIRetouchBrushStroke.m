@interface PIRetouchBrushStroke
+ (id)dictionaryFromBrushStroke:(id)a3;
- (BOOL)hasSource;
- (BOOL)repairEdges;
- (CGPoint)sourceOffset;
- (int64_t)type;
- (void)setRepairEdges:(BOOL)a3;
- (void)setSourceOffset:(CGPoint)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PIRetouchBrushStroke

- (void)setRepairEdges:(BOOL)a3
{
  self->_repairEdges = a3;
}

- (BOOL)repairEdges
{
  return self->_repairEdges;
}

- (void)setSourceOffset:(CGPoint)a3
{
  self->_sourceOffset = a3;
}

- (CGPoint)sourceOffset
{
  double x = self->_sourceOffset.x;
  double y = self->_sourceOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)hasSource
{
  [(PIRetouchBrushStroke *)self sourceOffset];
  if (v3 == 0.0) {
    return 0;
  }
  [(PIRetouchBrushStroke *)self sourceOffset];
  return v4 != 0.0;
}

+ (id)dictionaryFromBrushStroke:(id)a3
{
  id v4 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___PIRetouchBrushStroke;
  v5 = objc_msgSendSuper2(&v23, sel_dictionaryFromBrushStroke_, v4);
  v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [v4 type];
  v8 = @"RepairML";
  if (v7 != 1) {
    v8 = 0;
  }
  if (v7) {
    v9 = v8;
  }
  else {
    v9 = @"Repair";
  }
  v10 = +[PIRetouchAdjustmentController modeKey];
  [v6 setObject:v9 forKey:v10];

  v11 = objc_opt_new();
  v12 = NSNumber;
  [v4 sourceOffset];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v14 = +[PIRetouchAdjustmentController sourceOffsetXKey];
  [v11 setObject:v13 forKey:v14];

  v15 = NSNumber;
  [v4 sourceOffset];
  v17 = [v15 numberWithDouble:v16];
  v18 = +[PIRetouchAdjustmentController sourceOffsetYKey];
  [v11 setObject:v17 forKey:v18];

  v19 = +[PIRetouchAdjustmentController sourceOffsetKey];
  [v6 setObject:v11 forKey:v19];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "repairEdges"));
  v21 = +[PIRetouchAdjustmentController repairEdgesKey];
  [v6 setObject:v20 forKey:v21];

  return v6;
}

@end