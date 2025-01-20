@interface PXBasicTileAnimator
- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7;
- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5;
- (void)resumeAnimationsForTile:(id)a3;
- (void)suspendAnimationsForTile:(id)a3;
@end

@implementation PXBasicTileAnimator

- (void)resumeAnimationsForTile:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXBasicTileAnimator.m", 27, @"Method %s is a responsibility of subclass %@", "-[PXBasicTileAnimator resumeAnimationsForTile:]", v8 object file lineNumber description];

  abort();
}

- (void)suspendAnimationsForTile:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXBasicTileAnimator.m", 23, @"Method %s is a responsibility of subclass %@", "-[PXBasicTileAnimator suspendAnimationsForTile:]", v8 object file lineNumber description];

  abort();
}

- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  [v16 handleFailureInMethod:a2, self, @"PXBasicTileAnimator.m", 19, @"Method %s is a responsibility of subclass %@", "-[PXBasicTileAnimator animateTile:toGeometry:userData:withOptions:completionHandler:]", v18 object file lineNumber description];

  abort();
}

- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  [v10 handleFailureInMethod:a2, self, @"PXBasicTileAnimator.m", 15, @"Method %s is a responsibility of subclass %@", "-[PXBasicTileAnimator prepareTile:withGeometry:userData:]", v12 object file lineNumber description];

  abort();
}

@end