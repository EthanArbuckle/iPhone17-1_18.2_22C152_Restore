@interface PUAlbumListTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PUAlbumListTableViewCellDelegate)stateChangeDelegate;
- (void)setStateChangeDelegate:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation PUAlbumListTableViewCell

- (void).cxx_destruct
{
}

- (void)setStateChangeDelegate:(id)a3
{
}

- (PUAlbumListTableViewCellDelegate)stateChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateChangeDelegate);
  return (PUAlbumListTableViewCellDelegate *)WeakRetained;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(PUAlbumListTableViewCell *)self viewWithTag:236897];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)willTransitionToState:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUAlbumListTableViewCell;
  -[PUAlbumListTableViewCell willTransitionToState:](&v6, sel_willTransitionToState_);
  v5 = [(PUAlbumListTableViewCell *)self stateChangeDelegate];
  [v5 albumListTableViewCell:self willChangeState:a3];
}

@end