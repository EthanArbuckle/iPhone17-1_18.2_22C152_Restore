@interface _UIKBRTKeyboardTouchObserver
- (CGPoint)fCenter;
- (CGPoint)jCenter;
- (CGSize)keySize;
- (NSArray)rowOffsets;
- (NSArray)rowXEdges;
- (NSArray)rowYEdgesLeft;
- (NSArray)rowYEdgesRight;
- (int)homeRowOffsetIndex;
- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withIdentifier:(id)a5;
- (void)removeTouchWithIdentifier:(id)a3;
- (void)setFCenter:(CGPoint)a3;
- (void)setHomeRowOffsetIndex:(int)a3;
- (void)setJCenter:(CGPoint)a3;
- (void)setKeySize:(CGSize)a3;
- (void)setRowOffsets:(id)a3;
- (void)setRowXEdges:(id)a3;
- (void)setRowYEdgesLeft:(id)a3;
- (void)setRowYEdgesRight:(id)a3;
- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7;
@end

@implementation _UIKBRTKeyboardTouchObserver

- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7
{
  v34[10] = *MEMORY[0x1E4F143B8];
  self->_fCenter = a3;
  self->_jCenter = a4;
  self->_keySize = a5;
  v9 = (NSArray *)[a6 copy];
  rowOffsets = self->_rowOffsets;
  self->_rowOffsets = v9;

  self->_homeRowOffsetIndedouble x = a7;
  double x = self->_fCenter.x;
  double v12 = (x + self->_jCenter.x) * 0.5;
  v33 = [NSNumber numberWithDouble:x - self->_keySize.width * 2.5];
  v34[0] = v33;
  v32 = [NSNumber numberWithDouble:self->_fCenter.x - self->_keySize.width * 1.5];
  v34[1] = v32;
  v13 = [NSNumber numberWithDouble:self->_fCenter.x - self->_keySize.width * 0.5];
  v34[2] = v13;
  v14 = [NSNumber numberWithDouble:self->_fCenter.x + self->_keySize.width * 0.5];
  v34[3] = v14;
  v15 = [NSNumber numberWithDouble:v12];
  v34[4] = v15;
  v16 = [NSNumber numberWithDouble:self->_jCenter.x - self->_keySize.width * 0.5];
  v34[5] = v16;
  v17 = [NSNumber numberWithDouble:self->_jCenter.x + self->_keySize.width * 0.5];
  v34[6] = v17;
  v18 = [NSNumber numberWithDouble:self->_jCenter.x + self->_keySize.width * 1.5];
  v34[7] = v18;
  v19 = [NSNumber numberWithDouble:self->_jCenter.x + self->_keySize.width * 2.5];
  v34[8] = v19;
  v20 = [NSNumber numberWithDouble:v12 + v12];
  v34[9] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:10];
  rowXEdges = self->_rowXEdges;
  self->_rowXEdges = v21;

  v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v25 = -2.0;
  int v26 = 6;
  do
  {
    v27 = [NSNumber numberWithDouble:self->_fCenter.y + (v25 + -0.5) * self->_keySize.height];
    [(NSArray *)v23 addObject:v27];

    v28 = [NSNumber numberWithDouble:self->_jCenter.y + (v25 + -0.5) * self->_keySize.height];
    [(NSArray *)v24 addObject:v28];

    double v25 = v25 + 1.0;
    --v26;
  }
  while (v26);
  rowYEdgesLeft = self->_rowYEdgesLeft;
  self->_rowYEdgesLeft = v23;
  v30 = v23;

  rowYEdgesRight = self->_rowYEdgesRight;
  self->_rowYEdgesRight = v24;
}

- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withIdentifier:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v9 = (void *)MEMORY[0x1E4F28F80];
  id v10 = a5;
  id v12 = [v9 processInfo];
  [v12 systemUptime];
  -[_UIKBRTKeyboardTouchObserver addTouchLocation:withRadius:withTouchTime:withIdentifier:](self, "addTouchLocation:withRadius:withTouchTime:withIdentifier:", v10, x, y, a4, v11);
}

- (void)removeTouchWithIdentifier:(id)a3
{
}

- (CGPoint)fCenter
{
  double x = self->_fCenter.x;
  double y = self->_fCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFCenter:(CGPoint)a3
{
  self->_fCenter = a3;
}

- (CGPoint)jCenter
{
  double x = self->_jCenter.x;
  double y = self->_jCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setJCenter:(CGPoint)a3
{
  self->_jCenter = a3;
}

- (CGSize)keySize
{
  double width = self->_keySize.width;
  double height = self->_keySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setKeySize:(CGSize)a3
{
  self->_keySize = a3;
}

- (NSArray)rowOffsets
{
  return self->_rowOffsets;
}

- (void)setRowOffsets:(id)a3
{
}

- (int)homeRowOffsetIndex
{
  return self->_homeRowOffsetIndex;
}

- (void)setHomeRowOffsetIndex:(int)a3
{
  self->_homeRowOffsetIndedouble x = a3;
}

- (NSArray)rowXEdges
{
  return self->_rowXEdges;
}

- (void)setRowXEdges:(id)a3
{
}

- (NSArray)rowYEdgesLeft
{
  return self->_rowYEdgesLeft;
}

- (void)setRowYEdgesLeft:(id)a3
{
}

- (NSArray)rowYEdgesRight
{
  return self->_rowYEdgesRight;
}

- (void)setRowYEdgesRight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowYEdgesRight, 0);
  objc_storeStrong((id *)&self->_rowYEdgesLeft, 0);
  objc_storeStrong((id *)&self->_rowXEdges, 0);
  objc_storeStrong((id *)&self->_rowOffsets, 0);
}

@end