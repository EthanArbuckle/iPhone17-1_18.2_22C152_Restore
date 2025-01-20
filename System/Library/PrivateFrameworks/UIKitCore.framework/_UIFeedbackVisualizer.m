@interface _UIFeedbackVisualizer
+ (id)sharedVisualizer;
- (NSMutableArray)feedbackWindows;
- (_UIFeedbackVisualizer)init;
- (id)_colorForEngine:(id)a3;
- (id)_colorForEngineState:(int64_t)a3;
- (id)_colorForFeedback:(id)a3;
- (id)_monogramForEngine:(id)a3;
- (id)engineLayersForEngine:(id)a3;
- (id)visualFeedbackWindowForScene:(id)a3;
- (void)_showVisualForFeedback:(id)a3;
- (void)_updateEngine:(id)a3;
- (void)addEngine:(id)a3;
- (void)cancelVisualForFeedback:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFeedbackWindows:(id)a3;
- (void)showVisualForFeedback:(id)a3 withDelay:(double)a4;
@end

@implementation _UIFeedbackVisualizer

+ (id)sharedVisualizer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___UIFeedbackVisualizer_sharedVisualizer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1036 != -1) {
    dispatch_once(&_MergedGlobals_1036, block);
  }
  v2 = (void *)qword_1EB2604B8;
  return v2;
}

- (id)visualFeedbackWindowForScene:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_feedbackWindows;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "windowScene", (void)v15);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v4)
          {
            v12 = v10;

            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v12 = [[_UIFeedbackVisualizerWindow alloc] initWithWindowScene:v4];
    v13 = [v4 screen];
    [v13 _referenceBounds];
    -[UIWindow setFrame:](v12, "setFrame:");

    [(UIView *)v12 setUserInteractionEnabled:0];
    [(UIView *)v12 setBackgroundColor:0];
    [(UIWindow *)v12 setWindowLevel:2200.0];
    [(UIWindow *)v12 setHidden:0];
    [(NSMutableArray *)self->_feedbackWindows addObject:v12];
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)engineLayersForEngine:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->_feedbackWindows;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [v10 engineLayers];
        v12 = [v11 objectForKey:v4];

        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          v12 = [MEMORY[0x1E4F39BE8] layer];
          id v13 = [(_UIFeedbackVisualizer *)self _colorForEngine:v4];
          objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

          [v12 setBorderWidth:4.0];
          objc_msgSend(v12, "setBounds:", 0.0, 0.0, 32.0, 32.0);
          [v12 setCornerRadius:16.0];
          LODWORD(v14) = 1063675494;
          [v12 setOpacity:v14];
          [v10 safeAreaInsets];
          if (v15 <= 0.0) {
            double v16 = 24.0;
          }
          else {
            double v16 = v15 + 16.0;
          }
          long long v17 = [v10 engineLayers];
          uint64_t v18 = [v17 count];

          if ([(id)UIApp _isSpringBoard])
          {
            v19 = [v10 layer];
            [v19 bounds];
            double v20 = CGRectGetWidth(v35) - ((double)v18 * 40.0 + 24.0);
          }
          else
          {
            double v20 = (double)v18 * 40.0 + 24.0;
          }
          objc_msgSend(v12, "setPosition:", v20, v16);
          v21 = [MEMORY[0x1E4F39CE8] layer];
          v22 = [(_UIFeedbackVisualizer *)self _monogramForEngine:v4];
          [v21 setString:v22];

          [v21 setFontSize:6.4];
          [v21 setAlignmentMode:@"center"];
          [v21 setContentsGravity:@"center"];
          [v21 setContentsScale:3.0];
          objc_msgSend(v21, "setFrame:", 4.0, 10.6666667, 24.0, 10.6666667);
          id v23 = +[UIColor whiteColor];
          objc_msgSend(v21, "setForegroundColor:", objc_msgSend(v23, "CGColor"));

          [v12 addSublayer:v21];
          v24 = [v10 layer];
          [v24 addSublayer:v12];

          v25 = [v10 engineLayers];
          [v25 setObject:v12 forKey:v4];
        }
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  return v5;
}

- (_UIFeedbackVisualizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackVisualizer;
  v2 = [(_UIFeedbackVisualizer *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  feedbackWindows = v2->_feedbackWindows;
  v2->_feedbackWindows = (NSMutableArray *)v3;

  return v2;
}

- (id)_monogramForEngine:(id)a3
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 length];
  if ([v4 hasPrefix:@"_UIFeedback"])
  {
    v5 -= 11;
    uint64_t v6 = 11;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([v4 hasSuffix:@"Engine"]) {
    uint64_t v7 = v6 - 6;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = [MEMORY[0x1E4F28E78] stringWithCapacity:4];
  uint64_t v9 = 6;
  do
  {
    v10 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
    uint64_t v11 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v10, 0, v7, v5);
    uint64_t v13 = v12;

    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    double v14 = objc_msgSend(v4, "substringWithRange:", v11, v13);
    [v8 appendString:v14];

    v5 += v7 + ~v11;
    if (!v5) {
      break;
    }
    uint64_t v7 = v11 + 1;
    --v9;
  }
  while (v9);

  return v8;
}

- (id)_colorForEngine:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)_colorForEngine__sampleFeedbacks;
  if (!_colorForEngine__sampleFeedbacks)
  {
    uint64_t v6 = +[_UIDiscreteFeedback discreteFeedbackForType:0];
    v24[0] = v6;
    uint64_t v7 = +[_UIDiscreteFeedback discreteFeedbackForType:1000];
    v24[1] = v7;
    uint64_t v8 = +[_UIDiscreteFeedback discreteFeedbackForType:1001];
    v24[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    v10 = (void *)_colorForEngine__sampleFeedbacks;
    _colorForEngine__sampleFeedbacks = v9;

    uint64_t v5 = (void *)_colorForEngine__sampleFeedbacks;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "_supportsPlayingFeedback:", v16, (void)v19))
        {
          long long v17 = [(_UIFeedbackVisualizer *)self _colorForFeedback:v16];

          goto LABEL_13;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v17 = +[UIColor blackColor];
LABEL_13:

  return v17;
}

- (id)_colorForEngineState:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double v5 = 0.3;
      double v6 = 1.0;
      double v7 = 0.3;
      goto LABEL_12;
    case 1:
      double v5 = 0.6;
      goto LABEL_8;
    case 2:
      double v5 = 0.9;
LABEL_8:
      double v9 = 0.2;
      double v6 = 1.0;
      double v7 = v5;
      goto LABEL_14;
    case 3:
      double v7 = 0.6;
      goto LABEL_11;
    case 4:
      double v7 = 0.9;
LABEL_11:
      double v5 = 0.2;
      double v6 = 1.0;
LABEL_12:
      double v9 = v5;
      goto LABEL_14;
    case 5:
      double v5 = 0.2;
      double v7 = 0.6;
      double v9 = 0.8;
      double v6 = 1.0;
LABEL_14:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v5, v7, v9, v6, v3);
      self = (_UIFeedbackVisualizer *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return self;
}

- (id)_colorForFeedback:(id)a3
{
  id v3 = a3;
  if ([v3 _effectiveEventType]) {
    double v4 = 0.3;
  }
  else {
    double v4 = 0.1;
  }
  int v5 = [v3 _effectiveSystemSoundID];
  if (v5 == _UISystemSoundIDNone) {
    double v6 = 0.1;
  }
  else {
    double v6 = 0.3;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    double v8 = 0.3;
  }
  else {
    double v8 = 0.1;
  }
  return +[UIColor colorWithRed:v8 green:v6 blue:v4 alpha:1.0];
}

- (void)addEngine:(id)a3
{
}

- (void)_updateEngine:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 _state];
  double v6 = [(_UIFeedbackVisualizer *)self engineLayersForEngine:v4];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        -[_UIFeedbackVisualizer _colorForEngineState:](self, "_colorForEngineState:", v5, (void)v14);
        id v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)showVisualForFeedback:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 <= 0.0)
  {
    [(_UIFeedbackVisualizer *)self _showVisualForFeedback:v6];
  }
  else
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__83;
    uint64_t v19 = __Block_byref_object_dispose__83;
    id v20 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57___UIFeedbackVisualizer_showVisualForFeedback_withDelay___block_invoke;
    v12[3] = &unk_1E52E5180;
    v12[4] = self;
    id v8 = v6;
    id v13 = v8;
    long long v14 = &v15;
    uint64_t v9 = _UIFeedbackPreciseDispatchAfter(0, v12, a4);
    uint64_t v10 = (void *)v16[5];
    v16[5] = v9;

    uint64_t v11 = [v8 visualizerSources];
    [v11 addObject:v16[5]];

    _Block_object_dispose(&v15, 8);
  }
}

- (void)cancelVisualForFeedback:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "visualizerSources", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [v3 visualizerSources];
  [v9 removeAllObjects];
}

- (void)_showVisualForFeedback:(id)a3
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 _playableProtocol];

  if (v5 == &unk_1ED54E6B8)
  {
    uint64_t v6 = [v4 _view];
    uint64_t v7 = [v6 window];
    uint64_t v8 = [v7 windowScene];

    uint64_t v9 = [(_UIFeedbackVisualizer *)self visualFeedbackWindowForScene:v8];
    long long v10 = v9;
    if (v9)
    {
      long long v11 = [v9 layer];
      [v4 _location];
      double v13 = v12;
      double v15 = v14;
      id v16 = [v4 _view];
      if (!v16) {
        id v16 = v10;
      }
      id v17 = v10;
      uint64_t v18 = v17;
      v48 = v17;
      v49 = v8;
      if (v13 == 1.79769313e308 && v15 == 1.79769313e308)
      {
        [v16 bounds];
        objc_msgSend(v18, "convertRect:fromCoordinateSpace:", v16);
        CGFloat x = v53.origin.x;
        CGFloat y = v53.origin.y;
        CGFloat width = v53.size.width;
        CGFloat height = v53.size.height;
        double MidX = CGRectGetMidX(v53);
        v54.origin.CGFloat x = x;
        v54.origin.CGFloat y = y;
        v54.size.CGFloat width = width;
        v54.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v54);
      }
      else
      {
        objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v16, v13, v15);
        double MidX = v25;
      }
      objc_msgSend(v11, "convertPoint:fromLayer:", 0, MidX, MidY);
      double v27 = v26;
      double v29 = v28;
      long long v30 = [(_UIFeedbackVisualizer *)self _colorForFeedback:v4];
      [v4 hapticParameters];
      long long v31 = v11;
      v32 = v47 = v11;
      [v32 _effectiveVolume];
      double v34 = v33 * 256.0 + 64.0;

      CGRect v35 = [MEMORY[0x1E4F39BE8] layer];
      id v36 = v30;
      objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));
      objc_msgSend(v35, "setBounds:", 0.0, 0.0, 64.0, 64.0);
      objc_msgSend(v35, "setPosition:", v27, v29);
      [v35 setCornerRadius:32.0];
      [v31 addSublayer:v35];
      [MEMORY[0x1E4F39CF8] begin];
      v37 = (void *)MEMORY[0x1E4F39CF8];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __48___UIFeedbackVisualizer__showVisualForFeedback___block_invoke;
      v50[3] = &unk_1E52D9F70;
      id v51 = v35;
      id v38 = v35;
      [v37 setCompletionBlock:v50];
      v39 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
      v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v34, v34);
      [v39 setToValue:v40];

      v41 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"cornerRadius"];
      v42 = [NSNumber numberWithDouble:v34 * 0.5];
      [v41 setToValue:v42];

      v43 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v43 setToValue:&unk_1ED3F1C88];
      v44 = [MEMORY[0x1E4F39B38] animation];
      [v44 setDuration:0.3];
      v45 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      [v44 setTimingFunction:v45];

      [v44 setRemovedOnCompletion:0];
      [v44 setFillMode:*MEMORY[0x1E4F39FA8]];
      v52[0] = v39;
      v52[1] = v41;
      v52[2] = v43;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
      [v44 setAnimations:v46];

      [v38 addAnimation:v44 forKey:@"animation"];
      [MEMORY[0x1E4F39CF8] commit];

      uint64_t v8 = v49;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"state"])
  {
    id v9 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72___UIFeedbackVisualizer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    id v11 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

- (NSMutableArray)feedbackWindows
{
  return self->_feedbackWindows;
}

- (void)setFeedbackWindows:(id)a3
{
}

- (void).cxx_destruct
{
}

@end