@interface SBCollectionViewCell
- (BOOL)protectDelayedUnhighlights;
- (SBCollectionViewCellDelegate)delegate;
- (void)_performSetHighlighted;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 afterDelay:(double)a4;
- (void)setProtectDelayedUnhighlights:(BOOL)a3;
@end

@implementation SBCollectionViewCell

- (void)_performSetHighlighted
{
  self->_protectDelayedUnhighlights = 0;
  [(SBCollectionViewCell *)self setHighlighted:self->_performSetHighlighted afterDelay:0.0];
}

- (void)setHighlighted:(BOOL)a3 afterDelay:(double)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a4 > 0.0 || !self->_protectDelayedUnhighlights || a3)
  {
    BOOL v7 = a3;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performSetHighlighted object:0];
    if ([(SBCollectionViewCell *)self isHighlighted] != v7)
    {
      if (a4 <= 0.0)
      {
        v10.receiver = self;
        v10.super_class = (Class)SBCollectionViewCell;
        [(SBCollectionViewCell *)&v10 setHighlighted:v7];
        if ([(SBCollectionViewCell *)self isHighlighted] == v7) {
          [(SBCollectionViewCell *)self _didSetHighlighted:v7];
        }
      }
      else
      {
        self->_performSetHighlighted = v7;
        v11[0] = *MEMORY[0x1E4F1C4B0];
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
        [(SBCollectionViewCell *)self performSelector:sel__performSetHighlighted withObject:0 afterDelay:v9 inModes:a4];
      }
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBCollectionViewCell;
  [(SBCollectionViewCell *)&v3 prepareForReuse];
  self->_protectDelayedUnhighlights = 0;
  [(SBCollectionViewCell *)self setHighlighted:0];
}

- (BOOL)protectDelayedUnhighlights
{
  return self->_protectDelayedUnhighlights;
}

- (void)setProtectDelayedUnhighlights:(BOOL)a3
{
  self->_protectDelayedUnhighlights = a3;
}

- (SBCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end