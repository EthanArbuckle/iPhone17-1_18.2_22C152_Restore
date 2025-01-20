@interface CardProvider
- (id)cardWithBlur:(BOOL)a3;
- (void)recycleCard:(id)a3;
@end

@implementation CardProvider

- (id)cardWithBlur:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableSet *)self->_cachedCards count]
    || ([(NSMutableSet *)self->_cachedCards anyObject],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        [(NSMutableSet *)self->_cachedCards removeObject:v5],
        !v5))
  {
    id v5 = [[CardView alloc] initAllowingBlurred:v3];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  cards = self->_cards;
  if (!cards)
  {
    v7 = +[NSMutableSet set];
    v8 = self->_cards;
    self->_cards = v7;

    cards = self->_cards;
  }
  [(NSMutableSet *)cards addObject:v5];

  return v5;
}

- (void)recycleCard:(id)a3
{
  cachedCards = self->_cachedCards;
  id v5 = a3;
  [(NSMutableSet *)cachedCards addObject:v5];
  [(NSMutableSet *)self->_cards removeObject:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCards, 0);

  objc_storeStrong((id *)&self->_cards, 0);
}

@end