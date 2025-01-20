@interface UIView(SBSAGeometricTypeAnimationDecomposing)
- (id)_independentlyAnimatableMemberKeyPathsForProperty:()SBSAGeometricTypeAnimationDecomposing;
- (id)_independentlyAnimatableMemberKeyPathsForPropertyKeyPath:()SBSAGeometricTypeAnimationDecomposing;
- (void)_setValue:()SBSAGeometricTypeAnimationDecomposing byUpdatingMemberKeypaths:forKeyPath:;
@end

@implementation UIView(SBSAGeometricTypeAnimationDecomposing)

- (id)_independentlyAnimatableMemberKeyPathsForPropertyKeyPath:()SBSAGeometricTypeAnimationDecomposing
{
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"."];
  unint64_t v6 = [v5 count];
  v7 = [v5 firstObject];
  v8 = [a1 valueForKey:v7];
  if (v6 >= 2
    && (self,
        v9 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) != 0))
  {
    v11 = objc_msgSend(v5, "subarrayWithRange:", 1, v6 - 1);
    v12 = [v11 componentsJoinedByString:@"."];

    v13 = [v8 _independentlyAnimatableMemberKeyPathsForPropertyKeyPath:v12];
  }
  else
  {
    v13 = [a1 _independentlyAnimatableMemberKeyPathsForProperty:v4];
  }

  return v13;
}

- (id)_independentlyAnimatableMemberKeyPathsForProperty:()SBSAGeometricTypeAnimationDecomposing
{
  id v4 = a3;
  if (_independentlyAnimatableMemberKeyPathsForProperty____onceToken_12 != -1) {
    dispatch_once(&_independentlyAnimatableMemberKeyPathsForProperty____onceToken_12, &__block_literal_global_14_1);
  }
  if (BSEqualObjects())
  {
    v5 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____centerMembers;
LABEL_7:
    id v6 = v5;
    goto LABEL_9;
  }
  if (BSEqualObjects())
  {
    v5 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____boundsMembers;
    goto LABEL_7;
  }
  v9.receiver = a1;
  v9.super_class = (Class)UIView_0;
  objc_msgSendSuper2(&v9, sel__independentlyAnimatableMemberKeyPathsForProperty_, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v7 = v6;

  return v7;
}

- (void)_setValue:()SBSAGeometricTypeAnimationDecomposing byUpdatingMemberKeypaths:forKeyPath:
{
  id v53 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 componentsSeparatedByString:@"."];
  unint64_t v12 = [v11 count];
  v13 = [v11 firstObject];
  v14 = [a1 valueForKey:v13];
  if (v12 >= 2)
  {
    v15 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v17 = objc_msgSend(v11, "subarrayWithRange:", 1, v12 - 1);
      id v18 = [v17 componentsJoinedByString:@"."];

      [v14 _setValue:v53 byUpdatingMemberKeypaths:v9 forKeyPath:v18];
      goto LABEL_24;
    }
  }
  if (BSEqualObjects())
  {
    v19 = [a1 valueForKeyPath:v10];
    id v20 = v53;
    id v21 = v9;
    objc_msgSend(v19, "bs_CGPointValue");
    double v23 = v22;
    double v25 = v24;
    objc_msgSend(v20, "bs_CGPointValue");
    double v27 = v26;
    double v29 = v28;

    if ([v21 containsObject:@"x"]) {
      double v23 = v27;
    }
    int v30 = [v21 containsObject:@"y"];

    if (v30) {
      double v31 = v29;
    }
    else {
      double v31 = v25;
    }
    v32 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", v23, v31);
LABEL_22:
    id v18 = v32;

    [a1 setValue:v18 forKeyPath:v10];
    goto LABEL_24;
  }
  if (BSEqualObjects())
  {
    v19 = [a1 valueForKeyPath:v10];
    id v33 = v53;
    id v34 = v9;
    objc_msgSend(v19, "bs_CGRectValue");
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    objc_msgSend(v33, "bs_CGRectValue");
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;

    if ([v34 containsObject:@"origin.x"]) {
      double v36 = v44;
    }
    if ([v34 containsObject:@"origin.y"]) {
      double v38 = v46;
    }
    if ([v34 containsObject:@"size.width"]) {
      double v40 = v48;
    }
    int v51 = [v34 containsObject:@"size.height"];

    if (v51) {
      double v52 = v50;
    }
    else {
      double v52 = v42;
    }
    v32 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v36, v38, v40, v52);
    goto LABEL_22;
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2 object:a1 file:@"NSObject+SBSAGeometricTypeAnimationDecomposing.m" lineNumber:92 description:@"Attempting to update members of unsupported keypath"];
LABEL_24:
}

@end