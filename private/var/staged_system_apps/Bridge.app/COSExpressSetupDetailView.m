@interface COSExpressSetupDetailView
+ (id)testSections;
- (COSExpressSetupDetailView)initWithSections:(id)a3;
- (NSArray)sections;
- (NSMutableDictionary)sectionMap;
- (UIStackView)sectionStackView;
- (id)sectionViewForSection:(id)a3;
- (void)_setupSections;
- (void)setSectionMap:(id)a3;
- (void)setSectionStackView:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation COSExpressSetupDetailView

+ (id)testSections
{
  id v28 = (id)objc_opt_new();
  uint64_t v2 = 0;
  v3 = ASDPurchase_ptr;
  v4 = ASDPurchase_ptr;
  CFStringRef v5 = @"Item Title %i";
  CFStringRef v6 = @"Item Status %i";
  CFStringRef v7 = @"Item Detail %i";
  do
  {
    v8 = objc_opt_new();
    v9 = +[NSString stringWithFormat:@"Section Title %i", v2];
    [v8 setTitle:v9];

    v10 = +[NSString stringWithFormat:@"Section Subtitle %i", v2];
    [v8 setSubtitle:v10];

    v11 = v3[267];
    int v30 = v2;
    v12 = +[NSString stringWithFormat:@"%i.square.fill", v2];
    v13 = [v11 systemImageNamed:v12];
    v29 = v8;
    [v8 setImage:v13];

    v31 = objc_opt_new();
    uint64_t v14 = 0;
    do
    {
      v15 = objc_opt_new();
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v14);
      [v15 setTitle:v16];

      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v14);
      [v15 setStatus:v17];

      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v14);
      [v15 setDetail:v18];

      v19 = v3[267];
      +[NSString stringWithFormat:@"%i.circle", v14];
      CFStringRef v20 = v7;
      v21 = v3;
      CFStringRef v22 = v6;
      CFStringRef v23 = v5;
      v25 = v24 = v4;
      v26 = [v19 systemImageNamed:v25];
      [v15 setImage:v26];

      v4 = v24;
      CFStringRef v5 = v23;
      CFStringRef v6 = v22;
      v3 = v21;
      CFStringRef v7 = v20;
      [v31 addObject:v15];

      uint64_t v14 = (v14 + 1);
    }
    while (v14 != 5);
    [v29 setItems:v31];
    [v28 addObject:v29];

    uint64_t v2 = (v30 + 1);
  }
  while (v30 != 2);

  return v28;
}

- (COSExpressSetupDetailView)initWithSections:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COSExpressSetupDetailView;
  CFStringRef v6 = [(COSExpressSetupDetailView *)&v11 init];
  CFStringRef v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sections, a3);
    v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v5 count]];
    sectionMap = v7->_sectionMap;
    v7->_sectionMap = v8;

    [(COSExpressSetupDetailView *)v7 _setupSections];
  }

  return v7;
}

- (id)sectionViewForSection:(id)a3
{
  sectionMap = self->_sectionMap;
  v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)sectionMap objectForKey:v4];

  return v5;
}

- (void)_setupSections
{
  v3 = (UIStackView *)objc_opt_new();
  sectionStackView = self->_sectionStackView;
  self->_sectionStackView = v3;

  [(COSExpressSetupDetailView *)self addSubview:self->_sectionStackView];
  [(UIStackView *)self->_sectionStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_sectionStackView setAxis:1];
  [(UIStackView *)self->_sectionStackView setSpacing:16.0];
  id obja = [(COSExpressSetupDetailView *)self topAnchor];
  v24 = [(UIStackView *)self->_sectionStackView topAnchor];
  CFStringRef v23 = [obja constraintEqualToAnchor:v24];
  v32[0] = v23;
  CFStringRef v22 = [(COSExpressSetupDetailView *)self leadingAnchor];
  v21 = [(UIStackView *)self->_sectionStackView leadingAnchor];
  id v5 = [v22 constraintEqualToAnchor:v21];
  v32[1] = v5;
  CFStringRef v6 = [(COSExpressSetupDetailView *)self trailingAnchor];
  CFStringRef v7 = [(UIStackView *)self->_sectionStackView trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v32[2] = v8;
  v9 = [(COSExpressSetupDetailView *)self bottomAnchor];
  v10 = [(UIStackView *)self->_sectionStackView bottomAnchor];
  objc_super v11 = [v9 constraintEqualToAnchor:v10];
  v32[3] = v11;
  v12 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v12];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_sections;
  id v13 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v18 = objc_opt_new();
        [v18 populateSection:v17];
        sectionMap = self->_sectionMap;
        CFStringRef v20 = [v17 identifier];
        [(NSMutableDictionary *)sectionMap setObject:v18 forKey:v20];

        [(UIStackView *)self->_sectionStackView addArrangedSubview:v18];
      }
      id v14 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }
}

- (NSMutableDictionary)sectionMap
{
  return self->_sectionMap;
}

- (void)setSectionMap:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (UIStackView)sectionStackView
{
  return self->_sectionStackView;
}

- (void)setSectionStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionStackView, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_sectionMap, 0);
}

@end