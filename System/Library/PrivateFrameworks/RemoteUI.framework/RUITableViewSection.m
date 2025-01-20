@interface RUITableViewSection
- (BOOL)configured;
- (BOOL)drawTopSeparator;
- (BOOL)hasCustomFooter;
- (BOOL)hasCustomHeader;
- (BOOL)hasValueForDrawsTopSeparator;
- (Class)_customFooterClass;
- (Class)_customHeaderClass;
- (NSArray)rows;
- (RUIDetailHeaderElement)detailHeader;
- (RUIElement)footer;
- (RUIElement)header;
- (RUIHeader)headerView;
- (RUIMultiChoiceElement)multiChoiceElement;
- (RUISubHeaderElement)subHeader;
- (RUITableView)tableElement;
- (RUITableViewHeaderFooterView)containerizedFooterView;
- (RUITableViewHeaderFooterView)containerizedHeaderView;
- (RUITableViewRow)showAllRow;
- (RUITableViewSection)initWithAttributes:(id)a3 parent:(id)a4;
- (RemoteUITableFooter)footerView;
- (double)footerHeight;
- (double)headerHeight;
- (id)colorFromAttributeString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)staticFunctions;
- (id)staticValues;
- (id)subElementWithID:(id)a3;
- (id)subElementsWithName:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)addRow:(id)a3;
- (void)footerView:(id)a3 activatedLinkWithURL:(id)a4;
- (void)headerView:(id)a3 activatedLinkWithURL:(id)a4;
- (void)headerViewDidChange:(id)a3;
- (void)insertRow:(id)a3 atIndex:(unint64_t)a4;
- (void)populatePostbackDictionary:(id)a3;
- (void)removeRowAtIndex:(unint64_t)a3;
- (void)reportInternalRenderEvent;
- (void)setAttributes:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setContainerizedFooterView:(id)a3;
- (void)setContainerizedHeaderView:(id)a3;
- (void)setDetailHeader:(id)a3;
- (void)setDrawTopSeparator:(BOOL)a3;
- (void)setFooter:(id)a3;
- (void)setFooterHeight:(double)a3;
- (void)setFooterView:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setHeaderView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlignment:(int)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setMultiChoiceElement:(id)a3;
- (void)setShowAllRow:(id)a3;
- (void)setSubHeader:(id)a3;
- (void)setTableElement:(id)a3;
- (void)tappedShowAllRowWithTable:(id)a3;
@end

@implementation RUITableViewSection

- (id)staticValues
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setIdentifier:"rowCount"];
  [v2 setGetter:RUIJSSection_getProperty];
  [v2 setSetter:0];
  [v2 setJSPropertyAttributes:10];
  v3 = objc_opt_new();
  [v3 setIdentifier:"sectionIndex"];
  [v3 setGetter:RUIJSSection_getProperty];
  [v3 setSetter:0];
  [v3 setJSPropertyAttributes:10];
  v6[0] = v2;
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)staticFunctions
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setIdentifier:"insertRow"];
  [v2 setFunction:RUIJSSection_insertRow];
  [v2 setJSPropertyAttributes:0];
  v3 = objc_opt_new();
  [v3 setIdentifier:"removeRow"];
  [v3 setFunction:RUIJSSection_removeRow];
  [v3 setJSPropertyAttributes:0];
  v4 = objc_opt_new();
  [v4 setIdentifier:"updateHTMLFooterContent"];
  [v4 setFunction:RUIJSSection_updateHTMLFooterContent];
  [v4 setJSPropertyAttributes:0];
  v5 = objc_opt_new();
  [v5 setIdentifier:"updateHTMLHeaderContent"];
  [v5 setFunction:RUIJSSection_updateHTMLHeaderContent];
  [v5 setJSPropertyAttributes:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (RUITableViewSection)initWithAttributes:(id)a3 parent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)RUITableViewSection;
  v4 = [(RUIElement *)&v12 initWithAttributes:a3 parent:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rows = v4->_rows;
    v4->_rows = v5;

    v7 = [(RUIElement *)v4 style];

    if (v7)
    {
      v8 = [(RUIElement *)v4 style];
      [v8 sectionHeaderHeight];
      v4->_headerHeight = v9;

      double v10 = *MEMORY[0x263F839B8];
    }
    else
    {
      double v10 = *MEMORY[0x263F839B8];
      v4->_headerHeight = *(double *)MEMORY[0x263F839B8];
    }
    v4->_footerHeight = v10;
  }
  return v4;
}

- (BOOL)drawTopSeparator
{
  return [(NSNumber *)self->_drawsTopSeparator BOOLValue];
}

- (void)setDrawTopSeparator:(BOOL)a3
{
  v4 = (NSNumber *)[objc_alloc(NSNumber) initWithBool:a3];
  drawsTopSeparator = self->_drawsTopSeparator;
  self->_drawsTopSeparator = v4;
  MEMORY[0x270F9A758](v4, drawsTopSeparator);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(RUIElement *)self attributes];
  v5 = [RUITableViewSection alloc];
  v6 = [(RUIElement *)self attributes];
  v7 = [(RUIElement *)self parent];
  v8 = [(RUITableViewSection *)v5 initWithAttributes:v6 parent:v7];

  [(RUITableViewSection *)v8 setAttributes:v4];
  double v9 = [(RUIElement *)self style];
  [(RUIElement *)v8 setStyle:v9];

  double v10 = [(RUITableViewSection *)self tableElement];
  [(RUITableViewSection *)v8 setTableElement:v10];

  v11 = [v4 objectForKeyedSubscript:@"header"];

  if (v11)
  {
    objc_super v12 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:0 parent:v8];
    v13 = [v4 objectForKeyedSubscript:@"header"];
    [(RUIElement *)v12 setBody:v13];

    [(RUITableViewSection *)v8 setHeader:v12];
    v14 = [v4 objectForKeyedSubscript:@"headerHeight"];

    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:@"headerHeight"];
      [v15 floatValue];
      [(RUITableViewSection *)v8 setHeaderHeight:v16];
    }
  }
  v17 = [v4 objectForKeyedSubscript:@"footer"];

  if (v17)
  {
    v18 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:0 parent:v8];
    v19 = [v4 objectForKeyedSubscript:@"footer"];
    [(RUIElement *)v18 setBody:v19];

    [(RUITableViewSection *)v8 setFooter:v18];
  }

  return v8;
}

- (BOOL)hasValueForDrawsTopSeparator
{
  return self->_drawsTopSeparator != 0;
}

- (void)insertRow:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)addRow:(id)a3
{
}

- (void)removeRowAtIndex:(unint64_t)a3
{
}

- (NSArray)rows
{
  v24[1] = *MEMORY[0x263EF8340];
  unint64_t disclosureLimit = self->_disclosureLimit;
  if (disclosureLimit && disclosureLimit < [(NSMutableArray *)self->_rows count] - 1)
  {
    if (!self->_showAllRow)
    {
      v4 = [RUITableViewRow alloc];
      v23 = @"label";
      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v6 = [v5 localizedStringForKey:@"SHOW_ALL" value:&stru_26C545B50 table:@"Localizable"];
      v24[0] = v6;
      v7 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      v8 = [(RUIElement *)v4 initWithAttributes:v7 parent:self];
      showAllRow = self->_showAllRow;
      self->_showAllRow = v8;

      double v10 = self->_showAllRow;
      v11 = [(RUIElement *)self style];
      [(RUIElement *)v10 setStyle:v11];

      objc_super v12 = [(RUITableViewRow *)self->_showAllRow tableCell];
      v13 = [v12 ruiTextLabel];
      v14 = [(RUIElement *)self style];
      v15 = [v14 buttonRowTextColor];
      [v13 setTextColor:v15];

      float v16 = [(RUITableViewRow *)self->_showAllRow tableCell];
      [v16 setIndentationLevel:1];

      v17 = [(RUITableViewRow *)self->_showAllRow tableCell];
      v18 = [(RUIElement *)self attributes];
      v19 = [v18 objectForKey:@"showAllIndent"];
      objc_msgSend(v17, "setIndentationWidth:", (double)objc_msgSend(v19, "integerValue"));
    }
    v20 = -[NSMutableArray subarrayWithRange:](self->_rows, "subarrayWithRange:", 0, self->_disclosureLimit);
    v21 = (NSMutableArray *)[v20 mutableCopy];

    [(NSMutableArray *)v21 addObject:self->_showAllRow];
  }
  else
  {
    v21 = self->_rows;
  }
  return (NSArray *)v21;
}

- (void)tappedShowAllRowWithTable:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RUITableViewRow *)self->_showAllRow tableCell];
  v6 = [v4 indexPathForCell:v5];

  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_rows, "count") - self->_disclosureLimit);
  for (unint64_t i = self->_disclosureLimit; i < [(NSMutableArray *)self->_rows count]; ++i)
  {
    double v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", i, objc_msgSend(v6, "section"));
    [v7 addObject:v9];
  }
  self->_unint64_t disclosureLimit = 0;
  showAllRow = self->_showAllRow;
  self->_showAllRow = 0;

  [v4 beginUpdates];
  v12[0] = v6;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v4 deleteRowsAtIndexPaths:v11 withRowAnimation:0];

  [v4 insertRowsAtIndexPaths:v7 withRowAnimation:0];
  [v4 endUpdates];
}

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RUITableViewSection;
  id v4 = a3;
  [(RUIElement *)&v7 setAttributes:v4];
  v5 = objc_msgSend(v4, "objectForKey:", @"disclosureLimit", v7.receiver, v7.super_class);
  self->_unint64_t disclosureLimit = [v5 integerValue];

  v6 = [v4 objectForKey:@"hideTopSeparator"];

  -[RUITableViewSection setDrawTopSeparator:](self, "setDrawTopSeparator:", [v6 BOOLValue] ^ 1);
}

- (id)colorFromAttributeString:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (Class)_customHeaderClass
{
  uint64_t v3 = [(RUIElement *)self parent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectModel];
    v5 = (void *)[v4 customHeaderClassForSection:self];

    if (v5)
    {
      id v6 = v5;
LABEL_11:
      objc_super v12 = v6;
      goto LABEL_12;
    }
  }
  objc_super v7 = [(RUITableViewSection *)self header];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_10:
    objc_opt_class();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  double v9 = [(RUIElement *)self attributes];
  double v10 = [v9 objectForKey:@"image"];
  if (v10) {
    goto LABEL_8;
  }
  double v10 = [(RUIElement *)self attributes];
  v11 = [v10 objectForKey:@"image2x"];
  if (v11)
  {

LABEL_8:
LABEL_9:

    goto LABEL_10;
  }
  v14 = [(RUIElement *)self attributes];
  v15 = [v14 objectForKey:@"image3x"];

  if (v15) {
    goto LABEL_10;
  }
  double v9 = [(RUITableViewSection *)self detailHeader];
  if (v9) {
    goto LABEL_9;
  }
  double v9 = [(RUITableViewSection *)self subHeader];
  if (v9) {
    goto LABEL_9;
  }
  float v16 = [(RUITableViewSection *)self header];
  v17 = [v16 attributes];
  v18 = [v17 objectForKeyedSubscript:@"color"];

  if (v18) {
    goto LABEL_10;
  }
  objc_super v12 = 0;
LABEL_12:

  return (Class)v12;
}

- (RUITableViewHeaderFooterView)containerizedHeaderView
{
  uint64_t v3 = [(RUITableViewSection *)self headerView];
  containerizedHeaderView = self->_containerizedHeaderView;
  if (containerizedHeaderView) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = (RUITableViewHeaderFooterView *)objc_opt_new();
    objc_super v7 = self->_containerizedHeaderView;
    self->_containerizedHeaderView = v6;

    [(RUITableViewHeaderFooterView *)self->_containerizedHeaderView embedHeaderView:v3];
    containerizedHeaderView = self->_containerizedHeaderView;
  }
  v8 = containerizedHeaderView;

  return v8;
}

- (RUIHeader)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    id v4 = objc_alloc([(RUITableViewSection *)self _customHeaderClass]);
    BOOL v5 = [(RUITableViewSection *)self header];
    id v6 = [v5 attributes];
    objc_super v7 = (RUIHeader *)[v4 initWithAttributes:v6];
    v8 = self->_headerView;
    self->_headerView = v7;

    double v9 = [(RUITableViewSection *)self header];
    double v10 = [v9 attributes];
    v11 = [v10 objectForKeyedSubscript:@"largeFont"];

    if (!v11)
    {
      header = self->_header;
      v13 = [(RUIElement *)header body];
      v14 = [v13 localizedUppercaseString];
      [(RUIElement *)header setBody:v14];
    }
    [(RUIElement *)self->_header configureView:self->_headerView];
    [(RUISubHeaderElement *)self->_subHeader configureView:self->_headerView];
    [(RUIDetailHeaderElement *)self->_detailHeader configureView:self->_headerView];
    if (objc_opt_respondsToSelector()) {
      [(RUIHeader *)self->_headerView setDelegate:self];
    }
    if (objc_opt_respondsToSelector()) {
      [(RUIElement *)self loadImage];
    }
    headerView = self->_headerView;
  }
  v15 = headerView;
  return v15;
}

- (void)headerView:(id)a3 activatedLinkWithURL:(id)a4
{
  id v5 = a4;
  id v6 = [(RUITableViewSection *)self header];
  objc_super v7 = [v6 attributes];
  id v10 = (id)[v7 mutableCopy];

  v8 = [v5 absoluteString];

  [v10 setObject:v8 forKeyedSubscript:@"url"];
  double v9 = [[RUIElement alloc] initWithAttributes:v10 parent:self];
  [(RUIElement *)self performAction:2 forElement:v9 completion:0];
}

- (void)headerViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableViewSection *)self tableElement];
  id v6 = [v5 sections];
  uint64_t v7 = [v6 indexOfObject:self];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__RUITableViewSection_headerViewDidChange___block_invoke;
  block[3] = &unk_264211728;
  id v10 = v4;
  v11 = self;
  uint64_t v12 = v7;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__RUITableViewSection_headerViewDidChange___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = [*(id *)(a1 + 40) tableElement];
  uint64_t v3 = [v2 tableView];
  id v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:*(void *)(a1 + 48)];
  v6[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 reconfigureRowsAtIndexPaths:v5];
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(RUIHeader *)self->_headerView setIconImage:v5];
    id v4 = [(RUIElement *)self parent];
    [v4 reloadHeadersAndFootersForSection:self];
  }
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (objc_opt_respondsToSelector())
  {
    -[RUIHeader setImageSize:](self->_headerView, "setImageSize:", width, height);
    id v6 = [(RUIElement *)self parent];
    [v6 reloadHeadersAndFootersForSection:self];
  }
}

- (void)setImageAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (objc_opt_respondsToSelector())
  {
    [(RUIHeader *)self->_headerView setImageAlignment:v3];
    id v5 = [(RUIElement *)self parent];
    [v5 reloadHeadersAndFootersForSection:self];
  }
}

- (BOOL)hasCustomHeader
{
  if (self->_headerView || [(RUITableViewSection *)self _customHeaderClass])
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v5 = [(RUITableViewSection *)self header];
    id v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (Class)_customFooterClass
{
  uint64_t v3 = [(RUIElement *)self parent];
  id v4 = [(RUITableViewSection *)self footer];
  id v5 = [v4 attributes];
  id v6 = [v5 objectForKeyedSubscript:@"privacyBundleIdentifier"];

  if (v6) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v3 objectModel];
    v11 = (void *)[v10 customFooterClassForSection:self];

    if (v11)
    {
      id v7 = v11;
      goto LABEL_3;
    }
  }
  uint64_t v12 = [(RUITableViewSection *)self footer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_2:
    objc_opt_class();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
    id v8 = v7;
    goto LABEL_4;
  }
  v14 = [(RUITableViewSection *)self footer];
  v15 = [v14 attributes];
  float v16 = [v15 objectForKeyedSubscript:@"url"];
  if (!v16)
  {
    v17 = [(RUITableViewSection *)self footer];
    v18 = [v17 attributes];
    [v18 objectForKeyedSubscript:@"activationFunction"];
  }
  v19 = [(RUITableViewSection *)self footer];
  v20 = [v19 attributes];
  v21 = [v20 objectForKeyedSubscript:@"color"];
  if (!v21)
  {
    v22 = [(RUIElement *)self style];
    v23 = +[RUIStyle defaultStyle];
    [v22 isMemberOfClass:objc_opt_class()];
  }
  v24 = [(RUITableViewSection *)self footer];
  if (v24)
  {

    goto LABEL_2;
  }
  id v8 = 0;
LABEL_4:

  return (Class)v8;
}

- (RUITableViewHeaderFooterView)containerizedFooterView
{
  uint64_t v3 = [(RUITableViewSection *)self footerView];
  containerizedFooterView = self->_containerizedFooterView;
  if (containerizedFooterView) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = (RUITableViewHeaderFooterView *)objc_opt_new();
    id v7 = self->_containerizedFooterView;
    self->_containerizedFooterView = v6;

    [(RUITableViewHeaderFooterView *)self->_containerizedFooterView embedFooterView:v3];
    containerizedFooterView = self->_containerizedFooterView;
  }
  id v8 = containerizedFooterView;

  return v8;
}

- (RemoteUITableFooter)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    id v4 = objc_alloc([(RUITableViewSection *)self _customFooterClass]);
    BOOL v5 = [(RUITableViewSection *)self footer];
    id v6 = [v5 attributes];
    id v7 = (RemoteUITableFooter *)[v4 initWithAttributes:v6];
    id v8 = self->_footerView;
    self->_footerView = v7;

    [(RUIElement *)self->_footer configureView:self->_footerView];
    if (objc_opt_respondsToSelector()) {
      [(RemoteUITableFooter *)self->_footerView setDelegate:self];
    }
    footerView = self->_footerView;
  }
  double v9 = footerView;
  return v9;
}

- (void)footerView:(id)a3 activatedLinkWithURL:(id)a4
{
  id v5 = a4;
  id v6 = [(RUITableViewSection *)self footer];
  id v7 = [v6 attributes];
  id v10 = (id)[v7 mutableCopy];

  id v8 = [v5 absoluteString];

  [v10 setObject:v8 forKeyedSubscript:@"url"];
  double v9 = [[RUIElement alloc] initWithAttributes:v10 parent:self];
  [(RUIElement *)self performAction:2 forElement:v9 completion:0];
}

- (BOOL)hasCustomFooter
{
  return self->_footerView || [(RUITableViewSection *)self _customFooterClass] != 0;
}

- (void)populatePostbackDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_rows;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "populatePostbackDictionary:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)subElementWithID:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_rows;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "identifier", (void)v25);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = v10;
LABEL_16:
          id v23 = v13;

          goto LABEL_17;
        }
        id v13 = [v10 subElementWithID:v4];
        if (v13) {
          goto LABEL_16;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = 152;
  uint64_t v15 = [(RUIElement *)self->_header identifier];
  int v16 = [v15 isEqualToString:v4];

  if (v16) {
    goto LABEL_14;
  }
  uint64_t v14 = 160;
  v17 = [(RUIElement *)self->_subHeader identifier];
  int v18 = [v17 isEqualToString:v4];

  if (v18) {
    goto LABEL_14;
  }
  uint64_t v14 = 168;
  v19 = [(RUIElement *)self->_detailHeader identifier];
  int v20 = [v19 isEqualToString:v4];

  if (v20
    || (uint64_t v14 = 176,
        [(RUIElement *)self->_footer identifier],
        v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 isEqualToString:v4],
        v21,
        v22))
  {
LABEL_14:
    id v23 = *(id *)((char *)&self->super.super.isa + v14);
  }
  else
  {
    id v23 = 0;
  }
LABEL_17:

  return v23;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RUIElement *)self->_header identifier];
  if ([v5 isEqualToString:v4]) {
    goto LABEL_4;
  }
  uint64_t v6 = [(RUIElement *)self->_subHeader identifier];
  if ([v6 isEqualToString:v4])
  {

LABEL_4:
LABEL_5:
    uint64_t v7 = 112;
LABEL_6:
    id v8 = *(id *)((char *)&self->super.super.isa + v7);
    goto LABEL_7;
  }
  long long v10 = [(RUIElement *)self->_detailHeader identifier];
  char v11 = [v10 isEqualToString:v4];

  if (v11) {
    goto LABEL_5;
  }
  int v12 = [(RUIElement *)self->_footer identifier];
  int v13 = [v12 isEqualToString:v4];

  if (v13)
  {
    uint64_t v7 = 120;
    goto LABEL_6;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = self->_rows;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "viewForElementIdentifier:", v4, (void)v20);
        if (v19)
        {
          id v8 = (id)v19;

          goto LABEL_7;
        }
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v8 = 0;
LABEL_7:

  return v8;
}

- (id)subElementsWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_rows;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "name", (void)v16);
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
        uint64_t v14 = [v11 subElementsWithName:v4];
        [v5 addObjectsFromArray:v14];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)setHeaderView:(id)a3
{
}

- (void)setContainerizedHeaderView:(id)a3
{
}

- (void)setFooterView:(id)a3
{
}

- (void)setContainerizedFooterView:(id)a3
{
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (RUITableViewRow)showAllRow
{
  return self->_showAllRow;
}

- (void)setShowAllRow:(id)a3
{
}

- (RUIElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (RUISubHeaderElement)subHeader
{
  return self->_subHeader;
}

- (void)setSubHeader:(id)a3
{
}

- (RUIDetailHeaderElement)detailHeader
{
  return self->_detailHeader;
}

- (void)setDetailHeader:(id)a3
{
}

- (RUIElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (RUIMultiChoiceElement)multiChoiceElement
{
  return self->_multiChoiceElement;
}

- (void)setMultiChoiceElement:(id)a3
{
}

- (RUITableView)tableElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableElement);
  return (RUITableView *)WeakRetained;
}

- (void)setTableElement:(id)a3
{
}

- (BOOL)configured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableElement);
  objc_storeStrong((id *)&self->_multiChoiceElement, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_detailHeader, 0);
  objc_storeStrong((id *)&self->_subHeader, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_showAllRow, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_drawsTopSeparator, 0);
  objc_storeStrong((id *)&self->_containerizedFooterView, 0);
  objc_storeStrong((id *)&self->_containerizedHeaderView, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

- (void)reportInternalRenderEvent
{
  v2 = self;
  RUITableViewSection.reportInternalRenderEvent()();
}

@end