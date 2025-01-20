@interface PUDisplayTileTransform
+ (PUDisplayTileTransform)displayTileTransformWithModelTileTransform:(id)a3 initialScale:(double)a4 initialSize:(CGSize)a5 displaySize:(CGSize)a6 secondaryDisplayTileTransform:(id)a7;
- (BOOL)hasUserInput;
- (BOOL)isZoomedOut;
- (CGAffineTransform)affineTransform;
- (CGSize)_displaySize;
- (CGSize)_initialSize;
- (CGSize)transformPadding;
- (NSString)userInputOriginIdentifier;
- (PUDisplayTileTransform)init;
- (PUModelTileTransform)modelTileTransform;
- (double)_initialScale;
- (id)description;
- (id)newDisplayTileTransformWithUserAffineTransform:(CGAffineTransform *)a3 userInputOriginIdentifier:(id)a4 isZoomedOut:(BOOL)a5;
- (void)_setAffineTransform:(CGAffineTransform *)a3;
- (void)_setDisplaySize:(CGSize)a3;
- (void)_setHasUserInput:(BOOL)a3;
- (void)_setInitialScale:(double)a3;
- (void)_setInitialSize:(CGSize)a3;
- (void)_setTransformPadding:(CGSize)a3;
- (void)_setUserInputOriginIdentifier:(id)a3;
- (void)_setZoomedOut:(BOOL)a3;
@end

@implementation PUDisplayTileTransform

- (void).cxx_destruct
{
}

- (void)_setZoomedOut:(BOOL)a3
{
  self->_isZoomedOut = a3;
}

- (BOOL)isZoomedOut
{
  return self->_isZoomedOut;
}

- (void)_setDisplaySize:(CGSize)a3
{
  self->__displaySize = a3;
}

- (CGSize)_displaySize
{
  double width = self->__displaySize.width;
  double height = self->__displaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setInitialSize:(CGSize)a3
{
  self->__initialSize = a3;
}

- (CGSize)_initialSize
{
  double width = self->__initialSize.width;
  double height = self->__initialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setInitialScale:(double)a3
{
  self->__initialScale = a3;
}

- (double)_initialScale
{
  return self->__initialScale;
}

- (void)_setTransformPadding:(CGSize)a3
{
  self->_transformPadding = a3;
}

- (CGSize)transformPadding
{
  double width = self->_transformPadding.width;
  double height = self->_transformPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setUserInputOriginIdentifier:(id)a3
{
}

- (NSString)userInputOriginIdentifier
{
  return self->_userInputOriginIdentifier;
}

- (void)_setHasUserInput:(BOOL)a3
{
  self->_hasUserInput = a3;
}

- (BOOL)hasUserInput
{
  return self->_hasUserInput;
}

- (void)_setAffineTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_affineTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_affineTransform.tx = v4;
  *(_OWORD *)&self->_affineTransform.a = v3;
}

- (CGAffineTransform)affineTransform
{
  long long v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (id)description
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(PUDisplayTileTransform *)self hasUserInput];
  [(PUDisplayTileTransform *)self affineTransform];
  v7 = NSStringFromCGAffineTransform(&transform);
  v8 = [v3 stringWithFormat:@"<%@: %p; hasUserInput:%i; affineTransform:%@>", v5, self, v6, v7];

  return v8;
}

- (PUDisplayTileTransform)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUDisplayTileTransform;
  CGSize result = [(PUDisplayTileTransform *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_affineTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_affineTransform.c = v4;
    *(_OWORD *)&result->_affineTransform.tx = *(_OWORD *)(v3 + 32);
    result->__initialScale = 1.0;
  }
  return result;
}

- (PUModelTileTransform)modelTileTransform
{
  if ([(PUDisplayTileTransform *)self hasUserInput])
  {
    long long v40 = *MEMORY[0x1E4F1DAD8];
    double v39 = 1.0;
    [(PUDisplayTileTransform *)self affineTransform];
    PUDecomposeTransform((uint64_t)v38, &v40, &v39, 0, 0);
    [(PUDisplayTileTransform *)self _initialScale];
    double v5 = v4;
    if (v4 == 0.0)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"PUDisplayTileTransform.m", 226, @"Invalid parameter not satisfying: %@", @"initialScale != 0.0" object file lineNumber description];
    }
    double v6 = v39 / v5;
    [(PUDisplayTileTransform *)self _displaySize];
    double v8 = v7;
    double v10 = v9;
    [(PUDisplayTileTransform *)self transformPadding];
    double v12 = v11;
    double v14 = v13;
    [(PUDisplayTileTransform *)self _initialSize];
    double v17 = v16 * v6;
    double v18 = v15 * v6 - v8;
    double v19 = 0.0;
    double v20 = v12 + fmax(v18, 0.0);
    if (v12 > 0.0) {
      double v18 = v20;
    }
    double v21 = v18 * 0.5;
    double v22 = *(double *)&v40 + v18 * 0.5;
    if (*(double *)&v40 >= -(v18 * 0.5)) {
      double v22 = 0.0;
    }
    BOOL v23 = v21 < *(double *)&v40;
    double v24 = *(double *)&v40 - v21;
    if (!v23) {
      double v24 = v22;
    }
    if (v18 > 0.0) {
      double v25 = v24;
    }
    else {
      double v25 = *(double *)&v40;
    }
    double v26 = fmax(fmin(*(double *)&v40 / v18, 0.5), -0.5);
    double v27 = v17 - v10;
    double v28 = v14 + fmax(v17 - v10, 0.0);
    if (v14 > 0.0) {
      double v27 = v28;
    }
    double v29 = v27 * 0.5;
    if (*((double *)&v40 + 1) < -(v27 * 0.5)) {
      double v19 = v27 * 0.5 + *((double *)&v40 + 1);
    }
    if (v29 < *((double *)&v40 + 1)) {
      double v30 = *((double *)&v40 + 1) - v29;
    }
    else {
      double v30 = v19;
    }
    if (v27 > 0.0) {
      double v31 = v30;
    }
    else {
      double v31 = *((double *)&v40 + 1);
    }
    double v32 = fmax(fmin(*((double *)&v40 + 1) / v27, 0.5), -0.5);
    v33 = [PUModelTileTransform alloc];
    v34 = [(PUDisplayTileTransform *)self userInputOriginIdentifier];
    v35 = -[PUModelTileTransform initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:](v33, "initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:", v34, [(PUDisplayTileTransform *)self isZoomedOut], v26, v32, v25, v31, v6);
  }
  else
  {
    v35 = [[PUModelTileTransform alloc] initWithNoUserInput];
  }
  return v35;
}

- (id)newDisplayTileTransformWithUserAffineTransform:(CGAffineTransform *)a3 userInputOriginIdentifier:(id)a4 isZoomedOut:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  double v9 = objc_alloc_init(PUDisplayTileTransform);
  [(PUDisplayTileTransform *)v9 _setHasUserInput:1];
  long long v10 = *(_OWORD *)&a3->c;
  v12[0] = *(_OWORD *)&a3->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a3->tx;
  [(PUDisplayTileTransform *)v9 _setAffineTransform:v12];
  [(PUDisplayTileTransform *)self _initialScale];
  -[PUDisplayTileTransform _setInitialScale:](v9, "_setInitialScale:");
  [(PUDisplayTileTransform *)self _initialSize];
  -[PUDisplayTileTransform _setInitialSize:](v9, "_setInitialSize:");
  [(PUDisplayTileTransform *)self _displaySize];
  -[PUDisplayTileTransform _setDisplaySize:](v9, "_setDisplaySize:");
  [(PUDisplayTileTransform *)v9 _setUserInputOriginIdentifier:v8];

  [(PUDisplayTileTransform *)self transformPadding];
  -[PUDisplayTileTransform _setTransformPadding:](v9, "_setTransformPadding:");
  [(PUDisplayTileTransform *)v9 _setZoomedOut:v5];
  return v9;
}

+ (PUDisplayTileTransform)displayTileTransformWithModelTileTransform:(id)a3 initialScale:(double)a4 initialSize:(CGSize)a5 displaySize:(CGSize)a6 secondaryDisplayTileTransform:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  double v9 = a5.height;
  double v10 = a5.width;
  id v14 = a3;
  id v15 = a7;
  double v77 = a4;
  if (a4 == 0.0)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, a1, @"PUDisplayTileTransform.m", 126, @"Invalid parameter not satisfying: %@", @"initialScale != 0.0f" object file lineNumber description];
  }
  uint64_t v16 = [v14 hasUserInput];
  [v14 normalizedTranslation];
  double v75 = v17;
  double v76 = v18;
  [v14 scale];
  double v79 = v19;
  [v14 overscroll];
  double v22 = *MEMORY[0x1E4F1DB30];
  double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v78 = v10;
  if (v15)
  {
    double v72 = v20;
    double v73 = v21;
    double v24 = [v15 modelTileTransform];
    [v15 _initialSize];
    double v74 = v9;
    double v26 = v25;
    double v28 = v27;
    [v15 _displaySize];
    double v30 = v29;
    double v32 = v31;
    [v24 scale];
    double v68 = v28 * v33;
    double v70 = v26 * v33;
    double v66 = fmin(fmax(width / v10, height / v74), fmax(v30 / v26, v32 / v28));
    v34 = +[PUAirPlaySettings sharedInstance];
    [v34 minimumZoomForScrollPadding];
    double v36 = v35;
    [v34 maximumZoomForScrollPadding];
    double v38 = fmax(v36, fmin(v37, v66));
    double v39 = v26 * v38 - v30;
    double v40 = v28 * v38 - v32;
    if (v70 - v30 < v39) {
      double v39 = v70 - v30;
    }
    if (v68 - v32 < v40) {
      double v40 = v68 - v32;
    }
    double v69 = v40;
    double v71 = v39;
    double v41 = fmin(width / v30, height / v32);
    double v65 = height - v32 * v41;
    double v67 = width - v30 * v41;
    [v24 scale];
    double v43 = v26 * v42;
    double v9 = v74;
    double v44 = v28 * v42;
    double v45 = v43 - v30;
    double v46 = v22 + fmax(v45, 0.0);
    if (v22 > 0.0) {
      double v45 = v46;
    }
    double v47 = v44 - v32;
    double v48 = v23 + fmax(v47, 0.0);
    double v49 = v78 * v79 - width;
    double v50 = fmax(v49, 0.0);
    double v51 = v22 + v50;
    if (v22 <= 0.0) {
      double v51 = v78 * v79 - width;
    }
    if (v23 > 0.0) {
      double v47 = v48;
    }
    double v52 = v74 * v79 - height;
    double v53 = fmax(v52, 0.0);
    double v54 = v23 + v53;
    if (v23 <= 0.0) {
      double v54 = v74 * v79 - height;
    }
    if (v22 >= v51) {
      double v55 = v22;
    }
    else {
      double v55 = v51;
    }
    if (v23 >= v54) {
      double v54 = v23;
    }
    double v56 = v45 - v55;
    double v57 = v47 - v54;
    if (v56 >= v67 - v55) {
      double v56 = v67 - v55;
    }
    if (v57 >= v65 - v54) {
      double v57 = v65 - v54;
    }
    if (v71 - v55 < v56) {
      double v56 = v71 - v55;
    }
    if (v69 - v54 < v57) {
      double v57 = v69 - v54;
    }
    if (v22 < v56) {
      double v22 = v56;
    }
    if (v23 < v57) {
      double v23 = v57;
    }

    double v20 = v72;
    double v21 = v73;
  }
  else
  {
    double v49 = v10 * v79 - width;
    double v50 = fmax(v49, 0.0);
    double v52 = v9 * v79 - height;
    double v53 = fmax(v52, 0.0);
  }
  if (v22 <= 0.0) {
    double v58 = v49;
  }
  else {
    double v58 = v22 + v50;
  }
  if (v23 <= 0.0) {
    double v59 = v52;
  }
  else {
    double v59 = v23 + v53;
  }
  if (v58 > 0.0) {
    double v20 = v20 + v58 * v75;
  }
  if (v59 > 0.0) {
    double v21 = v21 + v59 * v76;
  }
  long long v60 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v83.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v83.c = v60;
  *(_OWORD *)&v83.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v82.a = *(_OWORD *)&v83.a;
  *(_OWORD *)&v82.c = v60;
  *(_OWORD *)&v82.tx = *(_OWORD *)&v83.tx;
  CGAffineTransformTranslate(&v83, &v82, v20, v21);
  CGAffineTransform v81 = v83;
  CGAffineTransformScale(&v82, &v81, v79 * v77, v79 * v77);
  CGAffineTransform v83 = v82;
  v61 = objc_alloc_init(PUDisplayTileTransform);
  [(PUDisplayTileTransform *)v61 _setHasUserInput:v16];
  CGAffineTransform v82 = v83;
  [(PUDisplayTileTransform *)v61 _setAffineTransform:&v82];
  [(PUDisplayTileTransform *)v61 _setInitialScale:v77];
  -[PUDisplayTileTransform _setInitialSize:](v61, "_setInitialSize:", v78, v9);
  -[PUDisplayTileTransform _setDisplaySize:](v61, "_setDisplaySize:", width, height);
  v62 = [v14 userInputOriginIdentifier];
  [(PUDisplayTileTransform *)v61 _setUserInputOriginIdentifier:v62];

  -[PUDisplayTileTransform _setTransformPadding:](v61, "_setTransformPadding:", v22, v23);
  return v61;
}

@end