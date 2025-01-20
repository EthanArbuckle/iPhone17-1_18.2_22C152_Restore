@interface _VFXSnapshotWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_isSettingFirstResponder;
- (CGPoint)_warpPoint:(CGPoint)a3 outOfBounds:(BOOL *)a4;
- (CGPoint)warpPoint:(CGPoint)a3;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)vfxView;
- (void)dealloc;
@end

@implementation _VFXSnapshotWindow

- (id)vfxView
{
  id WeakRetained = objc_loadWeakRetained(qword_1EB985DC0);

  return WeakRetained;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_VFXSnapshotWindow;
  [(_VFXSnapshotWindow *)&v2 dealloc];
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  if (objc_msgSend_vfxView(self, a2, (uint64_t)a4, (uint64_t)a5))
  {
    v12 = objc_msgSend_layer(self, v9, v10, v11);
    objc_msgSend_convertPoint_toLayer_(v12, v13, 0, v14, x, y);
    char v37 = 0;
    objc_msgSend__warpPoint_outOfBounds_(self, v15, (uint64_t)&v37, v16);
    id result = 0;
    if (!v37)
    {
      v36.receiver = self;
      v36.super_class = (Class)_VFXSnapshotWindow;
      for (i = (_VFXSnapshotWindow *)-[_VFXSnapshotWindow hitTest:withEvent:](&v36, sel_hitTest_withEvent_, a4);
            i;
            i = (_VFXSnapshotWindow *)objc_msgSend_superview(i, v32, v33, v34))
      {
        v22 = objc_msgSend_gestureRecognizers(i, v18, v19, v20);
        if (objc_msgSend_count(v22, v23, v24, v25)) {
          break;
        }
        if (objc_msgSend_isMultipleTouchEnabled(i, v26, v27, v28)) {
          break;
        }
        if (objc_msgSend_canBecomeFirstResponder(i, v29, v30, v31)) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      if (i == self) {
        return 0;
      }
      else {
        return i;
      }
    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)_VFXSnapshotWindow;
    return -[_VFXSnapshotWindow hitTest:withEvent:](&v35, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

- (CGPoint)_warpPoint:(CGPoint)a3 outOfBounds:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  v9 = objc_msgSend_vfxView(self, a2, (uint64_t)a4, v4);
  if (v9)
  {
    v12 = v9;
    objc_msgSend_convertPoint_fromView_(v9, v10, 0, v11, x, y);
    v15 = objc_msgSend_hitTest_options_(v12, v13, 0, v14);
    if (!objc_msgSend_count(v15, v16, v17, v18)) {
      goto LABEL_8;
    }
    v21 = objc_msgSend_objectAtIndexedSubscript_(v15, v19, 0, v20);
    uint64_t v25 = objc_msgSend_node(v21, v22, v23, v24);
    v29 = objc_msgSend_model(v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_materials(v29, v30, v31, v32);
    if (objc_msgSend_count(v33, v34, v35, v36))
    {
      v40 = objc_msgSend_materials(v29, v37, v38, v39);
      unint64_t v44 = objc_msgSend_geometryIndex(v21, v41, v42, v43);
      v48 = objc_msgSend_materials(v29, v45, v46, v47);
      unint64_t v52 = objc_msgSend_count(v48, v49, v50, v51);
      v55 = objc_msgSend_objectAtIndexedSubscript_(v40, v53, v44 % v52, v54);
    }
    else
    {
      v55 = 0;
    }
    v56 = objc_msgSend_subviews(self, v37, v38, v39);
    if (objc_msgSend_count(v56, v57, v58, v59)
      && (v63 = objc_msgSend_diffuse(v55, v60, v61, v62),
          uint64_t v67 = objc_msgSend_contents(v63, v64, v65, v66),
          v71 = objc_msgSend_subviews(self, v68, v69, v70),
          v67 == objc_msgSend_objectAtIndexedSubscript_(v71, v72, 0, v73)))
    {
      objc_msgSend_textureCoordinatesWithMappingChannel_(v21, v74, 0, v75);
      double v77 = v76;
      double v79 = v78;
      v83 = objc_msgSend_diffuse(v55, v80, v81, v82);
      objc_msgSend_contentsTransform(v83, v84, v85, v86);
      float32x4_t v104 = (float32x4_t)v87;
      float32x4_t v105 = (float32x4_t)v88;
      float32x4_t v106 = (float32x4_t)v90;
      float32x4_t v107 = (float32x4_t)v89;
      if (!VFXMatrix4IsIdentity(v87, v88, v89, v90))
      {
        float v94 = v77;
        float v95 = v79;
        unint64_t v96 = vaddq_f32(v106, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v104, v94), v105, v95), (float32x4_t)0, v107)).u64[0];
        double v77 = *(float *)&v96;
        double v79 = *((float *)&v96 + 1);
      }
      objc_msgSend_bounds(self, v91, v92, v93, *(_OWORD *)&v104, *(_OWORD *)&v105, *(_OWORD *)&v106, *(_OWORD *)&v107);
      double x = v77 * v97;
      objc_msgSend_bounds(self, v98, v99, v100);
      double y = v79 * v101;
    }
    else
    {
LABEL_8:
      if (a4) {
        *a4 = 1;
      }
    }
  }
  double v102 = x;
  double v103 = y;
  result.double y = v103;
  result.double x = v102;
  return result;
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v8 = objc_msgSend_layer(self, a2, v3, v4);
  objc_msgSend_convertPoint_toLayer_(v8, v9, 0, v10, x, y);

  objc_msgSend__warpPoint_outOfBounds_(self, v11, 0, v12);
  result.double y = v14;
  result.double x = v13;
  return result;
}

@end