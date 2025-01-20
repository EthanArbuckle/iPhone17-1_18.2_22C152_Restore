@interface TwoLinesOutlineCellUGCRatingRequestAccessoryModel
- (BOOL)isEqual:(id)a3;
- (TwoLinesOutlineCellAccessoryDelegate)delegate;
- (TwoLinesOutlineCellUGCRatingRequestAccessoryModel)initWithDelegate:(id)a3;
- (id)createAccessoryConfigurationWithAction:(id)a3;
- (int64_t)visibility;
@end

@implementation TwoLinesOutlineCellUGCRatingRequestAccessoryModel

- (TwoLinesOutlineCellUGCRatingRequestAccessoryModel)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TwoLinesOutlineCellUGCRatingRequestAccessoryModel;
  v5 = [(TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)createAccessoryConfigurationWithAction:(id)a3
{
  id v3 = a3;
  id v4 = -[UGCProactiveCallToActionButtonView initWithFrame:]([UGCProactiveCallToActionButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = [(UGCProactiveCallToActionButtonView *)v4 button];
  [v5 addAction:v3 forControlEvents:0x2000];

  -[UGCProactiveCallToActionButtonView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UGCProactiveCallToActionButtonView setFrame:](v4, "setFrame:", 0.0, 0.0, v6, v7);
  id v8 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:v4];
  [v8 setUsesDefaultLayoutWidth:0];

  return v8;
}

- (int64_t)visibility
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v6 = v5;
    id v7 = [(TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)v6 visibility];
    if (v7 == (id)[(TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)self visibility])
    {
      id v8 = [(TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)v6 delegate];
      v9 = [(TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)self delegate];
      if (v8 == v9) {
        unsigned __int8 v10 = 1;
      }
      else {
        unsigned __int8 v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (TwoLinesOutlineCellAccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TwoLinesOutlineCellAccessoryDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end