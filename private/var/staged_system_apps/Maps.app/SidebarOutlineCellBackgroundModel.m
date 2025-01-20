@interface SidebarOutlineCellBackgroundModel
- (BOOL)collectionViewFocused;
- (BOOL)collectionViewHasDropSession;
- (BOOL)collectionViewProxyFocused;
- (BOOL)isEqual:(id)a3;
- (SidebarOutlineCellBackgroundModel)initWithStyle:(int64_t)a3 dropStyle:(int64_t)a4 grouping:(int64_t)a5 collectionViewFocused:(BOOL)a6 collectionViewProxyFocused:(BOOL)a7 collectionViewHasDropSession:(BOOL)a8;
- (int64_t)dropStyle;
- (int64_t)grouping;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation SidebarOutlineCellBackgroundModel

- (SidebarOutlineCellBackgroundModel)initWithStyle:(int64_t)a3 dropStyle:(int64_t)a4 grouping:(int64_t)a5 collectionViewFocused:(BOOL)a6 collectionViewProxyFocused:(BOOL)a7 collectionViewHasDropSession:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)SidebarOutlineCellBackgroundModel;
  result = [(SidebarOutlineCellBackgroundModel *)&v15 init];
  if (result)
  {
    result->_style = a3;
    result->_dropStyle = a4;
    result->_grouping = a5;
    result->_collectionViewFocused = a6;
    result->_collectionViewProxyFocused = a7;
    result->_collectionViewHasDropSession = a8;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_grouping ^ self->_style;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SidebarOutlineCellBackgroundModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    BOOL v7 = [(SidebarOutlineCellBackgroundModel *)v6 style] == self->_style
      && [(SidebarOutlineCellBackgroundModel *)v6 dropStyle] == self->_dropStyle
      && [(SidebarOutlineCellBackgroundModel *)v6 grouping] == self->_grouping
      && self->_collectionViewFocused == [(SidebarOutlineCellBackgroundModel *)v6 collectionViewFocused]&& self->_collectionViewProxyFocused == [(SidebarOutlineCellBackgroundModel *)v6 collectionViewProxyFocused]&& self->_collectionViewHasDropSession == [(SidebarOutlineCellBackgroundModel *)v6 collectionViewHasDropSession];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)dropStyle
{
  return self->_dropStyle;
}

- (int64_t)grouping
{
  return self->_grouping;
}

- (BOOL)collectionViewFocused
{
  return self->_collectionViewFocused;
}

- (BOOL)collectionViewProxyFocused
{
  return self->_collectionViewProxyFocused;
}

- (BOOL)collectionViewHasDropSession
{
  return self->_collectionViewHasDropSession;
}

@end