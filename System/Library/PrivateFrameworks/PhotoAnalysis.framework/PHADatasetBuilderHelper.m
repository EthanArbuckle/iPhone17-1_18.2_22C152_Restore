@interface PHADatasetBuilderHelper
- (NSArray)dataLabelArray;
- (NSDictionary)fingerprints;
- (PHADatasetBuilderHelper)initWithDataLabelArray:(id)a3 fingerprints:(id)a4;
- (void)setDataLabelArray:(id)a3;
- (void)setFingerprints:(id)a3;
@end

@implementation PHADatasetBuilderHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprints, 0);

  objc_storeStrong((id *)&self->_dataLabelArray, 0);
}

- (void)setFingerprints:(id)a3
{
}

- (NSDictionary)fingerprints
{
  return self->_fingerprints;
}

- (void)setDataLabelArray:(id)a3
{
}

- (NSArray)dataLabelArray
{
  return self->_dataLabelArray;
}

- (PHADatasetBuilderHelper)initWithDataLabelArray:(id)a3 fingerprints:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHADatasetBuilderHelper;
  v9 = [(PHADatasetBuilderHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataLabelArray, a3);
    objc_storeStrong((id *)&v10->_fingerprints, a4);
  }

  return v10;
}

@end