@interface TUIGridCoord
- (TUIGridCoord)initWithGrid:(id)a3 columns:(_NSRange)a4 rows:(_NSRange)a5;
- (double)height;
- (double)width;
@end

@implementation TUIGridCoord

- (TUIGridCoord)initWithGrid:(id)a3 columns:(_NSRange)a4 rows:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIGridCoord;
  v11 = [(TUIGridCoord *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_grid, v10);
    v12->_columns.NSUInteger location = v8;
    v12->_columns.NSUInteger length = v7;
    v12->_rows.NSUInteger location = location;
    v12->_rows.NSUInteger length = length;
  }

  return v12;
}

- (double)width
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grid);
  [WeakRetained _lengthForColumns:self->_columns.location, self->_columns.length];
  double v5 = v4;

  return v5;
}

- (double)height
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grid);
  [WeakRetained _heightForRows:self->_rows.location, self->_rows.length];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

@end