@interface TIFitAffineMLLMatrixWrapper
- (CGPoint)transformedPoint:(CGPoint)a3;
- (TIFitAffineMLLMatrixWrapper)init;
- (void)calcMatrix;
- (void)dealloc;
- (void)setMatrix:(void *)a3;
- (void)setRotation:(double)a3;
- (void)setSkewRotation:(double)a3;
- (void)setXScale:(double)a3 yScale:(double)a4;
- (void)setXTrans:(double)a3 yTrans:(double)a4;
@end

@implementation TIFitAffineMLLMatrixWrapper

- (CGPoint)transformedPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v12[3] = *MEMORY[0x263EF8340];
  [(TIFitAffineMLLMatrixWrapper *)self calcMatrix];
  *(CGFloat *)v12 = x;
  *(CGFloat *)&v12[1] = y;
  v12[2] = 0x3FF0000000000000;
  MEMORY[0x2455C21A0](v9, 3, 1, v12, 3);
  TIFitAffineMLLMatrix::operator*();
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v9[3]);
  double v5 = *(double *)MEMORY[0x2455C21B0](v10, 0, 0);
  double v6 = *(double *)MEMORY[0x2455C21B0](v10, 1, 0);
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v11);
  double v7 = v5;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (void)calcMatrix
{
  v12[5] = *MEMORY[0x263EF8340];
  if (!self->_pMatrix)
  {
    pScaleMatriCGFloat x = (const TIFitAffineMLLMatrix *)self->_pScaleMatrix;
    if (pScaleMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v11, pScaleMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)2);
    }
    pRotationMatriCGFloat x = (const TIFitAffineMLLMatrix *)self->_pRotationMatrix;
    if (pRotationMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v10, pRotationMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)2);
    }
    pSkewMatriCGFloat x = (const TIFitAffineMLLMatrix *)self->_pSkewMatrix;
    if (pSkewMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v9, pSkewMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)2);
    }
    pTransMatriCGFloat x = (const TIFitAffineMLLMatrix *)self->_pTransMatrix;
    if (pTransMatrix)
    {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v8, pTransMatrix);
    }
    else
    {
      v12[0] = 0;
      v12[1] = 0;
      MEMORY[0x2455C21A0](v8, 2, 1, v12, 2);
    }
    TIFitAffineMLLMatrix::operator*();
    TIFitAffineMLLMatrix::operator*();
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v7);
    operator new();
  }
}

- (void)setXTrans:(double)a3 yTrans:(double)a4
{
  pMatriCGFloat x = (void **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2455C26F0](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatriCGFloat x = 0;
  pTransMatriCGFloat x = (void **)self->_pTransMatrix;
  if (pTransMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pTransMatrix[3]);
    MEMORY[0x2455C26F0](pTransMatrix, 0x1020C40FAF5D19FLL);
  }
  operator new();
}

- (void)setSkewRotation:(double)a3
{
  pMatriCGFloat x = (void **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2455C26F0](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatriCGFloat x = 0;
  pSkewMatriCGFloat x = (void **)self->_pSkewMatrix;
  if (pSkewMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pSkewMatrix[3]);
    MEMORY[0x2455C26F0](pSkewMatrix, 0x1020C40FAF5D19FLL);
  }
  operator new();
}

- (void)setRotation:(double)a3
{
  pMatriCGFloat x = (void **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2455C26F0](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatriCGFloat x = 0;
  pRotationMatriCGFloat x = (void **)self->_pRotationMatrix;
  if (pRotationMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pRotationMatrix[3]);
    MEMORY[0x2455C26F0](pRotationMatrix, 0x1020C40FAF5D19FLL);
  }
  __sincos_stret(a3);
  operator new();
}

- (void)setXScale:(double)a3 yScale:(double)a4
{
  pMatriCGFloat x = (void **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2455C26F0](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatriCGFloat x = 0;
  pScaleMatriCGFloat x = (void **)self->_pScaleMatrix;
  if (pScaleMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pScaleMatrix[3]);
    MEMORY[0x2455C26F0](pScaleMatrix, 0x1020C40FAF5D19FLL);
  }
  operator new();
}

- (void)setMatrix:(void *)a3
{
  pMatriCGFloat x = (void **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2455C26F0](pMatrix, 0x1020C40FAF5D19FLL);
  }
  operator new();
}

- (void)dealloc
{
  pMatriCGFloat x = (void **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2455C26F0](pMatrix, 0x1020C40FAF5D19FLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)TIFitAffineMLLMatrixWrapper;
  [(TIFitAffineMLLMatrixWrapper *)&v4 dealloc];
}

- (TIFitAffineMLLMatrixWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIFitAffineMLLMatrixWrapper;
  if ([(TIFitAffineMLLMatrixWrapper *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end