@interface CRTextDetectorModelOutput
- (CRTextDetectorModelOutput)initWithF_score_act_sigmoid_output:(id)a3 geometry_output:(id)a4;
- (MLMultiArray)f_score_act_sigmoid_output;
- (MLMultiArray)geometry_output;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setF_score_act_sigmoid_output:(id)a3;
- (void)setGeometry_output:(id)a3;
@end

@implementation CRTextDetectorModelOutput

- (CRTextDetectorModelOutput)initWithF_score_act_sigmoid_output:(id)a3 geometry_output:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_f_score_act_sigmoid_output, a3);
    objc_storeStrong((id *)&self->_geometry_output, a4);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3933370];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"f_score_act_sigmoid_output"])
  {
    uint64_t v5 = 8;
LABEL_5:
    v6 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:*(Class *)((char *)&self->super.isa + v5)];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"geometry_output"])
  {
    uint64_t v5 = 16;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (MLMultiArray)f_score_act_sigmoid_output
{
  return self->_f_score_act_sigmoid_output;
}

- (void)setF_score_act_sigmoid_output:(id)a3
{
}

- (MLMultiArray)geometry_output
{
  return self->_geometry_output;
}

- (void)setGeometry_output:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry_output, 0);
  objc_storeStrong((id *)&self->_f_score_act_sigmoid_output, 0);
}

@end