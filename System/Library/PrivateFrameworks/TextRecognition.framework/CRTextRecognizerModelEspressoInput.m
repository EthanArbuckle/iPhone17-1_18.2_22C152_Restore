@interface CRTextRecognizerModelEspressoInput
- (CRTextRecognizerModelEspressoInput)initWithImg_input:(vImage_Buffer *)a3 batchSize:(unint64_t)a4 featureInfo:(id)a5;
- (NSArray)textFeatureInfo;
- (unint64_t)batchSize;
- (vImage_Buffer)img_input;
- (void)dealloc;
- (void)setBatchSize:(unint64_t)a3;
- (void)setImg_input:(vImage_Buffer *)a3;
- (void)setTextFeatureInfo:(id)a3;
@end

@implementation CRTextRecognizerModelEspressoInput

- (CRTextRecognizerModelEspressoInput)initWithImg_input:(vImage_Buffer *)a3 batchSize:(unint64_t)a4 featureInfo:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRTextRecognizerModelEspressoInput;
  v9 = [(CRTextRecognizerModelEspressoInput *)&v14 init];
  v10 = v9;
  if (v9)
  {
    long long v11 = *(_OWORD *)&a3->width;
    v13[0] = *(_OWORD *)&a3->data;
    v13[1] = v11;
    [(CRTextRecognizerModelEspressoInput *)v9 setImg_input:v13];
    [(CRTextRecognizerModelEspressoInput *)v10 setTextFeatureInfo:v8];
    [(CRTextRecognizerModelEspressoInput *)v10 setBatchSize:a4];
  }

  return v10;
}

- (void)dealloc
{
  if (self->_img_input.data)
  {
    [(CRTextRecognizerModelEspressoInput *)self img_input];
    free(v4);
    self->_img_input.data = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRTextRecognizerModelEspressoInput;
  [(CRTextRecognizerModelEspressoInput *)&v3 dealloc];
}

- (NSArray)textFeatureInfo
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTextFeatureInfo:(id)a3
{
}

- (vImage_Buffer)img_input
{
  long long v3 = *(_OWORD *)&self[1].height;
  *(_OWORD *)&retstr->data = *(_OWORD *)&self->rowBytes;
  *(_OWORD *)&retstr->width = v3;
  return self;
}

- (void)setImg_input:(vImage_Buffer *)a3
{
  long long v3 = *(_OWORD *)&a3->data;
  *(_OWORD *)&self->_img_input.width = *(_OWORD *)&a3->width;
  *(_OWORD *)&self->_img_input.data = v3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
}

@end