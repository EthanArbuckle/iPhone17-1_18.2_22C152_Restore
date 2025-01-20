@interface SpringInfo
- (SpringInfo)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6;
- (double)damping;
- (double)initialVelocity;
- (double)mass;
- (double)overshootTime;
- (double)settlingTime;
- (double)stiffness;
- (double)undershootTime;
- (double)valueAtTime:(double)a3;
- (id)description;
@end

@implementation SpringInfo

- (SpringInfo)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6
{
  v91.receiver = self;
  v91.super_class = (Class)SpringInfo;
  v10 = [(SpringInfo *)&v91 init];
  v11 = v10;
  if (v10)
  {
    v10->_mass = a3;
    v10->_stiffness = a4;
    v10->_damping = a5;
    v10->_initialVelocity = a6;
    sub_1004E06CC((uint64_t)v92, a3, a4, a5, a6);
    if (v94 < 1.0)
    {
      double v87 = v94;
      double v13 = v95;
      double v12 = v96;
      double v14 = fabs(6.28318531 / v95);
      double v86 = v14 * 0.5;
      double v15 = v97;
      double v16 = -v95;
      double v17 = -v97;
      double v18 = 0.0;
      uint64_t v19 = 10;
      double v89 = v97;
      while (1)
      {
        __double2 v22 = __sincos_stret(v13 * v18);
        double cosval = v22.__cosval;
        double sinval = v22.__sinval;
        double v23 = v15 * v22.__sinval + v12 * v22.__cosval;
        if (fabs(v23) < 0.001) {
          break;
        }
        double v18 = v18 - v23 / ((v22.__sinval + v17 * v22.__cosval) * v16);
        if (!--v19)
        {
          __double2 v24 = __sincos_stret(v13 * v18);
          double cosval = v24.__cosval;
          double sinval = v24.__sinval;
          break;
        }
      }
      BOOL v67 = (sinval + v17 * cosval) * v16 < 0.0;
      double v25 = v14 * 0.5;
      if (!v67) {
        double v25 = -0.0;
      }
      double v26 = fmod(v18 + v25, v14);
      if (v26 >= 0.0) {
        double v27 = -0.0;
      }
      else {
        double v27 = v14;
      }
      __double2 v28 = __sincos_stret(v13 * (v14 * 0.25 + v26 + v27));
      long double v29 = log(0.001 / fabs(v89 * v28.__sinval + v12 * v28.__cosval));
      double v30 = v98;
      double v31 = v99;
      double v83 = v93;
      double v32 = -v29 / (v87 * v93);
      double v33 = -v98;
      double v34 = 0.0;
      uint64_t v35 = 10;
      do
      {
        __double2 v36 = __sincos_stret(v13 * v34);
        double v37 = v31 * v36.__cosval + v30 * v36.__sinval;
        if (fabs(v37) < 0.000001) {
          break;
        }
        double v34 = v34 - v37 / ((v36.__cosval * v33 + v31 * v36.__sinval) * v16);
        --v35;
      }
      while (v35);
      double v38 = fmod(v34, v86);
      double v39 = -0.0;
      if (v38 < 0.0) {
        double v39 = v86;
      }
      double v40 = v38 + v39;
      double v41 = exp(v83 * -((v38 + v39) * v87));
      __double2 v42 = __sincos_stret(v13 * v40);
      double v43 = v41 * (v89 * v42.__sinval + v12 * v42.__cosval);
      if (v43 <= 1.0)
      {
        double v44 = -1.0;
        if (v43 != 1.0) {
          goto LABEL_26;
        }
      }
      else
      {
        double v44 = v40;
      }
      double v40 = v86 + v40;
LABEL_26:
      if (v44 > v32
        || (double v54 = exp(v83 * -(v44 * v87)),
            __double2 v55 = __sincos_stret(v13 * v44),
            v54 * (v89 * v55.__sinval + v12 * v55.__cosval) < 1.0))
      {
        double v44 = -1.0;
      }
      if (v40 > v32
        || (double v56 = exp(v83 * -(v40 * v87)),
            __double2 v57 = __sincos_stret(v13 * v40),
            v56 * (v89 * v57.__sinval + v12 * v57.__cosval) > 0.0))
      {
        double v40 = -1.0;
      }
      double v58 = -1.0;
      if (v44 < 0.0) {
        double v59 = -1.0;
      }
      else {
        double v59 = v44;
      }
      v11->_undershootTime = v59;
      if (v40 >= 0.0) {
        double v58 = v40;
      }
LABEL_78:
      v11->_overshootTime = v58;
      v11->_settlingTime = v32;
      v81 = v11;
      goto LABEL_79;
    }
    double v45 = v97;
    double v88 = v97;
    if (v92[3] == 0.0)
    {
      double v50 = 0.0;
      double v53 = v96;
      double v46 = v93;
    }
    else
    {
      double v46 = v93;
      double v47 = v93 * v97;
      double v48 = v96;
      double v49 = v93 * v96;
      double v50 = 0.0;
      uint64_t v51 = 10;
      do
      {
        double v52 = sub_1004E0780(v92, v50);
        if (fabs(v52) < 0.000001) {
          break;
        }
        double v50 = v50 - v52 / (exp(-(v50 * v46)) * (v46 * (v49 + v47 * v50 + v88 * -2.0)));
        --v51;
      }
      while (v51);
      double v53 = v48;
      double v45 = v88;
    }
    double v60 = 0.0;
    double v61 = fmax(v50, 0.0);
    double v62 = (v53 + v45 * v61) * exp(-(v61 * v46));
    if (fabs(v62) <= 0.002) {
      goto LABEL_44;
    }
    if (v62 > 1.0)
    {
      double v84 = v61;
      double v85 = -1.0;
      double v60 = v61 + v61;
      goto LABEL_45;
    }
    if (v62 >= 0.0)
    {
LABEL_44:
      double v84 = -1.0;
      double v85 = -1.0;
    }
    else
    {
      double v60 = v61 + v61;
      double v84 = -1.0;
      double v85 = v61;
    }
LABEL_45:
    uint64_t v63 = 10;
    double v32 = v60;
    while (1)
    {
      double v64 = exp(-(v32 * v46));
      double v65 = sub_1004E0780(v92, v32);
      if (fabs(v65) <= 2.22044605e-16 || (*(void *)&v65 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
        break;
      }
      double v32 = v32 - ((v53 + v45 * v32) * v64 + dbl_100F6F930[(v53 + v45 * v32) * v64 < 0.0]) / v65;
      if (!--v63)
      {
        if (v32 >= v85)
        {
          BOOL v67 = v32 < 0.0 || v32 < v84;
          if (!v67) {
            goto LABEL_77;
          }
        }
        break;
      }
    }
    double v68 = dbl_100F6F940[v85 > 0.0];
    double v69 = v60 * 0.5;
    double v70 = (v53 + v45 * (v60 * 0.5)) * exp(-(v60 * 0.5 * v46)) - v68;
    double v71 = 0.1;
    double v72 = v69 + 0.1;
    double v90 = v53;
    if (((COERCE_UNSIGNED_INT64((v53 + v45 * (v69 + 0.1)) * exp(-((v69 + 0.1) * v46)) - v68) ^ *(void *)&v70) & 0x8000000000000000) != 0)
    {
      double v74 = 0.0;
LABEL_64:
      double v75 = v69 + v74;
      double v32 = (v69 + v74 + v72) * 0.5;
      uint64_t v76 = 32;
      double v77 = v90;
      do
      {
        double v78 = (v77 + v88 * v32) * exp(-(v32 * v46));
        if (vabdd_f64(v78, v68) < 0.000000001) {
          break;
        }
        double v79 = (v90 + v88 * v75) * exp(-(v75 * v46));
        double v77 = v90;
        if (v79 <= v78) {
          double v80 = v79;
        }
        else {
          double v80 = v78;
        }
        if (v79 <= v78) {
          double v79 = v78;
        }
        if (v80 <= v68 && v79 >= v68) {
          double v72 = v32;
        }
        else {
          double v75 = v32;
        }
        double v32 = (v75 + v72) * 0.5;
        --v76;
      }
      while (v76);
    }
    else
    {
      uint64_t v73 = 32;
      while (--v73)
      {
        double v74 = v71;
        double v71 = v71 + v71;
        double v72 = v69 + v71;
        if (((COERCE_UNSIGNED_INT64((v90 + v88 * (v69 + v71)) * exp(-((v69 + v71) * v46)) - v68) ^ *(void *)&v70) & 0x8000000000000000) != 0) {
          goto LABEL_64;
        }
      }
      double v32 = -1.0;
      NSLog(@"Failed to determine spring duration", v88);
    }
LABEL_77:
    v11->_undershootTime = v84;
    double v58 = v85;
    goto LABEL_78;
  }
LABEL_79:

  return v11;
}

- (double)valueAtTime:(double)a3
{
  [(SpringInfo *)self mass];
  double v6 = v5;
  [(SpringInfo *)self stiffness];
  double v8 = v7;
  [(SpringInfo *)self damping];
  double v10 = v9;
  [(SpringInfo *)self initialVelocity];
  sub_1004E06CC((uint64_t)v17, v6, v8, v10, v11);
  if (v19 >= 1.0)
  {
    double v12 = v21 + v22 * a3;
    double v15 = exp(-(a3 * v18));
  }
  else
  {
    double v12 = exp(-(a3 * v19) * v18);
    double v13 = v21;
    __double2 v14 = __sincos_stret(v20 * a3);
    double v15 = v22 * v14.__sinval + v13 * v14.__cosval;
  }
  return v12 * v15;
}

- (id)description
{
  [(SpringInfo *)self mass];
  double v4 = v3;
  [(SpringInfo *)self stiffness];
  double v6 = v5;
  [(SpringInfo *)self damping];
  double v8 = v7;
  [(SpringInfo *)self initialVelocity];
  sub_1004E06CC((uint64_t)v26, v4, v6, v8, v9);
  if (v27 >= 1.0) {
    CFStringRef v10 = @"critically-damped";
  }
  else {
    CFStringRef v10 = @"underdamped";
  }
  [(SpringInfo *)self mass];
  uint64_t v12 = v11;
  [(SpringInfo *)self stiffness];
  uint64_t v14 = v13;
  [(SpringInfo *)self damping];
  uint64_t v16 = v15;
  [(SpringInfo *)self initialVelocity];
  uint64_t v18 = v17;
  [(SpringInfo *)self undershootTime];
  uint64_t v20 = v19;
  [(SpringInfo *)self overshootTime];
  uint64_t v22 = v21;
  [(SpringInfo *)self settlingTime];
  __double2 v24 = +[NSString stringWithFormat:@"<%@: mass = %g, stiffness = %g, damping = %g, initialVelocity = %g, undershootTime = %g, overshootTime = %g, settlingTime = %g>", v10, v12, v14, v16, v18, v20, v22, v23];

  return v24;
}

- (double)mass
{
  return self->_mass;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)damping
{
  return self->_damping;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (double)undershootTime
{
  return self->_undershootTime;
}

- (double)overshootTime
{
  return self->_overshootTime;
}

- (double)settlingTime
{
  return self->_settlingTime;
}

@end