@interface PICurveControlPoint
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (PICurveControlPoint)initWithDictionary:(id)a3;
- (PICurveControlPoint)initWithX:(double)a3 y:(double)a4 editable:(BOOL)a5;
- (double)x;
- (double)y;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation PICurveControlPoint

- (BOOL)isEditable
{
  return self->_editable;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_editable) {
    v5 = "editable";
  }
  else {
    v5 = "not editable";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p> [(%.3f, %.3f), %s]", v4, self, *(void *)&self->_x, *(void *)&self->_y, v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PICurveControlPoint *)self x];
    double v7 = v6;
    [v5 x];
    if (v7 == v8 && (-[PICurveControlPoint y](self, "y"), double v10 = v9, [v5 y], v10 == v11))
    {
      BOOL v14 = [(PICurveControlPoint *)self isEditable];
      int v12 = v14 ^ [v5 isEditable] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(PICurveControlPoint *)self x];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = 0x130F50B94BD2BDLL * [v4 hash];

  double v6 = NSNumber;
  [(PICurveControlPoint *)self y];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = 0x19E7B7D8491DEDLL * [v7 hash];

  BOOL v9 = [(PICurveControlPoint *)self isEditable];
  uint64_t v10 = 0x1DB601AC6044F9;
  if (!v9) {
    uint64_t v10 = 0;
  }
  return v8 ^ v5 ^ v10;
}

- (id)dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"x";
  v3 = NSNumber;
  [(PICurveControlPoint *)self x];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v11[0] = v4;
  v10[1] = @"y";
  uint64_t v5 = NSNumber;
  [(PICurveControlPoint *)self y];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v11[1] = v6;
  v10[2] = @"editable";
  double v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PICurveControlPoint isEditable](self, "isEditable"));
  v11[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (PICurveControlPoint)initWithDictionary:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PICurveControlPoint;
  id v3 = a3;
  id v4 = [(PICurveControlPoint *)&v11 init];
  uint64_t v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"x", v11.receiver, v11.super_class);
  [v5 doubleValue];
  v4->_x = v6;

  double v7 = [v3 objectForKeyedSubscript:@"y"];
  [v7 doubleValue];
  v4->_y = v8;

  BOOL v9 = [v3 objectForKeyedSubscript:@"editable"];

  v4->_editable = [v9 BOOLValue];
  return v4;
}

- (PICurveControlPoint)initWithX:(double)a3 y:(double)a4 editable:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PICurveControlPoint;
  result = [(PICurveControlPoint *)&v9 init];
  result->_x = a3;
  result->_y = a4;
  result->_editable = a5;
  return result;
}

@end