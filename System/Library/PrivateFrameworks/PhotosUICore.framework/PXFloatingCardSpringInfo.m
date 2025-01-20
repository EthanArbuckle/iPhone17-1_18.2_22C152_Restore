@interface PXFloatingCardSpringInfo
- (PXFloatingCardSpringInfo)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6;
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

@implementation PXFloatingCardSpringInfo

- (double)settlingTime
{
  return self->_settlingTime;
}

- (double)overshootTime
{
  return self->_overshootTime;
}

- (double)undershootTime
{
  return self->_undershootTime;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (double)damping
{
  return self->_damping;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)mass
{
  return self->_mass;
}

- (id)description
{
  [(PXFloatingCardSpringInfo *)self mass];
  double v4 = v3;
  [(PXFloatingCardSpringInfo *)self stiffness];
  double v6 = v5;
  [(PXFloatingCardSpringInfo *)self damping];
  double v8 = v7;
  [(PXFloatingCardSpringInfo *)self initialVelocity];
  SpringUtils::Spring::Spring((SpringUtils *)v27, v4, v6, v8, v9);
  v10 = NSString;
  if (v28 >= 1.0) {
    v11 = @"critically-damped";
  }
  else {
    v11 = @"underdamped";
  }
  [(PXFloatingCardSpringInfo *)self mass];
  uint64_t v13 = v12;
  [(PXFloatingCardSpringInfo *)self stiffness];
  uint64_t v15 = v14;
  [(PXFloatingCardSpringInfo *)self damping];
  uint64_t v17 = v16;
  [(PXFloatingCardSpringInfo *)self initialVelocity];
  uint64_t v19 = v18;
  [(PXFloatingCardSpringInfo *)self undershootTime];
  uint64_t v21 = v20;
  [(PXFloatingCardSpringInfo *)self overshootTime];
  uint64_t v23 = v22;
  [(PXFloatingCardSpringInfo *)self settlingTime];
  v25 = [v10 stringWithFormat:@"<%@: mass = %g, stiffness = %g, damping = %g, initialVelocity = %g, undershootTime = %g, overshootTime = %g, settlingTime = %g>", v11, v13, v15, v17, v19, v21, v23, v24];
  return v25;
}

- (double)valueAtTime:(double)a3
{
  [(PXFloatingCardSpringInfo *)self mass];
  double v6 = v5;
  [(PXFloatingCardSpringInfo *)self stiffness];
  double v8 = v7;
  [(PXFloatingCardSpringInfo *)self damping];
  double v10 = v9;
  [(PXFloatingCardSpringInfo *)self initialVelocity];
  SpringUtils::Spring::Spring((SpringUtils *)v17, v6, v8, v10, v11);
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

- (PXFloatingCardSpringInfo)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6
{
  v90.receiver = self;
  v90.super_class = (Class)PXFloatingCardSpringInfo;
  double v11 = [(PXFloatingCardSpringInfo *)&v90 init];
  if (v11)
  {
    if (a3 <= 0.0)
    {
      v80 = [MEMORY[0x1E4F28B00] currentHandler];
      [v80 handleFailureInMethod:a2, v11, @"PXFloatingCardSpringInfo.mm", 396, @"Invalid parameter not satisfying: %@", @"mass > 0" object file lineNumber description];
    }
    if (a4 <= 0.0)
    {
      v81 = [MEMORY[0x1E4F28B00] currentHandler];
      [v81 handleFailureInMethod:a2, v11, @"PXFloatingCardSpringInfo.mm", 397, @"Invalid parameter not satisfying: %@", @"stiffness > 0" object file lineNumber description];
    }
    if (a5 <= 0.0)
    {
      v82 = [MEMORY[0x1E4F28B00] currentHandler];
      [v82 handleFailureInMethod:a2, v11, @"PXFloatingCardSpringInfo.mm", 398, @"Invalid parameter not satisfying: %@", @"damping > 0" object file lineNumber description];
    }
    v11->_mass = a3;
    v11->_stiffness = a4;
    v11->_damping = a5;
    v11->_initialVelocity = a6;
    SpringUtils::Spring::Spring((SpringUtils *)v91, a3, a4, a5, a6);
    if (v94 < 1.0)
    {
      double v87 = v94;
      double v13 = v95;
      double v12 = v96;
      double v14 = fabs(6.28318531 / v95);
      double v85 = v14 * 0.5;
      double v15 = v97;
      double v16 = -v95;
      double v17 = -v97;
      double v18 = 0.0;
      uint64_t v19 = 10;
      double v88 = v97;
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
      BOOL v66 = (sinval + v17 * cosval) * v16 < 0.0;
      double v25 = v14 * 0.5;
      if (!v66) {
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
      long double v29 = log(0.001 / fabs(v88 * v28.__sinval + v12 * v28.__cosval));
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
      double v38 = fmod(v34, v85);
      double v39 = -0.0;
      if (v38 < 0.0) {
        double v39 = v85;
      }
      double v40 = v38 + v39;
      double v41 = exp(v83 * -((v38 + v39) * v87));
      __double2 v42 = __sincos_stret(v13 * v40);
      double v43 = v41 * (v88 * v42.__sinval + v12 * v42.__cosval);
      if (v43 <= 1.0)
      {
        double v44 = -1.0;
        if (v43 != 1.0) {
          goto LABEL_34;
        }
      }
      else
      {
        double v44 = v40;
      }
      double v40 = v85 + v40;
LABEL_34:
      if (v44 > v32
        || (double v56 = exp(v83 * -(v44 * v87)),
            __double2 v57 = __sincos_stret(v13 * v44),
            v56 * (v88 * v57.__sinval + v12 * v57.__cosval) < 1.0))
      {
        double v44 = -1.0;
      }
      if (v40 > v32
        || (double v58 = exp(v83 * -(v40 * v87)),
            __double2 v59 = __sincos_stret(v13 * v40),
            v58 * (v88 * v59.__sinval + v12 * v59.__cosval) > 0.0))
      {
        double v40 = -1.0;
      }
      double v60 = -1.0;
      if (v44 < 0.0) {
        double v61 = -1.0;
      }
      else {
        double v61 = v44;
      }
      v11->_undershootTime = v61;
      if (v40 >= 0.0) {
        double v60 = v40;
      }
LABEL_82:
      v11->_overshootTime = v60;
      v11->_settlingTime = v32;
      v78 = v11;
      goto LABEL_83;
    }
    double v45 = 0.0;
    double v46 = 0.0;
    if (v92 != 0.0)
    {
      uint64_t v47 = 10;
      do
      {
        double derivative = SpringUtils::Spring::first_derivative((SpringUtils::Spring *)v91, v46);
        if (fabs(derivative) < 0.000001) {
          break;
        }
        SpringUtils::Spring::second_derivative((SpringUtils::Spring *)v91, v46);
        double v46 = v46 - derivative / v49;
        --v47;
      }
      while (v47);
    }
    double v50 = fmax(v46, 0.0);
    double v52 = v96;
    double v51 = v97;
    double v53 = v93;
    double v54 = v96 + v97 * v50;
    double v55 = v54 * exp(-(v50 * v93));
    if (fabs(v55) <= 0.002) {
      goto LABEL_48;
    }
    if (v55 > 1.0)
    {
      double v84 = v50;
      double v86 = -1.0;
      double v45 = v50 + v50;
      goto LABEL_49;
    }
    if (v55 >= 0.0)
    {
LABEL_48:
      double v84 = -1.0;
      double v86 = -1.0;
    }
    else
    {
      double v45 = v50 + v50;
      double v84 = -1.0;
      double v86 = v50;
    }
LABEL_49:
    uint64_t v62 = 10;
    double v32 = v45;
    while (1)
    {
      double v63 = exp(-(v32 * v53));
      double v64 = SpringUtils::Spring::first_derivative((SpringUtils::Spring *)v91, v32);
      if (fabs(v64) <= 2.22044605e-16 || (*(void *)&v64 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
        break;
      }
      double v32 = v32 - ((v52 + v51 * v32) * v63 + dbl_1AB35A120[(v52 + v51 * v32) * v63 < 0.0]) / v64;
      if (!--v62)
      {
        if (v32 >= v86)
        {
          BOOL v66 = v32 < 0.0 || v32 < v84;
          if (!v66) {
            goto LABEL_81;
          }
        }
        break;
      }
    }
    double v67 = dbl_1AB35A130[v86 > 0.0];
    double v68 = (v52 + v51 * (v45 * 0.5)) * exp(-(v45 * 0.5 * v53)) - v67;
    double v69 = 0.1;
    double v89 = v45 * 0.5;
    double v70 = v45 * 0.5 + 0.1;
    if (((COERCE_UNSIGNED_INT64((v52 + v51 * v70) * exp(-(v70 * v53)) - v67) ^ *(void *)&v68) & 0x8000000000000000) != 0)
    {
      double v72 = 0.0;
LABEL_68:
      double v73 = v89 + v72;
      double v32 = (v89 + v72 + v70) * 0.5;
      uint64_t v74 = 32;
      do
      {
        double v75 = (v52 + v51 * v32) * exp(-(v32 * v53));
        if (vabdd_f64(v75, v67) < 0.000000001) {
          break;
        }
        double v76 = (v52 + v51 * v73) * exp(-(v73 * v53));
        if (v76 <= v75) {
          double v77 = v76;
        }
        else {
          double v77 = v75;
        }
        if (v76 <= v75) {
          double v76 = v75;
        }
        if (v77 <= v67 && v76 >= v67) {
          double v70 = v32;
        }
        else {
          double v73 = v32;
        }
        double v32 = (v73 + v70) * 0.5;
        --v74;
      }
      while (v74);
    }
    else
    {
      uint64_t v71 = 32;
      while (--v71)
      {
        double v72 = v69;
        double v69 = v69 + v69;
        double v70 = v89 + v69;
        if (((COERCE_UNSIGNED_INT64((v52 + v51 * (v89 + v69)) * exp(-((v89 + v69) * v53)) - v67) ^ *(void *)&v68) & 0x8000000000000000) != 0) {
          goto LABEL_68;
        }
      }
      double v32 = -1.0;
    }
LABEL_81:
    v11->_undershootTime = v84;
    double v60 = v86;
    goto LABEL_82;
  }
LABEL_83:

  return v11;
}

@end