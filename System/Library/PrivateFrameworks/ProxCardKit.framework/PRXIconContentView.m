@interface PRXIconContentView
- (NSArray)imageViews;
- (PRXIconContentView)initWithCardStyle:(int64_t)a3;
- (PRXLabel)bodyLabel;
- (void)setBodyLabel:(id)a3;
- (void)setImageViews:(id)a3;
- (void)updateConstraints;
@end

@implementation PRXIconContentView

- (PRXIconContentView)initWithCardStyle:(int64_t)a3
{
  v35[7] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)PRXIconContentView;
  v3 = [(PRXCardContentView *)&v34 initWithCardStyle:a3];
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    imageViewsGuide = v3->_imageViewsGuide;
    v3->_imageViewsGuide = v4;

    [(PRXIconContentView *)v3 addLayoutGuide:v3->_imageViewsGuide];
    v6 = [(PRXCardContentView *)v3 mainContentGuide];
    v7 = [(UILayoutGuide *)v3->_imageViewsGuide widthAnchor];
    v33 = [v7 constraintEqualToConstant:0.0];

    LODWORD(v8) = 1112276992;
    [v33 setPriority:v8];
    v9 = [(UILayoutGuide *)v3->_imageViewsGuide heightAnchor];
    v10 = [v9 constraintEqualToConstant:0.0];

    v11 = v10;
    v23 = v10;
    LODWORD(v12) = 1112276992;
    [v10 setPriority:v12];
    v26 = (void *)MEMORY[0x263F08938];
    v32 = [(UILayoutGuide *)v3->_imageViewsGuide topAnchor];
    v31 = [v6 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v29 = [(UILayoutGuide *)v3->_imageViewsGuide leadingAnchor];
    v28 = [v6 leadingAnchor];
    v27 = [v29 constraintGreaterThanOrEqualToAnchor:v28];
    v35[1] = v27;
    v25 = [(UILayoutGuide *)v3->_imageViewsGuide trailingAnchor];
    v24 = [v6 trailingAnchor];
    v13 = [v25 constraintLessThanOrEqualToAnchor:v24];
    v35[2] = v13;
    v14 = [(UILayoutGuide *)v3->_imageViewsGuide centerXAnchor];
    v15 = [v6 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v35[3] = v16;
    v17 = [(UILayoutGuide *)v3->_imageViewsGuide bottomAnchor];
    v18 = [v6 bottomAnchor];
    v19 = [v17 constraintLessThanOrEqualToAnchor:v18];
    v35[4] = v19;
    v35[5] = v33;
    v35[6] = v11;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:7];
    [v26 activateConstraints:v20];

    v21 = v3;
  }

  return v3;
}

- (void)updateConstraints
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)PRXIconContentView;
  [(PRXCardContentView *)&v49 updateConstraints];
  if ([(NSArray *)self->_imageViews count] && !self->_imageViewsConstraints)
  {
    v4 = [MEMORY[0x263EFF980] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obj = self->_imageViews;
    uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    id v5 = 0;
    if (v43)
    {
      uint64_t v41 = *(void *)v46;
      do
      {
        uint64_t v6 = 0;
        v7 = v5;
        do
        {
          if (*(void *)v46 != v41) {
            objc_enumerationMutation(obj);
          }
          double v8 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
          v9 = [v8 centerYAnchor];
          v10 = [v7 centerYAnchor];
          v11 = v10;
          if (!v10)
          {
            v2 = [(UILayoutGuide *)self->_imageViewsGuide centerYAnchor];
            v11 = v2;
          }
          double v12 = [v9 constraintEqualToAnchor:v11];
          [v4 addObject:v12];

          if (!v10) {
          v13 = [v8 topAnchor];
          }
          v14 = [(UILayoutGuide *)self->_imageViewsGuide topAnchor];
          v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
          [v4 addObject:v15];

          v16 = [v8 bottomAnchor];
          v17 = [(UILayoutGuide *)self->_imageViewsGuide bottomAnchor];
          v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
          [v4 addObject:v18];

          v19 = [v8 leadingAnchor];
          if (v7)
          {
            v20 = [v7 trailingAnchor];
            [v19 constraintEqualToAnchor:v20 constant:10.0];
          }
          else
          {
            v20 = [(UILayoutGuide *)self->_imageViewsGuide leadingAnchor];
            [v19 constraintEqualToAnchor:v20];
          v21 = };
          [v4 addObject:v21];

          id v5 = v8;
          ++v6;
          v7 = v5;
        }
        while (v43 != v6);
        uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v43);
    }

    v22 = [v5 trailingAnchor];
    v23 = [(UILayoutGuide *)self->_imageViewsGuide trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    v25 = (NSArray *)[v4 copy];
    imageViewsConstraints = self->_imageViewsConstraints;
    self->_imageViewsConstraints = v25;

    [MEMORY[0x263F08938] activateConstraints:self->_imageViewsConstraints];
  }
  if (self->_bodyLabel)
  {
    if (!self->_bodyLabelConstraints)
    {
      v27 = [(PRXCardContentView *)self mainContentGuide];
      v44 = [(PRXLabel *)self->_bodyLabel topAnchor];
      v42 = [(UILayoutGuide *)self->_imageViewsGuide bottomAnchor];
      id obja = [v44 constraintEqualToAnchor:v42 constant:20.0];
      v50[0] = obja;
      v38 = [(PRXLabel *)self->_bodyLabel leadingAnchor];
      v37 = [v27 leadingAnchor];
      v28 = [v38 constraintEqualToAnchor:v37];
      v50[1] = v28;
      v29 = [(PRXLabel *)self->_bodyLabel trailingAnchor];
      v30 = [v27 trailingAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      v50[2] = v31;
      v32 = [(PRXLabel *)self->_bodyLabel bottomAnchor];
      v33 = [v27 bottomAnchor];
      objc_super v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
      v50[3] = v34;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
      bodyLabelConstraints = self->_bodyLabelConstraints;
      self->_bodyLabelConstraints = v35;

      [MEMORY[0x263F08938] activateConstraints:self->_bodyLabelConstraints];
    }
  }
}

- (void)setImageViews:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = (NSArray *)a3;
  p_imageViews = &self->_imageViews;
  imageViews = self->_imageViews;
  if (imageViews != v5 && ![(NSArray *)imageViews isEqualToArray:v5])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v8 = *p_imageViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_imageViews, a3);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = *p_imageViews;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (void)v20);
          [(PRXIconContentView *)self addSubview:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    imageViewsConstraints = self->_imageViewsConstraints;
    self->_imageViewsConstraints = 0;

    if ([(NSArray *)*p_imageViews count]) {
      [(PRXIconContentView *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setBodyLabel:(id)a3
{
  id v5 = (PRXLabel *)a3;
  p_bodyLabel = &self->_bodyLabel;
  bodyLabel = self->_bodyLabel;
  uint64_t v9 = v5;
  if (bodyLabel != v5)
  {
    [(PRXLabel *)bodyLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_bodyLabel, a3);
    [(PRXLabel *)*p_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXIconContentView *)self addSubview:*p_bodyLabel];
    bodyLabelConstraints = self->_bodyLabelConstraints;
    self->_bodyLabelConstraints = 0;

    if (*p_bodyLabel) {
      [(PRXIconContentView *)self setNeedsUpdateConstraints];
    }
  }
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (PRXLabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageViewsGuide, 0);
  objc_storeStrong((id *)&self->_bodyLabelConstraints, 0);
  objc_storeStrong((id *)&self->_imageViewsConstraints, 0);
}

@end