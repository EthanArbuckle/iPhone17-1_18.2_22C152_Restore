@interface RSSemanticSegmentation
- (RSSemanticSegmentation)init;
@end

@implementation RSSemanticSegmentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semResultData, 0);
  objc_storeStrong((id *)&self->_semanticConfig, 0);
  objc_storeStrong((id *)&self->_siSceneSegmentationAlgorithm, 0);
  objc_storeStrong((id *)&self->_cvRotate270r, 0);
  objc_storeStrong((id *)&self->_cvRotate270, 0);
  objc_storeStrong((id *)&self->_cvRotate180r, 0);
  objc_storeStrong((id *)&self->_cvRotate180, 0);
  objc_storeStrong((id *)&self->_cvRotate90r, 0);

  objc_storeStrong((id *)&self->_cvRotate90, 0);
}

- (RSSemanticSegmentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)RSSemanticSegmentation;
  v2 = [(RSSemanticSegmentation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_deviceOrientation = 0;
    *(_WORD *)&v2->_initRotater = 0;
    v4 = v2;
  }

  return v3;
}

@end