@interface TwoLinesOutlineCellActionModel
- (BOOL)isEqual:(id)a3;
- (NSString)buttonTitle1;
- (NSString)buttonTitle2;
- (TwoLinesOutlineCellActionModel)initWithButtonTitle1:(id)a3 buttonTitle2:(id)a4 delegate:(id)a5;
- (TwoLinesOutlineCellActionViewDelegate)delegate;
- (unint64_t)hash;
@end

@implementation TwoLinesOutlineCellActionModel

- (TwoLinesOutlineCellActionModel)initWithButtonTitle1:(id)a3 buttonTitle2:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TwoLinesOutlineCellActionModel;
  v11 = [(TwoLinesOutlineCellActionModel *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    buttonTitle1 = v11->_buttonTitle1;
    v11->_buttonTitle1 = v12;

    v14 = (NSString *)[v9 copy];
    buttonTitle2 = v11->_buttonTitle2;
    v11->_buttonTitle2 = v14;

    objc_storeStrong((id *)&v11->_delegate, a5);
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_buttonTitle1 hash];
  return [(NSString *)self->_buttonTitle2 hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesOutlineCellActionModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(TwoLinesOutlineCellActionModel *)v6 buttonTitle1];
    id v8 = v7;
    if (v7 == self->_buttonTitle1 || -[NSString isEqual:](v7, "isEqual:"))
    {
      id v9 = [(TwoLinesOutlineCellActionModel *)v6 buttonTitle2];
      id v10 = v9;
      if (v9 == self->_buttonTitle2 || -[NSString isEqual:](v9, "isEqual:"))
      {
        v11 = [(TwoLinesOutlineCellActionModel *)v6 delegate];
        v12 = v11;
        if (v11 == self->_delegate) {
          unsigned __int8 v13 = 1;
        }
        else {
          unsigned __int8 v13 = -[TwoLinesOutlineCellActionViewDelegate isEqual:](v11, "isEqual:");
        }
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (NSString)buttonTitle1
{
  return self->_buttonTitle1;
}

- (NSString)buttonTitle2
{
  return self->_buttonTitle2;
}

- (TwoLinesOutlineCellActionViewDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_buttonTitle2, 0);

  objc_storeStrong((id *)&self->_buttonTitle1, 0);
}

@end