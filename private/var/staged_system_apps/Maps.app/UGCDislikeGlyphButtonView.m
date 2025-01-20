@interface UGCDislikeGlyphButtonView
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
@end

@implementation UGCDislikeGlyphButtonView

- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = [(UGCGlyphButtonView *)self animationLayer];
  [v8 setHidden:1];

  +[CATransaction begin];
  [(UGCGlyphButtonView *)self animationDuration];
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
  v9 = [(UGCGlyphButtonView *)self glyph];
  v10 = [v9 layer];
  [v10 position];
  double v12 = v11;
  double v14 = v13;

  v15 = [(UGCGlyphButtonView *)self glyph];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = [(UGCGlyphButtonView *)self glyph];
  [v24 setHidden:1];

  v25 = +[CALayer layer];
  [(UGCGlyphButtonView *)self setAnimationLayer:v25];
  double v26 = v17;
  double v79 = v21;
  [v25 setBounds:v17, v19, v21, v23];
  [v25 setPosition:v12, v14];
  v27 = [(UGCDislikeGlyphButtonView *)self layer];
  [v27 addSublayer:v25];

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100A851AC;
  v91[3] = &unk_1012E5D58;
  v91[4] = self;
  id v28 = v25;
  id v92 = v28;
  v82 = objc_retainBlock(v91);
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:");
  if (v7)
  {
    dispatch_time_t v29 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A85214;
    block[3] = &unk_1012E6EA8;
    id v90 = v7;
    dispatch_after(v29, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  v84 = v7;
  v30 = +[CALayer layer];
  [v28 bounds];
  CGFloat x = v93.origin.x;
  CGFloat y = v93.origin.y;
  CGFloat width = v93.size.width;
  CGFloat height = v93.size.height;
  CGRectGetMidX(v93);
  v94.origin.CGFloat x = x;
  v94.origin.CGFloat y = y;
  v94.size.CGFloat width = width;
  v94.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v94);
  [v28 bounds];
  double MaxX = CGRectGetMaxX(v95);
  [v30 setBounds:v26, v19, v21, v23];
  [v30 setPosition:MaxX, MidY];
  v83 = v28;
  [v28 addSublayer:v30];
  v37 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
  v38 = +[NSNumber numberWithDouble:-0.436332315];
  [v37 setToValue:v38];

  [v37 setMass:1.0];
  [v37 setStiffness:250.0];
  [v37 setDamping:20.0];
  LODWORD(v39) = 1.0;
  [v37 setSpeed:v39];
  [v37 setDuration:0.25];
  double v85 = v19;
  [v37 setBeginTime:a3];
  [v37 setFillMode:kCAFillModeBoth];
  v80 = v37;
  [v30 addAnimation:v37 forKey:@"transform.rotation.z"];
  v40 = +[CALayer layer];
  [v30 bounds];
  CGFloat v41 = v96.origin.x;
  CGFloat v42 = v96.origin.y;
  CGFloat v43 = v96.size.width;
  CGFloat v44 = v96.size.height;
  double MidX = CGRectGetMidX(v96);
  v97.origin.CGFloat x = v41;
  v97.origin.CGFloat y = v42;
  v97.size.CGFloat width = v43;
  v97.size.CGFloat height = v44;
  double v46 = CGRectGetMidY(v97);
  [v40 setBounds:v26, v85, v21, v23];
  [v40 setPosition:MidX, v46];
  v81 = v30;
  [v30 addSublayer:v40];
  v47 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
  v48 = +[NSNumber numberWithDouble:0.436332315];
  [v47 setToValue:v48];

  [v47 setMass:1.0];
  [v47 setStiffness:400.0];
  [v47 setDamping:15.0];
  LODWORD(v49) = 1.0;
  [v47 setSpeed:v49];
  [v47 setDuration:0.22];
  [v47 setBeginTime:a3 + 0.0299999993];
  [v47 setFillMode:kCAFillModeBoth];
  [v40 addAnimation:v47 forKey:@"transform.rotation.z"];
  v50 = [(UGCGlyphButtonView *)self glyph];
  uint64_t v51 = [v50 image];

  v52 = +[CALayer layer];
  v87 = v40;
  [v40 bounds];
  CGFloat v53 = v98.origin.x;
  CGFloat v54 = v98.origin.y;
  CGFloat v55 = v98.size.width;
  CGFloat v56 = v98.size.height;
  CGRectGetMidX(v98);
  v99.origin.CGFloat x = v53;
  v99.origin.CGFloat y = v54;
  v99.size.CGFloat width = v55;
  v99.size.CGFloat height = v56;
  double v57 = CGRectGetMidY(v99);
  [v52 setBounds:v26, v85, v79, v23];
  [v52 setPosition:0.0 v57];
  if ([(UGCGlyphButtonView *)self isSelected])
  {
    v58 = [(UGCGlyphButtonView *)self glyphAppearance];
    uint64_t v59 = [v58 selectedGlyphName];
  }
  else
  {
    unsigned __int8 v60 = [(UGCGlyphButtonView *)self isMuted];
    v61 = [(UGCGlyphButtonView *)self glyphAppearance];
    v58 = v61;
    if (v60) {
      [v61 mutedGlyphName];
    }
    else {
    uint64_t v59 = [v61 unselectedGlyphName];
    }
  }
  v62 = (void *)v59;

  if ([(UGCGlyphButtonView *)self isSelected])
  {
    v63 = [(UGCGlyphButtonView *)self glyphAppearance];
    uint64_t v64 = [v63 selectedGlyphColor];
  }
  else
  {
    unsigned __int8 v65 = [(UGCGlyphButtonView *)self isMuted];
    v66 = [(UGCGlyphButtonView *)self glyphAppearance];
    v63 = v66;
    if (v65) {
      [v66 mutedGlyphColor];
    }
    else {
    uint64_t v64 = [v66 unselectedGlyphColor];
    }
  }
  v67 = (void *)v64;

  v68 = (void *)v51;
  if (![(UGCGlyphButtonView *)self isEnabled])
  {
    uint64_t v69 = [v67 colorWithAlphaComponent:0.3];

    v67 = (void *)v69;
  }
  v86 = v62;
  v70 = +[UIImage systemImageNamed:v62];
  v71 = +[UGCFontManager ratingGlyphButtonFont];
  v72 = +[UIImageSymbolConfiguration configurationWithFont:v71];
  v73 = [v70 imageWithConfiguration:v72];
  v74 = [v73 _flatImageWithColor:v67];

  id v75 = v74;
  [v52 setContents:[v75 CGImage]];
  [v68 scale];
  [v52 setContentsScale:];
  [v52 setContentsGravity:kCAGravityCenter];
  [(UGCGlyphButtonView *)self setContentLayer:v52];
  [v87 addSublayer:v52];
  if (sub_1000BBB44(self) != 5)
  {
    v76 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.xy"];
    [v76 setValues:&off_1013AE580];
    [v76 setKeyTimes:&off_1013AE598];
    [v76 setBeginTime:a3];
    [v76 setFillMode:kCAFillModeBoth];
    [(UGCGlyphButtonView *)self animationDuration];
    [v76 setDuration:v77 * 0.5];
    v78 = [(UGCDislikeGlyphButtonView *)self layer];
    [v78 addAnimation:v76 forKey:@"backgroundScaleAnimation"];
  }
  +[CATransaction commit];
}

@end