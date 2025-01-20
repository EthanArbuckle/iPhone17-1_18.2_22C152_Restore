@interface RPTChainedCoordinateSpaceConverter
- (CGPoint)convertPoint:(CGPoint)a3;
- (CGRect)convertRect:(CGRect)a3;
- (CGSize)convertSize:(CGSize)a3;
- (CGVector)convertVector:(CGVector)a3;
- (RPTChainedCoordinateSpaceConverter)initWithPrimary:(id)a3 secondary:(id)a4;
- (RPTCoordinateSpaceConverter)primary;
- (RPTCoordinateSpaceConverter)secondary;
- (void)setPrimary:(id)a3;
- (void)setSecondary:(id)a3;
@end

@implementation RPTChainedCoordinateSpaceConverter

- (RPTChainedCoordinateSpaceConverter)initWithPrimary:(id)a3 secondary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPTChainedCoordinateSpaceConverter;
  v9 = [(RPTChainedCoordinateSpaceConverter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primary, a3);
    objc_storeStrong((id *)&v10->_secondary, a4);
  }

  return v10;
}

- (CGPoint)convertPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(RPTChainedCoordinateSpaceConverter *)self secondary];
  id v7 = [(RPTChainedCoordinateSpaceConverter *)self primary];
  objc_msgSend(v7, "convertPoint:", x, y);
  objc_msgSend(v6, "convertPoint:");
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGSize)convertSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(RPTChainedCoordinateSpaceConverter *)self secondary];
  id v7 = [(RPTChainedCoordinateSpaceConverter *)self primary];
  objc_msgSend(v7, "convertSize:", width, height);
  objc_msgSend(v6, "convertSize:");
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGRect)convertRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(RPTChainedCoordinateSpaceConverter *)self secondary];
  double v9 = [(RPTChainedCoordinateSpaceConverter *)self primary];
  objc_msgSend(v9, "convertRect:", x, y, width, height);
  objc_msgSend(v8, "convertRect:");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGVector)convertVector:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  v6 = [(RPTChainedCoordinateSpaceConverter *)self secondary];
  id v7 = [(RPTChainedCoordinateSpaceConverter *)self primary];
  objc_msgSend(v7, "convertVector:", dx, dy);
  objc_msgSend(v6, "convertVector:");
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.ddouble y = v13;
  result.ddouble x = v12;
  return result;
}

- (RPTCoordinateSpaceConverter)primary
{
  return self->_primary;
}

- (void)setPrimary:(id)a3
{
}

- (RPTCoordinateSpaceConverter)secondary
{
  return self->_secondary;
}

- (void)setSecondary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
}

@end