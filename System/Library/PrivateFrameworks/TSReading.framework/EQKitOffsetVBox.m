@interface EQKitOffsetVBox
- (BOOL)isEqual:(id)a3;
- (EQKitOffsetVBox)init;
- (EQKitOffsetVBox)initWithChildBoxes:(id)a3;
- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4;
- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4 offset:(double)a5;
- (double)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
@end

@implementation EQKitOffsetVBox

- (EQKitOffsetVBox)init
{
  return [(EQKitOffsetVBox *)self initWithChildBoxes:0 pivotIndex:0 offset:0.0];
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3
{
  return [(EQKitOffsetVBox *)self initWithChildBoxes:a3 pivotIndex:0 offset:0.0];
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  return -[EQKitOffsetVBox initWithChildBoxes:pivotIndex:offset:](self, "initWithChildBoxes:pivotIndex:offset:", a3, (double)a4);
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4 offset:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)EQKitOffsetVBox;
  result = [(EQKitVBox *)&v7 initWithChildBoxes:a3 pivotIndex:a4];
  if (result) {
    result->mOffset = a5;
  }
  return result;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitOffsetVBox;
  [(EQKitVBox *)&v8 p_cacheDimensionsForHeight:a3 depth:a4 width:a5];
  if (a3) {
    *a3 = self->mOffset + *a3;
  }
  if (a4) {
    *a4 = *a4 - self->mOffset;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitCompoundBox *)self childBoxes];
  unint64_t v6 = [(EQKitVBox *)self pivotIndex];
  [(EQKitOffsetVBox *)self offset];

  return (id)objc_msgSend(v4, "initWithChildBoxes:pivotIndex:offset:", v5, v6);
}

- (BOOL)isEqual:(id)a3
{
  v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        uint64_t v6 = [(EQKitVBox *)v3 pivotIndex];
        if (v6 == [a3 pivotIndex]
          && (-[EQKitOffsetVBox offset](v3, "offset"), double v8 = v7, [a3 offset], v8 == v9))
        {
          v10 = [(EQKitCompoundBox *)v3 childBoxes];
          self = (EQKitOffsetVBox *)[a3 childBoxes];
          if (v10 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v11 = self;
            LOBYTE(self) = 0;
            if (v10 && v11)
            {
              LOBYTE(self) = -[EQKitOffsetVBox isEqual:](v10, "isEqual:");
            }
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitCompoundBox *)self height];
  uint64_t v6 = v5;
  [(EQKitCompoundBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitCompoundBox *)self width];
  uint64_t v10 = v9;
  v11 = [(EQKitCompoundBox *)self childBoxes];
  unint64_t v12 = [(EQKitVBox *)self pivotIndex];
  [(EQKitOffsetVBox *)self offset];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu offset=%f", v4, self, v6, v8, v10, v11, v12, v13];
}

- (double)offset
{
  return self->mOffset;
}

@end