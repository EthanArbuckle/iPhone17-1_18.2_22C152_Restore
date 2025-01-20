@interface WFStaticMenuElementGroup
- (BOOL)onlyDisplayTitleWhenCollapsed;
- (BOOL)shouldCollapse;
- (NSArray)menuElements;
- (NSString)title;
- (WFStaticMenuElementGroup)initWithMenuElements:(id)a3;
- (unint64_t)style;
- (void)setOnlyDisplayTitleWhenCollapsed:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFStaticMenuElementGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElements, 0);
  objc_storeStrong((id *)&self->title, 0);
}

- (NSArray)menuElements
{
  return self->_menuElements;
}

- (void)setOnlyDisplayTitleWhenCollapsed:(BOOL)a3
{
  self->onlyDisplayTitleWhenCollapsed = a3;
}

- (BOOL)onlyDisplayTitleWhenCollapsed
{
  return self->onlyDisplayTitleWhenCollapsed;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setStyle:(unint64_t)a3
{
  self->style = a3;
}

- (unint64_t)style
{
  return self->style;
}

- (BOOL)shouldCollapse
{
  unint64_t v3 = [(WFStaticMenuElementGroup *)self style];
  if (v3 != 1) {
    LOBYTE(v3) = [(WFStaticMenuElementGroup *)self style] == 2
  }
              && ([(WFStaticMenuElementGroup *)self menuElements],
                  v4 = objc_claimAutoreleasedReturnValue(),
                  unint64_t v5 = [v4 count],
                  v4,
                  v5 > 6);
  return v3;
}

- (WFStaticMenuElementGroup)initWithMenuElements:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFStaticMenuElementGroup;
  unint64_t v5 = [(WFStaticMenuElementGroup *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(WFStaticMenuElementGroup *)v5 setStyle:0];
    uint64_t v7 = [v4 copy];
    menuElements = v6->_menuElements;
    v6->_menuElements = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

@end