@interface CarCardStackViewController
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isTransitioning;
- (CarCardStackViewController)initWithCarCardContentControllers:(id)a3 layout:(id *)a4;
- (NSArray)cardContentControllers;
- (NSArray)cardViews;
- (NSArray)focusOrderSubItems;
- (UIStackView)cardContentStack;
- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (void)addCardContentController:(id)a3;
- (void)insertCardContentController:(id)a3 atIndex:(unint64_t)a4;
- (void)removeCardContentController:(id)a3;
- (void)setCardContentStack:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CarCardStackViewController

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarCardStackViewController)initWithCarCardContentControllers:(id)a3 layout:(id *)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CarCardStackViewController;
  v7 = [(CarCardStackViewController *)&v23 init];
  if (v7)
  {
    v8 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    cardContentStack = v7->_cardContentStack;
    v7->_cardContentStack = v8;

    [(UIStackView *)v7->_cardContentStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v7->_cardContentStack setAxis:a4->var0];
    [(UIStackView *)v7->_cardContentStack setDistribution:a4->var1];
    [(UIStackView *)v7->_cardContentStack setAlignment:a4->var2];
    [(UIStackView *)v7->_cardContentStack setSpacing:8.0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v14);
          v16 = [CarCardView alloc];
          v17 = -[CarCardView initWithContent:](v16, "initWithContent:", v15, (void)v19);
          [(UIStackView *)v7->_cardContentStack addArrangedSubview:v17];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

- (NSArray)cardContentControllers
{
  v2 = [(CarCardStackViewController *)self cardContentStack];
  v3 = [v2 arrangedSubviews];
  v4 = [v3 valueForKey:@"content"];

  return (NSArray *)v4;
}

- (NSArray)cardViews
{
  v2 = [(CarCardStackViewController *)self cardContentStack];
  v3 = [v2 arrangedSubviews];

  return (NSArray *)v3;
}

- (void)addCardContentController:(id)a3
{
  id v4 = a3;
  id v6 = [[CarCardView alloc] initWithContent:v4];

  v5 = [(CarCardStackViewController *)self cardContentStack];
  [v5 addArrangedSubview:v6];
}

- (void)insertCardContentController:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v8 = [[CarCardView alloc] initWithContent:v6];

  v7 = [(CarCardStackViewController *)self cardContentStack];
  [v7 insertArrangedSubview:v8 atIndex:a4];
}

- (void)removeCardContentController:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(CarCardStackViewController *)self cardContentStack];
  id v6 = [v5 arrangedSubviews];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 content];

        if (v12 == v4)
        {
          uint64_t v13 = [(CarCardStackViewController *)self cardContentStack];
          [v13 _maps_removeArrangedSubview:v11];

          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)CarCardStackViewController;
  [(CarCardStackViewController *)&v21 viewDidLoad];
  v3 = [(CarCardStackViewController *)self view];
  [v3 addSubview:self->_cardContentStack];

  long long v19 = [(UIStackView *)self->_cardContentStack topAnchor];
  long long v20 = [(CarCardStackViewController *)self view];
  v18 = [v20 topAnchor];
  long long v17 = [v19 constraintEqualToAnchor:v18];
  v22[0] = v17;
  long long v15 = [(UIStackView *)self->_cardContentStack bottomAnchor];
  long long v16 = [(CarCardStackViewController *)self view];
  long long v14 = [v16 bottomAnchor];
  id v4 = [v15 constraintEqualToAnchor:v14];
  v22[1] = v4;
  v5 = [(UIStackView *)self->_cardContentStack leftAnchor];
  id v6 = [(CarCardStackViewController *)self view];
  id v7 = [v6 leftAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v22[2] = v8;
  uint64_t v9 = [(UIStackView *)self->_cardContentStack rightAnchor];
  id v10 = [(CarCardStackViewController *)self view];
  id v11 = [v10 rightAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v22[3] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  return 0;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UIStackView)cardContentStack
{
  return self->_cardContentStack;
}

- (void)setCardContentStack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end