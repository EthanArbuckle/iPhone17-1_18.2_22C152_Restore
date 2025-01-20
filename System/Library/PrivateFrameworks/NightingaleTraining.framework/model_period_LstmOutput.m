@interface model_period_LstmOutput
- (MLMultiArray)lstm_1_c_out;
- (MLMultiArray)lstm_1_h_out;
- (MLMultiArray)out_;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (model_period_LstmOutput)initWithOut:(id)a3 lstm_1_h_out:(id)a4 lstm_1_c_out:(id)a5;
- (void)setLstm_1_c_out:(id)a3;
- (void)setLstm_1_h_out:(id)a3;
- (void)setOut_:(id)a3;
@end

@implementation model_period_LstmOutput

- (model_period_LstmOutput)initWithOut:(id)a3 lstm_1_h_out:(id)a4 lstm_1_c_out:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)model_period_LstmOutput;
  v12 = [(model_period_LstmOutput *)&v15 init];
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
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_27069BBD0];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"out"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    v6 = [(model_period_LstmOutput *)self out];
    uint64_t v7 = [v5 featureValueWithMultiArray:v6];
LABEL_7:
    id v10 = (void *)v7;

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"lstm_1_h_out"])
  {
    v8 = (void *)MEMORY[0x263F00D50];
    v6 = [(model_period_LstmOutput *)self lstm_1_h_out];
    uint64_t v7 = [v8 featureValueWithMultiArray:v6];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"lstm_1_c_out"])
  {
    id v9 = (void *)MEMORY[0x263F00D50];
    v6 = [(model_period_LstmOutput *)self lstm_1_c_out];
    uint64_t v7 = [v9 featureValueWithMultiArray:v6];
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_8:

  return v10;
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