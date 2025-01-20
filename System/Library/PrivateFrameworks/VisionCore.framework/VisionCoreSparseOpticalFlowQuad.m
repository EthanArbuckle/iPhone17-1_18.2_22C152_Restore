@interface VisionCoreSparseOpticalFlowQuad
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (NSUUID)UUID;
- (VisionCoreSparseOpticalFlowQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 indentifier:(id)a7;
- (VisionCoreSparseOpticalFlowQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 indentifier:(id)a7 homographyGroupID:(int)a8;
- (double)getEmptyDistanceBetweenCenters:(id)a3;
- (int)homographyGroupID;
- (void)generateGridKeypointsWithMaxKeypoints:(char *)a3@<X8> minGridFrequency:(float)a4@<S0>;
@end

@implementation VisionCoreSparseOpticalFlowQuad

- (void).cxx_destruct
{
}

- (int)homographyGroupID
{
  return self->_homographyGroupID;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)generateGridKeypointsWithMaxKeypoints:(char *)a3@<X8> minGridFrequency:(float)a4@<S0>
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  double v4 = a1[7];
  double v5 = a1[8];
  double v6 = a1[9];
  double v7 = a1[10];
  double v8 = a1[5];
  double v9 = a1[6];
  double v10 = a1[3];
  double v11 = a1[4];
  float v12 = (v4 - v6 + v8 - v10) * 0.5;
  float v13 = (v5 - v7 + v9 - v11) * 0.5;
  float v14 = (v8 - v4 + v10 - v6) * 0.5;
  float v15 = (v9 - v5 + v11 - v7) * 0.5;
  float v16 = sqrtf((float)(v13 * v13) + (float)(v12 * v12));
  float v17 = 1.0;
  if (v16 < 1.0) {
    float v16 = 1.0;
  }
  float v18 = sqrtf((float)(v15 * v15) + (float)(v14 * v14));
  if (v18 >= 1.0) {
    float v17 = v18;
  }
  float v19 = sqrtf((float)(v16 * a4) / v17);
  if (v19 >= (float)a2) {
    float v20 = v19;
  }
  else {
    float v20 = (float)a2;
  }
  float v21 = sqrtf((float)(v17 * a4) / v16);
  if (v21 < (float)a2) {
    float v21 = (float)a2;
  }
  float v69 = v21;
  if (v21 > 0.0)
  {
    v23 = 0;
    int v24 = 0;
    float v25 = v13 / v20;
    float v26 = v14 / v21;
    float v67 = v25 * 0.5;
    float v68 = (float)(v12 / v20) * 0.5;
    float v72 = v26 + (float)(v12 / v20);
    float v73 = v12 / v20;
    float v64 = v15 / v21;
    float v65 = v26;
    float v70 = (float)(v15 / v21) + v25;
    float v71 = v25;
    float v27 = 0.0;
    do
    {
      if (v24) {
        float v28 = v67;
      }
      else {
        float v28 = 0.0;
      }
      if (v24) {
        float v29 = v68;
      }
      else {
        float v29 = 0.0;
      }
      if (v20 > 0.0)
      {
        int v30 = 0;
        float v31 = a1[9] + (float)(v65 * v27);
        float v32 = a1[10] + (float)(v64 * v27);
        unint64_t v33 = (unint64_t)a3[2];
        v34 = *a3;
        float v35 = 0.0;
        int v36 = v24;
        do
        {
          int v37 = rand();
          int v38 = rand();
          _S8 = (float)(v29 + (float)(v31 + (float)(v35 * v73)))
              + (float)(v72 * (float)((float)((float)v37 * 4.6566e-10) + -0.5));
          if ((unint64_t)v23 >= v33)
          {
            uint64_t v46 = v23 - v34;
            if (v23 - v34 <= -3) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v47 = v46 >> 1;
            if (v33 - (unint64_t)v34 <= (v46 >> 1) + 1) {
              uint64_t v48 = v47 + 1;
            }
            else {
              uint64_t v48 = v33 - (void)v34;
            }
            if (v33 - (unint64_t)v34 >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v49 = v48;
            }
            if (v49) {
              uint64_t v49 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v49);
            }
            else {
              uint64_t v50 = 0;
            }
            v51 = (char *)(v49 + 2 * v47);
            __asm { FCVT            H0, S8 }
            *(_WORD *)v51 = _H0;
            v45 = v51 + 2;
            while (v23 != v34)
            {
              __int16 v53 = *((_WORD *)v23 - 1);
              v23 -= 2;
              *((_WORD *)v51 - 1) = v53;
              v51 -= 2;
            }
            unint64_t v33 = v49 + 2 * v50;
            *a3 = v51;
            a3[1] = v45;
            a3[2] = (char *)v33;
            if (v34) {
              operator delete(v34);
            }
            v34 = v51;
            int v24 = v36;
          }
          else
          {
            __asm { FCVT            H0, S8 }
            *(_WORD *)v23 = _H0;
            v45 = v23 + 2;
          }
          a3[1] = v45;
          _S8 = (float)(v28 + (float)(v32 + (float)(v35 * v71)))
              + (float)(v70 * (float)((float)((float)v38 * 4.6566e-10) + -0.5));
          if ((unint64_t)v45 >= v33)
          {
            uint64_t v56 = v45 - v34;
            if (v45 - v34 <= -3) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v57 = v56 >> 1;
            if (v33 - (unint64_t)v34 <= (v56 >> 1) + 1) {
              uint64_t v58 = v57 + 1;
            }
            else {
              uint64_t v58 = v33 - (void)v34;
            }
            if (v33 - (unint64_t)v34 >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v59 = v58;
            }
            if (v59) {
              uint64_t v59 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v59);
            }
            else {
              uint64_t v60 = 0;
            }
            v61 = (char *)(v59 + 2 * v57);
            __asm { FCVT            H0, S8 }
            *(_WORD *)v61 = _H0;
            v23 = v61 + 2;
            while (v45 != v34)
            {
              __int16 v63 = *((_WORD *)v45 - 1);
              v45 -= 2;
              *((_WORD *)v61 - 1) = v63;
              v61 -= 2;
            }
            unint64_t v33 = v59 + 2 * v60;
            *a3 = v61;
            a3[1] = v23;
            a3[2] = (char *)v33;
            if (v34) {
              operator delete(v34);
            }
            v34 = v61;
            int v24 = v36;
          }
          else
          {
            __asm { FCVT            H0, S8 }
            *(_WORD *)v45 = _H0;
            v23 = v45 + 2;
          }
          a3[1] = v23;
          float v35 = (float)++v30;
        }
        while (v20 > (float)v30);
      }
      float v27 = (float)++v24;
    }
    while (v69 > (float)v24);
  }
}

- (double)getEmptyDistanceBetweenCenters:(id)a3
{
  id v4 = a3;
  double x = self->_topLeft.x;
  double v72 = self->_bottomLeft.x;
  double y = self->_topLeft.y;
  double v68 = self->_bottomLeft.y;
  double v69 = self->_topRight.x;
  double v70 = self->_bottomRight.x;
  double v65 = self->_topRight.y;
  double v66 = self->_bottomRight.y;
  [v4 bottomLeft];
  double v64 = v5;
  [v4 topLeft];
  double v63 = v6;
  [v4 bottomRight];
  double v62 = v7;
  [v4 topRight];
  double v61 = v8;
  [v4 bottomLeft];
  double v60 = v9;
  [v4 topLeft];
  double v59 = v10;
  [v4 bottomRight];
  double v58 = v11;
  [v4 topRight];
  double v57 = v12;
  double v55 = self->_bottomLeft.x;
  double v56 = self->_bottomRight.x;
  double v51 = self->_bottomRight.y;
  double v52 = self->_topRight.y;
  double v53 = self->_topLeft.x;
  double v54 = self->_topRight.x;
  double v49 = self->_bottomLeft.y;
  double v50 = self->_topLeft.y;
  [v4 bottomRight];
  double v48 = v13;
  [v4 bottomLeft];
  double v47 = v14;
  [v4 topRight];
  double v46 = v15;
  [v4 topLeft];
  double v45 = v16;
  [v4 bottomRight];
  double v44 = v17;
  [v4 bottomLeft];
  double v43 = v18;
  [v4 topRight];
  double v42 = v19;
  [v4 topLeft];
  double v21 = v20;
  [v4 topLeft];
  double v23 = v22;
  [v4 bottomLeft];
  double v25 = v24;
  [v4 topRight];
  double v27 = v26;
  [v4 bottomRight];
  double v29 = v28;
  [v4 topLeft];
  double v31 = v30;
  [v4 bottomLeft];
  double v33 = v32;
  [v4 topRight];
  double v35 = v34;
  [v4 bottomRight];
  double v37 = (v31 - v33 + v35 - v36) * 0.5;
  double v38 = fmax(vabdd_f64((v64 + v63 + v62 + v61) * 0.25, (v72 + x + v70 + v69) * 0.25)- ((v56 - v55 + v54 - v53) * 0.5+ (v54 - v56 + v53 - v55) * 0.5+ (v48 - v47 + v46 - v45) * 0.5+ (v23 - v25 + v27 - v29) * 0.5)* 0.25, 0.0);
  double v39 = fmax(vabdd_f64((v60 + v59 + v58 + v57) * 0.25, (v68 + y + v66 + v65) * 0.25)- ((v51 - v49 + v52 - v50) * 0.5 + (v52 - v51 + v50 - v49) * 0.5 + (v44 - v43 + v42 - v21) * 0.5 + v37) * 0.25, 0.0);
  double v40 = v38 * v38 + v39 * v39;

  return v40;
}

- (VisionCoreSparseOpticalFlowQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 indentifier:(id)a7 homographyGroupID:(int)a8
{
  CGFloat y = a6.y;
  double x = a6.x;
  double v12 = a5.y;
  double v13 = a5.x;
  double v14 = a4.y;
  double v15 = a4.x;
  double v16 = a3.y;
  double v17 = a3.x;
  id v19 = a7;
  v26.receiver = self;
  v26.super_class = (Class)VisionCoreSparseOpticalFlowQuad;
  double v20 = [(VisionCoreSparseOpticalFlowQuad *)&v26 init];
  double v21 = v20;
  if (v20)
  {
    v20->_topLeft.double x = v17;
    v20->_topLeft.CGFloat y = v16;
    v20->_topRight.double x = v15;
    v20->_topRight.CGFloat y = v14;
    v20->_bottomRight.double x = v13;
    v20->_bottomRight.CGFloat y = v12;
    v20->_bottomLeft.double x = x;
    v20->_bottomLeft.CGFloat y = y;
    objc_storeStrong((id *)&v20->_UUID, a7);
    v21->_homographyGroupID = a8;
    v21->_boundingBox.origin.double x = VisionCoreBoundingBoxForQuadrilateralPoints(v17, v16, v15, v14, v13, v12, x);
    v21->_boundingBox.origin.CGFloat y = v22;
    v21->_boundingBox.size.double width = v23;
    v21->_boundingBox.size.double height = v24;
  }

  return v21;
}

- (VisionCoreSparseOpticalFlowQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 indentifier:(id)a7
{
  return -[VisionCoreSparseOpticalFlowQuad initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:](self, "initWithTopLeft:topRight:bottomRight:bottomLeft:indentifier:homographyGroupID:", a7, 0xFFFFFFFFLL, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
}

@end