@interface PKPayLaterCalendarMonthHeaderView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPayLaterCalendarMonthHeaderView)initWithInstallmentsMonth:(id)a3;
- (double)_layoutLabelsSideBySide:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (double)_layoutLabelsStacked:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation PKPayLaterCalendarMonthHeaderView

- (PKPayLaterCalendarMonthHeaderView)initWithInstallmentsMonth:(id)a3
{
  id v5 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PKPayLaterCalendarMonthHeaderView;
  v6 = -[PKPayLaterCalendarMonthHeaderView initWithFrame:](&v56, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    id v55 = v5;
    objc_storeStrong((id *)&v6->_installmentsMonth, a3);
    int v8 = [(PKPayLaterCalendarMonthHeaderView *)v7 _shouldReverseLayoutDirection];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    totalPaidLabel = v7->_totalPaidLabel;
    v7->_totalPaidLabel = v9;

    [(UILabel *)v7->_totalPaidLabel setAccessibilityIdentifier:@"PKPayLaterCalendarMonthHeaderView.totalPaidLabel"];
    v11 = v7->_totalPaidLabel;
    v12 = (NSString *)*MEMORY[0x1E4FB28C8];
    v13 = (NSString *)*MEMORY[0x1E4FB2790];
    v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UILabel *)v11 setFont:v14];

    v15 = v7->_totalPaidLabel;
    v16 = PKLocalizedCocoonString(&cfstr_TotalPaid.isa);
    [(UILabel *)v15 setText:v16];

    v17 = v7->_totalPaidLabel;
    v18 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v17 setTextColor:v18];

    if (v8) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 0;
    }
    if (v8) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 2;
    }
    uint64_t v53 = v19;
    -[UILabel setTextAlignment:](v7->_totalPaidLabel, "setTextAlignment:");
    [(PKPayLaterCalendarMonthHeaderView *)v7 addSubview:v7->_totalPaidLabel];
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    totalDueLabel = v7->_totalDueLabel;
    v7->_totalDueLabel = v21;

    [(UILabel *)v7->_totalDueLabel setAccessibilityIdentifier:@"PKPayLaterCalendarMonthHeaderView.totalDueLabel"];
    v23 = v7->_totalDueLabel;
    v24 = PKFontForDefaultDesign(v12, v13);
    [(UILabel *)v23 setFont:v24];

    v25 = v7->_totalDueLabel;
    v26 = PKLocalizedCocoonString(&cfstr_TotalRemaining.isa);
    [(UILabel *)v25 setText:v26];

    v27 = v7->_totalDueLabel;
    v28 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v27 setTextColor:v28];

    uint64_t v54 = v20;
    [(UILabel *)v7->_totalDueLabel setTextAlignment:v20];
    [(PKPayLaterCalendarMonthHeaderView *)v7 addSubview:v7->_totalDueLabel];
    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    totalPaidAmountLabel = v7->_totalPaidAmountLabel;
    v7->_totalPaidAmountLabel = v29;

    [(UILabel *)v7->_totalPaidAmountLabel setAccessibilityIdentifier:@"PKPayLaterCalendarMonthHeaderView.totalPaidAmountLabel"];
    v31 = [(PKPayLaterInstallmentsMonth *)v7->_installmentsMonth totalPaid];
    v32 = [v31 amount];
    char v33 = objc_msgSend(v32, "pk_isPositiveNumber");

    v34 = v7->_totalPaidAmountLabel;
    v35 = (void *)*MEMORY[0x1E4FB0938];
    v36 = (void *)*MEMORY[0x1E4FB2988];
    double v37 = *MEMORY[0x1E4FB09B8];
    v38 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], v13, 32770, 0, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v34 setFont:v38];

    v39 = v7->_totalPaidAmountLabel;
    v40 = [v31 formattedStringValue];
    [(UILabel *)v39 setText:v40];

    v41 = v7->_totalPaidAmountLabel;
    if (v33) {
      [MEMORY[0x1E4FB1618] labelColor];
    }
    else {
    v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [(UILabel *)v41 setTextColor:v42];

    [(UILabel *)v7->_totalPaidAmountLabel setTextAlignment:v53];
    [(PKPayLaterCalendarMonthHeaderView *)v7 addSubview:v7->_totalPaidAmountLabel];
    v43 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    totalDueAmountLabel = v7->_totalDueAmountLabel;
    v7->_totalDueAmountLabel = v43;

    [(UILabel *)v7->_totalDueAmountLabel setAccessibilityIdentifier:@"PKPayLaterCalendarMonthHeaderView.totalDueAmountLabel"];
    v45 = [(PKPayLaterInstallmentsMonth *)v7->_installmentsMonth totalDue];
    v46 = v7->_totalDueAmountLabel;
    v47 = PKFontForDesign(v35, v36, v13, 32770, 0, v37);
    [(UILabel *)v46 setFont:v47];

    v48 = v7->_totalDueAmountLabel;
    v49 = [v45 formattedStringValue];
    [(UILabel *)v48 setText:v49];

    v50 = v7->_totalDueAmountLabel;
    v51 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v50 setTextColor:v51];

    [(UILabel *)v7->_totalDueAmountLabel setTextAlignment:v54];
    [(PKPayLaterCalendarMonthHeaderView *)v7 addSubview:v7->_totalDueAmountLabel];

    id v5 = v55;
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCalendarMonthHeaderView;
  [(PKPayLaterCalendarMonthHeaderView *)&v3 layoutSubviews];
  [(PKPayLaterCalendarMonthHeaderView *)self bounds];
  -[PKPayLaterCalendarMonthHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterCalendarMonthHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_totalPaidLabel, "sizeThatFits:", a3.size.width, 3.40282347e38);
  double v11 = v10;
  -[UILabel sizeThatFits:](self->_totalDueLabel, "sizeThatFits:", width, 3.40282347e38);
  double v13 = v12;
  -[UILabel sizeThatFits:](self->_totalPaidAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  double v15 = v14;
  -[UILabel sizeThatFits:](self->_totalDueAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  double v17 = v15 + v16;
  if (v11 + v13 <= width && v17 <= width) {
    -[PKPayLaterCalendarMonthHeaderView _layoutLabelsSideBySide:isTemplateLayout:](self, "_layoutLabelsSideBySide:isTemplateLayout:", v4, x, y, width, height);
  }
  else {
    -[PKPayLaterCalendarMonthHeaderView _layoutLabelsStacked:isTemplateLayout:](self, "_layoutLabelsStacked:isTemplateLayout:", v4, x, y, width, height);
  }
  double v20 = v19 + 0.0;
  double v21 = width;
  result.double height = v20;
  result.double width = v21;
  return result;
}

- (double)_layoutLabelsSideBySide:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(PKPayLaterCalendarMonthHeaderView *)self _shouldReverseLayoutDirection])CGRectEdge v11 = CGRectMinXEdge; {
  else
  }
    CGRectEdge v11 = CGRectMaxXEdge;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.CGFloat height = height;
  -[UILabel sizeThatFits:](self->_totalPaidLabel, "sizeThatFits:", width, 3.40282347e38);
  double v13 = v12;
  -[UILabel sizeThatFits:](self->_totalDueLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v15 = v14;
  double v17 = fmax(v13, v16);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.double width = width;
  v53.size.CGFloat height = height;
  CGRectDivide(v53, &slice, &remainder, v17, CGRectMinYEdge);
  memset(&v50, 0, sizeof(v50));
  CGRectDivide(slice, &v50, &slice, v15, v11);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v50.origin.CGFloat x = v18;
  v50.origin.CGFloat y = v19;
  v50.size.double width = v20;
  v50.size.CGFloat height = v21;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v47 = v23;
  double v48 = v22;
  double v25 = v24;
  double v27 = v26;
  -[UILabel sizeThatFits:](self->_totalPaidAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  double v29 = v28;
  -[UILabel sizeThatFits:](self->_totalDueAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v31 = v30;
  double v33 = fmax(v29, v32);
  CGRectDivide(remainder, &slice, &remainder, v33, CGRectMinYEdge);
  memset(&v49, 0, sizeof(v49));
  CGRectDivide(slice, &v49, &slice, v31, v11);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v49.origin.CGFloat x = v34;
  v49.origin.CGFloat y = v35;
  v49.size.double width = v36;
  v49.size.CGFloat height = v37;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!a4)
  {
    double v42 = v38;
    double v43 = v39;
    double v44 = v40;
    double v45 = v41;
    -[UILabel setFrame:](self->_totalPaidLabel, "setFrame:", v48, v47, v25, v27);
    -[UILabel setFrame:](self->_totalDueLabel, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    -[UILabel setFrame:](self->_totalPaidAmountLabel, "setFrame:", v42, v43, v44, v45);
    -[UILabel setFrame:](self->_totalDueAmountLabel, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
  }
  return v17 + 0.0 + v33;
}

- (double)_layoutLabelsStacked:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PKPayLaterCalendarMonthHeaderView *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.CGFloat height = height;
  -[UILabel sizeThatFits:](self->_totalPaidLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v11 = v10;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.double width = width;
  v50.size.CGFloat height = height;
  CGRectDivide(v50, &slice, &remainder, v11, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v45 = v13;
  double v46 = v12;
  double v44 = v14;
  double v47 = v15;
  -[UILabel sizeThatFits:](self->_totalPaidAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v16, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v42 = v18;
  double v43 = v17;
  double v41 = v19;
  double v21 = v20;
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_totalDueLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v22, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v40 = v23;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  -[UILabel sizeThatFits:](self->_totalDueAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v30, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v35 = v34;
  if (!a4)
  {
    double v36 = v31;
    double v37 = v32;
    double v38 = v33;
    -[UILabel setFrame:](self->_totalPaidLabel, "setFrame:", v46, v45, v44, v47);
    -[UILabel setFrame:](self->_totalPaidAmountLabel, "setFrame:", v43, v42, v41, v21);
    -[UILabel setFrame:](self->_totalDueLabel, "setFrame:", v40, v25, v27, v29);
    -[UILabel setFrame:](self->_totalDueAmountLabel, "setFrame:", v36, v37, v38, v35);
  }
  return v47 + 0.0 + v21 + 10.0 + v29 + v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalPaidAmountLabel, 0);
  objc_storeStrong((id *)&self->_totalPaidLabel, 0);
  objc_storeStrong((id *)&self->_totalDueAmountLabel, 0);
  objc_storeStrong((id *)&self->_totalDueLabel, 0);

  objc_storeStrong((id *)&self->_installmentsMonth, 0);
}

@end