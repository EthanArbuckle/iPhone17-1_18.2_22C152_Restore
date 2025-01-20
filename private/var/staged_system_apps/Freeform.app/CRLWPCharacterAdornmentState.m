@interface CRLWPCharacterAdornmentState
+ (id)p_deepCopyPathArray:(id)a3;
- (BOOL)fillsCurrentTextContainer;
- (BOOL)hasValidFillState;
- (BOOL)hasValidStrokeState;
- (CGRect)currentFillRect;
- (CGRect)currentStrokeRect;
- (CRLFill)currentAdornmentFill;
- (CRLShadow)currentFillShadow;
- (CRLShadow)currentStrokeShadow;
- (CRLStroke)currentAdornmentStroke;
- (CRLWPCharacterAdornmentState)init;
- (NSMutableSet)currentDropCapAdornments;
- (TSUSparseArray)currentFillPaths;
- (TSUSparseArray)currentRubyFillPaths;
- (TSUSparseArray)currentRubyStrokePaths;
- (TSUSparseArray)currentStrokePaths;
- (_NSRange)currentFillRange;
- (_NSRange)currentStrokeRange;
- (void)resetFillState;
- (void)resetStrokeState;
- (void)setCurrentAdornmentFill:(id)a3;
- (void)setCurrentAdornmentStroke:(id)a3;
- (void)setCurrentDropCapAdornments:(id)a3;
- (void)setCurrentFillPaths:(id)a3;
- (void)setCurrentFillRange:(_NSRange)a3;
- (void)setCurrentFillRect:(CGRect)a3;
- (void)setCurrentFillShadow:(id)a3;
- (void)setCurrentRubyFillPaths:(id)a3;
- (void)setCurrentRubyStrokePaths:(id)a3;
- (void)setCurrentStrokePaths:(id)a3;
- (void)setCurrentStrokeRange:(_NSRange)a3;
- (void)setCurrentStrokeRect:(CGRect)a3;
- (void)setCurrentStrokeShadow:(id)a3;
- (void)setFillsCurrentTextContainer:(BOOL)a3;
- (void)setHasValidFillState:(BOOL)a3;
- (void)setHasValidStrokeState:(BOOL)a3;
- (void)setStateWithFill:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5 paths:(id)a6 rubyPaths:(id)a7 shadow:(id)a8 fillsCurrentTextContainer:(BOOL)a9;
- (void)setStateWithStroke:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5 paths:(id)a6 rubyPaths:(id)a7 shadow:(id)a8;
@end

@implementation CRLWPCharacterAdornmentState

- (CRLWPCharacterAdornmentState)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPCharacterAdornmentState;
  v2 = [(CRLWPCharacterAdornmentState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CRLWPCharacterAdornmentState *)v2 resetFillState];
    [(CRLWPCharacterAdornmentState *)v3 resetStrokeState];
  }
  return v3;
}

- (void)setStateWithStroke:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5 paths:(id)a6 rubyPaths:(id)a7 shadow:(id)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v18 = (CRLStroke *)a3;
  v19 = (CRLShadow *)a8;
  self->_hasValidStrokeState = 1;
  currentAdornmentStroke = self->_currentAdornmentStroke;
  self->_currentAdornmentStroke = v18;
  v28 = v18;
  id v21 = a7;
  id v22 = a6;

  self->_currentStrokeRange.NSUInteger location = location;
  self->_currentStrokeRange.NSUInteger length = length;
  self->_currentStrokeRect.origin.CGFloat x = x;
  self->_currentStrokeRect.origin.CGFloat y = y;
  self->_currentStrokeRect.size.CGFloat width = width;
  self->_currentStrokeRect.size.CGFloat height = height;
  [objc_opt_class() p_deepCopyPathArray:v22];
  v23 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue();

  currentStrokePaths = self->_currentStrokePaths;
  self->_currentStrokePaths = v23;

  [objc_opt_class() p_deepCopyPathArray:v21];
  v25 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue();

  currentRubyStrokePaths = self->_currentRubyStrokePaths;
  self->_currentRubyStrokePaths = v25;

  currentStrokeShadow = self->_currentStrokeShadow;
  self->_currentStrokeShadow = v19;
}

- (void)resetStrokeState
{
  self->_hasValidStrokeState = 0;
  currentAdornmentStroke = self->_currentAdornmentStroke;
  self->_currentAdornmentStroke = 0;

  self->_currentStrokeRange = (_NSRange)xmmword_101176F48;
  CGSize size = CGRectNull.size;
  self->_currentStrokeRect.origin = CGRectNull.origin;
  self->_currentStrokeRect.CGSize size = size;
  objc_super v5 = +[TSUSparseArray array];
  currentStrokePaths = self->_currentStrokePaths;
  self->_currentStrokePaths = v5;

  v7 = +[TSUSparseArray array];
  currentRubyStrokePaths = self->_currentRubyStrokePaths;
  self->_currentRubyStrokePaths = v7;

  currentStrokeShadow = self->_currentStrokeShadow;
  self->_currentStrokeShadow = 0;
}

- (void)setStateWithFill:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5 paths:(id)a6 rubyPaths:(id)a7 shadow:(id)a8 fillsCurrentTextContainer:(BOOL)a9
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v19 = (CRLFill *)a3;
  v20 = (CRLShadow *)a8;
  self->_hasValidFillState = 1;
  currentAdornmentFill = self->_currentAdornmentFill;
  self->_currentAdornmentFill = v19;
  id v22 = v19;
  id v23 = a7;
  id v24 = a6;

  self->_currentFillRange.NSUInteger location = location;
  self->_currentFillRange.NSUInteger length = length;
  self->_currentFillRect.origin.CGFloat x = x;
  self->_currentFillRect.origin.CGFloat y = y;
  self->_currentFillRect.size.CGFloat width = width;
  self->_currentFillRect.size.CGFloat height = height;
  [objc_opt_class() p_deepCopyPathArray:v24];
  v25 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue();

  currentFillPaths = self->_currentFillPaths;
  self->_currentFillPaths = v25;

  [objc_opt_class() p_deepCopyPathArray:v23];
  v27 = (TSUSparseArray *)objc_claimAutoreleasedReturnValue();

  currentRubyFillPaths = self->_currentRubyFillPaths;
  self->_currentRubyFillPaths = v27;

  currentFillShadow = self->_currentFillShadow;
  self->_currentFillShadow = v20;

  self->_fillsCurrentTextContainer = a9;
}

- (void)resetFillState
{
  self->_hasValidFillState = 0;
  currentAdornmentFill = self->_currentAdornmentFill;
  self->_currentAdornmentFill = 0;

  self->_currentFillRange = (_NSRange)xmmword_101176F48;
  CGSize size = CGRectNull.size;
  self->_currentFillRect.origin = CGRectNull.origin;
  self->_currentFillRect.CGSize size = size;
  objc_super v5 = +[TSUSparseArray array];
  currentFillPaths = self->_currentFillPaths;
  self->_currentFillPaths = v5;

  v7 = +[TSUSparseArray array];
  currentRubyFillPaths = self->_currentRubyFillPaths;
  self->_currentRubyFillPaths = v7;

  currentFillShadow = self->_currentFillShadow;
  self->_currentFillShadow = 0;

  self->_fillsCurrentTextContainer = 0;
  v10 = +[NSMutableSet set];
  currentDropCapAdornments = self->_currentDropCapAdornments;
  self->_currentDropCapAdornments = v10;
}

+ (id)p_deepCopyPathArray:(id)a3
{
  id v3 = a3;
  v4 = +[TSUSparseArray array];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004A9200;
  v6[3] = &unk_1014E0868;
  v6[4] = v4;
  [v3 foreach:v6];

  return v4;
}

- (BOOL)hasValidFillState
{
  return self->_hasValidFillState;
}

- (void)setHasValidFillState:(BOOL)a3
{
  self->_hasValidFillState = a3;
}

- (CRLFill)currentAdornmentFill
{
  return self->_currentAdornmentFill;
}

- (void)setCurrentAdornmentFill:(id)a3
{
}

- (_NSRange)currentFillRange
{
  NSUInteger length = self->_currentFillRange.length;
  NSUInteger location = self->_currentFillRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentFillRange:(_NSRange)a3
{
  self->_currentFillRange = a3;
}

- (CGRect)currentFillRect
{
  double x = self->_currentFillRect.origin.x;
  double y = self->_currentFillRect.origin.y;
  double width = self->_currentFillRect.size.width;
  double height = self->_currentFillRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentFillRect:(CGRect)a3
{
  self->_currentFillRect = a3;
}

- (TSUSparseArray)currentFillPaths
{
  return self->_currentFillPaths;
}

- (void)setCurrentFillPaths:(id)a3
{
}

- (TSUSparseArray)currentRubyFillPaths
{
  return self->_currentRubyFillPaths;
}

- (void)setCurrentRubyFillPaths:(id)a3
{
}

- (CRLShadow)currentFillShadow
{
  return self->_currentFillShadow;
}

- (void)setCurrentFillShadow:(id)a3
{
}

- (BOOL)fillsCurrentTextContainer
{
  return self->_fillsCurrentTextContainer;
}

- (void)setFillsCurrentTextContainer:(BOOL)a3
{
  self->_fillsCurrentTextContainer = a3;
}

- (NSMutableSet)currentDropCapAdornments
{
  return self->_currentDropCapAdornments;
}

- (void)setCurrentDropCapAdornments:(id)a3
{
}

- (BOOL)hasValidStrokeState
{
  return self->_hasValidStrokeState;
}

- (void)setHasValidStrokeState:(BOOL)a3
{
  self->_hasValidStrokeState = a3;
}

- (CRLStroke)currentAdornmentStroke
{
  return self->_currentAdornmentStroke;
}

- (void)setCurrentAdornmentStroke:(id)a3
{
}

- (_NSRange)currentStrokeRange
{
  NSUInteger length = self->_currentStrokeRange.length;
  NSUInteger location = self->_currentStrokeRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentStrokeRange:(_NSRange)a3
{
  self->_currentStrokeRange = a3;
}

- (CGRect)currentStrokeRect
{
  double x = self->_currentStrokeRect.origin.x;
  double y = self->_currentStrokeRect.origin.y;
  double width = self->_currentStrokeRect.size.width;
  double height = self->_currentStrokeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentStrokeRect:(CGRect)a3
{
  self->_currentStrokeRect = a3;
}

- (TSUSparseArray)currentStrokePaths
{
  return self->_currentStrokePaths;
}

- (void)setCurrentStrokePaths:(id)a3
{
}

- (TSUSparseArray)currentRubyStrokePaths
{
  return self->_currentRubyStrokePaths;
}

- (void)setCurrentRubyStrokePaths:(id)a3
{
}

- (CRLShadow)currentStrokeShadow
{
  return self->_currentStrokeShadow;
}

- (void)setCurrentStrokeShadow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStrokeShadow, 0);
  objc_storeStrong((id *)&self->_currentRubyStrokePaths, 0);
  objc_storeStrong((id *)&self->_currentStrokePaths, 0);
  objc_storeStrong((id *)&self->_currentAdornmentStroke, 0);
  objc_storeStrong((id *)&self->_currentDropCapAdornments, 0);
  objc_storeStrong((id *)&self->_currentFillShadow, 0);
  objc_storeStrong((id *)&self->_currentRubyFillPaths, 0);
  objc_storeStrong((id *)&self->_currentFillPaths, 0);

  objc_storeStrong((id *)&self->_currentAdornmentFill, 0);
}

@end