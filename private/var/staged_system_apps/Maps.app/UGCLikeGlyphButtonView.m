@interface UGCLikeGlyphButtonView
- (void)animateWithBeginTime:(double)a3 completionDelay:(double)a4 completion:(id)a5;
@end

@implementation UGCLikeGlyphButtonView

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
  [v25 setBounds:v17, v19, v21, v23];
  [v25 setPosition:v12, v14];
  v26 = [(UGCLikeGlyphButtonView *)self layer];
  [v26 addSublayer:v25];

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100A848AC;
  v90[3] = &unk_1012E5D58;
  v90[4] = self;
  id v27 = v25;
  id v91 = v27;
  v83 = objc_retainBlock(v90);
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:");
  if (v7)
  {
    dispatch_time_t v28 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A84914;
    block[3] = &unk_1012E6EA8;
    id v89 = v7;
    dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  v85 = v7;
  v29 = +[CALayer layer];
  [v27 bounds];
  CGFloat x = v92.origin.x;
  CGFloat y = v92.origin.y;
  CGFloat width = v92.size.width;
  CGFloat height = v92.size.height;
  CGRectGetMidX(v92);
  v93.origin.CGFloat x = x;
  v93.origin.CGFloat y = y;
  v93.size.CGFloat width = width;
  v93.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v93);
  [v29 setBounds:v17, v19, v21, v23];
  [v29 setPosition:0.0 MidY];
  v84 = v27;
  [v27 addSublayer:v29];
  v35 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
  v36 = +[NSNumber numberWithDouble:0.436332315];
  [v35 setToValue:v36];

  [v35 setMass:1.0];
  [v35 setStiffness:250.0];
  [v35 setDamping:20.0];
  LODWORD(v37) = 1.0;
  [v35 setSpeed:v37];
  [v35 setDuration:0.25];
  double v78 = v19;
  [v35 setBeginTime:a3];
  [v35 setFillMode:kCAFillModeBoth];
  v81 = v35;
  [v29 addAnimation:v35 forKey:@"transform.rotation.z"];
  v38 = +[CALayer layer];
  [v29 bounds];
  CGFloat v39 = v94.origin.x;
  CGFloat v40 = v94.origin.y;
  CGFloat v41 = v94.size.width;
  CGFloat v42 = v94.size.height;
  double v79 = v17;
  double MidX = CGRectGetMidX(v94);
  v95.origin.CGFloat x = v39;
  v95.origin.CGFloat y = v40;
  v95.size.CGFloat width = v41;
  v95.size.CGFloat height = v42;
  double v44 = CGRectGetMidY(v95);
  [v38 setBounds:v17, v78, v21, v23];
  [v38 setPosition:MidX, v44];
  v82 = v29;
  [v29 addSublayer:v38];
  v45 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
  v46 = +[NSNumber numberWithDouble:-0.436332315];
  [v45 setToValue:v46];

  [v45 setMass:1.0];
  [v45 setStiffness:400.0];
  [v45 setDamping:15.0];
  LODWORD(v47) = 1.0;
  [v45 setSpeed:v47];
  [v45 setDuration:0.22];
  [v45 setBeginTime:a3 + 0.0299999993];
  [v45 setFillMode:kCAFillModeBoth];
  [v38 addAnimation:v45 forKey:@"transform.rotation.z"];
  v48 = [(UGCGlyphButtonView *)self glyph];
  uint64_t v49 = [v48 image];

  v50 = +[CALayer layer];
  v86 = v38;
  [v38 bounds];
  CGFloat v51 = v96.origin.x;
  CGFloat v52 = v96.origin.y;
  CGFloat v53 = v96.size.width;
  CGFloat v54 = v96.size.height;
  CGRectGetMidX(v96);
  v97.origin.CGFloat x = v51;
  v97.origin.CGFloat y = v52;
  v97.size.CGFloat width = v53;
  v97.size.CGFloat height = v54;
  double v55 = CGRectGetMidY(v97);
  v98.origin.CGFloat x = v79;
  v98.origin.CGFloat y = v78;
  v98.size.CGFloat width = v21;
  v98.size.CGFloat height = v23;
  double MaxX = CGRectGetMaxX(v98);
  [v50 setBounds:v79, v78, v21, v23];
  [v50 setPosition:MaxX, v55];
  if ([(UGCGlyphButtonView *)self isSelected])
  {
    v57 = [(UGCGlyphButtonView *)self glyphAppearance];
    uint64_t v58 = [v57 selectedGlyphName];
  }
  else
  {
    unsigned __int8 v59 = [(UGCGlyphButtonView *)self isMuted];
    v60 = [(UGCGlyphButtonView *)self glyphAppearance];
    v57 = v60;
    if (v59) {
      [v60 mutedGlyphName];
    }
    else {
    uint64_t v58 = [v60 unselectedGlyphName];
    }
  }
  v61 = (void *)v58;

  if ([(UGCGlyphButtonView *)self isSelected])
  {
    v62 = [(UGCGlyphButtonView *)self glyphAppearance];
    uint64_t v63 = [v62 selectedGlyphColor];
  }
  else
  {
    unsigned __int8 v64 = [(UGCGlyphButtonView *)self isMuted];
    v65 = [(UGCGlyphButtonView *)self glyphAppearance];
    v62 = v65;
    if (v64) {
      [v65 mutedGlyphColor];
    }
    else {
    uint64_t v63 = [v65 unselectedGlyphColor];
    }
  }
  v66 = (void *)v63;

  v67 = (void *)v49;
  if (![(UGCGlyphButtonView *)self isEnabled])
  {
    uint64_t v68 = [v66 colorWithAlphaComponent:0.3];

    v66 = (void *)v68;
  }
  v80 = v61;
  v69 = +[UIImage systemImageNamed:v61];
  v70 = +[UGCFontManager ratingGlyphButtonFont];
  v71 = +[UIImageSymbolConfiguration configurationWithFont:v70];
  v72 = [v69 imageWithConfiguration:v71];
  v73 = [v72 _flatImageWithColor:v66];

  id v74 = v73;
  [v50 setContents:[v74 CGImage]];
  [v67 scale];
  [v50 setContentsScale:];
  [v50 setContentsGravity:kCAGravityCenter];
  [(UGCGlyphButtonView *)self setContentLayer:v50];
  [v86 addSublayer:v50];
  if (sub_1000BBB44(self) != 5)
  {
    v75 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.xy"];
    [v75 setValues:&off_1013AE550];
    [v75 setKeyTimes:&off_1013AE568];
    [v75 setBeginTime:a3];
    [v75 setFillMode:kCAFillModeBoth];
    [(UGCGlyphButtonView *)self animationDuration];
    [v75 setDuration:v76 * 0.5];
    v77 = [(UGCLikeGlyphButtonView *)self layer];
    [v77 addAnimation:v75 forKey:@"backgroundScaleAnimation"];
  }
  +[CATransaction commit];
}

@end