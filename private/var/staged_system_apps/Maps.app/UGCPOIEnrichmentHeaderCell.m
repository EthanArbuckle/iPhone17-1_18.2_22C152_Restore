@interface UGCPOIEnrichmentHeaderCell
- (NSString)headerText;
- (UGCPOIEnrichmentHeaderCell)initWithFrame:(CGRect)a3;
- (void)setHeaderText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UGCPOIEnrichmentHeaderCell

- (UGCPOIEnrichmentHeaderCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UGCPOIEnrichmentHeaderCell;
  v3 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(UGCPOIEnrichmentHeaderCell *)v3 setAccessibilityIdentifier:v5];

    v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v6;

    [(UILabel *)v3->_headerLabel setAccessibilityIdentifier:@"HeaderLabel"];
    v8 = +[UGCFontManager poiEnrichmentSectionHeaderTitleFont];
    [(UILabel *)v3->_headerLabel setFont:v8];

    [(UILabel *)v3->_headerLabel setNumberOfLines:0];
    [(UGCPOIEnrichmentHeaderCell *)v3 addSubview:v3->_headerLabel];
    id v9 = objc_alloc((Class)MUEdgeLayout);
    v10 = v3->_headerLabel;
    v11 = [(UGCPOIEnrichmentHeaderCell *)v3 layoutMarginsGuide];
    id v12 = [v9 initWithItem:v10 container:v11];
    [v12 activate];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UGCPOIEnrichmentHeaderCell;
  id v4 = a3;
  [(UGCPOIEnrichmentHeaderCell *)&v10 traitCollectionDidChange:v4];
  v5 = [(UGCPOIEnrichmentHeaderCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8)
  {
    id v9 = +[UGCFontManager poiEnrichmentSectionHeaderTitleFont];
    [(UILabel *)self->_headerLabel setFont:v9];
  }
}

- (void)setHeaderText:(id)a3
{
}

- (NSString)headerText
{
  return [(UILabel *)self->_headerLabel text];
}

- (void).cxx_destruct
{
}

@end