@interface SBSAElementDescription
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)leadingViewTransform;
- (CGAffineTransform)minimalViewTransform;
- (CGAffineTransform)trailingViewTransform;
- (CGSize)leadingViewScale;
- (CGSize)minimalViewScale;
- (CGSize)trailingViewScale;
- (NSString)description;
- (NSString)snapshotReason;
- (NSUUID)interfaceElementIdentifier;
- (SAElementIdentifying)associatedSystemApertureElementIdentity;
- (double)customContentAlpha;
- (double)customContentBlurProgress;
- (double)leadingViewAlpha;
- (double)leadingViewBlurProgress;
- (double)leadingViewSquishProgress;
- (double)minimalViewAlpha;
- (double)minimalViewBlurProgress;
- (double)minimalViewSquishProgress;
- (double)sensorObscuringShadowProgress;
- (double)snapshotViewAlpha;
- (double)snapshotViewBlurProgress;
- (double)trailingViewAlpha;
- (double)trailingViewBlurProgress;
- (double)trailingViewSquishProgress;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)appearState;
- (unint64_t)hash;
- (void)_setAppearState:(int)a3;
- (void)_setAssociatedSystemApertureElementIdentity:(id)a3;
- (void)_setCustomContentAlpha:(double)a3;
- (void)_setCustomContentBlurProgress:(double)a3;
- (void)_setInterfaceElementIdentifier:(id)a3;
- (void)_setLeadingViewAlpha:(double)a3;
- (void)_setLeadingViewBlurProgress:(double)a3;
- (void)_setLeadingViewScale:(CGSize)a3;
- (void)_setLeadingViewSquishProgress:(double)a3;
- (void)_setLeadingViewTransform:(CGAffineTransform *)a3;
- (void)_setMinimalViewAlpha:(double)a3;
- (void)_setMinimalViewBlurProgress:(double)a3;
- (void)_setMinimalViewScale:(CGSize)a3;
- (void)_setMinimalViewSquishProgress:(double)a3;
- (void)_setMinimalViewTransform:(CGAffineTransform *)a3;
- (void)_setSensorObscuringShadowProgress:(double)a3;
- (void)_setSnapshotReason:(id)a3;
- (void)_setSnapshotViewAlpha:(double)a3;
- (void)_setSnapshotViewBlurProgress:(double)a3;
- (void)_setTrailingViewAlpha:(double)a3;
- (void)_setTrailingViewBlurProgress:(double)a3;
- (void)_setTrailingViewScale:(CGSize)a3;
- (void)_setTrailingViewSquishProgress:(double)a3;
- (void)_setTrailingViewTransform:(CGAffineTransform *)a3;
@end

@implementation SBSAElementDescription

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v76 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __34__SBSAElementDescription_isEqual___block_invoke;
  v126[3] = &unk_1E6AF9E90;
  id v6 = v4;
  id v127 = v6;
  v75 = [v76 appendObject:interfaceElementIdentifier counterpart:v126];
  associatedSystemApertureElementIdentity = self->_associatedSystemApertureElementIdentity;
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __34__SBSAElementDescription_isEqual___block_invoke_2;
  v124[3] = &unk_1E6AF9E90;
  id v8 = v6;
  id v125 = v8;
  v74 = [v75 appendObject:associatedSystemApertureElementIdentity counterpart:v124];
  uint64_t appearState = self->_appearState;
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __34__SBSAElementDescription_isEqual___block_invoke_3;
  v122[3] = &unk_1E6AF9660;
  id v10 = v8;
  id v123 = v10;
  v73 = [v74 appendInteger:appearState counterpart:v122];
  double sensorObscuringShadowProgress = self->_sensorObscuringShadowProgress;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __34__SBSAElementDescription_isEqual___block_invoke_4;
  v120[3] = &unk_1E6AFD028;
  id v12 = v10;
  id v121 = v12;
  v72 = [v73 appendCGFloat:v120 counterpart:sensorObscuringShadowProgress];
  double leadingViewBlurProgress = self->_leadingViewBlurProgress;
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __34__SBSAElementDescription_isEqual___block_invoke_5;
  v118[3] = &unk_1E6AFD028;
  id v14 = v12;
  id v119 = v14;
  v71 = [v72 appendCGFloat:v118 counterpart:leadingViewBlurProgress];
  double leadingViewAlpha = self->_leadingViewAlpha;
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __34__SBSAElementDescription_isEqual___block_invoke_6;
  v116[3] = &unk_1E6AFD028;
  id v16 = v14;
  id v117 = v16;
  v70 = [v71 appendCGFloat:v116 counterpart:leadingViewAlpha];
  double leadingViewSquishProgress = self->_leadingViewSquishProgress;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __34__SBSAElementDescription_isEqual___block_invoke_7;
  v114[3] = &unk_1E6AFD028;
  id v18 = v16;
  id v115 = v18;
  v69 = [v70 appendCGFloat:v114 counterpart:leadingViewSquishProgress];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __34__SBSAElementDescription_isEqual___block_invoke_8;
  v112[3] = &unk_1E6B07480;
  id v19 = v18;
  id v113 = v19;
  v68 = objc_msgSend(v69, "appendCGSize:counterpart:", v112, self->_leadingViewScale.width, self->_leadingViewScale.height);
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __34__SBSAElementDescription_isEqual___block_invoke_9;
  v110[3] = &unk_1E6B07AB0;
  id v20 = v19;
  id v111 = v20;
  long long v21 = *(_OWORD *)&self->_leadingViewTransform.c;
  long long v107 = *(_OWORD *)&self->_leadingViewTransform.a;
  long long v108 = v21;
  long long v109 = *(_OWORD *)&self->_leadingViewTransform.tx;
  v67 = [v68 appendCGAffineTransform:&v107 counterpart:v110];
  double trailingViewBlurProgress = self->_trailingViewBlurProgress;
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __34__SBSAElementDescription_isEqual___block_invoke_10;
  v105[3] = &unk_1E6AFD028;
  id v23 = v20;
  id v106 = v23;
  v66 = [v67 appendCGFloat:v105 counterpart:trailingViewBlurProgress];
  double trailingViewAlpha = self->_trailingViewAlpha;
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __34__SBSAElementDescription_isEqual___block_invoke_11;
  v103[3] = &unk_1E6AFD028;
  id v25 = v23;
  id v104 = v25;
  v65 = [v66 appendCGFloat:v103 counterpart:trailingViewAlpha];
  double trailingViewSquishProgress = self->_trailingViewSquishProgress;
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __34__SBSAElementDescription_isEqual___block_invoke_12;
  v101[3] = &unk_1E6AFD028;
  id v27 = v25;
  id v102 = v27;
  v64 = [v65 appendCGFloat:v101 counterpart:trailingViewSquishProgress];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __34__SBSAElementDescription_isEqual___block_invoke_13;
  v99[3] = &unk_1E6B07480;
  id v28 = v27;
  id v100 = v28;
  v63 = objc_msgSend(v64, "appendCGSize:counterpart:", v99, self->_trailingViewScale.width, self->_trailingViewScale.height);
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __34__SBSAElementDescription_isEqual___block_invoke_14;
  v97[3] = &unk_1E6B07AB0;
  id v29 = v28;
  id v98 = v29;
  long long v30 = *(_OWORD *)&self->_trailingViewTransform.c;
  long long v31 = *(_OWORD *)&self->_trailingViewTransform.tx;
  long long v107 = *(_OWORD *)&self->_trailingViewTransform.a;
  long long v108 = v30;
  long long v109 = v31;
  v62 = [v63 appendCGAffineTransform:&v107 counterpart:v97];
  double minimalViewBlurProgress = self->_minimalViewBlurProgress;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __34__SBSAElementDescription_isEqual___block_invoke_15;
  v95[3] = &unk_1E6AFD028;
  id v33 = v29;
  id v96 = v33;
  v61 = [v62 appendCGFloat:v95 counterpart:minimalViewBlurProgress];
  double minimalViewAlpha = self->_minimalViewAlpha;
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __34__SBSAElementDescription_isEqual___block_invoke_16;
  v93[3] = &unk_1E6AFD028;
  id v35 = v33;
  id v94 = v35;
  v36 = [v61 appendCGFloat:v93 counterpart:minimalViewAlpha];
  double minimalViewSquishProgress = self->_minimalViewSquishProgress;
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __34__SBSAElementDescription_isEqual___block_invoke_17;
  v91[3] = &unk_1E6AFD028;
  id v38 = v35;
  id v92 = v38;
  v39 = [v36 appendCGFloat:v91 counterpart:minimalViewSquishProgress];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __34__SBSAElementDescription_isEqual___block_invoke_18;
  v89[3] = &unk_1E6B07480;
  id v40 = v38;
  id v90 = v40;
  v41 = objc_msgSend(v39, "appendCGSize:counterpart:", v89, self->_minimalViewScale.width, self->_minimalViewScale.height);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __34__SBSAElementDescription_isEqual___block_invoke_19;
  v87[3] = &unk_1E6B07AB0;
  id v42 = v40;
  id v88 = v42;
  long long v43 = *(_OWORD *)&self->_minimalViewTransform.c;
  long long v107 = *(_OWORD *)&self->_minimalViewTransform.a;
  long long v108 = v43;
  long long v109 = *(_OWORD *)&self->_minimalViewTransform.tx;
  v44 = [v41 appendCGAffineTransform:&v107 counterpart:v87];
  double customContentBlurProgress = self->_customContentBlurProgress;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __34__SBSAElementDescription_isEqual___block_invoke_20;
  v85[3] = &unk_1E6AFD028;
  id v46 = v42;
  id v86 = v46;
  v47 = [v44 appendCGFloat:v85 counterpart:customContentBlurProgress];
  double customContentAlpha = self->_customContentAlpha;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __34__SBSAElementDescription_isEqual___block_invoke_21;
  v83[3] = &unk_1E6AFD028;
  id v49 = v46;
  id v84 = v49;
  v50 = [v47 appendCGFloat:v83 counterpart:customContentAlpha];
  double snapshotViewBlurProgress = self->_snapshotViewBlurProgress;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __34__SBSAElementDescription_isEqual___block_invoke_22;
  v81[3] = &unk_1E6AFD028;
  id v52 = v49;
  id v82 = v52;
  v53 = [v50 appendCGFloat:v81 counterpart:snapshotViewBlurProgress];
  double snapshotViewAlpha = self->_snapshotViewAlpha;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __34__SBSAElementDescription_isEqual___block_invoke_23;
  v79[3] = &unk_1E6AFD028;
  id v55 = v52;
  id v80 = v55;
  v56 = [v53 appendCGFloat:v79 counterpart:snapshotViewAlpha];
  snapshotReason = self->_snapshotReason;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __34__SBSAElementDescription_isEqual___block_invoke_24;
  v77[3] = &unk_1E6AFD560;
  id v78 = v55;
  id v60 = v55;
  v58 = [v56 appendString:snapshotReason counterpart:v77];
  LOBYTE(snapshotReason) = [v58 isEqual];

  return (char)snapshotReason;
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interfaceElementIdentifier];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) associatedSystemApertureElementIdentity];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) appearState];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sensorObscuringShadowProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) leadingViewBlurProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) leadingViewAlpha];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) leadingViewSquishProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) leadingViewScale];
}

double __34__SBSAElementDescription_isEqual___block_invoke_9@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 leadingViewTransform];
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) trailingViewBlurProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) trailingViewAlpha];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) trailingViewSquishProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) trailingViewScale];
}

double __34__SBSAElementDescription_isEqual___block_invoke_14@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 trailingViewTransform];
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) minimalViewBlurProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) minimalViewAlpha];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) minimalViewSquishProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) minimalViewScale];
}

double __34__SBSAElementDescription_isEqual___block_invoke_19@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 minimalViewTransform];
  }
  else
  {
    double result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) customContentBlurProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) customContentAlpha];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotViewBlurProgress];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotViewAlpha];
}

uint64_t __34__SBSAElementDescription_isEqual___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) snapshotReason];
}

- (unint64_t)hash
{
  id v33 = [MEMORY[0x1E4F4F758] builder];
  v32 = [v33 appendObject:self->_interfaceElementIdentifier];
  long long v31 = [v32 appendObject:self->_associatedSystemApertureElementIdentity];
  long long v30 = [v31 appendInteger:self->_appearState];
  id v29 = [v30 appendCGFloat:self->_sensorObscuringShadowProgress];
  id v28 = [v29 appendCGFloat:self->_leadingViewBlurProgress];
  id v27 = [v28 appendCGFloat:self->_leadingViewAlpha];
  v26 = [v27 appendCGFloat:self->_leadingViewSquishProgress];
  id v25 = objc_msgSend(v26, "appendCGSize:", self->_leadingViewScale.width, self->_leadingViewScale.height);
  long long v3 = *(_OWORD *)&self->_leadingViewTransform.c;
  long long v34 = *(_OWORD *)&self->_leadingViewTransform.a;
  long long v35 = v3;
  long long v36 = *(_OWORD *)&self->_leadingViewTransform.tx;
  v24 = [v25 appendCGAffineTransform:&v34];
  id v23 = [v24 appendCGFloat:self->_trailingViewBlurProgress];
  v22 = [v23 appendCGFloat:self->_trailingViewAlpha];
  long long v21 = [v22 appendCGFloat:self->_trailingViewSquishProgress];
  id v20 = objc_msgSend(v21, "appendCGSize:", self->_trailingViewScale.width, self->_trailingViewScale.height);
  long long v4 = *(_OWORD *)&self->_trailingViewTransform.c;
  long long v5 = *(_OWORD *)&self->_trailingViewTransform.tx;
  long long v34 = *(_OWORD *)&self->_trailingViewTransform.a;
  long long v35 = v4;
  long long v36 = v5;
  id v19 = [v20 appendCGAffineTransform:&v34];
  id v6 = [v19 appendCGFloat:self->_minimalViewBlurProgress];
  v7 = [v6 appendCGFloat:self->_minimalViewAlpha];
  id v8 = [v7 appendCGFloat:self->_minimalViewSquishProgress];
  v9 = objc_msgSend(v8, "appendCGSize:", self->_minimalViewScale.width, self->_minimalViewScale.height);
  long long v10 = *(_OWORD *)&self->_minimalViewTransform.c;
  long long v34 = *(_OWORD *)&self->_minimalViewTransform.a;
  long long v35 = v10;
  long long v36 = *(_OWORD *)&self->_minimalViewTransform.tx;
  v11 = [v9 appendCGAffineTransform:&v34];
  id v12 = [v11 appendCGFloat:self->_customContentBlurProgress];
  v13 = [v12 appendCGFloat:self->_customContentAlpha];
  id v14 = [v13 appendCGFloat:self->_snapshotViewBlurProgress];
  v15 = [v14 appendCGFloat:self->_snapshotViewAlpha];
  id v16 = [v15 appendString:self->_snapshotReason];
  unint64_t v18 = [v16 hash];

  return v18;
}

- (NSString)description
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  v7 = SAElementIdentityDescription();
  id v8 = SBSAStringFromUIViewControllerAppearState(self->_appearState);
  long long v28 = *(_OWORD *)&self->_leadingViewAlpha;
  long long v29 = *(_OWORD *)&self->_sensorObscuringShadowProgress;
  CGFloat width = self->_leadingViewScale.width;
  CGFloat height = self->_leadingViewScale.height;
  long long v11 = *(_OWORD *)&self->_leadingViewTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_leadingViewTransform.a;
  *(_OWORD *)&transform.c = v11;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_leadingViewTransform.tx;
  id v12 = NSStringFromCGAffineTransform(&transform);
  long long v27 = *(_OWORD *)&self->_trailingViewBlurProgress;
  double trailingViewSquishProgress = self->_trailingViewSquishProgress;
  CGFloat v14 = self->_trailingViewScale.width;
  CGFloat v15 = self->_trailingViewScale.height;
  long long v16 = *(_OWORD *)&self->_trailingViewTransform.c;
  long long v17 = *(_OWORD *)&self->_trailingViewTransform.tx;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_trailingViewTransform.a;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tx = v17;
  unint64_t v18 = NSStringFromCGAffineTransform(&transform);
  long long v26 = *(_OWORD *)&self->_minimalViewBlurProgress;
  double minimalViewSquishProgress = self->_minimalViewSquishProgress;
  CGFloat v20 = self->_minimalViewScale.width;
  CGFloat v21 = self->_minimalViewScale.height;
  long long v22 = *(_OWORD *)&self->_minimalViewTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_minimalViewTransform.a;
  *(_OWORD *)&transform.c = v22;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_minimalViewTransform.tx;
  id v23 = NSStringFromCGAffineTransform(&transform);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; interfaceElementIdentifier: %@; associatedSystemApertureElementID: %@; appearState: %@; sensorObscuringShadowProgress: %f; leadingViewBlurProgress: %f; leadingViewAlpha: %f; leadingViewSquishProgress: %f; leadingViewScale: (%f, %f); leadingViewTransform: %@; trailingViewBlurProgress: %f; trailingViewAlpha: %f; trailingViewSquishProgress: %f; trailingViewScale: (%f, %f); trailingViewTransform: %@; minimalViewBlurProgress: %f; minimalViewAlpha: %f; minimalViewSquishProgress: %f; minimalViewScale: (%f, %f); minimalViewTransform: %@; customContentBlurProgress: %f; customContentAlpha: %f; snapshotViewBlurProgress: %f; snapshotViewAlpha: %f; snapshotReason: %@>",
    v5,
    self,
    interfaceElementIdentifier,
    v7,
    v8,
    v29,
    v28,
    *(void *)&width,
    *(void *)&height,
    v12,
    v27,
    *(void *)&trailingViewSquishProgress,
    *(void *)&v14,
    *(void *)&v15,
    v18,
    v26,
    *(void *)&minimalViewSquishProgress,
    *(void *)&v20,
    *(void *)&v21,
    v23,
    *(void *)&self->_customContentBlurProgress,
    *(void *)&self->_customContentAlpha,
    *(void *)&self->_snapshotViewBlurProgress,
    *(void *)&self->_snapshotViewAlpha,
  v24 = self->_snapshotReason);

  return (NSString *)v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSUUID *)self->_interfaceElementIdentifier copy];
  id v6 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v5;

  if (self->_associatedSystemApertureElementIdentity)
  {
    v7 = [SBSAElementIdentification alloc];
    id v8 = [(SAElementIdentifying *)self->_associatedSystemApertureElementIdentity clientIdentifier];
    v9 = [(SAElementIdentifying *)self->_associatedSystemApertureElementIdentity elementIdentifier];
    uint64_t v10 = [(SBSAElementIdentification *)v7 initWithClientIdentifier:v8 elementIdentifier:v9];
    long long v11 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v10;
  }
  *((_DWORD *)v4 + 2) = self->_appearState;
  *((void *)v4 + 4) = *(void *)&self->_sensorObscuringShadowProgress;
  *((void *)v4 + 5) = *(void *)&self->_leadingViewBlurProgress;
  *((void *)v4 + 6) = *(void *)&self->_leadingViewAlpha;
  *((void *)v4 + 7) = *(void *)&self->_leadingViewSquishProgress;
  *(CGSize *)(v4 + 152) = self->_leadingViewScale;
  long long v12 = *(_OWORD *)&self->_leadingViewTransform.a;
  long long v13 = *(_OWORD *)&self->_leadingViewTransform.c;
  *(_OWORD *)(v4 + 232) = *(_OWORD *)&self->_leadingViewTransform.tx;
  *(_OWORD *)(v4 + 216) = v13;
  *(_OWORD *)(v4 + 200) = v12;
  *((void *)v4 + 8) = *(void *)&self->_trailingViewBlurProgress;
  *((void *)v4 + 9) = *(void *)&self->_trailingViewAlpha;
  *((void *)v4 + 10) = *(void *)&self->_trailingViewSquishProgress;
  *(CGSize *)(v4 + 168) = self->_trailingViewScale;
  long long v14 = *(_OWORD *)&self->_trailingViewTransform.a;
  long long v15 = *(_OWORD *)&self->_trailingViewTransform.tx;
  *(_OWORD *)(v4 + 264) = *(_OWORD *)&self->_trailingViewTransform.c;
  *(_OWORD *)(v4 + 280) = v15;
  *(_OWORD *)(v4 + 248) = v14;
  *((void *)v4 + 11) = *(void *)&self->_minimalViewBlurProgress;
  *((void *)v4 + 12) = *(void *)&self->_minimalViewAlpha;
  *((void *)v4 + 13) = *(void *)&self->_minimalViewSquishProgress;
  *(CGSize *)(v4 + 184) = self->_minimalViewScale;
  long long v16 = *(_OWORD *)&self->_minimalViewTransform.a;
  long long v17 = *(_OWORD *)&self->_minimalViewTransform.tx;
  *(_OWORD *)(v4 + 312) = *(_OWORD *)&self->_minimalViewTransform.c;
  *(_OWORD *)(v4 + 328) = v17;
  *(_OWORD *)(v4 + 296) = v16;
  *((void *)v4 + 14) = *(void *)&self->_customContentBlurProgress;
  *((void *)v4 + 15) = *(void *)&self->_customContentAlpha;
  *((void *)v4 + 16) = *(void *)&self->_snapshotViewBlurProgress;
  *((void *)v4 + 17) = *(void *)&self->_snapshotViewAlpha;
  uint64_t v18 = [(NSString *)self->_snapshotReason copy];
  id v19 = (void *)*((void *)v4 + 18);
  *((void *)v4 + 18) = v18;

  return v4;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)[(SBSAElementDescription *)self copy];
  if (v4)
  {
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithElementDescription:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (NSUUID)interfaceElementIdentifier
{
  return self->_interfaceElementIdentifier;
}

- (void)_setInterfaceElementIdentifier:(id)a3
{
}

- (SAElementIdentifying)associatedSystemApertureElementIdentity
{
  return self->_associatedSystemApertureElementIdentity;
}

- (void)_setAssociatedSystemApertureElementIdentity:(id)a3
{
}

- (int)appearState
{
  return self->_appearState;
}

- (void)_setAppearState:(int)a3
{
  self->_uint64_t appearState = a3;
}

- (double)sensorObscuringShadowProgress
{
  return self->_sensorObscuringShadowProgress;
}

- (void)_setSensorObscuringShadowProgress:(double)a3
{
  self->_double sensorObscuringShadowProgress = a3;
}

- (double)leadingViewBlurProgress
{
  return self->_leadingViewBlurProgress;
}

- (void)_setLeadingViewBlurProgress:(double)a3
{
  self->_double leadingViewBlurProgress = a3;
}

- (double)leadingViewAlpha
{
  return self->_leadingViewAlpha;
}

- (void)_setLeadingViewAlpha:(double)a3
{
  self->_double leadingViewAlpha = a3;
}

- (double)leadingViewSquishProgress
{
  return self->_leadingViewSquishProgress;
}

- (void)_setLeadingViewSquishProgress:(double)a3
{
  self->_double leadingViewSquishProgress = a3;
}

- (CGSize)leadingViewScale
{
  double width = self->_leadingViewScale.width;
  double height = self->_leadingViewScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setLeadingViewScale:(CGSize)a3
{
  self->_leadingViewScale = a3;
}

- (CGAffineTransform)leadingViewTransform
{
  long long v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].ty;
  return self;
}

- (void)_setLeadingViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_leadingViewTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_leadingViewTransform.c = v4;
  *(_OWORD *)&self->_leadingViewTransform.a = v3;
}

- (double)trailingViewBlurProgress
{
  return self->_trailingViewBlurProgress;
}

- (void)_setTrailingViewBlurProgress:(double)a3
{
  self->_double trailingViewBlurProgress = a3;
}

- (double)trailingViewAlpha
{
  return self->_trailingViewAlpha;
}

- (void)_setTrailingViewAlpha:(double)a3
{
  self->_double trailingViewAlpha = a3;
}

- (double)trailingViewSquishProgress
{
  return self->_trailingViewSquishProgress;
}

- (void)_setTrailingViewSquishProgress:(double)a3
{
  self->_double trailingViewSquishProgress = a3;
}

- (CGSize)trailingViewScale
{
  double width = self->_trailingViewScale.width;
  double height = self->_trailingViewScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setTrailingViewScale:(CGSize)a3
{
  self->_trailingViewScale = a3;
}

- (CGAffineTransform)trailingViewTransform
{
  long long v3 = *(_OWORD *)&self[5].d;
  long long v4 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = v4;
  return self;
}

- (void)_setTrailingViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trailingViewTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trailingViewTransform.tx = v4;
  *(_OWORD *)&self->_trailingViewTransform.a = v3;
}

- (double)minimalViewBlurProgress
{
  return self->_minimalViewBlurProgress;
}

- (void)_setMinimalViewBlurProgress:(double)a3
{
  self->_double minimalViewBlurProgress = a3;
}

- (double)minimalViewAlpha
{
  return self->_minimalViewAlpha;
}

- (void)_setMinimalViewAlpha:(double)a3
{
  self->_double minimalViewAlpha = a3;
}

- (double)minimalViewSquishProgress
{
  return self->_minimalViewSquishProgress;
}

- (void)_setMinimalViewSquishProgress:(double)a3
{
  self->_double minimalViewSquishProgress = a3;
}

- (CGSize)minimalViewScale
{
  double width = self->_minimalViewScale.width;
  double height = self->_minimalViewScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setMinimalViewScale:(CGSize)a3
{
  self->_minimalViewScale = a3;
}

- (CGAffineTransform)minimalViewTransform
{
  long long v3 = *(_OWORD *)&self[6].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].ty;
  return self;
}

- (void)_setMinimalViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_minimalViewTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_minimalViewTransform.tx = v4;
  *(_OWORD *)&self->_minimalViewTransform.a = v3;
}

- (double)customContentBlurProgress
{
  return self->_customContentBlurProgress;
}

- (void)_setCustomContentBlurProgress:(double)a3
{
  self->_double customContentBlurProgress = a3;
}

- (double)customContentAlpha
{
  return self->_customContentAlpha;
}

- (void)_setCustomContentAlpha:(double)a3
{
  self->_double customContentAlpha = a3;
}

- (double)snapshotViewBlurProgress
{
  return self->_snapshotViewBlurProgress;
}

- (void)_setSnapshotViewBlurProgress:(double)a3
{
  self->_double snapshotViewBlurProgress = a3;
}

- (double)snapshotViewAlpha
{
  return self->_snapshotViewAlpha;
}

- (void)_setSnapshotViewAlpha:(double)a3
{
  self->_double snapshotViewAlpha = a3;
}

- (NSString)snapshotReason
{
  return self->_snapshotReason;
}

- (void)_setSnapshotReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReason, 0);
  objc_storeStrong((id *)&self->_associatedSystemApertureElementIdentity, 0);
  objc_storeStrong((id *)&self->_interfaceElementIdentifier, 0);
}

@end