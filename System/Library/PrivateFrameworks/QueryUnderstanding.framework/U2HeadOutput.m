@interface U2HeadOutput
- (MLMultiArray)arg_conf_scores;
- (MLMultiArray)intent_scores;
- (MLMultiArray)safety_head_scores;
- (MLMultiArray)top_arg_ids;
- (NSSet)featureNames;
- (U2HeadOutput)initWithTop_arg_ids:(id)a3 arg_conf_scores:(id)a4 intent_scores:(id)a5 safety_head_scores:(id)a6;
- (id)featureValueForName:(id)a3;
- (void)setArg_conf_scores:(id)a3;
- (void)setIntent_scores:(id)a3;
- (void)setSafety_head_scores:(id)a3;
- (void)setTop_arg_ids:(id)a3;
@end

@implementation U2HeadOutput

- (U2HeadOutput)initWithTop_arg_ids:(id)a3 arg_conf_scores:(id)a4 intent_scores:(id)a5 safety_head_scores:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)U2HeadOutput;
  v15 = [(U2HeadOutput *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_top_arg_ids, a3);
    objc_storeStrong((id *)&v16->_arg_conf_scores, a4);
    objc_storeStrong((id *)&v16->_intent_scores, a5);
    objc_storeStrong((id *)&v16->_safety_head_scores, a6);
  }

  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_270891EA8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"top_arg_ids"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadOutput *)self top_arg_ids];
LABEL_9:
    v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"arg_conf_scores"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadOutput *)self arg_conf_scores];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"intent_scores"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadOutput *)self intent_scores];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"safety_head_scores"])
  {
    v5 = (void *)MEMORY[0x263F00D50];
    uint64_t v6 = [(U2HeadOutput *)self safety_head_scores];
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (MLMultiArray)top_arg_ids
{
  return self->_top_arg_ids;
}

- (void)setTop_arg_ids:(id)a3
{
}

- (MLMultiArray)arg_conf_scores
{
  return self->_arg_conf_scores;
}

- (void)setArg_conf_scores:(id)a3
{
}

- (MLMultiArray)intent_scores
{
  return self->_intent_scores;
}

- (void)setIntent_scores:(id)a3
{
}

- (MLMultiArray)safety_head_scores
{
  return self->_safety_head_scores;
}

- (void)setSafety_head_scores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safety_head_scores, 0);
  objc_storeStrong((id *)&self->_intent_scores, 0);
  objc_storeStrong((id *)&self->_arg_conf_scores, 0);
  objc_storeStrong((id *)&self->_top_arg_ids, 0);
}

@end