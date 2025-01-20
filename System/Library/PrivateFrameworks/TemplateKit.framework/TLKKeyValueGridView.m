@interface TLKKeyValueGridView
- (NSMutableArray)keyLabels;
- (NSMutableArray)valueLabels;
- (TLKKeyValueGridView)init;
- (void)setKeyLabels:(id)a3;
- (void)setValueLabels:(id)a3;
- (void)updateWithTuples:(id)a3 valueColumnIsTrailing:(BOOL)a4 truncateKey:(BOOL)a5;
@end

@implementation TLKKeyValueGridView

- (TLKKeyValueGridView)init
{
  v7.receiver = self;
  v7.super_class = (Class)TLKKeyValueGridView;
  v2 = [(NUIContainerGridView *)&v7 initWithArrangedSubviewRows:0];
  v3 = v2;
  if (v2)
  {
    [(NUIContainerGridView *)v2 setRowSpacing:4.0];
    v4 = objc_opt_new();
    [(TLKKeyValueGridView *)v3 setKeyLabels:v4];

    v5 = objc_opt_new();
    [(TLKKeyValueGridView *)v3 setValueLabels:v5];

    [(NUIContainerGridView *)v3 setColumnSpacing:16.0];
  }
  return v3;
}

- (void)updateWithTuples:(id)a3 valueColumnIsTrailing:(BOOL)a4 truncateKey:(BOOL)a5
{
  BOOL v45 = a5;
  BOOL v5 = a4;
  v46[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 count];
  if (v8 != [(NUIContainerGridView *)self numberOfRows])
  {
    unint64_t v9 = [(NUIContainerGridView *)self numberOfRows];
    if (v9 >= [v7 count])
    {
      for (unint64_t i = [v7 count]; i < -[NUIContainerGridView numberOfRows](self, "numberOfRows"); ++i)
      {
        v44 = [(NUIContainerGridView *)self rowAtIndex:i];
        [v44 setHidden:1];
      }
    }
    else
    {
      unint64_t v10 = [(NUIContainerGridView *)self numberOfRows];
      if (v10 < [v7 count])
      {
        uint64_t v11 = *MEMORY[0x1E4FB28F0];
        do
        {
          v12 = objc_opt_new();
          v13 = +[TLKFontUtilities footnoteFont];
          [v12 setFont:v13];

          v14 = objc_opt_new();
          v15 = +[TLKFontUtilities cachedFontForTextStyle:v11 isShort:0 isBold:1];
          [v14 setFont:v15];

          LODWORD(v16) = 1148846080;
          [v12 setContentHuggingPriority:0 forAxis:v16];
          LODWORD(v17) = 1148829696;
          [v14 setContentHuggingPriority:0 forAxis:v17];
          v18 = [(TLKKeyValueGridView *)self keyLabels];
          [v18 addObject:v12];

          v19 = [(TLKKeyValueGridView *)self valueLabels];
          [v19 addObject:v14];

          v46[0] = v12;
          v46[1] = v14;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
          id v21 = [(NUIContainerGridView *)self addRowWithArrangedSubviews:v20];

          unint64_t v22 = [(NUIContainerGridView *)self numberOfRows];
        }
        while (v22 < [v7 count]);
      }
    }
  }
  if ([v7 count])
  {
    if (v5) {
      uint64_t v23 = 4;
    }
    else {
      uint64_t v23 = 1;
    }
    v24 = [(NUIContainerGridView *)self columnAtIndex:1];
    [v24 setAlignment:v23];
  }
  if ([v7 count])
  {
    unint64_t v25 = 0;
    do
    {
      v26 = [v7 objectAtIndexedSubscript:v25];
      v27 = [v26 key];
      v28 = [(TLKKeyValueGridView *)self keyLabels];
      v29 = [v28 objectAtIndexedSubscript:v25];
      [v29 setText:v27];

      v30 = [v26 value];
      v31 = [(TLKKeyValueGridView *)self valueLabels];
      v32 = [v31 objectAtIndexedSubscript:v25];
      [v32 setText:v30];

      if (v5)
      {
        if (+[TLKLayoutUtilities isLTR]) {
          uint64_t v33 = 2;
        }
        else {
          uint64_t v33 = 0;
        }
      }
      else
      {
        uint64_t v33 = 0;
      }
      v34 = [(TLKKeyValueGridView *)self valueLabels];
      v35 = [v34 objectAtIndexedSubscript:v25];
      [v35 setTextAlignment:v33];

      v36 = [(TLKKeyValueGridView *)self keyLabels];
      v37 = [v36 objectAtIndexedSubscript:v25];
      *(float *)&double v38 = 1000.0 - (float)v45;
      [v37 setContentCompressionResistancePriority:0 forAxis:v38];

      v39 = [(TLKKeyValueGridView *)self valueLabels];
      v40 = [v39 objectAtIndexedSubscript:v25];
      *(float *)&double v41 = 1000.0 - (float)!v45;
      [v40 setContentCompressionResistancePriority:0 forAxis:v41];

      v42 = [(NUIContainerGridView *)self rowAtIndex:v25];
      [v42 setHidden:0];

      ++v25;
    }
    while (v25 < [v7 count]);
  }
}

- (NSMutableArray)keyLabels
{
  return self->_keyLabels;
}

- (void)setKeyLabels:(id)a3
{
}

- (NSMutableArray)valueLabels
{
  return self->_valueLabels;
}

- (void)setValueLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabels, 0);
  objc_storeStrong((id *)&self->_keyLabels, 0);
}

@end