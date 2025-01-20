@interface CRLBrushStrokeStorageBezierPathContainer
- (BOOL)isEqual:(id)a3;
- (CRLBezierPath)originalPath;
- (CRLBezierPath)pathWithPossibleSmoothing;
- (CRLBrushStrokeStorageBezierPathContainer)initWithOriginalPath:(id)a3 pathWithPossibleSmoothing:(id)a4;
- (unint64_t)hash;
@end

@implementation CRLBrushStrokeStorageBezierPathContainer

- (CRLBrushStrokeStorageBezierPathContainer)initWithOriginalPath:(id)a3 pathWithPossibleSmoothing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLBrushStrokeStorageBezierPathContainer;
  v9 = [(CRLBrushStrokeStorageBezierPathContainer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalPath, a3);
    objc_storeStrong((id *)&v10->_pathWithPossibleSmoothing, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6
    && ([(CRLBrushStrokeStorageBezierPathContainer *)self originalPath],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v6 originalPath],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    v10 = [(CRLBrushStrokeStorageBezierPathContainer *)self pathWithPossibleSmoothing];
    v11 = [v6 pathWithPossibleSmoothing];
    unsigned __int8 v12 = [v10 isEqual:v11];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(CRLBrushStrokeStorageBezierPathContainer *)self originalPath];
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = [(CRLBrushStrokeStorageBezierPathContainer *)self pathWithPossibleSmoothing];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (CRLBezierPath)originalPath
{
  return self->_originalPath;
}

- (CRLBezierPath)pathWithPossibleSmoothing
{
  return self->_pathWithPossibleSmoothing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathWithPossibleSmoothing, 0);

  objc_storeStrong((id *)&self->_originalPath, 0);
}

@end