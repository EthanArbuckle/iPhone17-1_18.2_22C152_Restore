@interface PXCMMTranscriptTextView
- (CGSize)_performLayoutInSize:(CGSize)a3 minimizingSize:(BOOL)a4 updateSubviewFrames:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)primaryText;
- (NSString)secondaryText;
- (PXCMMTranscriptTextView)initWithCoder:(id)a3;
- (PXCMMTranscriptTextView)initWithFrame:(CGRect)a3;
- (void)_updatePrimaryLabel;
- (void)_updateSecondaryLabel;
- (void)layoutSubviews;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
@end

@implementation PXCMMTranscriptTextView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)_updateSecondaryLabel
{
  v3 = [(PXCMMTranscriptTextView *)self secondaryText];
  uint64_t v4 = [v3 length];

  secondaryLabel = self->_secondaryLabel;
  if (v4)
  {
    if (!secondaryLabel)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
      v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v8 = self->_secondaryLabel;
      self->_secondaryLabel = v7;

      PXFontWithTextStyleSymbolicTraits();
    }
    uint64_t v10 = [(PXCMMTranscriptTextView *)self secondaryText];
    [(UILabel *)self->_secondaryLabel setText:v10];
    v9 = (UILabel *)v10;
  }
  else
  {
    [(UILabel *)secondaryLabel removeFromSuperview];
    v9 = self->_secondaryLabel;
    self->_secondaryLabel = 0;
  }
}

- (void)_updatePrimaryLabel
{
  if (!self->_primaryLabel)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v4;

    PXFontWithTextStyleSymbolicTraits();
  }
  id v6 = [(PXCMMTranscriptTextView *)self primaryText];
  [(UILabel *)self->_primaryLabel setText:v6];
}

- (CGSize)_performLayoutInSize:(CGSize)a3 minimizingSize:(BOOL)a4 updateSubviewFrames:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double height = a3.height;
  double width = a3.width;
  [(PXUpdater *)self->_updater updateIfNeeded];
  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PXCMMTranscriptTextView.m", 75, @"Invalid parameter not satisfying: %@", @"_primaryLabel" object file lineNumber description];

    primaryLabel = self->_primaryLabel;
  }
  -[UILabel sizeThatFits:](primaryLabel, "sizeThatFits:", width, height);
  double v14 = v13;
  double v15 = v12;
  if (v6) {
    PXSizeClampToSize();
  }
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", width, height - v12 + -5.0);
  double v17 = v16;
  double v19 = v18;
  if (self->_secondaryLabel)
  {
    double v20 = 0.0;
    double v21 = v15 + 0.0 + 5.0;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.double width = v14;
  v32.size.double height = v15;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v20;
  v33.origin.y = v21;
  v33.size.double width = v17;
  v33.size.double height = v19;
  double v23 = fmax(MaxX, CGRectGetMaxX(v33));
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.double width = v14;
  v34.size.double height = v15;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.x = v20;
  v35.origin.y = v21;
  v35.size.double width = v17;
  v35.size.double height = v19;
  double v24 = CGRectGetMaxY(v35);
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXCMMTranscriptTextView semanticContentAttribute](self, "semanticContentAttribute"));
  if (v5)
  {
    double v26 = v23 - v14;
    if (v25 == 1) {
      double v20 = v23 - v17;
    }
    else {
      double v26 = 0.0;
    }
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v26, 0.0, v14, v15);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v20, v21, v17, v19);
  }
  double v27 = fmax(MaxY, v24);
  double v28 = v23;
  result.double height = v27;
  result.double width = v28;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMTranscriptTextView;
  [(PXCMMTranscriptTextView *)&v5 layoutSubviews];
  [(PXCMMTranscriptTextView *)self bounds];
  -[PXCMMTranscriptTextView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 1, 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXCMMTranscriptTextView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 0, 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setSecondaryText:(id)a3
{
  v8 = (NSString *)a3;
  double v4 = self->_secondaryText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      secondaryText = self->_secondaryText;
      self->_secondaryText = v6;

      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateSecondaryLabel];
    }
  }
}

- (void)setPrimaryText:(id)a3
{
  v8 = (NSString *)a3;
  double v4 = self->_primaryText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      primaryText = self->_primaryText;
      self->_primaryText = v6;

      [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updatePrimaryLabel];
    }
  }
}

- (PXCMMTranscriptTextView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXCMMTranscriptTextView;
  double v3 = -[PXCMMTranscriptTextView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel_setNeedsLayout];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updatePrimaryLabel needsUpdate:1];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateSecondaryLabel needsUpdate:0];
  }
  return v3;
}

- (PXCMMTranscriptTextView)initWithCoder:(id)a3
{
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMTranscriptTextView.m", 31, @"%s is not available as initializer", "-[PXCMMTranscriptTextView initWithCoder:]");

  abort();
}

@end