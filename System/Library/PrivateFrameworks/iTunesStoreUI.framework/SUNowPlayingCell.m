@interface SUNowPlayingCell
- (void)layoutSubviews;
- (void)setAccessoryType:(int64_t)a3;
- (void)setAccessoryView:(id)a3;
- (void)setHighlightsOnlyContentView:(BOOL)a3;
@end

@implementation SUNowPlayingCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SUNowPlayingCell;
  [(SUTableCell *)&v4 layoutSubviews];
  if ((SUNowPlayingCell *)[(SUItemOfferButton *)self->super._itemOfferButton superview] == self)
  {
    itemOfferButton = self->super._itemOfferButton;
    if (itemOfferButton != (SUItemOfferButton *)[(SUNowPlayingCell *)self accessoryView])
    {
      [(SUItemOfferButton *)self->super._itemOfferButton frame];
      -[SUItemOfferButton setFrame:](self->super._itemOfferButton, "setFrame:", 112.0, 72.0);
    }
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUNowPlayingCell;
  [(SUNowPlayingCell *)&v3 setAccessoryType:1];
}

- (void)setAccessoryView:(id)a3
{
  itemOfferButton = self->super._itemOfferButton;
  if (itemOfferButton == a3)
  {
    [a3 setAnimationHorizontalAlignment:1];
    v6.receiver = self;
    v6.super_class = (Class)SUNowPlayingCell;
    [(SUNowPlayingCell *)&v6 setAccessoryView:0];
    [(SUNowPlayingCell *)self addSubview:a3];
  }
  else
  {
    [(SUItemOfferButton *)itemOfferButton removeFromSuperview];
    v7.receiver = self;
    v7.super_class = (Class)SUNowPlayingCell;
    [(SUNowPlayingCell *)&v7 setAccessoryView:a3];
  }
}

- (void)setHighlightsOnlyContentView:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUNowPlayingCell;
  [(SUTableCell *)&v3 setHighlightsOnlyContentView:0];
}

@end