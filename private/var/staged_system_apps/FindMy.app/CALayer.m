@interface CALayer
+ (id)springAnimationWithDuration:(double)a3 dampingRatio:(double)a4 velocity:(double)a5;
@end

@implementation CALayer

+ (id)springAnimationWithDuration:(double)a3 dampingRatio:(double)a4 velocity:(double)a5
{
  double v6 = fmin(fmax(a4, 0.00000011920929), 1.0);
  double v7 = fmin(fmax(a3, 0.01), 10.0);
  if (v6 >= 1.0)
  {
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_10006AA94;
    v38 = &unk_10061EBA0;
    uint64_t v39 = 0x3FF0000000000000;
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_10006AAA0;
    v28 = &unk_10061EBC8;
    v10 = (id *)&v29;
    v29 = objc_retainBlock(&v35);
    double v30 = 0.00100000005;
    uint64_t v31 = *(void *)&v7;
    v11 = v29;
    v13 = objc_retainBlock(&v25);
    v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    v44 = sub_10006AB14;
    v45 = &unk_10061EC10;
    double v46 = v7 * v7;
    uint64_t v47 = 0x3FF0000000000000;
    uint64_t v48 = *(void *)&v7;
    v15 = objc_retainBlock(&v42);
  }
  else
  {
    float v8 = 1.0 - v6 * v6;
    double v9 = sqrtf(v8);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10006A948;
    v49[3] = &unk_10061EBA0;
    *(double *)&v49[4] = v9;
    v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    v44 = sub_10006A954;
    v45 = &unk_10061EBC8;
    uint64_t v47 = *(void *)&v6;
    uint64_t v48 = 0x3FF0000000000000;
    v10 = (id *)&v46;
    double v46 = COERCE_DOUBLE(objc_retainBlock(v49));
    v11 = (void ***)*(id *)&v46;
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_10006A98C;
    v38 = &unk_10061EBC8;
    uint64_t v40 = 0x3F50624DE0000000;
    double v41 = v7 * v6;
    v12 = objc_retainBlock(&v42);
    uint64_t v39 = (uint64_t)v12;
    v13 = objc_retainBlock(&v35);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_10006A9F4;
    v28 = &unk_10061EBF0;
    double v30 = v7 * v6;
    v29 = v12;
    uint64_t v31 = 0x3FF0000000000000;
    double v32 = v7 * v6;
    double v33 = v7 * (v6 * v6);
    double v34 = v9;
    v14 = v12;
    v15 = objc_retainBlock(&v25);
  }
  double v16 = 1.0 / v7 * 5.0;
  int v17 = 12;
  do
  {
    double v18 = ((double (*)(void ***, double))v13[2])(v13, v16);
    double v16 = v16 - v18 / ((double (*)(void ***, double))v15[2])(v15, v16);
    --v17;
  }
  while (v17);
  double v19 = v16 * v16;
  double v20 = sqrt(v19);
  double v21 = v6 * (v20 + v20);

  v22 = +[CASpringAnimation animation];
  [v22 setMass:1.0];
  [v22 setVelocity:1.0];
  [v22 setStiffness:v19];
  [v22 setDamping:v21];
  v23 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
  [v22 setTimingFunction:v23];

  [v22 setDuration:a3];

  return v22;
}

@end