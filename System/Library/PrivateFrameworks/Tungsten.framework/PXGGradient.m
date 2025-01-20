@interface PXGGradient
- (BOOL)isEqual:(id)a3;
- (PXGGradient)init;
- (PXGGradient)initWithStartingColor:(id)a3 endingColor:(id)a4 direction:(int64_t)a5;
- (UIColor)endingColor;
- (UIColor)startingColor;
- (id)description;
- (int64_t)direction;
- (unint64_t)hash;
@end

@implementation PXGGradient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingColor, 0);

  objc_storeStrong((id *)&self->_startingColor, 0);
}

- (PXGGradient)initWithStartingColor:(id)a3 endingColor:(id)a4 direction:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGGradient;
  v11 = [(PXGGradient *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startingColor, a3);
    objc_storeStrong((id *)&v12->_endingColor, a4);
    v12->_direction = a5;
  }

  return v12;
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIColor)endingColor
{
  return self->_endingColor;
}

- (UIColor)startingColor
{
  return self->_startingColor;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; startingColor = %@; endingColor = %@; direction = %ld>",
    v5,
    self,
    self->_startingColor,
    self->_endingColor,
  v6 = self->_direction);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGGradient *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXGGradient *)self startingColor];
      v7 = [(PXGGradient *)v5 startingColor];
      if ([v6 isEqual:v7])
      {
        v8 = [(PXGGradient *)self endingColor];
        id v9 = [(PXGGradient *)v5 endingColor];
        if ([v8 isEqual:v9])
        {
          int64_t v10 = [(PXGGradient *)self direction];
          BOOL v11 = v10 == [(PXGGradient *)v5 direction];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(PXGGradient *)self startingColor];
  uint64_t v4 = [v3 hash];
  v5 = [(PXGGradient *)self endingColor];
  unint64_t v6 = v4 ^ (2 * [v5 hash]);

  return v6;
}

- (PXGGradient)init
{
  v3 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v4 = [MEMORY[0x263F825C8] clearColor];
  v5 = [(PXGGradient *)self initWithStartingColor:v3 endingColor:v4 direction:0];

  return v5;
}

@end