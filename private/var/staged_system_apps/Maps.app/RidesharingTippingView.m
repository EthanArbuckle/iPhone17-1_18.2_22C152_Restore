@interface RidesharingTippingView
- (NSArray)tippingOptions;
- (RidesharingTippingView)initWithCoder:(id)a3;
- (RidesharingTippingView)initWithOptions:(id)a3 updateBlock:(id)a4;
- (RidesharingTippingViewDelegate)delegate;
- (id)description;
- (void)_commonInitWithOptions:(id)a3;
- (void)_selectedOption:(id)a3 fromOptions:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTippingOptions:(id)a3;
- (void)tapped:(id)a3;
@end

@implementation RidesharingTippingView

- (RidesharingTippingView)initWithOptions:(id)a3 updateBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingTippingView;
  v8 = [(RidesharingTippingView *)&v14 init];
  if (v8)
  {
    id v9 = [v7 copy];
    id updateBlock = v8->_updateBlock;
    v8->_id updateBlock = v9;

    if (v6) {
      v11 = v6;
    }
    else {
      v11 = &__NSArray0__struct;
    }
    [(RidesharingTippingView *)v8 _commonInitWithOptions:v11];
    v12 = v8;
  }

  return v8;
}

- (RidesharingTippingView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RidesharingTippingView;
  v3 = [(RidesharingTippingView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(RidesharingTippingView *)v3 _commonInitWithOptions:&__NSArray0__struct];
    v5 = v4;
  }

  return v4;
}

- (void)_commonInitWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(RidesharingTippingView *)self layer];
  [v5 setCornerRadius:4.0];

  id v6 = [(RidesharingTippingView *)self layer];
  [v6 setMasksToBounds:1];

  objc_super v7 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v7;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setSpacing:0.0];
  [(UIStackView *)self->_stackView setDistribution:1];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(RidesharingTippingView *)self addSubview:self->_stackView];
  id v9 = [(UIStackView *)self->_stackView topAnchor];
  v10 = [(RidesharingTippingView *)self topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(UIStackView *)self->_stackView leadingAnchor];
  v13 = [(RidesharingTippingView *)self leadingAnchor];
  objc_super v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [(UIStackView *)self->_stackView bottomAnchor];
  v16 = [(RidesharingTippingView *)self bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(UIStackView *)self->_stackView trailingAnchor];
  v19 = [(RidesharingTippingView *)self trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  [(RidesharingTippingView *)self setTippingOptions:v4];
  v21 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapped:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v21;

  [(UITapGestureRecognizer *)self->_tapGesture setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_tapGesture setNumberOfTouchesRequired:1];
  v23 = self->_tapGesture;

  [(RidesharingTippingView *)self addGestureRecognizer:v23];
}

- (void)tapped:(id)a3
{
  id v4 = a3;
  v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  if ([v5 count])
  {
    for (unint64_t i = 0; i < (unint64_t)[v5 count]; ++i)
    {
      id v7 = [v5 objectAtIndexedSubscript:i];
      objc_opt_class();
      id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      id v9 = v8;

      if (!v9) {
        break;
      }
      [v4 locationInView:v9];
      if (objc_msgSend(v9, "pointInside:withEvent:", 0))
      {
        if ([v9 isOther])
        {
          v46 = self;
          v10 = +[NSLocale currentLocale];
          v44 = [v10 currencySymbol];

          v11 = +[NSLocale currentLocale];
          v47 = [v11 currencyCode];

          long long v59 = 0u;
          long long v60 = 0u;
          long long v58 = 0u;
          long long v57 = 0u;
          id v12 = v5;
          id v13 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v58;
            while (2)
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v58 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
                v18 = [v17 amount];
                v19 = [v18 currencySymbol];

                if (v19)
                {
                  id v21 = [v19 copy];

                  v22 = [v17 amount];
                  uint64_t v23 = [v22 currencyCode];

                  v20 = v21;
                  v47 = (void *)v23;
                  goto LABEL_22;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
          v20 = v44;
LABEL_22:

          v24 = +[NSBundle mainBundle];
          v25 = [v24 localizedStringForKey:@"ridesharing.feedback.tip.customTip.title" value:@"localized string not found" table:0];
          v26 = +[NSBundle mainBundle];
          v27 = [v26 localizedStringForKey:@"ridesharing.feedback.tip.customTip.message" value:@"localized string not found" table:0];
          v28 = +[UIAlertController alertControllerWithTitle:v25 message:v27 preferredStyle:1];

          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_10067A954;
          v54[3] = &unk_1012F3D50;
          id v29 = v9;
          id v55 = v29;
          id v45 = v20;
          id v56 = v45;
          v30 = v28;
          [v28 addTextFieldWithConfigurationHandler:v54];
          v31 = +[NSBundle mainBundle];
          v32 = [v31 localizedStringForKey:@"ridesharing.feedback.tip.customTip.cancel" value:@"localized string not found" table:0];
          v33 = +[UIAlertAction actionWithTitle:v32 style:1 handler:0];
          [v30 addAction:v33];

          v34 = +[NSBundle mainBundle];
          v35 = [v34 localizedStringForKey:@"ridesharing.feedback.tip.customTip.addTip" value:@"localized string not found" table:0];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10067AB64;
          v48[3] = &unk_1012F3D78;
          id v36 = v30;
          id v49 = v36;
          id v7 = v29;
          id v50 = v7;
          id v37 = v47;
          id v51 = v37;
          v52 = v46;
          id v53 = v12;
          v38 = +[UIAlertAction actionWithTitle:v35 style:0 handler:v48];
          [v36 addAction:v38];

          uint64_t v39 = [(RidesharingTippingView *)v46 delegate];
          if (v39)
          {
            v40 = (void *)v39;
            v41 = [(RidesharingTippingView *)v46 delegate];
            char v42 = objc_opt_respondsToSelector();

            if (v42)
            {
              v43 = [(RidesharingTippingView *)v46 delegate];
              [v43 presentCustomTipAlert:v36];
            }
          }
        }
        else
        {
          [(RidesharingTippingView *)self _selectedOption:v9 fromOptions:v5];
        }

        break;
      }
    }
  }
}

- (void)_selectedOption:(id)a3 fromOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 isSelected] ^ 1;
  uint64_t v9 = [v6 isOther] | v8;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) setSelected:0, (void)v17];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v6 setSelected:v9];
  id updateBlock = (void (**)(id, void *))self->_updateBlock;
  if (updateBlock)
  {
    if (v9)
    {
      v16 = [v6 amount];
      updateBlock[2](updateBlock, v16);
    }
    else
    {
      updateBlock[2](updateBlock, 0);
    }
  }
}

- (id)description
{
  v2 = [(UIStackView *)self->_stackView arrangedSubviews];
  v3 = +[NSString stringWithFormat:@"RidesharingTippingView\nOptions:%@", v2];

  return v3;
}

- (void)setTippingOptions:(id)a3
{
  id v4 = a3;
  if (![(NSArray *)self->_tippingOptions isEqualToArray:v4])
  {
    id v5 = [v4 mutableCopy];
    id v6 = [v5 sortedArrayUsingComparator:&stru_1012F3DB8];
    tippingOptions = self->_tippingOptions;
    self->_tippingOptions = v6;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unsigned int v8 = [(UIStackView *)self->_stackView arrangedSubviews];
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          [(UIStackView *)self->_stackView removeArrangedSubview:*(void *)(*((void *)&v25 + 1) + 8 * (void)v12)];
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = self->_tippingOptions;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        long long v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v17);
          long long v19 = objc_alloc_init(RidesharingTippingOptionView);
          -[RidesharingTippingOptionView setAmount:](v19, "setAmount:", v18, (void)v21);
          [(UIStackView *)self->_stackView addArrangedSubview:v19];
          [(RidesharingTippingOptionView *)v19 setNeedsDisplay];

          long long v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }

    long long v20 = objc_alloc_init(RidesharingTippingOptionView);
    [(RidesharingTippingOptionView *)v20 setOther:1];
    [(UIStackView *)self->_stackView addArrangedSubview:v20];
    [(RidesharingTippingOptionView *)v20 setNeedsDisplay];
  }
}

- (RidesharingTippingViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)tippingOptions
{
  return self->_tippingOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tippingOptions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong(&self->_updateBlock, 0);
}

@end