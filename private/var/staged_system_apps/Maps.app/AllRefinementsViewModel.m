@interface AllRefinementsViewModel
- (AllRefinementsViewModel)initWithSections:(id)a3 displayName:(id)a4 viewTakesFullHeight:(BOOL)a5;
- (BOOL)viewTakesFullHeight;
- (NSArray)sections;
- (NSNumber)tappedBarButtonIndex;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setTappedBarButtonIndex:(id)a3;
@end

@implementation AllRefinementsViewModel

- (AllRefinementsViewModel)initWithSections:(id)a3 displayName:(id)a4 viewTakesFullHeight:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AllRefinementsViewModel;
  v11 = [(AllRefinementsViewModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sections, a3);
    objc_storeStrong((id *)&v12->_displayName, a4);
    v12->_viewTakesFullHeight = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)NSMutableArray);
  v5 = [(AllRefinementsViewModel *)self sections];
  id v6 = [v4 initWithArray:v5 copyItems:1];

  v7 = [AllRefinementsViewModel alloc];
  v8 = [(AllRefinementsViewModel *)self displayName];
  id v9 = [(AllRefinementsViewModel *)v7 initWithSections:v6 displayName:v8 viewTakesFullHeight:[(AllRefinementsViewModel *)self viewTakesFullHeight]];

  id v10 = [(AllRefinementsViewModel *)self tappedBarButtonIndex];
  [(AllRefinementsViewModel *)v9 setTappedBarButtonIndex:v10];

  return v9;
}

- (BOOL)viewTakesFullHeight
{
  return self->_viewTakesFullHeight;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSNumber)tappedBarButtonIndex
{
  return self->_tappedBarButtonIndex;
}

- (void)setTappedBarButtonIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedBarButtonIndex, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end