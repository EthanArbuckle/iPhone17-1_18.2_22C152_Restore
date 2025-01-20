@interface OBBulletedList
- (BOOL)_shouldHandleLandscapeiPhoneLayout;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSMutableArray)items;
- (NSMutableArray)verticalConstraints;
- (OBBulletedList)initWithFrame:(CGRect)a3;
- (double)bulletedListItemSpacing;
- (unint64_t)templateType;
- (void)_updateConstraints;
- (void)_updatePaddingForOrientation;
- (void)addBulletedListItem:(id)a3;
- (void)addItemWithDescription:(id)a3 image:(id)a4;
- (void)addItemWithDescription:(id)a3 symbolName:(id)a4;
- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5;
- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 linkButton:(id)a6;
- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6;
- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7;
- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5;
- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 linkButton:(id)a6;
- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6;
- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setItems:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setTemplateType:(unint64_t)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setVerticalConstraints:(id)a3;
@end

@implementation OBBulletedList

- (OBBulletedList)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OBBulletedList;
  v3 = -[OBBulletedList initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v3->_items;
    v3->_items = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    verticalConstraints = v3->_verticalConstraints;
    v3->_verticalConstraints = v6;
  }
  return v3;
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[OBBulletedListItem alloc] initWithTitle:v13 description:v12 image:v11 tintColor:v10];

  [(OBBulletedListItem *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v14];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[OBBulletedListItem alloc] initWithTitle:v16 description:v15 image:v14 tintColor:v13 linkButton:v12];

  [(OBBulletedListItem *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v17];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[OBBulletedListItem alloc] initWithTitle:v10 description:v9 image:v8 tintColor:0];

  [(OBBulletedListItem *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v11];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 linkButton:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[OBBulletedListItem alloc] initWithTitle:v13 description:v12 image:v11 tintColor:0 linkButton:v10];

  [(OBBulletedListItem *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v14];
}

- (void)addItemWithDescription:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[OBBulletedListItem alloc] initWithTitle:0 description:v7 image:v6 tintColor:0];

  [(OBBulletedListItem *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v8];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[OBBulletedListItem alloc] initWithTitle:v13 description:v12 symbolName:v11 tintColor:v10];

  [(OBBulletedListItem *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v14];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[OBBulletedListItem alloc] initWithTitle:v16 description:v15 symbolName:v14 tintColor:v13 linkButton:v12];

  [(OBBulletedListItem *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v17];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[OBBulletedListItem alloc] initWithTitle:v10 description:v9 symbolName:v8 tintColor:0];

  [(OBBulletedListItem *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v11];
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 linkButton:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[OBBulletedListItem alloc] initWithTitle:v13 description:v12 symbolName:v11 tintColor:0 linkButton:v10];

  [(OBBulletedListItem *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v14];
}

- (void)addItemWithDescription:(id)a3 symbolName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[OBBulletedListItem alloc] initWithTitle:0 description:v7 symbolName:v6 tintColor:0];

  [(OBBulletedListItem *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v8];
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
  [(OBBulletedList *)self _updatePaddingForOrientation];
}

- (void)addBulletedListItem:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(OBBulletedList *)self items];
  [v5 addObject:v4];

  [(OBBulletedList *)self addSubview:v4];
  id v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(OBBulletedList *)self leadingAnchor];
  id v8 = [v4 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v14[0] = v9;
  id v10 = [(OBBulletedList *)self trailingAnchor];
  id v11 = [v4 trailingAnchor];

  id v12 = [v10 constraintEqualToAnchor:v11];
  v14[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v6 activateConstraints:v13];

  [(OBBulletedList *)self _updateConstraints];
}

- (double)bulletedListItemSpacing
{
  if ([(OBBulletedList *)self _shouldHandleLandscapeiPhoneLayout])
  {
    id v4 = +[OBDevice currentDevice];
    if ([v4 type] == 1)
    {
      unint64_t v5 = +[OBViewUtilities activeInterfaceOrientationForView:self]- 3;

      double result = 22.0;
      if (v5 < 2) {
        return result;
      }
    }
    else
    {
    }
  }
  id v6 = +[OBDevice currentDevice];
  uint64_t v7 = [v6 templateType];

  double result = 26.0;
  switch(v7)
  {
    case 0:
      double result = 0.0;
      break;
    case 1:
    case 6:
    case 9:
      uint64_t v8 = MGGetProductType();
      BOOL v9 = v8 == 1895344378 || v8 == 2903084588;
      double result = 36.0;
      if (v9) {
        double result = 16.0;
      }
      break;
    case 5:
    case 7:
      double result = 22.0;
      break;
    case 10:
      double result = 20.0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)OBBulletedList;
  [(OBBulletedList *)&v3 didMoveToWindow];
  [(OBBulletedList *)self _updateConstraints];
}

- (void)_updateConstraints
{
  v43[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(OBBulletedList *)self verticalConstraints];
  [(OBBulletedList *)self removeConstraints:v3];

  id v4 = [(OBBulletedList *)self verticalConstraints];
  [v4 removeAllObjects];

  unint64_t v5 = [(OBBulletedList *)self items];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(OBBulletedList *)self items];
  uint64_t v8 = v7;
  if (v6 == 1)
  {
    id v9 = [v7 firstObject];

    id v10 = [(OBBulletedList *)self verticalConstraints];
    id v11 = [(OBBulletedList *)self topAnchor];
    id v12 = [v9 topAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    v43[0] = v13;
    id v14 = [(OBBulletedList *)self bottomAnchor];
    id v15 = [v9 bottomAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    v43[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    [v10 addObjectsFromArray:v17];

LABEL_17:
    goto LABEL_18;
  }
  unint64_t v18 = [v7 count];

  if (v18 >= 2)
  {
    [(OBBulletedList *)self bulletedListItemSpacing];
    double v20 = v19;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = [(OBBulletedList *)self items];
    uint64_t v21 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v9 = 0;
      uint64_t v23 = *(void *)v39;
      double v24 = -v20;
      do
      {
        uint64_t v25 = 0;
        v26 = v9;
        do
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * v25);
          v28 = [(OBBulletedList *)self verticalConstraints];
          if (v26)
          {
            v29 = [v26 bottomAnchor];
            v30 = [v27 topAnchor];
            v31 = v29;
            v32 = v30;
            double v33 = v24;
          }
          else
          {
            v29 = [(OBBulletedList *)self topAnchor];
            v30 = [v27 topAnchor];
            double v33 = 0.0;
            v31 = v29;
            v32 = v30;
          }
          v34 = [v31 constraintEqualToAnchor:v32 constant:v33];
          [v28 addObject:v34];

          id v9 = v27;
          ++v25;
          v26 = v9;
        }
        while (v22 != v25);
        uint64_t v22 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v22);
    }
    else
    {
      id v9 = 0;
    }

    id v10 = [(OBBulletedList *)self verticalConstraints];
    id v11 = [(OBBulletedList *)self bottomAnchor];
    id v12 = [v9 bottomAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    [v10 addObject:v13];
    goto LABEL_17;
  }
LABEL_18:
  v35 = (void *)MEMORY[0x1E4F28DC8];
  v36 = [(OBBulletedList *)self verticalConstraints];
  [v35 activateConstraints:v36];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBBulletedList;
  [(OBBulletedList *)&v3 layoutSubviews];
  [(OBBulletedList *)self _updatePaddingForOrientation];
}

- (void)_updatePaddingForOrientation
{
  double v3 = 0.0;
  if ([(OBBulletedList *)self _shouldHandleLandscapeiPhoneLayout])
  {
    id v4 = +[OBDevice currentDevice];
    if ([v4 type] == 1)
    {
      unint64_t v5 = +[OBViewUtilities activeInterfaceOrientationForView:self]- 3;

      if (v5 >= 2) {
        double v3 = 0.0;
      }
      else {
        double v3 = 54.0;
      }
    }
    else
    {
    }
  }
  uint64_t v6 = [(OBBulletedList *)self leadingConstraint];
  [v6 setConstant:-v3];

  id v7 = [(OBBulletedList *)self trailingConstraint];
  [v7 setConstant:v3];
}

- (BOOL)_shouldHandleLandscapeiPhoneLayout
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [(OBBulletedList *)self window];
  uint64_t v5 = [v3 supportedInterfaceOrientationsForWindow:v4];

  return v5 == 3 || (v5 & 0xFFFFFFFFFFFFFFF7) == 16;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end