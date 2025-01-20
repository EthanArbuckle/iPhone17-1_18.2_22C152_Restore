@interface UPModelBundle
- (UPCalibrationModel)calibrationModel;
- (UPModelBundle)initWithLoadedModelConfiguration:(id)a3 parserModel:(id)a4 calibrationModel:(id)a5;
- (UPModelBundle)initWithPreprocessor:(id)a3 parserModel:(id)a4 calibrationModel:(id)a5;
- (UPParserModel)parserModel;
- (UPPreprocessor)preprocessor;
@end

@implementation UPModelBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_calibrationModel, 0);
  objc_storeStrong((id *)&self->_parserModel, 0);
}

- (UPPreprocessor)preprocessor
{
  return self->_preprocessor;
}

- (UPCalibrationModel)calibrationModel
{
  return self->_calibrationModel;
}

- (UPParserModel)parserModel
{
  return self->_parserModel;
}

- (UPModelBundle)initWithLoadedModelConfiguration:(id)a3 parserModel:(id)a4 calibrationModel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 preprocessor];
  v11 = [(UPModelBundle *)self initWithPreprocessor:v10 parserModel:v8 calibrationModel:v9];

  return v11;
}

- (UPModelBundle)initWithPreprocessor:(id)a3 parserModel:(id)a4 calibrationModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UPModelBundle;
  v12 = [(UPModelBundle *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preprocessor, a3);
    objc_storeStrong((id *)&v13->_parserModel, a4);
    objc_storeStrong((id *)&v13->_calibrationModel, a5);
  }

  return v13;
}

@end