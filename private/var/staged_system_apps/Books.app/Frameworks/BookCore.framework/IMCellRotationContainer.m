@interface IMCellRotationContainer
- (BOOL)cellNotVisible;
- (IMGridViewCell)endCell;
- (IMGridViewCell)startCell;
- (void)crossfadeWithDuration:(double)a3;
- (void)dealloc;
- (void)didFinishRotation;
- (void)prepareToCrossfade;
- (void)setCellNotVisible:(BOOL)a3;
- (void)setEndCell:(id)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setStartCell:(id)a3;
@end

@implementation IMCellRotationContainer

- (void)dealloc
{
  [(IMGridViewCell *)self->_endCell removeFromSuperview];
  [(IMGridViewCell *)self->_startCell removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)IMCellRotationContainer;
  [(IMCellRotationContainer *)&v3 dealloc];
}

- (void)setStartCell:(id)a3
{
  v5 = (IMGridViewCell *)a3;
  p_startCell = (id *)&self->_startCell;
  startCell = self->_startCell;
  v9 = v5;
  if (startCell != v5)
  {
    [(IMGridViewCell *)startCell removeFromSuperview];
    id v8 = *p_startCell;
    id *p_startCell = 0;

    objc_storeStrong((id *)&self->_startCell, a3);
    if (*p_startCell)
    {
      -[IMCellRotationContainer addSubview:](self, "addSubview:");
      [*p_startCell frame];
      [*p_startCell setFrame:CGPointZero.x, CGPointZero.y];
    }
  }
}

- (void)setEndCell:(id)a3
{
  v5 = (IMGridViewCell *)a3;
  p_endCell = (id *)&self->_endCell;
  endCell = self->_endCell;
  v9 = v5;
  if (endCell != v5)
  {
    [(IMGridViewCell *)endCell removeFromSuperview];
    id v8 = *p_endCell;
    id *p_endCell = 0;

    objc_storeStrong((id *)&self->_endCell, a3);
    if (*p_endCell)
    {
      -[IMCellRotationContainer addSubview:](self, "addSubview:");
      [*p_endCell frame];
      [*p_endCell setFrame:CGPointZero.x, CGPointZero.y];
    }
  }
}

- (void)setOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(IMCellRotationContainer *)self frame];

  -[IMCellRotationContainer setFrame:](self, "setFrame:", x, y);
}

- (void)prepareToCrossfade
{
  objc_super v3 = [(IMGridViewCell *)self->_startCell layer];
  [v3 setShouldRasterize:1];

  v4 = +[UIScreen mainScreen];
  [v4 scale];
  double v6 = v5;
  v7 = [(IMGridViewCell *)self->_startCell layer];
  [v7 setRasterizationScale:v6];

  id v8 = [(IMGridViewCell *)self->_startCell layer];
  [v8 setPreloadsCache:1];

  v9 = [(IMGridViewCell *)self->_startCell layer];
  [v9 setFrozen:1];

  v10 = [(IMGridViewCell *)self->_endCell layer];
  [v10 setShouldRasterize:1];

  v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = v12;
  v14 = [(IMGridViewCell *)self->_endCell layer];
  [v14 setRasterizationScale:v13];

  v15 = [(IMGridViewCell *)self->_endCell layer];
  [v15 setPreloadsCache:1];

  v16 = [(IMGridViewCell *)self->_endCell layer];
  [v16 setFrozen:1];

  [(IMGridViewCell *)self->_startCell setAlpha:1.0];
  endCell = self->_endCell;

  [(IMGridViewCell *)endCell setAlpha:0.0];
}

- (void)didFinishRotation
{
  objc_super v3 = [(IMGridViewCell *)self->_startCell layer];
  [v3 setShouldRasterize:0];

  v4 = [(IMGridViewCell *)self->_startCell layer];
  [v4 setRasterizationScale:1.0];

  double v5 = [(IMGridViewCell *)self->_startCell layer];
  [v5 setPreloadsCache:0];

  double v6 = [(IMGridViewCell *)self->_startCell layer];
  [v6 setFrozen:0];

  v7 = [(IMGridViewCell *)self->_endCell layer];
  [v7 setShouldRasterize:0];

  id v8 = [(IMGridViewCell *)self->_endCell layer];
  [v8 setRasterizationScale:1.0];

  v9 = [(IMGridViewCell *)self->_endCell layer];
  [v9 setPreloadsCache:0];

  id v10 = [(IMGridViewCell *)self->_endCell layer];
  [v10 setFrozen:0];
}

- (void)crossfadeWithDuration:(double)a3
{
  double v3 = 1.0;
  if (!self->_endCell) {
    double v3 = 0.5;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_78A10;
  v4[3] = &unk_2C3C50;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:v3 * a3];
}

- (IMGridViewCell)startCell
{
  return self->_startCell;
}

- (IMGridViewCell)endCell
{
  return self->_endCell;
}

- (BOOL)cellNotVisible
{
  return self->_cellNotVisible;
}

- (void)setCellNotVisible:(BOOL)a3
{
  self->_cellNotVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCell, 0);

  objc_storeStrong((id *)&self->_endCell, 0);
}

@end