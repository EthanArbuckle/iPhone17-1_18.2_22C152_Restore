@interface UIKeyboardPredictionCellMetrics
+ (id)secureCandidateEstimatedMetricsDictionary;
+ (id)secureCandidateEstimatedMetricsDictionaryForWidth:(double)a3;
@end

@implementation UIKeyboardPredictionCellMetrics

+ (id)secureCandidateEstimatedMetricsDictionary
{
  v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v4 = [v3 scene];
  uint64_t v5 = [v4 interfaceOrientation];

  id v6 = v3;
  v7 = +[UIKeyboardImpl keyboardScreen];
  v8 = +[UIKBScreenTraits traitsWithScreen:v7 orientation:v5];

  [v8 keyboardWidth];
  double v10 = v9;
  if (_usesiPadStyle())
  {
    if (+[UIKeyboard isInHardwareKeyboardMode]
      && (+[UIKeyboardImpl activeInstance],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isMinimized],
          v11,
          v12)
      && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
    {
      double v10 = dbl_186B94DD0[(unint64_t)(v5 - 3) < 2];
    }
    else
    {
      v13 = +[UIKeyboardImpl activeInstance];
      v14 = [v13 traitCollection];

      v15 = [v6 systemInputAssistantViewController];
      [v15 _buttonBarWidthForTraitCollection:v14 interfaceOrientation:v5];
      double v17 = v16;

      double v10 = v10 - (v17 + v17);
    }
  }

  v18 = [a1 secureCandidateEstimatedMetricsDictionaryForWidth:v10];

  return v18;
}

+ (id)secureCandidateEstimatedMetricsDictionaryForWidth:(double)a3
{
  v41[8] = *MEMORY[0x1E4F143B8];
  if (_usesiPadStyle())
  {
    v40[0] = *MEMORY[0x1E4FAE960];
    *(float *)&double v4 = a3;
    float v5 = floorf(*(float *)&v4);
    *(float *)&double v4 = v5;
    id v6 = [NSNumber numberWithFloat:v4];
    v41[0] = v6;
    v40[1] = *MEMORY[0x1E4FAE988];
    double v7 = a3 * 0.5;
    *(float *)&double v7 = a3 * 0.5;
    *(float *)&double v7 = floorf(*(float *)&v7);
    v8 = [NSNumber numberWithFloat:v7];
    v41[1] = v8;
    v40[2] = *MEMORY[0x1E4FAE978];
    double v9 = a3 / 3.0;
    *(float *)&double v9 = a3 / 3.0;
    *(float *)&double v9 = floorf(*(float *)&v9);
    double v10 = [NSNumber numberWithFloat:v9];
    v41[2] = v10;
    v40[3] = *MEMORY[0x1E4FAE968];
    *(float *)&double v11 = v5;
    int v12 = [NSNumber numberWithFloat:v11];
    v41[3] = v12;
    v40[4] = *MEMORY[0x1E4FAE990];
    v13 = [NSNumber numberWithDouble:floor(a3)];
    v41[4] = v13;
    v40[5] = *MEMORY[0x1E4FAE958];
    double v14 = a3 + -52.0;
    v15 = [NSNumber numberWithDouble:floor(v14)];
    v41[5] = v15;
    v40[6] = *MEMORY[0x1E4FAE980];
    double v16 = v14 * 0.5;
    *(float *)&double v16 = v14 * 0.5;
    *(float *)&double v16 = floorf(*(float *)&v16);
    double v17 = [NSNumber numberWithFloat:v16];
    v41[6] = v17;
    v40[7] = *MEMORY[0x1E4FAE970];
    double v18 = v14 / 3.0;
    *(float *)&double v18 = v14 / 3.0;
    *(float *)&double v18 = floorf(*(float *)&v18);
    v19 = [NSNumber numberWithFloat:v18];
    v41[7] = v19;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v41;
    v22 = v40;
  }
  else
  {
    v38[0] = *MEMORY[0x1E4FAE960];
    float v23 = (a3 + -4.0) / 12.0;
    float v24 = floorf(v23);
    double v25 = a3 - (float)(v24 + v24) + -4.0;
    *(float *)&double v25 = v25;
    *(float *)&double v25 = floorf(*(float *)&v25);
    id v6 = [NSNumber numberWithFloat:v25];
    v39[0] = v6;
    v38[1] = *MEMORY[0x1E4FAE988];
    double v26 = (a3 + -2.0) * 0.5;
    *(float *)&double v26 = v26;
    *(float *)&double v26 = floorf(*(float *)&v26);
    v8 = [NSNumber numberWithFloat:v26];
    v39[1] = v8;
    v38[2] = *MEMORY[0x1E4FAE978];
    double v27 = (a3 + -4.0) / 3.0;
    *(float *)&double v27 = v27;
    *(float *)&double v27 = floorf(*(float *)&v27);
    double v10 = [NSNumber numberWithFloat:v27];
    v39[2] = v10;
    v38[3] = *MEMORY[0x1E4FAE968];
    float v28 = a3;
    *(float *)&double v29 = floorf(v28);
    int v12 = [NSNumber numberWithFloat:v29];
    v39[3] = v12;
    v38[4] = *MEMORY[0x1E4FAE990];
    double v30 = a3 + -52.0;
    double v31 = a3 + -52.0 + -2.0;
    *(float *)&double v31 = v31;
    float v32 = floorf(*(float *)&v31);
    *(float *)&double v31 = v32;
    v13 = [NSNumber numberWithFloat:v31];
    v39[4] = v13;
    v38[5] = *MEMORY[0x1E4FAE958];
    *(float *)&double v33 = v32;
    v15 = [NSNumber numberWithFloat:v33];
    v39[5] = v15;
    v38[6] = *MEMORY[0x1E4FAE980];
    double v34 = (v30 + -4.0) * 0.5;
    *(float *)&double v34 = v34;
    *(float *)&double v34 = floorf(*(float *)&v34);
    double v17 = [NSNumber numberWithFloat:v34];
    v39[6] = v17;
    v38[7] = *MEMORY[0x1E4FAE970];
    double v35 = (v30 + -6.0) / 3.0;
    *(float *)&double v35 = v35;
    *(float *)&double v35 = floorf(*(float *)&v35);
    v19 = [NSNumber numberWithFloat:v35];
    v39[7] = v19;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v39;
    v22 = v38;
  }
  v36 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:8];

  return v36;
}

@end