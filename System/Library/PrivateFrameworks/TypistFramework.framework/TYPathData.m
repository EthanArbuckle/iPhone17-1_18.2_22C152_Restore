@interface TYPathData
- (BOOL)isCursive;
- (NSArray)strokeArray;
- (TYPathData)initWithArray:(id)a3 width:(int64_t)a4 height:(int64_t)a5 isCursive:(BOOL)a6;
- (double)perCharacterScale;
- (int64_t)height;
- (int64_t)width;
- (void)setHeight:(int64_t)a3;
- (void)setIsCursive:(BOOL)a3;
- (void)setPerCharacterScale:(double)a3;
- (void)setStrokeArray:(id)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation TYPathData

- (TYPathData)initWithArray:(id)a3 width:(int64_t)a4 height:(int64_t)a5 isCursive:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TYPathData;
  v11 = [(TYPathData *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(TYPathData *)v11 setStrokeArray:v10];
    [(TYPathData *)v12 setWidth:a4];
    [(TYPathData *)v12 setHeight:a5];
    [(TYPathData *)v12 setIsCursive:v6];
    [(TYPathData *)v12 setPerCharacterScale:1024.0 / (double)a5];
  }

  return v12;
}

- (NSArray)strokeArray
{
  return self->_strokeArray;
}

- (void)setStrokeArray:(id)a3
{
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (BOOL)isCursive
{
  return self->_isCursive;
}

- (void)setIsCursive:(BOOL)a3
{
  self->_isCursive = a3;
}

- (double)perCharacterScale
{
  return self->_perCharacterScale;
}

- (void)setPerCharacterScale:(double)a3
{
  self->_perCharacterScale = a3;
}

- (void).cxx_destruct
{
}

@end