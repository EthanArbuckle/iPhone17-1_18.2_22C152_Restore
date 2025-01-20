@interface PTHandGesture
+ (id)gestureTypeToString:(unsigned int)a3;
- (CGRect)boundingBox;
- (NSArray)handKeypoints;
- (NSNumber)confidence;
- (NSNumber)handID;
- (NSNumber)personID;
- (PTHandGesture)initWithType:(unsigned int)a3 chirality:(unsigned int)a4 boundingBox:(CGRect)a5 confidence:(id)a6 personID:(id)a7 handID:(id)a8;
- (PTHandGesture)initWithVCPHandObservation:(id)a3;
- (unsigned)fpMitigation;
- (unsigned)handChirality;
- (unsigned)type;
@end

@implementation PTHandGesture

- (PTHandGesture)initWithVCPHandObservation:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PTHandGesture;
  v5 = [(PTHandGesture *)&v25 init];
  if (v5)
  {
    [v4 bounds];
    v5->_boundingBox.origin.x = v6;
    v5->_boundingBox.origin.y = v7;
    v5->_boundingBox.size.width = v8;
    v5->_boundingBox.size.height = v9;
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "groupID"));
    personID = v5->_personID;
    v5->_personID = (NSNumber *)v10;

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "handID"));
    handID = v5->_handID;
    v5->_handID = (NSNumber *)v12;

    v14 = NSNumber;
    [v4 gestureConfidence];
    uint64_t v15 = objc_msgSend(v14, "numberWithFloat:");
    confidence = v5->_confidence;
    v5->_confidence = (NSNumber *)v15;

    uint64_t v17 = [v4 keypoints];
    handKeypoints = v5->_handKeypoints;
    v5->_handKeypoints = (NSArray *)v17;

    v5->_type = 0;
    unsigned int v19 = [v4 gestureType] - 2;
    if (v19 <= 0xF && ((0xBCE1u >> v19) & 1) != 0) {
      v5->_type = dword_1D0840638[v19];
    }
    unsigned int v20 = [v4 chirality] + 1;
    if (v20 <= 2) {
      v5->_handChirality = dword_1D0840678[v20];
    }
    uint64_t v21 = [v4 mitigationType];
    if (v21 <= 15)
    {
      int v22 = 0;
      switch(v21)
      {
        case 0:
          goto LABEL_22;
        case 1:
          int v22 = 1;
          goto LABEL_22;
        case 2:
          int v22 = 2;
          goto LABEL_22;
        case 4:
          int v22 = 3;
          goto LABEL_22;
        case 8:
          int v22 = 4;
          goto LABEL_22;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (v21 > 63)
    {
      if (v21 == 64)
      {
        int v22 = 7;
        goto LABEL_22;
      }
      if (v21 == 128)
      {
        int v22 = 8;
        goto LABEL_22;
      }
    }
    else
    {
      if (v21 == 16)
      {
        int v22 = 5;
        goto LABEL_22;
      }
      if (v21 == 32)
      {
        int v22 = 6;
LABEL_22:
        v5->_fpMitigation = v22;
      }
    }
LABEL_23:
    v23 = v5;
  }

  return v5;
}

- (PTHandGesture)initWithType:(unsigned int)a3 chirality:(unsigned int)a4 boundingBox:(CGRect)a5 confidence:(id)a6 personID:(id)a7 handID:(id)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PTHandGesture;
  unsigned int v20 = [(PTHandGesture *)&v24 init];
  uint64_t v21 = v20;
  if (v20)
  {
    v20->_type = 0;
    v20->_handChiralitCGFloat y = a4;
    objc_storeStrong((id *)&v20->_confidence, a6);
    v21->_boundingBox.origin.CGFloat x = x;
    v21->_boundingBox.origin.CGFloat y = y;
    v21->_boundingBox.size.CGFloat width = width;
    v21->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v21->_personID, a7);
    objc_storeStrong((id *)&v21->_handID, a8);
    int v22 = v21;
  }

  return v21;
}

+ (id)gestureTypeToString:(unsigned int)a3
{
  if (a3 > 9) {
    return @"Undefined";
  }
  else {
    return off_1E6884840[a3];
  }
}

- (unsigned)type
{
  return self->_type;
}

- (NSNumber)confidence
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)handChirality
{
  return self->_handChirality;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (NSNumber)personID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)handID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)handKeypoints
{
  return self->_handKeypoints;
}

- (unsigned)fpMitigation
{
  return self->_fpMitigation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handKeypoints, 0);
  objc_storeStrong((id *)&self->_handID, 0);
  objc_storeStrong((id *)&self->_personID, 0);

  objc_storeStrong((id *)&self->_confidence, 0);
}

@end