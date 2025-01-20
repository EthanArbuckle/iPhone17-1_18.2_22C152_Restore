@interface model_fwEnd_10pctOutput
- (MLMultiArray)lstm_1_c_out;
- (MLMultiArray)lstm_1_h_out;
- (MLMultiArray)out_;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (model_fwEnd_10pctOutput)initWithOut:(id)a3 lstm_1_h_out:(id)a4 lstm_1_c_out:(id)a5;
- (void)setLstm_1_c_out:(id)a3;
- (void)setLstm_1_h_out:(id)a3;
- (void)setOut_:(id)a3;
@end

@implementation model_fwEnd_10pctOutput

- (model_fwEnd_10pctOutput)initWithOut:(id)a3 lstm_1_h_out:(id)a4 lstm_1_c_out:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)model_fwEnd_10pctOutput;
  v12 = [(model_fwEnd_10pctOutput *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_out_, a3);
    objc_storeStrong((id *)&v13->_lstm_1_h_out, a4);
    objc_storeStrong((id *)&v13->_lstm_1_c_out, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26E28F9E0];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"out"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(model_fwEnd_10pctOutput *)self out];
LABEL_7:
    v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"lstm_1_h_out"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(model_fwEnd_10pctOutput *)self lstm_1_h_out];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"lstm_1_c_out"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(model_fwEnd_10pctOutput *)self lstm_1_c_out];
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (MLMultiArray)out_
{
  return self->_out_;
}

- (void)setOut_:(id)a3
{
}

- (MLMultiArray)lstm_1_h_out
{
  return self->_lstm_1_h_out;
}

- (void)setLstm_1_h_out:(id)a3
{
}

- (MLMultiArray)lstm_1_c_out
{
  return self->_lstm_1_c_out;
}

- (void)setLstm_1_c_out:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lstm_1_c_out, 0);
  objc_storeStrong((id *)&self->_lstm_1_h_out, 0);
  objc_storeStrong((id *)&self->_out_, 0);
}

@end