@interface TSTTableStrokePresetData
- (BOOL)isEqual:(id)a3;
- (TSDStroke)exteriorStroke;
- (TSDStroke)horizontalStroke;
- (TSDStroke)verticalStroke;
- (TSTTableStrokePresetData)init;
- (TSTTableStrokePresetData)initWithMask:(unsigned int)a3 horizontalStroke:(id)a4 verticalStroke:(id)a5 exteriorStroke:(id)a6;
- (unsigned)mask;
- (void)dealloc;
- (void)setExteriorStroke:(id)a3;
- (void)setHorizontalStroke:(id)a3;
- (void)setMask:(unsigned int)a3;
- (void)setVerticalStroke:(id)a3;
@end

@implementation TSTTableStrokePresetData

- (TSTTableStrokePresetData)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableStrokePresetData;
  return [(TSTTableStrokePresetData *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableStrokePresetData;
  [(TSTTableStrokePresetData *)&v3 dealloc];
}

- (TSTTableStrokePresetData)initWithMask:(unsigned int)a3 horizontalStroke:(id)a4 verticalStroke:(id)a5 exteriorStroke:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)TSTTableStrokePresetData;
  v10 = [(TSTTableStrokePresetData *)&v12 init];
  if (v10)
  {
    v10->mVerticalStroke = (TSDStroke *)a5;
    v10->mHorizontalStroke = (TSDStroke *)a4;
    v10->mExteriorStroke = (TSDStroke *)a6;
    v10->mVisibleMask = a3;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  return self->mHorizontalStroke == (TSDStroke *)*((void *)a3 + 1)
      && self->mVerticalStroke == (TSDStroke *)*((void *)a3 + 2)
      && self->mExteriorStroke == (TSDStroke *)*((void *)a3 + 3)
      && self->mVisibleMask == *((_DWORD *)a3 + 8);
}

- (TSDStroke)horizontalStroke
{
  return self->mHorizontalStroke;
}

- (void)setHorizontalStroke:(id)a3
{
}

- (TSDStroke)verticalStroke
{
  return self->mVerticalStroke;
}

- (void)setVerticalStroke:(id)a3
{
}

- (TSDStroke)exteriorStroke
{
  return self->mExteriorStroke;
}

- (void)setExteriorStroke:(id)a3
{
}

- (unsigned)mask
{
  return self->mVisibleMask;
}

- (void)setMask:(unsigned int)a3
{
  self->mVisibleMask = a3;
}

@end