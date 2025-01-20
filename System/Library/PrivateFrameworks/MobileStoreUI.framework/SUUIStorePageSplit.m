@interface SUUIStorePageSplit
- (NSArray)pageComponents;
- (SUUIStorePageSectionContext)sectionContext;
- (UIColor)dividerColor;
- (double)widthFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfPageSections;
- (void)setDividerColor:(id)a3;
- (void)setNumberOfPageSections:(int64_t)a3;
- (void)setPageComponents:(id)a3;
- (void)setSectionContext:(id)a3;
- (void)setWidthFraction:(double)a3;
@end

@implementation SUUIStorePageSplit

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setDividerColor:self->_dividerColor];
  [v4 setNumberOfPageSections:self->_numberOfPageSections];
  [v4 setPageComponents:self->_pageComponents];
  [v4 setSectionContext:self->_sectionContext];
  [v4 setWidthFraction:self->_widthFraction];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIStorePageSplit;
  v4 = [(SUUIStorePageSplit *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: Count: %ld, Context: %@", v4, self->_numberOfPageSections, self->_sectionContext];

  return v5;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (void)setDividerColor:(id)a3
{
}

- (int64_t)numberOfPageSections
{
  return self->_numberOfPageSections;
}

- (void)setNumberOfPageSections:(int64_t)a3
{
  self->_numberOfPageSections = a3;
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (void)setPageComponents:(id)a3
{
}

- (SUUIStorePageSectionContext)sectionContext
{
  return self->_sectionContext;
}

- (void)setSectionContext:(id)a3
{
}

- (double)widthFraction
{
  return self->_widthFraction;
}

- (void)setWidthFraction:(double)a3
{
  self->_widthFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContext, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end