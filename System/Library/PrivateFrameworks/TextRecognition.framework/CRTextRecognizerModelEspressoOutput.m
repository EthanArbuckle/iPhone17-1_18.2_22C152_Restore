@interface CRTextRecognizerModelEspressoOutput
- ($FD4688982923A924290ECB669CAF1EC2)output_label_prob_map;
- (CRTextRecognizerModelEspressoOutput)initWithOutputLabelProbs:(id *)a3 featureInfo:(id)a4 batchSize:(unint64_t)a5;
- (NSArray)textFeatureInfo;
- (unint64_t)batchSize;
- (void)dealloc;
- (void)setBatchSize:(unint64_t)a3;
- (void)setOutput_label_prob_map:(id *)a3;
- (void)setTextFeatureInfo:(id)a3;
@end

@implementation CRTextRecognizerModelEspressoOutput

- (CRTextRecognizerModelEspressoOutput)initWithOutputLabelProbs:(id *)a3 featureInfo:(id)a4 batchSize:(unint64_t)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRTextRecognizerModelEspressoOutput;
  v9 = [(CRTextRecognizerModelEspressoOutput *)&v19 init];
  v10 = v9;
  if (v9)
  {
    long long v11 = *(_OWORD *)&a3->var12;
    v17[8] = *(_OWORD *)&a3->var10;
    v17[9] = v11;
    uint64_t v18 = *(void *)&a3->var14;
    long long v12 = *(_OWORD *)&a3->var4;
    v17[4] = *(_OWORD *)&a3->var3[2];
    v17[5] = v12;
    long long v13 = *(_OWORD *)&a3->var8;
    v17[6] = *(_OWORD *)&a3->var6;
    v17[7] = v13;
    long long v14 = *(_OWORD *)a3->var2;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v14;
    long long v15 = *(_OWORD *)a3->var3;
    v17[2] = *(_OWORD *)&a3->var2[2];
    v17[3] = v15;
    [(CRTextRecognizerModelEspressoOutput *)v9 setOutput_label_prob_map:v17];
    [(CRTextRecognizerModelEspressoOutput *)v10 setTextFeatureInfo:v8];
    [(CRTextRecognizerModelEspressoOutput *)v10 setBatchSize:a5];
  }

  return v10;
}

- (void)dealloc
{
  data = self->_output_label_prob_map.data;
  if (data)
  {
    free(data);
    self->_output_label_prob_map.data = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRTextRecognizerModelEspressoOutput;
  [(CRTextRecognizerModelEspressoOutput *)&v4 dealloc];
}

- (NSArray)textFeatureInfo
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTextFeatureInfo:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- ($FD4688982923A924290ECB669CAF1EC2)output_label_prob_map
{
  long long v3 = *(_OWORD *)&self->var11;
  long long v4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->var13;
  *(_OWORD *)&retstr->var12 = v4;
  *(void *)&retstr->var14 = self[1].var2[0];
  long long v5 = *(_OWORD *)&self->var3[3];
  long long v6 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var4 = v6;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->var9;
  *(_OWORD *)&retstr->var8 = v3;
  long long v7 = *(_OWORD *)&self->var2[3];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2[1];
  *(_OWORD *)retstr->var2 = v7;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->var3[1];
  *(_OWORD *)retstr->var3 = v5;
  return self;
}

- (void)setOutput_label_prob_map:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_output_label_prob_map.dim[2] = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_output_label_prob_map.dim = v4;
  *(_OWORD *)&self->_output_label_prob_map.data = v3;
  long long v5 = *(_OWORD *)a3->var3;
  long long v6 = *(_OWORD *)&a3->var3[2];
  long long v7 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_output_label_prob_map.channels = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_output_label_prob_map.width = v7;
  *(_OWORD *)&self->_output_label_prob_map.stride[2] = v6;
  *(_OWORD *)self->_output_label_prob_map.stride = v5;
  long long v8 = *(_OWORD *)&a3->var8;
  long long v9 = *(_OWORD *)&a3->var10;
  long long v10 = *(_OWORD *)&a3->var12;
  *(void *)&self->_output_label_prob_map.storage_type = *(void *)&a3->var14;
  *(_OWORD *)&self->_output_label_prob_map.stride_batch_number = v10;
  *(_OWORD *)&self->_output_label_prob_map.stride_height = v9;
  *(_OWORD *)&self->_output_label_prob_map.sequence_length = v8;
}

- (void).cxx_destruct
{
}

@end