@interface CRFormDetectorModelOutput
- (CRFormDetectorModelOutput)initWithBoundingBoxes:(id)a3 classLogits:(id)a4 anchors:(id)a5;
- (MLMultiArray)anchors;
- (MLMultiArray)boundingBoxes;
- (MLMultiArray)classLogits;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setAnchors:(id)a3;
- (void)setBoundingBoxes:(id)a3;
- (void)setClassLogits:(id)a3;
@end

@implementation CRFormDetectorModelOutput

- (CRFormDetectorModelOutput)initWithBoundingBoxes:(id)a3 classLogits:(id)a4 anchors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRFormDetectorModelOutput;
  v12 = [(CRFormDetectorModelOutput *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_boundingBoxes, a3);
    objc_storeStrong((id *)&v13->_classLogits, a4);
    objc_storeStrong((id *)&v13->_anchors, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"bbox_regression";
  v6[1] = @"cls_logits";
  v6[2] = @"anchors";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"bbox_regression"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormDetectorModelOutput *)self boundingBoxes];
LABEL_7:
    v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"cls_logits"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormDetectorModelOutput *)self classLogits];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"anchors"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormDetectorModelOutput *)self anchors];
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (MLMultiArray)boundingBoxes
{
  return self->_boundingBoxes;
}

- (void)setBoundingBoxes:(id)a3
{
}

- (MLMultiArray)classLogits
{
  return self->_classLogits;
}

- (void)setClassLogits:(id)a3
{
}

- (MLMultiArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_classLogits, 0);
  objc_storeStrong((id *)&self->_boundingBoxes, 0);
}

@end