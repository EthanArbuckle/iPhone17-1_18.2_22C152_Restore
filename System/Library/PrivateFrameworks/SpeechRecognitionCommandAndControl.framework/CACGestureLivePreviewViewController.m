@interface CACGestureLivePreviewViewController
- (BOOL)isOverlay;
- (NSMutableDictionary)mappedPathEffectViews;
- (id)newPathEffectView;
- (int64_t)zOrder;
- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5;
- (void)removeTrackingForFingerIdentifier:(id)a3;
- (void)setMappedPathEffectViews:(id)a3;
- (void)viewDidLoad;
@end

@implementation CACGestureLivePreviewViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CACGestureLivePreviewViewController;
  [(CACGestureLivePreviewViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CACGestureLivePreviewViewController *)self setMappedPathEffectViews:v3];
}

- (void)addPointsToLiveRecordingGesturePreviewByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v8 = [v7 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v10 = 138412290;
    long long v25 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
        v15 = [(CACGestureLivePreviewViewController *)self mappedPathEffectViews];
        v16 = [v15 objectForKey:v14];

        if (!v16)
        {
          v17 = [(CACGestureLivePreviewViewController *)self mappedPathEffectViews];
          id v18 = [(CACGestureLivePreviewViewController *)self newPathEffectView];
          [v17 setObject:v18 forKey:v14];

          v19 = CACLogGestureRecording();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            uint64_t v31 = v14;
            _os_log_debug_impl(&dword_238377000, v19, OS_LOG_TYPE_DEBUG, "Creating new path view for finger %@", buf, 0xCu);
          }
        }
        v20 = [v7 objectForKey:v14];
        [v20 CGPointValue];
        double v22 = v21;
        double v24 = v23;

        objc_msgSend(v16, "addPoint:force:timestamp:", v22, v24, 1.0, a5);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }
}

- (void)removeTrackingForFingerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = CACLogGestureRecording();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CACGestureLivePreviewViewController removeTrackingForFingerIdentifier:]((uint64_t)v4, v5);
  }

  v6 = [(CACGestureLivePreviewViewController *)self mappedPathEffectViews];
  id v7 = [v6 objectForKey:v4];

  [v7 buildOut];
  v8 = [(CACGestureLivePreviewViewController *)self mappedPathEffectViews];
  [v8 removeObjectForKey:v4];
}

- (id)newPathEffectView
{
  v23[4] = *MEMORY[0x263EF8340];
  v3 = [CACGestureLivePreviewPathEffectView alloc];
  id v4 = -[CACGestureLivePreviewPathEffectView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CACGestureLivePreviewPathEffectView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v5 = CACIsInDarkMode();
  double v6 = 0.6;
  if (v5) {
    double v6 = 0.7;
  }
  [(CACGestureLivePreviewPathEffectView *)v4 setAlpha:v6];
  id v7 = [(CACGestureLivePreviewViewController *)self view];
  [v7 addSubview:v4];
  v17 = (void *)MEMORY[0x263F08938];
  double v22 = [(CACGestureLivePreviewPathEffectView *)v4 leftAnchor];
  double v21 = [v7 leftAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [(CACGestureLivePreviewPathEffectView *)v4 rightAnchor];
  id v18 = [v7 rightAnchor];
  v8 = [v19 constraintEqualToAnchor:v18];
  v23[1] = v8;
  uint64_t v9 = [(CACGestureLivePreviewPathEffectView *)v4 bottomAnchor];
  long long v10 = [v7 bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v23[2] = v11;
  uint64_t v12 = [(CACGestureLivePreviewPathEffectView *)v4 topAnchor];
  uint64_t v13 = [v7 topAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13];
  v23[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v17 activateConstraints:v15];

  return v4;
}

- (BOOL)isOverlay
{
  return 1;
}

- (int64_t)zOrder
{
  return 4;
}

- (NSMutableDictionary)mappedPathEffectViews
{
  return self->_mappedPathEffectViews;
}

- (void)setMappedPathEffectViews:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)removeTrackingForFingerIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "Removing path view for finger %@", (uint8_t *)&v2, 0xCu);
}

@end