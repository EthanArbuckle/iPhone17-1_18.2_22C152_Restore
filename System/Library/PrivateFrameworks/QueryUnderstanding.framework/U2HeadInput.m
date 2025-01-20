@interface U2HeadInput
- (MLMultiArray)input_mask;
- (MLMultiArray)input_span_features;
- (MLMultiArray)sequence_output;
- (NSSet)featureNames;
- (U2HeadInput)initWithInput_mask:(id)a3 input_span_features:(id)a4 sequence_output:(id)a5;
- (id)featureValueForName:(id)a3;
- (void)setInput_mask:(id)a3;
- (void)setInput_span_features:(id)a3;
- (void)setSequence_output:(id)a3;
@end

@implementation U2HeadInput

- (U2HeadInput)initWithInput_mask:(id)a3 input_span_features:(id)a4 sequence_output:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)U2HeadInput;
  v12 = [(U2HeadInput *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_input_mask, a3);
    objc_storeStrong((id *)&v13->_input_span_features, a4);
    objc_storeStrong((id *)&v13->_sequence_output, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_270891E90];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"input_mask"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadInput *)self input_mask];
LABEL_7:
    v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"input_span_features"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadInput *)self input_span_features];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"sequence_output"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadInput *)self sequence_output];
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (MLMultiArray)input_mask
{
  return self->_input_mask;
}

- (void)setInput_mask:(id)a3
{
}

- (MLMultiArray)input_span_features
{
  return self->_input_span_features;
}

- (void)setInput_span_features:(id)a3
{
}

- (MLMultiArray)sequence_output
{
  return self->_sequence_output;
}

- (void)setSequence_output:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence_output, 0);
  objc_storeStrong((id *)&self->_input_span_features, 0);

  objc_storeStrong((id *)&self->_input_mask, 0);
}

@end