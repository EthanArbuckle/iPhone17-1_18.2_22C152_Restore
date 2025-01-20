@interface VKCActionInfoMoreButton
- (BOOL)isShowingSingleTapMenu;
- (void)_moreButtonAction:(id)a3;
- (void)setIsShowingSingleTapMenu:(BOOL)a3;
@end

@implementation VKCActionInfoMoreButton

- (void)_moreButtonAction:(id)a3
{
  [(VKCActionInfoMoreButton *)self setIsShowingSingleTapMenu:1];
  v4 = [(VKCActionInfoMoreButton *)self contextMenuInteraction];
  [(VKCActionInfoMoreButton *)self bounds];
  objc_msgSend(v4, "_presentMenuAtLocation:", v5 * 0.5, 0.0);

  [(VKCActionInfoMoreButton *)self setIsShowingSingleTapMenu:0];
}

- (BOOL)isShowingSingleTapMenu
{
  return self->_isShowingSingleTapMenu;
}

- (void)setIsShowingSingleTapMenu:(BOOL)a3
{
  self->_isShowingSingleTapMenu = a3;
}

@end