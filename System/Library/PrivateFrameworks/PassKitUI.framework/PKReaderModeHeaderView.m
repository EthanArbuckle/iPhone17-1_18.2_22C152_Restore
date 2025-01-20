@interface PKReaderModeHeaderView
- (PKReaderModeHeaderView)initWithState:(unint64_t)a3 context:(int64_t)a4 product:(id)a5;
- (id)_subtitleForState:(unint64_t)a3;
- (id)_titleForState:(unint64_t)a3;
- (unint64_t)state;
- (void)_configureForCurrentState;
- (void)layoutSubviews;
- (void)setState:(unint64_t)a3;
@end

@implementation PKReaderModeHeaderView

- (PKReaderModeHeaderView)initWithState:(unint64_t)a3 context:(int64_t)a4 product:(id)a5
{
  v19[6] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKReaderModeHeaderView;
  v10 = -[PKTableHeaderView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    objc_storeStrong((id *)&v10->_product, a5);
    v19[0] = @"transferValue";
    v19[1] = @"notFound";
    v19[2] = @"transferValue";
    v19[3] = @"transferring";
    v19[4] = @"cardAdded";
    v19[5] = @"commuteCardAdded";
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:6];
    resourceKeys = v11->_resourceKeys;
    v11->_resourceKeys = (NSArray *)v12;

    v11->_context = a4;
    v14 = [v9 provisioningMethodMetadataForType:*MEMORY[0x1E4F87AA0]];
    uint64_t v15 = [v14 readerModeResources];
    readerModeResources = v11->_readerModeResources;
    v11->_readerModeResources = (NSDictionary *)v15;

    [(PKReaderModeHeaderView *)v11 _configureForCurrentState];
  }

  return v11;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  [(PKReaderModeHeaderView *)self _configureForCurrentState];
}

- (id)_titleForState:(unint64_t)a3
{
  v5 = -[NSArray objectAtIndexedSubscript:](self->_resourceKeys, "objectAtIndexedSubscript:");
  v6 = [(NSDictionary *)self->_readerModeResources objectForKeyedSubscript:@"readerModeScreens"];
  v7 = [v6 objectForKeyedSubscript:v5];
  v8 = [v7 objectForKeyedSubscript:@"localizedTitle"];

  if (!v8)
  {
    if (a3 > 5)
    {
      v8 = 0;
    }
    else
    {
      v8 = PKLocalizedPaymentString(&off_1E59CC488[a3]->isa);
    }
  }

  return v8;
}

- (id)_subtitleForState:(unint64_t)a3
{
  v5 = -[NSArray objectAtIndexedSubscript:](self->_resourceKeys, "objectAtIndexedSubscript:");
  v6 = [(NSDictionary *)self->_readerModeResources objectForKeyedSubscript:@"readerModeScreens"];
  v7 = [v6 objectForKeyedSubscript:v5];
  v8 = [v7 objectForKeyedSubscript:@"localizedDescription"];

  if (!v8)
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        id v9 = [(PKPaymentSetupProduct *)self->_product displayName];
        PKLocalizedPaymentString(&cfstr_ReaderModeProv_3.isa, &stru_1EF1B4C70.isa, v9);
        goto LABEL_10;
      case 1uLL:
        v10 = @"READER_MODE_PROVISIONING_CARD_NOT_FOUND_SUBTITLE";
        goto LABEL_7;
      case 3uLL:
        v10 = @"READER_MODE_PROVISIONING_TRANSFERRING_SUBTITLE";
LABEL_7:
        v8 = PKLocalizedPaymentString(&v10->isa);
        break;
      case 4uLL:
        id v9 = [(PKPaymentSetupProduct *)self->_product displayName];
        PKLocalizedPaymentString(&cfstr_ReaderModeProv_6.isa, &stru_1EF1B4C70.isa, v9);
        goto LABEL_10;
      case 5uLL:
        id v9 = [(PKPaymentSetupProduct *)self->_product displayName];
        PKLocalizedPaymentString(&cfstr_ReaderModeProv_7.isa, &stru_1EF1B4C70.isa, v9);
        v8 = LABEL_10:;

        break;
      default:
        v8 = 0;
        break;
    }
  }

  return v8;
}

- (void)_configureForCurrentState
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PKReaderModeHeaderView *)self _titleForState:self->_state];
  v4 = [(PKReaderModeHeaderView *)self _subtitleForState:self->_state];
  v5 = [(PKTableHeaderView *)self titleLabel];
  [v5 setText:v3];

  BOOL v6 = (self->_state & 0xFFFFFFFFFFFFFFFELL) == 4;
  v7 = [(PKTableHeaderView *)self checkmarkLayer];
  [v7 setRevealed:v6 animated:0];

  v8 = [(PKTableHeaderView *)self subtitleLabel];
  id v9 = v8;
  if (v4)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v10 setLineSpacing:1.0];
    [v10 setParagraphSpacing:-7.0];
    [v10 setAlignment:1];
    v16[0] = *MEMORY[0x1E4FB06F8];
    v11 = [v9 font];
    v17[0] = v11;
    v16[1] = *MEMORY[0x1E4FB0700];
    uint64_t v12 = [v9 textColor];
    v17[1] = v12;
    v16[2] = *MEMORY[0x1E4FB06C0];
    v13 = [v9 backgroundColor];
    v16[3] = *MEMORY[0x1E4FB0738];
    v17[2] = v13;
    v17[3] = v10;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v14];
    [v9 setAttributedText:v15];
  }
  else
  {
    [v8 setText:0];
  }
  [(PKTableHeaderView *)self setActionTitle:0];
  [(PKReaderModeHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKReaderModeHeaderView;
  [(PKTableHeaderView *)&v4 layoutSubviews];
  v3 = [(PKTableHeaderView *)self subtitleLabel];
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerModeResources, 0);
  objc_storeStrong((id *)&self->_resourceKeys, 0);

  objc_storeStrong((id *)&self->_product, 0);
}

@end