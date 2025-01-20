@interface model_period_LstmInput
- (MLMultiArray)in_;
- (MLMultiArray)lstm_1_c_in;
- (MLMultiArray)lstm_1_h_in;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (model_period_LstmInput)initWithIn:(id)a3;
- (model_period_LstmInput)initWithIn:(id)a3 lstm_1_h_in:(id)a4 lstm_1_c_in:(id)a5;
- (void)setIn_:(id)a3;
- (void)setLstm_1_c_in:(id)a3;
- (void)setLstm_1_h_in:(id)a3;
@end

@implementation model_period_LstmInput

- (model_period_LstmInput)initWithIn:(id)a3
{
  return [(model_period_LstmInput *)self initWithIn:a3 lstm_1_h_in:0 lstm_1_c_in:0];
}

- (model_period_LstmInput)initWithIn:(id)a3 lstm_1_h_in:(id)a4 lstm_1_c_in:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)model_period_LstmInput;
  v12 = [(model_period_LstmInput *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_in_, a3);
    objc_storeStrong((id *)&v13->_lstm_1_h_in, a4);
    objc_storeStrong((id *)&v13->_lstm_1_c_in, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_27069BBB8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"in"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    v6 = [(model_period_LstmInput *)self in];
    v7 = [v5 featureValueWithMultiArray:v6];
LABEL_11:

    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"lstm_1_h_in"])
  {
    v6 = [(model_period_LstmInput *)self lstm_1_h_in];
    if (v6)
    {
      v8 = (void *)MEMORY[0x263F00D50];
      id v9 = [(model_period_LstmInput *)self lstm_1_h_in];
      uint64_t v10 = [v8 featureValueWithMultiArray:v9];
LABEL_9:
      v7 = (void *)v10;

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"lstm_1_c_in"])
  {
    v6 = [(model_period_LstmInput *)self lstm_1_c_in];
    if (v6)
    {
      id v11 = (void *)MEMORY[0x263F00D50];
      id v9 = [(model_period_LstmInput *)self lstm_1_c_in];
      uint64_t v10 = [v11 featureValueWithMultiArray:v9];
      goto LABEL_9;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (MLMultiArray)in_
{
  return self->_in_;
}

- (void)setIn_:(id)a3
{
}

- (MLMultiArray)lstm_1_h_in
{
  return self->_lstm_1_h_in;
}

- (void)setLstm_1_h_in:(id)a3
{
}

- (MLMultiArray)lstm_1_c_in
{
  return self->_lstm_1_c_in;
}

- (void)setLstm_1_c_in:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lstm_1_c_in, 0);
  objc_storeStrong((id *)&self->_lstm_1_h_in, 0);
  objc_storeStrong((id *)&self->_in_, 0);
}

@end