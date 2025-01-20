@interface CRLConnectionLineOrthogonalLayout
- (BOOL)canEndpointsCoincide;
- (BOOL)p_connectionLineComingFromSideOfOriginObject:(id)a3;
- (BOOL)p_tailComingFromNorth;
- (BOOL)p_tailComingFromSouth;
- (CGPoint)axisSnapPoint:(CGPoint)a3 toXs:()vector<double toYs:(std:()vector<double :(std:(double)a6 :allocator<double>> *)a5 allocator<double>> *)a4 withThreshold:;
- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)outsetFromMagnetPosition:(CGPoint)a3 withRect:(CGRect)a4 controlPoint:(CGPoint)a5 distance:(double)a6;
- (CGPoint)p_getControlKnobPositionToMakeSingleCornerIfPossible:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5;
- (CGPoint)p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5;
- (CGPoint)p_getExistingUserSetControlPointToMatch;
- (CGPoint)p_getLineEndPointAdjustedToCardinalForClineLayout:(id)a3 withHead:(CGPoint)a4 withTail:(CGPoint)a5 forLineEnd:(unint64_t)a6;
- (CGPoint)p_getOverriddenControlPointWithPointA:(CGPoint)a3 pointB:(CGPoint)a4;
- (CGRect)orthoRectOfLayout:(id)a3 outset:(double)a4;
- (CRLConnectionLineOrthogonalLayout)initWithInfo:(id)a3;
- (double)p_getAdjustedShapeOutset;
- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6;
- (id)getClippedHeadPortion;
- (id)getClippedTailPortion;
- (void)addEndpointSnapsToXs:(void *)a3 andYs:(void *)a4;
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)setUserDidSetControlPoint:(BOOL)a3;
@end

@implementation CRLConnectionLineOrthogonalLayout

- (CRLConnectionLineOrthogonalLayout)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineOrthogonalLayout;
  result = [(CRLConnectionLineAbstractLayout *)&v4 initWithInfo:a3];
  if (result)
  {
    *(CGPoint *)((char *)&result->super.mTailMagnetCanvasPosition + 3) = (CGPoint)xmmword_101175160;
    *(CGPoint *)((char *)&result->mSnappedUserSetControlPoint + 3) = (CGPoint)xmmword_101175160;
    *(CGPoint *)((char *)&result->mOverriddenControlPoint + 3) = (CGPoint)xmmword_101175160;
    *(CGPoint *)((char *)&result->mLastPtA + 3) = (CGPoint)xmmword_101175160;
  }
  return result;
}

- (void)setUserDidSetControlPoint:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLConnectionLineOrthogonalLayout;
  [(CRLConnectionLineAbstractLayout *)&v4 setUserDidSetControlPoint:a3];
  *(CGPoint *)((char *)&self->super.mTailMagnetCanvasPosition + 3) = (CGPoint)xmmword_101175160;
}

- (id)getClippedHeadPortion
{
  v3 = [(CRLConnectionLineAbstractLayout *)self connectedTo];

  if (!v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5658);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090EF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5678);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v6, (uint64_t)v37, v4);
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineOrthogonalLayout getClippedHeadPortion]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineOrthogonalLayout.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 179, 0, "invalid nil value for '%{public}s'", "self.connectedTo");
  }
  v9 = [(CRLCanvasLayout *)self pureGeometry];
  [v9 size];
  if (v10 == 0.0 || fabs(v10) < 0.00999999978)
  {
    v11 = [(CRLCanvasLayout *)self pureGeometry];
    [v11 size];
    BOOL v13 = fabs(v12) >= 0.00999999978 && v12 != 0.0;

    if (!v13)
    {
      v21 = 0;
      goto LABEL_28;
    }
  }
  else
  {
  }
  memset(&v36, 0, sizeof(v36));
  v14 = [(CRLCanvasLayout *)self pureGeometry];
  v15 = v14;
  if (v14) {
    [v14 transform];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }

  v16 = [(CRLCanvasAbstractLayout *)self parent];
  BOOL v17 = v16 == 0;

  if (!v17)
  {
    v18 = [(CRLCanvasAbstractLayout *)self parent];
    v19 = [v18 geometryInParent];
    v20 = v19;
    if (v19) {
      [v19 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v36;
    CGAffineTransformConcat(&v35, &t1, &t2);
    CGAffineTransform v36 = v35;
  }
  [(CRLShapeLayout *)self headPoint];
  double v23 = v22;
  double v25 = v24;
  long long v26 = *(_OWORD *)&v36.a;
  long long v27 = *(_OWORD *)&v36.c;
  long long v28 = *(_OWORD *)&v36.tx;
  v29 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  [v29 getCardinalPositionWithParentTransformFromType:1];
  v21 = +[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", *(double *)&v28 + v25 * *(double *)&v27 + *(double *)&v26 * v23, *((double *)&v28 + 1) + v25 * *((double *)&v27 + 1) + *((double *)&v26 + 1) * v23, v30, v31);

LABEL_28:

  return v21;
}

- (id)getClippedTailPortion
{
  v3 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];

  if (!v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5698);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090FA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E56B8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v6, (uint64_t)v37, v4);
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineOrthogonalLayout getClippedTailPortion]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineOrthogonalLayout.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 192, 0, "invalid nil value for '%{public}s'", "self.connectedFrom");
  }
  v9 = [(CRLCanvasLayout *)self pureGeometry];
  [v9 size];
  if (v10 == 0.0 || fabs(v10) < 0.00999999978)
  {
    v11 = [(CRLCanvasLayout *)self pureGeometry];
    [v11 size];
    BOOL v13 = fabs(v12) >= 0.00999999978 && v12 != 0.0;

    if (!v13)
    {
      v21 = 0;
      goto LABEL_28;
    }
  }
  else
  {
  }
  memset(&v36, 0, sizeof(v36));
  v14 = [(CRLCanvasLayout *)self pureGeometry];
  v15 = v14;
  if (v14) {
    [v14 transform];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }

  v16 = [(CRLCanvasAbstractLayout *)self parent];
  BOOL v17 = v16 == 0;

  if (!v17)
  {
    v18 = [(CRLCanvasAbstractLayout *)self parent];
    v19 = [v18 geometryInParent];
    v20 = v19;
    if (v19) {
      [v19 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v36;
    CGAffineTransformConcat(&v35, &t1, &t2);
    CGAffineTransform v36 = v35;
  }
  [(CRLShapeLayout *)self tailPoint];
  double v23 = v22;
  double v25 = v24;
  long long v26 = *(_OWORD *)&v36.a;
  long long v27 = *(_OWORD *)&v36.c;
  long long v28 = *(_OWORD *)&v36.tx;
  v29 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v29 getCardinalPositionWithParentTransformFromType:1];
  v21 = +[CRLBezierPath bezierPathWithStart:end:](CRLBezierPath, "bezierPathWithStart:end:", *(double *)&v28 + v25 * *(double *)&v27 + *(double *)&v26 * v23, *((double *)&v28 + 1) + v25 * *((double *)&v27 + 1) + *((double *)&v26 + 1) * v23, v30, v31);

LABEL_28:

  return v21;
}

- (CGRect)orthoRectOfLayout:(id)a3 outset:(double)a4
{
  id v6 = a3;
  id v7 = [v6 centerForConnecting];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v45 = 0;
  v46 = (double *)&v45;
  uint64_t v47 = 0x5012000000;
  v48 = sub_100250A84;
  v49 = nullsub_34;
  v50 = "";
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v7, v12);
  uint64_t v51 = v13;
  uint64_t v52 = v14;
  uint64_t v53 = v15;
  uint64_t v54 = v16;
  [v6 boundsForStandardKnobs:v56.recordType._object];
  if (v17 <= v18) {
    double v19 = v18;
  }
  else {
    double v19 = v17;
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 1;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v33 = sub_100250A94;
  v34 = &unk_1014E56E0;
  uint64_t v39 = v9;
  uint64_t v40 = v11;
  double v41 = a4 + 10.0 + v19;
  CGAffineTransform v35 = self;
  id v20 = v6;
  uint64_t v21 = 0;
  double v42 = a4;
  id v36 = v20;
  v37 = v43;
  v38 = &v45;
  do
  {
    uint64_t v22 = qword_101177138[v21];
    char v55 = 0;
    ((void (*)(void *, uint64_t, char *))v33)(v32, v22, &v55);
    if (v55) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = v21 == 3;
    }
    ++v21;
  }
  while (!v23);
  double v24 = v46[6];
  double v25 = v46[7];
  double v26 = v46[8];
  double v27 = v46[9];

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);

  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  for (unint64_t i = 0; i != 6; i += 2)
  {
    double v12 = sub_1000646A4(a5[i / 2].x, a5[i / 2].y, 10.0);
    uint64_t v13 = &v207[i];
    *uint64_t v13 = v12;
    *((void *)v13 + 1) = v14;
  }
  if ([(CRLConnectionLineAbstractLayout *)self headMagnetType]) {
    BOOL v161 = (id)[(CRLConnectionLineAbstractLayout *)self headMagnetType] != (id)1;
  }
  else {
    BOOL v161 = 0;
  }
  if ([(CRLConnectionLineAbstractLayout *)self tailMagnetType]) {
    BOOL v162 = (id)[(CRLConnectionLineAbstractLayout *)self tailMagnetType] != (id)1;
  }
  else {
    BOOL v162 = 0;
  }
  double v15 = *(double *)((char *)&self->mLastPtA.x + 3);
  double v16 = *(double *)((char *)&self->mLastPtA.y + 3);
  if (sub_100065BF8(v15, v16))
  {
    [(CRLConnectionLineAbstractLayout *)self headMagnetCanvasPosition];
    double v15 = v17;
    double v16 = v18;
  }
  double v19 = *(double *)((char *)&self->mOverriddenControlPoint.x + 3);
  double v20 = *(double *)((char *)&self->mOverriddenControlPoint.y + 3);
  if (sub_100065BF8(v19, v20))
  {
    [(CRLConnectionLineAbstractLayout *)self tailMagnetCanvasPosition];
    double v19 = v21;
    double v20 = v22;
  }
  sub_100209560(v15, v16, 10.0);
  uint64_t v157 = v24;
  uint64_t v158 = v23;
  sub_100209560(v19, v20, 10.0);
  uint64_t v159 = v26;
  uint64_t v160 = v25;
  long long v205 = 0u;
  long long v206 = 0u;
  double v27 = v207[0];
  sub_100209584((uint64_t)v207[0], (uint64_t)v207[1], 0, 0, &v205);
  long long v203 = 0u;
  long long v204 = 0u;
  double v28 = v210;
  sub_100209584((uint64_t)v210, (uint64_t)v211, 0, 0, &v203);
  long long v194 = v205;
  long long v195 = v206;
  uint64_t v29 = sub_100209554(v27);
  uint64_t v31 = v30;
  uint64_t v196 = v29;
  uint64_t v197 = v30;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  uint64_t v202 = 0;
  long long v185 = v203;
  long long v186 = v204;
  uint64_t v32 = sub_100209554(v28);
  uint64_t v34 = v33;
  uint64_t v187 = v32;
  uint64_t v188 = v33;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  uint64_t v193 = 0;
  if (v9)
  {
    [(CRLConnectionLineAbstractLayout *)self outsetFrom];
    -[CRLConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", v9);
    [v9 centerForConnecting:sub_100209620((uint64_t *)&v194, v35, v36, v37, v38, 10.0)];
    sub_100209560(v39, v40, 10.0);
    uint64_t v29 = v41;
    uint64_t v31 = v42;
    uint64_t v196 = v41;
    uint64_t v197 = v42;
    v184[0] = v194;
    v184[1] = v195;
    sub_100250BC4((uint64_t)v184, v41, v42, &v194);
    if ((uint64_t)v195 >= 1 && *((uint64_t *)&v195 + 1) >= 1) {
      *(void *)&long long v198 = 200;
    }
  }
  if (v10)
  {
    [(CRLConnectionLineAbstractLayout *)self outsetTo];
    -[CRLConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", v10);
    [v10 centerForConnecting:sub_100209620((uint64_t *)&v185, v43, v44, v45, v46, 10.0)];
    sub_100209560(v47, v48, 10.0);
    uint64_t v32 = v49;
    uint64_t v34 = v50;
    uint64_t v187 = v49;
    uint64_t v188 = v50;
    v183[0] = v185;
    v183[1] = v186;
    sub_100250BC4((uint64_t)v183, v49, v50, &v185);
    if ((uint64_t)v186 >= 1 && *((uint64_t *)&v186 + 1) >= 1) {
      *(void *)&long long v189 = 200;
    }
  }
  [(CRLConnectionLineAbstractLayout *)self i_setVisibleLine:1];
  v180 = 0;
  v181 = 0;
  unint64_t v182 = 0;
  __p = 0;
  v178 = 0;
  unint64_t v179 = 0;
  if (!v162)
  {
    uint64_t v53 = (double *)sub_10002B494((uint64_t)&v182, 1uLL);
    *uint64_t v53 = (double)v29;
    v180 = v53;
    v181 = v53 + 1;
    unint64_t v182 = (unint64_t)&v53[v54];
    v181 = v53 + 1;
    double v55 = (double)v31;
    Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56 = v178;
    if ((unint64_t)v178 >= v179)
    {
      v57 = (double *)__p;
      uint64_t v64 = ((char *)v178 - (unsigned char *)__p) >> 3;
      unint64_t v65 = v64 + 1;
      if ((unint64_t)(v64 + 1) >> 61) {
        sub_100004E40();
      }
      uint64_t v66 = v179 - (void)__p;
      if ((uint64_t)(v179 - (void)__p) >> 2 > v65) {
        unint64_t v65 = v66 >> 2;
      }
      if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v67 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v67 = v65;
      }
      if (v67)
      {
        v68 = (char *)sub_10002B494((uint64_t)&v179, v67);
        v57 = (double *)__p;
        Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56 = v178;
      }
      else
      {
        v68 = 0;
      }
      v69 = (double *)&v68[8 * v64];
      v70 = &v68[8 * v67];
      double *v69 = v55;
      v63 = v69 + 1;
      while (v56 != v57)
      {
        uint64_t v72 = *((void *)v56-- - 1);
        *((void *)v69-- - 1) = v72;
      }
      goto LABEL_51;
    }
LABEL_34:
    *Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56 = v55;
    v63 = v56 + 1;
    goto LABEL_53;
  }
  uint64_t v51 = (double *)sub_10002B494((uint64_t)&v182, 1uLL);
  *uint64_t v51 = (double)v160;
  v180 = v51;
  v181 = v51 + 1;
  unint64_t v182 = (unint64_t)&v51[v52];
  v181 = v51 + 1;
  double v55 = (double)v159;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56 = v178;
  if ((unint64_t)v178 < v179) {
    goto LABEL_34;
  }
  v57 = (double *)__p;
  uint64_t v58 = ((char *)v178 - (unsigned char *)__p) >> 3;
  unint64_t v59 = v58 + 1;
  if ((unint64_t)(v58 + 1) >> 61) {
    sub_100004E40();
  }
  uint64_t v60 = v179 - (void)__p;
  if ((uint64_t)(v179 - (void)__p) >> 2 > v59) {
    unint64_t v59 = v60 >> 2;
  }
  if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v61 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v61 = v59;
  }
  if (v61)
  {
    v62 = (char *)sub_10002B494((uint64_t)&v179, v61);
    v57 = (double *)__p;
    Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v56 = v178;
  }
  else
  {
    v62 = 0;
  }
  v69 = (double *)&v62[8 * v58];
  v70 = &v62[8 * v61];
  double *v69 = v55;
  v63 = v69 + 1;
  while (v56 != v57)
  {
    uint64_t v71 = *((void *)v56-- - 1);
    *((void *)v69-- - 1) = v71;
  }
LABEL_51:
  __p = v69;
  v178 = v63;
  unint64_t v179 = (unint64_t)v70;
  if (v57) {
    operator delete(v57);
  }
LABEL_53:
  v178 = v63;
  v73 = v181;
  if (!v161)
  {
    double v76 = (double)v32;
    if ((unint64_t)v181 >= v182)
    {
      v84 = (double *)v180;
      uint64_t v85 = ((char *)v181 - (unsigned char *)v180) >> 3;
      unint64_t v86 = v85 + 1;
      if ((unint64_t)(v85 + 1) >> 61) {
        sub_100004E40();
      }
      uint64_t v87 = v182 - (void)v180;
      if ((uint64_t)(v182 - (void)v180) >> 2 > v86) {
        unint64_t v86 = v87 >> 2;
      }
      if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v88 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v88 = v86;
      }
      if (v88)
      {
        v89 = (char *)sub_10002B494((uint64_t)&v182, v88);
        v84 = (double *)v180;
        v73 = v181;
      }
      else
      {
        v89 = 0;
      }
      v101 = (double *)&v89[8 * v85];
      v102 = &v89[8 * v88];
      double *v101 = v76;
      v77 = v101 + 1;
      while (v73 != v84)
      {
        uint64_t v103 = *((void *)v73-- - 1);
        *((void *)v101-- - 1) = v103;
      }
      v180 = v101;
      v181 = v77;
      unint64_t v182 = (unint64_t)v102;
      if (v84) {
        operator delete(v84);
      }
    }
    else
    {
      double *v181 = v76;
      v77 = v73 + 1;
    }
    v181 = v77;
    double v93 = (double)v34;
    v94 = v178;
    if ((unint64_t)v178 >= v179)
    {
      v95 = (double *)__p;
      uint64_t v105 = ((char *)v178 - (unsigned char *)__p) >> 3;
      unint64_t v106 = v105 + 1;
      if ((unint64_t)(v105 + 1) >> 61) {
        sub_100004E40();
      }
      uint64_t v107 = v179 - (void)__p;
      if ((uint64_t)(v179 - (void)__p) >> 2 > v106) {
        unint64_t v106 = v107 >> 2;
      }
      if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v108 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v108 = v106;
      }
      if (v108)
      {
        v109 = (char *)sub_10002B494((uint64_t)&v179, v108);
        v95 = (double *)__p;
        v94 = v178;
      }
      else
      {
        v109 = 0;
      }
      v110 = (double *)&v109[8 * v105];
      v111 = &v109[8 * v108];
      double *v110 = v93;
      v104 = v110 + 1;
      while (v94 != v95)
      {
        uint64_t v113 = *((void *)v94-- - 1);
        *((void *)v110-- - 1) = v113;
      }
      goto LABEL_113;
    }
LABEL_96:
    double *v94 = v93;
    v104 = v94 + 1;
    goto LABEL_115;
  }
  double v74 = (double)v158;
  if ((unint64_t)v181 >= v182)
  {
    v78 = (double *)v180;
    uint64_t v79 = ((char *)v181 - (unsigned char *)v180) >> 3;
    unint64_t v80 = v79 + 1;
    if ((unint64_t)(v79 + 1) >> 61) {
      sub_100004E40();
    }
    uint64_t v81 = v182 - (void)v180;
    if ((uint64_t)(v182 - (void)v180) >> 2 > v80) {
      unint64_t v80 = v81 >> 2;
    }
    if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v82 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v82 = v80;
    }
    if (v82)
    {
      v83 = (char *)sub_10002B494((uint64_t)&v182, v82);
      v78 = (double *)v180;
      v73 = v181;
    }
    else
    {
      v83 = 0;
    }
    v90 = (double *)&v83[8 * v79];
    v91 = &v83[8 * v82];
    double *v90 = v74;
    v75 = v90 + 1;
    while (v73 != v78)
    {
      uint64_t v92 = *((void *)v73-- - 1);
      *((void *)v90-- - 1) = v92;
    }
    v180 = v90;
    v181 = v75;
    unint64_t v182 = (unint64_t)v91;
    if (v78) {
      operator delete(v78);
    }
  }
  else
  {
    double *v181 = v74;
    v75 = v73 + 1;
  }
  v181 = v75;
  double v93 = (double)v157;
  v94 = v178;
  if ((unint64_t)v178 < v179) {
    goto LABEL_96;
  }
  v95 = (double *)__p;
  uint64_t v96 = ((char *)v178 - (unsigned char *)__p) >> 3;
  unint64_t v97 = v96 + 1;
  if ((unint64_t)(v96 + 1) >> 61) {
    sub_100004E40();
  }
  uint64_t v98 = v179 - (void)__p;
  if ((uint64_t)(v179 - (void)__p) >> 2 > v97) {
    unint64_t v97 = v98 >> 2;
  }
  if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v99 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v99 = v97;
  }
  if (v99)
  {
    v100 = (char *)sub_10002B494((uint64_t)&v179, v99);
    v95 = (double *)__p;
    v94 = v178;
  }
  else
  {
    v100 = 0;
  }
  v110 = (double *)&v100[8 * v96];
  v111 = &v100[8 * v99];
  double *v110 = v93;
  v104 = v110 + 1;
  while (v94 != v95)
  {
    uint64_t v112 = *((void *)v94-- - 1);
    *((void *)v110-- - 1) = v112;
  }
LABEL_113:
  __p = v110;
  v178 = v104;
  unint64_t v179 = (unint64_t)v111;
  if (v95) {
    operator delete(v95);
  }
LABEL_115:
  v178 = v104;
  double v114 = v208;
  double v115 = v209;
  v175 = 0;
  uint64_t v176 = 0;
  v174 = 0;
  sub_1002572E8(&v174, v180, (uint64_t)v181, ((char *)v181 - (unsigned char *)v180) >> 3);
  v171 = 0;
  v172 = 0;
  uint64_t v173 = 0;
  sub_1002572E8(&v171, __p, (uint64_t)v178, ((char *)v178 - (unsigned char *)__p) >> 3);
  -[CRLConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v174, &v171, v114, v115, 20.0);
  double v117 = v116;
  double v119 = v118;
  double v208 = v116;
  double v209 = v118;
  if (v171)
  {
    v172 = v171;
    operator delete(v171);
  }
  if (v174)
  {
    v175 = v174;
    operator delete(v174);
  }
  uint64_t v120 = sub_100209554(v117);
  uint64_t v122 = v121;
  [(CRLConnectionLineOrthogonalLayout *)self p_getAdjustedShapeOutset];
  uint64_t v124 = v123;
  double v125 = v117 / 10.0;
  double v126 = v119 / 10.0;
  if (!v9)
  {
    uint64_t v137 = 0;
    uint64_t v135 = 0;
    if (v10) {
      goto LABEL_121;
    }
LABEL_123:
    uint64_t v148 = 0;
    uint64_t v146 = 0;
    goto LABEL_124;
  }
  v127 = [v9 pureGeometry];
  [v127 frame];
  -[CRLConnectionLineOrthogonalLayout outsetFromMagnetPosition:withRect:controlPoint:distance:](self, "outsetFromMagnetPosition:withRect:controlPoint:distance:", v19, v20, v128, v129, v130, v131, v125, v126, v124);
  sub_100209560(v132, v133, 10.0);
  uint64_t v135 = v134;
  uint64_t v137 = v136;

  if (!v10) {
    goto LABEL_123;
  }
LABEL_121:
  v138 = [v10 pureGeometry];
  [v138 frame];
  -[CRLConnectionLineOrthogonalLayout outsetFromMagnetPosition:withRect:controlPoint:distance:](self, "outsetFromMagnetPosition:withRect:controlPoint:distance:", v15, v16, v139, v140, v141, v142, v125, v126, v124);
  sub_100209560(v143, v144, 10.0);
  uint64_t v146 = v145;
  uint64_t v148 = v147;

LABEL_124:
  double x = a5->x;
  double y = a5->y;
  double v151 = a5[1].x;
  double v152 = a5[1].y;
  if (sub_1000653B4(a5->x, y, v151, v152) >= 10.0
    && (double v153 = a5[2].x, v154 = a5[2].y, sub_1000653B4(v153, v154, v151, v152) >= 10.0))
  {
    if (sub_1000653B4(x, y, v153, v154) >= 10.0)
    {
      LOBYTE(v163) = v161;
      BYTE1(v163) = v162;
      *(_DWORD *)((char *)&v163 + 2) = 0;
      WORD3(v163) = 0;
      *((void *)&v163 + 1) = v158;
      uint64_t v164 = v157;
      uint64_t v165 = v160;
      uint64_t v166 = v159;
      uint64_t v167 = v146;
      uint64_t v168 = v148;
      uint64_t v169 = v135;
      uint64_t v170 = v137;
      sub_1002519F4((uint64_t)&v194, v120, v122, (uint64_t)&v185, &v163);
    }
    v155 = +[CRLBezierPath bezierPath];
    [v155 moveToPoint:a5->x, a5->y];
    [v155 lineToPoint:a5->x, a5[1].y];
    [v155 lineToPoint:a5[1].x, a5[1].y];
    [v155 lineToPoint:a5[1].x, a5->y];
    [v155 lineToPoint:a5[2].x, a5[2].y];
  }
  else
  {
    v155 = +[CRLBezierPath bezierPath];
    [v155 moveToPoint:a5->x, a5->y];
    [v155 lineToPoint:a5[2].x, a5[2].y];
  }
  if (__p)
  {
    v178 = (double *)__p;
    operator delete(__p);
  }
  if (v180)
  {
    v181 = (double *)v180;
    operator delete(v180);
  }

  return v155;
}

- (double)p_getAdjustedShapeOutset
{
  double v3 = 20.0;
  if (![(CRLConnectionLineAbstractLayout *)self userDidSetControlPoint])
  {
    int v4 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    unint64_t v5 = [(CRLConnectionLineAbstractLayout *)self tailMagnetType];
    if (!v5)
    {
      id v6 = [(CRLConnectionLineAbstractLayout *)self tailNearestLayoutForRouting];

      if (v6)
      {
        uint64_t v7 = [(CRLConnectionLineAbstractLayout *)self tailNearestLayoutForRouting];

        unint64_t v5 = [(CRLConnectionLineAbstractLayout *)self tailNearestMagnetTypeForRouting];
        int v4 = (void *)v7;
      }
      else
      {
        unint64_t v5 = 0;
      }
    }
    uint64_t v8 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
    id v9 = [(CRLConnectionLineAbstractLayout *)self headMagnetType];
    if (!v9)
    {
      id v9 = [(CRLConnectionLineAbstractLayout *)self headNearestLayoutForRouting];

      if (v9)
      {
        uint64_t v10 = [(CRLConnectionLineAbstractLayout *)self headNearestLayoutForRouting];

        id v9 = [(CRLConnectionLineAbstractLayout *)self headNearestMagnetTypeForRouting];
        uint64_t v8 = (void *)v10;
      }
    }
    if (!v4) {
      goto LABEL_23;
    }
    if (!v8) {
      goto LABEL_23;
    }
    [v4 transform];
    if (sub_10007F7C8(v18) != 0.0) {
      goto LABEL_23;
    }
    [v8 transform];
    if (sub_10007F7C8(&v17) != 0.0) {
      goto LABEL_23;
    }
    if (v9 == (void *)3 && v5 == 5)
    {
      [v4 cardinalWestPosition];
      double v12 = v11;
      [v8 cardinalEastPosition];
    }
    else
    {
      double v14 = 20.0;
      if (v9 != (void *)5 || v5 != 3) {
        goto LABEL_20;
      }
      [v8 cardinalWestPosition:20.0];
      double v12 = v15;
      [v4 cardinalEastPosition];
    }
    double v14 = v12 - v13;
LABEL_20:
    if (v14 <= 40.0) {
      double v3 = 20.0;
    }
    else {
      double v3 = v14;
    }
LABEL_23:
  }
  return v3;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  uint64_t v12 = objc_opt_class();
  double v13 = *(CRLEditableBezierPathSource **)((char *)&self->super.super.mCachedEditableBezierPathSource + 3);
  double v14 = v13;
  if (!v13)
  {
    id v6 = [(CRLShapeLayout *)self shapeInfo];
    double v14 = [v6 pathSource];
  }
  double v15 = sub_1002469D0(v12, v14);
  if (!v13)
  {
  }
  double v16 = *(CRLPathSource **)((char *)&self->super.super.mCachedPathSource + 3);
  if (v16)
  {
    id v17 = v16;
    float64x2_t v30 = 0u;
    float64x2_t v31 = 0u;
    float64x2_t v29 = 0u;
  }
  else
  {
    double v18 = [(CRLCanvasLayout *)self info];
    id v17 = [v18 geometry];

    float64x2_t v30 = 0u;
    float64x2_t v31 = 0u;
    float64x2_t v29 = 0u;
    if (!v17) {
      goto LABEL_9;
    }
  }
  [v17 transform];
LABEL_9:
  *(double *)((char *)&self->mOverriddenControlPoint.x + 3) = v10;
  *(double *)((char *)&self->mOverriddenControlPoint.y + 3) = v9;
  *(double *)((char *)&self->mLastPtA.x + 3) = x;
  *(double *)((char *)&self->mLastPtA.y + 3) = y;
  -[CRLConnectionLineOrthogonalLayout p_getOverriddenControlPointWithPointA:pointB:](self, "p_getOverriddenControlPointWithPointA:pointB:", v10, v9, x, y);
  double v20 = v19;
  float64_t v27 = v21;
  *(double *)((char *)&self->mSnappedUserSetControlPoint.x + 3) = v21;
  *(double *)((char *)&self->mSnappedUserSetControlPoint.y + 3) = v19;
  if ([(CRLConnectionLineAbstractLayout *)self userDidSetControlPoint])
  {
    [v15 getControlKnobPosition:12];
    float64x2_t v24 = vaddq_f64(v31, vmlaq_n_f64(vmulq_n_f64(v30, v22), v29, v23));
    double v20 = v24.f64[1];
  }
  else
  {
    v24.f64[0] = v27;
  }
  double v28 = v24.f64[0];
  if (!sub_1000640F4(v24.f64[0], v20, *(double *)((char *)&self->mLastPtB.x + 3), *(double *)((char *)&self->mLastPtB.y + 3)))
  {
    [(CRLConnectionLineAbstractLayout *)self setControlKnobPositionChangedFromRouting:1];
    *(double *)((char *)&self->mLastPtB.x + 3) = v28;
    *(double *)((char *)&self->mLastPtB.y + 3) = v20;
  }

  double v25 = v28;
  double v26 = v20;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (CGPoint)p_getOverriddenControlPointWithPointA:(CGPoint)a3 pointB:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  double v9 = sub_100065E00(a3.x, a3.y, a4.x, a4.y, 0.5);
  double v40 = v10;
  double v41 = v9;
  -[CRLConnectionLineOrthogonalLayout p_getControlKnobPositionToMakeSingleCornerIfPossible:pointA:pointB:](self, "p_getControlKnobPositionToMakeSingleCornerIfPossible:pointA:pointB:");
  double v42 = v7;
  double v43 = x;
  double v44 = v6;
  double v39 = y;
  -[CRLConnectionLineOrthogonalLayout p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:pointA:pointB:](self, "p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:pointA:pointB:");
  double v45 = v12;
  double v46 = v11;
  double v13 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  [v13 frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  double v22 = sub_10006402C(v46, v45, 50.0);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  v48.origin.CGFloat x = v15;
  v48.origin.CGFloat y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v50.origin.CGFloat x = v22;
  v50.origin.CGFloat y = v24;
  v50.size.width = v26;
  v50.size.height = v28;
  if (CGRectIntersectsRect(v48, v50))
  {
    BOOL v29 = 1;
  }
  else
  {
    float64x2_t v30 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    [v30 frame];
    v51.origin.CGFloat x = v22;
    v51.origin.CGFloat y = v24;
    v51.size.width = v26;
    v51.size.height = v28;
    BOOL v29 = CGRectIntersectsRect(v49, v51);
  }
  BOOL v31 = sub_1000640F4(v46, v45, v42, v44) || sub_1000640F4(v46, v45, v43, v39);
  if (sub_1000653B4(v41, v40, v42, v44) < 0.25) {
    goto LABEL_14;
  }
  double v32 = sub_1000653B4(v41, v40, v43, v39);
  BOOL v33 = v32 >= 0.25;
  if ((v29 || v31) && v33) {
    double v34 = v40;
  }
  else {
    double v34 = v45;
  }
  double v35 = v46;
  if ((v29 || v31) && v33) {
    double v35 = v41;
  }
  if (v32 < 0.25)
  {
LABEL_14:
    double v36 = vabdd_f64(v42, v43);
    double v37 = vabdd_f64(v44, v44);
    BOOL v38 = v36 <= v37;
    if (v36 > v37) {
      double v35 = v41;
    }
    else {
      double v35 = v41 + -0.25;
    }
    if (v38) {
      double v34 = v40;
    }
    else {
      double v34 = v40 + -0.25;
    }
  }
  result.CGFloat y = v34;
  result.CGFloat x = v35;
  return result;
}

- (CGPoint)p_getControlKnobPositionToMakeSingleCornerIfPossible:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5
{
  double y = a4.y;
  CGFloat x = a4.x;
  CGFloat v7 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  unint64_t v16 = [(CRLConnectionLineAbstractLayout *)self tailMagnetType];
  CGFloat v126 = x;
  if (!v16)
  {
    uint64_t v17 = [(CRLConnectionLineAbstractLayout *)self tailNearestLayoutForRouting];

    if (!v17) {
      goto LABEL_5;
    }
    double v18 = [(CRLConnectionLineAbstractLayout *)self tailNearestLayoutForRouting];
    [v18 frame];
    double v9 = v19;
    double v11 = v20;
    double v13 = v21;
    double v15 = v22;

    unint64_t v16 = [(CRLConnectionLineAbstractLayout *)self tailNearestMagnetTypeForRouting];
  }
  uint64_t v17 = v16;
LABEL_5:
  double v23 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  unint64_t v32 = [(CRLConnectionLineAbstractLayout *)self headMagnetType];
  if (v32)
  {
    uint64_t v33 = v32;
    BOOL v127 = 0;
    BOOL v34 = v17 != 0;
  }
  else
  {
    uint64_t v33 = [(CRLConnectionLineAbstractLayout *)self headNearestLayoutForRouting];

    if (v33)
    {
      double v23 = [(CRLConnectionLineAbstractLayout *)self headNearestLayoutForRouting];
      [v23 frame];
      double v25 = v39;
      double v27 = v40;
      double v29 = v41;
      double v31 = v42;

      uint64_t v33 = [(CRLConnectionLineAbstractLayout *)self headNearestMagnetTypeForRouting];
    }
    BOOL v127 = v33 == 0;
    BOOL v34 = v17 != 0;
    if (!v33 && v17)
    {
      uint64_t v33 = 0;
      int v37 = 0;
      BOOL v43 = v17 == 1;
      BOOL v34 = 1;
      BOOL v127 = 1;
      uint64_t v36 = 1;
      goto LABEL_26;
    }
  }
  if (v33) {
    BOOL v35 = v17 == 0;
  }
  else {
    BOOL v35 = 0;
  }
  uint64_t v36 = v35;
  int v37 = v33 == 1;
  if (v33 != 1 || v17 != 1)
  {
    if (v17 == 1)
    {
      switch(v33)
      {
        case 2:
          int v123 = 0;
          uint64_t v36 = v27 > v11 + v15;
          uint64_t v33 = 2;
          goto LABEL_16;
        case 3:
          if (v29 + v25 >= v9) {
            goto LABEL_61;
          }
          int v123 = 0;
          uint64_t v36 = 1;
          uint64_t v33 = 3;
          break;
        case 4:
          int v123 = 0;
          uint64_t v36 = v31 + v27 < v11;
          uint64_t v33 = 4;
          goto LABEL_16;
        case 5:
          if (v25 <= v9 + v13)
          {
LABEL_61:
            int v123 = 0;
            uint64_t v36 = v27 > v11 + v15 && v33 == 2;
          }
          else
          {
            int v123 = 0;
            uint64_t v36 = 1;
            uint64_t v33 = 5;
          }
          break;
        default:
          BOOL v43 = 1;
          goto LABEL_26;
      }
      goto LABEL_16;
    }
    BOOL v43 = 0;
LABEL_26:
    BOOL v44 = (v17 & 0xFFFFFFFFFFFFFFFELL) == 4 || (v17 & 0xFFFFFFFFFFFFFFFELL) == 2;
    if (v44 && v37)
    {
      if (v17 == 5 && v9 > v29 + v25 || v17 == 3 && v9 + v13 < v25)
      {
        int v37 = 1;
LABEL_37:
        uint64_t v36 = 1;
      }
      else
      {
        uint64_t v36 = v11 > v31 + v27 && v17 == 2;
        if (v17 == 4)
        {
          uint64_t v36 = v11 + v15 < v27;
          int v123 = 0;
          if (!v43)
          {
            BOOL v125 = v11 + v15 < v27;
            int v61 = 0;
            uint64_t v36 = 0;
            double v38 = v126;
            goto LABEL_91;
          }
          int v37 = 1;
          goto LABEL_16;
        }
        int v37 = 1;
      }
    }
    else
    {
      if (!v33) {
        BOOL v34 = 0;
      }
      if (v34)
      {
        switch(v33)
        {
          case 2:
            if ((v17 == 5 || v17 == 3) && v27 > v11 + v15) {
              goto LABEL_37;
            }
            uint64_t v36 = 0;
            int v123 = 0;
            uint64_t v45 = 0;
            uint64_t v33 = 2;
            goto LABEL_79;
          case 3:
            if ((v17 == 4 || v17 == 2) && v29 + v25 < v9) {
              goto LABEL_37;
            }
            uint64_t v36 = 0;
            int v123 = 0;
            uint64_t v45 = 0;
            uint64_t v33 = 3;
            goto LABEL_79;
          case 4:
            if ((v17 == 5 || v17 == 3) && v31 + v27 < v11) {
              goto LABEL_37;
            }
            uint64_t v36 = 0;
            int v123 = 0;
            uint64_t v45 = 0;
            uint64_t v33 = 4;
            goto LABEL_79;
          case 5:
            if (v17 != 4 && v17 != 2) {
              goto LABEL_81;
            }
            int v123 = 0;
            uint64_t v45 = 0;
            uint64_t v36 = v25 > v9 + v13;
            uint64_t v33 = 5;
LABEL_79:
            double v38 = v126;
            if (!v43) {
              goto LABEL_90;
            }
            goto LABEL_83;
          default:
LABEL_81:
            uint64_t v36 = 0;
            break;
        }
      }
    }
    double v38 = v126;
    int v123 = 0;
    uint64_t v45 = 0;
    if (!v43) {
      goto LABEL_90;
    }
    goto LABEL_83;
  }
  uint64_t v36 = 1;
  uint64_t v33 = 1;
  int v37 = 1;
  int v123 = 1;
LABEL_16:
  double v38 = v126;
LABEL_83:
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  double v49 = v48;
  double v51 = v50;
  double v23 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v23 cardinalNorthPosition];
  if (!sub_1000640F4(v49, v51, v52, v53))
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    double v55 = v54;
    double v57 = v56;
    uint64_t v58 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    [v58 cardinalSouthPosition];
    BOOL v125 = v36;
    LODWORD(v45) = v127 & sub_1000640F4(v55, v57, v59, v60);
    if (v45 & 1) != 0 || ((v37 ^ 1))
    {
      LOBYTE(v37) = v45 & v37;

      goto LABEL_103;
    }
    double v119 = v58;
    int v61 = 1;
    uint64_t v36 = 1;
    goto LABEL_91;
  }
  uint64_t v45 = 1;
  if (v127)
  {
    BOOL v125 = v36;
    goto LABEL_103;
  }
  BOOL v127 = 0;
LABEL_90:
  BOOL v125 = v36;
  int v61 = 0;
  int v62 = v37;
  uint64_t v36 = v45;
  LOBYTE(v37) = 0;
  LOBYTE(v45) = 0;
  if (!v62) {
    goto LABEL_102;
  }
LABEL_91:
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3), v119);
  double v64 = v63;
  double v66 = v65;
  unint64_t v67 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v67 cardinalNorthPosition];
  if (sub_1000640F4(v64, v66, v68, v69))
  {
    LOBYTE(v45) = v17 == 0;
    goto LABEL_95;
  }
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  double v71 = v70;
  double v73 = v72;
  double v74 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v74 cardinalSouthPosition];
  if (sub_1000640F4(v71, v73, v75, v76))
  {
    LOBYTE(v45) = v17 == 0;

LABEL_95:
    if (v61)
    {
LABEL_96:

      if ((v36 & 1) == 0)
      {
        int v77 = 0;
        int v78 = 0;
        goto LABEL_116;
      }
      LOBYTE(v37) = 1;
      goto LABEL_103;
    }
    goto LABEL_101;
  }

  LOBYTE(v45) = 0;
  if (v61) {
    goto LABEL_96;
  }
LABEL_101:
  LOBYTE(v37) = 1;
LABEL_102:
  if ((v36 & 1) == 0)
  {
    int v78 = 0;
    goto LABEL_110;
  }
LABEL_103:

  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  double v80 = v79;
  double v82 = v81;
  double v23 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v23 cardinalEastPosition];
  if (!sub_1000640F4(v80, v82, v83, v84))
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    double v87 = v86;
    double v89 = v88;
    uint64_t v36 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    [(id)v36 cardinalWestPosition];
    if ((v127 & sub_1000640F4(v87, v89, v90, v91)) == 1)
    {

      if (v125)
      {
        BOOL v85 = 1;
        goto LABEL_129;
      }
    }
    else
    {
      if (v37)
      {
        int v77 = 1;
        int v78 = 1;
        goto LABEL_116;
      }

      if (v125)
      {
        BOOL v85 = 0;
        goto LABEL_129;
      }
    }
LABEL_139:
    double v111 = a3.x;
    double v112 = a3.y;
    goto LABEL_155;
  }
  int v78 = 1;
  BOOL v85 = 1;
  if (!v127)
  {
LABEL_110:
    int v77 = 0;
    BOOL v85 = 0;
    if ((v37 & 1) == 0)
    {
      if (v78) {
        goto LABEL_112;
      }
      goto LABEL_122;
    }
LABEL_116:
    LODWORD(v119) = v77;
    int v128 = v78;
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3), v119);
    double v93 = v92;
    double v95 = v94;
    uint64_t v96 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    [v96 cardinalEastPosition];
    if (sub_1000640F4(v93, v95, v97, v98))
    {
      BOOL v85 = v17 == 0;
    }
    else
    {
      -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
      double v100 = v99;
      double v102 = v101;
      uint64_t v103 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
      [v103 cardinalWestPosition];
      if (!sub_1000640F4(v100, v102, v104, v105))
      {

        BOOL v85 = 0;
        if (v120)
        {
LABEL_121:

          if (v128) {
            goto LABEL_112;
          }
          goto LABEL_122;
        }
LABEL_125:
        if (v128) {
          goto LABEL_112;
        }
LABEL_122:
        if (!v125) {
          goto LABEL_139;
        }
        goto LABEL_129;
      }
      BOOL v85 = v17 == 0;
    }
    if (v120) {
      goto LABEL_121;
    }
    goto LABEL_125;
  }
LABEL_112:

  if (!v125) {
    goto LABEL_139;
  }
LABEL_129:
  if (v123)
  {
    unint64_t v106 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    [v106 centerForConnecting];
    if (v38 == v107 || vabdd_f64(v38, v107) < 0.00999999978)
    {
    }
    else
    {
      unint64_t v108 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
      [v108 centerForConnecting];
      double v110 = v109;

      if (a5.x != v110)
      {
        double v111 = v38;
        double v112 = a5.y;
        if (vabdd_f64(a5.x, v110) < 0.00999999978) {
          goto LABEL_155;
        }
        uint64_t v113 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
        [v113 centerForConnecting];
        if (y == v114 || vabdd_f64(y, v114) < 0.00999999978)
        {

          double v111 = a5.x;
          double v112 = y;
          goto LABEL_155;
        }
        double v115 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
        [v115 centerForConnecting];
        double v117 = v116;

        if (a5.y != v117)
        {
          double v111 = a3.x;
          double v112 = a3.y;
          CGFloat v118 = a5.x;
          if (vabdd_f64(a5.y, v117) < 0.00999999978)
          {
LABEL_154:
            double v111 = v118;
            double v112 = y;
          }
          goto LABEL_155;
        }
LABEL_151:
        double v112 = y;
        double v111 = a5.x;
        goto LABEL_155;
      }
    }
LABEL_148:
    double v111 = v38;
    double v112 = a5.y;
    goto LABEL_155;
  }
  if (v17 == 2 || v17 == 4 || (v45 & 1) != 0) {
    goto LABEL_148;
  }
  if (v17 == 3) {
    goto LABEL_151;
  }
  double v112 = y;
  CGFloat v118 = a5.x;
  if (v17 == 5 || v85)
  {
    double v111 = a5.x;
  }
  else
  {
    double v111 = a3.x;
    double v112 = a3.y;
    switch(v33)
    {
      case 2:
      case 4:
        goto LABEL_154;
      case 3:
      case 5:
        goto LABEL_148;
      default:
        break;
    }
  }
LABEL_155:
  result.double y = v112;
  result.CGFloat x = v111;
  return result;
}

- (CGPoint)p_getControlKnobPositionToSnapToAnyExistingSetControlKnobs:(CGPoint)a3 pointA:(CGPoint)a4 pointB:(CGPoint)a5
{
  double y = a5.y;
  CGFloat v6 = a3.y;
  CGFloat x = a3.x;
  double v9 = sub_100065E00(a4.x, a4.y, a5.x, a5.y, 0.5);
  [(CRLConnectionLineOrthogonalLayout *)self p_getExistingUserSetControlPointToMatch];
  double v11 = v10;
  if (sub_100065BF8(v12, v10))
  {
    *(CGPoint *)((char *)&self->super.mTailMagnetCanvasPosition + 3) = (CGPoint)xmmword_101175160;
  }
  else if ([(CRLConnectionLineOrthogonalLayout *)self p_tailComingFromSouth] && y > v11 {
         || [(CRLConnectionLineOrthogonalLayout *)self p_tailComingFromNorth] && y < v11)
  }
  {
    *(double *)((char *)&self->super.mTailMagnetCanvasPosition.x + 3) = v9;
    *(double *)((char *)&self->super.mTailMagnetCanvasPosition.y + 3) = v11;
  }
  if (!sub_100065BF8(*(double *)((char *)&self->super.mTailMagnetCanvasPosition.x + 3), *(double *)((char *)&self->super.mTailMagnetCanvasPosition.y + 3))&& ![(CRLConnectionLineAbstractLayout *)self userDidSetControlPoint])
  {
    CGFloat x = *(double *)((char *)&self->super.mTailMagnetCanvasPosition.x + 3);
    CGFloat v6 = *(double *)((char *)&self->super.mTailMagnetCanvasPosition.y + 3);
  }
  double v13 = x;
  double v14 = v6;
  result.double y = v14;
  result.CGFloat x = v13;
  return result;
}

- (CGPoint)p_getExistingUserSetControlPointToMatch
{
  double v3 = INFINITY;
  double v4 = INFINITY;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v5 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  CGFloat v6 = [v5 connectedLayouts];

  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    double v9 = 1.79769313e308;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(CRLConnectionLineOrthogonalLayout **)(*((void *)&v31 + 1) + 8 * i);
        if (v11 != self)
        {
          double v12 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            if ([(CRLConnectionLineOrthogonalLayout *)self p_connectionLineComingFromSideOfOriginObject:v11])
            {
              double v14 = [(CRLConnectionLineAbstractLayout *)v11 connectionLineInfo];
              double v15 = [v14 connectionLinePathSource];

              [v15 getControlKnobPosition:12];
              double v25 = v17;
              double v26 = v16;
              if (v11)
              {
                [(CRLCanvasAbstractLayout *)v11 transform];
                float64x2_t v19 = v28;
                float64x2_t v20 = v29;
                float64x2_t v21 = v30;
              }
              else
              {
                float64x2_t v29 = 0u;
                float64x2_t v30 = 0u;
                float64x2_t v21 = 0uLL;
                float64x2_t v19 = 0uLL;
                float64x2_t v20 = 0uLL;
                float64x2_t v28 = 0u;
              }
              float64x2_t v27 = vaddq_f64(v21, vmlaq_n_f64(vmulq_n_f64(v20, v25), v19, v26));
              double v22 = sub_1000653B4(v27.f64[0], v27.f64[1], *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3));
              if (v22 < v9)
              {
                double v9 = v22;
                double v3 = v27.f64[0];
                double v4 = v27.f64[1];
              }
            }
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  double v23 = v3;
  double v24 = v4;
  result.double y = v24;
  result.CGFloat x = v23;
  return result;
}

- (BOOL)p_tailComingFromNorth
{
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v7 cardinalNorthPosition];
  BOOL v10 = sub_1000640F4(v4, v6, v8, v9);

  return v10;
}

- (BOOL)p_tailComingFromSouth
{
  -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  [v7 cardinalSouthPosition];
  BOOL v10 = sub_1000640F4(v4, v6, v8, v9);

  return v10;
}

- (BOOL)p_connectionLineComingFromSideOfOriginObject:(id)a3
{
  id v4 = a3;
  if ((id)[(CRLConnectionLineAbstractLayout *)self tailMagnetType] == (id)1)
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, *(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *(double *)((char *)&self->mOverriddenControlPoint.x + 3);
    double v8 = *(double *)((char *)&self->mOverriddenControlPoint.y + 3);
  }
  unint64_t v9 = [(CRLConnectionLineAbstractLayout *)self headMagnetType];
  double v11 = *(double *)((char *)&self->mLastPtA.x + 3);
  double v10 = *(double *)((char *)&self->mLastPtA.y + 3);
  if (v9 == 1)
  {
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, v11, v10, *(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3));
    double v11 = v12;
    double v10 = v13;
  }
  if ([v4 tailMagnetType] == (id)1)
  {
    [v4 headMagnetCanvasPosition];
    double v15 = v14;
    double v17 = v16;
    [v4 tailMagnetCanvasPosition];
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 10, v15, v17, v18, v19);
  }
  else
  {
    [v4 tailMagnetCanvasPosition];
  }
  double v22 = v20;
  double v23 = v21;
  if ([v4 headMagnetType] == (id)1)
  {
    [v4 headMagnetCanvasPosition];
    double v25 = v24;
    double v27 = v26;
    [v4 tailMagnetCanvasPosition];
    -[CRLConnectionLineOrthogonalLayout p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:](self, "p_getLineEndPointAdjustedToCardinalForClineLayout:withHead:withTail:forLineEnd:", self, 11, v25, v27, v28, v29);
  }
  else
  {
    [v4 headMagnetCanvasPosition];
  }
  double v32 = v30;
  double v33 = v31;
  long long v34 = [v4 connectedTo];
  BOOL v35 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
  if (v34 == v35 && sub_1000653B4(v32, v33, v11, v10) < 5.0)
  {
    BOOL v36 = 1;
  }
  else
  {
    int v37 = [v4 connectedFrom];
    double v38 = [(CRLConnectionLineAbstractLayout *)self connectedTo];
    if (v37 == v38 && sub_1000653B4(v22, v23, v11, v10) < 5.0)
    {
      BOOL v36 = 1;
    }
    else
    {
      double v39 = [v4 connectedTo];
      double v40 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
      if (v39 == v40 && sub_1000653B4(v32, v33, v6, v8) < 5.0)
      {
        BOOL v36 = 1;
      }
      else
      {
        double v41 = [v4 connectedFrom];
        double v42 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
        BOOL v36 = v41 == v42 && sub_1000653B4(v22, v23, v6, v8) < 5.0;
      }
    }
  }
  return v36;
}

- (CGPoint)p_getLineEndPointAdjustedToCardinalForClineLayout:(id)a3 withHead:(CGPoint)a4 withTail:(CGPoint)a5 forLineEnd:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v11 = a3;
  double v12 = v11;
  if (a6 == 11)
  {
    double x = v10;
    double v13 = v9;
  }
  else
  {
    double v13 = y;
  }
  if (v9 > y && a6 == 11)
  {
    double v16 = [v11 connectedTo];
    [v16 cardinalNorthPosition];
    goto LABEL_20;
  }
  if (y > v9 && a6 == 10)
  {
    double v16 = [v11 connectedFrom];
    [v16 cardinalNorthPosition];
    goto LABEL_20;
  }
  if (y > v9 && a6 == 11)
  {
    double v16 = [v11 connectedTo];
    [v16 cardinalSouthPosition];
LABEL_20:
    double x = v17;
    double v13 = v18;

    goto LABEL_21;
  }
  if (v9 > y && a6 == 10)
  {
    double v16 = [v11 connectedFrom];
    [v16 cardinalSouthPosition];
    goto LABEL_20;
  }
LABEL_21:

  double v19 = x;
  double v20 = v13;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (BOOL)canEndpointsCoincide
{
  return 1;
}

- (CGPoint)axisSnapPoint:(CGPoint)a3 toXs:()vector<double toYs:(std:()vector<double :(std:(double)a6 :allocator<double>> *)a5 allocator<double>> *)a4 withThreshold:
{
  begin = a4->__begin_;
  end = a4->__end_;
  if (a4->__begin_ == end)
  {
    double v8 = 1.79769313e308;
  }
  else
  {
    double v8 = 1.79769313e308;
    do
    {
      double v9 = *begin++;
      double v10 = a3.x - v9;
      double v11 = -v8;
      if (v8 >= 0.0) {
        double v11 = v8;
      }
      double v12 = -v10;
      if (v10 >= 0.0) {
        double v12 = v10;
      }
      if (v11 >= v12) {
        double v8 = v10;
      }
    }
    while (begin != end);
  }
  double v13 = a5->__begin_;
  double v14 = a5->__end_;
  if (a5->__begin_ == v14)
  {
    double v15 = 1.79769313e308;
  }
  else
  {
    double v15 = 1.79769313e308;
    do
    {
      double v16 = *v13++;
      double v17 = a3.y - v16;
      double v18 = -v15;
      if (v15 >= 0.0) {
        double v18 = v15;
      }
      double v19 = -v17;
      if (v17 >= 0.0) {
        double v19 = v17;
      }
      if (v18 >= v19) {
        double v15 = v17;
      }
    }
    while (v13 != v14);
  }
  double v20 = -v8;
  if (v8 >= 0.0) {
    double v20 = v8;
  }
  if (v20 >= a6) {
    double v8 = 0.0;
  }
  double v21 = a3.x - v8;
  double v22 = -v15;
  if (v15 >= 0.0) {
    double v22 = v15;
  }
  if (v22 >= a6) {
    double v23 = 0.0;
  }
  else {
    double v23 = v15;
  }
  double v24 = a3.y - v23;
  result.double y = v24;
  result.double x = v21;
  return result;
}

- (void)addEndpointSnapsToXs:(void *)a3 andYs:(void *)a4
{
  double v7 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  if (v7)
  {
    double v8 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    double v9 = [v8 parent];
    double v10 = [(CRLCanvasAbstractLayout *)self parent];
    if (v9 == v10)
    {
      double v11 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }

  double v12 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
  if (v12)
  {
    double v13 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    double v14 = [v13 parent];
    double v15 = [(CRLCanvasAbstractLayout *)self parent];
    if (v14 == v15)
    {
      double v16 = [(CRLConnectionLineAbstractLayout *)self connectedFrom];
    }
    else
    {
      double v16 = 0;
    }
  }
  else
  {
    double v16 = 0;
  }

  double v17 = [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
  double v18 = v17;
  if (v11)
  {
    [v11 centerForConnecting];
    double v20 = v19;
    double v22 = v21;
    if (v16)
    {
LABEL_15:
      [v16 centerForConnecting];
      double v24 = v23;
      double v26 = v25;
      goto LABEL_24;
    }
  }
  else
  {
    [v17 getControlKnobPosition:10];
    double v28 = v27;
    double v30 = v29;
    double v31 = [(CRLCanvasLayout *)self pureGeometry];
    double v32 = v31;
    if (v31)
    {
      [v31 transform];
      double v33 = v106;
      double v34 = v105;
      double v35 = v108;
      double v36 = v107;
      double v37 = v110;
      double v38 = v109;
    }
    else
    {
      double v37 = 0.0;
      double v35 = 0.0;
      double v33 = 0.0;
      double v38 = 0.0;
      double v36 = 0.0;
      double v34 = 0.0;
    }
    double v20 = v38 + v30 * v36 + v34 * v28;
    double v22 = v37 + v30 * v35 + v33 * v28;

    if (v16) {
      goto LABEL_15;
    }
  }
  [v18 getControlKnobPosition:11];
  double v40 = v39;
  double v42 = v41;
  BOOL v43 = [(CRLCanvasLayout *)self pureGeometry];
  BOOL v44 = v43;
  if (v43)
  {
    [v43 transform];
    double v45 = v100;
    double v46 = v99;
    double v47 = v102;
    double v48 = v101;
    double v49 = v104;
    double v50 = v103;
  }
  else
  {
    double v49 = 0.0;
    double v47 = 0.0;
    double v45 = 0.0;
    double v50 = 0.0;
    double v48 = 0.0;
    double v46 = 0.0;
  }
  double v24 = v50 + v42 * v48 + v46 * v40;
  double v26 = v49 + v42 * v47 + v45 * v40;

LABEL_24:
  unint64_t v51 = *((void *)a3 + 2);
  double v52 = (double *)*((void *)a3 + 1);
  if ((unint64_t)v52 >= v51)
  {
    double v54 = *(double **)a3;
    uint64_t v55 = ((uint64_t)v52 - *(void *)a3) >> 3;
    unint64_t v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61) {
      goto LABEL_89;
    }
    uint64_t v57 = v51 - (void)v54;
    if (v57 >> 2 > v56) {
      unint64_t v56 = v57 >> 2;
    }
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v58 = v56;
    }
    if (v58)
    {
      double v59 = (char *)sub_10002B494((uint64_t)a3 + 16, v58);
      double v54 = *(double **)a3;
      double v52 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v59 = 0;
    }
    double v60 = (double *)&v59[8 * v55];
    int v61 = &v59[8 * v58];
    *double v60 = v20;
    double v53 = v60 + 1;
    while (v52 != v54)
    {
      uint64_t v62 = *((void *)v52-- - 1);
      *((void *)v60-- - 1) = v62;
    }
    *(void *)a3 = v60;
    *((void *)a3 + 1) = v53;
    *((void *)a3 + 2) = v61;
    if (v54) {
      operator delete(v54);
    }
  }
  else
  {
    *double v52 = v20;
    double v53 = v52 + 1;
  }
  *((void *)a3 + 1) = v53;
  unint64_t v63 = *((void *)a4 + 2);
  double v64 = (double *)*((void *)a4 + 1);
  if ((unint64_t)v64 >= v63)
  {
    double v66 = *(double **)a4;
    uint64_t v67 = ((uint64_t)v64 - *(void *)a4) >> 3;
    unint64_t v68 = v67 + 1;
    if ((unint64_t)(v67 + 1) >> 61) {
      goto LABEL_89;
    }
    uint64_t v69 = v63 - (void)v66;
    if (v69 >> 2 > v68) {
      unint64_t v68 = v69 >> 2;
    }
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v70 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v70 = v68;
    }
    if (v70)
    {
      double v71 = (char *)sub_10002B494((uint64_t)a4 + 16, v70);
      double v66 = *(double **)a4;
      double v64 = (double *)*((void *)a4 + 1);
    }
    else
    {
      double v71 = 0;
    }
    double v72 = (double *)&v71[8 * v67];
    double v73 = &v71[8 * v70];
    *double v72 = v22;
    double v65 = v72 + 1;
    while (v64 != v66)
    {
      uint64_t v74 = *((void *)v64-- - 1);
      *((void *)v72-- - 1) = v74;
    }
    *(void *)a4 = v72;
    *((void *)a4 + 1) = v65;
    *((void *)a4 + 2) = v73;
    if (v66) {
      operator delete(v66);
    }
  }
  else
  {
    *double v64 = v22;
    double v65 = v64 + 1;
  }
  *((void *)a4 + 1) = v65;
  double v76 = (double *)*((void *)a3 + 1);
  unint64_t v75 = *((void *)a3 + 2);
  if ((unint64_t)v76 >= v75)
  {
    int v78 = *(double **)a3;
    uint64_t v79 = ((uint64_t)v76 - *(void *)a3) >> 3;
    unint64_t v80 = v79 + 1;
    if ((unint64_t)(v79 + 1) >> 61) {
      goto LABEL_89;
    }
    uint64_t v81 = v75 - (void)v78;
    if (v81 >> 2 > v80) {
      unint64_t v80 = v81 >> 2;
    }
    if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v82 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v82 = v80;
    }
    if (v82)
    {
      double v83 = (char *)sub_10002B494((uint64_t)a3 + 16, v82);
      int v78 = *(double **)a3;
      double v76 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v83 = 0;
    }
    double v84 = (double *)&v83[8 * v79];
    BOOL v85 = &v83[8 * v82];
    double *v84 = v24;
    int v77 = v84 + 1;
    while (v76 != v78)
    {
      uint64_t v86 = *((void *)v76-- - 1);
      *((void *)v84-- - 1) = v86;
    }
    *(void *)a3 = v84;
    *((void *)a3 + 1) = v77;
    *((void *)a3 + 2) = v85;
    if (v78) {
      operator delete(v78);
    }
  }
  else
  {
    *double v76 = v24;
    int v77 = v76 + 1;
  }
  *((void *)a3 + 1) = v77;
  double v88 = (double *)*((void *)a4 + 1);
  unint64_t v87 = *((void *)a4 + 2);
  if ((unint64_t)v88 < v87)
  {
    *double v88 = v26;
    double v89 = v88 + 1;
    goto LABEL_88;
  }
  double v90 = *(double **)a4;
  uint64_t v91 = ((uint64_t)v88 - *(void *)a4) >> 3;
  unint64_t v92 = v91 + 1;
  if ((unint64_t)(v91 + 1) >> 61) {
LABEL_89:
  }
    sub_100004E40();
  uint64_t v93 = v87 - (void)v90;
  if (v93 >> 2 > v92) {
    unint64_t v92 = v93 >> 2;
  }
  if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v94 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v94 = v92;
  }
  if (v94)
  {
    double v95 = (char *)sub_10002B494((uint64_t)a4 + 16, v94);
    double v90 = *(double **)a4;
    double v88 = (double *)*((void *)a4 + 1);
  }
  else
  {
    double v95 = 0;
  }
  uint64_t v96 = (double *)&v95[8 * v91];
  double v97 = &v95[8 * v94];
  *uint64_t v96 = v26;
  double v89 = v96 + 1;
  while (v88 != v90)
  {
    uint64_t v98 = *((void *)v88-- - 1);
    *((void *)v96-- - 1) = v98;
  }
  *(void *)a4 = v96;
  *((void *)a4 + 1) = v89;
  *((void *)a4 + 2) = v97;
  if (v90) {
    operator delete(v90);
  }
LABEL_88:
  *((void *)a4 + 1) = v89;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double v5 = [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
  [v5 getControlKnobPosition:a3];
  double v7 = v6;
  v23.f64[0] = v8;
  if (a3 == 12)
  {
    double v38 = 0;
    double v39 = 0;
    uint64_t v40 = 0;
    double v35 = 0;
    double v36 = 0;
    uint64_t v37 = 0;
    [(CRLConnectionLineOrthogonalLayout *)self addEndpointSnapsToXs:&v38 andYs:&v35];
    memset(&v34, 0, sizeof(v34));
    double v9 = [(CRLCanvasLayout *)self pureGeometry];
    double v10 = v9;
    if (v9) {
      [v9 transform];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }

    long long v11 = *(_OWORD *)&v34.a;
    long long v12 = *(_OWORD *)&v34.c;
    long long v13 = *(_OWORD *)&v34.tx;
    double v32 = 0;
    uint64_t v33 = 0;
    double v31 = 0;
    sub_1002572E8(&v31, v38, (uint64_t)v39, (v39 - (unsigned char *)v38) >> 3);
    __p = 0;
    double v29 = 0;
    uint64_t v30 = 0;
    sub_1002572E8(&__p, v35, (uint64_t)v36, (v36 - (unsigned char *)v35) >> 3);
    -[CRLConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v31, &__p, *(double *)&v13 + v7 * *(double *)&v12 + *(double *)&v11 * v23.f64[0], *((double *)&v13 + 1) + v7 * *((double *)&v12 + 1) + *((double *)&v11 + 1) * v23.f64[0], 2.0);
    double v21 = v15;
    double v24 = v14;
    if (__p)
    {
      double v29 = __p;
      operator delete(__p);
    }
    if (v31)
    {
      double v32 = v31;
      operator delete(v31);
    }
    CGAffineTransform v26 = v34;
    CGAffineTransformInvert(&v27, &v26);
    float64x2_t v16 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v27.c, v21), *(float64x2_t *)&v27.a, v24);
    float64x2_t v17 = *(float64x2_t *)&v27.tx;
    if (v35)
    {
      double v36 = v35;
      float64x2_t v22 = *(float64x2_t *)&v27.tx;
      float64x2_t v25 = v16;
      operator delete(v35);
      float64x2_t v17 = v22;
      float64x2_t v16 = v25;
    }
    float64x2_t v18 = vaddq_f64(v17, v16);
    float64x2_t v23 = v18;
    if (v38)
    {
      double v39 = v38;
      operator delete(v38);
      v18.f64[1] = v23.f64[1];
    }
    double v7 = v18.f64[1];
  }

  double v19 = v23.f64[0];
  double v20 = v7;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v75 = a4;
  double v7 = [v75 knob];
  id v8 = [v7 tag];

  if (v8 == (id)12)
  {
    double v9 = [(CRLCanvasLayout *)self originalGeometry];
    double v10 = v9;
    if (v9)
    {
      [v9 transform];
      double v11 = *(double *)&v102;
      double v72 = *((double *)&v103 + 1);
      double v12 = *(double *)&v103;
      double v73 = *((double *)&v102 + 1);
      unsigned long long v14 = v104;
      *(void *)&double v74 = v14 >> 64;
      *(void *)&double v13 = v14;
    }
    else
    {
      long long v103 = 0u;
      unsigned long long v104 = 0u;
      long long v102 = 0u;
      double v73 = 0.0;
      double v74 = 0.0;
      double v72 = 0.0;
      double v13 = 0.0;
      double v12 = 0.0;
      double v11 = 0.0;
    }

    __p = 0;
    double v100 = 0;
    unint64_t v101 = 0;
    uint64_t v96 = 0;
    double v97 = 0;
    unint64_t v98 = 0;
    [(CRLConnectionLineOrthogonalLayout *)self addEndpointSnapsToXs:&__p andYs:&v96];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    double v15 = [(CRLCanvasAbstractLayout *)self parent];
    obuint64_t j = [v15 children];

    id v16 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
    if (v16)
    {
      uint64_t v77 = *(void *)v93;
      float64x2_t v17 = self;
      do
      {
        for (unint64_t i = 0; i != v16; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v93 != v77) {
            objc_enumerationMutation(obj);
          }
          double v19 = *(CRLConnectionLineOrthogonalLayout **)(*((void *)&v92 + 1) + 8 * i);
          if (v19 != self)
          {
            uint64_t v20 = objc_opt_class();
            double v21 = sub_1002469D0(v20, v19);
            float64x2_t v22 = v21;
            if (v21)
            {
              float64x2_t v23 = [v21 path];
              float64x2_t v90 = 0u;
              float64x2_t v91 = 0u;
              float64x2_t v89 = 0u;
              double v24 = [v22 pureGeometry];
              float64x2_t v25 = v24;
              if (v24)
              {
                [v24 transform];
              }
              else
              {
                float64x2_t v90 = 0u;
                float64x2_t v91 = 0u;
                float64x2_t v89 = 0u;
              }

              [v23 elementAtIndex:0 associatedPoints:&v88];
              float64x2_t v88 = vaddq_f64(v91, vmlaq_n_f64(vmulq_n_f64(v90, v88.f64[1]), v89, v88.f64[0]));
              id v26 = [v23 elementCount];
              if ((unint64_t)v26 >= 2)
              {
                for (uint64_t j = 1; (id)j != v26; ++j)
                {
                  [v23 elementAtIndex:j associatedPoints:&v87 *(void *)&v72 *(void *)&v73 *(void *)&v74];
                  float64_t v28 = v88.f64[0];
                  float64x2_t v87 = vaddq_f64(v91, vmlaq_n_f64(vmulq_n_f64(v90, v87.f64[1]), v89, v87.f64[0]));
                  float64_t v29 = v88.f64[1];
                  double v30 = fabs(sub_100064680(v87.f64[0], v87.f64[1], v88.f64[0]));
                  double v32 = fabs(v31);
                  if (v30 >= 0.1 || v32 <= 0.1)
                  {
                    if (v30 <= 0.1 || v32 >= 0.1) {
                      goto LABEL_56;
                    }
                    double v35 = v97;
                    if ((unint64_t)v97 >= v98)
                    {
                      BOOL v43 = v96;
                      uint64_t v44 = ((char *)v97 - (unsigned char *)v96) >> 3;
                      unint64_t v45 = v44 + 1;
                      if ((unint64_t)(v44 + 1) >> 61) {
LABEL_79:
                      }
                        sub_100004E40();
                      uint64_t v46 = v98 - (void)v96;
                      if ((uint64_t)(v98 - (void)v96) >> 2 > v45) {
                        unint64_t v45 = v46 >> 2;
                      }
                      if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v47 = v45;
                      }
                      if (v47)
                      {
                        double v48 = (char *)sub_10002B494((uint64_t)&v98, v47);
                        BOOL v43 = v96;
                        double v35 = v97;
                        float64_t v29 = v88.f64[1];
                      }
                      else
                      {
                        double v48 = 0;
                      }
                      unint64_t v51 = &v48[8 * v44];
                      *(float64_t *)unint64_t v51 = v29;
                      double v36 = v51 + 8;
                      while (v35 != v43)
                      {
                        uint64_t v52 = *--v35;
                        *((void *)v51 - 1) = v52;
                        v51 -= 8;
                      }
                      uint64_t v96 = v51;
                      double v97 = v36;
                      unint64_t v98 = (unint64_t)&v48[8 * v47];
                      if (v43) {
                        operator delete(v43);
                      }
                    }
                    else
                    {
                      *(float64_t *)double v97 = v29;
                      double v36 = v35 + 1;
                    }
                    double v97 = v36;
                  }
                  else
                  {
                    uint64_t v33 = v100;
                    if ((unint64_t)v100 >= v101)
                    {
                      uint64_t v37 = __p;
                      uint64_t v38 = ((char *)v100 - (unsigned char *)__p) >> 3;
                      unint64_t v39 = v38 + 1;
                      if ((unint64_t)(v38 + 1) >> 61) {
                        goto LABEL_79;
                      }
                      uint64_t v40 = v101 - (void)__p;
                      if ((uint64_t)(v101 - (void)__p) >> 2 > v39) {
                        unint64_t v39 = v40 >> 2;
                      }
                      if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v41 = v39;
                      }
                      if (v41)
                      {
                        double v42 = (char *)sub_10002B494((uint64_t)&v101, v41);
                        uint64_t v37 = __p;
                        uint64_t v33 = v100;
                        float64_t v28 = v88.f64[0];
                      }
                      else
                      {
                        double v42 = 0;
                      }
                      double v49 = &v42[8 * v38];
                      *(float64_t *)double v49 = v28;
                      CGAffineTransform v34 = v49 + 8;
                      while (v33 != v37)
                      {
                        uint64_t v50 = *--v33;
                        *((void *)v49 - 1) = v50;
                        v49 -= 8;
                      }
                      __p = v49;
                      double v100 = v34;
                      unint64_t v101 = (unint64_t)&v42[8 * v41];
                      if (v37) {
                        operator delete(v37);
                      }
                    }
                    else
                    {
                      *(float64_t *)double v100 = v28;
                      CGAffineTransform v34 = v33 + 1;
                    }
                    double v100 = v34;
                  }
                  self = v17;
LABEL_56:
                  float64x2_t v88 = v87;
                }
              }
            }
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
      }
      while (v16);
    }

    double v84 = 0;
    BOOL v85 = 0;
    uint64_t v86 = 0;
    sub_1002572E8(&v84, __p, (uint64_t)v100, ((char *)v100 - (unsigned char *)__p) >> 3);
    uint64_t v81 = 0;
    unint64_t v82 = 0;
    uint64_t v83 = 0;
    sub_1002572E8(&v81, v96, (uint64_t)v97, ((char *)v97 - (unsigned char *)v96) >> 3);
    double v53 = [v75 icc];
    [v53 viewScale];
    -[CRLConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v84, &v81, v13 + y * v12 + v11 * x, v74 + y * v72 + v73 * x, (double)7 / v54);
    double v56 = v55;
    double v58 = v57;

    if (v81)
    {
      unint64_t v82 = v81;
      operator delete(v81);
    }
    if (v84)
    {
      BOOL v85 = v84;
      operator delete(v84);
    }
    BOOL v59 = sub_1000653B4(*(double *)((char *)&self->mOverriddenControlPoint.x + 3), *(double *)((char *)&self->mOverriddenControlPoint.y + 3), v56, v58) >= 10.0&& sub_1000653B4(*(double *)((char *)&self->mLastPtA.x + 3), *(double *)((char *)&self->mLastPtA.y + 3), v56, v58) >= 10.0;
    if ([(CRLConnectionLineAbstractLayout *)self userDidSetControlPoint]&& !v59)
    {
      double v56 = *(double *)((char *)&self->mSnappedUserSetControlPoint.x + 3);
      double v58 = *(double *)((char *)&self->mSnappedUserSetControlPoint.y + 3);
    }
    double v60 = [(CRLCanvasLayout *)self originalGeometry];
    int v61 = v60;
    if (v60) {
      [v60 transform];
    }
    else {
      memset(&v79, 0, sizeof(v79));
    }
    CGAffineTransformInvert(&v80, &v79);
    double a = v80.a;
    double b = v80.b;
    double c = v80.c;
    double d = v80.d;
    tdouble x = v80.tx;
    tdouble y = v80.ty;

    double v68 = v58 * c;
    double v69 = v58 * d;
    if (v96)
    {
      double v97 = v96;
      operator delete(v96);
    }
    double v70 = v68 + a * v56;
    double v71 = v69 + b * v56;
    if (__p)
    {
      double v100 = __p;
      operator delete(__p);
    }
    double x = tx + v70;
    double y = ty + v71;
  }
  v78.receiver = self;
  v78.super_class = (Class)CRLConnectionLineOrthogonalLayout;
  -[CRLConnectionLineAbstractLayout dynamicallyMovedSmartShapeKnobTo:withTracker:](&v78, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v75, x, y);
}

- (CGPoint)outsetFromMagnetPosition:(CGPoint)a3 withRect:(CGRect)a4 controlPoint:(CGPoint)a5 distance:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v8 = a4.origin.y;
  double v9 = a4.origin.x;
  double v10 = a3.y;
  double v11 = a3.x;
  double v12 = sub_100065738(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v14 = v13;
  double v31 = height;
  double v15 = sqrt(height * height + width * width) * 0.5 + 2.0;
  float v16 = v10 - v13;
  *(float *)&double v13 = v11 - v12;
  float v17 = atan2f(v16, *(float *)&v13);
  sub_100066410(v17);
  double v34 = v12;
  __double2 v19 = __sincos_stret(v18);
  double v33 = v14;
  double v20 = v19.__sinval * (v15 - vabdd_f64(v10, v14));
  double v21 = v11 + v19.__cosval * (v15 - vabdd_f64(v11, v12));
  double v22 = v10 + v20;
  if (sub_100064D4C(v11, v10, v21, v10 + v20, v9, v8, v9 + width, v8))
  {
    if (y <= v8 - a6 || y > v10 + 2.0) {
      double v10 = v8 - a6;
    }
    else {
      double v10 = y;
    }
  }
  else
  {
    double v24 = v8 + v31;
    double v32 = v9 + width;
    if (sub_100064D4C(v34, v33, v21, v22, v9, v24, v9 + width, v24))
    {
      if (y >= v24 + a6 || y < v10 + -2.0) {
        double v10 = v24 + a6;
      }
      else {
        double v10 = y;
      }
    }
    else if (sub_100064D4C(v34, v33, v21, v22, v9, v8, v9, v24))
    {
      if (x <= v9 - a6 || x > v11 + 2.0) {
        double v11 = v9 - a6;
      }
      else {
        double v11 = x;
      }
    }
    else if (x >= v32 + a6 || x < v11 + -2.0)
    {
      double v11 = v32 + a6;
    }
    else
    {
      double v11 = x;
    }
  }
  double v28 = v11;
  double v29 = v10;
  result.double y = v29;
  result.double x = v28;
  return result;
}

@end